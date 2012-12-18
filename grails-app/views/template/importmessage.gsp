

<%@ page import="com.bssi.Template" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'template.label', default: 'Template')}" />
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
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="type"><g:message code="template.type.label" default="Type" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: templateData, field: 'type', 'errors')}">
                        <g:select name="type" from="${templateData.constraints.type.inList}" value="${templateData?.type}" valueMessagePrefix="template.type"  />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="hl7version"><g:message code="template.hl7version.label" default="Hl7version" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: templateData, field: 'hl7version', 'errors')}">
                        <g:select name="hl7version" from="${templateData.constraints.hl7version.inList}" value="${templateData?.hl7version}" valueMessagePrefix="template.hl7version"  />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="segment"><g:message code="template.segment.label" default="Segment" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: templateData, field: 'segment', 'errors')}">
                        <g:select name="segment" from="${templateData.constraints.segment.inList}" value="${templateData?.segment}" valueMessagePrefix="template.segment"  />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="displayOrder"><g:message code="template.displayOrder.label" default="Display Order" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: templateData, field: 'displayOrder', 'errors')}">
                        <g:textField name="displayOrder" value="${fieldValue(bean: templateData, field: 'displayOrder')}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="mandatory"><g:message code="template.mandatory.label" default="Mandatory" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: templateData, field: 'mandatory', 'errors')}">
                        <g:checkBox name="mandatory" value="${templateData?.mandatory}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="repeatable"><g:message code="template.repeatable.label" default="Repeatable" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: templateData, field: 'repeatable', 'errors')}">
                        <g:checkBox name="repeatable" value="${templateData?.repeatable}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="length"><g:message code="template.length.label" default="Length" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: templateData, field: 'length', 'errors')}">
                        <g:textField name="length" value="${fieldValue(bean: templateData, field: 'length')}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="description"><g:message code="template.description.label" default="Description" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: templateData, field: 'description', 'errors')}">
                        <g:textArea name="description" cols="40" rows="5" value="${templateData?.description}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="messageIndex"><g:message code="template.messageIndex.label" default="Message Index" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: templateData, field: 'messageIndex', 'errors')}">
                        <g:textField name="messageIndex" value="${fieldValue(bean: templateData, field: 'messageIndex')}" />
                    </td>
                </tr>

                </tbody>
            </table>
        </div>
        <div class="buttons">
            <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
    </g:form>
</div>
</body>
</html>
