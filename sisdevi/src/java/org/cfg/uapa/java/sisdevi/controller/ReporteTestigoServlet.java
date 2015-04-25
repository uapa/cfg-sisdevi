/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.cfg.uapa.java.sisdevi.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.cfg.uapa.java.sisdevi.servicios.ServicioProvincia;
import org.cfg.uapa.java.sisdevi.entidades.Provincia;
import org.cfg.uapa.java.sisdevi.servicios.ServicioReporteTestigo;
import org.cfg.uapa.java.sisdevi.entidades.ReporteTestigo;
import org.cfg.uapa.java.sisdevi.servicios.ServicioVinculo;
import org.cfg.uapa.java.sisdevi.entidades.Vinculo;

/**
 *
 * @author NAM
 */
public class ReporteTestigoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String nombre = request.getParameter("name");
        String apellido = request.getParameter("lastname");
        String telefono = request.getParameter("telefono");
        String celular = request.getParameter("celular");
        String correo = request.getParameter("correo");
        String inputVinculo = request.getParameter("inputVinculo");
        
        String nombrev = request.getParameter("namev");
        String apellidov = request.getParameter("lastnamev");
        String direccionv = request.getParameter("direccionv");
        String inputProvinciav = request.getParameter("inputProvinciav");
        String telefonov = request.getParameter("telefonov");
        String celularv = request.getParameter("celularv");
        String notas = request.getParameter("notas");
        
        Provincia provincia = ServicioProvincia.getInstancia().getProvinciaPorId(Integer.valueOf(inputProvinciav));
        Vinculo vinculo = ServicioVinculo.getInstancia().getVinculoPorId(Integer.valueOf(inputVinculo));
        
        ReporteTestigo reporte = new ReporteTestigo();
        reporte.setNombre(nombre);
        reporte.setApellido(apellido);
        reporte.setTelefono(telefono);
        reporte.setCelular(celular);
        reporte.setCorreo(correo);
        reporte.setVinculo(vinculo);
        
        reporte.setNombre_victima(nombrev);
        reporte.setApellido_victima(apellidov);
        reporte.setDireccion_victima(direccionv);
        reporte.setProvincia(provincia);
        reporte.setTelefono_victima(telefonov);
        reporte.setCelular_victima(celularv);
        reporte.setNotas(notas);
        
         boolean isCreado = ServicioReporteTestigo.getInstancia().crearReporteTestigo(reporte);
        
        if (isCreado) {

            response.sendRedirect("/TemplateAdmin/verreportetestigo.jsp");

        } else {

            response.sendRedirect("/TemplateWeb/reportes.jsp#testigo");

        }
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ReporteTestigoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ReporteTestigoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
