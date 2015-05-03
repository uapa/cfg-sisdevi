<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioAgresor"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.Agresor"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Agresor agresor = ServicioAgresor.getInstancia().getAgresorPorReporteId(id);
    if (agresor.getId() == null) {
        response.sendRedirect("agregaragresor.jsp?id=" + id);
    } else {
%>
<jsp:include page="header.jsp"/>
<div class="row">
    <div class="col-md-12">
        <div class="widget box">
            <div class="widget-header">
                <h4><i class="icon-reorder"></i>Datos del agresor<a href="agregaragresor.jsp?id=<%=id%>">Agregar agresor</a></h4>
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
                            <th>Estado Civil</th>
                            <th>Genero</th>
                            <th>Cedula</th>
                            <th>Direccion</th>
                            <th>Provincia</th>
                            <th>Fecha de nacimiento</th>                            
                            <th>Editar</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                       
                        <tr>
                            
                            <td><%=agresor.getId()%></td>
                            <td><%=agresor.getNombre()%> <%=agresor.getApellido()%></td>
                            <td><%=agresor.getEstadocivil().getNombre()%></td>
                            <td><%=agresor.getGenero().getNombre()%></td>
                            <td><%=agresor.getCedula()%></td>
                            <td><%=agresor.getDireccion()%></td>
                            <td><%=agresor.getProvincia().getNombre()%></td>
                            <td><%=agresor.getFecha_nacimiento()%></td>
                            
                            <td><a href="editaragresor.jsp?id=<%=agresor.getId()%>"><i class="icon-edit"></i></a></td>
                            
                            
                            
                            
                        </tr>
                       
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>



<jsp:include page="footer.jsp"/>
<%
    }
%>