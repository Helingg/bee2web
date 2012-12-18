
<%@ page import="com.bssi.Template" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'template.label', default: 'Template')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
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
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            </div>
            <div class="dialog">
                <table class="table">
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><b/><g:message code="template.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: templateData, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><b/><g:message code="template.type.label" default="Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: templateData, field: "type")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><b/><g:message code="template.hl7version.label" default="Hl7version" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: templateData, field: "hl7version")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><b/><g:message code="template.segment.label" default="Segment" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: templateData, field: "segment")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><b/><g:message code="template.segmentIndex.label" default="Segment Index" /></td>

                            <td valign="top" class="value">${fieldValue(bean: templateData, field: "segmentIndex")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><b/><g:message code="template.field.label" default="Field" /></td>

                            <td valign="top" class="value">${fieldValue(bean: templateData, field: "field")}</td>

                        </tr>


                        <tr class="prop">
                            <td valign="top" class="name"><b/><g:message code="template.fieldIndex.label" default="Field Index" /></td>

                            <td valign="top" class="value">${fieldValue(bean: templateData, field: "fieldIndex")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><b/><g:message code="template.subfield.label" default="Subfield" /></td>

                            <td valign="top" class="value">${templateData?.subfield}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><b/><g:message code="template.subfieldIndex.label" default="Subfield Index" /></td>

                            <td valign="top" class="value">${templateData?.subfieldIndex}</td>

                        </tr>


                        <tr class="prop">
                            <td valign="top" class="name"><b/><g:message code="template.required.label" default="Required" /></td>

                            <td valign="top" class="value"><g:formatBoolean boolean="${templateData?.required}" /></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><b/><g:message code="template.mandatory.label" default="Mandatory" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${templateData?.mandatory}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><b/><g:message code="template.repeatable.label" default="Repeatable" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${templateData?.repeatable}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><b/><g:message code="template.length.label" default="Length" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: templateData, field: "length")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><b/><g:message code="template.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: templateData, field: "description")}</td>
                            
                        </tr>
                    

                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${templateData?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
                    <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
				</g:form>
            </div>
        </div>
    </body>
</html>
