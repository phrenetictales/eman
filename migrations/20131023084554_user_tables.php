<?php

use Phinx\Migration\AbstractMigration;

class UserTables extends AbstractMigration
{
	public function up()
	{
		$this->execute("SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT ");
		$this->execute("SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS ");
		$this->execute("SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION ");
		$this->execute("SET @OLD_TIME_ZONE=@@TIME_ZONE ");
		$this->execute("SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 ");
		$this->execute("SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 ");
		$this->execute("SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' ");
		$this->execute("SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 ");
		
		/* CREATE TABLE groups */
		$this->execute("
			CREATE TABLE groups (
				`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
				`name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
				`permissions` text COLLATE utf8_unicode_ci,
				`created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
				`updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
				PRIMARY KEY (`id`),
				UNIQUE KEY `groups_name_unique` (`name`)
				) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
			");
		/* CREATED TABLE */
		/* CREATE TABLE users */
		$this->execute("
			CREATE TABLE users (
				`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
				`email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
				`password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
				`permissions` text COLLATE utf8_unicode_ci,
				`activated` tinyint(4) NOT NULL DEFAULT '0',
				`activation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
				`activated_at` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
				`last_login` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
				`persist_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
				`reset_password_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
				`first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
				`last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
				`created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
				`updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
				PRIMARY KEY (`id`),
				UNIQUE KEY `users_email_unique` (`email`),
				KEY `users_activation_code_index` (`activation_code`),
				KEY `users_reset_password_code_index` (`reset_password_code`)
				) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
			");
		/* CREATED TABLE */
		/* CREATE TABLE migrations */
		$this->execute("
			CREATE TABLE migrations (
				`migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
				`batch` int(11) NOT NULL
				) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
			");
		/* CREATED TABLE */
		/* CREATE TABLE throttle */
		$this->execute("
			CREATE TABLE throttle (
				`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
				`user_id` int(10) unsigned NOT NULL,
				`ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
				`attempts` int(11) NOT NULL DEFAULT '0',
				`suspended` tinyint(4) NOT NULL DEFAULT '0',
				`banned` tinyint(4) NOT NULL DEFAULT '0',
				`last_attempt_at` timestamp NULL DEFAULT NULL,
				`suspended_at` timestamp NULL DEFAULT NULL,
				`banned_at` timestamp NULL DEFAULT NULL,
				PRIMARY KEY (`id`),
				KEY `fk_user_id` (`user_id`)
				) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
			");
		/* CREATED TABLE */
		/* CREATE TABLE users_groups */
		$this->execute("
			CREATE TABLE users_groups (
				`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
				`user_id` int(10) unsigned NOT NULL,
				`group_id` int(10) unsigned NOT NULL,
				PRIMARY KEY (`id`)
				) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci
			");
		/* CREATED TABLE */

	}
	
	/**
	 * Migrate Down.
	 */
	public function down()
	{
		$this->execute("SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT ");
		$this->execute("SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS ");
		$this->execute("SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION ");
		$this->execute("SET @OLD_TIME_ZONE=@@TIME_ZONE ");
		$this->execute("SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 ");
		$this->execute("SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 ");
		$this->execute("SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' ");
		$this->execute("SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 ");
		
		$this->dropTable("groups");
		$this->dropTable("users");
		$this->dropTable("migrations");
		$this->dropTable("throttle");
		$this->dropTable("users_groups");
	}
}
