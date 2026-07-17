/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

// Espera a que cargue toda la página
document.addEventListener("DOMContentLoaded", function () {

    const formulario = document.getElementById("formRegistro");

    if (formulario) {

        formulario.addEventListener("submit", function (e) {

            const nombre = document.getElementById("nombre").value.trim();
            const correo = document.getElementById("correo").value.trim();
            const password = document.getElementById("password").value;
            const confirmar = document.getElementById("confirmar").value;

            if (nombre === "" || correo === "" || password === "" || confirmar === "") {

                alert("Por favor complete todos los campos.");

                e.preventDefault();

                return;
            }

            if (password !== confirmar) {

                alert("Las contraseñas no coinciden.");

                e.preventDefault();

                return;
            }

            alert("Formulario validado correctamente.");

        });

    }

});
