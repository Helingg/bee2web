

<%@ page import="com.bssi.MappingRuleGroup" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'mappingRuleGroup.label', default: 'Mapping Rule Group')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>

        <script type="text/javascript">
            var type = -1;
            function checkForm(){
                var name = document.getElementById('name');
                var fromApplication = document.getElementById('fromApplicationShow');
                var toApplication = document.getElementById('toApplicationShow');

                if(name.value===null||name.value==""){
                    alert("Name can not be blank!");
                    name.style.borderColor='red';
                    name.focus();
                    return false;
                } else{
                    name.style.borderColor='';
                }

                if(fromApplication.value===null||fromApplication.value==""){
                    alert("From Application can not be blank!");
                    fromApplication.style.borderColor='red';
                    fromApplication.focus();
                    return false;
                }else{
                    fromApplication.style.borderColor='';
                }

                if(toApplication.value===null||toApplication.value==""){
                    alert("To Application can not be blank!");
                    toApplication.style.borderColor='red';
                    toApplication.focus();
                    return false;
                }else{
                    toApplication.style.borderColor='';
                }
                return true;
            }
           function selectApplication(num){
               type = num;
               var paramKQ = " ${request.contextPath}/mappingRuleGroup/selectApplication"
               open(paramKQ,'title','resizable=no,width=800,height=500,scrollbars=yes');
           }
            function setApplicationInfo(id,name,version){
                var fromApplication =  document.getElementById('fromApplication1');
                var fromApplicationShow =  document.getElementById('fromApplicationShow');
                var toApplication =  document.getElementById('toApplication1');
                var toApplicationShow =  document.getElementById('toApplicationShow');
                if(type==1){
                    fromApplication.value = id;
                    fromApplicationShow.value=name+"-"+version;
                }else if(type==0){
                    toApplication.value = id;
                    toApplicationShow.value=name+"-"+version;
                }
            }

        </script>
    </head>
    <body>        

    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
    <hr>
    %{--<g:if test="${flash.message}">--}%
        %{--<div class="message span10 offset9" style="color: red">${flash.message}</div>--}%
    %{--</g:if>--}%
    %{--<g:hasErrors bean="${mappingRuleGroupData}">--}%
        %{--<div class="errors">--}%
            %{--<g:renderErrors bean="${mappingRuleGroupData}" as="list" />--}%
        %{--</div>--}%
    %{--</g:hasErrors>--}%

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
        <g:form action="save"  class="form-horizontal">
            <div class="well span9">
                <div class="control-group">
                    <label class="control-label" for="name"><g:message code="mappingRuleGroup.name.label" default="Name" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="name" maxlength="128" value="${mappingRuleGroupData?.name}" /><span class="help-inline">Required</span>
                    </div>
                </div>
                <div class="control-group">
                    <label for="type" class="control-label"><g:message code="mappingRuleGroup.type.label" default="Type" /></label>
                    <div class="controls">
                        <g:select name="type" from="${mappingRuleGroupData.constraints.type.inList}" value="${mappingRuleGroupData?.type}" valueMessagePrefix="mappingRuleGroup.type"  /> <span class="help-inline">Required</span>
                    </div>
                </div>
                <div class="control-group">
                    <label for="fromApplicationShow" class="control-label"><g:message code="mappingRuleGroup.fromApplication.label" default="From Application" /></label>
                    <div class="controls">
                        <g:textField readonly="true" class="input-xlarge focused" placeholder="Click 'Add' to add a From Application!"  name="fromApplicationShow" maxlength="128" value="${mappingRuleGroupData?.fromApplication}" onclick="selectApplication(1);" /><a href="javascript:selectApplication(1)"><img src="${request.contextPath}/images/add.jpg">Select</a><span class="help-inline">Required </span>
                        <g:hiddenField name="fromApplication1" id="fromApplication1" value=""></g:hiddenField>                    </div>
                </div>
                <div class="control-group">
                    <label for="toApplicationShow" class="control-label"><g:message code="mappingRuleGroup.toApplication.label" default="To Application" /></label>
                    <div class="controls">
                        <g:textField readonly="true" class="input-xlarge focused" placeholder="Click 'Add' to add a To Application!" name="toApplicationShow" maxlength="128" value="${mappingRuleGroupData?.toApplication}" onclick="selectApplication(0);" /><a href="javascript:selectApplication(0)"><img src="${request.contextPath}/images/add.jpg">Select</a> <span class="help-inline">Required </span>
                        <g:hiddenField name="toApplication1" id="toApplication1" value=""></g:hiddenField>                    </div>
                </div>

                <div class="control-group">
                    <label for="comments" class="control-label"><g:message code="mappingRuleGroup.comments.label" default="Comments" /></label>
                    <div class="controls">
                        <g:textArea name="comments" cols="40" rows="5" value="${mappingRuleGroupData?.comments}" />
                    </div>
                </div>

                <div class="control-group">
                    <label for="comments" class="control-label"><g:message code="mappingRuleGroup.activeInd.label" default="Enabled" /></label>
                    <div class="controls">
                        <g:checkBox name="activeInd" value="${mappingRuleGroupData?.activeInd}" checked="true" />
                    </div>
                </div>

                <div >
                <hr>
                <div class="offset3">
                    <g:submitButton name="create"  class="btn btn-primary" onclick="return checkForm();" value="${message(code: 'default.button.create.label', default: 'Create')}" />
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
