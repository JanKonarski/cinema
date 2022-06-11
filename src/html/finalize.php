<?php

require_once '../components/functions.php';

is_loged();

if (!isset($_SESSION['seance']) and !isset($_SESSION['seats']) and count($_SESSION[seats]) != 0 and isset($_POST['number'])) {
	header('Location: home.php');
	die();
}

require_once '../components/sql.php';

$sql = new sql();

$price = 0;
foreach ($_SESSION['seats'] as $record)
	$price += 20.0;
if (isset($_SESSION['goods']) and count($_SESSION['goods']) != 0) {
	foreach ($_SESSION['goods'] as $good) {
		$query = 'SELECT price FROM goods WHERE id="' .$good[0]. '";';
		$response = $sql->execute($query);
		$data = $response->fetch_all();
		$price += $data[0][0] * $good[1];
	}
}

// transaction
$transactionID = GUID();
$query = 'INSERT INTO transaction (id, timestamp, confirmed, cardNumber, price) VALUE'.
		 '("' .$transactionID. '", "' .date("Y-m-d H:i:s"). '", 1, "' .$_POST['number']. '", ' .$price. ');';
$sql->execute($query);

// ticket
foreach ($_SESSION['seats'] as $seat) {
	$query = 'INSERT INTO ticket (id, userID, transactionID, seanceID, timestamp, seat, price) VALUE' .
		'("' . GUID() . '", "' . $_SESSION['userID'] . '", "' . $transactionID . '", "' . $_SESSION['seance'] . '",' .
		'"' . date("Y-m-d H:i:s") . '", "' .$seat. '", 20)';
	$sql->execute($query);
}

// purchase
if (isset($_SESSION['goods']) and count($_SESSION['goods']) != 0) {
	$purchaseID = GUID();
	$query = 'INSERT INTO purchase (id, userID, transactionID) VALUE ("' .$purchaseID. '", "' .$_SESSION['userID']. '", "' .$transactionID. '");';
	$sql->execute($query);

	foreach ($_SESSION['goods'] as $row) {
		$query = 'INSERT INTO cart (purchaseID, goodID, count) VALUE'.
			'("' .$purchaseID. '", "' .$row[0]. '", ' .$row[1]. ');';
		$sql->execute($query);
	}
}

unset($_SESSION['seats']);
unset($_SESSION['seance']);
unset($_SESSION['goods']);

header('Location: home.php');