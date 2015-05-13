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

import org.cfg.uapa.java.sisdevi.entidades.ReporteTestigo;

/**
 *
 * @author NAM
 */
public class ServicioReporteTestigo {

    private static final ServicioReporteTestigo INSTANCIA = new ServicioReporteTestigo();

    private ServicioReporteTestigo() {
    }

    public static ServicioReporteTestigo getInstancia() {
        return INSTANCIA;
    }

    public boolean crearReporteTestigo(ReporteTestigo reporte) {

        boolean estado;

        String sql = "insert into reportetestigo(nombre,apellido,telefono,celular,correo,vinculo_id,nombre_victima,apellido_victima,direccion_victima,provincia_id,telefono_victima,celular_victima,notas) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";

        try (Connection con = Coneccion.getInstancia().getConeccion()){

        try (PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, reporte.getNombre());
            stmt.setString(2, reporte.getApellido());
            stmt.setString(3, reporte.getTelefono());
            stmt.setString(4, reporte.getCelular());
            stmt.setString(5, reporte.getCorreo());
            stmt.setInt(6, reporte.getVinculo().getId());

            stmt.setString(7, reporte.getNombre_victima());
            stmt.setString(8, reporte.getApellido_victima());
            stmt.setString(9, reporte.getDireccion_victima());
            stmt.setInt(10, reporte.getProvincia().getId());
            stmt.setString(11, reporte.getTelefono_victima());
            stmt.setString(12, reporte.getCelular_victima());
            stmt.setString(13, reporte.getNotas());
            //stmt.setString(14, reporte.getFecha_reporte());

            stmt.executeUpdate();

            estado = true;
            
        }
        } catch (SQLException e) {
            estado = false;
            Logger.getLogger(ServicioReporteTestigo.class.getName()).log(Level.SEVERE, null, e);
        }

        return estado;

    }

    public List<ReporteTestigo> getListadoReporteTestigo() throws SQLException {

        List<ReporteTestigo> lista = new ArrayList<>();

        String sql = "select * from reportetestigo";

        try (Connection con = Coneccion.getInstancia().getConeccion()){

        try (Statement stmt = con.createStatement()) {

            try (ResultSet rs = stmt.executeQuery(sql)) {

                while (rs.next()) {
                    ReporteTestigo reporte1 = new ReporteTestigo();
                    reporte1.setId(rs.getInt("id"));
                    reporte1.setNombre(rs.getString("nombre"));
                    reporte1.setApellido(rs.getString("apellido"));
                    reporte1.setTelefono(rs.getString("telefono"));
                    reporte1.setCelular(rs.getString("celular"));
                    reporte1.setCorreo(rs.getString("correo"));
                    reporte1.setVinculo(ServicioVinculo.getInstancia().getVinculoPorId(rs.getInt("vinculo_id")));

                    reporte1.setNombre_victima(rs.getString("nombre_victima"));
                    reporte1.setApellido_victima(rs.getString("apellido_victima"));
                    reporte1.setDireccion_victima(rs.getString("direccion_victima"));
                    reporte1.setProvincia(ServicioProvincia.getInstancia().getProvinciaPorId(rs.getInt("provincia_id")));
                    reporte1.setTelefono_victima(rs.getString("telefono_victima"));
                    reporte1.setCelular_victima(rs.getString("celular_victima"));
                    reporte1.setNotas(rs.getString("notas"));
                    reporte1.setEstado(ServicioEstado.getInstancia().getEstadoPorId(rs.getInt("estado_id")));
                    lista.add(reporte1);
                }
                
            }

            } catch (SQLException e) {
                Logger.getLogger(ServicioReporteTestigo.class.getName()).log(Level.SEVERE, null, e);
            }

            return lista;
        }
    }

    public ReporteTestigo getReporteTestigoPorId(int id) throws SQLException {

        String sql = "select * from reportetestigo where id=?";

        try (Connection con = Coneccion.getInstancia().getConeccion()){

        ReporteTestigo reporte = null;

        try (PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {

                rs.next();
                reporte = new ReporteTestigo();
                reporte.setId(rs.getInt("id"));
                reporte.setNombre(rs.getString("nombre"));
                reporte.setApellido(rs.getString("apellido"));
                reporte.setTelefono(rs.getString("telefono"));
                reporte.setCelular(rs.getString("celular"));
                reporte.setCorreo(rs.getString("correo"));
                reporte.setVinculo(ServicioVinculo.getInstancia().getVinculoPorId(rs.getInt("vinculo_id")));

                reporte.setNombre_victima(rs.getString("nombre_victima"));
                reporte.setApellido_victima(rs.getString("apellido_victima"));
                reporte.setDireccion_victima(rs.getString("direccion_victima"));
                reporte.setProvincia(ServicioProvincia.getInstancia().getProvinciaPorId(rs.getInt("provincia_id")));
                reporte.setTelefono_victima(rs.getString("telefono_victima"));
                reporte.setCelular_victima(rs.getString("celular_victima"));
                reporte.setNotas(rs.getString("notas"));
                reporte.setFecha_reporte(rs.getString("fecha_reporte"));
                reporte.setEstado(ServicioEstado.getInstancia().getEstadoPorId(rs.getInt("estado_id")));
                
                
            }
            } catch (SQLException e) {
                Logger.getLogger(ServicioReporteTestigo.class.getName()).log(Level.SEVERE, null, e);
            }

            return reporte;
        }
    }
    public boolean actualizarReportet(ReporteTestigo reporte) {
        boolean estado;

        String sql = "update reportetestigo set nombre=?,apellido=?,telefono=?,celular=?,correo=?,vinculo_id=?,nombre_victima=?,apellido_victima=?,direccion_victima=?,provincia_id=?,telefono_victima=?,celular_victima=?,notas=?,estado_id=? where id=?";

        try (Connection con = Coneccion.getInstancia().getConeccion()){

        try (PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, reporte.getNombre());
            stmt.setString(2, reporte.getApellido());
            stmt.setString(3, reporte.getTelefono());
            stmt.setString(4, reporte.getCelular());
            stmt.setString(5, reporte.getCorreo());
            stmt.setInt(6, reporte.getVinculo().getId());

            stmt.setString(7, reporte.getNombre_victima());
            stmt.setString(8, reporte.getApellido_victima());
            stmt.setString(9, reporte.getDireccion_victima());
            stmt.setInt(10, reporte.getProvincia().getId());
            stmt.setString(11, reporte.getTelefono_victima());
            stmt.setString(12, reporte.getCelular_victima());
            stmt.setString(13, reporte.getNotas());
            stmt.setInt(14, reporte.getEstado().getId());
            stmt.setInt(15, reporte.getId());

            stmt.executeUpdate();

            estado = true;
        }

        } catch (SQLException e) {
            estado = false;
            Logger.getLogger(ServicioReporteTestigo.class.getName()).log(Level.SEVERE, null, e);
        }

        return estado;

    }

}
