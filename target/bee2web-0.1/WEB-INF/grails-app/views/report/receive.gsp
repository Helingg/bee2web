
<%@ page import="com.bssi.SendLog"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'receiveReport.label', default: 'Destination Report')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>



    <script type="text/javascript">
        $(function() {

            $("#lowDate").datepicker();
            $("#highDate").datepicker();
        });
    </script>
<script>$(function() { $("#tabs").tabs();});</script>
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
                    <div id="tabs">
                        <ul>
                            <li><a href="#tabs-1">Daily Details</a></li>
                            <li><a href="#tabs-2">Summary</a></li>
                        </ul>
                        <div id="tabs-1">
                            <g:form>
                                <table class="table">
                                    <tbody>
                                    <tr class="prop">
                                        <td valign="top" class="name">
                                            <b/><label for="Recipient" style="margin: 0 10px 0 0 "><g:message code="sendLog.Recipient.label" default="Destination Client" /></label>
                                            <g:textField name="recipient" value="${params.recipient}"></g:textField>
                                        </td>
                                    </tr>
                                    <tr class="prop">
                                        <td valign="top" class="name">
                                            <b/><label style="margin: 0 35px 0 0 "><g:message code="sendLog.sentTime.label" default="Time" /></label>
                                            <g:textField name="lowDate" readonly="true" precision="day" value="${params.lowDate}" style="margin: 0 10px 0 0 " />
                                            <b/><label style="margin: 0 10px 0 0 ">To</label>
                                            <g:textField name="highDate"  readonly="true"  precision="day" value="${params.highDate}"  />
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <br>
                                <div class="control offset4">
                                    <g:actionSubmit class="btn btn-primary" action="receive" value="${message(code: 'default.button.search.label', default: 'Search')}" />
                                </div>
                                <br>
                            </g:form>
                            <div class="list">
                                <table class="table table-condensed table-striped">
                                    <thead>
                                    <tr>
                                        <th>Recipient Name</th>
                                        <th>Date</th>
                                        <th>Total</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <g:each in="${detailList}" status="i" var="data">
                                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                            <td>
                                                ${data[0]}
                                            </td>
                                            <td>
                                                ${data[2]}/${data[3]}/${data[1]}
                                            </td>
                                            <td>
                                                ${data[4]}
                                            </td>
                                        </tr>
                                    </g:each>
                                    </tbody>
                                </table>
                            </div>
                            <div class="paginateButtons">
                                <g:paginate action="receive" params="[client:params.client,lowDate:params.lowDate,highDate:params.highDate]" total="${detailTotal}" />
                            </div>
                        </div>
                        <div id="tabs-2">
                            <div class="list">
                                <table class="table table-condensed table-striped">
                                    <thead>
                                    <tr>
                                        <th>Client Name</th>
                                        <th>Total</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <g:each in="${list}" status="i" var="data">
                                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                            <td>
                                                ${data[0]}
                                            </td>
                                            <td>
                                                ${data[1]}
                                            </td>
                                        </tr>
                                    </g:each>
                                    </tbody>
                                </table>
                            </div>
                            <div class="paginateButtons">
                                <g:paginate action="receive" total="${total}" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</g:form>
</body>
</html>
