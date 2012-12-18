
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
        <div class="span12 divbk">
            <g:link  action="list"><i class="icon-list"></i><g:message code="default.list.label" args="[entityName]" /></g:link>
            <g:link  action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link>
        %{--<li class="active"><g:link controller="provider"  action="create"><i class="icon-plus"></i>New Provider</g:link> </li>--}%
        </div>
        <g:if test="${flash.message}">
            <div class="message span12" style="color: red">${flash.message}</div>
        </g:if>

    <div class="span12" >

        <g:form method="post" class="form-horizontal">
            <g:hiddenField name="id" value="${clientData?.id}" />
            <g:hiddenField name="version" value="${clientData?.version}" />
            <div class="well">
            <div class="tabbable">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#clientTab" data-toggle="tab">Client</a>
                    </li>
                    <li><a href="#addressTab" data-toggle="tab">Address</a></li>
                    <li><a href="#contactTab" data-toggle="tab">Contact</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="clientTab">
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
                    </div>
                    <div class="tab-pane" id="addressTab">
                        <div class="control-group">
                            <label class="control-label"  ><g:message code="address.streetNbr.label" default="Street Number" />:</label>
                            <div class="controls">
                                <label class="control-label"  >${clientAddressData?.addr?.streetNbr}</label>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label"  ><g:message code="address.streetAddr.label" default="Street Address" />:</label>
                            <div class="controls">
                                <label class="control-label"  >${clientAddressData?.addr?.streetAddr}</label>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" ><g:message code="address.streetPrefix.label" default="Street Prefix" />:</label>
                            <div class="controls">
                                <label class="control-label"  >${clientAddressData?.addr?.streetPrefix}</label>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label"  ><g:message code="address.streetSuffix.label" default="Street Suffix" />:</label>
                            <div class="controls">
                                <label class="control-label"  >${clientAddressData?.addr?.streetSuffix}</label>
                            </div>
                        </div>


                        <div class="control-group">
                            <label class="control-label"  ><g:message code="address.city.label" default="City" />:</label>
                            <div class="controls">
                                <label class="control-label"  >${clientAddressData?.addr?.city}</label>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label"  ><g:message code="address.state.label" default="State" />:</label>
                            <div class="controls">
                                <label class="control-label"  >${clientAddressData?.addr?.state}</label>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label"><g:message code="address.country.label" default="Country" />:</label>
                            <div class="controls">
                                <label class="control-label"  >${clientAddressData?.addr?.country}</label>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" ><g:message code="address.zipCode.label" default="Zip Code" />:</label>
                            <div class="controls">
                                <label class="control-label"  >${clientAddressData?.addr?.zipCode}</label>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" ><g:message code="address.addressType.label" default="Address Type" />:</label>
                            <div class="controls">
                                <label class="control-label"  >${clientAddressData?.addrType}</label>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="contactTab">
                        <div class="control-group">
                            <label class="control-label"  ><g:message code="clientContact.lastName.label" default="Last Name" />:</label>
                            <div class="controls">
                                <label class="control-label"  >${fieldValue(bean: clientContactData, field: "lastName")}</label>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label"  ><g:message code="clientContact.firstName.label" default="First Name" />:</label>
                            <div class="controls">
                                <label class="control-label"  >${fieldValue(bean: clientContactData, field: "firstName")}</label>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label"  ><g:message code="clientContact.middleName.label" default="Middle Name" />:</label>
                            <div class="controls">
                                <label class="control-label"  >${fieldValue(bean: clientContactData, field: "middleName")}</label>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label"  ><g:message code="clientContact.phoneNbr.label" default="Phone" />:</label>
                            <div class="controls">
                                <label class="control-label"  >${fieldValue(bean: clientContactData, field: "phoneNbr")}</label>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label"  ><g:message code="clientContact.emailAddr.label" default="Email Address" />:</label>
                            <div class="controls">
                                <label class="control-label"  >${fieldValue(bean: clientContactData, field: "emailAddr")}</label>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label"  ><g:message code="clientContact.addr.label" default="Address" />:</label>
                            <div class="controls">
                                <label class="control-label"  >${clientContactData?.addr?.encodeAsHTML()}</label>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label"  ><g:message code="clientContact.contactType.label" default="Contact Type" />:</label>
                            <div class="controls">
                                <label class="control-label"  >${clientContactData?.contactType?.encodeAsHTML()}</label>
                            </div>
                        </div>

                    </div>
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
        </g:form>

    </div>
    </body>
</html>
