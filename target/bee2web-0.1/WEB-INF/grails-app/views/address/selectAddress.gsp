
<%@ page import="com.bssi.Address" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />

    <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'bootstrap.css')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <script type="text/javascript">
        function setAddressInfo (id,num,addr){
            parent.window.opener.setAddress(id,num,addr);
            top.close();
        }
        function closeWindow(){
            top.close();
        }
    </script>
</head>
<body>
<h1><g:message code="default.list.label" args="[entityName]" /></h1>
<hr>

<g:form method="post"  class="form-horizontal" >
    <div class="container-fluid span10">
<div class="row-fluid">
<div class="span3">
<div class="well sidebar-nav">
<ul class="nav nav-list">
   <li class="nav-header">Option</li>
   <li class="active"><g:link  onclick="closeWindow();"><i class="icon-close"></i><g:message code="default.close.label" args="[entityName]" /></g:link></li>
        </ul>
            </div>
        </div>

    <div class="span9">
        <g:if test="${flash.message}">
            <div class="message span9" style="color: red">${flash.message}</div>
        </g:if>
        <div class="well span8">

            <div class="control-group">
                <label class="control-label" for="streetNbr" ><g:message code="address.streetNbr.label" default="Street Number" /></label>
                <div class="controls">
                    <g:textField class="input-xlarge focused" style="height:30px" name="streetNbr" maxlength="128" value="${params?.streetNbr}" />
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="streetAddr" ><g:message code="address.streetAddr.label" default="Street Address" /></label>
                <div class="controls">
                    <g:textField class="input-xlarge focused" style="height:30px" name="streetAddr" maxlength="128" value="${params?.streetAddr}" />
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="city" ><g:message code="address.city.label" default="City" /></label>
                <div class="controls">
                    <g:textField class="input-xlarge focused" style="height:30px" name="city" maxlength="128" value="${params?.city}" />
                </div>
            </div>



            <br>
            <div class="control offset4">
                <g:actionSubmit class="btn btn-primary"  action="selectAddress" value="${message(code: 'default.button.search.label', default: 'Search')}" />
            </div>
            <br>
            <div>
                <table class="table table-condensed table-striped">
                    <thead>
                    <tr>


                        <th>${message(code: 'address.streetNbr.label', default: 'Street Number')}</th>

                        <th>${message(code: 'address.streetAddr.label', default: 'Street Address')}</th>

                        <th>${message(code: 'address.city.label', default: 'City')}</th>
                        <th>${message(code: 'address.state.label', default: 'State')}</th>


                        <th>${message(code: 'address.country.label', default: 'Country')}</th>
                        <th>${message(code: 'address.zipCode.label', default: 'Zip Code')}</th>


                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${addressDataList}" status="i" var="addressData">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><g:link onclick="setAddressInfo('${addressData.id}','${addressData.streetNbr}','${addressData.streetAddr}');">${fieldValue(bean: addressData, field: "streetNbr")}</g:link></td>

                            <td><g:link onclick="setAddressInfo('${addressData.id}','${addressData.streetNbr}','${addressData.streetAddr}');">${fieldValue(bean: addressData, field: "streetAddr")}</g:link></td>

                            <td><g:link onclick="setAddressInfo('${addressData.id}','${addressData.streetNbr}','${addressData.streetAddr}');">${fieldValue(bean: addressData, field: "city")}</g:link></td>

                            <td><g:link onclick="setAddressInfo('${addressData.id}','${addressData.streetNbr}','${addressData.streetAddr}');">${fieldValue(bean: addressData, field: "state")}</g:link></td>

                            <td><g:link onclick="setAddressInfo('${addressData.id}','${addressData.streetNbr}','${addressData.streetAddr}');">${fieldValue(bean: addressData, field: "country")}</g:link></td>

                            <td><g:link onclick="setAddressInfo('${addressData.id}','${addressData.streetNbr}','${addressData.streetAddr}');">${fieldValue(bean: addressData, field: "zipCode")}</g:link></td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
                <div class="pager">
                    <g:paginate action="search" params="[streetNbr:params.streetNbr,streetPrefix:params.streetPrefix,streetSuffix:params.streetSuffix,country:params.country,city:params.city,state:params.state,zipCode:params.zipCode,streetAddr:params.streetAddr]" total="${addressDataTotal}" />
                </div>
            </div>
        </div>
    </div>
</g:form>
</body>
</html>
