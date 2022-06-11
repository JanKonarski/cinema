<?php

require_once '../components/functions.php';

is_loged();

if (isset($_POST['title']) and isset($_POST['category']) and isset($_POST['description'])) {
	require_once '../components/sql.php';

	$sql = new sql();
	$query = 'INSERT INTO movie (id, name, category, description) VALUE ' .
		'("' .GUID(). '", "' .$_POST['title']. '", "' .$_POST['category']. '", "' .$_POST['description']. '")';
	$sql->execute($query);
}

?>

<!DOCTYPE html>
<html lang="en">
<head></head>
<body>
	<form method="post">
		<label for="title">Movie title</label>
		<input type="text" id="title" name="title"/><br/>

		<label for="category">Movie category</label>
		<select id="category" name="category">
			<option value="action">action</option>
			<option value="animation">animation</option>
			<option value="comedy">comedy</option>
			<option value="drama">drama</option>
			<option value="fantasy">fantasy</option>
			<option value="horror">horror</option>
			<option value="mystery">mystery</option>
			<option value="romance">romance</option>
			<option value="thriller">thriller</option>
			<option value="western">western</option>
			<option value="crime">crime</option>
		</select><br/>

		<label for="description">Movie description</label>
		<textarea id="description" name="description"></textarea><br/>

		<input type="submit" value="add"/>
	</form>
</body>
</html>
