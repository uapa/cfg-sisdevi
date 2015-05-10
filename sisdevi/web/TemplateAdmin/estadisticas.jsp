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
    Estadistica de0a3 = ServicioEstadistica.getInstancia().getTotalReportesPorIngresos("De 0 a 3,000");
    Estadistica de3a7 = ServicioEstadistica.getInstancia().getTotalReportesPorIngresos("De 3,000 a 7,000");
    Estadistica de7a15 = ServicioEstadistica.getInstancia().getTotalReportesPorIngresos("De 7,000 a 15,000");
    Estadistica de15a25 = ServicioEstadistica.getInstancia().getTotalReportesPorIngresos("De 15,000 a 25,000");
    Estadistica masde25 = ServicioEstadistica.getInstancia().getTotalReportesPorIngresos("Mayor a 25,000");
    Estadistica enero = ServicioEstadistica.getInstancia().getTotalReportesPorMes(1);
    Estadistica febrero = ServicioEstadistica.getInstancia().getTotalReportesPorMes(2);
    Estadistica marzo = ServicioEstadistica.getInstancia().getTotalReportesPorMes(3);
    Estadistica abril = ServicioEstadistica.getInstancia().getTotalReportesPorMes(4);
    Estadistica mayo = ServicioEstadistica.getInstancia().getTotalReportesPorMes(5);
    Estadistica junio = ServicioEstadistica.getInstancia().getTotalReportesPorMes(6);
    Estadistica julio = ServicioEstadistica.getInstancia().getTotalReportesPorMes(7);
    Estadistica agosto = ServicioEstadistica.getInstancia().getTotalReportesPorMes(8);
    Estadistica septiembre = ServicioEstadistica.getInstancia().getTotalReportesPorMes(9);
    Estadistica octubre = ServicioEstadistica.getInstancia().getTotalReportesPorMes(10);
    Estadistica noviembre = ServicioEstadistica.getInstancia().getTotalReportesPorMes(11);
    Estadistica diciembre = ServicioEstadistica.getInstancia().getTotalReportesPorMes(12);
    Estadistica eninvestigacion = ServicioEstadistica.getInstancia().getTotalReportesPorEstado(1);
    Estadistica activo = ServicioEstadistica.getInstancia().getTotalReportesPorEstado(2);
    Estadistica inactivo = ServicioEstadistica.getInstancia().getTotalReportesPorEstado(3);
    Estadistica descartado = ServicioEstadistica.getInstancia().getTotalReportesPorEstado(4);
    List<Estadistica> provincia = ServicioEstadistica.getInstancia().getListadoProvincias();
    Estadistica preescolar = ServicioEstadistica.getInstancia().getTotalReportesPorGrado("Pre Escolar");
    Estadistica primaria = ServicioEstadistica.getInstancia().getTotalReportesPorGrado("Educación Primaria");
    Estadistica secundaria = ServicioEstadistica.getInstancia().getTotalReportesPorGrado("Educación Secundaria");
    Estadistica superior = ServicioEstadistica.getInstancia().getTotalReportesPorGrado("Educación Superior");
    Estadistica esposo = ServicioEstadistica.getInstancia().getTotalReportesVinculo(1);
    Estadistica novio = ServicioEstadistica.getInstancia().getTotalReportesVinculo(2);
    Estadistica amante = ServicioEstadistica.getInstancia().getTotalReportesVinculo(6);
    Estadistica familia = ServicioEstadistica.getInstancia().getTotalReportesVinculo(4);
    Estadistica amigo = ServicioEstadistica.getInstancia().getTotalReportesVinculo(5);

