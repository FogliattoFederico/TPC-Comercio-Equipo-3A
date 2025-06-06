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
        configurarQty()
};

function configurarQty() {
    const qtyContainers = document.querySelectorAll('.qty');
    qtyContainers.forEach(container => {
        const label = container.querySelector('label');
        const minus = container.querySelectorAll('button')[0];
        const plus = container.querySelectorAll('button')[1];

        minus.addEventListener('click', () => {
            let cantidad = parseInt(label.textContent);
            if (cantidad > 0) cantidad--;
            label.textContent = cantidad;
        });

        plus.addEventListener('click', () => {
            let cantidad = parseInt(label.textContent);
            cantidad++;
            label.textContent = cantidad;
        });
    });
};