
<%@ page import="com.bssi.ProviderType" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'providerType.label', default: 'Provider Type')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<h1><g:message code="default.show.label" args="[entityName]" /></h1>
<hr>

<div class="container-fluid span10">
<div class="span12 divbk">
    <g:link  action="list"><i class="icon-list"></i><g:message code="default.list.label" args="[entityName]" /></g:link>
    <g:link  action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link>
</div>
<g:if test="${flash.message}">
    <div class="message span12" style="color: red">${flash.message}</div>
</g:if>
<div class="span12" >

<g:form action="save"  class="form-horizontal">
    <g:hiddenField name="id" value = "${providerTypeData.id}"></g:hiddenField>
    <div class="well">
        <div class="control-group">
            <label  class="control-label"><g:message code="providerType.type.label" default="Provider Type" /></label>
            <div class="controls">
                <label  class="control-label">${providerTypeData?.type}</label>
            </div>
        </div>
        <div class="control-group">
            <label  class="control-label" ><g:message code="providerType.conmments.label" default="Conmments" /></label>
            <div class="controls">
                <label  class="control-label" >${providerTypeData?.conmments}</label>
            </div>
        </div>
        <hr>
        <div class="offset3">
            <g:actionSubmit name="create" action="edit"  class="btn btn-primary" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
        <g:actionSubmit class="btn btn-danger"  action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
            <g:actionSubmit value="Cancel" name="cancel" action="list" class="btn"></g:actionSubmit>
        </div>
    </div>
    </div>
    </div>
</g:form>
</body>
</html>
