<?php

require_once '../config.php';

class sql
{
	protected $mysqli;
	protected $result = null;

	function __construct()
	{
		$this->mysqli = new mysqli(DB_ADDRESS, DB_USER, DB_PASSWORD, DB_NAME);

		if ($this->mysqli->connect_errno)
		{
			header('Location: ', 'error.html');
			die();
		}

		if (!$this->mysqli->ping())
		{
			header('Location: ', 'error.html');
			die();
		}
	}

	function __destruct()
	{
		$this->mysqli->close();
	}

	function execute(string $sql): bool|mysqli_result
	{
		if ($this->result = $this->mysqli->query($sql))
		{
			if ($this->result->num_rows = 0)
				return false;

			return $this->result;
		}

		header('Location: ', 'error.html');
	}
}