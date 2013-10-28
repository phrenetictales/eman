<?php

namespace Eman\ServiceProvider;

abstract class Authentication
{
	abstract public function login($email, $password);
	abstract public function logout();
	abstract public function isLoggedIn();
	abstract public function getCurrentUser();
	abstract public function hasAccess($role);
}
