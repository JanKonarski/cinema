<?php

require_once 'sql.php';

function is_loged(): void
{
	session_start();
	if (!isset($_SESSION['userID'])) {
		header('location: index.php');
		die();
	}
}

function to_home(): void
{
	session_start();
	if (isset($_SESSION['userID'])) {
		$sql = new sql();
		$query = 'SELECT role FROM user WHERE id="' .$_SESSION['userID']. '";';
		$result = $sql->execute($query);
		if ($result->num_rows != 1) {
			session_destroy();
			header('Location: index.php');
			die();
		} else {
			$role = $result->fetch_all()[0][0];
			if ($role == 'admin')
				header('Location: admin.php');
			if ($role == 'client')
				header('Location: home.php');
		}
	}
}