
<%@ page import="com.uit.User" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>


<h1><g:message code="default.show.label" args="[entityName]" /></h1>
<hr>
<g:hasErrors bean="${userData}">
    <ul class="errors" role="alert">
        <g:eachError bean="${userData}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>
<div class="container-fluid span10">
<div class="span12 divbk">
    <g:link  action="list"><i class="icon-list"></i><g:message code="default.list.label" args="[entityName]" /></g:link>
</div>
<g:if test="${flash.message}">
    <div class="message span12" style="color: red">${flash.message}</div>
</g:if>
<div class="span12" >

<g:form action="save"  class="form-horizontal" method="post">

    <div class="well">

        <div class="control-group">
            <label  class="control-label" ><g:message code="user.username.label" default="Username" /></label>
            <div class="controls">
                <label  class="control-label" >${userData?.username}</label>
                <g:hiddenField name="id" value="${userData?.id}" readonly="true"/>
            </div>
        </div>
        <div class="control-group">
            <label  class="control-label" ><g:message code="user.email.label" default="Email" /></label>
            <div class="controls">
                <label  class="control-label">${userData?.email}</label>
            </div>
        </div>

        <div class="control-group">
            <label  class="control-label" for="authority"><g:message code="user.authority.label" default="Authority" /></label>
            <div class="controls">
                <g:if test='${roleData}'>
                    <label  class="control-label" >${roleData[0][1]}</label>
                </g:if>
                <g:else>
                    <label  class="control-label" ></label>
                </g:else>

            </div>
        </div>

        <div class="control-group">
            <label  class="control-label" for="accountExpired"><g:message code="user.accountExpired.label" default="AccountExpired" /></label>
            <div class="controls">
                <g:checkBox name="accountExpired" value="${userData?.accountExpired}" onclick="return false" />
            </div>
        </div>
        <div class="control-group">
            <label  class="control-label" for="accountLocked"><g:message code="user.accountLocked.label" default="AccountLocked" /></label>
            <div class="controls">
                <g:checkBox name="accountLocked" value="${userData?.accountLocked}" onclick="return false" />
            </div>
        </div>
        <div class="control-group">
            <label  class="control-label" for="passwordExpired"><g:message code="user.passwordExpired.label" default="PasswordExpired" /></label>
            <div class="controls">
                <g:checkBox name="passwordExpired" value="${userData?.passwordExpired}" onclick="return false"  />
            </div>
        </div>
        <div class="control-group">
            <label  class="control-label" for="enabled"><g:message code="user.enabled.label" default="Enabled" /></label>
            <div class="controls">
                <g:checkBox name="enabled" value="${userData?.enabled}" onclick="return false"/>
            </div>
        </div>
        <hr>

        <div class="offset3">
            <g:actionSubmit name="create" action="edit"  class="btn btn-primary" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
        <g:actionSubmit class="btn btn-danger"  action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
            <g:actionSubmit value="Cancel" name="cancel" action="list" class="btn"></g:actionSubmit>
        </div>
    </div>
    </div>

    </div>
</g:form>

</body>
</html>
