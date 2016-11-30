<?php

require 'Slim/Slim.php';

$app = new Slim();
// Definicion de end points y funciones callback
$app->get('/platillos', 'getPlatillos');
$app->get('/platillos/:id',	'getPlatillo');
$app->post('/platillos', 'addPlatillo');
$app->put('/platillos/:id', 'updatePlatillo');
$app->post('/login', 'getLogIn');
//$app->get('/vinos/search/:query', 'findByName');
////////////////////////////////////////////
//$app->delete('/platillo/:id',	'deletePlatillo');

//////////////////////////////////////////////////
$app->get('/usuario', 'getUsuarios');
$app->post('/usuario', 'addUsuario');
$app->put('/usuario/:id', 'updateUsuario');
$app->delete('/usuario/:id',	'deleteUsuario');

$app->run();

function getPlatillos() {
	$sql = "SELECT * FROM exf_Platillo ORDER BY nombre";
	try {
		$db = getConnection();
		$stmt = $db->query($sql);
		$platillos = $stmt->fetchAll(PDO::FETCH_OBJ);
		$db = null;
		echo '{"platillos": ' . json_encode($platillos) . '}';
	} catch(PDOException $e) {
		echo '{"error":{"text":'. $e->getMessage() .'}}';
	}
}

function getPlatillo($id_platillo) {
	$sql = "SELECT * FROM exf_Platillo WHERE id_platillo=:id_platillo";
	try {
		$db = getConnection();
		$stmt = $db->prepare($sql);
		$stmt->bindParam("id_platillo", $id_platillo);
		$stmt->execute();
		$vino = $stmt->fetchObject();
		$db = null;
		echo json_encode($vino);
	} catch(PDOException $e) {
		echo '{"error":{"text":'. $e->getMessage() .'}}';
	}
}

////////////////////////////////////////////////////////////////
function getUsuarios() {
	$sql = "SELECT * FROM exf_Persona ORDER BY nombre";
	try {
		$db = getConnection();
		$stmt = $db->query($sql);
		$platillos = $stmt->fetchAll(PDO::FETCH_OBJ);
		$db = null;
		echo '{"personas": ' . json_encode($platillos) . '}';
	} catch(PDOException $e) {
		echo '{"error":{"text":'. $e->getMessage() .'}}';
	}
}
////////////////////////////////////////////////////////////////

function addPlatillo() {
	error_log('addPlatillo\n', 3, '/var/tmp/php.log');
        // El objeto request facilita el acceso a los datos de la peticion
        // En este caso la representacion JSON de un objeto Vino.
	$request = Slim::getInstance()->request();
	$platillo = json_decode($request->getBody());
	$sql = "INSERT INTO exf_Platillo (nombre, descripcion, calorias, foto, precio) VALUES (:nombre, :descripcion, :calorias, :foto , :precio)";
	try {
		$db = getConnection();
		$stmt = $db->prepare($sql);
		$stmt->bindParam("nombre", $platillo->nombre);
		$stmt->bindParam("descripcion", $platillo->descripcion);
		$stmt->bindParam("calorias", $platillo->calorias);
		$stmt->bindParam("foto", $platillo->foto);
		$stmt->bindParam("precio", $platillo->precio);
		$stmt->execute();
		$platillo->id = $db->lastInsertId();
		$db = null;
		echo json_encode($platillo);
	} catch(PDOException $e) {
		error_log($e->getMessage(), 3, '/var/tmp/php.log');
		echo '{"error":{"text":'. $e->getMessage() .'}}';
	}
}
/////////////////////////////////////////////////////////////////
//Add usuario
function addUsuario() {
	error_log('addUsuario\n', 3, '/var/tmp/php.log');
        // El objeto request facilita el acceso a los datos de la peticion
        // En este caso la representacion JSON de un objeto Vino.
	$request = Slim::getInstance()->request();
	$platillo = json_decode($request->getBody());
	$sql = "INSERT INTO exf_Persona (nombre, apellidoP, apellidoM, foto, email, password) VALUES (:nombre, :apellidoP, :apellidoM, :foto , :email, :password)";
	try {
		$db = getConnection();
		$stmt = $db->prepare($sql);
		$stmt->bindParam("nombre", $platillo->nombre);
		$stmt->bindParam("apellidoP", $platillo->apellidoP);
		$stmt->bindParam("apellidoM", $platillo->apellidoM);
		$stmt->bindParam("foto", $platillo->foto);
		$stmt->bindParam("email", $platillo->email);
		$stmt->bindParam("password", $platillo->password);
		$stmt->execute();
		$platillo->id = $db->lastInsertId();
		$db = null;
		echo json_encode($platillo);
	} catch(PDOException $e) {
		error_log($e->getMessage(), 3, '/var/tmp/php.log');
		echo '{"error":{"text":'. $e->getMessage() .'}}';
	}
}
/////////////////////////////////////////////////////////////////



