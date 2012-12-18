
<%@ page import="com.bssi.ClientContact" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'clientContact.label', default: 'Client Contact')}" />
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
       <li class="active"><g:link  action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link></li>
        </ul>
            </div>
        </div>
        <div class="span9">
            <g:if test="${flash.message}">
                <div class="message span9" style="color: red">${flash.message}</div>
            </g:if>
            <div class="well span8">

                <div class="control-group">
                    <label class="control-label" for="firstName" ><g:message code="clientContact.firstName.label" default="First Name" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="firstName" maxlength="128" value="${params?.firstName}" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="lastName" ><g:message code="clientContact.lastName.label" default="Last Name" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="lastName" maxlength="128" value="${params?.lastName}" />
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="middleName" ><g:message code="clientContact.middleName.label" default="Middle Name" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="middleName" maxlength="128" value="${params?.middleName}" />
                    </div>
                </div>
                <br>
                <div class="control offset4">
                    <g:actionSubmit class="btn btn-primary"  action="search" value="${message(code: 'default.button.search.label', default: 'Search')}" />
                </div>
                <br>
                <div>
                    <table class="table table-condensed table-striped">
                        <thead>
                        <tr>

                            <th>${message(code: 'clientContact.id.label', default: 'Id')}</th>

                            <th>${message(code: 'clientContact.firstName.label', default: 'First Name')}</th>

                            <th>${message(code: 'clientContact.lastName.label', default: 'Last Name')}</th>

                            <th>${message(code: 'clientContact.middleName.label', default: 'Middle Name')}</th>

                            <th><g:message code="clientContact.addr.label" default="Address" /></th>

                            <th><g:message code="clientContact.client.label" default="Client" /></th>

                            <th><g:message code="clientContact.contactType.label" default="Contact Type" /></th>

                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${clientContactDataList}" status="i" var="clientContactData">
                            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                                <td><g:link action="show" id="${clientContactData.id}">${fieldValue(bean: clientContactData, field: "id")}</g:link></td>

                                <td><g:link action="edit" id="${clientContactData.id}">${fieldValue(bean: clientContactData, field: "firstName")}</g:link></td>

                                <td><g:link action="edit" id="${clientContactData.id}">${fieldValue(bean: clientContactData, field: "lastName")}</g:link></td>

                                <td><g:link action="edit" id="${clientContactData.id}">${fieldValue(bean: clientContactData, field: "middleName")}</g:link></td>

                                <td>${fieldValue(bean: clientContactData, field: "addr")}</td>

                                <td>${fieldValue(bean: clientContactData, field: "client")}</td>

                                <td>${fieldValue(bean: clientContactData, field: "contactType")}</td>

                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                    <div class="pager">
                        <g:paginate action="search" params = "[params:params]" total="${clientContactDataTotal}" />
                    </div>
                </div>
            </div>
        </div>
    </g:form>
    </div>
    </div>
    </body>
</html>
