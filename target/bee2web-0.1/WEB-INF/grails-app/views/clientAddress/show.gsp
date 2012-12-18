
<%@ page import="com.bssi.ClientAddress" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'clientAddress.label', default: 'Client Address')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>

    </head>
    <body>        
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <hr>

    <g:hasErrors bean="${clientAddressData}">
        <div class="errors">
            <g:renderErrors bean="${clientAddressData}" as="list" />
        </div>
    </g:hasErrors>

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
        <g:if test="${flash.message}">
            <div class="message span9" style="color: red">${flash.message}</div>
        </g:if>
    <div class="span9" >
        <g:form method="post" class="form-horizontal">
            <g:hiddenField name="id" value="${clientAddressData?.id}" />
            <g:hiddenField name="version" value="${clientAddressData?.version}" />
            <div class="well">

                <div class="control-group">
                    <label class="control-label" ><g:message code="clientAddress.phone.label" default="Phone" />:</label>
                    <div class="controls">
                        <label class="control-label"  >${clientAddressData?.phone}</label>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" ><g:message code="clientAddress.fax.label" default="Fax" />:</label>
                    <div class="controls">
                        <label class="control-label"  > ${clientAddressData?.fax}</label>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label"  ><g:message code="clientAddress.billingContactName.label" default="Billing Contact Name" />:</label>
                    <div class="controls">
                        <label class="control-label"  >${clientAddressData?.billingContactName}</label>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label"  ><g:message code="clientAddress.billingContactEmail.label" default="Billing Contact Email" />:</label>
                    <div class="controls">
                        <label class="control-label"  >${clientAddressData?.billingContactEmail}</label>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label"  ><g:message code="clientAddress.billingContactPhone.label" default="Billing Contact Phone" />:</label>
                    <div class="controls">
                        <label class="control-label"  >${clientAddressData?.billingContactPhone}</label>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label"  ><g:message code="clientAddress.client.label" default="client" />:</label>
                    <div class="controls">
                        <label class="control-label"  ><g:link controller="client" action="show" id="${clientAddressData?.client.id}">${clientAddressData?.client?.encodeAsHTML()}</g:link></label>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label"  ><g:message code="clientAddress.addr.label" default="Address" />:</label>
                    <div class="controls">
                        <label class="control-label"  ><g:link controller="address" action="show" id="${clientAddressData?.addr?.id}">${clientAddressData?.addr?.encodeAsHTML()}</g:link></label>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label"  ><g:message code="clientAddress.addrType.label" default="Address Type" />:</label>
                    <div class="controls">
                        <label class="control-label"  ><g:link controller="addressType" action="show" id="${clientAddressData?.addrType?.id}">${clientAddressData?.addrType?.encodeAsHTML()}</g:link></label>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label"  ><g:message code="clientAddress.activeInd.label" default="Enabled" />:</label>
                    <div class="controls">

                        <label class="control-label"  ><g:checkBox name="" value="${clientAddressData?.activeInd}" onclick="return false"></g:checkBox></label>
                    </div>
                </div>


                <div class="offset3">
                    <g:actionSubmit class="btn btn-primary"   action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
                    <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    <g:actionSubmit value="Cancel" name="cancel" action="list" class="btn"></g:actionSubmit>
                </div>
            </div>
            </div>
            </div>
        </g:form>
    </div>
    </body>
</html>
