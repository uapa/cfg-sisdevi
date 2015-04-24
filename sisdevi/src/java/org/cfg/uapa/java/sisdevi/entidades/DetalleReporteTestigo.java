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
public class DetalleReporteTestigo {

    private Integer id;
    private Genero genero;
    private EstadoCivil estadocivil;
    private String fecha_nacimiento;
    private TipodeViolencia tipodeviolencia;
    private VinculoTestigo vinculotestigo;
    private String notas;
    private ReporteTestigo reportetestigo;
    private String cedula;
    private String fecha_detalle;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Genero getGenero() {
        return genero;
    }

    public void setGenero(Genero genero) {
        this.genero = genero;
    }

    public EstadoCivil getEstadocivil() {
        return estadocivil;
    }

    public void setEstadocivil(EstadoCivil estadocivil) {
        this.estadocivil = estadocivil;
    }

    public String getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(String fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public TipodeViolencia getTipodeviolencia() {
        return tipodeviolencia;
    }

    public void setTipodeviolencia(TipodeViolencia tipodeviolencia) {
        this.tipodeviolencia = tipodeviolencia;
    }

    public VinculoTestigo getVinculotestigo() {
        return vinculotestigo;
    }

    public void setVinculotestigo(VinculoTestigo vinculotestigo) {
        this.vinculotestigo = vinculotestigo;
    }

    public String getNotas() {
        return notas;
    }

    public void setNotas(String notas) {
        this.notas = notas;
    }

    public ReporteTestigo getReportetestigo() {
        return reportetestigo;
    }

    public void setReportetestigo(ReporteTestigo reportetestigo) {
        this.reportetestigo = reportetestigo;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getFecha_detalle() {
        return fecha_detalle;
    }

    public void setFecha_detalle(String fecha_detalle) {
        this.fecha_detalle = fecha_detalle;
    }
    

}
