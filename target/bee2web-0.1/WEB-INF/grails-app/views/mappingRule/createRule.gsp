

<%@ page import="com.bssi.MappingRule" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'mappingRule.label', default: 'MappingRule')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <script type="text/javascript">
        function selectTemplate(){
            var paramKQ = " ${request.contextPath}/mappingRule/selectTemplate";
            open(paramKQ,'title','resizable=no,scrollbars=yes');
        }

        function checkForm(){

            return true;

        }

        function setTempalteInfo(templateString){
            var temp1 = templateString.split(',');
            if(temp1.length>0){
                for(var i =0;i<temp1.length-1;i++){
                    var temp2=temp1[i].split(":");
                    setTemplateTable(temp2[3],temp2[4],temp2[5],temp2[6],temp2[7],temp2[8],temp2[9],temp2[10]);
                }
            }
        }

        var templateNum=0;
        function setTemplateTable(segment,segmentIndex,field,fieldIndex,subfield,subfieldIndex,required,repeatable){  //set sendInfo
            var objTable = document.getElementById("templateTalbe");
            objTable.insertRow(objTable.rows.length);
//                var inx = (document.all.providerTavle.rows.length)-1;
            templateNum++;
            objTable.rows.item(objTable.rows.length -1).id = "toBeDelRow"+templateNum;
            objTable.rows.item(objTable.rows.length -1).insertCell(0);
            objTable.rows[objTable.rows.length-1].cells[0].innerHTML="<TR><TD><div align=left>"+segment +"<input type=hidden name=segment"+templateNum +" id=segment"+templateNum +" value=\'"+segment+"\'><input type=hidden name=flagNum id=flagNum value=\'"+templateNum+"\'><div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "toBeDelRow"+templateNum;
            objTable.rows.item(objTable.rows.length -1).insertCell(1);
            objTable.rows[objTable.rows.length-1].cells[1].innerHTML="<TD><div align=left>"+segmentIndex +"<input type=hidden name=segmentIndex"+templateNum +" id=segmentIndex"+templateNum +" value= \'"+segmentIndex+"\'><div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "toBeDelRow"+templateNum;
            objTable.rows.item(objTable.rows.length -1).insertCell(2);
            objTable.rows[objTable.rows.length-1].cells[2].innerHTML="<TD><div align=left>"+field +"<input type=hidden value=\'"+field+"\' name=field"+templateNum +" id=field"+templateNum +"><div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "toBeDelRow"+templateNum;
            objTable.rows.item(objTable.rows.length -1).insertCell(3);
            objTable.rows[objTable.rows.length-1].cells[3].innerHTML="<TD><div align=left>"+ fieldIndex+"<input type=hidden name=fieldIndex"+templateNum +" id=fieldIndex"+templateNum +" value= \'"+fieldIndex+"\'></div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "toBeDelRow"+templateNum;
            objTable.rows.item(objTable.rows.length -1).insertCell(4);
            objTable.rows[objTable.rows.length-1].cells[4].innerHTML="<TD><div align=left>"+subfield +"<input type=hidden name=subfield"+templateNum +" id=subfield"+templateNum +" value= \'"+subfield+"\'></div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "toBeDelRow"+templateNum;
            objTable.rows.item(objTable.rows.length -1).insertCell(5);
            objTable.rows[objTable.rows.length-1].cells[5].innerHTML="<TD><div align=left>"+subfieldIndex +"<input type=hidden name=subfieldIndex"+templateNum +" id=subfieldIndex"+templateNum +" value= \'"+subfieldIndex+"\'></div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "toBeDelRow"+templateNum;
            objTable.rows.item(objTable.rows.length -1).insertCell(6);
            objTable.rows[objTable.rows.length-1].cells[6].innerHTML="<TD><div align=left>"+required +"<input type=hidden name=required"+templateNum +" id=required"+templateNum +" value= \'"+required+"\'></div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "toBeDelRow"+templateNum;
            objTable.rows.item(objTable.rows.length -1).insertCell(7);
            objTable.rows[objTable.rows.length-1].cells[7].innerHTML="<TD><div align=left>"+repeatable +"<input type=hidden name=repeatable"+templateNum +" id=repeatable"+templateNum +" value= \'"+repeatable+"\'></div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "toBeDelRow"+templateNum;
            objTable.rows.item(objTable.rows.length -1).insertCell(8);
            objTable.rows[objTable.rows.length-1].cells[8].innerHTML="<TD><div align=left><select id=operator"+templateNum +" name=operator"+templateNum +" onchange=setRule("+templateNum+");><option value=>-Operator-</option><option value=SET>SET</option><option value=MOVE>MOVE</option><option value=DELETE>DELETE</option><option value=COPY>COPY</option></select></div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "toBeDelRow"+templateNum;
            objTable.rows.item(objTable.rows.length -1).insertCell(9);
            objTable.rows[objTable.rows.length-1].cells[9].innerHTML="<TD><div align=left   id=segementOperatorDiv"+templateNum+"><select style=display:none; id=toSegment"+templateNum +" name=toSegment"+templateNum +"><option value=>-Segment-</option><option value=MSH>MSH</option><option value=PID>PID</option><option value=SFT>SFT</option><option value=OBR>OBR</option></select></div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "toBeDelRow"+templateNum;
            objTable.rows.item(objTable.rows.length -1).insertCell(10);
            objTable.rows[objTable.rows.length-1].cells[10].innerHTML="<TD><div align=left   id=toSegmentIndexDiv"+templateNum+"><input style=display:none; type=text size=3  name=toSegmentIndex"+templateNum +" id=toSegmentIndex"+templateNum +" value='0' ></div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "toBeDelRow"+templateNum;
            objTable.rows.item(objTable.rows.length -1).insertCell(11);
            objTable.rows[objTable.rows.length-1].cells[11].innerHTML="<TD><div align=left   id=toIndexDiv"+templateNum+"><input style=display:none; type=text size=3  name=toIndex"+templateNum +" id=toIndex"+templateNum +" value='0' ></div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "toBeDelRow"+templateNum;
            objTable.rows.item(objTable.rows.length -1).insertCell(12);
            objTable.rows[objTable.rows.length-1].cells[12].innerHTML="<TD><div align=left   id=toSubindexDiv"+templateNum+"><input style=display:none; type=text size=3  name=toSubindex"+templateNum +" id=toSubindex"+templateNum +" value='0' ></div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "toBeDelRow"+templateNum;
            objTable.rows.item(objTable.rows.length -1).insertCell(13);
            objTable.rows[objTable.rows.length-1].cells[13].innerHTML="<TD><div align=left ><input style=display:none; type=text  name=value"+templateNum +" id=value"+templateNum +" value='' ></div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "toBeDelRow"+templateNum;
            objTable.rows.item(objTable.rows.length -1).insertCell(14);
            objTable.rows[objTable.rows.length-1].cells[14].innerHTML="<TD><div align=left><a href=javascript:deleteTemplateInfo("+templateNum+");>${message(code: 'd.del.label', default: 'Delete')}</a></div></TD></TR>";

            document.getElementById("templateNum").value=templateNum;
        }

        function deleteTemplateInfo(rowIdx){
            if(!confirm("Are you sure?")){
                return;
            }
            var objTable = document.getElementById("templateTalbe");
            var objRow = document.getElementById("toBeDelRow"+rowIdx);
            objTable.deleteRow(objRow.rowIndex);
            templateNum--;
            document.getElementById("templateNum").value =templateNum;
        }

        var setState = ""
        function setRule(templateNum){
            var segment = document.getElementById("segment"+templateNum);
            var field = document.getElementById("field"+templateNum);
            var subfield = document.getElementById("subfield"+templateNum);
            var operator = document.getElementById("operator"+templateNum);
            var required = document.getElementById("required"+templateNum);
            var toSegment = document.getElementById("toSegment"+templateNum);
            var toSegmentIndex = document.getElementById("toSegmentIndex"+templateNum);
            var toIndex = document.getElementById("toIndex"+templateNum);
            var toSubindex =  document.getElementById("toSubindex"+templateNum);
            var value = document.getElementById("value"+templateNum)

            if(segment.value==field.value){
                setState = "segment";
                toSegmentIndex.style.display="";
            } else if(field.value==subfield.value){
                setState = "subfield";
                toIndex.style.display=""
                toSubindex.style.display="";
            } else {
                setState="field";
                toIndex.style.display="";
            }
            if(operator.options[3].selected==true&&required.value=="true"){

                alert('The Field or Segment is required can not be deleted');
                toSegmentIndex.value=0;
                toSegmentIndex.style.display="none";
                toIndex.value=0;
                toIndex.style.display="none";
                toSubindex.value=0;
                toSubindex.style.display="none";
                operator.options[0].selected=true;
                toSegment.options[0].selected=true;
                toSegment.style.display="none";
                value.style.display="none";
            } else if(operator.options[3].selected==true&&required.value=="false"){
                toSegmentIndex.value=0;
                toSegmentIndex.style.display="none";
                toIndex.value=0;
                toIndex.style.display="none";
                toSubindex.value=0;
                toSubindex.style.display="none";
                toSegment.options[0].selected=true;
                toSegment.style.display="none";
                value.style.display="none";
            }else if(operator.options[0].selected==true){
                toSegmentIndex.value=0;
                toSegmentIndex.style.display="none";
                toIndex.value=0;
                toIndex.style.display="none";
                toSubindex.value=0;
                toSubindex.style.display="none";
                toSegment.options[0].selected=true;
                toSegment.style.display="none";
                value.style.display="none";

            }  else if(operator.options[1].selected==true){
                value.style.display="";
                toSegmentIndex.value=0;
                toSegmentIndex.style.display="none";
                toIndex.value=0;
                toIndex.style.display="none";
                toSubindex.value=0;
                toSubindex.style.display="none";
                toSegment.options[0].selected=true;
                toSegment.style.display="none";
            }  else {
                toSegment.style.display="";
            }

        }

        var checkNumber = /^[0-9]{1,20}$/;
        function checkNum(templateNum){
            var toSegmentIndex =  document.getElementById("toSegmentIndex"+templateNum);
            var toIndex =  document.getElementById("toIndex"+templateNum);
            var toSubindex =  document.getElementById("toSubindex"+templateNum);
            if(setState=="segment"&&!checkNumber.exec(toSegmentIndex.value)){
                alert("The Index must be a number!");
                toSegmentIndex.style.borderColor="red";
                toSegmentIndex.focus();
            }
            if(setState == "field"&&!checkNumber.exec(toIndex.value)){
                alert("The Index must be a number!");
                toIndex.style.borderColor="red";
                toIndex.focus();
            }
            if(setState == "subfield"&&!checkNumber.exec(toSubindex.value)){
                alert("The Index must be a number!");
                toSubindex.style.borderColor="red";
                toSubindex.focus();
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
    <g:hasErrors bean="${mappingRuleData}">
        <div class="errors">
            <g:renderErrors bean="${mappingRuleData}" as="list" />
        </div>
    </g:hasErrors>
    <div class="nav">
        <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
    </div>
    <g:form action="save" >
        <g:hiddenField name="templateNum" id="templateNum" value="0"></g:hiddenField>
        <table>
            <tbody>
            <tr>
                <td>
                    <g:select name="fromApplication" noSelection="${['':'-From Application-']}"></g:select>
                </td>
                <td>
                    <g:select name="toApplication" noSelection="${['':'-To Application-']}"></g:select>
                </td>
                <td>
                    <g:select name="messsageType" noSelection="${['':'-Messsage Type-']}"></g:select>
                </td>
                <td>
                    <g:select name="hl7messageVersion" noSelection="${['':'-HL7Message version-']}"></g:select>
                </td>
                <td>
                    <input type="button" value="Import Template" onclick="selectTemplate();">
                </td>
            </tr>
            </tbody>
        </table>
        <table id="templateTalbe">
            <thead>
            <tr>
                <td><b/>${message(code: 'mappingRule.fromSegment.label', default: 'From Segment')}</td>
                <td><b/>${message(code: 'mappingRule.fromIndex.label', default: 'From Index')}</td>
                <td><b/>${message(code: 'mappingRule.field.label', default: 'Field')}</td>
                <td><b/>${message(code: 'mappingRule.fromIndex.label', default: 'From Index')}</td>
                <td><b/>${message(code: 'mappingRule.subfield.label', default: 'Subfield')}</td>
                <td><b/>${message(code: 'mappingRule.fromSubIndex.label', default: 'From Sub Index')}</td>
                <td><b/>${message(code: 'mappingRule.required.label', default: 'Required')}</td>
                <td><b/>${message(code: 'mappingRule.reapetable.label', default: 'Reapetable')}</td>
                <td><b/>${message(code: 'mappingRule.operator.label', default: 'Operator')}</td>
                <td><b/>${message(code: 'mappingRule.toSegment.label', default: 'To Segment')}</td>
                <td><b/>${message(code: 'mappingRule.toSegmentIndex.label', default: 'To Segment Index')}</td>
                <td><b/>${message(code: 'mappingRule.toIndex.label', default: 'To Index')}</td>
                <td><b/>${message(code: 'mappingRule.toSubIndex.label', default: 'To Sub Index')}</td>
                <td><b/>${message(code: 'mappingRule.value.label', default: 'Value')}</td>
                <td><b/>${message(code: 'mappingRule.delete.label', default: 'Delete')}</td>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <div>
            <table>
                <tr class="prop">
                    <td valign="top" class="name">
                        <b/><label for="mappingRuleGroup"><g:message code="mappingRule.mappingRuleGroup.label" default="Mapping Rule Group" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: mappingRuleData, field: 'mappingRuleGroup', 'errors')}">
                        <g:select name="mappingRuleGroup.id" from="${com.bssi.MappingRuleGroup.list()}" optionKey="id" value="${mappingRuleData?.mappingRuleGroup?.id}"  />
                    </td>
                </tr>
            </table>
        </div>
        <div class="buttons">
            <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
    </g:form>
</div>
</body>
</html>
