


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />
        <title>SISDEVI</title>

        <!--=== CSS ===-->
        <script src="assets/js/jquery.validate.js"></script>
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

        <!-- Theme -->
        <link href="assets/css/main.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/plugins.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/responsive.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/icons.css" rel="stylesheet" type="text/css" />

        <!-- Login -->
        <link href="assets/css/login.css" rel="stylesheet" type="text/css" />

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



        <!-- App -->
        <script type="text/javascript" src="assets/js/login.js"></script>
        <script>
            $(document).ready(function () {
                "use strict";

                Login.init(); // Init login JavaScript
            });
        </script>
    </head>

    <body class="login">
        <!-- Logo -->
        <div class="logo">
            <img src="assets/img/logo.png" alt="logo" />
            <strong>SISDEVI</strong>
        </div>
        <!-- /Logo -->

        <!-- Login Box -->
        <div class="box">
            <div class="content">
                <!-- Login Formular -->
                <form class="form-vertical login-form cmxform" id="newsletter" action="/sisdevi/LoginServlet" method="post">
                    <!-- Title -->
                    <h3 class="form-title">Ingresa a tu Cuenta</h3>

                    <!-- Error Message -->
                    <div class="alert fade in alert-danger" style="display: none;">
                        <i class="icon-remove close" data-dismiss="alert"></i>
                        Introduzca nombre de usuario y contraseña.
                    </div>

                    <!-- Input Fields -->
                    <div class="form-group">
                        <!--<label for="username">Username:</label>-->
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="username" class="form-control" placeholder="Username" autofocus="autofocus" data-rule-required="true" data-msg-required="Please enter your username." required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <!--<label for="password">Password:</label>-->
                        <div class="input-icon">
                            <i class="icon-lock"></i>
                            <input type="password" name="password" class="form-control" placeholder="Password" data-rule-required="true" data-msg-required="Please enter your password." required/>
                        </div>
                    </div>
                    <!-- /Input Fields -->

                    <!-- Form Actions -->
                    <div class="form-actions">
                        <label class="checkbox pull-left"><input type="checkbox" class="uniform" name="remember"> Recuerdame</label>
                        <button type="submit" class="submit btn btn-primary pull-right">
                            Entrar <i class="icon-angle-right"></i>
                        </button>
                    </div>
                </form>
                <!-- /Login Formular -->
               
                <!-- Register Formular (hidden by default) -->
                <form class="form-vertical register-form cmxform" id="newsletter" action="/sisdevi/UsuarioServlet" method="post" style="display: none;">
                    <!-- Title -->
                    <input name="idEstado" type="hidden" value="1">
                    <h3 class="form-title">Regístrate</h3>

                    <!-- Input Fields -->
                    <div class="form-group">
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="name" class="form-control" placeholder="Nombres" autofocus="autofocus" data-rule-required="true" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="lastname" class="form-control" placeholder="Apellidos" data-rule-required="true" required/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="input-icon">
                            <i class="icon-envelope"></i>
                            <input type="text" name="correo" class="form-control" placeholder="Correo" data-rule-required="true" required/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="username" class="form-control" placeholder="Nombre de usuario" data-rule-required="true" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-icon">
                            <i class="icon-lock"></i>
                            <input type="password" name="password" class="form-control" placeholder="Contraseña" id="register_password" data-rule-required="true" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-icon">
                            <i class="icon-ok"></i>
                            <input type="password" name="password_confirm" class="form-control" placeholder="Confirm Password" data-rule-required="true" data-rule-equalTo="#register_password" required/>
                        </div>
                    </div>
                    
                    <div class="form-group spacing-top">
                        <label class="checkbox"><input type="checkbox" class="uniform" name="remember" data-rule-required="true" data-msg-required="Please accept ToS first."> Acepto las  <a href="javascript:void(0);">Condiciones del servicio</a></label>
                        <label for="remember" class="has-error help-block" generated="true" style="display:none;"></label>
                    </div>
                    <!-- /Input Fields -->

                    <!-- Form Actions -->
                    <div class="form-actions">
                        <button type="button" class="back btn btn-default pull-left">
                            <i class="icon-angle-left"></i> Atras</i>
                        </button>
                        <button type="submit" class="submit btn btn-primary pull-right">
                            Enviar <i class="icon-angle-right"></i>
                        </button>
                    </div>
                </form>
                <!-- /Register Formular -->
            </div> <!-- /.content -->

            <!-- Forgot Password Form -->
            <div class="inner-box">
                <div class="content">
                    <!-- Close Button -->
                    <i class="icon-remove close hide-default"></i>

                    <!-- Link as Toggle Button -->
                    <a href="#" class="forgot-password-link">Has Olvidado Tu Contraseña?</a>

                    <!-- Forgot Password Formular -->
                    <form class="form-vertical forgot-password-form hide-default" action="login.html" method="post">
                        <!-- Input Fields -->
                        <div class="form-group">
                            <!--<label for="email">Email:</label>-->
                            <div class="input-icon">
                                <i class="icon-envelope"></i>
                                <input type="text" name="email" class="form-control" placeholder="Enter email address" data-rule-required="true" data-rule-email="true" data-msg-required="Please enter your email." />
                            </div>
                        </div>
                        <!-- /Input Fields -->

                        <button type="submit" class="submit btn btn-default btn-block">
                            Restablecer su contraseña
                        </button>
                    </form>
                    <!-- /Forgot Password Formular -->

                    <!-- Shows up if reset-button was clicked -->
                    <div class="forgot-password-done hide-default">
                        <i class="icon-ok success-icon"></i> <!-- Error-Alternative: <i class="icon-remove danger-icon"></i> -->
                        <span>Te hemos enviado un correo electrónico.</span>
                    </div>
                </div> <!-- /.content -->
            </div>
            <!-- /Forgot Password Form -->
        </div>
        <!-- /Login Box -->

        <!-- Single-Sign-On (SSO) -->

        <!-- /Single-Sign-On (SSO) -->

        <!-- Footer -->
        <div class="footer">
            <a href="#" class="sign-up">¿No tienes una cuenta? <strong>Solicitar acceso</strong></a>
        </div>
        <!-- /Footer -->
        <script>
	$.validator.setDefaults({
		submitHandler: function() {
			alert("submitted!");
		}
	});

	$().ready(function() {
		// validate the comment form when it is submitted
		$("#commentForm").validate();

		// validate signup form on keyup and submit
		$("#signupForm").validate({
			rules: {
				firstname: "required",
				lastname: "required",
				username: {
					required: true,
					minlength: 2
				},
				password: {
					required: true,
					minlength: 5
				},
				confirm_password: {
					required: true,
					minlength: 5,
					equalTo: "#password"
				},
				email: {
					required: true,
					email: true
				},
				topic: {
					required: "#newsletter:checked",
					minlength: 2
				},
				agree: "required"
			},
			messages: {
				firstname: "Please enter your firstname",
				lastname: "Please enter your lastname",
				username: {
					required: "Please enter a username",
					minlength: "Your username must consist of at least 2 characters"
				},
				password: {
					required: "Please provide a password",
					minlength: "Your password must be at least 5 characters long"
				},
				confirm_password: {
					required: "Please provide a password",
					minlength: "Your password must be at least 5 characters long",
					equalTo: "Please enter the same password as above"
				},
				email: "Please enter a valid email address",
				agree: "Please accept our policy"
			}
		});

		// propose username by combining first- and lastname
		$("#username").focus(function() {
			var firstname = $("#firstname").val();
			var lastname = $("#lastname").val();
			if (firstname && lastname && !this.value) {
				this.value = firstname + "." + lastname;
			}
		});

		//code to hide topic selection, disable for demo
		var newsletter = $("#newsletter");
		// newsletter topics are optional, hide at first
		var inital = newsletter.is(":checked");
		var topics = $("#newsletter_topics")[inital ? "removeClass" : "addClass"]("gray");
		var topicInputs = topics.find("input").attr("disabled", !inital);
		// show when newsletter is checked
		newsletter.click(function() {
			topics[this.checked ? "removeClass" : "addClass"]("gray");
			topicInputs.attr("disabled", !this.checked);
		});
	});
	</script>
	<style>
	#commentForm {
		width: 500px;
	}
	#commentForm label {
		width: 250px;
	}
	#commentForm label.error, #commentForm input.submit {
		margin-left: 253px;
	}
	#signupForm {
		width: 670px;
	}
	#signupForm label.error {
		margin-left: 10px;
		width: auto;
		display: inline;
	}
	#newsletter_topics label.error {
		display: none;
		margin-left: 103px;
	}
	</style>
    </body>
</html>