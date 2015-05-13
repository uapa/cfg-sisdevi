/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.cfg.uapa.java.sisdevi.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import org.apache.commons.codec.digest.DigestUtils;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.http.HttpSession;
import org.cfg.uapa.java.sisdevi.servicios.ServicioUsuario;
import org.cfg.uapa.java.sisdevi.entidades.Usuario;
/**
 *
 * @author NAM
 */
public class LoginServlet extends HttpServlet {

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
            throws ServletException, IOException {
        
        String usuario = request.getParameter("username");
     String clave = DigestUtils.md5Hex(request.getParameter("password"));


    //Hacer una consulta a la base de datos para determinar si el usuario esta registrado       
     ServicioUsuario m = new ServicioUsuario();
     Usuario  usu =  m.checkUsuario(usuario,clave);
         
    //Creando session    
    HttpSession session = request.getSession(true); 
        
     if(usu instanceof Usuario){
         System.out.println("Usuario registrado");
        
         
         session.setAttribute("currentSessionUser",usu); 
         response.sendRedirect("TemplateAdmin/index.jsp");
         
     }else{
         
        //Enviando mensaje a la pagina de login
         session.setAttribute("loginFailed","Usuario no registrado"); 
         response.sendRedirect("TemplateAdmin/login.jsp");
         
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
        processRequest(request, response);
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
        processRequest(request, response);
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
