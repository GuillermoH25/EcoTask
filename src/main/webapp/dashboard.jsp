<%-- 
    Document   : dashboard
    Created on : 15 jul 2026, 18:24:14
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.ecotask.util.conexion"%>

<%
    // 1. Recuperamos las variables que guardaste en la sesión al iniciar sesión
    String nombreUsuario = (String) session.getAttribute("nombreUsuario");
    String correoUsuario = (String) session.getAttribute("correoUsuario");

    // 2. Control de seguridad: Si intentan ingresar por URL sin loguearse, los mandamos al login
    if (nombreUsuario == null || correoUsuario == null) {
        response.sendRedirect("login.jsp");
        return; 
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>EcoTask | Dashboard</title>
    <link rel="stylesheet" href="css/estilos.css?v=1.1">
</head>

<body>

<header>
    <div class="logo">
        <img src="img/ecologia.png" alt="Logo EcoTask" class="logo-img">
        <h1 class="brand-name">EcoTask 🌱</h1>
    </div>
    <nav>
        <a href="index.jsp">Inicio</a>
        <a href="contacto.jsp">Contacto</a>
    </nav>
</header>

<section class="hero">

    <!-- Mostrar el nombre dinámico del usuario logueado -->
    <h2>Bienvenido a EcoTask, <%= nombreUsuario %></h2>

    <!-- Formulario para registrar la acción -->
    <div class="form-container">
        <h3>Registrar una acción ecológica</h3>
        
        <form action="AccionServlet" method="post">
            <!-- CAMPO OCULTO: Envía el correo del usuario automáticamente sin que él lo vea -->
            <input type="hidden" name="correo" value="<%= correoUsuario %>">

            <input
                type="text"
                name="accion"
                placeholder="Ejemplo: Reciclé plástico"
                required>
            
            <br><br>

            <button type="submit" class="btn-guardar">
                Guardar acción
            </button>
        </form>
    </div>

    <!-- Contenedor y tabla de las acciones filtradas -->
    <div class="acciones-container">
        <h3>Mis acciones registradas 🌱</h3>

        <table border="1" cellpadding="10" style="margin: 0 auto; width: 80%; border-collapse: collapse;">
            <thead>
                <tr style="background-color: #2E7D32; color: white;">
                    <th>Acción</th>
                    <th>Fecha</th>
                </tr>
            </thead>
            <tbody>
                <%
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    con = conexion.getConexion();
                    
                    // FILTRO CLAVE: Solo cargamos las acciones que pertenezcan al usuario en sesión
                    String sql = "SELECT accion, fecha FROM acciones WHERE correo = ? ORDER BY fecha DESC";
                    ps = con.prepareStatement(sql);
                    ps.setString(1, correoUsuario);
                    
                    rs = ps.executeQuery();

                    boolean tieneAcciones = false;
                    while(rs.next()){
                        tieneAcciones = true;
                %>
                <tr>
                    <td>✔ <%= rs.getString("accion") %></td>
                    <td><%= rs.getTimestamp("fecha") %></td>
                </tr>
                <%
                    }
                    
                    if (!tieneAcciones) {
                %>
                <tr>
                    <td colspan="2" style="text-align: center; color: #888;">
                        Aún no registras acciones. ¡Empieza hoy!
                    </td>
                </tr>
                <%
                    }
                } catch(Exception e) {
                    out.println("<tr><td colspan='2'>Error al cargar las acciones: " + e.getMessage() + "</td></tr>");
                } finally {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (con != null) con.close();
                }
                %>
            </tbody>
        </table>
    </div>

    <p style="margin-top: 30px;">
        Has iniciado sesión correctamente.
    </p>
    <br>

    <!-- Enlace de cerrar sesión (puedes añadir aquí un método para invalidar sesión si lo deseas) -->
    <a href="index.jsp">
        <button style="background-color: #d32f2f; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer;">
            Cerrar sesión
        </button>
    </a>

</section>

<section class="beneficios">
    <div class="card">
        <h3>🌳 Acción 1</h3>
        <p>Planté un árbol.</p>
    </div>

    <div class="card">
        <h3>♻ Acción 2</h3>
        <p>Reciclé plástico.</p>
    </div>

    <div class="card">
        <h3>💧 Acción 3</h3>
        <p>Ahorré agua.</p>
    </div>
</section>

</body>
</html>