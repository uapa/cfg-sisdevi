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
import org.cfg.uapa.java.sisdevi.entidades.EstadoCivil;
import org.cfg.uapa.java.sisdevi.entidades.Genero;
import org.cfg.uapa.java.sisdevi.entidades.Provincia;
import org.cfg.uapa.java.sisdevi.entidades.Reporte;

import org.cfg.uapa.java.sisdevi.entidades.Agresor;
import org.cfg.uapa.java.sisdevi.servicios.ServicioEstadoCivil;
import org.cfg.uapa.java.sisdevi.servicios.ServicioGenero;
import org.cfg.uapa.java.sisdevi.servicios.ServicioProvincia;
import org.cfg.uapa.java.sisdevi.servicios.ServicioReporte;
import org.cfg.uapa.java.sisdevi.servicios.ServicioAgresor;
/**
 *
 * @author NAM
 */
public class AgresorTestigoServlet extends HttpServlet {

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
        String inputGenero = request.getParameter("inputGenero");
        String direccion = request.getParameter("direccion");
        String inputProvincia = request.getParameter("inputProvincia");
        String telefono = request.getParameter("telefono");
        String celular = request.getParameter("celular");
        String inputEstadocivil = request.getParameter("inputEstadocivil");
        String inputFecha = request.getParameter("inputFecha");
        String cedula = request.getParameter("cedula");
        String idReporte = request.getParameter("idReporte");
        String idAgresor = request.getParameter("idAgresor");

        Genero genero = ServicioGenero.getInstancia().getGeneroPorId(Integer.valueOf(inputGenero));
        EstadoCivil estadocivil = ServicioEstadoCivil.getInstancia().getEstadoCivilPorId(Integer.valueOf(inputEstadocivil));
        Provincia provincia = ServicioProvincia.getInstancia().getProvinciaPorId(Integer.valueOf(inputProvincia));
        Reporte reporte = ServicioReporte.getInstancia().getReportePorId(Integer.valueOf(idReporte));

        if (null != idAgresor) {
            Agresor agresor = new Agresor();
            agresor.setNombre(nombre);
            agresor.setApellido(apellido);
            agresor.setGenero(genero);
            agresor.setDireccion(direccion);
            agresor.setProvincia(provincia);
            agresor.setTelefono(telefono);
            agresor.setCelular(celular);
            agresor.setEstadocivil(estadocivil);
            agresor.setFecha_nacimiento(inputFecha);
            agresor.setCedula(cedula);
            agresor.setReporte(reporte);
            agresor.setId(Integer.parseInt(idAgresor));
            boolean isActualizado = ServicioAgresor.getInstancia().actualizarAgresorTestigo(agresor);
            if (isActualizado) {
                response.sendRedirect("TemplateAdmin/agresort.jsp?id=" + Integer.valueOf(idReporte));

            } else {
                response.sendRedirect("TemplateAdmin/editaragresort.jsp?id=" + Integer.valueOf(idAgresor));

            }

        } else {

            Agresor agresor = new Agresor();
            agresor.setNombre(nombre);
            agresor.setApellido(apellido);
            agresor.setGenero(genero);
            agresor.setDireccion(direccion);
            agresor.setProvincia(provincia);
            agresor.setTelefono(telefono);
            agresor.setCelular(celular);
            agresor.setEstadocivil(estadocivil);
            agresor.setFecha_nacimiento(inputFecha);
            agresor.setCedula(cedula);
            agresor.setReporte(reporte);
            boolean isCreado = ServicioAgresor.getInstancia().crearAgresorTestigo(agresor);

            if (isCreado) {

                response.sendRedirect("TemplateAdmin/agresort.jsp?id=" + Integer.valueOf(idReporte));

            } else {

                response.sendRedirect("TemplateAdmin/agregaragresort.jsp?id=" + Integer.valueOf(idReporte));

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
            Logger.getLogger(AgresorTestigoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AgresorTestigoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
