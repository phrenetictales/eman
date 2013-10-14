<?php

namespace RMAN\Models\ORM;


class Stage extends Base
{
	public $timestamps = false;
	protected $guarded = array('id');
	
	public function event()
	{
		return $this->belongsTo('RMAN\Models\ORM\Event');
	}
	
	public function lineups()
	{
		return $this->hasMany('RMAN\Models\ORM\Lineup')->orderBy('start_date_time', 'asc');
	}
}
