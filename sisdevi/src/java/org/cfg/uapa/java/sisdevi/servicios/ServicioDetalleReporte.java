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

    public boolean crearDetalleReporte(DetalleReporte detallereporte) {

        boolean estado;

        String sql = "insert into detallesreporte(genero_id,estadocivil_id,fecha_nacimiento,cedula,tipodeviolencia_id,vinculo_id,notas,reporte_id,gradoacademico,cantidadhijos,ocupacion,ingresos) values(?,?,?,?,?,?,?,?,?,?,?,?)";

        Connection con = Coneccion.getInstancia().getConeccion();

        try (PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, detallereporte.getGenero().getId());
            stmt.setInt(2, detallereporte.getEstadocivil().getId());
            stmt.setString(3, detallereporte.getFecha_nacimiento());
            stmt.setString(4, detallereporte.getCedula());
            stmt.setInt(5, detallereporte.getTipodeviolencia().getId());
            stmt.setInt(6, detallereporte.getVinculo().getId());
            stmt.setString(7, detallereporte.getNotas());
            stmt.setInt(8, detallereporte.getReporte().getId());
            stmt.setString(9, detallereporte.getGradoacademico());
            stmt.setString(10, detallereporte.getCantidadhijos());
            stmt.setString(11, detallereporte.getOcupacion());
            stmt.setString(12, detallereporte.getIngresos());

            stmt.executeUpdate();

            estado = true;

        } catch (SQLException e) {
            estado = false;
            Logger.getLogger(ServicioDetalleReporte.class.getName()).log(Level.SEVERE, null, e);
        }

        return estado;

    }

    public DetalleReporte getDetallePorDetalleId(int id) throws SQLException {

        String sql = "select * from detallesreporte where id=?";

        Connection con = Coneccion.getInstancia().getConeccion();

        DetalleReporte detallereporte1 = null;

        try (PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {

                rs.next();
                detallereporte1 = new DetalleReporte();
                detallereporte1.setId(rs.getInt("id"));
                //detallereporte1.setGenero(ServicioGenero.getInstancia().getGeneroPorId(rs.getInt("genero_id")));
                //detallereporte1.setEstadocivil(ServicioEstadoCivil.getInstancia().getEstadoCivilPorId(rs.getInt("estadocivil_id")));
                detallereporte1.setFecha_nacimiento(rs.getString("fecha_nacimiento"));
                detallereporte1.setCedula(rs.getString("cedula"));
                //detallereporte1.setTipodeviolencia(ServicioTipodeViolencia.getInstancia().getTipodeViolenciaPorId(rs.getInt("tipodeviolencia_id")));
                detallereporte1.setVinculo(ServicioVinculo.getInstancia().getVinculoPorId(rs.getInt("vinculo_id")));
                detallereporte1.setNotas(rs.getString("notas"));
                detallereporte1.setReporte(ServicioReporte.getInstancia().getReportePorId(rs.getInt("reporte_id")));
                detallereporte1.setGradoacademico(rs.getString("gradoacademico"));
                detallereporte1.setCantidadhijos(rs.getString("cantidadhijos"));
                detallereporte1.setOcupacion(rs.getString("ocupacion"));
                detallereporte1.setIngresos(rs.getString("ingresos"));
                
            } catch (SQLException e) {
                Logger.getLogger(ServicioDetalleReporte.class.getName()).log(Level.SEVERE, null, e);
            }

            return detallereporte1;
        }
    }

    public boolean actualizarDetalle(DetalleReporte detallereporte) {
        boolean estado;

        String sql = "update detallesreporte set genero_id=?,estadocivil_id=?,fecha_nacimiento=?,cedula=?,tipodeviolencia_id=?,vinculo_id=?,notas=?,reporte_id=?,gradoacademico=?,cantidadhijos=?,ocupacion=?,ingresos=? where id=?";

        Connection con = Coneccion.getInstancia().getConeccion();

        try (PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, detallereporte.getGenero().getId());
            stmt.setInt(2, detallereporte.getEstadocivil().getId());
            stmt.setString(3, detallereporte.getFecha_nacimiento());
            stmt.setString(4, detallereporte.getCedula());
            stmt.setInt(5, detallereporte.getTipodeviolencia().getId());
            stmt.setInt(6, detallereporte.getVinculo().getId());
            stmt.setString(7, detallereporte.getNotas());
            stmt.setInt(8, detallereporte.getReporte().getId());
            stmt.setString(9, detallereporte.getGradoacademico());
            stmt.setString(10, detallereporte.getCantidadhijos());
            stmt.setString(11, detallereporte.getOcupacion());
            stmt.setString(12, detallereporte.getIngresos());
            stmt.setInt(13, detallereporte.getId());
            stmt.executeUpdate();

            estado = true;

        } catch (SQLException e) {
            estado = false;
            Logger.getLogger(ServicioDetalleReporte.class.getName()).log(Level.SEVERE, null, e);
        }

        return estado;

    }

    public DetalleReporte getDetallePorIdd(int id) {

        String sql = "select * from detallesreporte where id=?";

        Connection con = Coneccion.getInstancia().getConeccion();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        DetalleReporte detalle1 = null;

        try {

            stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);

            rs = stmt.executeQuery();

            rs.next();

            detalle1 = new DetalleReporte();
            detalle1.setId(rs.getInt("id"));
            detalle1.setGenero(ServicioGenero.getInstancia().getGeneroPorId(rs.getInt("genero_id")));
            detalle1.setFecha_nacimiento(rs.getString("fecha_nacimiento"));
            detalle1.setCedula(rs.getString("cedula"));
            detalle1.setReporte(ServicioReporte.getInstancia().getReportePorId(rs.getInt("reporte_id")));
            detalle1.setNotas(rs.getString("notas"));
            detalle1.setCantidadhijos(rs.getString("cantidadhijos"));
            detalle1.setOcupacion(rs.getString("ocupacion"));
            detalle1.setIngresos(rs.getString("ingresos"));

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

        return detalle1;
    }

}
