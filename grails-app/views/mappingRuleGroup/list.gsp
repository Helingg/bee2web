
<%@ page import="com.bssi.MappingRuleGroup" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'mappingRuleGroup.label', default: 'Mapping RuleGroup')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>        
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <hr>

    <g:form method="post"  class="form-horizontal" >
        <div class="container-fluid span10">
            <div class="row-fluid">
                <div class="span3">
                    <div class="well sidebar-nav">
                        <ul class="nav nav-list">
                            <li class="nav-header">Option</li>
                            <li class="active"><g:link  action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link>
                        </ul>
                    </div>
                </div>

                <div class="span9">
                    <g:if test="${flash.message}">
                        <div class="message span9" style="color: red">${flash.message}</div>
                    </g:if>
                    <div class="well span8">
                        <div class="control-group">
                            <label class="control-label" for="name" ><g:message code="mappingRuleGroup.name.label" default="Name" /></label>
                            <div class="controls">
                                <g:textField class="input-xlarge focused" name="name" maxlength="128" value="${params?.name}" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="application" ><g:message code="mappingRuleGroup.application.label" default="application" /></label>
                            <div class="controls">
                                <g:textField class="input-xlarge focused" name="application" maxlength="128" value="${params?.application}" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="type" ><g:message code="mappingRuleGroup.type.label" default="Type" /></label>
                            <div class="controls">
                                <g:select name="type" from="${MappingRuleGroup.constraints.type.inList}" value="${params?.type}"  noSelection="${['':'-Choose Type-']}"  valueMessagePrefix="mappingRuleGroup.type"  />
                            </div>
                        </div>

                        <br>
                        <div class="control offset4">
                            <g:actionSubmit class="btn btn-primary" action="search" value="${message(code: 'default.button.search.label', default: 'Search')}" />
                        </div>
                        <br>
                        <div>
                            <table class="table table-condensed table-striped">
                                <thead>
                                <tr>

                                    <th>${message(code: 'mappingRuleGroup.id.label', default: 'Id')}</th>

                                    <th>${message(code: 'mappingRuleGroup.name.label', default: 'Name')}</th>

                                    <th>${message(code: 'mappingRuleGroup.type.label', default: 'Type')}</th>

                                    <th>${message(code: 'mappingRuleGroup.fromApplication.label', default: 'From Application')}</th>

                                    <th>${message(code: 'mappingRuleGroup.toApplication.label', default: 'To Application')}</th>

                                    <th>${message(code: 'mappingRuleGroup.comments.label', default: 'Comments')}</th>

                                    %{--<th>${message(code: 'mappingRuleGroup.dateCreated.label', default: 'Date Created')}</th>--}%

                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${mappingRuleGroupDataList}" status="i" var="mappingRuleGroupData">
                                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                                        <td><g:link action="show" id="${mappingRuleGroupData.id}">${fieldValue(bean: mappingRuleGroupData, field: "id")}</g:link></td>

                                        <td><g:link action="edit" id="${mappingRuleGroupData.id}">${fieldValue(bean: mappingRuleGroupData, field: "name")}</g:link></td>

                                        <td><g:link action="edit" id="${mappingRuleGroupData.id}">${fieldValue(bean: mappingRuleGroupData, field: "type")}</g:link></td>

                                        <td><g:link action="edit" id="${mappingRuleGroupData.id}">${fieldValue(bean: mappingRuleGroupData, field: "fromApplication")}</g:link></td>

                                        <td><g:link action="edit" id="${mappingRuleGroupData.id}">${fieldValue(bean: mappingRuleGroupData, field: "toApplication")}</g:link></td>

                                        <td>${fieldValue(bean: mappingRuleGroupData, field: "comments")}</td>

                                        %{--<td><g:formatDate date="${mappingRuleGroupData.dateCreated}" /></td>--}%

                                    </tr>
                                </g:each>
                                </tbody>
                            </table>
                            <div class="pager">
                                <g:paginate action="search" params="[name:params.name,type:params.type,application:params.application]" total="${mappingRuleGroupDataTotal}" />
                            </div
                        </div>

                    </div>

                </div>
            </div>
        </div>
        </div>
    </g:form>
    </body>
</html>
