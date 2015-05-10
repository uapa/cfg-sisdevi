<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioContacto"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.Contacto"%>

<jsp:include page="header.jsp"/>
<%
    List<Contacto> contacto = ServicioContacto.getInstancia().getListadoContacto();
%>

<div class="row">
    <div class="col-md-12">
        <div class="widget box">
            <div class="widget-header">
                <h4><i class="icon-reorder"></i> Mensajes de contacto</h4>
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
                            <th>Telefono</th>
                            <th>Correo</th>
                            <th>Mensaje</th>
                            <th>Estado</th>
                            <th>Editar</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                       <c:forEach items="<%=contacto%>" var="contacto">
                        <tr>
                            
                            <td>${contacto.getId()}</td>
                            <td>${contacto.getNombre()}</td>
                            <td>${contacto.getTelefono()}</td>
                            <td>${contacto.getCorreo()}</td>
                            <td>${contacto.getMensaje()}</td>
                            <td>${contacto.getEstado().getNombre()}</td>
                            <td><a href="editarcontacto.jsp?id=${contacto.getId()}"><i class="icon-edit"></i></a></td>
                           
                            
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>




<jsp:include page="footer.jsp"/>