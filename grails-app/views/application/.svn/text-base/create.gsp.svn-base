

<%@ page import="com.bssi.Application" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'application.label', default: 'Application')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
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
    <div class="span12 divbk">
        <g:link  action="list"><i class="icon-list"></i><g:message code="default.list.label" args="[entityName]" /></g:link>
    </div>
    <g:if test="${flash.message}">
        <div class="message span12" style="color: red">${flash.message}</div>
    </g:if>
<div class="span12" >
    <g:form action="save"  class="form-horizontal">
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
                <g:submitButton name="create"  class="btn btn-primary" onclick="return checkForm();" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                <g:actionSubmit value="Cancel" name="cancel" action="list" class="btn"></g:actionSubmit>
            </div>
        </div>
        </div>
        </div>
    </g:form>
</body>
</html>
