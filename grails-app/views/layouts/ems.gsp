<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>EMS</title>
    <asset:stylesheet src="ems.css"/>
    <asset:javascript src="ems.js"/>
    <g:layoutHead/>
</head>

<body>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${createLink(uri: '/')}">EMS</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <sec:ifLoggedIn>
                    <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>Read All Messages</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-messages -->
                </li>
                </sec:ifLoggedIn>
                <!-- /.dropdown -->
                <sec:ifLoggedIn>
                    <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-comment fa-fw"></i> New Comment
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                    <span class="pull-right text-muted small">12 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> Message Sent
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-tasks fa-fw"></i> New Task
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Alerts</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-alerts -->
                </li>
                </sec:ifLoggedIn>
                <!-- /.dropdown -->
                <sec:ifLoggedIn>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-user fa-fw"></i> <sec:username/> <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                            </li>
                            <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="${createLink(controller: 'logout', action: 'index')}"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                            </li>
                        </ul>
                        <!-- /.dropdown-user -->
                    </li>
                </sec:ifLoggedIn>
                <sec:ifNotLoggedIn>
                    <li>
                        <a href="${createLink(controller: 'login', action: 'index')}"><i class="fa fa-sign-in fa-fw"></i> Login</a>
                    </li>
                </sec:ifNotLoggedIn>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <sec:ifNotLoggedIn>
                            <li>
                                <a class="active" href="${createLink(uri: '/')}"><i class="fa fa-home fa-fw"></i> Home</a>
                            </li>
                        </sec:ifNotLoggedIn>
                        <li>
                            <a href="${createLink(uri: '/aboutus')}"><i class="fa fa-info-circle fa-fw"></i> About Us</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-envelope fa-fw"></i> Contact Us</a>
                        </li>
                        <sec:ifLoggedIn>
                            <li>
                                <a href="#"><i class="fa fa-user"></i> User Menu<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level collapse">
                                    <li>
                                        <a href="${createLink(controller: 'user', action: 'home')}"><i class="fa fa-home fa-fw"></i> Home</a>
                                    </li>
                                    <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_FACILITATOR">
                                    <li>
                                        <a href="${createLink(controller: 'user', action: 'index')}"><i class="fa fa-users fa-fw"></i> User List</a>
                                    </li>
                                    </sec:ifAnyGranted>
                                    <li>
                                        <a href="${createLink(controller: 'event', action: 'list')}"><i class="fa fa-list fa-fw"></i> Event List</a>
                                    </li>
                                </ul>
                            </li>
                        </sec:ifLoggedIn>
                        <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_FACILITATOR">
                            <li>
                                <a href="#"><i class="fa fa-user"></i> Participants<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level collapse">
                                    <li>
                                        <a href="${createLink(controller: 'admin', action: 'registerParticipant')}">Register</a>
                                    </li>
                                </ul>
                            </li>
                        </sec:ifAnyGranted>
                        <sec:ifAllGranted roles="ROLE_EVENT_OWNER">
                            <li>
                                <a href="#"><i class="fa fa-calendar"></i> Events<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level collapse">
                                    <li>
                                        <a href="${createLink(controller: 'event', action: 'create')}">Add New Event</a>
                                    </li>
                                </ul>
                            </li>
                        </sec:ifAllGranted>
                        <sec:ifAllGranted roles="ROLE_RESOURCE_OWNER">
                            <li>
                                <a href="#"><i class="fa fa-money"></i> Resources<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level collapse">
                                    <li>
                                        <a href="${createLink(controller: 'venue', action: 'create')}">Add Venue</a>
                                    </li>
                                    <li>
                                        <a href="${createLink(controller: 'catering', action: 'create')}">Add Catering</a>
                                    </li>
                                </ul>
                            </li>
                        </sec:ifAllGranted>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
    </div>
    <div style="min-height: 430px;" id="page-wrapper">
        <g:layoutBody/>
    </div>
</body>
</html>
