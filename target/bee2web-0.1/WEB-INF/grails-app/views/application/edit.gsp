

<%@ page import="com.bssi.Application" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'application.label', default: 'Application')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
    <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
    <script type="text/javascript">
        function checkForm(){
            var name = document.getElementById('name');
            var applicationVersion = document.getElementById('applicationVersion');
//            var servicePack = document.getElementById('servicePack');
            if(!name.value){
                alert("Name can not be blank!");
                name.style.borderColor='red';
                name.focus();
                return false;
            }
            return true;
        }
    </script>
</head>
<body>

<h1><g:message code="default.create.label" args="[entityName]" /></h1>
<hr>

%{--<g:hasErrors bean="${applicationData}">--}%
%{--<div class="errors">--}%
%{--<g:renderErrors bean="${applicationData}" as="list" />--}%
%{--</div>--}%
%{--</g:hasErrors>--}%

<div class="container-fluid span10">
<div class="row-fluid">
    <div class="span3">
        <div class="well sidebar-nav">
            <ul class="nav nav-list">
                <li class="nav-header">Option</li>
                <li class="active"><g:link  action="list"><i class="icon-home"></i><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li class="active"><g:link  action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
    </div>
    <g:if test="${flash.message}">
        <div class="message span9" style="color: red">${flash.message}</div>
    </g:if>
<div class="span9" >
    <g:form method="post"  class="form-horizontal">
        <g:hiddenField name="id" value="${applicationData?.id}"></g:hiddenField>
        <g:hiddenField name="version" value="${applicationData?.version}"></g:hiddenField>
        <div class="well">
            <div class="control-group">
                <label class="control-label" for="name"><g:message code="application.name.label" default="Name" /></label>
                <div class="controls">
                    <g:textField class="input-xlarge focused" name="name" maxlength="128" value="${applicationData?.name}" /><span class="help-inline">Required</span>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="applicationVersion"><g:message code="application.applicationVersion.label" default="Version" /></label>
                <div class="controls">
                    <g:textField name="applicationVersion" class="input-xlarge focused" maxlength="128" value="${applicationData?.applicationVersion}" />
                </div>
            </div>
            %{--<div class="control-group">--}%
                %{--<label class="control-label" for="servicePack"><g:message code="application.servicePack.label" default="Service Pack" /></label>--}%
                %{--<div class="controls">--}%
                    %{--<g:textField name="servicePack" class="input-xlarge focused" maxlength="128" value="${applicationData?.servicePack}" />--}%
                %{--</div>--}%
            %{--</div>--}%
            %{--<div class="control-group">--}%
            %{--<label class="control-label" for="type"><g:message code="application.type.label" default="Type" /></label>--}%
            %{--<div class="controls">--}%
            %{--<g:select name="type" value="${applicationData?.type}" optionKey="type" optionValue="typeshow" from="${[[type:true,typeshow:'From'],[type:false,typeshow:'To']]}"></g:select>--}%
            %{--</div>--}%
            %{--</div>--}%
            <div class="offset3">
                <g:actionSubmit name="update" action="update" class="btn btn-primary" onclick="return checkForm();" value="${message(code: 'default.button.update.label', default: 'Update')}" />
            <g:actionSubmit class="btn btn-danger"  action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                <g:actionSubmit value="Cancel" name="cancel" action="list" class="btn"></g:actionSubmit>
            </div>
        </div>
        </div>
        </div>
    </g:form>
</div>
</body>
</html>
