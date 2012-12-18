<%@ page import="com.uit.User" %>
<!doctype html>
<html>
<head>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
    <link rel="stylesheet" href="${resource(dir:'css',file:'divbk.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir:'js/themes/default',file:'easyui.css')}">

    <link rel="stylesheet" type="text/css" href="${resource(dir:'js/themes',file:'icon.css')}">
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery-1.7.2.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery.easyui.min.js')}"></script>
    <link rel="stylesheet" href="${resource(dir:'css',file:'bootstrap.css')}" />
    <script>
        function saveUser(){
            var id = document.getElementById('id');
            var email = document.getElementById('email');
            var regex = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
            if(email.value){
                if(!regex.exec(email.value)){
                    alert("The Email Address format is wrong!");
                    return false;
                }
            }
            $.ajax({
                url:"${request.contextPath}/user/saveUser",
                data:{id:id.value,email:email.value},
                success:function(msg){
                    if(msg!="Save success"){
                        alert(msg);
                    }else{
                        top.close();
                    }

                }
            })

        }
    </script>
</head>
<body>

<div id="create-user" class="content scaffold-create" role="main">
    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
    <div class="span12 divbk">
        <g:link onclick="top.close();"><i class="icon-remove"></i>${message(code: 'default.button.back.label', default: 'Back')}</g:link>
    </div>
<div class="span12" >
    <g:form action="save"  class="form-horizontal">
        <div class="well">
            <div class="control-group">
                <label  class="control-label" for="username"><g:message code="user.username.label" default="First Name" /></label>
                <div class="controls">
                    <g:textField name="username" value="${userData?.username}" readonly="true"/>
                    <g:hiddenField name="id" value="${userData?.id}"/>
                </div>
            </div>
            <div class="control-group">
                <label  class="control-label" for="email"><g:message code="user.email.label" default="Email" /></label>
                <div class="controls">
                    <g:textField name="email" value="${userData?.email}"/>
                </div>
            </div>

            <hr>
            <div class="offset3">
                <input type="button" name="create"  class="btn btn-primary" onclick="return saveUser();" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                <input type="button" value="Cancel" name="cancel"  class="btn" onclick="top.close();">

            </div>
        </div>
        </div>
        </div>
    </g:form>
</div>
</body>
</html>
