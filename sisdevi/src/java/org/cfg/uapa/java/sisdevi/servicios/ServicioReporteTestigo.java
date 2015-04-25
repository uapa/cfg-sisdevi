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

        Connection con = Coneccion.getInstancia().getConeccion();

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

        } catch (SQLException e) {
            estado = false;
            Logger.getLogger(ServicioReporteTestigo.class.getName()).log(Level.SEVERE, null, e);
        }

        return estado;

    }

    public List<ReporteTestigo> getListadoReporteTestigo() throws SQLException {

        List<ReporteTestigo> lista = new ArrayList<>();

        String sql = "select * from reportetestigo";

        Connection con = Coneccion.getInstancia().getConeccion();

        try (Statement stmt = con.createStatement()) {

            try (ResultSet rs = stmt.executeQuery(sql)) {

                while (rs.next()) {
                    ReporteTestigo reporte = new ReporteTestigo();
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
                    lista.add(reporte);
                }

            } catch (SQLException e) {
                Logger.getLogger(ServicioReporteTestigo.class.getName()).log(Level.SEVERE, null, e);
            }

            return lista;
        }
    }

    public ReporteTestigo getReporteTestigoPorId(int id) throws SQLException {

        String sql = "select * from reportetestigo where id=?";

        Connection con = Coneccion.getInstancia().getConeccion();

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

            } catch (SQLException e) {
                Logger.getLogger(ServicioReporteTestigo.class.getName()).log(Level.SEVERE, null, e);
            }

            return reporte;
        }
    }

}
