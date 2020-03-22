-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: papeleriasoporte
-- ------------------------------------------------------
-- Server version	5.7.26-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add usuario',7,'add_usuario'),(26,'Can change usuario',7,'change_usuario'),(27,'Can delete usuario',7,'delete_usuario'),(28,'Can view usuario',7,'view_usuario'),(29,'Can add category',8,'add_category'),(30,'Can change category',8,'change_category'),(31,'Can delete category',8,'delete_category'),(32,'Can view category',8,'view_category'),(33,'Can add client',9,'add_client'),(34,'Can change client',9,'change_client'),(35,'Can delete client',9,'delete_client'),(36,'Can view client',9,'view_client'),(37,'Can add item',10,'add_item'),(38,'Can change item',10,'change_item'),(39,'Can delete item',10,'delete_item'),(40,'Can view item',10,'view_item'),(41,'Can add owner',11,'add_owner'),(42,'Can change owner',11,'change_owner'),(43,'Can delete owner',11,'delete_owner'),(44,'Can view owner',11,'view_owner'),(45,'Can add user',7,'add_user'),(46,'Can change user',7,'change_user'),(47,'Can delete user',7,'delete_user'),(48,'Can view user',7,'view_user'),(49,'Can add shopping cart',12,'add_shoppingcart'),(50,'Can change shopping cart',12,'change_shoppingcart'),(51,'Can delete shopping cart',12,'delete_shoppingcart'),(52,'Can view shopping cart',12,'view_shoppingcart'),(53,'Can add paper store',13,'add_paperstore'),(54,'Can change paper store',13,'change_paperstore'),(55,'Can delete paper store',13,'delete_paperstore'),(56,'Can view paper store',13,'view_paperstore');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'Papeleria','category'),(9,'Papeleria','client'),(10,'Papeleria','item'),(11,'Papeleria','owner'),(13,'Papeleria','paperstore'),(12,'Papeleria','shoppingcart'),(7,'Papeleria','user'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'Papeleria','0001_initial','2020-03-21 19:27:06.197298'),(2,'contenttypes','0001_initial','2020-03-21 19:27:06.289205'),(3,'auth','0001_initial','2020-03-21 19:27:06.539344'),(4,'admin','0001_initial','2020-03-21 19:27:07.316822'),(5,'admin','0002_logentry_remove_auto_add','2020-03-21 19:27:07.508676'),(6,'admin','0003_logentry_add_action_flag_choices','2020-03-21 19:27:07.520672'),(7,'contenttypes','0002_remove_content_type_name','2020-03-21 19:27:07.682906'),(8,'auth','0002_alter_permission_name_max_length','2020-03-21 19:27:07.767893'),(9,'auth','0003_alter_user_email_max_length','2020-03-21 19:27:07.790252'),(10,'auth','0004_alter_user_username_opts','2020-03-21 19:27:07.812869'),(11,'auth','0005_alter_user_last_login_null','2020-03-21 19:27:07.899011'),(12,'auth','0006_require_contenttypes_0002','2020-03-21 19:27:07.904627'),(13,'auth','0007_alter_validators_add_error_messages','2020-03-21 19:27:07.915621'),(14,'auth','0008_alter_user_username_max_length','2020-03-21 19:27:08.100020'),(15,'auth','0009_alter_user_last_name_max_length','2020-03-21 19:27:08.203276'),(16,'auth','0010_alter_group_name_max_length','2020-03-21 19:27:08.230033'),(17,'auth','0011_update_proxy_permissions','2020-03-21 19:27:08.240800'),(18,'sessions','0001_initial','2020-03-21 19:27:08.294392'),(19,'Papeleria','0002_auto_20200321_1401','2020-03-21 20:01:37.866977'),(20,'Papeleria','0003_user_user_type','2020-03-21 21:46:42.525799'),(21,'Papeleria','0004_auto_20200321_1923','2020-03-22 01:23:32.910402'),(22,'Papeleria','0005_auto_20200321_2308','2020-03-22 05:08:59.137874');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('ai8veelen14hybu0voq0k7xff6ivor2h','OTBlMDMyODkwODkwMjA2YzIyYTQzZjJkNWJkOTY4MWYyNjFjMDdhMzp7ImlkX3VzZXIiOjJ9','2020-04-04 22:54:40.637549'),('lsvhnt313qnkwk8aektzhjg5rnf4brcr','NzE2NzQ1NGM1YjI4NTUyZTQ4NzQwYzk1Y2ViNDIzMGFiYWU5ZDU5Yzp7InR5cGVfdXNlciI6MiwiaWRfdXNlciI6NCwic2hvcHBpbmdfY2FydCI6W119','2020-04-05 20:10:40.089762');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `papeleria_category`
--

