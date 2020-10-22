-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: bbs
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(25,'Can add 博客',9,'add_blog'),(26,'Can change 博客',9,'change_blog'),(27,'Can delete 博客',9,'delete_blog'),(28,'Can add 博客标签',10,'add_blogtype'),(30,'Can delete 博客标签',10,'delete_blogtype'),(31,'Can add read num',11,'add_readnum'),(32,'Can change read num',11,'change_readnum'),(33,'Can delete read num',11,'delete_readnum'),(34,'Can add read num',12,'add_readnum'),(35,'Can change read num',12,'change_readnum'),(36,'Can delete read num',12,'delete_readnum'),(37,'Can add read detail',13,'add_readdetail'),(38,'Can change read detail',13,'change_readdetail'),(39,'Can delete read detail',13,'delete_readdetail'),(40,'Can view log entry',1,'view_logentry'),(41,'Can view permission',2,'view_permission'),(42,'Can view group',3,'view_group'),(43,'Can view user',4,'view_user'),(44,'Can view content type',5,'view_contenttype'),(45,'Can view session',6,'view_session'),(46,'Can view 博客',9,'view_blog'),(47,'Can view 博客标签',10,'view_blogtype'),(48,'Can view read num',12,'view_readnum'),(49,'Can view read detail',13,'view_readdetail'),(50,'Can add comment',14,'add_comment'),(51,'Can change comment',14,'change_comment'),(52,'Can delete comment',14,'delete_comment'),(53,'Can view comment',14,'view_comment'),(54,'Can change 博客标签',10,'change_blogtype'),(55,'Can add like',15,'add_like'),(56,'Can change like',15,'change_like'),(57,'Can delete like',15,'delete_like'),(58,'Can view like',15,'view_like'),(59,'Can add like record',16,'add_likerecord'),(60,'Can change like record',16,'change_likerecord'),(61,'Can delete like record',16,'delete_likerecord'),(62,'Can view like record',16,'view_likerecord'),(63,'Can add my user',17,'add_myuser'),(64,'Can change my user',17,'change_myuser'),(65,'Can delete my user',17,'delete_myuser'),(66,'Can view my user',17,'view_myuser');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$0pKhSs07ON5C$PAbjdKquYkhA/uWziLql+pL7YZbXk7aXKJjZdqrSnYk=','2020-10-22 19:42:40.421110',1,'admin','','','2849872658@qq.com',1,1,'2020-09-24 18:03:47.520102'),(2,'pbkdf2_sha256$150000$f2NzuV291Lcr$0hZW4VB2HL6PyZzIlc0H2sz/KECidAclv6OKTcEUgaQ=','2020-10-07 20:13:08.282064',0,'customer','','','admin@12.com',0,1,'2020-10-07 20:13:07.865529');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blog`
--

