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

import org.cfg.uapa.java.sisdevi.entidades.Estadistica;
import org.cfg.uapa.java.sisdevi.entidades.Reporte;
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
                Logger.getLogger(ServicioEstadistica.class.getName()).log(Level.SEVERE, null, e);
            }

            return estadistica;
        }
    }
    public List<Estadistica> getListadoIngresos() throws SQLException {

        List<Estadistica> lista = new ArrayList<>();

        String sql = "SELECT ingresos,COUNT(id) total FROM detallesreporte WHERE ingresos IN (SELECT ingresos FROM detallesreporte)GROUP BY ingresos";

        try (Connection con = Coneccion.getInstancia().getConeccion()){

        try (Statement stmt = con.createStatement()) {

            try (ResultSet rs = stmt.executeQuery(sql)) {

                while (rs.next()) {
                    Estadistica reporte = new Estadistica();
                    reporte.setTotal(rs.getInt("total"));
                    reporte.setNombre(rs.getString("ingresos"));
                    lista.add(reporte);
                }
            }

            } catch (SQLException e) {
                Logger.getLogger(ServicioEstadistica.class.getName()).log(Level.SEVERE, null, e);
            }

            return lista;
        }
    }
     public Estadistica getTotalReportesPorIngresos(String ingresos) throws SQLException {

        String sql = "SELECT COUNT(id) contador FROM detallesreporte WHERE ingresos = ?";

        Estadistica estadistica = null;

        try (Connection con = Coneccion.getInstancia().getConeccion()) {

            try (PreparedStatement stmt = con.prepareStatement(sql)) {

                stmt.setString(1, ingresos);
                try (ResultSet rs = stmt.executeQuery()) {

                    rs.next();
                    estadistica = new Estadistica();
                    estadistica.setTotal(rs.getInt("contador"));
                    

                }
            } catch (SQLException e) {
                Logger.getLogger(ServicioEstadistica.class.getName()).log(Level.SEVERE, null, e);
            }

            return estadistica;
        }
    }
     public Estadistica getTotalReportesPorMes(int id) throws SQLException {

        String sql = "SELECT COUNT(id) contador FROM reporte where MONTH(fecha_reporte) = ?";

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
                Logger.getLogger(ServicioEstadistica.class.getName()).log(Level.SEVERE, null, e);
            }

            return estadistica;
        }
    }
     public Estadistica getTotalReportesPorEstado(int id) throws SQLException {

        String sql = "SELECT COUNT(id) contador FROM reporte WHERE estado_id = ?";

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
                Logger.getLogger(ServicioEstadistica.class.getName()).log(Level.SEVERE, null, e);
            }

            return estadistica;
        }
    }
}
