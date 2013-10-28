<?php

namespace Eman\Exception;


class Authentication extends \Exception
{
	protected $_title = null;
	
	
	public function __construct($title, $message)
	{
		parent::__construct($message);
		$this->_title = $title;
	}
	
	public function getTitle()
	{
		return $this->_title;
	}
}
