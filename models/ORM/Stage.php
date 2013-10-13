<?php

namespace RMAN\Models\ORM;


class Stage extends Base
{
	public $timestamps = false;
	protected $guarded = array('id');
	
	public function lineups()
	{
		return $this->hasMany('RMAN\Models\ORM\Lineup');
	}
}
