
<%@ page import="com.bssi.Client" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <hr>

    <g:hasErrors bean="${clientData}">
        <div class="errors">
            <g:renderErrors bean="${clientData}" as="list" />
        </div>
    </g:hasErrors>
    <div class="container-fluid span10">
    <div class="row-fluid">
    <div class="span3">
        <div class="well sidebar-nav">
            <ul class="nav nav-list">
                <li class="nav-header">Option</li>
                <li class="active"><g:link  action="list"><i class="icon-home"></i><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li class="active"><g:link  action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link> </li>
                %{--<li class="active"><g:link controller="provider"  action="create"><i class="icon-plus"></i>New Provider</g:link> </li>--}%
            </ul>
        </div>
    </div>
        <g:if test="${flash.message}">
            <div class="message span9" style="color: red">${flash.message}</div>
        </g:if>
    <div class="span9" >

    <g:form method="post" class="form-horizontal">
        <g:hiddenField name="id" value="${clientData?.id}" />
        <g:hiddenField name="version" value="${clientData?.version}" />
        <div class="well">
            <div class="control-group">
                <label class="control-label" ><g:message code="facility.name.label" default="Name" />:</label>
                <div class="controls">
                   <label class="control-label" > ${clientData?.name}</label>
                </div>
            </div>
            <div class="control-group">
                <label  class="control-label"><g:message code="client.alias.label" default="Alias" />:</label>
                <div class="controls">
                    <label  class="control-label">${clientData?.alias}</label>
                </div>
            </div>
            <div class="control-group">
                <label for="activeInd" class="control-label"><g:message code="client.activeInd.label" default="ActiveInd" />:</label>
                <div class="controls">
                    <label  class="control-label"><g:checkBox  class="input-xlarge focused" name="activeInd" maxlength="128" value="${clientData?.activeInd}" onclick="return false;"/></label>
                </div>
            </div>

            <div >
                <hr>
                <div>
                    <font size="3" color="#279745" style="margin: 0 142px 0 0"><g:message  code="provider.message.lable" /></font>
                </div>

                <div id="providerDiv" >
                    <table id="providerTable" class="table table-condensed table-striped">
                        <th>${message(code: 'provider.NPI.label', default: 'NPI')}</th>

                        <th>${message(code: 'provider.name.label', default: 'Provider Name')}</th>

                        <th>${message(code: 'provider.clientProvider.label', default: 'Client Provider Id')} </th>

                        <th>${message(code: 'provider.status.label', default: 'Status')} </th>

                        <th>${message(code: 'provider.activeInd.label', default: 'Active')} </th>

                        <tbody>
                        <g:each in="${providerInstanceList}" status="i" var="providerInstance">
                            <tr id="toBeDelRow<%=i+1%>">
                                <td>${providerInstance[1]}</td>
                                <td>${providerInstance[2]} ${providerInstance[4]} ${providerInstance[3]}</td>
                                <td>${providerInstance[5]}</td>
                                <td>${providerInstance[6]}</td>
                                <td><g:checkBox name="pactiveInd" value="${providerInstance[7]}" onclick="return false;"></g:checkBox></td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>
            </div>
            <hr>
            <div class="offset3">
                <g:actionSubmit name="create" action="edit"  class="btn btn-primary"  value="${message(code: 'default.button.edit.label', default: 'Create')}" />
                <g:actionSubmit class="btn btn-danger"  action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                <g:actionSubmit value="Cancel" name="cancel" action="list" class="btn"></g:actionSubmit>
                <span class="button"><g:submitButton name="createMany" style="display: none" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
            </div>
        </div>
        </div>

        </div>
    </g:form>
    </div>
    </body>
</html>
