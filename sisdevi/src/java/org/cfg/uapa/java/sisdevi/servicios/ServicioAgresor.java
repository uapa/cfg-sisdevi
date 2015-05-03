/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.cfg.uapa.java.sisdevi.servicios;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.cfg.uapa.java.sisdevi.entidades.Agresor;


/**
 *
 * @author NAM
 */
public class ServicioAgresor {

    private static final ServicioAgresor INSTANCIA = new ServicioAgresor();

    private ServicioAgresor() {
    }

    public static ServicioAgresor getInstancia() {
        return INSTANCIA;
    }

    public Agresor getAgresorPorReporteId(int id) throws SQLException {

        String sql = "select * from agresor where reporte_id=?";

        Agresor agresor = null;

        try (Connection con = Coneccion.getInstancia().getConeccion()) {

            try (PreparedStatement stmt = con.prepareStatement(sql)) {

                stmt.setInt(1, id);
                try (ResultSet rs = stmt.executeQuery()) {

                    rs.next();
                    agresor = new Agresor();
                    agresor.setId(rs.getInt("id"));
                    agresor.setNombre(rs.getString("nombre"));
                    agresor.setApellido(rs.getString("apellido"));
                    agresor.setGenero(ServicioGenero.getInstancia().getGeneroPorId(rs.getInt("genero_id")));
                    agresor.setDireccion(rs.getString("direccion"));
                    agresor.setProvincia(ServicioProvincia.getInstancia().getProvinciaPorId(rs.getInt("provincia_id")));
                    agresor.setTelefono(rs.getString("telefono"));
                    agresor.setCelular(rs.getString("celular"));
                    agresor.setEstadocivil(ServicioEstadoCivil.getInstancia().getEstadoCivilPorId(rs.getInt("estadocivil_id")));
                    agresor.setFecha_nacimiento(rs.getString("fecha_nacimiento"));
                    agresor.setCedula(rs.getString("cedula"));
                    agresor.setReporte(ServicioReporte.getInstancia().getReportePorId(rs.getInt("reporte_id")));

                }
            } catch (SQLException e) {
                Logger.getLogger(ServicioAgresor.class.getName()).log(Level.SEVERE, null, e);
            }

            return agresor;
        }
    }

    public boolean crearAgresor(Agresor agresor) {

        boolean estado;

        String sql = "insert into agresor(nombre,apellido,genero_id,direccion,provincia_id,telefono,celular,estadocivil_id,fecha_nacimiento,cedula,reporte_id) values(?,?,?,?,?,?,?,?,?,?,?)";

        try (Connection con = Coneccion.getInstancia().getConeccion()) {

            try (PreparedStatement stmt = con.prepareStatement(sql)) {

                stmt.setString(1, agresor.getNombre());
                stmt.setString(2, agresor.getApellido());
                stmt.setInt(3, agresor.getGenero().getId());
                stmt.setString(4, agresor.getDireccion());
                stmt.setInt(5, agresor.getProvincia().getId());
                stmt.setString(6, agresor.getTelefono());
                stmt.setString(7, agresor.getCelular());
                stmt.setInt(8, agresor.getEstadocivil().getId());
                stmt.setString(9, agresor.getFecha_nacimiento());
                stmt.setString(10, agresor.getCedula());
                stmt.setInt(11, agresor.getReporte().getId());

                stmt.executeUpdate();

                estado = true;

            }
        } catch (SQLException e) {
            estado = false;
            Logger.getLogger(ServicioAgresor.class.getName()).log(Level.SEVERE, null, e);
        }

        return estado;

    }

    public boolean actualizarAgresor(Agresor agresor) {
        boolean estado;

        String sql = "update agresor set nombre=?,apellido=?,genero_id=?,direccion=?,provincia_id=?,telefono=?,celular=?,estadocivil_id=?,fecha_nacimiento=?,cedula=?,reporte_id=? where id=?";

        try (Connection con = Coneccion.getInstancia().getConeccion()) {

            try (PreparedStatement stmt = con.prepareStatement(sql)) {

                stmt.setString(1, agresor.getNombre());
                stmt.setString(2, agresor.getApellido());
                stmt.setInt(3, agresor.getGenero().getId());
                stmt.setString(4, agresor.getDireccion());
                stmt.setInt(5, agresor.getProvincia().getId());
                stmt.setString(6, agresor.getTelefono());
                stmt.setString(7, agresor.getCelular());
                stmt.setInt(8, agresor.getEstadocivil().getId());
                stmt.setString(9, agresor.getFecha_nacimiento());
                stmt.setString(10, agresor.getCedula());
                stmt.setInt(11, agresor.getReporte().getId());
                stmt.setInt(12, agresor.getId());
                stmt.executeUpdate();

                estado = true;

            }
        } catch (SQLException e) {
            estado = false;
            Logger.getLogger(ServicioAgresor.class.getName()).log(Level.SEVERE, null, e);
        }

        return estado;

    }

}