DROP TABLE IF EXISTS `blog_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `blog_blog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `last_updated_time` datetime(6) NOT NULL,
  `author_id` int NOT NULL,
  `blog_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_blog_author_id_8791af69_fk_auth_user_id` (`author_id`),
  KEY `blog_blog_blog_type_id_de11bd65_fk_blog_blogtype_id` (`blog_type_id`),
  CONSTRAINT `blog_blog_author_id_8791af69_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `blog_blog_blog_type_id_de11bd65_fk_blog_blogtype_id` FOREIGN KEY (`blog_type_id`) REFERENCES `blog_blogtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blog`
--

LOCK TABLES `blog_blog` WRITE;
/*!40000 ALTER TABLE `blog_blog` DISABLE KEYS */;
INSERT INTO `blog_blog` VALUES (1,'学习Django第一篇','Django以Python的一种web构架，可以用来web开发','2020-09-25 14:19:20.202327','2020-09-25 14:19:20.202327',1,1),(2,'学习Django第二篇','Django是一个很全面的web构架，很适合web开发','2020-09-25 14:19:54.297211','2020-09-25 14:19:54.297211',1,1),(3,'学习Python第一篇','Python一种用途广泛的脚本语言','2020-09-25 14:20:31.866815','2020-09-25 14:20:31.866815',1,2),(4,'学习Python第二篇','Python运行比较慢，但可以通过嵌入别的语言中来加快速度','2020-09-25 14:21:40.928059','2020-09-25 14:21:40.928059',1,2),(5,'for 1','nothing to write,it is only for experice','2020-10-03 22:11:10.215622','2020-10-03 22:11:10.216620',1,4),(6,'for 2','nothing to write,it is only for experice','2020-10-03 22:11:10.233590','2020-10-03 22:11:10.233590',1,4),(7,'for 3','nothing to write,it is only for experice','2020-10-03 22:11:10.238561','2020-10-03 22:11:10.238561',1,4),(8,'for 4','nothing to write,it is only for experice','2020-10-03 22:11:10.242558','2020-10-03 22:11:10.242558',1,4),(9,'for 5','nothing to write,it is only for experice','2020-10-03 22:11:10.246541','2020-10-03 22:11:10.246541',1,4),(10,'for 6','nothing to write,it is only for experice','2020-10-03 22:11:10.251528','2020-10-03 22:11:10.251528',1,4),(11,'for 7','nothing to write,it is only for experice','2020-10-03 22:11:10.256513','2020-10-03 22:11:10.256513',1,4),(12,'for 8','nothing to write,it is only for experice','2020-10-03 22:11:10.264492','2020-10-03 22:11:10.264492',1,4),(13,'for 9','nothing to write,it is only for experice','2020-10-03 22:11:10.269479','2020-10-03 22:11:10.269479',1,4),(14,'for 10','nothing to write,it is only for experice','2020-10-03 22:11:10.273468','2020-10-03 22:11:10.273468',1,4),(15,'for 11','nothing to write,it is only for experice','2020-10-03 22:11:10.277457','2020-10-03 22:11:10.277457',1,4),(16,'for 12','nothing to write,it is only for experice','2020-10-03 22:11:10.281447','2020-10-03 22:11:10.281447',1,4),(17,'for 13','nothing to write,it is only for experice','2020-10-03 22:11:10.284438','2020-10-03 22:11:10.284438',1,4),(18,'for 14','nothing to write,it is only for experice','2020-10-03 22:11:10.289425','2020-10-03 22:11:10.289425',1,4),(19,'for 15','nothing to write,it is only for experice','2020-10-03 22:11:10.293415','2020-10-03 22:11:10.293415',1,4),(20,'for 16','nothing to write,it is only for experice','2020-10-03 22:11:10.298401','2020-10-03 22:11:10.298401',1,4),(21,'for 17','nothing to write,it is only for experice','2020-10-03 22:11:10.301393','2020-10-03 22:11:10.301393',1,4),(22,'for 18','nothing to write,it is only for experice','2020-10-03 22:11:10.306380','2020-10-03 22:11:10.306380',1,4),(23,'for 19','nothing to write,it is only for experice','2020-10-03 22:11:10.309372','2020-10-03 22:11:10.309372',1,4),(24,'for 20','nothing to write,it is only for experice','2020-10-03 22:11:10.313361','2020-10-03 22:11:10.313361',1,4),(25,'for 21','nothing to write,it is only for experice','2020-10-03 22:11:10.317351','2020-10-03 22:11:10.318348',1,4),(26,'for 22','nothing to write,it is only for experice','2020-10-03 22:11:10.325329','2020-10-03 22:11:10.325329',1,4),(27,'for 23','nothing to write,it is only for experice','2020-10-03 22:11:10.329319','2020-10-03 22:11:10.329319',1,4),(28,'for 24','nothing to write,it is only for experice','2020-10-03 22:11:10.333308','2020-10-03 22:11:10.333308',1,4),(29,'for 25','nothing to write,it is only for experice','2020-10-03 22:11:10.338294','2020-10-03 22:11:10.338294',1,4),(30,'for 26','nothing to write,it is only for experice','2020-10-03 22:11:10.341287','2020-10-03 22:11:10.341287',1,4),(31,'for 27','nothing to write,it is only for experice','2020-10-03 22:11:10.345276','2020-10-03 22:11:10.345276',1,4),(32,'for 28','nothing to write,it is only for experice','2020-10-03 22:11:10.349266','2020-10-03 22:11:10.349266',1,4),(33,'for 29','nothing to write,it is only for experice','2020-10-03 22:11:10.353255','2020-10-03 22:11:10.353255',1,4),(34,'for 30','nothing to write,it is only for experice','2020-10-03 22:11:10.357244','2020-10-03 22:11:10.357244',1,4),(35,'for 31','nothing to write,it is only for experice','2020-10-03 22:11:10.361233','2020-10-03 22:11:10.361233',1,4),(36,'for 32','nothing to write,it is only for experice','2020-10-03 22:11:10.364225','2020-10-03 22:11:10.364225',1,4),(37,'for 33','nothing to write,it is only for experice','2020-10-03 22:11:10.368215','2020-10-03 22:11:10.368215',1,4),(38,'for 34','nothing to write,it is only for experice','2020-10-03 22:11:10.372204','2020-10-03 22:11:10.372204',1,4),(39,'for 35','nothing to write,it is only for experice','2020-10-03 22:11:10.375196','2020-10-03 22:11:10.375196',1,4),(40,'for 36','nothing to write,it is only for experice','2020-10-03 22:11:10.380183','2020-10-03 22:11:10.380183',1,4),(41,'for 37','nothing to write,it is only for experice','2020-10-03 22:11:10.384172','2020-10-03 22:11:10.384172',1,4),(42,'for 38','nothing to write,it is only for experice','2020-10-03 22:11:10.387164','2020-10-03 22:11:10.387164',1,4),(43,'for 39','nothing to write,it is only for experice','2020-10-03 22:11:10.391154','2020-10-03 22:11:10.391154',1,4),(44,'for 40','nothing to write,it is only for experice','2020-10-03 22:11:10.395143','2020-10-03 22:11:10.395143',1,4),(45,'for 41','nothing to write,it is only for experice','2020-10-03 22:11:10.400130','2020-10-03 22:11:10.400130',1,4),(46,'for 42','nothing to write,it is only for experice','2020-10-03 22:11:10.404119','2020-10-03 22:11:10.404119',1,4),(47,'for 43','nothing to write,it is only for experice','2020-10-03 22:11:10.407110','2020-10-03 22:11:10.408108',1,4),(48,'for 44','nothing to write,it is only for experice','2020-10-03 22:11:10.415089','2020-10-03 22:11:10.415089',1,4),(49,'for 45','nothing to write,it is only for experice','2020-10-03 22:11:10.419079','2020-10-03 22:11:10.419079',1,4),(50,'for 46','nothing to write,it is only for experice','2020-10-03 22:11:10.422071','2020-10-03 22:11:10.422071',1,4),(51,'for 47','nothing to write,it is only for experice','2020-10-03 22:11:10.426060','2020-10-03 22:11:10.426060',1,4),(52,'for 48','nothing to write,it is only for experice','2020-10-03 22:11:10.430049','2020-10-03 22:11:10.430049',1,4),(53,'for 49','nothing to write,it is only for experice','2020-10-03 22:11:10.433042','2020-10-03 22:11:10.433042',1,4),(54,'for 50','nothing to write,it is only for experice','2020-10-03 22:11:10.437031','2020-10-03 22:11:10.437031',1,4),(55,'for 51','nothing to write,it is only for experice','2020-10-03 22:11:10.441020','2020-10-03 22:11:10.441020',1,4),(56,'for 52','nothing to write,it is only for experice','2020-10-03 22:11:10.444012','2020-10-03 22:11:10.444012',1,4),(57,'for 53','nothing to write,it is only for experice','2020-10-03 22:11:10.448999','2020-10-03 22:11:10.448999',1,4),(58,'for 54','nothing to write,it is only for experice','2020-10-03 22:11:10.452988','2020-10-03 22:11:10.452988',1,4),(59,'for 55','nothing to write,it is only for experice','2020-10-03 22:11:10.456977','2020-10-03 22:11:10.456977',1,4),(60,'for 56','nothing to write,it is only for experice','2020-10-03 22:11:10.459970','2020-10-03 22:11:10.459970',1,4),(61,'for 57','nothing to write,it is only for experice','2020-10-03 22:11:10.463959','2020-10-03 22:11:10.463959',1,4),(62,'for 58','nothing to write,it is only for experice','2020-10-03 22:11:10.468946','2020-10-03 22:11:10.468946',1,4),(63,'for 59','nothing to write,it is only for experice','2020-10-03 22:11:10.472935','2020-10-03 22:11:10.472935',1,4),(64,'for 60','nothing to write,it is only for experice','2020-10-03 22:11:10.475927','2020-10-03 22:11:10.475927',1,4),(65,'for 61','nothing to write,it is only for experice','2020-10-03 22:11:10.480913','2020-10-03 22:11:10.480913',1,4),(66,'for 62','nothing to write,it is only for experice','2020-10-03 22:11:10.483906','2020-10-03 22:11:10.483906',1,4),(67,'for 63','nothing to write,it is only for experice','2020-10-03 22:11:10.487895','2020-10-03 22:11:10.487895',1,4),(68,'for 64','nothing to write,it is only for experice','2020-10-03 22:11:10.491884','2020-10-03 22:11:10.491884',1,4),(69,'for 65','nothing to write,it is only for experice','2020-10-03 22:11:10.494876','2020-10-03 22:11:10.494876',1,4),(70,'for 66','nothing to write,it is only for experice','2020-10-03 22:11:10.499862','2020-10-03 22:11:10.499862',1,4),(71,'for 67','nothing to write,it is only for experice','2020-10-03 22:11:10.502854','2020-10-03 22:11:10.502854',1,4),(72,'for 68','nothing to write,it is only for experice','2020-10-03 22:11:10.506844','2020-10-03 22:11:10.506844',1,4),(73,'for 69','nothing to write,it is only for experice','2020-10-03 22:11:10.510833','2020-10-03 22:11:10.510833',1,4),(74,'for 70','nothing to write,it is only for experice','2020-10-03 22:11:10.518812','2020-10-03 22:11:10.518812',1,4),(75,'for 71','nothing to write,it is only for experice','2020-10-03 22:11:10.522801','2020-10-03 22:11:10.522801',1,4),(76,'for 72','nothing to write,it is only for experice','2020-10-03 22:11:10.526791','2020-10-03 22:11:10.526791',1,4),(77,'for 73','nothing to write,it is only for experice','2020-10-03 22:11:10.530780','2020-10-03 22:11:10.530780',1,4),(78,'for 74','nothing to write,it is only for experice','2020-10-03 22:11:10.533772','2020-10-03 22:11:10.533772',1,4),(79,'for 75','nothing to write,it is only for experice','2020-10-03 22:11:10.537761','2020-10-03 22:11:10.537761',1,4),(80,'for 76','nothing to write,it is only for experice','2020-10-03 22:11:10.541751','2020-10-03 22:11:10.541751',1,4),(81,'for 77','nothing to write,it is only for experice','2020-10-03 22:11:10.545740','2020-10-03 22:11:10.545740',1,4),(82,'for 78','nothing to write,it is only for experice','2020-10-03 22:11:10.550727','2020-10-03 22:11:10.550727',1,4),(83,'for 79','nothing to write,it is only for experice','2020-10-03 22:11:10.554716','2020-10-03 22:11:10.554716',1,4),(84,'for 80','nothing to write,it is only for experice','2020-10-03 22:11:10.557708','2020-10-03 22:11:10.557708',1,4),(85,'for 81','nothing to write,it is only for experice','2020-10-03 22:11:10.562695','2020-10-03 22:11:10.562695',1,4),(86,'for 82','nothing to write,it is only for experice','2020-10-03 22:11:10.565687','2020-10-03 22:11:10.565687',1,4),(87,'for 83','nothing to write,it is only for experice','2020-10-03 22:11:10.569676','2020-10-03 22:11:10.569676',1,4),(88,'for 84','nothing to write,it is only for experice','2020-10-03 22:11:10.573665','2020-10-03 22:11:10.573665',1,4),(89,'for 85','nothing to write,it is only for experice','2020-10-03 22:11:10.577654','2020-10-03 22:11:10.577654',1,4),(90,'for 86','nothing to write,it is only for experice','2020-10-03 22:11:10.580647','2020-10-03 22:11:10.580647',1,4),(91,'for 87','nothing to write,it is only for experice','2020-10-03 22:11:10.584636','2020-10-03 22:11:10.584636',1,4),(92,'for 88','nothing to write,it is only for experice','2020-10-03 22:11:10.589622','2020-10-03 22:11:10.589622',1,4),(93,'for 89','nothing to write,it is only for experice','2020-10-03 22:11:10.592615','2020-10-03 22:11:10.592615',1,4),(94,'for 90','nothing to write,it is only for experice','2020-10-03 22:11:10.596604','2020-10-03 22:11:10.596604',1,4),(95,'for 91','nothing to write,it is only for experice','2020-10-03 22:11:10.600594','2020-10-03 22:11:10.600594',1,4),(96,'for 92','nothing to write,it is only for experice','2020-10-03 22:11:10.605580','2020-10-03 22:11:10.605580',1,4),(97,'for 93','nothing to write,it is only for experice','2020-10-03 22:11:10.608572','2020-10-03 22:11:10.608572',1,4),(98,'for 94','nothing to write,it is only for experice','2020-10-03 22:11:10.611564','2020-10-03 22:11:10.611564',1,4),(99,'for 95','nothing to write,it is only for experice','2020-10-03 22:11:10.616550','2020-10-03 22:11:10.616550',1,4),(100,'for 96','nothing to write,it is only for experice','2020-10-03 22:11:10.619542','2020-10-03 22:11:10.619542',1,4),(101,'for 97','nothing to write,it is only for experice','2020-10-03 22:11:10.624529','2020-10-03 22:11:10.624529',1,4),(102,'for 98','nothing to write,it is only for experice','2020-10-03 22:11:10.627522','2020-10-03 22:11:10.627522',1,4),(103,'for 99','nothing to write,it is only for experice','2020-10-03 22:11:10.632508','2020-10-03 22:11:10.632508',1,4),(104,'for 100','<p>nothing to write,it is only for experice **someone**</p>','2020-10-03 22:11:10.636497','2020-10-08 13:21:56.997250',1,4);
/*!40000 ALTER TABLE `blog_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blogtype`
--

DROP TABLE IF EXISTS `blog_blogtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `blog_blogtype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blogtype`
--

