CREATE DATABASE  IF NOT EXISTS `plantshop` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `plantshop`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database:plantshop
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `campaign`
--
DROP TABLE IF EXISTS `randad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `randad` (
  `ADID` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_path` varchar(20) NOT NULL,
  `ad_file` varchar(20) NOT NULL,
  `texts` varchar(100) NOT NULL,
  PRIMARY KEY (`ADID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of randad
-- ----------------------------
INSERT INTO randad VALUES ('1', 'img', 'ad01.jpg','植管人優惠開跑啦~全「管」商品滿千送百!');
INSERT INTO randad VALUES ('2', 'img', 'ad02.jpg','植管人限時免運中、、、全「管」消費666即可享免運!!心動不如馬上行動!');
INSERT INTO randad VALUES ('3', 'img', 'ad03.jpg','小小物~大大推~植管人小物推薦看這邊~');

--
-- Table structure for table `cart`
--



--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cartID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `productCategory` varchar(30) NOT NULL,
  `productID` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `totalPrice` decimal(10,2) AS (quantity * productPrice),
  `productStock` int NOT NULL,
  `cartdate` date NOT NULL,
  PRIMARY KEY (`cartID`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 AUTO_INCREMENT=1;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` (cartID,username,productCategory,productID,quantity,productPrice,productStock,cartdate) VALUES (1,'1','a',1,24,300,70,2024-05-04);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `squareplantpot`
--

DROP TABLE IF EXISTS `squareplantpot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `squareplantpot` (
  `productID` int NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `squareplantpotContent` varchar(1000) NOT NULL,
  `productStock` int NOT NULL,
  /*
  `productsubject` varchar(100) NOT NULL,
  `instock` tinyint(1) DEFAULT '0',
  */
  PRIMARY KEY (`productID`),
  UNIQUE KEY `productID_UNIQUE` (`productID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `squareplantpot` WRITE;
/*!40000 ALTER TABLE `squareplantpot` DISABLE KEYS */;
INSERT INTO `squareplantpot` VALUES (1,'plantimage/方盆/1-1.jpg','斑葉桃心蔓綠絨',450,'有助於室內空氣之淨化，降低二氧化碳、吸附空氣灰塵。且葉如心型，送給愛人或是長輩都是非常適合的選擇。',66),(2,'plantimage/方盆/2-1.jpg','珊瑚大戟',495,'又稱珊瑚大戟綴化，是綠珊瑚的特化種，生長緩慢且耐旱。綴化讓生長點變多，也使型態從長條狀的珊瑚，改變成大片珊瑚姿態，其片狀形狀都是獨一無二的限量款。',40),(3,'plantimage/方盆/3-1.jpg','荷葉椒草',450,'葉片大，圓潤肥厚，形狀像大水滴；枝節多，最長可以到18公分左右，是一種觀賞價值很高的植物。',36);
/*!40000 ALTER TABLE `squareplantpot` ENABLE KEYS */;
UNLOCK TABLES;


-- Table structure for table `rhinoplantpot`
--

DROP TABLE IF EXISTS `rhinoplantpot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rhinoplantpot` (
  `productID` int NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `rhinoplantpotContent` varchar(1000) NOT NULL,
  `productStock` int NOT NULL,
  /*
  `productsubject` varchar(100) NOT NULL,
  `instock` tinyint(1) DEFAULT '0',
  */
  PRIMARY KEY (`productID`),
  UNIQUE KEY `productID_UNIQUE` (`productID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `rhinoplantpot` WRITE;
/*!40000 ALTER TABLE `rhinoplantpot` DISABLE KEYS */;
INSERT INTO `rhinoplantpot` VALUES (1,'plantimage/犀力/1-1.jpg','斑葉桃心蔓綠絨',395,'有助於室內空氣之淨化，降低二氧化碳、吸附空氣灰塵。且葉如心型，送給愛人或是長輩都是非常適合的選擇。',66),(2,'plantimage/犀力/2-1.jpg','荷葉椒草',395,'葉片大，圓潤肥厚，形狀像大水滴；枝節多，最長可以到18公分左右，是一種觀賞價值很高的植物。',36),(3,'plantimage/犀力/3-1.jpg','迷你羅漢松',395,'由多顆種子發芽種植而成，四季常青、遒勁有力的溫潤性格，就猶如日本「禪」道的極致表現。',58);
/*!40000 ALTER TABLE `rhinoplantpot` ENABLE KEYS */;
UNLOCK TABLES;


-- Table structure for table `glassplantpot`
--

DROP TABLE IF EXISTS `glassplantpot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glassplantpot` (
  `productID` int NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `glassplantpotContent` varchar(1000) NOT NULL,
  `productStock` int NOT NULL,
  /*
  `productsubject` varchar(100) NOT NULL,
  `instock` tinyint(1) DEFAULT '0',
  */
  PRIMARY KEY (`productID`),
  UNIQUE KEY `productID_UNIQUE` (`productID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `glassplantpot` WRITE;
/*!40000 ALTER TABLE `glassplantpot` DISABLE KEYS */;
INSERT INTO `glassplantpot` VALUES (1,'plantimage/玻璃/1-1.jpg','黃金福祿桐',400,'嫩綠的葉面，周圍鑲嵌著金黃色澤的不規則的斑彩，小巧可愛的樹型，就像一盆搖曳的搖錢樹般惹人喜愛。',63),(2,'plantimage/玻璃/2-1.jpg','迷你羅漢松',300,'由多顆種子發芽種植而成，四季常青、遒勁有力的溫潤性格，就猶如日本「禪」道的極致表現。',58),(3,'plantimage/玻璃/3-1.jpg','斑葉桃心蔓綠絨',300,'有助於室內空氣之淨化，降低二氧化碳、吸附空氣灰塵。且葉如心型，送給愛人或是長輩都是非常適合的選擇。',66);
/*!40000 ALTER TABLE `glassplantpot` ENABLE KEYS */;
UNLOCK TABLES;


-- Table structure for table `homegoods`
--

DROP TABLE IF EXISTS `homegoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `homegoods` (
  `productID` int NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `homegoodsContent` varchar(1000) NOT NULL,
  `productStock` int NOT NULL,
  /*
  `productsubject` varchar(100) NOT NULL,
  `instock` tinyint(1) DEFAULT '0',
  */
  PRIMARY KEY (`productID`),
  UNIQUE KEY `productID_UNIQUE` (`productID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `homegoods` WRITE;
/*!40000 ALTER TABLE `homegoods` DISABLE KEYS */;
INSERT INTO `homegoods` VALUES (1,'plantimage/居家/1-1.jpg','盆栽祝賀卡片',79,'以窗孔龜背芋作為發想，像自然樹洞中窺視最誠摯原始的祝福；卡片形式版則以水族箱為發想，將魚菜共生、遇水則發放進小卡中。',66),(2,'plantimage/居家/2-1.jpg','手作皮革掛繩',399,'嚴選天然牛皮，植鞣革表層會漸漸變得油亮光澤，越用越亮，搭配植物更顯層次，真皮接合處採用蠟線手工縫製，無論吊掛或是提著送禮都非常適合。',66),(3,'plantimage/居家/3-1.jpg','水耕專用育植棉',250,'水耕育植棉可自行馴化水耕植物，或移植新水耕植株；讓植物自動控水，更好照顧。',66),(4,'plantimage/居家/4-2.jpg','送禮手提禮盒',15,'禮盒附有一對提繩可提著植物一起去旅行、親手送給親友或愛人手中，讓對方感受到你最真摯的誠意。',98),(5,'plantimage/居家/5-3.jpg','玻璃珠',30,'可添加於玻璃盆器、方盆上方作為裝飾使用。',45);
/*!40000 ALTER TABLE `homegoods` ENABLE KEYS */;
UNLOCK TABLES;


-- Table structure for table `kilnplantpot`
--

DROP TABLE IF EXISTS `kilnplantpot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kilnplantpot` (
  `productID` int NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `kilnplantpotContent` varchar(1000) NOT NULL,
  `productStock` int NOT NULL,
  /*
  `productsubject` varchar(100) NOT NULL,
  `instock` tinyint(1) DEFAULT '0',
  */
  PRIMARY KEY (`productID`),
  UNIQUE KEY `productID_UNIQUE` (`productID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `kilnplantpot` WRITE;
/*!40000 ALTER TABLE `kilnplantpot` DISABLE KEYS */;
INSERT INTO `kilnplantpot` VALUES (1,'plantimage/窯瓷/1-1.jpg','窗孔龜背芋',695,'多年生草本，最大特色在於葉面不規則的洞洞窗孔，因此外國也稱為“ Swiss cheese plant ”（瑞士起司）。因為外觀特別，且空氣淨化好，近年在台灣興起，常獲得咖啡、文青店的青睞。',66),(2,'plantimage/窯瓷/2-1.jpg','荷葉椒草',595,'葉片大，圓潤肥厚，形狀像大水滴；枝節多，最長可以到18公分左右，是一種觀賞價值很高的植物。',36),(3,'plantimage/窯瓷/3-1.jpg','黃金福祿桐',595,'嫩綠的葉面，周圍鑲嵌著金黃色澤的不規則的斑彩，小巧可愛的樹型，就像一盆搖曳的搖錢樹般惹人喜愛。',63);
/*!40000 ALTER TABLE `kilnplantpot` ENABLE KEYS */;
UNLOCK TABLES;


-- Table structure for table `cementplantpot`
--

DROP TABLE IF EXISTS `cementplantpot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cementplantpot` (
  `productID` int NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `cementplantpotContent` varchar(1000) NOT NULL,
  `productStock` int NOT NULL,
  /*
  `productsubject` varchar(100) NOT NULL,
  `instock` tinyint(1) DEFAULT '0',
  */
  PRIMARY KEY (`productID`),
  UNIQUE KEY `productID_UNIQUE` (`productID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `cementplantpot` WRITE;
/*!40000 ALTER TABLE `cementplantpot` DISABLE KEYS */;
INSERT INTO `cementplantpot` VALUES (1,'plantimage/水泥/1-1.jpg','圓葉椒草',595,'圓潤光滑的外觀，看起來肥嫩嫩的，但本質卻是非常硬挺的， 這樣的反差也讓許多人愛不釋手。',66),(2,'plantimage/水泥/2-1.jpg','多葉蘭',595,'葉面上有美麗的白色脈紋，脈紋呈弦月狀，因此又被稱為“弦月椒草”。 多葉蘭株型矮小，玲瓏秀美，葉片白、綠相間，對比強烈，給人清爽宜人的感覺。',66),(3,'plantimage/水泥/3-1.jpg','常春藤',595,'常春藤在古希臘被視為是神奇的植物。在希臘神話中，常春藤代表酒神：戴歐尼修斯（Dionysus），有著無窮的歡樂與活力，也意味著不朽的永恆青春。',66);
/*!40000 ALTER TABLE `cementplantpot` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `allplantpots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allplantpots` (
  `productID` int NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `allplantpotsContent` varchar(1000) NOT NULL,
  `productStock` int NOT NULL,
  /*
  `productsubject` varchar(100) NOT NULL,
  `instock` tinyint(1) DEFAULT '0',
  */
  PRIMARY KEY (`productID`),
  UNIQUE KEY `productID_UNIQUE` (`productID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `allplantpots` WRITE;
/*!40000 ALTER TABLE `allplantpots` DISABLE KEYS */;
INSERT INTO `allplantpots` VALUES (1,'plantimage/盆栽/1-1.jpg','絨葉鳳梨',300,'大紅色彩可一點也不低調，既大張旗鼓又引人注目， 還有著堅硬的質地跟那超前眾人的前衛，不得不說， 萬人之中，妳最亮眼。',66),(2,'plantimage/盆栽/2-1.jpg','乳斑椒草',300,'乳斑椒草變化萬千。有的像藤蔓般垂墜、有的亭亭直立；有的濃綠、有的淺黃；有的葉片光滑如鏡，像上了層漆或蠟似的。與圓葉椒草屬於同科兄弟但卻更加有個性。',66),(3,'plantimage/盆栽/3-1.jpg','金手指',300,'肥嘟嘟金手指，圓胖的葉子搭配斑斕變化的斑點，是變葉木中最可愛的一種；非常耐養好照顧，給水就能肥嘟嘟～',66),(4,'plantimage/盆栽/4-1.jpg','綠珊瑚',495,'亦稱綠玉樹，屬於多肉植物，生長緩慢、葉片細小。 外型就如同小小珊瑚，是陸地上的綠色珊瑚礁。',98),(5,'plantimage/盆栽/5-1.jpg','銀翼山蘇',595,'葉子就像波浪般地柔軟，但實際卻皺而挺立。在觀葉植物中非常具有指標性，特別又有個性。',45),(6,'plantimage/盆栽/6-1.jpg','大理石合果芋',595,'葉面有著如雲狀般的紋理，細看就有如大理石般細緻而有層次，葉型則呈三角形生長，慢慢一層一層往上生長，刻劃出獨一無二的美麗葉斑。',36),(7,'plantimage/盆栽/7-1.jpg','一心一意',495,'此為心葉毬蘭單葉版本，象徵一心忠誠、只融於你，若要說濃情蜜意，任誰也比不過心葉毬蘭。',36),(8,'plantimage/盆栽/8-1.jpg','十二支卷',395,'異形般的觸角開竄出來，突起的白斑是他的偽裝，難道他是外太空來的神秘生物？',36),(9,'plantimage/盆栽/9-1.jpg','常春藤',395,'常春藤在古希臘被視為是神奇的植物。在希臘神話中，常春藤代表酒神：戴歐尼修斯（Dionysus），有著無窮的歡樂與活力，也意味著不朽的永恆青春。',36),(10,'plantimage/盆栽/10-1.jpg','編織發財樹',395,'發財樹的種植是非常需要耐心的；彎曲的枝節、編織的幅度、向陽的角度， 從栽種選枝到纏繞成樹，最終組合成栽， 每一步驟皆是植物工匠堆疊的傑作。',66);
/*!40000 ALTER TABLE `allplantpots` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `randomimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `randomimage` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `randomimage` WRITE;
/*!40000 ALTER TABLE `randomimage` DISABLE KEYS */;
INSERT INTO `randomimage` VALUES (1,'plantimage/隨機/1.jpg'),(2,'plantimage/隨機/2.jpg'),(3,'plantimage/隨機/3.jpg'),(4,'plantimage/隨機/4.jpg'),(5,'plantimage/隨機/5.jpg'),(6,'plantimage/隨機/6.jpg'),(7,'plantimage/隨機/7.jpg'),(8,'plantimage/隨機/8.jpg'),(9,'plantimage/隨機/9.jpg'),(10,'plantimage/隨機/10.jpg'),(11,'plantimage/隨機/11.jpg'),(12,'plantimage/隨機/12.jpg');
UNLOCK TABLES;


--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `commentID` int NOT NULL AUTO_INCREMENT,
  `productCategory` varchar(30) NOT NULL,
  `productID` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `content` varchar(100) DEFAULT NULL,
  `rating` int NOT NULL DEFAULT '0',
  `commentdate` date NOT NULL,
  PRIMARY KEY (`commentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 AUTO_INCREMENT=1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (4,'a','3','CYIM','商品很棒',5,'2024-05-24');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `member`
--
DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `mid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  PRIMARY KEY (`mid`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `mid_UNIQUE` (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'CYIM','11144116','何明叡','0912345678','桃園市中壢區','abc@gmail.com','male','2024-05-20'),(2,'11144122','1234','林吟珊','0912345688','桃園市中壢區','abc1@gmail.com','male','2024-05-20');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `orderID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `productName` varchar(45) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`orderID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'CYIM','絨葉鳳梨',1);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

