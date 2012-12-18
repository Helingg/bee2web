
<%@ page import="com.bssi.SegmentTemplate" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'templateDatabase.label', default: 'TemplateDatabase')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-templateDatabase" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-templateDatabase" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list templateDatabase">
			
				<g:if test="${templateDatabaseData?.segment}">
				<li class="fieldcontain">
					<span id="segment-label" class="property-label"><g:message code="templateDatabase.segment.label" default="Segment" /></span>
					
						<span class="property-value" aria-labelledby="segment-label"><g:fieldValue bean="${templateDatabaseData}" field="segment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${templateDatabaseData?.field}">
				<li class="fieldcontain">
					<span id="field-label" class="property-label"><g:message code="templateDatabase.field.label" default="Field" /></span>
					
						<span class="property-value" aria-labelledby="field-label"><g:fieldValue bean="${templateDatabaseData}" field="field"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${templateDatabaseData?.dataType}">
				<li class="fieldcontain">
					<span id="dataType-label" class="property-label"><g:message code="templateDatabase.dataType.label" default="Data Type" /></span>
					
						<span class="property-value" aria-labelledby="dataType-label"><g:fieldValue bean="${templateDatabaseData}" field="dataType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${templateDatabaseData?.required}">
				<li class="fieldcontain">
					<span id="required-label" class="property-label"><g:message code="templateDatabase.required.label" default="Required" /></span>
					
						<span class="property-value" aria-labelledby="required-label"><g:formatBoolean boolean="${templateDatabaseData?.required}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${templateDatabaseData?.repeatable}">
				<li class="fieldcontain">
					<span id="repeatable-label" class="property-label"><g:message code="templateDatabase.repeatable.label" default="Repeatable" /></span>
					
						<span class="property-value" aria-labelledby="repeatable-label"><g:formatBoolean boolean="${templateDatabaseData?.repeatable}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${templateDatabaseData?.fieldIndex}">
				<li class="fieldcontain">
					<span id="fieldIndex-label" class="property-label"><g:message code="templateDatabase.fieldIndex.label" default="Field Index" /></span>
					
						<span class="property-value" aria-labelledby="fieldIndex-label"><g:fieldValue bean="${templateDatabaseData}" field="fieldIndex"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${templateDatabaseData?.id}" />
					<g:link class="edit" action="edit" id="${templateDatabaseData?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
