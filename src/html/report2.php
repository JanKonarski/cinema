<?php

require_once '../components/functions.php';

is_loged();

require_once '../components/sql.php';

function filterData(&$str){
	$str = preg_replace("/\t/", "\\t", $str);
	$str = preg_replace("/\r?\n/", "\\n", $str);
	if(strstr($str, '"')) $str = '"' . str_replace('"', '""', $str) . '"';
}

$sql = new sql();
$query = 'SELECT movie.name, seance.id, seance.seanceDate, seance.startTime, seance.endTime, seance.roomNumber FROM seance INNER JOIN movie ON seance.movieID = movie.id;';
$response = $sql->execute($query);
$data = $response->fetch_all();

$fileName = "report-" .date("Ymd"). ".xlsx";
header("Content-Disposition: attachment; filename=\"$fileName\"");
header("Content-Type: application/vnd.ms-excel");

$fields = array("Movie name", "Seance id", "Seance date", "Seance time start", "Seance time end", "Seance room number");
$excelData = implode("\t", array_values($fields)) . "\n";
foreach ($data as $row) {
	$lineData = array($row[0], $row[1], $row[2], $row[3], $row[4], $row[5]);
	array_walk($lineData, 'filterData');
	$excelData .= implode("\t", array_values($lineData)) . "\n";
}

echo $excelData;