<?php

interface ItemInterface
{
	public function hashCode(): int;
	public function equals(ItemInterface $item): bool;
	public function copy(): ItemInterface;
}