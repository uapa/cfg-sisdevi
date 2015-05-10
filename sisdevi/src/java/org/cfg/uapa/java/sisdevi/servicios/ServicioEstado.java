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
import org.cfg.uapa.java.sisdevi.entidades.Estado;


/**
 *
 * @author NAM
 */
public class ServicioEstado {
    private static final ServicioEstado INSTANCIA = new ServicioEstado();

    private ServicioEstado() {
    }

    public static ServicioEstado getInstancia() {
        return INSTANCIA;
    }
    public List<Estado> getListadoEstados() throws SQLException {

        List<Estado> lista = new ArrayList<>();

        String sql = "select * from estado";

        try (Connection con = Coneccion.getInstancia().getConeccion()){
        

        try (Statement stmt = con.createStatement()) {

            
            try (ResultSet rs = stmt.executeQuery(sql)) {
                

                while (rs.next()) {
                    Estado estado = new Estado();
                    estado.setId(rs.getInt("id"));
                    estado.setNombre(rs.getString("nombre"));

                    lista.add(estado);
                }
                
            }
            } catch (SQLException e) {
                Logger.getLogger(ServicioEstado.class.getName()).log(Level.SEVERE, null, e);
            } 

            return lista;
        }
    } 
    public Estado getEstadoPorId(int id) throws SQLException {

        String sql = "select * from estado where id=?";

        try (Connection con = Coneccion.getInstancia().getConeccion()){
        
        Estado estado = null;

        try (PreparedStatement stmt = con.prepareStatement(sql)) {

           
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                
                rs.next();
                estado = new Estado();
                estado.setId(rs.getInt("id"));
                estado.setNombre(rs.getString("nombre"));
                
            }
            } catch (SQLException e) {
                Logger.getLogger(ServicioEstado.class.getName()).log(Level.SEVERE, null, e);
            } 

            return estado;
        }
    }
}
