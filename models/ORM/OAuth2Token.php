<?php

namespace RMAN\Models\ORM;


class OAuth2Token extends Base
{
	public $timestamps = false;
	protected $guarded = array('id');
	protected $table = 'oauth2tokens';
	
	public function getDates()
	{
		return ['expires'];
	}
	
	public function user()
	{
		$this->belongsTo('RMAN\Models\ORM\User');
	}
}
