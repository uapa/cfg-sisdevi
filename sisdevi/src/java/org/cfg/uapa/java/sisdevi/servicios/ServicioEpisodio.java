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

import org.cfg.uapa.java.sisdevi.entidades.Episodio;
import org.cfg.uapa.java.sisdevi.entidades.Reporte;

public class ServicioEpisodio {

    private static final ServicioEpisodio INSTANCIA = new ServicioEpisodio();

    private ServicioEpisodio() {
    }

    public static ServicioEpisodio getInstancia() {
        return INSTANCIA;
    }

    public Episodio getEpisodioPorReporteId(int id) throws SQLException {

        String sql = "select * from episodios where reporte_id=?";

        Episodio episodio = null;

        try (Connection con = Coneccion.getInstancia().getConeccion()) {

            try (PreparedStatement stmt = con.prepareStatement(sql)) {

                stmt.setInt(1, id);
                try (ResultSet rs = stmt.executeQuery()) {

                    rs.next();
                    episodio = new Episodio();
                    episodio.setId(rs.getInt("id"));
                    episodio.setFecha_episodio(rs.getString("fecha_episodio"));
                    episodio.setDescripcion(rs.getString("descripcion"));
                    episodio.setTipodeviolencia(ServicioTipodeViolencia.getInstancia().getTipodeViolenciaPorId(rs.getInt("tipodeviolencia_id")));
                    episodio.setReporte(ServicioReporte.getInstancia().getReportePorId(rs.getInt("reporte_id")));
                    episodio.setFecha_creacion(rs.getString("fecha_creacion"));
                }
            } catch (SQLException e) {
                Logger.getLogger(ServicioEpisodio.class.getName()).log(Level.SEVERE, null, e);
            }

            return episodio;
        }
    }

    public boolean crearEpisodio(Episodio episodio) {

        boolean estado;

        String sql = "insert into episodios(fecha_episodio,descripcion,tipodeviolencia_id,reporte_id) values(?,?,?,?)";

        try (Connection con = Coneccion.getInstancia().getConeccion()) {

            try (PreparedStatement stmt = con.prepareStatement(sql)) {

                stmt.setString(1, episodio.getFecha_episodio());
                stmt.setString(2, episodio.getDescripcion());
                stmt.setInt(3, episodio.getTipodeviolencia().getId());
                stmt.setInt(4, episodio.getReporte().getId());

                stmt.executeUpdate();

                estado = true;

            }
        } catch (SQLException e) {
            estado = false;
            Logger.getLogger(ServicioEpisodio.class.getName()).log(Level.SEVERE, null, e);
        }

        return estado;

    }

    public boolean actualizarEpisodio(Episodio episodio) {
        boolean estado;

        String sql = "update episodios set fecha_episodio=?,descripcion=?,tipodeviolencia_id=?,reporte_id=? where id=?";

        try (Connection con = Coneccion.getInstancia().getConeccion()) {

            try (PreparedStatement stmt = con.prepareStatement(sql)) {

                stmt.setString(1, episodio.getFecha_episodio());
                stmt.setString(2, episodio.getDescripcion());
                stmt.setInt(3, episodio.getTipodeviolencia().getId());
                stmt.setInt(4, episodio.getReporte().getId());
                stmt.setInt(5, episodio.getId());
                stmt.executeUpdate();

                estado = true;

            }
        } catch (SQLException e) {
            estado = false;
            Logger.getLogger(ServicioEpisodio.class.getName()).log(Level.SEVERE, null, e);
        }

        return estado;

    }

    public Episodio getEpisodioPorId(int id) throws SQLException {

        String sql = "select * from episodios where id=?";

        Episodio episodio = null;

        try (Connection con = Coneccion.getInstancia().getConeccion()) {

            try (PreparedStatement stmt = con.prepareStatement(sql)) {

                stmt.setInt(1, id);
                try (ResultSet rs = stmt.executeQuery()) {

                    rs.next();
                    episodio = new Episodio();
                    episodio.setId(rs.getInt("id"));
                    episodio.setFecha_episodio(rs.getString("fecha_episodio"));
                    episodio.setDescripcion(rs.getString("descripcion"));
                    episodio.setTipodeviolencia(ServicioTipodeViolencia.getInstancia().getTipodeViolenciaPorId(rs.getInt("tipodeviolencia_id")));
                    episodio.setReporte(ServicioReporte.getInstancia().getReportePorId(rs.getInt("reporte_id")));
                    episodio.setFecha_creacion(rs.getString("fecha_creacion"));
                }
            } catch (SQLException e) {
                Logger.getLogger(ServicioEpisodio.class.getName()).log(Level.SEVERE, null, e);
            }

            return episodio;
        }
    }

    public List<Episodio> getListadoEpisodio(int id) throws SQLException {

        List<Episodio> lista = new ArrayList<>();

        String sql = "select * from episodios where reporte_id=?";

       try (Connection con = Coneccion.getInstancia().getConeccion()){

        try (PreparedStatement stmt = con.prepareStatement(sql)) {
                stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                    
                while (rs.next()) {
                    Episodio episodio = new Episodio();
                    episodio.setId(rs.getInt("id"));
                    episodio.setFecha_episodio(rs.getString("fecha_episodio"));
                    episodio.setDescripcion(rs.getString("descripcion"));
                    episodio.setTipodeviolencia(ServicioTipodeViolencia.getInstancia().getTipodeViolenciaPorId(rs.getInt("tipodeviolencia_id")));
                    episodio.setReporte(ServicioReporte.getInstancia().getReportePorId(rs.getInt("reporte_id")));
                    episodio.setFecha_creacion(rs.getString("fecha_creacion"));
                    lista.add(episodio);
                }
                
            }
            } catch (SQLException e) {
                Logger.getLogger(ServicioEpisodio.class.getName()).log(Level.SEVERE, null, e);
            }

            return lista;
        }
    }
}
