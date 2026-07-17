    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ecotask.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class conexion {

    private static final String URL = 
            "jdbc:mysql://localhost:3306/ecotask?useUnicode=true&characterEncoding=UTF-8";

    private static final String USER = "root";

    private static final String PASSWORD = "admin12345";

    public static Connection getConexion() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            return DriverManager.getConnection( 
                    URL,
                    USER,
                    PASSWORD);

        } catch (Exception e) {

            System.out.println(e);

            return null;

        }

    }

}