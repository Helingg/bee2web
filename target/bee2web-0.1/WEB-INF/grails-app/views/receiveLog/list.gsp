
<%@ page import="com.bssi.ReceiveLog" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'receiveLog.label', default: 'Destination Log')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />

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
                        </ul>
                    </div>
                </div>
                <div class="span9">
                    <g:if test="${flash.message}">
                        <div class="message span9" style="color: red">${flash.message}</div>
                    </g:if>
                    <div class="well span8">
                        <div>
                            <table class="table table-condensed table-striped">
                                <tbody>

                                <tr class="prop">
                                    <td valign="top" class="name">
                                        <b/><label for="remoteIp"><g:message code="receiveLog.remoteIp.label" default="Remote Ip" /></label>
                                    </td>
                                    <td>
                                        <g:textField name="remoteIp" maxlength="128" value="${params.remoteIp}" />
                                    </td>
                                </tr>

                                <tr class="prop">
                                    <td valign="top" class="name">
                                        <b/><label for="receiveTime"><g:message code="receiveLog.receiveTime.label" default="Receive Time From" /></label>
                                    </td>
                                    <td>
                                        <g:textField name="lowDate" precision="day" value="${params.lowDate}" readonly="true" />
                                    </td>
                                    <td>
                                        <b/><label> To</label>
                                    </td>
                                    <td>
                                        <g:textField name="highDate" precision="day" value="${params.highDate}" readonly="true"  />
                                    </td>
                                </tr>

                                </tbody>
                            </table>

                        </div>
                        <br>
                        <div class="control offset4">
                            <g:actionSubmit class="btn btn-primary" action="search" value="${message(code: 'default.button.search.label', default: 'Search')}" />
                        </div>
                        <br>
                        <div>
                            <table class="table table-condensed table-striped">
                                <thead>
                                <tr>

                                    <th>${message(code: 'receiveLog.id.label', default: 'Id')}</th>

                                    <th><g:message code="receiveLog.sendClient.label" default="Source Client" /></th>

                                    <th><g:message code="receiveLog.receiveClient.label" default="Destination Client" /></th>

                                    <th>${message(code: 'receiveLog.msgCtrlId.label', default: 'Msg Ctrl Id')}</th>

                                    <th>${message(code: 'receiveLog.remoteIp.label', default: 'Remote Ip')}</th>

                                    <th>${message(code: 'receiveLog.receiveTime.label', default: 'Receive Time')}</th>

                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${receiveLogDataList}" status="i" var="receiveLogData">
                                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                                        <td>${fieldValue(bean: receiveLogData, field: "id")}</td>

                                        <td>${receiveLogData.sendClient}</td>

                                        <td>${receiveLogData.receiveClient}</td>

                                        <td>${fieldValue(bean: receiveLogData, field: "msgCtrlId")}</td>

                                        <td>${fieldValue(bean: receiveLogData, field: "remoteIp")}</td>

                                        <td><g:formatDate date="${receiveLogData.receiveTime}"/></td>

                                    </tr>
                                </g:each>
                                </tbody>
                            </table>
                            <div class="pager">
                                <g:paginate action="search" params = "[params:params]" total="${receiveLogDataTotal}" />
                            </div
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </g:form>
    </div>
    </body>
</html>
