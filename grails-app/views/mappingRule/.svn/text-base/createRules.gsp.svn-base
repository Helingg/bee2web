<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.bssi.Template" %>
<html>
<head>
    <title>Mapping Rule Config</title>
    <g:set var="entityName" value="${message(code: 'template.label', default: 'Template')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <link rel="stylesheet" type="text/css" href="${resource(dir:'js/themes/default',file:'easyui.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir:'js/themes',file:'icon.css')}">
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery-1.7.2.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery.easyui.min.js')}"></script>
    <meta name="layout" content="main" />
    <script>
        function  selectSendInfo(){
            var paramKQ = " ${request.contextPath}/mappingRule/createTemplate";
            open(paramKQ,'title','resizable=no,width=900,height=410,scrollbars=yes');
        }
        function selectScripting(){
            var paramKQ = " ${request.contextPath}/mappingRule/createScript";
            open(paramKQ,'title','resizable=no,width=800,height=410,scrollbars=yes');
        }
        var rightIndex1 = 0;
        var rowDataDeleted;
        var rowTemp;
        var applicationType;
        var sortTurn = 1;
        var operatorTemp = "";
        var conditionStrTemp="";
        var valueStr = "";
        var sortField="";
        var sortOrder="";
        var searchSegment="";
        var checknum=/^[0-9]{1,20}$/;
//        $(document).ready(function(){
//            loadGrid();
//            });
        function loadGrid(){
            var lastIndex;
            var rowData;
            var mappingRuleGroup = document.getElementById('mappingRuleGroup.id');
            var type = document.getElementById('type');
            if(!mappingRuleGroup.value)
            {
                alert("Please create or search a Mapping Rule Group!");
            }

            $('#test').treegrid({
                title:'Template',
                iconCls:'icon-save',
                width:1000,
                height:800,
                nowrap: false,
                striped: true,
                singleSelect:true,
                collapsible:true,
                pagination:false,
                animate:true,
                idField:'id',
                treeField:'code',
//                pageSize:50,
//                pageList:[10,20,30,40,50,100,500],
                url:'${request.contextPath}/mappingRule/temp?mappingRuleGroup='+mappingRuleGroup.value+"&type="+type.value,
                frozenColumns:[[
                    {title:'Segment',field:'code',width:100,
                        formatter:function(value){
                            return '<span style="color:red">'+value+'</span>';
                        }
                    }
                ]],
                columns:[[
                    {field:'id',title:'Id',width:50,hidden:true},
                    {hidden:'segment',title:'Segment',width:80,sortable:true},
                    {field:'field',title:'Field',width:150,sortable:true},
                    {field:'fieldIndex',title:'Field Index',width:75,sortable:true},
                    {field:'subfield',title:'Sub-Field',width:90,sortable:true},
                    {field:'subfieldIndex',title:'Sub-Field Index',width:110,sortable:true},
                    {field:'required',title:'Required',width:65
                    ,formatter:function(value){
                        if(value==true){
                            return '<img src="${request.contextPath}/images/checked.jpg"/>';
                        }else{
                            return  '<img src="${request.contextPath}/images/nochecked.jpg"/>';
                        }
                    }},
                    {field:'repeatable',title:'Repeatable',width:70,editor:{type:'checkbox',options:{on:'1',off:'0'}}
                        ,formatter:function(value){
                        if(value==true){
                            return '<img src="${request.contextPath}/images/checked.jpg"/>';
                        }else{
                            return  '<img src="${request.contextPath}/images/nochecked.jpg"/>';
                        }
                    }
                        },
                    {field:'operator',title:'Option',width:45,formatter:function(value){
                        if(value=='BLK'){
                            return 'Blank';
                        }else if(value=='SET'){
                            return  'Set';
                        }else if(value=='MOV'){
                            return  'Move';
                        }else if(value=='MAP'){
                            return 'Map';
                        }else{
                            return '';
                        }}},
                    {field:'conditions',title:'Target',width:50},
                    {field:'value',title:'Value',width:90},
                    {field:'scriptext',title:'Script Text',width:90,formatter:function(value){
                        if(value=="GREATERTHAN"){
                            return "Greater Than";
                        }else if(value=="LESSTHAN") {
                            return "Less Than" ;
                        }else if(value=="CONTAINS"){
                            return "Contains" ;
                        } else if(value=="EQUALS"){
                            return "Equals";
                        }
                    }},
                    {field:'other',title:'Other',width:90},
                    {hidden:'ruleId'}

                ]],


                onDblClickRow:function(row){
                    var row1 = $('#test').datagrid('getSelected');
                    if(row1){
                        rowTemp = row1;
                    }
                    clearRuleDlg();
                    var rowData = row;
                    var mappingRule_segment = document.getElementById('mappingRule_segment');
                    var mappingRule_id  = document.getElementById('mappingRule_id');
                    var mappingRule_field = document.getElementById('mappingRule_field');
                    var mappingRule_fieldIndex  = document.getElementById('mappingRule_fieldIndex');
                    var mappingRule_subField = document.getElementById('mappingRule_subField');
                    var mappingRule_subFieldIndex = document.getElementById('mappingRule_subFieldIndex');
                    var mappingRule_option = document.getElementById('mappingRule_option');
                    var mappingRule_condition = document.getElementById('mappingRule_condition');
                    var mappingRule_required = document.getElementById('mappingRule_required');
                    var mappingRule_repeatable = document.getElementById('mappingRule_repeatable');
                    var mappingRule_value = document.getElementById('mappingRule_value');
                    var mappingRule_optionCopy = document.getElementById('mappingRule_optionCopy');
                    var subfieldTr = document.getElementById('subfieldTr');
                    var subfieldIndexTr = document.getElementById('subfieldIndexTr');
//                    var mappingRule_optionCopyTr = document.getElementById('mappingRule_optionCopyTr');
                    var copytr = document.getElementById("hiddenCopyTr");
                    var movetr = document.getElementById("hiddenMoveTr");
                    var moveSubtr = document.getElementById("hiddenMoveSubTr");
                    var settr = document.getElementById("hiddenSetTr");
                    var mappingRuleConditions = document.getElementById("mappingRuleConditions");
                    var conditionsValue = document.getElementById("conditionsValue");
                    var mapValue = document.getElementById("mapValue");
                    var hiddenMapT = document.getElementById("hiddenMapT");

                    copytr.style.display = "none";
                    movetr.style.display = "none";
                    settr.style.display = "none";
                    moveSubtr.style.display = "none";
                    mappingRule_segment.value = rowData.segment;
                    mappingRule_id.value = rowData.id;
                    mappingRule_field.value  = rowData.field;
                    mappingRule_fieldIndex.value  = rowData.fieldIndex;
                    mappingRule_subField.value = rowData.subfield ;
                    if(rowData.subfieldIndex){
                        mappingRule_subFieldIndex.value= rowData.subfieldIndex;
                        subfieldTr.style.display = "";
                        subfieldIndexTr.style.display = "";
                        moveSubtr.style.display = "";
                    } else{
                        mappingRule_subFieldIndex.value=0;
                        subfieldTr.style.display = "none";
                        subfieldIndexTr.style.display = "none";
                        moveSubtr.style.display = "none";
                    }
                    if(rowData.operator){
                        mappingRule_option.value= rowData.operator ;
                    }else{
                        mappingRule_option.value = "";
                    }

                    mappingRule_value.value="";
                    if(mappingRule_option.value=="MOV"){
                        var toSegment = document.getElementById('toSegmentdlg');
                        var toIndex = document.getElementById('toIndexdlg');
                        var toSubIndex = document.getElementById('toSubIndexdlg');
                        if(rowData.conditions){
                            var conditionsArray = rowData.conditions.split("|");
                            if(conditionsArray.length==3){
                                toSegment.value = conditionsArray[0]
                                toIndex.value = conditionsArray[1]
                                toSubIndex.value = conditionsArray[2]
                            }
                        }
                        if(rowData.value=="CPY"){
                            mappingRule_optionCopy.checked = true;
                        } else{
                            mappingRule_optionCopy.checked = false;
                        }
                        copytr.style.display = "";
                        movetr.style.display = "";

                    }else if(mappingRule_option.value=="SET"){
                        var valueTemp = document.getElementById('valueDlg');
                        if(rowData.value){
                            valueTemp.value=rowData.value;
                        }
                        mappingRule_optionCopy.checked = false;
                        copytr.style.display = "none";
                        movetr.style.display = "none";
                        settr.style.display = "";

                    } else if(mappingRule_option.value=="MAP"){
                        hiddenMapT.style.display = "";
                        mapValue.value = rowData.value;
                        conditionsValue.value= rowData.value;
                        mappingRuleConditions.value= rowData.scriptext;
                    }

                    if(rowData.conditions){
                        mappingRule_condition.value  = rowData.conditions;
                    }else if(rowData.value){
                        mappingRule_condition.value=rowData.value;
                    } else{
                        mappingRule_condition.value = "";
                    }
                    if(rowData.required==true){
                        mappingRule_required.checked= true;
                    } else{
                        mappingRule_required.checked= false;
                    }
                    if(rowData.repeatable==true){
                        mappingRule_repeatable.checked= true;
                    } else{
                        mappingRule_repeatable.checked= false;
                    }
                    if(rowData.fieldIndex!=0){
                        $("#editRule_dlg").dialog("open");
                    }
                },
                onContextMenu: function(e, row){
//                    rightIndex1=rowIndex;
                    //alert(rightIndex1) ;
                    rowDataDeleted= row
                    var rowData = row;
                    e.preventDefault();
                    if(rowData.fieldIndex==0){
//                        if(rowData.required==true){
//                            document.getElementById("removeSegmentDivmms").style.display="none";
//                            document.getElementById("suppressSegmentDivmms").style.display="none";
//                            document.getElementById("clearSegmentDivmms").style.display="none";
//                        }else{
//                            document.getElementById("removeSegmentDivmms").style.display="";
//                            document.getElementById("suppressSegmentDivmms").style.display="";
//                            document.getElementById("clearSegmentDivmms").style.display="";
//                        }
                        if(rowData.segment!="MSH"&&rowData.segment!="PID"){
                            $('#mms').menu('show', {
                                left: e.pageX,
                                top: e.pageY
                            });
                        }

                    }else{
                        $('#mm').menu('show', {
                            left: e.pageX,
                            top: e.pageY
                        });
                    }
                }
//                onSortColumn:function(sort,order){
//                    if(sortTurn%2==0){
//                        sortField=sort;
//                        sortOrder="desc";
//                    }else{
//                        sortField=sort;
//                        sortOrder=order;
//                    }
//                    sortTurn++;
//                    loadGrid();
//                    sortField="";
//                    sortOrder="";
//                }
            });
        }
        //---------------------------insert segment and field option-----------------------------------------
        function appendSegment(){
            var segment = document.getElementById("mappingRule_insertSegment_segment");
            var field = document.getElementById("mappingRule_insertSegment_field");
            var fieldIndex = document.getElementById("mappingRule_insertSegment_fieldIndex");
            var required = document.getElementById("mappingRule_insertSegment_required");
            var repeatable = document.getElementById("mappingRule_insertSegment_repeatable");
            var fieldTR = document.getElementById("insertSegment_field_tr");
            var fieldIndexTR = document.getElementById("insertSegment_fieldIndex_tr");
            var segmentDiv = document.getElementById("mappingRule_insertSegment_segmentDiv");
            segment.readOnly = "";
            $("#appendFieldFlag").val("0");
            $("#appendSegmentFlag").val("1");
            if(rowDataDeleted){
                $("#insertSegment_tempalteId").val(rowDataDeleted.id);
            }else{
                $("#insertSegment_tempalteId").val("");
            }
            segment.style.borderColor = "";
            segment.value="";
            field.value="";
            fieldIndex.value = 0;
            fieldTR.style.display="none";
            fieldIndexTR.style.display = "none"
            required.checked = false;
            repeatable.checked = false;
            $("#insertSegment_dlg").dialog("open");
        }
        function appendField(){
            var segment = document.getElementById("mappingRule_insertSegment_segment");
            var field = document.getElementById("mappingRule_insertSegment_field");
            var fieldIndex = document.getElementById("mappingRule_insertSegment_fieldIndex");
            var required = document.getElementById("mappingRule_insertSegment_required");
            var repeatable = document.getElementById("mappingRule_insertSegment_repeatable");
            var fieldTR = document.getElementById("insertSegment_field_tr");
            var fieldIndexTR = document.getElementById("insertSegment_fieldIndex_tr");
            var segmentDiv = document.getElementById("mappingRule_insertSegment_segmentDiv");
            $("#appendFieldFlag").val("1");
            $("#appendSegmentFlag").val("0");
            segment.readOnly = true;
            fieldIndex.readOnly=true;
            if(rowDataDeleted){
                segment.value = rowDataDeleted.segment;
                $("#insertSegment_tempalteId").val(rowDataDeleted.id);
            } else{
                segment.value = "";
                $("#insertSegment_tempalteId").val("");
            }
            field.value="";
            fieldIndex.value = rowDataDeleted.fieldIndex+1;
            fieldTR.style.display="";
            fieldIndexTR.style.display = ""
            required.checked = false;
            repeatable.checked = false;

            $("#insertSegment_dlg").dialog("open");
        }

        function closeInsertSegment_dlg (){
            var segment = document.getElementById("mappingRule_insertSegment_segment");
            var field = document.getElementById("mappingRule_insertSegment_field");
            var fieldIndex = document.getElementById("mappingRule_insertSegment_fieldIndex");
            var fieldTR = document.getElementById("insertSegment_field_tr");
            var fieldIndexTR = document.getElementById("insertSegment_fieldIndex_tr");
            var segmentDiv = document.getElementById("mappingRule_insertSegment_segmentDiv");
            $("#insertSegment_tempalteId").val("");
            segment.value="";
            field.value="";
            fieldIndex.value = 0;
            fieldTR.style.display="";
            fieldIndexTR.style.display = ""
            $("#insertSegment_dlg").dialog("close");
        }

        function createTemplateSegment(){
            var segment = document.getElementById("mappingRule_insertSegment_segment");
            var field = document.getElementById("mappingRule_insertSegment_field");
            var fieldIndex = document.getElementById("mappingRule_insertSegment_fieldIndex");
            var required = document.getElementById("mappingRule_insertSegment_required");
            var repeatable = document.getElementById("mappingRule_insertSegment_repeatable");
            var segmentDiv = document.getElementById("mappingRule_insertSegment_segmentDiv");
            var mappingRuleGroup = document.getElementById('mappingRuleGroup.id');
            var type = $("#type");
            var templateId =  $("#insertSegment_tempalteId").val();
            if(!segment.value){
                segment.style.borderColor = "red";
                alert("Segment is null");
                return false;
            }else{
                segment.style.borderColor = "";
            }
            if($("#appendFieldFlag").val()=="1"){
                if(!field.value){
                    field.style.borderColor = "red";
                    alert("Field is null");
                    return false;
                }else{
                    field.style.borderColor = "";
                }
                if(!checknum.exec(fieldIndex.value)){
                    fieldIndex.style.borderColor = "red";
                    alert("FieldIndex is not a number");
                    return false;
                }else if(fieldIndex.value=="0"){
                    fieldIndex.style.borderColor = "red";
                    alert("FieldIndex can not be '0'!");
                    return false;
                } else{
                    fieldIndex.style.borderColor = "";
                }
            }
            lockScreen();
            $.ajax({
                url:"${request.contextPath}/mappingRule/insertSegment",
                data:{segment:segment.value,field:field.value,fieldIndex:fieldIndex.value,mappingRuleGroup:mappingRuleGroup.value,required:required.checked,repeatable:repeatable.checked,type:type.val(),templateId:templateId},
                success:function(msg){
                    if(msg){
                        alert(msg);
                        relockScreen();
                    }else{
                        loadGrid();
                        closeInsertSegment_dlg();
                        relockScreen();
                    }
                }
            })

        }
        //-------------------------------------------------------------------------------------------------------------------
        function removeRow(){
            var mappingRuleGroup = document.getElementById('mappingRuleGroup.id');
            var template =  $('#test').datagrid('selectRow',parseInt(rightIndex1));
            if(confirm('Are you sure?')) {
                $.ajax({
                    url:"${request.contextPath}/mappingRule/deleteTemplateField" ,
                    data:{id:rowDataDeleted.id,mappingRuleGroup:mappingRuleGroup.value} ,
                    success: function(text){
                        if(text){
                            $.messager.alert('Information',text,'info');
                        }
                        loadGrid();
                    }
                });
            }
        }

        function removeRule(){
            var mappingRuleGroup = document.getElementById('mappingRuleGroup.id');
            if(!rowDataDeleted.operator){
                alert("Sorry this tempalte dose not have rule!")
                return false;
            }
            if(!rowDataDeleted.ruleId){
                alert("Rule id is null!")
                return false;
            }
            if(confirm('Are you sure?')) {
                $.ajax({
                    url:"${request.contextPath}/mappingRule/deleteRule" ,
                    data:{id:rowDataDeleted.ruleId} ,
                    success: function(text){
                        if(text){
                            $.messager.alert('Information',text,'info');
                        }
                        loadGrid();
                    }
                });
            }
        }

        function removeSegment(){

            var mappingRuleGroup = document.getElementById('mappingRuleGroup.id');
            var type = document.getElementById('type');
            var template =  $('#test').datagrid('selectRow',parseInt(rightIndex1));
            if(confirm('Are you sure?')) {
                lockScreen();
                $.ajax({
                    url:"${request.contextPath}/mappingRule/deleteSegment" ,
                    data:{id:rowDataDeleted.id,segment:rowDataDeleted.segment,mappingRuleGroup:mappingRuleGroup.value,type:type.value} ,
                    success: function(text){
                        loadGrid();
                        relockScreen();
                        $.messager.alert('Information',text,'info');

                    }
                });
                $('#test').datagrid('deleteRow',parseInt(rightIndex1));
            }
        }

      //--------------------------------------------search mapping rule group------------------------------------------------------------------------
        function searchRuleGroup(){
            var ruleGroup = document.getElementById('mappingRuleGroup.id');
            var ruleGroupName = document.getElementById('mappingRuleGroupNameSearch');
            var type= document.getElementById('typeSearch');
            var fromApplication =  document.getElementById('fromApplicationSearch');
            var toApplication = document.getElementById('toApplicationSearch');
            var enabled = document.getElementById('activeIndSearch').checked;

            var paramKQ = " ${request.contextPath}/mappingRule/searchMappingRuleGroup?ruleGroupName="
                    +ruleGroupName.value+"&type="+type.value+"&fromApplication="+fromApplication.value+"&toApplication="
                    +toApplication.value+"&enabled="+enabled;
            open(paramKQ,'title','resizable=no,width=900,height=600,scrollbars=yes');
        }

        //-----------------------------------------------check create rule value----------------------------------------------
    function checkValue(){
        var toSegment = document.getElementById('toSegmentdlg');
        var toIndex = document.getElementById('toIndexdlg');
        var toSubIndex = document.getElementById('toSubIndexdlg');
        var fromSegment = document.getElementById('fromSegmentdlg');
        var fromIndex = document.getElementById('fromIndexdlg');
        var fromSubIndex = document.getElementById('fromSubIndexdlg');
        var valueDlg = document.getElementById('valueDlg');
        var copyValue=document.getElementById('copyValue');
        var copyValue = document.getElementById('movCopy');
//        var mappingRule_optionCopyTr = document.getElementById('mappingRule_optionCopyTr');
        var optionCopy = document.getElementById('mappingRule_optionCopy');
        if(rowTemp){
            if(rowTemp.subfieldIndex==0){
                toSubIndex.value=0;
            }else if(!checknum.exec(toSubIndex.value)){
                toSubIndex.value=0;
            }
        }
        if(operatorTemp=="MOV"){
            if(toSegment.value){

                if(copyValue.checked){
                    optionCopy.checked = true;
//                    mappingRule_optionCopyTr.style.display="";
                }else{
                    optionCopy.checked= false;
//                    mappingRule_optionCopyTr.style.display="";
                }
                if(checknum.exec(toIndex.value)&&checknum.exec(toSubIndex.value)){
                    toSegment.value=toSegment.value.toUpperCase();
                    var conditionsStr = toSegment.value +"|" +toIndex.value+"|"+toSubIndex.value;
                    document.getElementById("mappingRule_condition").value = conditionsStr;
                    if(rowTemp){
                        rowTemp.conditions = conditionsStr;
                    }else {
                        conditionStrTemp = conditionsStr;
                    }
                    $('#move').dialog('close');
                    copyValue.checked = false;
                    toSegment.value="";
                    toIndex.value="";
                    toSubIndex.value ="";
                }else{
                    alert("To Index and To Sub-Index must be a number!");
                }
            }else{
                alert("To Segment can not be blank!")
            }
        } else if(operatorTemp=="SET"){
            optionCopy.checked= false;
//            mappingRule_optionCopyTr.style.display="none";

            var valueDlg =document.getElementById('valueDlg');
            if(!valueDlg.value){
                alert("The value can not be blank!");
            }else{
                document.getElementById("mappingRule_condition").value = valueDlg.value;
                document.getElementById("mappingRule_value").value = valueDlg.value;
                if(rowTemp){
                    rowTemp.value = valueDlg.value;
                    rowTemp.conditions="";
                }else {
                    valueStr = valueDlg.value;
                    conditionStrTemp="";
                }
                $('#set').dialog('close');
                fromSegment.value="";
                fromIndex.value="";
                fromSubIndex.value ="";
                valueDlg.value="";
                copyValue.style.display="";
            }

        }
    }



    function cancleDlg(){
        if(operatorTemp=="MOV") {
            $('#move').dialog('close')
            var toSegment = document.getElementById('toSegmentdlg');
            var toIndex = document.getElementById('toIndexdlg');
            var toSubIndex = document.getElementById('toSubIndexdlg');
            toSegment.value="";
            toIndex.value="";
            toSubIndex.value ="";
        } else if(operatorTemp=="SET") {
            $('#set').dialog('close')
            var toSegment = document.getElementById('fromSegmentdlg');
            var toIndex = document.getElementById('fromIndexdlg');
            var toSubIndex = document.getElementById('fromSubIndexdlg');
            toSegment.value="";
            toIndex.value="";
            toSubIndex.value ="";
        }
    }

    function createTemplate(){
        var hl7message = document.getElementById('hl7messagedlg');
        var type = document.getElementById('typedlg');
        var mappingRuleGroup = document.getElementById('mappingRuleGroup.id');
        if(hl7message.value){
            if(type.value){
                 if(mappingRuleGroup.value){
                     $.ajax({
                         url:"${request.contextPath}/mappingRule/saveTemplate",
                         data:{hl7message:hl7message.value,type:type.value,mappingRuleGroup:mappingRuleGroup.value},
                         success:function(text){
                             hl7message.value="";
                             type.value="";
                             $.messager.alert('Information',text,'info');
                             loadGrid();
                         }
                     });
                     $('#templatedlg').dialog('close');
                 } else{
                     alert("Please choose Mapping Rule Group!");
                 }
            }else{
                alert("Please choose Template Message Type!");
            }
        }else{
            alert("Template Message is null!");
        }

    }
    function cancleTemplate(){
        var hl7message = document.getElementById('hl7messagedlg');
        var type = document.getElementById('typedlg');
        $('#templatedlg').dialog('close');
        hl7message.value="";
        type.value="";
    }
    function openTemplateDialog(){

        var mappingRuleGroup = document.getElementById('mappingRuleGroup.id');
        var typedlg = document.getElementById('typedlg');
        var type = document.getElementById('type');
        if(!mappingRuleGroup.value){
            alert("Please create or search a Mapping Rule Group");
            return false;
        }
        typedlg.value = type.value;
        $('#templatedlg').dialog('open').dialog('setTitle','Create Template');
    }
    function openScripting(){
        var mappingRuleGroup = document.getElementById('mappingRuleGroup.id');
        if(!mappingRuleGroup.value){
            alert("Please create or search a Mapping Rule Group");
            return false;
        }
        var paramKQ = " ${request.contextPath}/mappingRule/scripting?mappingRuleGroup="+mappingRuleGroup.value;
        open(paramKQ,'title','resizable=no,width=850,height=600,scrollbars=yes');
    }

    function cancleScripting(){
        var scriptText = document.getElementById('scriptTextdlg');
        scriptText.value="";
        $('#scriptTextDiv').dialog('close');
    }
    function deleteCheck(){
        if(rowTemp){
            if(rowTemp.required==true){
                alert("Sorry The Field is required,can not be blank!");
            }
        }

    }
    function setConditionValue(){
        var toSegment = document.getElementById('toSegmentdlg');
        var toIndex = document.getElementById('toIndexdlg');
        var toSubIndex = document.getElementById('toSubIndexdlg');
        var conditions = rowTemp.conditions;
        var conditionsArray = conditions.split("|");
        toSegment.value =  conditionsArray[0];
        toIndex.value =  conditionsArray[1];
        toSubIndex.value = conditionsArray[2];
    }


        function setScriptText(scriptText,processValue){
            var text =  scriptText;
            var processValue =  processValue;
            var mappingRuleGroup = document.getElementById('mappingRuleGroup.id');
            if(mappingRuleGroup.value){
                if(text){
                    $.ajax({
                        url:"${request.contextPath}/mappingRule/saveScriptText",
                        data:{scriptText:text,mappingRuleGroup:mappingRuleGroup.value,processValue:processValue},
                        success:function(msg){
                            scriptText.value="";
                            $.messager.alert('Information',msg,'info');
                        }
                    });
                } else{
                    alert("Script Text can not be blank!");
                }
            }else{
                alert("Please create or search a Mapping Rule Group");
            }
        }

    // option change 触发的事件
    function optionChange(){
        var mappingRule_option = document.getElementById("mappingRule_option");
//        var mappingRule_optionCopyTr = document.getElementById("mappingRule_optionCopyTr");
        var mappingRule_optionCopy = document.getElementById("mappingRule_optionCopy");
        var copytr = document.getElementById("hiddenCopyTr");
        var movetr = document.getElementById("hiddenMoveTr");
        var settr = document.getElementById("hiddenSetTr");
        var hiddenMapT = document.getElementById("hiddenMapT");
        var segmentPositionTable = document.getElementById("segmentPositionTable");
        var n = mappingRule_option.value;

        if(n=='MOV'){
            clearRuleDlg();
            copytr.style.display="";
            movetr.style.display="";
            settr.style.display="none";
            if(rowTemp){
                if(rowTemp.conditions){
                    var toSegment = document.getElementById('toSegmentdlg');
                    var toIndex = document.getElementById('toIndexdlg');
                    var toSubIndex = document.getElementById('toSubIndexdlg');
                    var subfieldIndexDiv = document.getElementById('subfieldIndexDiv');
                    var conditions = rowTemp.conditions;
                    var conditionsArray = conditions.split("|");
                    if(rowTemp.value =="CPY") {
                        mappingRule_optionCopy.checked = true;
                    }else{
                        mappingRule_optionCopy.checked = false;
                    }
                    if(conditionsArray.length==3) {
                        toSegment.value =  conditionsArray[0];
                        toIndex.value =  conditionsArray[1];
                        toSubIndex.value = conditionsArray[2];
                    }else{
                        toSegment.value = '';
                        toIndex.value =  0;
                        toSubIndex.value = 0;
                    }
                    if(rowTemp.subfiled){
                        subfieldIndexDiv.style.display="";
                    }else{
                        subfieldIndexDiv.style.display="none";
                    }
                }
            }
            operatorTemp = "MOV";
//            $('#move').dialog('open').dialog('setTitle','Move Information');
        }
        if(n==''){
            clearRuleDlg();
            segmentPositionTable.style.display="none";
            operatorTemp = "";
        }
        if(n=='SET'){
            clearRuleDlg();
            copytr.style.display="none";
            movetr.style.display="none";
            settr.style.display="";
            if(rowTemp){
                if(rowTemp.value){
                    mappingRule_optionCopy.checked = false;
                    var valueTemp = document.getElementById('valueDlg');
                    valueTemp.value= rowTemp.value;
                }
            }
            operatorTemp = "SET";
            $('#set').dialog('open').dialog('setTitle','Set Information');
        }
        if(n=='BLK'){
            clearRuleDlg();
            deleteCheck();
            segmentPositionTable.style.display="";
            operatorTemp = "BLK";
        }
        if(n=="MAP") {
            clearRuleDlg();
            hiddenMapT.style.display="";
        }
    }
    function clearRuleDlg(){
        var copytr = document.getElementById("hiddenCopyTr");
        var movetr = document.getElementById("hiddenMoveTr");
        var settr = document.getElementById("hiddenSetTr");
        var toSegment = document.getElementById('toSegmentdlg');
        var toIndex = document.getElementById('toIndexdlg');
        var toSubIndex = document.getElementById('toSubIndexdlg');
        var segmentPositionTable = document.getElementById("segmentPositionTable");
        var valueDlg = document.getElementById('valueDlg');
        var mappingRule_optionCopy = document.getElementById("mappingRule_optionCopy");
        var mappingRuleConditions = document.getElementById("mappingRuleConditions");
        var conditionsValue = document.getElementById("conditionsValue");
        var mapValue = document.getElementById("mapValue");
        var hiddenMapT = document.getElementById("hiddenMapT");

        copytr.style.display="none";
        movetr.style.display="none";
        settr.style.display="none";
        hiddenMapT.style.display="none";
        segmentPositionTable.style.display="none";
        toSegment.value = '';
        mappingRuleConditions.value = '';
        conditionsValue.value = '';
        mapValue.value = '';
        toIndex.value =  0;
        toSubIndex.value = 0;
        valueDlg.value="";
        mappingRule_optionCopy.checked = false;
    }
    //保存 template 和 rule
    function updateRule(){
        var mappingRule_segment = document.getElementById('mappingRule_segment');
        var mappingRule_id  = document.getElementById('mappingRule_id');
        var mappingRule_field = document.getElementById('mappingRule_field');
        var mappingRule_fieldIndex  = document.getElementById('mappingRule_fieldIndex');
        var mappingRule_subField = document.getElementById('mappingRule_subField');
        var mappingRule_subFieldIndex = document.getElementById('mappingRule_subFieldIndex');
        var mappingRule_option = document.getElementById('mappingRule_option');
        var mappingRule_condition = document.getElementById('mappingRule_condition');
        var mappingRule_required = document.getElementById('mappingRule_required');
        var mappingRule_repeatable = document.getElementById('mappingRule_repeatable');
        var mappingRule_value = document.getElementById('mappingRule_value');
        var mappingRule_optionCopy = document.getElementById('mappingRule_optionCopy');
        var mappingRuleGroup = document.getElementById("mappingRuleGroup.id");
        var type =  document.getElementById("type");
        var toSegment = document.getElementById('toSegmentdlg');
        var toIndex = document.getElementById('toIndexdlg');
        var toSubIndex = document.getElementById('toSubIndexdlg');
        var valueTemp = document.getElementById('valueDlg');
        var mappingRuleConditions = document.getElementById("mappingRuleConditions");
        var conditionsValue = document.getElementById("conditionsValue");
        var mapValue = document.getElementById("mapValue");
        if(!mappingRule_option.value){
            alert("Option is null!")
            mappingRule_option.focus();
            return false;
        }
        if(mappingRule_option.value=="MOV") {
            if(!toSegment.value){
                alert("To Segment is null!");
                toSegment.focus();
                return false;
            }
            if(!checknum.exec(toIndex.value)){
                alert("To Index must be a number and greater than 0!");
                toIndex.focus();
                return false;
            }
            if(Number(toIndex.value)<=0) {
                alert("To Index must be a number and greater than 0!");
                toIndex.focus();
                return false;
            }
            if(mappingRule_subField.value){
                if(!checknum.exec(toSubIndex.value)){
                    alert("To Sub-index must be a number and greater than 0!");
                    toSubIndex.focus();
                    return false;
                }
                if(Number(toSubIndex.value)<=0) {
                    alert("To Sub-index must be a number and greater than 0!");
                    toSubIndex.focus();
                    return false;
                }
            }
        }

        if(mappingRule_option.value=="SET"){
            if(!valueTemp.value){
                alert("The Value is null!")
                valueTemp.focus();
                return false;
            }
        }
        if(mappingRule_option.value=="MAP") {
            if(!mappingRuleConditions.value){
                alert("Conditions is null");
                valueTemp.focus();
                return false;
            }
            if(mappingRuleConditions.value=="LESSTHAN"||mappingRuleConditions.value=="GREATERTHAN") {
                if(!checknum.exec(conditionsValue.value)){
                    alert("Conditions Value must be a number");
                    conditionsValue.focus();
                    return false;
                }
            }
            if(!conditionsValue.value){
                alert("Conditions Value is null");
                conditionsValue.focus();
                return false;
            }
//            if(!mapValue.value){
//                alert("Map Value is null");
//                mapValue.focus();
//                return false;
//            }
        }
        var segmentPositionNum = document.getElementById('segmentPositionNum');
        var segmentPositionP = document.getElementsByName('segmentPosition');
        var segmentPosition = ""
        if(mappingRule_option.value=="BLK"){
            for(var i=0;i<segmentPositionP.length;i++) {
                if(segmentPositionP[i].checked){
                    if(segmentPositionP[i].value=='others'){
                        if(!checknum.exec(segmentPositionNum.value)){
                            alert("The Segment Index must be a number and greater than 1!");
                            segmentPositionNum.focus();
                            return false;
                        }
                        if(Number(segmentPositionNum.value)<=1) {
                            alert("The Segment Index must be a number and greater than 1!");
                            toSubIndex.focus();
                            return false;
                        }
                        segmentPosition = segmentPositionNum.value;
                    } else{
                        segmentPosition = segmentPositionP[i].value;
                    }

                }
            }
        }
        if(!mappingRule_segment.value){
            alert("Segment is null!")
            mappingRule_segment.focus();
            return false;
        }

        if(!mappingRule_field.value&&!mappingRule_subField.value){
            if(mappingRule_fieldIndex.value!="0") {
                alert("Field is null!");
                mappingRule_field.focus();
                return false;
            }
        }
        if(!mappingRule_fieldIndex.value){
            alert("Field Index is null!");
            mappingRule_field.focus();
            return false;
        }
        $.ajax({
            url:"${request.contextPath}/mappingRule/updateRule" ,
            data: {id:mappingRule_id.value,segment:mappingRule_segment.value.toUpperCase(),field:mappingRule_field.value,
                fieldIndex:mappingRule_fieldIndex.value,subfiled:mappingRule_subField.value,subfieldIndex:mappingRule_subFieldIndex.value,
                required:mappingRule_required.checked,repeatable:mappingRule_repeatable.checked,
                operator:mappingRule_option.value,conditions:mappingRule_condition.value,
                mappingRuleGroup:mappingRuleGroup.value,type:type.value,copy:mappingRule_optionCopy.checked,
                toSegment:toSegment.value,toIndex:toIndex.value,toSubIndex:toSubIndex.value,value:valueTemp.value,segmentIndex:segmentPosition,mapValue:mapValue.value,
                conditionsValue:conditionsValue.value,mappingRuleConditions:mappingRuleConditions.value},
            success: function(text){
                if(text=="Save success"){
                    $("#editRule_dlg").dialog("close");
                    rowTemp=null;
                    loadGrid();
                }else{
                    $.messager.alert('Information',text,'info');
                }


            }
        });
    }
    function closeEditRuleDlg(){
        $("#editRule_dlg").dialog("close");
        var mappingRule_segment = document.getElementById('mappingRule_segment');
        var mappingRule_id  = document.getElementById('mappingRule_id');
        var mappingRule_field = document.getElementById('mappingRule_field');
        var mappingRule_fieldIndex  = document.getElementById('mappingRule_fieldIndex');
        var mappingRule_subField = document.getElementById('mappingRule_subField');
        var mappingRule_subFieldIndex = document.getElementById('mappingRule_subFieldIndex');
        var mappingRule_option = document.getElementById('mappingRule_option');
        var mappingRule_value = document.getElementById('mappingRule_value');
        var mappingRule_condition = document.getElementById('mappingRule_condition');
        var mappingRule_required = document.getElementById('mappingRule_required');
        var mappingRule_repeatable = document.getElementById('mappingRule_repeatable');
        mappingRule_segment.value ="";
        mappingRule_id.value = "";
        mappingRule_field.value  = "";
        mappingRule_fieldIndex.value  = "";
        mappingRule_subField.value ="" ;
        mappingRule_subFieldIndex.value= "";
        mappingRule_option.value= "SET";
        mappingRule_required.checked=false;
        mappingRule_repeatable.checked=false;
        mappingRule_value.value="";
    }
    //------------------------------------toolbar option-------------------------------
    function editTemplateRow(){
        var editRow = $('#test').datagrid('getSelected');
        if(!editRow){
            alert("Please select a row to edit!")
        }else{
            var mappingRule_segment = document.getElementById('mappingRule_segment');
            var mappingRule_id  = document.getElementById('mappingRule_id');
            var mappingRule_field = document.getElementById('mappingRule_field');
            var mappingRule_fieldIndex  = document.getElementById('mappingRule_fieldIndex');
            var mappingRule_subField = document.getElementById('mappingRule_subField');
            var mappingRule_subFieldIndex = document.getElementById('mappingRule_subFieldIndex');
            var mappingRule_option = document.getElementById('mappingRule_option');
            var mappingRule_condition = document.getElementById('mappingRule_condition');
            var mappingRule_required = document.getElementById('mappingRule_required');
            var mappingRule_repeatable = document.getElementById('mappingRule_repeatable');
            var mappingRule_value = document.getElementById('mappingRule_value');
//            var mappingRule_optionCopyTr = document.getElementById('mappingRule_optionCopyTr');
            mappingRule_segment.value = editRow.segment;
            mappingRule_id.value = editRow.id;
            mappingRule_field.value  = editRow.field;
            mappingRule_fieldIndex.value  = editRow.fieldIndex;
            mappingRule_subField.value = editRow.subfield ;
            if(editRow.subfieldIndex){
                mappingRule_subFieldIndex.value= editRow.subfieldIndex;
            } else{
                mappingRule_subFieldIndex.value=0;
            }

            mappingRule_option.value= editRow.operator ;
            mappingRule_value.value="";
            if(editRow.conditions){
                mappingRule_condition.value  = editRow.conditions;
            }
            if(editRow.required==true){
                mappingRule_required.checked= true;
            } else{
                mappingRule_required.checked= false;
            }
            if(editRow.repeatable==true){
                mappingRule_repeatable.checked= true;
            } else{
                mappingRule_repeatable.checked= false;
            }
            $("#editRule_dlg").dialog("open");
        }
    }

    function saveTemplateOption(){
        var mappingRuleGroupId = document.getElementById("mappingRuleGroup.id");
        var type = document.getElementById('type');
        if(!type.value||!mappingRuleGroupId.value){
            alert("Message type or Mapping Rule Group is null!");
        }else{
            $.ajax({
                url:"${request.contextPath}/mappingRule/saveOption",
                data:{type:type.value,mappingRuleGroup:mappingRuleGroupId.value},
                success:function(msg){
                    alert(msg);
                }
            })
        }
    }

    function recoverTemplateOption(){
        var mappingRuleGroupId = document.getElementById("mappingRuleGroup.id");
        var type = $("#typedlg").val();
        lockScreen();
        $.ajax({
            url:"${request.contextPath}/mappingRule/recover",
            data:{mappingRuleGroup:mappingRuleGroupId.value,type:type.value},
            success:function(msg){
                if(msg){
                    relockScreen();
                    alert(msg)
                }else{
                    loadGrid();
                    relockScreen();

                }
            }
        })
    }

    function searchTemplate(){
        searchSegment=$("#template_segment_search").val();
        loadGrid();
    }

    //--------------------------------laock---------------------------------
    function lockScreen(){
        document.body.style.overflow = 'hidden';
        var  showStr="Processing,Please wait....";
        var div=document.createElement("div");
        div.innerHTML="<div style='border:solid 1px #000;z-index:9999;font-size:12px; background:#b9edfe;position:absolute; top:45%; left:45%;width:130px;padding:5px;'>&nbsp;"+
                "<img src='loading.gif' width='16' height='16' align='absmiddle' />"+showStr+"</div>"+
                "<div id='filltop' style='position:absolute;background-color:green;z-index:9998;top:0px; left:0px; width:100%; height:100%;filter:alpha(opacity=50);opacity: 0.5;-moz-opacity: 0.5'></div>";
        div.setAttribute("id", "page_loading");
        document.body.appendChild(div);
        var divfilltop =document.getElementById("filltop");
        //alert("clientHeight:"+document.documentElement.clientHeight + 'px');
        divfilltop.style.height = document.documentElement.clientHeight + 'px';
        //alert(" divfilltop.style.height:"+divfilltop.style.height + 'px');
    }
    function relockScreen(){
        document.body.style.overflow = '';
        var div =document.getElementById("page_loading");
        //alert("开始解锁div:"+div);
        if(div !==null){
            //div.style.display='none';
            div.parentNode.removeChild(div);
            div=null;
            //alert("已经解锁div:"+div);
            CollectGarbage();
        }
    }
    //-------------------------------------------remove Template ----------------------------------------------
    function removeAllTemplate(){
        var mappingRuleGroup = document.getElementById("mappingRuleGroup.id");
        var type = document.getElementById("typedlg");
        if(!mappingRuleGroup.value){
            alert("Please choose a Mapping Rule Group");
            return false
        }
        if(confirm("Are you sure?")){
            $.ajax({
                url:"${request.contextPath}/mappingRule/deleteAllTemplate",
                data:{mappingRuleGroup:mappingRuleGroup.value,type:type.value},
                success:function(msg){
                    if(msg){
                        alert(msg);
                    }
                    loadGrid();
                }
            })
        }
    }



    
    //----------------------------------------select rule group---------------------------------------------------------------------------
    function loadTemplateGrid(){
        var ruleGroup = document.getElementById('mappingRuleGroup.id');
        if(ruleGroup.value){
            loadGrid();
        } else{
            alert("Please Choose a Mapping Rule Group!");
        }
    }


    //-----------------------------------------delete segment rule----------------------------------------------------------------------------
    function removeSegmentRule(){
        var ruleGroup = document.getElementById('mappingRuleGroup.id');
        if(!ruleGroup.value){
            alert("Please create or search a Mapping Rule Group");
            return false;
        }
        document.getElementById('delSegmentRuleSegmentName').value = "";
        document.getElementById('delSegmentRuleInput').value="";
        document.getElementById('delSegmentRuleId').value="";
        document.getElementById('delSegmentRuleInput').readOnly=true;
        $("#deleteSegment_dlg").dialog("open");
    }
    function closeDeleteSegment_dlg(){
        $("#deleteSegment_dlg").dialog("close");
        document.getElementById('delSegmentRuleSegmentName').value = "";
        document.getElementById('delSegmentRuleId').value = "";
        document.getElementById('delSegmentRuleInput').value="";
        document.getElementById('delSegmentRuleInput').readOnly=true;
    }

    function radioChange(){
        var delSegmentRuleInput = document.getElementById('delSegmentRuleInput');
        var delSegmentRule = document.getElementsByName('delSegmentRule');
        for(var i=0;i<delSegmentRule.length;i++) {
            if(delSegmentRule[i].checked){
                if(delSegmentRule[i].value!='others'){
                    delSegmentRuleInput.readOnly=true;
                    delSegmentRuleInput.value = "";
                }else{
                    delSegmentRuleInput.readOnly=false;
                    delSegmentRuleInput.value = "";
                }
            }
        }
    }
    function radioChangeRule(){
        var segmentPositionNum = document.getElementById('segmentPositionNum');
        var segmentPosition = document.getElementsByName('segmentPosition');
        for(var i=0;i<segmentPosition.length;i++) {
            if(segmentPosition[i].checked){
                if(segmentPosition[i].value!='others'){
                    segmentPositionNum.readOnly=true;
                    segmentPositionNum.value = "";
                }else{
                    segmentPositionNum.readOnly=false;
                    segmentPositionNum.value = "";
                }
            }
        }
    }
    function deleteSegmentRule(){
        var delSegmentRule = document.getElementsByName('delSegmentRule');
        var delSegmentRuleSegmentName = document.getElementById('delSegmentRuleSegmentName');
        var delSegmentRuleInput = document.getElementById('delSegmentRuleInput');
        var ruleId = document.getElementById('delSegmentRuleId');
        if(rowDataDeleted){
            ruleId.value = rowDataDeleted.ruleId;
        } else{
            ruleId.value = "";
        }
        var ruleGroup = document.getElementById('mappingRuleGroup.id');
        var checkValue;
        var indexValue;
        if(!ruleGroup.value){
            alert("Please create or search a Mapping Rule Group");
            return false;
        }
        if(!delSegmentRuleSegmentName.value){
            alert("The Segment Name is null");
            delSegmentRuleSegmentName.focus();
            return false;
        }
        for(var i=0;i<delSegmentRule.length;i++) {
            if(delSegmentRule[i].checked){
                if(delSegmentRule[i].value!='others'){
                    checkValue = delSegmentRule[i].value;
                    indexValue = 0;
                }else{
                    if(!checknum.exec(delSegmentRuleInput.value)){
                        alert("The Others must be number");
                        delSegmentRuleInput.focus();
                        return false;
                    }else if(Number(delSegmentRuleInput.value)<1){
                        alert("The Index of input  must be greater than 1");
                        delSegmentRuleInput.focus();
                        return false;
                    }
                    indexValue = delSegmentRuleInput.value;
                    checkValue = "";
                }
            }
        }
        $.ajax({
            url: "${request.contextPath}/mappingRule/deleteSegmentRule",
            data:{segment:delSegmentRuleSegmentName.value,checkValue:checkValue,index:indexValue,ruleGroup:ruleGroup.value},
            success:function(msg){
                if(msg){
                    alert(msg);
                }else{
                    closeDeleteSegment_dlg();
                    loadGrid();
                }

            }
        })
    }

     //-----------------------------------------mapping rule group option-----------------------------------------------------------
        function setMappingRuleGroupInfo(id,name,type,fromApplication,toApplication,comments,activeInd,fid,tid,fversion,tversion){
            var ruleGroup = document.getElementById('mappingRuleGroup.id');
            var ruleGroupName = document.getElementById('mappingRuleGroupNameShow');
            var applicationShow = document.getElementById('applicationShow');
            var typeShow= document.getElementById('type');
            var activeIndR= document.getElementById('activeIndResult');
            var commentsR= document.getElementById('commentsResult');
            var fromApplicationResultId= document.getElementById('fromApplicationResultId');
            var toApplicationResultId= document.getElementById('toApplicationResultId');
            var fromApplicationResultName= document.getElementById('fromApplicationResultName');
            var fromApplicationResultName1= document.getElementById('fromApplicationResultName1');
            var fromApplicationResultVersion= document.getElementById('fromApplicationResultVersion');
            var toApplicationResultName= document.getElementById('toApplicationResultName');
            var toApplicationResultName1= document.getElementById('toApplicationResultName1');
            var toApplicationResultVersion= document.getElementById('toApplicationResultVersion');
            var mappingRuleGroupNameResult= document.getElementById('mappingRuleGroupNameResult');
            mappingRuleGroupNameResult.value = name;
            toApplicationResultId.value = tid;
            fromApplicationResultId.value = fid;
            fromApplicationResultName.value = fromApplication+"-"+fversion;
            fromApplicationResultName1.value = fromApplication;
            toApplicationResultName.value = toApplication+"-"+tversion;
            toApplicationResultVersion.value = tversion;
            fromApplicationResultVersion.value = fversion;
            activeIndR.value =  activeInd;
            if(comments) {
                commentsR.value = comments;
            }else{
                commentsR.value = "";
            }

            ruleGroup.value =id;
            ruleGroupName.value= name+"-"+type;
            typeShow.value = type;
            applicationShow.value = fromApplication+"-"+fversion+"->"+toApplication+"-"+tversion;
            loadGrid();
        }

        function selectApplication(num){
            applicationType = num;
            var paramKQ = " ${request.contextPath}/mappingRuleGroup/selectApplication"
            open(paramKQ,'title','resizable=no,width=800,height=500,scrollbars=yes');
        }
        function setApplicationInfo(id,name,version){
            var fromApplication =  document.getElementById('ruleGroupOption_fromApplication1');
            var fromApplicationShow =  document.getElementById('ruleGroupOption_fromApplicationShow');
            var toApplication =  document.getElementById('ruleGroupOption_toApplication1');
            var toApplicationShow =  document.getElementById('ruleGroupOption_toApplicationShow');
            var fromApplicationName =  document.getElementById('ruleGroupOption_fromApplicationName');
            var fromApplicationVersion =  document.getElementById('ruleGroupOption_fromApplicationVersion');
            var toApplicationName =  document.getElementById('ruleGroupOption_toApplicationName');
            var toApplicationVersion =  document.getElementById('ruleGroupOption_toApplicationVersion');
            if(applicationType==1){
                fromApplication.value = id;
                fromApplicationShow.value=name+"-"+version;
                fromApplicationName.value = name;
                fromApplicationVersion.value = version;
            }else if(applicationType==0){
                toApplication.value = id;
                toApplicationShow.value=name+"-"+version;
                toApplicationName.value = name;
                toApplicationVersion.value = version;
            }
        }
        function createMappingRuleGroup(str){
            var name = document.getElementById('ruleGroupOption_name');
            var fromApplication = document.getElementById('ruleGroupOption_fromApplication1');
            var toApplication = document.getElementById('ruleGroupOption_toApplication1');
            var ruleGroupOption_type = document.getElementById('ruleGroupOption_type');
            var rule_comments = document.getElementById('rule_comments');
            var ruleGroupOption_activeInd = document.getElementById('ruleGroupOption_activeInd');
            var ruleGroupOption_fromApplicationShow = document.getElementById('ruleGroupOption_fromApplicationShow');
            var ruleGroupOption_toApplicationShow = document.getElementById('ruleGroupOption_toApplicationShow');
            var ruleGroupOption_toApplicationName = document.getElementById('ruleGroupOption_toApplicationName');
            var ruleGroupOption_fromApplicationName = document.getElementById('ruleGroupOption_fromApplicationName');
            var ruleGroupOption_id= document.getElementById('ruleGroupOption_id');
            var ruleGroupOption_fromApplicationVersion= document.getElementById('ruleGroupOption_fromApplicationVersion');
            var ruleGroupOption_toApplicationVersion= document.getElementById('ruleGroupOption_toApplicationVersion');
            if(str=='c'){
                clearMappingRuleGroup_dlg();
            }else if(str=='e'){
                ruleGroupOption_id.value= document.getElementById('mappingRuleGroup.id').value;
                if(!ruleGroupOption_id.value){
                    alert("Please create or search a Mapping Rule Group");
                    return false;
                }
                var activeIndR = document.getElementById('activeIndResult').value;
                if(activeIndR=="true"){
                    ruleGroupOption_activeInd.checked = true;
                }else{
                    ruleGroupOption_activeInd.checked = false;
                }
                name.value = document.getElementById('mappingRuleGroupNameResult').value;
                ruleGroupOption_type.value= document.getElementById('type').value;
                rule_comments.value= document.getElementById('commentsResult').value;
                fromApplication.value= document.getElementById('fromApplicationResultId').value;
                toApplication.value= document.getElementById('toApplicationResultId').value;
                ruleGroupOption_fromApplicationShow.value = document.getElementById('fromApplicationResultName').value;
                ruleGroupOption_toApplicationShow.value = document.getElementById('toApplicationResultName').value;
                ruleGroupOption_toApplicationName.value = document.getElementById('toApplicationResultName1').value ;
                ruleGroupOption_fromApplicationName.value = document.getElementById('fromApplicationResultName1').value ;
                ruleGroupOption_fromApplicationVersion.value = document.getElementById('fromApplicationResultVersion').value ;
                ruleGroupOption_toApplicationVersion.value = document.getElementById('toApplicationResultVersion').value ;

            }

            $("#rule_ruleGroup_dlg").dialog("open");
        }
        function clearMappingRuleGroup_dlg(){
            var name = document.getElementById('ruleGroupOption_name');
            var fromApplication = document.getElementById('ruleGroupOption_fromApplication1');
            var toApplication = document.getElementById('ruleGroupOption_toApplication1');
            var ruleGroupOption_type = document.getElementById('ruleGroupOption_type');
            var rule_comments = document.getElementById('rule_comments');
            var ruleGroupOption_activeInd = document.getElementById('ruleGroupOption_activeInd');
            var ruleGroupOption_fromApplicationShow = document.getElementById('ruleGroupOption_fromApplicationShow');
            var ruleGroupOption_toApplicationShow = document.getElementById('ruleGroupOption_toApplicationShow');
            var ruleGroupOption_fromApplicationName = document.getElementById('ruleGroupOption_fromApplicationName');
            var ruleGroupOption_toApplicationName = document.getElementById('ruleGroupOption_toApplicationName');
            var ruleGroupOption_fromApplicationVersion = document.getElementById('ruleGroupOption_fromApplicationVersion');
            var ruleGroupOption_toApplicationVersion = document.getElementById('ruleGroupOption_toApplicationVersion');
            var ruleGroupOption_id = document.getElementById('ruleGroupOption_id');
            ruleGroupOption_activeInd.checked = true;
            rule_comments.value = "" ;
            name.value = "" ;
            fromApplication.value = "" ;
            toApplication.value = "" ;
            ruleGroupOption_type.value = "" ;
            ruleGroupOption_fromApplicationVersion.value = "";
            ruleGroupOption_toApplicationVersion.value ="";
            ruleGroupOption_fromApplicationShow.value = "" ;
            ruleGroupOption_toApplicationShow.value = "" ;
            ruleGroupOption_fromApplicationName.value = "" ;
            ruleGroupOption_toApplicationName.value = "" ;
            ruleGroupOption_id.value="";
        }
        function closeMappingRuleGroup_dlg(){
            $("#rule_ruleGroup_dlg").dialog("close");
            clearMappingRuleGroup_dlg();
        }
        function saveMappingRuleGroup() {
            var name = document.getElementById('ruleGroupOption_name');
            var fromApplication = document.getElementById('ruleGroupOption_fromApplication1');
            var toApplication = document.getElementById('ruleGroupOption_toApplication1');
            var ruleGroupOption_type = document.getElementById('ruleGroupOption_type');
            var rule_comments = document.getElementById('rule_comments');
            var ruleGroupOption_activeInd = document.getElementById('ruleGroupOption_activeInd');
            var ruleGroupOption_id = document.getElementById('ruleGroupOption_id');
            if(name.value===null||name.value==""){
                alert("Name can not be blank!");
                name.style.borderColor='red';
                name.focus();
                return false;
            } else{
                name.style.borderColor='';
            }

            if(fromApplication.value===null||fromApplication.value==""){
                alert("From Application can not be blank!");
                fromApplication.style.borderColor='red';
                fromApplication.focus();
                return false;
            }else{
                fromApplication.style.borderColor='';
            }

            if(toApplication.value===null||toApplication.value==""){
                alert("To Application can not be blank!");
                toApplication.style.borderColor='red';
                toApplication.focus();
                return false;
            }else{
                toApplication.style.borderColor='';
            }
            $.ajax({
                url: "${request.contextPath}/mappingRule/saveMappingRuleGroup",
                data:{ruleGroupOption_id:ruleGroupOption_id.value,fromApplication1:fromApplication.value,toApplication1:toApplication.value,name:name.value,activeInd:ruleGroupOption_activeInd.checked,type:ruleGroupOption_type.value,comments:rule_comments.value},
                success:function(msg){
                    if(msg.msg){
                        alert(msg);
                    }else if(msg.ruleGroup){
                        if(msg.ruleGroup.id){
                            setMappingRuleGroupInfo(msg.ruleGroup.id,msg.ruleGroup.name,msg.ruleGroup.type,msg.fromApplication.name,msg.toApplication.name,msg.ruleGroup.comments.value,msg.ruleGroup.activeInd,msg.fromApplication.id,msg.toApplication.id,msg.fromApplication.applicationVersion,msg.toApplication.applicationVersion);
                            closeMappingRuleGroup_dlg();
                        }
                    } else{
                        closeMappingRuleGroup_dlg();
                    }
                }
            })
        }
        function clearApplication(){
            var applicationOption_name = document.getElementById('applicationOption_name');
            var applicationOption_id = document.getElementById('applicationOption_id');
            var applicationOption_version = document.getElementById('applicationOption_version');
            var fromToType = document.getElementById('fromToType');
            applicationOption_id.value="";
            applicationOption_name.value="";
            applicationOption_version.value="";
            fromToType.value="";
        }
        function setFromApplicationInfo(fid,fromApplicationi,version){
            var fromApplication = document.getElementById('ruleGroupOption_fromApplication1');
            var ruleGroupOption_fromApplicationShow = document.getElementById('ruleGroupOption_fromApplicationShow');
            var ruleGroupOption_fromApplicationName = document.getElementById('ruleGroupOption_fromApplicationName')
            var ruleGroupOption_fromApplicationVersion = document.getElementById('ruleGroupOption_fromApplicationVersion');
            fromApplication.value = fid;
            ruleGroupOption_fromApplicationName.value = fromApplicationi;
            ruleGroupOption_fromApplicationShow.value = fromApplicationi+"-"+version;
            ruleGroupOption_fromApplicationVersion.value = version;
        }
        function setToApplicationInfo(tid,toApplicationi,version){
            var toApplication = document.getElementById('ruleGroupOption_toApplication1');
            var ruleGroupOption_toApplicationShow = document.getElementById('ruleGroupOption_toApplicationShow');
            var ruleGroupOption_toApplicationName = document.getElementById('ruleGroupOption_toApplicationName');
            var ruleGroupOption_toApplicationVersion = document.getElementById('ruleGroupOption_toApplicationVersion');
            toApplication.value = tid;
            ruleGroupOption_toApplicationShow.value = toApplicationi+"-"+version;
            ruleGroupOption_toApplicationName.value = toApplicationi;
            ruleGroupOption_toApplicationVersion.value = version;
        }
        function createApplication(num){
            clearApplication();
            document.getElementById('fromToType').value = num;
            $("#rule_application_dlg").dialog("open");
        }
        function editApplication(num) {
            document.getElementById('fromToType').value = num;
            if(num=="f"){
                var fromApplicationId = document.getElementById('applicationOption_id');
                var fromApplicationVersion = document.getElementById('applicationOption_version');
                var fromApplicationName = document.getElementById('applicationOption_name');
                fromApplicationId.value = document.getElementById('ruleGroupOption_fromApplication1').value;
                fromApplicationVersion.value = document.getElementById('ruleGroupOption_fromApplicationVersion').value;
                fromApplicationName.value = document.getElementById('ruleGroupOption_fromApplicationName').value;
                if(! fromApplicationId.value){
                    alert("From Application Id is null")
                    return false;
                }
            }else if(num=="t"){
                var toApplicationId = document.getElementById('applicationOption_id');
                var toApplicationVersion = document.getElementById('applicationOption_version');
                var toApplicationName = document.getElementById('applicationOption_name');
                toApplicationId.value =document.getElementById('ruleGroupOption_toApplication1').value;
                toApplicationName.value =document.getElementById('ruleGroupOption_toApplicationName').value;
                toApplicationVersion.value =document.getElementById('ruleGroupOption_toApplicationVersion').value;
                if(!toApplicationId.value){
                    alert("From Application Id is null")
                    return false;
                }
            }

            $("#rule_application_dlg").dialog("open");
        }
        function closeApplication_dlg(){
            clearApplication();
            $("#rule_application_dlg").dialog("close");
        }
        function saveApplication(){
            var applicationOption_name = document.getElementById('applicationOption_name');
            var applicationOption_id = document.getElementById('applicationOption_id');
            var applicationOption_version = document.getElementById('applicationOption_version');
            var fromToType = document.getElementById('fromToType');
            if(!applicationOption_name.value){
                alert("Application Name is null");
                applicationOption_name.focus();
                return false;
            }

            $.ajax({
                url: "${request.contextPath}/mappingRule/saveApplication",
                data:{name:applicationOption_name.value,version:applicationOption_version.value,id:applicationOption_id.value},
                success:function(msg){
                    if(msg.msg){
                        alert(msg.msg);
                    }else{
                        if(fromToType.value=='f'){
                            setFromApplicationInfo(msg.application.id,msg.application.name,msg.application.applicationVersion);
                        }else if (fromToType.value=='t'){
                            setToApplicationInfo(msg.application.id,msg.application.name,msg.application.applicationVersion);
                        }
                    }
                    clearApplication();
                    closeApplication_dlg();
                }
            })
        }
    </script>

</head>
<body>
<h2>Mapping Rule</h2>
<hr>

<div id="mm" class="easyui-menu" style="width:200px;">
    <div onclick="appendField()">Insert Field</div>
    <g:hiddenField name="appendFieldFlag" id="appendFieldFlag" value="0"></g:hiddenField>
    %{--<div onclick="return removeRule();">Remove Rule</div>--}%
    <div onclick="removeRow()">Remove Field</div>
    <div onclick="return removeRule();">Clear Rule</div>

</div>
<div id="mms" class="easyui-menu" style="width:200px;">
    <div onclick="return appendSegment()">Insert Segment</div>
    <div onclick="return appendField()">Insert Field</div>
    <g:hiddenField name="appendSegmentFlag" id="appendSegmentFlag" value="0"></g:hiddenField>
    %{--<div onclick="return removeRule()">Remove Rule</div>--}%
    <div id="removeSegmentDivmms" onclick="return removeSegment()">Remove Segment</div>
    <div id="suppressSegmentDivmms" onclick="return removeSegmentRule();">Suppress Rule</div>
    <div id="clearSegmentDivmms" onclick="return removeRule()">Clear Rule</div>
</div>

%{--<div id="move" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"--}%
     %{--closed="true" buttons="#dlg-buttons">--}%
    %{--<div style="font-size: 20px; color: #279745">Move rule</div>--}%
    %{--<hr>--}%
    %{--<table>--}%
        %{--<tr>--}%
            %{--<td><label style="margin: 0 10px 0 0">Copy:</label></td>--}%
            %{--<td><g:checkBox name="movCopy" value=""/></td>--}%
        %{--</tr>--}%
        %{--<tr>--}%
            %{--<td><label style="margin: 0 10px 0 0">To Segment:</label></td>--}%
            %{--<td><g:textField name="toSegmentdlg" value=""></g:textField></td>--}%
        %{--</tr>--}%
        %{--<tr>--}%
            %{--<td>  <label style="margin: 0 23px 0 0">To Index:</label></td>--}%
            %{--<td>  <g:textField name="toIndexdlg"></g:textField></td>--}%
        %{--</tr>--}%
        %{--<tr>--}%
            %{--<td><label style="margin: 0 0 0 0">To Sub-Index:</label></td>--}%
            %{--<td><g:textField name="toSubIndexdlg"></g:textField></td>--}%
        %{--</tr>--}%
    %{--</table>--}%

    %{--<div style="margin: 20px 0 0 0">--}%
        %{--<input style="margin:0 0 0 200px" type="button" class="btn btn-primary" value="OK" onclick="checkValue();">--}%
        %{--<input style="margin:0 0 0 0" type="button" class="btn" value="Cancel" onclick="cancleDlg();">--}%
    %{--</div>--}%
%{--</div>--}%
%{-----------------------------set rule-----------------------------------------------}%
%{--<div id="set" class="easyui-dialog" style="width:400px;height:300px;padding:10px 20px"--}%
     %{--closed="true" buttons="#dlg-buttons">--}%
    %{--<div style="font-size: 20px; color: #279745">Set rule</div>--}%
    %{--<hr>--}%
    %{--<table>--}%

    %{--</table>--}%
    %{--<div style="margin: 5px 0 0 0">--}%
        %{--<label style="margin: 0 25px 0 0">Set Value:</label>--}%
        %{--<g:checkBox onclick="selectType();" name="selectType" value=""></g:checkBox>--}%
    %{--</div>--}%
    %{--<div id=setValue style="margin: 5px 0 0 0;">--}%
        %{--<div style="margin: 5px 0 0 0">--}%
            %{--<g:textArea  name="valueDlg"  id="valueDlg" value=""  rows="400" cols="400" style="width:300px;height:100px;"></g:textArea>--}%
        %{--</div>--}%
    %{--</div>--}%
    %{--<div id='copyValue' style="display: none;" >--}%
        %{--<table>--}%
            %{--<tr>--}%
                 %{--<td><label style="margin: 0 10px 0 0">From Segment:</label></td>--}%
                 %{--<td> <g:textField name="fromSegmentdlg" value=""></g:textField></td>--}%
            %{--</tr>--}%
            %{--<tr>--}%
                %{--<td> <label style="margin: 0 23px 0 0">From Index:</label></td>--}%
                %{--<td> <g:textField name="fromIndexdlg"></g:textField></td>--}%
            %{--</tr>--}%
            %{--<tr>--}%
                %{--<td> <label style="margin: 0 0 0 0">From Sub-Index:</label></td>--}%
                %{--<td> <g:textField name="fromSubIndexdlg"></g:textField></td>--}%
            %{--</tr>--}%
        %{--</table>--}%

    %{--</div>--}%

    %{--<div style="margin: 20px 0 0 0">--}%
        %{--<input style="margin:0 0 0 200px" type="button" value="OK" class="btn btn-primary" onclick="checkValue();">--}%
        %{--<input style="margin:0 0 0 0" type="button" class="btn" value="Cancel" onclick="cancleDlg();">--}%
    %{--</div>--}%
%{--</div>--}%
 %{----------------------------------------------------------tempalte------------------------------------------------------------------------------------------}%
<div  id="templatedlg" class="easyui-dialog" style="width:600px;height:500px;padding:10px 20px" closed="true" buttons="#templatedlg-buttons">
    <div style="font-size: 20px; color: #279745">Create Template</div>
    <hr>
    <table>
        <tr>
            <td>Message Type</td>
            <td><g:select name="typedlg" noSelection="${['':'-Massage Type-']}" from="${Template.constraints.type.inList}" value="" valueMessagePrefix="template.type"  /></td>
        </tr>
        %{--<tr>--}%
            %{--<td>From Application</td>--}%
            %{--<td><g:textField name="template_fromApplication" value="${fromApplication?.name}" readonly='true' ></g:textField>--}%
            %{--</td>--}%
        %{--</tr>--}%
        %{--<tr>--}%
            %{--<td>To Application</td>--}%
            %{--<td> <g:textField name="template_toApplication" value="${toApplication?.name}" readonly = 'true'></g:textField></td>--}%
        %{--</tr>--}%
    </table>

    <div style="font-size: 15px;margin: 10px 0 0 0;color: #279745">Please input the Template Message here!</div>
    <div  style="margin: 10px 0 0 0">
        <g:textArea style="width: 400px;height: 150px" name="hl7messagedlg" rows="400" cols="400"></g:textArea>
    </div>

</div>

<div id="templatedlg-buttons">
    <input style="margin:0 0 0 300px" type="button" class="btn btn-primary" value="OK" onclick="createTemplate();">
    <input style="margin:0 0 0 0" type="button" value="Cancel" class="btn" onclick="cancleTemplate();">
</div>



%{-------------------------------------------------------edit rule---------------------------------------------------------------------------------}%
<div id="editRule_dlg" title="${message(code:'mappingRule.label', default:'Mapping Rule')}"
     class="easyui-dialog" style="width:550px;height:650px;padding:10px 20px"
     closed="true" buttons="#menudlg-buttons">
    <h2>${message(code: 'mappingRule.create.label', default: 'Create Rule')}</h2>
    <hr>
    <table>
        <tr id="treeMenu_parentTr">
            <td><label>${message(code: 'mappingRule.segment.label', default: 'Segment')}:</label></td>
            <td>
                <input type="text" name="mappingRule_segment" id="mappingRule_segment"  readonly="true">
                <g:hiddenField name="mappingRule_id" id="mappingRule_id"></g:hiddenField>
            </td>
            .
        </tr>

        <tr id="treeMenu_linkTr">
            <td><label>${message(code: 'mappingRule.field.label', default: 'Field')}:</label></td>
            <td><input type="text" name="mappingRule_field" id="mappingRule_field"  readonly="true">
            </td>

        </tr>

        <tr>
            <td><label>${message(code: 'mappingRule.fieldIndex.label', default: 'Field Index')}:</label></td>
            <td>
                <input type="text" name="mappingRule_fieldIndex" id="mappingRule_fieldIndex" readonly="true">
            </td>
        </tr>

        <tr id="subfieldTr" style="display: none" >
            <td><label>${message(code: 'mappingRule.subField.label', default: 'Sub-Field')}:</label></td>
            <td>
                <input type="text" name="mappingRule_subField" id="mappingRule_subField" readonly="true">
            </td>
        </tr>

        <tr  id="subfieldIndexTr" style="display: none">
            <td><label>${message(code: 'mappingRule.subFieldIndex.label', default: 'Sub-Field Index')}:</label></td>
            <td>
                <input type="text" name="mappingRule_subFieldIndex"  id="mappingRule_subFieldIndex" readonly="true">
            </td>
        </tr>

        <tr >
            <td><label>${message(code: 'mappingRule.required.label', default: 'Required')}:</label></td>
            <td><input type="checkbox" name="mappingRule_required" id="mappingRule_required" onclick="return false;">
            </td>
        </tr>

        <tr>
            <td><label>${message(code: 'mappingRule.repeatable.label', default: 'Repeatable')}:</label></td>
            <td><input type="checkbox"   id="mappingRule_repeatable" onclick="return false;">
            </td>
        </tr>
        <tr>
           <td></td>
           <td><h3>Rule</h3></td>
        </tr>

        %{--<tr style="display: none;background-color: #B0C4DE" id="hiddenCopyTr">--}%
            %{--<td><label>Copy:</label></td>--}%
            %{--<td><g:checkBox name="mappingRule_optionCopy" value=""/></td>--}%
        %{--</tr>--}%
        %{--<tr style="display: none;background-color: #B0C4DE" id="hiddenMoveTr">--}%
            %{--<td><label>To Segment: </label></td>--}%
            %{--<td><g:textField name="toSegmentdlg" value="" style="width:30px;"></g:textField> <label>To Index: </label><g:textField name="toIndexdlg" style="width:30px"></g:textField><div id="subfieldIndexDiv"><label>To Sub-Index: </label><g:textField name="toSubIndexdlg" style="width:30px"></g:textField></div></td>--}%
        %{--</tr>--}%


        <tr>
            <td></td>
            <td>
                <input type="hidden"  name="mappingRule_condition"  id="mappingRule_condition" onclick="optionChange();"  placeholder = "Click to edit" readonly="true">
                <input type="hidden"  name="mappingRule_value" id="mappingRule_value" readonly="true">
            </td>
        </tr>

        </tr>
    </table>
    <table style="background-color: #B0C4DE;width: 400px">
        <tr>
            <td><label>${message(code: 'mappingRule.option.label', default: 'Option')}:</label></td>
            <td>
                <g:select onchange="optionChange();" name="mappingRule_option" optionKey="option" noSelection="${['':'','':'Option']}" optionValue="optionShow" from="${[[option:'SET',optionShow:'Set'],[option:'MOV',optionShow:'Move'],[option:'MAP',optionShow:'Map'],[option:'BLK',optionShow:'Blank']]}"></g:select>

                <g:hiddenField name="mappingRuleId" value=""></g:hiddenField>

            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <table>
                    <tr style="display: none;background-color: #B0C4DE" id="hiddenSetTr">
                        <td>Value:</td>
                        <td><g:textArea  name="valueDlg"  id="valueDlg" value=""  rows="400" cols="400" style="width:300px;height:100px;"></g:textArea></td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr>
            <td></td>
            <td>
                <table style="display: none;background-color: #B0C4DE;border: 10px" id="hiddenCopyTr">
                <tr>
                    <td><label>Copy:</label></td>
                    <td><g:checkBox name="mappingRule_optionCopy" value=""/></td>
                </tr>
                <tr style="display: none;background-color: #B0C4DE" id="hiddenMoveTr">
                    <td><label>To Segment: </label></td>
                    <td><g:textField name="toSegmentdlg" value=""></g:textField></td>
                </tr>
                <tr>
                    <td> <label>To Index: </label></td>
                    <td><g:textField name="toIndexdlg" ></g:textField></td>
                </tr>
                <tr id="hiddenMoveSubTr">
                    <td><label>To Sub-Index: </label></td>
                    <td><g:textField name="toSubIndexdlg" ></g:textField></td>
                </tr>

            </table>
            </td>

        </tr>
        <tr>
            <td></td>
            <td><table id="segmentPositionTable" style="line-height: 10px;display: none">
                <tr>
                    <td>
                        <g:radio name="segmentPosition" value="FIRST" onclick="radioChangeRule();" checked="true"/>
                    </td>
                    <td>
                        First Segment
                    </td>
                </tr>
                <tr>
                    <td>
                        <g:radio name="segmentPosition" onclick="radioChangeRule();" value="LAST"/>
                    </td>
                    <td>
                        Last Segment
                    </td>
                </tr>
                <tr>
                    <td>
                        <g:radio name="segmentPosition" onclick="radioChangeRule();" value="ALL"/>
                    </td>
                    <td>
                        All Segments
                    </td>
                </tr>

                <tr>
                    <td>
                        <g:radio name="segmentPosition" onclick="radioChangeRule();" value="others"/>
                    </td>
                    <td>
                        Others
                    </td>
                </tr>
                <tr>
                    <td>

                    </td>
                    <td>
                        <g:textField name="segmentPositionNum" readonly="true" ></g:textField>
                    </td>
                </tr>
            </table>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <table style="display: none;background-color: #B0C4DE;border: 10px" id="hiddenMapT">
                    <tr>
                        <td><label>Conditions:</label></td>
                        <td><g:select name="mappingRuleConditions" noSelection="${['':'Conditions']}" optionKey="mappingRuleConditionsKey" optionValue="mappingRuleConditionsShow" from="${[[mappingRuleConditionsKey:'GREATERTHAN',mappingRuleConditionsShow: 'Greater Than'],[mappingRuleConditionsKey:'LESSTHAN',mappingRuleConditionsShow: 'Less Than'],[mappingRuleConditionsKey:'EQUALS',mappingRuleConditionsShow: 'Equals'],[mappingRuleConditionsKey:'CONTAINS',mappingRuleConditionsShow: 'Contains']]}"  value="" class="text_w"></g:select>
                            <g:textField name="conditionsValue" class="text_w"></g:textField></td>
                    </tr>

                    <tr>
                        <td> <label>Map Value: </label></td>
                        <td><g:textField name="mapValue" ></g:textField></td>
                    </tr>

                </table>
            </td>
        </tr>
    </table>

</div>
<div id="menudlg-buttons">
    <a id="createDivTreeMenu" href="#" class="btn btn-primary"  onclick="return updateRule();">${message(code: 'default.button.save.label', default: 'Save')}</a>
    <a href="#" class="btn"  onclick="closeEditRuleDlg();">${message(code: 'default.button.cancel.label', default: 'Cancel')}</a>
</div>


%{-------------------------------------------------------insert segment---------------------------------------------------------------------------------}%
<div id="insertSegment_dlg" title="Insert Template"
     class="easyui-dialog" style="width:550px;height:400px;padding:10px 20px"
     closed="true" buttons="#isnertSegmentdlg-buttons">
    <h2>${message(code: 'mappingRule.insertTemplate.label', default: 'Insert Template')}</h2>
    <hr>
    <table style="line-height: 10px">
        <tr>
            <td><label>${message(code: 'mappingRule.segment.label', default: 'Segment')}:</label></td>
            <td>
                %{--<input type="text" name="mappingRule_insertSegment_segment" id="mappingRule_insertSegment_segment"  required="true" readonly="">--}%
                <g:select name="mappingRule_insertSegment_segment" id="mappingRule_insertSegment_segment" from="${['NTE']}" noSelection="['':'Segment']"></g:select>
                <g:hiddenField name="insertSegment_tempalteId" id="insertSegment_tempalteId"></g:hiddenField>
            </td>
            <td>
                <div id ="mappingRule_insertSegment_segmentDiv" style="color: red"></div>
            </td>
        </tr>

        <tr id="insertSegment_field_tr">
            <td><label>${message(code: 'mappingRule.field.label', default: 'Field')}:</label></td>
            <td>
                <input type="text" name="mappingRule_insertSegment_field" id="mappingRule_insertSegment_field"  required="true">
            </td>
            <td>
                <div id ="mappingRule_insertSegment_fieldDiv" style="color: red"></div>
            </td>
        </tr>

        <tr id="insertSegment_fieldIndex_tr">
            <td><label>${message(code: 'mappingRule.fieldIndex.label', default: 'Field Index')}:</label></td>
            <td>
                <input type="text" name="mappingRule_insertSegment_fieldIndex" id="mappingRule_insertSegment_fieldIndex"  required="true">
            </td>
            <td>
                <div id ="mappingRule_insertSegment_fieldIndexDiv" style="color: red"></div>
            </td>
        </tr>


        <tr>
            <td><label>${message(code: 'mappingRule.required.label', default: 'Required')}:</label></td>
            <td><input type="checkbox" name="mappingRule_insertSegment_required" id="mappingRule_insertSegment_required" >
            </td>
        </tr>

        <tr>
            <td><label>${message(code: 'mappingRule.repeatable.label', default: 'Repeatable')}:</label></td>
            <td><input type="checkbox"   id="mappingRule_insertSegment_repeatable" >
            </td>
        </tr>

    </table>
</div>
<div id="isnertSegmentdlg-buttons">
    <a href="#" class="btn btn-primary"  onclick="return createTemplateSegment();">${message(code: 'default.button.save.label', default: 'Save')}</a>
    <a href="#" class="btn"  onclick="closeInsertSegment_dlg();">${message(code: 'default.button.cancel.label', default: 'Cancel')}</a>
</div>

%{-----------------------------------------------------------remove segment rule----------------------------------------------------------------------------------------------------------}%

<div id="deleteSegment_dlg" title="Blank Rule"
     class="easyui-dialog" style="width:550px;height:400px;padding:10px 20px"
     closed="true" buttons="#deleteSegmentdlg-buttons">
    <h2>${message(code: 'mappingRule.deleteSegment.label', default: 'Blank Rule')}</h2>
    <hr>
    <table style="line-height: 10px">
        <tr>
            <td><label>${message(code: 'mappingRule.segment.label', default: 'Segment Name')}:</label></td>
            <td>
                <input type="text" name="delSegmentRuleSegmentName" id="delSegmentRuleSegmentName"  required="true">
                %{--<g:hiddenField name="insertSegment_tempalteId" id="insertSegment_tempalteId"></g:hiddenField>--}%
                <g:hiddenField name="delSegmentRuleId" id="delSegmentRuleId"></g:hiddenField>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <g:radio name="delSegmentRule" value="FIRST" onclick="radioChange();" checked="true"/>
            </td>
            <td>
                First Segment
            </td>
        </tr>
        <tr>
            <td>
                <g:radio name="delSegmentRule" onclick="radioChange();" value="LAST"/>
            </td>
            <td>
                Last Segment
            </td>
        </tr>
        <tr>
            <td>
                <g:radio name="delSegmentRule" onclick="radioChange();" value="ALL"/>
            </td>
            <td>
                All Segments
            </td>
        </tr>

        <tr>
            <td>
                <g:radio name="delSegmentRule" onclick="radioChange();" value="others"/>
            </td>
            <td>
                Others
            </td>
        </tr>
        <tr>
            <td>

            </td>
            <td>
                <g:textField name="delSegmentRuleInput" ></g:textField>
            </td>
        </tr>
    </table>
</div>
<div id="deleteSegmentdlg-buttons">
    <a href="#" class="btn btn-primary"  onclick="return deleteSegmentRule();">${message(code: 'default.button.save.label', default: 'Save')}</a>
    <a href="#" class="btn"  onclick="closeDeleteSegment_dlg();">${message(code: 'default.button.cancel.label', default: 'Cancel')}</a>
</div>

%{---------------------------------------------------data grid-------------------------------------------------------------------------------------------------------------------}%
<div class="container-fluid span10">
    <div class="span12 divbk">
        <g:link  controller="mappingRule" action="list"><i class="icon-list"></i>Mapping Rule List</g:link>
        <a href="#" onclick="return openTemplateDialog();"><i class="icon-plus"></i>${message(code:'mapingRule.importTemplate.label',default:'Impoort Template')}</a>
        <a  href="#" onclick="return createMappingRuleGroup('c');"><i class="icon-plus"></i>${message(code:'mapingRule.createMappingRuleGroup.label',default:'Create Rule Group')}</a>
        <a  href="#" onclick="return openScripting();"><i class="icon-edit"></i>${message(code:'mapingRule.scripting.label',default:'Scripting')}</a>
    </div>
    <div class="span12">
        <div class="well">
            %{--<table id="seach-datagrid-show" class="easyui-datagrid"  title="Search Mapping RuleGroup" style="width:600px;height:400px">--}%

            %{--</table>--}%
            <table cellpadding=5px >
                <tr>
                    <td >Rule Group Name</td>
                    <td>
                        <g:textField name="mappingRuleGroupNameSearch" ></g:textField>
                    </td>
                </tr>
                <tr>

                    <td>Message Type</td>
                    <td><g:textField name="typeSearch"  value=""></g:textField></td>
                    <td>Active</td>
                    <td><g:checkBox name="activeIndSearch" checked = "true"></g:checkBox></td>
                </tr>
                <tr>

                    <td>From Application</td>
                    <td><g:textField name="fromApplicationSearch" value="" ></g:textField>
                    </td>
                    <td>To Application</td>
                    <td> <g:textField name="toApplicationSearch" value=""></g:textField></td>
                </tr>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <input type="button" class="btn btn-primary" value="Search" onclick = "return searchRuleGroup()">
                </td>
            </tr>
                <tr>

                    <td>Rule Group Result</td>
                    <td><g:textField name="mappingRuleGroupNameShow" readonly="true" value="${mappingRuleGroupData?mappingRuleGroupData.name+'-':''}${mappingRuleGroupData?mappingRuleGroupData.type:''}"></g:textField>
                    <g:hiddenField name="mappingRuleGroup.id" id="mappingRuleGroup.id"  readonly="true" value="${mappingRuleGroupData?mappingRuleGroupData.id:''}"/>
                    <g:hiddenField name="activeIndResult" value="${mappingRuleGroupData?mappingRuleGroupData.activeInd:''}" ></g:hiddenField>
                    <g:hiddenField name="commentsResult" value="${mappingRuleGroupData?mappingRuleGroupData.comments:''}"></g:hiddenField>
                    <g:hiddenField name="fromApplicationResultId" value="${mappingRuleGroupData?mappingRuleGroupData.fromApplication.id:''}"></g:hiddenField>
                    <g:hiddenField name="mappingRuleGroupNameResult" value="${mappingRuleGroupData?mappingRuleGroupData.name:''}"></g:hiddenField>
                    <g:hiddenField name="toApplicationResultId" value="${mappingRuleGroupData?mappingRuleGroupData.toApplication.id:''}"></g:hiddenField>
                    <g:hiddenField name="fromApplicationResultName1" value="${mappingRuleGroupData?mappingRuleGroupData.fromApplication.name:''}"></g:hiddenField>
                    <g:hiddenField name="fromApplicationResultName" value="${mappingRuleGroupData?mappingRuleGroupData.fromApplication:''}"></g:hiddenField>
                    <g:hiddenField name="toApplicationResultName" value="${mappingRuleGroupData?mappingRuleGroupData.toApplication:''}"></g:hiddenField>
                    <g:hiddenField name="toApplicationResultName1" value="${mappingRuleGroupData?mappingRuleGroupData.toApplication.name:''}"></g:hiddenField>
                    <g:hiddenField name="fromApplicationResultVersion" value="${mappingRuleGroupData?mappingRuleGroupData.toApplication.applicationVersion:''}"></g:hiddenField>
                    <g:hiddenField name="toApplicationResultVersion" value="${mappingRuleGroupData?mappingRuleGroupData.toApplication.applicationVersion:''}"></g:hiddenField>
                    </td>
                    <td>Application Result</td>
                    <td>
                        <g:hiddenField name="type"  value="${mappingRuleGroupData?mappingRuleGroupData.type:''}" readonly="true" />
                        <g:textField name="applicationShow"  value="${mappingRuleGroupData?mappingRuleGroupData.fromApplication:''}${mappingRuleGroupData?'->':''}${mappingRuleGroupData?mappingRuleGroupData.toApplication:''}" readonly="true"/>
                    </td>
                    <td>

                        <input type="button" class="btn btn-primary" value="Edit Rule Group" onclick = "return createMappingRuleGroup('e')">
                        <input type="button" class="btn btn-primary" value="Load" onclick = "return loadTemplateGrid();">
                    </td>
                </tr>
                <tr>

                    <td></td>
                    <td></td>
                    <td></td>
                    <td>

                    </td>
                </tr>


            </table>

            <br>
            <div>
                <table class="easyui-datagrid"  id="test" style="margin: 0 100px 0 0;" toolbar="#templateToolbar"></table>

            </div>
            <div id="templateToolbar">
                %{--<a href="#" class="easyui-linkbutton" style="margin: 0 10px 0 0;" iconCls="icon-edit" plain="true" onclick="editTemplateRow()">Edit</a>--}%
                <a href="#" class="easyui-linkbutton" style="margin: 0 10px 0 0;" iconCls="icon-save" plain="true" onclick="saveTemplateOption()">Save</a>
                <a href="#" class="easyui-linkbutton" style="margin: 0 30px 0 0;" iconCls="icon-reload" plain="true" onclick="recoverTemplateOption()">Revert</a>
                %{--<g:textField name='template_segment_search' /> <a href="#" class="easyui-linkbutton" iconCls="icon-search" style="margin: 0 300px 0 0;" plain="true" onclick="searchTemplate()">Search</a>--}%
                %{--<a href="#" class="easyui-linkbutton" style="margin: 0 30px 0 0;" iconCls="icon-no" plain="true" onclick="removeSegmentRule()">Remove&nbsp;Segment&nbsp;Rule</a>--}%
            </div>

            %{---------------------------------------------Rule group option---------------------------------------------------------------------------------------}%
            <div id="rule_ruleGroup_dlg" title="Rule Group"
                 class="easyui-dialog" style="width:650px;height:550px;padding:10px 20px"
                 closed="true" buttons="#rule_ruleGroupdlg-buttons">
                <h2>${message(code: 'mappingRule.ruleGroup.label', default: 'Rule Group')}</h2>
                <hr>
                <table>
                    <tr>
                        <td> <label class="control-label" ><g:message code="mappingRuleGroup.name.label" default="Name" /></label></td>
                        <td> <g:textField class="input-xlarge focused" name="ruleGroupOption_name" maxlength="128" value="" /><g:hiddenField name="ruleGroupOption_id" value=""></g:hiddenField>
                            <span class="help-inline">Required</span></td>
                    </tr>
                    <tr>
                        <td><label for="type" class="control-label"><g:message code="mappingRuleGroup.type.label" default="Type" /></label></td>
                        <td><g:select name="ruleGroupOption_type" from="${com.bssi.MappingRuleGroup.constraints.type.inList}" value="" valueMessagePrefix="mappingRuleGroup.type"  /> <span class="help-inline">Required</span></td>
                    </tr>
                    <tr>
                        <td> <label class="control-label"><g:message code="mappingRuleGroup.fromApplication.label" default="From Application" /></label></td>
                        <td>  <g:textField readonly="true" class="input-xlarge focused" placeholder="Click 'Add' to add a From Application!"  name="ruleGroupOption_fromApplicationShow" maxlength="128" value="" onclick="selectApplication(1);" /><a href="javascript:selectApplication(1)"><img src="${request.contextPath}/images/add.jpg">Select</a><a href="javascript:createApplication('f')"><img src="${request.contextPath}/images/add.jpg">New</a><a href="javascript:editApplication('f')"><img src="${request.contextPath}/images/add.jpg">Edit</a> <span class="help-inline">Required </span>
                            <g:hiddenField name="ruleGroupOption_fromApplication1" id="ruleGroupOption_fromApplication1" value=""></g:hiddenField>
                            <g:hiddenField name="ruleGroupOption_fromApplicationName" id="ruleGroupOption_fromApplicationName" value=""></g:hiddenField>
                            <g:hiddenField name="ruleGroupOption_fromApplicationVersion" id="ruleGroupOption_fromApplicationVersion" value=""></g:hiddenField>
                        </td>
                    </tr>
                    <tr>
                        <td><label class="control-label"><g:message code="mappingRuleGroup.toApplication.label" default="To Application" /></label></td>
                        <td><g:textField readonly="true" class="input-xlarge focused" placeholder="Click 'Add' to add a To Application!" name="ruleGroupOption_toApplicationShow" maxlength="128" value="" onclick="selectApplication(0);" /><a href="javascript:selectApplication(0)"><img src="${request.contextPath}/images/add.jpg">Select</a><a href="javascript:createApplication('t')"><img src="${request.contextPath}/images/add.jpg">New</a> <a href="javascript:editApplication('t')"><img src="${request.contextPath}/images/add.jpg">Edit</a> <span class="help-inline">Required </span>
                            <g:hiddenField name="ruleGroupOption_toApplication1" id="ruleGroupOption_toApplication1" value=""></g:hiddenField>
                            <g:hiddenField name="ruleGroupOption_toApplicationName" id="ruleGroupOption_toApplicationName" value=""></g:hiddenField>
                            <g:hiddenField name="ruleGroupOption_toApplicationVersion" id="ruleGroupOption_toApplicationVersion" value=""></g:hiddenField>
                        </td>
                    </tr>
                    <tr>
                        <td> <label class="control-label"><g:message code="mappingRuleGroup.comments.label" default="Comments" /></label></td>
                        <td><g:textArea name="rule_comments" cols="40" rows="5" value="" /></td>
                    </tr>
                    <tr>
                        <td><label  class="control-label"><g:message code="mappingRuleGroup.activeInd.label" default="Active" /></label></td>
                        <td><g:checkBox name="ruleGroupOption_activeInd" value="" checked="true" /></td>
                    </tr>
                </table>
            </div>
            <div id="rule_ruleGroupdlg-buttons">
                <a href="#" class="btn btn-primary"  onclick="return saveMappingRuleGroup();">${message(code: 'default.button.save.label', default: 'Save')}</a>
                <a href="#" class="btn"  onclick="closeMappingRuleGroup_dlg();">${message(code: 'default.button.cancel.label', default: 'Cancel')}</a>
            </div>

            %{------------------------------------------application option---------------------------------------------------------------------}%
            <div id="rule_application_dlg" title="Application"
                 class="easyui-dialog" style="width:500px;height:300px;padding:10px 20px"
                 closed="true" buttons="#rule_applicationdlg-buttons">
                <h2>${message(code: 'mappingRule.application.label', default: 'Application')}</h2>
                <hr>
                <table>
                    <tr>
                        <td> <label class="control-label" ><g:message code="application.name.label" default="Name" /></label></td>
                        <td>
                            <g:textField class="input-xlarge focused" name="applicationOption_name" maxlength="128" value="" />
                            <g:hiddenField class="input-xlarge focused" name="applicationOption_id" maxlength="128" value="" />
                            <g:hiddenField class="input-xlarge focused" name="fromToType"  value="" />
                            <span class="help-inline">Required</span></td>
                    </tr>

                    <tr>
                        <td> <label class="control-label"><g:message code="application.applicationVersion.label" default="Version" /></label></td>
                        <td><g:textField class="input-xlarge focused" name="applicationOption_version" maxlength="128" value=""  /></td>
                    </tr>

                </table>
            </div>
            <div id="rule_applicationdlg-buttons">
                <a href="#" class="btn btn-primary"  onclick="return saveApplication();">${message(code: 'default.button.save.label', default: 'Save')}</a>
                <a href="#" class="btn"  onclick="closeApplication_dlg();">${message(code: 'default.button.cancel.label', default: 'Cancel')}</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>