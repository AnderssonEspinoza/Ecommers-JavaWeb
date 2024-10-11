/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

document.addEventListener("DOMContentLoaded", function() {
    function goToStep(step) {
        document.querySelectorAll("section").forEach(function(section) {
            section.classList.add("hidden");
        });
        document.getElementById("step" + step).classList.remove("hidden");
    }

    function validateStep1() {
        const personas = document.getElementById("personas").value;
        const fecha = document.getElementById("fecha").value;
        const hora = document.getElementById("hora").value;
        if (personas && fecha && hora) {
            return true;
        } else {
            alert("Por favor, completa todos los campos.");
            return false;
        }
    }

    function validateStep2() {
        const nombre = document.getElementById("nombre").value;
        const apellido = document.getElementById("apellido").value;
        const email = document.getElementById("email").value;
        const telefono = document.getElementById("telefono").value;
        if (nombre && apellido && email && telefono) {
            return true;
        } else {
            alert("Por favor, completa todos los campos.");
            return false;
        }
    }

    function validateStep3() {
        const mesa = document.getElementById("mesa").value;
        const alergias = document.querySelector('input[name="alergias"]:checked');
        if (mesa && alergias) {
            return true;
        } else {
            alert("Por favor, completa todos los campos.");
            return false;
        }
    }

    document.getElementById("step1-form").addEventListener("submit", function(event) {
        event.preventDefault();
        if (validateStep1()) {
            goToStep(2);
        }
    });

    document.getElementById("step2-form").addEventListener("submit", function(event) {
        event.preventDefault();
        if (validateStep2()) {
            goToStep(3);
        }
    });

    document.getElementById("step3-form").addEventListener("submit", function(event) {
        event.preventDefault();
        if (validateStep3()) {
            // Obtener datos del formulario
            const personas = document.getElementById("personas").value;
            const fecha = document.getElementById("fecha").value;
            const hora = document.getElementById("hora").value;
            const nombre = document.getElementById("nombre").value;
            const mesa = document.getElementById("mesa").value;
            const alergias = document.querySelector('input[name="alergias"]:checked').value;

            // Llenar los detalles en la confirmación
            document.getElementById("reserva-personas").textContent = personas;
            document.getElementById("reserva-fecha").textContent = fecha;
            document.getElementById("reserva-hora").textContent = hora;
            document.getElementById("reserva-nombre").textContent = nombre;
            document.getElementById("reserva-mesa").textContent = mesa;
            document.getElementById("reserva-alergias").textContent = alergias;

            // Mostrar mensaje de confirmación
            alert("¡Reserva confirmada! Por favor, revisa tu correo para más detalles.");

            goToStep(4);
        }
    });

    // Botones de "Volver"
    document.querySelectorAll(".volver").forEach(function(button) {
        button.addEventListener("click", function() {
            const step = this.getAttribute("data-step");
            goToStep(step);
        });
    });
});

function volverAlInicio() {
    location.reload();
}

