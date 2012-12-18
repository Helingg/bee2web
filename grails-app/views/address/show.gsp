
<%@ page import="com.bssi.Address" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>

    </head>
    <body>        
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
    <hr>

    %{--<g:hasErrors bean="${addressData}">--}%
        %{--<div class="errors">--}%
            %{--<g:renderErrors bean="${addressData}" as="list" />--}%
        %{--</div>--}%
    %{--</g:hasErrors>--}%

    <div class="container-fluid span10">
        <div class="span12 divbk">
            <g:link  action="list"><i class="icon-home"></i><g:message code="default.list.label" args="[entityName]" /></g:link>
            <g:link  action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link>
        </div>
        <g:if test="${flash.message}">
            <div class="message span12" style="color: red">${flash.message}</div>
        </g:if>
    <div class="span12" >
        <g:form  class="form-horizontal">
            <g:hiddenField name="id" value="${addressData?.id}" />
            <g:hiddenField name="version" value="${addressData?.version}" />
            <div class="well">
                <div class="control-group">
                    <label class="control-label"  ><g:message code="address.streetNbr.label" default="Street Number" />:</label>
                    <div class="controls">
                        <label class="control-label"  >${fieldValue(bean: addressData, field: "streetNbr")}</label>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label"  ><g:message code="address.streetAddr.label" default="Street Address" />:</label>
                    <div class="controls">
                        <label class="control-label"  >${fieldValue(bean: addressData, field: "streetAddr")}</label>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" ><g:message code="address.streetPrefix.label" default="Street Prefix" />:</label>
                    <div class="controls">
                        <label class="control-label"  >${fieldValue(bean: addressData, field: "streetPrefix")}</label>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label"  ><g:message code="address.streetSuffix.label" default="Street Suffix" />:</label>
                    <div class="controls">
                        <label class="control-label"  >${fieldValue(bean: addressData, field: "streetSuffix")}</label>
                    </div>
                </div>


                <div class="control-group">
                    <label class="control-label"  ><g:message code="address.city.label" default="City" />:</label>
                    <div class="controls">
                        <label class="control-label"  >${fieldValue(bean: addressData, field: "city")}</label>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label"  ><g:message code="address.state.label" default="State" />:</label>
                    <div class="controls">
                        <label class="control-label"  >${fieldValue(bean: addressData, field: "state")}</label>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label"><g:message code="address.country.label" default="Country" />:</label>
                    <div class="controls">
                        <label class="control-label"  >${fieldValue(bean: addressData, field: "country")}</label>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" ><g:message code="address.zipCode.label" default="Zip Code" />:</label>
                    <div class="controls">
                        <label class="control-label"  >${fieldValue(bean: addressData, field: "zipCode")}</label>
                    </div>
                </div>

                <div class="offset3">
                    <g:actionSubmit name="edit" action="edit"  class="btn btn-primary"  value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
                    <g:actionSubmit class="btn btn-danger" action="delete"  value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    <g:actionSubmit value="Cancel" name="cancel" action="list" class="btn"></g:actionSubmit>
                </div>
            </div>
            </div>
            </div>
        </g:form>
    </body>
</html>
