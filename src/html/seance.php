<?php

require_once '../components/functions.php';

is_loged();

if (!isset($_GET['movie'])) {
	header('Location: home.php');
	die();
}

require_once '../components/sql.php';

$sql = new sql();
$query = 'SELECT id, seanceDate, startTime, endTime FROM seance WHERE movieID="' .$_GET['movie']. '" ORDER BY seanceDate, startTime ASC;';
$response = $sql->execute($query);
if ($response == false) {
	header('Location: home.php');
	die();
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        li a {
            color: black;
            text-decoration: none;
        }
    </style>
</head>
<body>

<?php

$data = $response->fetch_all();
print('<ul>');
foreach ($data as $record) {
    print('<li><a href="room.php?seance=' .$record[0]. '">' .$record[1]. ' ' .$record[2]. '-' .$record[3]. '</a></li>');
}
print('</ul>');