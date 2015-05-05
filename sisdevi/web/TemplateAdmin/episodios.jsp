<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioEpisodio"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.Episodio"%>

<jsp:include page="header.jsp"/>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    List<Episodio> episodio = ServicioEpisodio.getInstancia().getListadoEpisodio(id);
    if (episodio == null) {
        response.sendRedirect("agregarepisodio.jsp?id=" + id);
    } else {
%>
<div class="row">
    <div class="col-md-12">
        <div class="widget box">
            <div class="widget-header">
                <h4><i class="icon-reorder"></i>Episodios <a href="agregarepisodio.jsp?id=<%=id%>">Agregar Episodio</a></h4>
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
                            <th>Fecha del episodio</th>
                            <th>Descripcion</th>
                            <th>Tipo de Violencia</th>
                            <th>Editar</th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="<%=episodio%>" var="episodio">
                            <tr>

                                <td>${episodio.getId()}</td>
                                <td>${episodio.getFecha_episodio()}</td>
                                <td>${episodio.getDescripcion()}</td>
                                <td>${episodio.getTipodeviolencia().getNombre()}</td>

                                <td><a href="editarepisodio.jsp?id=${episodio.getId()}"><i class="icon-edit"></i></a></td>




                            </tr>
                        </c:forEach>
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
