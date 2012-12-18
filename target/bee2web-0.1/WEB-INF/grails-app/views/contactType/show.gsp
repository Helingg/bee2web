
<%@ page import="com.bssi.ContactType" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'luContactType.label', default: 'Lu Contact Type')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />

    </head>
    <body>
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
<hr>

%{--<g:hasErrors bean="${luContactTypeData}">--}%
    %{--<div class="errors">--}%
        %{--<g:renderErrors bean="${luContactTypeData}" as="list" />--}%
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
    <g:form  class="form-horizontal">
        <g:hiddenField name="id" value="${luContactTypeData?.id}" />
        <g:hiddenField name="version" value="${luContactTypeData?.version}" />
        <div class="well">
            <div class="control-group">
                <label class="control-label"  ><g:message code="luContactType.contactType.label" default="Contact Type" />:</label>
                <div class="controls">
                    <label class="control-label"  >${fieldValue(bean: luContactTypeData, field: "contactType")}</label>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label"  ><g:message code="luContactType.description.label" default="Description" />:</label>
                <div class="controls">
                    <label class="control-label"  >${fieldValue(bean: luContactTypeData, field: "description")}</label>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label"  ><g:message code="luContactType.activeInd.label" default="Enabled" />:</label>
                <div class="controls">
                    <label class="control-label"  ><g:checkBox name="" value="${luContactTypeData.activeInd}" onclick="return false"/></label>
                </div>
            </div>


            <div class="offset3">
                <g:actionSubmit name="edit" action="edit"  class="btn btn-primary"  value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
                <g:actionSubmit class="btn btn-danger" action="delete"  value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                <g:actionSubmit value="Cancel" name="cancel" action="list" class="btn"></g:actionSubmit>
            </div>
        </div>
        </div>
        </div>
    </g:form>
</div>
    </body>
</html>
