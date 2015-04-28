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
import org.cfg.uapa.java.sisdevi.entidades.Genero;


/**
 *
 * @author NAM
 */
public class ServicioGenero {
     private static final ServicioGenero INSTANCIA = new ServicioGenero();

    private ServicioGenero() {
    }

    public static ServicioGenero getInstancia() {
        return INSTANCIA;
    }
    public List<Genero> getListadoGeneros() throws SQLException {

        List<Genero> lista = new ArrayList<>();

        String sql = "select * from genero";

        Connection con = Coneccion.getInstancia().getConeccion();
        

        try (Statement stmt = con.createStatement()) {

            
            try (ResultSet rs = stmt.executeQuery(sql)) {
                

                while (rs.next()) {
                    Genero genero = new Genero();
                    genero.setId(rs.getInt("id"));
                    genero.setNombre(rs.getString("nombre"));

                    lista.add(genero);
                }

            } catch (SQLException e) {
                Logger.getLogger(ServicioGenero.class.getName()).log(Level.SEVERE, null, e);
            } 

            return lista;
        }
    } 
     public Genero getGeneroPorId(int id) throws SQLException {

        String sql = "select * from genero where id=?";

        Connection con = Coneccion.getInstancia().getConeccion();
        
        Genero genero = null;

        try (PreparedStatement stmt = con.prepareStatement(sql)) {

           
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                
                rs.next();
                genero = new Genero();
                genero.setId(rs.getInt("id"));
                genero.setNombre(rs.getString("nombre"));

            } catch (SQLException e) {
                Logger.getLogger(ServicioGenero.class.getName()).log(Level.SEVERE, null, e);
            } 

            return genero;
        }
    }
    
}
