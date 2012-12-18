
<%@ page import="com.bssi.Client" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <g:set var="entityName" value="${message(code: 'provider.label', default: 'Provider Type')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'bootstrap.css')}" />

    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <script type="text/javascript">
        function reProviderType(cid,name,alias,activeInd){
            parent.window.opener.setClientInfo(cid,name,alias,activeInd);
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

                    <div class="control-group">
                        <label class="control-label" for="type" ><g:message code="providerType.type.label" default="Provider Type" /></label>
                        <div class="controls">
                            <g:textField class="input-xlarge focused" style="height:30px" name="type" maxlength="16" value="${params?.type}" />
                        </div>
                    </div>
                    %{--<div class="control-group">--}%
                    %{--<label for="activeInd" class="control-label"><g:message code="client.activeInd.label" default="Active Ind" /></label>--}%
                    %{--<div class="controls">--}%
                    %{--<g:checkBox name="activeInd" value="${params.activeInd}" checked="true"></g:checkBox>--}%
                    %{--</div>--}%
                    %{--</div>--}%

                    <br>
                    <div class="control offset4">
                        <g:actionSubmit class="btn btn-primary" action="selectProviderType" value="${message(code: 'default.button.search.label', default: 'Search')}" />
                    </div>

                    <br>
                    <div>
                        <table class="table table-condensed table-striped">
                            <thead>
                            <tr>

                                <th>${message(code: 'providerType.id.label', default: 'Id')}</th>

                                <th>${message(code: 'providerType.type.label', default: 'Type')}</th>

                                <th>${message(code: 'providerType.conmments.label', default: 'Conmments')}</th>

                                <th>${message(code: 'providerType.dateCreated.label', default: 'Date Created')}</th>

                            </tr>
                            </thead>
                            <tbody>                                       
                            <g:each in="${providerTypeDataList}" status="i" var="providerTypeData">
                                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">


                                    <td><g:link onclick="javascript:reProviderType('${providerTypeData.id}','${providerTypeData.type}','${providerTypeData.conmments}','${providerTypeData.dateCreated}')">${fieldValue(bean: providerTypeData, field: "id")}</g:link></td>

                                    <td><g:link onclick="javascript:reProviderType('${providerTypeData.id}','${providerTypeData.type}','${providerTypeData.conmments}','${providerTypeData.dateCreated}')">${fieldValue(bean: providerTypeData, field: "type")}</g:link></td>

                                    <td><g:link onclick="javascript:reProviderType('${providerTypeData.id}','${providerTypeData.type}','${providerTypeData.conmments}','${providerTypeData.dateCreated}')">${fieldValue(bean: providerTypeData, field: "conmments")}</g:link></td>

                                    <td><g:link onclick="javascript:reProviderType('${providerTypeData.id}','${providerTypeData.type}','${providerTypeData.conmments}','${providerTypeData.dateCreated}')">${fieldValue(bean: providerTypeData, field: "dateCreated")}</g:link></td>

                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                        <div class="pager">
                            <g:paginate action="selectProviderType" params = "[params:params]" total="${providerTypeDataTotal}" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</g:form>
</body>
</html>
