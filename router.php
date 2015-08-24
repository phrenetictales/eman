<?php

date_default_timezone_set('GMT');

if (php_sapi_name() != 'cli-server')
{
	die("FATAL: This script is only to be executed by the built-in php web server\n");
}

chdir($_SERVER['DOCUMENT_ROOT']);

$info = parse_url($_SERVER['REQUEST_URI']);
$safepath = str_replace('..', '', $info['path']);

$parts = explode('/', $safepath);
if (substr($parts[1], -4) == '.php')
{
	trigger_error("executing PHP: path #1");
	try
	{
		require_once __DIR__ .'/public/' . $parts[1];
	}
	catch(Exception $e)
	{
		trigger_error("ERROR: ".$e->getMessage());
	}
	exit(0);
}

if (isset($parts[2]) && substr($parts[2], -4) == '.php')
{
	trigger_error("executing PHP: path #2");
	try
	{
		require_once __DIR__ .'/public/' . $parts[1] . (isset($parts[2]) ? '/'.$parts[2] : '');
	}
	catch(Exception $e)
	{
		trigger_error("ERROR: ".$e->getMessage());
	}
	exit(0);
}


if (file_exists($_SERVER['DOCUMENT_ROOT'] . $safepath) && realpath('../public/' . $safepath))
{
	if (strrchr($_SERVER['REQUEST_URI'], '.') == '.php')
	{
		trigger_error("executing PHP: path #3");
		require_once __DIR__ .'/public/' . $safepath;
		exit(0);
	}
	
	$finfo = finfo_open();
	$mime = finfo_file($finfo, $_SERVER['DOCUMENT_ROOT'] . $safepath, FILEINFO_MIME_TYPE);
	
	if ($mime == 'text/plain' && strrchr($_SERVER['REQUEST_URI'], '.') == '.js')
	{
		$mime = 'text/javascript';
	}
	else
	{
		return false;
	}
	
	header('Content-Type: '.$mime);
	header('Cache-Control: public');
	header('Expires: '.date(DateTime::RFC1123, strtotime('+6 months')));
	header('Date: '.date(DateTime::RFC1123));
	
	readfile($_SERVER['DOCUMENT_ROOT'] . $safepath);
	exit(0);
}

require_once __DIR__ .'/public/index.php';
