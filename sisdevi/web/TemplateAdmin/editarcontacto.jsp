<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioContacto"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.Contacto"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioEstado"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.Estado"%>

<jsp:include page="header.jsp"/>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Contacto contacto = ServicioContacto.getInstancia().getContactoId(id);
    List<Estado> estado = ServicioEstado.getInstancia().getListadoEstados();
%>

<form class="form-vertical login-form" action="/sisdevi/ContactoServlet" method="post">
    
    <input name="idContacto" type="hidden" value="<%=contacto.getId()%>">
    <h3 class="form-title">Editar Estado</h3>
    
    
    <div class="form-group">
        <!--<label for="username">Username:</label>-->
        <div class="input-icon">
            <i class="icon-user"></i>
            <input type="text" name="name" class="form-control" placeholder="Nombres" autofocus="autofocus" data-rule-required="true"  value="<%=contacto.getNombre()%>" readonly="readonly"/>
        </div>
    </div>
    <div class="form-group">
        <div class="input-icon">
            <i class="icon-user"></i>
            <input type="text" name="telefono" class="form-control" placeholder="Telefono"  data-rule-required="true" value="<%=contacto.getTelefono()%>" readonly="readonly"/>
        </div>
    </div>
    <div class="form-group">
        <div class="input-icon">
            <i class="icon-envelope"></i>
            <input type="text" name="correo" class="form-control" placeholder="Correo electrónico" data-rule-email="true" value="<%=contacto.getCorreo()%>" readonly="readonly"/>
        </div>
    </div>
    <label for="notas">Mensaje:</label>
    <div class="form-group">
        <textarea rows="3" cols="5" name="mensaje" class="form-control" readonly="readonly"><%=contacto.getMensaje()%></textarea>
    </div>
    <label for="notas">Estado del contacto</label>
    <div class="form-group">
        <select class="form-control" id="idEstado" name="idEstado">
            

            <c:forEach items="<%=estado%>" var="estado">
                <option value="${estado.getId()}">${estado.getNombre()}</option>
            </c:forEach>
        </select>
    </div> 
    

    <div class="form-actions">
        <button type="submit" class="submit btn btn-primary pull-right">
            Enviar <i class="icon-angle-right"></i>
        </button>
    </div>




</form>




<jsp:include page="footer.jsp"/>