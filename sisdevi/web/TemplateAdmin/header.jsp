<%@ page import="org.cfg.uapa.java.sisdevi.entidades.Usuario"%>

<% if (session.getAttribute("currentSessionUser")==null){%>
<script type="text/javascript">  
 
      window.location ="login.jsp";
      
 </script>
<%}else{
%>
<% 
    Usuario currentUser =  (Usuario) session.getAttribute("currentSessionUser");
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />
	<title>SISDEVI</title>

	<!--=== CSS ===-->

	<!-- Bootstrap -->
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

	<!-- jQuery UI -->
	<!--<link href="plugins/jquery-ui/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css" />-->
	<!--[if lt IE 9]>
		<link rel="stylesheet" type="text/css" href="plugins/jquery-ui/jquery.ui.1.10.2.ie.css"/>
	<![endif]-->

	<!-- Theme -->
	<link href="assets/css/main.css" rel="stylesheet" type="text/css" />
	<link href="assets/css/plugins.css" rel="stylesheet" type="text/css" />
	<link href="assets/css/responsive.css" rel="stylesheet" type="text/css" />
	<link href="assets/css/icons.css" rel="stylesheet" type="text/css" />

	<link rel="stylesheet" href="assets/css/fontawesome/font-awesome.min.css">
	<!--[if IE 7]>
		<link rel="stylesheet" href="assets/css/fontawesome/font-awesome-ie7.min.css">
	<![endif]-->

	<!--[if IE 8]>
		<link href="assets/css/ie8.css" rel="stylesheet" type="text/css" />
	<![endif]-->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css'>

	<!--=== JavaScript ===-->

	<script type="text/javascript" src="assets/js/libs/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>

	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/js/libs/lodash.compat.min.js"></script>

	<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
		<script src="assets/js/libs/html5shiv.js"></script>
	<![endif]-->

	<!-- Smartphone Touch Events -->
	<script type="text/javascript" src="plugins/touchpunch/jquery.ui.touch-punch.min.js"></script>
	<script type="text/javascript" src="plugins/event.swipe/jquery.event.move.js"></script>
	<script type="text/javascript" src="plugins/event.swipe/jquery.event.swipe.js"></script>

	<!-- General -->
	<script type="text/javascript" src="assets/js/libs/breakpoints.js"></script>
	<script type="text/javascript" src="plugins/respond/respond.min.js"></script> <!-- Polyfill for min/max-width CSS3 Media Queries (only for IE8) -->
	<script type="text/javascript" src="plugins/cookie/jquery.cookie.min.js"></script>
	<script type="text/javascript" src="plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script type="text/javascript" src="plugins/slimscroll/jquery.slimscroll.horizontal.min.js"></script>

	<!-- Page specific plugins -->
	<!-- Charts -->
	
	<script type="text/javascript" src="plugins/daterangepicker/moment.min.js"></script>
	<script type="text/javascript" src="plugins/daterangepicker/daterangepicker.js"></script>
	<script type="text/javascript" src="plugins/blockui/jquery.blockUI.min.js"></script>
        
        <script type="text/javascript" src="plugins/sparkline/jquery.sparkline.min.js"></script>
	<script type="text/javascript" src="plugins/flot/jquery.flot.min.js"></script>
	<script type="text/javascript" src="plugins/flot/jquery.flot.tooltip.min.js"></script>
	<script type="text/javascript" src="plugins/flot/jquery.flot.resize.min.js"></script>
	<script type="text/javascript" src="plugins/flot/jquery.flot.time.min.js"></script>
	<script type="text/javascript" src="plugins/flot/jquery.flot.orderBars.min.js"></script>
	<script type="text/javascript" src="plugins/flot/jquery.flot.pie.min.js"></script>
	<script type="text/javascript" src="plugins/flot/jquery.flot.selection.min.js"></script>
	<script type="text/javascript" src="plugins/flot/jquery.flot.growraf.min.js"></script>
	<script type="text/javascript" src="plugins/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

        
        <!-- Pickers -->
	<script type="text/javascript" src="plugins/pickadate/picker.js"></script>
	<script type="text/javascript" src="plugins/pickadate/picker.date.js"></script>
	<script type="text/javascript" src="plugins/pickadate/picker.time.js"></script>
	<script type="text/javascript" src="plugins/bootstrap-colorpicker/bootstrap-colorpicker.min.js"></script>
        
        <!-- Noty -->
	<script type="text/javascript" src="plugins/noty/jquery.noty.js"></script>
	<script type="text/javascript" src="plugins/noty/layouts/top.js"></script>
	<script type="text/javascript" src="plugins/noty/themes/default.js"></script>

	<!-- Slim Progress Bars -->
	<script type="text/javascript" src="plugins/nprogress/nprogress.js"></script>

	<!-- Bootbox -->
	<script type="text/javascript" src="plugins/bootbox/bootbox.min.js"></script>

	<!-- Forms -->
	<script type="text/javascript" src="plugins/typeahead/typeahead.min.js"></script> <!-- AutoComplete -->
	<script type="text/javascript" src="plugins/autosize/jquery.autosize.min.js"></script>
	<script type="text/javascript" src="plugins/inputlimiter/jquery.inputlimiter.min.js"></script>
	<script type="text/javascript" src="plugins/uniform/jquery.uniform.min.js"></script> <!-- Styled radio and checkboxes -->
	<script type="text/javascript" src="plugins/tagsinput/jquery.tagsinput.min.js"></script>
	<script type="text/javascript" src="plugins/select2/select2.min.js"></script> <!-- Styled select boxes -->
	<script type="text/javascript" src="plugins/fileinput/fileinput.js"></script>
	<script type="text/javascript" src="plugins/duallistbox/jquery.duallistbox.min.js"></script>
	<script type="text/javascript" src="plugins/bootstrap-inputmask/jquery.inputmask.min.js"></script>
	<script type="text/javascript" src="plugins/bootstrap-wysihtml5/wysihtml5.min.js"></script>
	<script type="text/javascript" src="plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.min.js"></script>
	<script type="text/javascript" src="plugins/bootstrap-multiselect/bootstrap-multiselect.min.js"></script>
	<script type="text/javascript" src="plugins/bootstrap-switch/bootstrap-switch.min.js"></script>

	<!-- DataTables -->
	<script type="text/javascript" src="plugins/datatables/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="plugins/datatables/DT_bootstrap.js"></script>
	<script type="text/javascript" src="plugins/datatables/responsive/datatables.responsive.js"></script>
        
        <!-- Globalize -->
	<script type="text/javascript" src="plugins/globalize/globalize.js"></script>
	<script type="text/javascript" src="plugins/globalize/cultures/globalize.culture.de-DE.js"></script>
	<script type="text/javascript" src="plugins/globalize/cultures/globalize.culture.ja-JP.js"></script>

	<!-- App -->
	<script type="text/javascript" src="assets/js/app.js"></script>
	<script type="text/javascript" src="assets/js/plugins.js"></script>
	<script type="text/javascript" src="assets/js/plugins.form-components.js"></script>

	<script>
	$(document).ready(function(){
		"use strict";

		App.init(); // Init layout and core plugins
		Plugins.init(); // Init all plugins
		FormComponents.init(); // Init all form-specific plugins
	});
	</script>

	<!-- Demo JS -->
	<script type="text/javascript" src="assets/js/custom.js"></script>
	<script type="text/javascript" src="assets/js/demo/form_components.js"></script>
</head>

    <body>

        <!-- Header -->
        <header class="header navbar navbar-fixed-top" role="banner">
            <!-- Top Navigation Bar -->
            <div class="container">

                <!-- Only visible on smartphones, menu toggle -->
                <ul class="nav navbar-nav">
                    <li class="nav-toggle"><a href="javascript:void(0);" title=""><i class="icon-reorder"></i></a></li>
                </ul>

                <!-- Logo -->
                <a class="navbar-brand" href="index.jsp">
                    <img src="assets/img/logo.png" alt="logo" />
                    <strong>SISDEVI</strong>
                </a>
                <!-- /logo -->

                <!-- Sidebar Toggler -->
                <a href="#" class="toggle-sidebar bs-tooltip" data-placement="bottom" data-original-title="Toggle navigation">
                    <i class="icon-reorder"></i>
                </a>
                <!-- /Sidebar Toggler -->

                <!-- Top Left Menu -->
                <ul class="nav navbar-nav navbar-left hidden-xs hidden-sm">
                    <li>
                        <a href="#">
                            Dashboard
                        </a>
                    </li>
                  
                </ul>
                <!-- /Top Left Menu -->

                <!-- Top Right Menu -->
                <ul class="nav navbar-nav navbar-right">
                    <!-- Notifications -->
                    

                    <!-- Tasks -->
                    

                    <!-- Messages -->
                    

                    <!-- .row .row-bg Toggler -->
                   

                    <!-- Project Switcher Button -->
                    

                    <!-- User Login Dropdown -->
                    <li class="dropdown user">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <!--<img alt="" src="assets/img/avatar1_small.jpg" />-->
                            <i class="icon-male"></i>
                            <span class="username"><%= currentUser.getNombre() + " " + currentUser.getApellido() %></span>
                            <i class="icon-caret-down small"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#"><i class="icon-user"></i> My Profile</a></li>
                            
                            <li class="divider"></li>
                            <li><a href="logout.jsp"><i class="icon-key"></i> Log Out</a></li>
                        </ul>
                    </li>
                    <!-- /user login dropdown -->
                </ul>
                <!-- /Top Right Menu -->
            </div>
            <!-- /top navigation bar -->

            <!--=== Project Switcher ===-->
            <div id="project-switcher" class="container project-switcher">
                <div id="scrollbar">
                    <div class="handle"></div>
                </div>

                <div id="frame">
                    <ul class="project-list">
                        <li>
                            <a href="javascript:void(0);">
                                <span class="image"><i class="icon-desktop"></i></span>
                                <span class="title">Lorem ipsum dolor</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);">
                                <span class="image"><i class="icon-compass"></i></span>
                                <span class="title">Dolor sit invidunt</span>
                            </a>
                        </li>
                        <li class="current">
                            <a href="javascript:void(0);">
                                <span class="image"><i class="icon-male"></i></span>
                                <span class="title">Consetetur sadipscing elitr</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);">
                                <span class="image"><i class="icon-thumbs-up"></i></span>
                                <span class="title">Sed diam nonumy</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);">
                                <span class="image"><i class="icon-female"></i></span>
                                <span class="title">At vero eos et</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);">
                                <span class="image"><i class="icon-beaker"></i></span>
                                <span class="title">Sed diam voluptua</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);">
                                <span class="image"><i class="icon-desktop"></i></span>
                                <span class="title">Lorem ipsum dolor</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);">
                                <span class="image"><i class="icon-compass"></i></span>
                                <span class="title">Dolor sit invidunt</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);">
                                <span class="image"><i class="icon-male"></i></span>
                                <span class="title">Consetetur sadipscing elitr</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);">
                                <span class="image"><i class="icon-thumbs-up"></i></span>
                                <span class="title">Sed diam nonumy</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);">
                                <span class="image"><i class="icon-female"></i></span>
                                <span class="title">At vero eos et</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);">
                                <span class="image"><i class="icon-beaker"></i></span>
                                <span class="title">Sed diam voluptua</span>
                            </a>
                        </li>
                    </ul>
                </div> <!-- /#frame -->
            </div> <!-- /#project-switcher -->
        </header> <!-- /.header -->

        <div id="container">
            <div id="sidebar" class="sidebar-fixed">
                <div id="sidebar-content">

                    <!-- Search Input -->
                    <form class="sidebar-search">
                        <div class="input-box">
                            <button type="submit" class="submit">
                                <i class="icon-search"></i>
                            </button>
                            <span>
                                <input type="text" placeholder="Search...">
                            </span>
                        </div>
                    </form>

                    <!-- Search Results -->
                    <div class="sidebar-search-results">

                        <i class="icon-remove close"></i>
                        <!-- Documents -->
                        <div class="title">
                            Documents
                        </div>
                        <ul class="notifications">
                            <li>
                                <a href="javascript:void(0);">
                                    <div class="col-left">
                                        <span class="label label-info"><i class="icon-file-text"></i></span>
                                    </div>
                                    <div class="col-right with-margin">
                                        <span class="message"><strong>John Doe</strong> received $1.527,32</span>
                                        <span class="time">finances.xls</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0);">
                                    <div class="col-left">
                                        <span class="label label-success"><i class="icon-file-text"></i></span>
                                    </div>
                                    <div class="col-right with-margin">
                                        <span class="message">My name is <strong>John Doe</strong> ...</span>
                                        <span class="time">briefing.docx</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <!-- /Documents -->
                        <!-- Persons -->
                        <div class="title">
                            Persons
                        </div>
                        <ul class="notifications">
                            <li>
                                <a href="javascript:void(0);">
                                    <div class="col-left">
                                        <span class="label label-danger"><i class="icon-female"></i></span>
                                    </div>
                                    <div class="col-right with-margin">
                                        <span class="message">Jane <strong>Doe</strong></span>
                                        <span class="time">21 years old</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div> <!-- /.sidebar-search-results -->

                    <!--=== Navigation ===-->
                    <ul id="nav">
                        <li class="current">
                            <a href="index.jsp">
                                <i class="icon-dashboard"></i>
                                Dashboard
                            </a>
                        </li>
                        <li>
                            <a href="verreporte.jsp">
                                <i class="icon-bookmark"></i>
                                Reportes por Victimas
                                </a>
                            
                        </li>
                        <li>
                            <a href="verreportetestigo.jsp">
                                <i class="icon-book"></i>
                                Reportes por Testigos
                            </a>
                            
                        </li>
                        <li>
                            <a href="estadisticas.jsp">
                                <i class="icon-bar-chart"></i>
                                Estadísticas
                            </a>
                            
                        </li>
                        <li>
                            <a href="contactos.jsp">
                                <i class="icon-comment"></i>
                                Contactos
                            </a>
                            
                        </li>
                        <li>
                            <a href="usuarios.jsp">
                                <i class="icon-group"></i>
                                Usuarios
                            </a>
                            
                        </li>

                    </ul>

                    <!-- /Navigation -->
                    

                    <div class="sidebar-widget align-center">
                        <div class="btn-group" data-toggle="buttons" id="theme-switcher">
                            <label class="btn active">
                                <input type="radio" name="theme-switcher" data-theme="bright"><i class="icon-sun"></i> Bright
                            </label>
                            <label class="btn">
                                <input type="radio" name="theme-switcher" data-theme="dark"><i class="icon-moon"></i> Dark
                            </label>
                        </div>
                    </div>

                </div>
                <div id="divider" class="resizeable"></div>
            </div>
            <!-- /Sidebar -->

            <div id="content">
                <div class="container">
                    <!-- Breadcrumbs line -->
                   
                    <!-- /Breadcrumbs line -->

                    <!--=== Page Header ===-->
                    
                    <!-- /Page Header -->
                    
                 <!-- /.row -->

                <!--Contenido -->
          
<%}%>        
                
                