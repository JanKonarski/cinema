<?php
    $array = json_decode($_POST['seats'], true);
    print(count($array));