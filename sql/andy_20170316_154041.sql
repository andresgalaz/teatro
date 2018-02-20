-- MySQL dump 10.13  Distrib 5.5.54, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: andy
-- ------------------------------------------------------
-- Server version	5.5.54-0+deb8u1

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
-- Current Database: `andy`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `andy` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `andy`;

--
-- Table structure for table `tAsiento`
--

DROP TABLE IF EXISTS `tAsiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tAsiento` (
  `pAsiento` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fTeatro` smallint(5) unsigned NOT NULL DEFAULT '1',
  `fTpAsiento` char(1) NOT NULL,
  `nFila` smallint(5) unsigned NOT NULL,
  `nColumna` smallint(5) unsigned NOT NULL,
  `cIdFila` varchar(20) DEFAULT NULL,
  `cIdColumna` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`pAsiento`),
  UNIQUE KEY `iu_asiento_teatroFilaCol` (`fTeatro`,`nFila`,`nColumna`)
) ENGINE=InnoDB AUTO_INCREMENT=1343 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tAsiento`
--

LOCK TABLES `tAsiento` WRITE;
/*!40000 ALTER TABLE `tAsiento` DISABLE KEYS */;
INSERT INTO `tAsiento` VALUES (903,1,'X',1,1,NULL,NULL),(904,1,'Z',1,2,NULL,NULL),(905,1,'Z',1,3,NULL,NULL),(906,1,'Z',1,4,NULL,NULL),(907,1,'Z',1,5,NULL,NULL),(908,1,'Z',1,6,NULL,NULL),(909,1,'Z',1,7,NULL,NULL),(910,1,'Z',1,8,NULL,NULL),(911,1,'Z',1,9,NULL,NULL),(912,1,'Z',1,10,NULL,NULL),(913,1,'Z',1,11,NULL,NULL),(914,1,'Z',1,12,NULL,NULL),(915,1,'Z',1,13,NULL,NULL),(916,1,'Z',1,14,NULL,NULL),(917,1,'Z',1,15,NULL,NULL),(918,1,'Z',1,16,NULL,NULL),(919,1,'Z',1,17,NULL,NULL),(920,1,'Z',1,18,NULL,NULL),(921,1,'Z',1,19,NULL,NULL),(922,1,'X',1,20,NULL,NULL),(923,1,'X',2,1,NULL,NULL),(924,1,'X',2,2,NULL,NULL),(925,1,'X',2,3,NULL,NULL),(926,1,'Z',2,4,NULL,NULL),(927,1,'Z',2,5,NULL,NULL),(928,1,'Z',2,6,NULL,NULL),(929,1,'Z',2,7,NULL,NULL),(930,1,'Z',2,8,NULL,NULL),(931,1,'Z',2,9,NULL,NULL),(932,1,'Z',2,10,NULL,NULL),(933,1,'Z',2,11,NULL,NULL),(934,1,'Z',2,12,NULL,NULL),(935,1,'Z',2,13,NULL,NULL),(936,1,'Z',2,14,NULL,NULL),(937,1,'Z',2,15,NULL,NULL),(938,1,'Z',2,16,NULL,NULL),(939,1,'Z',2,17,NULL,NULL),(940,1,'X',2,18,NULL,NULL),(941,1,'X',2,19,NULL,NULL),(942,1,'X',2,20,NULL,NULL),(943,1,'X',3,1,NULL,NULL),(944,1,'X',3,2,NULL,NULL),(945,1,'X',3,3,NULL,NULL),(946,1,'X',3,4,NULL,NULL),(947,1,'X',3,5,NULL,NULL),(948,1,'X',3,6,NULL,NULL),(949,1,'X',3,7,NULL,NULL),(950,1,'X',3,8,NULL,NULL),(951,1,'X',3,9,NULL,NULL),(952,1,'X',3,10,NULL,NULL),(953,1,'X',3,11,NULL,NULL),(954,1,'X',3,12,NULL,NULL),(955,1,'X',3,13,NULL,NULL),(956,1,'X',3,14,NULL,NULL),(957,1,'X',3,15,NULL,NULL),(958,1,'X',3,16,NULL,NULL),(959,1,'X',3,17,NULL,NULL),(960,1,'X',3,18,NULL,NULL),(961,1,'X',3,19,NULL,NULL),(962,1,'X',3,20,NULL,NULL),(963,1,'X',4,1,NULL,NULL),(964,1,'X',4,2,NULL,NULL),(965,1,'X',4,3,NULL,NULL),(966,1,'X',4,4,NULL,NULL),(967,1,'X',4,5,NULL,NULL),(968,1,'X',4,6,NULL,NULL),(969,1,'X',4,7,NULL,NULL),(970,1,'X',4,8,NULL,NULL),(971,1,'X',4,9,NULL,NULL),(972,1,'X',4,10,NULL,NULL),(973,1,'X',4,11,NULL,NULL),(974,1,'X',4,12,NULL,NULL),(975,1,'X',4,13,NULL,NULL),(976,1,'X',4,14,NULL,NULL),(977,1,'X',4,15,NULL,NULL),(978,1,'X',4,16,NULL,NULL),(979,1,'X',4,17,NULL,NULL),(980,1,'X',4,18,NULL,NULL),(981,1,'X',4,19,NULL,NULL),(982,1,'X',4,20,NULL,NULL),(983,1,'X',5,1,'A','17'),(984,1,'X',5,2,'A','15'),(985,1,'X',5,3,'A','13'),(986,1,'X',5,4,'A','11'),(987,1,'X',5,5,NULL,NULL),(988,1,'C',5,6,'A','10'),(989,1,'C',5,7,'A','9'),(990,1,'C',5,8,'A','8'),(991,1,'C',5,9,'A','7'),(992,1,'C',5,10,'A','6'),(993,1,'C',5,11,'A','5'),(994,1,'C',5,12,'A','4'),(995,1,'C',5,13,'A','3'),(996,1,'C',5,14,'A','2'),(997,1,'C',5,15,'A','1'),(998,1,'X',5,16,NULL,NULL),(999,1,'X',5,17,'A','12'),(1000,1,'X',5,18,'A','14'),(1001,1,'X',5,19,'A','16'),(1002,1,'X',5,20,'A','18'),(1003,1,'X',6,1,'B','17'),(1004,1,'X',6,2,'B','15'),(1005,1,'X',6,3,'B','13'),(1006,1,'X',6,4,'B','11'),(1007,1,'X',6,5,NULL,NULL),(1008,1,'C',6,6,'B','10'),(1009,1,'C',6,7,'B','9'),(1010,1,'C',6,8,'B','8'),(1011,1,'C',6,9,'B','7'),(1012,1,'C',6,10,'B','6'),(1013,1,'C',6,11,'B','5'),(1014,1,'C',6,12,'B','4'),(1015,1,'C',6,13,'B','3'),(1016,1,'C',6,14,'B','2'),(1017,1,'C',6,15,'B','1'),(1018,1,'X',6,16,NULL,NULL),(1019,1,'X',6,17,'B','12'),(1020,1,'X',6,18,'B','14'),(1021,1,'X',6,19,'B','16'),(1022,1,'X',6,20,'B','18'),(1023,1,'X',7,1,'C','17'),(1024,1,'A',7,2,'C','15'),(1025,1,'A',7,3,'C','13'),(1026,1,'A',7,4,'C','11'),(1027,1,'X',7,5,NULL,NULL),(1028,1,'C',7,6,'C','10'),(1029,1,'C',7,7,'C','9'),(1030,1,'C',7,8,'C','8'),(1031,1,'C',7,9,'C','7'),(1032,1,'C',7,10,'C','6'),(1033,1,'C',7,11,'C','5'),(1034,1,'C',7,12,'C','4'),(1035,1,'C',7,13,'C','3'),(1036,1,'C',7,14,'C','2'),(1037,1,'C',7,15,'C','1'),(1038,1,'X',7,16,NULL,NULL),(1039,1,'E',7,17,'C','12'),(1040,1,'E',7,18,'C','14'),(1041,1,'E',7,19,'C','16'),(1042,1,'X',7,20,'C','18'),(1043,1,'A',8,1,'D','17'),(1044,1,'A',8,2,'D','15'),(1045,1,'A',8,3,'D','13'),(1046,1,'A',8,4,'D','11'),(1047,1,'X',8,5,NULL,NULL),(1048,1,'C',8,6,'D','10'),(1049,1,'C',8,7,'D','9'),(1050,1,'C',8,8,'D','8'),(1051,1,'C',8,9,'D','7'),(1052,1,'C',8,10,'D','6'),(1053,1,'C',8,11,'D','5'),(1054,1,'C',8,12,'D','4'),(1055,1,'C',8,13,'D','3'),(1056,1,'C',8,14,'D','2'),(1057,1,'C',8,15,'D','1'),(1058,1,'X',8,16,NULL,NULL),(1059,1,'E',8,17,'D','12'),(1060,1,'E',8,18,'D','14'),(1061,1,'E',8,19,'D','16'),(1062,1,'X',8,20,'D','18'),(1063,1,'A',9,1,'E','17'),(1064,1,'A',9,2,'E','15'),(1065,1,'A',9,3,'E','13'),(1066,1,'A',9,4,'E','11'),(1067,1,'X',9,5,NULL,NULL),(1068,1,'C',9,6,'E','10'),(1069,1,'C',9,7,'E','9'),(1070,1,'C',9,8,'E','8'),(1071,1,'C',9,9,'E','7'),(1072,1,'C',9,10,'E','6'),(1073,1,'C',9,11,'E','5'),(1074,1,'C',9,12,'E','4'),(1075,1,'C',9,13,'E','3'),(1076,1,'C',9,14,'E','2'),(1077,1,'C',9,15,'E','1'),(1078,1,'X',9,16,NULL,NULL),(1079,1,'E',9,17,'E','12'),(1080,1,'E',9,18,'E','14'),(1081,1,'E',9,19,'E','16'),(1082,1,'X',9,20,'E','18'),(1083,1,'A',10,1,'F','17'),(1084,1,'A',10,2,'F','15'),(1085,1,'A',10,3,'F','13'),(1086,1,'A',10,4,'F','11'),(1087,1,'X',10,5,NULL,NULL),(1088,1,'C',10,6,'F','10'),(1089,1,'C',10,7,'F','9'),(1090,1,'C',10,8,'F','8'),(1091,1,'C',10,9,'F','7'),(1092,1,'C',10,10,'F','6'),(1093,1,'C',10,11,'F','5'),(1094,1,'C',10,12,'F','4'),(1095,1,'C',10,13,'F','3'),(1096,1,'C',10,14,'F','2'),(1097,1,'C',10,15,'F','1'),(1098,1,'X',10,16,NULL,NULL),(1099,1,'E',10,17,'F','12'),(1100,1,'E',10,18,'F','14'),(1101,1,'E',10,19,'F','16'),(1102,1,'X',10,20,'F','18'),(1103,1,'A',11,1,'G','17'),(1104,1,'A',11,2,'G','15'),(1105,1,'A',11,3,'G','13'),(1106,1,'A',11,4,'G','11'),(1107,1,'X',11,5,NULL,NULL),(1108,1,'C',11,6,'G','10'),(1109,1,'C',11,7,'G','9'),(1110,1,'C',11,8,'G','8'),(1111,1,'C',11,9,'G','7'),(1112,1,'C',11,10,'G','6'),(1113,1,'C',11,11,'G','5'),(1114,1,'C',11,12,'G','4'),(1115,1,'C',11,13,'G','3'),(1116,1,'C',11,14,'G','2'),(1117,1,'C',11,15,'G','1'),(1118,1,'X',11,16,NULL,NULL),(1119,1,'E',11,17,'G','12'),(1120,1,'E',11,18,'G','14'),(1121,1,'E',11,19,'G','16'),(1122,1,'X',11,20,'G','18'),(1123,1,'A',12,1,'H','17'),(1124,1,'A',12,2,'H','15'),(1125,1,'A',12,3,'H','13'),(1126,1,'A',12,4,'H','11'),(1127,1,'X',12,5,NULL,NULL),(1128,1,'C',12,6,'H','10'),(1129,1,'C',12,7,'H','9'),(1130,1,'C',12,8,'H','8'),(1131,1,'C',12,9,'H','7'),(1132,1,'C',12,10,'H','6'),(1133,1,'C',12,11,'H','5'),(1134,1,'C',12,12,'H','4'),(1135,1,'C',12,13,'H','3'),(1136,1,'C',12,14,'H','2'),(1137,1,'C',12,15,'H','1'),(1138,1,'X',12,16,NULL,NULL),(1139,1,'E',12,17,'H','12'),(1140,1,'E',12,18,'H','14'),(1141,1,'E',12,19,'H','16'),(1142,1,'X',12,20,'H','18'),(1143,1,'A',13,1,'J','17'),(1144,1,'A',13,2,'J','15'),(1145,1,'A',13,3,'J','13'),(1146,1,'A',13,4,'J','11'),(1147,1,'X',13,5,NULL,NULL),(1148,1,'C',13,6,'J','10'),(1149,1,'C',13,7,'J','9'),(1150,1,'C',13,8,'J','8'),(1151,1,'C',13,9,'J','7'),(1152,1,'C',13,10,'J','6'),(1153,1,'C',13,11,'J','5'),(1154,1,'C',13,12,'J','4'),(1155,1,'C',13,13,'J','3'),(1156,1,'C',13,14,'J','2'),(1157,1,'C',13,15,'J','1'),(1158,1,'X',13,16,NULL,NULL),(1159,1,'E',13,17,'J','12'),(1160,1,'E',13,18,'J','14'),(1161,1,'E',13,19,'J','16'),(1162,1,'X',13,20,'J','18'),(1163,1,'A',14,1,'K','17'),(1164,1,'A',14,2,'K','15'),(1165,1,'A',14,3,'K','13'),(1166,1,'A',14,4,'K','11'),(1167,1,'X',14,5,NULL,NULL),(1168,1,'C',14,6,'K','10'),(1169,1,'C',14,7,'K','9'),(1170,1,'C',14,8,'K','8'),(1171,1,'C',14,9,'K','7'),(1172,1,'C',14,10,'K','6'),(1173,1,'C',14,11,'K','5'),(1174,1,'C',14,12,'K','4'),(1175,1,'C',14,13,'K','3'),(1176,1,'C',14,14,'K','2'),(1177,1,'C',14,15,'K','1'),(1178,1,'X',14,16,NULL,NULL),(1179,1,'E',14,17,'K','12'),(1180,1,'E',14,18,'K','14'),(1181,1,'E',14,19,'K','16'),(1182,1,'E',14,20,'K','18'),(1183,1,'A',15,1,'L','17'),(1184,1,'A',15,2,'L','15'),(1185,1,'A',15,3,'L','13'),(1186,1,'A',15,4,'L','11'),(1187,1,'X',15,5,NULL,NULL),(1188,1,'C',15,6,'L','10'),(1189,1,'C',15,7,'L','9'),(1190,1,'C',15,8,'L','8'),(1191,1,'C',15,9,'L','7'),(1192,1,'C',15,10,'L','6'),(1193,1,'C',15,11,'L','5'),(1194,1,'C',15,12,'L','4'),(1195,1,'C',15,13,'L','3'),(1196,1,'C',15,14,'L','2'),(1197,1,'C',15,15,'L','1'),(1198,1,'X',15,16,NULL,NULL),(1199,1,'E',15,17,'L','12'),(1200,1,'E',15,18,'L','14'),(1201,1,'E',15,19,'L','16'),(1202,1,'E',15,20,'L','18'),(1203,1,'A',16,1,'M','17'),(1204,1,'A',16,2,'M','15'),(1205,1,'A',16,3,'M','13'),(1206,1,'A',16,4,'M','11'),(1207,1,'X',16,5,NULL,NULL),(1208,1,'C',16,6,'M','10'),(1209,1,'C',16,7,'M','9'),(1210,1,'C',16,8,'M','8'),(1211,1,'C',16,9,'M','7'),(1212,1,'C',16,10,'M','6'),(1213,1,'C',16,11,'M','5'),(1214,1,'C',16,12,'M','4'),(1215,1,'C',16,13,'M','3'),(1216,1,'C',16,14,'M','2'),(1217,1,'C',16,15,'M','1'),(1218,1,'X',16,16,NULL,NULL),(1219,1,'E',16,17,'M','12'),(1220,1,'E',16,18,'M','14'),(1221,1,'E',16,19,'M','16'),(1222,1,'E',16,20,'M','18'),(1223,1,'A',17,1,'N','17'),(1224,1,'A',17,2,'N','15'),(1225,1,'A',17,3,'N','13'),(1226,1,'A',17,4,'N','11'),(1227,1,'X',17,5,NULL,NULL),(1228,1,'C',17,6,'N','10'),(1229,1,'C',17,7,'N','9'),(1230,1,'C',17,8,'N','8'),(1231,1,'C',17,9,'N','7'),(1232,1,'C',17,10,'N','6'),(1233,1,'C',17,11,'N','5'),(1234,1,'C',17,12,'N','4'),(1235,1,'C',17,13,'N','3'),(1236,1,'C',17,14,'N','2'),(1237,1,'C',17,15,'N','1'),(1238,1,'X',17,16,NULL,NULL),(1239,1,'E',17,17,'N','12'),(1240,1,'E',17,18,'N','14'),(1241,1,'E',17,19,'N','16'),(1242,1,'E',17,20,'N','18'),(1243,1,'X',18,1,NULL,NULL),(1244,1,'X',18,2,NULL,NULL),(1245,1,'X',18,3,NULL,NULL),(1246,1,'X',18,4,NULL,NULL),(1247,1,'X',18,5,NULL,NULL),(1248,1,'X',18,6,NULL,NULL),(1249,1,'X',18,7,NULL,NULL),(1250,1,'X',18,8,NULL,NULL),(1251,1,'X',18,9,NULL,NULL),(1252,1,'X',18,10,NULL,NULL),(1253,1,'X',18,11,NULL,NULL),(1254,1,'X',18,12,NULL,NULL),(1255,1,'X',18,13,NULL,NULL),(1256,1,'X',18,14,NULL,NULL),(1257,1,'X',18,15,NULL,NULL),(1258,1,'X',18,16,NULL,NULL),(1259,1,'X',18,17,NULL,NULL),(1260,1,'X',18,18,NULL,NULL),(1261,1,'X',18,19,NULL,NULL),(1262,1,'X',18,20,NULL,NULL),(1263,1,'B',19,1,'P','17'),(1264,1,'B',19,2,'P','15'),(1265,1,'B',19,3,'P','13'),(1266,1,'B',19,4,'P','11'),(1267,1,'X',19,5,NULL,NULL),(1268,1,'X',19,6,'P','10'),(1269,1,'X',19,7,'P','9'),(1270,1,'X',19,8,'P','8'),(1271,1,'D',19,9,'P','5'),(1272,1,'D',19,10,'P','4'),(1273,1,'D',19,11,'P','3'),(1274,1,'D',19,12,'P','2'),(1275,1,'D',19,13,'P','1'),(1276,1,'X',19,14,'P','2'),(1277,1,'X',19,15,'P','1'),(1278,1,'X',19,16,NULL,NULL),(1279,1,'F',19,17,'P','12'),(1280,1,'F',19,18,'P','14'),(1281,1,'F',19,19,'P','16'),(1282,1,'F',19,20,'P','18'),(1283,1,'B',20,1,'Q','17'),(1284,1,'B',20,2,'Q','15'),(1285,1,'B',20,3,'Q','13'),(1286,1,'B',20,4,'Q','11'),(1287,1,'X',20,5,NULL,NULL),(1288,1,'X',20,6,'Q','10'),(1289,1,'X',20,7,'Q','9'),(1290,1,'X',20,8,'Q','8'),(1291,1,'D',20,9,'Q','5'),(1292,1,'D',20,10,'Q','4'),(1293,1,'D',20,11,'Q','3'),(1294,1,'D',20,12,'Q','2'),(1295,1,'D',20,13,'Q','1'),(1296,1,'X',20,14,'Q','2'),(1297,1,'X',20,15,'Q','1'),(1298,1,'X',20,16,NULL,NULL),(1299,1,'F',20,17,'Q','12'),(1300,1,'F',20,18,'Q','14'),(1301,1,'F',20,19,'Q','16'),(1302,1,'F',20,20,'Q','18'),(1303,1,'B',21,1,'R','17'),(1304,1,'B',21,2,'R','15'),(1305,1,'B',21,3,'R','13'),(1306,1,'B',21,4,'R','11'),(1307,1,'X',21,5,NULL,NULL),(1308,1,'X',21,6,'R','10'),(1309,1,'X',21,7,'R','9'),(1310,1,'X',21,8,'R','8'),(1311,1,'X',21,9,'R','7'),(1312,1,'X',21,10,'R','6'),(1313,1,'X',21,11,'R','5'),(1314,1,'X',21,12,'R','4'),(1315,1,'X',21,13,'R','3'),(1316,1,'X',21,14,'R','2'),(1317,1,'X',21,15,'R','1'),(1318,1,'X',21,16,NULL,NULL),(1319,1,'F',21,17,'R','12'),(1320,1,'F',21,18,'R','14'),(1321,1,'F',21,19,'R','16'),(1322,1,'F',21,20,'R','18'),(1323,1,'B',22,1,'S','17'),(1324,1,'B',22,2,'S','15'),(1325,1,'B',22,3,'S','13'),(1326,1,'B',22,4,'S','11'),(1327,1,'X',22,5,NULL,NULL),(1328,1,'X',22,6,'S','10'),(1329,1,'X',22,7,'S','9'),(1330,1,'X',22,8,'S','8'),(1331,1,'X',22,9,'S','7'),(1332,1,'X',22,10,'S','6'),(1333,1,'X',22,11,'S','5'),(1334,1,'X',22,12,'S','4'),(1335,1,'X',22,13,'S','3'),(1336,1,'X',22,14,'S','2'),(1337,1,'X',22,15,'S','1'),(1338,1,'G',22,16,'S','12'),(1339,1,'G',22,17,'S','14'),(1340,1,'G',22,18,'S','16'),(1341,1,'G',22,19,'S','18'),(1342,1,'G',22,20,'S','20');
/*!40000 ALTER TABLE `tAsiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tEvento`
--

DROP TABLE IF EXISTS `tEvento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tEvento` (
  `pEvento` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fTeatro` smallint(5) unsigned NOT NULL DEFAULT '1',
  `tFecha` datetime NOT NULL,
  `bAbierto` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`pEvento`),
  KEY `iuEvento_teatroFecHora` (`fTeatro`,`tFecha`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tEvento`
--

LOCK TABLES `tEvento` WRITE;
/*!40000 ALTER TABLE `tEvento` DISABLE KEYS */;
INSERT INTO `tEvento` VALUES (1,1,'2017-03-16 18:30:00','1'),(2,1,'2017-03-16 22:00:00','1'),(3,1,'2017-03-17 18:30:00','1'),(4,1,'2017-03-17 22:00:00','1'),(5,1,'2017-03-15 18:30:00','0'),(6,1,'2017-03-15 22:00:00','1');
/*!40000 ALTER TABLE `tEvento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tEventoAsiento`
--

DROP TABLE IF EXISTS `tEventoAsiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tEventoAsiento` (
  `pEventoAsiento` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fTeatro` smallint(5) unsigned NOT NULL DEFAULT '1',
  `fEvento` int(10) unsigned NOT NULL,
  `fAsiento` int(10) unsigned NOT NULL,
  `fUsuario` smallint(5) unsigned NOT NULL,
  `cDescripcion` varchar(100) DEFAULT NULL,
  `tCreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tAnulacion` datetime DEFAULT NULL,
  `fUsuarioAnulacion` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`pEventoAsiento`),
  UNIQUE KEY `iuEventoAsiento_reserva` (`fTeatro`,`fEvento`,`fAsiento`),
  KEY `tEvAsiento_usuario` (`fUsuario`),
  KEY `tEvAsiento_evento` (`fEvento`),
  KEY `tEvAsiento_usrAnula` (`fUsuarioAnulacion`),
  KEY `tEvAsiento_asiento` (`fAsiento`),
  CONSTRAINT `tEvAsiento_usuario` FOREIGN KEY (`fUsuario`) REFERENCES `tUsuario` (`pUsuario`),
  CONSTRAINT `tEvAsiento_evento` FOREIGN KEY (`fEvento`) REFERENCES `tEvento` (`pEvento`),
  CONSTRAINT `tEvAsiento_usrAnula` FOREIGN KEY (`fUsuarioAnulacion`) REFERENCES `tUsuario` (`pUsuario`),
  CONSTRAINT `tEvAsiento_asiento` FOREIGN KEY (`fAsiento`) REFERENCES `tAsiento` (`pAsiento`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tEventoAsiento`
--

LOCK TABLES `tEventoAsiento` WRITE;
/*!40000 ALTER TABLE `tEventoAsiento` DISABLE KEYS */;
INSERT INTO `tEventoAsiento` VALUES (1,1,5,989,2,'','2017-03-16 13:27:41',NULL,NULL),(2,1,5,990,2,'','2017-03-16 13:57:40',NULL,NULL),(3,1,5,988,2,'','2017-03-16 13:58:11',NULL,NULL),(4,1,6,1008,3,'','2017-03-16 14:02:42',NULL,NULL),(5,1,6,1009,3,'','2017-03-16 14:02:48',NULL,NULL),(7,1,6,1011,3,'','2017-03-16 14:08:01',NULL,NULL),(8,1,6,1012,3,'','2017-03-16 14:08:04',NULL,NULL),(9,1,6,1013,3,'Ejemplito','2017-03-16 14:25:26',NULL,NULL),(10,1,6,1014,2,'Por mi','2017-03-16 14:26:51',NULL,NULL),(11,1,6,1010,3,'','2017-03-16 16:57:44',NULL,NULL),(17,1,6,1031,2,'','2017-03-16 17:40:33',NULL,NULL),(19,1,6,1030,2,'','2017-03-16 17:41:54',NULL,NULL),(20,1,6,1029,2,'','2017-03-16 17:53:25',NULL,NULL),(22,1,6,1028,2,'','2017-03-16 17:54:43',NULL,NULL),(24,1,6,1032,3,'Crhome','2017-03-16 17:58:37',NULL,NULL),(27,1,6,1033,2,'','2017-03-16 18:02:32',NULL,NULL),(29,1,6,1034,3,'jjjj','2017-03-16 18:03:53',NULL,NULL),(31,1,6,997,2,'A!A!A!A!A!A!A!A!A!A!','2017-03-16 18:04:38',NULL,NULL),(33,1,6,1017,2,'','2017-03-16 18:14:26',NULL,NULL),(34,1,6,1037,2,'','2017-03-16 18:14:47',NULL,NULL),(36,1,6,996,2,'','2017-03-16 18:28:44',NULL,NULL),(37,1,6,1041,2,'','2017-03-16 18:30:41',NULL,NULL),(38,1,6,1043,3,'','2017-03-16 18:31:12',NULL,NULL),(39,1,6,1024,3,'','2017-03-16 18:33:56',NULL,NULL),(40,1,6,1025,3,'','2017-03-16 18:33:58',NULL,NULL),(41,1,6,1026,2,'','2017-03-16 18:35:10',NULL,NULL),(42,1,6,1039,3,'','2017-03-16 18:36:40',NULL,NULL),(43,1,6,1040,3,'','2017-03-16 18:36:42',NULL,NULL),(44,1,6,1016,3,'','2017-03-16 18:37:26',NULL,NULL),(45,1,6,1036,3,'','2017-03-16 18:37:36',NULL,NULL);
/*!40000 ALTER TABLE `tEventoAsiento` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`agalaz`@`localhost`*/ /*!50003 TRIGGER `andy`.`trgEventoAsientoDel` BEFORE DELETE
    ON andy.tEventoAsiento FOR EACH ROW
BEGIN
    INSERT INTO andy.tEventoAsientoHist
          ( pEventoAsiento    , fTeatro         , fEvento      , fAsiento
          , fUsuario          , cDescripcion    , tCreacion    )
    VALUES( OLD.pEventoAsiento, OLD.fTeatro     , OLD.fEvento  , OLD.fAsiento
          , OLD.fUsuario      , OLD.cDescripcion, OLD.tCreacion);    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tEventoAsientoHist`
--

DROP TABLE IF EXISTS `tEventoAsientoHist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tEventoAsientoHist` (
  `pEventoAsiento` bigint(20) unsigned NOT NULL,
  `fTeatro` smallint(5) unsigned NOT NULL DEFAULT '1',
  `fEvento` int(10) unsigned NOT NULL,
  `fAsiento` int(10) unsigned NOT NULL,
  `fUsuario` smallint(5) unsigned NOT NULL,
  `cDescripcion` varchar(100) DEFAULT NULL,
  `tCreacion` datetime NOT NULL,
  `tAnulacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fUsuarioAnulacion` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`pEventoAsiento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tEventoAsientoHist`
--

LOCK TABLES `tEventoAsientoHist` WRITE;
/*!40000 ALTER TABLE `tEventoAsientoHist` DISABLE KEYS */;
INSERT INTO `tEventoAsientoHist` VALUES (6,1,6,1010,3,'','2017-03-16 11:07:58','2017-03-16 17:52:53',NULL),(12,1,6,1013,3,'Ejemplito','2017-03-16 13:58:02','2017-03-16 17:54:23',NULL),(18,1,6,1030,3,'','2017-03-16 14:41:43','2017-03-16 17:53:03',NULL),(21,1,6,1029,3,'','2017-03-16 14:53:42','2017-03-16 17:54:33',NULL);
/*!40000 ALTER TABLE `tEventoAsientoHist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tTpUsuario`
--

DROP TABLE IF EXISTS `tTpUsuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tTpUsuario` (
  `pTpUsuario` smallint(5) unsigned NOT NULL,
  `cDescripion` varchar(20) NOT NULL,
  PRIMARY KEY (`pTpUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tTpUsuario`
--

LOCK TABLES `tTpUsuario` WRITE;
/*!40000 ALTER TABLE `tTpUsuario` DISABLE KEYS */;
INSERT INTO `tTpUsuario` VALUES (1,'Normal'),(9,'Administrador');
/*!40000 ALTER TABLE `tTpUsuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tUsuario`
--

DROP TABLE IF EXISTS `tUsuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tUsuario` (
  `pUsuario` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cUsuario` varchar(20) NOT NULL,
  `cPassword` varchar(100) NOT NULL DEFAULT 'none',
  `cNombre` varchar(100) DEFAULT NULL,
  `cEmail` varchar(100) DEFAULT NULL,
  `fTpUsuario` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`pUsuario`),
  UNIQUE KEY `iuUsuario_cUsuario` (`cUsuario`),
  KEY `fkUsuario_tpUsuario` (`fTpUsuario`),
  CONSTRAINT `fkUsuario_tpUsuario` FOREIGN KEY (`fTpUsuario`) REFERENCES `tTpUsuario` (`pTpUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tUsuario`
--

LOCK TABLES `tUsuario` WRITE;
/*!40000 ALTER TABLE `tUsuario` DISABLE KEYS */;
INSERT INTO `tUsuario` VALUES (2,'agalaz','desa','Andrés Galaz','andres.galaz@gmail.com',9),(3,'amazza','desa','Alejandro Mazza','yazzweb@gmail.com',1);
/*!40000 ALTER TABLE `tUsuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'andy'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-16 15:40:41
