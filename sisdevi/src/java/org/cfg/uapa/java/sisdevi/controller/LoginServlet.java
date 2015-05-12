/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.cfg.uapa.java.sisdevi.controller;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.http.HttpSession;
import org.cfg.uapa.java.sisdevi.servicios.ServicioUsuario;
import org.cfg.uapa.java.sisdevi.entidades.Usuario;


public class LoginServlet extends HttpServlet {
    private static final String CONTENT_TYPE = "text/html; charset=UTF-8";

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doPost(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     String usuario = request.getParameter("username");
     String clave = request.getParameter("password");


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
         
         System.out.println("Usuario no registrado");
        //Enviando mensaje a la pagina de login
         session.setAttribute("loginFailed","Usuario no registrado"); 
         response.sendRedirect("login.jsp");
         
     }
        
    }
}
