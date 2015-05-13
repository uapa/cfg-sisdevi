<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioReporteTestigo"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.ReporteTestigo"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioDetalleReporte"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.DetalleReporte"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioAgresor"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.Agresor"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioEpisodio"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.Episodio"%>
<jsp:include page="header.jsp"/>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    ReporteTestigo reporte = ServicioReporteTestigo.getInstancia().getReporteTestigoPorId(id);
    DetalleReporte detallereporte = ServicioDetalleReporte.getInstancia().getDetalleTestigoPorId(id);
    Agresor agresor = ServicioAgresor.getInstancia().getAgresorTestigoPorReporteId(id);
    List<Episodio> episodio = ServicioEpisodio.getInstancia().getListadoEpisodioTestigo(id);
    Episodio episodios = ServicioEpisodio.getInstancia().getEpisodioTestigoPorReporteId(id);
%>
<h1>Expediente de caso de violencia</h1>
<div class="buttons">
    <a class="btn btn-success btn-lg" href="javascript:void(0);" onclick="javascript:window.print();"><i class="icon-print"></i> Imprimir expediente</a>
</div>
<table border="1" class="table table-striped table-bordered table-hover table-checkable table-responsive datatable">
    <tr>
        <td> Reporte #: </td>
        <td><%=reporte.getId()%></td>
    </tr>
    <tr>
        <td>Fecha de Creacion: </td>
        <td><%=reporte.getFecha_reporte()%></td>
    </tr>
    <tr>
        <td>Nombre del testigo:</td>
        <td><%=reporte.getNombre()%></td>
    </tr>
    <tr>
        <td>Apellido del testigo:</td>
        <td><%=reporte.getApellido()%></td>
    </tr>
    
    <tr>
        <td>Telefono del testigo:</td>
        <td><%=reporte.getTelefono()%></td>
    </tr>
    <tr>
        <td>Celular del testigo:</td>
        <td><%=reporte.getCelular()%></td>
    </tr>
    <tr>
        <td>Correo:</td>
        <td><%=reporte.getCorreo()%></td>
    </tr>
    <tr>
        <td>Vinculo con la victima:</td>
        <td><%=reporte.getVinculo().getNombre()%></td>
    </tr>
    <tr>
        <td>Nombre de la Victima:</td>
        <td><%=reporte.getNombre_victima()%></td>
    </tr>
    <tr>
        <td>Apellido de la Victima:</td>
        <td><%=reporte.getApellido_victima()%></td>
    </tr>
    <tr>
        <td>Direccion de la Victima:</td>
        <td><%=reporte.getDireccion_victima()%></td>
    </tr>
    <tr>
        <td>Provincia de la Victima:</td>
        <td><%=reporte.getProvincia().getNombre()%></td>
    </tr>
    <tr>
        <td>Telefono de la Victima:</td>
        <td><%=reporte.getTelefono_victima()%></td>
    </tr>
    <tr>
        <td>Celular de la Victima:</td>
        <td><%=reporte.getCelular_victima()%></td>
    </tr>
    <tr>
        <td>Descripcion de los hechos:</td>
        <td><%=reporte.getNotas()%></td>
    </tr>
    
    <tr>
        <td>Estado:</td>
        <td><%=reporte.getEstado().getNombre()%></td>
    </tr>
</table>

