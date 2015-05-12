<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />
	<title>SISDEVI</title>

	<!--=== CSS ===-->

	<!-- Bootstrap -->
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

	<!-- Theme -->
	<link href="assets/css/main.css" rel="stylesheet" type="text/css" />
	<link href="assets/css/plugins.css" rel="stylesheet" type="text/css" />
	<link href="assets/css/responsive.css" rel="stylesheet" type="text/css" />
	<link href="assets/css/icons.css" rel="stylesheet" type="text/css" />

	<!-- Login -->
	<link href="assets/css/error.css" rel="stylesheet" type="text/css" />

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

	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/js/libs/lodash.compat.min.js"></script>

	<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
		<script src="assets/js/libs/html5shiv.js"></script>
	<![endif]-->
</head>

<body class="error">
    <%session.invalidate();%>
	<!--=== Error Title ===-->
	<div class="title">
		<h1>Usted cerr� session.</h1> <!-- You can use something like <h1 class="red">500</h1> for other error codes -->
	</div>
	<!-- /Error Title -->

	<div class="actions">
		<div class="list-group">
			<li class="list-group-item list-group-header align-center">
				Usted cerr&oacute; session.
			</li>
			<a href="login.jsp" class="list-group-item"><i class="icon-home"></i> Acceder nuevamente <i class="icon-angle-right align-right"></i></a>
			<a href="javascript:void(0);" class="list-group-item"><i class="icon-question"></i> Support <i class="icon-angle-right align-right"></i></a>
			<a href="javascript:void(0);" class="list-group-item"><i class="icon-phone"></i> Call us <i class="icon-angle-right align-right"></i> <span class="badge">021-215-584</span></a>
		</div>
	</div>

	<!-- Footer -->
	<div class="footer">
		SISDEVI<br>&copy; 2015
	</div>
	<!-- /Footer -->
</body>
</html>

