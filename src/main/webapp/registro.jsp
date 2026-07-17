<%-- 
    Document   : registro
    Created on : 15 jul 2026, 18:23:50
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>

    <meta charset="UTF-8">
    <title>EcoTask | Registro</title>
    
    <link rel="stylesheet" href="css/estilos.css">

</head>

<body>

<header>

    <h1>🌱 EcoTask</h1>

</header>

<section class="hero">

    <h2>Crear una cuenta</h2>

    <form id="formRegistro" action="RegistroServlet" method="post">

        <input type="text"
       id="nombre"
       name="nombre"
       placeholder="Nombre completo"
       required>

<input type="email"
       id="correo"
       name="correo"
       placeholder="Correo electrónico"
       required>

<input type="password"
       id="password"
       name="password"
       placeholder="Contraseña"
       required>

<input type="password"
       id="confirmarpassword"
       name="confirmarpassword"
       placeholder="Confirmar contraseña"
       required>

        <br><br>

        <button type="submit">

            Registrarme

        </button>

    </form>

    <br>

    <a href="index.jsp">

        ← Volver al inicio

    </a>

</section>

  <script src="js/app.js"></script>  
    
</body>
</html>