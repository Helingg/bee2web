<%--
  Created by IntelliJ IDEA.
  User: HLG
  Date: 12-3-23
  Time: 上午11:12
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Select Provider</title>
    <g:set var="entityName" value="${message(code: 'provider.label', default: 'Provider')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'divbk.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'bootstrap.css')}" />

    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <meta name="layout" content="" />
    <script type="text/javascript">
        function reFacility(){
            var name = document.getElementById("name").value;
            if(name==""||name==null){
                alert("The Facility Name can not be blank!")
                document.getElementById("name").focus();
                return;
            }
        }
        var providerString="";
        function reProvider(pid,NPI,firstName,lastName,middleName){



            providerString = providerString + NPI + "," + firstName +","+ lastName +","+middleName+","+pid+ ",";
            parent.window.opener.setProviderInfo(providerString);
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
        <div class="span12 divbk">
            <g:link onclick="closeWindow();"><i class="icon-backward"></i><g:message code="default.close.label" args="[entityName]" /></g:link>
        </div>

        <g:if test="${flash.message}">
            <div class="message span12" style="color: red">${flash.message}</div>
        </g:if>
            <div class="span12">
                <div class="well">

                    <div class="control-group">
                        <label class="control-label"  ><g:message code="provider.firstName.label" default="First Name" /></label>
                        <div class="controls">
                            <g:textField class="input-xlarge focused" style="height:30px" name="firstName1" maxlength="128" value="${params?.firstName1}" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label"  ><g:message code="provider.lastName.label" default="Last name" /></label>
                        <div class="controls">
                            <g:textField class="input-xlarge focused" style="height:30px" name="lastName1" maxlength="128" value="${params?.lastName1}" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" ><g:message code="provider.middleName.label" default="Middle Name" /></label>
                        <div class="controls">
                            <g:textField class="input-xlarge focused" style="height:30px" name="middleName1" maxlength="128" value="${params?.middleName1}" />
                        </div>
                    </div>

                    <br>
                    <div class="control offset4">
                        <g:actionSubmit class="btn btn-primary" action="selectProviderSingle" value="${message(code: 'default.button.search.label', default: 'Search')}" />
                    </div>

                    <br>
                    <div>
                        <table class="table table-condensed table-striped">
                            <thead>
                            <tr>


                                <th>${message(code: 'provider.NPI.label', default: 'NPI')}</th>

                                <th>${message(code: 'provider.firstName.label', default: 'First Name')}</th>

                                <th>${message(code: 'provider.lastName.label', default: 'Last Name')}</th>

                                <th>${message(code: 'provider.middleName.label', default: 'Middle Name')}</th>

                                <th>${message(code: 'provider.SSN.label', default: 'SSN')}</th>

                                <th>${message(code: 'provider.UPIN.label', default: 'UPIN')}</th>


                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${providerDataList}" status="i" var="providerData">
                                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                                    <td><g:link onclick="javascript:reProvider('${providerData.id}','${providerData.NPI}','${providerData.firstName}','${providerData.lastName}','${providerData.middleName}')">${fieldValue(bean: providerData, field: "NPI")}</g:link> </td>

                                    <td><g:link onclick="javascript:reProvider('${providerData.id}','${providerData.NPI}','${providerData.firstName}','${providerData.lastName}','${providerData.middleName}')">${fieldValue(bean: providerData, field: "firstName")}</g:link> </td>

                                    <td><g:link onclick="javascript:reProvider('${providerData.id}','${providerData.NPI}','${providerData.firstName}','${providerData.lastName}','${providerData.middleName}')">${fieldValue(bean: providerData, field: "lastName")}</g:link> </td>

                                    <td><g:link onclick="javascript:reProvider('${providerData.id}','${providerData.NPI}','${providerData.firstName}','${providerData.lastName}','${providerData.middleName}')">${fieldValue(bean: providerData, field: "middleName")}</g:link> </td>


                                    <td><g:link onclick="javascript:reProvider('${providerData.id}','${providerData.NPI}','${providerData.firstName}','${providerData.lastName}','${providerData.middleName}')">${fieldValue(bean: providerData, field: "SSN")}</g:link> </td>

                                    <td><g:link onclick="javascript:reProvider('${providerData.id}','${providerData.NPI}','${providerData.firstName}','${providerData.lastName}','${providerData.middleName}')">${fieldValue(bean: providerData, field: "UPIN")}</g:link> </td>
                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                        <div class="pager">
                            <g:paginate action="selectProvider" params="[params:params]" total="${providerDataTotal}" />
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</g:form>
</body>
</html>