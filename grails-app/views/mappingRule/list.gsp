
<%@ page import="com.bssi.MappingRule" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'mappingRule.label', default: 'MappingRule')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <script type="text/javascript">
            function checkValue(){
                var checknum=/^[0-9]{1,20}$/;
                var fromIndex  = document.getElementById('fromIndex');
                var fromSubIndex  = document.getElementById('fromSubIndex');
                var toIndex  = document.getElementById('toIndex');
                var toSubIndex  = document.getElementById('toSubIndex');
                if(fromIndex.value&&!checknum.exec(fromIndex.value)){
                    alert("From Index must be a number!");
                    fromIndex.style.borderColor = 'red';
                    fromIndex.focus();
                    return false;
                }
                if(fromSubIndex.value&&!checknum.exec(fromSubIndex.value)){
                    alert("From Sub-Index must be a number!");
                    fromSubIndex.style.borderColor = 'red';
                    fromSubIndex.focus();
                    return false;
                }
                if(toIndex.value&&!checknum.exec(toIndex.value)){
                    alert("To Index must be a number!");
                    toIndex.style.borderColor = 'red';
                    toIndex.focus();
                    return false;
                }
                if(toSubIndex.value&&!checknum.exec(toSubIndex.value)){
                    alert("To Sub-Index must be a number!");
                    toSubIndex.style.borderColor = 'red';
                    toSubIndex.focus();
                    return false;
                }
            }
        </script>
    </head>
    <body>        
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <hr>

    <g:form method="post"  class="form-horizontal" >
<div class="container-fluid span10">
<div class="row-fluid">
<div class="span3">
<div class="well sidebar-nav">
   <ul class="nav nav-list">
       <li class="nav-header">Option</li>
       <li class="active"><g:link  action="createRules"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link></li>
        </ul>
            </div>
        </div>

        <div class="span9">
            <g:if test="${flash.message}">
                <div class="message span9" style="color: red">${flash.message}</div>
            </g:if>
            <div class="well span12">

                <div class="control-group">
                    <label class="control-label" for="fromSegment" ><g:message code="mappingRule.fromSegment.label" default="fromSegment" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="fromSegment"  value="${params?.fromSegment}" />
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="toSegment" ><g:message code="mappingRule.toSegment.label" default="To Segment" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="toSegment"  value="${params?.toSegment}" />
                    </div>
                </div>





                <br>
                <div class="control offset4">
                    <g:actionSubmit class="btn btn-primary"  action="searchMappingRule" value="${message(code: 'default.button.search.label', default: 'Search')}" />
                </div>
                <br>
                <div>
                    <table class="table table-condensed table-striped" >
                        <thead>
                        <tr>

                            <th>${message(code: 'mappingRule.id.label', default: 'Id')}</th>

                            <th><g:message code="mappingRule.mappingRuleGroup.label" default="Mapping Rule Group" /></th>

                            <th>${message(code: 'mappingRule.operator.label', default: 'Operator')}</th>

                            <th>${message(code: 'mappingRule.fromSegment.label', default: 'From Segment')} </th>

                            <th>${message(code: 'mappingRule.fromIndex.label', default: 'From Index')} </th>

                            <th>${message(code: 'mappingRule.fromSubIndex.label', default: 'From Sub Index')}</th>

                            <th>${message(code: 'mappingRule.toSegment.label', default: 'To Segment')}</th>

                            <th>${message(code: 'mappingRule.toIndex.label', default: 'To Index')}</th>

                            <th>${message(code: 'mappingRule.toSubIndex.label', default: 'To Sub Index')}</th>

                            <th>${message(code: 'mappingRule.value.label', default: 'Value')}</th>

                            <th>${message(code: 'mappingRule.other.label', default: 'Other')}</th>

                            <th>${message(code: 'mappingRule.scriptext.label', default: 'Scriptext')}</th>

                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${mappingRuleDataList}" status="i" var="mappingRuleData">
                            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                                <td><g:link action="show" id="${mappingRuleData.id}">${fieldValue(bean: mappingRuleData, field: "id")}</g:link></td>

                                <td><g:link action="createRules" id="${mappingRuleData.id}" mappingRuleGroup="${mappingRuleData.mappingRuleGroup}">${fieldValue(bean: mappingRuleData, field: "mappingRuleGroup")}</g:link></td>

                                <td><g:link action="createRules" id="${mappingRuleData.id}">${fieldValue(bean: mappingRuleData, field: "operator")}</g:link></td>

                                <td><g:link action="createRules" id="${mappingRuleData.id}" >${fieldValue(bean: mappingRuleData, field: "fromSegment")}</g:link></td>

                                <td><g:link action="createRules" id="${mappingRuleData.id}">${fieldValue(bean: mappingRuleData, field: "fromIndex")}</g:link></td>

                                <td><g:link action="createRules" id="${mappingRuleData.id}">${fieldValue(bean: mappingRuleData, field: "fromSubIndex")}</g:link></td>

                                <td><g:link action="createRules" id="${mappingRuleData.id}">${fieldValue(bean: mappingRuleData, field: "toSegment")}</g:link></td>

                                <td><g:link action="createRules" id="${mappingRuleData.id}">${fieldValue(bean: mappingRuleData, field: "toIndex")}</g:link></td>

                                <td><g:link action="createRules" id="${mappingRuleData.id}">${fieldValue(bean: mappingRuleData, field: "toSubIndex")}</g:link></td>

                                <td>${fieldValue(bean: mappingRuleData, field: "value")}</td>

                                <td>${fieldValue(bean: mappingRuleData, field: "other")}</td>

                                <td>${fieldValue(bean: mappingRuleData, field: "scriptext")}</td>

                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                    <div class="pager">
                        <g:paginate params="[params:params]" total="${mappingRuleDataTotal}" />
                    </div>
                </div>
            </div>
        </div>
        </div>
        </div>
    </g:form>
    </body>
</html>
