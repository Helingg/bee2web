
<%@ page import="com.bssi.SegmentTemplate" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'templateDatabase.label', default: 'TemplateDatabase')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-templateDatabase" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-templateDatabase" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="segment" title="${message(code: 'templateDatabase.segment.label', default: 'Segment')}" />
					
						<g:sortableColumn property="field" title="${message(code: 'templateDatabase.field.label', default: 'Field')}" />
					
						<g:sortableColumn property="dataType" title="${message(code: 'templateDatabase.dataType.label', default: 'Data Type')}" />
					
						<g:sortableColumn property="required" title="${message(code: 'templateDatabase.required.label', default: 'Required')}" />
					
						<g:sortableColumn property="repeatable" title="${message(code: 'templateDatabase.repeatable.label', default: 'Repeatable')}" />
					
						<g:sortableColumn property="fieldIndex" title="${message(code: 'templateDatabase.fieldIndex.label', default: 'Field Index')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${SegmentTemplateDataList}" status="i" var="templateDatabaseData">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${templateDatabaseData.id}">${fieldValue(bean: templateDatabaseData, field: "segment")}</g:link></td>
					
						<td>${fieldValue(bean: templateDatabaseData, field: "field")}</td>
					
						<td>${fieldValue(bean: templateDatabaseData, field: "dataType")}</td>
					
						<td><g:formatBoolean boolean="${templateDatabaseData.required}" /></td>
					
						<td><g:formatBoolean boolean="${templateDatabaseData.repeatable}" /></td>
					
						<td>${fieldValue(bean: templateDatabaseData, field: "fieldIndex")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${SegmentTemplateDataTotal}" />
			</div>
		</div>
	</body>
</html>
