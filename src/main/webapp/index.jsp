<%-- 
    Document   : index
    Created on : 15 jul 2026, 18:23:38
    Author     : USER
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>EcoTask | Inicio</title>
    

   <link rel="stylesheet" href="css/estilos.css?v=1.1">
</head>

<body>
    
    <header>

    <div class="logo">
        <!-- Se añadieron las clases correspondientes -->
        <img src="img/ecologia.png" alt="Logo EcoTask" class="logo-img">
        <h1 class="brand-name">EcoTask 🌱</h1>
    </div>

    <nav>

        <a href="#">Inicio</a>
        <a href="#">Beneficios</a>
        <a href="#">Contacto</a>

    </nav>

</header>


<section class="hero">

    <h2>Cuidar el planeta comienza contigo</h2>

    <p>
        Registra pequeñas acciones ecológicas todos los días y
        ayuda a construir un futuro más sostenible.
    </p>

   <div class="botones">

    <a href="registro.jsp">
        <button>Registrarse</button>
    </a>

    <a href="login.jsp">
        <button>Iniciar Sesión</button>
    </a>

    <a href="https://github.com/GuillermoH25/EcoTask.git" target="_blank">
        <button>Repositorio GitHub</button>
    </a>

</div>

</section>


<section class="beneficios">

    <h2>¿Qué puedes hacer en EcoTask?</h2>

    <div class="card">

        <h3>🌳 Registrar acciones</h3>

        <p>
            Guarda las actividades ecológicas que realizas diariamente.
        </p>

    </div>

    <div class="card">

        <h3>♻ Reducir residuos</h3>

        <p>
            Lleva un seguimiento de tus hábitos para disminuir la contaminación.
        </p>

    </div>

    <div class="card">

        <h3>💧 Ahorrar recursos</h3>

        <p>
            Controla acciones relacionadas con el ahorro de agua y energía.
        </p>

    </div>

</section>


<footer>

    <p>© 2026 EcoTask | Universidad de Guayaquil</p>

</footer>

<script src="js/app.js"></script>

</body>
</html>
