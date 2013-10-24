<?php

use Phinx\Migration\AbstractMigration;

include __DIR__.'/../auth.php';


class AddUsers extends AbstractMigration
{
	/**
	 * Migrate Up.
	 */
	public function up()
	{
		global $sentry;
		
		$sentry->createUser(['email' => 'psimike@yahoo.ca', 'password' => 'roflcopter']);
		$mike = $sentry->findUserByLogin('psimike@yahoo.ca');
		$mike->attemptActivation(null);
	}

	/**
	 * Migrate Down.
	 */
	public function down()
	{
		
	}
}