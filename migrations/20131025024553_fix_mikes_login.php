<?php

use Phinx\Migration\AbstractMigration;

require_once __DIR__.'/../auth.php';

class FixMikesLogin extends AbstractMigration
{
	 /**
	 * Migrate Up.
	 */
	public function up()
	{
		global $sentry;
		
		$user = $sentry->findUserByLogin('psimike@yahoo.ca');
		$user->email = 'psikmike@yahoo.ca';
		$user->save();
	}
	
	/**
	 * Migrate Down.
	 */
	public function down()
	{
		global $sentry;
		
		$user = $sentry->findUserByLogin('psikmike@yahoo.ca');
		$user->email = 'psimike@yahoo.ca';
		$user->save();
	}
}
