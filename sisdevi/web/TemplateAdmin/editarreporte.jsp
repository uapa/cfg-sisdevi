<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioReporte"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.Reporte"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioProvincia"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.Provincia"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioEstado"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.Estado"%>
<jsp:include page="header.jsp"/>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Reporte reporte = ServicioReporte.getInstancia().getReportePorId(id);
    List<Provincia> provincia = ServicioProvincia.getInstancia().getListadoProvincias();
    List<Estado> estado = ServicioEstado.getInstancia().getListadoEstados();
    
%>
<form class="form-vertical login-form" action="/sisdevi/ReporteVictimaServlet" method="post">

                    <h3 class="form-title">Editar Reporte</h3>
                    <input name="idReporte" type="hidden" value="<%=reporte.getId()%>">
                    <div class="form-group">
                        <!--<label for="username">Username:</label>-->
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="name" class="form-control" placeholder="Nombres" autofocus="autofocus" data-rule-required="true" value="<%=reporte.getNombre()%>"  />
                        </div>
                    </div>
                    <div class="form-group">
                        <!--<label for="username">Username:</label>-->
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="lastname" class="form-control" placeholder="Apellidos"  data-rule-required="true" value="<%=reporte.getApellido()%>"  />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="direccion" class="form-control" placeholder="Dirección"  data-rule-required="true" value="<%=reporte.getDireccion()%>" />
                        </div>
                    </div>
                    <div class="form-group">
                        <select class="form-control" id="Provincia" name="inputProvincia">
                            <option value="<%=reporte.getProvincia().getId()%>"><%=reporte.getProvincia().getNombre()%></option>
                            
                            <c:forEach items="<%=provincia%>" var="provincia">
                                <option value="${provincia.getId()}">${provincia.getNombre()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="telefono" class="form-control" placeholder="Telefono"  data-rule-required="true"  value="<%=reporte.getTelefono()%>" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="celular" class="form-control" placeholder="Celular"  data-rule-required="true" value="<%=reporte.getCelular()%>" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-icon">
                            <i class="icon-envelope"></i>
                            <input type="text" name="correo" class="form-control" placeholder="Correo electrónico" data-rule-email="true" value="<%=reporte.getCorreo()%>"/>
                        </div>
                    </div>
                        <label for="notas">Estado del Reporte</label>
                       <div class="form-group">
                        <select class="form-control" id="estado" name="inputEstado">
                            <option value="<%=reporte.getEstado().getId()%>"><%=reporte.getEstado().getNombre()%></option>
                            
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