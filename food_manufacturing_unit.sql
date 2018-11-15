CREATE DATABASE  IF NOT EXISTS `food_manufacturing_unit` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `food_manufacturing_unit`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: food_manufacturing_unit
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
-- Table structure for table `address_details`
--

DROP TABLE IF EXISTS `address_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `address_details` (
  `zip_code` varchar(10) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  PRIMARY KEY (`zip_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_details`
--

LOCK TABLES `address_details` WRITE;
/*!40000 ALTER TABLE `address_details` DISABLE KEYS */;
INSERT INTO `address_details` VALUES ('10003','NEW YORK','NEW YORK'),('10014','NEW YORK','NEW YORK'),('28223','CHARLOTTE','NORTH CAROLINA'),('28262','CHARLOTTE','NORTH CAROLINA'),('82242','CHICAGO','ILLINOIS'),('82452','CHICAGO','ILLINOIS');
/*!40000 ALTER TABLE `address_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `customer_id` int(5) NOT NULL AUTO_INCREMENT,
  `business_name` varchar(35) NOT NULL,
  `first_name` varchar(35) NOT NULL,
  `last_name` varchar(35) NOT NULL,
  `customers_contact_number` varchar(15) NOT NULL,
  `address_line1` varchar(255) NOT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `zip_code` varchar(10) NOT NULL,
  `product_id` int(5) NOT NULL,
  `number_of_products_ordered` int(10) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `product_id` (`product_id`),
  KEY `zip_code` (`zip_code`),
  CONSTRAINT `Customer_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `Customer_ibfk_2` FOREIGN KEY (`zip_code`) REFERENCES `address_details` (`zip_code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Moet et Chandon','Sam','Christian','2903337679','132 Fieldstone Ave.','','28262',1,120),(2,'BlackBerry','Gabriella','Johnston','9440335189','69 Randall Mill St.','','10003',3,145),(3,'Burberry','Irene','Nixon','7691512522','8774 North Church Lane ','','82242',2,1200),(4,'Google','Kasey','Herman','6662160504','55 East Mulberry Lane','','82452',5,121),(5,'Chase','Cannon','Kirby','9758281146','7560 Iroquois Ave. ','','10014',4,177),(6,'Nintendo','Ana','Tate','6295181411','982 Paris Hill Dr.','','28223',1,1000),(7,'Honda Motor Company, Ltd','Issac','Ryan','5185218030','8367 Brown Lane','','10003',3,12);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `department` (
  `department_id` varchar(10) NOT NULL,
  `department_name` varchar(255) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('01','Manufacturing unit'),('02','Packing uint'),('03','Transportation unit'),('04','Inventory unit');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee` (
  `employee_id` varchar(255) NOT NULL,
  `first_name` varchar(35) NOT NULL,
  `last_name` varchar(35) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `contact_number` varchar(15) NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `address_line1` varchar(255) NOT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `zip_code` varchar(10) NOT NULL,
  `department_id` varchar(10) NOT NULL,
  `designation` char(30) NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `Employee_ibfk_2` (`zip_code`),
  KEY `Employee_ibfk_3` (`department_id`),
  CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `Employee_ibfk_2` FOREIGN KEY (`zip_code`) REFERENCES `address_details` (`zip_code`),
  CONSTRAINT `Employee_ibfk_3` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('AD0001','Mark','Campos','1987-05-19','1234567890','fviegas@yahoo.com','695 Harvard Ave.','Winston Salem','10003','01','Admin'),('EM0001','Adrien','Patton','1985-03-13','5678901234','ducasse@aol.com','34 Valley Farms Lane','Capitol Heights','10014','02','Employee'),('EM00010','Coral','Severance','1987-04-28','8278535984','pkilab@gmail.com','43 Warren Ave.','','82242','02','Employee'),('EM00011','Tyler','Tuley','2011-05-02','6939014922','whimsy@att.net','8859 Bohemia Dr','','82452','03','Employee'),('EM00012','Brande','Batman','2003-06-22','9159062518','chaffar@gmail.com','769 Pierce St.','Beachwood','28223','04','Employee'),('EM00013','Charity','Roche','2000-07-21','2266218823','sbmrjbr@icloud.com','459 Nicolls Court','Independence','28262','02','Employee'),('EM00014','Verdell','Bateman','2001-08-30','5501713982','jemarch@msn.com','9793 Market Lane','Gulfport','10003','03','Employee'),('EM00015','Linda','Haberman','2002-09-10','5103992996','psharpe@gmail.com','75 Sycamore Drive','Long Beach','10014','04','Employee'),('EM0002','Phoenix','Mcdonald','1969-04-01','6789012345','ilial@me.com','1 Bow Ridge Lane','Northbrook','28223','03','Employee'),('EM0003','Cohen','Valenzuela','2004-08-09','7890123456','arebenti@att.net','44 Sulphur Springs Street','Mableton','82242','04','Employee'),('EM0004','Marcus','Lloyd','1970-08-30','8901234567','boser@yahoo.ca','75 Front Lane','','28223','02','Employee'),('EM0005','Mckinley','Chase','1972-12-21','9012345678','squirrel@aol.com','9770 Briarwood Ave. ','','82242','03','Employee'),('EM0006','Marisa','Richards','2008-10-03','5193916083','kspiteri@outlook.com','7645 Mayfield Ave.','','28262','04','Employee'),('EM0007','Rosario','Dressel','1990-01-01','0254763520','cderoove@yahoo.ca','53 Mayfield Street ','Enfield','28262','02','Employee'),('EM0008','Joshua','Jagodzinski','1991-02-07','4315396926','onestab@hotmail.com','9078 Heritage St.','Greenwood','10014','03','Employee'),('EM0009','Alaine','Carswell','1989-03-09','0901232374','gerlo@msn.com','7368 E. County Street','','10003','04','Employee'),('MG0001','Shayla','Chavez','1976-08-21','2345678901','sagal@aol.com','549 Old Thorne St.','','10014','02','Manager'),('MG0002','Cason','Peters','1988-07-22','3456789012','tubajon@hotmail.com','9149 Rocky River St.','','82242','03','Manager'),('MG0003','Kobe','Finley','1969-01-11','4567890123','hamilton@yahoo.com','8082 Oak Dr.','Oswego','82242','04','Manager');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_unit`
