<?php

use Phinx\Migration\AbstractMigration;

class Oauth2Tokens extends AbstractMigration
{
	/**
	 * Change Method.
	 *
	 * More information on this method is available here:
	 * http://docs.phinx.org/en/latest/migrations.html#the-change-method
	 *
	 * Uncomment this method if you would like to use it.
	 *
	 */
	/*
	Array
	(
		[access_token] => 1-56565-557468-7ab4437d970ab727b
		[expires_in] => 21599
		[scope] => *
		[refresh_token] => c281fba6cc2462bbfc4005984cf5d6ce
	)
	*/
	public function change()
	{
		$oauth2tokens = $this->table('oauth2tokens');
		$oauth2tokens
			->addColumn('access', 'string', ['limit' => 128])
			->addColumn('refresh', 'string', ['limit' => 128])
			->addColumn('service', 'string', ['limit' => 32])
			->addColumn('scope', 'string', ['limit' => 32])
			->addColumn('expires', 'datetime')
			->addColumn('user_id', 'integer')
			->addForeignKey('user_id', 'users', 'id')
			->save();
	}
	
}
