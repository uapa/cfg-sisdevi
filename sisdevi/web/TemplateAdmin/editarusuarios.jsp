<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioUsuario"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.Usuario"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioEstado"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.Estado"%>

<jsp:include page="header.jsp"/>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Usuario usuario = ServicioUsuario.getInstancia().getUsuariosPorId(id);
    List<Estado> estado = ServicioEstado.getInstancia().getListadoEstados();

%>

<form class="form-vertical register-form" action="/sisdevi/UsuarioServlet" method="post" >
    <!-- Title -->
    <input name="idUsuario" type="hidden" value="<%=usuario.getId()%>">
    <h3 class="form-title">Editar usuario</h3>

    <!-- Input Fields -->
    <div class="form-group">
        <div class="input-icon">
            <i class="icon-user"></i>
            <input type="text" name="name" class="form-control" placeholder="Nombres" value="<%=usuario.getNombre()%>" />
        </div>
    </div>
    <div class="form-group">
        <div class="input-icon">
            <i class="icon-user"></i>
            <input type="text" name="lastname" class="form-control" placeholder="Apellidos"  value="<%=usuario.getApellido()%>"/>
        </div>
    </div>

    <div class="form-group">
        <div class="input-icon">
            <i class="icon-envelope"></i>
            <input type="text" name="correo" class="form-control" placeholder="Correo" value="<%=usuario.getCorreo()%>" />
        </div>
    </div>

    <div class="form-group">
        <div class="input-icon">
            <i class="icon-user"></i>
            <input type="text" name="username" class="form-control" placeholder="Nombre de usuario"  value="<%=usuario.getUsuario()%>"/>
        </div>
    </div>
    <label for="notas">Estado del usuario</label>
                       <div class="form-group">
                        <select class="form-control" id="idEstado" name="idEstado">
                            <option value="<%=usuario.getEstado().getId()%>"><%=usuario.getEstado().getNombre()%></option>
                            
                            <c:forEach items="<%=estado%>" var="estado">
                                <option value="${estado.getId()}">${estado.getNombre()}</option>
                            </c:forEach>
                        </select>
                    </div> 


    <!-- Form Actions -->
    <div class="form-actions">
        
        <button type="submit" class="submit btn btn-primary pull-right">
            Enviar <i class="icon-angle-right"></i>
        </button>
    </div>
</form>





<jsp:include page="footer.jsp"/>



