

<%@ page import="com.bssi.ClientContact" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'clientContact.label', default: 'Client Contact')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>

        <script type="text/javascript">
            function checkForm (){
                var regex = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
                var emailAddr = document.getElementById('emailAddr');
                var firstName = document.getElementById('firstName');
                var lastName = document.getElementById('lastName');
                var addressShow = document.getElementById('addressShow');
                var contactTypeShow = document.getElementById('contactTypeShow');
                var clientShow = document.getElementById('clientShow');
                if(!firstName.value){
                    alert('First Name can not be blank!');
                    firstName.style.borderColor = "red";
                    firstName.focus();
                    return false;
                }
                if(!lastName.value){
                    alert('First Name can not be blank!');
                    lastName.style.borderColor = "red";
                    lastName.focus();
                    return false;
                }
                if(emailAddr.value){
                    if(!regex.exec(emailAddr.value)){
                        alert('The Email Address format is wrong!');
                        emailAddr.style.borderColor = "red";
                        emailAddr.focus();
                        return false;
                    }
                }

                if(!clientShow.value){
                    alert('Please select a Client!');
                    clientShow.style.borderColor = "red";
                    clientShow.focus();
                    selectClient()
                    return false;
                }

                if(!addressShow.value){
                    alert('Please select an Address!');
                    addressShow.style.borderColor = "red";
                    addressShow.focus();
                    selectAddress();
                    return false;
                }
                if(!contactTypeShow.value){
                    alert('Please select an Contact Type!');
                    contactTypeShow.style.borderColor = "red";
                    contactTypeShow.focus();
                    selectContactType();
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

            function selectAddress(){
                var paramKQ = " ${request.contextPath}/address/selectAddress";
                open(paramKQ,'title','resizable=no,width=850,height=600,scrollbars=yes');
            }

            function selectContactType(){
                var paramKQ = " ${request.contextPath}/contactType/selectContactType";
                open(paramKQ,'title','resizable=no,width=800,height=600,scrollbars=yes');
            }

            function setAddress(id,num,addr){
                var addressShow = document.getElementById('addressShow');
                var address1 = document.getElementById('address1');
                addressShow.value= num+"-"+addr;
                address1.value=id;

            }

            function setContactType(id,contactType){
                var contactTypeShow = document.getElementById('contactTypeShow');
                var contactType1 = document.getElementById('contactType1');
                contactTypeShow.value= contactType;
                contactType1.value=id;
            }
        </script>

    </head>
    <body>        
    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
    <hr>

    %{--<g:hasErrors bean="${clientContactData}">--}%
        %{--<div class="errors">--}%
            %{--<g:renderErrors bean="${clientContactData}" as="list" />--}%
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
            <g:hiddenField name="id" value="${clientContactData?.id}" />
            <g:hiddenField name="version" value="${clientContactData?.version}" />
            <div class="well">
                <div class="control-group">
                    <label class="control-label" for="firstName" ><g:message code="clientContact.firstName.label" default="First Name" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="firstName" maxlength="128" value="${clientContactData?.firstName}" /> <span class="help-inline">Required</span>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="lastName" ><g:message code="clientContact.lastName.label" default="Last Name" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="lastName" maxlength="128" value="${clientContactData?.lastName}" /> <span class="help-inline">Required</span>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="middleName" ><g:message code="clientContact.middleName.label" default="Middle Name" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="middleName" maxlength="128" value="${clientContactData?.middleName}" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="phoneNbr" ><g:message code="clientContact.phoneNbr.label" default="Phone Nbr" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="phoneNbr" maxlength="128" value="${clientContactData?.phoneNbr}" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="emailAddr" ><g:message code="clientContact.emailAddr.label" default="Email" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="emailAddr" maxlength="128" value="${clientContactData?.emailAddr}" />
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" ><g:message code="clientContact.client.label" default="Client" /></label>
                    <div class="controls">
                        <g:textField readonly="true" class="input-xlarge focused" placeholder="Click 'Add' to add a client!" name="clientShow" value="${clientContactData?.client}" onclick="selectClient()"></g:textField> <a href="javascript:selectClient()"><img src="${request.contextPath}/images/add.jpg"> Add</a> <span class="help-inline">Required</span>
                        <g:hiddenField name="client1" value="${clientContactData?.client?.id}"></g:hiddenField>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label"  ><g:message code="clientContact.addr.label" default="Address" /></label>
                    <div class="controls">
                        <g:textField readonly="true" name="addressShow" placeholder="Click 'Add' to add a contact address!" class="input-xlarge focused" value="${clientContactData?.addr}" onclick="selectAddress()"></g:textField> <a href="javascript:selectAddress()"><img src="${request.contextPath}/images/add.jpg"> Add</a> <span class="help-inline">Required</span>
                        <g:hiddenField name="address1" value="${clientContactData?.addr?.id}"></g:hiddenField>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label"  ><g:message code="clientContact.contactType.label" default="Contact Type" /></label>
                    <div class="controls">
                        <g:textField readonly="true" name="contactTypeShow" class="input-xlarge focused" placeholder="Click 'Add' to add a contact type!" value="${clientContactData?.contactType}" onclick="selectContactType()"></g:textField>  <a href="javascript:selectContactType()"><img src="${request.contextPath}/images/add.jpg"> Add</a>  <span class="help-inline">Required</span>
                        <g:hiddenField name="contactType1" value="${clientContactData?.contactType?.id}"></g:hiddenField>
                    </div>
                </div>

                <div class="offset3">
                    <g:actionSubmit class="btn btn-primary"  onclick="return checkForm();" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                    <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    <g:actionSubmit value="Cancel" name="cancel" action="list" class="btn"></g:actionSubmit>
                </div>
            </div>
            </div>
            </div>
        </g:form>
    </body>
</html>