LOCK TABLES `blog_blogtype` WRITE;
/*!40000 ALTER TABLE `blog_blogtype` DISABLE KEYS */;
INSERT INTO `blog_blogtype` VALUES (1,'Django'),(2,'Python'),(3,'Java'),(4,'for');
/*!40000 ALTER TABLE `blog_blogtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_comment`
--

DROP TABLE IF EXISTS `comment_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `comment_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_id` int unsigned NOT NULL,
  `text` longtext NOT NULL,
  `comment_time` datetime(6) NOT NULL,
  `content_type_id` int NOT NULL,
  `user_id` int NOT NULL,
  `parent_id` int DEFAULT NULL,
  `reply_to_id` int DEFAULT NULL,
  `root_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_comment_parent_id_b612524c_fk_comment_comment_id` (`parent_id`),
  KEY `comment_comment_content_type_id_fbfb9793_fk_django_co` (`content_type_id`),
  KEY `comment_comment_reply_to_id_e0adcef8_fk_auth_user_id` (`reply_to_id`),
  KEY `comment_comment_root_id_28721811_fk_comment_comment_id` (`root_id`),
  KEY `comment_comment_user_id_6078e57b_fk_auth_user_id` (`user_id`),
  CONSTRAINT `comment_comment_content_type_id_fbfb9793_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `comment_comment_parent_id_b612524c_fk_comment_comment_id` FOREIGN KEY (`parent_id`) REFERENCES `comment_comment` (`id`),
  CONSTRAINT `comment_comment_reply_to_id_e0adcef8_fk_auth_user_id` FOREIGN KEY (`reply_to_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `comment_comment_root_id_28721811_fk_comment_comment_id` FOREIGN KEY (`root_id`) REFERENCES `comment_comment` (`id`),
  CONSTRAINT `comment_comment_user_id_6078e57b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_comment`
--

LOCK TABLES `comment_comment` WRITE;
/*!40000 ALTER TABLE `comment_comment` DISABLE KEYS */;
INSERT INTO `comment_comment` VALUES (3,0,'uiuiu','2020-10-07 00:09:23.922645',9,1,NULL,NULL,NULL),(4,103,'测试','2020-10-07 14:13:57.980274',9,1,NULL,NULL,NULL),(5,103,'再一次测试','2020-10-07 15:08:39.372705',9,1,NULL,NULL,NULL),(6,103,'adh;lajkda;lsdakljdf;ajdkfakdf;louiqopiupdsjfka;lkjfdakl;fal;dfl;fdljkflkjkljasdkld','2020-10-07 15:11:19.888324',9,1,NULL,NULL,NULL),(7,104,'sfdsdf','2020-10-07 20:13:15.682924',9,2,NULL,NULL,NULL),(8,104,'### hello','2020-10-08 10:37:14.293641',9,2,NULL,NULL,NULL),(9,104,'<p>zxczx</p>','2020-10-08 14:35:49.764548',9,1,NULL,NULL,NULL),(10,104,'<p>14</p>','2020-10-08 15:39:52.644644',9,1,NULL,NULL,NULL),(11,104,'<p>4</p>','2020-10-08 15:45:33.066080',9,1,NULL,NULL,NULL),(12,103,'<p>4</p>','2020-10-08 15:51:39.683325',9,1,NULL,NULL,NULL),(13,103,'<p>4</p>','2020-10-08 15:55:20.574895',9,1,NULL,NULL,NULL),(14,103,'<p>14</p>','2020-10-08 15:56:37.733592',9,1,NULL,NULL,NULL),(15,103,'<p>45</p>','2020-10-08 16:03:39.797197',9,1,NULL,NULL,NULL),(16,103,'<p>ad</p>','2020-10-08 16:04:28.402055',9,1,NULL,NULL,NULL),(17,103,'<p>ss</p>','2020-10-08 16:11:02.098751',9,1,NULL,NULL,NULL),(18,103,'<p>4685575</p>','2020-10-08 16:30:12.003206',9,1,NULL,NULL,NULL),(19,103,'<p>4685575</p>','2020-10-08 16:30:12.703675',9,1,NULL,NULL,NULL),(20,103,'<p>4685575</p>','2020-10-08 16:30:13.811218',9,1,NULL,NULL,NULL),(21,103,'<p>4685575</p>','2020-10-08 16:30:14.495223',9,1,NULL,NULL,NULL),(22,103,'<p>4685575</p>','2020-10-08 16:30:14.784511',9,1,NULL,NULL,NULL),(23,103,'<p>4685575</p>','2020-10-08 16:30:15.022847',9,1,NULL,NULL,NULL),(24,103,'<p>adfafds</p>','2020-10-08 16:32:20.989946',9,1,NULL,NULL,NULL),(25,103,'<p>adfafds</p>','2020-10-08 16:32:23.419248',9,1,NULL,NULL,NULL),(26,103,'<p>adfaf</p>','2020-10-08 16:32:53.821731',9,1,NULL,NULL,NULL),(27,103,'<p>adfaf</p>','2020-10-08 16:33:10.244486',9,1,NULL,NULL,NULL),(28,103,'<p>adfaf</p>','2020-10-08 16:33:12.021487',9,1,NULL,NULL,NULL),(29,103,'<p>adfdf</p>','2020-10-08 16:33:16.152426',9,1,NULL,NULL,NULL),(30,103,'<p>阿斯顿发</p>','2020-10-08 16:38:53.914575',9,1,NULL,NULL,NULL),(31,103,'<p>fsfgs</p>','2020-10-08 16:43:00.992017',9,1,NULL,NULL,NULL),(32,103,'<p>傻瓜式风格</p>','2020-10-08 16:43:06.112093',9,1,NULL,NULL,NULL),(33,103,'<p>官方</p>','2020-10-08 16:43:46.275059',9,1,NULL,NULL,NULL),(34,103,'45465','2020-10-09 09:32:46.093130',9,1,33,1,33),(35,103,'xxxxx','2020-10-10 16:29:28.387622',9,2,19,1,22),(36,103,'14444','2020-10-10 16:33:46.425893',9,1,NULL,NULL,NULL),(37,103,'<p>4554544</p>','2020-10-10 20:03:22.013781',9,1,NULL,NULL,NULL),(38,103,'<p>特也要</p>','2020-10-10 20:23:59.684294',9,1,34,1,33),(39,103,'<p>特也要</p>','2020-10-10 20:24:01.877814',9,1,34,1,33),(40,103,'<p>特也要</p>','2020-10-10 20:24:02.567082',9,1,34,1,33),(41,103,'<p>特也要</p>','2020-10-10 20:24:02.792152',9,1,34,1,33),(42,103,'<p>特也要</p>','2020-10-10 20:24:03.118902',9,1,34,1,33),(43,103,'<p>455</p>','2020-10-10 20:24:41.650166',9,1,34,1,33),(44,103,'<p>455</p>','2020-10-10 20:24:51.358458',9,1,37,1,37),(45,103,'<p>455</p>','2020-10-10 20:25:19.131665',9,1,42,1,33),(46,103,'<p>5644</p>','2020-10-10 20:25:40.125647',9,1,32,1,32),(47,103,'<p>4555</p>','2020-10-10 20:28:31.812901',9,1,37,1,37),(48,103,'<p>999</p>','2020-10-10 20:30:24.874420',9,1,37,1,37),(49,103,'<p>6</p>','2020-10-10 20:30:35.152103',9,1,NULL,NULL,NULL),(50,103,'<p>打发</p>','2020-10-10 20:31:43.198111',9,1,48,1,37),(51,103,'<p>7</p>','2020-10-10 20:32:14.839444',9,1,49,1,49),(52,103,'<p>99</p>','2020-10-10 20:35:39.276772',9,1,49,1,49),(53,103,'<p>888</p>','2020-10-10 20:35:45.174814',9,1,NULL,NULL,NULL),(54,103,'<p>98455</p>','2020-10-10 20:35:50.606206',9,1,NULL,NULL,NULL),(55,103,'<p>88</p>','2020-10-10 20:36:50.258622',9,1,NULL,NULL,NULL),(56,103,'<p>777</p>','2020-10-10 20:40:12.760505',9,1,NULL,NULL,NULL),(57,104,'<p>4555</p>','2020-10-11 15:21:28.060758',9,1,NULL,NULL,NULL),(58,104,'<p>5</p>','2020-10-11 15:21:36.663733',9,1,11,1,11),(59,104,'<p>55</p>','2020-10-11 15:22:03.919469',9,1,NULL,NULL,NULL),(60,104,'<p>66</p>','2020-10-11 15:23:24.029460',9,1,59,1,59),(61,104,'<p>66</p>','2020-10-11 15:23:46.755034',9,1,60,1,59),(62,104,'<p>66</p>','2020-10-11 15:23:54.736464',9,1,NULL,NULL,NULL),(63,104,'<p>444</p>','2020-10-11 15:52:09.136858',9,1,59,1,59),(64,104,'<p>555</p>','2020-10-11 15:52:13.398300',9,1,NULL,NULL,NULL),(65,104,'<p>888</p>','2020-10-11 15:52:18.753470',9,1,NULL,NULL,NULL),(66,104,'<p>66</p>','2020-10-11 15:52:34.689994',9,1,NULL,NULL,NULL),(67,104,'<p>7</p>','2020-10-11 15:54:09.836498',9,1,NULL,NULL,NULL),(68,104,'<p>6</p>','2020-10-11 15:55:35.651194',9,1,NULL,NULL,NULL),(69,104,'<p>啊啊</p>','2020-10-11 15:56:02.458829',9,1,NULL,NULL,NULL),(70,104,'<p>打到底</p>','2020-10-11 15:56:11.724214',9,1,NULL,NULL,NULL),(71,104,'<p>达到</p>','2020-10-11 15:56:29.192120',9,1,NULL,NULL,NULL),(72,104,'<p>44</p>','2020-10-11 15:58:18.276450',9,1,NULL,NULL,NULL),(73,104,'<p>444</p>','2020-10-11 16:10:14.941220',9,1,NULL,NULL,NULL),(74,104,'<p>55</p>','2020-10-11 16:10:22.351473',9,1,NULL,NULL,NULL),(75,104,'<p>撒旦法</p>','2020-10-11 16:10:54.509574',9,1,NULL,NULL,NULL),(76,104,'<p>爱的</p>','2020-10-11 16:11:09.048448',9,1,74,1,74),(77,104,'<p>阿道夫</p>','2020-10-11 16:11:15.120069',9,1,NULL,NULL,NULL),(78,104,'<p>迭代</p>','2020-10-11 16:11:25.665866',9,1,NULL,NULL,NULL),(79,104,'<p>44</p>','2020-10-11 16:13:20.763514',9,1,NULL,NULL,NULL),(80,104,'<p>88</p>','2020-10-11 16:13:25.917306',9,1,NULL,NULL,NULL),(81,104,'<p>55</p>','2020-10-11 16:15:19.509921',9,1,NULL,NULL,NULL),(82,104,'<p>55</p>','2020-10-11 16:15:27.068070',9,1,NULL,NULL,NULL),(83,104,'<p>55</p>','2020-10-11 16:19:30.953050',9,1,NULL,NULL,NULL),(84,104,'<p>4111</p>','2020-10-11 16:26:38.093823',9,1,76,1,74),(85,104,'<p>ad</p>','2020-10-11 18:41:12.410488',9,1,NULL,NULL,NULL),(86,104,'<p>122</p>','2020-10-14 13:52:30.276773',9,1,NULL,NULL,NULL),(87,104,'<p>7</p>','2020-10-14 14:19:11.282529',9,1,NULL,NULL,NULL),(88,104,'<p>7</p>','2020-10-14 14:19:14.063109',9,1,NULL,NULL,NULL),(89,104,'<p>7</p>','2020-10-14 14:19:16.474820',9,1,NULL,NULL,NULL),(90,104,'<p>8</p>','2020-10-14 14:19:48.495747',9,1,NULL,NULL,NULL),(91,104,'<p>9</p>','2020-10-14 14:19:54.718178',9,1,NULL,NULL,NULL),(92,104,'<p>9</p>','2020-10-14 14:20:20.625667',9,1,NULL,NULL,NULL),(93,104,'<p>6</p>','2020-10-14 14:20:49.689910',9,1,NULL,NULL,NULL),(94,104,'<p>9</p>','2020-10-14 14:22:56.277107',9,1,NULL,NULL,NULL),(95,104,'<p>ad</p>','2020-10-14 14:25:56.838910',9,1,NULL,NULL,NULL),(96,104,'<p>d</p>','2020-10-14 14:26:02.178989',9,1,NULL,NULL,NULL),(97,104,'<p>daff</p>','2020-10-14 14:26:07.437028',9,1,NULL,NULL,NULL),(98,104,'<p>deeee</p>','2020-10-14 14:26:16.488581',9,1,NULL,NULL,NULL),(99,104,'<p>ad</p>','2020-10-14 14:27:01.316733',9,1,NULL,NULL,NULL),(100,103,'<p>444</p>','2020-10-14 19:35:38.832697',9,1,NULL,NULL,NULL),(101,103,'<p>5</p>','2020-10-14 19:35:49.550800',9,1,100,1,100),(102,103,'<p>55</p>','2020-10-14 19:35:54.377348',9,1,101,1,100);
/*!40000 ALTER TABLE `comment_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (6,'2020-09-25 14:17:57.034668','1','Django',1,'[{\"added\": {}}]',10,1),(7,'2020-09-25 14:17:59.564173','2','Python',1,'[{\"added\": {}}]',10,1),(8,'2020-09-25 14:18:09.895284','3','Java',1,'[{\"added\": {}}]',10,1),(9,'2020-09-25 14:19:20.203325','1','<Blog: 学习Django第一篇>',1,'[{\"added\": {}}]',9,1),(10,'2020-09-25 14:19:54.298208','2','<Blog: 学习Django第二篇>',1,'[{\"added\": {}}]',9,1),(11,'2020-09-25 14:20:31.867806','3','<Blog: 学习Python第一篇>',1,'[{\"added\": {}}]',9,1),(12,'2020-09-25 14:21:40.929023','4','<Blog: 学习Python第二篇>',1,'[{\"added\": {}}]',9,1),(13,'2020-10-05 16:33:32.780878','104','<Blog: for 100>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',9,1),(14,'2020-10-05 18:13:28.520435','104','<Blog: for 100>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',9,1),(15,'2020-10-05 18:19:00.699931','104','<Blog: for 100>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',9,1),(16,'2020-10-05 22:58:25.172017','1','ReadNum object (1)',1,'[{\"added\": {}}]',11,1),(17,'2020-10-06 14:12:18.611094','1','ReadDetail object (1)',1,'[{\"added\": {}}]',13,1),(18,'2020-10-06 14:12:45.558780','1','ReadDetail object (1)',2,'[]',13,1),(19,'2020-10-06 14:13:25.287338','1','ReadDetail object (1)',2,'[{\"changed\": {\"fields\": [\"object_id\"]}}]',13,1),(20,'2020-10-06 14:13:47.543765','1','ReadDetail object (1)',2,'[{\"changed\": {\"fields\": [\"object_id\"]}}]',13,1),(21,'2020-10-06 14:13:52.521117','1','ReadDetail object (1)',3,'',13,1),(22,'2020-10-06 14:15:13.744862','2','ReadDetail object (2)',1,'[{\"added\": {}}]',13,1),(23,'2020-10-06 14:16:28.305601','3','ReadDetail object (3)',1,'[{\"added\": {}}]',13,1),(24,'2020-10-06 14:18:56.052591','3','ReadNum object (3)',1,'[{\"added\": {}}]',12,1),(25,'2020-10-06 14:21:15.646913','4','ReadNum object (4)',1,'[{\"added\": {}}]',12,1),(26,'2020-10-06 14:21:20.729186','5','ReadNum object (5)',1,'[{\"added\": {}}]',12,1),(27,'2020-10-06 14:22:17.497334','4','ReadDetail object (4)',1,'[{\"added\": {}}]',13,1),(28,'2020-10-06 15:16:50.859792','1','ReadDetail object (1)',1,'[{\"added\": {}}]',13,1),(29,'2020-10-06 15:16:53.263452','1','ReadDetail object (1)',2,'[]',13,1),(30,'2020-10-06 16:36:52.039970','2','ReadDetail object (2)',1,'[{\"added\": {}}]',13,1),(31,'2020-10-06 23:32:48.514352','1','阅读blog100:没什么用',1,'[{\"added\": {}}]',14,1),(32,'2020-10-06 23:33:08.732689','2','阅读blog100:没什么用',1,'[{\"added\": {}}]',14,1),(33,'2020-10-06 23:33:57.327408','2','阅读blog100:没什么用',3,'',14,1),(34,'2020-10-06 23:33:57.329401','1','阅读blog100:没什么用',3,'',14,1),(35,'2020-10-07 00:09:23.923641','3','阅读blog0:uiuiu',1,'[{\"added\": {}}]',14,1),(36,'2020-10-08 10:41:24.938551','104','<Blog: for 100>',2,'[]',9,1),(37,'2020-10-08 13:19:38.323420','104','<Blog: for 100>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',9,1),(38,'2020-10-08 13:21:56.998197','104','<Blog: for 100>',2,'[]',9,1),(39,'2020-10-09 09:32:46.094128','34','阅读blog103:45465',1,'[{\"added\": {}}]',14,1),(40,'2020-10-10 16:29:28.389615','35','阅读blog103:xxxxx',1,'[{\"added\": {}}]',14,1),(41,'2020-10-10 16:33:46.426891','36','阅读blog103:14444',1,'[{\"added\": {}}]',14,1),(42,'2020-10-14 21:05:53.297230','1','admin 昵称：黑色天空',1,'[{\"added\": {}}]',17,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(9,'blog','blog'),(10,'blog','blogtype'),(11,'blog','readnum'),(14,'comment','comment'),(5,'contenttypes','contenttype'),(15,'likes','like'),(16,'likes','likerecord'),(13,'read_statistic','readdetail'),(12,'read_statistic','readnum'),(6,'sessions','session'),(17,'user','myuser');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-09-24 18:03:21.775446'),(2,'auth','0001_initial','2020-09-24 18:03:23.166881'),(3,'admin','0001_initial','2020-09-24 18:03:23.610533'),(4,'admin','0002_logentry_remove_auto_add','2020-09-24 18:03:23.644448'),(5,'contenttypes','0002_remove_content_type_name','2020-09-24 18:03:23.898861'),(6,'auth','0002_alter_permission_name_max_length','2020-09-24 18:03:24.033523'),(7,'auth','0003_alter_user_email_max_length','2020-09-24 18:03:24.110197'),(8,'auth','0004_alter_user_username_opts','2020-09-24 18:03:24.139160'),(9,'auth','0005_alter_user_last_login_null','2020-09-24 18:03:24.281743'),(10,'auth','0006_require_contenttypes_0002','2020-09-24 18:03:24.291759'),(11,'auth','0007_alter_validators_add_error_messages','2020-09-24 18:03:24.319634'),(12,'auth','0008_alter_user_username_max_length','2020-09-24 18:03:24.480239'),(13,'auth','0009_alter_user_last_name_max_length','2020-09-24 18:03:24.654390'),(14,'sessions','0001_initial','2020-09-24 18:03:24.747490'),(15,'block','0001_initial','2020-09-24 21:25:48.346468'),(16,'blog','0001_initial','2020-09-25 14:17:26.972933'),(17,'blog','0002_auto_20201004_1521','2020-10-04 15:21:38.726559'),(18,'blog','0003_auto_20201005_1632','2020-10-05 16:32:37.134313'),(19,'blog','0004_readnum','2020-10-05 22:55:43.371689'),(20,'blog','0005_auto_20201005_2335','2020-10-05 23:35:21.961874'),(21,'read_statistic','0001_initial','2020-10-05 23:59:57.009227'),(22,'read_statistic','0002_readdetail','2020-10-06 14:11:17.735291'),(23,'read_statistic','0003_auto_20201006_1434','2020-10-06 14:35:05.372388'),(24,'admin','0003_logentry_add_action_flag_choices','2020-10-06 15:15:57.507856'),(25,'auth','0010_alter_group_name_max_length','2020-10-06 15:15:57.542763'),(26,'auth','0011_update_proxy_permissions','2020-10-06 15:15:57.553735'),(27,'read_statistic','0004_auto_20201006_1515','2020-10-06 15:15:57.680395'),(28,'blog','0006_auto_20201006_2014','2020-10-06 20:15:09.952565'),(29,'comment','0001_initial','2020-10-06 23:30:05.555455'),(30,'blog','0007_auto_20201008_1309','2020-10-08 13:09:36.522650'),(31,'comment','0002_auto_20201009_0925','2020-10-09 09:26:54.353977'),(32,'comment','0003_auto_20201009_0926','2020-10-09 09:26:54.738047'),(33,'comment','0004_auto_20201010_1633','2020-10-10 16:33:19.778310'),(34,'blog','0008_auto_20201011_1531','2020-10-11 15:31:27.319529'),(35,'comment','0005_auto_20201011_1531','2020-10-11 15:31:27.784912'),(36,'read_statistic','0005_auto_20201011_1531','2020-10-11 15:31:27.880656'),(37,'likes','0001_initial','2020-10-11 20:40:34.699242'),(38,'user','0001_initial','2020-10-14 21:04:27.065460');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0921rj0ltagk7o08khvb2l0i2jrga9od','YmMyNDkxOGU5NzY0ODFiNmI5MWY2NTI5OGM4YTlkZDQ1Nzg1OWE2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YWJkM2I0NmExZjQ2MTFjMjQ5YzMxOTI3ZWU2MDZjMmFmZWM1OGVhIn0=','2020-10-28 21:04:44.170136'),('22pnv64y31ilcuvr5vpn1g4fbonjinye','YmMyNDkxOGU5NzY0ODFiNmI5MWY2NTI5OGM4YTlkZDQ1Nzg1OWE2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YWJkM2I0NmExZjQ2MTFjMjQ5YzMxOTI3ZWU2MDZjMmFmZWM1OGVhIn0=','2020-10-27 21:17:18.018557'),('9pyjty2mu0opfgiho4o5j3clc4fomqjm','YmMyNDkxOGU5NzY0ODFiNmI5MWY2NTI5OGM4YTlkZDQ1Nzg1OWE2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YWJkM2I0NmExZjQ2MTFjMjQ5YzMxOTI3ZWU2MDZjMmFmZWM1OGVhIn0=','2020-11-05 19:42:40.426121'),('zyqc2a75110poe2lrimo3v5kse2len6x','YmMyNDkxOGU5NzY0ODFiNmI5MWY2NTI5OGM4YTlkZDQ1Nzg1OWE2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YWJkM2I0NmExZjQ2MTFjMjQ5YzMxOTI3ZWU2MDZjMmFmZWM1OGVhIn0=','2020-10-22 10:40:57.689054');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes_like`
--

DROP TABLE IF EXISTS `likes_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `likes_like` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_id` int unsigned NOT NULL,
  `liked_num` int NOT NULL,
  `content_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `likes_like_content_type_id_8ffc2116_fk_django_content_type_id` (`content_type_id`),
  CONSTRAINT `likes_like_content_type_id_8ffc2116_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes_like`
--

LOCK TABLES `likes_like` WRITE;
/*!40000 ALTER TABLE `likes_like` DISABLE KEYS */;
INSERT INTO `likes_like` VALUES (1,104,0,9),(2,103,0,9),(3,101,1,9),(4,100,1,9),(5,99,1,9),(6,97,1,9),(7,89,0,9);
/*!40000 ALTER TABLE `likes_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes_likerecord`
--

DROP TABLE IF EXISTS `likes_likerecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `likes_likerecord` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_id` int unsigned NOT NULL,
  `like_time` datetime(6) NOT NULL,
  `content_type_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `likes_likerecord_content_type_id_4e35de35_fk_django_co` (`content_type_id`),
  KEY `likes_likerecord_user_id_c85b88bd_fk_auth_user_id` (`user_id`),
  CONSTRAINT `likes_likerecord_content_type_id_4e35de35_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `likes_likerecord_user_id_c85b88bd_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes_likerecord`
--

LOCK TABLES `likes_likerecord` WRITE;
/*!40000 ALTER TABLE `likes_likerecord` DISABLE KEYS */;
INSERT INTO `likes_likerecord` VALUES (3,101,'2020-10-13 19:58:41.392293',9,1),(4,100,'2020-10-13 19:58:49.001979',9,1),(5,99,'2020-10-13 19:59:51.921548',9,1),(6,97,'2020-10-13 20:17:53.032699',9,1);
/*!40000 ALTER TABLE `likes_likerecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_cache_table`
--

DROP TABLE IF EXISTS `my_cache_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `my_cache_table` (
  `cache_key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `expires` datetime(6) NOT NULL,
  PRIMARY KEY (`cache_key`),
  KEY `my_cache_table_expires` (`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_cache_table`
--

LOCK TABLES `my_cache_table` WRITE;
/*!40000 ALTER TABLE `my_cache_table` DISABLE KEYS */;
INSERT INTO `my_cache_table` VALUES (':1:seven_day_hot_date','gAWVjgoAAAAAAACMFmRqYW5nby5kYi5tb2RlbHMucXVlcnmUjAhRdWVyeVNldJSTlCmBlH2UKIwFbW9kZWyUjAtibG9nLm1vZGVsc5SMBEJsb2eUk5SMA19kYpROjAZfaGludHOUfZSMBXF1ZXJ5lIwaZGphbmdvLmRiLm1vZGVscy5zcWwucXVlcnmUjAVRdWVyeZSTlCmBlH2UKGgFaAiMDmFsaWFzX3JlZmNvdW50lH2UKIwJYmxvZ19ibG9nlEsEjBlyZWFkX3N0YXRpc3RpY19yZWFkZGV0YWlslEsDdYwJYWxpYXNfbWFwlIwLY29sbGVjdGlvbnOUjAtPcmRlcmVkRGljdJSTlClSlChoFIwjZGphbmdvLmRiLm1vZGVscy5zcWwuZGF0YXN0cnVjdHVyZXOUjAlCYXNlVGFibGWUk5QpgZR9lCiMCnRhYmxlX25hbWWUaBSMC3RhYmxlX2FsaWFzlGgUdWJoFWgbjARKb2lulJOUKYGUfZQoaCBoFYwMcGFyZW50X2FsaWFzlGgUaCFoFYwJam9pbl90eXBllIwKSU5ORVIgSk9JTpSMCWpvaW5fY29sc5SMAmlklIwJb2JqZWN0X2lklIaUhZSMCmpvaW5fZmllbGSUjCJkamFuZ28uY29udHJpYi5jb250ZW50dHlwZXMuZmllbGRzlIwKR2VuZXJpY1JlbJSTlCmBlH2UKIwFZmllbGSUjBdkamFuZ28uZGIubW9kZWxzLmZpZWxkc5SMC19sb2FkX2ZpZWxklJOUjARibG9nlGgHjAxyZWFkX2RldGFpbHOUh5RSlGgFjBVyZWFkX3N0YXRpc3RpYy5tb2RlbHOUjApSZWFkRGV0YWlslJOUjAxyZWxhdGVkX25hbWWUjAErlIwScmVsYXRlZF9xdWVyeV9uYW1llE6MEGxpbWl0X2Nob2ljZXNfdG+UfZSMC3BhcmVudF9saW5rlImMCW9uX2RlbGV0ZZSMGWRqYW5nby5kYi5tb2RlbHMuZGVsZXRpb26UjApET19OT1RISU5HlJOUjAtzeW1tZXRyaWNhbJSJjAhtdWx0aXBsZZSIdWKMCG51bGxhYmxllIiMEWZpbHRlcmVkX3JlbGF0aW9ulE51YnWMEGV4dGVybmFsX2FsaWFzZXOUj5SMCXRhYmxlX21hcJR9lChoFF2UaBRhaBVdlGgVYXWMDGRlZmF1bHRfY29sc5SJjBBkZWZhdWx0X29yZGVyaW5nlIiMEXN0YW5kYXJkX29yZGVyaW5nlIiMDHVzZWRfYWxpYXNlc5SPlIwQZmlsdGVyX2lzX3N0aWNreZSJjAhzdWJxdWVyeZSJjAZzZWxlY3SUjBxkamFuZ28uZGIubW9kZWxzLmV4cHJlc3Npb25zlIwDQ29slJOUKYGUfZQojBFfY29uc3RydWN0b3JfYXJnc5RoFGg3aDhoB2gqh5RSlIaUfZSGlIwMb3V0cHV0X2ZpZWxklGhijAVhbGlhc5RoFIwGdGFyZ2V0lGhijBJjb250YWluc19hZ2dyZWdhdGWUiXViaF0pgZR9lChoYGgUaDdoOGgHjAV0aXRsZZSHlFKUhpR9lIaUaGZobmhnaBRoaGhudWKGlIwFd2hlcmWUjBpkamFuZ28uZGIubW9kZWxzLnNxbC53aGVyZZSMCVdoZXJlTm9kZZSTlCmBlH2UKIwIY2hpbGRyZW6UXZQojBhkamFuZ28uZGIubW9kZWxzLmxvb2t1cHOUjBJHcmVhdGVyVGhhbk9yRXF1YWyUk5QpgZR9lCiMA2xoc5RoXSmBlH2UKGhgaBVoN4wOcmVhZF9zdGF0aXN0aWOUaD2MBGRhdGWUh5RSlIaUfZSGlGhmaIZoZ2gVaGhohmhpiXVijANyaHOUjAhkYXRldGltZZSMBGRhdGWUk5RDBAfkCg+UhZRSlIwUYmlsYXRlcmFsX3RyYW5zZm9ybXOUXZRoaYl1Ymh7jA9MZXNzVGhhbk9yRXF1YWyUk5QpgZR9lChogGiBaIpojUMEB+QKFpSFlFKUaJFdlGhpiXViZYwJY29ubmVjdG9ylIwDQU5ElIwHbmVnYXRlZJSJaGmJdWKMC3doZXJlX2NsYXNzlGh2jAhncm91cF9ieZRoXmhqhpSMCG9yZGVyX2J5lIwNLXJlYWRfbnVtX3N1bZSFlIwIbG93X21hcmuUSwCMCWhpZ2hfbWFya5RLBYwIZGlzdGluY3SUiYwPZGlzdGluY3RfZmllbGRzlCmMEXNlbGVjdF9mb3JfdXBkYXRllImMGHNlbGVjdF9mb3JfdXBkYXRlX25vd2FpdJSJjB1zZWxlY3RfZm9yX3VwZGF0ZV9za2lwX2xvY2tlZJSJjBRzZWxlY3RfZm9yX3VwZGF0ZV9vZpQpjA5zZWxlY3RfcmVsYXRlZJSJjAltYXhfZGVwdGiUSwWMDXZhbHVlc19zZWxlY3SUaCpobIaUjAxfYW5ub3RhdGlvbnOUaBkpUpSMDHJlYWRfbnVtX3N1bZSMG2RqYW5nby5kYi5tb2RlbHMuYWdncmVnYXRlc5SMA1N1bZSTlCmBlH2UKGhgjBlyZWFkX2RldGFpbHNfX3JlYWRfbnVtYmVylIWUfZSGlGimiYwGZmlsdGVylE6MEnNvdXJjZV9leHByZXNzaW9uc5RdlGhdKYGUfZQoaGBoFWg3aINoPYwLcmVhZF9udW1iZXKUh5RSlIaUfZSGlGhmaMNoZ2gVaGhow4wVX291dHB1dF9maWVsZF9vcl9ub25llGjDaGmJdWJhjAVleHRyYZR9lIwKaXNfc3VtbWFyeZSJaGZow3Vic4wWYW5ub3RhdGlvbl9zZWxlY3RfbWFza5SPlChospCMGF9hbm5vdGF0aW9uX3NlbGVjdF9jYWNoZZRoGSlSlGiyaLZzjApjb21iaW5hdG9ylE6MDmNvbWJpbmF0b3JfYWxslImMEGNvbWJpbmVkX3F1ZXJpZXOUKYwGX2V4dHJhlE6MEWV4dHJhX3NlbGVjdF9tYXNrlI+UjBNfZXh0cmFfc2VsZWN0X2NhY2hllE6MDGV4dHJhX3RhYmxlc5QpjA5leHRyYV9vcmRlcl9ieZQpjBBkZWZlcnJlZF9sb2FkaW5nlCiRlIiGlIwTX2ZpbHRlcmVkX3JlbGF0aW9uc5R9lIwNZXhwbGFpbl9xdWVyeZSJjA5leHBsYWluX2Zvcm1hdJROjA9leHBsYWluX29wdGlvbnOUfZSMDV9sb29rdXBfam9pbnOUXZQoaBRoFWWMCmJhc2VfdGFibGWUaBR1YowNX3Jlc3VsdF9jYWNoZZRdlH2UKGgqS2hobIwHZm9yIDEwMJRosksCdWGMDl9zdGlja3lfZmlsdGVylImMCl9mb3Jfd3JpdGWUiYwZX3ByZWZldGNoX3JlbGF0ZWRfbG9va3Vwc5QpjA5fcHJlZmV0Y2hfZG9uZZSJjBZfa25vd25fcmVsYXRlZF9vYmplY3RzlH2UjA9faXRlcmFibGVfY2xhc3OUaACMDlZhbHVlc0l0ZXJhYmxllJOUjAdfZmllbGRzlGgqaGyGlIwPX2RqYW5nb192ZXJzaW9ulIwGMi4yLjE2lHViLg==','2020-10-22 21:19:01.000000');
/*!40000 ALTER TABLE `my_cache_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `read_statistic_readdetail`
--

DROP TABLE IF EXISTS `read_statistic_readdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `read_statistic_readdetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `read_number` int NOT NULL,
  `object_id` int unsigned NOT NULL,
  `content_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `read_statistic_readd_content_type_id_422ae75e_fk_django_co` (`content_type_id`),
  CONSTRAINT `read_statistic_readd_content_type_id_422ae75e_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `read_statistic_readdetail`
--

LOCK TABLES `read_statistic_readdetail` WRITE;
/*!40000 ALTER TABLE `read_statistic_readdetail` DISABLE KEYS */;
INSERT INTO `read_statistic_readdetail` VALUES (3,'2020-10-06',1,104,9),(4,'2020-10-06',1,94,9),(5,'2020-10-07',1,92,9),(6,'2020-10-07',2,104,9),(7,'2020-10-07',1,103,9),(8,'2020-10-08',2,104,9),(9,'2020-10-08',1,103,9),(10,'2020-10-09',1,103,9),(11,'2020-10-10',1,104,9),(12,'2020-10-10',1,103,9),(13,'2020-10-11',1,103,9),(14,'2020-10-11',1,104,9),(15,'2020-10-11',1,100,9),(16,'2020-10-12',2,104,9),(17,'2020-10-13',4,104,9),(18,'2020-10-13',1,103,9),(19,'2020-10-13',1,101,9),(20,'2020-10-13',1,100,9),(21,'2020-10-13',1,99,9),(22,'2020-10-13',3,98,9),(23,'2020-10-13',1,97,9),(24,'2020-10-13',1,89,9),(25,'2020-10-14',2,104,9),(26,'2020-10-14',3,103,9),(27,'2020-10-15',1,104,9),(28,'2020-10-22',1,104,9);
/*!40000 ALTER TABLE `read_statistic_readdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `read_statistic_readnum`
--

DROP TABLE IF EXISTS `read_statistic_readnum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `read_statistic_readnum` (
  `id` int NOT NULL AUTO_INCREMENT,
  `read_number` int NOT NULL,
  `object_id` int unsigned NOT NULL,
  `content_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `read_statistic_readn_content_type_id_3010f934_fk_django_co` (`content_type_id`),
  CONSTRAINT `read_statistic_readn_content_type_id_3010f934_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `read_statistic_readnum`
--

LOCK TABLES `read_statistic_readnum` WRITE;
/*!40000 ALTER TABLE `read_statistic_readnum` DISABLE KEYS */;
INSERT INTO `read_statistic_readnum` VALUES (1,19,104,9),(2,1,102,9),(6,10,103,9),(7,3,101,9),(8,1,4,9),(9,3,100,9),(10,1,90,9),(11,2,99,9),(12,4,98,9),(13,1,94,9),(14,1,92,9),(15,1,97,9),(16,1,89,9);
/*!40000 ALTER TABLE `read_statistic_readnum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_myuser`
--

DROP TABLE IF EXISTS `user_myuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `user_myuser` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pretty_name` varchar(20) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_myuser_user_id_220cccf0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_myuser`
--

LOCK TABLES `user_myuser` WRITE;
/*!40000 ALTER TABLE `user_myuser` DISABLE KEYS */;
INSERT INTO `user_myuser` VALUES (1,'黑色天空',1);
/*!40000 ALTER TABLE `user_myuser` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-22 21:50:52
