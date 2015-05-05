<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioGenero"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.Genero"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioEstadoCivil"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.EstadoCivil"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioProvincia"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.Provincia"%>

<jsp:include page="header.jsp"/>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    List<Genero> genero = ServicioGenero.getInstancia().getListadoGeneros();
    List<EstadoCivil> estadocivil = ServicioEstadoCivil.getInstancia().getListadoEstadoCivil();
    List<Provincia> provincia = ServicioProvincia.getInstancia().getListadoProvincias();
%>
<form class="form-vertical login-form" action="/sisdevi/AgresorServlet" method="post">

    <h3 class="form-title">Agregar Agresor</h3>
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
        <select class="form-control" id="inputGenero" name="inputGenero">
            <option value="1" selected="selected">Seleccione el Genero</option>

            <c:forEach items="<%=genero%>" var="genero">
                <option value="${genero.getId()}">${genero.getNombre()}</option>
            </c:forEach>
        </select>
    </div>
    <div class="form-group">
        <div class="input-icon">
            <i class="icon-home"></i>
            <input type="text" name="direccion" class="form-control" placeholder="Dirección"  data-rule-required="true"  />
        </div>
    </div>
    <div class="form-group">
        <select class="form-control" id="Provincia" name="inputProvincia">
            <option>Seleccione su Provincia</option>
            <c:forEach items="<%=provincia%>" var="provincia">
                <option value="${provincia.getId()}">${provincia.getNombre()}</option>
            </c:forEach>
        </select>
    </div>
    <div class="form-group">
        <div class="input-icon">
            <i class="icon-phone"></i>
            <input type="text" name="telefono" class="form-control" placeholder="Telefono"  data-rule-required="true" data-mask="(999)-999-9999" />
        </div>
    </div>
    <div class="form-group">
        <div class="input-icon">
            <i class="icon-phone-sign"></i>
            <input type="text" name="celular" class="form-control" placeholder="Celular"  data-rule-required="true" data-mask="(999)-999-9999" />
        </div>
    </div>

    <div class="form-group">
        <select class="form-control" id="inputEstadocivil" name="inputEstadocivil">
            <option value="1" selected="selected">Seleccione el Estado civil</option>

            <c:forEach items="<%=estadocivil%>" var="estadocivil">
                <option value="${estadocivil.getId()}">${estadocivil.getNombre()}</option>
            </c:forEach>
        </select>
    </div>

    <!-- Fecha de Nacimiento -->   
    <div class="form-group">
        <div class="input-icon">
            <i class="icon-calendar"></i>
            <input type="text" name="inputFecha" class="form-control" placeholder="Fecha" data-mask="9999-99-99" />
        </div>
    </div>


    <div class="form-group">

        <div class="input-icon">
            <i class="icon-credit-card"></i>
            <input type="text" name="cedula" class="form-control" placeholder="Cedula"  data-rule-required="true" data-mask="999-9999999-9" />
        </div>
    </div>

    <input name="idReporte" type="hidden" value="<%=id%>">

    <div class="form-actions">
        <button type="submit" class="submit btn btn-primary pull-right">
            Enviar <i class="icon-angle-right"></i>
        </button>
    </div>
</form>




<jsp:include page="footer.jsp"/>