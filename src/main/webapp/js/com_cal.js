function nComentario() {
    let li = document.createElement("li");
    let valoringresado = document.getElementById("nuevoComentario").value;
    let textArea = document.createTextNode(valoringresado);
    li.appendChild(textArea);

    if (valoringresado === '') {
        alert("Ingrese un comentario!")
    } else {
        document.getElementById("comentarios").appendChild(li);
    }

    document.getElementById("nuevoComentario").value = "";
    li.className = "comentario";

    let borrar = document.createElement("p");
    borrar.innerHTML = ("Borrar");
    borrar.className = "close";
    li.appendChild(borrar);

    let close = document.getElementsByClassName("close");
    let i;
    for (i = 0; i < close.length; i++) {
        close[i].onclick = function () {
            let div = this.parentElement;
            div.style.display = "none";
        }
    }
}

function validarCalificacion() {
    let li = document.createElement("li");
    let valoringresado = document.getElementById("calificacion").value;
    
     if (valoringresado > 10) {
        alert("calificación no valida, digite un valor de 0 a 10")
    }
}