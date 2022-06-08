<?php

print(password_hash('!@#abc4567DEF', PASSWORD_ARGON2ID).'<br/>');
print(password_verify('!@#abc4567DEF', '$argon2id$v=19$m=65536,t=4,p=1$ZjZucGE1NmJ0YVJrZ252dg$xg3CACzjC7PaRG20gMXPBZg2lYG+PGVs23peGqMGFzI'));

require_once '../components/sql.php';

$sql = new sql();
$query = 'SELECT id, password FROM user WHERE name="user1";';
$result = $sql->execute($query);
if ($result == false)
	print(false);
else
	print_r('<br/>'.$result->fetch_all()[0][1]);

print('<br/>');
print(substr('"ala"', 1, -1));