
<%@ page import="com.bssi.MessageTemplate" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'messageTemplate.label', default: 'Message Template')}" />
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
                <div class="message span9" style="color: red">${flash.message}</div>
            </g:if>
            <div class="span12">

                <div class="well">
                    <div class="control-group">
                        <label class="control-label" for="type" ><g:message code="bridge.type.label" default="Type" /></label>
                        <div class="controls">
                            <g:textField class="input-xlarge focused" name="type" maxlength="128" value="${params?.type}" />
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label" for="type" ><g:message code="bridge.eventType.label" default="Event Type" /></label>
                        <div class="controls">
                            <g:textField class="input-xlarge focused" name="eventType" maxlength="128" value="${params?.eventType}" />
                        </div>
                    </div>

                    <br>
                    <div class="control offset4">
                        <g:actionSubmit class="btn btn-primary" action="search" value="${message(code: 'default.button.search.label', default: 'Search')}" />
                    </div>
                    <br>
                    <div>
                        <table  class="table table-condensed table-striped">
                            <thead>
                            <tr>
                                <th>${message(code: 'messageTemplate.name.label', default: 'Name')}</th>
                                <th>${message(code: 'messageTemplate.type.label', default: 'Type')}</th>
                                <th>${message(code: 'messageTemplate.eventType.label', default: 'Event Type')}</th>
                                <th>${message(code: 'messageTemplate.description.label', default: 'Description')}</th>
                                <th>${message(code: 'messageTemplate.segment.label', default: 'Segment')}</th>
                                <th>${message(code: 'messageTemplate.segmentIndex.label', default: 'Segment Index')}</th>
                                <th>${message(code: 'messageTemplate.required.label', default: 'Required')}</th>
                                <th>${message(code: 'messageTemplate.repeatable.label', default: 'Repeatable')}</th>

                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${messageTemplateDataList}" status="i" var="messageTemplateData">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td>${fieldValue(bean: messageTemplateData, field: "name")}</td>

                                    <td>${fieldValue(bean: messageTemplateData, field: "type")}</td>

                                    <td>${fieldValue(bean: messageTemplateData, field: "eventType")}</td>

                                    <td>${fieldValue(bean: messageTemplateData, field: "description")}</td>

                                    <td>${fieldValue(bean: messageTemplateData, field: "segment")}</td>

                                    <td>${fieldValue(bean: messageTemplateData, field: "segmentIndex")}</td>

                                    <td><g:checkBox name="kkk" value="${messageTemplateData.required}" onclick="return false"></g:checkBox></td>

                                    <td><g:checkBox name="kkk" value="${messageTemplateData.repeatable}" onclick="return false"></g:checkBox></td>

                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                        <div class="pager">
                            <g:paginate total="${messageTemplateDataTotal}" params="[params:params]" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </g:form>
	</body>
</html>
