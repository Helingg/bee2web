
<%@ page import="com.bssi.SendLog" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'sendLog.label', default: 'Source Log')}" />
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

    <div class="container-fluid span12">
        <div class="span12 divbk">
            <g:link controller="login"  action="index"><i class="icon-home"></i>Home</g:link>
        </div>
        <g:if test="${flash.message}">
            <div class="message span12" style="color: red">${flash.message}</div>
        </g:if>
        <div class="span12">
            <div class="well">
                <div>
                    <table class="table table-condensed table-striped">
                        <tbody>
                        <tr class="prop">
                            <td valign="top" class="name">
                                <b/><label for="sendClient"><g:message code="sendLog.sendClient.label" default="Source Client" /></label>
                            </td>
                            <td>
                                <g:textField name="sendClient" value="${params.sendClient}"></g:textField>
                            </td>
                            <td>
                                <b/> <label for="receiveClient"><g:message code="sendLog.receiveClient.label" default="Destination Client" /></label>
                            </td>
                            <td>
                                <g:textField name="receiveClient" value="${params.receiveClient}"></g:textField>
                            </td>
                        </tr>


                        <tr class="prop">
                            <td valign="top" class="name">
                                <b/><label><g:message code="sendLog.sentTime.label" default="Sent Time From" /></label>
                            </td>
                            <td>
                                <g:textField name="lowDate" readonly="true" precision="day" value="${params.lowDate}"  />
                            </td>
                            <td>
                                <b/><label > To </label>
                            </td>
                            <td>
                                <g:textField name="highDate" readonly="true" precision="day" value="${params.highDate}"  />
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
                            <th>${message(code: 'sendLog.id.label', default: 'Id')}</th>
                            <th><g:message code="sendLog.sendClient.label" default="Source Client" /></th>
                            <th><g:message code="sendLog.receiveClient.label" default="Destination Client" /></th>
                            <th>${message(code: 'sendLog.msgCtrlId.label', default: 'Msg Ctrl Id')}</th>
                            %{--<th>${message(code: 'sendLog.ack.label', default: 'Receive Ack')}</th>--}%
                            <th>${message(code: 'sendLog.sentTime.label', default: 'Sent Time')}</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${sendLogDataList}" status="i" var="sendLogData">
                            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                                <td>${sendLogData.id}</td>

                                <td>${sendLogData.sendClient}</td>

                                <td>${sendLogData.receiveClient}</td>

                                <td>${sendLogData.msgCtrlId}</td>

                                %{--<td>${sendLogData.receivedAck}</td>--}%

                                <td><g:formatDate  date="${sendLogData.sentTime}" /></td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                    <div class="pager">
                        <g:paginate action="search" params = "[params:params]" total="${sendLogDataTotal}" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</g:form>
</body>
</html>
