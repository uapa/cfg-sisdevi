<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<%@ page import="org.cfg.uapa.java.sisdevi.servicios.ServicioEstadistica"%>
<%@ page import="org.cfg.uapa.java.sisdevi.entidades.Estadistica"%>

<jsp:include page="header.jsp"/>
<%

    Estadistica fisica = ServicioEstadistica.getInstancia().getTotalReportesPorTipo(1);
    Estadistica psicologica = ServicioEstadistica.getInstancia().getTotalReportesPorTipo(2);
    Estadistica sexual = ServicioEstadistica.getInstancia().getTotalReportesPorTipo(3);
    Estadistica economica = ServicioEstadistica.getInstancia().getTotalReportesPorTipo(4);
    Estadistica institucional = ServicioEstadistica.getInstancia().getTotalReportesPorTipo(5);
   
%>
<script type="text/javascript">
"use strict";

$(document).ready(function(){

	var tipos = [];
        tipos[0]="Física";
        tipos[1]="Psicológica";
        tipos[2]="Sexual";
        tipos[3]="Económica";
        tipos[4]="Institucional";
        var total = [];
        total[0]=<%=fisica.getTotal()%>;
        total[1]=<%=psicologica.getTotal()%>;
        total[2]=<%=sexual.getTotal()%>;
        total[3]=<%=economica.getTotal()%>;
        total[4]=<%=institucional.getTotal()%>;
	var d_pie = [];
	var series = 5;
	for (var i = 0; i<series; i++) {
		d_pie[i] = { label: tipos[i], data: Math.floor(total[i]*100)+1 };
                
	}

	$.plot("#chart_pie", d_pie, $.extend(true, {}, Plugins.getFlotDefaults(), {
		series: {
			pie: {
				show: true,
				radius: 1,
				label: {
					show: true
				}
			}
		},
		grid: {
			hoverable: true
		},
		tooltip: true,
		tooltipOpts: {
			content: '%p.0%, %s', // show percentages, rounding to 2 decimal places
			shifts: {
				x: 20,
				y: 0
			}
		}
	}));

});
</script>


<!--=== Donut/ Pie ===-->
<div class="row">
    <div class="col-md-6">
        <div class="widget box">
            <div class="widget-header">
                <h4><i class="icon-reorder"></i> Reportes por tipo de violencia</h4>
                <div class="toolbar no-padding">
                    <div class="btn-group">
                        <span class="btn btn-xs widget-collapse"><i class="icon-angle-down"></i></span>
                    </div>
                </div>
            </div>
            <div class="widget-content">
                <div id="chart_pie" class="chart"></div>
            </div>
        </div>
    </div>
</div>




<jsp:include page="footer.jsp"/>