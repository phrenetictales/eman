<?php

use Phinx\Migration\AbstractMigration;

class InitialSchema extends AbstractMigration
{
	public function up()
	{
		if ($this->hasTable('phr_artist_track')) {
			$table = $this->table('phr_artist_track');
			$table->rename('artist_track');
			$table = $this->table('phr_artists');
			$table->rename('artists');
			$table = $this->table('phr_events');
			$table->rename('events');
			$table = $this->table('phr_lineups');
			$table->rename('lineups');
			$table = $this->table('phr_pictures');
			$table->rename('pictures');
			$table = $this->table('phr_releases');
			$table->rename('releases');
			$table = $this->table('phr_slots');
			$table->rename('slots');
			$table = $this->table('phr_stages');
			$table->rename('stages');
			$table = $this->table('phr_tracks');
			$table->rename('tracks');
			
			return true;
		}
		
		$this->execute("SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT ");
		$this->execute("SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS ");
		$this->execute("SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION ");
		$this->execute("SET @OLD_TIME_ZONE=@@TIME_ZONE ");
		$this->execute("SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 ");
		$this->execute("SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 ");
		$this->execute("SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' ");
		$this->execute("SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 ");
		$this->execute("
			CREATE TABLE artist_track (
				`id` int(11) NOT NULL AUTO_INCREMENT,
				`artist_id` int(11) NOT NULL,
				`track_id` int(11) NOT NULL,
				PRIMARY KEY (`id`),
				KEY `fk_phr_artist_tracks_artist` (`artist_id`),
				KEY `fk_phr_artist_tracks_track` (`track_id`),
				CONSTRAINT `fk_phr_artist_tracks_artist` FOREIGN KEY (`artist_id`) REFERENCES `phr_artists` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
				CONSTRAINT `fk_phr_artist_tracks_track` FOREIGN KEY (`track_id`) REFERENCES `phr_tracks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
				) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
			");
		/* CREATED TABLE */
		/* CREATE TABLE artists */
		$this->execute("
			CREATE TABLE artists (
				`id` int(11) NOT NULL AUTO_INCREMENT,
				`name` varchar(64) NOT NULL,
				`bio` text NOT NULL,
				`picture_id` int(11) DEFAULT NULL,
				PRIMARY KEY (`id`),
				KEY `fk_artists_picture` (`picture_id`),
				CONSTRAINT `fk_artists_picture` FOREIGN KEY (`picture_id`) REFERENCES `phr_pictures` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
				) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
			");
		/* CREATED TABLE */
		/* CREATE TABLE events */
		$this->execute("
			CREATE TABLE events (
				`id` int(11) NOT NULL AUTO_INCREMENT,
				`title` varchar(256) NOT NULL,
				`start_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
				`end_date_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
				PRIMARY KEY (`id`)
				) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
			");
		/* CREATED TABLE */
		/* CREATE TABLE lineups */
		$this->execute("
			CREATE TABLE lineups (
				`id` int(11) NOT NULL AUTO_INCREMENT,
				`stage_id` int(11) NOT NULL,
				`start_date_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
				`end_date_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
				PRIMARY KEY (`id`),
				KEY `fk_phr_lineups_stage` (`stage_id`),
				CONSTRAINT `fk_phr_lineups_stage` FOREIGN KEY (`stage_id`) REFERENCES `phr_stages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
				) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
			");
		/* CREATED TABLE */
		/* CREATE TABLE pictures */
		$this->execute("
			CREATE TABLE pictures (
				`id` int(11) NOT NULL AUTO_INCREMENT,
				`name` varchar(256) NOT NULL,
				`type` varchar(32) NOT NULL,
				`size` int(11) NOT NULL,
				`width` int(11) NOT NULL,
				`height` int(11) NOT NULL,
				`storename` varchar(64) NOT NULL,
				`default` tinyint(1) NOT NULL DEFAULT '1',
				`resizedname` varchar(64) DEFAULT NULL,
				PRIMARY KEY (`id`)
				) ENGINE=InnoDB AUTO_INCREMENT=1306 DEFAULT CHARSET=latin1;
			");
		/* CREATED TABLE */
		/* CREATE TABLE releases */
		$this->execute("
			CREATE TABLE releases (
				`id` int(11) NOT NULL AUTO_INCREMENT,
				`title` varchar(64) NOT NULL,
				`release_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
				`picture_id` int(11) NOT NULL,
				PRIMARY KEY (`id`),
				KEY `fk_phr_releases_picture` (`picture_id`),
				CONSTRAINT `fk_phr_releases_picture` FOREIGN KEY (`picture_id`) REFERENCES `phr_pictures` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
				) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
			");
		/* CREATED TABLE */
		/* CREATE TABLE slots */
		$this->execute("
			CREATE TABLE slots (
				`id` int(11) NOT NULL AUTO_INCREMENT,
				`lineup_id` int(11) NOT NULL,
				`artist_id` int(11) NOT NULL,
				PRIMARY KEY (`id`),
				KEY `fk_phr_slots_lineup` (`lineup_id`),
				KEY `fk_phr_slots_artist` (`artist_id`),
				CONSTRAINT `fk_phr_slots_artist` FOREIGN KEY (`artist_id`) REFERENCES `phr_artists` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
				CONSTRAINT `fk_phr_slots_lineup` FOREIGN KEY (`lineup_id`) REFERENCES `phr_lineups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
				) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=latin1;
			");
		/* CREATED TABLE */
		/* CREATE TABLE stages */
		$this->execute("
			CREATE TABLE stages (
				`id` int(11) NOT NULL AUTO_INCREMENT,
				`event_id` int(11) NOT NULL,
				`title` varchar(256) NOT NULL,
				PRIMARY KEY (`id`),
				KEY `fk_phr_stages_event` (`event_id`),
				CONSTRAINT `fk_phr_stages_event` FOREIGN KEY (`event_id`) REFERENCES `phr_events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
				) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
			");
		/* CREATED TABLE */
		/* CREATE TABLE tracks */
		$this->execute("
			CREATE TABLE tracks (
				`id` int(11) NOT NULL AUTO_INCREMENT,
				`release_id` int(11) NOT NULL,
				`title` varchar(64) NOT NULL,
				`order` int(11) NOT NULL,
				PRIMARY KEY (`id`),
				KEY `fk_phr_tracks_release` (`release_id`),
				CONSTRAINT `fk_phr_tracks_release` FOREIGN KEY (`release_id`) REFERENCES `phr_releases` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
				) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
			");
		/* CREATED TABLE */

	}
	
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
		$this->dropTable("artist_track");
		$this->dropTable("artists");
		$this->dropTable("events");
		$this->dropTable("lineups");
		$this->dropTable("pictures");
		$this->dropTable("releases");
		$this->dropTable("slots");
		$this->dropTable("stages");
		$this->dropTable("tracks");
	}
}
