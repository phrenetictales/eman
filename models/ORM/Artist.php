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
	
	public function user()
	{
		return $this->belongsTo('RMAN\Models\ORM\Picture');
	}
	
	public function tracks()
	{
		return $this->belongsToMany('RMAN\Models\ORM\Track');
	}
	
	public function soundclouds()
	{
		return $this->hasMany('RMAN\Models\ORM\Soundcloud');
	}
	
	public function __get($key)
	{
		if ($key == 'soundclouds') {
			$soundclouds = parent::__get('soundclouds');
			
			if ($soundclouds->count() == 0) {
				return [];
			}
			return $soundclouds;
		}
		return parent::__get($key);
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
