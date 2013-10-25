<?php

use Phinx\Migration\AbstractMigration;

class LinkArtistsUsers extends AbstractMigration
{
	public function up()
	{
		$definition = new Phinx\Db\Table\Column;
		$definition->setType('integer');
		$definition->setLimit('11');
		
		$users = $this->table('users');
		$users->changeColumn('id', $definition);
		
		$artists = $this->table('artists');
		$artists->addColumn('user_id', 'integer', 
				['limit' => 11, 'null' => true])
			->addForeignKey('user_id', 'users', 'id')
		->save();
	}
	
	public function down()
	{
		$artists = $this->table('artists');
		$artists->dropForeignKey('user_id')
			->removeColumn('user_id')
		->save();
		
		$definition = new Phinx\Db\Table\Column;
		$definition->setType('integer');
		$definition->setLimit('10');
		
		$users = $this->table('users');
		$users->changeColumn('id', $definition);
	}
}