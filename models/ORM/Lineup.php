<?php

namespace RMAN\Models\ORM;


class Lineup extends Base
{
	public $timestamps = false;
	protected $guarded = array('id');
	
	public function slots()
	{
		return $this->hasMany('RMAN\Models\ORM\Slot');
	}
	
	public function artists()
	{
		return $this->belongsToMany('RMAN\Models\ORM\Artist', 'slots');
	}
}
