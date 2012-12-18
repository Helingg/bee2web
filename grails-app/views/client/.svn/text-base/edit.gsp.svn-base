

<%@ page import="com.bssi.Client" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <link rel="stylesheet" type="text/css" href="${resource(dir:'js/themes/default',file:'easyui.css')}">
        <script type="text/javascript" src="${resource(dir:'js',file:'jquery-1.7.2.min.js')}"></script>
        <script type="text/javascript" src="${resource(dir:'js',file:'jquery.easyui.min.js')}"></script>
        <script type="text/javascript">
            function checkForm(){
//                var checkip =/^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/;
//                var checknum=/^[0-9]{1,20}$/;


                var clientName = document.getElementById("name");
                if(nameRepeat==-1){
                    alert("Cleint Name "+clientName.value+" is already exist!");
                    clientName.style.borderColor='red';
                    clientName.focus();
                    return false;
                }
                if(clientName.value==""){
                    alert("Cleint Name is null");
                    clientName.style.borderColor='red';
                    clientName.focus();
                    return false;
                }
                var streetNumber = document.getElementById('streetNbr');
                var streetAddress = document.getElementById('streetAddr');
                var city = document.getElementById('city');
                var country = document.getElementById('country');
                var state = document.getElementById('state');
                var addressTypeShow = document.getElementById('addressTypeShow');
                if(streetNumber.value||streetAddress.value||city.value||country.value||addressTypeShow.value){
                    if(streetNumber.value==null||streetNumber.value==""){
                        alert("Street Number is null!");
                        streetNumber.style.borderColor='red';
                        streetNumber.focus();
                        return false;
                    }
                    if(streetAddress.value==null||streetAddress.value==""){
                        alert("Street Address is null!");
                        streetAddress.style.borderColor='red';
                        streetAddress.focus();
                        return false;
                    }
                    if(city.value==null||city.value==""){
                        alert("City is null!");
                        city.style.borderColor='red';
                        city.focus();
                        return false;
                    }
                    if(state.value==null||state.value==""){
                        alert("State is null!");
                        state.style.borderColor='red';
                        state.focus();
                        return false;
                    }
                    if(country.value==null||country.value==""){
                        alert("Country is null!");
                        country.style.borderColor='red';
                        country.focus();
                        return false;
                    }
                    if(!addressTypeShow.value){
                        alert("Address Type can not be blank!");
                        addressTypeShow.style.borderColor='red';
                        addressTypeShow.focus();
                        return false;
                    }
                }
                var regex =/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
                var emailAddr = document.getElementById('emailAddr');
                var firstName = document.getElementById('firstName');
                var lastName = document.getElementById('lastName');
                var addressShow = document.getElementById('addressShow');
                var contactTypeShow = document.getElementById('contactTypeShow');
                if(emailAddr.value||firstName.value||lastName.value||addressShow.value||contactTypeShow.value)  {
                    if(!firstName.value){
                        alert('First Name is null!');
                        firstName.style.borderColor = "red";
                        firstName.focus();
                        return false;
                    }
                    if(!lastName.value){
                        alert('Last Name is null!');
                        lastName.style.borderColor = "red";
                        lastName.focus();
                        return false;
                    }
                    if(emailAddr.value){
                        if(!regex.exec(emailAddr.value)){
                            alert('The Email Address format is wrong!');
                            emailAddr.style.borderColor = "red";
                            emailAddr.focus();
                            return false;
                        }
                    }
                    if(!addressShow.value){
                        alert('Please select an Address!');
                        addressShow.style.borderColor = "red";
                        addressShow.focus();
                        selectAddress();
                        return false;
                    }

                    if(!contactTypeShow.value){
                        alert('Please select an Contact Type!');
                        contactTypeShow.style.borderColor = "red";
                        contactTypeShow.focus();
                        selectContactType();
                        return false;
                    }
                }
                return true;
            }
            function selectProvider(){
                var paramKQ = " ${request.contextPath}/client/selectProvider";
                open(paramKQ,'title','resizable=no,width=800,height=410,scrollbars=yes');
            }

            var providerNum=${providerInstanceTotal};
            var providerDelNum=${providerInstanceTotal};
            function setProviderTable(NPI,firstName,lastName, middleName,provider){  //set provider
                document.getElementById("providerDiv").style.display="";
                var objTable = document.getElementById("providerTable");
                objTable.insertRow(objTable.rows.length);
                //                var inx = (document.all.providerTavle.rows.length)-1;
                providerNum++;
                providerDelNum++;
                objTable.rows.item(objTable.rows.length -1).id = "ptoBeDelRow"+providerDelNum;
                objTable.rows.item(objTable.rows.length -1).insertCell(0);
                objTable.rows[objTable.rows.length-1].cells[0].innerHTML="<TR><TD><div align=left>"+NPI+"<input type=hidden name=NPI size=12 value="+NPI+"> <input type=hidden name=provider size=12 value="+provider+" ><div></TD>";

                objTable.rows.item(objTable.rows.length -1).id = "ptoBeDelRow"+providerDelNum;
                objTable.rows.item(objTable.rows.length -1).insertCell(1);
                objTable.rows[objTable.rows.length-1].cells[1].innerHTML="<TD><div align=left>"+firstName+" "+middleName+" "+lastName+"<input type=hidden name=lastName size=12 value="+lastName+" ><div></TD>";


                objTable.rows.item(objTable.rows.length -1).id = "ptoBeDelRow"+providerDelNum;
                objTable.rows.item(objTable.rows.length -1).insertCell(2);
                objTable.rows[objTable.rows.length-1].cells[2].innerHTML="<TD><div align=left><input type=text name=clientProvider value='' ></div></TD>";

                objTable.rows.item(objTable.rows.length -1).id = "ptoBeDelRow"+providerDelNum;
                objTable.rows.item(objTable.rows.length -1).insertCell(3);
                objTable.rows[objTable.rows.length-1].cells[3].innerHTML="<TD><div align=left><select name=pstatus><option value=status1>Status1</option>" +
                        "<option value=status2>Status2</option></select></div></TD>";

                objTable.rows.item(objTable.rows.length -1).id = "ptoBeDelRow"+providerDelNum;
                objTable.rows.item(objTable.rows.length -1).insertCell(4);
                objTable.rows[objTable.rows.length-1].cells[4].innerHTML="<TD><div align=left><input type=checkbox name=activeIndShow  id=pactiveIndShow"+providerDelNum+" checked=true onclick=activeIndChange("+providerDelNum+") ><input type=hidden name=pactiveInd id=pactiveInd"+providerDelNum+" value='true'></div></TD>";

                document.getElementById("providerNum").value=providerNum;
            }
            function activeIndChange(num){
                var activeShow = document.getElementById("pactiveIndShow"+num);
                var active = document.getElementById("pactiveInd"+num);
                if(activeShow.checked){
                    active.value = true;
                } else{
                    active.value = false;
                }
            }
            function setProviderInfo(providerString){
                document.getElementById("providerDiv").style.display="";
                var providerExist = document.getElementsByName('provider');
                var flag = true;
                if(providerString!=""||providerString!=null) {
                    var temp1 = providerString.split(",");
                    for(var i =0;i<temp1.length-1;i++){
                        var temp2 = temp1[i].split(":");
                        if(providerExist.length>0){
                            for(var j=0;j<providerExist.length;j++){
                                if(providerExist[j].value==temp2[4])  {
                                    flag = false;
                                    break;
                                }
                            }
                        }
                        if(flag){
                            setProviderTable(temp2[0],temp2[1],temp2[2],temp2[3],temp2[4]);
                        } else{
                            flag=true;
                            continue;
                        }

                    }
                }
            }

            function ExistDeleteProviderRow(rowIdx,delProvider) {
                var client = document.getElementById("id");
                if(confirm("Are you sure?")){
                    $.ajax({
                        url:"${request.contextPath}/client/deleteProvider",
                        data:{provider:delProvider,client:client.value},
                        success:function(msg){
//                            var del = document.getElementById("delProvider");
//                            var ext = del.value + delProvider+",";
//                            del.value=ext;
                            var objTable = document.getElementById("providerTable");
                            var objRow = document.getElementById("ptoBeDelRow"+rowIdx);
                            objTable.deleteRow(objRow.rowIndex);
                            providerNum--;
                            if(providerNum==0){
                                document.getElementById("providerDiv").style.display="none";
                            }
                            document.getElementById("providerNum").value =providerNum;
                            alert(msg);
                        }
                    });


                }
            }

            function DeleteProvider(rowIdx){
                if(!confirm("Are you sure")){
                    return;
                }
                var objTable = document.getElementById("providerTable");
                var objRow = document.getElementById("ptoBeDelRow"+rowIdx);
                objTable.deleteRow(objRow.rowIndex);
                providerNum--;
                if(providerNum==0){
                    document.getElementById("providerDiv").style.display="none";
                }
                document.getElementById("providerNum").value =providerNum;
                alert("Delete success!");
            }



            function createProvider(){
                clearProvider();
                $("#client_providerdlg").dialog("open");
            }
            function closeProvider(){
                $("#client_providerdlg").dialog("close");
                clearProvider();
            }
            function clearProvider(){
                var firstName = document.getElementById('client_firstName');
                var lastName = document.getElementById('client_lastName');
                var middleName = document.getElementById('client_middleName');
                var providerType = document.getElementById('client_providerType');
                var NPI = document.getElementById('client_NPI');
                var DEA = document.getElementById('client_DEA');
                var prefix = document.getElementById('client_prefix');
                var suffix = document.getElementById('client_suffix');
                var DOB = document.getElementById('client_DOB');
                var SSN = document.getElementById('client_SSN');
                var UPIN = document.getElementById('client_UPIN');
                var status = document.getElementById('client_status');
                var state = document.getElementsByName('state');
                var MLN = document.getElementsByName('MLN');
                firstName.value = "";
                lastName.value = "";
                middleName.value = "";
                providerType.value = "";
                NPI.value = "";
                DEA.value = "";
                prefix.value = "";
                suffix.value = "";
                DOB.value = "";
                SSN.value = "";
                UPIN.value = "";
                status.value = "";
                var objTable = document.getElementById("MLNTable");
                var rowNum=objTable.rows.length;
                if(rowNum>1){
                    for (var i=1;i<rowNum;i++)
                    {
                        objTable.deleteRow(1);

                        if(stateMLN==0){
                            document.getElementById("MLNDiv").style.display="none";
                        }
                        document.getElementById("MLNNum").value =stateMLN;
                    }
                }

            }

            var stateInner = "";
            function initState() {
                var stateList = ['AL','AK','AR', 'AZ', 'CA', 'CO', 'CT' ,'DE' ,'FL', 'GA', 'HI', 'LA' ,'ID', 'IL' ,'IN', 'KS', 'KY', 'LA', 'MA', 'ME' ,'MD', 'MI', 'MN' ,'MO', 'MS', 'MT',
                    'NE', 'NC','ND', 'NH', 'NJ', 'NM', 'NV', 'NY', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX','UT', 'VT', 'VA', 'WA', 'DC', 'WV','WI','WY'];
                for (var i=0;i<stateList.length;i++){
                    stateInner = stateInner+ " <option value="+stateList[i]+">"+stateList[i]+"</option> "
                }
            }
            var providerTypeInner = ""
            function initProviderType(){
                var providerType ="${com.bssi.ProviderType.list().toString()}";
                var lastIndex = providerType.length;
                var temp = providerType.substring(1,lastIndex-1)
                var tempArray =temp.split(",");
                if(tempArray.length>0){
                    for(var i=0;i<tempArray.length;i++){
                        providerTypeInner = providerTypeInner+ " <option value="+tempArray[i]+">"+tempArray[i]+"</option> "
                    }
                }
            }
            var stateMLN =0;
            var stateMLNDel = 0;
            function selectStateMLN(){
                initState();
                initProviderType();
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
                objTable.rows[objTable.rows.length-1].cells[1].innerHTML="<TD><div align=left> <select name='mlnProviderType'>"+providerTypeInner+"</select><div></TD>";

                objTable.rows.item(objTable.rows.length -1).id = "toBeDelRow"+stateMLNDel;
                objTable.rows.item(objTable.rows.length -1).insertCell(2);
                objTable.rows[objTable.rows.length-1].cells[2].innerHTML="<TD><div align=left><input type=text name=MLN size=12 value=''> <div></TD>";

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
            function saveProvider() {
                var firstName = document.getElementById('client_firstName');
                var lastName = document.getElementById('client_lastName');
                var middleName = document.getElementById('client_middleName');
                var providerType = document.getElementById('client_providerType');
                var NPI = document.getElementById('client_NPI');
                var NPI1 = document.getElementById('client_NPI1');
                var NPI2 = document.getElementById('client_NPI2');
                var DEA = document.getElementById('client_DEA');
                var prefix = document.getElementById('client_prefix');
                var suffix = document.getElementById('client_suffix');
                var DOB = document.getElementById('client_DOB');
                var SSN = document.getElementById('client_SSN');
                var UPIN = document.getElementById('client_UPIN');
                var status = document.getElementById('client_status');
                var state = document.getElementsByName('state');
                var MLN = document.getElementsByName('MLN');
                var mlnProviderType = document.getElementsByName('mlnProviderType');
                var checkSSN = /^(\d\d\d)\-(\d\d)\-(\d\d\d\d)$/;
                var MLNArray = "";
                var stateArray = "";
            　
                if(!firstName.value){
                    alert("First Name is null");
                    firstName.style.borderColor='red';
                    firstName.getElementById("firstName").focus();
                    return false;
                }else{
                    firstName.style.borderColor='';
                }
                if(!lastName.value){
                    alert("Last Name is null");
                    lastName.style.borderColor='red';
                    lastName.focus();
                    return false;
                }else{
                    firstName.style.borderColor='';
                }
//                if(NPI.value==""){
//                    alert("NPI can is null");
//                    NPI.style.borderColor='red';
//                    NPI.focus();
//                    return false;
//                }else{
//                    NPI.style.borderColor='';
//                }
                if(SSN.value&&!checkSSN.exec(SSN.value)){
                    alert("SSN format error!");
                    SSN.style.borderColor='red';
                    SSN.focus();
                    return false;
                } else{
                    SSN.style.borderColor='';
                }
                if(state.length>0){
                    for(var i=0;i<state.length;i++){
                        MLNArray = MLNArray + MLN[i].value+",";
                        stateArray =  stateArray + state[i].value+",";
                        mlnProviderType =  mlnProviderType + mlnProviderType[i].value+",";
                        if(!MLN[i].value){
                            MLN[i].focus();
                            MLN[i].style.borderColor="red";
                            alert("Medical Licence Number is null");
                            return false;
                        } else{
                            MLN[i].style.borderColor="";
                        }
                    }
                }

                $.ajax({
                    url:"${request.contextPath}/client/saveProvider",
                    data:{firstName:firstName.value,lastName:lastName.value,middleName:middleName.value,
                        providerType:providerType.value,NPI:NPI.value,NPI1:NPI1,NPI2:NPI2,DEA:DEA.value,prefix:prefix.value,DOB:DOB.value,SSN:SSN.value,UPIN:UPIN.value,
                        status:status.value,MLN:MLNArray,state:stateArray,mlnProviderType:mlnProviderType
                    },
                    success:function(msg){
                        if(msg.msg){
                            alert(msg.msg)
                        }else{
                            setProviderTable(msg.provider.NPI,msg.provider.firstName,msg.provider.lastName, msg.provider.middleName,msg.provider.id);
                            closeProvider();
                        }
                    }
                })
                return true;
            }

            function selectAddressType(){
                var paramKQ = " ${request.contextPath}/addressType/selectAddressType";
                open(paramKQ,'title','resizable=no,width=850,height=600,scrollbars=yes');
            }
            function setAddressTypeInfo(id,addressType,activeInd){
                var addressTypeShow = document.getElementById('addressTypeShow');
                var addressType1 = document.getElementById('addressType1');
                addressTypeShow.value= addressType;
                addressType1.value=id;
            }

            function selectAddress(){
                var paramKQ = " ${request.contextPath}/address/selectAddress";
                open(paramKQ,'title','resizable=no,width=850,height=600,scrollbars=yes');
            }

            function selectContactType(){
                var paramKQ = " ${request.contextPath}/contactType/selectContactType";
                open(paramKQ,'title','resizable=no,width=800,height=600,scrollbars=yes');
            }

            function setAddress(id,num,addr){
                var addressShow = document.getElementById('addressShow');
                var address1 = document.getElementById('address1');
                addressShow.value= num+"-"+addr;
                address1.value=id;

            }

            function setContactType(id,contactType){
                var contactTypeShow = document.getElementById('contactTypeShow');
                var contactType1 = document.getElementById('contactType1');
                contactTypeShow.value= contactType;
                contactType1.value=id;
            }
            var nameRepeat = 0;
            function checkClientName(){
                var name = document.getElementById("name");
                var id = document.getElementById("id");
                if(name.value){
                    $.ajax({
                        url:"${request.contextPath}/client/checkClientName",
                        data:{id:id.value,name:name.value},
                        success:function(msg){
                            if(msg){
                                alert(msg);
                                name.style.borderColor="red";
                                nameRepeat = -1;
                            } else{
                                nameRepeat = 0;
                                name.style.borderColor="";
                            }
                        }
                    })
                } else{
                    alert("Client Name is null");
                }
            }
        </script>
    </head>
    <body>
    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
      <hr>

    %{--<g:hasErrors bean="${clientData}">--}%
        %{--<div class="errors">--}%
            %{--<g:renderErrors bean="${clientData}" as="list" />--}%
        %{--</div>--}%
    %{--</g:hasErrors>--}%
    <div class="container-fluid span10">
        <div class="span12 divbk">
           <g:link  action="list"><i class="icon-list"></i><g:message code="default.list.label" args="[entityName]" /></g:link>
           <g:link  action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link>
           <a href="#" onclick="createProvider()"><i class="icon-plus"></i>New Provider</a>
        </div>
        <g:if test="${flash.message}">
            <div class="message span12" style="color: red">${flash.message}</div>
        </g:if>
    <div class="span12" >

        <g:form method="post" class="form-horizontal">
            <g:hiddenField name="id" value="${clientData?.id}" />
            <g:hiddenField name="version" value="${clientData?.version}" />
            <g:hiddenField name="delReceiveInfo"  id="delReceiveInfo" value=""></g:hiddenField>
            <g:hiddenField name="providerNum"  id="providerNum" value="${providerInstanceTotal}"></g:hiddenField>
            <div class="well">
            <div class="tabbable">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#clientTab" data-toggle="tab">Client</a>
                    </li>
                    <li><a href="#addressTab" data-toggle="tab">Address</a></li>
                    <li><a href="#contactTab" data-toggle="tab">Contact</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="clientTab">
                    <div class="control-group">
                        <label class="control-label" for="name"><g:message code="facility.name.label" default="Name" /></label>
                        <div class="controls">
                            <g:textField class="input-xlarge focused" onblur="checkClientName();" name="name" maxlength="128" value="${clientData?.name}" /><span class="help-inline">Required</span>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="alias" class="control-label"><g:message code="client.alias.label" default="Alias" /></label>
                        <div class="controls">
                            <g:textField  class="input-xlarge focused" name="alias" maxlength="128" value="${clientData?.alias}" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="activeInd" class="control-label"><g:message code="client.activeInd.label" default="ActiveInd" /></label>
                        <div class="controls">
                            <g:checkBox  class="input-xlarge focused" name="activeInd" maxlength="128" value="${clientData?.activeInd}" />
                        </div>
                    </div>

                    <div >
                        <hr>
                        <div>
                            <font size="3" color="#279745" style="margin: 0 142px 0 0"><g:message  code="provider.message.lable" /></font>
                            <a href="javascript:selectProvider();" style="margin:0 0 0 0 "><img src="${request.contextPath}/images/add.jpg">Select</a>
                        </div>

                        <div id="providerDiv" >
                            <table id="providerTable" class="table table-condensed table-striped">
                                <th>${message(code: 'provider.NPI.label', default: 'NPI')}</th>

                                <th>${message(code: 'provider.name.label', default: 'Provider Name')}</th>

                                <th>${message(code: 'provider.clientProvider.label', default: 'Client Provider Id')} </th>

                                <th>${message(code: 'provider.status.label', default: 'Status')} </th>

                                <th>${message(code: 'provider.activeInd.label', default: 'Active')} </th>

                                %{--<th>Delete</th>--}%
                                <tbody>
                                <g:each in="${providerInstanceList}" status="i" var="providerInstance">
                                    <tr id="ptoBeDelRow<%=i+1%>">
                                        <td>${providerInstance[1]}<g:hiddenField name="provider" value="${providerInstance[0]}"></g:hiddenField></td>
                                        <td>${providerInstance[3]} ${providerInstance[4]} ${providerInstance[2]}</td>
                                        <td><g:textField name="clientProvider" value="${providerInstance[5]}"></g:textField></td>
                                        <td><g:select name="pstatus" from="${['Status1','Status2']}" value="${providerInstance[6]}"></g:select></td>
                                        <td><g:checkBox name="activeIndShow" id="pactiveIndShow${i+1}" value="${providerInstance[7]}" onclick="activeIndChange(${i+1})"></g:checkBox>
                                        <g:hiddenField name="pactiveInd" id="pactiveInd${i+1}" value="${providerInstance[7]}"></g:hiddenField>
                                        </td>
                                        %{--<td><a href="javascript:ExistDeleteProviderRow(<%=i+1%>,${providerInstance[0]});">${message(code: 'd.del.label', default: 'delete')}</a></td>--}%
                                    </tr>
                                </g:each>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    </div>
                    <div class="tab-pane" id="addressTab">
                        <div class="control-group">
                            <label class="control-label" for="streetNbr" ><g:message code="address.streetNbr.label" default="Street Number" /></label>
                            <div class="controls">
                                <g:textField class="input-xlarge focused" name="streetNbr" maxlength="128" value="${clientAddressData?.addr?.streetNbr}" /> <span class="help-inline">Required</span>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="streetAddr" ><g:message code="address.streetAddr.label" default="Street Address" /></label>
                            <div class="controls">
                                <g:textField class="input-xlarge focused" name="streetAddr" maxlength="128" value="${clientAddressData?.addr?.streetAddr}" />  <span class="help-inline">Required</span>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="streetPrefix" ><g:message code="address.streetPrefix.label" default="Street Prefix" /></label>
                            <div class="controls">
                                <g:textField class="input-xlarge focused" name="streetPrefix" maxlength="128" value="${clientAddressData?.addr?.streetPrefix}" />
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="streetSuffix" ><g:message code="address.streetSuffix.label" default="Street Suffix" /></label>
                            <div class="controls">
                                <g:textField class="input-xlarge focused" name="streetSuffix" maxlength="128" value="${clientAddressData?.addr?.streetSuffix}" />
                            </div>
                        </div>


                        <div class="control-group">
                            <label class="control-label" for="city" ><g:message code="address.city.label" default="City" /></label>
                            <div class="controls">
                                <g:textField class="input-xlarge focused" name="city" maxlength="128" value="${clientAddressData?.addr?.city}" /> <span class="help-inline">Required</span>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="state" ><g:message code="address.state.label" default="State" /></label>
                            <div class="controls">
                                %{--<g:textField class="input-xlarge focused" name="state" maxlength="2" value="${addressData?.state}" />  --}%
                                <g:select name="state" from="${com.bssi.Address.constraints.state.inList}" noSelection="${['':'State']}" value="${clientAddressData?.addr?.state}"></g:select> <span class="help-inline">Required</span>

                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="country" ><g:message code="address.country.label" default="Country" /></label>
                            <div class="controls">
                                <g:textField class="input-xlarge focused" name="country" maxlength="128" value="${clientAddressData?.addr?.country}" /><span class="help-inline">Required</span>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="zipCode" ><g:message code="address.zipCode.label" default="Zip Code" /></label>
                            <div class="controls">
                                <g:textField class="input-xlarge focused" name="zipCode" maxlength="128" value="${clientAddressData?.addr?.zipCode}" />
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label"  ><g:message code="clientAddress.addrType.label"  default="Address Type" /></label>
                            <div class="controls">
                                <g:textField readonly="true" name="addressTypeShow" class="input-xlarge focused" onclick="selectAddressType()" placeholder="Click 'Add' to add a address type!" value="${clientAddressData?.addrType}"></g:textField>  <a href="javascript:selectAddressType()"><img src="${request.contextPath}/images/add.jpg"> Select</a>  <span class="help-inline">Required</span>
                                <g:hiddenField name="addressType1" value="${clientAddressData?.addrType?.id}"></g:hiddenField>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane" id="contactTab">
                        <div class="control-group">
                            <label class="control-label" for="lastName" ><g:message code="clientContact.lastName.label" default="Last Name" /></label>
                            <div class="controls">
                                <g:textField class="input-xlarge focused" name="lastName" maxlength="128" value="${clientContactData?.lastName}" /> <span class="help-inline">Required</span>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="firstName" ><g:message code="clientContact.firstName.label" default="First Name" /></label>
                            <div class="controls">
                                <g:textField class="input-xlarge focused" name="firstName" maxlength="128" value="${clientContactData?.firstName}" /> <span class="help-inline">Required</span>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="middleName" ><g:message code="clientContact.middleName.label" default="Middle Name" /></label>
                            <div class="controls">
                                <g:textField class="input-xlarge focused" name="middleName" maxlength="128" value="${clientContactData?.middleName}" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="phoneNbr" ><g:message code="clientContact.phoneNbr.label" default="Phone Nbr" /></label>
                            <div class="controls">
                                <g:textField class="input-xlarge focused" name="phoneNbr" maxlength="128" value="${clientContactData?.phoneNbr}" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" ><g:message code="clientAddress.fax.label" default="Fax" /></label>
                            <div class="controls">
                                <g:textField class="input-xlarge focused" name="fax" value=""></g:textField>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="emailAddr" ><g:message code="clientContact.emailAddr.label" default="Email" /></label>
                            <div class="controls">
                                <g:textField class="input-xlarge focused" name="emailAddr" maxlength="128" value="${clientContactData?.emailAddr}" />
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label"  ><g:message code="clientContact.addr.label" default="Address" /></label>
                            <div class="controls">
                                <g:textField readonly="true" name="addressShow" placeholder="Click 'Add' to add a contact address!" class="input-xlarge focused" value="${clientContactData?.addr}" onclick="selectAddress()"></g:textField> <a href="javascript:selectAddress()"><img src="${request.contextPath}/images/add.jpg"> Add</a> <span class="help-inline">Required</span>
                                <g:hiddenField name="address1" value="${clientContactData?.addr?.id}"></g:hiddenField>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label"  ><g:message code="clientContact.contactType.label" default="Contact Type" /></label>
                            <div class="controls">
                                <g:textField readonly="true" name="contactTypeShow" class="input-xlarge focused" placeholder="Click 'Add' to add a contact type!" value="${clientContactData?.contactType}" onclick="selectContactType()"></g:textField>  <a href="javascript:selectContactType()"><img src="${request.contextPath}/images/add.jpg"> Add</a>  <span class="help-inline">Required</span>
                                <g:hiddenField name="contactType1" value="${clientContactData?.contactType?.id}"></g:hiddenField>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

                <hr>
                <div class="offset3">
                    <g:actionSubmit name="create" action="update"  class="btn btn-primary" onclick="return checkForm();" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                    <g:actionSubmit class="btn btn-danger"  action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    <g:actionSubmit value="Cancel" name="cancel" action="list" class="btn"></g:actionSubmit>
                    <span class="button"><g:submitButton name="createMany" style="display: none" class="save" onclick="return checkForm1();"  value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </div>
            </div>
        </g:form>

    </div>
    %{------------------------------------------provider option---------------------------------------------------------------------}%
    <div id="client_providerdlg" title="Provider"
         class="easyui-dialog" style="width:700px;height:600px;padding:10px 20px"
         closed="true" buttons="#client_providerdlg-buttons">
        <h2>${message(code: 'provider.label', default: 'Provider')}</h2>
        <g:hiddenField name="MLNNum" value = "0"></g:hiddenField>
        <hr>
        <table>
            <tr>
                <td> <label  class="control-label" for="client_lastName"><g:message code="provider.lastName.label" default="Last Name" /></label></td>
                <td><g:textField name="client_lastName" value="${providerData?.lastName}" /><span class="help-inline">Required</span></td>
            </tr>

            <tr>
                <td>   <label  class="control-label" for="client_firstName"><g:message code="provider.firstName.label" default="First Name" /></label></td>
                <td> <g:textField name="client_firstName" value="${providerData?.firstName}" /><span class="help-inline">Required</span></td>
            </tr>
            <tr>
                <td><label  class="control-label" for="client_middleName"><g:message code="provider.middleName.label" default="Middle Name" /></label></td>
                <td><g:textField name="client_middleName" value="${providerData?.middleName}" /></td>
            </tr>
            <tr>
                <td> <label  class="control-label" for="client_providerType"><g:message code="provider.providerType.label" default="Provider Type" /></label></td>
                <td>  <g:select name="client_providerType" from="${com.bssi.ProviderType.list()}"></g:select></td>
            </tr>

            <tr>
                <td><label  class="control-label" for="client_NPI"><g:message code="provider.NPI.label" default="NPI" /></label></td>
                <td><g:textField name="client_NPI" value="${providerData?.NPI}" /></td>
            </tr>
            <tr>
                <td><label  class="control-label" for="client_NPI1"><g:message code="provider.NPI1.label" default="NPI1" /></label></td>
                <td><g:textField name="client_NPI1" value="${providerData?.NPI1}" /></td>
            </tr>
            <tr>
                <td><label  class="control-label" for="client_NPI2"><g:message code="provider.NPI2.label" default="NPI2" /></label></td>
                <td><g:textField name="client_NPI2" value="${providerData?.NPI2}" /></td>
            </tr>
            <tr>
                <td>  <label  class="control-label" for="client_DEA"><g:message code="provider.DEA.label" default="DEA" /></label></td>
                <td>  <g:textField name="client_DEA" value="${providerData?.DEA}" maxlength="128"/></td>
            </tr>
            <tr>
                <td>  <label  class="control-label" for="client_prefix"><g:message code="provider.prefix.label" default="Prefix" /></label></td>
                <td> <g:textField name="client_prefix" value="${providerData?.prefix}" /></td>
            </tr>
            <tr>
                <td> <label  class="control-label" for="client_suffix"><g:message code="provider.suffix.label" default="Suffix" /></label></td>
                <td>  <g:textField name="client_suffix" value="${providerData?.suffix}" /></td>
            </tr>
            <tr>
                <td><label  class="control-label" for="client_DOB"><g:message code="provider.DOB.label" default="DOB" /></label></td>
                <td><g:textField name="client_DOB" value="${providerData?.DOB}" /></td>
            </tr>
            <tr>
                <td>  <label  class="control-label" for="client_SSN"><g:message code="provider.SSN.label" default="SSN" /></label></td>
                <td> <g:textField name="client_SSN" value="${providerData?.SSN}" /></td>
            </tr>
            <tr>
                <td>  <label  class="control-label" for="client_UPIN"><g:message code="provider.UPIN.label" default="UPIN" /></label></td>
                <td> <g:textField name="client_UPIN" value="${providerData?.UPIN}" /></td>
            </tr>
            <tr>
                <td><label  class="control-label" for="client_status"><g:message code="provider.status.label" default="Status" /></label></td>
                <td> <g:select name="client_status" from="${com.bssi.Provider.constraints.status.inList}" value="${providerData?.status}" /><span class="help-inline">Required</span></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
            </tr>

        </table>


        <div >
            <hr>
            <div>
                <font size="3" color="#279745" style="margin: 0 140px 0 0">Medical Licence Number</font>
                <a href="javascript:selectStateMLN();" style="margin:0 0 0 0 "><img src="${request.contextPath}/images/add.jpg"><g:message  code="add.message.lable" /></a>
            </div>

            <div id="MLNDiv" style="display: none">
                <table id="MLNTable" class="table table-condensed table-striped">
                    <th>${message(code: 'stateMLN.state.label', default: 'State')}</th>

                    <th>${message(code: 'stateMLN.providerType.label', default: 'Provider Type')}</th>

                    <th>${message(code: 'stateMLN.MLN.label', default: 'Medical Licence Number')}</th>

                    <th>Delete</th>
                </table>
            </div>
        </div>
    </div>
    <div id="client_providerdlg-buttons">
        <a href="#" class="btn btn-primary"  onclick="return saveProvider();">${message(code: 'default.button.save.label', default: 'Save')}</a>
        <a href="#" class="btn"  onclick="closeProvider();">${message(code: 'default.button.cancel.label', default: 'Cancel')}</a>
    </div>

    </body>
</html>
