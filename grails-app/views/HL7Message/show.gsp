
<%@ page import="com.bssi.HL7Message" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'HL7Message.label', default: 'HL7Message')}" />
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
                            <td valign="top" class="name"><g:message code="HL7Message.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: HL7MessageData, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="HL7Message.msgCtrlId.label" default="Msg Ctrl Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: HL7MessageData, field: "msgCtrlId")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="HL7Message.type.label" default="Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: HL7MessageData, field: "type")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="HL7Message.event.label" default="Event" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: HL7MessageData, field: "event")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="HL7Message.message.label" default="Message" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: HL7MessageData, field: "message")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="HL7Message.remoteIp.label" default="Remote Ip" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: HL7MessageData, field: "remoteIp")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="HL7Message.counter.label" default="Counter" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: HL7MessageData, field: "counter")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="HL7Message.enabled.label" default="Enabled" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${HL7MessageData?.enabled}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="HL7Message.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${HL7MessageData?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="HL7Message.client.label" default="Client" /></td>
                            
                            <td valign="top" class="value"><g:link controller="client" action="show" id="${HL7MessageData?.client?.id}">${HL7MessageData?.client?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${HL7MessageData?.id}" />
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
				</g:form>
            </div>
        </div>
    </body>
</html>
