
<%@ page import="com.bssi.ClientProvider" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'clientProvider.label', default: 'Client Provider')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />

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
                <g:if test="${flash.message}">
                    <div class="message span9" style="color: red">${flash.message}</div>
                </g:if>
                <div class="span9">
                    <div class="well">
                        <div class="control-group">
                            <label class="control-label" for="client" ><g:message code="clientProvider.client.label" default="Client" /></label>
                            <div class="controls">
                                <g:textField class="input-xlarge focused" name="client" maxlength="128" value="${params?.client}" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label for="provider" class="control-label"><g:message code="clientProvider.provider.label" default="Provider" /></label>
                            <div class="controls">
                                <g:textField class="input-xlarge focused" name="provider" maxlength="128" value="${params?.provider}" />
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

                                    <th><g:message code="clientProvider.Id.label" default="Id" /></th>

                                    <th><g:message code="clientProvider.client.label" default="Client" /></th>


                                    <th><g:message code="clientProvider.provider.label" default="Provider" /></th>

                                    <th><g:message code="clientProvider.clientProviderId.label" default="Client Provider Id" /></th>

                                    <th>${message(code: 'clientProvider.status.label', default: 'Status')}</th>

                                    <th>${message(code: 'clientProvider.activeInd.label', default: 'Active Ind')}</th>

                                    <th>${message(code: 'clientProvider.dateCreated.label', default: 'Date Created')}</th>


                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${clientProviderDataList}" status="i" var="clientProviderData">
                                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                        <td><g:link action="show" id="${clientProviderData.id}">${fieldValue(bean: clientProviderData, field: "id")}</g:link></td>

                                        <td><g:link action="edit" id="${clientProviderData.id}">${fieldValue(bean: clientProviderData, field: "client")}</g:link></td>


                                        <td><g:link action="edit" id="${clientProviderData.id}">${fieldValue(bean: clientProviderData, field: "provider")}</g:link></td>

                                        <td><g:link action="edit" id="${clientProviderData.id}">${fieldValue(bean: clientProviderData, field: "clientProvider")}</g:link></td>

                                        <td><g:link action="edit" id="${clientProviderData.id}">${fieldValue(bean: clientProviderData, field: "status")}</g:link></td>

                                        <td><g:link action="edit" id="${clientProviderData.id}"><g:checkBox name="" value="${clientProviderData.activeInd}" onclick="return false"></g:checkBox></g:link></td>

                                        <td><g:formatDate date="${clientProviderData.dateCreated}" /></td>

                                    </tr>
                                </g:each>
                                </tbody>
                            </table>
                            <div class="pager">
                                <g:paginate action="search" params = "[params:params]" total="${clientProviderDataTotal }" />
                            </div
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </g:form>
    </div>
    </body>
</html>
