<%-- 
    Document   : login
    Created on : 15 jul 2026, 18:23:18
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>

    <meta charset="UTF-8">
   <title>EcoTask | Login</title>

    <link rel="stylesheet" href="css/estilos.css">

</head>

<body>

<header>

    <h1>🌱 EcoTask</h1>

</header>

<section class="hero">

    <h2>Iniciar Sesión</h2>
     
    <%
if(request.getParameter("error") != null){
%>

<p style="color:red;">
Correo o contraseña incorrectos.
</p>

<%
}
%>
   <<form action="LoginServlet" method="post">

    <input
        type="email"
        name="correo"
        placeholder="Correo electrónico"
        required>

    <br><br>

    <input
        type="password"
        name="password"
        placeholder="Contraseña"
        required>

    <br><br>

    <button type="submit">
        Ingresar
    </button>

</form>

    <br>

    <a href="index.jsp">← Volver al inicio</a>

</section>

</body>
</html>
