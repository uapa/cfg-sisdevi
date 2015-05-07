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

import org.cfg.uapa.java.sisdevi.entidades.Estadistica;
/**
 *
 * @author NAM
 */
public class ServicioEstadistica {
    private static final ServicioEstadistica INSTANCIA = new ServicioEstadistica();

    private ServicioEstadistica() {
    }

    public static ServicioEstadistica getInstancia() {
        return INSTANCIA;
    }
    public Estadistica getTotalReportesPorTipo(int id) throws SQLException {

        String sql = "SELECT COUNT(tipodeviolencia_id) contador FROM detallesreporte WHERE tipodeviolencia_id =?";

        Estadistica estadistica = null;

        try (Connection con = Coneccion.getInstancia().getConeccion()) {

            try (PreparedStatement stmt = con.prepareStatement(sql)) {

                stmt.setInt(1, id);
                try (ResultSet rs = stmt.executeQuery()) {

                    rs.next();
                    estadistica = new Estadistica();
                    estadistica.setTotal(rs.getInt("contador"));
                    

                }
            } catch (SQLException e) {
                Logger.getLogger(ServicioAgresor.class.getName()).log(Level.SEVERE, null, e);
            }

            return estadistica;
        }
    }
    
}
