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
        <title>SISDEVI</title>
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
                    <a class="navbar-brand" href="index.jsp">
                        <img src="assets/img/logo.png"  alt=""/>
                    </a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="reportes.jsp#header">TU REPORTE</a></li>
                        <li><a href="#services">Como Usar SISDEVI</a></li>
                        <li><a href="#clients">Que es SISDEVI</a></li>

                        <li><a href="/sisdevi/TemplateAdmin/login.jsp">Administrador</a></li>
                        <li><a href="#contact">Contacto</a></li>
                    </ul>
                </div>

            </div>
        </div>
        <!-- NAVBAR END  -->
        <div id="header">
            <div class="overlay">
                <div class="container">
                    <div class="row scroll-me">
                        <div class="col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3 text-center ">

                            <h1 data-scroll-reveal="enter from the bottom after 0.2s">Sistema para la detección y abordaje de la violencia (SISDEVI)
                            </h1>

                            <h4 data-scroll-reveal="enter from the bottom after 0.4s">Es un sistema que permite que cualquier supuesta víctima o testigo reporte incidentes de violencia de género. 

                            </h4>
                            <a data-scroll-reveal="enter from the bottom after 0.6s" href="reportes.jsp" class="btn btn-danger set-bk-clr">Reportar un Caso</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!--HEADER SECTION END  -->
        <section id="services">
            <div class="container">
                <br>
                    <br>
                        <br>
                            <br>
                                <br>
                                    <h3>
                                        Entras al sitio web de SISDEVI das clic en la opción crear reportes eliges si eres una victima o un testigo e introduces tus datos de contacto.
                                        Los responsables de SISDEVI serán las personas encargadas de comprobar la veracidad del reporte, y de acuerdo al hecho, formalizarla o derivarla a la instancia correspondiente.
                                    </h3>
                                    <br>
                                        <br>
                                            <br>
                                                <br>
                                                    <br>





                                                        </div>


                                                        </section>
                                                        <!-- SERVICES SECTION END  -->
                                                        <div id="clients">
                                                            <div class="overlay">
                                                                <div class="container">
                                                                    <br>
                                                                        <br>
                                                                            <br>
                                                                                <br>
                                                                                    <br>
                                                                                        <h3>
                                                                                            SISDEVI es un sistema que permite que cualquier supuesta víctima o testigo reportar incidentes de violencia de género. Para ello, bastará con que complete un formulario virtual, nadie tendrá acceso a los datos de la persona que reporte el incidente ya que quedarán restringidos para quienes manejen el sistema a nivel nacional.
                                                                                        </h3>
                                                                                        <br>
                                                                                            <br>
                                                                                                <br>
                                                                                                    <br>
                                                                                                        <br>
                                                                                                            </div>
                                                                                                            </div>
                                                                                                            </div>
                                                                                                            <!-- CLIENTS SECTION END  -->
                                                                                                            <section id="works">
                                                                                                                <div class="container">

                                                                                                                </div>
                                                                                                            </section>
                                                                                                            <!-- WORK SECTION END  -->
                                                                                                            <div id="testimonial" data-scroll-reveal="enter from the bottom after 0.2s">
                                                                                                                <div class="overlay">
                                                                                                                    <div class="container">

                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                            <!-- TESTIMONIAL SECTION END  -->
                                                                                                            <section id="team">
                                                                                                                <div class="container">



                                                                                                                </div>
                                                                                                            </section>
                                                                                                            <!-- TEAM SECTION END -->
                                                                                                            <section id="contact">
                                                                                                                <div class="overlay">
                                                                                                                    <div class="container">
                                                                                                                        <form class="cmxform" id="newsletter" action="/sisdevi/ContactoServlet" method="post">
                                                                                                                            <input name="idEstado" type="hidden" value="1">
                                                                                                                                <h3 class="form-title">Formulario de Contacto</h3>
                                                                                                                                <div class="form-group">
                                                                                                                                    <!--<label for="username">Username:</label>-->
                                                                                                                                    <div class="input-icon">
                                                                                                                                        <i class="icon-user"></i>
                                                                                                                                        <input type="text" name="name" class="form-control" placeholder="Nombres" data-rule-required="true"  required/>
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
                                                                                                                                        <i class="icon-envelope"></i>
                                                                                                                                        <input type="email" name="correo" class="form-control" placeholder="Correo electrónico" data-rule-email="true" required/>
                                                                                                                                    </div>
                                                                                                                                </div>
                                                                                                                                <label for="notas">Mensaje:</label>
                                                                                                                                <div class="form-group">
                                                                                                                                    <textarea rows="3" cols="5" name="mensaje" class="form-control" required></textarea>
                                                                                                                                </div>

                                                                                                                                <div class="form-actions">
                                                                                                                                    <button type="submit" class="submit btn btn-primary pull-right">
                                                                                                                                        Enviar <i class="icon-angle-right"></i>
                                                                                                                                    </button>
                                                                                                                                </div>




                                                                                                                        </form>




                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </section>
                                                                                                            <!-- CONTACT SECTION END -->
                                                                                                            <section id="enviado" data-scroll-reveal="enter from the bottom after 0.2s">
                                                                                                                <div class="overlay">
                                                                                                                    <div class="container">
                                                                                                                        <br>
                                                                                                                            <br>
                                                                                                                                <br>
                                                                                                                                    <br>
                                                                                                                                        <br>
                                                                                                                                            <h2>Su mensaje fue enviado</h2>
                                                                                                                                            <p>Su mensaje ha sido enviado correctamente. Gracias por ponerse en contacto con nosotros.

                                                                                                                                                En breve, le contestaremos.
                                                                                                                                            </p>
                                                                                                                                            <br>
                                                                                                                                                <br>
                                                                                                                                                    <br>
                                                                                                                                                        <br>
                                                                                                                                                            <br>
                                                                                                                                                                </div>
                                                                                                                                                                </div>
                                                                                                                                                                </section>
                                                                                                                                                                <section id="error" data-scroll-reveal="enter from the bottom after 0.2s">
                                                                                                                                                                    <div class="overlay">
                                                                                                                                                                        <div class="container">
                                                                                                                                                                            <br>
                                                                                                                                                                                <br>
                                                                                                                                                                                    <br>
                                                                                                                                                                                        <br>
                                                                                                                                                                                            <br>
                                                                                                                                                                                                <h2>Su mensaje no se envió</h2>
                                                                                                                                                                                                <p>Ha ocurrido un error, por favor intente de nuevo
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
                                                                                                                                                                                                        &copy 2015 sisdevi.com  | <a href="http://www.designbootstrap.com/" target="_blank">by DesignBootstrap</a>
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
                                                                                                                                                                                                                submitHandler: function () {
                                                                                                                                                                                                                    alert("submitted!");
                                                                                                                                                                                                                }
                                                                                                                                                                                                            });

                                                                                                                                                                                                            $().ready(function () {
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
                                                                                                                                                                                                                $("#username").focus(function () {
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
                                                                                                                                                                                                                newsletter.click(function () {
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
