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
                  $('#email').val(cliente.email);
                  $('#password').val(cliente.password);

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




function  actualizarCliente(){
    var url = "http://ubiquitous.csf.itesm.mx/~daw-1020365/content/entregaFinal/examenFinalWeb/startbootstrap-creative-gh-pages/api/index.php/usuario/" + localStorage.getItem("session");
	$.ajax({
		type: 'PUT',
		contentType: 'application/json',
		url: url,
		dataType: "json",
		data: obtenerDatosCliente(),
		success: function(data, textStatus, jqXHR){
			console.log('Cliente actualizado exitosamente');
		},
		error: function(jqXHR, textStatus, errorThrown){
			alert('Error en la funcion actualizaVino: ' + textStatus);
		}
	});
}


function obtenerDatosCliente() {
  console.log("Holiiiii");
	return JSON.stringify({
            "nombre": $('#nombreCliente').val(),
            "apellidoP": $('#apellidoP').val(),
            "apellidoM": $('#apellidoM').val(),
            "foto": $('#foto').val(),
            "email": $('#email').val(),
            "password": $('#password').val()
		})};
