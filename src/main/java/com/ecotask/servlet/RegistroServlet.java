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

import com.ecotask.util.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author USER
 */
@WebServlet(name = "RegistroServlet", urlPatterns = {"/RegistroServlet"})
public class RegistroServlet extends HttpServlet {

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String nombre = request.getParameter("nombre");
    String correo = request.getParameter("correo");
    String password = request.getParameter("password");

    try {

        Connection con = conexion.getConexion();

        String sql = "INSERT INTO usuarios(nombre, correo, password) VALUES(?,?,?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, nombre);
        ps.setString(2, correo);
        ps.setString(3, password);

        ps.executeUpdate();

        response.sendRedirect("dashboard.jsp");

    } catch (Exception e) {

        e.printStackTrace();

    }

}
}