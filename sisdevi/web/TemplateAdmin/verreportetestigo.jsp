<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioReporteTestigo"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.ReporteTestigo"%>

<jsp:include page="header.jsp"/>
<%
    List<ReporteTestigo> reporte = ServicioReporteTestigo.getInstancia().getListadoReporteTestigo();
    

%>
<div class="row">
    <div class="col-md-12">
        <div class="widget box">
            <div class="widget-header">
                <h4><i class="icon-reorder"></i> Reportes testigos <a href="crearreportetestigo.jsp"> Crear Reporte</a></h4>
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
                            <th>Nombre Testigo</th>
                            <th>Nombre Victima</th>
                            <th>Direccion Victima</th>
                            <th>Provincia Victima</th>
                            <th>Telefono Victima</th>
                            <th>Celular Victima</th>
                            <th>Editar</th>
                            <th>Borrar</th>
                        </tr>
                    </thead>
                    <tbody>
                       <c:forEach items="<%=reporte%>" var="reporte">
                        <tr>
                            
                            <td>${reporte.getId()}</td>
                            <td>${reporte.getNombre()}</td>
                            <td>${reporte.getNombre_victima()}</td>
                            <td>${reporte.getDireccion_victima()}</td>
                            <td>${reporte.getProvincia().getNombre()}</td>
                            <td>${reporte.getTelefono_victima()}</td>
                            <td>${reporte.getCelular_victima()}</td>
                            <td><a href="editarreportetestigo.jsp?id=${reporte.getId()}"><i class="icon-edit"></i></a></td>
                            <td><a href="borrarreportetestigo.jsp?id=${reporte.getId()}"><i class="icon-trash"></i></a></td>
                            
                            
                            
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>



<jsp:include page="footer.jsp"/>