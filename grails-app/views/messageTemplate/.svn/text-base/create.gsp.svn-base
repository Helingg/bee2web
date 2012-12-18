<%@ page import="com.bssi.MessageTemplate" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'messageTemplate.label', default: 'Message Template')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
    <h1><g:message code="default.new.label" args="[entityName]" /></h1>
    <hr>
    <g:form method="post"  enctype="multipart/form-data">
        <div class="container-fluid span10">
            <div class="span12 divbk">
                <g:link  action="list"><i class="icon-list"></i><g:message code="default.list.label" args="[entityName]" /></g:link>
            </div>
            <g:if test="${flash.message}">
                <div class="message span12" style="color: red">${flash.message}</div>
            </g:if>
            <div class="span12" >
                <div class="well">

                    <div class="control-group">
                        <label class="control-label ">Hl7 Message XML File</label>
                        <div class="controls">
                            <input type="file" id="fileh" name="fileh">
                        </div>
                    </div>


                    <div class="offset3">
                        <g:actionSubmit value="Create" name="create" action="parseXml" class="btn btn-primary"></g:actionSubmit>
                        <g:actionSubmit value="Cancel" name="cancel" action="list" class="btn"></g:actionSubmit>
                    </div>
                </div>
            </div>
        </div>
    </g:form>
	</body>
</html>
