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
import org.cfg.uapa.java.sisdevi.servicios.ServicioReporte;
import org.cfg.uapa.java.sisdevi.entidades.Reporte;
import org.cfg.uapa.java.sisdevi.servicios.ServicioDetalleReporte;
import org.cfg.uapa.java.sisdevi.entidades.DetalleReporte;
import org.cfg.uapa.java.sisdevi.servicios.ServicioGenero;
import org.cfg.uapa.java.sisdevi.entidades.Genero;
import org.cfg.uapa.java.sisdevi.servicios.ServicioEstadoCivil;
import org.cfg.uapa.java.sisdevi.entidades.EstadoCivil;
import org.cfg.uapa.java.sisdevi.servicios.ServicioTipodeViolencia;
import org.cfg.uapa.java.sisdevi.entidades.TipodeViolencia;
import org.cfg.uapa.java.sisdevi.servicios.ServicioVinculo;
import org.cfg.uapa.java.sisdevi.entidades.Vinculo;
/**
 *
 * @author NAM
 */
public class DetalleReporteServlet extends HttpServlet {

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
        String inputGenero = request.getParameter("inputGenero");
        String inputEstadocivil = request.getParameter("inputEstadocivil");
        String inputFecha = request.getParameter("inputFecha");
        String cedula = request.getParameter("cedula");
        String inputTipoviolencia = request.getParameter("inputTipoviolencia");
        String inputVinculo = request.getParameter("inputVinculo");
        String notas = request.getParameter("notas");
        String inputReporteid = request.getParameter("inputReporteid");
        String inputGrado = request.getParameter("inputGrado");
        String hijos = request.getParameter("hijos");
        String ocupacion = request.getParameter("ocupacion");
        String inputIngresos = request.getParameter("inputIngresos");

        Genero genero = ServicioGenero.getInstancia().getGeneroPorId(Integer.valueOf(inputGenero));
        EstadoCivil estadocivil = ServicioEstadoCivil.getInstancia().getEstadoCivilPorId(Integer.valueOf(inputEstadocivil));
        TipodeViolencia tipodeviolencia = ServicioTipodeViolencia.getInstancia().getTipodeViolenciaPorId(Integer.valueOf(inputTipoviolencia));
        Vinculo vinculo = ServicioVinculo.getInstancia().getVinculoPorId(Integer.valueOf(inputVinculo));
        Reporte reporte = ServicioReporte.getInstancia().getReportePorId(Integer.valueOf(inputReporteid));
        
        DetalleReporte detallereporte = new DetalleReporte();
        detallereporte.setGenero(genero);
        detallereporte.setEstadocivil(estadocivil);
        detallereporte.setFecha_nacimiento(inputFecha);
        detallereporte.setCedula(cedula);
        detallereporte.setTipodeviolencia(tipodeviolencia);
        detallereporte.setVinculo(vinculo);
        detallereporte.setNotas(notas);
        detallereporte.setReporte(reporte);
        detallereporte.setGradoacademico(inputGrado);
        detallereporte.setCantidadhijos(hijos);
        detallereporte.setOcupacion(ocupacion);
        detallereporte.setIngresos(inputIngresos);
        
         boolean isCreado = ServicioDetalleReporte.getInstancia().crearDetalleReporte(detallereporte);
        
        if (isCreado) {

            response.sendRedirect("TemplateAdmin/detallereporte.jsp?id="+Integer.valueOf(inputReporteid));

        } else {

            response.sendRedirect("TemplateAdmin/agregardetallereporte.jsp?id="+Integer.valueOf(inputReporteid));

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
            Logger.getLogger(DetalleReporteServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(DetalleReporteServlet.class.getName()).log(Level.SEVERE, null, ex);
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
