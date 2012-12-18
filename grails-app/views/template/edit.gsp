

<%@ page import="com.bssi.Template" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'template.label', default: 'Template')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>        
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            </div>
            <g:form method="post" >
                <g:hiddenField name="id" value="${templateData?.id}" />
                <g:hiddenField name="version" value="${templateData?.version}" />
                <div class="dialog">
                    <table class="table">
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <b/><label for="type"><g:message code="template.type.label" default="Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: templateData, field: 'type', 'errors')}">
                                    <g:select name="type" from="${templateData.constraints.type.inList}" value="${templateData?.type}" valueMessagePrefix="template.type" disabled="true"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <b/><label for="hl7version"><g:message code="template.hl7version.label" default="Hl7version" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: templateData, field: 'hl7version', 'errors')}">
                                    <g:select name="hl7version" from="${templateData.constraints.hl7version.inList}" value="${templateData?.hl7version}" valueMessagePrefix="template.hl7version" disabled="true" />
                                </td>
                            </tr>
                        
                            %{--<tr class="prop">--}%
                                %{--<td valign="top" class="name">--}%
                                  %{--<label for="segment"><g:message code="template.segment.label" default="Segment" /></label>--}%
                                %{--</td>--}%
                                %{--<td valign="top" class="value ${hasErrors(bean: templateData, field: 'segment', 'errors')}">--}%
                                    %{--<g:select name="segment" from="${templateData.constraints.segment.inList}" value="${templateData?.segment}" valueMessagePrefix="template.segment"  />--}%
                                %{--</td>--}%
                            %{--</tr>--}%

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <b/> <label for="segment"><g:message code="template.segment.label" default="Segment" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: templateData, field: 'segment', 'errors')}">
                                    <g:textField name="segment" value="${fieldValue(bean: templateData, field: 'segment')}" readOnly="true"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <b/> <label for="segmentIndex"><g:message code="template.segmentIndex.label" default="Segment Index" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: templateData, field: 'segmentIndex', 'errors')}">
                                    <g:textField name="segmentIndex" value="${fieldValue(bean: templateData, field: 'segmentIndex')}" readOnly="true"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <b/><label for="field"><g:message code="template.field.label" default="Field" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: templateData, field: 'field', 'errors')}">
                                    <g:textField name="field" value="${fieldValue(bean: templateData, field: 'field')}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <b/><label for="fieldIndex"><g:message code="template.filedIndex.label" default="FieldIndex" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: templateData, field: 'fieldIndex', 'errors')}">
                                    <g:textField name="fieldIndex" value="${fieldValue(bean: templateData, field: 'fieldIndex')}" readOnly="true" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <b/> <label for="subfield"><g:message code="template.subfield.label" default="Subfield" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: templateData, field: 'subfield', 'errors')}">
                                    <b/><g:textField name="subfield" value="${templateData?.subfield}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <b/><label for="subfieldIndex"><g:message code="template.subfieldIndex.label" default="subfieldIndex" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: templateData, field: 'subfieldIndex', 'errors')}">
                                    <g:textField name="subfieldIndex" value="${templateData?.subfieldIndex}" readOnly="true"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <b/><label for="mandatory"><g:message code="template.mandatory.label" default="Mandatory" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: templateData, field: 'mandatory', 'errors')}">
                                    <g:checkBox name="mandatory" value="${templateData?.mandatory}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <b/> <label for="required"><g:message code="template.required.label" default="Required" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: templateData, field: 'required', 'errors')}">
                                    <g:checkBox name="required" value="${templateData?.required}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <b/><label for="repeatable"><g:message code="template.repeatable.label" default="Repeatable" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: templateData, field: 'repeatable', 'errors')}">
                                    <g:checkBox name="repeatable" value="${templateData?.repeatable}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <b/><label for="length"><g:message code="template.length.label" default="Length" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: templateData, field: 'length', 'errors')}">
                                    <g:textField name="length" value="${fieldValue(bean: templateData, field: 'length')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <b/><label for="description"><g:message code="template.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: templateData, field: 'description', 'errors')}">
                                    <g:textArea name="description" cols="40" rows="5" value="${templateData?.description}" />
                                </td>
                            </tr>
                        

                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
                    <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
           		</div>
            </g:form>
        </div>
    </body>
</html>
