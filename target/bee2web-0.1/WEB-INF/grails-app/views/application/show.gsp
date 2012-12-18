
<%@ page import="com.bssi.Application" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'application.label', default: 'Application')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
    <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
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
                <label class="control-label"><g:message code="application.name.label" default="Name" />:</label>
                <div class="controls">
                    <label class="control-label">${applicationData?.name}</label>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" ><g:message code="application.applicationVersion.label" default="Version" />:</label>
                <div class="controls">
                    <label class="control-label">${applicationData?.applicationVersion}</label>
                </div>
            </div>
            %{--<div class="control-group">--}%

                %{--<label class="control-label" ><g:message code="application.servicePack.label" default="Service Pack" />:</label>--}%
                %{--<div class="controls">--}%
                    %{--<label class="control-label">${applicationData?.servicePack}</label>--}%
                %{--</div>--}%
            %{--</div>--}%
            %{--<div class="control-group">--}%
            %{--<label class="control-label" ><g:message code="application.type.label" default="Type" />:</label>--}%
            %{--<div class="controls">--}%
            %{--<label class="control-label">--}%
            %{--<g:if test="${applicationData.type==true}">--}%
            %{--From--}%
            %{--</g:if>--}%
            %{--<g:else>--}%
            %{--To--}%
            %{--</g:else>--}%
            %{--</label>--}%
            %{--</div>--}%
            %{--</div>--}%
            <div class="offset3">
                <g:actionSubmit name="edit" action="edit" class="btn btn-primary" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
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
