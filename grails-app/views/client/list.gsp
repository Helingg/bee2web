
<%@ page import="com.bssi.Client" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />

    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <style type="text/css">.articleWrapper{background:#4169e1;}</style>
    <script type="text/javascript">
        function activeChange(){
            var activeShow = document.getElementById("activeIndShow");
            var active = document.getElementById("activeInd");
            if(activeShow.checked){
                active.value = true;
            } else{
                active.value = false;
            }
        }

    </script>
</head>
<body>
<h1><g:message code="default.list.label" args="[entityName]" /></h1>
<hr>

<div class="container-fluid span10">
    <div class="span12 divbk">
       <g:link  action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link>
    </div>
<g:form method="post"  class="form-horizontal" >
    <g:if test="${flash.message}">
        <div class="message span12" style="color: red">
            ${flash.message}
        </div>
    </g:if>
    <div class="span12">
        <div class="well">
            <div class="control-group">
                <label class="control-label" for="name" ><g:message code="facility.name.label" default="Name" /></label>
                <div class="controls">
                    <g:textField class="input-xlarge focused" name="name" maxlength="128" value="${params?.name}" />
                </div>
            </div>
            %{--<div class="control-group">--}%
                %{--<label for="activeInd" class="control-label"><g:message code="client.activeInd.label" default="Active Ind" /></label>--}%
                %{--<div class="controls">--}%
                    %{--<g:checkBox name="activeIndShow" value="${params?.activeInd}" checked="true" onclick="activeChange();"></g:checkBox>--}%
                    %{--<g:textField name="activeInd" value="${params?.activeInd?params.activeInd:true}" ></g:textField>--}%
                %{--</div>--}%
            %{--</div>--}%

            <br>
            <div class="control offset4">
                <g:actionSubmit class="btn btn-primary" action="search" value="${message(code: 'default.button.search.label', default: 'Search')}" />
            </div>
            <br>
            <div>
                <table class="table table-condensed table-striped">
                    <thead>
                    <tr>

                        <th>${message(code: 'client.id.label', default: 'Id')}</th>

                        <th>${message(code: 'client.name.label', default: 'Name')}</th>

                        <th>${message(code: 'client.alias.label', default: 'Alias')}</th>

                        <th>${message(code: 'client.activeInd.label', default: 'Active Ind')}</th>

                        <th>${message(code: 'client.dateCreated.label', default: 'Date Created')}</th>

                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${clientDataList}" status="i" var="clientData">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><g:link action="show" id="${clientData.id}">${fieldValue(bean: clientData, field: "id")}</g:link></td>

                            <td><g:link action="edit" id="${clientData.id}">${fieldValue(bean: clientData, field: "name")}</g:link></td>

                            <td><g:link action="edit" id="${clientData.id}">${fieldValue(bean: clientData, field: "alias")}</g:link></td>

                            %{--<td>${fieldValue(bean: clientData, field: "membership")}</td>--}%

                            <td>
                                <g:checkBox name="activeIndRe" value="${clientData.activeInd}" onclick="return false;"></g:checkBox>
                            </td>

                            <td><g:formatDate  date="${clientData.dateCreated}" /></td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
                <div class="pager">
                    <g:paginate action="search" params = "[name:params.name,activeInd:params.activeInd]" total="${clientDataTotal}" />
                </div
            </div>

        </div>

    </div>
    </div>
</g:form>

</div>
</body>
</html>
