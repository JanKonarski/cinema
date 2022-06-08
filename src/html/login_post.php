<?php

if (!isset($_POST['name']) and !isset($_POST['password'])) {
	print(json_encode(array('status' => 0)));
	die();
}

require_once '../components/sql.php';

$sql = new sql();
$query = 'SELECT id, password FROM user WHERE name=' .$_POST['name']. ';';
$result = $sql->execute($query);

if ($result->num_rows != 1) {
	print(json_encode(array('status' => 0)));
	die();
}
$data = $result->fetch_all()[0];
if (!password_verify(substr($_POST['password'], 1, -1), $data[1])) {
	print(json_encode(array('status' => 0)));
	die();
}

session_start();
$_SESSION['userID'] = $data[0];
print(json_encode(array('status' => 1)));