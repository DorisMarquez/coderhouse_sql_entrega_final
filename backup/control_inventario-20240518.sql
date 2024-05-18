mysqldump: [Warning] Using a password on the command line interface can be insecure.
-- MySQL dump 10.13  Distrib 8.4.0, for Linux (x86_64)
--
-- Host: localhost    Database: control_inventario
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areas` (
  `id_area` int NOT NULL AUTO_INCREMENT,
  `area` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_area`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Describe las diferentes Ã¡reas que conforman la empresa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` VALUES (1,'Gerencia y administraciÃ³n'),(2,'ProducciÃ³n'),(3,'Operaciones'),(4,'Mantenimiento'),(5,'Seguridad'),(6,'RRHH'),(7,'LogÃ­stica');
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Describe las distintas categorÃ­as en que se clasifican lo productos en el almacÃ©n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Repuestos'),(2,'Herramientas'),(3,'Filtros'),(4,'Aceros'),(5,'Suministro'),(6,'EPP'),(7,'Lubricantes');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destinos`
--

DROP TABLE IF EXISTS `destinos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destinos` (
  `id_destino` int NOT NULL AUTO_INCREMENT,
  `destino` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_destino`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Describe el destino del materia solicitado, ya sea un lugar de la empresa o un equipo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destinos`
--

LOCK TABLES `destinos` WRITE;
/*!40000 ALTER TABLE `destinos` DISABLE KEYS */;
INSERT INTO `destinos` VALUES (1,'lugar1'),(2,'lugar2'),(3,'lugar3'),(4,'lugar4'),(5,'lugar5'),(6,'lugar6'),(7,'lugar7'),(8,'lugar8'),(9,'lugar9'),(10,'lugar10'),(11,'equipo1'),(12,'equipo2'),(13,'equipo3'),(14,'equipo4'),(15,'equipo5'),(16,'equipo6'),(17,'equipo7'),(18,'equipo8'),(19,'equipo9'),(20,'equipo10');
/*!40000 ALTER TABLE `destinos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_entradas`
--

DROP TABLE IF EXISTS `detalle_entradas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_entradas` (
  `id_entrada` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `unidad_medida` varchar(10) DEFAULT 'unidad',
  `precio_compra_$` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_entrada`,`id_producto`),
  KEY `fk_detalle_entradas_productos` (`id_producto`),
  CONSTRAINT `fk_detalle_entradas_entradas` FOREIGN KEY (`id_entrada`) REFERENCES `entradas` (`id_entrada`),
  CONSTRAINT `fk_detalle_entradas_productos` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registra los productos y las cantidades que ingresan al almacÃ©n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_entradas`
--

LOCK TABLES `detalle_entradas` WRITE;
/*!40000 ALTER TABLE `detalle_entradas` DISABLE KEYS */;
INSERT INTO `detalle_entradas` VALUES (1,1,16,'unidad',8.00),(1,4,15,'unidad',46.00),(1,6,16,'unidad',13.00),(2,1,10,'unidad',8.00),(2,4,9,'unidad',46.00),(2,6,16,'unidad',13.00),(3,1,11,'unidad',8.00),(3,5,10,'unidad',449.00),(3,6,13,'unidad',13.00),(4,2,10,'unidad',59.00),(4,5,9,'unidad',449.00),(4,7,19,'unidad',9.00),(5,2,18,'unidad',59.00),(5,5,17,'unidad',449.00),(5,7,15,'unidad',9.00),(6,2,17,'unidad',59.00),(6,7,17,'unidad',9.00),(6,9,19,'unidad',418.00),(7,3,17,'unidad',7.00),(7,8,11,'unidad',12.00),(7,9,19,'unidad',418.00),(8,3,14,'unidad',7.00),(8,8,13,'unidad',12.00),(8,10,17,'unidad',11.00),(9,3,20,'unidad',7.00),(9,8,11,'unidad',12.00),(9,10,21,'unidad',11.00),(10,4,16,'unidad',46.00),(10,9,19,'unidad',418.00),(10,10,18,'unidad',11.00);
/*!40000 ALTER TABLE `detalle_entradas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_actualizar_total_entradas` AFTER INSERT ON `detalle_entradas` FOR EACH ROW BEGIN
UPDATE inventario 
SET total_entradas = fn_1_total_entradas(NEW.id_producto) WHERE id_producto = NEW.id_producto;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_actualizar_ultimo_precio` AFTER INSERT ON `detalle_entradas` FOR EACH ROW BEGIN
UPDATE inventario SET ultimo_precio_$ = fn_3_actualizar_ultimo_precio(NEW.id_producto) WHERE id_producto = NEW.id_producto;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `detalle_salidas`
--

DROP TABLE IF EXISTS `detalle_salidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_salidas` (
  `id_salida` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  `unidad_medida` varchar(10) DEFAULT 'unidad',
  PRIMARY KEY (`id_salida`,`id_producto`),
  KEY `fk_detalle_salidas_productos` (`id_producto`),
  CONSTRAINT `fk_detalle_salidas_productos` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `fk_detalle_salidas_salidas` FOREIGN KEY (`id_salida`) REFERENCES `salidas` (`id_salida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registra los productos y las cantidades que salen del almacÃ©n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_salidas`
--

LOCK TABLES `detalle_salidas` WRITE;
/*!40000 ALTER TABLE `detalle_salidas` DISABLE KEYS */;
INSERT INTO `detalle_salidas` VALUES (1,1,7,'unidad'),(1,4,8,'unidad'),(1,6,9,'unidad'),(2,1,6,'unidad'),(2,4,7,'unidad'),(2,6,8,'unidad'),(3,1,9,'unidad'),(3,5,20,'unidad'),(3,6,10,'unidad'),(4,2,9,'unidad'),(4,5,19,'unidad'),(4,7,14,'unidad'),(5,2,8,'unidad'),(5,5,22,'unidad'),(5,7,13,'unidad'),(6,2,10,'unidad'),(6,7,15,'unidad'),(6,9,24,'unidad'),(7,3,4,'unidad'),(7,8,5,'unidad'),(7,9,23,'unidad'),(8,3,3,'unidad'),(8,8,4,'unidad'),(8,10,5,'unidad'),(9,3,6,'unidad'),(9,8,8,'unidad'),(9,10,4,'unidad'),(10,4,10,'unidad'),(10,9,25,'unidad'),(10,10,7,'unidad');
/*!40000 ALTER TABLE `detalle_salidas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_actualizar_total_salidas` AFTER INSERT ON `detalle_salidas` FOR EACH ROW BEGIN
UPDATE inventario SET total_salidas = fn_2_total_salidas(NEW.id_producto) WHERE id_producto = NEW.id_producto;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre_empleado` varchar(50) DEFAULT NULL,
  `apellido_empleado` varchar(50) DEFAULT NULL,
  `email_empleado` varchar(100) DEFAULT NULL,
  `id_area` int DEFAULT NULL,
  `cargo_empleado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `fk_empleados_area` (`id_area`),
  CONSTRAINT `fk_empleados_area` FOREIGN KEY (`id_area`) REFERENCES `areas` (`id_area`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contiene la informaciÃ³n de los empleados de la empresa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Powell','Saill','psaill3b@netvibes.com',1,'Gerente'),(2,'Agnese','Ouslem','aouslem3c@photobucket.com',1,'Administrador'),(3,'Barret','Gerran','barret.gerran@empresa11.com',1,'Auxiliar de administraciÃ³n'),(4,'Keslie','Furley','kfurley3d@woothemes.com',2,'Auxiliar de producciÃ³n'),(5,'Saba','Hissie','shissie3e@amazonaws.com',3,'Auxiliar de operaciones'),(6,'Roddie','Voelker','rvoelker3f@phoca.cz',4,'Auxiliar de mantenimiento'),(7,'Fletch','Oels','foels3g@illinois.edu',5,'Auxiliar de SHI'),(8,'Conni','Larrat','clarrat3h@whitehouse.gov',6,'Auxiliar de RRHH'),(9,'Genvieve','Segebrecht','gsegebrecht3i@altervista.org',7,'Jefe almacÃ©n'),(10,'Lavinie','Perkis','lperkis3j@newyorker.com',7,'Encargado de almacÃ©n'),(11,'Garrick','Warden','gwarden3k@fastcompany.com',7,'Encargado de almacÃ©n'),(12,'Guntar','Piccop','gpiccop3l@chron.com',7,'Encargado de almacÃ©n'),(13,'Christopher','Pechell','christopher.pechell@empresa10.com',7,'Encargado de almacÃ©n');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entradas`
--

DROP TABLE IF EXISTS `entradas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entradas` (
  `id_entrada` int NOT NULL,
  `fecha` date DEFAULT (curdate()),
  `numero_guia` varchar(10) NOT NULL,
  `id_responsable_registro` int DEFAULT '10',
  PRIMARY KEY (`id_entrada`),
  KEY `fk_entradas_responsable` (`id_responsable_registro`),
  CONSTRAINT `fk_entradas_responsable` FOREIGN KEY (`id_responsable_registro`) REFERENCES `empleados` (`id_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registra las guÃ­as que son recibidas en el almacÃ©n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entradas`
--

LOCK TABLES `entradas` WRITE;
/*!40000 ALTER TABLE `entradas` DISABLE KEYS */;
INSERT INTO `entradas` VALUES (1,'2024-05-18','G-1',10),(2,'2024-05-18','G-2',12),(3,'2024-05-18','G-3',11),(4,'2024-05-18','G-4',13),(5,'2024-05-18','G-5',10),(6,'2024-05-18','G-6',12),(7,'2024-05-18','G-7',11),(8,'2024-05-18','G-8',13),(9,'2024-05-18','G-9',10),(10,'2024-05-18','G-10',12);
/*!40000 ALTER TABLE `entradas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `id_producto` int NOT NULL,
  `inventario_inicial` int NOT NULL DEFAULT '0',
  `total_entradas` int DEFAULT '0',
  `total_salidas` int DEFAULT '0',
  `stock` int GENERATED ALWAYS AS (((`inventario_inicial` + `total_entradas`) - `total_salidas`)) VIRTUAL,
  `unidad_medida` varchar(10) DEFAULT 'unidad',
  `ultimo_precio_$` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id_producto`),
  CONSTRAINT `fk_inventario_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registra los detalles del inventario para cada producto';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` (`id_producto`, `inventario_inicial`, `total_entradas`, `total_salidas`, `unidad_medida`, `ultimo_precio_$`) VALUES (1,190,37,22,'unidad',8.00),(2,160,45,27,'unidad',59.00),(3,130,51,13,'unidad',7.00),(4,100,40,25,'unidad',46.00),(5,140,36,61,'unidad',449.00),(6,170,45,27,'unidad',13.00),(7,130,51,42,'unidad',9.00),(8,190,35,17,'unidad',12.00),(9,210,57,72,'unidad',418.00),(10,90,56,16,'unidad',11.00);
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `id_marca` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Describe las diferentes marcas de los produsctos almacenados';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'marca1'),(2,'marca2'),(3,'marca3'),(4,'marca4'),(5,'marca5'),(6,'marca6'),(7,'marca7'),(8,'marca8'),(9,'marca9'),(10,'marca10');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `id_marca` int NOT NULL,
  `id_categoria` int NOT NULL,
  `id_ubicacion` int DEFAULT '1',
  PRIMARY KEY (`id_producto`),
  KEY `fk_marca` (`id_marca`),
  KEY `fk_categoria` (`id_categoria`),
  KEY `fk_ubicacion` (`id_ubicacion`),
  CONSTRAINT `fk_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  CONSTRAINT `fk_marca` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`),
  CONSTRAINT `fk_ubicacion` FOREIGN KEY (`id_ubicacion`) REFERENCES `ubicaciones` (`id_ubicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena los detalles de los productos disponibles en el inventario';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'descripciÃ³n_producto_1',4,2,1),(2,'descripciÃ³n_producto_2',1,5,4),(3,'descripciÃ³n_producto_3',7,5,2),(4,'descripciÃ³n_producto_4',10,2,1),(5,'descripciÃ³n_producto_5',1,6,9),(6,'descripciÃ³n_producto_6',9,1,4),(7,'descripciÃ³n_producto_7',7,6,9),(8,'descripciÃ³n_producto_8',8,6,5),(9,'descripciÃ³n_producto_9',10,1,7),(10,'descripciÃ³n_producto_10',1,2,3);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salidas`
--

DROP TABLE IF EXISTS `salidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salidas` (
  `id_salida` int NOT NULL,
  `fecha` date DEFAULT (curdate()),
  `numero_solicitud` varchar(10) NOT NULL,
  `id_responsable_registro` int DEFAULT '10',
  `turno` enum('dia','noche') DEFAULT NULL,
  `id_destino` int DEFAULT NULL,
  `id_area_solicitud` int DEFAULT NULL,
  `id_quien_recibe` int DEFAULT NULL,
  PRIMARY KEY (`id_salida`),
  KEY `fk_salidas_responsable` (`id_responsable_registro`),
  KEY `fk_salidas_destinos` (`id_destino`),
  KEY `fk_salidas_area` (`id_area_solicitud`),
  KEY `fk_salidas_recibe` (`id_quien_recibe`),
  CONSTRAINT `fk_salidas_area` FOREIGN KEY (`id_area_solicitud`) REFERENCES `areas` (`id_area`),
  CONSTRAINT `fk_salidas_destinos` FOREIGN KEY (`id_destino`) REFERENCES `destinos` (`id_destino`),
  CONSTRAINT `fk_salidas_recibe` FOREIGN KEY (`id_quien_recibe`) REFERENCES `empleados` (`id_empleado`),
  CONSTRAINT `fk_salidas_responsable` FOREIGN KEY (`id_responsable_registro`) REFERENCES `empleados` (`id_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registra las solicitudes de materiales hechas por las diferentes Ã¡reas de la empresa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salidas`
--

LOCK TABLES `salidas` WRITE;
/*!40000 ALTER TABLE `salidas` DISABLE KEYS */;
INSERT INTO `salidas` VALUES (1,'2024-05-18','S-1',10,'dia',18,4,6),(2,'2024-05-18','S-2',12,'noche',19,6,8),(3,'2024-05-18','S-3',11,'dia',18,1,3),(4,'2024-05-18','S-4',13,'noche',17,1,3),(5,'2024-05-18','S-5',10,'dia',11,3,5),(6,'2024-05-18','S-6',12,'noche',20,4,6),(7,'2024-05-18','S-7',11,'dia',7,1,3),(8,'2024-05-18','S-8',13,'noche',5,6,8),(9,'2024-05-18','S-9',10,'dia',7,3,5),(10,'2024-05-18','S-10',12,'noche',15,4,6);
/*!40000 ALTER TABLE `salidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicaciones`
--

DROP TABLE IF EXISTS `ubicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicaciones` (
  `id_ubicacion` int NOT NULL AUTO_INCREMENT,
  `ubicacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_ubicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Describe las diferentes ubicaciones en que se encuentra organizado el almacÃ©n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicaciones`
--

LOCK TABLES `ubicaciones` WRITE;
/*!40000 ALTER TABLE `ubicaciones` DISABLE KEYS */;
INSERT INTO `ubicaciones` VALUES (1,'pendiente'),(2,'ubicacion2'),(3,'ubicacion3'),(4,'ubicacion4'),(5,'ubicacion5'),(6,'ubicacion6'),(7,'ubicacion7'),(8,'ubicacion8'),(9,'ubicacion9'),(10,'ubicacion10');
/*!40000 ALTER TABLE `ubicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_1_informe_inventario`
--

DROP TABLE IF EXISTS `vw_1_informe_inventario`;
/*!50001 DROP VIEW IF EXISTS `vw_1_informe_inventario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_1_informe_inventario` AS SELECT 
 1 AS `id_producto`,
 1 AS `descripcion`,
 1 AS `marca`,
 1 AS `categoria`,
 1 AS `inventario_inicial`,
 1 AS `total_entradas`,
 1 AS `total_salidas`,
 1 AS `stock`,
 1 AS `ultimo_precio_$`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_2_valor_inventario`
--

DROP TABLE IF EXISTS `vw_2_valor_inventario`;
/*!50001 DROP VIEW IF EXISTS `vw_2_valor_inventario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_2_valor_inventario` AS SELECT 
 1 AS `id_producto`,
 1 AS `descripcion`,
 1 AS `stock`,
 1 AS `ultimo_precio_$`,
 1 AS `valor_inventario`,
 1 AS `porcentaje_valor_inventario`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_3_valor_total_inventario`
--

DROP TABLE IF EXISTS `vw_3_valor_total_inventario`;
/*!50001 DROP VIEW IF EXISTS `vw_3_valor_total_inventario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_3_valor_total_inventario` AS SELECT 
 1 AS `valor_total_inventario`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_4_productos_inventario`
--

DROP TABLE IF EXISTS `vw_4_productos_inventario`;
/*!50001 DROP VIEW IF EXISTS `vw_4_productos_inventario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_4_productos_inventario` AS SELECT 
 1 AS `id_producto`,
 1 AS `descripcion`,
 1 AS `marca`,
 1 AS `categoria`,
 1 AS `ubicacion`,
 1 AS `stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_5_entradas_productos`
--

DROP TABLE IF EXISTS `vw_5_entradas_productos`;
/*!50001 DROP VIEW IF EXISTS `vw_5_entradas_productos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_5_entradas_productos` AS SELECT 
 1 AS `id_entrada`,
 1 AS `fecha`,
 1 AS `id_producto`,
 1 AS `descripcion`,
 1 AS `cantidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_6_salidas_productos`
--

DROP TABLE IF EXISTS `vw_6_salidas_productos`;
/*!50001 DROP VIEW IF EXISTS `vw_6_salidas_productos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_6_salidas_productos` AS SELECT 
 1 AS `id_salida`,
 1 AS `fecha`,
 1 AS `id_producto`,
 1 AS `descripcion`,
 1 AS `cantidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_1_informe_inventario`
--

/*!50001 DROP VIEW IF EXISTS `vw_1_informe_inventario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_1_informe_inventario` AS select `i`.`id_producto` AS `id_producto`,`p`.`descripcion` AS `descripcion`,`m`.`marca` AS `marca`,`c`.`categoria` AS `categoria`,`i`.`inventario_inicial` AS `inventario_inicial`,`i`.`total_entradas` AS `total_entradas`,`i`.`total_salidas` AS `total_salidas`,`i`.`stock` AS `stock`,`i`.`ultimo_precio_$` AS `ultimo_precio_$` from (((`inventario` `i` join `productos` `p` on((`p`.`id_producto` = `i`.`id_producto`))) join `marcas` `m` on((`m`.`id_marca` = `p`.`id_marca`))) join `categorias` `c` on((`c`.`id_categoria` = `p`.`id_categoria`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_2_valor_inventario`
--

/*!50001 DROP VIEW IF EXISTS `vw_2_valor_inventario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_2_valor_inventario` AS select `i`.`id_producto` AS `id_producto`,`p`.`descripcion` AS `descripcion`,`i`.`stock` AS `stock`,`i`.`ultimo_precio_$` AS `ultimo_precio_$`,(`i`.`stock` * `i`.`ultimo_precio_$`) AS `valor_inventario`,round((((`i`.`stock` * `i`.`ultimo_precio_$`) * 100) / `fn_4_valor_total_inventario`()),2) AS `porcentaje_valor_inventario` from (`inventario` `i` join `productos` `p` on((`p`.`id_producto` = `i`.`id_producto`))) order by (`i`.`stock` * `i`.`ultimo_precio_$`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_3_valor_total_inventario`
--

/*!50001 DROP VIEW IF EXISTS `vw_3_valor_total_inventario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_3_valor_total_inventario` AS select sum((`inventario`.`stock` * `inventario`.`ultimo_precio_$`)) AS `valor_total_inventario` from `inventario` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_4_productos_inventario`
--

/*!50001 DROP VIEW IF EXISTS `vw_4_productos_inventario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_4_productos_inventario` AS select `p`.`id_producto` AS `id_producto`,`p`.`descripcion` AS `descripcion`,`m`.`marca` AS `marca`,`c`.`categoria` AS `categoria`,`u`.`ubicacion` AS `ubicacion`,`i`.`stock` AS `stock` from ((((`productos` `p` join `inventario` `i` on((`p`.`id_producto` = `i`.`id_producto`))) join `marcas` `m` on((`m`.`id_marca` = `p`.`id_marca`))) join `categorias` `c` on((`c`.`id_categoria` = `p`.`id_categoria`))) join `ubicaciones` `u` on((`u`.`id_ubicacion` = `p`.`id_ubicacion`))) order by `p`.`id_producto` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_5_entradas_productos`
--

/*!50001 DROP VIEW IF EXISTS `vw_5_entradas_productos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_5_entradas_productos` AS select `e`.`id_entrada` AS `id_entrada`,`e`.`fecha` AS `fecha`,`d`.`id_producto` AS `id_producto`,`p`.`descripcion` AS `descripcion`,`d`.`cantidad` AS `cantidad` from ((`entradas` `e` join `detalle_entradas` `d` on((`e`.`id_entrada` = `d`.`id_entrada`))) join `productos` `p` on((`d`.`id_producto` = `p`.`id_producto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_6_salidas_productos`
--

/*!50001 DROP VIEW IF EXISTS `vw_6_salidas_productos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_6_salidas_productos` AS select `s`.`id_salida` AS `id_salida`,`s`.`fecha` AS `fecha`,`d`.`id_producto` AS `id_producto`,`p`.`descripcion` AS `descripcion`,`d`.`cantidad` AS `cantidad` from ((`salidas` `s` join `detalle_salidas` `d` on((`s`.`id_salida` = `d`.`id_salida`))) join `productos` `p` on((`d`.`id_producto` = `p`.`id_producto`))) */;
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

-- Dump completed on 2024-05-18 19:07:22
