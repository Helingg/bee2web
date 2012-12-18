
<%@ page import="com.bssi.ClientAddress" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'clientAddress.label', default: 'Client Address')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

    </head>
    <body>        
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <hr>

    <g:form method="post"  class="form-horizontal" >
        <div class="container-fluid span10">
<div class="span12 divbk">
        <g:link  action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link>
        </div>
        <g:if test="${flash.message}">
            <div class="message span12" style="color: red">${flash.message}</div>
        </g:if>
        <div class="span12">

            <div class="well">

                <div class="control-group">
                    <label class="control-label" for="client" ><g:message code="clientAddress.client.label" default="Client" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="client" maxlength="128" value="${params?.client}" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="addr" ><g:message code="clientAddress.addr.label" default="Address" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="addr" maxlength="128" value="${params?.addr}" />
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

                            <th>${message(code: 'clientAddress.id.label', default: 'Id')}</th>

                            <th><g:message code="clientAddress.client.label" default="Client" /></th>


                            <th><g:message code="clientAddress.addr.label" default="Address" /></th>

                            <th><g:message code="clientAddress.addrType.label" default="Address Type" /></th>

                            <th><g:message code="clientAddress.activeInd.label" default="Active" /></th>


                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${clientAddressDataList}" status="i" var="clientAddressData">
                            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                                <td><g:link action="show" id="${clientAddressData.id}">${fieldValue(bean: clientAddressData, field: "id")}</g:link></td>

                                <td><g:link action="edit" id="${clientAddressData.id}">${fieldValue(bean: clientAddressData, field: "client")}</g:link></td>

                                <td><g:link action="edit" id="${clientAddressData.id}">${fieldValue(bean: clientAddressData, field: "addr")}</g:link></td>

                                <td><g:link action="edit" id="${clientAddressData.id}">${fieldValue(bean: clientAddressData, field: "addrType")}</g:link></td>

                                <td><g:link action="edit" id="${clientAddressData.id}"><g:checkBox name="show" value="${clientAddressData.activeInd}" onclick="return false"/></g:link></td>

                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                    <div class="pager">
                        <g:paginate action="search" params="[params:params]" total="${clientAddressDataTotal}" />
                    </div>
                </div>
            </div>
        </div>
    </g:form>
    </div>
    </body>
</html>
