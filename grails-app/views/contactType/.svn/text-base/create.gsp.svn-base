

<%@ page import="com.bssi.ContactType" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'luContactType.label', default: 'Lu Contact Type')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>

    <script type="text/javascript">
        function checkForm(){
            var contactType = document.getElementById('contactType');
            if(contactType.value==null||contactType.value==""){
                alert("Contact Type can not be blank!");
                contactType.style.borderColor='red';
                contactType.focus();
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<h1><g:message code="default.create.label" args="[entityName]" /></h1>
<hr>
%{--<g:if test="${flash.message}">--}%
%{--<div class="message span10 offset9" style="color: red">${flash.message}</div>--}%
%{--</g:if>--}%
%{--<g:hasErrors bean="${luContactTypeData}">--}%
%{--<div class="errors">--}%
%{--<g:renderErrors bean="${luContactTypeData}" as="list" />--}%
%{--</div>--}%
%{--</g:hasErrors>--}%

<div class="container-fluid span12">
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
            <label class="control-label" for="contactType" ><g:message code="luContactType.contactType.label" default="contactType" /></label>
            <div class="controls">
                <g:textField class="input-xlarge focused" name="contactType" maxlength="4" value="${luContactTypeData?.contactType}" /> <span class="help-inline">Required</span>
            </div>
        </div>

        <div class="control-group">
            <label class="control-label" for="description" ><g:message code="luContactType.description.label" default="Description" /></label>
            <div class="controls">
                <g:textField class="input-xlarge focused" name="description" maxlength="128" value="${luContactTypeData?.description}" />
            </div>
        </div>

        <div class="control-group">
            <label class="control-label" for="activeInd" ><g:message code="luContactType.activeInd.label" default="Enabled" /></label>
            <div class="controls">
                <g:checkBox name="activeInd" checked="true" value="${luContactTypeData?.activeInd}"></g:checkBox>
            </div>
        </div>


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
