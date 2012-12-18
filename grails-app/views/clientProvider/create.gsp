

<%@ page import="com.bssi.ClientProvider" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
        <g:set var="entityName" value="${message(code: 'clientProvider.label', default: 'Client Provider')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <script type="text/javascript">
            function checkForm(){
                var clientProvider = document.getElementsByName('clientProvider');
                var client = document.getElementsByName('client');
                var provider = document.getElementsByName('provider');
                if(client.length==0){
                    alert("Please select Client!");
                    selectClient();
                    return false;
                }
                if(provider.length==0){
                    alert("Please select Provider!");
                    selectProvider();
                    return false;
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
            function selectClient(){
                var paramKQ = " ${request.contextPath}/provider/selectClient1";
                open(paramKQ,'title','resizable=no,width=800,height=600,scrollbars=yes');
            }

            var clientNum=0;
            function setClientTable(name,alias,activeInd,client){  //set provider
                var objTable = document.getElementById("clientTable");
                objTable.insertRow(objTable.rows.length);
//                var inx = (document.all.providerTavle.rows.length)-1;
                clientNum++;
                objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+clientNum;
                objTable.rows.item(objTable.rows.length -1).insertCell(0);
                objTable.rows[objTable.rows.length-1].cells[0].innerHTML="<TR><TD><div align=left>"+name+"<input type=hidden name=name size=12 value="+name+"> <input type=hidden name=client id=client size=12 value="+client+" ><div></TD>";

                objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+clientNum;
                objTable.rows.item(objTable.rows.length -1).insertCell(1);
                objTable.rows[objTable.rows.length-1].cells[1].innerHTML="<TD><div align=left>"+alias+"<input type=hidden name=alias size=12 value="+alias+" ><div></TD>";

                objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+clientNum;
                objTable.rows.item(objTable.rows.length -1).insertCell(2);
                objTable.rows[objTable.rows.length-1].cells[2].innerHTML="<TD><div align=left>"+activeInd+"<input type=hidden name=activeInd size=12 value="+activeInd+" ><div></TD>";

                %{--objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+clientNum;--}%
                %{--objTable.rows.item(objTable.rows.length -1).insertCell(3);--}%
                %{--objTable.rows[objTable.rows.length-1].cells[3].innerHTML="<TD><div align=left><a href=javascript:DeleteClient("+clientNum+");>${message(code: 'd.del.label', default: 'delete')}</a></div></TD></TR>";--}%

                document.getElementById("clientNum").value=clientNum;
            }

//            function DeleteClient(rowIdx){
//                if(!confirm("Are you sure?")){
//                    return;
//                }
//                var objTable = document.getElementById("clientTable");
//                var objRow = document.getElementById("stoBeDelRow"+rowIdx);
//                objTable.deleteRow(objRow.rowIndex);
//                clientNum--;
//                if(clientNum==0){
//                    document.getElementById("clientDiv").style.display="none";
//                }
//                document.getElementById("clientNum").value =clientNum;
//            }

            function setClientInfo(cid,name,alias,activeInd){
                document.getElementById("clientDiv").style.display="";
                var objTable = document.getElementById("clientTable");
                var objRow = document.getElementById("stoBeDelRow"+1);
                if(objRow) {
                    objTable.deleteRow(objRow.rowIndex);
                    clientNum--;
                }
                setClientTable(name,alias,activeInd,cid);
            }

            function selectProvider(){
                var paramKQ = " ${request.contextPath}/client/selectProviderSingle";
                open(paramKQ,'title','resizable=no,width=800,height=410,scrollbars=yes');
            }

            function setProviderInfo(providerString){
                document.getElementById("providerDiv").style.display="";
                var providerExist = document.getElementsByName('provider');
                var flag = true;
                if(providerString!=""||providerString!=null) {
                    var objTable = document.getElementById("providerTable");
                    var objRow = document.getElementById("ptoBeDelRow"+1);
                    if(objRow) {
                        objTable.deleteRow(objRow.rowIndex);
                        providerNum--;
                    }
                    var temp1 = providerString.split(",");
                    setProviderTable(temp1[0],temp1[1],temp1[2],temp1[3],temp1[4]);


                }
            }

            var providerNum=0;
            function setProviderTable(NPI,firstName,lastName, middleName,provider){  //set provider
                var objTable = document.getElementById("providerTable");
                objTable.insertRow(objTable.rows.length);
//                var inx = (document.all.providerTavle.rows.length)-1;
                providerNum++;
                objTable.rows.item(objTable.rows.length -1).id = "ptoBeDelRow"+providerNum;
                objTable.rows.item(objTable.rows.length -1).insertCell(0);
                objTable.rows[objTable.rows.length-1].cells[0].innerHTML="<TR><TD><div align=left>"+NPI+"<input type=hidden name=NPI size=12 value="+NPI+"> <input type=hidden name=provider size=12 value="+provider+" ><div></TD>";

                objTable.rows.item(objTable.rows.length -1).id = "ptoBeDelRow"+providerNum;
                objTable.rows.item(objTable.rows.length -1).insertCell(1);
                objTable.rows[objTable.rows.length-1].cells[1].innerHTML="<TD><div align=left>"+firstName+"<input type=hidden name=firstName size=12 value="+firstName+" ><div></TD>";

                objTable.rows.item(objTable.rows.length -1).id = "ptoBeDelRow"+providerNum;
                objTable.rows.item(objTable.rows.length -1).insertCell(2);
                objTable.rows[objTable.rows.length-1].cells[2].innerHTML="<TD><div align=left>"+lastName+"<input type=hidden name=lastName size=12 value="+lastName+" ><div></TD>";

                objTable.rows.item(objTable.rows.length -1).id = "ptoBeDelRow"+providerNum;
                objTable.rows.item(objTable.rows.length -1).insertCell(3);
                objTable.rows[objTable.rows.length-1].cells[3].innerHTML="<TD><div align=left>"+middleName+"<input type=hidden name=middleName value="+middleName+" ></div></TD>";

                objTable.rows.item(objTable.rows.length -1).id = "ptoBeDelRow"+providerNum;
                objTable.rows.item(objTable.rows.length -1).insertCell(4);
                objTable.rows[objTable.rows.length-1].cells[4].innerHTML="<TD><div align=left><input type=text name=clientProvider value='' ></div></TD>";

                %{--objTable.rows.item(objTable.rows.length -1).id = "ptoBeDelRow"+providerNum;--}%
                %{--objTable.rows.item(objTable.rows.length -1).insertCell(5);--}%
                %{--objTable.rows[objTable.rows.length-1].cells[5].innerHTML="<TD><div align=left><a href=javascript:DeleteProvider("+providerNum+");>${message(code: 'd.del.label', default: 'delete')}</a></div></TD></TR>";--}%

                document.getElementById("providerNum").value=providerNum;
            }


        </script>
    </head>
    <body>        
        <h1><g:message code="default.create.label" args="[entityName]" /></h1>
        <hr>
        %{--<g:if test="${flash.message}">--}%
            %{--<div class="message span10 offset9" style="color: red">${flash.message}</div>--}%
        %{--</g:if>--}%
        %{--<g:hasErrors bean="${clientProviderData}">--}%
            %{--<div class="errors">--}%
                %{--<g:renderErrors bean="${clientProviderData}" as="list" />--}%
            %{--</div>--}%
        %{--</g:hasErrors>--}%

        <div class="container-fluid span10">
            <div class="span12 divbk">
                <g:link  action="list"><i class="icon-list"></i><g:message code="default.list.label" args="[entityName]" /></g:link>
                <g:link   action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link>
            </div>
    <g:if test="${flash.message}">
        <div class="message span12" style="color: red">${flash.message}</div>
    </g:if>
        <div class="span12" >

            <g:form action="save"  class="form-horizontal">
                <g:hiddenField name="providerNum" value="0"></g:hiddenField>
                <g:hiddenField name="clientNum" value="0"></g:hiddenField>
                <div class="well">
                    <div class="control-group">
                        <label class="control-label" for="status"><g:message code="clientProvider.status.label" default="Status" /></label>
                        <div class="controls">
                            <g:select class="input-xlarge focused" name="status" from="${['Status1','Status2']}" value="${clientProviderData?.status}" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="activeInd" class="control-label"><g:message code="client.activeInd.label" default="Active" /></label>
                        <div class="controls">
                            <g:checkBox name="activeInd" value="${clientProviderData?.activeInd}"></g:checkBox>
                        </div>
                    </div>

                    <div >
                        <hr>
                        <div>
                            <font size="3" color="#279745" style="margin: 0 160px 0 0"><g:message  code="client.message.lable" /></font>
                            <a href="javascript:selectClient();" style="margin:0 0 0 0 "><img src="${request.contextPath}/images/add.jpg">Select</a>
                        </div>

                        <div id="clientDiv" style="display: none">
                            <table id="clientTable" class="table table-condensed table-striped">
                                <th>${message(code: 'client.name.label', default: 'Name')}</th>

                                <th>${message(code: 'client.alias.label', default: 'Alias')}</th>


                                <th>${message(code: 'client.activeInd.label', default: 'Enabled')}</th>

                            </table>
                        </div>
                        <hr>
                        <div>
                            <font size="3" color="#279745" style="margin: 0 142px 0 0"><g:message  code="provider.message.lable" /></font>
                            <a href="javascript:selectProvider();" style="margin:0 0 0 0 "><img src="${request.contextPath}/images/add.jpg">Select</a>
                        </div>

                        <div id="providerDiv" style="display: none">
                            <table id="providerTable" class="table table-condensed table-striped">
                                <th>${message(code: 'provider.NPI.label', default: 'NPI')}</th>

                                <th>${message(code: 'provider.firstName.label', default: 'First Name')}</th>

                                <th>${message(code: 'provider.lastName.label', default: 'Last Name')}</th>

                                <th>${message(code: 'provider.middleName.label', default: 'Middle Name')}</th>

                                <th>${message(code: 'clientProvider.clientProviderId.label', default: 'Client Provider Id')}</th>

                            </table>
                        </div>
                    </div>
                    <hr>
                    <div class="offset3">
                        <g:submitButton name="create"  class="btn btn-primary" onclick="return checkForm();" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                        <g:actionSubmit value="Cancel" name="cancel" action="list" class="btn"></g:actionSubmit>
                        <span class="button"><g:submitButton name="createMany" style="display: none" class="save" onclick="return checkForm1();"  value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>

                    </div>
                </div>
                </div>
                </div>
            </g:form>
    </body>
</html>
