<?php

if (!isset($_POST['seats']) and !isset($_GET['seance'])) {
	print(json_encode(array('status' => 0)));
	die();
}

require_once '../components/sql.php';

$array = json_decode($_POST['seats'], true);
$sql = new sql();
foreach ($array as $record) {
	$query = 'SELECT id FROM ticket WHERE seanceID="' .$_GET['seance']. '" and seat="' .$record. '";';
	$response = $sql->execute($query);
	if ($response != false) {
		print(json_encode(array('status' => 0)));
		die();
	}
}
session_start();
$_SESSION['seats'] = $array;
$_SESSION['seance'] = $_GET['seance'];
print(json_encode(array('status' => 1)));