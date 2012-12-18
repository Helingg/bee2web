
<%@ page import="com.bssi.Recipient" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'recipient.label', default: 'Recipient')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
    </head>
    <body>        
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
			<div class="nav">            
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            </div>
            <g:form method="post" >
                <g:hiddenField name="id" value="${recipientData?.id}" />
                <g:hiddenField name="version" value="${recipientData?.version}" />
                <div class="dialog">
                    <table class="table">
                        <tbody>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="name"><g:message code="recipient.name.label" default="Name" /></label> &nbsp;&nbsp;
                                <g:textField name="name" maxlength="64" value="${params.name}" />   &nbsp;&nbsp;
                                <label for="ip"><g:message code="recipient.ip.label" default="Ip" /></label>  &nbsp;&nbsp;
                                <g:textField name="ip" maxlength="32" value="${params.ip}" />
                            </td>
                        </tr>

                        <tr class="prop">

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="membership"><g:message code="recipient.membership.label" default="Membership" /></label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <g:if test="${params.membership=='trial'}"><g:radio value="trial" name="membership" checked="checked"/>Trial</g:if>
                            <g:else><g:radio value="trial" name="membership" />Trial</g:else>
                            <g:if test="${params.membership=='formal'}"><g:radio value="formal" name="membership" checked="checked"/>Formal</g:if>
                            <g:else><g:radio value="formal" name="membership" />Formal</g:else>&nbsp;&nbsp;&nbsp;
                                <label for="enabled"><g:message code="recipient.enabled.label" default="Enabled" /></label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <g:if test="${params.enabled=='true'}"><g:radio value="true" name="enabled" checked="checked"/>True</g:if>
                            <g:else><g:radio value="true" name="enabled"/>True</g:else>
                            <g:if test="${params.enabled=='false'}"><g:radio value="false" name="enabled" checked="checked"/>False</g:if>
                            <g:else><g:radio value="false" name="enabled"/>False</g:else>
                            </td>
                        </tr>
                            <td>
                                <div class="buttons" style="width:90px">
                                    <span class="button"><g:actionSubmit class="save" action="search" value="${message(code: 'default.button.search.label', default: 'Search')}" /></span>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </g:form>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn params = "[name:params.name,provider:params.provider,membership:params.membership,enabled:params.enabled]" property="id" title="${message(code: 'recipient.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn params = "[name:params.name,provider:params.provider,membership:params.membership,enabled:params.enabled]" property="name" title="${message(code: 'recipient.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn params = "[name:params.name,provider:params.provider,membership:params.membership,enabled:params.enabled]" property="membership" title="${message(code: 'recipient.membership.label', default: 'Membership')}" />
                        
                            <g:sortableColumn params = "[name:params.name,provider:params.provider,membership:params.membership,enabled:params.enabled]" property="ip" title="${message(code: 'recipient.ip.label', default: 'Ip')}" />
                        
                            <g:sortableColumn params = "[name:params.name,provider:params.provider,membership:params.membership,enabled:params.enabled]" property="port" title="${message(code: 'recipient.port.label', default: 'Port')}" />
                        
                            <g:sortableColumn params = "[name:params.name,provider:params.provider,membership:params.membership,enabled:params.enabled]" property="other" title="${message(code: 'recipient.other.label', default: 'Other')}" />
                        
                            <g:sortableColumn params = "[name:params.name,provider:params.provider,membership:params.membership,enabled:params.enabled]" property="enabled" title="${message(code: 'recipient.enabled.label', default: 'Enabled')}" />
                        
                            <g:sortableColumn params = "[name:params.name,provider:params.provider,membership:params.membership,enabled:params.enabled]" property="dateCreated" title="${message(code: 'recipient.dateCreated.label', default: 'Date Created')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${recipientDataList}" status="i" var="recipientData">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${recipientData.id}">${fieldValue(bean: recipientData, field: "id")}</g:link></td>
                        
                            <td><g:link action="edit" id="${recipientData.id}">${fieldValue(bean: recipientData, field: "name")}</g:link></td>
                        
                            <td><g:link action="edit" id="${recipientData.id}">${fieldValue(bean: recipientData, field: "membership")}</g:link></td>
                        
                            <td><g:link action="edit" id="${recipientData.id}">${fieldValue(bean: recipientData, field: "ip")}</g:link></td>
                        
                            <td><g:link action="edit" id="${recipientData.id}">${fieldValue(bean: recipientData, field: "port")}</g:link></td>
                        
                            <td><g:link action="edit" id="${recipientData.id}">${fieldValue(bean: recipientData, field: "other")}</g:link></td>
                        
                            <td><g:formatBoolean boolean="${recipientData.enabled}" /></td>
                        
                            <td><g:formatDate date="${recipientData.dateCreated}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate action="search" params = "[name:params.name,provider:params.provider,membership:params.membership,enabled:params.enabled]"  total="${recipientDataTotal}" />
            </div>
			<div class="nav">            
              <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            </div>
        </div>
    </body>
</html>
