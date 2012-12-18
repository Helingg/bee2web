<%--
  Created by IntelliJ IDEA.
  User: HLG
  Date: 12-3-23
  Time: 上午11:12
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>Select Provider</title>
    <g:set var="entityName" value="${message(code: 'provider.label', default: 'Provider')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'divbk.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'bootstrap.css')}" />

    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <meta name="layout" content="" />
<link rel="stylesheet" type="text/css" href="${resource(dir:'js/themes/default',file:'easyui.css')}">
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery-1.7.2.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery.easyui.min.js')}"></script>
    <script type="text/javascript">
        function closeWindow(){
            top.close();
        }
        function reFacility(){
           var name = document.getElementById("name").value;
            if(name==""||name==null){
                alert("The Facility Name can not be blank!")
                document.getElementById("name").focus();
                return;
            }
        }
        var providerString="";
        function reProvider(){
            var pid = document.getElementsByName("pid");
            var NPI = document.getElementsByName("NPI");
            var firstName = document.getElementsByName("firstName");
            var lastName = document.getElementsByName("lastName");
            var middleName = document.getElementsByName("middleName");
            var dateCreated = document.getElementsByName("dateCreated");
            var len =pid.length;
            if(len>0) {
                for(var i=0;i<len;i++){
                    if(pid[i].checked) {
                        providerString = providerString + NPI[i].value + ":" + firstName[i].value +":"+ lastName[i].value +":"+middleName[i].value+":"+pid[i].value+ ",";
                    }
                }
            }
            parent.window.opener.setProviderInfo(providerString);
            top.close();
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
        var stateMLN = 0;
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
            objTable.rows[objTable.rows.length-1].cells[2].innerHTML="<TD><div align=left><input type=text name=MLN size=12 value='' class=text_h> <div></TD>";

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
            var providerTypeArray = "";
            　
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
                    providerTypeArray =  providerTypeArray + mlnProviderType[i].value+",";
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
                    providerType:providerType.value,NPI:NPI.value,NPI1:NPI1.value,NPI2:NPI2.value,DEA:DEA.value,prefix:prefix.value,DOB:DOB.value,SSN:SSN.value,UPIN:UPIN.value,
                    status:status.value,MLN:MLNArray,state:stateArray,providerTypeArray:providerTypeArray.value
                },
                success:function(msg){
                    if(msg.msg){
                        alert(msg.msg)
                    }else{
                        closeProvider();
                        window.location.reload();
                    }
                }
            })
            return true;
        }

    </script>
