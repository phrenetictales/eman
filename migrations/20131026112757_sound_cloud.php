<?php

use Phinx\Migration\AbstractMigration;

class SoundCloud extends AbstractMigration
{
	/**
	 * Change Method.
	 *
	 * More information on this method is available here:
	 * http://docs.phinx.org/en/latest/migrations.html#the-change-method
	 *
	 * Uncomment this method if you would like to use it.
	 */
	public function change()
	{
		//$artists = $this->table('artists');
		//$artists->addColumn('s')
		$soundcloud = $this->table('soundclouds');
		$soundcloud
			->addColumn('soundcloud_id', 'integer', ['limit' => 15])
			->addColumn('artist_id', 'integer')
			->addForeignKey('artist_id', 'artists', 'id')
			->save();
	}
	
}