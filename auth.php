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

class Eman_Auth_Cartalyst_Sentry implements Eman\ServiceProvider\Authentication
{
	$this->_sentry;
	
	public function __construct($sentry)
	{
		$this->_sentry = $sentry;
	}
	
	public function login($email, $password)
	{
		try {
			$user = Sentry\Sentry::findUserByCredentials([
				'email'		=> $login,
				'password'	=> $password
			]);
			Sentry::login($user, false);
		}
		catch (Cartalyst\Sentry\Users\UserNotActivatedException $e) {
			throw new Eman\Exception\Authentication(
				'Account not Activated',
				'Please Activate your Account'
			);
		}
		catch (Cartalyst\Sentry\Throttling\UserSuspendedException $e) {
			throw new Eman\Exception\Authentication(
				'Account temporarily suspended',
				'Your Account is suspended for '.
					$throttle->getSuspensionTime().
					' minutes'
			);
		}
		catch (Exception $e) {
			throw new Eman\Exception\Authentication(
				'Unable to login',
				'Your Account has been suspended or does not exist'
			);
		}
		
		return TRUE;
	}
}

$container->bind('Eman\\ServiceProvider\\Authentication', 'Eman_Auth_Cartalyst_Sentry');
