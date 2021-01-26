-- MySQL dump 10.13  Distrib 8.0.21, for Linux (x86_64)
--
-- Host: std-mysql    Database: std_1205
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('f022c5a734eb');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_categories_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (2,'Математика'),(1,'Программирование'),(3,'Языкознание');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `short_desc` text NOT NULL,
  `full_desc` text NOT NULL,
  `rating_sum` int(11) DEFAULT NULL,
  `rating_num` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `background_image_id` varchar(36) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_courses_author_id_users4` (`author_id`),
  KEY `fk_courses_background_image_id_images` (`background_image_id`),
  KEY `fk_courses_category_id_categories` (`category_id`),
  CONSTRAINT `fk_courses_author_id_users4` FOREIGN KEY (`author_id`) REFERENCES `users4` (`id`),
  CONSTRAINT `fk_courses_background_image_id_images` FOREIGN KEY (`background_image_id`) REFERENCES `images` (`id`),
  CONSTRAINT `fk_courses_category_id_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Линейная и векторная алгебра','Курс по Линейная и векторная алгебра, для студентов 2-го курса ','Математика относится к древним, но вечно юным наукам. Большое количество проблем, стоящих перед людьми, может быть сформулировано в виде математических задач. Целью данного курса является повторение и развитие базовых математических понятий, таких как число, функция, уравнение, векторы и матрицы, а также решение задач, иллюстрирующих эти понятия',3,1,2,'1cee9611-0ce7-41f2-b96f-50a202b3b3c6',1,'2021-01-14 19:06:11','2021-01-14 19:06:11'),(2,'Базовый уровень С++','В этом курсе мы освоим азы одного изи популярнейших языков программирования  ','В этом курсе мы изучит типы переменных в данном языке, его циклы и создание функций. Создадим полноценные программы и алгоритмы.',4,1,1,'327a90d7-4da5-4956-a695-00728faf9260',2,'2021-01-20 10:25:59','2021-01-20 10:25:59'),(3,'Английский язык','Изучим английский с нуля до уровня B1+','Изучим все с самого начал, подтянем грамотность и произношение, вплотную займемся грамматикой.',5,1,3,'b9d3c01f-71e4-4c7c-96c6-fa7fe49e25b6',1,'2021-01-20 11:13:53','2021-01-20 11:13:53');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_images`
--

