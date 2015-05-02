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
import java.text.MessageFormat;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.cfg.uapa.java.sisdevi.entidades.Usuario;

public class ServicioUsuario {

    private static final ServicioUsuario INSTANCIA = new ServicioUsuario();

    public static ServicioUsuario getInstancia() {
        return INSTANCIA;
    }

    public ServicioUsuario() {
    }

    public List<Usuario> getListadoCliente() {

        List<Usuario> usuarios = new ArrayList<>();

        try {

            Statement stmt = Coneccion.getInstancia().getConeccion().createStatement();

            ResultSet rs = stmt.executeQuery("select * from cliente");

            while (rs.next()) {

                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellido(rs.getString("apellido"));
                usuario.setUsuario(rs.getString("usuario"));
                usuario.setClave(rs.getString("clave"));
                usuarios.add(usuario);
            }
            rs.close();
                stmt.close();
                //con.close();

        } catch (SQLException e) {
            System.out.println("Error en el SQl");
        }

        return usuarios;

    }

    public Usuario checkUsuario(String usuario, String clave) {

        Connection con = Coneccion.getInstancia().getConeccion();
        Usuario usuario1 = null;

        try (PreparedStatement pstmt = con.prepareStatement("select * from usuarios where usuario = ? and clave= ?")) {

            pstmt.setString(1, usuario);
            pstmt.setString(2, clave);

            try (ResultSet rs = pstmt.executeQuery()) {
                System.out.println("Usuario: " + usuario + " Pass : " + clave);

                if (rs.next()) {

                    usuario1 = new Usuario();
                    usuario1.setId(rs.getInt("id"));
                    usuario1.setNombre(rs.getString("nombre"));
                    usuario1.setApellido(rs.getString("apellido"));
                    usuario1.setUsuario(rs.getString("usuario"));
                    usuario1.setClave(rs.getString("clave"));

                }
                rs.close();
                pstmt.close();
                con.close();
            }

        } catch (SQLException e) {
            Logger.getLogger(getClass().getName()).info(MessageFormat.format("Error en el SQl{0}", e.getMessage()));
            return null;
        }

        return usuario1;
    }

    public Usuario getClientePorId(int id) throws SQLException {

        String sql = "select * from cliente where id=?";

        Connection con = Coneccion.getInstancia().getConeccion();
        Usuario usuario = null;

        try (PreparedStatement stmt = con.prepareStatement(sql)) {

            
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
              

                rs.next();
                usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNombre(rs.getString("nombre"));
                
                rs.close();
                stmt.close();
                con.close();

            } catch (SQLException e) {
                Logger.getLogger(ServicioUsuario.class.getName()).log(Level.SEVERE, null, e);
            }

            return usuario;
        }
    }

}
