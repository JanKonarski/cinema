<?php

include 'ItemInterface.php';

abstract class Item implements ItemInterface
{
	protected int $id;

	function __construct()
	{
		$this->id = rand();

		print('
<!DOCTYPE html>
<html>
	<head>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	</head>
	<body>
		');
	}

	function __destruct()
	{
		print('
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	</body>
</html>
		');
	}

	public function hashCode(): int
	{
		return $this->id;
	}

	public function equals(ItemInterface $item): bool
	{
		return $this->hashCode() == $item->hashCode();
	}

	public function copy(): ItemInterface
	{
		return $this;
	}
}