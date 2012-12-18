

<%@ page import="com.bssi.AddressType" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'luAddrType.label', default: 'Lu Address Type')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>

        <script type="text/javascript">
            function checkForm(){
                var addrType = document.getElementById('addrType');
                if(addrType.value==null||addrType.value==""){
                    alert("Address Type can not be blank!");
                    addrType.style.borderColor='red';
                    addrType.focus();
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>        
    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
    <hr>

    %{--<g:hasErrors bean="${luAddrTypeData}">--}%
        %{--<div class="errors">--}%
            %{--<g:renderErrors bean="${luAddrTypeData}" as="list" />--}%
        %{--</div>--}%
    %{--</g:hasErrors>--}%

    <div class="container-fluid span10">
        <div class="span12 divbk">
            <g:link  action="list"><i class="icon-list"></i><g:message code="default.list.label" args="[entityName]" /></g:link>
            <g:link  action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link>
        </div>
        <g:if test="${flash.message}">
            <div class="message span12" style="color: red">${flash.message}</div>
        </g:if>
    <div class="span12" >
        <g:form method="post" class="form-horizontal">
            <g:hiddenField name="id" value="${luAddrTypeData?.id}" />
            <g:hiddenField name="version" value="${luAddrTypeData?.version}" />
            <div class="well">
                <div class="control-group">
                    <label class="control-label" for="addrType" ><g:message code="luAddrType.addrType.label" default="Address Type" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="addrType" maxlength="4" value="${luAddrTypeData?.addrType}" /> <span class="help-inline">Required</span>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="description" ><g:message code="luAddrType.description.label" default="Description" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="description" maxlength="128" value="${luAddrTypeData?.description}" />
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="activeInd" ><g:message code="luAddrType.activeInd.label" default="Enabled" /></label>
                    <div class="controls">
                        <g:checkBox name="activeInd" value="${luAddrTypeData?.activeInd}"></g:checkBox>
                    </div>
                </div>


                <div class="offset3">
                    <g:actionSubmit class="btn btn-primary" onclick="return checkForm();" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                    <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    <g:actionSubmit value="Cancel" name="cancel" action="list" class="btn"></g:actionSubmit>
                </div>
            </div>
            </div>
            </div>
        </g:form>
    </body>
</html>
