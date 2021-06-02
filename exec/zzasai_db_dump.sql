-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: final_pjt
-- ------------------------------------------------------
-- Server version	8.0.25-0ubuntu0.20.04.1

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
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card` (
  `cardname` varchar(45) NOT NULL,
  `cardurl_front` text NOT NULL,
  `cardurl_back` text NOT NULL,
  PRIMARY KEY (`cardname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES ('black1','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/black1.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/black1.png'),('black10','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/black10.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/black10.png'),('black11','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/black11.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/black11.png'),('black2','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/black2.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/black2.png'),('black3','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/black3.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/black3.png'),('black4','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/black4.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/black4.png'),('black5','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/black5.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/black5.png'),('black6','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/black6.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/black6.png'),('black7','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/black7.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/black7.png'),('black8','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/black8.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/black8.png'),('black9','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/black9.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/black9.png'),('blue1','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/blue1.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/blue1.png'),('blue2','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/blue2.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/blue2.png'),('blue3','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/blue3.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/blue3.png'),('blue4','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/blue4.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/blue4.png'),('blue5','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/blue5.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/blue5.png'),('blue6','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/blue6.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/blue6.png'),('blue7','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/blue7.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/blue7.png'),('green1','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/green1.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/green1.png'),('green10','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/green10.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/green10.png'),('green2','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/green2.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/green2.png'),('green3','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/green3.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/green3.png'),('green4','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/green4.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/green4.png'),('green5','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/green5.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/green5.png'),('green6','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/green6.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/green6.png'),('green7','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/green7.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/green7.png'),('green8','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/green8.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/green8.png'),('green9','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/green9.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/green9.png'),('mint1','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/mint1.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/mint1.png'),('mint2','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/mint2.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/mint2.png'),('mint3','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/mint3.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/mint3.png'),('mint4','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/mint4.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/mint4.png'),('mint5','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/mint5.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/mint5.png'),('mint6','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/mint6.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/mint6.png'),('mint7','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/mint7.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/mint7.png'),('mint8','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/mint8.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/mint8.png'),('mint9','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/mint9.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/mint9.png'),('red1','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/red1.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/red1.png'),('red2','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/red2.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/red2.png'),('red3','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/red3.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/red3.png'),('red4','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/red4.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/red4.png'),('red5','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/red5.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/red5.png'),('red6','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/red6.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/red6.png'),('red7','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/red7.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/red7.png'),('red8','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/red8.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/red8.png'),('red9','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/red9.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/red9.png'),('white1','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/white1.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/white1.png'),('white10','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/white10.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/white10.png'),('white11','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/white11.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/white11.png'),('white2','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/white2.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/white2.png'),('white3','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/white3.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/white3.png'),('white4','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/white4.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/white4.png'),('white5','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/white5.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/white5.png'),('white6','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/white6.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/white6.png'),('white7','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/white7.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/white7.png'),('white8','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/white8.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/white8.png'),('white9','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/white9.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/white9.png'),('yellow1','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/yellow1.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/yellow1.png'),('yellow10','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/yellow10.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/yellow10.png'),('yellow2','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/yellow2.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/yellow2.png'),('yellow3','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/yellow3.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/yellow3.png'),('yellow4','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/yellow4.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/yellow4.png'),('yellow5','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/yellow5.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/yellow5.png'),('yellow6','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/yellow6.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/yellow6.png'),('yellow7','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/yellow7.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/yellow7.png'),('yellow8','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/yellow8.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/yellow8.png'),('yellow9','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/front/yellow9.png','https://icebreaking205.s3.ap-northeast-2.amazonaws.com/back/yellow9.png');
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drawquestion`
--

DROP TABLE IF EXISTS `drawquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drawquestion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `word` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drawquestion`
--

LOCK TABLES `drawquestion` WRITE;
/*!40000 ALTER TABLE `drawquestion` DISABLE KEYS */;
INSERT INTO `drawquestion` VALUES (1,'사과'),(2,'제비꽃'),(3,'인삼주'),(4,'햄버거'),(5,'해물탕'),(6,'금의환향'),(7,'오리너구리'),(8,'물수제비'),(9,'골든벨'),(10,'만두피'),(11,'바위섬'),(12,'눈병'),(13,'듣기평가'),(14,'장염'),(15,'겨울잠'),(16,'영한사전'),(17,'소변금지'),(18,'푸들'),(19,'포장마차'),(20,'가마'),(21,'모스부호'),(22,'두개골'),(23,'아이크림'),(24,'도끼'),(25,'결혼기념일'),(26,'졸업식'),(27,'이발소'),(28,'입학식'),(29,'월드컵'),(30,'브라질너트'),(31,'땅강아지'),(32,'원빈'),(33,'대장균'),(34,'중고생'),(35,'드래곤볼'),(36,'난장판'),(37,'네트워크'),(38,'제철소'),(39,'과녁'),(40,'무말랭이'),(41,'식스팩'),(42,'매너'),(43,'북쪽'),(44,'피규어'),(45,'손수건'),(46,'만년설'),(47,'산모'),(48,'장편소설'),(49,'해시계'),(50,'카놀라유'),(51,'쥐며느리'),(52,'집들이'),(53,'무승부'),(54,'새로고침'),(55,'하이라이트'),(56,'돋보기'),(57,'파인애플'),(58,'핸드크림'),(59,'절규'),(60,'산타크로스'),(61,'공상과학'),(62,'배트맨'),(63,'해운대'),(64,'먹방'),(65,'머그컵'),(66,'배탈'),(67,'데칼코마니'),(68,'롤모델'),(69,'짚신벌레'),(70,'차이나타운'),(71,'공통점'),(72,'톱니바퀴'),(73,'벌침'),(74,'캡사이신'),(75,'까스활명수'),(76,'학우'),(77,'달밤'),(78,'돌팔이'),(79,'맨투맨'),(80,'초등학교'),(81,'키보드'),(82,'대머리독수리'),(83,'별자리'),(84,'식용버섯'),(85,'하이파이브'),(86,'가루약'),(87,'홀로그램'),(88,'키위'),(89,'감자탕'),(90,'뒤집개'),(91,'밤안개'),(92,'소설가'),(93,'매운탕'),(94,'달력'),(95,'불량식품'),(96,'김밥천국'),(97,'초능력'),(98,'냉동보관'),(99,'비상구'),(100,'히든카드');
/*!40000 ALTER TABLE `drawquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `roomcode` varchar(45) NOT NULL,
  `roomname` varchar(45) NOT NULL,
  `roomadmin` varchar(45) NOT NULL,
  `game1` int NOT NULL,
  `game2` int DEFAULT NULL,
  `game3` int DEFAULT NULL,
  PRIMARY KEY (`roomcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES ('RZmTVyza','ddd','dd',2,0,0);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-21 11:08:16
