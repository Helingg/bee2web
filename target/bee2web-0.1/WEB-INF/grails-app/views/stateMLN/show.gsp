
<%@ page import="com.bssi.StateMLN" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'stateMLN.label', default: 'StateMLN')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-stateMLN" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-stateMLN" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list stateMLN">
			
				<g:if test="${stateMLNData?.MLN}">
				<li class="fieldcontain">
					<span id="MLN-label" class="property-label"><g:message code="stateMLN.MLN.label" default="MLN" /></span>
					
						<span class="property-value" aria-labelledby="MLN-label"><g:fieldValue bean="${stateMLNData}" field="MLN"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stateMLNData?.state}">
				<li class="fieldcontain">
					<span id="state-label" class="property-label"><g:message code="stateMLN.state.label" default="State" /></span>
					
						<span class="property-value" aria-labelledby="state-label"><g:fieldValue bean="${stateMLNData}" field="state"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stateMLNData?.provider}">
				<li class="fieldcontain">
					<span id="provider-label" class="property-label"><g:message code="stateMLN.provider.label" default="Provider" /></span>
					
						<span class="property-value" aria-labelledby="provider-label"><g:link controller="provider" action="show" id="${stateMLNData?.provider?.id}">${stateMLNData?.provider?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${stateMLNData?.id}" />
					<g:link class="edit" action="edit" id="${stateMLNData?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
