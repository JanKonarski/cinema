<?php

print(password_hash('password', PASSWORD_ARGON2ID));

require_once '../components/sql.php';

new sql();