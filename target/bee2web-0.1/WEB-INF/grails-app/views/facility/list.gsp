
<%@ page import="com.bssi.Facility" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />

        <g:set var="entityName" value="${message(code: 'facility.label', default: 'Facility')}" />
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
                                <li class="active"><g:link  action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link>
                            </ul>
                            </div>
                        </div>
                        <g:if test="${flash.message}">
                            <div class="message span9" style="color: red">${flash.message}</div>
                        </g:if>
                        <div class="span9">
                            <div class="well">
                                <div class="control-group">
                                    <label class="control-label" for="name" ><g:message code="facility.name.label" default="Name" /></label>
                                    <div class="controls">
                                        <g:textField class="input-xlarge focused" name="name" maxlength="128" value="${params?.name}" />
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" ><g:message code="facility.client.label" default="Client" /></label>
                                    <div class="controls">
                                        <g:textField  class="input-xlarge focused" placeholder="" name="clientShow" value="${params?.client}" ></g:textField>
                                    </div>
                                </div>
                                %{--<div class="control">--}%
                                    %{--<label class="control-label" for="activeInd"><g:message code="facility.activeInd.label" default="Active Ind" /></label>--}%
                                    %{--<div class="controls">--}%
                                        %{--<g:checkBox name="activeInd" value = "${params.activeInd}" checked="true"></g:checkBox>--}%
                                    %{--</div>--}%
                                %{--</div>--}%
                                <br>
                                <div class="control offset4">
                                    <g:actionSubmit class="btn btn-primary"  action="search" value="${message(code: 'default.button.search.label', default: 'Search')}" />
                                </div>
                                <br>
                                <div>
                                    <table class="table table-condensed table-striped">
                                        <thead>
                                        <tr>

                                           <th>${message(code: 'facility.id.label', default: 'Id')}</th>

                                            <th>${message(code: 'facility.name.label', default: 'Name')}</th>

                                            <th>${message(code: 'facility.comment.label', default: 'Comment')}</th>

                                            <th>${message(code: 'facility.activeInd.label', default: 'Active Ind')}</th>

                                            <th><g:message code="facility.client.label" default="Client" /></th>

                                        <th>${message(code: 'facility.dateCreated.label', default: 'Date Created')}</th>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <g:each in="${facilityDataList}" status="i" var="facilityData">
                                            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                                                <td><g:link action="show" id="${facilityData.id}">${fieldValue(bean: facilityData, field: "id")}</g:link></td>

                                                <td><g:link action="edit" id="${facilityData.id}">${fieldValue(bean: facilityData, field: "name")}</g:link></td>

                                                <td><g:link action="edit" id="${facilityData.id}">${fieldValue(bean: facilityData, field: "comment")}</g:link></td>
                                                <td>
                                                    <g:checkBox name="activeIndRe" value="${facilityData.activeInd}" onclick="return  false"></g:checkBox>
                                                </td>

                                                <td>${fieldValue(bean: facilityData, field: "client")}</td>

                                                <td><g:formatDate date="${facilityData.dateCreated}" /></td>

                                            </tr>
                                        </g:each>
                                        </tbody>
                                    </table>
                                    <div class="pager">
                                        <g:paginate action="search"  params="[name:params.name,client:params.client,activeInd: params.activeInd]" total="${facilityDataTotal}" />
                                    </div>
                                </div>

                            </div>

                        </div>
                        </div>
                    </div>
            </g:form>

    </body>
</html>
