<?php

require_once '../components/functions.php';

is_loged();

if (!isset($_SESSION['seance']) and !isset($_SESSION['seats'])) {
	header('Location: home.php');
	die();
}

require_once '../components/sql.php';

$sql = new sql();
$query = "SELECT id, name, price FROM goods;";
$response = $sql->execute($query);
if ($response == false) {
	header('Location: payment.php');
	die();
}
$data = $response->fetch_all();

?>

<!DOCTYPE html>
<html lang="en">
<head>

</head>
<body>
	<form method="post" action="payment.php">
<?php
	foreach ($data as $record) {
		print('<label for="' .$record[0]. '">' .$record[1]. '</label>');
		print('<input type="number" value="0" id="' .$record[0]. '" name="' .$record[0]. '"/> $' .$record[2]. '<br/>');
	}
?>
		<input type="submit" value="next"/>
	</form>

