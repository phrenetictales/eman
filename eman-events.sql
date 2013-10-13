-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: phrenetic
-- ------------------------------------------------------
-- Server version	5.5.32-0ubuntu7-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


--
-- Table structure for table `phr_tracks`
--


DROP TABLE IF EXISTS `phr_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phr_events` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `title` varchar(256) NOT NULL,
    `start_date_time` TIMESTAMP NOT NULL,
    `end_date_time` TIMESTAMP NOT NULL,
    PRIMARY KEY (`id`)
)  ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `phr_stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phr_stages` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `event_id` int(11) NOT NULL,
    `title` varchar(256) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_phr_stages_event` (`event_id`),
    CONSTRAINT `fk_phr_stages_event` FOREIGN KEY (`event_id`)
        REFERENCES `phr_events` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `phr_lineups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phr_lineups` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `stage_id` int(11) NOT NULL,
    `start_date_time` TIMESTAMP NOT NULL,
    `end_date_time` TIMESTAMP NOT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_phr_lineups_stage` (`stage_id`),
    CONSTRAINT `fk_phr_lineups_stage` FOREIGN KEY (`stage_id`)
        REFERENCES `phr_stages` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `phr_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phr_slots` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `lineup_id` int(11) NOT NULL,
    `artist_id` int(11) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_phr_slots_lineup` (`lineup_id`),
    KEY `fk_phr_slots_artist` (`artist_id`),
    CONSTRAINT `fk_phr_slots_lineup` FOREIGN KEY (`lineup_id`)
        REFERENCES `phr_lineups` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_phr_slots_artist` FOREIGN KEY (`artist_id`)
        REFERENCES `phr_artists` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
