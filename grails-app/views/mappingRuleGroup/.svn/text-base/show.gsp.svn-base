
<%@ page import="com.bssi.MappingRuleGroup" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'mappingRuleGroup.label', default: 'Mapping Rule Group')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>        
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
    <hr>

    %{--<g:hasErrors bean="${mappingRuleGroupData}">--}%
        %{--<div class="errors">--}%
            %{--<g:renderErrors bean="${mappingRuleGroupData}" as="list" />--}%
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

        <div class="span9" >
            <g:if test="${flash.message}">
                <div class="message span9" style="color: red">${flash.message}</div>
            </g:if>
            <g:form method="post"  class="form-horizontal">
                <g:hiddenField name="id" value="${mappingRuleGroupData?.id}" />
                <g:hiddenField name="version" value="${mappingRuleGroupData?.version}" />
                <div class="well span9">
                    <div class="control-group">
                        <label class="control-label"><g:message code="mappingRuleGroup.name.label" default="Name" />:</label>
                        <div class="controls">
                            <label class="control-label">${mappingRuleGroupData?.name}</label>
                        </div>
                    </div>
                    <div class="control-group">
                        <label  class="control-label"><g:message code="mappingRuleGroup.type.label" default="Type" />:</label>
                        <div class="controls">
                            <label class="control-label">${mappingRuleGroupData?.type}</label>
                        </div>
                    </div>
                    <div class="control-group">
                        <label  class="control-label"><g:message code="mappingRuleGroup.fromApplication.label" default="From Application" />:</label>
                        <div class="controls">
                            <label class="control-label">${mappingRuleGroupData?.fromApplication}</label>
                        </div>
                    </div>
                    <div class="control-group">
                        <label  class="control-label"><g:message code="mappingRuleGroup.toApplication.label" default="To Application" />:</label>
                        <div class="controls">
                            <label class="control-label">${mappingRuleGroupData?.toApplication}</label>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label"><g:message code="mappingRuleGroup.comments.label" default="Comments" />:</label>
                        <div class="controls">
                            <label class="control-label">${mappingRuleGroupData?.comments}</label>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label"><g:message code="mappingRuleGroup.activeInd.label" default="Enabled" />:</label>
                        <div class="controls">
                            <label class="control-label"> <g:checkBox name="activeInd" value="${mappingRuleGroupData?.activeInd}" onclick="return false;"/></label>
                        </div>
                    </div>

                    <div >
                        <hr>
                        <div class="offset3">
                            <g:actionSubmit name="edit" action="edit" class="btn btn-primary" value="${message(code: 'default.button.edit.label', default: 'Update')}" />
                            <g:actionSubmit class="btn btn-danger"  action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                            <g:actionSubmit value="Cancel" name="cancel" action="list" class="btn"></g:actionSubmit>
                        </div>
                    </div>
                </div>

                </div>
            </g:form>
        </div>
        </div>
    </body>
</html>
