
<%@ page import="com.bssi.FacilityAddress" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'facilityAddress.label', default: 'Facility Address')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />

        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>        
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <hr>

    %{--<g:hasErrors bean="${facilityAddressData}">--}%
        %{--<div class="errors">--}%
            %{--<g:renderErrors bean="${facilityAddressData}" as="list" />--}%
        %{--</div>--}%
    %{--</g:hasErrors>--}%

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
            <g:hiddenField name="id" value="${facilityAddressData?.id}" />
            <g:hiddenField name="version" value="${facilityAddressData?.version}" />
            <div class="well">

                <div class="control-group">
                    <label class="control-label"  ><g:message code="facilityAddress.facility.label" default="Facility" />:</label>
                    <div class="controls">
                        <label class="control-label"  ><g:link controller="facility" action="show" id="${facilityAddressData?.facility.id}">${facilityAddressData?.facility?.encodeAsHTML()}</g:link></label>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label"  ><g:message code="facilityAddress.addr.label" default="Address" />:</label>
                    <div class="controls">
                        <label class="control-label"  ><g:link controller="address" action="show" id="${facilityAddressData?.addr.id}">${facilityAddressData?.addr?.encodeAsHTML()}</g:link></label>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label"  ><g:message code="facilityAddress.addrType.label" default="Address Type" />:</label>
                    <div class="controls">
                        <label class="control-label"  ><g:link controller="addressType" action="show" id="${facilityAddressData?.addrType.id}">${facilityAddressData?.addrType?.encodeAsHTML()}</g:link></label>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label"  ><g:message code="facilityAddress.activeInd.label" default="Enabled" />:</label>
                    <div class="controls">

                        <label class="control-label"  ><g:checkBox name="" onclick="return false" value="${facilityAddressData?.activeInd}"/></label>
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
