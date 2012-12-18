

<%@ page import="com.bssi.Client" %>
<html xmlns="http://www.w3.org/1999/html">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <link rel="stylesheet" type="text/css" href="${resource(dir:'js/themes/default',file:'easyui.css')}">
        <script type="text/javascript" src="${resource(dir:'js',file:'jquery-1.7.2.min.js')}"></script>
        <script type="text/javascript" src="${resource(dir:'js',file:'jquery.easyui.min.js')}"></script>

        <script type="text/javascript">
            var flag = false;
                function checkForm(){
                    if(document.getElementById("name").value==""){
                        alert("Name can not be blank");
                        document.getElementById("name").style.borderColor='red';
                        document.getElementById("name").focus();
                        return false;
                    }
                    flag = true;
                    return true;
                }
                function selectProvider(){
                    var paramKQ = " ${request.contextPath}/client/selectProvider";
                    open(paramKQ,'title','resizable=no,width=900,height=600,scrollbars=yes');
                }

                function selectSendInfo(){
                    var paramKQ = " ${request.contextPath}/client/selectSendInfo";
                    open(paramKQ,'title','resizable=no,width=800,height=410,scrollbars=yes');
                }

                function selectReceiveInfo(){
                    var paramKQ = "${request.contextPath}/client/selectReceiveInfo";
                    open(paramKQ,'title','resizable=no,width=800,height=410,scrollbars=yes');
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
                var providerNum=0;
                var providerDelNum=0;
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

                    %{--objTable.rows.item(objTable.rows.length -1).id = "ptoBeDelRow"+providerNum;--}%
                    %{--objTable.rows.item(objTable.rows.length -1).insertCell(5);--}%
                    %{--objTable.rows[objTable.rows.length-1].cells[5].innerHTML="<TD><div align=left><a href=javascript:DeleteProvider("+providerNum+");>${message(code: 'd.del.label', default: 'delete')}</a></div></TD></TR>";--}%

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
                function DeleteProvider(rowIdx){
                    if(!confirm("Are you sure?")){
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
                }

                function setSendInfo(sendInfoStr){
                    var temp = sendInfoStr.split(",");
                    document.getElementById("sendInfoDiv").style.display="";
    //                setSendInfoTable(temp[0],temp[1],temp[2],temp[3],temp[4],temp[5],temp[6]);
                }

                var sendInfoNum=0;
                function setSendInfoTable(){  //set sendInfo
                    document.getElementById("sendInfoDiv").style.display="";
                    var objTable = document.getElementById("sendInfoTable");
                    objTable.insertRow(objTable.rows.length);
    //                var inx = (document.all.providerTavle.rows.length)-1;
                    sendInfoNum++;
                    objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+sendInfoNum;
                    objTable.rows.item(objTable.rows.length -1).insertCell(0);
                    objTable.rows[objTable.rows.length-1].cells[0].innerHTML="<TR><TD><div align=left><input style=width:90px type=text name=sname value= ><div></TD>";

                    objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+sendInfoNum;
                    objTable.rows.item(objTable.rows.length -1).insertCell(1);
                    objTable.rows[objTable.rows.length-1].cells[1].innerHTML="<TD><div align=left><select name=stype style=width:60px><option value=TCP>TCP</option><option value=SFTP>SFTP</option></select></div></TD>";

                    objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+sendInfoNum;
                    objTable.rows.item(objTable.rows.length -1).insertCell(2);
                    objTable.rows[objTable.rows.length-1].cells[2].innerHTML="<TD><div align=left><input style=width:100px type=text name=sip  value=><div></TD>";

                    objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+sendInfoNum;
                    objTable.rows.item(objTable.rows.length -1).insertCell(3);
                    objTable.rows[objTable.rows.length-1].cells[3].innerHTML="<TD><div align=left><input style=width:30px type=text name=sport  ><div></TD>";

                    objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+sendInfoNum;
                    objTable.rows.item(objTable.rows.length -1).insertCell(4);
                    objTable.rows[objTable.rows.length-1].cells[4].innerHTML="<TD><div align=left><input style=width:90px type=text name=suser value= ></div></TD>";

                    objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+sendInfoNum;
                    objTable.rows.item(objTable.rows.length -1).insertCell(5);
                    objTable.rows[objTable.rows.length-1].cells[5].innerHTML="<TD><div align=left><input style=width:90px type=password name=spassword value= ></div></TD>";

                    objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+sendInfoNum;
                    objTable.rows.item(objTable.rows.length -1).insertCell(6);
                    objTable.rows[objTable.rows.length-1].cells[6].innerHTML="<TD><div align=left><input style=width:90px type=text name=sother value= ></div></TD>";

                    objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+sendInfoNum;
                    objTable.rows.item(objTable.rows.length -1).insertCell(7);
                    objTable.rows[objTable.rows.length-1].cells[7].innerHTML="<TD><div align=left><select name=sactiveInd style=width:50px> <option value=false>false</option><option value=true>true</option></select></div></TD></TR>";

                    document.getElementById("sendInfoNum").value=sendInfoNum;
                }
                function DeleteSendInfo(rowIdx){
                    if(!confirm("Are you sure?")){
                        return;
                    }
                    var objTable = document.getElementById("sendInfoTable");
                    var objRow = document.getElementById("stoBeDelRow"+rowIdx);
                    objTable.deleteRow(objRow.rowIndex);
                    sendInfoNum--;
                    if(sendInfoNum==0){
                        document.getElementById("sendInfoDiv").style.display="none";
                    }
                    document.getElementById("sendInfoNum").value =sendInfoNum;
                }

                function setReceiveInfo(receiveInfoStr){
                    var temp = receiveInfoStr.split(",");
                    document.getElementById("receiveInfoDiv").style.display="";
    //                setReceiveInfoTable(temp[0],temp[1],temp[2],temp[3],temp[4],temp[5],temp[6]);
                }

                var receiveInfoNum=0;
                function setReceiveInfoTable(){  //set sendInfo
                    document.getElementById("receiveInfoDiv").style.display="";
                    var objTable = document.getElementById("receiveInfoTable");
                    objTable.insertRow(objTable.rows.length);
    //                var inx = (document.all.providerTavle.rows.length)-1;
                    receiveInfoNum++;
                    objTable.rows.item(objTable.rows.length -1).id = "rtoBeDelRow"+receiveInfoNum;
                    objTable.rows.item(objTable.rows.length -1).insertCell(0);
                    objTable.rows[objTable.rows.length-1].cells[0].innerHTML="<TR><TD><div align=left><input style=width:90px type=text name=rname value= ></div></TD></TR>";

                    objTable.rows.item(objTable.rows.length -1).id = "rtoBeDelRow"+receiveInfoNum;
                    objTable.rows.item(objTable.rows.length -1).insertCell(1);
                    objTable.rows[objTable.rows.length-1].cells[1].innerHTML="<TD><div align=left><select name=rtype style=width:50px><option value=TCP>TCP</option><option value=SFTP>SFTP</option></select><div></TD>";

                    objTable.rows.item(objTable.rows.length -1).id = "rtoBeDelRow"+receiveInfoNum;
                    objTable.rows.item(objTable.rows.length -1).insertCell(2);
                    objTable.rows[objTable.rows.length-1].cells[2].innerHTML="<TD><div align=left><input style=width:100px type=text name=rip  value= ><div></TD>";

                    objTable.rows.item(objTable.rows.length -1).id = "rtoBeDelRow"+receiveInfoNum;
                    objTable.rows.item(objTable.rows.length -1).insertCell(3);
                    objTable.rows[objTable.rows.length-1].cells[3].innerHTML="<TD><div align=left><input style=width:30px type=text name=rport  value= ><div></TD>";

                    objTable.rows.item(objTable.rows.length -1).id = "rtoBeDelRow"+receiveInfoNum;
                    objTable.rows.item(objTable.rows.length -1).insertCell(4);
                    objTable.rows[objTable.rows.length-1].cells[4].innerHTML="<TD><div align=left><input style=width:90px type=text name=ruser value= ></div></TD>";

                    objTable.rows.item(objTable.rows.length -1).id = "rtoBeDelRow"+receiveInfoNum;
                    objTable.rows.item(objTable.rows.length -1).insertCell(5);
                    objTable.rows[objTable.rows.length-1].cells[5].innerHTML="<TD><div align=left><input style=width:90px type=password name=rpassword value= ></div></TD>";

                    objTable.rows.item(objTable.rows.length -1).id = "rtoBeDelRow"+receiveInfoNum;
                    objTable.rows.item(objTable.rows.length -1).insertCell(6);
                    objTable.rows[objTable.rows.length-1].cells[6].innerHTML="<TD><div align=left><input style=width:90px type=text name=rother value= ></div></TD>";

                    objTable.rows.item(objTable.rows.length -1).id = "rtoBeDelRow"+receiveInfoNum;
                    objTable.rows.item(objTable.rows.length -1).insertCell(7);
                    objTable.rows[objTable.rows.length-1].cells[7].innerHTML="<TD><div align=left><select name=ractiveInd style=width:50px><option value=false>false</option><option value=true>true</option></select></div></TD>";

                    document.getElementById("receiveInfoNum").value=receiveInfoNum;
                }
                function DeleteReceiveInfo(rowIdx){
                    if(!confirm("Are you sure?")){
                        return;
                    }
                    var objTable = document.getElementById("receiveInfoTable");
                    var objRow = document.getElementById("rtoBeDelRow"+rowIdx);
                    objTable.deleteRow(objRow.rowIndex);
                    receiveInfoNum--;
                    if(receiveInfoNum==0){
                            document.getElementById("receiveInfoDiv").style.display="none";
                    }
                    document.getElementById("receiveInfoNum").value =receiveInfoNum;
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
                if(rowNum>0){
                    for (var i=0;i<rowNum;i++)
                    {
                        rowNum=rowNum-1;
                        i=i-1;
                        stateMLN--;
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

            var stateMLN = 0;
            var stateMLNDel = 0;
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
                objTable.rows[objTable.rows.length-1].cells[1].innerHTML="<TD><div align=left><input type=text name=MLN size=12 value=''> <div></TD>";

                objTable.rows.item(objTable.rows.length -1).id = "toBeDelRow"+stateMLNDel;
                objTable.rows.item(objTable.rows.length -1).insertCell(2);
                objTable.rows[objTable.rows.length-1].cells[2].innerHTML="<TD><div align=left><a href=javascript:deleteMLN("+stateMLNDel+");>${message(code: 'd.del.label', default: 'delete')}</a></div></TD></TR>";

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

            function saveProvider() {
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
                if(NPI.value==""){
                    alert("NPI can is null");
                    NPI.style.borderColor='red';
                    NPI.focus();
                    return false;
                }else{
                    NPI.style.borderColor='';
                }
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
                        providerType:providerType.value,NPI:NPI.value,DEA:DEA.value,prefix:prefix.value,DOB:DOB.value,SSN:SSN.value,UPIN:UPIN.value,
                status:status.value,MLN:MLNArray,state:stateArray
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
        </script>

    </head>
    <body>
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
    <hr>

    <div class="container-fluid span10">
    <div class="row-fluid">
        <div class="span3">
            <div class="well sidebar-nav">
                <ul class="nav nav-list">
                    <li class="nav-header">Option</li>
                    <li class="active"><g:link  action="list"><i class="icon-home"></i><g:message code="default.list.label" args="[entityName]" /></g:link>
                    <li class="active"><a href=# onclick="createProvider();"><i class="icon-plus"></i>New Provider</a>
                </ul>
            </div>
        </div>
    <g:if test="${flash.message}">
        <div class="message span9" style="color: red">${flash.message}</div>
    </g:if>
    <div class="span9" >
        <g:form action="save"  class="form-horizontal">
            <g:hiddenField name="providerNum"  id="providerNum" value="0"></g:hiddenField>
            <g:hiddenField name="sendInfoNum"  id="sendInfoNum" value="0"></g:hiddenField>
            <g:hiddenField name="receiveInfoNum"  id="receiveInfoNum" value="0"></g:hiddenField>
            <g:hiddenField name="tempType"  id="tempType" value=""></g:hiddenField>
            <g:hiddenField name="str"  id="str" value=""></g:hiddenField>
            <div class="well ">

                <div class="control-group">
                    <label class="control-label" for="name"><g:message code="facility.name.label" default="Name" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" name="name" maxlength="128" value="${clientData?.name}" /><span class="help-inline">Required</span>
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
                    <hr>
                    <div>
                        <font size="3" color="#279745" style="margin: 0 142px 0 0"><g:message  code="provider.message.lable" /></font>
                        <a href="javascript:selectProvider();" style="margin:0 0 0 0 "><img src="${request.contextPath}/images/add.jpg">Select</a>
                    </div>

                    <div id="providerDiv" style="display: none">
                        <table id="providerTable" class="table table-condensed table-striped">
                            <th>${message(code: 'provider.NPI.label', default: 'NPI')}</th>

                            <th>${message(code: 'provider.name.label', default: 'Provider Name')}</th>

                            <th>${message(code: 'provider.clientProvider.label', default: 'Client Provider Id')} </th>

                            <th>${message(code: 'provider.status.label', default: 'Status')} </th>

                            <th>${message(code: 'provider.activeInd.label', default: 'Active')} </th>

                            %{--<th>Delete</th>--}%
                        </table>
                    </div>
                </div>
                <hr>
                <div class="offset3">
                    <g:submitButton name="create"  class="btn btn-primary" onclick="return checkForm();" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                    <g:actionSubmit value="Cancel" name="cancel" action="list" class="btn"></g:actionSubmit>

                </div>
            </div>
            </div>
        </g:form>
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
                <div class="control-group">

                    <div class="controls">

                    </div>
                </div>
                <tr>
                    <td><label  class="control-label" for="client_NPI"><g:message code="provider.NPI.label" default="NPI" /></label></td>
                    <td><g:textField name="client_NPI" value="${providerData?.NPI}" /><span class="help-inline">Required</span></td>
                </tr>
                <tr>
                    <td>  <label  class="control-label" for="client_DEA"><g:message code="provider.DEA.label" default="DEA" /></label></td>
                    <td>  <g:textField name="client_DEA" value="${providerData?.DEA}" maxlength="128"/></td>
                </tr>
                <tr>
                    <td>  <label  class="control-label" for="prefix"><g:message code="provider.prefix.label" default="Prefix" /></label></td>
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
    </div>


    </body>
</html>
