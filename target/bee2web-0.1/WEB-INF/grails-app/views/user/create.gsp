<%@ page import="com.uit.User" %>
<!doctype html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
        <meta name="layout" content="main">
        <script type="text/javascript">
            function checkForm(){
                var regex = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
                var username = document.getElementById("username");
                var password = document.getElementById("password");
                var email = document.getElementById("email");
                if(!username.value){
                    alert("User Name is null!")
                    return false;
                }
                if(!password.value){
                    alert("Password is null!")
                    return false;
                }

                if(email.value){
                    if(!regex.exec(email.value)){
                        alert("The Email Address format is wrong!");
                        return false;
                    }
                }

                return true;
            }
            function setRoleInfo(id,authority){
                var authority1 = document.getElementById("authority");
                var roleId = document.getElementById("roleId");
                authority1.value=authority;
                roleId.value=id;
            }


            function selectAuthority(){
                var paramKQ = " ${request.contextPath}/user/selectAuthority";
                open(paramKQ,'title','resizable=no,width=800,height=600,scrollbars=yes');
            }
            function removeAuthority(){
                var authority1 = document.getElementById("authority");
                var roleId = document.getElementById("roleId");
                if(roleId.value){
                    if(confirm("Are you sure?")){
                        authority1.value="";
                        roleId.value="";
                    }
                }
            }

        </script>
	</head>
	<body>
    <div id="create-user" class="content scaffold-create" role="main">
        <h1><g:message code="default.new.label" args="[entityName]" /></h1>

        <g:hasErrors bean="${userData}">
            <ul class="errors" role="alert">
                <g:eachError bean="${userData}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <div class="container-fluid span10">
        <div class="row-fluid">
            <div class="span3">
                <div class="well sidebar-nav">
                    <ul class="nav nav-list">
                        <li class="nav-header">Option</li>
                        <li class="active"><g:link  action="list"><i class="icon-home"></i><g:message code="default.list.label" args="[entityName]" /></g:link>
                    </ul>
                </div>
            </div>

        <div class="span9" >
             <g:if test="${flash.message}">
                <div class="message span9" style="color: red">${flash.message}</div>
            </g:if>
            <g:form action="save"  class="form-horizontal" method="post">
                <div class="well span8">
                    <div class="control-group">
                        <label  class="control-label" for="username"><g:message code="user.username.label" default="User Name" /></label>
                        <div class="controls">
                            <g:textField name="username" value="${userData?.username}"/><span class="help-inline">Required</span>
                        </div>
                    </div>
                    <div class="control-group">
                        <label  class="control-label" for="password"><g:message code="user.password.label" default="Passwrod" /></label>
                        <div class="controls">
                            <g:passwordField name="password" value="${userData?.password}"/><span class="help-inline">Required</span>
                        </div>
                    </div>

                    <div class="control-group">
                        <label  class="control-label" for="email"><g:message code="user.email.label" default="Email" /></label>
                        <div class="controls">
                            <g:textField name="email" value="${userData?.email}"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label  class="control-label" for="authority"><g:message code="user.authority.label" default="Authority" /></label>
                        <div class="controls">
                            <g:textField name="authority" id="authority" readonly="true" value="${params?.authority}" onclick="selectAuthority();"/> <a href="javascript:selectAuthority()"><img src="${request.contextPath}/images/add.jpg"> Select</a>&nbsp; <a href="javascript:removeAuthority()" > <img src="${request.contextPath}/images/remove.png" style="width: 20px;height: 20px">Remove</a>
                            <g:hiddenField name="roleId" id="roleId" readonly="true" value="${params?.roleId}"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label  class="control-label" for="accountExpired"><g:message code="user.accountExpired.label" default="AccountExpired" /></label>
                        <div class="controls">
                            <g:checkBox name="accountExpired" value="${userData?.accountExpired}" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label  class="control-label" for="accountLocked"><g:message code="user.accountLocked.label" default="AccountLocked" /></label>
                        <div class="controls">
                            <g:checkBox name="accountLocked" value="${userData?.accountLocked}" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label  class="control-label" for="passwordExpired"><g:message code="user.passwordExpired.label" default="PasswordExpired" /></label>
                        <div class="controls">
                            <g:checkBox name="passwordExpired" value="${userData?.passwordExpired}" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label  class="control-label" for="enabled"><g:message code="user.enabled.label" default="Enabled" /></label>
                        <div class="controls">
                            <g:checkBox name="enabled" value="${userData?.enabled}" checked="true"/>
                        </div>
                    </div>
                    <hr>
                    <div class="offset3">
                        <g:actionSubmit type="button" name="create" action="save"   class="btn btn-primary" onclick="return checkForm();" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                        <g:actionSubmit value="Cancel" name="cancel" action="list" class="btn"></g:actionSubmit>

                    </div>
                </div>
                </div>

                </div>
            </g:form>
        </div>
    </div>
	</body>
</html>
