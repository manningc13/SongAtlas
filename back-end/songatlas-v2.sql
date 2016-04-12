-- MySQL dump 10.13  Distrib 5.7.10, for Win64 (x86_64)
--
-- Host: localhost    Database: songatlas
-- ------------------------------------------------------
-- Server version	5.7.10-log

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
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `artist_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `genre` varchar(15) DEFAULT NULL,
  `picture` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `albums_fk_artist_id_idx` (`artist_id`),
  CONSTRAINT `albums_fk_artist_id` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,6,'Horehound','Rock','https://i.scdn.co/image/d7ec545206ca696ec70e32854fd2b05f9c649df3'),(2,5,'Somewhere In The Between','Ska','https://i.scdn.co/image/16b8b7975108ac2c2bab2fe4abf4f8cae828779e'),(3,1,'2Cellos','Classic Rock','https://i.scdn.co/image/6829e02ff6b7f94a57c1cf3355c2d03bfffb2bc5'),(4,2,'Camp','Hip-hop','https://i.scdn.co/image/b5618dc7cdeb0754da0436d95d32d256581c3fb4'),(5,3,'F10RIDA','Electronic','https://i.scdn.co/image/a8e9bb5d617df2d027fa83e18761050dd5ad950a'),(6,4,'Evil Empire','Punk','https://i.scdn.co/image/d4c0e88f3d25f279d2d5621910bc831699207183');
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `artist_name` varchar(50) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `artist_name` (`artist_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'2Cellos','A crafty Croation cello duo.'),(2,'Childish Gambino','When he\'s not busy writing for television, Donald Glover finds time to ake beats and rap.'),(3,'Diplo','A superstar DJ, sought-after producer, taste-making label owner, and wizard behind Major Lazer'),(4,'Rage Against the Machine','Rage Against the Machine earned acclaim from disenfranchised fans for their bombastic, fiercely polemical music brewed in punk, hip-hop and thrash'),(5,'Streetlight Manifesto','The New Jersey ska-punk outfit Streetlight Manifesto grew out of two similar late-90\'s groups from the region, One Cool Guy and Catch-22.'),(6,'The Dead Weather','Crafting a darkly potent mix of garage, blues, punk, and rock & roll informed by the members\' other projects like Jack White of the White Stripes');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `last_fm`
--

DROP TABLE IF EXISTS `last_fm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `last_fm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `href` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `last_fm`
--

