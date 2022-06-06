<?php

print(password_hash('123ABC$%^def', PASSWORD_ARGON2ID));

require_once '../components/sql.php';

new sql();