

<%@ page import="com.bssi.FacilityAddress" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'facilityAddress.label', default: 'Facility Address')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>

        <script type="text/javascript">

            function checkForm(){
                var facilityShow = document.getElementById('facilityShow');
                var addressShow = document.getElementById('addressShow');
                var addressTypeShow = document.getElementById('addressTypeShow');

                if(!facilityShow.value){
                    alert("Facility can not be blank!");
                    facilityShow.style.borderColor='red';
                    facilityShow.focus();
                    return false;
                }
                if(!addressShow.value){
                    alert("Address can not be blank!");
                    addressShow.style.borderColor='red';
                    addressShow.focus();
                    return false;
                }
                if(!addressTypeShow.value){
                    alert("AddressType can not be blank!");
                    addressTypeShow.style.borderColor='red';
                    addressTypeShow.focus();
                    return false;
                }
                return true;
            }

            function selectFacility(){
                var paramKQ = " ${request.contextPath}/facility/selectFacility";
                open(paramKQ,'title','resizable=no,width=800,height=600,scrollbars=yes');
            }

            function selectAddress(){
                var paramKQ = " ${request.contextPath}/address/selectAddress";
                open(paramKQ,'title','resizable=no,width=850,height=600,scrollbars=yes');
            }

            function selectAddressType(){
                var paramKQ = " ${request.contextPath}/luAddrType/selectAddressType";
                open(paramKQ,'title','resizable=no,width=850,height=600,scrollbars=yes');
            }
            function setFacility(id,name,activeInd){
                var facilityShow = document.getElementById('facilityShow');
                var facility = document.getElementById('facility1');
                facilityShow.value=name;
                facility.value=id;
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
    %{--<g:if test="${flash.message}">--}%
        %{--<div class="message span10 offset9" style="color: red">${flash.message}</div>--}%
    %{--</g:if>--}%
    %{--<g:hasErrors bean="${facilityAddressData}">--}%
        %{--<div class="errors">--}%
            %{--<g:renderErrors bean="${facilityAddressData}" as="list" />--}%
        %{--</div>--}%
    %{--</g:hasErrors>--}%

    <div class="container-fluid span10">
    <div class="row-fluid">
        <div class="span3">
            <div class="well sidebar-nav">
                <ul class="nav nav-list">
                    <li class="nav-header">Option</li>
                    <li class="active"><g:link  action="list"><i class="icon-home"></i><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </div>
        <g:if test="${flash.message}">
            <div class="message span9" style="color: red">${flash.message}</div>
        </g:if>
    <div class="span9" >
        <g:form action="save"  class="form-horizontal">
            <div class="well">

                <div class="control-group">
                    <label class="control-label" ><g:message code="facilityAddress.faclity.label" default="Facility" /></label>
                    <div class="controls">
                        <g:textField readonly="true" class="input-xlarge focused" placeholder="Click 'Add' to add a client!" name="facilityShow" value="${facilityAddressData?.facility}" onclick="selectFacility()"></g:textField> <a href="javascript:selectFacility()"><img src="${request.contextPath}/images/add.jpg"> Add</a> <span class="help-inline">Required</span>
                        <g:hiddenField name="facility1" value="${facilityAddressData?.facility?.id}"></g:hiddenField>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label"  ><g:message code="facilityAddress.addr.label" default="Address" /></label>
                    <div class="controls">
                        <g:textField readonly="true" name="addressShow" placeholder="Click 'Add' to add a contact address!" class="input-xlarge focused" value="${facilityAddressData?.addr}" onclick="selectAddress()"></g:textField> <a href="javascript:selectAddress()"><img src="${request.contextPath}/images/add.jpg"> Add</a> <span class="help-inline">Required</span>
                        <g:hiddenField name="address1" value="${facilityAddressData?.addr?.id}"></g:hiddenField>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label"  ><g:message code="facilityAddress.addrType.label" default="Address Type" /></label>
                    <div class="controls">
                        <g:textField readonly="true" name="addressTypeShow" class="input-xlarge focused" placeholder="Click 'Add' to add a address type!" value="${facilityAddressData?.addrType}" onclick="selectAddressType()"></g:textField>  <a href="javascript:selectAddressType()"><img src="${request.contextPath}/images/add.jpg"> Add</a>  <span class="help-inline">Required</span>
                        <g:hiddenField name="addressType1" value="${facilityAddressData?.addrType?.id}"></g:hiddenField>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="activeInd" ><g:message code="facilityAddress.activeInd.label" default="First Name" /></label>
                    <div class="controls">
                        <g:checkBox name="activeInd" value="${facilityAddressData?.activeInd}" checked="true"></g:checkBox>
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
    </div>
    </body>
</html>
