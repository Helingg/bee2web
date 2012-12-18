

<%@ page import="com.bssi.MappingRule" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'mappingRule.label', default: 'MappingRule')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <script type="text/javascript">
            function checkValue(){
                var checknum=/^[0-9]{1,20}$/;
                var mappingRuleGroup = document.getElementById('mappingRuleGroup.id');
                var valueSelect = document.getElementById('valueSelect');
                var fromSegment = document.getElementById('fromSegment');
                var fromIndex = document.getElementById('fromIndex');
                var fromSubIndex = document.getElementById('fromSubIndex');
                var toSegment = document.getElementById('toSegment');
                var toIndex = document.getElementById('toIndex');
                var toSubIndex = document.getElementById('toSubIndex');
                var value = document.getElementById('value');
                if(!mappingRuleGroup.value){
                    alert('Mapping Rule Group can not be blank!');
                    mappingRuleGroup.style.borderColor = 'red';
                    mappingRuleGroup.focus();
                    return false;
                }
                if(!valueSelect.checked&&!fromSegment.value){
                    alert('From Segment can not be blank!');
                    fromSegment.style.borderColor = 'red';
                    fromSegment.focus();
                    return false;
                }
                if(!valueSelect.checked&&!checknum.exec(fromIndex.value)){
                    alert('From Index can not be blank and must be a number!');
                    fromIndex.style.borderColor = 'red';
                    fromIndex.focus();
                    return false;
                }

                if(!valueSelect.checked&&!checknum.exec(fromSubIndex.value)){
                    fromSubIndex.value=0;
                }

                if(!toSegment.value){
                    alert('To Segment can not be blank!');
                    toSegment.style.borderColor = 'red';
                    toSegment.focus();
                    return false;
                }

                if(!checknum.exec(toIndex.value)){
                    alert('To Index can not be blank and must be a number!');
                    toIndex.style.borderColor = 'red';
                    toIndex.focus();
                    return false;
                }

                if(!checknum.exec(toSubIndex.value)){
                    toSubIndex.value=0;
                }
                if(valueSelect.checked){
                    if(!value.value){
                        alert('The Value can not be blank!');
                        value.style.borderColor = 'red';
                        value.focus();
                        return false;
                    }
                }
                return true;
            }
            function changeOperator(){
                var valueShow = document.getElementById('valueShow');
                var operator = document.getElementById('operator');
                if(operator.value=='SET'){
                    valueShow.style.display="";
                }else{
                    valueShow.style.display="none";
                }
            }
            function selectValue(){
                var tdvalue = document.getElementById('tdValue');
                var valueSelect = document.getElementById('valueSelect');
                var fromSegment = document.getElementById('fromSegment');
                var fromIndex = document.getElementById('fromIndex');
                var fromSubIndex = document.getElementById('fromSubIndex');
                var value = document.getElementById('value');
                if(valueSelect.checked){
                    tdvalue.style.display="";
                    fromSegment.readOnly=true;
                    fromSegment.value="";
                    fromIndex.readOnly=true;
                    fromIndex.value=0;
                    fromSubIndex.readOnly=true;
                    fromSubIndex.value=0;
                }else{
                    tdvalue.style.display="none";
                    fromSegment.readOnly=false;
                    fromSegment.value="";
                    fromIndex.readOnly=false;
                    fromIndex.value=0;
                    fromSubIndex.readOnly=false;
                    fromSubIndex.value=0;
                    value.value="";
                }
            }
        </script>
    </head>
    <body>        
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${mappingRuleData}">
            <div class="errors">
                <g:renderErrors bean="${mappingRuleData}" as="list" />
            </div>
            </g:hasErrors>
			<div class="nav">            
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            </div>
            <g:form action="save" >
                <div class="dialog">
                    <table class="table">
                        <tbody>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <b/> <label for="mappingRuleGroup"><g:message code="mappingRule.mappingRuleGroup.label" default="Mapping Rule Group" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: mappingRuleData, field: 'mappingRuleGroup', 'errors')}">
                                <g:select name="mappingRuleGroup.id" from="${com.bssi.MappingRuleGroup.list()}" optionKey="id" value="${mappingRuleData?.mappingRuleGroup?.id}"  />
                            </td>
                        </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <b/><label for="operator"><g:message code="mappingRule.operator.label" default="Operator" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mappingRuleData, field: 'operator', 'errors')}">
                                    <g:select name="operator" id="operator" onchange="changeOperator();" optionKey="operator" optionValue="operatorShow" from="${[[operator:'ADD',operatorShow:'ADD'],[operator:'SET',operatorShow:'SET'],[operator:'MOV',operatorShow:'MOV'],[operator:'DEL',operatorShow:'DEL']]}" value="${mappingRuleData?.operator}"></g:select>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <b/><label for="fromSegment"><g:message code="mappingRule.fromSegment.label" default="From Segment" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mappingRuleData, field: 'fromSegment', 'errors')}">
                                    <g:textField name="fromSegment" maxlength="3" value="${mappingRuleData?.fromSegment}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <b/><label for="fromIndex"><g:message code="mappingRule.fromIndex.label" default="From Index" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mappingRuleData, field: 'fromIndex', 'errors')}">
                                    <g:textField name="fromIndex" value="${fieldValue(bean: mappingRuleData, field: 'fromIndex')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                    <td valign="top" class="name">
                                    <b/><label for="fromSubIndex"><g:message code="mappingRule.fromSubIndex.label" default="From Sub Index" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mappingRuleData, field: 'fromSubIndex', 'errors')}">
                                    <g:textField name="fromSubIndex" value="${fieldValue(bean: mappingRuleData, field: 'fromSubIndex')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <b/><label for="toSegment"><g:message code="mappingRule.toSegment.label" default="To Segment" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mappingRuleData, field: 'toSegment', 'errors')}">
                                    <g:textField name="toSegment" maxlength="3" value="${mappingRuleData?.toSegment}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <b/><label for="toIndex"><g:message code="mappingRule.toIndex.label" default="To Index" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mappingRuleData, field: 'toIndex', 'errors')}">
                                    <g:textField name="toIndex" value="${fieldValue(bean: mappingRuleData, field: 'toIndex')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <b/><label for="toSubIndex"><g:message code="mappingRule.toSubIndex.label" default="To Sub Index" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mappingRuleData, field: 'toSubIndex', 'errors')}">
                                    <g:textField name="toSubIndex" value="${fieldValue(bean: mappingRuleData, field: 'toSubIndex')}" />
                                </td>
                            </tr>
                        <tr id="valueShow" style="display: none">
                            <td valign="top" class="name" >
                                <b/><label for="value" style="margin: 0 70px 0 0 "><g:message code="mappingRule.value.label" default="Value" /></label>
                                <g:checkBox  name="valueSelect" id="valueSelect" onclick="selectValue();"></g:checkBox>
                            </td>
                            <td style="display: none" id="tdValue" valign="top" class="value ${hasErrors(bean: mappingRuleData, field: 'value', 'errors')}">
                                <g:textArea name="value" cols="40" rows="5" value="${mappingRuleData?.value}" />
                            </td>
                        </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <b/><label for="other"><g:message code="mappingRule.other.label" default="Other" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mappingRuleData, field: 'other', 'errors')}">
                                    <g:textArea name="other" cols="40" rows="5" value="${mappingRuleData?.other}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <b/><label for="comments"><g:message code="mappingRule.comments.label" default="Comments" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mappingRuleData, field: 'comments', 'errors')}">
                                    <g:textArea name="comments" cols="40" rows="5" value="${mappingRuleData?.comments}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <b/><label for="scriptext"><g:message code="mappingRule.scriptext.label" default="Scriptext" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mappingRuleData, field: 'scriptext', 'errors')}">
                                    <g:textArea name="scriptext" cols="40" rows="5" value="${mappingRuleData?.scriptext}" />
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" onclick="return checkValue();" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
					<span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
