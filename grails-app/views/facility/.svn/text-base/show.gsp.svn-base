
<%@ page import="com.bssi.Facility" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'facility.label', default: 'Facility')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
<g:form class="form-horizontal">
    <g:hiddenField name="id" value="${facilityData?.id}" />
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <hr>

            <div class="container-fluid span10">
                <div class="row-fluid">
                    <div class="span3">
                        <div class="well sidebar-nav">
                            <ul class="nav nav-list">
                                <li class="nav-header">Option</li>
                                <li class="active"><g:link  action="list"><i class="icon-home"></i><g:message code="default.list.label" args="[entityName]" /></g:link>
                                <li class="active"><g:link  action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link>
                            </ul>
                        </div>
                    </div>
                    <g:if test="${flash.message}">
                        <div class="message span9" style="color: red">${flash.message}</div>
                    </g:if>
                    <div class="span9" >
                        <div class="well">
                            <div class="control-group">
                                <label class="control-label"><g:message code="facility.name.label" default="Name" /></label>
                                <div class="controls">
                                    <label class="control-label">${facilityData?.name}</label>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" ><g:message code="facility.comment.label" default="Comment" /></label>
                                <div class="controls">
                                    <label class="control-label" >${facilityData?.comment}</label>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" ><g:message code="facility.client.label" default="Client" /></label>
                                <div class="controls">
                                    <label class="control-label" >${facilityData.client.name}</label>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="activeInd"><g:message code="facility.activeInd.label" default="Active Ind" /></label>
                                <div class="controls">
                                    <label class="checkbox">
                                        <g:checkBox name="activeInd" value="${facilityData?.activeInd}" onclick="return false;" />
                                    </label>
                                </div>
                                <div class="offset3">
                                <g:actionSubmit class="btn btn-primary"  action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                                <g:actionSubmit class="btn btn-danger"  action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                                <g:actionSubmit value="Cancel" name="cancel" action="list" class="btn"></g:actionSubmit>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </g:form>
    </body>
</html>
