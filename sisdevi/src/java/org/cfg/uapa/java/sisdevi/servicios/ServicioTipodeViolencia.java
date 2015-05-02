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

import org.cfg.uapa.java.sisdevi.entidades.TipodeViolencia;

/**
 *
 * @author NAM
 */
public class ServicioTipodeViolencia {
    private static final ServicioTipodeViolencia INSTANCIA = new ServicioTipodeViolencia();

    private ServicioTipodeViolencia() {
    }

    public static ServicioTipodeViolencia getInstancia() {
        return INSTANCIA;
    }
    public List<TipodeViolencia> getListadoTipodeViolencia() throws SQLException {

        List<TipodeViolencia> lista = new ArrayList<>();

        String sql = "select * from tipodeviolencia";

        Connection con = Coneccion.getInstancia().getConeccion();
        

        try (Statement stmt = con.createStatement()) {

            
            try (ResultSet rs = stmt.executeQuery(sql)) {
                

                while (rs.next()) {
                    TipodeViolencia tipodeviolencia = new TipodeViolencia();
                    tipodeviolencia.setId(rs.getInt("id"));
                    tipodeviolencia.setNombre(rs.getString("nombre"));

                    lista.add(tipodeviolencia);
                }
                rs.close();
                stmt.close();
                con.close();

            } catch (SQLException e) {
                Logger.getLogger(ServicioTipodeViolencia.class.getName()).log(Level.SEVERE, null, e);
            } 

            return lista;
        }
    } 
    public TipodeViolencia getTipodeViolenciaPorId(int id) throws SQLException {

        String sql = "select * from tipodeviolencia where id=?";

        Connection con = Coneccion.getInstancia().getConeccion();
        
        TipodeViolencia tipodeviolencia = null;

        try (PreparedStatement stmt = con.prepareStatement(sql)) {

           
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                
                rs.next();
                tipodeviolencia = new TipodeViolencia();
                tipodeviolencia.setId(rs.getInt("id"));
                tipodeviolencia.setNombre(rs.getString("nombre"));
                rs.close();
                stmt.close();
                con.close();

            } catch (SQLException e) {
                Logger.getLogger(ServicioTipodeViolencia.class.getName()).log(Level.SEVERE, null, e);
            } 

            return tipodeviolencia;
        }
    }
    
    
    
}
