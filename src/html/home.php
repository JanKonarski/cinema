<?php

require_once '../components/functions.php';

is_loged();

require_once '../components/sql.php';

$sql = new sql();
$query = 'SELECT name FROM user WHERE id="' .$_SESSION['userID']. '";';
$response = $sql->execute($query);
$data = $response->fetch_all()[0];

print('<div>Welcome ' .$data[0]. '</div>');

?>

<a href="logout.php">logout</a>

<?php


