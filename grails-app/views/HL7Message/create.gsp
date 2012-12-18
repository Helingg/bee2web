

<%@ page import="com.bssi.HL7Message" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'HL7Message.label', default: 'Sent Message')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <script type="text/javascript">
            function checkForm(){
                var checkip =/^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/;
                var remoteIp = document.getElementById("remoteIp").value;
                if(document.getElementById("msgCtrlId").value==""){
                    alert("Msg Ctrl Id can not be blank");
                    document.getElementById("msgCtrlId").focus();
                    return false;
                }
                if(document.getElementById("type").value==""){
                    alert("Type can not be blank");
                    document.getElementById("type").focus();
                    return false;
                }
                if(document.getElementById("event").value==""){
                    alert("Event can not be blank");
                    document.getElementById("event").focus();
                    return false;
                }
                if(document.getElementById("message").value==""){
                    alert("Message  can not be blank");
                    document.getElementById("message").focus();
                    return false;
                }
                if(remoteIp==""){
                    alert("Remote Ip  can not be blank");
                    document.getElementById("remoteIp").focus();
                    return false;
                }
                if(!checkip.exec(remoteIp)){
                    alert("Remote Ip  format is wrong");
                    document.getElementById("remoteIp").focus();
                    return false;
                }
                if(document.getElementById("counter").value==""){
                    alert("Counter can not be blank");
                    document.getElementById("counter").focus();
                    return false;
                }
                if(document.getElementById("event").value==""){
                    alert("Event can not be blank");
                    document.getElementById("event").focus();
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>        
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${HL7MessageData}">
            <div class="errors">
                <g:renderErrors bean="${HL7MessageData}" as="list" />
            </div>
            </g:hasErrors>
			<div class="nav">            
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            </div>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="msgCtrlId"><g:message code="HL7Message.msgCtrlId.label" default="Msg Ctrl Id" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: HL7MessageData, field: 'msgCtrlId', 'errors')}">
                                    <g:textField name="msgCtrlId" maxlength="20" value="${HL7MessageData?.msgCtrlId}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="type"><g:message code="HL7Message.type.label" default="Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: HL7MessageData, field: 'type', 'errors')}">
                                    <g:textField name="type" maxlength="3" value="${HL7MessageData?.type}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="event"><g:message code="HL7Message.event.label" default="Event" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: HL7MessageData, field: 'event', 'errors')}">
                                    <g:textField name="event" maxlength="3" value="${HL7MessageData?.event}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="message"><g:message code="HL7Message.message.label" default="Message" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: HL7MessageData, field: 'message', 'errors')}">
                                    <g:textArea name="message" cols="40" rows="5" value="${HL7MessageData?.message}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="remoteIp"><g:message code="HL7Message.remoteIp.label" default="Remote Ip" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: HL7MessageData, field: 'remoteIp', 'errors')}">
                                    <g:textField name="remoteIp" maxlength="128" value="${HL7MessageData?.remoteIp}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="counter"><g:message code="HL7Message.counter.label" default="Counter" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: HL7MessageData, field: 'counter', 'errors')}">
                                    <g:textField name="counter" value="${fieldValue(bean: HL7MessageData, field: 'counter')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="enabled"><g:message code="HL7Message.enabled.label" default="Enabled" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: HL7MessageData, field: 'enabled', 'errors')}">
                                    <g:checkBox name="enabled" value="${HL7MessageData?.enabled}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="client"><g:message code="HL7Message.client.label" default="Client" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: HL7MessageData, field: 'client', 'errors')}">
                                    <g:select name="client.id" from="${com.bssi.Client.list()}" optionKey="id" value="${HL7MessageData?.client?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" onclick="return checkForm();" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
					<span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
