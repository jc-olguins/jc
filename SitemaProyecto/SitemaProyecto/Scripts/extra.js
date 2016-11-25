function bien() {
    swal(
  "Proceso Ejecutado Correctamente",
  "",
  "success"
);
}
function key() {
    swal({
        title: "El Registro ya existe, intente con otra clave",
        text: "",
        timer: 2000
    }).then(
     function () { },
     // handling the promise rejection
     function (dismiss) {
         if (dismiss === "timer") {
             console.log("I was closed by the timer")
         }
     }
   );
}
function error() {
    swal(
  "Error",
  "",
  "error"
);
}
function errordatos() {
    swal(
  "Error verifique sus datos",
  "",
  "error"
);
}
function errorPassword() {
    swal(
  "Eror la contraseña no es la misma",
  "",
  "error"
);
    function erroralregistroUsu() {
        swal(
      "Eror al Registra el usuario",
      "",
      "error"
    );
    }
} function errorInisio() {
    swal(
  "Eror verifica los datos del usuario",
  "",
  "error"
);
}