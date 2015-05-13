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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.cfg.uapa.java.sisdevi.entidades.Reporte;

/**
 *
 * @author NAM
 */
public class ServicioReporte {

    private static final ServicioReporte INSTANCIA = new ServicioReporte();

    private ServicioReporte() {
    }

    public static ServicioReporte getInstancia() {
        return INSTANCIA;
    }

    public boolean crearReporte(Reporte reporte) {

        boolean estado;

        String sql = "insert into reporte(nombre,apellido,direccion,provincia_id,telefono,celular,correo) values(?,?,?,?,?,?,?)";

        Connection con = Coneccion.getInstancia().getConeccion();

        try (PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, reporte.getNombre());
            stmt.setString(2, reporte.getApellido());
            stmt.setString(3, reporte.getDireccion());
            stmt.setInt(4, reporte.getProvincia().getId());
            stmt.setString(5, reporte.getTelefono());
            stmt.setString(6, reporte.getCelular());
            stmt.setString(7, reporte.getCorreo());
            //stmt.setString(8, reporte.getFecha_reporte());

            stmt.executeUpdate();

            estado = true;
            //rs.close();
            stmt.close();
            con.close();

        } catch (SQLException e) {
            estado = false;
            Logger.getLogger(ServicioReporte.class.getName()).log(Level.SEVERE, null, e);
        }

        return estado;

    }

    public List<Reporte> getListadoReporte() throws SQLException {

        List<Reporte> lista = new ArrayList<>();

        String sql = "select * from reporte ORDER BY id DESC";

        try (Connection con = Coneccion.getInstancia().getConeccion()){

        try (Statement stmt = con.createStatement()) {

            try (ResultSet rs = stmt.executeQuery(sql)) {

                while (rs.next()) {
                    Reporte reporte = new Reporte();
                    reporte.setId(rs.getInt("id"));
                    reporte.setNombre(rs.getString("nombre"));
                    reporte.setApellido(rs.getString("apellido"));
                    reporte.setDireccion(rs.getString("direccion"));
                    reporte.setProvincia(ServicioProvincia.getInstancia().getProvinciaPorId(rs.getInt("provincia_id")));
                    reporte.setTelefono(rs.getString("telefono"));
                    reporte.setCelular(rs.getString("celular"));
                    reporte.setCorreo(rs.getString("correo"));
                    reporte.setEstado(ServicioEstado.getInstancia().getEstadoPorId(rs.getInt("estado_id")));
                    lista.add(reporte);
                }
                
            }
            } catch (SQLException e) {
                Logger.getLogger(ServicioReporte.class.getName()).log(Level.SEVERE, null, e);
            }

            return lista;
        }
    }

    public Reporte getReportePorId(int id) throws SQLException {

        String sql = "select * from reporte where id=?";

        Connection con = Coneccion.getInstancia().getConeccion();

        Reporte reporte = null;

        try (PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {

                rs.next();
                reporte = new Reporte();
                reporte.setId(rs.getInt("id"));
                reporte.setNombre(rs.getString("nombre"));
                reporte.setApellido(rs.getString("apellido"));
                reporte.setDireccion(rs.getString("direccion"));
                reporte.setProvincia(ServicioProvincia.getInstancia().getProvinciaPorId(rs.getInt("provincia_id")));
                reporte.setTelefono(rs.getString("telefono"));
                reporte.setCelular(rs.getString("celular"));
                reporte.setCorreo(rs.getString("correo"));
                reporte.setEstado(ServicioEstado.getInstancia().getEstadoPorId(rs.getInt("estado_id")));
                reporte.setFecha_reporte(rs.getString("fecha_reporte"));

                rs.close();
                stmt.close();
                con.close();
            } catch (SQLException e) {
                Logger.getLogger(ServicioReporte.class.getName()).log(Level.SEVERE, null, e);
            }

            return reporte;
        }
    }

    public boolean actualizarReporte(Reporte reporte) {
        boolean estado;

        String sql = "update reporte set nombre=?,apellido=?,direccion=?,provincia_id=?,telefono=?,celular=?,correo=?,estado_id=? where id=?";

        try (Connection con = Coneccion.getInstancia().getConeccion()){

        try (PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, reporte.getNombre());
            stmt.setString(2, reporte.getApellido());
            stmt.setString(3, reporte.getDireccion());
            stmt.setInt(4, reporte.getProvincia().getId());
            stmt.setString(5, reporte.getTelefono());
            stmt.setString(6, reporte.getCelular());
            stmt.setString(7, reporte.getCorreo());
            stmt.setInt(8, reporte.getEstado().getId());
            stmt.setInt(9, reporte.getId());

            stmt.executeUpdate();

            estado = true;
        }

        } catch (SQLException e) {
            estado = false;
            Logger.getLogger(ServicioReporte.class.getName()).log(Level.SEVERE, null, e);
        }

        return estado;

    }

}
