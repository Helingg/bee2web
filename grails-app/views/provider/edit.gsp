

<%@ page import="com.bssi.Provider" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName" value="${message(code: 'provider.label', default: 'Provider')}" />
<link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>

<script type="text/javascript">
    function checkForm(){
        var checkSSN = /^(\d\d\d)\-(\d\d)\-(\d\d\d\d)$/;
        var clientProvider = document.getElementsByName('clientProvider');
        var state = document.getElementsByName('state');
        var MLN = document.getElementsByName('MLN');
        if(document.getElementById("firstName").value==""){
            alert("First Name can not be blank");
            document.getElementById("firstName").style.borderColor='red';
            document.getElementById("firstName").focus();
            return false;
        }
        if(document.getElementById("lastName").value==""){
            alert("Last Name can not be blank");
            document.getElementById("lastName").style.borderColor='red';
            document.getElementById("lastName").focus();
            return false;
        }
//        if(document.getElementById("NPI").value==""){
//            alert("NPI can not be blank");
//            document.getElementById("NPI").style.borderColor='red';
//            document.getElementById("NPI").focus();
//            return false;
//        }
        if(document.getElementById("SSN").value&&!checkSSN.exec(document.getElementById("SSN").value)){
            alert("SSN format error");
            document.getElementById("SSN").style.borderColor='red';
            document.getElementById("SSN").focus();
            return false;
        }

        if(state.length>0){
            for(var i=0;i<state.length;i++){
                if(!MLN[i].value){
                    MLN[i].focus();
                    MLN[i].style.borderColor="red";
                    alert("Medical Licence Number is null");
                    return false;
                }
            }

        }
        if(clientProvider.length>0){
            for(var i=0;i<clientProvider.length;i++){
                if(clientProvider[i].value==""||clientProvider[i].value==null) {
                    alert("Client Provider Id can not be blank!");
                    clientProvider[i].style.borderColor='red';
                    clientProvider[i].focus();
                    return false;
                }
            }
        }
        return true;
    }
    var stateInner ="";
    function initState() {
        var stateList = ['AL','AK','AR', 'AZ', 'CA', 'CO', 'CT' ,'DE' ,'FL', 'GA', 'HI', 'LA' ,'ID', 'IL' ,'IN', 'KS', 'KY', 'LA', 'MA', 'ME' ,'MD', 'MI', 'MN' ,'MO', 'MS', 'MT',
            'NE', 'NC','ND', 'NH', 'NJ', 'NM', 'NV', 'NY', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX','UT', 'VT', 'VA', 'WA', 'DC', 'WV','WI','WY'];
        for (var i=0;i<stateList.length;i++){
            stateInner = stateInner+ " <option value="+stateList[i]+">"+stateList[i]+"</option> "
        }
    }
    var stateMLN = ${stateMLNDataTotal};
    var stateMLNDel = ${stateMLNDataTotal};
    function selectStateMLN(){
        initState();
        var objTable = document.getElementById("MLNTable");
        objTable.insertRow(objTable.rows.length);
//                var inx = (document.all.providerTavle.rows.length)-1;
        stateMLN++;
        stateMLNDel++;
        objTable.rows.item(objTable.rows.length -1).id = "toBeDelRow"+stateMLNDel;
        objTable.rows.item(objTable.rows.length -1).insertCell(0);
        objTable.rows[objTable.rows.length-1].cells[0].innerHTML="<TR><TD><div align=left><select name='state' id='state' >"+stateInner+"</select><div></TD>";

        objTable.rows.item(objTable.rows.length -1).id = "toBeDelRow"+stateMLNDel;
        objTable.rows.item(objTable.rows.length -1).insertCell(1);
        objTable.rows[objTable.rows.length-1].cells[1].innerHTML="<TD><div align=left>"+<g:select name="mlnProviderType" from="${com.bssi.ProviderType.list()}"></g:select>+"<div></TD>";

        objTable.rows.item(objTable.rows.length -1).id = "toBeDelRow"+stateMLNDel;
        objTable.rows.item(objTable.rows.length -1).insertCell(2);
        objTable.rows[objTable.rows.length-1].cells[2].innerHTML="<TD><div align=left><input type=text name=MLN size=12 value=''><input type=hidden name=stateMLNDataId value=''> <div></TD>";

        objTable.rows.item(objTable.rows.length -1).id = "toBeDelRow"+stateMLNDel;
        objTable.rows.item(objTable.rows.length -1).insertCell(3);
        objTable.rows[objTable.rows.length-1].cells[3].innerHTML="<TD><div align=left><a href=javascript:deleteMLN("+stateMLNDel+");>${message(code: 'd.del.label', default: 'delete')}</a></div></TD></TR>";

        document.getElementById("MLNNum").value=stateMLN;
        document.getElementById("MLNDiv").style.display="";
    }

    function deleteMLN(rowIdx){
        if(!confirm("Are you sure?")){
            return;
        }
        var objTable = document.getElementById("MLNTable");
        var objRow = document.getElementById("toBeDelRow"+rowIdx);
        objTable.deleteRow(objRow.rowIndex);
        stateMLN--;
        if(stateMLN==0){
            document.getElementById("MLNDiv").style.display="none";
        }
        document.getElementById("MLNNum").value =stateMLN;
    }

    function selectClient(){
        var paramKQ = " ${request.contextPath}/provider/selectClient";
        open(paramKQ,'title','resizable=no,width=800,height=600,scrollbars=yes');
    }

    var clientNum=${clientDataTotal};
    var clientNumDel=${clientDataTotal};
    function setClientTable(name,alias,activeInd,client){  //set client
        var objTable = document.getElementById("clientTable");
        objTable.insertRow(objTable.rows.length);
//                var inx = (document.all.providerTavle.rows.length)-1;
        clientNum++;
        clientNumDel++;
        objTable.rows.item(objTable.rows.length -1).id = "toBeDelRow"+clientNumDel;
        objTable.rows.item(objTable.rows.length -1).insertCell(0);
        objTable.rows[objTable.rows.length-1].cells[0].innerHTML="<TR><TD><div align=left>"+name+"<input type=hidden name=name size=12 value="+name+"> <input type=hidden name=client size=12 value="+client+" ><div></TD>";

        objTable.rows.item(objTable.rows.length -1).id = "toBeDelRow"+clientNumDel;
        objTable.rows.item(objTable.rows.length -1).insertCell(1);
        objTable.rows[objTable.rows.length-1].cells[1].innerHTML="<TD><div align=left><input type=text name=clientProvider size=12 value=''><div></TD>";

        objTable.rows.item(objTable.rows.length -1).id = "toBeDelRow"+clientNumDel;
        objTable.rows.item(objTable.rows.length -1).insertCell(2);
        objTable.rows[objTable.rows.length-1].cells[2].innerHTML="<TD><div align=left><select name=cstatus><option value=status1>Status1</option>" +
                "<option value=status2>Status2</option></select><div></TD>";

        objTable.rows.item(objTable.rows.length -1).id = "toBeDelRow"+clientNumDel;
        objTable.rows.item(objTable.rows.length -1).insertCell(3);
        objTable.rows[objTable.rows.length-1].cells[3].innerHTML="<TD><div align=left><input type=checkbox onclick=activIndChange("+clientNumDel+") name =cactiveIndShow id=cactiveIndShow"+clientNumDel+" checked=true><input type=hidden name=cactiveInd value='true' id=cactiveInd"+clientNumDel+"><div></TD>";

        objTable.rows.item(objTable.rows.length -1).id = "toBeDelRow"+clientNumDel;
        objTable.rows.item(objTable.rows.length -1).insertCell(4);
        objTable.rows[objTable.rows.length-1].cells[4].innerHTML="<TD><div align=left><a href=javascript:deleteClient("+clientNumDel+");>${message(code: 'd.del.label', default: 'delete')}</a></div></TD></TR>";

        document.getElementById("clientNum").value=clientNum;
    }
    function activIndChange(num){
        var activeIndShow = document.getElementById("cactiveIndShow"+num);
        var active = document.getElementById("cactiveInd"+num);
        if(activeIndShow.checked){
            active.value="true";
        } else{
            active.value="false";
        }
    }
    function deleteClient(rowIdx){
        if(!confirm("Are you sure?")){
            return;
        }
        var objTable = document.getElementById("clientTable");
        var objRow = document.getElementById("toBeDelRow"+rowIdx);
        objTable.deleteRow(objRow.rowIndex);
        clientNum--;
        if(clientNum==0){
            document.getElementById("clientDiv").style.display="none";
        }
        document.getElementById("clientNum").value =clientNum;
    }

    function setClientInfo(clientStr){
        document.getElementById("clientDiv").style.display="";
        var clientExist = document.getElementsByName('client');
        var flag = true;
        if(clientStr){
            var temp1 = clientStr.split(",");
            if(temp1.length>0){
                for(var i=0;i<temp1.length-1;i++){
                    var temp2 = temp1[i].split(":");
                    if(clientExist.length>0){
                        for(var j=0;j<clientExist.length;j++){
                            if(clientExist[j].value==temp2[3]){
                                flag=false;
                                break;
                            }
                        }
                    }
                    if(flag){
                        if(temp2.length>0){
                            setClientTable(temp2[0],temp2[1],temp2[2],temp2[3]);
                        }
                    }else{
                        flag=true;
                        continue;
                    }

                }
            }
        }
    }

    function existdeleteClientRow(rowIdx,delClient) {
        var provider = document.getElementById("id");
        if(confirm("Are you sure?")){
            $.ajax({
                url:"${request.contextPath}/provider/deleteClient",
                data:{client:delClient,provider:provider.value},
                success:function(msg){
                    var objTable = document.getElementById("clientTable");
                    var objRow = document.getElementById("toBeDelRow"+rowIdx);
                    objTable.deleteRow(objRow.rowIndex);
                    clientNum--;
                    if(clientNum==0){
                        document.getElementById("clientDiv").style.display="none";
                    }
                    document.getElementById("clientNum").value =clientNum;
                    if(msg){
                        alert(msg);
                    }

                }
            });
        }
    }

    function existdeleteMLNRow(rowIdx,delMLN){
        if(confirm("Are you sure?")){
            var objTable = document.getElementById("MLNTable");
            var objRow = document.getElementById("toBeDelRow"+rowIdx);
            var delMLNid = document.getElementById("delMLN");
            delMLNid.value =delMLNid.value + delMLN +",";
            objTable.deleteRow(objRow.rowIndex);
            stateMLN--;
            if(stateMLN==0){
                document.getElementById("MLNDiv").style.display="none";
            }
            document.getElementById("MLNNum").value =stateMLN;
        }
    }


</script>
</head>
<body>

<h1><g:message code="default.create.label" args="[entityName]" /></h1>
<hr>
%{--<g:if test="${flash.message}">--}%
%{--<div class="message span10 offset9" style="color: red">${flash.message}</div>--}%
%{--</g:if>--}%
%{--<g:hasErrors bean="${providerData}">--}%
%{--<div class="errors">--}%
%{--<g:renderErrors bean="${providerData}" as="list" />--}%
%{--</div>--}%
%{--</g:hasErrors>--}%

<div class="container-fluid span10">
    <div class="span12 divbk">
        <g:link  action="list"><i class="icon-list"></i><g:message code="default.list.label" args="[entityName]" /></g:link>
        <g:link  action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link>
    </div>
    <g:if test="${flash.message}">
        <div class="message span12" style="color: red">${flash.message}</div>
    </g:if>
<div class="span12" >
    <g:form action="save"  class="form-horizontal">
        <g:hiddenField name="clientNum" value = "${clientDataTotal}"></g:hiddenField>
        <g:hiddenField name="MLNNum" value = "${stateMLNDataTotal}"></g:hiddenField>
        <g:hiddenField name="id" value="${providerData?.id}" />
        <g:hiddenField name="version" value="${providerData?.version}" />
        <g:hiddenField name="delMLN" value="" />
        <div class="well">
            <div class="control-group">
                <label  class="control-label" for="lastName"><g:message code="provider.lastName.label" default="Last Name" /></label>
                <div class="controls">
                    <g:textField name="lastName" value="${providerData?.lastName}" /><span class="help-inline">Required</span>
                </div>
            </div>

            <div class="control-group">
                <label  class="control-label" for="firstName"><g:message code="provider.firstName.label" default="First Name" /></label>
                <div class="controls">
                    <g:textField name="firstName" value="${providerData?.firstName}" /><span class="help-inline">Required</span>
                </div>
            </div>


            <div class="control-group">
                <label  class="control-label" for="middleName"><g:message code="provider.middleName.label" default="Middle Name" /></label>
                <div class="controls">
                    <g:textField name="middleName" value="${providerData?.middleName}" />
                </div>
            </div>

            <div class="control-group">
                <label  class="control-label" for="providerType"><g:message code="provider.providerType.label" default="Provider Type" /></label>
                <div class="controls">
                    <g:select name="providerType" from="${com.bssi.ProviderType.list()}"></g:select>
                </div>
            </div>

            <div class="control-group">
                <label  class="control-label" for="NPI"><g:message code="provider.NPI.label" default="NPI" /></label>
                <div class="controls">
                    <g:textField name="NPI" value="${providerData?.NPI}" />
                </div>
            </div>

            <div class="control-group">
                <label  class="control-label" for="NPI1"><g:message code="provider.NPI1.label" default="NPI1" /></label>
                <div class="controls">
                    <g:textField name="NPI1" value="${providerData?.NPI1}" />
                </div>
            </div>

            <div class="control-group">
                <label  class="control-label" for="NPI2"><g:message code="provider.NPI2.label" default="NPI2" /></label>
                <div class="controls">
                    <g:textField name="NPI2" value="${providerData?.NPI2}" />
                </div>
            </div>

            <div class="control-group">
                <label  class="control-label" for="DEA"><g:message code="provider.DEA.label" default="DEA" /></label>
                <div class="controls">
                    <g:textField name="DEA" value="${providerData?.DEA}" maxlength="128"/>
                </div>
            </div>

            <div class="control-group">
                <label  class="control-label" for="prefix"><g:message code="provider.prefix.label" default="Prefix" /></label>
                <div class="controls">
                    <g:select name="prefix" value="${providerData?.prefix}" from="${['Title1','Title2']}"></g:select>
                    %{--<g:textField name="prefix" value="${providerData?.prefix}" />--}%
                </div>
            </div>
            <div class="control-group">
                <label  class="control-label" for="suffix"><g:message code="provider.suffix.label" default="Suffix" /></label>
                <div class="controls">
                    <g:textField name="suffix" value="${providerData?.suffix}" />
                </div>
            </div>
            %{--<div class="control-group">--}%
            %{--<label  class="control-label" for="MLN"><g:message code="provider.MLN.label" default="MLN" /></label>--}%
            %{--<div class="controls">--}%
            %{--<g:textField name="MLN" value="${providerData?.MLN}" />--}%
            %{--</div>--}%
            %{--</div>--}%
            <div class="control-group">
                <label  class="control-label" for="DOB"><g:message code="provider.DOB.label" default="DOB" /></label>
                <div class="controls">
                    <g:textField name="DOB" value="${providerData?.DOB}" />
                </div>
            </div>
            <div class="control-group">
                <label  class="control-label" for="SSN"><g:message code="provider.SSN.label" default="SSN" /></label>
                <div class="controls">
                    <g:textField name="SSN" value="${providerData?.SSN}" />
                </div>
            </div>
            <div class="control-group">
                <label  class="control-label" for="UPIN"><g:message code="provider.UPIN.label" default="UPIN" /></label>
                <div class="controls">
                    <g:textField name="UPIN" value="${providerData?.UPIN}" />
                </div>
            </div>

            %{--<div class="control-group">--}%
                %{--<label  class="control-label" for="status"><g:message code="provider.status.label" default="Status" /></label>--}%
                %{--<div class="controls">--}%
                    %{--<g:select name="status" from="${Provider.constraints.status.inList}" value="${providerData?.status}" /><span class="help-inline">Required</span>--}%
                %{--</div>--}%
            %{--</div>--}%

            <div >
                <hr>
                <div>
                    <font size="3" color="#279745" style="margin: 0 140px 0 0">Medical Licence Number</font>
                    <a href="javascript:selectStateMLN();" style="margin:0 0 0 0 "><img src="${request.contextPath}/images/add.jpg"><g:message  code="add.message.lable" /></a>
                </div>

                <div id="MLNDiv">
                    <table id="MLNTable" class="table table-condensed table-striped">
                        <th>${message(code: 'stateMLN.state.label', default: 'State')}</th>

                        <th>${message(code: 'stateMLN.providerType.label', default: 'Provider Type')}</th>

                        <th>${message(code: 'stateMLN.MLN.label', default: 'Medical Licence Number')}</th>

                        <th>Delete</th>

                        <tbody>
                        <g:each in="${stateMLNDataList}" status="i" var="stateMLNData">
                            <tr id="toBeDelRow<%=i+1%>">
                                <td><g:select name="state" from="${com.bssi.Address.constraints.state.inList}" value="${stateMLNData.state}"/><g:hiddenField name="stateMLNDataId" value="${stateMLNData.id}"></g:hiddenField></td>
                                <td><g:select name="mlnProviderType" value="${stateMLNData.providerType}" from="${com.bssi.ProviderType.list()}"></g:select></td>
                                <td><g:textField name="MLN" value="${stateMLNData.mln}"></g:textField></td>
                                <td><a href="javascript:existdeleteMLNRow(<%=i+1%>,${stateMLNData.id});">${message(code: 'd.del.label', default: 'delete')}</a></td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>
            </div>

            <div >
                <hr>
                <div>
                    <font size="3" color="#279745" style="margin: 0 140px 0 0"><g:message  code="client.message.lable" /></font>
                    <a href="javascript:selectClient();" style="margin:0 0 0 0 "><img src="${request.contextPath}/images/add.jpg">Select</a>
                </div>

                <div id="clientDiv">
                    <table id="clientTable" class="table table-condensed table-striped">
                        <th>${message(code: 'client.name.label', default: 'Name')}</th>

                        <th>${message(code: 'provider.clientProvider.label', default: 'Client Provider Id')}</th>

                        <th>${message(code: 'client.status.label', default: 'Status')}</th>

                        <th>${message(code: 'client.activeInd.label', default: 'Active')}</th>

                        <th>Delete</th>
                        <tbody>
                        <g:each in="${clientDataList}" status="i" var="clientData">
                            <tr id="toBeDelRow<%=i+1%>">
                                <td>${clientData[1]}<g:hiddenField name="client" value="${clientData[0]}"></g:hiddenField></td>
                                %{--<td>${clientData[2]}</td>--}%
                                %{--<td>${clientData[3]}</td>--}%
                                <td><g:textField name="clientProvider" value="${clientData[4]}"></g:textField></td>
                                <td><g:select name="cstatus" from="${['Status1','Status2']}" value="${clientData[5]}"></g:select></td>
                                <td><g:checkBox name="cactiveIndShow" id="cactiveIndShow${i+1}" value="${clientData[6]}" onclick="activIndChange(${i+1})"></g:checkBox>
                                <g:hiddenField name="cactiveInd" id="cactiveInd${i+1}" value="${clientData[6]}"></g:hiddenField>
                                </td>
                                <td><a href="javascript:existdeleteClientRow(<%=i+1%>,${clientData[0]});">${message(code: 'd.del.label', default: 'delete')}</a></td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>
            </div>
            <hr>
            <div class="offset3">
                <g:actionSubmit name="create" action="update"  class="btn btn-primary" onclick="return checkForm();" value="${message(code: 'default.button.update.label', default: 'Create')}" />
                <g:actionSubmit class="btn btn-danger"  action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                <g:actionSubmit value="Cancel" name="cancel" action="list" class="btn"></g:actionSubmit>
            </div>
        </div>
        </div>
    </g:form>
</div>
</body>
</html>
