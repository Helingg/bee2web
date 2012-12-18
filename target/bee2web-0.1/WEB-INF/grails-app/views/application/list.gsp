
<%@ page import="com.bssi.Application" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'application.label', default: 'Application')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
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
                        <li class="active"><g:link  action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </div>
            <g:if test="${flash.message}">
                <div class="message span9" style="color: red">${flash.message}</div>
            </g:if>
            <div class="span9">

                <div class="well">
                    <div class="control-group">
                        <label class="control-label" for="name" ><g:message code="application.name.label" default="Name" /></label>
                        <div class="controls">
                            <g:textField class="input-xlarge focused" name="name" maxlength="128" value="${params?.name}" />
                        </div>
                    </div>

                    %{--<div class="control-group">--}%
                    %{--<label class="control-label" for="type" ><g:message code="application.type.label" default="Type" /></label>--}%
                    %{--<div class="controls">--}%
                    %{--<g:select name="type" value="${params?.type}" optionKey="type" optionValue="typeshow" from="${[[type:true,typeshow:'From'],[type:false,typeshow:'To']]}"--}%
                    %{--noSelection="${['':'-Type-']}"></g:select>--}%
                    %{--</div>--}%
                    %{--</div>--}%
                    <br>
                    <div class="control offset4">
                        <g:actionSubmit class="btn btn-primary"  action="search" value="${message(code: 'default.button.search.label', default: 'Search')}" />
                    </div>
                    <br>
                    <div>
                        <table class="table table-condensed table-striped">
                            <thead>
                            <tr>

                                <th>${message(code: 'application.id.label', default: 'Id')}</th>

                                <th>${message(code: 'application.name.label', default: 'Name')}</th>

                                <th>${message(code: 'application.applicationVersion.label', default: 'Application Version')}</th>

                                %{--<th>${message(code: 'application.servicePack.label', default: 'Service Pack')}</th>--}%

                                %{--<th>${message(code: 'application.type.label', default: 'Type')}</th>--}%

                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${applicationDataList}" status="i" var="applicationData">
                                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                                    <td><g:link action="show" id="${applicationData.id}">${fieldValue(bean: applicationData, field: "id")}</g:link></td>

                                    <td><g:link action="edit" id="${applicationData.id}">${fieldValue(bean: applicationData, field: "name")}</g:link></td>

                                    <td><g:link action="edit" id="${applicationData.id}">${fieldValue(bean: applicationData, field: "applicationVersion")}</g:link></td>

                                    %{--<td><g:link action="edit" id="${applicationData.id}">${fieldValue(bean: applicationData, field: "servicePack")}</g:link></td>--}%

                                    %{--<td> <g:if test="${applicationData.type==true}">--}%
                                    %{--From--}%
                                    %{--</g:if>--}%
                                    %{--<g:else>--}%
                                    %{--To--}%
                                    %{--</g:else>--}%
                                    %{--</td>--}%

                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                        <div class="pager">
                            <g:paginate action="search" params="[params:params]" total="${applicationDataTotal}" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</g:form>
</body>
</html>
