<?php

require_once '../components/functions.php';

is_loged();

print('<h4>Admin panel</h4>');
print('<a href="logout.php">logout</a><br/><br/>');
print('<a href="addMovie.php">Add movie</a><br/>');
print('<a href="addSeance.php">Add seance</a><br/><br/>');

print('<a href="report1.php">Ticket report</a><br/>');
print('<a href="report2.php">Seance report</a>');