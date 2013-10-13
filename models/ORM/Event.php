<?php

namespace RMAN\Models\ORM;


class Event extends Base
{
	public $timestamps = false;
	protected $guarded = array('id');
	protected $with = ['stages'];
	
	public function stages()
	{
		return $this->hasMany('RMAN\Models\ORM\Stage');
	}
}
