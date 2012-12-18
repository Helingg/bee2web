
<%@ page import="com.uit.User" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<h1><g:message code="default.list.label" args="[entityName]" /></h1>
<hr>

<g:form method="post"  class="form-horizontal" >
    <div class="container-fluid span10">
        <div class="span12 divbk">
            <g:link  action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link>
        </div>
        <g:if test="${flash.message}">
            <div class="message span12" style="color: red">${flash.message}</div>
        </g:if>
        <div class="span12">

            <div class="well">

                <div class="control-group">
                    <label class="control-label" for="username" ><g:message code="luAddrType.username.label" default="User Name" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="username" maxlength="128" value="${params?.username}" />
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="enabled" ><g:message code="luAddrType.enabled.label" default="Active" /></label>
                    <div class="controls">
                        <g:checkBox name="enabled" value="${params?.enabled}" checked="true"></g:checkBox>
                    </div>
                </div>

                <br>
                <div class="control offset4">
                    <g:actionSubmit class="btn btn-primary"  action="searchUser" value="${message(code: 'default.button.search.label', default: 'Search')}" />
                </div>
                <br>
                <div>
                    <table class="table table-condensed table-striped">
                        <thead>
                        <tr>

                            <th>${message(code: 'user.username.label', default: 'Username')}</th>

                            <th>${message(code: 'user.email.label', default: 'Email')}</th>

                            <th>${message(code: 'user.accountExpired.label', default: 'Account Expired')}</th>

                            <th>${message(code: 'user.accountLocked.label', default: 'Account Locked')}</th>

                            <th>${message(code: 'user.passwordExpired.label', default: 'Password Expired')}</th>

                            <th>${message(code: 'user.enabled.label', default: 'Enabled')}</th>

                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${userDataList}" status="i" var="userData">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                <td><g:link action="show" id="${userData.id}">${fieldValue(bean: userData, field: "username")}</g:link></td>

                                <td><g:link action="edit" id="${userData.id}">${fieldValue(bean: userData, field: "email")}</g:link></td>

                                <td><g:link action="edit" id="${userData.id}"><g:checkBox onclick="return false" name="" value="${userData.accountExpired}" /></g:link></td>

                                <td><g:link action="edit" id="${userData.id}"><g:checkBox onclick="return false" name="" value="${userData.accountLocked}" /></g:link></td>

                                <td><g:link action="edit" id="${userData.id}"><g:checkBox onclick="return false" name="" value="${userData.passwordExpired}" /></g:link></td>

                                <td><g:link action="edit" id="${userData.id}"><g:checkBox onclick="return false" name="" value="${userData.enabled}" /></g:link></td>

                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                    <div class="pager">
                        <g:paginate total="${userDataTotal}" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</g:form>
</body>
</html>