<h1>Detalles del reporte:</h1>
<%
    if (detallereporte.getId() == null) {
        out.println("Este reporte no tiene detalles");
        out.println(" <div class='buttons'><a class='btn btn-default btn-lg' href='agregardetallereportet.jsp?id=" + id + "' ><i class='icon-edit'></i> Agregar detalles</a></div> ");

    } else {
%>
<table border="1" class="table table-striped table-bordered table-hover table-checkable table-responsive datatable">
    <tr>
        <td>Genero:</td>
        <td><%=detallereporte.getGenero().getNombre()%></td>
    </tr>
    <tr>
        <td>Fecha de nacimiento: </td>
        <td><%=detallereporte.getFecha_nacimiento()%></td>
    </tr>
    <tr>
        <td>Cedula:</td>
        <td><%=detallereporte.getCedula()%></td>
    </tr>
    <tr>
        <td>Tipo de Violencia: </td>
        <td><%=detallereporte.getTipodeviolencia().getNombre()%></td>
    </tr>
    <tr>
        <td>Vinculo con el Agresor:</td>
        <td><%=detallereporte.getVinculo().getNombre()%></td>
    </tr>
    <tr>
        <td>Grado academico: </td>
        <td><%=detallereporte.getGradoacademico()%></td>
    </tr>
    <tr>
        <td>Ocupacion:</td>
        <td><%=detallereporte.getOcupacion()%></td>
    </tr>
    <tr>
        <td>Ingresos:</td>
        <td><%=detallereporte.getIngresos()%></td>
    </tr>
    <tr>
        <td>Cantidad de hijos: </td>
        <td><%=detallereporte.getCantidadhijos()%></td>
    </tr>
    <tr>
        <td>Estado civil: </td>
        <td><%=detallereporte.getEstadocivil().getNombre()%></td>
    </tr>
    <tr>
        <td>Fecha de creacion: </td>
        <td><%=detallereporte.getFecha_creacion()%></td>
    </tr>
    <tr>
        <td>Descripcion de los hechos: </td>
        <td><%=detallereporte.getNotas()%></td>
    </tr>
</table>
<%
    }
%>
<h1>Datos del Agresor:</h1>
<%
    if (agresor.getId() == null) {
        out.println("Este reporte no tiene datos del agresor");
        out.println(" <div class='buttons'><a class='btn btn-default btn-lg' href='agregaragresort.jsp?id=" + id + "' ><i class='icon-edit'></i> Agregar agresor</a></div> ");

    } else {
%>
<table  border="1" class="table table-striped table-bordered table-hover table-checkable table-responsive datatable">

    <tr>
        <td>Genero: </td>
        <td><%=agresor.getGenero().getNombre()%></td>
    </tr>
    <tr>
        <td>Nombre:</td>
        <td><%=agresor.getNombre()%></td>
    </tr>
    <tr>
        <td>Apellido:</td>
        <td><%=agresor.getApellido()%></td>
    </tr>
    <tr>
        <td>Direccion:</td>
        <td><%=agresor.getDireccion()%></td>
    </tr>
    <tr>
        <td>Provincia:</td>
        <td><%=agresor.getProvincia().getNombre()%></td>
    </tr>
    <tr>
        <td>Telefono:</td>
        <td><%=agresor.getTelefono()%></td>
    </tr>
    <tr>
        <td>Celular:</td>
        <td><%=agresor.getCelular()%></td>
    </tr>
    <tr>
        <td>Fecha de nacimiento: </td>
        <td><%=agresor.getFecha_nacimiento()%></td>
    </tr>
    <tr>
        <td>Estado civil: </td>
        <td><%=agresor.getEstadocivil().getNombre()%></td>
    </tr>
    <tr>
        <td>Cedula:</td>
        <td><%=agresor.getCedula()%></td>
    </tr>
    <tr>
        <td>Fecha de Creacion: </td>
        <td><%=agresor.getFecha_creacion()%></td>
    </tr>
</table>
<%
    }
%>
<h1>Episodios de violencia:</h1>
<%
    if (episodios.getId() == null) {
        out.println("Este reporte no tiene episodios de violencia");
        out.println(" <div class='buttons'><a class='btn btn-default btn-lg' href='agregarepisodiot.jsp?id=" + id + "' ><i class='icon-edit'></i> Agregar episodio</a></div> ");

    } else {
%>
<table border="1" class="table table-striped table-bordered table-hover table-checkable table-responsive datatable">
    <tr>
        <td>Fecha de episodio:</td>
        <td>Tipo de Violencia: </td>
        <td>Descripcion de los hechos: </td>
    </tr>
    <c:forEach items="<%=episodio%>" var="episodio">
        <tr>
            <td>${episodio.getFecha_episodio()}</td>
            <td>${episodio.getTipodeviolencia().getNombre()}</td>
            <td>${episodio.getDescripcion()}</td>


        </tr>
    </c:forEach>
</table>
<%
    }
%>

<jsp:include page="footer.jsp"/>