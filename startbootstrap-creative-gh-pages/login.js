var rootURL = "http://ubiquitous.csf.itesm.mx/~daw-1020365/content/entregaFinal/examenFinalWeb/startbootstrap-creative-gh-pages/api/index.php/login";

function formToJSON() {
	return JSON.stringify({
		"email": $('#email').val(),
		"password": $('#password').val()
		});
}

function login() {
  console.log(formToJSON())
	$.ajax({
		type: 'POST',
		contentType: 'application/json',
		url: rootURL,
		dataType: "json",
		data: formToJSON(),
		success: function(data, textStatus, jqXHR){
            console.log(rootURL,data)
            if(data.vino.length > 0){
                localStorage.setItem("session", data.vino[0].id_persona);
                alert(localStorage.getItem("session"));
                window.location = "index.html";
            }else{
                alert("Usuario y/o contraseña incorrectos");
            }
			//$('#btnBorrar').show();
			//$('#Idvino').val(data.id);
		},
		error: function(jqXHR, textStatus, errorThrown){
			alert('Error en la funcion agregaVino: ' + textStatus);
		}
	});
}
