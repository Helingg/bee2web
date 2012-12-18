
<%@ page import="com.bssi.SegmentTemplate" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'templateDatabase.label', default: 'Segment Template')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <hr>

    <g:form method="post"  class="form-horizontal" >
        <div class="container-fluid span10">
            <div class="span12 divbk">
                <g:link  action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link>
            </div>
            <g:if test="${flash.message}">
                <div class="message span12" style="color: red">${flash.message}</div>
            </g:if>
            <div class="span12">
                <div class="well">
                    <div class="control-group">
                        <label class="control-label" for="segment" ><g:message code="bridge.segment.label" default="Segment" /></label>
                        <div class="controls">
                            <g:textField class="input-xlarge focused" name="segment" maxlength="128" value="${params?.segment}" />
                        </div>
                    </div>

                    <br>
                    <div class="control offset4">
                        <g:actionSubmit class="btn btn-primary" action="search" value="${message(code: 'default.button.search.label', default: 'Search')}" />
                    </div>
                    <br>
                    <div>
                        <table class="table table-condensed table-striped">
                            <thead>
                            <tr>
                                <th>${message(code: 'templateDatabase.segment.label', default: 'Segment')}</th>
                                <th>${message(code: 'templateDatabase.field.label', default: 'Field')}</th>
                                <th>${message(code: 'templateDatabase.dataType.label', default: 'Data Type')}</th>
                                <th>${message(code: 'templateDatabase.required.label', default: 'Required')}</th>
                                <th>${message(code: 'templateDatabase.repeatable.label', default: 'Repeatable')}</th>
                                <th>${message(code: 'templateDatabase.fieldIndex.label', default: 'Field Index')}</th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${SegmentTemplateDataList}" status="i" var="templateDatabaseData">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td>${fieldValue(bean: templateDatabaseData, field: "segment")}</td>

                                    <td>${fieldValue(bean: templateDatabaseData, field: "field")}</td>

                                    <td>${fieldValue(bean: templateDatabaseData, field: "dataType")}</td>

                                    <td><g:checkBox name="ddd1" value="${templateDatabaseData.required}" onclick="return false;"></g:checkBox></td>

                                    <td><g:checkBox name="ddd2" value="${templateDatabaseData.repeatable}" onclick="return false;"></g:checkBox></td>

                                    <td>${fieldValue(bean: templateDatabaseData, field: "fieldIndex")}</td>

                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                        <div class="paper">
                            <g:paginate total="${SegmentTemplateDataTotal}" params="[params:params]" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </g:form>
	</body>
</html>
