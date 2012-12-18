

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <g:set var="entityName" value="${message(code: 'Role.label', default: 'Role')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'bootstrap.css')}" />

    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <script type="text/javascript">
        function reRole(id,authority){
            parent.window.opener.setRoleInfo(id,authority);
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
                <label class="control-label" for="authority" ><g:message code="role.authority.label" default="Authority" /></label>
                <div class="controls">
                    <g:textField class="input-xlarge focused" style="height:30px" name="authority" maxlength="128" value="${params?.authority}" />
                </div>
            </div>


            <br>
            <div class="control offset4">
                <g:actionSubmit class="btn btn-primary" action="selectAuthority" value="${message(code: 'default.button.search.label', default: 'Search')}" />
            </div>

            <br>
            <div>
                <table class="table table-condensed table-striped">
                    <thead>
                    <tr>

                        <th>${message(code: 'role.id.label', default: 'Id')}</th>

                        <th>${message(code: 'role.authority.label', default: 'Authority')}</th>


                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${roleDataList}" status="i" var="roleData">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">


                            <td><g:link onclick="javascript:reRole('${roleData[0]}','${roleData[1]}')">${roleData[0]}</g:link></td>

                            <td><g:link onclick="javascript:reRole('${roleData[0]}','${roleData[1]}')">${roleData[1]}</g:link></td>


                        </tr>
                    </g:each>
                    </tbody>
                </table>
                <div class="pager">
                    <g:paginate  params = "[params:params]" total="${roleDataTotal}" />
                </div>
            </div>
        </div>
    </div>
</g:form>
</body>
</html>
