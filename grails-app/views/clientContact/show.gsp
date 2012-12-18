
<%@ page import="com.bssi.ClientContact" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'clientContact.label', default: 'Client Contact')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>

    </head>
    <body>        
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <hr>

    %{--<g:hasErrors bean="${clientContactData}">--}%
        %{--<div class="errors">--}%
            %{--<g:renderErrors bean="${clientContactData}" as="list" />--}%
        %{--</div>--}%
    %{--</g:hasErrors>--}%

    <div class="container-fluid span10">
        <div class="span12 divbk">
            <g:link  action="list"><i class="icon-list"></i><g:message code="default.list.label" args="[entityName]" /></g:link>
            <g:link  action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link>
        </div>
        <g:if test="${flash.message}">
            <div class="message span12" style="color: red">${flash.message}</div>
        </g:if>

    <div class="span12" >
        <g:form method="post" class="form-horizontal">
            <g:hiddenField name="id" value="${clientContactData?.id}" />
            <g:hiddenField name="version" value="${clientContactData?.version}" />
            <div class="well">

                <div class="control-group">
                    <label class="control-label"  ><g:message code="clientContact.firstName.label" default="First Name" />:</label>
                    <div class="controls">
                        <label class="control-label"  >${fieldValue(bean: clientContactData, field: "firstName")}</label>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label"  ><g:message code="clientContact.lastName.label" default="Last Name" />:</label>
                    <div class="controls">
                        <label class="control-label"  >${fieldValue(bean: clientContactData, field: "lastName")}</label>
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
                    <label class="control-label"  ><g:message code="clientContact.client.label" default="client" />:</label>
                    <div class="controls">
                        <label class="control-label"  ><g:link controller="address" action="show" id="${clientContactData?.client?.id}">${clientContactData?.client?.encodeAsHTML()}</g:link></label>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label"  ><g:message code="clientContact.addr.label" default="Address" />:</label>
                    <div class="controls">
                        <label class="control-label"  ><g:link controller="address" action="show" id="${clientContactData?.addr?.id}">${clientContactData?.addr?.encodeAsHTML()}</g:link></label>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label"  ><g:message code="clientContact.contactType.label" default="Contact Type" />:</label>
                    <div class="controls">
                        <label class="control-label"  ><g:link controller="address" action="show" id="${clientContactData?.contactType?.id}">${clientContactData?.contactType?.encodeAsHTML()}</g:link></label>
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
    </body>
</html>
