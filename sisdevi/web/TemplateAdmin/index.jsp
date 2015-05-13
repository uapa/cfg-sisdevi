<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioEstadistica"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.Estadistica"%>

<jsp:include page="header.jsp"/>
<%
 Estadistica delDia = ServicioEstadistica.getInstancia().getTotalReportesdelDia();
 Estadistica deAyer = ServicioEstadistica.getInstancia().getTotalReportesdeAyer();
 Estadistica deSemana = ServicioEstadistica.getInstancia().getTotalReportesdeSemana();
 Estadistica delMes = ServicioEstadistica.getInstancia().getTotalReportesdelMes();
 %>

<div class="page-header">
    <div class="page-title">
        <h3>Dashboard</h3>
        
    </div>
</div>

<!--=== Statboxes ===-->
<div class="row row-bg"> <!-- .row-bg -->
    <div class="col-sm-6 col-md-3">
        <div class="statbox widget box box-shadow">
            <div class="widget-content">
                <div class="visual cyan">
                    <div class="statbox-sparkline">30,20,15,30,22,25,26,30,27</div>
                </div>
                <div class="title">Reportes de hoy</div>
                <div class="value"><%=delDia.getTotal()%></div>
                <a class="more" href="verreporte.jsp">Ver <i class="pull-right icon-angle-right"></i></a>
            </div>
        </div> <!-- /.smallstat -->
    </div> <!-- /.col-md-3 -->

    <div class="col-sm-6 col-md-3">
        <div class="statbox widget box box-shadow">
            <div class="widget-content">
                <div class="visual green">
                    <div class="statbox-sparkline">20,30,30,29,22,15,20,30,32</div>
                </div>
                <div class="title">Reportes de Ayer</div>
                <div class="value"><%=deAyer.getTotal()%></div>
                <a class="more" href="verreporte.jsp">Ver <i class="pull-right icon-angle-right"></i></a>
            </div>
        </div> <!-- /.smallstat -->
    </div> <!-- /.col-md-3 -->

    <div class="col-sm-6 col-md-3 hidden-xs">
        <div class="statbox widget box box-shadow">
            <div class="widget-content">
                <div class="visual yellow">
                    <div class="statbox-sparkline">20,30,30,29,22,15,20,30,32</div>
                </div>
                <div class="title">Reportes de la semana</div>
                <div class="value"><%=deSemana.getTotal()%></div>
                <a class="more" href="verreporte.jsp">Ver <i class="pull-right icon-angle-right"></i></a>
            </div>
        </div> <!-- /.smallstat -->
    </div> <!-- /.col-md-3 -->

    <div class="col-sm-6 col-md-3 hidden-xs">
        <div class="statbox widget box box-shadow">
            <div class="widget-content">
                <div class="visual red">
                    <div class="statbox-sparkline">20,30,30,29,22,15,20,30,32</div>
                </div>
                <div class="title">Reportes del mes</div>
                <div class="value"><%=delMes.getTotal()%></div>
                <a class="more" href="verreporte.jsp">Ver <i class="pull-right icon-angle-right"></i></a>
            </div>
        </div> <!-- /.smallstat -->
    </div> <!-- /.col-md-3 -->
</div> <!-- /.row -->
<!-- /Statboxes -->



<jsp:include page="footer.jsp"/>