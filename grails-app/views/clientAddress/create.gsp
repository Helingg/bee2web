

<%@ page import="com.bssi.ClientAddress" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'clientAddress.label', default: 'Client Address')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>

        <script type="text/javascript">

            function checkForm(){
                var clientShow = document.getElementById('clientShow');
                var addressShow = document.getElementById('addressShow');
                var addressTypeShow = document.getElementById('addressTypeShow');
                var regex = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
                var email = document.getElementById("billingContactEmail")
                if(email.value&&!regex.exec(email.value)) {
                    alert("The E-mail format is wrong");
                    email.focus();
                    return false;
                }
                if(!clientShow.value){
                    alert("Client can not be blank!");
                    clientShow.style.borderColor='red';
                    clientShow.focus();
                    return false;
                }
                if(!addressShow.value){
                    alert("Address can not be blank!");
                    addressShow.style.borderColor='red';
                    addressShow.focus();
                    return false;
                }
                if(!addressTypeShow.value){
                    alert("Address Type can not be blank!");
                    addressTypeShow.style.borderColor='red';
                    addressTypeShow.focus();
                    return false;
                }
                return true;
            }

            function selectClient(){
                var paramKQ = " ${request.contextPath}/provider/selectClient1";
                open(paramKQ,'title','resizable=no,width=800,height=600,scrollbars=yes');
            }

            function selectAddress(){
                var paramKQ = " ${request.contextPath}/address/selectAddress";
                open(paramKQ,'title','resizable=no,width=850,height=600,scrollbars=yes');
            }

            function selectAddressType(){
                var paramKQ = " ${request.contextPath}/addressType/selectAddressType";
                open(paramKQ,'title','resizable=no,width=850,height=600,scrollbars=yes');
            }
            function setClientInfo(cid,name,alias,activeInd){
                var clientShow = document.getElementById('clientShow');
                var client = document.getElementById('client1');
                clientShow.value=name;
                client.value=cid;
            }
            function setAddress(id,num,addr){
                var addressShow = document.getElementById('addressShow');
                var address1 = document.getElementById('address1');
                addressShow.value= num+"-"+addr;
                address1.value=id;
            }

            function setAddressTypeInfo(id,addressType,activeInd){
                var addressTypeShow = document.getElementById('addressTypeShow');
                var addressType1 = document.getElementById('addressType1');
                addressTypeShow.value= addressType;
                addressType1.value=id;
            }
        </script>

    </head>
    <body>        

    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
    <hr>

    %{--<g:hasErrors bean="${clientAddressData}">--}%
        %{--<div class="errors">--}%
            %{--<g:renderErrors bean="${clientAddressData}" as="list" />--}%
        %{--</div>--}%
    %{--</g:hasErrors>--}%

    <div class="container-fluid span10">
        <div class="span12 divbk">
            <g:link  action="list"><i class="icon-list"></i><g:message code="default.list.label" args="[entityName]" /></g:link>
        </div>
        <g:if test="${flash.message}">
            <div class="message span12" style="color: red">${flash.message}</div>
        </g:if>
    <div class="span12" >
        <g:form action="save"  class="form-horizontal">
            <div class="well">

                <div class="control-group">
                    <label class="control-label" ><g:message code="clientAddress.phone.label" default="Phone" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="phone" value="${clientAddressData?.phone}"></g:textField>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" ><g:message code="clientAddress.fax.label" default="Fax" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="fax" value="${clientAddressData?.fax}"></g:textField>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" ><g:message code="clientAddress.billingContactName.label" default="Billing Contact Name" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="billingContactName" value="${clientAddressData?.billingContactName}"></g:textField>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" ><g:message code="clientAddress.billingContactEmail.label" default="Billing Contact Email" /></label>
                    <div class="controls">
                        <g:textField  class="input-xlarge focused" name="billingContactEmail" value="${clientAddressData?.billingContactEmail}"></g:textField>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" ><g:message code="clientAddress.billingContactPhone.label" default="Billing Contact Phone" /></label>
                    <div class="controls">
                        <g:textField  class="input-xlarge focused" name="billingContactPhone" value="${clientAddressData?.billingContactPhone}"></g:textField>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" ><g:message code="clientAddress.client.label" default="Client" /></label>
                    <div class="controls">
                        <g:textField readonly="true" class="input-xlarge focused" onclick="selectClient()" placeholder="Click 'Add' to add a client!" name="clientShow" value="${clientAddressData?.client}"></g:textField> <a href="javascript:selectClient()"><img src="${request.contextPath}/images/add.jpg"> Select</a> <span class="help-inline">Required</span>
                        <g:hiddenField name="client1" value="${clientAddressData?.client?.id}"></g:hiddenField>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label"  ><g:message code="clientAddress.addr.label" default="Address" /></label>
                    <div class="controls">
                        <g:textField readonly="true" name="addressShow" onclick="selectAddress()" placeholder="Click 'Add' to add a contact address!" class="input-xlarge focused" value="${clientAddressData?.addr}"></g:textField> <a href="javascript:selectAddress()"><img src="${request.contextPath}/images/add.jpg"> Select</a> <span class="help-inline">Required</span>
                        <g:hiddenField name="address1" value="${clientAddressData?.addr?.id}"></g:hiddenField>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label"  ><g:message code="clientAddress.addrType.label"  default="Address Type" /></label>
                    <div class="controls">
                        <g:textField readonly="true" name="addressTypeShow" class="input-xlarge focused" onclick="selectAddressType()" placeholder="Click 'Add' to add a address type!" value="${clientAddressData?.addrType}"></g:textField>  <a href="javascript:selectAddressType()"><img src="${request.contextPath}/images/add.jpg"> Select</a>  <span class="help-inline">Required</span>
                        <g:hiddenField name="addressType1" value="${clientAddressData?.addrType?.id}"></g:hiddenField>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="activeInd" ><g:message code="clientAddress.activeInd.label" default="First Name" /></label>
                    <div class="controls">
                        <g:checkBox name="activeInd" checked="true" value="${clientAddressData?.activeInd}"></g:checkBox>
                    </div>
                </div>

                <div class="offset3">
                    <g:submitButton name="create"  class="btn btn-primary" onclick="return checkForm();" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                    <g:actionSubmit value="Cancel" name="cancel" action="list" class="btn"></g:actionSubmit>
                </div>
            </div>
            </div>
            </div>
        </g:form>
    </body>
</html>
