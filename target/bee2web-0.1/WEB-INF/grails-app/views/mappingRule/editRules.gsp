<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.bssi.Template" %>
<html>
<head>
<title>Mapping Rule Config</title>
<g:set var="entityName" value="${message(code: 'template.label', default: 'Template')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
<link rel="stylesheet" type="text/css" href="${resource(dir:'js/themes/default',file:'easyui.css')}">
<link rel="stylesheet" type="text/css" href="${resource(dir:'js/themes',file:'icon.css')}">
<link rel="stylesheet" type="text/css" href="${resource(dir:'demo',file:'demo.css')}">
<script type="text/javascript" src="${resource(dir:'js',file:'jquery-1.6.2.min.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js',file:'jquery.easyui.min.js')}"></script>

<script>

    function selectSendInfo(){
        var paramKQ = " ${request.contextPath}/mappingRule/createTemplate";
        open(paramKQ,'title','resizable=no,width=900,height=410,scrollbars=yes');
    }
    function selectScripting(){
        var paramKQ = " ${request.contextPath}/mappingRule/createScript";
        open(paramKQ,'title','resizable=no,width=800,height=410,scrollbars=yes');
    }
    var rightIndex1 = 0;
    var rowDataDeleted;
    var optionType =[
        {optionTypeId:'ADD',optionTypeName:'ADD'},
        {optionTypeId:'SET',optionTypeName:'SET'},
        {optionTypeId:'MOVE',optionTypeName:'MOVE'},
        {optionTypeId:'DELETE',optionTypeName:'DELETE'}
    ];
    $(document).ready(function(){
        loadGrid();
    });
    function loadGrid(){
        var lastIndex;
        var rowData;
        $('#test').datagrid({
            title:'Template',
            iconCls:'icon-save',
            width:900,
            height:500,
            nowrap: false,
            striped: true,
            singleSelect:true,
            collapsible:true,
            pagination:true,
            url:'${request.contextPath}/mappingRule/temp',
            columns:[[
                {field:'id',title:'Id',width:50,hidden:true},
                {field:'segment',title:'Segment',width:50,editor:{type:'validatebox',options:{required:true}}},
                {field:'field',title:'Field',width:150,editor:{type:'text',options:{required:true}}},
                {field:'fieldIndex',title:'Field Index',width:75,editor:{type:'numberbox'}},
                {field:'subfield',title:'Sub-Field',width:90,editor:{type:'text'}},
                {field:'subfieldIndex',title:'Sub-Field Index',width:110,editor:{type:'numberbox'}},
                {field:'required',title:'Required',checkOn:true,width:65,editor:{type:'checkbox',options:{on:'true',off:'false'}}},
                {field:'repeatable',title:'Repeatable',width:65,editor:{type:'checkbox',options:{on:'true',off:'false'}}},
                {field:'operator',title:'Option',width:90,editor:{type:'combobox',options:{valueField:'optionTypeId',textField:'optionTypeName',data:optionType}}},
                {field:'conditions',title:'Condition',width:90,editor:{type:'text'}},
                {field:'scriptext',title:'Scripting',width:90,editor:{type:'text'}}
            ]],
            toolbar:[{
                id:'btnsave',
                text:'Save',
                iconCls:'icon-save',
                handler:function(){
                    $('#test').datagrid('endEdit', lastIndex);
                    if(rightIndex1){
                        $('#test').datagrid('endEdit', parseInt(rightIndex1)+1);
                    }
                }
            },{
                id:'btnedit',
                text:'Edit',
                iconCls:'icon-edit',
                handler:function(){
                    var editRow = $('#test').datagrid('getSelected');
                    var editIndex = $('#test').datagrid('getRowIndex',editRow);
                    $('#test').datagrid('beginEdit', editIndex);
                    lastIndex=editIndex;
                }
            }
            ],
            onDblClickRow:function(rowIndex,rowData){
                if(lastIndex!=rowIndex){
//                        $("input[type='checkbox']").eq(0).attr("checked",true);
                    $('#test').datagrid('endEdit', lastIndex);
                    $('#test').datagrid('beginEdit', rowIndex);
                    lastIndex = rowIndex;
                } else if(lastIndex=rowIndex){
                    $('#test').datagrid('beginEdit', rowIndex);
                }
            } ,
            onClickRow:function(rowIndex,rowData){
                if(lastIndex!=rowIndex){
                    $('#test').datagrid('endEdit', lastIndex);
                }
                if(rightIndex1){
                    $('#test').datagrid('endEdit', parseInt(rightIndex1)+1);
                }
            },
            onAfterEdit:function(rowIndex,rowData,changes){
                var mappingRuleGroup  = document.getElementById('mappingRuleGroup.id');
                $.ajax({
                    url:"${request.contextPath}/mappingRule/updateRule" ,
                    data: {mappingRule:rowData.mappingRule,id:rowData.id,segment:rowData.segment,field:rowData.field,fieldIndex:rowData.fieldIndex,subfieldIndex:rowData.subfieldIndex,required:rowData.required,repeatable:rowData.repeatable,operator:rowData.operator,conditions:rowData.conditions,mappingRuleGroup:mappingRuleGroup.value,scriptext:rowData.scriptext},
                    success: function(text){
                        var textStr = text.split(',');
                        if(textStr.length>1){
                            if(rowData.id==null||rowData.id==''){
                                rowData.id=textStr[1];
                            }
                        }
                        $.messager.alert('Information',textStr[0],'info');
                    }
                });
            },
            onRowContextMenu: function(e, rowIndex,rowData){
                rightIndex1=rowIndex;
                //alert(rightIndex1) ;
                rowDataDeleted= rowData

                e.preventDefault();
                if(rowData.segment==rowData.field){
                    $('#mms').menu('show', {
                        left: e.pageX,
                        top: e.pageY
                    });
                } else{
                    $('#mm').menu('show', {
                        left: e.pageX,
                        top: e.pageY
                    });
                }

            }
//                onBeforeEdit:function(row){
//                    beforEditRow(row);
//                }

        });
        var p = $('#test').datagrid('getPager');
        $(p).pagination({
            onBeforeRefresh:function(){
                alert('before refresh');
            }
        });
    }

    function append(){
        var temp = parseInt(rightIndex1)+1;
        $('#test').datagrid('insertRow', {
            index:temp,
            row: [[
                {field:'id',title:'Id',width:50,hidden:true},
                {field:'segment',title:'Segment',width:50,editor:{type:'validatebox',options:{required:true}}},
                {field:'field',title:'Field',width:150,editor:{type:'text',options:{required:true}}},
                {field:'fieldIndex',title:'Field Index',width:75,editor:{type:'numberbox'}},
                {field:'subfield',title:'Sub-Field',width:90,editor:{type:'text'}},
                {field:'subfieldIndex',title:'Sub-Field Index',width:110,editor:{type:'numberbox'}},
                {field:'required',title:'Required',width:65,editor:{type:'checkbox',options:{on:'true',off:'false'}}},
                {field:'repeatable',title:'Repeatable',width:65,editor:{type:'checkbox',options:{on:'true',off:'false'}}},
                {field:'operator',title:'Option',width:90,editor:{type:'combobox',options:{valueField:'optionTypeId',textField:'optionTypeName',data:optionType}}},
                {field:'conditions',title:'Condition',width:90,editor:{type:'text'}},
                {field:'scriptext',title:'Scripting',width:90,editor:{type:'text'}}
            ]]
        });
        $('#test').datagrid('selectRow',temp);
        $('#test').datagrid('beginEdit',temp);
    }
    function removeRow(){
        var template =  $('#test').datagrid('selectRow',parseInt(rightIndex1));
        if(confirm('Are you sure?')) {
            $.ajax({
                url:"${request.contextPath}/mappingRule/deleteTemplate" ,
                data:{id:rowDataDeleted.id} ,
                success: function(text){
                    $.messager.alert('Information',text,'info');
                }
            });
            $('#test').datagrid('deleteRow',parseInt(rightIndex1));
        }
    }

    function removeSegment(){
        var template =  $('#test').datagrid('selectRow',parseInt(rightIndex1));
        if(confirm('Are you sure?')) {
            $.ajax({
                url:"${request.contextPath}/mappingRule/deleteSegment" ,
                data:{id:rowDataDeleted.id,segment:rowDataDeleted.segment} ,
                success: function(text){
                    $.messager.alert('Information',text,'info');
                    window.location.reload();

                }
            });
            $('#test').datagrid('deleteRow',parseInt(rightIndex1));
        }
    }
    function saveTemplate(){
        var temp = $('#hl7message').val();
        if(temp){

        }
    }
    function selectRuleGroup(){
        var ruleGroup = document.getElementById('mappingRuleGroup.id');
        var type= document.getElementById('type');
        var fromApplication =  document.getElementById('fromApplication');
        var toApplication = document.getElementById('toApplication');
        if(ruleGroup.value){
            $.ajax({
                url:"${request.contextPath}/mappingRule/selectRuleGroup" ,
                data:{id:ruleGroup.value},
                dataType:'json',
                success: function(msg){
                    type.value = msg.type;
                    fromApplication.value = msg.fromApplication;
                    toApplication.value = msg.toApplication;
                    loadGrid();
                }
            });
        } else{
            type.value = "";
            fromApplication.value = "";
            toApplication.value = "";
        }
    }
</script>
</head>
<body>


<h2>Mapping Rule</h2>

<div style="margin:10px 0;">
    <g:textField name="fromApplication" value="" readonly='true' ></g:textField>
    <g:textField name="toApplication" value="" readonly = 'true'></g:textField>
    <g:textField name="type"  value="" readyonly = 'true'></g:textField>
    <g:select name="mappingRuleGroup.id" id="mappingRuleGroup.id" from="${com.bssi.MappingRuleGroup.list()}" optionKey="id" value="${mappingRuleData?.mappingRuleGroup?.id}"  noSelection="${['':'Mapping Rule Group']}" onchange="selectRuleGroup();"/>
    <input type="button" value="Import Template" onclick='selectSendInfo();'>
    <input type="button" value="Scripting" onclick='selectScripting();'>
</div>
<table id="test"></table>

<div id="mm" class="easyui-menu" style="width:120px;">
    <div onclick="append()">Insert</div>
    <div onclick="removeRow()">Remove</div>
</div>
<div id="mms" class="easyui-menu" style="width:120px;">
    <div onclick="append()">Insert</div>
    <div onclick="removeSegment()">Remove Segment</div>
</div>

</body>
</html>