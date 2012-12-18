<%@ page import="com.uit.User" %>
<!doctype html>
<html>
<head>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="user.changePassword.label" default="Change Password" /></title>
    <link rel="stylesheet" type="text/css" href="${resource(dir:'js/themes/default',file:'easyui.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir:'js/themes',file:'icon.css')}">
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery-1.7.2.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery.easyui.min.js')}"></script>
    <link rel="stylesheet" href="${resource(dir:'css',file:'bootstrap.css')}" />
    <script>
        function saveUser(){
            var id = document.getElementById('id');
            var newPassword = document.getElementById('newPassword');
            var repeatPassword = document.getElementById('repeatPassword');
            var originalPassword = document.getElementById('originalPassword');
            if(!originalPassword.value){
                alert("Original Password is null!");
                return false;
            }
            if(!newPassword.value){
                alert("New Password is null!");
                return false;
            }
            if(!repeatPassword.value){
                alert("Repeat Password is null!");
                return false;
            }
            if(newPassword.value!=repeatPassword.value) {
                alert("New Password and Repeat Password must be same!");
                return false;
            }

            $.ajax({
                url:"${request.contextPath}/user/savePassword",
                data:{id:id.value,originalPassword:originalPassword.value,newPassword:newPassword.value},
                success:function(msg){
                    if(msg=="Save success"){
                        top.close();
                    }else{
                        alert(msg);
                    }
                }
            })

        }
    </script>
</head>
<body>

<div id="create-user" class="content scaffold-create" role="main">
    <h1><g:message code="user.changePassword.label" default="Change Password" /></h1>
    <hr>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
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
                    <li class="active"><g:link  onclick="top.close()"><i class="icon-home"></i>${message(code: 'default.button.Close.label', default: 'Close')}</g:link>
                </ul>
            </div>
        </div>
    <div class="span9" >
        <g:form action="save"  class="form-horizontal">
            <div class="well span8">
                <div class="control-group">
                    <label  class="control-label" for="username"><g:message code="user.username.label" default="First Name" /></label>
                    <div class="controls">
                        <g:textField name="username" value="${userData?.username}" readonly="true"/>
                        <g:hiddenField name="id" value="${userData?.id}"/>
                    </div>
                </div>

                <div class="control-group">
                    <label  class="control-label" for="originalPassword"><g:message code="user.originalPassword.label" default="Original Password" /></label>
                    <div class="controls">
                        <g:passwordField name="originalPassword" value="" />
                    </div>
                </div>
                <div class="control-group">
                    <label  class="control-label" for="newPassword"><g:message code="user.newPassword.label" default="New Password" /></label>
                    <div class="controls">
                        <g:passwordField name="newPassword" value="" />
                    </div>
                </div>
                <div class="control-group">
                    <label  class="control-label" for="repeatPassword"><g:message code="user.repeatPassword.label" default="Repeate Password" /></label>
                    <div class="controls">
                        <g:passwordField name="repeatPassword" value="" />
                    </div>
                </div>



                <hr>
                <div class="offset3">
                    <input type="button" name="create"  class="btn btn-primary" onclick="return saveUser();" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                    <input type="button" value="Cancel" name="cancel"  class="btn" onclick="top.close()">

                </div>
            </div>
            </div>
            </div>
        </g:form>
    </div>
</div>
</body>
</html>
