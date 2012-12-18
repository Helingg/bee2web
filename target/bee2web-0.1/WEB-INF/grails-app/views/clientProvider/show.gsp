
<%@ page import="com.bssi.ClientProvider" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'clientProvider.label', default: 'Client Provider')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>

    </head>

    <body>        
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <hr>

    <g:hasErrors bean="${clientProviderData}">
        <div class="errors">
            <g:renderErrors bean="${clientProviderData}" as="list" />
        </div>
    </g:hasErrors>

    <div class="container-fluid span10">
    <div class="row-fluid">
        <div class="span3">
            <div class="well sidebar-nav">
                <ul class="nav nav-list">
                    <li class="nav-header">Option</li>
                    <li class="active"><g:link  action="list"><i class="icon-home"></i><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                    <li class="active"><g:link   action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link>
                </ul>
            </div>
        </div>
    <div class="span9" >
         <g:if test="${flash.message}">
        <div class="message span9" style="color: red">${flash.message}</div>
    </g:if>
        <g:form method="post" class="form-horizontal">
            <g:hiddenField name="id" value="${clientProviderData?.id}" />
            <g:hiddenField name="version" value="${clientProviderData?.version}" />
            <g:hiddenField name="providerNum" value="${providerInstanceTotal}"></g:hiddenField>
            <g:hiddenField name="clientNum" value="${clientDataTotal}"></g:hiddenField>
            <div class="well span9">
                <div class="control-group">
                    <label class="control-label" ><g:message code="clientProvider.status.label" default="Status" />:</label>
                    <div class="controls">
                        <label class="control-label" >${clientProviderData?.status}</label>
                    </div>
                </div>
                <div class="control-group">
                    <label  class="control-label"><g:message code="client.activeInd.label" default="Enabled" />:</label>
                    <div class="controls">
                        <label class="control-label" ><g:checkBox name="" onclick="return false;" value="${clientProviderData?.activeInd}" /></label>
                    </div>
                </div>

                <div >
                    <hr>
                    <div>
                        <font size="3" color="#279745" style="margin: 0 160px 0 0"><g:message  code="client.message.lable" /></font>
                    </div>

                    <div id="clientDiv" >
                        <table id="clientTable" class="table table-condensed table-striped">
                            <th>${message(code: 'client.name.label', default: 'Name')}</th>

                            <th>${message(code: 'client.alias.label', default: 'Alias')}</th>


                            <th>${message(code: 'client.activeInd.label', default: 'Enabled')}</th>

                            %{--<th>Delete</th>--}%
                            <tbody>

                            <g:each in="${clientDataList}" status="i" var="clientData">
                                <tr id="stoBeDelRow<%=i+1%>">
                                    <td>${clientData.name}<g:hiddenField name="client" value="${clientData.id}"></g:hiddenField></td>
                                    <td>${clientData.alias}</td>
                                    <td>${clientData.activeInd}</td>
                                    %{--<td><a href="javascript:ExistDeleteClientRow(<%=i+1%>,${clientData.id});">${message(code: 'd.del.label', default: 'delete')}</a></td>--}%
                                </tr>
                            </g:each>

                            </tbody>
                        </table>
                    </div>
                    <hr>
                    <div>
                        <font size="3" color="#279745" style="margin: 0 142px 0 0"><g:message  code="provider.message.lable" /></font>
                    </div>

                    <div id="providerDiv" >
                        <table id="providerTable" class="table table-condensed table-striped">
                            <th>${message(code: 'provider.NPI.label', default: 'NPI')}</th>

                            <th>${message(code: 'provider.firstName.label', default: 'First Name')}</th>

                            <th>${message(code: 'provider.lastName.label', default: 'Last Name')}</th>

                            <th>${message(code: 'provider.middleName.label', default: 'Middle Name')}</th>

                            <th>${message(code: 'clientProvider.clientProviderId.label', default: 'Client Provider Id')}</th>

                            %{--<th>Delete</th>--}%
                            <tbody>
                            <g:each in="${providerInstanceList}" status="i" var="providerInstance">
                                <tr id="ptoBeDelRow<%=i+1%>">
                                    <td>${providerInstance[1]}<g:hiddenField name="provider" value="${providerInstance[0]}"></g:hiddenField></td>
                                    <td>${providerInstance[2]}</td>
                                    <td>${providerInstance[3]}</td>
                                    <td>${providerInstance[4]}</td>
                                    <td>${providerInstance[5]}</td>
                                    %{--<td><a href="javascript:ExistDeleteProviderRow(<%=i+1%>,${providerInstance[0]});">${message(code: 'd.del.label', default: 'delete')}</a></td>--}%
                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                    </div>
                </div>
                <hr>
                <div class="offset3">
                    <g:actionSubmit name="edit"  class="btn btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
                    <span class="button"><g:actionSubmit  class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <g:actionSubmit value="Cancel" name="cancel" action="list" class="btn"></g:actionSubmit>

                </div>
            </div>
            </div>

            </div>
        </g:form>
    </div>

    </body>
</html>
