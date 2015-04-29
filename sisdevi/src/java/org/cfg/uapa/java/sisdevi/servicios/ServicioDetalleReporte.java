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
import org.cfg.uapa.java.sisdevi.entidades.DetalleReporte;

/**
 *
 * @author NAM
 */
public class ServicioDetalleReporte {

    private static final ServicioDetalleReporte INSTANCIA = new ServicioDetalleReporte();

    private ServicioDetalleReporte() {
    }

    public static ServicioDetalleReporte getInstancia() {
        return INSTANCIA;
    }

    public DetalleReporte getDetallePorReporteId(int id) throws SQLException {

        String sql = "select * from detallesreporte where reporte_id=?";

        Connection con = Coneccion.getInstancia().getConeccion();

        DetalleReporte detalle = null;

        try (PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {

                rs.next();
                detalle = new DetalleReporte();
                detalle.setId(rs.getInt("id"));
                detalle.setGenero(ServicioGenero.getInstancia().getGeneroPorId(rs.getInt("genero_id")));
                detalle.setEstadocivil(ServicioEstadoCivil.getInstancia().getEstadoCivilPorId(rs.getInt("estadocivil_id")));
                detalle.setFecha_nacimiento(rs.getString("fecha_nacimiento"));
                detalle.setCedula(rs.getString("cedula"));
                detalle.setTipodeviolencia(ServicioTipodeViolencia.getInstancia().getTipodeViolenciaPorId(rs.getInt("tipodeviolencia_id")));
                detalle.setVinculo(ServicioVinculo.getInstancia().getVinculoPorId(rs.getInt("vinculo_id")));
                detalle.setNotas(rs.getString("notas"));
                detalle.setReporte(ServicioReporte.getInstancia().getReportePorId(rs.getInt("reporte_id")));
                detalle.setGradoacademico(rs.getString("gradoacademico"));
                detalle.setCantidadhijos(rs.getString("cantidadhijos"));
                detalle.setOcupacion(rs.getString("ocupacion"));
                detalle.setIngresos(rs.getString("ingresos"));
                detalle.setFecha_creacion(rs.getString("fecha_creacion"));

            } catch (SQLException e) {
                Logger.getLogger(ServicioDetalleReporte.class.getName()).log(Level.SEVERE, null, e);
            }

            return detalle;
        }
    }

    public DetalleReporte getDetallePorId(int id) {

        String sql = "select * from detallesreporte where reporte_id=?";

        Connection con = Coneccion.getInstancia().getConeccion();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        DetalleReporte detalle = null;

        try {

            stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);

            rs = stmt.executeQuery();

            rs.next();

            detalle = new DetalleReporte();
            detalle.setId(rs.getInt("id"));
            detalle.setGenero(ServicioGenero.getInstancia().getGeneroPorId(rs.getInt("genero_id")));
            detalle.setEstadocivil(ServicioEstadoCivil.getInstancia().getEstadoCivilPorId(rs.getInt("estadocivil_id")));
            detalle.setFecha_nacimiento(rs.getString("fecha_nacimiento"));
            detalle.setCedula(rs.getString("cedula"));
            detalle.setTipodeviolencia(ServicioTipodeViolencia.getInstancia().getTipodeViolenciaPorId(rs.getInt("tipodeviolencia_id")));
            detalle.setVinculo(ServicioVinculo.getInstancia().getVinculoPorId(rs.getInt("vinculo_id")));
            detalle.setNotas(rs.getString("notas"));
            detalle.setReporte(ServicioReporte.getInstancia().getReportePorId(rs.getInt("reporte_id")));
            detalle.setGradoacademico(rs.getString("gradoacademico"));
            detalle.setCantidadhijos(rs.getString("cantidadhijos"));
            detalle.setOcupacion(rs.getString("ocupacion"));
            detalle.setIngresos(rs.getString("ingresos"));
            detalle.setFecha_creacion(rs.getString("fecha_creacion"));

        } catch (SQLException e) {
            Logger.getLogger(ServicioDetalleReporte.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                Logger.getLogger(ServicioDetalleReporte.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return detalle;
    }

}
