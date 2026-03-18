-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ligamanager
-- ------------------------------------------------------
-- Server version	9.6.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'ac94a755-18ff-11f1-bb1e-1cbfc07daf84:1-126';

--
-- Table structure for table `arbitros`
--

DROP TABLE IF EXISTS `arbitros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arbitros` (
  `id_arbitro` int NOT NULL AUTO_INCREMENT,
  `id_rol` int DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido_paterno` varchar(255) DEFAULT NULL,
  `apellido_materno` varchar(255) DEFAULT NULL,
  `identificacion` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_arbitro`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `arbitros_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles_administrativos` (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arbitros`
--

LOCK TABLES `arbitros` WRITE;
/*!40000 ALTER TABLE `arbitros` DISABLE KEYS */;
/*!40000 ALTER TABLE `arbitros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arbitros_partidos`
--

DROP TABLE IF EXISTS `arbitros_partidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arbitros_partidos` (
  `id_arbitros_partidos` int NOT NULL AUTO_INCREMENT,
  `id_arbitro` int NOT NULL,
  `id_partido` int NOT NULL,
  `id_rol` int NOT NULL,
  PRIMARY KEY (`id_arbitros_partidos`),
  KEY `id_arbitro` (`id_arbitro`),
  KEY `id_partido` (`id_partido`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `arbitros_partidos_ibfk_1` FOREIGN KEY (`id_arbitro`) REFERENCES `arbitros` (`id_arbitro`),
  CONSTRAINT `arbitros_partidos_ibfk_2` FOREIGN KEY (`id_partido`) REFERENCES `partidos` (`id_partido`),
  CONSTRAINT `arbitros_partidos_ibfk_3` FOREIGN KEY (`id_rol`) REFERENCES `roles_arbitrales` (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arbitros_partidos`
--

LOCK TABLES `arbitros_partidos` WRITE;
/*!40000 ALTER TABLE `arbitros_partidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `arbitros_partidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canchas`
--

DROP TABLE IF EXISTS `canchas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canchas` (
  `id_cancha` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `estado` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_cancha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canchas`
--

LOCK TABLES `canchas` WRITE;
/*!40000 ALTER TABLE `canchas` DISABLE KEYS */;
/*!40000 ALTER TABLE `canchas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias_equipos`
--

DROP TABLE IF EXISTS `categorias_equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias_equipos` (
  `id_categorias_equipos` int NOT NULL AUTO_INCREMENT,
  `id_equipo` int DEFAULT NULL,
  `id_categoria` int DEFAULT NULL,
  PRIMARY KEY (`id_categorias_equipos`),
  KEY `id_equipo` (`id_equipo`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `categorias_equipos_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_equipo`),
  CONSTRAINT `categorias_equipos_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias_equipos`
--

LOCK TABLES `categorias_equipos` WRITE;
/*!40000 ALTER TABLE `categorias_equipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias_equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias_jugadores`
--

DROP TABLE IF EXISTS `categorias_jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias_jugadores` (
  `id_categoria_jugador` int NOT NULL AUTO_INCREMENT,
  `id_categoria` int NOT NULL,
  `id_jugador` int NOT NULL,
  PRIMARY KEY (`id_categoria_jugador`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_jugador` (`id_jugador`),
  CONSTRAINT `categorias_jugadores_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  CONSTRAINT `categorias_jugadores_ibfk_2` FOREIGN KEY (`id_jugador`) REFERENCES `jugadores` (`id_jugador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias_jugadores`
--

LOCK TABLES `categorias_jugadores` WRITE;
/*!40000 ALTER TABLE `categorias_jugadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias_jugadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias_torneos`
--

DROP TABLE IF EXISTS `categorias_torneos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias_torneos` (
  `id_categorias_torneos` int NOT NULL AUTO_INCREMENT,
  `id_torneo` int DEFAULT NULL,
  `id_categoria` int DEFAULT NULL,
  PRIMARY KEY (`id_categorias_torneos`),
  KEY `id_torneo` (`id_torneo`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `categorias_torneos_ibfk_1` FOREIGN KEY (`id_torneo`) REFERENCES `torneos` (`id_torneo`),
  CONSTRAINT `categorias_torneos_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias_torneos`
--

LOCK TABLES `categorias_torneos` WRITE;
/*!40000 ALTER TABLE `categorias_torneos` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias_torneos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipos` (
  `id_equipo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `url_foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipos_jugadores`
--

DROP TABLE IF EXISTS `equipos_jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipos_jugadores` (
  `id_equipos_jugadores` int NOT NULL AUTO_INCREMENT,
  `id_equipo` int DEFAULT NULL,
  `id_jugador` int DEFAULT NULL,
  PRIMARY KEY (`id_equipos_jugadores`),
  KEY `id_equipo` (`id_equipo`),
  KEY `id_jugador` (`id_jugador`),
  CONSTRAINT `equipos_jugadores_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_equipo`),
  CONSTRAINT `equipos_jugadores_ibfk_2` FOREIGN KEY (`id_jugador`) REFERENCES `jugadores` (`id_jugador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos_jugadores`
--

LOCK TABLES `equipos_jugadores` WRITE;
/*!40000 ALTER TABLE `equipos_jugadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipos_jugadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidencias`
--

DROP TABLE IF EXISTS `incidencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidencias` (
  `id_incidencia` int NOT NULL AUTO_INCREMENT,
  `nombre` enum('Gol','Autogol','Tarjeta amarilla','Tarjeta roja') NOT NULL,
  PRIMARY KEY (`id_incidencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidencias`
--

LOCK TABLES `incidencias` WRITE;
/*!40000 ALTER TABLE `incidencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `incidencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidencias_partidos`
--

DROP TABLE IF EXISTS `incidencias_partidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidencias_partidos` (
  `id_incidencia_partido` int NOT NULL AUTO_INCREMENT,
  `id_partido` int NOT NULL,
  `id_jugador` int NOT NULL,
  `id_equipo` int NOT NULL,
  `id_incidencia` int NOT NULL,
  `minuto` int DEFAULT NULL,
  `url_foto_informe` varchar(255) DEFAULT NULL,
  `informe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_incidencia_partido`),
  KEY `id_partido` (`id_partido`),
  KEY `id_jugador` (`id_jugador`),
  KEY `id_equipo` (`id_equipo`),
  KEY `id_incidencia` (`id_incidencia`),
  CONSTRAINT `incidencias_partidos_ibfk_1` FOREIGN KEY (`id_partido`) REFERENCES `partidos` (`id_partido`),
  CONSTRAINT `incidencias_partidos_ibfk_2` FOREIGN KEY (`id_jugador`) REFERENCES `jugadores` (`id_jugador`),
  CONSTRAINT `incidencias_partidos_ibfk_3` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_equipo`),
  CONSTRAINT `incidencias_partidos_ibfk_4` FOREIGN KEY (`id_incidencia`) REFERENCES `incidencias` (`id_incidencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidencias_partidos`
--

LOCK TABLES `incidencias_partidos` WRITE;
/*!40000 ALTER TABLE `incidencias_partidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `incidencias_partidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugadores`
--

DROP TABLE IF EXISTS `jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugadores` (
  `id_jugador` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido_paterno` varchar(255) DEFAULT NULL,
  `apellido_materno` varchar(255) DEFAULT NULL,
  `identificacion` varchar(255) DEFAULT NULL,
  `url_imagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_jugador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugadores`
--

LOCK TABLES `jugadores` WRITE;
/*!40000 ALTER TABLE `jugadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `jugadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partidos`
--

DROP TABLE IF EXISTS `partidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partidos` (
  `id_partido` int NOT NULL AUTO_INCREMENT,
  `equipo_local` int NOT NULL,
  `equipo_visitante` int NOT NULL,
  `fecha_partido` date DEFAULT NULL,
  `hora_partido` time DEFAULT NULL,
  `id_cancha` int DEFAULT NULL,
  `estado` enum('Programado','Finalizado','Aplazado','Cancelado') DEFAULT 'Programado',
  `id_categoria` int DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_partido`),
  KEY `equipo_local` (`equipo_local`),
  KEY `equipo_visitante` (`equipo_visitante`),
  KEY `id_cancha` (`id_cancha`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `partidos_ibfk_1` FOREIGN KEY (`equipo_local`) REFERENCES `equipos` (`id_equipo`),
  CONSTRAINT `partidos_ibfk_2` FOREIGN KEY (`equipo_visitante`) REFERENCES `equipos` (`id_equipo`),
  CONSTRAINT `partidos_ibfk_3` FOREIGN KEY (`id_cancha`) REFERENCES `canchas` (`id_cancha`),
  CONSTRAINT `partidos_ibfk_4` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partidos`
--

LOCK TABLES `partidos` WRITE;
/*!40000 ALTER TABLE `partidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `partidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_administrativos`
--

DROP TABLE IF EXISTS `roles_administrativos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_administrativos` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_administrativos`
--

LOCK TABLES `roles_administrativos` WRITE;
/*!40000 ALTER TABLE `roles_administrativos` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_administrativos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_arbitrales`
--

DROP TABLE IF EXISTS `roles_arbitrales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_arbitrales` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_arbitrales`
--

LOCK TABLES `roles_arbitrales` WRITE;
/*!40000 ALTER TABLE `roles_arbitrales` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_arbitrales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torneos`
--

DROP TABLE IF EXISTS `torneos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `torneos` (
  `id_torneo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_torneo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torneos`
--

LOCK TABLES `torneos` WRITE;
/*!40000 ALTER TABLE `torneos` DISABLE KEYS */;
/*!40000 ALTER TABLE `torneos` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-17 20:24:44
