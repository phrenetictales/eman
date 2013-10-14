<?php

namespace RMAN\Models\ORM;


class Picture extends Base
{
	public $timestamps = false;
	protected $guarded = array('id');
	
	public function artist()
	{
		return $this->hasOne('RMAN\Models\ORM\Artist');
	}
	
	public function url()
	{
		return '/pictures/display/'.$this->storename;
	}
	
	public function scale($x = 0, $y = 0)
	{
		if (!$x && !$y) {
			return $this->_mustache_scale();
		}
		
		return "/pictures/resized/{$x}/{$y}/{$this->storename}";
	}
	
	private function _mustache_scale()
	{
		$picture = $this;
		
		return function($block) use ($picture) {
			return $picture->__get('scale_'.$block);
		};
	}
	
	public function __get($key)
	{
		if ((substr($key,0,6) == 'scale_')) {
			$factor = substr($key,6);
			if (($split = strpos($factor, '_')) !== FALSE) {
				$x = substr($factor, 0, $split);
				$y = substr($factor, $split+1);
			}
			else {
				$x = $factor;
				$y = 0;
			}
			return $this->scale($x, $y);
		}
		
		return parent::__get($key);
	}
}
