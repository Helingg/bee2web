

<%@ page import="com.bssi.Address" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>

        <script type="text/javascript">
            function checkForm(){
                var streetNumber = document.getElementById('streetNbr');
                var streetAddress = document.getElementById('streetAddr');
                var city = document.getElementById('city');
                var country = document.getElementById('country');
                var state = document.getElementById('state');

                if(streetNumber.value==null||streetNumber.value==""){
                    alert("Street Number is null!");
                    streetNumber.style.borderColor='red';
                    streetNumber.focus();
                    return false;
                }
                if(streetAddress.value==null||streetAddress.value==""){
                    alert("Street Address is null!");
                    streetAddress.style.borderColor='red';
                    streetAddress.focus();
                    return false;
                }
                if(city.value==null||city.value==""){
                    alert("City is null!");
                    city.style.borderColor='red';
                    city.focus();
                    return false;
                }
                if(state.value==null||state.value==""){
                    alert("State is null!");
                    state.style.borderColor='red';
                    state.focus();
                    return false;
                }
                if(country.value==null||country.value==""){
                    alert("Country is null!");
                    country.style.borderColor='red';
                    country.focus();
                    return false;
                }
                 return true;
            }
        </script>
    </head>
    <body>        
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
    <hr>

    %{--<g:hasErrors bean="${addressData}">--}%
        %{--<div class="errors">--}%
            %{--<g:renderErrors bean="${addressData}" as="list" />--}%
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
                    <label class="control-label" for="streetNbr" ><g:message code="address.streetNbr.label" default="Street Number" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="streetNbr" maxlength="128" value="${addressData?.streetNbr}" /> <span class="help-inline">Required</span>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="streetAddr" ><g:message code="address.streetAddr.label" default="Street Address" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="streetAddr" maxlength="128" value="${addressData?.streetAddr}" />  <span class="help-inline">Required</span>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="streetPrefix" ><g:message code="address.streetPrefix.label" default="Street Prefix" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="streetPrefix" maxlength="128" value="${addressData?.streetPrefix}" />
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="streetSuffix" ><g:message code="address.streetSuffix.label" default="Street Suffix" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="streetSuffix" maxlength="128" value="${addressData?.streetSuffix}" />
                    </div>
                </div>


                <div class="control-group">
                    <label class="control-label" for="city" ><g:message code="address.city.label" default="City" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="city" maxlength="128" value="${addressData?.city}" /> <span class="help-inline">Required</span>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="state" ><g:message code="address.state.label" default="State" /></label>
                    <div class="controls">
                        %{--<g:textField class="input-xlarge focused" name="state" maxlength="2" value="${addressData?.state}" />  --}%
                        <g:select name="state" from="${addressData.constraints.state.inList}" noSelection="${['':'State']}"></g:select> <span class="help-inline">Required</span>

                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="country" ><g:message code="address.country.label" default="Country" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="country" maxlength="128" value="${addressData?.country}" /><span class="help-inline">Required</span>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="zipCode" ><g:message code="address.zipCode.label" default="Zip Code" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="zipCode" maxlength="128" value="${addressData?.zipCode}" />
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
