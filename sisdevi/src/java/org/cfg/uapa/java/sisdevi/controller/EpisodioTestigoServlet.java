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
import org.cfg.uapa.java.sisdevi.entidades.TipodeViolencia;
import org.cfg.uapa.java.sisdevi.servicios.ServicioTipodeViolencia;
import org.cfg.uapa.java.sisdevi.entidades.ReporteTestigo;
import org.cfg.uapa.java.sisdevi.servicios.ServicioReporteTestigo;
import org.cfg.uapa.java.sisdevi.entidades.Episodio;

import org.cfg.uapa.java.sisdevi.servicios.ServicioEpisodio;
/**
 *
 * @author NAM
 */
public class EpisodioTestigoServlet extends HttpServlet {

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
        String inputFecha = request.getParameter("inputFecha");
        String inputTipoviolencia = request.getParameter("inputTipoviolencia");
        String descripcion = request.getParameter("descripcion");
        String idReporte = request.getParameter("idReporte");
        String idEpisodio = request.getParameter("idEpisodio");

        TipodeViolencia tipodeviolencia = ServicioTipodeViolencia.getInstancia().getTipodeViolenciaPorId(Integer.valueOf(inputTipoviolencia));
        ReporteTestigo reporte = ServicioReporteTestigo.getInstancia().getReporteTestigoPorId(Integer.valueOf(idReporte));

        if (null != idEpisodio) {
            Episodio episodio = new Episodio();
            episodio.setFecha_episodio(inputFecha);
            episodio.setTipodeviolencia(tipodeviolencia);
            episodio.setDescripcion(descripcion);
            episodio.setReporteTestigo(reporte);
            episodio.setId(Integer.parseInt(idEpisodio));
            boolean isActualizado = ServicioEpisodio.getInstancia().actualizarEpisodioTestigo(episodio);
            if (isActualizado) {
                response.sendRedirect("TemplateAdmin/episodiost.jsp?id=" + Integer.valueOf(idReporte));

            } else {
                response.sendRedirect("TemplateAdmin/editarepisodiot.jsp?id=" + Integer.valueOf(idEpisodio));

            }

        } else {
            Episodio episodio = new Episodio();
            episodio.setFecha_episodio(inputFecha);
            episodio.setTipodeviolencia(tipodeviolencia);
            episodio.setDescripcion(descripcion);
            episodio.setReporteTestigo(reporte);
            boolean isCreado = ServicioEpisodio.getInstancia().crearEpisodioTestigo(episodio);
            if (isCreado) {
                response.sendRedirect("TemplateAdmin/episodiost.jsp?id=" + Integer.valueOf(idReporte));

            } else {
                response.sendRedirect("TemplateAdmin/agregarepisodiot.jsp?id=" + Integer.valueOf(idReporte));

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
            Logger.getLogger(EpisodioTestigoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(EpisodioTestigoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
