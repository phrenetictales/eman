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
		if ($this->_engine == null) {
			$this->_engine = new Mustache_Engine;
		}
		
		$page = $this->_engine->loadTemplate('content');
		$m = $this->_engine->loadTemplate($tpl);
		
		if (Sentry::check()) {
			$user = Sentry::getUser();
			$this->appendData(['user' => [
				'login' => $user->getLogin(),
				'id'	=> $user->getID()
			]]);
		}
		else {
			$this->appendData(['user' => null]);
		}
		
		
		$this->appendData(['main' => $m->render($this->data)]);
		
		return $page->render($this->data);
	}
}
