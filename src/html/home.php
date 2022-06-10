<?php

require_once '../components/functions.php';

is_loged();

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        .movie {
            width: 400px;
            background-color: lightgray;
            float: left;
            margin: 10px;
            padding: 10px;
        }

        .movie a {
            color: black;
            text-decoration: none;
        }
    </style>
</head>
<body>

<?php

require_once '../components/sql.php';

$sql = new sql();
$query = 'SELECT name FROM user WHERE id="' .$_SESSION['userID']. '";';
$response = $sql->execute($query);
$data = $response->fetch_all()[0];

print('<div>Welcome ' .$data[0]. '</div>');
print('<a href="logout.php">logout</a>');
print('<h1>Repertoire</h1>');

$query = 'SELECT id, name, category, description FROM movie;';
$response = $sql->execute($query);
$data = $response->fetch_all();

foreach ($data as $record) {
    print('<div class="movie"><a href="seance.php?movie=' .$record[0]. '">');
        print('<h4>' .$record[1]. '</h4>');
        print('category: ' .$record[2]. '<br/><br/>');
        print('description:<br/>' .$record[3]);
    print('</a></div>');
}