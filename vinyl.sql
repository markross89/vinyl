-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: vinyl_collection
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `album`
--
use  heroku_84457280302c2b7;

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `album` (
  `id` bigint NOT NULL,
  `artists_sort` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1166832,'Scene (2), The','Open','https://www.discogs.com/release/1166832-The-Scene-Open','1992'),(5610335,'DJ Quik','The Trauma Mix','https://www.discogs.com/release/5610335-DJ-Quik-The-Trauma-Mix','2005'),(14028180,'Lil Suzy','\"Life Goes On\"','https://www.discogs.com/release/14028180-Lil-Suzy-Life-Goes-On','1995'),(21612688,'Unknown Artist','Fellas With An Attitude','https://www.discogs.com/release/21612688-Unknown-Artist-Fellas-With-An-Attitude','2022');
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albums_artists`
--

DROP TABLE IF EXISTS `albums_artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `albums_artists` (
  `album_id` bigint NOT NULL,
  `artist_id` bigint NOT NULL,
  PRIMARY KEY (`album_id`,`artist_id`),
  KEY `FKq7kuheclw3ou19uvswmw93hxh` (`artist_id`),
  CONSTRAINT `FKauxdatxw694v7x2bfjtvhu7a8` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`),
  CONSTRAINT `FKq7kuheclw3ou19uvswmw93hxh` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums_artists`
--

LOCK TABLES `albums_artists` WRITE;
/*!40000 ALTER TABLE `albums_artists` DISABLE KEYS */;
INSERT INTO `albums_artists` VALUES (21612688,355),(5610335,62571),(14028180,111927),(1166832,269559);
/*!40000 ALTER TABLE `albums_artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albums_boxes`
--

DROP TABLE IF EXISTS `albums_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `albums_boxes` (
  `box_id` bigint NOT NULL,
  `album_id` bigint NOT NULL,
  PRIMARY KEY (`box_id`,`album_id`),
  KEY `FKh4xx5oyddou5n0wm3hxob0b56` (`album_id`),
  CONSTRAINT `FKh4xx5oyddou5n0wm3hxob0b56` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`),
  CONSTRAINT `FKlhlryogrpx7fpg5q498q16edm` FOREIGN KEY (`box_id`) REFERENCES `box` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums_boxes`
--

LOCK TABLES `albums_boxes` WRITE;
/*!40000 ALTER TABLE `albums_boxes` DISABLE KEYS */;
INSERT INTO `albums_boxes` VALUES (12,5610335),(1,14028180);
/*!40000 ALTER TABLE `albums_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albums_genres`
--

DROP TABLE IF EXISTS `albums_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `albums_genres` (
  `album_id` bigint NOT NULL,
  `genres` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
  KEY `FKq8jsqdtxrbs16iqwahew62eti` (`album_id`),
  CONSTRAINT `FKq8jsqdtxrbs16iqwahew62eti` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums_genres`
--

LOCK TABLES `albums_genres` WRITE;
/*!40000 ALTER TABLE `albums_genres` DISABLE KEYS */;
INSERT INTO `albums_genres` VALUES (21612688,'Electronic'),(14028180,'Electronic'),(1166832,'Rock'),(5610335,'Hip Hop');
/*!40000 ALTER TABLE `albums_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albums_labels`
--

DROP TABLE IF EXISTS `albums_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `albums_labels` (
  `album_id` bigint NOT NULL,
  `label_id` bigint NOT NULL,
  PRIMARY KEY (`album_id`,`label_id`),
  KEY `FKlllon3qf8c7xjbuvmxutd9us9` (`label_id`),
  CONSTRAINT `FK8x08s1y1aaivwt9f4d10gnp74` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`),
  CONSTRAINT `FKlllon3qf8c7xjbuvmxutd9us9` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums_labels`
--

LOCK TABLES `albums_labels` WRITE;
/*!40000 ALTER TABLE `albums_labels` DISABLE KEYS */;
INSERT INTO `albums_labels` VALUES (21612688,25),(14028180,26),(14028180,27),(1166832,28),(5610335,29);
/*!40000 ALTER TABLE `albums_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albums_users`
--

DROP TABLE IF EXISTS `albums_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `albums_users` (
  `album_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`album_id`,`user_id`),
  KEY `FKe2gg4mnatbnn6d5500bxytfox` (`user_id`),
  CONSTRAINT `FKe2gg4mnatbnn6d5500bxytfox` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKj84spvuu5nwqvdkq7w31c8slb` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums_users`
--

LOCK TABLES `albums_users` WRITE;
/*!40000 ALTER TABLE `albums_users` DISABLE KEYS */;
INSERT INTO `albums_users` VALUES (1166832,2),(14028180,2),(21612688,2),(5610335,4);
/*!40000 ALTER TABLE `albums_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `artist` (
  `id` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` VALUES (355,'Unknown Artist'),(62571,'DJ Quik'),(111927,'Lil Suzy'),(269559,'The Scene (2)');
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `box`
--

DROP TABLE IF EXISTS `box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `box` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKayjvkl7lmino5eeknc67wa52u` (`user_id`),
  CONSTRAINT `FKayjvkl7lmino5eeknc67wa52u` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `box`
--

LOCK TABLES `box` WRITE;
/*!40000 ALTER TABLE `box` DISABLE KEYS */;
INSERT INTO `box` VALUES (1,'2022-12-02','marek',2),(2,'2022-12-02','ania',2),(12,'2022-12-05','jgjhb',4);
/*!40000 ALTER TABLE `box` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `height` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
  `resource_url` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
  `uri150` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
  `width` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
  `album_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKklgd5pxhpuh3nwik115myord` (`album_id`),
  CONSTRAINT `FKklgd5pxhpuh3nwik115myord` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (66,'500','https://i.discogs.com/dYxjKIr7V9z7mzsZ8ZhmDfNy72sKX0TGVvuJqaR9QXQ/rs:fit/g:sm/q:90/h:500/w:500/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTIxNjEy/Njg4LTE2NDEzODQ1/MzItODMwNi5qcGVn.jpeg','secondary','https://i.discogs.com/vS6xORpaktjUsioUatDNkRdTDhnd5CTNMgK2PRhs8tg/rs:fit/g:sm/q:40/h:150/w:150/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTIxNjEy/Njg4LTE2NDEzODQ1/MzItODMwNi5qcGVn.jpeg','500',21612688),(67,'613','https://i.discogs.com/lBunLvpEM8arN3PprfYxgTqABGW75D3BjDzICX-5i5U/rs:fit/g:sm/q:90/h:613/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE0MDI4/MTgwLTE1NjYzOTA4/NzEtODkxOC5qcGVn.jpeg','secondary','https://i.discogs.com/4pMU1qbn96sCzB5uPbOtTU5QckZ90UZa4196-eXxWfQ/rs:fit/g:sm/q:40/h:150/w:150/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE0MDI4/MTgwLTE1NjYzOTA4/NzEtODkxOC5qcGVn.jpeg','600',14028180),(68,'304','https://i.discogs.com/iEqC6l43lU6khY9N3CpXh67J6vZWXJXsEOHjDxwX7o8/rs:fit/g:sm/q:90/h:304/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE0MDI4/MTgwLTE1NjYzOTA4/NzctMTAxMy5qcGVn.jpeg','secondary','https://i.discogs.com/9v8o4fI2aUKCGU7-7nh6mZlwFPc1FuTkPUqctfaqies/rs:fit/g:sm/q:40/h:150/w:150/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE0MDI4/MTgwLTE1NjYzOTA4/NzctMTAxMy5qcGVn.jpeg','600',14028180),(69,'600','https://i.discogs.com/uocOqFfcr4IS1rjEfmNNy18ggTqL7QFzdrAXdgAsZTE/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE0MDI4/MTgwLTE1NjYzOTA4/NzktMjE2Mi5qcGVn.jpeg','secondary','https://i.discogs.com/pKzPMD__eaO0YJ86uPjhFnCzZEuvtExNeExLix_NiFA/rs:fit/g:sm/q:40/h:150/w:150/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE0MDI4/MTgwLTE1NjYzOTA4/NzktMjE2Mi5qcGVn.jpeg','600',14028180),(70,'306','https://i.discogs.com/TX2iC2DXEQOk8FXEt9K9qpz99q5fhulJJ5oKRiHz5PY/rs:fit/g:sm/q:90/h:306/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE0MDI4/MTgwLTE1NjYzOTA4/ODUtNjQ3OC5qcGVn.jpeg','secondary','https://i.discogs.com/m55A5_JPaSOL4bNaaf_ZnRDW0wndT4rwnkfAPOl0Uqo/rs:fit/g:sm/q:40/h:150/w:150/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE0MDI4/MTgwLTE1NjYzOTA4/ODUtNjQ3OC5qcGVn.jpeg','600',14028180),(71,'468','https://i.discogs.com/q_g-cTB-o1HXQKtXluV2D8Ba6pECuf4xWUaCF3UByHs/rs:fit/g:sm/q:90/h:468/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE0MDI4/MTgwLTE1NjYzOTA4/OTEtMjMwNy5qcGVn.jpeg','secondary','https://i.discogs.com/Z6RBCQUYuk3BpAGN0rzsK7-XTQi1rwTqfZ5jI2WyagM/rs:fit/g:sm/q:40/h:150/w:150/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE0MDI4/MTgwLTE1NjYzOTA4/OTEtMjMwNy5qcGVn.jpeg','600',14028180),(72,'600','https://i.discogs.com/Pg1QFs8FD2vl23ynx6GOvTkD2jimJ7b_QAeSFY7sPNw/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTExNjY4/MzItMTIwMTE0NDY4/NC5qcGVn.jpeg','primary','https://i.discogs.com/MIJOVDnWJ5xKWH1hALujoq-v9RCOvQ58eSig9LSAYPo/rs:fit/g:sm/q:40/h:150/w:150/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTExNjY4/MzItMTIwMTE0NDY4/NC5qcGVn.jpeg','600',1166832),(73,'464','https://i.discogs.com/coc9vLvh7a1lg8L-oeruNDB7oZJ_D4rQx60TkzV5zsQ/rs:fit/g:sm/q:90/h:464/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTExNjY4/MzItMTIwMTE0NDY5/My5qcGVn.jpeg','secondary','https://i.discogs.com/HvFlMk1jOM1Hpu8NFkErSdiGOKZnPLKivIYzQ1atp8s/rs:fit/g:sm/q:40/h:150/w:150/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTExNjY4/MzItMTIwMTE0NDY5/My5qcGVn.jpeg','600',1166832),(74,'603','https://i.discogs.com/9axMArgp_co7FjSCEpP2YWELU8ZFVE-GsYNNltSZdYA/rs:fit/g:sm/q:90/h:603/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTExNjY4/MzItMTU4NDQzNzc3/Mi03MzQxLmpwZWc.jpeg','secondary','https://i.discogs.com/2zr_ZJlfQh1u7W63RN_x1T1Pl6XK3inN52saZjaQqvw/rs:fit/g:sm/q:40/h:150/w:150/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTExNjY4/MzItMTU4NDQzNzc3/Mi03MzQxLmpwZWc.jpeg','600',1166832),(75,'609','https://i.discogs.com/H68GyH5O29mUtZ0GR7gcxdMCkIG_JFbkqTWKRM9Hkg4/rs:fit/g:sm/q:90/h:609/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTExNjY4/MzItMTU4NDQzNzc3/NS0xMTk1LmpwZWc.jpeg','secondary','https://i.discogs.com/YzoE3j-DujeNHnPK3XJ1Hi-ZGIAxAapC4p4rmfGnXiQ/rs:fit/g:sm/q:40/h:150/w:150/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTExNjY4/MzItMTU4NDQzNzc3/NS0xMTk1LmpwZWc.jpeg','600',1166832),(76,'594','https://i.discogs.com/ZhLTGFBhkJPtuwmz1HaQrZqUypSXG9ulzGYSCUSMEJE/rs:fit/g:sm/q:90/h:594/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTU2MTAz/MzUtMTM5NzkyNTYy/Ny04MjgwLmpwZWc.jpeg','primary','https://i.discogs.com/cdlQZkDv3V-xiw-R2L1UN7laN7CdvFrGsB0GH7cKZDI/rs:fit/g:sm/q:40/h:150/w:150/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTU2MTAz/MzUtMTM5NzkyNTYy/Ny04MjgwLmpwZWc.jpeg','600',5610335),(77,'459','https://i.discogs.com/42YIZvNdiZpzKt2VRIwdPgD0j1Nbw0FmV66mZJzZKL8/rs:fit/g:sm/q:90/h:459/w:590/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTU2MTAz/MzUtMTM5NzkyNTYz/My00MDM3LmpwZWc.jpeg','secondary','https://i.discogs.com/r1s-9hhWQogTsod_Yf1765DCVXAOj5qhQkHe9sZW4pw/rs:fit/g:sm/q:40/h:150/w:150/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTU2MTAz/MzUtMTM5NzkyNTYz/My00MDM3LmpwZWc.jpeg','590',5610335),(78,'594','https://i.discogs.com/ME-f_ViMdqoHVn76f0gK3LUkNePzsM6h6IV7fBjJ_hI/rs:fit/g:sm/q:90/h:594/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTU2MTAz/MzUtMTM5NzkyNTYz/OS01NDAzLmpwZWc.jpeg','secondary','https://i.discogs.com/Fd0N64EESlReOHXZ2iUUV2Fk4ttF2xoqtOJ3mn287Rg/rs:fit/g:sm/q:40/h:150/w:150/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTU2MTAz/MzUtMTM5NzkyNTYz/OS01NDAzLmpwZWc.jpeg','600',5610335);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `label`
--

DROP TABLE IF EXISTS `label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `label` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `catno` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `label`
--

LOCK TABLES `label` WRITE;
/*!40000 ALTER TABLE `label` DISABLE KEYS */;
INSERT INTO `label` VALUES (25,'FWA000','Not On Label'),(26,'MRC-CD 1220','Empress Music'),(27,'MRC-CD 1220','Metropolitan Recording Corporation'),(28,'512 202-2','Mercury'),(29,'MS-2022','Mad Science');
/*!40000 ALTER TABLE `label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `playlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlbi6wsq41356go2ki0yirfixo` (`user_id`),
  CONSTRAINT `FKlbi6wsq41356go2ki0yirfixo` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES (1,'2022-12-02','marek',2),(8,'2022-12-05','vsdv',4);
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists_tracks`
--

DROP TABLE IF EXISTS `playlists_tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `playlists_tracks` (
  `playlist_id` bigint NOT NULL,
  `track_id` bigint NOT NULL,
  PRIMARY KEY (`playlist_id`,`track_id`),
  KEY `FKcsytsy8r6d1ey89gb37wkcfrt` (`track_id`),
  CONSTRAINT `FKcsytsy8r6d1ey89gb37wkcfrt` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`),
  CONSTRAINT `FKnfnht9lyeokpieuflwfe9m9qn` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists_tracks`
--

LOCK TABLES `playlists_tracks` WRITE;
/*!40000 ALTER TABLE `playlists_tracks` DISABLE KEYS */;
INSERT INTO `playlists_tracks` VALUES (1,259),(1,262),(8,294);
/*!40000 ALTER TABLE `playlists_tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_USER'),(2,'ROLE_ADMIN');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `expire_time` datetime(6) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKe32ek7ixanakfqsdaokm4q9y2` (`user_id`),
  CONSTRAINT `FKe32ek7ixanakfqsdaokm4q9y2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (2,'2022-11-03 12:04:33.713025','c867f230-16e2-420b-8f7f-e7fea1751107',2),(3,'2022-11-03 12:07:14.079705','4686b3a2-db1f-4959-85d5-a83878d05c14',2),(4,'2022-11-03 12:38:02.326287','9fe7c0de-5e46-4a76-8ef7-46beca9cecd2',2),(5,'2022-11-03 12:38:58.414839','6ac0dbb2-3773-4dac-8d59-e1aedaf41984',2),(6,'2022-11-03 13:03:57.028880','a8d41162-3907-408f-94f8-06ba908645e3',2),(7,'2022-11-03 13:17:19.661170','465ce8fa-62cd-4c50-9c76-4bdcc809db71',2),(8,'2022-11-03 13:49:37.866194','77757d9f-490c-48c5-8fa7-bc35d4b11f50',2),(9,'2022-11-03 15:01:16.233497','8e50471f-fdf7-43ae-bb6d-4966b2b94527',2),(10,'2022-11-03 15:02:44.087824','ff694133-ce55-4ddb-8e46-dea9f5ceedfc',2),(11,'2022-11-03 15:06:34.121548','bd2536f4-79b0-4aba-b825-144dc588da44',3),(12,'2022-11-03 15:07:27.567687','78e2d7e4-285d-4916-bd40-bb3fdfb7f3f2',3),(13,'2022-11-17 21:02:38.111993','571a39f5-cb49-464e-a846-6f240fb150cc',4);
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track`
--

DROP TABLE IF EXISTS `track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `track` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `duration` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
  `album_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKaxm9pbgk7ptorfyk3o6911q05` (`album_id`),
  CONSTRAINT `FKaxm9pbgk7ptorfyk3o6911q05` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track`
--

LOCK TABLES `track` WRITE;
/*!40000 ALTER TABLE `track` DISABLE KEYS */;
INSERT INTO `track` VALUES (257,'','A','Fellas With An Attitude',21612688),(258,'','B','Fellas With An Attitude',21612688),(259,'3:55','1.','Promise Me',14028180),(260,'3:41','2. ','Now & Forever',14028180),(261,'4:01','3.','Lies',14028180),(262,'4:33','4.','Just Can\'t Get Over You',14028180),(263,'5:10','5.','Someone For Me',14028180),(264,'3:55','6.','When I Fall In Love',14028180),(265,'3:36','7.','Take Me Back',14028180),(266,'4:10','8.','We\'d Always Be Together',14028180),(267,'5:03','9.','I\'m Not Ready',14028180),(268,'3:53','10.','Promise Me',14028180),(269,'5:09','1','Maan',1166832),(270,'4:48','2','Samen',1166832),(271,'3:30','3','Kans',1166832),(272,'3:02','4','Sta',1166832),(273,'4:10','5','Liefde',1166832),(274,'4:09','6','Steenworp',1166832),(275,'5:11','7','Open',1166832),(276,'3:42','8','Zuster',1166832),(277,'4:07','9','Soldaat',1166832),(278,'5:32','10','Thuis',1166832),(279,'1:06','1','Terrorist Homesteader',5610335),(280,'2:49','2','Total Auto',5610335),(281,'2:49','3','Loked Out Hood',5610335),(282,'3:47','4','Easier Said Than Done',5610335),(283,'4:21','5','Sweet Black Pussy',5610335),(284,'2:52','6','Skanless',5610335),(285,'2:45','7','The Maze',5610335),(286,'5:23','8','Tonite',5610335),(287,'5:51','9','Dollaz + Sense',5610335),(288,'3:20','10','Does The Goodlife Exist',5610335),(289,'4:10','11','Pitch In On A Party',5610335),(290,'0:56','12','Droopy Jr.',5610335),(291,'3:33','13','Total Auto Instrumental',5610335),(292,'3:24','14','Doughe',5610335),(293,'5:28','15','Westside Radio Interview',5610335),(294,'3:56','16','Fandango',5610335),(295,'0:29','17','Outro',5610335);
/*!40000 ALTER TABLE `track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `enabled` int NOT NULL,
  `first_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
  `password_repeat` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,1,'Marek','Roszak','$2a$10$R.1qSESpsXb1mXYMSEL3K.DlNi/Ik.KFt71MxC4Uug71gkx0HYMuW','$2a$10$MTgJ/ABTNXLfDrkPag/hm.JLvvGGejy1KZv92E1/wLqZPvRk.09v2','roszak89@gmail.com'),(3,1,'Ania','Roszak','$2a$10$lHomLRHx5R535IGC94xaLO3Ets7byVkl.qy2LYOysry21P0UdstD6','$2a$10$ANc2UyyfQ9f52KBod4rt5e25QP54/C/FNnhW9QUXFjbYixoPbyZ3i','anna.buczkowska2206@gmail.com'),(4,1,'admin','admin','$2a$10$noLJmC7MC7Wx0a3EvoVK.uICGEwlNJPBGdn1gU6YcPziTGjzm6LT6','$2a$10$vKH78M1Xs2yaQrf6rXWCP.KJ0XdtX.k.q.1i75TToddy4Pctjt8oa','charityapp2000@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_id` bigint NOT NULL,
  `role_id` int NOT NULL,
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  KEY `FK859n2jvi8ivhui0rl0esws6o` (`user_id`),
  CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (3,1),(4,1),(4,2),(2,1);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-06 23:23:04
