
<%@ page import="com.bssi.SendLog" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'sendLog.label', default: 'Send Log')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>        
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
			<div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            </div>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sendLog.id.label" default="Id" /></td>
                            <td valign="top" class="value">${fieldValue(bean: sendLogData, field: "id")}</td>
                        </tr>
                        
                         <tr class="prop">
                            <td valign="top" class="name"><g:message code="sendLog.client.label" default="Client" /></td>
                            <td valign="top" class="value"><g:link controller="client" action="show" id="${sendLogData?.client?.id}">${sendLogData?.client?.encodeAsHTML()}</g:link></td>
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sendLog.recipient.label" default="Recipient" /></td>
                            <td valign="top" class="value"><g:link controller="receiveClient" action="show" id="${sendLogData?.receiveClient?.id}">${sendLogData?.receiveClient?.encodeAsHTML()}</g:link></td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sendLog.msgCtrlId.label" default="Msg Ctrl Id" /></td>
                            <td valign="top" class="value">${fieldValue(bean: sendLogData, field: "msgCtrlId")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sendLog.ack.label" default="Ack" /></td>
                            <td valign="top" class="value">${fieldValue(bean: sendLogData, field: "ack")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sendLog.message.label" default="Message" /></td>
                            <td valign="top" class="value">${fieldValue(bean: sendLogData, field: "message")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sendLog.sentTime.label" default="Sent Time" /></td>
                            <td valign="top" class="value"><g:formatDate date="${sendLogData?.sentTime}" /></td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sendLog.dateCreated.label" default="Date Created" /></td>
                            <td valign="top" class="value"><g:formatDate date="${sendLogData?.dateCreated}" /></td>
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${sendLogData?.id}" />
                    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
				</g:form>
            </div>
        </div>
    </body>
</html>
