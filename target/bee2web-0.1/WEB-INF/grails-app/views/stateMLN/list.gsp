
<%@ page import="com.bssi.StateMLN" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'stateMLN.label', default: 'StateMLN')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-stateMLN" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-stateMLN" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="MLN" title="${message(code: 'stateMLN.MLN.label', default: 'MLN')}" />
					
						<g:sortableColumn property="state" title="${message(code: 'stateMLN.state.label', default: 'State')}" />
					
						<th><g:message code="stateMLN.provider.label" default="Provider" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${stateMLNDataList}" status="i" var="stateMLNData">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${stateMLNData.id}">${fieldValue(bean: stateMLNData, field: "MLN")}</g:link></td>
					
						<td>${fieldValue(bean: stateMLNData, field: "state")}</td>
					
						<td>${fieldValue(bean: stateMLNData, field: "provider")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${stateMLNDataTotal}" />
			</div>
		</div>
	</body>
</html>
