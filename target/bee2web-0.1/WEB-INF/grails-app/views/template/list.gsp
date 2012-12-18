
<%@ page import="com.bssi.Template" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'template.label', default: 'Template')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
        <script type="text/javascript">

            function showEditDiv(no,templateId){
                document.getElementById('tr'+no).style.backgroundColor="aquamarine";
//                document.getElementById('templateEditDiv').style.display="";
                document.getElementById('aok'+no).style.display="";
                document.getElementById('edit'+no).style.display="none";

//                var id = templateId
//                var type = document.getElementById('type');
//                var hl7version = document.getElementById('hl7version');
//                var segment = document.getElementById('segment');
//                var segmentIndex = document.getElementById('segmentIndex');
//                var field = document.getElementById('field');
//                var fieldIndex = document.getElementById('fieldIndex');
//
//                var subfield = document.getElementById('subfield');
//                var subfieldIndex = document.getElementById('subfieldIndex');
//                var mandatory = document.getElementById('mandatory');
//                var repeatable = document.getElementById('repeatable');
//                var required = document.getElementById('required');
//                var length = document.getElementById('length');
//
//
                var type = document.getElementById('type'+no);
                var hl7version = document.getElementById('hl7version'+no);
                var segment = document.getElementById('segment'+no);
                var segmentIndex = document.getElementById('segmentIndex'+no);
                var field = document.getElementById('field'+no);
                var fieldIndex = document.getElementById('fieldIndex'+no);
                var subfield = document.getElementById('subfield'+no);
                var subfieldIndex = document.getElementById('subfieldIndex'+no);
                var mandatory = document.getElementById('mandatory'+no);
                var repeatable = document.getElementById('repeatable'+no);
                var required = document.getElementById('required'+no);
                var length = document.getElementById('length'+no);

                field.readOnly = false;
                subfield.readOnly = false;
                mandatory.disabled=false;
                repeatable.disabled=false;
                required.disabled=false;
                length.readOnly =false;
            }
            function updateTemplate(no,templateId){
                var checknum=/^[0-9]{1,20}$/;
                var id = templateId
                var type = document.getElementById('type'+no);
                var hl7version = document.getElementById('hl7version'+no);
                var segment = document.getElementById('segment'+no);
                var segmentIndex = document.getElementById('segmentIndex'+no);
                var field = document.getElementById('field'+no);
                var fieldIndex = document.getElementById('fieldIndex'+no);
                var subfield = document.getElementById('subfield'+no);
                var subfieldIndex = document.getElementById('subfieldIndex'+no);
                var mandatory = document.getElementById('mandatory'+no);
                var repeatable = document.getElementById('repeatable'+no);
                var required = document.getElementById('required'+no);
                var length = document.getElementById('length'+no);


                var dataString = id+","+hl7version.value+","+segment.value+","+segmentIndex.value+","+field.value+","
                        +fieldIndex.value+","+subfield.value+","+subfieldIndex.value+","+mandatory.checked+","+repeatable.checked+","+required.checked+","+length.value+",";
                $.ajax({
                    url:'${request.contextPath}/template/updateData',
                    dataType:'json',
                    data:{pc:dataString},
                    success:function(msg){
                        field.readOnly = true;
                        subfield.readOnly = true;
                        mandatory.disabled=true;
                        repeatable.disabled=true;
                        required.disabled=true;
                        length.readOnly =true;

                        field.value = msg.field;
                        subfield.value = msg.subfield;
                        mandatory.value = msg.mandatory;
                        repeatable.value = msg.repeatable;
                        required.value = msg.required;
                        length.value =msg.length;
                        document.getElementById('aok'+no).style.display="none";
                        document.getElementById('edit'+no).style.display="";
                        document.getElementById('tr'+no).style.backgroundColor=""
                    },
                    error:function(){
                        alert("The length is wrong!");
                    }
                })
            }

            function checkNum(){
                var segmentIndex = document.getElementById('segmentIndex');
                var fieldIndex = document.getElementById('fieldIndex');
                var subfieldIndex = document.getElementById('subfieldIndex');
                var checknum=/^[0-9]{1,20}$/;

                if(segmentIndex.value!=""&&segmentIndex.value!=null&&!checknum.exec(segmentIndex.value)){
                    alert('Segmeng Index Must Be a Number!');
                    segmentIndex.style.borderColor='red';
                    segmentIndex.focus();
                    return false;
                }

                if(fieldIndex.value!=""&&fieldIndex.value!=null&&!checknum.exec(fieldIndex.value)){
                    alert('Field Index  Must Be a Number!');
                    fieldIndex.style.borderColor='red';
                    fieldIndex.focus();
                    return false;
                }

                if(subfieldIndex.value!=""&&subfieldIndex.value!=null&&!checknum.exec(subfieldIndex.value)){
                    alert('Subfield Index Must Be a Number!');
                    subfieldIndex.style.borderColor='red';
                    subfieldIndex.focus();
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>        
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
			<div class="nav">            
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            </div>
            <div>
                <g:form method="post" >
                    <div class="dialog">
                        <table style="border:0">
                            <tbody>

                            <tr class="prop">
                                <td>
                                    <b/><label for="type"><g:message code="template.type.label" default="Type" /></label>
                                </td>
                                <td>
                                    <g:select name="type" from="${Template.constraints.type.inList}" noSelection="${['':'-Choose Type-']}" value="${params?.type}" valueMessagePrefix="template.type"  />
                                </td>
                                <td>
                                    <b/><label for="hl7version"><g:message code="template.hl7version.label" default="Hl7version" /></label>
                                </td>
                                <td>
                                    <g:select name="hl7version" from="${Template.constraints.hl7version.inList}"  noSelection="${['':'-Choose Version-']}" value="${params?.hl7version}" valueMessagePrefix="template.hl7version"  />
                                </td>

                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>


                            <tr class="prop">
                                <td>
                                    <b/><label for="segment"><g:message code="template.segment.label" default="Segment" /></label>
                                </td>
                                <td>
                                    <g:textField name="segment" value="${params?.segment}" />
                                </td>
                                <td>
                                    <b/><label for="segmentIndex"><g:message code="template.segmentIndex.label" default="Segment Index" /></label>
                                </td>
                                <td>
                                    <g:textField name="segmentIndex" value="${params?.segmentIndex}" />
                                </td>
                                <td>
                                    <b/><label for="field"><g:message code="template.field.label" default="Field" /></label>
                                </td>
                                <td>
                                    <g:textField name="field" value="${params?.field}" />
                                </td>

                            </tr>


                            <tr class="prop">
                                <td>
                                    <b/><label for="fieldIndex"><g:message code="template.fieldIndex.label" default="FieldIndex" /></label>
                                </td>
                                <td>
                                    <g:textField name="fieldIndex" value="${params.fieldIndex}"/>
                                </td>
                                <td>
                                    <b/><label for="subfield"><g:message code="template.subfield.label" default="Subfield" /></label>
                                </td>
                                <td>
                                    <g:textField name="subfield" value="${params?.subfield}" />
                                </td>
                                <td>
                                    <b/><label for="subfieldIndex"><g:message code="template.subfieldIndex.label" default="subfieldIndex" /></label>
                                </td>
                                <td>
                                    <g:textField name="subfieldIndex" value="${params?.subfieldIndex}" />
                                </td>
                            </tr>



                            <tr class="prop">
                                <td>
                                    <b/><label for="mandatory"><g:message code="template.mandatory.label" default="Mandatory" /></label>
                                </td>
                                <td>
                                    <g:select optionValue="mandatoryView" optionKey="mandatory" from="${[[mandatoryView:'True',mandatory:true],[mandatoryView:'False',mandatory: false]]}" noSelection="['':'-Choose Mandatory-']" name="mandatory" value="${params?.mandatory}"></g:select>
                                </td>
                                <td>
                                    <b/><label for="required"><g:message code="template.required.label" default="Required" /></label>
                                </td>
                                <td>
                                    <g:select optionValue="requiredView" optionKey="required" from="${[[requiredView:'True',required:true],[requiredView:'False',required: false]]}" noSelection="['':'-Choose Required-']" name="required" value="${params?.required}"></g:select>
                                </td>
                                <td>
                                    <b/><label for="repeatable"><g:message code="template.repeatable.label" default="Repeatable" /></label>
                                </td>
                                <td>
                                    <g:select optionValue="repeatableView" optionKey="repeatable" from="${[[repeatableView:'True',repeatable:true],[repeatableView:'False',repeatable: false]]}" noSelection="['':'-Choose Repeatable-']" name="repeatable" value="${params?.repeatable}"></g:select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="buttons" style="width:90px">
                                        <span class="button"><g:actionSubmit class="save" action="search" onclick="return checkNum();" value="${message(code: 'default.button.search.label', default: 'Search')}" /></span>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                </g:form>
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'template.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="type" title="${message(code: 'template.type.label', default: 'Type')}" />
                        
                            <g:sortableColumn property="hl7version" title="${message(code: 'template.hl7version.label', default: 'Hl7version')}" />
                        
                            <g:sortableColumn property="segment" title="${message(code: 'template.segment.label', default: 'Segment')}" />

                            <g:sortableColumn property="segmentIndex" title="${message(code: 'template.segmentIndex.label', default: 'Segment Index')}" />

                            <g:sortableColumn property="field" title="${message(code: 'template.field.label', default: 'Field')}" />

                            <g:sortableColumn property="fieldIndex" title="${message(code: 'template.fieldIndex.label', default: 'Field Index')}" />

                            <g:sortableColumn property="subfield" title="${message(code: 'template.subfield.label', default: 'Subfield')}" />

                            <g:sortableColumn property="subfieldIndex" title="${message(code: 'template.subfieldIndex.label', default: 'Subfield Index')}" />

                            <g:sortableColumn property="required" title="${message(code: 'template.required.label', default: 'Required')}" />

                            <g:sortableColumn property="mandatory" title="${message(code: 'template.mandatory.label', default: 'Mandatory')}" />

                            <g:sortableColumn property="repeatable" title="${message(code: 'template.repeatable.label', default: 'Repeatable')}" />

                            <g:sortableColumn property="length" title="${message(code: 'template.length.label', default: 'Length')}" />


                            <td><b>Edit</b></td>
                        

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${templateDataList}" status="i" var="templateData">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}" id="tr${i}">
                        
                            <td><g:link action="show" id="${templateData.id}">${fieldValue(bean: templateData, field: "id")}</g:link></td>
                        
                            <td><g:textField  name="type${i}" value="${templateData?.type}" style="border: none" size="3" readonly="true"></g:textField></td>
                        
                            <td><g:textField  name="hl7version${i}" value="${templateData?.hl7version}" style="border: none" size="3" readonly="true"></g:textField></td>
                        
                            <td><g:textField  name="segment${i}" value="${templateData?.segment}" style="border: none" size="3" readonly="true"></g:textField></td>

                            <td><g:textField  name="segmentIndex${i}" value="${templateData?.segmentIndex}" style="border: none" size="3" readonly="true"></g:textField></td>
                        
                            <td style="width: 26px"><g:textField  name="field${i}" value="${templateData?.field}" style="border: none" size="25" readonly="true"></g:textField></td>

                            <td><g:textField  name="fieldIndex${i}" value="${templateData?.fieldIndex}" style="border: none" size="3" readonly="true"></g:textField></td>

                            <td  style="width: 26px"><g:textField  name="subfield${i}" value="${templateData?.subfield}" style="border: none" size="25" readonly="true"></g:textField></td>

                            <td><g:textField  name="subfieldIndex${i}" value="${templateData?.subfieldIndex}" style="border: none" size="3" readonly="true"></g:textField></td>
                        
                            <td><g:checkBox name="required${i}" value="${templateData.required}" disabled="true"></g:checkBox></td>

                            <td><g:checkBox name="mandatory${i}" value="${templateData.mandatory}" disabled="true"></g:checkBox></td>

                            <td><g:checkBox name="repeatable${i}" value="${templateData.repeatable}" disabled="true"></g:checkBox></td>

                            <td><g:textField  name="length${i}" value="${templateData?.length}" style="border: none" size="3" readonly="true"></g:textField></td>


                            <td><a id="edit${i}"  href="javascript:showEditDiv(<%=i%>,${templateData.id});">Edit</a><a id="aok${i}" style="display: none" href="javascript:updateTemplate(<%=i%>,${templateData.id});">OK</a></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>

            </div>
            <div class="paginateButtons">
                <g:paginate action="search" params="[type:params.type,hl7version:params.hl7version,segment:params.segment,segmentIndex:params.segmentIndex,field:params.field,fieldIndex:params.fieldIndex,subfield:params.subfield,subfieldIndex:params.subfieldInxe,mandatory:params.mandatory,repeatable:params.repeatable,required:params.required]" total="${templateDataTotal}" />
            </div>
			<div class="nav">
              <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            </div>
        </div>
    </body>
</html>
