
<%@ page import="com.bssi.ProviderType" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'providerType.label', default: 'Provider Type')}" />
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
                    <label class="control-label"  ><g:message code="provider.providerType.label" default="Provider Type" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="type" maxlength="16" value="${params?.type}" />
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

                            <th>${message(code: 'providerType.id.label', default: 'Id')}</th>

                            <th>${message(code: 'providerType.type.label', default: 'Provider Type')}</th>

                            <th>${message(code: 'providerType.conmments.label', default: 'Conmments')}</th>

                            <th>${message(code: 'providerType.dataCreated.label', default: 'Date Created')}</th>



                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${providerTypeDataList}" status="i" var="providerTypeData">
                            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                                <td><g:link action="show" id="${providerTypeData.id}">${providerTypeData.id}</g:link></td>

                                <td><g:link action="edit" id="${providerTypeData.id}">${providerTypeData.type}</g:link></td>

                                <td><g:link action="edit" id="${providerTypeData.id}">${providerTypeData.conmments}</g:link></td>

                                <td><g:link action="edit" id="${providerTypeData.id}">${providerTypeData.dateCreated}</g:link></td>

                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                    <div class="pager">
                        <g:paginate action="search" params="[params:params]" total="${providerTypeDataTotal}" />
                    </div
                </div>

            </div>

        </div>
    </div>
    </div>
</g:form>
</body>
</html>
