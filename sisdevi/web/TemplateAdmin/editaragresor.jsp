<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioGenero"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.Genero"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioEstadoCivil"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.EstadoCivil"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioProvincia"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.Provincia"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioAgresor"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.Agresor"%>

<jsp:include page="header.jsp"/>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Agresor agresor = ServicioAgresor.getInstancia().getAgresorPorId(id);
    List<Genero> genero = ServicioGenero.getInstancia().getListadoGeneros();
    List<EstadoCivil> estadocivil = ServicioEstadoCivil.getInstancia().getListadoEstadoCivil();
    List<Provincia> provincia = ServicioProvincia.getInstancia().getListadoProvincias();
%>
<form class="form-vertical login-form" action="/sisdevi/AgresorServlet" method="post">
    <input name="idReporte" type="hidden" value="<%=agresor.getReporte().getId()%>">
    <input name="idAgresor" type="hidden" value="<%=agresor.getId()%>">
    <h3 class="form-title">Editar Agresor</h3>
    <div class="form-group">
        <!--<label for="username">Username:</label>-->
        <div class="input-icon">
            <i class="icon-user"></i>
            <input type="text" name="name" class="form-control" placeholder="Nombres" autofocus="autofocus" data-rule-required="true" value="<%=agresor.getNombre()%>" />
        </div>
    </div>
    <div class="form-group">
        <!--<label for="username">Username:</label>-->
        <div class="input-icon">
            <i class="icon-user"></i>
            <input type="text" name="lastname" class="form-control" placeholder="Apellidos"  data-rule-required="true" value="<%=agresor.getApellido()%>" />
        </div>
    </div>

    <div class="form-group">
        <select class="form-control" id="inputGenero" name="inputGenero">
            <option value="<%=agresor.getGenero().getId()%>" selected="selected"><%=agresor.getGenero().getNombre()%></option>

            <c:forEach items="<%=genero%>" var="genero">
                <option value="${genero.getId()}">${genero.getNombre()}</option>
            </c:forEach>
        </select>
    </div>
    <div class="form-group">
        <div class="input-icon">
            <i class="icon-home"></i>
            <input type="text" name="direccion" class="form-control" placeholder="Dirección"  data-rule-required="true" value="<%=agresor.getDireccion()%>" />
        </div>
    </div>
    <div class="form-group">
        <select class="form-control" id="Provincia" name="inputProvincia">
            <option value="<%=agresor.getProvincia().getId()%>" ><%=agresor.getProvincia().getNombre()%></option>
            <c:forEach items="<%=provincia%>" var="provincia">
                <option value="${provincia.getId()}">${provincia.getNombre()}</option>
            </c:forEach>
        </select>
    </div>
    <div class="form-group">
        <div class="input-icon">
            <i class="icon-phone"></i>
            <input type="text" name="telefono" class="form-control" placeholder="Telefono"  data-rule-required="true" value="<%=agresor.getTelefono()%>" data-mask="(999)-999-9999" />
        </div>
    </div>
    <div class="form-group">
        <div class="input-icon">
            <i class="icon-phone"></i>
            <input type="text" name="celular" class="form-control" placeholder="Celular"  data-rule-required="true"  value="<%=agresor.getCelular()%>" data-mask="(999)-999-9999"/>
        </div>
    </div>

    <div class="form-group">
        <select class="form-control" id="inputEstadocivil" name="inputEstadocivil">
            <option value="<%=agresor.getEstadocivil().getId()%>" selected="selected"><%=agresor.getEstadocivil().getNombre()%></option>

            <c:forEach items="<%=estadocivil%>" var="estadocivil">
                <option value="${estadocivil.getId()}">${estadocivil.getNombre()}</option>
            </c:forEach>
        </select>
    </div>

    <!-- Fecha de Nacimiento -->   
    <div class="form-group">
        <div class="input-icon">
            <i class="icon-calendar"></i>
            <input type="text" name="inputFecha" class="form-control" placeholder="Fecha" value="<%=agresor.getFecha_nacimiento()%>" data-mask="9999-99-99"/>
        </div>
    </div>


    <div class="form-group">

        <div class="input-icon">
            <i class="icon-credit-card"></i>
            <input type="text" name="cedula" class="form-control" placeholder="Cedula"  data-rule-required="true"  value="<%=agresor.getCedula()%>" data-mask="999-9999999-9"/>
        </div>
    </div>

    

    <div class="form-actions">
        <button type="submit" class="submit btn btn-primary pull-right">
            Enviar <i class="icon-angle-right"></i>
        </button>
    </div>
</form>




<jsp:include page="footer.jsp"/>