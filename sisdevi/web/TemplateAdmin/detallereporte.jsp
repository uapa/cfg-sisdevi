<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioDetalleReporte"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.DetalleReporte"%>

<jsp:include page="header.jsp"/>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    DetalleReporte reporte = ServicioDetalleReporte.getInstancia().getDetalleReportePorReporteId(id);
%>
<div class="row">
    <div class="col-md-12">
        <div class="widget box">
            <div class="widget-header">
                <h4><i class="icon-reorder"></i>Detalle del Reporte<a href="agregardetallereporte.jsp?id=<%=id%>">Agregar Detalle al Reporte</a></h4>
                <div class="toolbar no-padding">
                    <div class="btn-group">
                        <span class="btn btn-xs widget-collapse"><i class="icon-angle-down"></i></span>
                    </div>
                </div>
            </div>
            <div class="widget-content no-padding">
                <table class="table table-striped table-bordered table-hover table-checkable table-responsive datatable">
                    <thead>
                        <tr>
                            
                            <th data-class="expand">#</th>
                            <th>Genero</th>
                            <th>Estado Civil</th>
                            <th>Tipo de Violencia</th>
                            <th>Cedula</th>
                            <th>Ocupacion</th>
                            <th>Fecha de nacimiento</th>
                            <th>Grado Academico</th>
                            <th>Editar</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                       <c:forEach items="<%=reporte%>" var="reporte">
                        <tr>
                            
                            <td>${reporte.getId()}</td>
                            <td>${reporte.getGenero().getNombre()}</td>
                            <td>${reporte.getEstadocivil().getNombre()}</td>
                            <td>${reporte.getTipodeviolencia().getNombre()}</td>
                            <td>${reporte.getCedula()}</td>
                            <td>${reporte.getOcupacion}</td>
                            <td>${reporte.getFecha_nacimiento()}</td>
                            <td>${reporte.getGradoacademico()}</td>
                            <td><a href="editardetallereporte.jsp?id=${reporte.getId()}"><i class="icon-edit"></i></a></td>
                            
                            
                            
                            
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>



<jsp:include page="footer.jsp"/>