<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cafetería - Iniciar Sesión / Crear Cuenta</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
    <header>
        <h1>Cafetería Napoleón</h1>
    </header>
    <main>
        <section id="login">
            <h2>INICIAR SESIÓN</h2>
            <form id="loginForm" action="" method="POST">
                <label for="loginEmail">Correo electrónico</label>
                <input type="email" id="loginEmail" name="loginEmail" required>
                <label for="loginPassword">Contraseña</label>
                <input type="password" id="loginPassword" name="loginPassword" required>
                <button type="submit">Iniciar Sesión</button>
                <a href="#" id="createAccountLink">Crear cuenta</a>
            </form>
        </section>
        <section id="register" class="hidden">
            <h2>CREAR CUENTA</h2>
            <form id="registerForm" method="POST" action="${pageContext.request.contextPath}/ControladorRegistro">

                <label for="registerName">Nombre</label>
                <input type="text" id="registerName" name="nombre_usuario" required placeholder="Nombre">
                <label for="registerEmail">Correo electrónico</label>
                <input type="email" id="registerEmail" name="correo" required placeholder="Email">
                <label for="registerPassword">Contraseña</label>
                <input type="password" id="registerPassword" name="contrasena" required placeholder="Contraseña">
                <button type="submit">Crear</button>
                <button id="backToLogin" class="back-button" type="button" onclick="toggleForms()"> ← </button>
            </form>
            
        </section>
    </main>
    <script src="js/scripts-login.js"></script>
</body>
</html>
