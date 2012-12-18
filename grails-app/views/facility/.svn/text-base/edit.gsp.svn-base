

<%@ page import="com.bssi.Facility" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />

        %{--<link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />--}%
        <g:set var="entityName" value="${message(code: 'facility.label', default: 'Facility')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <script type="text/javascript">
            function checkForm(){
                var name = document.getElementById('name');
                var clientShow = document.getElementById('clientShow');
                if(!name.value){
                    alert("Name can not be blank!");
                    name.style.borderColor='red';
                    name.focus();
                    return false;
                }
                if(!clientShow.value){
                    alert("Please select a Client!");
                    clientShow.style.borderColor='red';
                    clientShow.focus();
                    selectClient();
                    return false;
                }
                return true;
            }


            function setClientInfo(cid,name,alias,activeInd){
                var clientShow = document.getElementById('clientShow');
                var client = document.getElementById('client1');
                clientShow.value=name;
                client.value=cid;
            }
            function selectClient(){
                var paramKQ = " ${request.contextPath}/provider/selectClient1";
                open(paramKQ,'title','resizable=no,width=800,height=600,scrollbars=yes');
            }
        </script>
    </head>
    <body>        
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <hr>


            <div class="container-fluid span10">
                <div class="row-fluid">
                    <div class="span3">
                        <div class="well sidebar-nav">
                            <ul class="nav nav-list">
                                <li class="nav-header">Option</li>
                                <li class="active"><g:link  action="list"><i class="icon-home"></i><g:message code="default.list.label" args="[entityName]" /></g:link>
                                <li class="active"><g:link  action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link>
                            </ul>
                        </div>
                    </div>
                    <g:if test="${flash.message}">
                        <div class="message span9" style="color: red">${flash.message} </div>
                            %{--<g:hasErrors bean="${facilityData}">--}%
                                %{--<div class="errors">--}%
                                    %{--<g:renderErrors bean="${facilityData}" as="list" />--}%
                                %{--</div>--}%
                            %{--</g:hasErrors></div>--}%
                    </g:if>
                <div class="span9" >
                    <g:form action="save"  class="form-horizontal">
                        <g:hiddenField name="id" value="${facilityData?.id}" />
                        <g:hiddenField name="version" value="${facilityData?.version}" />
                        <div class="well">
                            <div class="control-group">
                                <label class="control-label" for="name"><g:message code="facility.name.label" default="Name" /></label>
                                <div class="controls">
                                    <g:textField class="input-xlarge focused" name="name" maxlength="128" value="${facilityData?.name}" /><span class="help-inline">Required</span>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="comment"><g:message code="facility.comment.label" default="Comment" /></label>
                                <div class="controls">
                                    <g:textField  class="input-xlarge focused" name="comment" maxlength="128" value="${facilityData?.comment}" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="client"><g:message code="facility.client.label" default="Client" /></label>
                                <div class="controls">
                                    <g:textField name="clientShow" class="input-xlarge focused" placeholder="Click 'Add' to add a client!" value="${facilityData.client.name}" readonly='true' onclick="selectClient();"></g:textField> <a href="javascript:selectClient()"><img src="${request.contextPath}/images/add.jpg"> Select</a>
                                    <g:hiddenField name="client1" value="${facilityData.client.id}"></g:hiddenField>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="activeInd"><g:message code="facility.activeInd.label" default="Active Ind" /></label>
                                <div class="controls">
                                    <label class="checkbox">
                                        <g:checkBox name="activeInd" value="${facilityData?.activeInd}" />
                                    </label>
                                </div>
                                <div class="offset3">
                                    <g:actionSubmit  class="btn btn-primary" onclick="return checkForm();" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                                    <g:actionSubmit class="btn btn-danger"  action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                                    <g:actionSubmit value="Cancel" name="cancel" action="list" class="btn"></g:actionSubmit>
                                </div>
                            </div>
                        </div>
                        </div>
                    </g:form>
                </div>
            </div>
        </div>
    </body>
</html>
