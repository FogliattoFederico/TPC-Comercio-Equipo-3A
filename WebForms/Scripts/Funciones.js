  window.onload = function () {
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


/*
function mostrarLogin() {
    const overlay = document.getElementById('registro-form');
    overlay.classList.add('active');
};

function cerrarLogin() {
    document.getElementById('registro-form').classList.remove('active');
};

function mostrarRegistrar() {
    const overlay = document.getElementById('registro-form');
    overlay.classList.add('active');
};

function cerrarRegistrar() {
    document.getElementById('registro-form').classList.remove('active');
};
*/