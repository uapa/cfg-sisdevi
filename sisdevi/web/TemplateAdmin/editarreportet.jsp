<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioReporteTestigo"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.ReporteTestigo"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioProvincia"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.Provincia"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioEstado"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.Estado"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioVinculo"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.Vinculo"%>
<jsp:include page="header.jsp"/>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    ReporteTestigo reporte = ServicioReporteTestigo.getInstancia().getReporteTestigoPorId(id);
    List<Provincia> provincia = ServicioProvincia.getInstancia().getListadoProvincias();
    List<Estado> estado = ServicioEstado.getInstancia().getListadoEstados();
    List<Vinculo> vinculo = ServicioVinculo.getInstancia().getListadoVinculos();
%>
<form class="form-vertical login-form" action="/sisdevi/ReporteTestigoServlet" method="post">
                    <input name="idReporte" type="hidden" value="<%=reporte.getId()%>">
                    <h3 class="form-title">Datos del Testigo</h3>
                    <div class="form-group">
                        <!--<label for="username">Username:</label>-->
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="name" class="form-control" placeholder="Nombres" autofocus="autofocus" data-rule-required="true" value="<%=reporte.getNombre()%>" />
                        </div>
                    </div>
                    <div class="form-group">
                        <!--<label for="username">Username:</label>-->
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="lastname" class="form-control" placeholder="Apellidos"  data-rule-required="true" value="<%=reporte.getApellido()%>" />
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="telefono" class="form-control" placeholder="Telefono"  data-rule-required="true" data-mask="(999)-999-9999" value="<%=reporte.getTelefono()%>"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="celular" class="form-control" placeholder="Celular"  data-rule-required="true" data-mask="(999)-999-9999" value="<%=reporte.getCelular()%>"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-icon">
                            <i class="icon-envelope"></i>
                            <input type="text" name="correo" class="form-control" placeholder="Correo electrónico" data-rule-email="true" value="<%=reporte.getCorreo()%>"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <select class="form-control" id="vinculo" name="inputVinculo">
                            <option value="<%=reporte.getVinculo().getId()%>"><%=reporte.getVinculo().getNombre()%></option>
                            <c:forEach items="<%=vinculo%>" var="vinculo">
                                <option value="${vinculo.getId()}">${vinculo.getNombre()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <h3 class="form-title">Datos de la Victima</h3>


                    <div class="form-group">
                        <!--<label for="username">Username:</label>-->
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="namev" class="form-control" placeholder="Nombres" autofocus="autofocus" data-rule-required="true"  value="<%=reporte.getNombre_victima()%>"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <!--<label for="username">Username:</label>-->
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="lastnamev" class="form-control" placeholder="Apellidos"  data-rule-required="true"  value="<%=reporte.getApellido_victima()%>"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="direccionv" class="form-control" placeholder="Dirección"  data-rule-required="true" value="<%=reporte.getDireccion_victima()%>" />
                        </div>
                    </div>
                    <div class="form-group">
                        <select class="form-control" id="Provincia" name="inputProvinciav">
                            <option value="<%=reporte.getProvincia().getId()%>"><%=reporte.getProvincia().getNombre()%></option>
                            <c:forEach items="<%=provincia%>" var="provincia">
                                <option value="${provincia.getId()}">${provincia.getNombre()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="telefonov" class="form-control" placeholder="Telefono"  data-rule-required="true" data-mask="(999)-999-9999" value="<%=reporte.getTelefono_victima()%>" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-icon">
                            <i class="icon-user"></i>
                            <input type="text" name="celularv" class="form-control" placeholder="Celular"  data-rule-required="true" data-mask="(999)-999-9999" value="<%=reporte.getCelular_victima()%>"/>
                        </div>
                    </div>
                    <label for="notas">Breve relato de los hechos</label>
                    <div class="form-group">
                        <textarea rows="3" cols="5" name="notas" class="form-control"><%=reporte.getNotas()%></textarea>
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