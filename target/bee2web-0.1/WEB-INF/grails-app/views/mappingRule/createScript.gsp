

<%@ page import="com.bssi.Template" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="" />
    <g:set var="entityName" value="${message(code: 'template.label', default: 'Template')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery-1.6.2.min.js')}"></script>
    <script type='text/javascript'>
        function saveTemplate(){
            var hl7message=document.getElementById('hl7message').value;
            alert(hl7message);
            if(hl7message==null||hl7message==''){
                alert('HL7Message can not be blank!');
                return false;
            }   else{
                $.ajax({
                    url:"${request.contextPath}/mappingRule/createTempalte" ,
                    data:{hl7message:hl7message},
                    success: function(text){
                        $.messager.alert('Information',text,'info');
                        top.close();
                    }
                })
            }
        }
    </script>
</head>
<body>
<div class="body">
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${templateData}">
        <div class="errors">
            <g:renderErrors bean="${templateData}" as="list" />
        </div>
    </g:hasErrors>
    <div class="nav">
    </div>
    <g:form action="createTemplate" >
        <table class="table">
            <tr class="prop">
                <td valign="top" class="name">
                    <b/> <label for="hl7version"><g:message code="template.hl7version.label" default="Hl7 Version" /></label>
                </td>
            </tr>

            <tr class="prop">
                <td  colspan="4" valign="top"><g:textArea style="width: 800px" name="hl7message" rows="400" cols="400"></g:textArea></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

        </table>
        <div class="buttons">
            <span class="button"><g:submitButton name="create" onclick="return saveTemplate();" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
        </div>
    </g:form>
</div>
</body>
</html>
