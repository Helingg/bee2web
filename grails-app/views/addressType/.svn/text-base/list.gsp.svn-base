
<%@ page import="com.bssi.AddressType" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'luAddrType.label', default: 'Lu Address Type')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>

</head>
<body>
<h1><g:message code="default.list.label" args="[entityName]" /></h1>
<hr>

<g:form method="post"  class="form-horizontal" >
    <div class="container-fluid span10">
        <div class="span12 divbk">
            <g:link  action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link>
        </div>
        <g:if test="${flash.message}">
            <div class="message span12" style="color: red">${flash.message}</div>
        </g:if>
        <div class="span12">
            <div class="well">

                <div class="control-group">
                    <label class="control-label" for="addrType" ><g:message code="luAddrType.addrType.label" default="Address Type" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="addrType" maxlength="128" value="${params?.addrType}" />
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="activeInd" ><g:message code="luAddrType.activeInd.label" default="Enabled" /></label>
                    <div class="controls">
                        <g:checkBox name="activeInd" value="${params?.activeInd}" checked="true"></g:checkBox>
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

                            <th>${message(code: 'luAddrType.id.label', default: 'Id')}</th>

                            <th>${message(code: 'luAddrType.addrType.label', default: 'Address Type')}</th>

                            <th>${message(code: 'luAddrType.description.label', default: 'Description')}</th>

                            <th>${message(code: 'luAddrType.activeInd.label', default: 'Active Ind')}</th>

                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${luAddrTypeDataList}" status="i" var="luAddrTypeData">
                            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                                <td><g:link action="show" id="${luAddrTypeData.id}">${fieldValue(bean: luAddrTypeData, field: "id")}</g:link></td>

                                <td><g:link action="edit" id="${luAddrTypeData.id}">${fieldValue(bean: luAddrTypeData, field: "addrType")}</g:link></td>

                                <td><g:link action="edit" id="${luAddrTypeData.id}">${fieldValue(bean: luAddrTypeData, field: "description")}</g:link></td>

                                <td><g:checkBox name="booleanShow" value="${luAddrTypeData.activeInd}" onclick="return false"></g:checkBox></td>

                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                    <div class="pager">
                        <g:paginate action="search" params="[addrType:params.addrType,activeInd: params.activeInd,description:params.description]" total="${luAddrTypeDataTotal}" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</g:form>
</body>
</html>
