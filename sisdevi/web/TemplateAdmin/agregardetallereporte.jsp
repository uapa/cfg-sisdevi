<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioDetalleReporte"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.DetalleReporte"%>

<jsp:include page="header.jsp"/>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    DetalleReporte reporte = ServicioDetalleReporte.getInstancia().getDetallePorReporteId(id);
%>
<form class="form-vertical login-form" action="/sisdevi/DetalleReporteServlet" method="post">

    <h3 class="form-title">Agregar Detalles Reporte</h3>


    <div class="form-group">
        <select class="form-control" id="inputGenero" name="inputGenero">
            <option value="1" selected="selected">Seleccione el Genero</option>
            <option value="1">Mujer</option>
            <option value="2">Hombre</option>
        </select>
    </div>
    <div class="form-group">
        <select class="form-control" id="inputEstadocivil" name="inputEstadocivil">
            <option value="1" selected="selected">Seleccione el Estado civil</option>
            <option value="1">Casado</option>
            <option value="2">Soltero</option>
        </select>
    </div>

    <!-- Fecha de Nacimiento -->   
    <div class="form-group">
        <div class="input-icon">
            <i class="icon-user"></i>
            <input type="text" name="fecha" class="form-control"  />
        </div>
    </div>


    <div class="form-group">

        <div class="input-icon">
            <i class="icon-user"></i>
            <input type="text" name="cedula" class="form-control" placeholder="Cedula"  data-rule-required="true"  />
        </div>
    </div>

    <div class="form-group">
        <select class="form-control" id="inputTipoviolencia" name="inputTipoviolencia">
            <option value="1" selected="selected">Seleccione el Tipo de Violencia</option>
            <option value="1">Fisica</option>
            <option value="2">Psicologica</option>
        </select>
    </div>

    <div class="form-group">
        <select class="form-control" id="inputVinculo" name="inputVinculo">
            <option value="1" selected="selected">Seleccione el Vinculo con el Agresor</option>
            <option value="1">Esposo</option>
            <option value="2">Novio</option>
        </select>
    </div>
    <div class="form-group">
        <select class="form-control" id="inputGrado" name="inputGrado">
            <option value="Educación Primaria" selected="selected">Seleccione el Grado Academico</option>
            <option value="Pre Escolar">Pre Escolar</option>
            <option value="Educación Primaria">Educación Primaria</option>
            <option value="Educación Secundaria">Educación Secundaria</option>
            <option value="Educación Superior">Educación Superior</option>
        </select>
    </div>

    <div class="form-group">
        <div class="input-icon">
            <i class="icon-user"></i>
            <input type="text" name="hijos" class="form-control" placeholder="Cantidad de Hijos"  />
        </div>
    </div>
    <div class="form-group">
        <div class="input-icon">
            <i class="icon-user"></i>
            <input type="text" name="ocupacion" class="form-control" placeholder="Ocupacion"  />
        </div>
    </div>


    <div class="form-group">
        <select class="form-control" id="Provincia" name="inputIngresos">
            <option value="De 0 a 3,000" selected="selected">Seleccione su Ingreso</option>
            <option value="De 0 a 3,000">De 0 a 3,000</option>
            <option value="De 3,000 a 7,000">De 3,000 a 7,000</option>
            <option value="De 7,000 a 15,000">De 7,000 a 15,000</option>
            <option value="De 15,000 a 25,000">De 15,000 a 25,000</option>
            <option value="Mayor a 25,000">Mayor a 25,000</option>
        </select>
    </div>
    <label for="notas">Breve Relato de los hechos</label>
    <div class="form-group">
        <textarea rows="3" cols="5" name="notas" class="form-control"></textarea>
    </div>


    <input name="inputReporteid" type="hidden" value="<%=id%>">

    <div class="form-actions">
        <button type="submit" class="submit btn btn-primary pull-right">
            Enviar <i class="icon-angle-right"></i>
        </button>
    </div>
</form>



<jsp:include page="footer.jsp"/>