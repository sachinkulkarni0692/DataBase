CREATE DATABASE  IF NOT EXISTS `dbproject` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `dbproject`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: dbproject
-- ------------------------------------------------------
-- Server version	8.0.12

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
-- Table structure for table `plan_information`
--

DROP TABLE IF EXISTS `plan_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `plan_information` (
  `plan_type` varchar(50) NOT NULL,
  `number_of_mins` varchar(50) NOT NULL,
  `data_limit` varchar(50) NOT NULL,
  `number_of_text` varchar(50) NOT NULL,
  PRIMARY KEY (`plan_type`),
  UNIQUE KEY `plan_type` (`plan_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_information`
--

LOCK TABLES `plan_information` WRITE;
/*!40000 ALTER TABLE `plan_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `port`
--

DROP TABLE IF EXISTS `port`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `port` (
  `phone_number` varchar(12) NOT NULL,
  `port_type` varchar(10) DEFAULT NULL,
  `port_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`phone_number`),
  CONSTRAINT `fk_port` FOREIGN KEY (`phone_number`) REFERENCES `subscriber` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `port`
--

LOCK TABLES `port` WRITE;
/*!40000 ALTER TABLE `port` DISABLE KEYS */;
INSERT INTO `port` VALUES ('23683438','port_out','2018-10-23 23:07:52'),('38787548','port_out','2018-10-23 23:07:52'),('47568758','port_out','2018-10-23 23:07:52'),('57887658','port_out','2018-10-23 23:07:52');
/*!40000 ALTER TABLE `port` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recharge`
--

DROP TABLE IF EXISTS `recharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `recharge` (
  `recharge_id` varchar(50) NOT NULL,
  `plan_type` varchar(50) NOT NULL,
  `phone_number` varchar(12) NOT NULL,
  `recharge_type` varchar(10) DEFAULT NULL,
  `amount` decimal(38,8) DEFAULT NULL,
  `recharge_date` date DEFAULT NULL,
  PRIMARY KEY (`recharge_id`),
  UNIQUE KEY `recharge_id` (`recharge_id`),
  KEY `fk_phone` (`phone_number`),
  KEY `fk_recharge` (`plan_type`),
  CONSTRAINT `fk_phone` FOREIGN KEY (`phone_number`) REFERENCES `subscriber` (`phone_number`),
  CONSTRAINT `fk_recharge` FOREIGN KEY (`plan_type`) REFERENCES `plan_information` (`plan_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recharge`
--

LOCK TABLES `recharge` WRITE;
/*!40000 ALTER TABLE `recharge` DISABLE KEYS */;
/*!40000 ALTER TABLE `recharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriber`
--

DROP TABLE IF EXISTS `subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `subscriber` (
  `phone_number` varchar(12) NOT NULL,
  `imei` varchar(50) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `account_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`phone_number`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriber`
--

LOCK TABLES `subscriber` WRITE;
/*!40000 ALTER TABLE `subscriber` DISABLE KEYS */;
INSERT INTO `subscriber` VALUES ('12343434','ereetrds1211112','2018-08-08',NULL,'active','prepaid'),('22322434','euwfyrwuyu1','2018-03-01',NULL,'active','prepaid'),('23683438','efjjkjs6','2018-01-14',NULL,'active','prepaid'),('3487387857','jdskfr5','2018-09-24',NULL,'active','postpaid'),('38787548','fgnskjg2','2018-05-01',NULL,'active','prepaid'),('47568758','fjdkjsf2','2018-04-02',NULL,'active','postpaid'),('57887658','fdsjjsha3','2018-05-15',NULL,'active','postpaid');
/*!40000 ALTER TABLE `subscriber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriber_call_records`
--

DROP TABLE IF EXISTS `subscriber_call_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `subscriber_call_records` (
  `call_id` varchar(45) NOT NULL,
  `phone_number` varchar(12) NOT NULL,
  `call_type` varchar(25) NOT NULL,
  `call_duration` bigint(20) DEFAULT NULL,
  `call_date` timestamp NULL DEFAULT NULL,
  `charge_per_minute` decimal(38,8) DEFAULT NULL,
  `charge_duration` bigint(20) DEFAULT NULL,
  `call_location` varchar(255) DEFAULT NULL,
  `call_status` varchar(50) DEFAULT NULL,
  `last_used` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`call_id`),
  UNIQUE KEY `call_id` (`call_id`),
  KEY `fk_call` (`phone_number`),
  CONSTRAINT `fk_call` FOREIGN KEY (`phone_number`) REFERENCES `subscriber` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriber_call_records`
--

LOCK TABLES `subscriber_call_records` WRITE;
/*!40000 ALTER TABLE `subscriber_call_records` DISABLE KEYS */;
INSERT INTO `subscriber_call_records` VALUES ('12000','12343434','incoming',20,'2018-10-23 23:07:52',2.00000000,24,'NC','connected','2018-10-23 23:07:52'),('12001','22322434','outgoing',19,'2018-10-23 23:07:52',2.00000000,24,'CA','connected','2018-10-23 23:07:52'),('12002','3487387857','incoming',15,'2018-10-23 23:07:52',2.00000000,18,'AK','connected','2018-10-23 23:07:52'),('12003','23683438','outgoing',0,'2018-10-23 23:07:52',2.00000000,0,'NC','disconnected','2018-10-23 23:07:52'),('12004','57887658','incoming',30,'2018-10-23 23:07:52',2.00000000,30,'NC','connected','2018-10-23 23:07:52');
/*!40000 ALTER TABLE `subscriber_call_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriber_data_records`
--

DROP TABLE IF EXISTS `subscriber_data_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `subscriber_data_records` (
  `phone_number` varchar(12) NOT NULL,
  `data_sent` varchar(50) NOT NULL,
  `data_received` varchar(50) NOT NULL,
  `usage_date` timestamp NULL DEFAULT NULL,
  `category` varchar(15) DEFAULT NULL,
  `last_used` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`phone_number`),
  CONSTRAINT `fk_data` FOREIGN KEY (`phone_number`) REFERENCES `subscriber` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriber_data_records`
--

LOCK TABLES `subscriber_data_records` WRITE;
/*!40000 ALTER TABLE `subscriber_data_records` DISABLE KEYS */;
INSERT INTO `subscriber_data_records` VALUES ('12343434','12.3','10','2018-10-23 23:07:52','Netflix','2018-10-23 23:07:52'),('22322434','15','9','2018-10-23 23:07:52','Youtube','2018-10-23 23:07:52'),('23683438','1.3','1','2018-10-23 23:07:52','Wikipedia','2018-10-23 23:07:52'),('3487387857','2.3','11','2018-10-23 23:07:52','Whatsapp','2018-10-23 23:07:52');
/*!40000 ALTER TABLE `subscriber_data_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriber_message_records`
--

DROP TABLE IF EXISTS `subscriber_message_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `subscriber_message_records` (
  `message_id` varchar(45) NOT NULL,
  `phone_number` varchar(12) NOT NULL,
  `message_sent` timestamp NULL DEFAULT NULL,
  `message_received` timestamp NULL DEFAULT NULL,
  `last_used` timestamp NULL DEFAULT NULL,
  `message_location` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`message_id`),
  UNIQUE KEY `message_id` (`message_id`),
  KEY `fk_message` (`phone_number`),
  CONSTRAINT `fk_message` FOREIGN KEY (`phone_number`) REFERENCES `subscriber` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriber_message_records`
--

LOCK TABLES `subscriber_message_records` WRITE;
/*!40000 ALTER TABLE `subscriber_message_records` DISABLE KEYS */;
INSERT INTO `subscriber_message_records` VALUES ('11000','12343434','2018-10-10 04:00:00','2018-09-10 04:00:00','2018-10-23 23:07:52','NC'),('11001','22322434','2018-10-09 04:00:00','2018-08-10 04:00:00','2018-10-23 23:07:52','CA'),('11002','3487387857','2018-10-08 04:00:00','2018-07-08 04:00:00','2018-10-23 23:07:52','NC'),('11003','12343434','2018-01-10 05:00:00','2018-04-10 04:00:00','2018-10-23 23:07:52','AK'),('11004','12343434','2018-02-10 05:00:00','2018-06-10 04:00:00','2018-10-23 23:07:52','NC');
/*!40000 ALTER TABLE `subscriber_message_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dbproject'
--

--
-- Dumping routines for database 'dbproject'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-23 21:26:34
