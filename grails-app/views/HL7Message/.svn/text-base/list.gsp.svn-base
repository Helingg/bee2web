
<%@ page import="com.bssi.HL7Message" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'HL7Message.label', default: 'Sent Message')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
        <g:javascript library="ui/jquery.ui.datepicker" />
        <script type="text/javascript">
            $(function() {

                $("#lowDate").datepicker();
                $("#highDate").datepicker();
            });
        </script>
    </head>
    <body>        
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
			<div class="nav">            
            </div>
            <g:form method="post" >
                <g:hiddenField name="id" value="${HL7MessageData?.id}" />
                <g:hiddenField name="version" value="${HL7MessageData?.version}" />
                <div class="dialog">
                    <table class="table">
                        <tbody>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="client"><g:message code="HL7Message.client.label" default="Client" /></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <g:textField name="client" value="${params.client}"></g:textField>&nbsp;&nbsp;
                                <label for="type"><g:message code="HL7Message.type.label" default="Type" /></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <g:textField name="type" maxlength="3" value="${params.type}" />
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="event"><g:message code="HL7Message.event.label" default="Event" /></label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <g:textField name="event" maxlength="3" value="${params.event}" /> &nbsp;&nbsp;
                                <label for="remoteIp"><g:message code="HL7Message.remoteIp.label" default="Remote Ip" /></label> &nbsp;&nbsp;
                                <g:textField name="remoteIp" maxlength="128" value="${params.remoteIp}" />
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="dateCreated"><g:message code="sendLog.date.label" default="Date" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;From</label> &nbsp;&nbsp;
                                <g:textField name="lowDate" precision="day" value="${params.lowDate}"  readonly="true" /> &nbsp;&nbsp;
                                <label for="dateCreated">To</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                                <g:textField name="highDate" precision="day" value="${params.highDate}" readonly="true" />
                            </td>
                        </tr>


                        <tr class="prop">
                            <td valign="top" >
                                <div class="buttons" style="width:90px">
                                    <span class="button"><g:actionSubmit class="save" action="search" value="${message(code: 'default.button.search.label', default: 'Search')}" /></span>
                                </div>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>

            </g:form>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'HL7Message.id.label', default: 'Id')}" />
                            
                            <th><g:message code="HL7Message.client.label" default="Client" /></th>
                        
                            <g:sortableColumn property="msgCtrlId" title="${message(code: 'HL7Message.msgCtrlId.label', default: 'Msg Ctrl Id')}" />
                        
                            <g:sortableColumn property="type" title="${message(code: 'HL7Message.type.label', default: 'Type')}" />
                        
                            <g:sortableColumn property="event" title="${message(code: 'HL7Message.event.label', default: 'Event')}" />
                        
                            <g:sortableColumn property="remoteIp" title="${message(code: 'HL7Message.remoteIp.label', default: 'Remote Ip')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'HL7Message.dateCreated.label', default: 'Date Created')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${HL7MessageDataList}" status="i" var="HL7MessageData">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${HL7MessageData[0]}">${HL7MessageData[0]}</g:link></td>
                        
                            <td><g:link action="edit" id="${HL7MessageData[0]}">${HL7MessageData[1]}</g:link></td>

                            <td><g:link action="edit" id="${HL7MessageData[0]}">${HL7MessageData[2]}</g:link></td>
                        
                            <td><g:link action="edit" id="${HL7MessageData[0]}">${HL7MessageData[3]}</g:link></td>
                        
                            <td><g:link action="edit" id="${HL7MessageData[4]}">${HL7MessageData[4]}</g:link></td>
                        
                            <td>${HL7MessageData[5]}</td>
                        
                            <td><g:formatDate  date="${HL7MessageData[6]}" /></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate action="search" params="[client:params.client,type:params.type,event:params.event,remoteIp:params.remoteIp,lowDate:params.lowDate,highDate:params.highDate]" total="${HL7MessageDataTotal}" />
            </div>
			<div class="nav">            
            </div>
        </div>
    </body>
</html>
