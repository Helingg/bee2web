
<%@ page import="com.bssi.MappingRule" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'mappingRule.label', default: 'MappingRule')}" />
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
                <table class='table'>
                    <tbody>
                    

                        <tr class="prop">
                            <td valign="top" class="name"><b/><g:message code="mappingRule.mappingRuleGroup.label" default="Mapping Rule Group" /></td>

                            <td valign="top" class="value"><g:link controller="mappingRuleGroup" action="show" id="${mappingRuleData?.mappingRuleGroup?.id}">${mappingRuleData?.mappingRuleGroup?.encodeAsHTML()}</g:link></td>

                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><b/><g:message code="mappingRule.operator.label" default="Operator" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: mappingRuleData, field: "operator")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><b/><g:message code="mappingRule.fromSegment.label" default="From Segment" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: mappingRuleData, field: "fromSegment")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><b/><g:message code="mappingRule.fromIndex.label" default="From Index" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: mappingRuleData, field: "fromIndex")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><b/><g:message code="mappingRule.fromSubIndex.label" default="From Sub Index" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: mappingRuleData, field: "fromSubIndex")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><b/><g:message code="mappingRule.toSegment.label" default="To Segment" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: mappingRuleData, field: "toSegment")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><b/><g:message code="mappingRule.toIndex.label" default="To Index" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: mappingRuleData, field: "toIndex")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><b/><g:message code="mappingRule.toSubIndex.label" default="To Sub Index" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: mappingRuleData, field: "toSubIndex")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><b/><g:message code="mappingRule.value.label" default="Value" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: mappingRuleData, field: "value")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><b/><g:message code="mappingRule.other.label" default="Other" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: mappingRuleData, field: "other")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><b/><g:message code="mappingRule.comments.label" default="Comments" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: mappingRuleData, field: "comments")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><b/><g:message code="mappingRule.scriptext.label" default="Scriptext" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: mappingRuleData, field: "scriptext")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><b/><g:message code="mappingRule.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${mappingRuleData?.dateCreated}" /></td>
                            
                        </tr>

                    </tbody>
                </table>

                </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${mappingRuleData?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
                    <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
                </g:form>
            </div>

            </div>

    </body>
</html>
