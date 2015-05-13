<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioEpisodio"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.Episodio"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioTipodeViolencia"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.TipodeViolencia"%>


<jsp:include page="header.jsp"/>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Episodio episodio = ServicioEpisodio.getInstancia().getEpisodioTestigoPorId(id);
    List<TipodeViolencia> tipodeviolencia = ServicioTipodeViolencia.getInstancia().getListadoTipodeViolencia();
%>
<form class="form-vertical login-form" action="/sisdevi/EpisodioTestigoServlet" method="post">
    <input name="idReporte" type="hidden" value="<%=episodio.getReporteTestigo().getId()%>">
    <input name="idEpisodio" type="hidden" value="<%=episodio.getId()%>">
    <h3 class="form-title">Editar Episodio</h3>


    <!-- Fecha de Episodio -->   
    <div class="form-group">
        <div class="input-icon">
            <i class="icon-calendar"></i>
            <input type="text" name="inputFecha" class="form-control" placeholder="Fecha del episodio" data-mask="9999-99-99" value="<%=episodio.getFecha_episodio()%>" />
        </div>
    </div>
    <div class="form-group">
        <select class="form-control" id="inputTipoviolencia" name="inputTipoviolencia">
            <option value="<%=episodio.getTipodeviolencia().getId()%>" selected="selected"><%=episodio.getTipodeviolencia().getNombre()%></option>

            <c:forEach items="<%=tipodeviolencia%>" var="tipodeviolencia">
                <option value="${tipodeviolencia.getId()}">${tipodeviolencia.getNombre()}</option>
            </c:forEach>
        </select>
    </div>
    <label for="notas">Breve relato de los hechos</label>
    <div class="form-group">
        <textarea rows="3" cols="5" name="descripcion" class="form-control"><%=episodio.getDescripcion()%></textarea>
    </div>

    <div class="form-actions">
        <button type="submit" class="submit btn btn-primary pull-right">
            Enviar <i class="icon-angle-right"></i>
        </button>
    </div>
</form>




<jsp:include page="footer.jsp"/>