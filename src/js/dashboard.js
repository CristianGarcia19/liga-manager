

// funcion para desplegar el menu de los aside
function desplegarMenu(){
    const menu = document.getElementById('dropDownMenu');
    menu.classList.toggle('hidden');
}

// funcion para desplegar el dropdown menu del perfil y opciones
function desplegarMenuPerfil(){
    const menuPerfil = document.getElementById('dropDownMenuPerfil');
    menuPerfil.classList.toggle('hidden')
}

document.addEventListener('click', function(e) {
    const menuPerfil = document.getElementById('dropDownMenuPerfil');
    const boton = document.getElementById('btnPerfil');

    if (!menuPerfil.contains(e.target) && !boton.contains(e.target)) {
        menuPerfil.classList.add('hidden');
    }
});