/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.cfg.uapa.java.sisdevi.entidades;

/**
 *
 * @author acer
 */
public class Incidencia {

    private Integer id;
    private String fecha_incidencia;
    private String fecha_reporte;
    private TipodeViolencia tipodeviolencia;
    private String descripcion;
    private Reporte reporte;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFecha_incidencia() {
        return fecha_incidencia;
    }

    public void setFecha_incidencia(String fecha_incidencia) {
        this.fecha_incidencia = fecha_incidencia;
    }

    public String getFecha_reporte() {
        return fecha_reporte;
    }

    public void setFecha_reporte(String fecha_reporte) {
        this.fecha_reporte = fecha_reporte;
    }

    public TipodeViolencia getTipodeviolencia() {
        return tipodeviolencia;
    }

    public void setTipodeviolencia(TipodeViolencia tipodeviolencia) {
        this.tipodeviolencia = tipodeviolencia;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Reporte getReporte() {
        return reporte;
    }

    public void setReporte(Reporte reporte) {
        this.reporte = reporte;
    }

}
