CREATE DATABASE  IF NOT EXISTS `library` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `library`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: library
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `author_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `number_of_books` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  UNIQUE KEY `author_id_UNIQUE` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'James','Keane',1),(2,'Walter','Kleeman',1),(3,'Margaret','Rolfe',1),(4,'Oppi','Untracht',1),(5,'Howie','Green',1),(6,'Michael','Dawson',1),(7,'Marc','Wandschneider',1),(8,'Alberto','Contador',2);
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `unique_book_id` int(11) NOT NULL AUTO_INCREMENT,
  `ISBN` varchar(17) NOT NULL,
  PRIMARY KEY (`unique_book_id`),
  UNIQUE KEY `unique_book_id_UNIQUE` (`unique_book_id`),
  KEY `fk_book_books1_idx` (`ISBN`),
  CONSTRAINT `fk_book_books1` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'9780273411222'),(2,'9780273411222'),(3,'9780306800481'),(4,'9780306800481'),(5,'9780321910578'),(6,'9780385041850'),(7,'9780385041850'),(8,'9780385041850'),(9,'9780761529309'),(10,'9780761529309'),(11,'9780843601336'),(12,'9780843601336'),(13,'9780843601336'),(14,'9781423901129'),(15,'9781423901129'),(16,'9781875402007'),(21,'9788801005240'),(17,'9788801102444'),(18,'9788801102444'),(19,'9788801102444'),(20,'9788801102444');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_location`
--

