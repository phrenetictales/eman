<?php

namespace RMAN\Models\ORM;


class User extends Base
{
	public $timestamps = false;
	protected $guarded = array('id');
	
	public function artists()
	{
		return $this->hasMany('RMAN\Models\ORM\Artist');
	}
}
