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
public class ReporteTestigo {

    private Integer id;
    private String nombre;
    private String apellido;
    private String cedula;
    private String telefono;
    private String celular;
    private String correo;
    private VinculoTestigo vinculotestigo;
    private String nombre_victima;
    private String apellido_victima;
    private String direccion_victima;
    private Provincia provincia;
    private String notas;
    private String fecha_reporte;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

//    public VinculoTestigo getVinculo() {
//        return vinculo;
//    }
//
//    public void setVinculo(VinculoTestigo vinculo) {
//        this.vinculo = vinculo;
//    }

    public String getNombre_victima() {
        return nombre_victima;
    }

    public void setNombre_victima(String nombre_victima) {
        this.nombre_victima = nombre_victima;
    }

    public String getApellido_victima() {
        return apellido_victima;
    }

    public void setApellido_victima(String apellido_victima) {
        this.apellido_victima = apellido_victima;
    }

    public String getDireccion_victima() {
        return direccion_victima;
    }

    public void setDireccion_victima(String direccion_victima) {
        this.direccion_victima = direccion_victima;
    }

    public Provincia getProvincia() {
        return provincia;
    }

    public void setProvincia(Provincia provincia) {
        this.provincia = provincia;
    }

    public String getNotas() {
        return notas;
    }

    public void setNotas(String notas) {
        this.notas = notas;
    }

    public String getFecha_reporte() {
        return fecha_reporte;
    }

    public void setFecha_reporte(String fecha_reporte) {
        this.fecha_reporte = fecha_reporte;
    }

    public VinculoTestigo getVinculotestigo() {
        return vinculotestigo;
    }

    public void setVinculotestigo(VinculoTestigo vinculotestigo) {
        this.vinculotestigo = vinculotestigo;
    }

}
