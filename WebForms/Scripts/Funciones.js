﻿  window.onload = function () {
        configurarQty()
};
/*
window.addEventListener('load', function () {
    configurarQty();
});*/

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



function mostrarLogin() {
    const overlay = document.getElementById('registro-login');
    overlay.classList.add('active');

    history.pushState({ modal: true }, '', '#login');
};

window.addEventListener('popstate', function (event) {
    const overlay = document.getElementById('registro-login');

    if (overlay.classList.contains('active')) {
        cerrarLogin();

        
        if (location.hash === "#login") {
            history.replaceState(null, '', location.pathname);
        }
    }
});

function cerrarLogin() {
    document.getElementById('registro-login').classList.remove('active');
};




function mostrarCambioPass() {
    const overlay = document.getElementById('registro-CambioPass');
    overlay.classList.add('active');

    history.pushState({ modal: true }, '', '#CP');
};

window.addEventListener2('popstate', function (event) {
    const overlay = document.getElementById('registro-CambioPass');

    if (overlay.classList.contains('active')) {
        cerrarCambioPass();


        if (location.hash === "#CP") {
            history.replaceState(null, '', location.pathname);
        }
    }
});

function cerrarCambioPass() {
    document.getElementById('registro-CambioPass').classList.remove('active');
};


/*
function mostrarRegistrar() {
    const overlay = document.getElementById('registro-form');
    overlay.classList.add('active');
};

function cerrarRegistrar() {
    document.getElementById('registro-form').classList.remove('active');
};
*/