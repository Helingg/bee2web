
<%@ page import="com.bssi.Provider" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'provider.label', default: 'Provider')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />

    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

<h1><g:message code="default.list.label" args="[entityName]" /></h1>
<hr>


<div class="container-fluid span10">
<g:form method="post"  class="form-horizontal" >
    <div class="span12 divbk">
        <g:link  action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link>
    </div>
    <g:if test="${flash.message}">
        <div class="message span12" style="color: red">${flash.message}</div>
    </g:if>
    <div class="span12">
        <div class="well">
            <div class="control-group">
                <label class="control-label"  ><g:message code="provider.firstName.label" default="First Name" /></label>
                <div class="controls">
                    <g:textField class="input-xlarge focused" name="firstName" maxlength="128" value="${params?.firstName}" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label"  ><g:message code="provider.lastName.label" default="Last name" /></label>
                <div class="controls">
                    <g:textField class="input-xlarge focused" name="lastName" maxlength="128" value="${params?.lastName}" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" ><g:message code="provider.middleName.label" default="Middle Name" /></label>
                <div class="controls">
                    <g:textField class="input-xlarge focused" name="middleName" maxlength="128" value="${params?.middleName}" />
                </div>
            </div>

            <br>
            <div class="control offset4">
                <g:actionSubmit class="btn btn-primary" action="search" value="${message(code: 'default.button.search.label', default: 'Search')}" />
            </div>
            <hr>
            <div>
                <table class="table table-condensed table-striped">
                    <thead>
                    <tr>

                        <th>${message(code: 'provider.id.label', default: 'Id')}</th>

                        <th>${message(code: 'provider.lastName.label', default: 'Last Name')}</th>

                        <th>${message(code: 'provider.firstName.label', default: 'First Name')}</th>

                        <th>${message(code: 'provider.middleName.label', default: 'Middle Name')}</th>

                        %{--<th>${message(code: 'provider.NPI.label', default: 'NPI')}</th>--}%

                        <th>${message(code: 'provider.DOB.label', default: 'DOB')}</th>

                        %{--<th>${message(code: 'provider.MLN.label', default: 'MLN')}</th>--}%

                        <th>${message(code: 'provider.SSN.label', default: 'SSN')}</th>

                        <th>${message(code: 'provider.UPIN.label', default: 'UPIN')}</th>

                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${providerDataList}" status="i" var="providerData">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><g:link action="show" id="${providerData.id}">${providerData.id}</g:link></td>

                            <td><g:link action="edit" id="${providerData.id}">${providerData.lastName}</g:link></td>

                            <td><g:link action="edit" id="${providerData.id}">${providerData.firstName}</g:link></td>

                            <td>${providerData.middleName}</td>

                            %{--<td><g:link action="edit" id="${providerData.id}">${providerData.NPI}</g:link></td>--}%

                            <td>${providerData.DOB}</td>

                            %{--<td>${providerData.MLN}</td>--}%

                            <td>${providerData.SSN}</td>

                            <td>${providerData.UPIN}</td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
                <div class="pager">
                    <g:paginate action="search" params="[NPI:params.NPI,client:params.client,firstName:params.firstName,lastName:params.lastName]" total="${providerDataTotal}" />
                </div
            </div>

        </div>

    </div>
    </div>
</g:form>
</div>
</body>
</html>