--

DROP TABLE IF EXISTS `inventory_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `inventory_unit` (
  `employee_id` varchar(255) NOT NULL,
  `department_id` varchar(10) NOT NULL,
  `task_id` varchar(25) NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `Inventory_unit_ibfk_2` (`task_id`),
  KEY `Inventory_unit_ibfk_3` (`department_id`),
  CONSTRAINT `Inventory_unit_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `Inventory_unit_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`),
  CONSTRAINT `Inventory_unit_ibfk_3` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_unit`
--

LOCK TABLES `inventory_unit` WRITE;
/*!40000 ALTER TABLE `inventory_unit` DISABLE KEYS */;
INSERT INTO `inventory_unit` VALUES ('EM0005','04','T0400001052'),('EM0006','04','T0400041052'),('EM0007','04','T0400041052');
/*!40000 ALTER TABLE `inventory_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturing_unit`
--

DROP TABLE IF EXISTS `manufacturing_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `manufacturing_unit` (
  `employee_id` varchar(255) NOT NULL,
  `department_id` varchar(10) NOT NULL,
  `task_id` varchar(25) NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `Manufacturing_unit_ibfk_2` (`task_id`),
  KEY `Manufacturing_unit_ibfk_3` (`department_id`),
  CONSTRAINT `Manufacturing_unit_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `Manufacturing_unit_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`),
  CONSTRAINT `Manufacturing_unit_ibfk_3` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturing_unit`
--

LOCK TABLES `manufacturing_unit` WRITE;
/*!40000 ALTER TABLE `manufacturing_unit` DISABLE KEYS */;
INSERT INTO `manufacturing_unit` VALUES ('AD0001','01','T0100000123'),('EM0001','01','T0100005123'),('EM00010','01','T0100000123'),('EM00011','01','T0100005123');
/*!40000 ALTER TABLE `manufacturing_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packing_unit`
--

DROP TABLE IF EXISTS `packing_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `packing_unit` (
  `employee_id` varchar(255) NOT NULL,
  `department_id` varchar(10) NOT NULL,
  `task_id` varchar(25) NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `Packing_unit_ibfk_2` (`task_id`),
  KEY `Packing_unit_ibfk_3` (`department_id`),
  CONSTRAINT `Packing_unit_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `Packing_unit_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`),
  CONSTRAINT `Packing_unit_ibfk_3` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packing_unit`
--

LOCK TABLES `packing_unit` WRITE;
/*!40000 ALTER TABLE `packing_unit` DISABLE KEYS */;
INSERT INTO `packing_unit` VALUES ('EM00012','02','T0200004223'),('EM00013','02','T0200000223'),('EM00014','02','T0200000223'),('EM00015','02','T0200004223');
/*!40000 ALTER TABLE `packing_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `product_id` int(5) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(35) NOT NULL,
  `type_of_food` varchar(255) NOT NULL,
  `product_price` decimal(6,2) NOT NULL,
  `products_sold` int(10) DEFAULT NULL,
  `number_products_produced` int(10) DEFAULT NULL,
  `profit_percentage` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Pizza','Bread',8.00,2434,3000,60.00),(2,'Pasta','salads',6.00,1434,1500,50.00),(3,'Desert','sweet',15.00,2800,3000,80.00),(4,'Sandwiches','vegetables',7.00,4434,5000,60.00),(5,'Chicken Wings','Chicken',20.00,4414,4500,90.00);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `task` (
  `task_id` varchar(25) NOT NULL,
  `task_to_be_performed` varchar(255) NOT NULL,
  `product_id` int(5) NOT NULL,
  PRIMARY KEY (`task_id`),
  KEY `Task_ibfk_1` (`product_id`),
  CONSTRAINT `Task_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES ('T0100000123','manufacture',1),('T0100005123','manufacture',4),('T0200000223','pack',3),('T0200004223','pack',5),('T0300000445','transport',2),('T0300003445','transport',2),('T0400001052','number of items',5),('T0400041052','number of items',4);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportation_unit`
--

DROP TABLE IF EXISTS `transportation_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `transportation_unit` (
  `employee_id` varchar(255) NOT NULL,
  `department_id` varchar(10) NOT NULL,
  `task_id` varchar(25) NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `Transportation_unit_ibfk_2` (`task_id`),
  KEY `Transportation_unit_ibfk_3` (`department_id`),
  CONSTRAINT `Transportation_unit_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `Transportation_unit_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`),
  CONSTRAINT `Transportation_unit_ibfk_3` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportation_unit`
--

LOCK TABLES `transportation_unit` WRITE;
/*!40000 ALTER TABLE `transportation_unit` DISABLE KEYS */;
INSERT INTO `transportation_unit` VALUES ('EM0002','03','T0300003445'),('EM0003','03','T0300000445'),('EM0004','03','T0300000445');
/*!40000 ALTER TABLE `transportation_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `user_id` varchar(255) NOT NULL,
  `password` varchar(8) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('AD0001','AD0001'),('EM0001','EM0001'),('EM00010','EM00010'),('EM00011','EM00011'),('EM00012','EM00012'),('EM00013','EM00013'),('EM00014','EM00014'),('EM00015','EM00015'),('EM0002','EM0002'),('EM0003','EM0003'),('EM0004','EM0004'),('EM0005','EM0005'),('EM0006','EM0006'),('EM0007','EM0007'),('EM0008','EM0008'),('EM0009','EM0009'),('MG0001','MG0001'),('MG0002','MG0002'),('MG0003','MG0003');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'food_manufacturing_unit'
--

--
-- Dumping routines for database 'food_manufacturing_unit'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-11 21:59:42
