<?php

define('ROOTDIR', __DIR__);
require_once ROOTDIR."/vendor/autoload.php";

use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Connection as DatabaseConnection;
use Illuminate\Database\MySqlConnection as MySqlConnection;
use Illuminate\Events\Dispatcher as EventDispatcher;


O\O::init();

date_default_timezone_set('America/Vancouver');

////////////////////////////////////////////////////////////////////////////////
// Load the Mustache Template engine and configure it                         //
////////////////////////////////////////////////////////////////////////////////
$mustache = new Mustache_Engine([
	'loader' => new Mustache_Loader_FilesystemLoader(
		ROOTDIR.'/views/', 
		['extension' => '.ms']
	),
	'partials_loader' => new Mustache_Loader_FilesystemLoader(
		ROOTDIR.'/views/',
		['extension' => '.ms']
	),
	'cache' => ROOTDIR.'/cache/mustache'
]);



////////////////////////////////////////////////////////////////////////////////
// Load Laravel Database and ORM (Eloquent)                                   //
////////////////////////////////////////////////////////////////////////////////

require_once ROOTDIR.'/config/database.php';

$capsule = new Capsule;
$capsule->addConnection($DATABASE_CONFIG);
$capsule->setEventDispatcher(new EventDispatcher());
$capsule->bootEloquent();
$capsule->setAsGlobal();

spl_autoload_register(function ($class) {
	$ns = O\c(O\s($class))->explode('\\');
	if ($ns->count() <= 3) {
		return;
	}
	
	if ($ns->slice(0, 3)->implode('\\') == 'RMAN\Models\ORM') {
		$path = ROOTDIR.'/models/ORM/'.
				$ns->slice(3)->implode('/').
				'.php';
		
		if (file_exists($path)) {
			include $path;
		}
	}
});


$container = new League\Di\Container;
