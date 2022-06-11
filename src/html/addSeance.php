<?php

require_once '../components/functions.php';

is_loged();

require_once '../components/sql.php';

if (isset($_POST['movie']) and isset($_POST['date']) and isset($_POST['hour']) and isset($_POST['room'])) {
	if ($_POST['hour'] == 1) {
		$start = "08:00:00";
		$end = "10:00:00";
	} else if ($_POST['hour'] == 2) {
		$start = "11:00:00";
		$end = "13:00:00";
	} else if ($_POST['hour'] == 3) {
		$start = "14:00:00";
		$end = "16:00:00";
	} else {
		$start = "17:00:00";
		$end = "19:00:00";
	}

	$sql = new sql();
	$query = 'INSERT INTO seance (id, movieID, seanceDate, startTime, endTime, roomNumber) VALUE ' .
		'("' .GUID(). '", "' .$_POST['movie']. '", "' .date('Y-m-d', strtotime($_POST['date'])). '", ' .
		'"' .$start. '", "' .$end. '", ' .$_POST['room']. ')';
	$sql->execute($query);
}

?>

<!DOCTYPE html>
<html lang="en">
<head></head>
<body>
<form method="post">
	<label for="movie">Select movie</label>
	<select id="movie" name="movie">
<?php
	$sql = new sql();
	$query = 'SELECT id, name FROM movie;';
	$response = $sql->execute($query);
	$data = $response->fetch_all();
	foreach ($data as $record) {
		print('<option value="' .$record[0]. '">' .$record[1]. '</option>');
	}
?>
	</select><br>

	<label for="date">Seance date</label>
	<input type="date" id="dane" name="date"/><br/>

	<label for="hour">Seance hour</label>
	<select id="hour" name="hour">
		<option value="1">08:00:00-10:00:00</option>
		<option value="2">11:00:00-13:00:00</option>
		<option value="3">14:00:00-16:00:00</option>
		<option value="4">17:00:00-19:00:00</option>
	</select><br/>

	<label for="room">Room number</label>
	<select id="room" name="room">
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
	</select><br/>

	<input type="submit" value="add"/>
</form>
</body>
</html>
