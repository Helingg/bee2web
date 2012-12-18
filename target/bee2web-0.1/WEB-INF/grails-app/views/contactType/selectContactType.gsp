
<%@ page import="com.bssi.ContactType" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="" />
    <g:set var="entityName" value="${message(code: 'luContactType.label', default: 'Lu Contact Type')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'bootstrap.css')}" />

    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <script type="text/javascript">
        function setContactTypeInfo(id,contactType){
           parent.window.opener.setContactType(id,contactType);
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
   <li class="active"><g:link onclick="closeWindow();"><i class="icon-back"></i><g:message code="default.close.label" args="[entityName]" /></g:link></li>
        </ul>
            </div>
        </div>
    <g:if test="${flash.message}">
        <div class="message span9" style="color: red">${flash.message}</div>
    </g:if>
    <div class="span9">
        <div class="well ">

            <div class="control-group">
                <label class="control-label" for="contactType" ><g:message code="luContactType.contactType.label" default="Contact Type" /></label>
                <div class="controls">
                    <g:textField class="input-xlarge focused" name="contactType" maxlength="128" style="height:30px" value="${params?.contactType}" />
                </div>
            </div>

            %{--<div class="control-group">--}%
                %{--<label class="control-label" for="activeInd" ><g:message code="luAddrType.activeInd.label" default="Enabled" /></label>--}%
                %{--<div class="controls">--}%
                    %{--<g:checkBox name="activeInd" checked="true" value="${params?.activeInd}"></g:checkBox>--}%
                %{--</div>--}%
            %{--</div>--}%

            <br>
            <div class="control offset4">
                <g:actionSubmit class="btn btn-primary" action="selectContactType" value="${message(code: 'default.button.search.label', default: 'Search')}" />
            </div>

            <br>
            <div>
                <table class="table table-condensed table-striped">
                    <thead>
                    <tr>


                       <th>${message(code: 'luContactType.contactType.label', default: 'Contact Type')}</th>

                        <th>${message(code: 'luContactType.description.label', default: 'Description')}</th>

                        <th>${message(code: 'luContactType.activeInd.label', default: 'Active Ind')}</th>

                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${luContactTypeDataList}" status="i" var="luContactTypeData">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">


                            <td><g:link onclick="setContactTypeInfo('${luContactTypeData.id}','${luContactTypeData.contactType}');">${fieldValue(bean: luContactTypeData, field: "contactType")}</g:link></td>

                            <td><g:link onclick="setContactTypeInfo('${luContactTypeData.id}','${luContactTypeData.contactType}');">${fieldValue(bean: luContactTypeData, field: "description")}</g:link></td>

                            <td><g:link onclick="setContactTypeInfo('${luContactTypeData.id}','${luContactTypeData.contactType}');"><g:checkBox name="" value="${luContactTypeData.activeInd}" onclick="return false"/></g:link></td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
                <div class="pager">
                    <g:paginate action ="selectContactType" params="[activeInd:params.activeInd,contactType:params.contactType,description:params.description]" total="${luContactTypeDataTotal}" />
                </div>
            </div>
        </div>
    </div>
    </div>
    </div>
</g:form>
</body>
</html>
