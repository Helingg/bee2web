
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
        function reClient(){
            var client = document.getElementsByName('cid');
            var name = document.getElementsByName('name1');
            var alias = document.getElementsByName('alias1');
            var activeInd = document.getElementsByName('activeInd1');
            var len = client.length;
            var clientStr = ""
            if(len>0){
                for(var i=0;i<len;i++){
                    if(client[i].checked){
                        clientStr = clientStr + name[i].value + ":" + alias[i].value +":"+ activeInd[i].value +":"+client[i].value+",";
                    }
                }
            }
            parent.window.opener.setClientInfo(clientStr);
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
                    <label class="control-label" for="name" ><g:message code="client.name.label" default="Name" /></label>
                    <div class="controls">
                        <g:textField name="name" style="height: 25px" maxlength="64" value="${params?.name}" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="name" ><g:message code="client.activeInd.label" default="Active Ind" /></label>
                    <div class="controls">
                        <g:checkBox name="activeInd" style="height: 25px" value="${params.activeInd}" checked="true"></g:checkBox>
                    </div>
                </div>
                <br>
                <div class="control offset4">
                    <g:actionSubmit class="btn btn-primary" action="selectClient" value="${message(code: 'default.button.search.label', default: 'Search')}" />
                </div>

                <br>
                <div>
                    <table class="table table-condensed table-striped">
                        <thead>
                        <tr>
                            <th>${message(code: 'client.choose.label', default: 'Choose')}</th>

                            <th>${message(code: 'client.name.label', default: 'Name')}</th>

                            <th>${message(code: 'client.alias.label', default: 'Alias')}</th>

                            %{--<g:sortableColumn property="membership" params = "[name:params.name,provider:params.provider,activeInd:params.activeInd]" title="${message(code: 'client.membership.label', default: 'Membership')}" />--}%

                            <th>${message(code: 'client.activeInd.label', default: 'Active Ind')}</th>

                            <th>${message(code: 'client.dateCreated.label', default: 'Date Created')}</th>

                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${clientDataList}" status="i" var="clientData">
                            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                <td class="conent"><g:checkBox  name="cid" id="cid"  value="${clientData.id}" checked="false"></g:checkBox> </td>

                                <td> <g:hiddenField name="name1" value="${clientData.name}"></g:hiddenField>${fieldValue(bean: clientData, field: "name")}</td>

                                <td><g:hiddenField name="alias1" value="${clientData.alias}"></g:hiddenField>${fieldValue(bean: clientData, field: "alias")}</td>

                                <td><g:hiddenField name="activeInd1" value="${clientData.activeInd}"></g:hiddenField><g:checkBox name="checkboxshow" onclick="return false" value="${clientData.activeInd}"></g:checkBox></td>

                                <td><g:formatDate  date="${clientData.dateCreated}" /></td>

                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                    <div class="pager">
                        <g:paginate action="selectClient" params = "[name:params.name,enabled:params.enabled]" total="${clientDataTotal}" />
                    </div
                </div>
            </div>
            <div class="control offset4">
                <span class="menuButton"><input class="btn btn-primary" type="button" value="${message(code: 'default.button.ok.label', default: 'OK')}" onclick="reClient();"></span>
            </div>
        </div>
    </div>
    </div>
</g:form>
</body>
</html>
