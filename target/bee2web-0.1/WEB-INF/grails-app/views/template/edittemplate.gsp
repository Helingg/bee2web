

<%@ page import="com.bssi.Template" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
    <g:set var="entityName" value="${message(code: 'template.label', default: 'Template')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
    <g:javascript library="ui/jquery"></g:javascript>
    <script type="text/javascript">
        function update(){
            var dataString=""
            var id = document.getElementById('id').value;
            var type = document.getElementById('type').value;
            var hl7version = document.getElementById('hl7version').value;
            var segment = document.getElementById('segment').value;
            var segmentIndex = document.getElementById('segmentIndex').value;
            var field = document.getElementById('field').value;
            var fieldIndex = document.getElementById('fieldIndex').value;

            var subfield = document.getElementById('subfield').value;
            var subfieldIndex = document.getElementById('subfieldIndex').value;
            var mandatory = document.getElementById('mandatory').checked;
            var repeatable = document.getElementById('repeatable').checked;
            var required = document.getElementById('required').checked;
            var length = document.getElementById('length').value;
            var description = document.getElementById('description').value;
            alert(1);
            dataString =id+","+hl7version+","+segment+","+segmentIndex+","+field+","+fieldIndex+","+subfield+","+subfieldIndex+","+mandatory+","+repeatable+","+required+","+length+","+description+",";
            alert(dataString);
            $.ajax({
                url:'${request.contextPath}/template/test',
                dataType:'json',
                data:{pc:dataString},
                success:function(msg){
                    alert(321);
                },
                error:function(){
                    alert(123);
                }
            })
        }


    </script>
</head>
<body>
<div class="body">
    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${templateData}">
        <div class="errors">
            <g:renderErrors bean="${templateData}" as="list" />
        </div>
    </g:hasErrors>
    <g:form method="post" >
        <g:hiddenField name="id" id="id" value="${templateData?.id}" />
        <g:hiddenField name="version" value="${templateData?.version}" />
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="type"><g:message code="template.type.label" default="Type" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: templateData, field: 'type', 'errors')}">
                        <g:select name="type" from="${templateData.constraints.type.inList}" value="${templateData?.type}" valueMessagePrefix="template.type" disabled="true" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="hl7version"><g:message code="template.hl7version.label" default="Hl7version" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: templateData, field: 'hl7version', 'errors')}">
                        <g:select name="hl7version" from="${templateData.constraints.hl7version.inList}" value="${templateData?.hl7version}" valueMessagePrefix="template.hl7version" disabled="true" />
                    </td>
                </tr>

                %{--<tr class="prop">--}%
                %{--<td valign="top" class="name">--}%
                %{--<label for="segment"><g:message code="template.segment.label" default="Segment" /></label>--}%
                %{--</td>--}%
                %{--<td valign="top" class="value ${hasErrors(bean: templateData, field: 'segment', 'errors')}">--}%
                %{--<g:select name="segment" from="${templateData.constraints.segment.inList}" value="${templateData?.segment}" valueMessagePrefix="template.segment"  />--}%
                %{--</td>--}%
                %{--</tr>--}%

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="segment"><g:message code="template.segment.label" default="Segment" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: templateData, field: 'segment', 'errors')}">
                        <g:textField name="segment" value="${fieldValue(bean: templateData, field: 'segment')}" readonly="true" style="border: none"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="segmentIndex"><g:message code="template.segmentIndex.label" default="Segment Index" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: templateData, field: 'segmentIndex', 'errors')}">
                        <g:textField name="segmentIndex" value="${fieldValue(bean: templateData, field: 'segmentIndex')}" readonly="true" style="border: none"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="field"><g:message code="template.field.label" default="Field" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: templateData, field: 'field', 'errors')}">
                        <g:textField name="field" value="${fieldValue(bean: templateData, field: 'field')}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="fieldIndex"><g:message code="template.fieldIndex.label" default="FieldIndex" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: templateData, field: 'fieldIndex', 'errors')}">
                        <g:textField name="fieldIndex" value="${fieldValue(bean: templateData, field: 'fieldIndex')}" readonly="true" style="border: none"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="subfield"><g:message code="template.subfield.label" default="Subfield" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: templateData, field: 'subfield', 'errors')}">
                        <g:textField name="subfield" value="${templateData?.subfield}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="subfieldIndex"><g:message code="template.subfieldIndex.label" default="subfieldIndex" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: templateData, field: 'subfieldIndex', 'errors')}">
                        <g:textField name="subfieldIndex" value="${templateData?.subfieldIndex}" readonly="true" style="border: none"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="mandatory"><g:message code="template.mandatory.label" default="Mandatory" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: templateData, field: 'mandatory', 'errors')}">
                        <g:checkBox name="mandatory" value="${templateData?.mandatory}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="required"><g:message code="template.required.label" default="Required" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: templateData, field: 'required', 'errors')}">
                        <g:checkBox name="required" value="${templateData?.required}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="repeatable"><g:message code="template.repeatable.label" default="Repeatable" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: templateData, field: 'repeatable', 'errors')}">
                        <g:checkBox name="repeatable" value="${templateData?.repeatable}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="length"><g:message code="template.length.label" default="Length" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: templateData, field: 'length', 'errors')}">
                        <g:textField name="length" value="${fieldValue(bean: templateData, field: 'length')}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="description"><g:message code="template.description.label" default="Description" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: templateData, field: 'description', 'errors')}">
                        <g:textArea name="description" cols="40" rows="5" value="${templateData?.description}" />
                    </td>
                </tr>



                </tbody>
            </table>
        </div>
        <div class="buttons">
            <span class="button"><g:actionSubmit  class="save" action="updateTemplate" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
            <span class="button"><input type="button" onclick="update();"  value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
        </div>
    </g:form>
</div>
</body>
</html>
