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
import org.cfg.uapa.java.sisdevi.servicios.ServicioReporte;
import org.cfg.uapa.java.sisdevi.entidades.Reporte;
import org.cfg.uapa.java.sisdevi.servicios.ServicioEstado;
import org.cfg.uapa.java.sisdevi.entidades.Estado;

/**
 *
 * @author NAM
 */
public class ReporteVictimaServlet extends HttpServlet {

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
        String direccion = request.getParameter("direccion");
        String inputProvincia = request.getParameter("inputProvincia");
        String telefono = request.getParameter("telefono");
        String celular = request.getParameter("celular");
        String correo = request.getParameter("correo");
        String idReporte = request.getParameter("idReporte");
        String inputEstado = request.getParameter("inputEstado");

        Provincia provincia = ServicioProvincia.getInstancia().getProvinciaPorId(Integer.valueOf(inputProvincia));
        Estado estado = ServicioEstado.getInstancia().getEstadoPorId(Integer.valueOf(inputEstado));
        
        if (null != idReporte) {
            Reporte reporte = new Reporte();
            reporte.setNombre(nombre);
            reporte.setApellido(apellido);
            reporte.setDireccion(direccion);
            reporte.setProvincia(provincia);
            reporte.setTelefono(telefono);
            reporte.setCelular(celular);
            reporte.setCorreo(correo);
            reporte.setEstado(estado);
            reporte.setId(Integer.parseInt(idReporte));
            
            
            boolean isActualizado = ServicioReporte.getInstancia().actualizarReporte(reporte);

        if (isActualizado) {

            response.sendRedirect("TemplateAdmin/verreporte.jsp");

        } else {

            response.sendRedirect("TemplateAdmin/editarreportes.jsp?id="+ Integer.valueOf(idReporte));

        }
            

        }else {

        Reporte reporte = new Reporte();
        reporte.setNombre(nombre);
        reporte.setApellido(apellido);
        reporte.setDireccion(direccion);
        reporte.setProvincia(provincia);
        reporte.setTelefono(telefono);
        reporte.setCelular(celular);
        reporte.setCorreo(correo);

        boolean isCreado = ServicioReporte.getInstancia().crearReporte(reporte);

        if (isCreado) {

            response.sendRedirect("TemplateAdmin/verreporte.jsp");

        } else {

            response.sendRedirect("TemplateWeb/reportes.jsp#victima");

        }

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
            Logger.getLogger(ReporteVictimaServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ReporteVictimaServlet.class.getName()).log(Level.SEVERE, null, ex);
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
