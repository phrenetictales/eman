<?php

namespace RMAN\Models\ORM;


class Slot extends Base
{
	public $timestamps = false;
	protected $guarded = array('id');
	
	public function artist()
	{
		return $this->belongsTo('RMAN\Models\ORM\Artist');
	}
}