DROP TABLE IF EXISTS `exam_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_images` (
  `id` varchar(36) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `mime_type` varchar(100) NOT NULL,
  `md5_hash` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `object_type` varchar(100) DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_images`
--

LOCK TABLES `exam_images` WRITE;
/*!40000 ALTER TABLE `exam_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films`
--

DROP TABLE IF EXISTS `films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `films` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `description` text NOT NULL,
  `year` int(11) NOT NULL,
  `country` varchar(50) NOT NULL,
  `director` varchar(50) NOT NULL,
  `actor` varchar(256) NOT NULL,
  `duration` int(11) NOT NULL,
  `genres` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films`
--

LOCK TABLES `films` WRITE;
/*!40000 ALTER TABLE `films` DISABLE KEYS */;
INSERT INTO `films` VALUES (1,'Константи́н: Повелитель тьмы','Джону Константину удалось не только побывать в аду, но и вернуться обратно.',2005,'США','Френсис Лоуренс',' Киану Ривз, Шайа Лабаф ,Чез Чандлер ,Рэйчел Вайс , Тильда Суинтон',121,''),(2,'Гарри Потер и кубок огня','Мальчику-который-выжил предстоит недобровольное участие в Турнире трех волшебников — магическом состязании для учеников трех величайший школ волшебства.',2004,'США','Майк Ньюэлл','Дэниэл Рэдклифф, Эмма Уотсон, Руперт Гринт, Роберт Паттинсон, ',157,''),(3,'Джокер','Американский психологический триллер режиссёра Тодда Филлипса по сценарию, написанному Филлипсом совместно со Скоттом Сильвером. Главную роль исполняет Хоакин Феникс. Сюжет картины является версией предыстории суперзлодея Джокера, одного из ключевых антагонистов Бэтмена в комиксах компании DC Comics.',2019,'США','Тодд Филлипс','Хоакин Феникс (Joaquin Phoenix). Роберт Де Ниро (Robert De Niro). Зази Битц (Zazie Beetz). Фрэнсис Конрой (Frances Conroy). Бретт Каллен (Brett Cullen). Шей Уигэм . Билл Кэмп . Гленн Флешлер . Ли Гилл . Джош Пэйс . Рокко Луна.',139,'');
/*!40000 ALTER TABLE `films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` varchar(36) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `mime_type` varchar(100) NOT NULL,
  `md5_hash` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `object_type` varchar(100) DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_images_md5_hash` (`md5_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES ('1cee9611-0ce7-41f2-b96f-50a202b3b3c6','111.jpg','image/jpeg','6f6467c9e445b9e19371eaaefd0196a3','2021-01-14 19:06:11','courses',1,1),('327a90d7-4da5-4956-a695-00728faf9260','x-1.jpg','image/jpeg','7e8f9e1dd853c10831c1e147b61e693a','2021-01-20 10:25:59','courses',2,1),('b9d3c01f-71e4-4c7c-96c6-fa7fe49e25b6','anglijskom-yazyk-scaled.jpg','image/jpeg','81c803e1f6ab168f782ea158a1691066','2021-01-20 11:13:52','courses',3,1);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `step_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_pages_step_id` (`step_id`),
  CONSTRAINT `fk_pages_step_id_steps` FOREIGN KEY (`step_id`) REFERENCES `steps` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rating` int(11) NOT NULL,
  `text` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `course_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_review_course_id_courses` (`course_id`),
  KEY `fk_review_user_id_users4` (`user_id`),
  CONSTRAINT `fk_review_course_id_courses` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `fk_review_user_id_users4` FOREIGN KEY (`user_id`) REFERENCES `users4` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,3,'Средний курс , могло быть лучше \r\n','2021-01-20 10:16:24',1,2),(2,4,'Курс мне понравился, много полезной информации, но вот домашняя работа слабоватая','2021-01-20 10:38:58',2,1),(3,5,'Курс супер, было очень интересно','2021-01-20 11:14:16',3,1);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles2`
--

DROP TABLE IF EXISTS `roles2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles2`
--

LOCK TABLES `roles2` WRITE;
/*!40000 ALTER TABLE `roles2` DISABLE KEYS */;
INSERT INTO `roles2` VALUES (1,'Администратор',NULL),(2,'Пользователь',NULL),(3,'Модератор',NULL);
/*!40000 ALTER TABLE `roles2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles4`
--

DROP TABLE IF EXISTS `roles4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles4` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `desc` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles4`
--

LOCK TABLES `roles4` WRITE;
/*!40000 ALTER TABLE `roles4` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `steps`
--

DROP TABLE IF EXISTS `steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `steps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_type` varchar(100) NOT NULL,
  `theme_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_steps_theme_id_themes` (`theme_id`),
  CONSTRAINT `fk_steps_theme_id_themes` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `steps`
--

LOCK TABLES `steps` WRITE;
/*!40000 ALTER TABLE `steps` DISABLE KEYS */;
/*!40000 ALTER TABLE `steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `themes`
--

DROP TABLE IF EXISTS `themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_themes_course_id_courses` (`course_id`),
  KEY `fk_themes_parent_id_themes` (`parent_id`),
  CONSTRAINT `fk_themes_course_id_courses` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `fk_themes_parent_id_themes` FOREIGN KEY (`parent_id`) REFERENCES `themes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `themes`
--

LOCK TABLES `themes` WRITE;
/*!40000 ALTER TABLE `themes` DISABLE KEYS */;
INSERT INTO `themes` VALUES (1,'Матрицы и действия над ними',NULL,1),(2,'Линейные операции над матрицами',NULL,1);
/*!40000 ALTER TABLE `themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users2`
--

DROP TABLE IF EXISTS `users2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `middle_name` varchar(25) DEFAULT NULL,
  `password_hash` varchar(256) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users2_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users2`
--

LOCK TABLES `users2` WRITE;
/*!40000 ALTER TABLE `users2` DISABLE KEYS */;
INSERT INTO `users2` VALUES (1,'user','Иванов','Василий ','Иванович','65e84be33532fb784c48129675f9eff3a682b27168c0ea744b2cf58ee02337c5','2020-11-30 09:58:34',2),(31,'123','Петров','Петр','Петров','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','2021-01-19 07:16:53',1),(32,'qqq','Попов','Марк','Петрович','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','2021-01-22 08:50:44',2),(35,'111','Маркова','Мария','Олеговна','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','2021-01-24 16:48:18',3);
/*!40000 ALTER TABLE `users2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users4`
--

DROP TABLE IF EXISTS `users4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users4` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `login` varchar(100) NOT NULL,
  `password_hash` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_users4_login` (`login`),
  KEY `fk_users4_role_id_roles4` (`role_id`),
  CONSTRAINT `fk_users4_role_id_roles4` FOREIGN KEY (`role_id`) REFERENCES `roles4` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users4`
--

LOCK TABLES `users4` WRITE;
/*!40000 ALTER TABLE `users4` DISABLE KEYS */;
INSERT INTO `users4` VALUES (1,'Иванов','Иван',NULL,'user','pbkdf2:sha256:150000$QJV9ktII$02e552f2a99cebfe102edcad47bd2d0f2e7bd8f6263d2e222f56da1ddf368b28','2021-01-13 21:07:44',NULL),(2,'Петров','Петр',NULL,'123','pbkdf2:sha256:150000$HgjRdTME$a8f66be21c2e9ff3e213549dfa623099d070930d087d77fcaaca5b77df70d46e','2021-01-19 21:51:17',NULL);
/*!40000 ALTER TABLE `users4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_logs`
--

DROP TABLE IF EXISTS `visit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visit_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `visit_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=337 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_logs`
--

LOCK TABLES `visit_logs` WRITE;
/*!40000 ALTER TABLE `visit_logs` DISABLE KEYS */;
INSERT INTO `visit_logs` VALUES (1,'/',1,'2021-01-10 08:00:31'),(2,'/static/main.js',1,'2021-01-10 08:00:31'),(3,'/favicon.ico',1,'2021-01-10 08:00:31'),(4,'/',1,'2021-01-10 08:00:36'),(5,'/visits/logs',1,'2021-01-10 08:09:46'),(6,'/',1,'2021-01-10 08:09:55'),(7,'/static/main.js',1,'2021-01-10 08:09:55'),(8,'/auth/logout',1,'2021-01-10 08:09:57'),(9,'/',NULL,'2021-01-10 08:09:57'),(10,'/auth/login',NULL,'2021-01-10 08:09:58'),(11,'/auth/login',NULL,'2021-01-10 08:10:00'),(12,'/',1,'2021-01-10 08:10:00'),(13,'/users',1,'2021-01-10 08:10:01'),(14,'/visits/logs',1,'2021-01-10 08:10:02'),(15,'/visits/logs',1,'2021-01-10 08:11:34'),(16,'/static/main.js',1,'2021-01-10 08:11:35'),(17,'/visits/logs',1,'2021-01-10 08:11:37'),(18,'/visits/logs',1,'2021-01-10 08:11:37'),(19,'/visits/logs',1,'2021-01-10 08:11:38'),(20,'/visits/stat/pages',1,'2021-01-10 08:11:41'),(21,'/visits/stat/users',1,'2021-01-10 08:11:42'),(22,'/visits/stat/pages',1,'2021-01-10 08:11:43'),(23,'/visits/logs',1,'2021-01-10 08:11:43'),(24,'/visits/logs',1,'2021-01-10 08:29:04'),(25,'/visits/stat/pages',1,'2021-01-10 08:35:20'),(26,'/visits/stat/users',1,'2021-01-10 08:35:24'),(27,'/visits/logs',1,'2021-01-10 08:35:28'),(28,'/visits/logs',1,'2021-01-10 09:32:06'),(29,'/visits/stat/pages',1,'2021-01-10 09:32:07'),(30,'/visits/stat/pages',1,'2021-01-10 09:32:09'),(31,'/visits/stat/pages',1,'2021-01-10 09:35:42'),(32,'/visits/stat/users',1,'2021-01-10 09:36:01'),(33,'/visits/stat/pages',1,'2021-01-10 09:36:02'),(34,'/visits/logs',1,'2021-01-10 09:36:06'),(35,'/visits/stat/pages',1,'2021-01-10 09:36:10'),(36,'/',NULL,'2021-01-12 12:13:40'),(37,'/static/main.js',NULL,'2021-01-12 12:13:40'),(38,'/favicon.ico',NULL,'2021-01-12 12:13:41'),(39,'/visits/logs',NULL,'2021-01-12 12:13:42'),(40,'/auth/login',NULL,'2021-01-12 12:13:46'),(41,'/auth/login',NULL,'2021-01-12 13:00:00'),(42,'/auth/login',NULL,'2021-01-12 13:00:02'),(43,'/',1,'2021-01-12 13:00:03'),(44,'/users',1,'2021-01-12 13:00:06'),(45,'/auth/logout',1,'2021-01-12 13:00:09'),(46,'/',NULL,'2021-01-12 13:00:09'),(47,'/auth/login',NULL,'2021-01-12 13:00:11'),(48,'/auth/login',NULL,'2021-01-12 13:00:12'),(49,'/auth/login',NULL,'2021-01-12 13:01:01'),(50,'/',1,'2021-01-12 13:01:01'),(51,'/visits/logs',1,'2021-01-12 13:01:02'),(52,'/users/1',1,'2021-01-12 13:01:07'),(53,'/visits/logs',1,'2021-01-12 13:01:10'),(54,'/',1,'2021-01-12 13:01:12'),(55,'/auth/logout',1,'2021-01-12 13:01:14'),(56,'/',NULL,'2021-01-12 13:01:14'),(57,'/auth/login',NULL,'2021-01-12 13:11:56'),(58,'/auth/login',NULL,'2021-01-12 13:11:58'),(59,'/',1,'2021-01-12 13:11:58'),(60,'/visits/logs',1,'2021-01-12 13:11:59'),(61,'/visits/stat/pages',1,'2021-01-12 13:12:00'),(62,'/visits/stat/users',1,'2021-01-12 13:12:01'),(63,'/visits/stat/users',1,'2021-01-12 13:12:03'),(64,'/visits/stat/users',1,'2021-01-12 13:12:11'),(65,'/users',1,'2021-01-12 13:12:50'),(66,'/users/1/edit',1,'2021-01-12 13:13:00'),(67,'/users/1/edit',1,'2021-01-12 13:13:34'),(68,'/users',1,'2021-01-12 13:13:37'),(69,'/users',1,'2021-01-12 13:13:45'),(70,'/users/1/edit',1,'2021-01-12 13:13:50'),(71,'/',1,'2021-01-12 13:13:57'),(72,'/users',1,'2021-01-12 13:14:00'),(73,'/users/1/edit',1,'2021-01-12 13:14:02'),(74,'/users/1/update',1,'2021-01-12 13:14:08'),(75,'/users',1,'2021-01-12 13:14:08'),(76,'/users/1/edit',1,'2021-01-12 13:14:15'),(77,'/users/1/update',1,'2021-01-12 13:14:17'),(78,'/users',1,'2021-01-12 13:14:17'),(79,'/visits/logs',1,'2021-01-12 13:23:01'),(80,'/visits/stat/pages',1,'2021-01-12 13:23:02'),(81,'/visits/logs',1,'2021-01-12 13:23:04'),(82,'/',NULL,'2021-01-20 16:18:57'),(83,'/favicon.ico',NULL,'2021-01-20 16:18:57'),(84,'/users',NULL,'2021-01-20 16:18:59'),(85,'/visits/logs',NULL,'2021-01-20 16:19:00'),(86,'/auth/login',NULL,'2021-01-20 16:19:01'),(87,'/visits/logs',NULL,'2021-01-20 16:19:01'),(88,'/visits/stat/pages',NULL,'2021-01-20 16:19:04'),(89,'/visits/stat/users',NULL,'2021-01-20 16:19:05'),(90,'/visits/logs',NULL,'2021-01-20 16:19:05'),(91,'/visits/stat/pages',NULL,'2021-01-20 16:19:07'),(92,'/visits/stat/users',NULL,'2021-01-20 16:19:07'),(93,'/users',NULL,'2021-01-20 16:19:09'),(94,'/auth/login',NULL,'2021-01-20 16:19:11'),(95,'/auth/login',NULL,'2021-01-20 16:19:16'),(96,'/',1,'2021-01-20 16:19:16'),(97,'/visits/logs',1,'2021-01-20 16:19:20'),(98,'/users',1,'2021-01-20 16:19:21'),(99,'/auth/logout',1,'2021-01-20 16:19:34'),(100,'/',NULL,'2021-01-20 16:19:34'),(101,'/auth/login',NULL,'2021-01-20 16:19:36'),(102,'/auth/login',NULL,'2021-01-20 16:19:40'),(103,'/auth/login',NULL,'2021-01-20 16:19:43'),(104,'/auth/login',NULL,'2021-01-20 16:19:45'),(105,'/',1,'2021-01-20 16:19:45'),(106,'/visits/logs',1,'2021-01-20 16:19:46'),(107,'/users',1,'2021-01-20 16:19:47'),(108,'/users/31',1,'2021-01-20 16:19:48'),(109,'/auth/logout',1,'2021-01-20 16:19:51'),(110,'/',NULL,'2021-01-20 16:19:52'),(111,'/auth/login',NULL,'2021-01-20 16:19:53'),(112,'/auth/login',NULL,'2021-01-20 16:19:57'),(113,'/',31,'2021-01-20 16:19:57'),(114,'/visits/logs',31,'2021-01-20 16:19:58'),(115,'/users',31,'2021-01-20 16:19:59'),(116,'/users/31',31,'2021-01-20 16:20:03'),(117,'/users/31/edit',31,'2021-01-20 16:20:05'),(118,'/users/31/update',31,'2021-01-20 16:20:08'),(119,'/users',31,'2021-01-20 16:20:08'),(120,'/users/31',31,'2021-01-20 16:20:11'),(121,'/users',31,'2021-01-20 16:20:13'),(122,'/users/31/edit',31,'2021-01-20 16:20:13'),(123,'/users/31/edit',31,'2021-01-20 16:20:18'),(124,'/auth/logout',31,'2021-01-20 16:20:23'),(125,'/',NULL,'2021-01-20 16:20:23'),(126,'/users',NULL,'2021-01-20 16:30:46'),(127,'/visits/logs',NULL,'2021-01-20 16:30:47'),(128,'/auth/login',NULL,'2021-01-20 16:30:49'),(129,'/users',NULL,'2021-01-20 16:30:50'),(130,'/',NULL,'2021-01-20 17:01:50'),(131,'/auth/login',NULL,'2021-01-20 17:01:54'),(132,'/auth/login',NULL,'2021-01-20 17:01:59'),(133,'/auth/login',NULL,'2021-01-20 17:02:03'),(134,'/',NULL,'2021-01-20 17:03:44'),(135,'/visits/logs',NULL,'2021-01-20 17:03:46'),(136,'/auth/login',NULL,'2021-01-20 17:03:50'),(137,'/auth/login',NULL,'2021-01-20 17:03:51'),(138,'/',NULL,'2021-01-20 17:10:40'),(139,'/auth/login',NULL,'2021-01-20 17:10:42'),(140,'/auth/login',NULL,'2021-01-20 17:10:43'),(141,'/auth/login',NULL,'2021-01-20 17:12:19'),(142,'/',NULL,'2021-01-20 17:13:04'),(143,'/users',NULL,'2021-01-20 17:13:06'),(144,'/visits/logs',NULL,'2021-01-20 17:13:07'),(145,'/auth/login',NULL,'2021-01-20 17:13:12'),(146,'/auth/login',NULL,'2021-01-20 17:13:16'),(147,'/auth/login',NULL,'2021-01-20 17:14:51'),(148,'/',NULL,'2021-01-20 17:17:13'),(149,'/auth/login',NULL,'2021-01-20 17:17:15'),(150,'/auth/login',NULL,'2021-01-20 17:17:16'),(151,'/',NULL,'2021-01-20 17:20:47'),(152,'/auth/login',NULL,'2021-01-20 17:20:48'),(153,'/auth/login',NULL,'2021-01-20 17:20:49'),(154,'/',1,'2021-01-20 17:20:49'),(155,'/visits/logs',1,'2021-01-20 17:20:51'),(156,'/visits/stat/pages',1,'2021-01-20 17:20:53'),(157,'/visits/stat/users',1,'2021-01-20 17:20:53'),(158,'/visits/logs',1,'2021-01-20 17:20:54'),(159,'/secret_page',1,'2021-01-20 17:20:54'),(160,'/secret_page',1,'2021-01-20 17:21:02'),(161,'/visits/logs',1,'2021-01-20 17:21:03'),(162,'/secret_page',1,'2021-01-20 17:21:04'),(163,'/visits/logs',1,'2021-01-20 17:21:08'),(164,'/visits/stat/pages',1,'2021-01-20 17:21:09'),(165,'/visits/stat/users',1,'2021-01-20 17:21:10'),(166,'/users',1,'2021-01-20 17:22:47'),(167,'/users/31/edit',1,'2021-01-20 17:22:50'),(168,'/users/31/update',1,'2021-01-20 17:22:52'),(169,'/users',1,'2021-01-20 17:22:52'),(170,'/auth/logout',1,'2021-01-20 17:22:56'),(171,'/',NULL,'2021-01-20 17:22:56'),(172,'/auth/login',NULL,'2021-01-20 17:22:58'),(173,'/auth/login',NULL,'2021-01-20 17:23:02'),(174,'/',31,'2021-01-20 17:23:02'),(175,'/visits/logs',31,'2021-01-20 17:23:03'),(176,'/users',31,'2021-01-20 17:23:05'),(177,'/users/31/edit',31,'2021-01-20 17:23:07'),(178,'/visits/logs',31,'2021-01-20 17:23:12'),(179,'/users',31,'2021-01-20 17:23:12'),(180,'/users/31',31,'2021-01-20 17:28:54'),(181,'/users/31',31,'2021-01-20 17:35:29'),(182,'/users',31,'2021-01-20 17:35:31'),(183,'/users',31,'2021-01-20 17:35:35'),(184,'/users',31,'2021-01-20 17:35:37'),(185,'/visits/logs',31,'2021-01-20 17:35:38'),(186,'/secret_page',31,'2021-01-20 17:35:40'),(187,'/secret_page',31,'2021-01-20 17:35:41'),(188,'/visits/logs',31,'2021-01-20 17:35:43'),(189,'/users',31,'2021-01-20 17:35:43'),(190,'/users',31,'2021-01-20 17:45:29'),(191,'/secret_page',31,'2021-01-20 17:45:30'),(192,'/',NULL,'2021-01-21 10:07:10'),(193,'/static/main.js',NULL,'2021-01-21 10:07:10'),(194,'/favicon.ico',NULL,'2021-01-21 10:07:11'),(195,'/users',NULL,'2021-01-21 10:07:12'),(196,'/auth/login',NULL,'2021-01-21 10:07:13'),(197,'/auth/login',NULL,'2021-01-21 10:07:15'),(198,'/',1,'2021-01-21 10:07:15'),(199,'/auth/login',1,'2021-01-21 10:07:21'),(200,'/auth/login',1,'2021-01-21 10:07:24'),(201,'/auth/login',1,'2021-01-21 10:08:58'),(202,'/',1,'2021-01-21 10:10:46'),(203,'/',1,'2021-01-21 10:10:48'),(204,'/',1,'2021-01-21 10:12:32'),(205,'/',1,'2021-01-21 10:13:38'),(206,'/',1,'2021-01-21 10:17:19'),(207,'/',1,'2021-01-21 10:18:24'),(208,'/',1,'2021-01-21 10:18:24'),(209,'/',1,'2021-01-21 10:18:24'),(210,'/',1,'2021-01-21 10:18:24'),(211,'/',1,'2021-01-21 10:18:25'),(212,'/',1,'2021-01-21 10:18:25'),(213,'/',1,'2021-01-21 10:18:25'),(214,'/',1,'2021-01-21 10:23:55'),(215,'/',1,'2021-01-21 10:27:05'),(216,'/auth/logout',1,'2021-01-21 10:27:09'),(217,'/',NULL,'2021-01-21 10:27:09'),(218,'/auth/login',NULL,'2021-01-21 10:27:09'),(219,'/auth/login',NULL,'2021-01-21 10:27:11'),(220,'/',1,'2021-01-21 10:27:11'),(221,'/visits/logs',1,'2021-01-21 10:27:12'),(222,'/users',1,'2021-01-21 10:27:13'),(223,'/secret_page',1,'2021-01-21 10:27:14'),(224,'/secret_page',1,'2021-01-21 10:28:32'),(225,'/visits/logs',1,'2021-01-21 10:28:33'),(226,'/users',1,'2021-01-21 10:28:33'),(227,'/auth/logout',1,'2021-01-21 10:28:35'),(228,'/',NULL,'2021-01-21 10:28:35'),(229,'/auth/login',NULL,'2021-01-21 10:28:36'),(230,'/auth/login',NULL,'2021-01-21 10:28:38'),(231,'/',1,'2021-01-21 10:28:38'),(232,'/secret_page',1,'2021-01-21 10:28:40'),(233,'/visits/logs',1,'2021-01-21 10:28:41'),(234,'/users',1,'2021-01-21 10:28:43'),(235,'/',1,'2021-01-21 10:29:59'),(236,'/visits/logs',1,'2021-01-21 10:32:08'),(237,'/',1,'2021-01-21 10:32:36'),(238,'/visits/logs',1,'2021-01-21 10:32:38'),(239,'/users',1,'2021-01-21 10:32:38'),(240,'/secret_page',1,'2021-01-21 10:32:39'),(241,'/users',1,'2021-01-21 10:32:49'),(242,'/users',1,'2021-01-21 10:33:29'),(243,'/visits/logs',1,'2021-01-21 10:33:30'),(244,'/secret_page',1,'2021-01-21 10:33:31'),(245,'/visits/logs',1,'2021-01-21 10:36:51'),(246,'/secret_page',1,'2021-01-21 10:36:52'),(247,'/',1,'2021-01-21 11:07:01'),(248,'/secret_page',1,'2021-01-21 11:07:03'),(249,'/',1,'2021-01-21 11:09:04'),(250,'/secret_page',1,'2021-01-21 11:09:05'),(251,'/visits/logs',1,'2021-01-21 11:09:26'),(252,'/auth/logout',1,'2021-01-21 11:09:28'),(253,'/',NULL,'2021-01-21 11:09:28'),(254,'/auth/login',NULL,'2021-01-21 11:09:29'),(255,'/auth/login',NULL,'2021-01-21 11:09:30'),(256,'/',1,'2021-01-21 11:09:30'),(257,'/users',1,'2021-01-21 11:09:32'),(258,'/visits/logs',1,'2021-01-21 11:09:34'),(259,'/secret_page',1,'2021-01-21 11:09:35'),(260,'/',1,'2021-01-21 11:10:07'),(261,'/secret_page',1,'2021-01-21 11:10:08'),(262,'/secret_page',1,'2021-01-21 11:11:19'),(263,'/',NULL,'2021-01-21 12:42:03'),(264,'/favicon.ico',NULL,'2021-01-21 12:42:03'),(265,'/',NULL,'2021-01-21 12:43:34'),(266,'/',NULL,'2021-01-21 12:44:32'),(267,'/',NULL,'2021-01-21 12:46:48'),(268,'/',NULL,'2021-01-21 12:48:36'),(269,'/',NULL,'2021-01-21 12:50:25'),(270,'/',NULL,'2021-01-21 12:51:53'),(271,'/',NULL,'2021-01-21 12:52:55'),(272,'/auth/login',NULL,'2021-01-21 12:52:57'),(273,'/auth/login',NULL,'2021-01-21 12:52:58'),(274,'/',1,'2021-01-21 12:52:58'),(275,'/secret_page',1,'2021-01-21 12:52:59'),(276,'/',1,'2021-01-21 12:54:26'),(277,'/secret_page',1,'2021-01-21 12:54:28'),(278,'/users',1,'2021-01-21 12:54:30'),(279,'/users/1',1,'2021-01-21 12:54:31'),(280,'/secret_page',1,'2021-01-21 12:54:34'),(281,'/',1,'2021-01-21 12:55:33'),(282,'/secret_page',1,'2021-01-21 12:55:35'),(283,'/auth/logout',1,'2021-01-21 12:58:46'),(284,'/',NULL,'2021-01-21 12:58:46'),(285,'/auth/login',NULL,'2021-01-21 12:58:48'),(286,'/auth/login',NULL,'2021-01-21 12:58:52'),(287,'/auth/login',NULL,'2021-01-21 12:58:55'),(288,'/',1,'2021-01-21 12:58:55'),(289,'/secret_page',1,'2021-01-21 12:58:56'),(290,'/',1,'2021-01-21 12:58:58'),(291,'/users',1,'2021-01-21 12:59:00'),(292,'/users/31',1,'2021-01-21 12:59:07'),(293,'/auth/logout',1,'2021-01-21 12:59:16'),(294,'/',NULL,'2021-01-21 12:59:16'),(295,'/auth/login',NULL,'2021-01-21 12:59:17'),(296,'/auth/login',NULL,'2021-01-21 12:59:24'),(297,'/',31,'2021-01-21 12:59:24'),(298,'/users',31,'2021-01-21 12:59:25'),(299,'/users/31',31,'2021-01-21 12:59:27'),(300,'/users/31/edit',31,'2021-01-21 12:59:29'),(301,'/users',31,'2021-01-21 12:59:37'),(302,'/users',31,'2021-01-21 12:59:39'),(303,'/secret_page',31,'2021-01-21 12:59:40'),(304,'/auth/logout',31,'2021-01-21 12:59:45'),(305,'/',NULL,'2021-01-21 12:59:45'),(306,'/auth/login',NULL,'2021-01-21 12:59:46'),(307,'/auth/login',NULL,'2021-01-21 12:59:50'),(308,'/',1,'2021-01-21 12:59:50'),(309,'/secret_page',1,'2021-01-21 12:59:54'),(310,'/',1,'2021-01-21 12:59:55'),(311,'/',1,'2021-01-21 13:06:57'),(312,'/secret_page',1,'2021-01-21 13:06:59'),(313,'/users',1,'2021-01-21 13:07:02'),(314,'/users/1',1,'2021-01-21 13:07:06'),(315,'/users/1/edit',1,'2021-01-21 13:07:08'),(316,'/users',NULL,'2021-01-21 13:18:28'),(317,'/favicon.ico',NULL,'2021-01-21 13:18:28'),(318,'/',NULL,'2021-01-21 13:18:31'),(319,'/',NULL,'2021-01-21 13:21:05'),(320,'/auth/login',NULL,'2021-01-21 13:21:07'),(321,'/auth/login',NULL,'2021-01-21 13:21:08'),(322,'/',1,'2021-01-21 13:21:08'),(323,'/secret_page',1,'2021-01-21 13:21:10'),(324,'/',1,'2021-01-21 13:21:11'),(325,'/secret_page',1,'2021-01-21 13:21:16'),(326,'/',NULL,'2021-01-21 14:24:54'),(327,'/favicon.ico',NULL,'2021-01-21 14:24:54'),(328,'/',NULL,'2021-01-21 14:28:13'),(329,'/',NULL,'2021-01-21 18:42:53'),(330,'/',NULL,'2021-01-22 08:22:06'),(331,'/favicon.ico',NULL,'2021-01-22 08:22:06'),(332,'/',32,'2021-01-23 12:31:44'),(333,'/',32,'2021-01-23 12:33:16'),(334,'/visits/logs',32,'2021-01-23 12:33:17'),(335,'/users',32,'2021-01-23 12:33:18'),(336,'/',32,'2021-01-23 12:33:18');
/*!40000 ALTER TABLE `visit_logs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-26 16:05:03