</head>
<body>
<h1><g:message code="default.list.label" args="[entityName]" /></h1>
<hr>
    <div class="container-fluid span10">
    <div class="span12 divbk">
    <g:link onclick="closeWindow();"><i class="icon-remove"></i><g:message code="default.close.label" args="[entityName]" /></g:link>
    <a href="#" onclick="createProvider();"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></a>
    </div>
    <g:if test="${flash.message}">
        <div class="message span12" style="color: red">${flash.message}</div>
    </g:if>
    <div class="span12">
        <g:form method="post"  class="form-horizontal" >
        <div class="well">
            <div class="control-group">
                <label class="control-label"  ><g:message code="provider.firstName.label" default="First Name" /></label>
                <div class="controls">
                    <g:textField class="input-xlarge focused" style="height:30px" name="firstName1" maxlength="128" value="${params?.firstName1}" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label"  ><g:message code="provider.lastName.label" default="Last name" /></label>
                <div class="controls">
                    <g:textField class="input-xlarge focused" style="height:30px" name="lastName1" maxlength="128" value="${params?.lastName1}" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" ><g:message code="provider.middleName.label" default="Middle Name" /></label>
                <div class="controls">
                    <g:textField class="input-xlarge focused" style="height:30px" name="middleName1" maxlength="128" value="${params?.middleName1}" />
                </div>
            </div>

            <br>
            <div class="control offset4">
                <g:actionSubmit class="btn btn-primary" action="selectProvider" value="${message(code: 'default.button.search.label', default: 'Search')}" />
            </div>

            <br>
            <div>
                <table class="table table-condensed table-striped">
                    <thead>
                    <tr>

                        <th>${message(code: 'provider.choose.label', default: 'Choose')}</th>

                        <th>${message(code: 'provider.NPI.label', default: 'NPI')} </th>

                        <th>${message(code: 'provider.firstName.label', default: 'First Name')} </th>

                        <th>${message(code: 'provider.lastName.label', default: 'Last Name')} </th>

                        <th>${message(code: 'provider.middleName.label', default: 'Middle Name')} </th>


                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${providerDataList}" status="i" var="providerData">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td class="conent"><g:checkBox  name="pid" id="pid"  value="${providerData.id}" checked="false"></g:checkBox> </td>

                            <td><g:hiddenField name="NPI" id="NPI" value="${providerData.NPI}"/>${providerData.NPI}</td>

                            <td><g:hiddenField name="firstName" id="firstName"  value="${providerData.firstName}"/>${providerData.firstName}</td>

                            <td><g:hiddenField name="lastName" id="lastName"  value="${providerData.lastName}"/>${providerData.lastName}</td>

                            <td><g:hiddenField name="middleName" id="middleName"  value="${providerData.middleName}"/>${providerData.middleName}</td>


                        </tr>
                    </g:each>
                    </tbody>
                </table>
                <div class="pager">
                    <g:paginate action="selectProvider" params="[params:params]" total="${providerDataTotal}" />
                </div>
            </div>
            <div class="control offset4">
                <span class="menuButton"><a class="btn btn-primary" class="save" href="javascript:reProvider();">${message(code: 'default.button.ok.label', default: 'OK')}</a></span>
            </div>
        </div>
        </g:form>
    </div>
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
            <td><g:textField name="client_lastName" value="${providerData?.lastName}" class="text_h"/><span class="help-inline">Required</span></td>
        </tr>

        <tr>
            <td>   <label  class="control-label" for="client_firstName"><g:message code="provider.firstName.label" default="First Name" /></label></td>
            <td> <g:textField name="client_firstName" value="${providerData?.firstName}" class="text_h"/><span class="help-inline">Required</span></td>
        </tr>
        <tr>
            <td><label  class="control-label" for="client_middleName"><g:message code="provider.middleName.label" default="Middle Name" /></label></td>
            <td><g:textField name="client_middleName" value="${providerData?.middleName}" class="text_h" /></td>
        </tr>
        <tr>
            <td> <label  class="control-label" for="client_providerType"><g:message code="provider.providerType.label" default="Provider Type" /></label></td>
            <td>  <g:select name="client_providerType" from="${com.bssi.ProviderType.list()}" ></g:select></td>
        </tr>

        <tr>
            <td><label  class="control-label" for="client_NPI"><g:message code="provider.NPI.label" default="NPI"  /></label></td>
            <td><g:textField name="client_NPI" value="${providerData?.NPI}" class="text_h"/></td>
        </tr>
        <tr>
            <td><label  class="control-label" for="client_NPI1"><g:message code="provider.NPI1.label" default="NPI1"  /></label></td>
            <td><g:textField name="client_NPI1" value="${providerData?.NPI1}" class="text_h"/></td>
        </tr>
        <tr>
            <td><label  class="control-label" for="client_NPI2"><g:message code="provider.NPI2.label" default="NPI2"  /></label></td>
            <td><g:textField name="client_NPI2" value="${providerData?.NPI2}" class="text_h"/></td>
        </tr>
        <tr>
            <td>  <label  class="control-label" for="client_DEA"><g:message code="provider.DEA.label" default="DEA"  /></label></td>
            <td>  <g:textField name="client_DEA" value="${providerData?.DEA}" maxlength="128" class="text_h"/></td>
        </tr>
        <tr>
            <td>  <label  class="control-label" for="client_prefix"><g:message code="provider.prefix.label" default="Prefix"  /></label></td>
            <td> <g:textField name="client_prefix" value="${providerData?.prefix}" class="text_h"/></td>
        </tr>
        <tr>
            <td> <label  class="control-label" for="client_suffix"><g:message code="provider.suffix.label" default="Suffix"  /></label></td>
            <td>  <g:textField name="client_suffix" value="${providerData?.suffix}" class="text_h"/></td>
        </tr>
        <tr>
            <td><label  class="control-label" for="client_DOB"><g:message code="provider.DOB.label" default="DOB" /></label></td>
            <td><g:textField name="client_DOB" value="${providerData?.DOB}" class="text_h"/></td>
        </tr>
        <tr>
            <td>  <label  class="control-label" for="client_SSN"><g:message code="provider.SSN.label" default="SSN" /></label></td>
            <td> <g:textField name="client_SSN" value="${providerData?.SSN}" class="text_h"/></td>
        </tr>
        <tr>
            <td>  <label  class="control-label" for="client_UPIN"><g:message code="provider.UPIN.label" default="UPIN" /></label></td>
            <td> <g:textField name="client_UPIN" value="${providerData?.UPIN}" class="text_h"/></td>
        </tr>
        <tr>
            <td><label  class="control-label" for="client_status"><g:message code="provider.status.label" default="Status" /></label></td>
            <td> <g:select name="client_status" from="${com.bssi.Provider.constraints.status.inList}" value="${providerData?.status}"  /><span class="help-inline">Required</span></td>
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