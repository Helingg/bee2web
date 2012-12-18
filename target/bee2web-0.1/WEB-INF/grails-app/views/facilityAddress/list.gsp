
<%@ page import="com.bssi.FacilityAddress" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'facilityAddress.label', default: 'Facility Address')}" />
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

        <div class="span9">
            <g:if test="${flash.message}">
                <div class="message span9" style="color: red">${flash.message}</div>
            </g:if>
            <div class="well span8">

                <div class="control-group">
                    <label class="control-label" for="facility" ><g:message code="facilityAddress.facility.label" default="Facility" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="facility" maxlength="128" value="${params?.facility}" />
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="addr" ><g:message code="facilityAddress.addr.label" default="Address" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="addr" maxlength="128" value="${params?.addr}" />
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

                            <th>${message(code: 'facilityAddress.id.label', default: 'Id')}</th>

                            <th><g:message code="facilityAddress.facility.label" default="Facility" /></th>


                            <th><g:message code="facilityAddress.addr.label" default="Address" /></th>


                            <th><g:message code="facilityAddress.luAddrType.label" default="Address Type" /></th>

                            <th>${message(code: 'facilityAddress.activeInd.label', default: 'Active Ind')}</th>

                            <th>${message(code: 'facilityAddress.dateCreate.label', default: 'Date Created')}</th>



                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${facilityAddressDataList}" status="i" var="facilityAddressData">
                            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                                <td><g:link action="show" id="${facilityAddressData.id}">${fieldValue(bean: facilityAddressData, field: "id")}</g:link></td>

                                <td><g:link action="edit" id="${facilityAddressData.id}">${fieldValue(bean: facilityAddressData, field: "facility")}</g:link></td>


                                <td><g:link action="edit" id="${facilityAddressData.id}">${fieldValue(bean: facilityAddressData, field: "addr")}</g:link></td>


                                <td><g:link action="edit" id="${facilityAddressData.id}">${fieldValue(bean: facilityAddressData, field: "addrType")}</g:link></td>

                                <td><g:formatBoolean boolean="${facilityAddressData.activeInd}" /></td>

                                <td><g:formatDate date="${facilityAddressData.dateCreated}" /></td>



                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                    <div class="pager">
                        <g:paginate action="search" params="[params:params]" total="${facilityAddressDataTotal}" />
                    </div>
                </div>
            </div>
        </div>
        </div>
        </div>
    </g:form>
    </body>
</html>