DROP TABLE IF EXISTS `book_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_location` (
  `location_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room` int(10) unsigned NOT NULL,
  `shelf` varchar(1) NOT NULL,
  `section` int(10) unsigned NOT NULL,
  PRIMARY KEY (`location_id`),
  UNIQUE KEY `location_id_UNIQUE` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_location`
--

LOCK TABLES `book_location` WRITE;
/*!40000 ALTER TABLE `book_location` DISABLE KEYS */;
INSERT INTO `book_location` VALUES (1,12,'L',5),(2,15,'C',9),(3,3,'K',4),(4,3,'J',6),(5,10,'F',9),(6,10,'G',5),(7,10,'G',2),(8,12,'P',1),(9,3,'E',4);
/*!40000 ALTER TABLE `book_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `ISBN` varchar(17) NOT NULL,
  `title` longtext NOT NULL,
  `copies` int(10) unsigned DEFAULT NULL,
  `reservations` int(10) unsigned DEFAULT NULL,
  `in-stock` int(10) unsigned DEFAULT NULL,
  `synopsis` longtext,
  `author_id` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `language` varchar(20) DEFAULT NULL,
  `year_of_publication` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`ISBN`),
  UNIQUE KEY `ISBN_UNIQUE` (`ISBN`),
  KEY `fk_books_authors1_idx` (`author_id`),
  KEY `fk_books_book_location1_idx` (`location_id`),
  CONSTRAINT `fk_books_authors1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_books_book_location1` FOREIGN KEY (`location_id`) REFERENCES `book_location` (`location_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='new book isbn check';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES ('9780273411222','Enamelling on Metal (Arts & Crafts S.)',2,0,2,'Started in an unfortunate mother\'s basement in 2004 with books that a student layabout no longer needed, AwesomeBooks now stocks over 2 million titles which are ready to be sent to your door within 24hours of ordering. Our heritage is in supplying great quality used books. We have over 1.8 million books in our distribution centre ready to be shipped to you at any time. We also sell new books and are increasing our range of titles every day.',4,9,'English',1957),('9780306800481','Italian Villas and Their Gardens',2,0,1,'Struck by the magnificence of the Italian countryside from the time of her first sojourn there, our ranking novelist and lady of letters of the early 1900s?a renowned connoisseur?joined forces with the foremost illustrator of the time to celebrate a subject that was dear to them both: the incomparable villas and gardens of Italy. Edith Wharton draws on three centuries of knowledge written in four languages and covers some eighty villas and sixty garden architects. She describes the remarkable splendor of the villas for readers who have never seen them, and leads the reader through her discoveries of why the great houses and grounds create an effect of such profound calm and resolution.Their impact is not merely a matter of ancient statues or splashing fountains?impressive as these may be. Rather, the unique harmony stems from the spirit of the architects? and the designers? art: that delicate blending of man?s work and the variations of nature to achieve a sense of flawless concord. Her success in describing the Villa D?Este, the Villa Medici, and others, is enhanced and vivified by the breathtaking, full-color paintings of Maxfield Parrish.In his introductory essay, Henry Hope Reed, president of Classical America, places Italian Villas and Their Gardens in the context of American garden design at the turn of the century. Edith Wharton?s thesis, that there is much value to be learned from the traditional Italian garden, helped to shape the American landscape of the era. In conveying the message, Maxfield Parrish proved a worthy acolyte. Thomas S. Hayes, who is president of the Edith Whatron Restoration, Inc., tells in his essay how the Italian model guided her in designing the garden of her famous country house, the Mount, at Lenox, Massachusetts.',1,1,'English',1904),('9780321910578','Good Learning Node.js: A Hands-On Guide to Building Web Applications in JavaScript',1,1,0,'Learning Node.js A Hands-On Guide to Building Web Applications in JavaScript',7,7,'English',2006),('9780385041850','Jewelry: Concepts And Technology',3,0,2,'The definitive reference for jewelry makers of all levels of ability--a complete, profusely illustrated guide to design, materials, and techniques, as well as a fascinating exploration of jewelry-making throughout history.',4,4,'English',1985),('9780761529309','Flash Web Development Fast and Easy (Fast and Easy Web Development)',2,0,2,'A guide to the creation of interactive, multimedia Web sites demonstrates Flash technologies, Web animations, and special effects.',5,5,'English',2000),('9780843601336','The Challenge of Interior Design',3,3,0,'Challanges of the interior Design',2,2,'English',1981),('9781423901129','Guide to Programming with Python (Book & CD Rom)',2,0,0,'Python Programming is unique and fun because of its approach: the reader learns to program through writing game programs. While it\'s enjoyable and engaging, the book covers plenty of fundamental computer science concepts and vocabulary. Topics include variables, memory, branching, loops, data structures, functions, file handling, exceptions, object-oriented programming, GUI programming, multimedia programming, and program planning. Even with all the power it offers to industry, Python is perfect for beginners. It has clear, simple syntax and is robust yet concise. Python Programming is the most fun way to learn the basics of programming using an easy-to-learn but powerful industry-standard programming language.',6,6,'English',2008),('9781875402007','Kimono: Straight-Line Patchwork On A Japanese Theme',1,1,0,'Independent book & art merchants since 2006. Curious & collectable books. Strange & beautiful art. Logical Unsanity currently operates a 24 hour honesty system book shed in Bardon, Brisbane alongside a high quality section and art gallery at the same address.',3,3,'English',1991),('9788801005240','Incontriamo Gesù',1,0,1,'Il nuovo, atteso documento ufficiale dei Vescovi italiani sulla catechesi. Il testo, redatto dalla Commissione Episcopale per la Dottrina della Fede, l\'Annuncio e la Catechesi e sancito dal voto della 66ª Assemblea Generale della Conferenza Episcopale Italiana (19-22 maggio 2014), è il frutto di un cammino decennale ed è destinato a diventare il punto di riferimento per parroci, catechisti e operatori pastorali, chiamati a un rinnovamento del modo di \"fare catechesi\" oggi.',8,8,'Italian',1993),('9788801102444','Pace a questa casa. Rito della benedizione della casa',4,2,0,'Rito della benedizione della casa.',8,8,'Italian',1993);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `library`.`books create check isbn trigger`
BEFORE INSERT ON `library`.`books`
FOR EACH ROW
BEGIN
     DECLARE isbn VARCHAR(17);
     DECLARE isbnCheck tinyint(1);
     DECLARE isbnLen INT DEFAULT 0;
     SET isbn = NEW.ISBN;
	 IF isbn LIKE '%{-}%' THEN
		SET isbn = REPLACE(isbn,"-", "");
	 END IF;
	 Set isbnLen = CHAR_LENGTH(isbn);
     CASE isbnLen      
      WHEN 13 THEN 
      SET isbnCheck = isbn13check(isbn);
      ELSE
        BEGIN
        END;
    END CASE;      
          IF isbnCheck = false
          THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Cannot add or update row: invalid ISBN';
          END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `library`.`update author books count when book added` AFTER INSERT ON `books` FOR EACH ROW
BEGIN
DECLARE numberOfBooks int;
SET numberOfBooks = (SELECT COUNT(ISBN) FROM books WHERE author_id = New.author_id);
UPDATE `authors`
SET 
    number_of_books = numberOfBooks
WHERE
    author_id = New.author_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `library`.`update author books count when book removed` AFTER DELETE ON `books` FOR EACH ROW
BEGIN
DECLARE numberOfBooks int;
SET numberOfBooks = (SELECT COUNT(ISBN) FROM books WHERE author_id = Old.author_id);
UPDATE `authors`
SET 
    number_of_books = numberOfBooks
WHERE
    author_id = Old.author_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `booksloaned`
--

DROP TABLE IF EXISTS `booksloaned`;
/*!50001 DROP VIEW IF EXISTS `booksloaned`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `booksloaned` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `cpr`,
 1 AS `due_date`,
 1 AS `return_date`,
 1 AS `fee`,
 1 AS `ISBN`,
 1 AS `title`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan` (
  `loan_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hand_out_date` datetime NOT NULL,
  `due_date` datetime NOT NULL,
  `fee` float unsigned DEFAULT NULL,
  `unique_book_id` int(11) NOT NULL,
  `members_cpr` varchar(10) NOT NULL,
  `return_date` datetime DEFAULT NULL,
  PRIMARY KEY (`loan_id`),
  UNIQUE KEY `load_id_UNIQUE` (`loan_id`),
  KEY `fk_loan_book1_idx` (`unique_book_id`),
  KEY `fk_loan_members1_idx` (`members_cpr`),
  CONSTRAINT `fk_loan_book` FOREIGN KEY (`unique_book_id`) REFERENCES `book` (`unique_book_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_loan_members` FOREIGN KEY (`members_cpr`) REFERENCES `members` (`cpr`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (1,'2017-03-19 12:25:30','2017-04-19 12:25:30',0,3,'1701922471',NULL),(2,'2017-03-15 12:45:40','2017-04-15 12:45:40',0,6,'1806942631',NULL),(3,'2017-03-02 11:38:50','2017-04-02 11:38:50',0,5,'2404961589',NULL),(4,'2017-03-29 14:52:23','2017-04-29 14:52:23',0,11,'2910932631',NULL),(5,'2017-03-16 13:43:31','2017-04-16 13:43:31',0,12,'1806942631',NULL),(6,'2017-03-01 16:13:41','2017-04-01 16:13:41',0,13,'1806942631',NULL),(7,'2017-02-06 15:41:38','2017-03-06 15:41:38',0,14,'1701922471',NULL),(8,'2017-03-08 13:42:23','2017-04-08 13:42:23',0,15,'1806942631',NULL),(9,'2017-03-22 11:34:15','2017-04-22 11:34:15',0,16,'2910932631',NULL),(10,'2017-03-22 16:38:24','2017-04-22 16:38:24',0,17,'1806942631',NULL),(11,'2017-03-16 18:41:22','2017-04-16 18:41:22',0,18,'2404961589',NULL),(12,'2017-04-02 08:19:25','2017-05-02 08:19:25',0,19,'2509941658',NULL),(13,'2017-03-28 15:35:28','2017-04-28 15:35:28',0,20,'2910932631',NULL),(18,'2017-03-28 15:35:28','2017-04-28 15:35:28',10,21,'2910932631','2017-04-30 15:35:28');
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `library`.`when new loan update in-stock and reservation if case`
AFTER INSERT ON `library`.`loan`
FOR EACH ROW
BEGIN
DECLARE memberHadReservation TINYINT(1);
DECLARE isbn VARCHAR(17);
IF NEW.return_date IS NOT NULL
THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Cannot add row: Cannot create a loan with a return date, return date should be updated when the loan is returned';
          END IF;
SET isbn = (SELECT `book`.`ISBN` FROM `book` WHERE `book`.`unique_book_id`=NEW.unique_book_id);
SET memberHadReservation = (SELECT reservation_id FROM reservation WHERE reservation.ISBN = isbn AND `reservation`.`members_cpr`=new.members_cpr);
IF memberHadReservation IS NOT NULL THEN
	UPDATE `books` SET reservations=reservations-1 WHERE `books`.`ISBN`=isbn;
	DELETE FROM `reservation` WHERE `reservation`.`reservation_id` = memberHadReservation;
END IF;
UPDATE `books` SET `in-stock`=`in-stock`-1 WHERE `books`.`ISBN`=isbn;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `library`.`when book is returned calculate fee and update available books`
BEFORE UPDATE ON `library`.`loan`
FOR EACH ROW
BEGIN
DECLARE isbn VARCHAR(17);
DECLARE lateDays INT;

IF NEW.return_date IS NOT NULL THEN
	SET isbn = (SELECT `book`.`ISBN` FROM `book` WHERE `book`.`unique_book_id`=NEW.unique_book_id);
	UPDATE `books` 
SET 
    `in-stock` = `in-stock` + 1 WHERE `books`.`ISBN`=isbn;
	
	SET lateDays = DATEDIFF(new.return_date,new.due_date);	
	IF lateDays > 0 THEN
		SET NEW.fee= lateDays*5;
	END IF;    
END IF;    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `photograph` varchar(150) NOT NULL,
  `cpr` varchar(10) NOT NULL,
  `email` varchar(80) NOT NULL,
  `status_Id` int(10) unsigned NOT NULL DEFAULT '2',
  PRIMARY KEY (`cpr`),
  UNIQUE KEY `cpr_UNIQUE` (`cpr`),
  KEY `fk_members_statuses1_idx` (`status_Id`),
  CONSTRAINT `fk_members_statuses` FOREIGN KEY (`status_Id`) REFERENCES `statuses` (`status_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES ('Liviu','Macovei','qedxgsddsa.jpg','1701922471','lm@gmail.com',2),('Eidvile','Bagdonaite','asdpoiapiasddsa.jpg','1806942631','eb@gmail.com',2),('Matus','Satara','sapodiapsosd.jpg','2404961589','ms@gmail.com',2),('Norbert','Biro','aewqpidsa.jpg','2509941658','nb@gmail.com',2),('Balint','Gergely','dsadopiasddsa.jpg','2910932631','bg@gmail.com',1);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation` (
  `reservation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `res_date` datetime NOT NULL,
  `members_cpr` varchar(10) NOT NULL,
  `ISBN` varchar(17) NOT NULL,
  PRIMARY KEY (`reservation_id`),
  UNIQUE KEY `reservation_id_UNIQUE` (`reservation_id`),
  KEY `fk_reservation_members1_idx` (`members_cpr`),
  KEY `fk_reservation_books1_idx` (`ISBN`),
  CONSTRAINT `fk_reservation_books1` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservation_members1` FOREIGN KEY (`members_cpr`) REFERENCES `members` (`cpr`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'2017-04-02 11:19:31','1806942631','9780321910578'),(2,'2017-04-02 12:47:51','2404961589','9780843601336'),(3,'2017-03-02 15:43:34','1806942631','9780843601336'),(4,'2017-03-02 14:53:31','2509941658','9780843601336'),(5,'2017-03-31 14:49:50','2509941658','9781875402007'),(6,'2017-03-31 17:32:35','2509941658','9788801102444'),(10,'2017-03-31 17:32:35','2509941658','9788801102444');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `library`.`do not allow creation of reservation if books available`
BEFORE INSERT ON `library`.`reservation`
FOR EACH ROW
BEGIN
DECLARE numberOfBooks int;
DECLARE mt VARCHAR(100);
SET numberOfBooks = (SELECT `in-stock`
					FROM            books
					WHERE        (books.ISBN = new.isbn));
IF numberOfBooks>0 
THEN
set mt = CONCAT('Cannot add or update row: There are ',numberOfBooks, ' books available');
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = mt;
          END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `library`.`when new reservation is made update books reservations count`
AFTER INSERT ON `library`.`reservation`
FOR EACH ROW
BEGIN
UPDATE `books` SET  reservations = reservations + 1       
WHERE ISBN = NEW.ISBN; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `reservedbooks`
--

DROP TABLE IF EXISTS `reservedbooks`;
/*!50001 DROP VIEW IF EXISTS `reservedbooks`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `reservedbooks` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `cpr`,
 1 AS `ISBN`,
 1 AS `title`,
 1 AS `res_date`,
 1 AS `Expr1`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuses` (
  `status_Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `comment` text,
  PRIMARY KEY (`status_Id`),
  UNIQUE KEY `idStatuses_UNIQUE` (`status_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'verified','If the user is verified'),(2,'not Verified','If the user is not verified ');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'library'
--

--
-- Dumping routines for database 'library'
--
/*!50003 DROP FUNCTION IF EXISTS `isbn13check` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `isbn13check`(`isbn` VARCHAR(13)) RETURNS tinyint(1)
    NO SQL
    DETERMINISTIC
BEGIN 
  DECLARE temp bigint;
  DECLARE result tinyint(1);
  DECLARE sumA int; 
  DECLARE i int; 
  DECLARE currentchar int; 
  DECLARE multiplier int;
  DECLARE checkdigit int;
  DECLARE lastdigit int; 
  DECLARE remainder int;
  SET result = FALSE; 

  IF NOT ( isbn IS NULL OR isbn = ' ' ) THEN 
    IF isbn LIKE '%{-}%' THEN 
      SET isbn = REPLACE(isbn,"-", ""); 
    END IF; 
    SET temp = 0; 
    # If the length is not 13 or if it contains any non numeric chars, return false 
    SET temp = cast(isbn AS UNSIGNED ); 
    IF ( Char_length(isbn) != 13 
          OR temp = 0 ) THEN 
          RETURN result; 
    END IF; 
    SET sumA = 0; 
    # Comment Source: Wikipedia 
    # The calculation of an ISBN-13 check digit begins with the first 
    # 12 digits of the thirteen-digit ISBN (thus excluding the check digit itself). 
    # Each digit, from left to right, is alternately multiplied by 1 or 3, 
    # then those products are summed modulo 10 to give a value ranging from 0 to 9. 
    # Subtracted from 10, that leaves a result from 1 to 10. A zero (0) replaces a 
    # ten (10), so, in all cases, a single check digit results. 
    SET i = 1; 
    WHILE i < 13 do 
      SET currentchar = cast(substr(isbn, i, 1) AS UNSIGNED); 
      IF ( MOD(i-1, 2) = 1 ) THEN 
        SET multiplier = 3; 
      ELSE 
        SET multiplier = 1; 
      END IF; 
      SET sumA = sumA + currentchar * multiplier; 
      SET i = i + 1; 
    END WHILE; 
    SET remainder = MOD(sumA, 10); 
    SET checkdigit = 10 - remainder; 
    IF ( checkdigit = 10 ) THEN 
      SET checkdigit = 0; 
    END IF; 
    SET lastdigit = cast(substr(isbn, 13, 1) AS UNSIGNED); 
    SET result = (checkdigit =lastdigit); 
  END IF; 
  RETURN result; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `checkisbn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `checkisbn`(isbn varchar(17))
proc_label:BEGIN 
  DECLARE temp bigint;
  DECLARE result tinyint(1);
  DECLARE sumA int; 
  DECLARE i int; 
  DECLARE currentchar int; 
  DECLARE multiplier int;
  DECLARE checkdigit int;
  DECLARE lastdigit int; 
  DECLARE remainder int;
  SET @result = FALSE; 

  IF NOT ( isbn IS NULL OR isbn = ' ' ) THEN 
    IF isbn LIKE '%{-}%' THEN 
      SET isbn = REPLACE(isbn,"-", ""); 
    END IF; 
    SET temp = 0; 
    # If the length is not 13 or if it contains any non numeric chars, return false 
    SET temp = cast(isbn AS UNSIGNED ); 
    IF ( Char_length(isbn) != 13 
          OR temp = 0 ) THEN 
          SET @result=0;
          LEAVE proc_label;
    END IF; 
    SET sumA = 0; 
    # Comment Source: Wikipedia 
    # The calculation of an ISBN-13 check digit begins with the first 
    # 12 digits of the thirteen-digit ISBN (thus excluding the check digit itself). 
    # Each digit, from left to right, is alternately multiplied by 1 or 3, 
    # then those products are summed modulo 10 to give a value ranging from 0 to 9. 
    # Subtracted from 10, that leaves a result from 1 to 10. A zero (0) replaces a 
    # ten (10), so, in all cases, a single check digit results. 
    SET i = 1; 
    WHILE i < 13 do 
      SET currentchar = cast(substr(isbn, i, 1) AS UNSIGNED); 
      IF ( MOD(i-1, 2) = 1 ) THEN 
        SET multiplier = 3; 
      ELSE 
        SET multiplier = 1; 
      END IF; 
      SET sumA = sumA + currentchar * multiplier; 
      SET i = i + 1; 
    END WHILE; 
    SET remainder = MOD(sumA, 10); 
    SET checkdigit = 10 - remainder; 
    IF ( checkdigit = 10 ) THEN 
      SET checkdigit = 0; 
    END IF; 
    SET lastdigit = cast(substr(isbn, 13, 1) AS UNSIGNED); 
    SET result = (checkdigit =lastdigit); 
  END IF; 
Select @result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `countBooksInStore` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `countBooksInStore`(in isbn VARCHAR(13))
BEGIN
DECLARE numberOfBooks int;
SET numberOfBooks = (SELECT `in-stock`
					FROM            books
					WHERE        (books.ISBN = isbn));
SELECT numberOfBooks;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `countNumberOfBooksForACertainAuthors` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `countNumberOfBooksForACertainAuthors`(in authorId int)
BEGIN
DECLARE numberOfBooks int;
SET numberOfBooks = (SELECT COUNT(ISBN) FROM books WHERE author_id = authorId);
UPDATE `authors` a 
SET 
    a.number_of_books = numberOfBooks
WHERE
    a.author_id = author_id;
	Select numberOfBooks;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `testNewLoan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `testNewLoan`(in unique_book_id int, in members_cpr varchar(13), in return_date date)
BEGIN
DECLARE memberHadReservation TINYINT(1);
DECLARE isbn VARCHAR(17);

SET isbn = (SELECT `book`.`isbn` FROM `book` WHERE `book`.`unique_book_id`=unique_book_id);
SET memberHadReservation = (SELECT reservation_id FROM reservation WHERE reservation.ISBN = isbn AND `reservation`.`members_cpr`=members_cpr);
IF memberHadReservation IS NOT NULL THEN
	UPDATE `books` SET reservations=reservations-1 WHERE ISBN=isbn;
	DELETE FROM `reservation` WHERE `reservation`.`reservation_id` = memberHadReservation;
END IF;
UPDATE `books` SET `in-stock`=`in-stock`-1 WHERE `books`.`ISBN`=isbn;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `booksloaned`
--

/*!50001 DROP VIEW IF EXISTS `booksloaned`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `booksloaned` AS select `members`.`first_name` AS `first_name`,`members`.`last_name` AS `last_name`,`members`.`cpr` AS `cpr`,`loan`.`due_date` AS `due_date`,`loan`.`return_date` AS `return_date`,`loan`.`fee` AS `fee`,`books`.`ISBN` AS `ISBN`,`books`.`title` AS `title` from (`members` left join (`loan` left join (`book` join `books` on((`book`.`ISBN` = `books`.`ISBN`))) on((`book`.`unique_book_id` = `loan`.`unique_book_id`))) on((`loan`.`members_cpr` = `members`.`cpr`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reservedbooks`
--

/*!50001 DROP VIEW IF EXISTS `reservedbooks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reservedbooks` AS select `members`.`first_name` AS `first_name`,`members`.`last_name` AS `last_name`,`members`.`cpr` AS `cpr`,`books`.`ISBN` AS `ISBN`,`books`.`title` AS `title`,`reservation`.`res_date` AS `res_date`,`reservation`.`ISBN` AS `Expr1` from ((`books` join `reservation` on((`books`.`ISBN` = `reservation`.`ISBN`))) join `members` on((`reservation`.`members_cpr` = `members`.`cpr`))) where (`reservation`.`res_date` is not null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-03 10:13:34
