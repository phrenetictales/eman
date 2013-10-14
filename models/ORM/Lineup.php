<?php

namespace RMAN\Models\ORM;

use \Carbon\Carbon as Carbon;

class Lineup extends Base
{
	public $timestamps = false;
	protected $guarded = array('id');
	protected $orderBy = array('start_date_time', 'asc');
	
	public function slots()
	{
		return $this->hasMany('RMAN\Models\ORM\Slot');
	}
	
	public function artists()
	{
		return $this->belongsToMany('RMAN\Models\ORM\Artist', 'slots');
	}
	
	public function duration()
	{
		$diff = Carbon::parse($this->start_date_time)
			->diffForHumans(Carbon::parse($this->end_date_time));
		$parts = explode(' ', $diff, 3);
		return $parts[0].' '.$parts[1];
	}
}
