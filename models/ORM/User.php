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
	
	public function oauth2tokens()
	{
		return $this->hasMany('RMAN\Models\ORM\OAuth2Token');
	}
}
