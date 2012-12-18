
<%@ page import="com.bssi.MappingRuleGroup" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="" />
    <g:set var="entityName" value="${message(code: 'mappingRuleGroup.label', default: 'Mapping Rule Group')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <link rel="stylesheet" href="${resource(dir:'css',file:'divbk.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'bootstrap.css')}" />

    <script type="text/javascript">
        function setRuleGroup(id,name,type,comments){
            parent.window.opener.setRuleGroupInfo(id,name,type,comments);
            top.close();
        }
        function closeWindow(){
            top.close();
        }
    </script>
</head>
<body>
<h1><g:message code="default.list.label" args="[entityName]" /></h1>
<hr>

<g:form method="post"  class="form-horizontal" >
    <div class="container-fluid span10">
        <div class="span12 divbk">
            <g:link onclick="closeWindow();"><i class="icon-remove"></i><g:message code="default.close.label" args="[entityName]" /></g:link>
        </div>
        <g:if test="${flash.message}">
            <div class="message span12" style="color: red">${flash.message}</div>
        </g:if>
        <div class="span12">
            <div class="well ">
                <div class="control-group">
                    <label class="control-label" for="name" ><g:message code="mappingRuleGroup.name.label" default="Name" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="name" maxlength="128" style="height: 30px" value="${params?.name}" />
                    </div>
                </div>
                <br>
                <div class="control offset4">
                    <g:actionSubmit class="btn btn-primary" action="selectMappingRuleGroup" value="${message(code: 'default.button.search.label', default: 'Search')}" />
                </div>

                <br>
                <div>
                    <table class="table table-condensed table-striped">
                        <thead>
                        <tr>

                            <th>${message(code: 'mappingRuleGroup.id.label', default: 'Id')}</th>

                            <th>${message(code: 'mappingRuleGroup.name.label', default: 'Name')}</th>

                            <th>${message(code: 'mappingRuleGroup.type.label', default: 'Type')}</th>

                            <th>${message(code: 'mappingRuleGroup.comments.label', default: 'Comments')}</th>


                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${mappingRuleGroupDataList}" status="i" var="mappingRuleGroupData">
                            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                                <td><g:link onclick="javascript:setRuleGroup('${mappingRuleGroupData.id}','${mappingRuleGroupData.name}','${mappingRuleGroupData.type}','${mappingRuleGroupData.comments}')">${fieldValue(bean: mappingRuleGroupData, field: "id")}</g:link></td>

                                <td><g:link onclick="javascript:setRuleGroup('${mappingRuleGroupData.id}','${mappingRuleGroupData.name}','${mappingRuleGroupData.type}','${mappingRuleGroupData.comments}')" >${fieldValue(bean: mappingRuleGroupData, field: "name")}</g:link></td>

                                <td><g:link onclick="javascript:setRuleGroup('${mappingRuleGroupData.id}','${mappingRuleGroupData.name}','${mappingRuleGroupData.type}','${mappingRuleGroupData.comments}')">${fieldValue(bean: mappingRuleGroupData, field: "type")}</g:link></td>

                                <td><g:link onclick="javascript:setRuleGroup('${mappingRuleGroupData.id}','${mappingRuleGroupData.name}','${mappingRuleGroupData.type}','${mappingRuleGroupData.comments}')">${fieldValue(bean: mappingRuleGroupData, field: "comments")}</g:link></td>

                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                    <div class="pager">
                        <g:paginate action="selectMappingRuleGroup" params="[params:params]" total="${mappingRuleGroupDataTotal}" />
                    </div
                </div>
            </div>
        </div>
    </div>
    </div>
</g:form>
</body>
</html>
