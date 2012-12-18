
<%@ page import="com.bssi.Provider" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'provider.label', default: 'Provider')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>

    </head>
    <body>        
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <hr>

    %{--<g:hasErrors bean="${providerData}">--}%
        %{--<div class="errors">--}%
            %{--<g:renderErrors bean="${providerData}" as="list" />--}%
        %{--</div>--}%
    %{--</g:hasErrors>--}%

    <div class="container-fluid span10">
    <div class="row-fluid">
        <div class="span3">
            <div class="well sidebar-nav">
                <ul class="nav nav-list">
                    <li class="nav-header">Option</li>
                    <li class="active"><g:link  action="list"><i class="icon-home"></i><g:message code="default.list.label" args="[entityName]" /></g:link> </li>
                    <li class="active"><g:link  action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link> </li>
                </ul>
            </div>
        </div>

    <div class="span9" >
        <g:if test="${flash.message}">
            <div class="message span9" style="color: red">${flash.message}</div>
        </g:if>
        <g:form action="save"  class="form-horizontal">
            <g:hiddenField name="clientNum" value = "${clientDataTotal}"></g:hiddenField>
            <g:hiddenField name="id" value="${providerData?.id}" />
            <g:hiddenField name="version" value="${providerData?.version}" />
            <div class="well span8">

                <div class="control-group">
                    <label  class="control-label"><g:message code="provider.lastName.label" default="Last Name" />:</label>
                    <div class="controls">
                        <label  class="control-label">${providerData?.lastName}</label>
                    </div>
                </div>

                <div class="control-group">
                    <label  class="control-label" ><g:message code="provider.firstName.label" default="First Name" />:</label>
                    <div class="controls">
                        <label  class="control-label" >${providerData?.firstName}</label>
                    </div>
                </div>

                <div class="control-group">
                    <label  class="control-label" ><g:message code="provider.middleName.label" default="Middle Name" />:</label>
                    <div class="controls">
                        <label  class="control-label" >${providerData?.middleName}</label>
                    </div>
                </div>
                <div class="control-group">
                    <label  class="control-label"><g:message code="provider.NPI.label" default="NPI" />:</label>
                    <div class="controls">
                        <label  class="control-label" >${providerData?.NPI}</label>
                    </div>
                </div>
                <div class="control-group">
                    <label  class="control-label" ><g:message code="provider.prefix.label" default="Prefix" />:</label>
                    <div class="controls">
                        <label  class="control-label" >${providerData?.prefix}</label>
                    </div>
                </div>
                <div class="control-group">
                    <label  class="control-label" ><g:message code="provider.suffix.label" default="Suffix" />:</label>
                    <div class="controls">
                        <label  class="control-label" >${providerData?.suffix}</label>
                    </div>
                </div>
                %{--<div class="control-group">--}%
                    %{--<label  class="control-label" ><g:message code="provider.MLN.label" default="MLN" />:</label>--}%
                    %{--<div class="controls">--}%
                        %{--<label  class="control-label" >${providerData?.MLN}</label>--}%
                    %{--</div>--}%
                %{--</div>--}%
                <div class="control-group">
                    <label  class="control-label"><g:message code="provider.DOB.label" default="DOB" />:</label>
                    <div class="controls">
                        <label  class="control-label" >${providerData?.DOB}</label>
                    </div>
                </div>
                <div class="control-group">
                    <label  class="control-label" ><g:message code="provider.SSN.label" default="SSN" />:</label>
                    <div class="controls">
                        <label  class="control-label" >${providerData?.SSN}</label>
                    </div>
                </div>
                <div class="control-group">
                    <label  class="control-label" ><g:message code="provider.UPIN.label" default="UPIN" />:</label>
                    <div class="controls">
                        <label  class="control-label" >${providerData?.UPIN}</label>
                    </div>
                </div>

                <div >
                    <hr>
                    <div>
                        <font size="3" color="#279745" style="margin: 0 140px 0 0">Medical Licence Number</font>
                    </div>

                    <div id="MLNDiv">
                        <table id="MLNTable" class="table table-condensed table-striped">
                            <th>${message(code: 'stateMLN.state.label', default: 'State')}</th>

                            <th>${message(code: 'stateMLN.MLN.label', default: 'Medical Licence Number')}</th>

                            <tbody>
                            <g:each in="${stateMLNDataList}" status="i" var="stateMLNData">
                                <tr id="toBeDelRow<%=i+1%>">
                                    <td>${stateMLNData.state}</td>
                                    <td>${stateMLNData.mln}</td>
                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div >
                    <hr>
                    <div>
                        <font size="3" color="#279745" style="margin: 0 140px 0 0"><g:message  code="client.message.lable" /></font>
                    </div>

                    <div id="clientDiv">
                        <table id="clientTable" class="table table-condensed table-striped">
                            <th>${message(code: 'client.name.label', default: 'Name')}</th>

                            %{--<th>${message(code: 'client.activeInd.label', default: 'Active')}</th>--}%

                            <th>${message(code: 'provider.clientProvider.label', default: 'Client Provider Id')}</th>

                            <th>${message(code: 'provider.status.label', default: 'Status')}</th>

                            <th>${message(code: 'provider.activeInd.label', default: 'Active')}</th>

                            <tbody>
                            <g:each in="${clientDataList}" status="i" var="clientData">
                                <tr id="toBeDelRow<%=i+1%>">
                                    <td>${clientData[1]}<g:hiddenField name="client" value="${clientData[0]}"></g:hiddenField></td>
                                    %{--<td>${clientData[2]}</td>--}%
                                    %{--<td>${clientData[3]}</td>--}%
                                    <td>${clientData[4]}</td>
                                    <td>${clientData[5]}</td>
                                    <td><g:checkBox name="showcheck" value="${clientData[6]}" onclick="return false"/></td>
                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                    </div>
                </div>
                <hr>
                <div class="offset3">
                    <g:actionSubmit name="edit" action="edit"  class="btn btn-primary"  value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
                    <g:actionSubmit class="btn btn-danger"  action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <g:actionSubmit value="Cancel" name="cancel" action="list" class="btn"></g:actionSubmit>
                </div>
            </div>
            </div>

            </div>

        </g:form>
        </div>
    </body>
</html>
