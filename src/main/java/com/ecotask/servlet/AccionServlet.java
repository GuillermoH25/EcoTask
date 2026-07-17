/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ecotask.servlet;

import com.ecotask.util.conexion;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AccionServlet", urlPatterns = {"/AccionServlet"})
public class AccionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ====================================================================
        // IMPORTANTE: Forzamos la codificación UTF-8 antes de leer los datos
        // ====================================================================
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        // Ahora capturamos los parámetros de manera segura con tildes y Ñs
        String correo = request.getParameter("correo");
        String accion = request.getParameter("accion");

        try {

            Connection con = conexion.getConexion();

            String sql = "INSERT INTO acciones(correo, accion) VALUES(?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, correo);
            ps.setString(2, accion);

            ps.executeUpdate();

            response.sendRedirect("dashboard.jsp");

        } catch (Exception e) {

            e.printStackTrace();

        }

    }

}