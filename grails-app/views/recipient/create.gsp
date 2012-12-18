

<%@ page import="com.bssi.Recipient" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'recipient.label', default: 'Recipient')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <script type="text/javascript">
        function checkForm(){
            var checkip =/^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/;
            var checknum=/^[0-9]{1,20}$/;
            var ip = document.getElementById("ip").value;

            if(document.getElementById("name").value==""){
                alert("Name can not be blank");
                document.getElementById("name").focus();
                return false;
            }
            if(document.getElementById("ip").value==""){
                alert("Ip can not be blank");
                document.getElementById("ip").focus();
                return false;
            }
            if(!checkip.exec(ip)){
                alert("Ip format is wrong");
                document.getElementById("ip").focus();
                return false;
            }
            if(document.getElementById("port").value==""){
                alert("Port can not be blank");
                document.getElementById("port").focus();
                return false;
            }
            if(document.getElementById("application").value==""){
                alert("Application can not be blank");
                document.getElementById("application").focus();
                return false;
            }
            if(document.getElementById("provider").value==""){
                alert("Provider can not be blank");
                document.getElementById("provider").focus();
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
            <g:hasErrors bean="${recipientData}">
            <div class="errors">
                <g:renderErrors bean="${recipientData}" as="list" />
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
                                    <label for="name"><g:message code="recipient.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: recipientData, field: 'name', 'errors')}">
                                    <g:textField name="name" maxlength="64" value="${recipientData?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="membership"><g:message code="recipient.membership.label" default="Membership" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: recipientData, field: 'membership', 'errors')}">
                                    <g:select name="membership" from="${recipientData.constraints.membership.inList}" value="${recipientData?.membership}" valueMessagePrefix="recipient.membership"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ip"><g:message code="recipient.ip.label" default="Ip" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: recipientData, field: 'ip', 'errors')}">
                                    <g:textField name="ip" maxlength="32" value="${recipientData?.ip}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="port"><g:message code="recipient.port.label" default="Port" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: recipientData, field: 'port', 'errors')}">
                                    <g:textField name="port" value="${fieldValue(bean: recipientData, field: 'port')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="other"><g:message code="recipient.other.label" default="Other" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: recipientData, field: 'other', 'errors')}">
                                    <g:textField name="other" maxlength="128" value="${recipientData?.other}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="enabled"><g:message code="recipient.enabled.label" default="Enabled" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: recipientData, field: 'enabled', 'errors')}">
                                    <g:checkBox name="enabled" value="${recipientData?.enabled}" />
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
