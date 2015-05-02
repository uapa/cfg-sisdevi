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
import org.cfg.uapa.java.sisdevi.entidades.Provincia;

/**
 *
 * @author NAM
 */
public class ServicioProvincia {

    private static final ServicioProvincia INSTANCIA = new ServicioProvincia();

    private ServicioProvincia() {
    }

    public static ServicioProvincia getInstancia() {
        return INSTANCIA;
    }

    public List<Provincia> getListadoProvincias() throws SQLException {

        List<Provincia> lista = new ArrayList<>();

        String sql = "select * from provincias";

        Connection con = Coneccion.getInstancia().getConeccion();

        try (Statement stmt = con.createStatement()) {

            try (ResultSet rs = stmt.executeQuery(sql)) {

                while (rs.next()) {
                    Provincia provincia = new Provincia();
                    provincia.setId(rs.getInt("id"));
                    provincia.setNombre(rs.getString("nombre"));

                    lista.add(provincia);
                }
                rs.close();
                stmt.close();
                con.close();

            } catch (SQLException e) {
                Logger.getLogger(ServicioProvincia.class.getName()).log(Level.SEVERE, null, e);
            }

            return lista;
        }
    }

    public Provincia getProvinciaPorId(int id) throws SQLException {

        String sql = "select * from provincias where id=?";

        Connection con = Coneccion.getInstancia().getConeccion();

        Provincia provincia = null;

        try (PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {

                rs.next();
                provincia = new Provincia();
                provincia.setId(rs.getInt("id"));
                provincia.setNombre(rs.getString("nombre"));

                rs.close();
                stmt.close();
                con.close();

            } catch (SQLException e) {
                Logger.getLogger(ServicioProvincia.class.getName()).log(Level.SEVERE, null, e);
            }

            return provincia;
        }
    }

}
