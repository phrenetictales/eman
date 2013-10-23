<?php

namespace Phrenetic;


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
		
		if (isset($_SESSION['slim.flash'])) {
			$flash = [];
			foreach($_SESSION['slim.flash'] as $k => $v) {
				if (($dot = strpos($k, '.')) !== FALSE) {
					list($arr, $key) = explode('.', $k, 2);
					if (!isset($flash[$arr])) {
						$flash[$arr] = [];
					}
					$flash[$arr][$key] = $v;
				}
				else {
					$flash[$k] = $v;
				}
			}
			$this->appendData(['flash' => $flash]);
		}
		
		$this->appendData(['main' => $m->render($this->data)]);
		return $page->render($this->data);
	}
}
