<?php

require_once '../components/functions.php';

is_loged();

require_once '../components/sql.php';

$sql = new sql();
$query = 'SELECT transactionID FROM ticket INNER JOIN transaction ON ticket.transactionID = transaction.id WHERE userID="' .$_SESSION['userID']. '";';
$response = $sql->execute($query);
if ($response != false) {
	$data = $response->fetch_all();
	foreach ($data as $id) {
		$query = 'SELECT seanceID, seat FROM ticket WHERE transactionID="' .$id[0]. '" AND userID="' .$_SESSION['userID']. '";';
		$response = $sql->execute($query);
		$tickets = $response->fetch_all();
		print('Tickets:<ul>');
		foreach ($tickets as $ticket) {
			$query = 'SELECT movie.name FROM seance INNER JOIN movie ON seance.movieID = seance.movieID WHERE seance.id="' .$ticket[0]. '";';
			$response = $sql->execute($query);
			$seance = $response->fetch_all()[0][0];
			print('<li>seat: ' .$ticket[1]. ', seance: ' .$seance. '</li>');
		}
		print('</ul>');
	}
	print('</ul>');
} else
	print('No tickets');