%>
<script type="text/javascript">
    "use strict";

    $(document).ready(function () {

        var tipos = [];
        tipos[0] = "Física";
        tipos[1] = "Psicológica";
        tipos[2] = "Sexual";
        tipos[3] = "Económica";
        tipos[4] = "Institucional";
        var total = [];
        total[0] =<%=fisica.getTotal()%>;
        total[1] =<%=psicologica.getTotal()%>;
        total[2] =<%=sexual.getTotal()%>;
        total[3] =<%=economica.getTotal()%>;
        total[4] =<%=institucional.getTotal()%>;
        var d_pie = [];
        var series = 5;
        for (var i = 0; i < series; i++) {
            d_pie[i] = {label: tipos[i], data: Math.floor(total[i] * 100) + 1};

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

<script type="text/javascript">
    "use strict";

    $(document).ready(function () {
        var tipos = [];
        tipos[0] = "De 0 a 3,000";
        tipos[1] = "De 3,000 a 7,000";
        tipos[2] = "De 7,000 a 15,000";
        tipos[3] = "De 15,000 a 25,000";
        tipos[4] = "Mayor a 25,000";
        var total = [];
        total[0] =<%=de0a3.getTotal()%>;
        total[1] =<%=de3a7.getTotal()%>;
        total[2] =<%=de7a15.getTotal()%>;
        total[3] =<%=de15a25.getTotal()%>;
        total[4] =<%=masde25.getTotal()%>;
        var d_pie = [];
        var series = 5;
        for (var i = 0; i < series; i++) {
            d_pie[i] = {label: tipos[i], data: Math.floor(total[i] * 100) + 1};

        }

        $.plot("#ingresosc", d_pie, $.extend(true, {}, Plugins.getFlotDefaults(), {
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
<script type="text/javascript">
    "use strict";

    $(document).ready(function () {

        // Sample Data
        var d1 = [[1262304000000, <%=enero.getTotal()%>], [1264982400000, <%=febrero.getTotal()%>], [1267401600000, <%=marzo.getTotal()%>], [1270080000000, <%=abril.getTotal()%>], [1272672000000, <%=mayo.getTotal()%>], [1275350400000, <%=junio.getTotal()%>], [1277942400000, <%=julio.getTotal()%>], [1280620800000, <%=agosto.getTotal()%>], [1283299200000, <%=septiembre.getTotal()%>], [1285891200000, <%=octubre.getTotal()%>], [1288569600000, <%=noviembre.getTotal()%>], [1291161600000, <%=diciembre.getTotal()%>]];

        var data1 = [
            {label: "Total de reportes", data: d1}
        ];

        $.plot("#pormes", data1, $.extend(true, {}, Plugins.getFlotWidgetDefaults(), {
            xaxis: {
                min: (new Date(2009, 12, 1)).getTime(),
                max: (new Date(2010, 11, 2)).getTime(),
                mode: "time",
                tickSize: [1, "month"],
                monthNames: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                tickLength: 0
            },
            series: {
                lines: {
                    fill: false,
                    lineWidth: 1.5
                },
                points: {
                    show: true,
                    radius: 4,
                    lineWidth: 1.1
                },
                grow: {active: true, growings: [{stepMode: "maximum"}]}
            },
            grid: {
                hoverable: true,
                clickable: true
            },
            tooltip: true,
            tooltipOpts: {
                content: '%s: %y'
            }
        }));

    });
</script>
<script type="text/javascript">
    "use strict";

    $(document).ready(function () {

        var tipos = [];
        tipos[0] = "Pre Escolar";
        tipos[1] = "Educación Primaria";
        tipos[2] = "Educación Secundaria";
        tipos[3] = "Educación Superior";
        
        var total = [];
        total[0] =<%=preescolar.getTotal()%>;
        total[1] =<%=primaria.getTotal()%>;
        total[2] =<%=secundaria.getTotal()%>;
        total[3] =<%=superior.getTotal()%>;
        
        var d_pie = [];
        var series = 4;
        for (var i = 0; i < series; i++) {
            d_pie[i] = {label: tipos[i], data: Math.floor(total[i] * 100) + 1};

        }

        $.plot("#gradoa", d_pie, $.extend(true, {}, Plugins.getFlotDefaults(), {
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
<script type="text/javascript">
    "use strict";

    $(document).ready(function () {

        var tipos = [];
        tipos[0] = "Esposo";
        tipos[1] = "Novio";
        tipos[2] = "Amante";
        tipos[3] = "Familia";
        tipos[4] = "Amigo";
        var total = [];
        total[0] =<%=esposo.getTotal()%>;
        total[1] =<%=novio.getTotal()%>;
        total[2] =<%=amante.getTotal()%>;
        total[3] =<%=familia.getTotal()%>;
        total[4] =<%=amigo.getTotal()%>;
        var d_pie = [];
        var series = 5;
        for (var i = 0; i < series; i++) {
            d_pie[i] = {label: tipos[i], data: Math.floor(total[i] * 100) + 1};

        }

        $.plot("#vinculoa", d_pie, $.extend(true, {}, Plugins.getFlotDefaults(), {
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
<div class="page-header">
    <div class="page-title">
        <h3>Estadisticas</h3>

    </div>
</div>
<h2>Total de reportes por mes</h2>
<!--=== Widget Chart ===-->
<div class="row">
    <div class="col-md-12">
        <div class="widget box">
            <div class="widget-chart"> <!-- Possible colors: widget-chart-blue, widget-chart-blueLight (standard), widget-chart-green, widget-chart-red, widget-chart-yellow, widget-chart-orange, widget-chart-purple, widget-chart-gray -->
                <div id="pormes" class="chart chart-medium"></div>
            </div>
            <div class="widget-content">
                <ul class="stats"> <!-- .no-dividers -->
                    <li>
                        <strong><%=activo.getTotal()%></strong>
                        <small>Total de reportes activos</small>
                    </li>
                    <li class="light">
                        <strong><%=inactivo.getTotal()%></strong>
                        <small>Total de reportes inactivos</small>
                    </li>
                    <li>
                        <strong><%=eninvestigacion.getTotal()%></strong>
                        <small>Total de reportes en investigacion</small>
                    </li>
                    <li class="light">
                        <strong><%=descartado.getTotal()%></strong>
                        <small>Total de reportes descartados</small>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- /Widget Chart -->
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
    <div class="col-md-6">
        <div class="widget box">
            <div class="widget-header">
                <h4><i class="icon-reorder"></i> Reportes por cantidad de ingresos</h4>
                <div class="toolbar no-padding">
                    <div class="btn-group">
                        <span class="btn btn-xs widget-collapse"><i class="icon-angle-down"></i></span>
                    </div>
                </div>
            </div>
            <div class="widget-content">
                <div id="ingresosc" class="chart"></div>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <div class="widget box">
            <div class="widget-header">
                <h4><i class="icon-reorder"></i> Reportes por vinculo con el agresor</h4>
                <div class="toolbar no-padding">
                    <div class="btn-group">
                        <span class="btn btn-xs widget-collapse"><i class="icon-angle-down"></i></span>
                    </div>
                </div>
            </div>
            <div class="widget-content">
                <div id="vinculoa" class="chart"></div>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="widget box">
            <div class="widget-header">
                <h4><i class="icon-reorder"></i> Reportes por grado academico</h4>
                <div class="toolbar no-padding">
                    <div class="btn-group">
                        <span class="btn btn-xs widget-collapse"><i class="icon-angle-down"></i></span>
                    </div>
                </div>
            </div>
            <div class="widget-content">
                <div id="gradoa" class="chart"></div>
            </div>
        </div>
    </div>
</div>
<h2>Total de reportes por provincias</h2>
<table border="1" class="table table-striped table-bordered table-hover table-checkable table-responsive ">
    <tr>
        <td> Provincias </td>
        <td>Total de reportes</td>
    </tr>
    <c:forEach items="<%=provincia%>" var="provincia">
        <tr>
            <td>${provincia.getProvincia().getNombre()}</td>
            <td>${provincia.getTotal()}</td>
        </tr>
    </c:forEach>
</table>

<jsp:include page="footer.jsp"/>