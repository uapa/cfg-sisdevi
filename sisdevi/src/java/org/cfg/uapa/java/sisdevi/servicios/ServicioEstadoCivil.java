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
import org.cfg.uapa.java.sisdevi.entidades.EstadoCivil;


/**
 *
 * @author NAM
 */
public class ServicioEstadoCivil {
    private static final ServicioEstadoCivil INSTANCIA = new ServicioEstadoCivil();

    private ServicioEstadoCivil() {
    }

    public static ServicioEstadoCivil getInstancia() {
        return INSTANCIA;
    }
    public List<EstadoCivil> getListadoEstadoCivil() throws SQLException {

        List<EstadoCivil> lista = new ArrayList<>();

        String sql = "select * from estadocivil";

        Connection con = Coneccion.getInstancia().getConeccion();
        

        try (Statement stmt = con.createStatement()) {

            
            try (ResultSet rs = stmt.executeQuery(sql)) {
                

                while (rs.next()) {
                    EstadoCivil estadocivil = new EstadoCivil();
                    estadocivil.setId(rs.getInt("id"));
                    estadocivil.setNombre(rs.getString("nombre"));

                    lista.add(estadocivil);
                }

            } catch (SQLException e) {
                Logger.getLogger(ServicioEstadoCivil.class.getName()).log(Level.SEVERE, null, e);
            } 

            return lista;
        }
    } 
    public EstadoCivil getEstadoCivilPorId(int id) throws SQLException {

        String sql = "select * from estadocivil where id=?";

        Connection con = Coneccion.getInstancia().getConeccion();
        
        EstadoCivil estadocivil = null;

        try (PreparedStatement stmt = con.prepareStatement(sql)) {

           
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                
                rs.next();
                estadocivil = new EstadoCivil();
                estadocivil.setId(rs.getInt("id"));
                estadocivil.setNombre(rs.getString("nombre"));

            } catch (SQLException e) {
                Logger.getLogger(ServicioEstadoCivil.class.getName()).log(Level.SEVERE, null, e);
            } 

            return estadocivil;
        }
    }
    
    
}
