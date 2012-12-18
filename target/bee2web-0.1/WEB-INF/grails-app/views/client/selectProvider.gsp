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
    <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'bootstrap.css')}" />

    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <meta name="layout" content="" />
    <script type="text/javascript">
        function closeWindow(){
            top.close();
        }
        function reFacility(){
           var name = document.getElementById("name").value;
            if(name==""||name==null){
                alert("The Facility Name can not be blank!")
                document.getElementById("name").focus();
                return;
            }
        }
        var providerString="";
        function reProvider(){
            var pid = document.getElementsByName("pid");
            var NPI = document.getElementsByName("NPI");
            var firstName = document.getElementsByName("firstName");
            var lastName = document.getElementsByName("lastName");
            var middleName = document.getElementsByName("middleName");
            var dateCreated = document.getElementsByName("dateCreated");
            var len =pid.length;
            if(len>0) {
                for(var i=0;i<len;i++){
                    if(pid[i].checked) {
                        providerString = providerString + NPI[i].value + ":" + firstName[i].value +":"+ lastName[i].value +":"+middleName[i].value+":"+pid[i].value+ ",";
                    }
                }
            }
            parent.window.opener.setProviderInfo(providerString);
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
   <li class="active"><g:link onclick="closeWindow();"><i class="icon-back"></i><g:message code="default.close.label" args="[entityName]" /></g:link></li>
        </ul>
            </div>
        </div>

    <div class="span9">
        <g:if test="${flash.message}">
            <div class="message span9" style="color: red">${flash.message}</div>
        </g:if>
        <div class="well span8">

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
                <g:actionSubmit class="btn btn-primary" action="selectProvider" value="${message(code: 'default.button.search.label', default: 'Search')}" />
            </div>

            <br>
            <div>
                <table class="table table-condensed table-striped">
                    <thead>
                    <tr>

                       <th>${message(code: 'provider.choose.label', default: 'Choose')}</th>

                        <th>${message(code: 'provider.NPI.label', default: 'NPI')} </th>

                        <th>${message(code: 'provider.firstName.label', default: 'First Name')} </th>

                        <th>${message(code: 'provider.lastName.label', default: 'Last Name')} </th>

                        <th>${message(code: 'provider.middleName.label', default: 'Middle Name')} </th>


                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${providerDataList}" status="i" var="providerData">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td class="conent"><g:checkBox  name="pid" id="pid"  value="${providerData.id}" checked="false"></g:checkBox> </td>

                            <td><g:hiddenField name="NPI" id="NPI" value="${providerData.NPI}"/>${providerData.NPI}</td>

                            <td><g:hiddenField name="firstName" id="firstName"  value="${providerData.firstName}"/>${providerData.firstName}</td>

                            <td><g:hiddenField name="lastName" id="lastName"  value="${providerData.lastName}"/>${providerData.lastName}</td>

                            <td><g:hiddenField name="middleName" id="middleName"  value="${providerData.middleName}"/>${providerData.middleName}</td>


                        </tr>
                    </g:each>
                    </tbody>
                </table>
                <div class="pager">
                    <g:paginate action="selectProvider" params="[params:params]" total="${providerDataTotal}" />
                </div>
            </div>
            <div class="control offset4">
                <span class="menuButton"><a class="btn btn-primary" class="save" href="javascript:reProvider();">${message(code: 'default.button.ok.label', default: 'OK')}</a></span>
            </div>
        </div>
    </div>
</g:form>
</div>
</div>
</body>
</html>