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
-- Table structure for table `phr_artist_track`
--

DROP TABLE IF EXISTS `phr_artist_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phr_artist_track` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `artist_id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_phr_artist_tracks_artist` (`artist_id`),
  KEY `fk_phr_artist_tracks_track` (`track_id`),
  CONSTRAINT `fk_phr_artist_tracks_artist` FOREIGN KEY (`artist_id`) REFERENCES `phr_artists` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_phr_artist_tracks_track` FOREIGN KEY (`track_id`) REFERENCES `phr_tracks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phr_artist_track`
--

LOCK TABLES `phr_artist_track` WRITE;
/*!40000 ALTER TABLE `phr_artist_track` DISABLE KEYS */;
INSERT INTO `phr_artist_track` VALUES (1,5,13),(2,5,14),(3,5,15),(4,5,16);
/*!40000 ALTER TABLE `phr_artist_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phr_artists`
--

DROP TABLE IF EXISTS `phr_artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phr_artists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `bio` text NOT NULL,
  `picture_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_artists_picture` (`picture_id`),
  CONSTRAINT `fk_artists_picture` FOREIGN KEY (`picture_id`) REFERENCES `phr_pictures` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phr_artists`
--

LOCK TABLES `phr_artists` WRITE;
/*!40000 ALTER TABLE `phr_artists` DISABLE KEYS */;
INSERT INTO `phr_artists` VALUES (5,'Madjester','dsfggdgsdfgdfsg        \r\n      ',9);
/*!40000 ALTER TABLE `phr_artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phr_pictures`
--

DROP TABLE IF EXISTS `phr_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phr_pictures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `type` varchar(32) NOT NULL,
  `size` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `storename` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phr_pictures`
--

LOCK TABLES `phr_pictures` WRITE;
/*!40000 ALTER TABLE `phr_pictures` DISABLE KEYS */;
INSERT INTO `phr_pictures` VALUES (1,'Guatemala-CDCover.jpg','image/jpeg',0,404,327,'1'),(2,'Guatemala-CDCover.jpg','image/jpeg',0,404,327,'1'),(3,'Guatemala-CDCover.jpg','image/jpeg',0,404,327,'eb3df094e4357685a14df636290c88d5-1373330904.blob'),(4,'Guatemala-CDCover.jpg','image/jpeg',0,404,327,'3cc4ab8a5d5b8df7d77abdc2be86a65a-1373331004.blob'),(5,'Guatemala-CDCover.jpg','image/jpeg',0,404,327,'c3ad2d1e5fd7a4f2c103543d229061e4-1373331129.blob'),(6,'Guatemala-CDCover.jpg','image/jpeg',0,404,327,'cc4fc3683241b099c6561d945c873173-1373331155.blob'),(7,'gravatar.jpeg','image/jpeg',0,80,80,'fd1e26327f289083b2271d3fa4137d5e-1373331192.blob'),(8,'gravatar.jpeg','image/jpeg',0,80,80,'3456206d43e098bd6d6d3c7122a7d2c1-1373331260.blob'),(9,'Guatemala-CDCover.jpg','image/jpeg',0,404,327,'f852e66773c1143d252b0d68057b8b25-1373331283.blob'),(10,'Cover-Ibizi-Hippie-Invasion.jpg','image/jpeg',0,380,380,'25d99e5eb2dc4bbbb530e6c7eaf50e63-1373334724.blob'),(11,'Cover-Ibizi-Hippie-Invasion.jpg','image/jpeg',0,380,380,'62f21b63abe23d5366f35f1e90ecd3ec-1373334755.blob'),(12,'Cover-Ibizi-Hippie-Invasion.jpg','image/jpeg',0,380,380,'b898ef2abe73c7b0f57da1c22087bb7d-1373341386.blob');
/*!40000 ALTER TABLE `phr_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phr_releases`
--

DROP TABLE IF EXISTS `phr_releases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phr_releases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `release_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `picture_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_phr_releases_picture` (`picture_id`),
  CONSTRAINT `fk_phr_releases_picture` FOREIGN KEY (`picture_id`) REFERENCES `phr_pictures` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phr_releases`
--

LOCK TABLES `phr_releases` WRITE;
/*!40000 ALTER TABLE `phr_releases` DISABLE KEYS */;
INSERT INTO `phr_releases` VALUES (3,'Fin de Los Tiempos','2013-07-09 03:28:26',1),(4,'Fin de Los Tiempos','2013-07-09 03:29:03',1),(5,'Fin de Los Tiempos','2013-07-09 03:29:11',1),(6,'Fin de Los Tiempos','2013-07-09 03:30:35',1),(7,'Fin de Los Tiempos','2013-07-09 03:31:01',1),(8,'Fin de Los Tiempos','2013-07-09 03:32:52',1),(9,'Fin de Los Tiempos','2013-07-09 03:33:00',1),(10,'Fin de Los Tiempos','2013-07-09 03:33:16',1),(11,'Fin de Los Tiempos','2013-07-09 03:33:29',1),(12,'Fin de Los Tiempos','2013-07-09 03:35:12',1),(13,'Fin de Los Tiempos','2013-07-09 03:36:14',1),(14,'Fin de Los Tiempos','2013-07-09 03:36:48',1),(15,'Fin de Los Tiempos','2013-07-09 03:37:05',1),(16,'Fin de Los Tiempos','2013-07-09 03:37:24',1),(17,'Fin de Los Tiempos','2013-07-09 03:37:56',1),(18,'Fin de Los Tiempos','2013-07-09 03:38:13',1),(19,'Fin de Los Tiempos','2013-07-09 03:38:36',1),(20,'Fin de Los Tiempos','2013-07-09 03:39:04',1),(21,'Fin de Los Tiempos','2013-07-09 03:39:39',1),(22,'Fin de Los Tiempos','2013-07-09 03:40:48',1),(23,'Fin de Los Tiempos','2013-07-09 03:41:10',1),(24,'Fin de Los Tiempos','2013-07-09 03:41:27',1),(25,'Ouga Bouga','2013-07-09 03:43:37',12);
/*!40000 ALTER TABLE `phr_releases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phr_tracks`
--

DROP TABLE IF EXISTS `phr_tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phr_tracks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `release_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_phr_tracks_release` (`release_id`),
  CONSTRAINT `fk_phr_tracks_release` FOREIGN KEY (`release_id`) REFERENCES `phr_releases` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phr_tracks`
--

LOCK TABLES `phr_tracks` WRITE;
/*!40000 ALTER TABLE `phr_tracks` DISABLE KEYS */;
INSERT INTO `phr_tracks` VALUES (2,12,'Chronopod',0),(3,13,'Chronopod',0),(4,14,'Chronopod',0),(5,15,'Chronopod',0),(6,16,'Chronopod',0),(7,17,'Chronopod',0),(8,18,'Chronopod',0),(9,19,'Chronopod',0),(10,20,'Chronopod',0),(11,21,'Chronopod',0),(12,22,'Chronopod',0),(13,23,'Chronopod',0),(14,24,'Chronopod',0),(15,25,'Ouga',1),(16,25,'Bouga',2);
/*!40000 ALTER TABLE `phr_tracks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-12 21:11:22
