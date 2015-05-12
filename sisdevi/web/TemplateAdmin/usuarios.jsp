<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioUsuario"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.Usuario"%>

<jsp:include page="header.jsp"/>
<%
    List<Usuario> usuario = ServicioUsuario.getInstancia().getListadoUsuarios();
%>

<div class="row">
    <div class="col-md-12">
        <div class="widget box">
            <div class="widget-header">
                <h4><i class="icon-reorder"></i> Usuarios</h4>
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
                            <th>Apellido</th>
                            <th>Correo</th>
                            <th>Usuario</th>
                            <th>Estado</th>
                            <th>Editar</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                       <c:forEach items="<%=usuario%>" var="usuario">
                        <tr>
                            
                            <td>${usuario.getId()}</td>
                            <td>${usuario.getNombre()}</td>
                            <td>${usuario.getApellido()}</td>
                            <td>${usuario.getCorreo()}</td>
                            <td>${usuario.getUsuario()}</td>
                            <td>${usuario.getEstado().getNombre()}</td>
                            <td><a href="editarcontacto.jsp?id=${usuario.getId()}"><i class="icon-edit"></i></a></td>
                           
                            
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>



<jsp:include page="footer.jsp"/>