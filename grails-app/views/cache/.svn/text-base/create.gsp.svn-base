

<%@ page import="com.bssi.Cache" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'cache.label', default: 'Message On Hold')}" />
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
                if(document.getElementById("message").value==""){
                    alert("Message Name can not be blank");
                    document.getElementById("message").focus();
                    return false;
                }
                if(document.getElementById("remoteIp").value==""){
                    alert("Remote Ip can not be blank");
                    document.getElementById("remoteIp").focus();
                    return false;
                }
                if(!checkip.exec(remoteIp)){
                    alert("Remote Ip format is wrong");
                    document.getElementById("remoteIp").focus();
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${cacheData}">
            <div class="errors">
                <g:renderErrors bean="${cacheData}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="msgCtrlId"><g:message code="cache.msgCtrlId.label" default="Msg Ctrl Id" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cacheData, field: 'msgCtrlId', 'errors')}">
                                    <g:textField name="msgCtrlId" maxlength="20" value="${cacheData?.msgCtrlId}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="message"><g:message code="cache.message.label" default="Message" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cacheData, field: 'message', 'errors')}">
                                    <g:textArea name="message" cols="40" rows="5" value="${cacheData?.message}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="remoteIp"><g:message code="cache.remoteIp.label" default="Remote Ip" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cacheData, field: 'remoteIp', 'errors')}">
                                    <g:textField name="remoteIp" maxlength="128" value="${cacheData?.remoteIp}" />
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
