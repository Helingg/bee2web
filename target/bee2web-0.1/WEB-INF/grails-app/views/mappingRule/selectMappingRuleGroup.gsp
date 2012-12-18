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
<div class="row-fluid">
<div class="span3">
<div class="well sidebar-nav">
<ul class="nav nav-list">
   <li class="nav-header">Option</li>
   <li class="active"><g:link onclick="closeWindow();"><i class="icon-back"></i><g:message code="default.close.label" args="[entityName]" /></g:link></li>
        </ul>
            </div>
            </div>
    <g:if test="${flash.message}">
        <div class="message span9" style="color: red">${flash.message}</div>
    </g:if>
    <div class="span9">
        <div class="well ">
            %{--<div class="control-group">--}%
                %{--<label class="control-label" for="name" ><g:message code="mappingRuleGroup.name.label" default="Name" /></label>--}%
                %{--<div class="controls">--}%
                    %{--<g:textField class="input-xlarge focused" style="height:25px" name="name" maxlength="128" value="${params?.name}" />--}%
                %{--</div>--}%
            %{--</div>--}%

            %{--<div class="control-group">--}%
            %{--<label class="control-label" for="type" ><g:message code="application.type.label" default="Type" /></label>--}%
            %{--<div class="controls">--}%
            %{--<g:select name="type" value="${params?.type}" optionKey="type" optionValue="typeshow" from="${[[type:true,typeshow:'From'],[type:false,typeshow:'To']]}"--}%
            %{--noSelection="${['':'-Type-']}" onclick="return false" onfocus="return false" readonly="true"></g:select>--}%
            %{--<g:if test="${params?.type=='true'}">--}%
            %{--<g:textField name="typeShow" value="From" readonly="true" style="height: 28px"></g:textField>--}%
            %{--<g:hiddenField name="type" value="${params?.type}" readonly="true" style="height: 28px"></g:hiddenField>--}%
            %{--</g:if>--}%
            %{--<g:else>--}%
            %{--<g:textField name="typeShow" value="To" readonly="true" style="height: 28px"></g:textField>--}%
            %{--<g:hiddenField name="type" value="${params?.type}" readonly="true" style="height: 28px"></g:hiddenField>--}%
            %{--</g:else>--}%

            %{--</div>--}%
            %{--</div>--}%
            %{--<br>--}%
            %{--<div class="control offset4">--}%
                %{--<g:actionSubmit class="btn btn-primary" action="selectApplication" value="${message(code: 'default.button.search.label', default: 'Search')}" />--}%
            %{--</div>--}%

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
                </div
            </div>
        </div>
    </div>
</g:form>
</div>
</div>
</body>
</html>