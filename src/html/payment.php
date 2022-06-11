<?php

require_once '../components/functions.php';

is_loged();

if (!isset($_SESSION['seance']) and !isset($_SESSION['seats'])) {
	header('Location: home.php');
	die();
}

require_once '../components/sql.php';

$sql = new sql();
$query = "SELECT id FROM goods;";
$response = $sql->execute($query);
if ($response != false) {
	$_SESSION['goods'] = array();
	$data = $response->fetch_all();
	foreach ($data as $record) {
		if (isset($_POST[$record[0]]) and $_POST[$record[0]] > 0)
			array_push($_SESSION['goods'], [$record[0], $_POST[$record[0]]]);
	}
}

?>

<!DOCTYPE html>
<html lang="en">
<head>

</head>
<body>
	<form method="post" action="finalize.php">
		<label for="number">Card number</label>
		<input type="text" id="number" name="number" value="0000000000000000"/><br>
		<label for="date">Valid</label>
		<input type="text" id="date" name="date" value="00/00"/>
		<label for="cvv">CVV</label>
		<input type="text" id="cvv" name="cvv" value="000"/><br/>
		<input type="submit" value="next"/>
	</form>