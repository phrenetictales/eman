<?php

namespace RMAN\Models\ORM;


class Artist extends Base
{
	public $timestamps = false;
	protected $guarded = array('id');
	
	protected $with = array('picture');
	
	public function picture()
	{
		return $this->belongsTo('RMAN\Models\ORM\Picture');
	}
	
	public function tracks()
	{
		return $this->belongsToMany('RMAN\Models\ORM\Track');
	}
	
	public static function tags()
	{
		return array_map(function($artist) {
				return array(
					'id'	=> $artist['id'],
					'value'	=> $artist['id'],
					'label'	=> $artist['name']
				);
			}, 
			self::get()->toArray()
		);
		
	}
}
