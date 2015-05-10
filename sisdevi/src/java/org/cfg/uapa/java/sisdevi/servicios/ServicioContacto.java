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
import org.cfg.uapa.java.sisdevi.entidades.Contacto;

/**
 *
 * @author acer
 */
public class ServicioContacto {

    private static final ServicioContacto INSTANCIA = new ServicioContacto();

    private ServicioContacto() {
    }

    public static ServicioContacto getInstancia() {
        return INSTANCIA;
    }

    public Contacto getContactoId(int id) throws SQLException {

        String sql = "select * from contacto where id=?";

        Contacto contacto = null;

        try (Connection con = Coneccion.getInstancia().getConeccion()) {

            try (PreparedStatement stmt = con.prepareStatement(sql)) {

                stmt.setInt(1, id);
                try (ResultSet rs = stmt.executeQuery()) {

                    rs.next();
                    contacto = new Contacto();
                    contacto.setId(rs.getInt("id"));
                    contacto.setNombre(rs.getString("nombre"));
                    contacto.setTelefono(rs.getString("telefono"));
                    contacto.setCorreo(rs.getString("correo"));
                    contacto.setMensaje(rs.getString("reporte_id"));
                    contacto.setFechaCreacion(rs.getString("fecha_creacion"));
                    contacto.setEstado(ServicioEstado.getInstancia().getEstadoPorId(rs.getInt("estado_id")));

                }
            } catch (SQLException e) {
                Logger.getLogger(ServicioContacto.class.getName()).log(Level.SEVERE, null, e);
            }

            return contacto;
        }
    }

    public boolean crearContacto(Contacto contacto) {

        boolean estado;

        String sql = "insert into contacto(nombre,telefono,correo,mensaje,estado_id) values(?,?,?,?,?)";

        try (Connection con = Coneccion.getInstancia().getConeccion()) {

            try (PreparedStatement stmt = con.prepareStatement(sql)) {

                stmt.setString(1, contacto.getNombre());
                stmt.setString(2, contacto.getTelefono());
                stmt.setString(3, contacto.getCorreo());
                stmt.setString(4, contacto.getMensaje());
                stmt.setInt(5, contacto.getEstado().getId());

                stmt.executeUpdate();

                estado = true;

            }
        } catch (SQLException e) {
            estado = false;
            Logger.getLogger(ServicioContacto.class.getName()).log(Level.SEVERE, null, e);
        }

        return estado;

    }

    public boolean actualizarContacto(Contacto contacto) {
        boolean estado;

        String sql = "update contacto set estado_id=? where id=?";

        try (Connection con = Coneccion.getInstancia().getConeccion()) {

            try (PreparedStatement stmt = con.prepareStatement(sql)) {

                stmt.setInt(1, contacto.getEstado().getId());
                stmt.setInt(2, contacto.getId());
                stmt.executeUpdate();

                estado = true;

            }
        } catch (SQLException e) {
            estado = false;
            Logger.getLogger(ServicioContacto.class.getName()).log(Level.SEVERE, null, e);
        }

        return estado;

    }

    public List<Contacto> getListadoContacto() throws SQLException {

        List<Contacto> lista = new ArrayList<>();

        String sql = "select * from contacto";

        try (Connection con = Coneccion.getInstancia().getConeccion()) {

            try (Statement stmt = con.createStatement()) {

                try (ResultSet rs = stmt.executeQuery(sql)) {

                    while (rs.next()) {
                        Contacto contacto = new Contacto();
                        contacto.setId(rs.getInt("id"));
                        contacto.setNombre(rs.getString("nombre"));
                        contacto.setMensaje(rs.getString("mensaje"));
                        contacto.setTelefono(rs.getString("telefono"));
                        contacto.setCorreo(rs.getString("correo"));
                        contacto.setEstado(ServicioEstado.getInstancia().getEstadoPorId(rs.getInt("estado_id")));
                        lista.add(contacto);
                    }

                }
            } catch (SQLException e) {
                Logger.getLogger(ServicioContacto.class.getName()).log(Level.SEVERE, null, e);
            }

            return lista;
        }
    }
}
