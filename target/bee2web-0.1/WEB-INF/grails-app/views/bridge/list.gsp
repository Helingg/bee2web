
<%@ page import="com.bssi.Bridge" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'bridge.label', default: 'Bridge')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>

    <script type="text/javascript">
        $(function() {
            $("#lowDate").datepicker();
            $("#highDate").datepicker();
        });


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
                        <li class="active"><g:link  action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link>
                    </ul>
                </div>
            </div>
            <div class="span9">
                <g:if test="${flash.message}">
                    <div class="message span9" style="color: red">${flash.message}</div>
                </g:if>
                <div class="well span9">
                    <div class="control-group">
                        <label class="control-label" for="bridgeName" ><g:message code="bridge.bridgeName.label" default="Bridge Name" /></label>
                        <div class="controls">
                            <g:textField class="input-xlarge focused" name="bridgeName" maxlength="128" value="${params?.bridgeName}" />
                        </div>
                    </div>



                    %{--<div class="control-group">--}%
                    %{--<label class="control-label" for="mappingRuleGroup" ><g:message code="bridge.mappingRuleGroup.label" default="Mapping RuleGroup" /></label>--}%
                    %{--<div class="controls">--}%
                    %{--<g:textField class="input-xlarge focused" name="mappingRuleGroup" maxlength="128" value="${params?.mappingRuleGroup}" />--}%
                    %{--</div>--}%
                    %{--</div>--}%

                    <br>
                    <div class="control offset4">
                        <g:actionSubmit class="btn btn-primary" action="search" value="${message(code: 'default.button.search.label', default: 'Search')}" />
                    </div>
                    <br>
                    <div>
                        <table class="table table-condensed table-striped">
                            <thead>
                            <tr>

                                <th><g:message code="bridge.id.label" default="Id" /></th>

                                <th><g:message code="bridge.bridgeName.label" default="Bridge Name" /></th>

                                %{--<th><g:message code="bridge.sender.label" default="Sender" /></th>--}%

                                %{--<th><g:message code="bridge.receiver.label" default="Receiver" /></th>--}%

                                %{--<th><g:message code="bridge.mappingRuleGroup.label" default="Mapping Rule Group" /></th>--}%

                                <th><g:message code="bridge.dateCreated.label" default="Date Created" /></th>


                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${bridgeDataList}" status="i" var="bridgeData">
                                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                                    <td><g:link action="show" id="${bridgeData.id}">${bridgeData.id}</g:link></td>

                                    <td><g:link action="edit" id="${bridgeData.id}">${bridgeData.bridgeName}</g:link></td>

                                    %{--<td><g:link action="edit" id="${bridgeData.id}">${bridgeData.sender.name}</g:link></td>--}%

                                    %{--<td><g:link action="edit" id="${bridgeData.id}">${bridgeData.receiver.name}</g:link></td>--}%

                                    %{--<td><g:link action="edit" id="${bridgeData.id}">${bridgeData.mappingRuleGroup}</g:link></td>--}%

                                    <td><g:formatDate  date="${bridgeData.dateCreated}"></g:formatDate></td>

                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                        <div class="pager">
                            <g:paginate action="search" params="[params:params]" total="${bridgeDataTotal}" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</g:form>
</body>
</html>
