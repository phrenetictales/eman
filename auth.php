<?php

use Cartalyst\Sentry as Sentry;

require_once 'init.php';


$hasher = new Sentry\Hashing\NativeHasher; // There are other hashers available, take your pick
$userProvider = new Sentry\Users\Eloquent\Provider($hasher);
$groupProvider = new Sentry\Groups\Eloquent\Provider;
$throttleProvider = new Sentry\Throttling\Eloquent\Provider($userProvider);
$session = new Sentry\Sessions\NativeSession;

// Note, all of the options below are, optional!
$options = array(
	'name'	 => null, // Default "cartalyst_sentry"
	'time'	 => null, // Default 300 seconds from now
	'domain'   => null, // Default ""
	'path'	 => null, // Default "/"
	'secure'   => null, // Default "false"
	'httpOnly' => null, // Default "false"
);

$cookie = new Sentry\Cookies\NativeCookie($options);

$sentry = new Sentry\Sentry(
	$userProvider,
	$groupProvider,
	$throttleProvider,
	$session,
	$cookie
);
