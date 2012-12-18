<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="BEE Engine" /></title>
        <sec:ifNotLoggedIn>
        <meta HTTP-EQUIV="REFRESH" content="0; url=${request.contextPath}/login/auth">
        </sec:ifNotLoggedIn>
        <g:layoutTitle/>
        <g:javascript library="jquery"/>
        <r:require modules="bootstrap"/>
        %{--<r:require modules="bootstrap-css"/>--}%
        %{--<r:require modules="bootstrap-js"/>--}%
        <r:require modules="jquery-ui"/>
        <link rel="stylesheet" href="${resource(dir:'css',file:'uit.table.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'divbk.css')}" />

        <r:layoutResources/>
        <g:layoutHead />
        <script type="text/javascript">
        function profileInformation(){
            var paramKQ = " ${request.contextPath}/user/editUser";
            open(paramKQ,'title','resizable=no,width=800,height=410,scrollbars=yes');
         }
        function changePassword() {
            var paramKQ = " ${request.contextPath}/user/changePassword";
            open(paramKQ,'title','resizable=no,width=800,height=410,scrollbars=yes');
        }

        </script>
    </head>
    <body>
    <div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container-fluid">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <a class="brand" href="#">BEE UI Console</a>
                <div class="btn-group pull-right">
                    <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="icon-user"></i>
                        <sec:ifLoggedIn><sec:username/></sec:ifLoggedIn>
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">

                        <li><a href="#" onclick="profileInformation()">Profile</a></li>
                        <li><a href="#" onclick="changePassword()">Change Password</a></li>
                        <li></li>
                        <li class="divider"></li>
                        <li>
                        <sec:ifLoggedIn>
                            <a href="${request.contextPath}/logout/">Sign Out</a>
                        </sec:ifLoggedIn>
                        <sec:ifNotLoggedIn>
                            <a href='${request.contextPath}/login/auth' id='loginLink'><g:message code='spring.security.login'/></a>
                        </sec:ifNotLoggedIn>
                        </li>
                    </ul>
                </div>
                <div class="nav-collapse">
                    <ul class="nav">
                        <li class="active"><g:link action="index" controller="login">Home</g:link></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Config <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><g:link controller="client" action="list">Client</g:link></li>
                                <li><g:link controller="provider" action="list">Provider</g:link></li>
                                <li><g:link controller="clientProvider" action="list">Client Provider</g:link></li>
                                <li><g:link controller="application" action="list">Application</g:link></li>
                                %{--<li><g:link controller="mappingRuleGroup" action="list">Rule Group</g:link></li>--}%
                                <li><g:link controller="mappingRule" action="createRules">Rule</g:link></li>
                                <li><g:link controller="bridge" action="list">Bridge</g:link></li>
                                %{--<li><g:link controller="facility" action="list">Facility</g:link></li>--}%

                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Log<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><g:link controller="sendLog" action="list">Source Log</g:link></li>
                                <li><g:link controller="receiveLog" action="list">Destination Log</g:link></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Report<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><g:link controller="report" action="sent">Source Report</g:link></li>
                                <li><g:link controller="report" action="receive">Destination Report</g:link></li>
                            </ul>
                        </li>

                        <g:if test="${session.getValue('rolesmy')[0]=='ROLE_SYSTEM'}">
                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Management<b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><g:link controller="user" action="list">Users</g:link></li>
                                    <li><g:link controller="providerType" action="list">Provider Type</g:link></li>
                                    <li><g:link controller="messageTemplate" action="list">Message Template</g:link></li>
                                    <li><g:link controller="segmentTemplate" action="list">Segment Template</g:link></li>
                                </ul>
                            </li>
                        </g:if>

                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Contact<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><g:link controller="address" action="list">Address</g:link></li>
                                <li><g:link controller="addressType" action="list">Address Type</g:link></li>
                                <li><g:link controller="contactType" action="list">Contact Type</g:link></li>
                                <li><g:link controller="clientAddress" action="list">Client Address</g:link></li>
                                %{--<li><g:link controller="facilityAddress" action="list">Facility Address</g:link></li>--}%
                                <li><g:link controller="clientContact" action="list">Client Contact</g:link></li>
                            </ul>
                        </li>
                        <li><g:link action="about" controller="login">About</g:link></li>
                        <li><g:link action="help" controller="login">Help</g:link></li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </div>
    </div>
    <br>
    <br>
    <br>

    <div class="container-fluid">
        <div class="row-fluid">
        <%//----------- content --------------%>
            <div class="span9">
            <g:layoutBody/>
            <r:layoutResources/>
            </div><!--/span-->
        </div><!--/row-->

        <hr>

        <footer>
            <p>Copyright &copy; 2012 1MEDiX.com. All right reserved.</p>
        </footer>
    </div><!--/.fluid-container-->
    </body>
</html>