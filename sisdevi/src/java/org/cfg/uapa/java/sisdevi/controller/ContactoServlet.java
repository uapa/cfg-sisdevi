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
import org.cfg.uapa.java.sisdevi.entidades.Contacto;
import org.cfg.uapa.java.sisdevi.entidades.Estado;
import org.cfg.uapa.java.sisdevi.servicios.ServicioContacto;
import org.cfg.uapa.java.sisdevi.servicios.ServicioEstado;

/**
 *
 * @author acer
 */
public class ContactoServlet extends HttpServlet {

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
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");
        String mensaje = request.getParameter("mensaje");
        String idEstado = request.getParameter("idEstado");
        String idContacto = request.getParameter("idContacto");
        
        Estado estado = ServicioEstado.getInstancia().getEstadoPorId(Integer.valueOf(idEstado));
        
         if (null != idContacto) {
             Contacto contacto = new Contacto();
             contacto.setEstado(estado);
             contacto.setId(Integer.parseInt(idContacto));
             boolean isActualizado = ServicioContacto.getInstancia().actualizarContacto(contacto);
            if (isActualizado) {
                response.sendRedirect("TemplateAdmin/contactos.jsp?id=" + Integer.valueOf(idContacto));

            } else {
                response.sendRedirect("TemplateAdmin/editarcontactos.jsp?id=" + Integer.valueOf(idContacto));

            }
             
         }else {
             Contacto contacto = new Contacto();
             contacto.setNombre(nombre);
             contacto.setTelefono(telefono);
             contacto.setCorreo(correo);
             contacto.setMensaje(mensaje);
             contacto.setEstado(estado);
             boolean isCreado = ServicioContacto.getInstancia().crearContacto(contacto);
            if (isCreado) {
                response.sendRedirect("TemplateWeb/index.jsp#enviado?id=" + Integer.valueOf(idContacto));

            } else {
                response.sendRedirect("TemplateWeb/index.jsp#contact");

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
            Logger.getLogger(ContactoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ContactoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
