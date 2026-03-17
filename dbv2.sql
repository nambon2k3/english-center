-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: englishcenter
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `class_schedules`
--

DROP TABLE IF EXISTS `class_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_schedules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `class_id` int DEFAULT NULL,
  `day_of_week` int NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_schedules`
--

LOCK TABLES `class_schedules` WRITE;
/*!40000 ALTER TABLE `class_schedules` DISABLE KEYS */;
INSERT INTO `class_schedules` VALUES (1,11,1,'06:53:00','13:53:00','2026-03-17 22:25:55','2026-03-17 23:53:22',0),(2,11,3,'08:00:00','10:00:00','2026-03-17 22:25:55','2026-03-17 22:25:55',0),(3,11,5,'08:00:00','10:00:00','2026-03-17 22:25:55','2026-03-17 23:35:37',1),(7,11,5,'18:39:00','22:39:00','2026-03-17 23:40:03','2026-03-17 23:40:03',0);
/*!40000 ALTER TABLE `class_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(100) NOT NULL,
  `level_id` int DEFAULT NULL,
  `teacher_id` int DEFAULT NULL,
  `tuition_fee` decimal(10,2) DEFAULT NULL,
  `max_students` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) DEFAULT '0',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'Basic English Communication',1,13,1100000.00,25,'2026-04-01','2026-06-30','2026-03-15 12:22:57',0,'2026-03-15 12:29:13'),(2,'English for Daily Conversation',1,14,1100000.00,25,'2026-04-03','2026-07-03','2026-03-15 12:22:57',0,'2026-03-15 12:29:13'),(3,'Elementary Grammar and Speaking',2,13,1300000.00,25,'2026-04-10','2026-07-10','2026-03-15 12:22:57',0,'2026-03-15 12:29:13'),(4,'Listening and Speaking Fundamentals',2,14,1300000.00,25,'2026-04-12','2026-07-12','2026-03-15 12:22:57',0,'2026-03-15 12:29:13'),(5,'Intermediate English Communication',3,13,1500000.00,25,'2026-04-15','2026-07-15','2026-03-15 12:22:57',0,'2026-03-15 12:29:13'),(6,'TOEIC Preparation Course',3,14,1500000.00,25,'2026-04-18','2026-07-18','2026-03-15 12:22:57',0,'2026-03-15 12:29:13'),(7,'Business English Communication',4,13,1700000.00,20,'2026-04-20','2026-07-20','2026-03-15 12:22:57',0,'2026-03-15 12:29:13'),(8,'Public Speaking in English',4,14,1700000.00,20,'2026-04-22','2026-07-22','2026-03-15 12:22:57',0,'2026-03-15 12:29:13'),(9,'IELTS Preparation 6.0+',5,13,2200000.00,18,'2026-05-01','2026-08-01','2026-03-15 12:22:57',0,'2026-03-15 12:29:13'),(10,'Advanced English for Academic Purposes',5,14,2200000.00,18,'2026-05-05','2026-08-05','2026-03-15 12:22:57',0,'2026-03-15 12:29:13'),(11,'New hehehe2',1,14,1000000.00,12,'2026-03-16','2026-03-17','2026-03-15 13:10:05',1,'2026-03-15 13:24:08');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  `enrolled_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(20) DEFAULT 'ACTIVE',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` int DEFAULT '0',
  `paid` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `unique_student_class` (`student_id`,`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollments`
--

LOCK TABLES `enrollments` WRITE;
/*!40000 ALTER TABLE `enrollments` DISABLE KEYS */;
INSERT INTO `enrollments` VALUES (13,25,11,'2026-03-17 15:04:18','ACTIVE','2026-03-17 22:04:18','2026-03-17 22:04:18',0,0),(14,16,11,'2026-03-17 15:04:18','ACTIVE','2026-03-17 22:04:18','2026-03-17 22:04:18',0,0),(15,17,11,'2026-03-17 15:04:18','ACTIVE','2026-03-17 22:04:18','2026-03-17 22:04:18',0,0),(16,18,11,'2026-03-17 15:04:18','ACTIVE','2026-03-17 22:04:18','2026-03-17 22:04:18',0,0),(17,19,11,'2026-03-17 15:04:18','ACTIVE','2026-03-17 22:04:18','2026-03-17 22:04:18',0,0),(18,20,11,'2026-03-17 15:04:18','ACTIVE','2026-03-17 22:04:18','2026-03-17 22:04:18',0,0),(19,21,11,'2026-03-17 15:04:18','ACTIVE','2026-03-17 22:04:18','2026-03-17 22:04:18',0,0),(20,22,11,'2026-03-17 15:04:18','ACTIVE','2026-03-17 22:04:18','2026-03-17 22:04:18',0,0),(21,23,11,'2026-03-17 15:04:18','ACTIVE','2026-03-17 22:04:18','2026-03-17 22:04:18',0,0),(22,24,11,'2026-03-17 15:04:18','ACTIVE','2026-03-17 22:04:18','2026-03-17 22:04:18',0,0),(23,15,11,'2026-03-17 15:04:18','ACTIVE','2026-03-17 22:04:18','2026-03-17 22:04:18',0,0),(24,28,11,'2026-03-17 16:06:00','ACTIVE','2026-03-17 23:06:00','2026-03-17 23:06:00',0,0),(25,29,11,'2026-03-17 16:06:44','ACTIVE','2026-03-17 23:06:44','2026-03-17 23:26:48',0,0);
/*!40000 ALTER TABLE `enrollments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `levels`
--

DROP TABLE IF EXISTS `levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `levels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `level_name` varchar(50) NOT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` VALUES (1,'Beginner','Basic level for students who are new to the subject','2026-03-15 12:28:54','2026-03-15 12:28:54',0),(2,'Elementary','Students understand simple concepts and vocabulary','2026-03-15 12:28:54','2026-03-15 12:28:54',0),(3,'Intermediate','Students can communicate and understand common topics','2026-03-15 12:28:54','2026-03-15 12:28:54',0),(4,'Upper Intermediate','Students have good communication skills','2026-03-15 12:28:54','2026-03-15 12:28:54',0),(5,'Advanced','Students can use the language fluently and accurately','2026-03-15 12:28:54','2026-03-15 12:28:54',0);
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `enrollment_id` int DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_status` varchar(20) DEFAULT 'UNPAID',
  `payment_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `enrollment_id` (`enrollment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ADMIN'),(3,'STUDENT'),(2,'TEACHER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `full_name` varchar(100) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` text,
  `role_id` int DEFAULT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) DEFAULT '0',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `phone` (`phone`),
  KEY `fk_users_role` (`role_id`),
  CONSTRAINT `fk_users_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (12,'admin','123456','System Administrator','1990-01-01','0900000001','admin@englishcenter.com','Hanoi',1,NULL,'2026-03-12 14:47:08',0,'2026-03-15 08:01:24'),(13,'teacher1','123456','John Smith','1985-05-12','0900000002','john.smith@englishcenter.com','Hanoi',2,'IELTS','2026-03-12 14:47:08',0,'2026-03-15 08:01:24'),(14,'teacher2','123456','Emily Johnson','1988-09-22','0900000003','emily.johnson@englishcenter.com','Hanoi',2,'TOEIC','2026-03-12 14:47:08',0,'2026-03-15 08:01:24'),(15,'namnguyen03','hashed_password','Nguyễn Viết Hoài Nam','2003-08-24','0912345678','nam.nguyen03@gmail.com','Hoàn Kiếm, Hà Nội',3,'Java Backend','2026-03-14 15:58:10',0,'2026-03-15 08:01:24'),(16,'minhtran02','hashed_password','Trần Minh Đức','2002-05-14','0912345679','minh.tran02@gmail.com','Cầu Giấy, Hà Nội',3,'Frontend Development','2026-03-14 15:58:10',0,'2026-03-15 08:01:24'),(17,'linhpham04','hashed_password','Phạm Thùy Linh','2004-03-19','0912345680','linh.pham04@gmail.com','Đống Đa, Hà Nội',3,'UI/UX Design','2026-03-14 15:58:10',0,'2026-03-15 08:01:24'),(18,'huyhoang01','hashed_password','Hoàng Quốc Huy','2001-11-02','0912345681','huy.hoang01@gmail.com','Hai Bà Trưng, Hà Nội',3,'Data Science','2026-03-14 15:58:10',0,'2026-03-15 08:01:24'),(19,'anhvu03','hashed_password','Vũ Anh Tuấn','2003-07-11','0912345682','anh.vu03@gmail.com','Thanh Xuân, Hà Nội',3,'Mobile Development','2026-03-14 15:58:10',0,'2026-03-15 08:01:24'),(20,'khanhnguyen02','hashed_password','Nguyễn Hoàng Khánh','2002-12-08','0912345683','khanh.nguyen02@gmail.com','Nam Từ Liêm, Hà Nội',3,'Machine Learning','2026-03-14 15:58:10',0,'2026-03-15 08:01:24'),(21,'thutrang03','hashed_password','Nguyễn Thu Trang','2003-01-25','0912345684','trang.nguyen03@gmail.com','Bắc Từ Liêm, Hà Nội',3,'Business Analysis','2026-03-14 15:58:10',0,'2026-03-15 08:01:24'),(22,'tuanpham04','hashed_password','Phạm Anh Tuấn','2004-04-17','0912345685','tuan.pham04@gmail.com','Long Biên, Hà Nội',3,'Cyber Security','2026-03-14 15:58:10',0,'2026-03-15 08:01:24'),(23,'huongle02','hashed_password','Lê Thu Hương','2002-09-29','0912345686','huong.le02@gmail.com','Hoàng Mai, Hà Nội',3,'Cloud Computing','2026-03-14 15:58:10',0,'2026-03-15 08:01:24'),(24,'quangdo03','hashed_password','Đỗ Quang Huy','2003-06-13','0912345687','quang.do03@gmail.com','Hà Đông, Hà Nội',3,'Software Testing','2026-03-14 15:58:10',0,'2026-03-15 08:01:24'),(25,'test22','123456','huyen25092003','2026-03-19','0376626404','thanhstyle2003@gmail.com','123',3,'None','2026-03-15 08:31:12',1,'2026-03-15 09:26:17'),(27,'teacher1233','123456','huyen2509202','2026-03-16','0376626410','thanhstyle555@gmail.com','1234',2,'None','2026-03-15 09:48:06',0,'2026-03-15 12:17:43'),(28,'admin33333444','123456','huyen25092022222222','2026-03-16','0376626410222','thanhstyle552225@gmail.com','1234',3,'None','2026-03-15 12:16:16',0,'2026-03-15 12:17:08'),(29,'namnguyen032','hashed_password','Nguyễn Viết Hoài Nam2','2003-08-24','09123245678','nam.nguy2en03@gmail.com','Hoàn Kiếm, Hà Nội',3,'Java Backend','2026-03-17 15:56:32',0,'2026-03-17 15:56:32'),(30,'minhtran022','hashed_password','Trần Minh Đức2','2002-05-14','09123425679','minh.tra2n02@gmail.com','Cầu Giấy, Hà Nội',3,'Frontend Development','2026-03-17 15:56:32',0,'2026-03-17 15:56:32'),(31,'linhpham042','hashed_password','Phạm Thùy Linh2','2004-03-19','09123452680','linh.ph2am04@gmail.com','Đống Đa, Hà Nội',3,'UI/UX Design','2026-03-17 15:56:32',0,'2026-03-17 15:56:32'),(32,'huyhoang021','hashed_password','Hoàng Quốc Huy2','2001-11-02','09122345681','huy.hoan2g01@gmail.com','Hai Bà Trưng, Hà Nội',3,'Data Science','2026-03-17 15:56:32',0,'2026-03-17 15:56:32'),(33,'anhv2u03','hashed_password','Vũ Anh Tuấn2','2003-07-11','09123245682','anh.vu03@gmail.com','Thanh Xuân, Hà Nội',3,'Mobile Development','2026-03-17 15:56:32',0,'2026-03-17 15:56:32'),(34,'khanhn2guyen02','hashed_password','Nguyễn Hoàng Khánh2','2002-12-08','09122345683','khanh2.nguyen02@gmail.com','Nam Từ Liêm, Hà Nội',3,'Machine Learning','2026-03-17 15:56:32',0,'2026-03-17 15:56:32'),(35,'thut2rang03','hashed_password','Nguyễn Thu Trang2','2003-01-25','09123452684','trang.2nguyen03@gmail.com','Bắc Từ Liêm, Hà Nội',3,'Business Analysis','2026-03-17 15:56:32',0,'2026-03-17 15:56:32'),(36,'tuanp2ham04','hashed_password','Phạm Anh Tuấn2','2004-04-17','09123452685','tuan.p2ham04@gmail.com','Long Biên, Hà Nội',3,'Cyber Security','2026-03-17 15:56:32',0,'2026-03-17 15:56:32'),(37,'huong2le02','hashed_password','Lê Thu Hương2','2002-09-29','09123456826','hu2ong.le02@gmail.com','Hoàng Mai, Hà Nội',3,'Cloud Computing','2026-03-17 15:56:32',0,'2026-03-17 15:56:32'),(38,'quangd2o03','hashed_password','Đỗ Quang Huy2','2003-06-13','09123452687','quan2g.do03@gmail.com','Hà Đông, Hà Nội',3,'Software Testing','2026-03-17 15:56:32',0,'2026-03-17 15:56:32');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-17 23:54:13
