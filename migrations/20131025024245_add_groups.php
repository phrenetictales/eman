<?php

use Phinx\Migration\AbstractMigration;

require_once __DIR__.'/../auth.php';

class AddGroups extends AbstractMigration
{
	 /**
	 * Migrate Up.
	 */
	public function up()
	{
		global $sentry;
		
		$admins = $sentry->createGroup([
			'name'		=> 'Admins',
			'permissions'	=> [
				'admin'	=> 1
			]
		]);
		
		$user = $sentry->findUserByLogin('psimike@yahoo.ca');
		$user->addGroup($admins);
	}
	
	/**
	 * Migrate Down.
	 */
	public function down()
	{
		global $sentry;
		
		$admins = $sentry->findGroupByName('Admins');
		$admins->delete();
	}
}