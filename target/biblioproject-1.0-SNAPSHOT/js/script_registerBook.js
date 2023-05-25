/* Se define un objeto llamado datos que tiene cuatro
propiedades: nombre, email, mensaje y telefono.Todas 
las propiedades están inicialmente vacías. */

const datos = {
    titulo: '',
    autor: '',
    codigo: '',
    fecha_publicacion: ''
}

// submit

/* Se selecciona el elemento HTML con la clase .formulario 
utilizando el método document.querySelector(). Este elemento es 
el formulario que se va a procesar. */

const formulario = document.querySelector('.formulario');

//submit
formulario.addEventListener('submit', function (e) {
    /* Esto es necesario para poder validar 
    los datos del formulario antes de enviarlo. */
    e.preventDefault();
    console.log(e);
    console.log(datos);


    // Validar el Formulario...
    //extraemos y añadimos a datos
    const { titulo, autor, codigo, fecha } = datos;

    /* Se comprueba si alguna de las propiedades del objeto datos está vacía.  */
    if (titulo === '' || autor === '' || codigo === '' || fecha_publicacion === '') {
        console.log('Al menos un campo esta vacio');
        mostrarError('Todos los campos son obligatorios');
        return; // Detiene la ejecución de esta función
    }
   
    console.log('Todo bien...')

    mostrarMensaje('Libro registrado correctamente');
});



/*  Se define la función...crea un elemento p 
con el mensaje de error y lo añade al final del formulario. 
Luego de tres segundos, el elemento p se elimina */
function mostrarError(codigo) {
    const alerta = document.createElement('p');
    alerta.textContent = codigo;
    alerta.classList.add('error');

    formulario.appendChild(alerta);

    setTimeout(() => {
        alerta.remove();
    }, 3000);
}





function mostrarMensaje(codigo) {
    const alerta = document.createElement('p');
    alerta.textContent = codigo;
    alerta.classList.add('correcto');
    formulario.appendChild(alerta);

    setTimeout(() => {
        alerta.remove();
    }, 3000);
}




/* Estos event listeners escuchan los eventos 'input' de los campos 
de entrada del formulario y, cuando se producen, actualizan el objeto 
'datos' con los valores ingresados por el usuario en tiempo real. */



// Eventos de los Inputs...
//Se selecciona el elemento HTML con el id
const titulo = document.querySelector('#titulo');
const autor = document.querySelector('#autor');
const codigo = document.querySelector('#codigo');
const fecha_publicacion = document.querySelector('#fecha_publicacion');

//cada vez que se escriba algo en el campo de texto, se llame a la funcion leerTexto
titulo.addEventListener('input', leerTexto);
autor.addEventListener('input', leerTexto);
codigo.addEventListener('input', leerTexto);
fecha_publicacion.addEventListener('input', leerTexto);

//se ejecuta para acceder al valor del campo de texto que se llamó
function leerTexto(e) {
    // console.log(e);
    // console.log(e.target.value);

    datos[e.target.id] = e.target.value;

    console.log(datos); //mostrar los valores actualizados.
}




