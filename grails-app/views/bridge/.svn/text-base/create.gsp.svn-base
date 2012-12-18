

<%@ page import="com.bssi.Bridge" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName" value="${message(code: 'bridge.label', default: 'Bridge')}" />
<link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
<title><g:message code="default.create.label" args="[entityName]" /></title>
<script src="${resource(dir:'js/dateTime',file:'jquery.dynDateTime.js')}"></script>
<script src="${resource(dir:'js/dateTime/lang',file:'calendar-en.js')}"></script>
<link rel="stylesheet" type="text/css" media="all" href="${resource(dir:'js/dateTime/css',file:'calendar-win2k-cold-1.css')}" />

<script type="text/javascript">

    $(function() {
        $("#dateStarted1").dynDateTime({
            showsTime: true,
            ifFormat: "%m-%d-%Y %H:%M",
            electric: false,
            singleClick: false
        });
        $("#dateEnded1").dynDateTime({
            showsTime: true,
            ifFormat: "%m-%d-%Y %H:%M",
            electric: false,
            singleClick: false
        });
//        $("#dateStarted1").dynDateTime();
//        $("#dateEnded1").dynDateTime();
//        var dateStartedF = document.getElementById("dateStarted1");
//        var dateEndedF = document.getElementById("dateEnded1");
//        if(dateStartedF.value){
//            var date = dateStartedF.value;
//            var dateArray = date.split(" ");
//            var dateDay = dateArray[0];
//            var dateF =  new Date(dateDay).format("MM-dd-yyyy hh:mm");
//            dateStartedF.value=dateF
//        }
//        if(dateEndedF.value){
//            var date = dateEndedF.value;
//            var dateArray = date.split(" ");
//            var dateDay = dateArray[0];
//            var dateF =  new Date(dateDay).format("MM-dd-yyyy hh:mm");
//            dateEndedF.value=dateF
//        }

    });

    function checkForm(){
        if(portRepeatFlag==-1){
            alert("Source Port is already exist");
            return false;
        }
        var sfalsenum = 0;
        var rtruenum = 0;
        var rfalsenum = 0;
        var dateStarted = document.getElementById('dateStarted1');
        var dateEnded = document.getElementById('dateEnded1');



        var checkip =/^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/;
        var checknum=/^[0-9]{1,20}$/;

        var sip = document.getElementsByName("sip");
        var sport = document.getElementsByName("sport");
        var suser = document.getElementsByName("suser");
        var spassword = document.getElementsByName("spassword");
        var sactiveInd = document.getElementsByName("sactiveInd");
        var stype = document.getElementsByName("stype");
        var sname = document.getElementsByName("sname");
        var sruleGroup = document.getElementsByName("sruleGroup");
        var senderClient = document.getElementsByName("ssenderClient");
        var recipientClient = document.getElementsByName("rrecipientClient");

        var rip = document.getElementsByName("rip");
        var rport = document.getElementsByName("rport");
        var ruser = document.getElementsByName("ruser");
        var rpassword = document.getElementsByName("rpassword");
        var ractiveInd = document.getElementsByName("ractiveInd");
        var rtype =  document.getElementsByName("rtype");
        var rname =  document.getElementsByName("rname");
        var bridgeName =  document.getElementById("bridgeName");

        if(bridgeNameRepeat==-1){
            alert("Bridge Name "+bridgeName.value+" is already exist");
            bridgeName.style.borderColor='red';
            return false;
        }
        if(bridgeName.value==""){
            alert("Bridge Name is null");
            bridgeName.style.borderColor='red';
            bridgeName.focus();
            return false;
        }
        if(dateStarted.value==null||dateStarted.value==""){
            alert("Date Started is null!");
            dateStarted.style.borderColor='red';
            dateStarted.focus();
            return false;
        }
        if(dateEnded.value==null||dateEnded.value==""){
            alert("Date Ended is null!");
            dateEnded.style.borderColor='red';
            dateEnded.focus();
            return false;
        }
        if (dateStarted.value>dateEnded.value){
            alert('Date Start can not be bigger than Date Ended!');
            return false;
        }


        if(rip.length>0){
            for(var i=0;i<rip.length;i++){
                if(rtype[i][2].selected==true){
                    alert("This Local is not perfect,We cannot use it")
                    return false;
                }
                if(rip[i].value==""||rip[i].value==null){
                    alert("Ip Address is null!");
                    rip[i].style.borderColor='red';
                    rip[i].focus();
                    return false;
                }

                for(var j=i+1;j<rip.length;j++){
                    if(rname[i].value&&rname[j].value){
                        if(rname[i].value==rname[j].value){
                            alert("Sender name can not be same! ");
                            rname[i].style.borderColor='red';
                            rname[j].style.borderColor='red';
                            rname[i].focus();
                            return false;
                            break;
                        }
                    }
                    if(rip[i].value&&rip[j].value){
                        if(rip[i].value==rip[j].value){
                            alert("Sender Ip Address can not be same! ");
                            rip[i].style.borderColor='red';
                            rip[j].style.borderColor='red';
                            rip[i].focus();
                            return false;
                            break;
                        }
                    }

                    if(rport[i].value&&rport[j].value){
                        if(rport[i].value==rport[j].value){
                            alert("Sender port can not be same! ");
                            rport[i].style.borderColor='red';
                            rport[j].style.borderColor='red';
                            rport[i].focus();
                            return false;
                            break;
                        }
                    }
                }
                if(!checkip.exec(rip[i].value)){
                    alert("Ip Address format is wrong! ");
                    rip[i].style.borderColor='red';
                    rip[i].focus();
                    return false;
                }
                if(rport[i].value==""||rport[i].value==null){
                    alert("Port is null!");
                    rport[i].style.borderColor='red';
                    rport[i].focus();
                    return false;
                }
                if(!checknum.exec(rport[i].value)) {
                    alert("Port must be a number!");
                    rport[i].style.borderColor='red';
                    rport[i].focus();
                    return false;
                }
                if(rtype[i][0].selected) {
                    if(ruser[i].value!=""||rpassword[i].value!=""){
                        ruser[i].value="";
                        rpassword[i].value="";
                        alert("TCP does not need user and password!");
                        return false;
                    }

                }else{
                    if(ruser[i].value==""||rpassword[i].value==""){
                        alert("SFTP needs user and password!");
                        ruser[i].style.borderColor='red';
                        ruser[i].focus();
                        return false;
                    }
                }
                if(!recipientClient[i].value) {
                    alert("Sender Client is null!");
                    recipientClient[i].style.borderColor='red';
                    recipientClient[i].focus();
                    selectRClient(i);
                    return false;
                }
            }
        } else{
            alert('Please add a Sender!');
            setReceiveInfoTable();
            return false;
        }

        if(sip.length>0){
            for(var i=0;i<sip.length;i++){
                if(stype[i][2].selected==true){
                    alert("This Local is not perfect,We cannot use it")
                    return false;
                }
                if(sip[i].value==""||sip[i].value==null){
                    alert("Ip Address is null!");
                    sip[i].style.borderColor='red';
                    sip[i].focus();
                    return false;
                }
                for(var j=i+1;j<sip.length;j++){
                    if(sname[i].value&&sname[j].value){
                        if(sname[i].value==sname[j].value){
                            alert("Recipient name can not be same! ");
                            sname[i].style.borderColor='red';
                            sname[j].style.borderColor='red';
                            sname[i].focus();
                            return false;
                            break;
                        }
                    }
                    if(sport[i].value&&sport[j].value){
                        if(sport[i].value==sport[j].value){
                            alert("Recipient port can not be same! ");
                            sport[i].style.borderColor='red';
                            sport[j].style.borderColor='red';
                            sport[i].focus();
                            return false;
                            break;
                        }
                    }
                }
                if(!checkip.exec(sip[i].value)){
                    alert("Ip Address format is wrong! ");
                    sip[i].style.borderColor='red';
                    sip[i].focus();
                    return false;
                }
                if(sport[i].value==""||sport[i].value==null){
                    alert("Port is null!");
                    sport[i].style.borderColor='red';
                    sport[i].focus();
                    return false;
                }
                if(!checknum.exec(sport[i].value)) {
                    alert("Port must be a number!");
                    sport[i].style.borderColor='red';
                    sport[i].focus();
                    return false;
                }

                if(!senderClient[i].value) {
                    alert("Recipient Client is null!");
                    senderClient[i].style.borderColor='red';
                    senderClient[i].focus();
                    selectSClient(i);
                    return false;
                }

                if(!sruleGroup[i].value) {
                    alert("Rule Group is null!");
                    sruleGroup[i].style.borderColor='red';
                    sruleGroup[i].focus();
                    return false;
                }
                if(stype[i][0].selected) {
                    if(suser[i].value!=""||spassword[i].value!=""){
                        alert("TCP does not need user and password!");
                        suser[i].value="";
                        spassword[i].value="";
                        return false;
                    }
                }else{
                    if(suser[i].value==""||spassword[i].value==""){
                        alert("SFTP needs user and password!");
                        suser[i].style.borderColor='red';
                        suser[i].focus();
                        return false;
                    }
                }
            }
        } else{
            alert("Please add a Recipient!");
            setSendInfoTable();
            return false;
        }
        var ack = document.getElementById('ack');
        if(ack.value=="Yes"){
            var ackClient = document.getElementById('ackClient');
            var sradio = document.getElementsByName('sradio');
            if(sradio.length>0){
                for(var i=0;i<sradio.length;i++){
                    if(sradio[i].checked){
                        var num = sradio[i].value
                        ackClient.value = document.getElementById('ssenderClientId'+num).value;
                        if(!ackClient.value){
                            alert("Please select a ack!");
                            return false;
                        }
                    }
                }
            }
        }
        return true;
    }



    var sendInfoNum=0;
    var sendInfoNumDel=0;
    function setSendInfoTable(){  //set sendInfo
        var ack = document.getElementById("ack");
        if(ack.value=="Yes"){
            document.getElementById("sendInfoDiv").style.display="";
            var objTable = document.getElementById("sendInfoTable");
            objTable.insertRow(objTable.rows.length);
//                var inx = (document.all.providerTavle.rows.length)-1;
            sendInfoNum++;
            sendInfoNumDel++;
            objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+sendInfoNumDel;
            objTable.rows.item(objTable.rows.length -1).insertCell(0);
            objTable.rows[objTable.rows.length-1].cells[0].innerHTML="<TR><TD><div align=left><input id=snameDiv style=width:90px type=text name=sname value= ><div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+sendInfoNumDel;
            objTable.rows.item(objTable.rows.length -1).insertCell(1);
            objTable.rows[objTable.rows.length-1].cells[1].innerHTML="<TD><div align=left><select id=stype"+sendInfoNumDel+" onchange=stypeChange("+sendInfoNumDel+") name=stype style=width:60px><option value=TCP>TCP</option><option value=SFTP>SFTP</option><option value=LOCAL>LOCAL</option></select></div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+sendInfoNumDel;
            objTable.rows.item(objTable.rows.length -1).insertCell(2);
            objTable.rows[objTable.rows.length-1].cells[2].innerHTML="<TD><div align=left><input id=sipDiv style=width:100px type=text name=sip  value=><div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+sendInfoNumDel;
            objTable.rows.item(objTable.rows.length -1).insertCell(3);
            objTable.rows[objTable.rows.length-1].cells[3].innerHTML="<TD><div align=left><input id=sportDiv style=width:30px type=text name=sport  ><div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+sendInfoNumDel;
            objTable.rows.item(objTable.rows.length -1).insertCell(4);
            objTable.rows[objTable.rows.length-1].cells[4].innerHTML="<TD><div align=left><input id=suserDiv"+sendInfoNumDel+" style=width:90px;display:none type=text name=suser value= ></div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+sendInfoNumDel;
            objTable.rows.item(objTable.rows.length -1).insertCell(5);
            objTable.rows[objTable.rows.length-1].cells[5].innerHTML="<TD><div align=left><input id=spasswordDiv"+sendInfoNumDel+" style=width:90px;display:none type=password name=spassword value= ></div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+sendInfoNumDel;
            objTable.rows.item(objTable.rows.length -1).insertCell(6);
            objTable.rows[objTable.rows.length-1].cells[6].innerHTML="<TD><div align=left><input id=sotherDiv style=width:90px type=text name=sother value= ></div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+sendInfoNumDel;
            objTable.rows.item(objTable.rows.length -1).insertCell(7);
            objTable.rows[objTable.rows.length-1].cells[7].innerHTML="<TD><input style=width:90px type=text id=ssenderClient"+sendInfoNumDel+" name=ssenderClient value='' onclick=selectSClient("+sendInfoNumDel+"); readonly=true placeholder='Click Here!' ><input type=hidden name=ssenderClientId id=ssenderClientId"+sendInfoNum+" value=''></div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+sendInfoNumDel;
            objTable.rows.item(objTable.rows.length -1).insertCell(8);
            objTable.rows[objTable.rows.length-1].cells[8].innerHTML="<TD><div align=left><input style=width:90px type=text id=sruleGroup"+sendInfoNumDel+" name=sruleGroup value='' onclick=selectMappingRuleGroup("+sendInfoNumDel+"); readonly=true placeholder='Click Here!' ><input type=hidden name=sruleGroupId id=sruleGroupId"+sendInfoNum+" value=''></div></TD></TR>";

            objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+sendInfoNumDel;
            objTable.rows.item(objTable.rows.length -1).insertCell(9);
            objTable.rows[objTable.rows.length-1].cells[9].innerHTML="<TD><input checked=true style=width:90px value="+sendInfoNumDel+" type=radio id=sradio"+sendInfoNumDel+" name=sradio value='' onclick=ackCheck("+sendInfoNumDel+");></div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+sendInfoNumDel;
            objTable.rows.item(objTable.rows.length -1).insertCell(10);
            objTable.rows[objTable.rows.length-1].cells[10].innerHTML="<TD><div align=left><a href=javascript:DeleteSendInfo("+sendInfoNumDel+");>${message(code: 'd.del.label', default: 'delete')}</a></div></TD></TR>";

            document.getElementById("sendInfoNum").value=sendInfoNum;
        } else{
            document.getElementById("sendInfoDiv").style.display="";
            var objTable = document.getElementById("sendInfoTable");
            objTable.insertRow(objTable.rows.length);
//                var inx = (document.all.providerTavle.rows.length)-1;
            sendInfoNum++;
            sendInfoNumDel++;
            objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+sendInfoNumDel;
            objTable.rows.item(objTable.rows.length -1).insertCell(0);
            objTable.rows[objTable.rows.length-1].cells[0].innerHTML="<TR><TD><div align=left><input id=snameDiv style=width:90px type=text name=sname value= ><div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+sendInfoNumDel;
            objTable.rows.item(objTable.rows.length -1).insertCell(1);
            objTable.rows[objTable.rows.length-1].cells[1].innerHTML="<TD><div align=left><select id=stype"+sendInfoNumDel+" onchange=stypeChange("+sendInfoNumDel+") name=stype style=width:60px><option value=TCP>TCP</option><option value=SFTP>SFTP</option><option value=LOCAL>LOCAL</option></select></div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+sendInfoNumDel;
            objTable.rows.item(objTable.rows.length -1).insertCell(2);
            objTable.rows[objTable.rows.length-1].cells[2].innerHTML="<TD><div align=left><input id=sipDiv style=width:100px type=text name=sip  value=><div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+sendInfoNumDel;
            objTable.rows.item(objTable.rows.length -1).insertCell(3);
            objTable.rows[objTable.rows.length-1].cells[3].innerHTML="<TD><div align=left><input id=sportDiv style=width:30px type=text name=sport  ><div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+sendInfoNumDel;
            objTable.rows.item(objTable.rows.length -1).insertCell(4);
            objTable.rows[objTable.rows.length-1].cells[4].innerHTML="<TD><div align=left><input id=suserDiv"+sendInfoNumDel+" style=width:90px;display:none type=text name=suser value= ></div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+sendInfoNumDel;
            objTable.rows.item(objTable.rows.length -1).insertCell(5);
            objTable.rows[objTable.rows.length-1].cells[5].innerHTML="<TD><div align=left><input id=spasswordDiv"+sendInfoNumDel+" style=width:90px;display:none type=password name=spassword value= ></div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+sendInfoNumDel;
            objTable.rows.item(objTable.rows.length -1).insertCell(6);
            objTable.rows[objTable.rows.length-1].cells[6].innerHTML="<TD><div align=left><input id=sotherDiv style=width:90px type=text name=sother value= ></div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+sendInfoNumDel;
            objTable.rows.item(objTable.rows.length -1).insertCell(7);
            objTable.rows[objTable.rows.length-1].cells[7].innerHTML="<TD><input  style=width:90px type=text id=ssenderClient"+sendInfoNumDel+" name=ssenderClient value='' onclick=selectSClient("+sendInfoNumDel+"); readonly=true placeholder='Click Here!' ><input type=hidden name=ssenderClientId id=ssenderClientId"+sendInfoNum+" value=''></div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+sendInfoNumDel;
            objTable.rows.item(objTable.rows.length -1).insertCell(8);
            objTable.rows[objTable.rows.length-1].cells[8].innerHTML="<TD><div align=left><input style=width:90px type=text id=sruleGroup"+sendInfoNumDel+" name=sruleGroup value='' onclick=selectMappingRuleGroup("+sendInfoNumDel+"); readonly=true placeholder='Click Here!' ><input type=hidden name=sruleGroupId id=sruleGroupId"+sendInfoNum+" value=''></div></TD></TR>";

            objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+sendInfoNumDel;
            objTable.rows.item(objTable.rows.length -1).insertCell(9);
            objTable.rows[objTable.rows.length-1].cells[9].innerHTML="<TD><input checked=true style='display: none;width:90px'  type=radio value="+sendInfoNumDel+" id=sradio"+sendInfoNumDel+" name=sradio  onclick=ackCheck();></div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+sendInfoNumDel;
            objTable.rows.item(objTable.rows.length -1).insertCell(10);
            objTable.rows[objTable.rows.length-1].cells[10].innerHTML="<TD><div align=left><a href=javascript:DeleteSendInfo("+sendInfoNumDel+");>${message(code: 'd.del.label', default: 'delete')}</a></div></TD></TR>";

            document.getElementById("sendInfoNum").value=sendInfoNum;
        }

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
    function shangguan(){

    }
    function ackCheck(){
        var ack = document.getElementById("ack");
//        var sradio = document.getElementsByName('sradio');
        if(ack.value=="Yes"){
            var ackClient = document.getElementById('ackClient');
            var sradio = document.getElementsByName('sradio');

            if(sradio.length>0){
                for(var i=0;i<sradio.length;i++){
                    if(sradio[i].checked){
                        var num = sradio[i].value
                        ackClient.value = document.getElementById('ssenderClientId'+num).value;
                    }
                }
            }
        }

    }
    function ackChange(){
        var ack = document.getElementById("ack");
        var ackTh = document.getElementById("ackTh");
        if(ack.value!="Yes"){
            var sradio = document.getElementsByName('sradio');
            if(sradio.length>0){
                for(var i=0;i<sradio.length;i++){
                    sradio[i].style.display="none";
                }
            }
        }else{
            var sradio = document.getElementsByName('sradio');
            if(sradio.length>0){
                for(var i=0;i<sradio.length;i++){
                    sradio[i].style.display="";
                }
            }
        }
    }


    var receiveInfoNum=0;
    function setReceiveInfoTable(){  //set sendInfo
        var objTable = document.getElementById("receiveInfoTable");
        var objRow = document.getElementById("rtoBeDelRow"+1);
        if(objRow) {
            alert("There is only one source!");
        }else{
            document.getElementById("receiveInfoDiv").style.display="";
            var objTable = document.getElementById("receiveInfoTable");
            objTable.insertRow(objTable.rows.length);
//                var inx = (document.all.providerTavle.rows.length)-1;
            receiveInfoNum++;
            objTable.rows.item(objTable.rows.length -1).id = "rtoBeDelRow"+receiveInfoNum;
            objTable.rows.item(objTable.rows.length -1).insertCell(0);
            objTable.rows[objTable.rows.length-1].cells[0].innerHTML="<TR><TD><div align=left><input id=rnameDiv style=width:90px type=text name=rname value= ></div></TD></TR>";

            objTable.rows.item(objTable.rows.length -1).id = "rtoBeDelRow"+receiveInfoNum;
            objTable.rows.item(objTable.rows.length -1).insertCell(1);
            objTable.rows[objTable.rows.length-1].cells[1].innerHTML="<TD><div align=left><select onchange=rtypeChange("+receiveInfoNum+") name=rtype id=rtype"+receiveInfoNum+" style=width:50px><option value=TCP>TCP</option><option value=SFTP>SFTP</option><option value=LOCAL>LOCAL</option></select><div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "rtoBeDelRow"+receiveInfoNum;
            objTable.rows.item(objTable.rows.length -1).insertCell(2);
            objTable.rows[objTable.rows.length-1].cells[2].innerHTML="<TD><div align=left><input id=ripDiv style=width:100px type=text name=rip  value= ><div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "rtoBeDelRow"+receiveInfoNum;
            objTable.rows.item(objTable.rows.length -1).insertCell(3);
            objTable.rows[objTable.rows.length-1].cells[3].innerHTML="<TD><div align=left><input onblur='checkPortRepeat();' id=rport style=width:30px type=text name=rport  value= ><div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "rtoBeDelRow"+receiveInfoNum;
            objTable.rows.item(objTable.rows.length -1).insertCell(4);
            objTable.rows[objTable.rows.length-1].cells[4].innerHTML="<TD><div align=left ><input id=ruserDiv"+receiveInfoNum+" style='width:90px;display:none'  type=text name=ruser value= ></div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "rtoBeDelRow"+receiveInfoNum;
            objTable.rows.item(objTable.rows.length -1).insertCell(5);
            objTable.rows[objTable.rows.length-1].cells[5].innerHTML="<TD><div align=left ><input id=rpasswordDiv"+receiveInfoNum+" style=width:90px;display:none type=password name=rpassword value= ></div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "rtoBeDelRow"+receiveInfoNum;
            objTable.rows.item(objTable.rows.length -1).insertCell(6);
            objTable.rows[objTable.rows.length-1].cells[6].innerHTML="<TD><div align=left><input id=rotherDiv style=width:90px type=text name=rother value= ></div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "stoBeDelRow"+receiveInfoNum;
            objTable.rows.item(objTable.rows.length -1).insertCell(7);
            objTable.rows[objTable.rows.length-1].cells[7].innerHTML="<TD><input style=width:90px type=text id=rrecipientClient"+receiveInfoNum+" name=rrecipientClient value='' onclick=selectRClient("+receiveInfoNum+"); readonly=true placeholder='Click Here!' ><input type=hidden name=rrecipientClientId id=rrecipientClientId"+receiveInfoNum+" value=''></div></TD>";

            objTable.rows.item(objTable.rows.length -1).id = "rtoBeDelRow"+receiveInfoNum;
            objTable.rows.item(objTable.rows.length -1).insertCell(8);
            objTable.rows[objTable.rows.length-1].cells[8].innerHTML="<TD><div align=left><a href=javascript:DeleteReceiveInfo("+receiveInfoNum+");>${message(code: 'd.del.label', default: 'delete')}</a></div></TD></TR>";

            document.getElementById("receiveInfoNum").value=receiveInfoNum;
        }

    }
    var portRepeatFlag = 0;
    function checkPortRepeat(){
        var checknum=/^[0-9]{1,20}$/;
        var rport = document.getElementById("rport");
        if(!checknum.exec(rport.value)){
           alert("Port must be a number");
        }else{
            $.ajax({
                url:"${request.contextPath}/bridge/checkPortRepeat",
                data:{port:rport.value},
                success:function(msg){
                    if(msg){
                        alert(msg);
                        rport.style.borderColor="red";
                        portRepeatFlag = -1;
                    } else{
                        portRepeatFlag = 1;
                        rport.style.borderColor="";
                    }
                }
            })
        }
    }
    function rtypeChange(num){
        var type = document.getElementById('rtype'+num);
        var ruserDiv = document.getElementById('ruserDiv'+num);
        var rpasswordDiv = document.getElementById('rpasswordDiv'+num);
        if(type[0].selected){
            ruserDiv.style.display='none';
            rpasswordDiv.style.display='none';
            ruserDiv.value="";
            rpasswordDiv.value="";
        }else{
            ruserDiv.style.display='';
            rpasswordDiv.style.display='';
        }
    }
    function stypeChange(num){
        var type = document.getElementById('stype'+num);
        var suserDiv = document.getElementById('suserDiv'+num);
        var spasswordDiv = document.getElementById('spasswordDiv'+num);
        var sipDiv = document.getElementById('sipDiv'+num);
        var sportDiv = document.getElementById('sportDiv'+num);
        var snameDiv = document.getElementById('snameDiv'+num);
        if(type[0].selected){
            suserDiv.style.display='none';
            spasswordDiv.style.display='none';
            sipDiv.style.display='';
            sportDiv.style.display='';
            suserDiv.value="";
            snameDiv.value="";
            sipDiv.value="";
            sportDiv.value="";
            spasswordDiv.value="";
        }else if(type[1].selected){
            suserDiv.style.display='';
            spasswordDiv.style.display='';
            sipDiv.style.display='';
            sportDiv.style.display='';
            suserDiv.value="";
            snameDiv.value="";
            sipDiv.value="";
            sportDiv.value="";
            spasswordDiv.value="";
        }else if(type[2].selected){
            suserDiv.style.display='none';
            spasswordDiv.style.display='none';
            sipDiv.style.display='none';
            sportDiv.style.display='none';
            suserDiv.value="";
            snameDiv.value="";
            sipDiv.value="";
            sportDiv.value="";
            spasswordDiv.value="";
        }
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
    //------------------------------------------set mapping rule group---------------------------------------
    function selectMappingRuleGroup(num){
        document.getElementById("mappingRuleGroupNum").value = num;
        var paramKQ = " ${request.contextPath}/bridge/selectMappingRuleGroup";
        open(paramKQ,'title','resizable=no,width=800,height=410,scrollbars=yes');
    }


    function setRuleGroupInfo(id,name,type,comment){
        var num = document.getElementById("mappingRuleGroupNum").value;
        document.getElementById('sruleGroup'+num).value = name;
        document.getElementById('sruleGroupId'+num).value = id;
        document.getElementById("mappingRuleGroupNum").value = 0;
        var temp = document.getElementsByName("sruleGroup");

    }
    // ---------------------------------------set Client--------------------------------------------------------------
    function selectSClient(num){
        document.getElementById("sclientNum").value = num;
        document.getElementById("rclientNum").value = "";
        var paramKQ = " ${request.contextPath}/provider/selectClient1";
        open(paramKQ,'title','resizable=no,width=800,height=410,scrollbars=yes');
    }
    function selectRClient(num){
        document.getElementById("rclientNum").value = num;
        document.getElementById("sclientNum").value = "";
        var paramKQ = " ${request.contextPath}/provider/selectClient1";
        open(paramKQ,'title','resizable=no,width=800,height=410,scrollbars=yes');
    }
    function setClientInfo(cid,name,alias,activeInd){
        var snum = document.getElementById("sclientNum").value;
        var rnum = document.getElementById("rclientNum").value;
        if(snum){
            var ssenderClient = document.getElementsByName("ssenderClientId");
            var repeat = 0;
            if(ssenderClient.length>0){
                for(var i=0;i<ssenderClient.length;i++){
                    if(ssenderClient[i].value==cid){
                        alert("The Destination Client is already exist");
                        repeat = -1;
                        break;
                    }
                }
            }
            if(repeat==0){
                document.getElementById('ssenderClient'+snum).value = name;
                document.getElementById('ssenderClientId'+snum).value = cid;
                document.getElementById("sclientNum").value = "";
            }
        }else if(rnum){
            document.getElementById('rrecipientClient'+rnum).value = name;
            document.getElementById('rrecipientClientId'+rnum).value = cid;
            document.getElementById("rclientNum").value = "";
        }
    }

    var bridgeNameRepeat = 0;
    function checkBridgeNameRepeat(){
        var name = document.getElementById("bridgeName");
        if(name.value){
            $.ajax({
                url:"${request.contextPath}/bridge/checkBridgeNameRepeat",
                data:{name:name.value},
                success:function(msg){
                    if(msg){
                        alert(msg);
                        name.style.borderColor="red";
                        bridgeNameRepeat = -1;
                    } else{
                        bridgeNameRepeat = 0;
                        name.style.borderColor="";
                    }
                }
            })
        } else{
            alert("Bridge Name is null");
        }
    }
</script>
</head>
<body>
<h1><g:message code="default.create.label" args="[entityName]" /></h1>
<hr>

%{--<g:hasErrors bean="${bridgeData}">--}%
%{--<div class="errors">--}%
%{--<g:renderErrors bean="${bridgeData}" as="list" />--}%
%{--</div>--}%
%{--</g:hasErrors>--}%

<div class="container-fluid span10">
    <div class="span12 divbk">
        <g:link  action="list"><i class="icon-list"></i><g:message code="default.list.label" args="[entityName]" /></g:link>
    </div>
    <g:if test="${flash.message}">
        <div class="message span12" style="color: red">${flash.message}</div>
    </g:if>
<div class="span12" >
    <g:form action="save"  class="form-horizontal">
        <g:hiddenField name="sendInfoNum"  id="sendInfoNum" value="0"></g:hiddenField>
        <g:hiddenField name="receiveInfoNum"  id="receiveInfoNum" value="0"></g:hiddenField>
        <g:hiddenField name="mappingRuleGroupNum"  id="mappingRuleGroupNum" value="0"></g:hiddenField>
        <g:hiddenField name="sclientNum"  id="sclientNum" value=""></g:hiddenField>
        <g:hiddenField name="rclientNum"  id="rclientNum" value=""></g:hiddenField>
        <g:hiddenField name="ackClient"  id="ackClient" value=""></g:hiddenField>
        <div class="well">
            <div class="control-group">
                <label class="control-label" for="bridgeName"><g:message code="bridge.bridgeName.label" default="Bridge Name" /></label>
                <div class="controls">
                    <g:textField class="input-xlarge focused" onblur="checkBridgeNameRepeat()" name="bridgeName" maxlength="128" value="${bridgeData?.bridgeName}" /><span class="help-inline">Required</span>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" ><g:message code="bridge.dateStarted.label" default="Effective Date" /></label>
                <div class="controls">
                    <g:textField class="input-xlarge focused" name="dateStarted1" readonly="true" placeholder="Click 'HERE' to add a date!" maxlength="128" value="${bridgeData?.dateStarted}" /><span class="help-inline">Required</span>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" ><g:message code="bridge.dateEnded.label" default="Date Ended" /></label>
                <div class="controls">
                    <g:textField class="input-xlarge focused" name="dateEnded1" readonly="true" placeholder="Click 'HERE' to add a date!" maxlength="128" value="${bridgeData?.dateEnded}" /><span class="help-inline">Required</span>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" ><g:message code="bridge.ack.label" default="ACK" /></label>
                <div class="controls">
                    <g:select name="ack" noSelection="${['':'ACK']}" from="${bridgeData.constraints.ack.inList}" onchange="ackChange();"></g:select>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="activeInd"><g:message code="bridge.activeInd.label" default="Enabled" /></label>
                <div class="controls">
                    <g:checkBox name="activeInd" value="${bridgeData?.activeInd}"  checked="true"/>
                </div>
            </div>
            <div>
                <hr>
                <div>
                    <font size="3" color="#279745" style="margin: 0 150px 0 0"><g:message  code="senderConfig.message.lable" /></font>
                    <a href="javascript:setReceiveInfoTable();"><img src="${request.contextPath}/images/add.jpg"> <g:message  code="add.message.lable" /></a>
                </div>

                <div id="receiveInfoDiv" style="display: none">
                    <table class="table table-condensed table-striped" id="receiveInfoTable">
                        <thead>
                        <tr>

                            <th>${message(code: 'recipientConfig.name.label', default: 'Name')}</th>

                            <th>${message(code: 'recipientConfig.type.label', default: 'Type')}</th>

                            <th>${message(code: 'recipientConfig.ip.label', default: 'Ip')}</th>

                            <th>${message(code: 'recipientConfig.port.label', default: 'Port')}</th>

                            <th>${message(code: 'recipientConfig.user.label', default: 'User')}</th>

                            <th>${message(code: 'recipientConfig.password.label', default: 'Password')}</th>

                            <th>${message(code: 'recipientConfig.other.label', default: 'Other')}</th>

                            <th>${message(code: 'recipientConfig.client.label', default: 'Source Client')}</th>

                            <th>Delete</th>

                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
                <hr>
                <div>

                    <font size="3" color="#279745" style="margin: 0 134px 0 0"><g:message  code="recipientConfig.message.lable" /></font>
                    <a href="javascript:setSendInfoTable();" style="margin:0 0 0 0 "><img src="${request.contextPath}/images/add.jpg"><g:message  code="add.message.lable" /></a>
                </div>
                <div id="sendInfoDiv" style="display: none">
                    <table id="sendInfoTable" class="table table-condensed table-striped">
                        <thead>
                        <tr>

                            <th>${message(code: 'senderConfig.name.label', default: 'Name')}</th>

                            <th>${message(code: 'senderConfig.type.label', default: 'Type')}</th>

                            <th>${message(code: 'senderConfig.ip.label', default: 'Ip')}</th>

                            <th>${message(code: 'senderConfig.port.label', default: 'Port')}</th>

                            <th>${message(code: 'senderConfig.user.label', default: 'User')}</th>

                            <th>${message(code: 'senderConfig.password.label', default: 'Password')}</th>

                            <th>${message(code: 'senderConfig.other.label', default: 'Other')}</th>

                            <th>${message(code: 'senderConfig.client.label', default: 'Destination Client')}</th>

                            <th>${message(code: 'senderConfig.ruleGroup.label', default: 'Rule Group')}</th>

                            <th id="ackTh">${message(code: 'senderConfig.ack.label', default: 'ACK')}</th>

                            <th>Delete</th>

                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="offset3">
                <g:submitButton name="create"  class="btn btn-primary" onclick="return checkForm();" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                <g:actionSubmit value="Cancel" name="cancel" action="list" class="btn"></g:actionSubmit>
            </div>
        </div>
        </div>
    </g:form>
</div>
</body>
</html>
