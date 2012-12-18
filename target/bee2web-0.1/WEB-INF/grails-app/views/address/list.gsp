
<%@ page import="com.bssi.Address" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

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
       <li class="active"><g:link  action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link></li>
        </ul>
            </div>
        </div>
        <g:if test="${flash.message}">
            <div class="message span9" style="color: red">${flash.message}</div>
        </g:if>
        <div class="span9">
            <div class="well">

                <div class="control-group">
                    <label class="control-label" for="streetNbr" ><g:message code="address.streetNbr.label" default="Street Number" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="streetNbr" maxlength="128" value="${params?.streetNbr}" />
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="streetAddr" ><g:message code="address.streetAddr.label" default="Street Address" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="streetAddr" maxlength="128" value="${params?.streetAddr}" />
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="city" ><g:message code="address.city.label" default="City" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="city" maxlength="128" value="${params?.city}" />
                    </div>
                </div>



                <br>
                <div class="control offset4">
                    <g:actionSubmit class="btn btn-primary"  action="search" value="${message(code: 'default.button.search.label', default: 'Search')}" />
                </div>
                <br>
                <div>
                    <table class="table table-condensed table-striped">
                        <thead>
                        <tr>


                           <th>${message(code: 'address.id.label', default: 'Id')}</th>

                           <th>${message(code: 'address.streetNbr.label', default: 'Street Number')}</th>

                            <th>${message(code: 'address.streetAddr.label', default: 'Street Address')}</th>


                            <th>${message(code: 'address.streetPrefix.label', default: 'Street Prefix')}</th>

                            <th>${message(code: 'address.streetSuffix.label', default: 'Street Suffix')}</th>

                            <th>${message(code: 'address.city.label', default: 'City')}</th>

                            <th>${message(code: 'address.state.label', default: 'State')}</th>

                            <th>${message(code: 'address.country.label', default: 'Country')}</th>

                            <th>${message(code: 'address.zipCode.label', default: 'Zip Code')}</th>




                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${addressDataList}" status="i" var="addressData">
                            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">


                                <td><g:link action="show" id="${addressData.id}">${fieldValue(bean: addressData, field: "id")}</g:link></td>
                                <td><g:link action="edit" id="${addressData.id}">${fieldValue(bean: addressData, field: "streetNbr")}</g:link></td>
                                <td><g:link action="edit" id="${addressData.id}">${fieldValue(bean: addressData, field: "streetAddr")}</g:link></td>

                                <td><g:link action="edit" id="${addressData.id}">${fieldValue(bean: addressData, field: "streetPrefix")}</g:link></td>

                                <td><g:link action="edit" id="${addressData.id}">${fieldValue(bean: addressData, field: "streetSuffix")}</g:link></td>

                                <td><g:link action="edit" id="${addressData.id}">${fieldValue(bean: addressData, field: "city")}</g:link></td>

                                <td><g:link action="edit" id="${addressData.id}">${fieldValue(bean: addressData, field: "state")}</g:link></td>

                                <td>${fieldValue(bean: addressData, field: "country")}</td>

                                <td>${fieldValue(bean: addressData, field: "zipCode")}</td>

                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                    <div class="pager">
                        <g:paginate action="search" params="[params:params]" total="${addressDataTotal}" />
                    </div>
                </div>
            </div>
        </div>
    </g:form>
    </div>
    </div>
    </body>
</html>
