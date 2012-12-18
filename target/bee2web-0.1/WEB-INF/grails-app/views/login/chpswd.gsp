<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title><g:message code="pswd.label"/></title>
<script language="javascript">
<!--
function validateForm(frm){
  var passwd = frm.password.value;
  var confm  = frm.confirm.value;
  if(passwd == ''){
    alert("<g:message code="pswd.confirm"/>");
    return false;
  }
  if(passwd != confm){
    alert("<g:message code="pswd.info"/>");
    return false;
  }
  return true;
}
//-->
</script>
</head>
<body onload="document.frm.password.focus();">
<h1><g:message code="pswd.label" default="Change Password" /></h1>
<g:form name="frm" action="chpswd" controller="login" OnSubmit="return validateForm(this)">
<div class="dialog">
<table >
<tr>
  <td class="name"><g:message code="pswd.username" default="User Name" />:</td>
  <td class="value"><sec:username/></td>
</tr>
<tr>
  <td class="name"><g:message code="pswd.password" default="User Name" />:</td>
  <td class="value"><g:passwordField  name="password"  size="20"/></td>
</tr>
<tr>
  <td class="name"><g:message code="pswd.again" default="User Name" />:</td>
  <td class="value"><g:passwordField  name="confirm"  size="20"/></td>
</tr>
<tr>
  <td colspan="2" align="center" class="fontStyle">
    <input type="submit" name="ok" value="<g:message code="pswd.ok" default="OK" />"> 
  </td>
</tr>
<tr>
<td colspan="2" class="warnStyle">
<g:if test="${flash.message}">
  <div class="message">${flash.message}</div>
</g:if>
</td>
</tr>
</table>
</div>
<g:hiddenField name="username" value="${session.UserId}"/>
</g:form>
</body>
</html>