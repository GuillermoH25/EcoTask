/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ecotask.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession; // Súper importante: Importar la clase para manejar sesiones

import com.ecotask.util.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author USER
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Forzamos UTF-8 también aquí por si acaso el login tuviera caracteres especiales
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        String correo = request.getParameter("correo");
        String password = request.getParameter("password");

        try {

            Connection con = conexion.getConexion();

            String sql = "SELECT * FROM usuarios WHERE correo=? AND password=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, correo);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                
                // 1. Obtenemos los datos del usuario directamente del ResultSet de la BD
                String nombreUsuario = rs.getString("nombre");
                String correoUsuario = rs.getString("correo");

                // 2. Creamos o recuperamos la sesión HTTP
                HttpSession session = request.getSession();

                // 3. Guardamos los datos en la sesión para usarlos en el dashboard
                session.setAttribute("nombreUsuario", nombreUsuario);
                session.setAttribute("correoUsuario", correoUsuario);

                // 4. Redirigimos con la sesión ya cargada
                response.sendRedirect("dashboard.jsp");

            } else {

                response.sendRedirect("login.jsp?error=1");

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

    }
}