DROP TABLE IF EXISTS `papeleria_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `papeleria_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `image_category` varchar(100) NOT NULL,
  `id_owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Papeleria_category_id_owner_id_4aeb3633_fk_Papeleria_owner_id` (`id_owner_id`),
  CONSTRAINT `Papeleria_category_id_owner_id_4aeb3633_fk_Papeleria_owner_id` FOREIGN KEY (`id_owner_id`) REFERENCES `papeleria_owner` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `papeleria_category`
--

LOCK TABLES `papeleria_category` WRITE;
/*!40000 ALTER TABLE `papeleria_category` DISABLE KEYS */;
INSERT INTO `papeleria_category` VALUES (1,'Lapices','Papeleria/static/Category/Captura_de_pantalla_2018-11-16_a_la_s_02.04.16_800x_Hk0AQ9t.png',2),(2,'Gomas','Papeleria/static/Category/descargar.jfif',2),(3,'sacapuntas','Papeleria/static/Category/220px-Sacapuntametalico.gif',2);
/*!40000 ALTER TABLE `papeleria_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `papeleria_client`
--

DROP TABLE IF EXISTS `papeleria_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `papeleria_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` longtext NOT NULL,
  `id_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Papeleria_client_id_user_id_966f8938_fk_Papeleria_user_id` (`id_user_id`),
  CONSTRAINT `Papeleria_client_id_user_id_966f8938_fk_Papeleria_user_id` FOREIGN KEY (`id_user_id`) REFERENCES `papeleria_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `papeleria_client`
--

LOCK TABLES `papeleria_client` WRITE;
/*!40000 ALTER TABLE `papeleria_client` DISABLE KEYS */;
INSERT INTO `papeleria_client` VALUES (1,'Sin direccion',4);
/*!40000 ALTER TABLE `papeleria_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `papeleria_item`
--

DROP TABLE IF EXISTS `papeleria_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `papeleria_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `price` double NOT NULL,
  `inventory` int(11) NOT NULL,
  `image_item` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL,
  `id_paper_store_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Papeleria_item_category_id_7af3df7a_fk_Papeleria_category_id` (`category_id`),
  KEY `Papeleria_item_id_paper_store_id_adc13941_fk_Papeleria` (`id_paper_store_id`),
  CONSTRAINT `Papeleria_item_category_id_7af3df7a_fk_Papeleria_category_id` FOREIGN KEY (`category_id`) REFERENCES `papeleria_category` (`id`),
  CONSTRAINT `Papeleria_item_id_paper_store_id_adc13941_fk_Papeleria` FOREIGN KEY (`id_paper_store_id`) REFERENCES `papeleria_paperstore` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `papeleria_item`
--

LOCK TABLES `papeleria_item` WRITE;
/*!40000 ALTER TABLE `papeleria_item` DISABLE KEYS */;
INSERT INTO `papeleria_item` VALUES (1,'Lápiz','Lápiz del número 2 color amarillo',5,25,'Papeleria/static/Item/Captura_de_pantalla_2018-11-16_a_la_s_02.04.16_800x_RKxPY1V.png',2,1),(2,'Goma','Goma de migaja',3,0,'Papeleria/static/Item/descargar.jfif',2,1),(3,'Goma','Goma de migaja',5,3,'Papeleria/static/Item/descargar_NuYf79Y.jfif',2,1);
/*!40000 ALTER TABLE `papeleria_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `papeleria_owner`
--

DROP TABLE IF EXISTS `papeleria_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `papeleria_owner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Papeleria_owner_id_user_id_7cd140a1_fk_Papeleria_user_id` (`id_user_id`),
  CONSTRAINT `Papeleria_owner_id_user_id_7cd140a1_fk_Papeleria_user_id` FOREIGN KEY (`id_user_id`) REFERENCES `papeleria_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `papeleria_owner`
--

LOCK TABLES `papeleria_owner` WRITE;
/*!40000 ALTER TABLE `papeleria_owner` DISABLE KEYS */;
INSERT INTO `papeleria_owner` VALUES (2,3);
/*!40000 ALTER TABLE `papeleria_owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `papeleria_paperstore`
--

DROP TABLE IF EXISTS `papeleria_paperstore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `papeleria_paperstore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` longtext NOT NULL,
  `description` longtext NOT NULL,
  `name` varchar(100) NOT NULL,
  `image_paper` varchar(100) NOT NULL,
  `id_owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Papeleria_paperstore_id_owner_id_516227ee_fk_Papeleria_owner_id` (`id_owner_id`),
  CONSTRAINT `Papeleria_paperstore_id_owner_id_516227ee_fk_Papeleria_owner_id` FOREIGN KEY (`id_owner_id`) REFERENCES `papeleria_owner` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `papeleria_paperstore`
--

LOCK TABLES `papeleria_paperstore` WRITE;
/*!40000 ALTER TABLE `papeleria_paperstore` DISABLE KEYS */;
INSERT INTO `papeleria_paperstore` VALUES (1,'Calle tal numero tal colonia tal estado tal','Esta es una papelería','Papelería 1','Papeleria/static/PaperStore/papeleria_.jpg',2);
/*!40000 ALTER TABLE `papeleria_paperstore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `papeleria_shoppingcart`
--

DROP TABLE IF EXISTS `papeleria_shoppingcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `papeleria_shoppingcart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number_of_item` int(11) NOT NULL,
  `id_client_id` int(11) NOT NULL,
  `id_item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Papeleria_shoppingca_id_client_id_ddc38dcc_fk_Papeleria` (`id_client_id`),
  KEY `Papeleria_shoppingcart_id_item_id_2cfc740c_fk_Papeleria_item_id` (`id_item_id`),
  CONSTRAINT `Papeleria_shoppingca_id_client_id_ddc38dcc_fk_Papeleria` FOREIGN KEY (`id_client_id`) REFERENCES `papeleria_client` (`id`),
  CONSTRAINT `Papeleria_shoppingcart_id_item_id_2cfc740c_fk_Papeleria_item_id` FOREIGN KEY (`id_item_id`) REFERENCES `papeleria_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `papeleria_shoppingcart`
--

LOCK TABLES `papeleria_shoppingcart` WRITE;
/*!40000 ALTER TABLE `papeleria_shoppingcart` DISABLE KEYS */;
INSERT INTO `papeleria_shoppingcart` VALUES (1,1,1,1),(2,1,1,1),(3,1,1,1),(4,1,1,1),(5,1,1,1),(6,1,1,1),(7,1,1,2),(8,1,1,2),(9,1,1,2);
/*!40000 ALTER TABLE `papeleria_shoppingcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `papeleria_user`
--

DROP TABLE IF EXISTS `papeleria_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `papeleria_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(150) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `user_type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `papeleria_user`
--

LOCK TABLES `papeleria_user` WRITE;
/*!40000 ALTER TABLE `papeleria_user` DISABLE KEYS */;
INSERT INTO `papeleria_user` VALUES (3,'eduag161@gmail.com','Nomore223856220','Eduardo Albino',1),(4,'ealbinog1700@alumno.ipn.mx','Nomore112745110','Eduardo Albino Garcia',2);
/*!40000 ALTER TABLE `papeleria_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-22 14:14:13
