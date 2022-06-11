<?php

require_once '../components/functions.php';

is_loged();

require_once '../components/sql.php';

$sql = new sql();
$query = 'SELECT movie.name, COUNT(ticket.id) FROM ticket INNER JOIN seance ON ticket.seanceID = seance.id INNER JOIN movie ON seance.movieID = movie.id GROUP BY movie.name;';
$response = $sql->execute($query);
$data = $response->fetch_all();

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        table, th, td {
            border: 1px solid black;
        }
    </style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<?php print(date('Y-m-d H:i:s')); ?>
	<br/><br/>
	<table>
        <tr>
            <th>Movie name</th>
            <th>Ticket count</th>
        </tr>
<?php
    foreach ($data as $record) {
        print('<tr>');
        print('<td>' .$record[0]. '</td><td>' .$record[1]. '</td>');
        print('</tr>');
    }
?>
	</table>
	<script>
		$(document).ready(function(){
		    window.print();
		});
	</script>
</body>
</html>
