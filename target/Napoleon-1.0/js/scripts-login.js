document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Evita que el formulario se envíe de la manera tradicional
    
    const correo = document.getElementById('loginEmail').value;
    const password = document.getElementById('loginPassword').value;

    // Enviar los datos al backend usando fetch
    fetch('/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ correo, password })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            // Redirigir al usuario a la página de administrador
            window.location.href = '/index.html';
        } else {
            // Mostrar mensaje de error
            alert('Nombre de usuario o contraseña incorrectos');
        }
    })
    .catch(error => console.error('Error:', error));
});




document.getElementById('createAccountLink').addEventListener('click', function(event) {
    event.preventDefault();
    document.getElementById('login').classList.add('hidden');
    document.getElementById('register').classList.remove('hidden');
    document.getElementById('register').style.opacity = '1';
    document.getElementById('register').style.transform = 'scale(1)';
});

document.getElementById('backToLogin').addEventListener('click', function(event) {
    event.preventDefault();
    document.getElementById('register').classList.add('hidden');
    document.getElementById('register').style.opacity = '0';
    document.getElementById('register').style.transform = 'scale(0.9)';
    document.getElementById('login').classList.remove('hidden');
    document.getElementById('login').style.opacity = '1';
    document.getElementById('login').style.transform = 'scale(1)';
});


