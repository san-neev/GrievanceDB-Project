-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: GrievanceDB
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `citizens`
--

DROP TABLE IF EXISTS `citizens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citizens` (
  `citizen_id` int NOT NULL,
  `citizen_name` varchar(100) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `address` varchar(200) NOT NULL,
  PRIMARY KEY (`citizen_id`),
  UNIQUE KEY `contact` (`contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citizens`
--

LOCK TABLES `citizens` WRITE;
/*!40000 ALTER TABLE `citizens` DISABLE KEYS */;
INSERT INTO `citizens` VALUES (1,'Ramesh','9876543210','Mumbai'),(2,'Sunil','9123456780','Pune'),(3,'Anjali','9001122334','Nashik'),(4,'Rohan','9777888999','Nagpur');
/*!40000 ALTER TABLE `citizens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `dept_id` int NOT NULL,
  `dept_name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Water Department','Mumbai'),(2,'Road Department','Mumbai'),(3,'Electricity Department','Pune');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grievance_1nf`
--

DROP TABLE IF EXISTS `grievance_1nf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grievance_1nf` (
  `citizen_id` int DEFAULT NULL,
  `citizen_name` varchar(100) DEFAULT NULL,
  `department_name` varchar(100) DEFAULT NULL,
  `officer_name` varchar(100) DEFAULT NULL,
  `grievance` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grievance_1nf`
--

LOCK TABLES `grievance_1nf` WRITE;
/*!40000 ALTER TABLE `grievance_1nf` DISABLE KEYS */;
INSERT INTO `grievance_1nf` VALUES (1,'Ramesh','Water Dept','Sharma','No water supply'),(1,'Ramesh','Water Dept','Sharma','Pipe burst'),(1,'Ramesh','Road Dept','Verma','Pothole on main road'),(2,'Sunil','Water Dept','Sharma','Dirty water issue');
/*!40000 ALTER TABLE `grievance_1nf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grievance_unnormalized`
--

DROP TABLE IF EXISTS `grievance_unnormalized`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grievance_unnormalized` (
  `citizen_id` int DEFAULT NULL,
  `citizen_name` varchar(100) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `department_name` varchar(100) DEFAULT NULL,
  `officer_name` varchar(100) DEFAULT NULL,
  `grievances` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grievance_unnormalized`
--

LOCK TABLES `grievance_unnormalized` WRITE;
/*!40000 ALTER TABLE `grievance_unnormalized` DISABLE KEYS */;
INSERT INTO `grievance_unnormalized` VALUES (1,'Ramesh','9876543210','Water Dept','Sharma','No water supply, Pipe burst'),(1,'Ramesh','9876543210','Road Dept','Verma','Pothole on main road'),(2,'Sunil','9123456780','Water Dept','Sharma','Dirty water issue');
/*!40000 ALTER TABLE `grievance_unnormalized` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grievances`
--

DROP TABLE IF EXISTS `grievances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grievances` (
  `grievance_id` int NOT NULL AUTO_INCREMENT,
  `citizen_id` int DEFAULT NULL,
  `dept_id` int DEFAULT NULL,
  `description` varchar(500) NOT NULL,
  `category` varchar(50) NOT NULL,
  `submit_date` date NOT NULL,
  `status` varchar(30) DEFAULT 'Pending',
  PRIMARY KEY (`grievance_id`),
  KEY `citizen_id` (`citizen_id`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `grievances_ibfk_1` FOREIGN KEY (`citizen_id`) REFERENCES `citizens` (`citizen_id`),
  CONSTRAINT `grievances_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grievances`
--

LOCK TABLES `grievances` WRITE;
/*!40000 ALTER TABLE `grievances` DISABLE KEYS */;
INSERT INTO `grievances` VALUES (1,1,1,'No water supply in area','Water','2026-01-10','Pending'),(2,1,2,'Pothole on main road','Road','2026-01-12','In Progress'),(3,2,1,'Dirty water issue','Water','2026-01-15','Resolved'),(4,3,3,'Power cut for 5 hours daily','Electricity','2026-01-20','Pending');
/*!40000 ALTER TABLE `grievances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `officers`
--

DROP TABLE IF EXISTS `officers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `officers` (
  `officer_id` int NOT NULL AUTO_INCREMENT,
  `officer_name` varchar(100) NOT NULL,
  `dept_id` int DEFAULT NULL,
  PRIMARY KEY (`officer_id`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `officers_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officers`
--

LOCK TABLES `officers` WRITE;
/*!40000 ALTER TABLE `officers` DISABLE KEYS */;
INSERT INTO `officers` VALUES (1,'Sharma',1),(2,'Verma',2),(3,'Patil',3);
/*!40000 ALTER TABLE `officers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statushistory`
--

DROP TABLE IF EXISTS `statushistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statushistory` (
  `history_id` int NOT NULL AUTO_INCREMENT,
  `grievance_id` int DEFAULT NULL,
  `officer_id` int DEFAULT NULL,
  `status` varchar(30) NOT NULL,
  `update_date` date NOT NULL,
  `remarks` varchar(300) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `grievance_id` (`grievance_id`),
  KEY `officer_id` (`officer_id`),
  CONSTRAINT `statushistory_ibfk_1` FOREIGN KEY (`grievance_id`) REFERENCES `grievances` (`grievance_id`),
  CONSTRAINT `statushistory_ibfk_2` FOREIGN KEY (`officer_id`) REFERENCES `officers` (`officer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statushistory`
--

LOCK TABLES `statushistory` WRITE;
/*!40000 ALTER TABLE `statushistory` DISABLE KEYS */;
INSERT INTO `statushistory` VALUES (1,1,1,'Pending','2026-01-10','Grievance received'),(2,2,2,'In Progress','2026-01-13','Team assigned for road repair'),(3,3,1,'Resolved','2026-01-18','Water pipe cleaned and fixed'),(4,4,3,'Pending','2026-01-20','Under review');
/*!40000 ALTER TABLE `statushistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-21 22:05:36