function updatePlatillo($id_platillo) {
	$request = Slim::getInstance()->request();
	$body = $request->getBody();
	$vino = json_decode($body);
	$sql = "UPDATE exf_Platillo SET nombre=:nombre, descripcion=:descripcion, calorias=:calorias, foto=:foto, precio=:precio, descripcion=:descripcion WHERE id_platillo=:id_platillo";
	try {
		$db = getConnection();
		$stmt = $db->prepare($sql);
		$stmt->bindParam("nombre", $vino->nombre);
		$stmt->bindParam("descripcion", $vino->descripcion);
		$stmt->bindParam("calorias", $vino->calorias);
		$stmt->bindParam("foto", $vino->foto);
		$stmt->bindParam("precio", $vino->precio);
		$stmt->bindParam("id_platillo", $id_platillo);
		$stmt->execute();
		$db = null;
		echo json_encode($vino);
	} catch(PDOException $e) {
		echo '{"error":{"text":'. $e->getMessage() .'}}';
	}
}


/////////////////////////////////////////////////////////////////////////
//update persona
function updateUsuario($id_persona) {
	$request = Slim::getInstance()->request();
	$body = $request->getBody();
	$vino = json_decode($body);
	$sql = "UPDATE exf_Persona SET nombre=:nombre, apellidoP=:apellidoP, apellidoM=:apellidoM, foto=:foto, email=:email, password=:password WHERE id_persona=:id_persona";
	try {
		$db = getConnection();
		$stmt = $db->prepare($sql);
		$stmt->bindParam("nombre", $vino->nombre);
		$stmt->bindParam("apellidoP", $vino->apellidoP);
		$stmt->bindParam("apellidoM", $vino->apellidoM);
		$stmt->bindParam("foto", $vino->foto);
		$stmt->bindParam("email", $vino->email);
		$stmt->bindParam("password", $vino->password);
		$stmt->bindParam("id_persona", $id_persona);
		$stmt->execute();
		$db = null;
		echo json_encode($vino);
	} catch(PDOException $e) {
		echo '{"error":{"text":'. $e->getMessage() .'}}';
	}
}
/////////////////////////////////////////////////////////////////////////


function deleteUsuario($id_persona) {
	$sql = "DELETE FROM exf_Persona WHERE id_persona=:id_persona";
	try {
		$db = getConnection();
		$stmt = $db->prepare($sql);
		$stmt->bindParam("id_persona", $id_persona);
		$stmt->execute();
		$db = null;
	} catch(PDOException $e) {
		echo '{"error":{"text":'. $e->getMessage() .'}}';
	}
}

////////////////////////////////////////////////////////////////////////////

function findByName($query) {
	$sql = "SELECT * FROM Vino WHERE UPPER(nombre) LIKE :query ORDER BY nombre";
	try {
		$db = getConnection();
		$stmt = $db->prepare($sql);
		$query = "%".$query."%";
		$stmt->bindParam("query", $query);
		$stmt->execute();
		$vinos = $stmt->fetchAll(PDO::FETCH_OBJ);
		$db = null;
		echo '{"vino": ' . json_encode($vinos) . '}';
	} catch(PDOException $e) {
		echo '{"error":{"text":'. $e->getMessage() .'}}';
	}
}

function getConnection() {
	$dbhost="localhost";
	$dbuser="1020365_user";
	$dbpass="1020365";
	$dbname="daw_1020365";
	$dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);
	$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	return $dbh;
}

/////////////////////////////////////////////////////////////////////////////
function getLogIn() {
	$request = Slim::getInstance()->request();
	$cliente = json_decode($request->getBody());
	$sql = "select * FROM exf_Persona WHERE email = :email AND password = :password";
	try {
		$db = getConnection();
		$stmt = $db->prepare($sql);
		$stmt->bindParam("email", $cliente->user);
		$stmt->bindParam("password", $cliente->password);
		$stmt->execute();
		$c = $stmt->fetchAll(PDO::FETCH_OBJ);
		$db = null;
		echo '{"vino": ' . json_encode($c) . '}';
	} catch(PDOException $e) {
		echo '{"error":{"text":'. $e->getMessage() .'}}';
	}
}

?>
