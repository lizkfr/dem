-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: hoteldb
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `guests`
--

DROP TABLE IF EXISTS `guests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guests` (
  `idguest` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(200) NOT NULL,
  `passportnumber` varchar(45) NOT NULL,
  `room` int NOT NULL,
  `enrtydate` varchar(100) DEFAULT NULL,
  `departuredate` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idguest`),
  KEY `roomkey_idx` (`room`),
  CONSTRAINT `roomkey` FOREIGN KEY (`room`) REFERENCES `rooms` (`idrooms`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guests`
--

LOCK TABLES `guests` WRITE;
/*!40000 ALTER TABLE `guests` DISABLE KEYS */;
INSERT INTO `guests` VALUES (1,'Шевченко Ольга Викторовна','7934 345634',1,'14.02.2025','02.03.2025'),(2,'Мазалова Ирина Львовна','7934 345631',2,'28.02.2025','15.03.2025'),(3,'Семеняка Юрий Геннадьевич','7934 345632',3,'23.02.2025','02.02.2025'),(4,'Савельев Олег Иванович','7934 345633',4,'01.03.2025','07.03.2025'),(5,'Бунин Эдуард Михайлович','7934 345638',5,'27.02.2025','22.04.2025'),(6,'Бахшиев Павел Иннокентьевич','7934 345635',6,'24.02.2025','17.03.2025'),(7,'Тюренкова Наталья Сергеевна','7934 345636',7,'15.02.2025','20.03.2025'),(8,'Любяшева Галина Аркадьевна','7934 345637',8,'27.02.2025','12.03.2025'),(9,'Александров Петр Константинович','7934 345639',9,'14.02.2025','02.02.2025'),(10,'Мазалова Ольга Николаевна','7934 345630',10,'24.02.2025','17.03.2025'),(11,'Лапшин Виктор Романович','7934 345619',11,'25.02.2025','07.03.2025'),(12,'Гусев Семен Петрович','7934 345618',12,'01.03.2025','04.03.2025'),(13,'Гладилина Вера Михайловна','7934 345617',13,'02.02.2025','02.02.2025'),(14,'Масюк Динара Викторовна','7934 345616',14,'25.02.2025','04.03.2025'),(15,'Лукин Илья Федорович','7934 345615',15,'25.02.2025','04.03.2025'),(16,'Петров Станислав Игоревич','7934 345614',16,'27.02.2025','04.03.2025'),(17,'Филь Марина Федоровна','7934 345613',17,'28.02.2025','15.03.2025'),(18,'Михайлов Игорь Вадимович','7934 345612',18,'11.02.2025','15.03.2025'),(19,'Лешк Флам','3213',2,'20.01.2025','23.01.2025'),(20,'Полничитк','232134',2,'20.01.2025','25.01.2025'),(21,'hhhhh','4556',4,'20.05.2025','30.05.2025');
/*!40000 ALTER TABLE `guests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `idrooms` int NOT NULL AUTO_INCREMENT,
  `number` int NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `price` decimal(65,0) NOT NULL,
  `state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idrooms`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,101,'Одноместный стандарт',10000,'Готов'),(2,102,'Одноместный стандарт',10000,'Готов'),(3,103,'Одноместный эконом',10000,'Готов'),(4,104,'Одноместный эконом',10000,'Готов'),(5,105,'Стандарт двухместный с 2 раздельными кроватями',10000,'Готов'),(6,106,'Стандарт двухместный с 2 раздельными кроватями',10000,'Готов'),(7,107,'Эконом двухместный с 2 раздельными кроватями',10000,'Готов'),(8,108,'Эконом двухместный с 2 раздельными кроватями',10000,'Готов'),(9,109,'Эконом двухместный с 2 раздельными кроватями',10000,'Готов'),(10,110,'Эконом двухместный с 2 раздельными кроватями',10000,'Готов'),(11,201,'Эконом двухместный с 2 раздельными кроватями',10000,'Готов'),(12,202,'3-местный бюджет',10000,'Готов'),(13,203,'3-местный бюджет',10000,'Готов'),(14,204,'Бизнес с 1 или 2 кроватями',10000,'Готов'),(15,205,'Бизнес с 1 или 2 кроватями',10000,'Готов'),(16,206,'Бизнес с 1 или 2 кроватями',10000,'Готов'),(17,207,'Одноместный стандарт',10000,'Готов'),(18,208,'Одноместный стандарт',10000,'Готов'),(19,209,'Одноместный стандарт',10000,'Готов'),(20,301,'Студия',10000,'Готов'),(21,302,'Студия',10000,'Готов'),(22,303,'Студия',10000,'Готов'),(23,304,'Люкс с 2 двуспальными кроватями',10000,'Готов'),(24,305,'Люкс с 2 двуспальными кроватями',10000,'Готов'),(25,306,'Люкс с 2 двуспальными кроватями',10000,'Готов');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `idusers` int NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`idusers`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'dir123','123','director'),(2,'rec123','123','receptionist'),(3,'cli123','123','client');
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

-- Dump completed on 2025-02-24 14:35:59
