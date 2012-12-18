
<%@ page import="com.bssi.Client" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'divbk.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'bootstrap.css')}" />

    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <script type="text/javascript">
        function reClient(cid,name,alias,activeInd){
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
    <div class="container-fluid span12">
        <div class="divbk span12">
            <g:link onclick="closeWindow();"><i class="icon-remove"></i><g:message code="default.close.label" args="[entityName]" /></g:link>
        </div>
        <g:if test="${flash.message}">
            <div class="message span12" style="color: red">${flash.message}</div>
        </g:if>
        <div class="span12">
            <div class="well ">
                <div class="control-group">
                    <label class="control-label" for="name" ><g:message code="client.name.label" default="Name" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" style="height:30px" name="name" maxlength="128" value="${params?.name}" />
                    </div>
                </div>
                <br>
                <div class="control offset4">
                    <g:actionSubmit class="btn btn-primary" action="selectClient1" value="${message(code: 'default.button.search.label', default: 'Search')}" />
                </div>

                <br>

                    <table class="table table-condensed table-striped">
                        <thead>
                        <tr>

                            <th>${message(code: 'client.name.label', default: 'Name')}</th>

                            <th>${message(code: 'client.alias.label', default: 'Alias')}</th>

                            <th>${message(code: 'client.activeInd.label', default: 'Active Ind')}</th>

                            <th>${message(code: 'client.dateCreated.label', default: 'Date Created')}</th>

                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${clientDataList}" status="i" var="clientData">
                            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">


                                <td><g:link onclick="javascript:reClient('${clientData.id}','${clientData.name}','${clientData.alias}','${clientData.activeInd}')">${fieldValue(bean: clientData, field: "name")}</g:link></td>

                                <td><g:link onclick="javascript:reClient('${clientData.id}','${clientData.name}','${clientData.alias}','${clientData.activeInd}')">${fieldValue(bean: clientData, field: "alias")}</g:link></td>

                                <td><g:link onclick="javascript:reClient('${clientData.id}','${clientData.name}','${clientData.alias}','${clientData.activeInd}')"><g:checkBox name="" value="${clientData.activeInd}" onclick="return false;"></g:checkBox></g:link></td>

                                <td><g:link onclick="javascript:reClient('${clientData.id}','${clientData.name}','${clientData.alias}','${clientData.activeInd}')"><g:formatDate  date="${clientData.dateCreated}" /></g:link></td>

                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                    <div class="pager">
                        <g:paginate action="selectClient1" params = "[params:params]" total="${clientDataTotal}" />
                    </div>
            </div>
        </div>
    </div>
</g:form>
</body>
</html>
