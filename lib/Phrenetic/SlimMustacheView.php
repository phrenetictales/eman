<?php

namespace Phrenetic;

use Cartalyst\Sentry\Facades\Native\Sentry as Sentry;


class SlimMustacheView extends \Slim\View
{
	protected $_engine = NULL;
	
	public function __construct($engine)
	{
		$this->_engine = $engine;
	}
	
	public function render($tpl)
	{
		$app = \Slim\Slim::getInstance();
		
		
		if ($this->_engine == null) {
			$this->_engine = new Mustache_Engine;
		}
		
		$page = $this->_engine->loadTemplate('content');
		$m = $this->_engine->loadTemplate($tpl);
		
		$auth = $app->container->resolve('Eman\\ServiceProvider\\Authentication');
		if ($auth->isLoggedIn()) {
			$this->appendData(['user' => $auth->getCurrentUser()]);
		}
		else {
			$this->appendData(['user' => null]);
		}
		
		
		$this->appendData(['main' => $m->render($this->data)]);
		
		return $page->render($this->data);
	}
}
