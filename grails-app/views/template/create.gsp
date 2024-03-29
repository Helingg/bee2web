

<%@ page import="com.bssi.Template" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'template.label', default: 'Template')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>        
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${templateData}">
            <div class="errors">
                <g:renderErrors bean="${templateData}" as="list" />
            </div>
            </g:hasErrors>
			<div class="nav">            
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            </div>
            <g:form action="save" >
                    <table class="table">
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <b/><label for="type"><g:message code="template.type.label" default="Message Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: templateData, field: 'type', 'errors')}">
                                    <g:select name="type" from="${templateData.constraints.type.inList}" value="${templateData?.type}" valueMessagePrefix="template.type"  />
                                </td>

                                <td valign="top" class="name">
                                    <b/> <label for="hl7version"><g:message code="template.hl7version.label" default="Hl7 Version" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: templateData, field: 'hl7version', 'errors')}">
                                    <g:select name="hl7version" from="${templateData.constraints.hl7version.inList}" value="${templateData?.hl7version}" valueMessagePrefix="template.hl7version"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td  colspan="4" valign="top"><g:textArea style="width: 800px" name="hl7message" rows="400" cols="400"></g:textArea></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        
                    </table>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
					<span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
