
<%@ page import="com.bssi.MessageTemplate" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'messageTemplate.label', default: 'MessageTemplate')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-messageTemplate" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-messageTemplate" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list messageTemplate">
			
				<g:if test="${messageTemplateData?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="messageTemplate.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${messageTemplateData}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${messageTemplateData?.eventType}">
				<li class="fieldcontain">
					<span id="eventType-label" class="property-label"><g:message code="messageTemplate.eventType.label" default="Event Type" /></span>
					
						<span class="property-value" aria-labelledby="eventType-label"><g:fieldValue bean="${messageTemplateData}" field="eventType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${messageTemplateData?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="messageTemplate.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${messageTemplateData}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${messageTemplateData?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="messageTemplate.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${messageTemplateData}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${messageTemplateData?.segment}">
				<li class="fieldcontain">
					<span id="segment-label" class="property-label"><g:message code="messageTemplate.segment.label" default="Segment" /></span>
					
						<span class="property-value" aria-labelledby="segment-label"><g:fieldValue bean="${messageTemplateData}" field="segment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${messageTemplateData?.segmentIndex}">
				<li class="fieldcontain">
					<span id="segmentIndex-label" class="property-label"><g:message code="messageTemplate.segmentIndex.label" default="Segment Index" /></span>
					
						<span class="property-value" aria-labelledby="segmentIndex-label"><g:fieldValue bean="${messageTemplateData}" field="segmentIndex"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${messageTemplateData?.id}" />
					<g:link class="edit" action="edit" id="${messageTemplateData?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
