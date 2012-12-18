
<%@ page import="com.bssi.ContactType" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="" />
    <g:set var="entityName" value="${message(code: 'luContactType.label', default: 'Lu Contact Type')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'divbk.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'bootstrap.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir:'js/themes/default',file:'easyui.css')}">
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery-1.7.2.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery.easyui.min.js')}"></script>
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <script type="text/javascript">
        function setContactTypeInfo(id,contactType,active){
            if(active=="true"){
                parent.window.opener.setContactType(id,contactType);
                top.close();
            }else{
                alert("The Contact Type "+contactType+" is inactive!")
            }

        }
        function closeWindow(){
            top.close();
        }
        function createContactType(){
            clearContactType();
            $("#contactTypeDlg").dialog("open");
        }
        function closeContactType(){
            clearContactType();
            $("#contactTypeDlg").dialog("close");
        }
        function clearContactType(){
            var contactType = document.getElementById("contactTypedlg");
            var description = document.getElementById("descriptiondlg");
            var activeInd = document.getElementById("activeInddlg");
            contactType.value="";
            description.value="";
            activeInd.checked=true;
        }
        function saveContactType(){
            var contactType = document.getElementById("contactTypedlg");
            var description = document.getElementById("descriptiondlg");
            var activeInd = document.getElementById("activeInddlg");
            if(!contactType.value){
                alert("Contact Type is null");
                contactType.focus();
                contactType.style.borderColor="red";
                return false;
            } else{
                contactType.style.borderColor="";
            }
            $.ajax({
                url:"${request.contextPath}/contactType/saveContactType",
                data:{contactType:contactType.value,description:description.value,activeInd:activeInd.checked},
                success:function(msg){
                    if(msg){
                        alert(msg)
                    }else{
                        closeContactType();
                        window.location.reload();
                    }
                }
            })
            return true;
        }
    </script>
</head>
<body>
<h1><g:message code="default.list.label" args="[entityName]" /></h1>
<hr>

<g:form method="post"  class="form-horizontal" >
    <div class="container-fluid span10">
        <div class="span12 divbk">
            <g:link onclick="closeWindow();"><i class="icon-remove"></i><g:message code="default.close.label" args="[entityName]" /></g:link>
            <a href="#" onclick="createContactType();"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></a>
        </div>
        <g:if test="${flash.message}">
            <div class="message span12" style="color: red">${flash.message}</div>
        </g:if>
        <div class="span10">
            <div class="well ">

                <div class="control-group">
                    <label class="control-label" for="contactType" ><g:message code="luContactType.contactType.label" default="Contact Type" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="contactType" maxlength="128" style="height:30px" value="${params?.contactType}" />
                    </div>
                </div>

                %{--<div class="control-group">--}%
                %{--<label class="control-label" for="activeInd" ><g:message code="luAddrType.activeInd.label" default="Enabled" /></label>--}%
                %{--<div class="controls">--}%
                %{--<g:checkBox name="activeInd" checked="true" value="${params?.activeInd}"></g:checkBox>--}%
                %{--</div>--}%
                %{--</div>--}%

                <br>
                <div class="control offset4">
                    <g:actionSubmit class="btn btn-primary" action="selectContactType" value="${message(code: 'default.button.search.label', default: 'Search')}" />
                </div>

                <br>
                <div>
                    <table class="table table-condensed table-striped">
                        <thead>
                        <tr>


                            <th>${message(code: 'luContactType.contactType.label', default: 'Contact Type')}</th>

                            <th>${message(code: 'luContactType.description.label', default: 'Description')}</th>

                            <th>${message(code: 'luContactType.activeInd.label', default: 'Active Ind')}</th>

                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${luContactTypeDataList}" status="i" var="luContactTypeData">
                            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">


                                <td><a href="#" onclick="setContactTypeInfo('${luContactTypeData.id}','${luContactTypeData.contactType}','${luContactTypeData.activeInd}');">${fieldValue(bean: luContactTypeData, field: "contactType")}</a></td>

                                <td><a href="#" onclick="setContactTypeInfo('${luContactTypeData.id}','${luContactTypeData.contactType}','${luContactTypeData.activeInd}');">${fieldValue(bean: luContactTypeData, field: "description")}</a></td>

                                <td><a hreflang="#" onclick="setContactTypeInfo('${luContactTypeData.id}','${luContactTypeData.contactType}','${luContactTypeData.activeInd}');"><g:checkBox name="" value="${luContactTypeData.activeInd}" onclick="return false"/></a></td>

                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                    <div class="pager">
                        <g:paginate action ="selectContactType" params="[activeInd:params.activeInd,contactType:params.contactType,description:params.description]" total="${luContactTypeDataTotal}" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</g:form>
<div id="contactTypeDlg" title="Provider"
     class="easyui-dialog" style="width:500px;height:400px;padding:10px 20px"
     closed="true" buttons="#contactTypeDlg-buttons">
    <h2>${message(code: 'contactType.label', default: 'Contact Type')}</h2>
    <hr>
    <table>
        <tr>
            <td> <label  for="contactTypedlg" ><g:message code="luContactType.contactType.label" default="Contact Type" /></label></td>
            <td> <g:textField class=" text_h" name="contactTypedlg" maxlength="4" value="" /> <span class="help-inline">Required</span></td>
        </tr>

        <tr>
            <td>  <label  for="descriptiondlg" ><g:message code="luContactType.description.label" default="Description" /></label></td>
            <td>  <g:textField class="text_h" name="descriptiondlg" maxlength="128" value="" /></td>
        </tr>

        <tr>
            <td>   <label class="control-label" for="activeInddlg" ><g:message code="luContactType.activeInd.label" default="Enabled" /></label></td>
            <td>    <g:checkBox name="activeInddlg" value="" checked="true"></g:checkBox></td>
        </tr>

    </table>
</div>
<div id="contactTypeDlg-buttons">
    <input type="button" value="Save" class="btn btn-primary" onclick="return saveContactType();">
    <input type="button" value="Cancel" class="btn" onclick="closeContactType();">
</div>
</body>
</html>
