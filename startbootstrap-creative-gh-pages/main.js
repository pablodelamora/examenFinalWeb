if(localStorage.getItem("session") != ''){
    $('#loginBtn').hide();
    $('#logoutBtn').show();
}else{
    $('#loginBtn').show();
    $('#logoutBtn').hide();
}


buscaCliente();

function logout(){
    localStorage.setItem("session", '');
}



function buscaCliente(){
    if(localStorage.getItem("session") != ''){
        var url = "http://ubiquitous.csf.itesm.mx/~daw-1020365/content/entregaFinal/examenFinalWeb/startbootstrap-creative-gh-pages/api/index.php/usuario/" + localStorage.getItem("session");
        console.log("1")
        $.ajax({
    		type: 'GET',
    		url: url,
    		dataType: "json",
    		success: function(data, textStatus, jqXHR){
                console.log("2")
                var cliente = data;
                if(cliente){
                  $('#nombre').val(cliente.nombre);
                	$('#apellidoP').val(cliente.apellidoP);
                	$('#apellidoM').val(cliente.apellidoM);
                	$('#foto').val(cliente.foto);

                }else{
                    alert("Usuario y/o contraseña incorrectos");
                }
    		},
    		error: function(jqXHR, textStatus, errorThrown){
    			alert('Error en la funcion getCliente: ' + textStatus);
    		}
    	});
    }
}


function obtenerDatosCliente() {
	return JSON.stringify({
            "nombre": $('#nombreCliente').val(),
            "apPaterno": $('#apPaternoCliente').val(),
            "apMaterno": $('#apMaternoCliente').val(),
            "foto": $('#fotoCliente').val(),
            "telefono": $('#telefonoCliente').val(),
            "membresia": $('#membresiaCliente').val(),
            "user": $('#userCliente').val(),
            "password": $('#passwordCliente').val(),
		})};
