<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioReporte"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.Reporte"%>

<jsp:include page="header.jsp"/>
<%
    List<Reporte> reporte = ServicioReporte.getInstancia().getListadoReporte();
%>
<div class="row">
    <div class="col-md-12">
        <div class="widget box">
            <div class="widget-header">
                <h4><i class="icon-reorder"></i> Reporte Victimas <a href="crearreporte.jsp"> Crear Reporte</a></h4>
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
                            <th>Nombre</th>
                            
                            <th>Direccion</th>
                            <th>Provincia</th>
                            <th>Telefono</th>
                            <th>Celular</th>
                            <th>Correo</th>
                            <th>Estado</th>
                            <th>Editar</th>
                            <th>Detalles</th>
                            <th>Agresor</th>
                            <th>Episodios</th>
                            <th>Ver</th>
                        </tr>
                    </thead>
                    <tbody>
                       <c:forEach items="<%=reporte%>" var="reporte">
                        <tr>
                            
                            <td>${reporte.getId()}</td>
                            <td>${reporte.getNombre()} ${reporte.getApellido()}</td>
                            
                            <td>${reporte.getDireccion()}</td>
                            <td>${reporte.getProvincia().getNombre()}</td>
                            <td>${reporte.getTelefono()}</td>
                            <td>${reporte.getCelular()}</td>
                            <td>${reporte.getCorreo()}</td>
                            <td>${reporte.getEstado().getNombre()}</td>
                            <td><a href="editarreporte.jsp?id=${reporte.getId()}"><i class="icon-edit"></i></a></td>
                            <td><a href="detallereporte.jsp?id=${reporte.getId()}"><i class="icon-edit"></i></a></td>
                            <td><a href="agresor.jsp?id=${reporte.getId()}"><i class="icon-edit"></i></a></td>
                            <td><a href="episodios.jsp?id=${reporte.getId()}"><i class="icon-edit"></i></a></td>
                            <td><a href="vertodo.jsp?id=${reporte.getId()}"><i class="icon-print"></i></a></td>
                            
                            
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>



<jsp:include page="footer.jsp"/>