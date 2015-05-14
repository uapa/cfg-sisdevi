<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioProvincia"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.Provincia"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioVinculo"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.Vinculo"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <!--[if IE]>
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
            <![endif]-->
        <title>Sistema para la detecci�n y abordaje de la violencia</title>
        <!-- BOOTSTRAP CORE CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet" />
        <!-- IONICON STYLE SHEET FOR BEAUTIFUL ICONS -->
        <link href="assets/css/ionicons.css" rel="stylesheet" />
        <!-- STYLE FOR OPENING IMAGE IN POPUP USING FANCYBOX-->
        <link href="assets/js/source/jquery.fancybox.css" rel="stylesheet" />
        <!-- CUSTOM CSS -->
        <link href="assets/css/style.css" rel="stylesheet" />
        <link href="assets/css/jasny-bootstrap.css" rel="stylesheet" />
        <!-- HTML5 Shiv and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <%
        List<Provincia> provincia = ServicioProvincia.getInstancia().getListadoProvincias();
        List<Vinculo> vinculo = ServicioVinculo.getInstancia().getListadoVinculos();

    %>
    <body data-spy="scroll" data-target=".navbar-fixed-top">

        <div class="navbar navbar-default navbar-fixed-top scroll-me">
            <!-- pass scroll-me class above a tags to starts scrolling -->
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">
                        <img src="/assets/img/logo.png"  alt=""/>
                    </a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#header">TU REPORTE</a></li>
                        <li><a href="index.jsp#services">Como Usar SISDEVI</a></li>
                        <li><a href="index.jsp#clients">Que es SISDEVI</a></li>
                        
                        <li><a href="/sisdevi/TemplateAdmin/login.jsp">Administrador</a></li>
                        <li><a href="index.jsp#contact">Contacto</a></li>
                    </ul>
                </div>

            </div>
        </div>
        <!-- NAVBAR END  -->

        <!--HEADER SECTION END  -->
        <section id="header">
            <div class="container">

                <div class="jumbotron">
                    <h1>�Es usted un testigo o una victima de violencia de g�nero?</h1>

                    <p><a class="btn btn-primary btn-lg" href="#victima" role="button">Soy una Victima</a>
                        <a class="btn btn-primary btn-lg" href="#testigo" role="button">Soy un Testigo</a></p>
                </div>         


            </div>


        </section>
        <!-- SERVICES SECTION END  -->

        <section id="victima">
            <div class="container">

                <form class="cmxform" id="newsletter" action="/sisdevi/ReporteVictimaServlet" method="post">
                    <input name="inputEstado" type="hidden" value="1">
                    <h3 class="form-title">Crear Reporte</h3>
                    <div class="form-group">
                        <!--<label for="username">Username:</label>-->
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="name" class="form-control" placeholder="Nombres" autofocus="autofocus" data-rule-required="true"  required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <!--<label for="username">Username:</label>-->
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="lastname" class="form-control" placeholder="Apellidos"  data-rule-required="true"  required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="direccion" class="form-control" placeholder="Direcci�n"  data-rule-required="true"  required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <select class="form-control" id="Provincia" name="inputProvincia" title="Seleccione su Provincia" required>
                            <option value="">Seleccione su Provincia</option>
                            <c:forEach items="<%=provincia%>" var="provincia">
                                <option value="${provincia.getId()}">${provincia.getNombre()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="telefono" class="form-control" placeholder="Telefono"  data-rule-required="true" data-mask="(999)-999-9999" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="celular" class="form-control" placeholder="Celular"  data-rule-required="true" data-mask="(999)-999-9999"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-icon">
                            <i class="icon-envelope"></i>
                            <input type="email" name="correo" class="form-control" placeholder="Correo electr�nico" data-rule-email="true" />
                        </div>
                    </div>


                    <div class="form-actions">
                        <button type="submit" class="submit btn btn-primary pull-right">
                            Enviar <i class="icon-angle-right"></i>
                        </button>
                    </div>
                </form>

            </div>

        </section>


        <!-- CLIENTS SECTION END  -->
        <section id="testigo">
            <div class="container">

                <form class="cmxform" id="newsletter" action="/sisdevi/ReporteTestigoServlet" method="post">

                    <h3 class="form-title">Datos del Testigo</h3>
                    <div class="form-group">
                        <!--<label for="username">Username:</label>-->
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="name" class="form-control" placeholder="Nombres" autofocus="autofocus" data-rule-required="true"  required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <!--<label for="username">Username:</label>-->
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="lastname" class="form-control" placeholder="Apellidos"  data-rule-required="true"  required/>
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="telefono" class="form-control" placeholder="Telefono"  data-rule-required="true" data-mask="(999)-999-9999" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="celular" class="form-control" placeholder="Celular"  data-rule-required="true" data-mask="(999)-999-9999"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-icon">
                            <i class="icon-envelope"></i>
                            <input type="email" name="correo" class="form-control" placeholder="Correo electr�nico" data-rule-email="true" />
                        </div>
                    </div>
                    <div class="form-group">
                        <select class="form-control" id="vinculo" name="inputVinculo" title="Su Relacion con la victima" required>
                            <option value="">Su Relacion con la victima</option>
                            <c:forEach items="<%=vinculo%>" var="vinculo">
                                <option value="${vinculo.getId()}">${vinculo.getNombre()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <h3 class="form-title">Datos de la Victima</h3>


                    <div class="form-group">
                        <!--<label for="username">Username:</label>-->
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="namev" class="form-control" placeholder="Nombres" autofocus="autofocus" data-rule-required="true"  required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <!--<label for="username">Username:</label>-->
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="lastnamev" class="form-control" placeholder="Apellidos"  data-rule-required="true"  />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="direccionv" class="form-control" placeholder="Direcci�n"  data-rule-required="true"  required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <select class="form-control" id="Provincia" name="inputProvinciav" title="Seleccione su Provincia" required>
                            <option value="">Seleccione su Provincia</option>
                            <c:forEach items="<%=provincia%>" var="provincia">
                                <option value="${provincia.getId()}">${provincia.getNombre()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="telefonov" class="form-control" placeholder="Telefono"  data-rule-required="true" data-mask="(999)-999-9999" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="celularv" class="form-control" placeholder="Celular"  data-rule-required="true" data-mask="(999)-999-9999"/>
                        </div>
                    </div>
                    <label for="notas">Breve relato de los hechos</label>
                    <div class="form-group">
                        <textarea rows="3" cols="5" name="notas" class="form-control"></textarea>
                    </div>


                    <div class="form-actions">
                        <button type="submit" class="submit btn btn-primary pull-right">
                            Enviar <i class="icon-angle-right"></i>
                        </button>
                    </div>
                </form>

            </div>

        </section>
         <section id="enviado" data-scroll-reveal="enter from the bottom after 0.2s">
            <div class="overlay">
            <div class="container">
            <br>
                <br>
                    <br>
                        <br>
                            <br>
                <h2>Su reporte fue enviado</h2>
                <p>Su reporte ha sido enviado correctamente. Gracias por ponerse en contacto con nosotros.
                    
                    En breve, su reporte ser� atendido.
                </p>
                     <br>
                <br>
                    <br>
                        <br>
                            <br>
            </div>
                </div>
        </section>
        <footer>
            &copy 2015 sisdevi.com  | <a href="http://www.designbootstrap.com/" target="_blank">by Curso Final de Grado</a>
        </footer>
        <!--FOOTER SECTION END  -->
        <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
        <!-- CORE JQUERY  SCRIPTS -->
        <script src="assets/js/jquery-1.11.1.js"></script>
        <!-- BOOTSTRAP SCRIPTS  -->
        <script src="assets/js/bootstrap.js"></script>
        <!-- SCROLLING SCRIPTS PLUGIN  -->
        <script src="assets/js/jquery.easing.min.js"></script>
        <!--  FANCYBOX PLUGIN -->
        <script src="assets/js/source/jquery.fancybox.js"></script>
        <!-- ISOTOPE SCRIPTS -->
        <script src="assets/js/jquery.isotope.js"></script>
        <!-- SCROLL ANIMATIONS  -->
        <script src="assets/js/scrollReveal.js"></script>
        <!-- CUSTOM SCRIPTS   -->
        <script src="assets/js/custom.js"></script>
        <script src="assets/js/jasny-bootstrap.js"></script>
        <script src="assets/js/jquery.validate.js"></script>
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
