<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioProvincia"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.Provincia"%>

<jsp:include page="../TemplateWeb/header.jsp"/>
<%
    List<Provincia> provincia = ServicioProvincia.getInstancia().getListadoProvincias();

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
                    <img src="../TemplateWeb/assets/img/logo.png"  alt=""/>
                </a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#header">TU REPORTE</a></li>
                    <li><a href="../TemplateWeb/index.html#services">Como Usar SISDEVI</a></li>
                    <li><a href="../TemplateWeb/index.html#clients">Que es SISDEVI</a></li>
                    <li><a href="../TemplateWeb/index.html#works">Noticias</a></li>
                    <li><a href="../TemplateWeb/index.html#team">Administrador</a></li>
                    <li><a href="../TemplateWeb/index.html#contact">Contacto</a></li>
                </ul>
            </div>

        </div>
    </div>
    <!-- NAVBAR END  -->

    <!--HEADER SECTION END  -->
    <section id="header">
        <div class="container">

            <div class="jumbotron">
                <h1>¿Es usted un testigo o una victima de violencia de género?</h1>

                <p><a class="btn btn-primary btn-lg" href="#victima" role="button">Soy una Victima</a>
                    <a class="btn btn-primary btn-lg" href="#testigo" role="button">Soy un Testigo</a></p>
            </div>         


        </div>


    </section>
    <!-- SERVICES SECTION END  -->

    <section id="victima">
        <div class="container">

            <form class="form-vertical login-form" action="/Sisdevi/VictimaServlet" method="post">

                <h3 class="form-title">Crear Reporte</h3>
                <div class="form-group">
                    <!--<label for="username">Username:</label>-->
                    <div class="input-icon">
                        <i class="icon-user"></i>
                        <input type="text" name="name" class="form-control" placeholder="Nombres" autofocus="autofocus" data-rule-required="true"  />
                    </div>
                </div>
                <div class="form-group">
                    <!--<label for="username">Username:</label>-->
                    <div class="input-icon">
                        <i class="icon-user"></i>
                        <input type="text" name="lastname" class="form-control" placeholder="Apellidos"  data-rule-required="true"  />
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-icon">
                        <i class="icon-user"></i>
                        <input type="text" name="direccion" class="form-control" placeholder="Dirección"  data-rule-required="true"  />
                    </div>
                </div>
                <div class="form-group">
                    <select class="form-control" id="Provincia" name="provincia">
                        <option>Seleccione su Provincia</option>
                        <c:forEach items="<%=provincia%>" var="provincia">
                            <option value="${provincia.getId()}">${provincia.getNombre()}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <div class="input-icon">
                        <i class="icon-user"></i>
                        <input type="text" name="telefono" class="form-control" placeholder="Telefono"  data-rule-required="true"  />
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-icon">
                        <i class="icon-user"></i>
                        <input type="text" name="Celular" class="form-control" placeholder="Celular"  data-rule-required="true"  />
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-icon">
                        <i class="icon-envelope"></i>
                        <input type="text" name="correo" class="form-control" placeholder="Correo electrónico" data-rule-email="true" />
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

            <form class="form-vertical login-form" action="/Sisdevi/TestigoServlet" method="post">

                <h3 class="form-title">Datos del Testigo</h3>
                <div class="form-group">
                    <!--<label for="username">Username:</label>-->
                    <div class="input-icon">
                        <i class="icon-user"></i>
                        <input type="text" name="name" class="form-control" placeholder="Nombres" autofocus="autofocus" data-rule-required="true"  />
                    </div>
                </div>
                <div class="form-group">
                    <!--<label for="username">Username:</label>-->
                    <div class="input-icon">
                        <i class="icon-user"></i>
                        <input type="text" name="lastname" class="form-control" placeholder="Apellidos"  data-rule-required="true"  />
                    </div>
                </div>


                <div class="form-group">
                    <div class="input-icon">
                        <i class="icon-user"></i>
                        <input type="text" name="telefono" class="form-control" placeholder="Telefono"  data-rule-required="true"  />
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-icon">
                        <i class="icon-user"></i>
                        <input type="text" name="celular" class="form-control" placeholder="Celular"  data-rule-required="true"  />
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-icon">
                        <i class="icon-envelope"></i>
                        <input type="text" name="correo" class="form-control" placeholder="Correo electrónico" data-rule-email="true" />
                    </div>
                </div>
                <div class="form-group">
                    <select class="form-control" id="Provincia" name="provincia">
                        <option value="en-EN" selected="selected">Su Relacion con la victima</option>
                        <option value="de-DE">German</option>
                        <option value="ja-JP">Japanese</option>
                    </select>
                </div>
                <h3 class="form-title">Datos de la Victima</h3>


                <div class="form-group">
                    <!--<label for="username">Username:</label>-->
                    <div class="input-icon">
                        <i class="icon-user"></i>
                        <input type="text" name="namev" class="form-control" placeholder="Nombres" autofocus="autofocus" data-rule-required="true"  />
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
                        <input type="text" name="direccionv" class="form-control" placeholder="Dirección"  data-rule-required="true"  />
                    </div>
                </div>
                <div class="form-group">
                    <select class="form-control" id="Provincia" name="provinciav">
                        <option>Seleccione su Provincia</option>
                        <c:forEach items="<%=provincia%>" var="provincia">
                            <option value="${provincia.getId()}">${provincia.getNombre()}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <div class="input-icon">
                        <i class="icon-user"></i>
                        <input type="text" name="telefonov" class="form-control" placeholder="Telefono"  data-rule-required="true"  />
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-icon">
                        <i class="icon-user"></i>
                        <input type="text" name="celularv" class="form-control" placeholder="Celular"  data-rule-required="true"  />
                    </div>
                </div>
                <label for="notas">Notas:</label>
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
    <!-- WORK SECTION END  -->

    <!-- TESTIMONIAL SECTION END  -->

    <!-- TEAM SECTION END -->

    <!-- CONTACT SECTION END -->





    <jsp:include page="../TemplateWeb/footer.jsp"/>