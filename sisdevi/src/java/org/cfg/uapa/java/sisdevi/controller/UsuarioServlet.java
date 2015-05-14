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
import org.cfg.uapa.java.sisdevi.entidades.Estado;
import org.cfg.uapa.java.sisdevi.servicios.ServicioEstado;
import org.cfg.uapa.java.sisdevi.entidades.Usuario;
import org.cfg.uapa.java.sisdevi.servicios.ServicioUsuario;
import org.apache.commons.codec.digest.DigestUtils;
/**
 *
 * @author NAM
 */
public class UsuarioServlet extends HttpServlet {

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
        String correo = request.getParameter("correo");
        String username = request.getParameter("username");
        
        String idEstado = request.getParameter("idEstado");
        String idUsuario = request.getParameter("idUsuario");

        Estado estado = ServicioEstado.getInstancia().getEstadoPorId(Integer.valueOf(idEstado));

        if (null != idUsuario) {
            Usuario usuario1 = new Usuario();
            usuario1.setNombre(nombre);
            usuario1.setApellido(apellido);
            usuario1.setCorreo(correo);
            usuario1.setUsuario(username);
            
            usuario1.setEstado(estado);
            usuario1.setId(Integer.parseInt(idUsuario));

            boolean isActualizado = ServicioUsuario.getInstancia().actualizarUsuario(usuario1);

            if (isActualizado) {

                response.sendRedirect("TemplateAdmin/usuarios.jsp");

            } else {

                response.sendRedirect("TemplateAdmin/editarusuarios.jsp?id=" + Integer.valueOf(idUsuario));

            }

        } else {
            String clave = DigestUtils.md5Hex(request.getParameter("password"));
            Usuario usuario1 = new Usuario();
            usuario1.setNombre(nombre);
            usuario1.setApellido(apellido);
            usuario1.setCorreo(correo);
            usuario1.setUsuario(username);
            usuario1.setClave(clave);
            usuario1.setEstado(estado);
            
            boolean isCreado = ServicioUsuario.getInstancia().crearUsuario(usuario1);

        if (isCreado) {

            response.sendRedirect("TemplateAdmin/login.jsp#enviado");

        } else {

            response.sendRedirect("TemplateAdmin/login.jsp#error");

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
            Logger.getLogger(UsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(UsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
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
