

<%@ page import="com.bssi.ClientProvider" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'clientProvider.label', default: 'Client Provider')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>

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

            var clientNum=${clientDataTotal};
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

            function DeleteClient(rowIdx){
                if(!confirm("Are you sure?")){
                    return;
                }
                var objTable = document.getElementById("clientTable");
                var objRow = document.getElementById("stoBeDelRow"+rowIdx);
                objTable.deleteRow(objRow.rowIndex);
                clientNum--;
                if(clientNum==0){
                    document.getElementById("clientDiv").style.display="none";
                }
                document.getElementById("clientNum").value =clientNum;
            }

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

            var providerNum=${providerInstanceTotal};
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

        </script>
    </head>
    <body>        

        <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
        <hr>

        %{--<g:hasErrors bean="${clientProviderData}">--}%
            %{--<div class="errors">--}%
                %{--<g:renderErrors bean="${clientProviderData}" as="list" />--}%
            %{--</div>--}%
        %{--</g:hasErrors>--}%

        <div class="container-fluid span10">
        <div class="row-fluid">
            <div class="span3">
                <div class="well sidebar-nav">
                    <ul class="nav nav-list">
                        <li class="nav-header">Option</li>
                        <li class="active"><g:link  action="list"><i class="icon-home"></i><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                        <li class="active"><g:link   action="create"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></g:link>
                    </ul>
                </div>
            </div>

        <div class="span9" >
          <g:if test="${flash.message}">
            <div class="message span9" style="color: red">${flash.message}</div>
        </g:if>
            <g:form method="post" class="form-horizontal">
                <g:hiddenField name="id" value="${clientProviderData?.id}" />
                <g:hiddenField name="version" value="${clientProviderData?.version}" />
                <g:hiddenField name="providerNum" value="${providerInstanceTotal}"></g:hiddenField>
                <g:hiddenField name="clientNum" value="${clientDataTotal}"></g:hiddenField>
                <div class="well span9">
                    <div class="control-group">
                        <label class="control-label" for="status"><g:message code="clientProvider.status.label" default="Status" /></label>
                        <div class="controls">
                            <g:select class="input-xlarge focused" name="status" from="${['Status1','Status2']}" value="${clientProviderData?.status}" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="activeInd" class="control-label"><g:message code="client.activeInd.label" default="Enabled" /></label>
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

                        <div id="clientDiv" >
                            <table id="clientTable" class="table table-condensed table-striped">
                                <th>${message(code: 'client.name.label', default: 'Name')}</th>

                                <th>${message(code: 'client.alias.label', default: 'Alias')}</th>


                                <th>${message(code: 'client.activeInd.label', default: 'Enabled')}</th>

                                %{--<th>Delete</th>--}%
                                <tbody>

                                <g:each in="${clientDataList}" status="i" var="clientData">
                                    <tr id="stoBeDelRow<%=i+1%>">
                                        <td>${clientData.name}<g:hiddenField name="client" value="${clientData.id}"></g:hiddenField></td>
                                        <td>${clientData.alias}</td>
                                        <td>${clientData.activeInd}</td>
                                        %{--<td><a href="javascript:ExistDeleteClientRow(<%=i+1%>,${clientData.id});">${message(code: 'd.del.label', default: 'delete')}</a></td>--}%
                                    </tr>
                                </g:each>

                                </tbody>
                            </table>
                        </div>
                        <hr>
                        <div>
                            <font size="3" color="#279745" style="margin: 0 142px 0 0"><g:message  code="provider.message.lable" /></font>
                            <a href="javascript:selectProvider();" style="margin:0 0 0 0 "><img src="${request.contextPath}/images/add.jpg">Select</a>
                        </div>

                        <div id="providerDiv" >
                            <table id="providerTable" class="table table-condensed table-striped">
                                <th>${message(code: 'provider.NPI.label', default: 'NPI')}</th>

                                <th>${message(code: 'provider.firstName.label', default: 'First Name')}</th>

                                <th>${message(code: 'provider.lastName.label', default: 'Last Name')}</th>

                                <th>${message(code: 'provider.middleName.label', default: 'Middle Name')}</th>

                                <th>${message(code: 'clientProvider.clientProviderId.label', default: 'Client Provider Id')}</th>

                                %{--<th>Delete</th>--}%
                                <tbody>
                                <g:each in="${providerInstanceList}" status="i" var="providerInstance">
                                    <tr id="ptoBeDelRow<%=i+1%>">
                                        <td>${providerInstance[1]}<g:hiddenField name="provider" value="${providerInstance[0]}"></g:hiddenField></td>
                                        <td>${providerInstance[2]}</td>
                                        <td>${providerInstance[3]}</td>
                                        <td>${providerInstance[4]}</td>
                                        <td><g:textField name="clientProvider" value="${providerInstance[5]}"></g:textField></td>
                                        %{--<td><a href="javascript:ExistDeleteProviderRow(<%=i+1%>,${providerInstance[0]});">${message(code: 'd.del.label', default: 'delete')}</a></td>--}%
                                    </tr>
                                </g:each>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <hr>
                    <div class="offset3">

                        <g:actionSubmit name="update"  class="btn btn-primary" action="update" onclick="return checkForm();" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                        <span class="button"><g:actionSubmit  class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                        <g:actionSubmit value="Cancel" name="cancel" action="list" class="btn"></g:actionSubmit>
                        <span class="button"><g:submitButton name="createMany" style="display: none" class="save" onclick="return checkForm1();"  value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>

                    </div>
                </div>
                </div>

                </div>
            </g:form>
        </div>

    </body>
</html>
