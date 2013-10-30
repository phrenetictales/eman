#!/usr/bin/env php
<?php


require_once __DIR__.'/../init.php';


$step = 256;
$count = RMAN\Models\ORM\Picture::where('default', '=', 0)->count();
$store = new Phrenetic\StoreFile('pictures');


for ($offset = 0; $offset < $count; $offset+=$step) {
	$pictures = RMAN\Models\ORM\Picture::where('default', '=', 0)
			->limit($step)
			->offset($offset)
		->get();
	
	foreach($pictures as $picture) {
		$fname = $store->filename($picture->resizedname);
		if (is_file($fname)) {
			if (@unlink($fname)) {
				$picture->delete();
			}
		}
	}
}
