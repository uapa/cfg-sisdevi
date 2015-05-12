package org.cfg.uapa.java.sisdevi.entidades;

public class Episodio {
    
    private Integer id;
    private String fecha_episodio;
    private TipodeViolencia tipodeviolencia;
    private String descripcion;
    private Reporte reporte;
    private String fecha_creacion;
    private ReporteTestigo reporteTestigo;

    /**
     * @return the id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return the fecha_episodio
     */
    public String getFecha_episodio() {
        return fecha_episodio;
    }

    /**
     * @param fecha_episodio the fecha_episodio to set
     */
    public void setFecha_episodio(String fecha_episodio) {
        this.fecha_episodio = fecha_episodio;
    }

    /**
     * @return the tipodeviolencia
     */
    public TipodeViolencia getTipodeviolencia() {
        return tipodeviolencia;
    }

    /**
     * @param tipodeviolencia the tipodeviolencia to set
     */
    public void setTipodeviolencia(TipodeViolencia tipodeviolencia) {
        this.tipodeviolencia = tipodeviolencia;
    }

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * @return the reporte
     */
    public Reporte getReporte() {
        return reporte;
    }

    /**
     * @param reporte the reporte to set
     */
    public void setReporte(Reporte reporte) {
        this.reporte = reporte;
    }

    /**
     * @return the fecha_creacion
     */
    public String getFecha_creacion() {
        return fecha_creacion;
    }

    /**
     * @param fecha_creacion the fecha_creacion to set
     */
    public void setFecha_creacion(String fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }

    /**
     * @return the reporteTestigo
     */
    public ReporteTestigo getReporteTestigo() {
        return reporteTestigo;
    }

    /**
     * @param reporteTestigo the reporteTestigo to set
     */
    public void setReporteTestigo(ReporteTestigo reporteTestigo) {
        this.reporteTestigo = reporteTestigo;
    }
    
}
