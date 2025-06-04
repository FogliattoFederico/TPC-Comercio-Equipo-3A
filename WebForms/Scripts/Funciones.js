    function mostrarSeccion(idMostrar) {
        const secciones = document.getElementById('contenedor-secciones').children;
        for (let i = 0; i < secciones.length; i++) {
            secciones[i].style.display = 'none';
        }

        const visible = document.getElementById(idMostrar);
        if (visible) visible.style.display = 'block';
    }

    window.onload = function () {
        mostrarSeccion('OCPendientes'); //Mostrar por defecto
    };