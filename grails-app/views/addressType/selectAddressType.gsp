
<%@ page import="com.bssi.AddressType" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="" />
    <g:set var="entityName" value="${message(code: 'luAddrType.label', default: 'Lu Address Type')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'divbk.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'bootstrap.css')}" />
    <link rel="stylesheet" type="text/css" href="${resource(dir:'js/themes/default',file:'easyui.css')}">
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery-1.7.2.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery.easyui.min.js')}"></script>
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <script type="text/javascript">
        function setAddressTypeInfo(id,addressType,activeInd){
            if(activeInd=="true"){
                parent.window.opener.setAddressTypeInfo(id,addressType,activeInd);
                top.close();
            } else{
                alert("The Address Type "+addressType+" is inactive");
            }


        }
        function closeWindow(){
            top.close();
        }
        function createAddressType(){
            clearAddressType();
            $("#addressTypeDlg").dialog("open");
        }
        function closeAddressType(){
            clearAddressType();
            $("#addressTypeDlg").dialog("close");
        }
        function clearAddressType(){
             var addressType = document.getElementById("addrTypedlg");
             var description = document.getElementById("descriptiondlg");
             var activeInd = document.getElementById("activeInddlg");
            addressType.value="";
            description.value="";
            activeInd.checked=true;
        }
        function saveAddressType(){
            var addressType = document.getElementById("addrTypedlg");
            var description = document.getElementById("descriptiondlg");
            var activeInd = document.getElementById("activeInddlg");
            if(!addressType.value){
                alert("Address Type is null");
                addressType.focus();
                addressType.style.borderColor="red";
                return false;
            } else{
                addressType.style.borderColor="";
            }
            $.ajax({
                url:"${request.contextPath}/addressType/saveAddressType",
                data:{addressType:addressType.value,description:description.value,activeInd:activeInd.checked},
                success:function(msg){
                    if(msg){
                        alert(msg)
                    }else{
                        closeAddressType();
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

<g:form method="post"  class="form-horizontal" >
    <div class="container-fluid span10">
        <div class="span12 divbk">

            <g:link onclick="closeWindow();"><i class="icon-remove"></i><g:message code="default.close.label" args="[entityName]" /></g:link>
            <a href="#" onclick="createAddressType();"><i class="icon-plus"></i><g:message code="default.new.label" args="[entityName]" /></a>
        </div>
        <g:if test="${flash.message}">
            <div class="message span12" style="color: red">${flash.message}</div>
        </g:if>
        <div class="span12">
            <div class="well ">

                <div class="control-group">
                    <label class="control-label" for="addrType" ><g:message code="luAddrType.addrType.label" default="Address Type" /></label>
                    <div class="controls">
                        <g:textField class="input-xlarge focused" style="height:30px" name="addrType" maxlength="128" value="${params?.addrType}" />
                    </div>
                </div>



                <br>
                <div class="control offset4">
                    <g:actionSubmit class="btn btn-primary" action="selectAddressType" value="${message(code: 'default.button.search.label', default: 'Search')}" />
                </div>

                <br>
                <div>
                    <table class="table table-condensed table-striped">
                        <thead>
                        <tr>
                            <th>${message(code: 'luAddrType.addrType.label', default: 'Address Type')}</th>

                            <th>${message(code: 'luAddrType.description.label', default: 'Description')}</th>

                            <th>${message(code: 'luAddrType.activeInd.label', default: 'Active Ind')}</th>

                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${luAddrTypeDataList}" status="i" var="luAddrTypeData">
                            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                                <td><a href="#" onclick="setAddressTypeInfo('${luAddrTypeData.id}','${luAddrTypeData.addrType}','${luAddrTypeData.activeInd}');">${fieldValue(bean: luAddrTypeData, field: "addrType")}</a></td>

                                <td><a href="#" onclick="setAddressTypeInfo('${luAddrTypeData.id}','${luAddrTypeData.addrType}','${luAddrTypeData.activeInd}');">${fieldValue(bean: luAddrTypeData, field: "description")}</a></td>

                                <td><a href="#" onclick="setAddressTypeInfo('${luAddrTypeData.id}','${luAddrTypeData.addrType}','${luAddrTypeData.activeInd}');"><g:checkBox name="" value="${luAddrTypeData.activeInd}" onclick="return false"/></a></td>

                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                    <div class="pager">
                        <g:paginate action="selectAddressType" params="[addrType:params.addrType,activeInd: params.activeInd,description:params.description]" total="${luAddrTypeDataTotal}" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</g:form>
<div id="addressTypeDlg" title="Provider"
     class="easyui-dialog" style="width:500px;height:400px;padding:10px 20px"
     closed="true" buttons="#addressTypeDlg-buttons">
    <h2>${message(code: 'addressType.label', default: 'Address Type')}</h2>
    <hr>
    <table>
        <tr>
            <td> <label  for="addrTypedlg" ><g:message code="luAddrType.addrType.label" default="Address Type" /></label></td>
            <td> <g:textField class=" text_h" name="addrTypedlg" maxlength="4" value="" /> <span class="help-inline">Required</span></td>
        </tr>

        <tr>
            <td>  <label  for="descriptiondlg" ><g:message code="luAddrType.description.label" default="Description" /></label></td>
            <td>  <g:textField class="text_h" name="descriptiondlg" maxlength="128" value="" /></td>
        </tr>

        <tr>
            <td>   <label class="control-label" for="activeInddlg" ><g:message code="luAddrType.activeInd.label" default="Enabled" /></label></td>
            <td>    <g:checkBox name="activeInddlg" value="" checked="true"></g:checkBox></td>
        </tr>

    </table>
</div>
<div id="addressTypeDlg-buttons">
    <input type="button" value="Save" class="btn btn-primary" onclick="return saveAddressType();">
    <input type="button" value="Cancel" class="btn" onclick="closeAddressType();">
</div>

</body>
</html>
