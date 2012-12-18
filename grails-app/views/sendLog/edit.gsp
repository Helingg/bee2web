

<%@ page import="com.bssi.SendLog" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'sendLog.label', default: 'Send Log')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <g:javascript library="ui/jquery.ui.datepicker" />
        <script type="text/javascript">
            $(function() {
                $("#sentTime").datepicker();
            });
            function checkForm(){
                if(document.getElementById("msgCtrlId").value==""){
                    alert("Msg Ctrl Id can not be blank");
                    document.getElementById("msgCtrlId").focus();
                    return false;
                }
                if(document.getElementById("ack").value==""){
                    alert("Ack can not be blank");
                    document.getElementById("ack").focus();
                    return false;
                }
                if(document.getElementById("message").value==""){
                    alert("Message Ctrl Id can not be blank");
                    document.getElementById("message").focus();
                    return false;
                }
                if(document.getElementById("sentTime").value==""){
                    alert("Sent Time Id can not be blank");
                    document.getElementById("sentTime").focus();
                    return false;
                }
                if(document.getElementById("clientId").value==""){
                    alert("Client Id  can not be blank");
                    document.getElementById("clientId").focus();
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>        
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${sendLogData}">
            <div class="errors">
                <g:renderErrors bean="${sendLogData}" as="list" />
            </div>
            </g:hasErrors>
			<div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            </div>
            <g:form method="post" >
                <g:hiddenField name="id" value="${sendLogData?.id}" />
                <g:hiddenField name="version" value="${sendLogData?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="msgCtrlId"><g:message code="sendLog.msgCtrlId.label" default="Msg Ctrl Id" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sendLogData, field: 'msgCtrlId', 'errors')}">
                                    <g:textField name="msgCtrlId" maxlength="20" value="${sendLogData?.msgCtrlId}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="ack"><g:message code="sendLog.ack.label" default="Ack" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sendLogData, field: 'ack', 'errors')}">
                                    <g:textArea name="ack" cols="40" rows="5" value="${sendLogData?.ack}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="message"><g:message code="sendLog.message.label" default="Message" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sendLogData, field: 'message', 'errors')}">
                                    <g:textArea name="message" cols="40" rows="5" value="${sendLogData?.message}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="sentTime"><g:message code="sendLog.sentTime.label" default="Sent Time" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sendLogData, field: 'sentTime', 'errors')}">
                                    <g:datePicker name="sentTime" id="sentTime" precision="day" value="${sendLogData?.sentTime}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="recipient"><g:message code="sendLog.recipient.label" default="Recipient" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sendLogData, field: 'recipient', 'errors')}">
                                    <g:select name="recipient.id" from="${com.bssi.Recipient.list()}" optionKey="id" value="${sendLogData?.recipient?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="client"><g:message code="sendLog.client.label" default="Client" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sendLogData, field: 'client', 'errors')}">
                                    <g:select name="client.id" from="${com.bssi.Client.list()}" optionKey="id" value="${sendLogData?.client?.id}"  />
                                </td>
                            </tr>
                        

                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
           		</div>
            </g:form>
        </div>
    </body>
</html>
