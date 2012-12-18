<%@ page import="com.bssi.SegmentTemplate" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'templateDatabase.label', default: 'Segment Template')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <script type="text/javascript">
        function a(){
            alert(document.getElementById('fileh').value);
        }
    </script>

</head>
<body>
<h1><g:message code="default.create.label" args="[entityName]" /></h1>
<hr>
<g:form method="post"  enctype="multipart/form-data">
    <div class="container-fluid span10">
        <div class="span12 divbk">
            <g:link  action="list"><i class="icon-list"></i><g:message code="default.list.label" args="[entityName]" /></g:link>
        </div>
        <g:if test="${flash.message}">
            <div class="message span9" style="color: red">${flash.message}</div>
        </g:if>
        <div class="span12" >
            <div class="well">
                <div class="control-group">
                    <label class="control-label ">Hl7 Segment XML File</label>
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
