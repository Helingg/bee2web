<%--
  Created by IntelliJ IDEA.
  User: HLG
  Date: 12-10-21
  Time: 下午5:14
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="" />
    <g:set var="entityName" value="${message(code: 'mappingRuleGroup.label', default: 'Mapping Rule Group')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'divbk.css')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'bootstrap.css')}" />
    <script type="text/javascript">
//        var mappingRuleGroupStr="";
        function reMappingRuleGroup(id,name,type,fromApplication,toApplication,comments,activeInd,fid,tid,fversion,tversion){
//            mappingRuleGroupStr = mappingRuleGroupStr + id + "," + name +","+ type +","+fromApplication+","+toApplication+ ",";
//            alert(activeInd);
            parent.window.opener.setMappingRuleGroupInfo(id,name,type,fromApplication,toApplication,comments,activeInd,fid,tid,fversion,tversion);
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
            <div>
                <table class="table table-condensed table-striped">
                    <thead>
                    <tr>

                        <th>${message(code: 'mappingRuleGroup.id.label', default: 'Id')}</th>

                        <th>${message(code: 'mappingRuleGroup.name.label', default: 'Name')}</th>

                        <th>${message(code: 'mappingRuleGroup.type.label', default: 'Type')}</th>

                        <th>${message(code: 'mappingRuleGroup.fromApplication.label', default: 'From Application')}</th>

                        <th>${message(code: 'mappingRuleGroup.toApplication.label', default: 'To Application')}</th>

                        %{--<th>${message(code: 'mappingRuleGroup.comments.label', default: 'Comments')}</th>--}%

                        %{--<th>${message(code: 'mappingRuleGroup.dateCreated.label', default: 'Date Created')}</th>--}%

                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${mappingRuleGroupDataList}" status="i" var="mappingRuleGroupData">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><g:link onclick="javascript:reMappingRuleGroup('${mappingRuleGroupData.id}','${mappingRuleGroupData.name}','${mappingRuleGroupData.type}','${mappingRuleGroupData.fromApplication}','${mappingRuleGroupData.toApplication}','${mappingRuleGroupData.comments}','${mappingRuleGroupData.activeInd}','${mappingRuleGroupData.fromApplication.id}','${mappingRuleGroupData.toApplication.id}','${mappingRuleGroupData.fromApplication.applicationVersion}','${mappingRuleGroupData.toApplication.applicationVersion}')">${fieldValue(bean: mappingRuleGroupData, field: "id")}</g:link></td>

                            <td><g:link onclick="javascript:reMappingRuleGroup('${mappingRuleGroupData.id}','${mappingRuleGroupData.name}','${mappingRuleGroupData.type}','${mappingRuleGroupData.fromApplication}','${mappingRuleGroupData.toApplication}','${mappingRuleGroupData.comments}','${mappingRuleGroupData.activeInd}','${mappingRuleGroupData.fromApplication.id}','${mappingRuleGroupData.toApplication.id}','${mappingRuleGroupData.fromApplication.applicationVersion}','${mappingRuleGroupData.toApplication.applicationVersion}')">${fieldValue(bean: mappingRuleGroupData, field: "name")}</g:link></td>

                            <td><g:link onclick="javascript:reMappingRuleGroup('${mappingRuleGroupData.id}','${mappingRuleGroupData.name}','${mappingRuleGroupData.type}','${mappingRuleGroupData.fromApplication}','${mappingRuleGroupData.toApplication}','${mappingRuleGroupData.comments}','${mappingRuleGroupData.activeInd}','${mappingRuleGroupData.fromApplication.id}','${mappingRuleGroupData.toApplication.id}','${mappingRuleGroupData.fromApplication.applicationVersion}','${mappingRuleGroupData.toApplication.applicationVersion}')">${fieldValue(bean: mappingRuleGroupData, field: "type")}</g:link></td>

                            <td><g:link onclick="javascript:reMappingRuleGroup('${mappingRuleGroupData.id}','${mappingRuleGroupData.name}','${mappingRuleGroupData.type}','${mappingRuleGroupData.fromApplication}','${mappingRuleGroupData.toApplication}','${mappingRuleGroupData.comments}','${mappingRuleGroupData.activeInd}','${mappingRuleGroupData.fromApplication.id}','${mappingRuleGroupData.toApplication.id}','${mappingRuleGroupData.fromApplication.applicationVersion}','${mappingRuleGroupData.toApplication.applicationVersion}')">${fieldValue(bean: mappingRuleGroupData, field: "fromApplication")}</g:link></td>

                            <td><g:link onclick="javascript:reMappingRuleGroup('${mappingRuleGroupData.id}','${mappingRuleGroupData.name}','${mappingRuleGroupData.type}','${mappingRuleGroupData.fromApplication}','${mappingRuleGroupData.toApplication}','${mappingRuleGroupData.comments}','${mappingRuleGroupData.activeInd}','${mappingRuleGroupData.fromApplication.id}','${mappingRuleGroupData.toApplication.id}','${mappingRuleGroupData.fromApplication.applicationVersion}','${mappingRuleGroupData.toApplication.applicationVersion}')">${fieldValue(bean: mappingRuleGroupData, field: "toApplication")}</g:link></td>

                            %{--<td>${mappingRuleGroupData.activeInd}</td>--}%

                            %{--<td><g:formatDate date="${mappingRuleGroupData.dateCreated}" /></td>--}%

                        </tr>
                    </g:each>
                    </tbody>
                </table>
                <div class="pager">
                    <g:paginate action="searchMappingRuleGroup" params="[params:params]" total="${mappingRuleGroupDataTotal}" />
                </div>
            </div>
        </div>
    </div>
</g:form>
</div>
</body>
</html>