LOCK TABLES `last_fm` WRITE;
/*!40000 ALTER TABLE `last_fm` DISABLE KEYS */;
INSERT INTO `last_fm` VALUES (1,'http://www.last.fm/music/Childish+Gambino/Camp'),(2,'http://www.last.fm/music/2cellos/2Cellos'),(3,'http://www.last.fm/music/Rage+Against+the+Machine/Evil+Empire'),(4,'http://www.last.fm/music/Streetlight+Manifesto/Somewhere+In+The+Between'),(5,'http://www.last.fm/music/The+Dead+Weather/Horehound');
/*!40000 ALTER TABLE `last_fm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soundcloud`
--

DROP TABLE IF EXISTS `soundcloud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soundcloud` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `href` varchar(100) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soundcloud`
--

LOCK TABLES `soundcloud` WRITE;
/*!40000 ALTER TABLE `soundcloud` DISABLE KEYS */;
INSERT INTO `soundcloud` VALUES (10,'https://soundcloud.com/childish-gambino/outside','Childish Gambino'),(11,'https://soundcloud.com/childish-gambino/fire-fly','Childish Gambino'),(12,'https://soundcloud.com/childish-gambino/bonfire','Childish Gambino'),(13,'https://soundcloud.com/childish-gambino/all-the-shine','Childish Gambino'),(14,'https://soundcloud.com/childish-gambino/letter-home','Childish Gambino'),(15,'https://soundcloud.com/childish-gambino/heartbeat','Childish Gambino'),(16,'https://soundcloud.com/childish-gambino/backpackers','Childish Gambino'),(17,'https://soundcloud.com/childish-gambino/l-e-s','Childish Gambino'),(18,'https://soundcloud.com/childish-gambino/hold-you-down','Childish Gambino'),(19,'https://soundcloud.com/childish-gambino/kids','Childish Gambino'),(20,'https://soundcloud.com/childish-gambino/you-see-me','Childish Gambino'),(21,'https://soundcloud.com/childish-gambino/sunrise','Childish Gambino'),(22,'https://soundcloud.com/childish-gambino/that-power','Childish Gambino'),(23,'https://soundcloud.com/2cellos/where-the-streets-have-no-name','2Cellos'),(24,'https://soundcloud.com/2cellos/misirlou-theme-from-pulp','2Cellos'),(25,'https://soundcloud.com/2cellos/use-somebody','2Cellos'),(26,'https://soundcloud.com/2cellos/smooth-criminal','2Cellos'),(27,'https://soundcloud.com/2cellos/fragile','2Cellos'),(28,'https://soundcloud.com/2cellos/the-resistance','2Cellos'),(29,'https://soundcloud.com/2cellos/hurt','2Cellos'),(30,'https://soundcloud.com/2cellos/welcome-to-the-jungle','2Cellos'),(31,'https://soundcloud.com/2cellos/human-nature','2Cellos'),(32,'https://soundcloud.com/2cellos/viva-la-vida-1','2Cellos'),(33,'https://soundcloud.com/2cellos/smells-like-teen-spirit','2Cellos'),(34,'https://soundcloud.com/2cellos/with-or-without-you','2Cellos'),(35,'https://soundcloud.com/2cellos/fields-of-gold-bonus-track','2Cellos'),(36,'https://soundcloud.com/diplo/sets/florida-full','Diplo');
/*!40000 ALTER TABLE `soundcloud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spotify`
--

DROP TABLE IF EXISTS `spotify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spotify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `href` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spotify`
--

LOCK TABLES `spotify` WRITE;
/*!40000 ALTER TABLE `spotify` DISABLE KEYS */;
INSERT INTO `spotify` VALUES (1,'https://open.spotify.com/track/5iRO0bczbqOKUOU7Ze9uOO'),(2,'https://open.spotify.com/track/5Dv41eDivo9fNRGh70QZHj'),(3,'https://open.spotify.com/track/5Dv41eDivo9fNRGh70QZHj'),(4,'https://open.spotify.com/track/14III4J8wKVavNvdIVqQzH'),(5,'https://open.spotify.com/track/2nF7T826y2FH96hgSYjKR9'),(6,'https://open.spotify.com/track/0nITvdcc8LkrrWKgrT9twj'),(7,'https://open.spotify.com/track/3zPtnhckq6bq36hqTaXW57'),(8,'https://open.spotify.com/track/74ucOMFNfzIqvexgb5777S'),(9,'https://open.spotify.com/track/7nhbpF7wX6GLiVHSbPuZFA'),(10,'https://open.spotify.com/track/4jPN9E1K1S3bRM1myejjGW'),(11,'https://open.spotify.com/track/3Bx2b6DkK0lOLuwnLVaULP'),(12,'https://open.spotify.com/track/2oRJOGttP04fYcWLZbU84t'),(13,'https://open.spotify.com/track/6DqHaff2z6n9jsbPBmvEHK'),(14,'https://open.spotify.com/track/64BvArPNcub2hM9m90lRFw'),(15,'https://open.spotify.com/track/7tN3mGa6IKO2U06BiNW6cm'),(16,'https://open.spotify.com/track/4WfwOaYKKcnVVm0mezYhwO'),(17,'https://open.spotify.com/track/1Bk8XNIzzXB3xGfWSLC2qK'),(18,'https://open.spotify.com/track/4XTJFHSPamFmR6Xs6rM0kD'),(19,'https://open.spotify.com/track/51nzHdVIXk3y9EH85miiUg'),(20,'https://open.spotify.com/track/2vc82PLTyG1qbiVQPtPtR3'),(21,'https://open.spotify.com/track/78rrC4XgcwE8zo6Taoai0T'),(22,'https://open.spotify.com/track/3xww0LAE9cIROt8aG20npu'),(23,'https://open.spotify.com/track/57hsB2ahBGYsed9F6y4j4F'),(24,'https://open.spotify.com/track/6tNZ310CZi5xAqWF50CfBI'),(25,'https://open.spotify.com/track/3ym2aoL8k3W1P5YwWmGw3T'),(26,'https://open.spotify.com/track/4sp90udxTSFSYTGOrqNQwN'),(27,'https://open.spotify.com/track/3T19u9hPvmmi219G0UHYhx'),(28,'https://open.spotify.com/track/6VMLTjHtZc6QPt0RcWPUOJ'),(29,'https://open.spotify.com/track/33nhfezWKXCkx4byFQBgvs'),(30,'https://open.spotify.com/track/1kbRNYkF1krjaiFj3Qc7m1'),(31,'https://open.spotify.com/track/1ydXKqVajoD4gVPnOZwMAp'),(32,'https://open.spotify.com/track/1RQ7Fmq4l2ooaRujm8sepN'),(33,'https://open.spotify.com/track/2rof6LJNmSLxIjCbZO4MtN'),(34,'https://open.spotify.com/track/3nP0NLaVnAQNWOo2R6ouyY'),(35,'https://open.spotify.com/track/2VtpdevRsfoxtWlnVm1l8A'),(36,'https://open.spotify.com/track/06WD650Zt5MQ55kFMP2f3r'),(37,'https://open.spotify.com/track/4zGvb8hxGLB2jEPRFiRRqw'),(38,'https://open.spotify.com/track/2ZBr6a8ecFqLJA0lcvFPCc'),(39,'https://open.spotify.com/track/076K8Jg7xmjCMn816yZboV'),(40,'https://open.spotify.com/track/3HooZZPp0evFShqaJ2Pwer'),(41,'https://open.spotify.com/track/03ImchswSXPA2KzLrc9hAL'),(42,'https://open.spotify.com/track/2KMCM2dirSnthfYKNjS8iT'),(43,'https://open.spotify.com/track/4wv0lOxuHGbnLXVBFmxfxy'),(44,'https://open.spotify.com/track/3z1eL3iolJSdiYEEodX1k0'),(45,'https://open.spotify.com/track/1eEPKr5gzWVSZKiMWIMZYa'),(46,'https://open.spotify.com/track/5hMxgvMmI99alD8JJpjO0w'),(47,'https://open.spotify.com/track/6O8iT490HuTFVjQo3eHdoi'),(48,'https://open.spotify.com/track/7qBa0vq5GslHGA5jFJiOGu'),(49,'https://open.spotify.com/track/2tEtWV43FQoVCpyHc6klJ7'),(50,'https://open.spotify.com/track/0vtpkk26yMLYybNdjDnv2K'),(51,'https://open.spotify.com/track/03WKSynyxcKCdW61vErZEM'),(52,'https://open.spotify.com/track/3y6r1Pge91vABkxi23iQ8Y'),(53,'https://open.spotify.com/track/2MVIGHgqiC1Oplj8QML6xc'),(54,'https://open.spotify.com/track/035ArPmxguKXPg4bnpiBlL'),(55,'https://open.spotify.com/track/7c0NJuLBfMRPpVuna4Offb'),(56,'https://open.spotify.com/track/32f5xdduTwoDTMVz45bfR9'),(57,'https://open.spotify.com/track/4u0BJWw6wmH4Unmdlju3QV'),(58,'https://open.spotify.com/track/3XJC1yhSdl8NnDpbjjuw9A'),(59,'https://open.spotify.com/track/4yqJRf6lLtHOe5r72QAR9p'),(60,'https://open.spotify.com/track/5Jq8eWQUzHoiFPfuJuawWc'),(61,'https://open.spotify.com/track/4K2EBIXTRgIMrwC5ZCWrNc'),(62,'https://open.spotify.com/track/2VRjBAR75uiFsUoA2fcTFn'),(63,'https://open.spotify.com/track/1JBphqlMTWC9w8DROPzN7v'),(64,'https://open.spotify.com/track/40ryDRFsGhXriEnlDy3Hby'),(65,'https://open.spotify.com/track/3KLW3OO7lMZTdvAcYboogA'),(66,'https://open.spotify.com/track/0VDwO0XK1idX4mMjwTDwNC'),(67,'https://open.spotify.com/track/3PfgXid2uzx34HOebKtmUw'),(68,'https://open.spotify.com/track/5l98SMROhUOGqKTKEQYRBs'),(69,'https://open.spotify.com/track/0hww5O86iROSKyVXdWVFkL'),(70,'https://open.spotify.com/track/3QjQp2bfAvLTCSi8Zhzqis'),(71,'https://open.spotify.com/track/0tZ3mElWcr74OOhKEiNz1x'),(72,'https://open.spotify.com/track/1lCC3flXDsXQrNPcvDojuI'),(73,'https://open.spotify.com/track/655gNlXQ7zb9jPrTuqJ4mf'),(74,'https://open.spotify.com/track/5Ty1B6gHqh0joQx6ChbxiH'),(75,'https://open.spotify.com/track/22AYE62irnblz8OMUzz6Qi'),(76,'https://open.spotify.com/track/40L8L7344pPMCjlZc19RQU'),(77,'https://open.spotify.com/track/3DdOsUq1M9mJBFVR0xbSOx'),(78,'https://open.spotify.com/track/0g192CYDNtw2jp4h9FtYAy'),(79,'https://open.spotify.com/track/5tYosD9TicWDYO3kAE4ADp'),(80,'https://open.spotify.com/track/69oLqnnqggg6v7JMw9VIbf');
/*!40000 ALTER TABLE `spotify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracks`
--

DROP TABLE IF EXISTS `tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track_name` varchar(50) NOT NULL,
  `duration` time DEFAULT NULL,
  `album_id` int(11) NOT NULL,
  `genre` varchar(15) NOT NULL,
  `spotify_id` int(11) DEFAULT NULL,
  `cloud_id` int(11) DEFAULT NULL,
  `last_fm_id` int(11) DEFAULT NULL,
  `custom_url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `custom_url_UNIQUE` (`custom_url`),
  KEY `track_fk_spotify_id_idx` (`spotify_id`),
  KEY `tracks_fk_album_id_idx` (`album_id`),
  KEY `tracks_fk_last_fm_id_idx` (`last_fm_id`),
  KEY `tracks_fk_soundcloud_id_idx` (`cloud_id`),
  CONSTRAINT `track_fk_spotify_id` FOREIGN KEY (`spotify_id`) REFERENCES `spotify` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tracks_fk_album_id` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tracks_fk_last_fm_id` FOREIGN KEY (`last_fm_id`) REFERENCES `last_fm` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tracks_fk_soundcloud_id` FOREIGN KEY (`cloud_id`) REFERENCES `soundcloud` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracks`
--

LOCK TABLES `tracks` WRITE;
/*!40000 ALTER TABLE `tracks` DISABLE KEYS */;
INSERT INTO `tracks` VALUES (4,'60 Feet Tall','00:05:33',1,'Rock',1,NULL,5,NULL),(5,'Hang You From The Heavens','00:03:37',1,'Rock',2,NULL,5,NULL),(6,'I Cut Like A Buffalo','00:03:28',1,'Rock',3,NULL,5,NULL),(7,'So Far From Your Weapon','00:03:40',1,'Rock',4,NULL,5,NULL),(8,'Treat Me Like Your Mother','00:04:10',1,'Rock',5,NULL,5,NULL),(9,'Rocking Horse','00:02:59',1,'Rock',6,NULL,5,NULL),(10,'New Pony','00:03:57',1,'Rock',7,NULL,5,NULL),(11,'Bone House','00:03:27',1,'Rock',8,NULL,5,NULL),(12,'3 Birds','00:03:45',1,'Rock',9,NULL,5,NULL),(13,'No Hassle Night','00:02:52',1,'Rock',10,NULL,5,NULL),(14,'Will There Be Enough Water?','00:06:20',1,'Rock',11,NULL,5,NULL),(34,'We Will Fall Together','00:04:49',2,'Ska',12,NULL,4,NULL),(35,'Down, Down, Down to Mephisto\'s Cafe','00:05:03',2,'Ska',13,NULL,4,NULL),(36,'Would You Be Impressed','00:03:22',2,'Ska',14,NULL,4,NULL),(37,'One Foot On the Gas, One Foot In the Grave','00:05:28',2,'Ska',15,NULL,4,NULL),(38,'Watch It Crash','00:04:43',2,'Ska',16,NULL,4,NULL),(39,'Somewhere In The Between','00:03:43',2,'Ska',17,NULL,4,NULL),(40,'Forty Days','00:03:53',2,'Ska',18,NULL,4,NULL),(41,'The Blonde Lead the Blind','00:04:49',2,'Ska',19,NULL,4,NULL),(42,'The Receiving End of It All','00:05:19',2,'Ska',20,NULL,4,NULL),(43,'What a Wicked Gang Are We Below','00:03:23',2,'Ska',21,NULL,4,NULL),(44,'Where The Streets Have No Name','00:04:02',3,'Classic Rock',22,23,2,NULL),(45,'Misirlou (Theme From Pulp Fiction)','00:02:13',3,'Classic Rock',23,24,2,NULL),(46,'Use Somebody','00:03:27',3,'Classic Rock',24,25,2,NULL),(47,'Smooth Criminal','00:04:11',3,'Classic Rock',25,26,2,NULL),(48,'Fragile','00:03:26',3,'Classic Rock',26,27,2,NULL),(49,'The Resistance','00:03:49',3,'Classic Rock',27,28,2,NULL),(50,'Hurt','00:04:30',3,'Classic Rock',28,29,2,NULL),(51,'Welcome To The Jungle','00:03:09',3,'Classic Rock',29,30,2,NULL),(52,'Human Nature','00:02:48',3,'Classic Rock',30,31,2,NULL),(53,'Viva La Vida','00:03:42',3,'Classic Rock',31,32,2,NULL),(54,'Smells Like Teen Spirit','00:02:51',3,'Classic Rock',32,33,2,NULL),(55,'With or Without You','00:04:51',3,'Classic Rock',33,34,2,NULL),(56,'Fields of Gold (Bonus Track)','00:02:54',3,'Classic Rock',34,35,2,NULL),(57,'Outside','00:04:30',4,'Hip-hop',35,10,1,NULL),(58,'Fire Fly','00:03:23',4,'Hip-hop',36,11,1,NULL),(59,'Bonfire','00:03:13',4,'Hip-hop',37,12,1,NULL),(60,'All The Shine','00:05:46',4,'Hip-hop',38,13,1,NULL),(61,'Letter Home','00:01:44',4,'Hip-hop',39,14,1,NULL),(62,'Heartbeat','00:04:30',4,'Hip-hop',40,15,1,NULL),(63,'Backpackers','00:03:16',4,'Hip-hop',41,16,1,NULL),(64,'LES','00:05:17',4,'Hip-hop',42,17,1,NULL),(65,'Hold You Down','00:04:52',4,'Hip-hop',43,18,1,NULL),(66,'Kids','00:04:58',4,'Hip-hop',44,19,1,NULL),(67,'You See Me','00:03:15',4,'Hip-hop',45,20,1,NULL),(68,'Sunrise','00:03:40',4,'Hip-hop',46,21,1,NULL),(69,'That Power','00:07:42',4,'Hip-hop',47,22,1,NULL),(70,'Florida','00:01:38',5,'Electronic',48,36,NULL,NULL),(71,'Big Lost','00:04:39',5,'Electronic',49,36,NULL,NULL),(72,'Sarah','00:05:26',5,'Electronic',50,36,NULL,NULL),(73,'Into The Sun','00:05:53',5,'Electronic',51,36,NULL,NULL),(74,'Way More','00:05:56',5,'Electronic',52,36,NULL,NULL),(75,'Money Power Respect','00:03:52',5,'Electronic',53,36,NULL,NULL),(76,'Diplo Rhythm','00:04:53',5,'Electronic',54,36,NULL,NULL),(77,'Works','00:08:53',5,'Electronic',55,36,NULL,NULL),(78,'Indian Thick Jawns','00:03:56',5,'Electronic',56,36,NULL,NULL),(79,'Summer\'s Gonna Hurt You','00:08:42',5,'Electronic',57,36,NULL,NULL),(80,'It\'s All Part Of A Bigger Plan','00:01:47',5,'Electronic',58,36,NULL,NULL),(81,'Epistemology Suite 1: Don\'t Fall','00:07:07',5,'Electronic',59,36,NULL,NULL),(82,'Epistemology Suite 2: Like Cats','00:01:22',5,'Electronic',60,36,NULL,NULL),(83,'Epistemology Suite 3: You\'re Enron','00:03:08',5,'Electronic',61,36,NULL,NULL),(84,'As I Lay Dying','00:03:53',5,'Electronic',62,36,NULL,NULL),(85,'Flute Jawn','00:03:51',5,'Electronic',63,36,NULL,NULL),(86,'Making It Hard','00:02:51',5,'Electronic',64,36,NULL,NULL),(87,'Now\'s The Time - F10rida Rework','00:03:18',5,'Electronic',65,36,NULL,NULL),(88,'Newsflash - Metronomy Remix','00:04:34',5,'Electronic',66,36,NULL,NULL),(89,'Summer\'s Gonna Hurt You - Derek Allen Version','00:04:50',5,'Electronic',67,36,NULL,NULL),(90,'Big Lost - Eprom Remix','00:05:19',5,'Electronic',68,36,NULL,NULL),(91,'F10RIDA Album Commentary - Bonus Track','00:09:52',5,'Electronic',69,36,NULL,NULL),(92,'People of the Sun','00:02:30',6,'Punk',70,NULL,3,NULL),(93,'Bulls On Parade','00:03:49',6,'Punk',71,NULL,3,NULL),(94,'Vietnow','00:04:37',6,'Punk',72,NULL,3,NULL),(95,'Revolver','00:05:28',6,'Punk',73,NULL,3,NULL),(96,'Snakecharmer','00:03:55',6,'Punk',74,NULL,3,NULL),(97,'Tire Me','00:02:58',6,'Punk',75,NULL,3,NULL),(98,'Down Rodeo','00:05:21',6,'Punk',76,NULL,3,NULL),(99,'Without a Face','00:03:37',6,'Punk',77,NULL,3,NULL),(100,'Wind Below','00:05:50',6,'Punk',78,NULL,3,NULL),(101,'Roll Right','00:04:20',6,'Punk',79,NULL,3,NULL),(102,'Year of Tha Boomerang','00:04:00',6,'Punk',80,NULL,3,NULL);
/*!40000 ALTER TABLE `tracks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-12 14:45:08
