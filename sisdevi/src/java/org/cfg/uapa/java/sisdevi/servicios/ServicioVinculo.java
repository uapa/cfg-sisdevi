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
import org.cfg.uapa.java.sisdevi.entidades.Vinculo;
/**
 *
 * @author NAM
 */
public class ServicioVinculo {
     private static final ServicioVinculo INSTANCIA = new ServicioVinculo();

    private ServicioVinculo() {
    }

    public static ServicioVinculo getInstancia() {
        return INSTANCIA;
    }
    public List<Vinculo> getListadoVinculos() throws SQLException {

        List<Vinculo> lista = new ArrayList<>();

        String sql = "select * from vinculo";

        Connection con = Coneccion.getInstancia().getConeccion();
        

        try (Statement stmt = con.createStatement()) {

            
            try (ResultSet rs = stmt.executeQuery(sql)) {
                

                while (rs.next()) {
                    Vinculo vinculo = new Vinculo();
                    vinculo.setId(rs.getInt("id"));
                    vinculo.setNombre(rs.getString("nombre"));

                    lista.add(vinculo);
                }
                rs.close();
                stmt.close();
                con.close();

            } catch (SQLException e) {
                Logger.getLogger(ServicioVinculo.class.getName()).log(Level.SEVERE, null, e);
            } 

            return lista;
        }
    }
    public Vinculo getVinculoPorId(int id) throws SQLException {

        String sql = "select * from vinculo where id=?";

        Connection con = Coneccion.getInstancia().getConeccion();
        
        Vinculo vinculo = null;

        try (PreparedStatement stmt = con.prepareStatement(sql)) {

           
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                
                rs.next();
                vinculo = new Vinculo();
                vinculo.setId(rs.getInt("id"));
                vinculo.setNombre(rs.getString("nombre"));
                
                rs.close();
                stmt.close();
                con.close();

            } catch (SQLException e) {
                Logger.getLogger(ServicioVinculo.class.getName()).log(Level.SEVERE, null, e);
            } 

            return vinculo;
        }
    }
    
}
