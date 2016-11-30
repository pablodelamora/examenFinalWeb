<?php

require 'Slim/Slim.php';

$app = new Slim();
// Definicion de end points y funciones callback
$app->get('/platillos', 'getPlatillos');
$app->get('/platillos/:id',	'getPlatillo');
//$app->get('/vinos/search/:query', 'findByName');
$app->post('/platillos', 'addPlatillo');
$app->put('/platillos/:id', 'updatePlatillo');
$app->delete('/platillo/:id',	'deletePlatillo');

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

function getPlatillo($id) {
	$sql = "SELECT * FROM exf_Platillo WHERE id=:id";
	try {
		$db = getConnection();
		$stmt = $db->prepare($sql);
		$stmt->bindParam("id", $id);
		$stmt->execute();
		$vino = $stmt->fetchObject();
		$db = null;
		echo json_encode($vino);
	} catch(PDOException $e) {
		echo '{"error":{"text":'. $e->getMessage() .'}}';
	}
}

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
		echo json_encode($vino);
	} catch(PDOException $e) {
		error_log($e->getMessage(), 3, '/var/tmp/php.log');
		echo '{"error":{"text":'. $e->getMessage() .'}}';
	}
}

function updateVino($id) {
	$request = Slim::getInstance()->request();
	$body = $request->getBody();
	$vino = json_decode($body);
	$sql = "UPDATE Vino SET nombre=:nombre, uvas=:uvas, pais=:pais, region=:region, anio=:anio, descripcion=:descripcion WHERE id=:id";
	try {
		$db = getConnection();
		$stmt = $db->prepare($sql);
		$stmt->bindParam("nombre", $vino->nombre);
		$stmt->bindParam("uvas", $vino->uvas);
		$stmt->bindParam("pais", $vino->pais);
		$stmt->bindParam("region", $vino->region);
		$stmt->bindParam("anio", $vino->anio);
		$stmt->bindParam("descripcion", $vino->descripcion);
		$stmt->bindParam("id", $id);
		$stmt->execute();
		$db = null;
		echo json_encode($vino);
	} catch(PDOException $e) {
		echo '{"error":{"text":'. $e->getMessage() .'}}';
	}
}

function deleteVino($id) {
	$sql = "DELETE FROM Vino WHERE id=:id";
	try {
		$db = getConnection();
		$stmt = $db->prepare($sql);
		$stmt->bindParam("id", $id);
		$stmt->execute();
		$db = null;
	} catch(PDOException $e) {
		echo '{"error":{"text":'. $e->getMessage() .'}}';
	}
}

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

?>
