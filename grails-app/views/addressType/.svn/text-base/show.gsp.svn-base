
<%@ page import="com.bssi.AddressType" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'luAddrType.label', default: 'Lu Address Type')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />

    </head>
    <body>        
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <hr>

    <g:hasErrors bean="${luAddrTypeData}">
        <div class="errors">
            <g:renderErrors bean="${luAddrTypeData}" as="list" />
        </div>
    </g:hasErrors>

    <div class="container-fluid span10">
        <div class="span12 divbk">
            <g:link  action="list"><i class="icon-list"></i><g:message code="default.list.label" args="[entityName]" /></g:link>
            <g:link  action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link>
        </div>
        <g:if test="${flash.message}">
            <div class="message span12" style="color: red">${flash.message}</div>
        </g:if>
    <div class="span12" >
        <g:form   class="form-horizontal">
            <g:hiddenField name="id" value="${luAddrTypeData?.id}" />
            <g:hiddenField name="version" value="${luAddrTypeData?.version}" />
            <div class="well">
                <div class="control-group">
                    <label class="control-label"  ><g:message code="luAddrType.addrType.label" default="Address Type" />:</label>
                    <div class="controls">
                        <label class="control-label"  >${fieldValue(bean: luAddrTypeData, field: "addrType")}</label>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label"  ><g:message code="luAddrType.description.label" default="Description" />:</label>
                    <div class="controls">
                        <label class="control-label"  >${fieldValue(bean: luAddrTypeData, field: "description")}</label>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label"  ><g:message code="luAddrType.activeInd.label" default="Enabled" />:</label>
                    <div class="controls">
                        <label class="control-label"  ><g:checkBox name="" value="${luAddrTypeData.activeInd}" onclick="return false"></g:checkBox></label>
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
