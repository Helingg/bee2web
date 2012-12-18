
<%@ page import="com.bssi.Bridge" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'bridge.label', default: 'Bridge')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<h1><g:message code="default.show.label" args="[entityName]" /></h1>
<hr>
%{--<g:if test="${flash.message}">--}%
%{--<div class="message span9" style="color: red">${flash.message}</div>--}%
%{--</g:if>--}%
%{--<g:hasErrors bean="${bridgeData}">--}%
%{--<div class="errors">--}%
%{--<g:renderErrors bean="${bridgeData}" as="list" />--}%
%{--</div>--}%
%{--</g:hasErrors>--}%
<g:form action="save"  class="form-horizontal">
    <div class="container-fluid span10">
        <div class="span12 divbk">
            <g:link  action="list"><i class="icon-list"></i><g:message code="default.list.label" args="[entityName]" /></g:link>
            <g:link  action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link>
        </div>
        <g:if test="${flash.message}">
            <div class="message span12" style="color: red">${flash.message}</div>
        </g:if>

        <div class="span12" >
            <g:hiddenField name="id" value="${bridgeData?.id}" />
            <g:hiddenField name="version" value="${bridgeData?.version}" />
            <div class="well">
                <div class="control-group">
                    <label class="control-label"><g:message code="bridge.bridgeName.label" default="Bridge Name" />:</label>
                    <div class="controls">
                        <label class="control-label">${bridgeData?.bridgeName}</label>
                    </div>
                </div>


                <div class="control-group">
                    <label class="control-label" ><g:message code="bridge.dateStarted.label" default="Date Started" />:</label>
                    <div class="controls">
                        <label class="control-label">${bridgeData?.dateStarted}</label>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" ><g:message code="bridge.bridgeName.label" default="Date Ended" />:</label>
                    <div class="controls">
                        <label class="control-label">${bridgeData?.dateEnded}</label>
                    </div>
                </div>
            <div class="control-group">
                <label class="control-label" ><g:message code="bridge.ack.label" default="ACK" />:</label>
                <div class="controls">
                    <label class="control-label">${bridgeData?.ack}</label>
                </div>
            </div>
                <div class="control-group">
                    <label class="control-label" ><g:message code="bridge.activeInd.label" default="Enabled" />:</label>
                    <div class="controls">
                        <label class="control-label"><g:checkBox name="" value="${bridgeData?.activeInd}" onclick="return false;"/></label>
                    </div>
                </div>
                <div>
                    <hr>
                    <div>
                        <font size="3" color="#279745" style="margin: 0 150px 0 0"><g:message  code="senderConfig.message.lable" /></font>
                    </div>

                    <div id="receiveInfoDiv" >
                        <table class="table table-condensed table-striped" id="receiveInfoTable">
                            <thead>
                            <tr>

                                <th>${message(code: 'recipientConfig.name.label', default: 'Name')}</th>

                                <th>${message(code: 'recipientConfig.type.label', default: 'Type')}</th>

                                <th>${message(code: 'recipientConfig.ip.label', default: 'Ip')}</th>

                                <th>${message(code: 'recipientConfig.port.label', default: 'Port')}</th>

                                <th>${message(code: 'recipientConfig.user.label', default: 'User')}</th>


                                <th>${message(code: 'recipientConfig.other.label', default: 'Other')}</th>

                                <th>${message(code: 'recipientConfig.client.label', default: 'Source Client')}</th>




                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${receiveInfoInstanceList}" status="i" var="receiveInfoData">
                                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}" id="toBeDelRow<%=i+1%>">

                                    %{--<td><g:link action="show" id="${receiveInfoData.id}">${fieldValue(bean: receiveInfoData, field: "id")}</g:link></td>--}%
                                    <td>${fieldValue(bean: receiveInfoData, field: "name")}</td>

                                    <td>${fieldValue(bean: receiveInfoData, field: "type")}</td>

                                    <td>${fieldValue(bean: receiveInfoData, field: "ip")}</td>

                                    <td>${fieldValue(bean: receiveInfoData, field: "port")}</td>

                                    <td>${fieldValue(bean: receiveInfoData, field: "user")}</td>

                                    <td>${fieldValue(bean: receiveInfoData, field: "other")}</td>

                                    <td>${fieldValue(bean: receiveInfoData, field: "recipientClient")}</td>


                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                    </div>
                    <hr>
                    <div>

                        <font size="3" color="#279745" style="margin: 0 134px 0 0"><g:message  code="recipientConfig.message.lable" /></font>
                    </div>
                    <div id="sendInfoDiv" >
                        <table id="sendInfoTable" class="table table-condensed table-striped">
                            <thead>
                            <tr>

                                <th>${message(code: 'senderConfig.name.label', default: 'Name')}</th>

                                <th>${message(code: 'senderConfig.type.label', default: 'Type')}</th>

                                <th>${message(code: 'senderConfig.ip.label', default: 'Ip')}</th>

                                <th>${message(code: 'senderConfig.port.label', default: 'Port')}</th>

                                <th>${message(code: 'senderConfig.user.label', default: 'User')}</th>

                                <th>${message(code: 'senderConfig.other.label', default: 'Other')}</th>

                                <th>${message(code: 'senderConfig.client.label', default: 'Destination Client')}</th>

                                <th>${message(code: 'mappingRuleGroup.label', default: 'Rule Group')}</th>

                                <th>${message(code: 'senderConfig.ack.label', default: 'ACK')}</th>




                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${sendInfoInstanceList}" status="i" var="sendInfoData">
                                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}" id="toBeDelRow<%=i+1%>">

                                    %{--<td><g:link action="show" id="${sendInfoData.id}">${fieldValue(bean: sendInfoData, field: "id")}</g:link></td>--}%
                                    <td>${sendInfoData.name}</td>

                                    <td>${sendInfoData.type}</td>

                                    <td>${sendInfoData.ip}</td>

                                    <td>${sendInfoData.port}</td>

                                    <td>${sendInfoData.user}</td>

                                    %{--<td>${fieldValue(bean: sendInfoData, field: "password")}</td>--}%

                                    <td>${sendInfoData.other}</td>

                                    <td>${sendInfoData.senderClient}</td>

                                    <td>${sendInfoData.mappingRuleGroup}</td>

                                    <td>
                                        <g:if test="${bridgeData?.ack=='Yes'}">
                                            <g:if test="${receiveInfoInstanceList.ack==sendInfoData.senderClient.id}">
                                                <input type="radio" name="sradio" id="sradio<%=i+1%>" onclick="return false;" checked="true" value="<%=i+1%>">
                                            </g:if>
                                            <g:else>
                                                <input type="radio" name="sradio" id="sradio<%=i+1%>" onclick="return false;"  value="<%=i+1%>">
                                            </g:else>
                                        </g:if>
                                        <g:else><input type="radio" name="sradio" id="sradio<%=i+1%>" value="<%=i+1%>" onclick="return false;" style="display: none"></g:else>
                                    </td>

                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                    </div>
                    <div class="offset3">
                        <g:actionSubmit name="edit" action="edit"  class="btn btn-primary"  value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
                        <g:actionSubmit class="btn btn-danger"  action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                        <g:actionSubmit value="Cancel" name="cancel" action="list" class="btn"></g:actionSubmit>
                    </div>
                </div>
            </div>
        </div>
    </div>
</g:form>
</body>
</html>
