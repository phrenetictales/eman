<?php

use Phinx\Migration\AbstractMigration;

class NukeRedundantPhotos extends AbstractMigration
{
	/**
	 * Migrate Up.
	 */
	public function up()
	{
		include('./scripts/store-clear.php');
	}

	/**
	 * Migrate Down.
	 */
	public function down()
	{

	}
}