<%@ page import="com.bssi.ProviderType" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'providerType.label', default: 'Provider Type')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir:'js/themes/default',file:'easyui.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir:'js/themes',file:'icon.css')}">
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery-1.7.2.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery.easyui.min.js')}"></script>
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <script type="text/javascript">
        function checkForm(){
            var type = document.getElementById('type');
            if(!type.value){
                alert("Type is null");
                type.style.borderColor = "red";
                type.focus();
                return false;
            }
            return true;
        }

    </script>
</head>
<body>
<h1><g:message code="default.create.label" args="[entityName]" /></h1>
<hr>

<div class="container-fluid span10">
    <div class="span12 divbk">
        <g:link  action="list"><i class="icon-list"></i><g:message code="default.list.label" args="[entityName]" /></g:link>
    </div>
<div class="span12">
    <g:if test="${flash.message}">
        <div class="message span9" style="color: red">${flash.message}</div>
    </g:if>
    <g:form action="save"  class="form-horizontal">
        <g:hiddenField name="clientNum" value = "0"></g:hiddenField>
        <div class="well">
            <div class="control-group">
                <label  class="control-label" for="type"><g:message code="providerType.type.label" default="Provider Type" /></label>
                <div class="controls">
                    <g:textField name="type" value="${providerTypeData?.type}" /><span class="help-inline">Required</span>
                </div>
            </div>
            <div class="control-group">
                <label  class="control-label" for="conmments"><g:message code="providerType.conmments.label" default="Conmments" /></label>
                <div class="controls">
                    <g:textField name="conmments" value="${providerTypeData?.conmments}" />
                </div>
            </div>
            <hr>
            <div class="offset3">
                <g:submitButton name="create"  class="btn btn-primary" onclick="return checkForm();" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                <g:actionSubmit value="Cancel" name="cancel" action="list" class="btn"></g:actionSubmit>
            </div>
        </div>
        </div>
    </g:form>
</div>
</body>
</html>
