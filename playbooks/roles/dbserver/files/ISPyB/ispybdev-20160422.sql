-- MySQL dump 10.15  Distrib 10.0.17-MariaDB, for Linux (x86_64)
--
-- Host: cs04r-sc-vserv-88    Database: ispybstage
-- ------------------------------------------------------
-- Server version	10.0.19-MariaDB-wsrep

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
-- Table structure for table `AbInitioModel`
--

DROP TABLE IF EXISTS `AbInitioModel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AbInitioModel` (
  `abInitioModelId` int(10) NOT NULL AUTO_INCREMENT,
  `modelListId` int(10) DEFAULT NULL,
  `averagedModelId` int(10) DEFAULT NULL,
  `rapidShapeDeterminationModelId` int(10) DEFAULT NULL,
  `shapeDeterminationModelId` int(10) DEFAULT NULL,
  `comments` varchar(512) DEFAULT NULL,
  `creationTime` datetime DEFAULT NULL,
  PRIMARY KEY (`abInitioModelId`),
  KEY `AbInitioModelToModelList` (`modelListId`),
  KEY `AbInitioModelToRapid` (`rapidShapeDeterminationModelId`),
  KEY `AverageToModel` (`averagedModelId`),
  KEY `SahpeDeterminationToAbiniti` (`shapeDeterminationModelId`),
  CONSTRAINT `AbInitioModelToModelList` FOREIGN KEY (`modelListId`) REFERENCES `ModelList` (`modelListId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AbInitioModelToRapid` FOREIGN KEY (`rapidShapeDeterminationModelId`) REFERENCES `Model` (`modelId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AverageToModel` FOREIGN KEY (`averagedModelId`) REFERENCES `Model` (`modelId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SahpeDeterminationToAbiniti` FOREIGN KEY (`shapeDeterminationModelId`) REFERENCES `Model` (`modelId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AbInitioModel`
--

LOCK TABLES `AbInitioModel` WRITE;
/*!40000 ALTER TABLE `AbInitioModel` DISABLE KEYS */;
/*!40000 ALTER TABLE `AbInitioModel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Additive`
--

DROP TABLE IF EXISTS `Additive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Additive` (
  `additiveId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `additiveType` varchar(45) DEFAULT NULL,
  `comments` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`additiveId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Additive`
--

LOCK TABLES `Additive` WRITE;
/*!40000 ALTER TABLE `Additive` DISABLE KEYS */;
/*!40000 ALTER TABLE `Additive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AdminActivity`
--

DROP TABLE IF EXISTS `AdminActivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdminActivity` (
  `adminActivityId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL DEFAULT '',
  `action` varchar(45) DEFAULT NULL,
  `comments` varchar(100) DEFAULT NULL,
  `dateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`adminActivityId`),
  UNIQUE KEY `username` (`username`),
  KEY `AdminActivity_FKAction` (`action`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdminActivity`
--

LOCK TABLES `AdminActivity` WRITE;
/*!40000 ALTER TABLE `AdminActivity` DISABLE KEYS */;
/*!40000 ALTER TABLE `AdminActivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AdminVar`
--

DROP TABLE IF EXISTS `AdminVar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdminVar` (
  `varId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `value` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`varId`),
  KEY `AdminVar_FKIndexName` (`name`),
  KEY `AdminVar_FKIndexValue` (`value`(767))
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ISPyB administration values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdminVar`
--

LOCK TABLES `AdminVar` WRITE;
/*!40000 ALTER TABLE `AdminVar` DISABLE KEYS */;
/*!40000 ALTER TABLE `AdminVar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Aperture`
--

DROP TABLE IF EXISTS `Aperture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Aperture` (
  `apertureId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sizeX` float DEFAULT NULL,
  PRIMARY KEY (`apertureId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aperture`
--

LOCK TABLES `Aperture` WRITE;
/*!40000 ALTER TABLE `Aperture` DISABLE KEYS */;
/*!40000 ALTER TABLE `Aperture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Assembly`
--

DROP TABLE IF EXISTS `Assembly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Assembly` (
  `assemblyId` int(10) NOT NULL AUTO_INCREMENT,
  `macromoleculeId` int(10) NOT NULL,
  `creationDate` datetime DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`assemblyId`),
  KEY `AssemblyToMacromolecule` (`macromoleculeId`),
  CONSTRAINT `AssemblyToMacromolecule` FOREIGN KEY (`macromoleculeId`) REFERENCES `Macromolecule` (`macromoleculeId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Assembly`
--

LOCK TABLES `Assembly` WRITE;
/*!40000 ALTER TABLE `Assembly` DISABLE KEYS */;
/*!40000 ALTER TABLE `Assembly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AssemblyHasMacromolecule`
--

DROP TABLE IF EXISTS `AssemblyHasMacromolecule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AssemblyHasMacromolecule` (
  `AssemblyHasMacromoleculeId` int(10) NOT NULL AUTO_INCREMENT,
  `assemblyId` int(10) NOT NULL,
  `macromoleculeId` int(10) NOT NULL,
  PRIMARY KEY (`AssemblyHasMacromoleculeId`),
  KEY `AssemblyHasMacromoleculeToAssembly` (`assemblyId`),
  KEY `AssemblyHasMacromoleculeToAssemblyRegion` (`macromoleculeId`),
  CONSTRAINT `AssemblyHasMacromoleculeToAssembly` FOREIGN KEY (`assemblyId`) REFERENCES `Assembly` (`assemblyId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AssemblyHasMacromoleculeToAssemblyRegion` FOREIGN KEY (`macromoleculeId`) REFERENCES `Macromolecule` (`macromoleculeId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AssemblyHasMacromolecule`
--

LOCK TABLES `AssemblyHasMacromolecule` WRITE;
/*!40000 ALTER TABLE `AssemblyHasMacromolecule` DISABLE KEYS */;
/*!40000 ALTER TABLE `AssemblyHasMacromolecule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AssemblyRegion`
--

DROP TABLE IF EXISTS `AssemblyRegion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AssemblyRegion` (
  `assemblyRegionId` int(10) NOT NULL AUTO_INCREMENT,
  `assemblyHasMacromoleculeId` int(10) NOT NULL,
  `assemblyRegionType` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `fromResiduesBases` varchar(45) DEFAULT NULL,
  `toResiduesBases` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`assemblyRegionId`),
  KEY `AssemblyRegionToAssemblyHasMacromolecule` (`assemblyHasMacromoleculeId`),
  CONSTRAINT `AssemblyRegionToAssemblyHasMacromolecule` FOREIGN KEY (`assemblyHasMacromoleculeId`) REFERENCES `AssemblyHasMacromolecule` (`AssemblyHasMacromoleculeId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AssemblyRegion`
--

LOCK TABLES `AssemblyRegion` WRITE;
/*!40000 ALTER TABLE `AssemblyRegion` DISABLE KEYS */;
/*!40000 ALTER TABLE `AssemblyRegion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AutoProc`
--

DROP TABLE IF EXISTS `AutoProc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AutoProc` (
  `autoProcId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key (auto-incremented)',
  `autoProcProgramId` int(10) unsigned DEFAULT NULL COMMENT 'Related program item',
  `spaceGroup` varchar(45) DEFAULT NULL COMMENT 'Space group',
  `refinedCell_a` float DEFAULT NULL COMMENT 'Refined cell',
  `refinedCell_b` float DEFAULT NULL COMMENT 'Refined cell',
  `refinedCell_c` float DEFAULT NULL COMMENT 'Refined cell',
  `refinedCell_alpha` float DEFAULT NULL COMMENT 'Refined cell',
  `refinedCell_beta` float DEFAULT NULL COMMENT 'Refined cell',
  `refinedCell_gamma` float DEFAULT NULL COMMENT 'Refined cell',
  `recordTimeStamp` datetime DEFAULT NULL COMMENT 'Creation or last update date/time',
  PRIMARY KEY (`autoProcId`),
  KEY `AutoProc_FKIndex1` (`autoProcProgramId`)
) ENGINE=InnoDB AUTO_INCREMENT=603745 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AutoProc`
--

LOCK TABLES `AutoProc` WRITE;
/*!40000 ALTER TABLE `AutoProc` DISABLE KEYS */;
INSERT INTO `AutoProc` VALUES (596406,56425592,'P 6 2 2',92.5546,92.5546,129.784,90,90,120,'2016-01-14 12:46:22'),(596411,56425944,'P 63 2 2',92.53,92.53,129.75,90,90,120,'2016-01-14 13:09:51'),(596418,56425952,'P 61 2 2',92.6461,92.6461,129.879,90,90,120,'2016-01-14 13:24:22'),(596419,56425963,'P 63 2 2',92.511,92.511,129.722,90,90,120,'2016-01-14 13:34:34'),(596420,56426286,'P 61 2 2',92.693,92.693,129.839,90,90,120,'2016-01-14 14:01:57'),(596421,56426287,'P 63 2 2',92.64,92.64,129.77,90,90,120,'2016-01-14 14:13:57'),(603708,56983954,'I 2 3',78.1548,78.1548,78.1548,90,90,90,'2016-01-22 11:34:03'),(603731,56985584,'I 2 3',78.15,78.15,78.15,90,90,90,'2016-01-22 11:52:36'),(603732,56985589,'I 2 3',78.157,78.157,78.157,90,90,90,'2016-01-22 11:53:38'),(603735,56985592,'I 2 3',78.15,78.15,78.15,90,90,90,'2016-01-22 11:54:01'),(603744,56986673,'I 2 3',78.1381,78.1381,78.1381,90,90,90,'2016-01-22 12:01:59');
/*!40000 ALTER TABLE `AutoProc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AutoProcIntegration`
--

DROP TABLE IF EXISTS `AutoProcIntegration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AutoProcIntegration` (
  `autoProcIntegrationId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key (auto-incremented)',
  `dataCollectionId` int(11) unsigned NOT NULL COMMENT 'DataCollection item',
  `autoProcProgramId` int(10) unsigned DEFAULT NULL COMMENT 'Related program item',
  `startImageNumber` int(10) unsigned DEFAULT NULL COMMENT 'start image number',
  `endImageNumber` int(10) unsigned DEFAULT NULL COMMENT 'end image number',
  `refinedDetectorDistance` float DEFAULT NULL COMMENT 'Refined DataCollection.detectorDistance',
  `refinedXBeam` float DEFAULT NULL COMMENT 'Refined DataCollection.xBeam',
  `refinedYBeam` float DEFAULT NULL COMMENT 'Refined DataCollection.yBeam',
  `rotationAxisX` float DEFAULT NULL COMMENT 'Rotation axis',
  `rotationAxisY` float DEFAULT NULL COMMENT 'Rotation axis',
  `rotationAxisZ` float DEFAULT NULL COMMENT 'Rotation axis',
  `beamVectorX` float DEFAULT NULL COMMENT 'Beam vector',
  `beamVectorY` float DEFAULT NULL COMMENT 'Beam vector',
  `beamVectorZ` float DEFAULT NULL COMMENT 'Beam vector',
  `cell_a` float DEFAULT NULL COMMENT 'Unit cell',
  `cell_b` float DEFAULT NULL COMMENT 'Unit cell',
  `cell_c` float DEFAULT NULL COMMENT 'Unit cell',
  `cell_alpha` float DEFAULT NULL COMMENT 'Unit cell',
  `cell_beta` float DEFAULT NULL COMMENT 'Unit cell',
  `cell_gamma` float DEFAULT NULL COMMENT 'Unit cell',
  `recordTimeStamp` datetime DEFAULT NULL COMMENT 'Creation or last update date/time',
  `anomalous` tinyint(1) DEFAULT '0' COMMENT 'boolean type:0 noanoum - 1 anoum',
  PRIMARY KEY (`autoProcIntegrationId`),
  KEY `AutoProcIntegrationIdx1` (`dataCollectionId`),
  KEY `AutoProcIntegration_FKIndex1` (`autoProcProgramId`),
  CONSTRAINT `AutoProcIntegration_ibfk_1` FOREIGN KEY (`dataCollectionId`) REFERENCES `DataCollection` (`dataCollectionId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AutoProcIntegration_ibfk_2` FOREIGN KEY (`autoProcProgramId`) REFERENCES `AutoProcProgram` (`autoProcProgramId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=600377 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AutoProcIntegration`
--

LOCK TABLES `AutoProcIntegration` WRITE;
/*!40000 ALTER TABLE `AutoProcIntegration` DISABLE KEYS */;
INSERT INTO `AutoProcIntegration` VALUES (592508,993677,56425592,NULL,NULL,NULL,209.131,215.722,NULL,NULL,NULL,NULL,NULL,NULL,92.5546,92.5546,129.784,90,90,120,'2016-01-14 12:46:22',0),(592513,993677,56425944,1,3600,193.939,209.052,215.618,NULL,NULL,NULL,NULL,NULL,NULL,92.532,92.532,129.747,90,90,120,'2016-01-14 13:09:51',0),(592520,993677,56425952,1,3600,194.077,209.062,215.62,NULL,NULL,NULL,NULL,NULL,NULL,92.6461,92.6461,129.879,90,90,120,'2016-01-14 13:24:22',0),(592521,993677,56425963,1,3600,193.893,209.135,215.719,NULL,NULL,NULL,NULL,NULL,NULL,92.5114,92.5114,129.722,90,90,120,'2016-01-14 13:34:35',0),(592522,993677,56426286,1,3600,194.077,209.062,215.62,NULL,NULL,NULL,NULL,NULL,NULL,92.6461,92.6461,129.879,90,90,120,'2016-01-14 14:01:57',0),(592523,993677,56426286,1,1800,194.147,209.069,215.622,NULL,NULL,NULL,NULL,NULL,NULL,92.7867,92.7867,129.759,90,90,120,'2016-01-14 14:01:57',0),(592524,993677,56426287,1,3600,193.939,209.052,215.618,NULL,NULL,NULL,NULL,NULL,NULL,92.531,92.531,129.745,90,90,120,'2016-01-14 14:13:57',0),(592525,993677,56426287,1,1800,194.388,209.058,215.61,NULL,NULL,NULL,NULL,NULL,NULL,92.847,92.847,129.817,90,90,120,'2016-01-14 14:13:57',0),(600339,1002287,56983954,NULL,NULL,NULL,209.264,215.741,NULL,NULL,NULL,NULL,NULL,NULL,78.1548,78.1548,78.1548,90,90,90,'2016-01-22 11:34:03',0),(600362,1002287,56985584,1,7200,175.977,209.186,215.643,NULL,NULL,NULL,NULL,NULL,NULL,78.153,78.153,78.153,90,90,90,'2016-01-22 11:52:36',0),(600363,1002287,56985589,1,7200,176.262,209.264,215.741,NULL,NULL,NULL,NULL,NULL,NULL,78.1569,78.1569,78.1569,90,90,90,'2016-01-22 11:53:38',0),(600366,1002287,56985592,1,7200,176.239,209.177,215.651,NULL,NULL,NULL,NULL,NULL,NULL,78.153,78.153,78.153,90,90,90,'2016-01-22 11:54:01',0),(600376,1002287,56986673,1,7200,176.219,209.178,215.653,NULL,NULL,NULL,NULL,NULL,NULL,78.1381,78.1381,78.1381,90,90,90,'2016-01-22 12:01:59',0);
/*!40000 ALTER TABLE `AutoProcIntegration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AutoProcProgram`
--

DROP TABLE IF EXISTS `AutoProcProgram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AutoProcProgram` (
  `autoProcProgramId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key (auto-incremented)',
  `processingCommandLine` varchar(255) DEFAULT NULL COMMENT 'Command line for running the automatic processing',
  `processingPrograms` varchar(255) DEFAULT NULL COMMENT 'Processing programs (comma separated)',
  `processingStatus` tinyint(1) DEFAULT NULL COMMENT 'success (1) / fail (0)',
  `processingMessage` varchar(255) DEFAULT NULL COMMENT 'warning, error,...',
  `processingStartTime` datetime DEFAULT NULL COMMENT 'Processing start time',
  `processingEndTime` datetime DEFAULT NULL COMMENT 'Processing end time',
  `processingEnvironment` varchar(255) DEFAULT NULL COMMENT 'Cpus, Nodes,...',
  `recordTimeStamp` datetime DEFAULT NULL COMMENT 'Creation or last update date/time',
  `dataCollectionId` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`autoProcProgramId`),
  KEY `AutoProcProgram_FK1` (`dataCollectionId`),
  CONSTRAINT `AutoProcProgram_FK1` FOREIGN KEY (`dataCollectionId`) REFERENCES `DataCollection` (`dataCollectionId`)
) ENGINE=InnoDB AUTO_INCREMENT=56986674 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AutoProcProgram`
--

LOCK TABLES `AutoProcProgram` WRITE;
/*!40000 ALTER TABLE `AutoProcProgram` DISABLE KEYS */;
INSERT INTO `AutoProcProgram` VALUES (56425592,'/dls_sw/apps/fast_dp/2395/src/fast_dp.py -a S -j 0 -J 18 /dls/i03/data/2016/cm14451-1/20160114/tlys_jan_4/tlys_jan_4_1_0001.cbf','fast_dp',NULL,NULL,NULL,NULL,NULL,'2016-01-14 12:46:22',NULL),(56425944,'xia2 min_images=3 -3dii -xparallel -1 -atom s -blend -project cm14451v1 -crystal xtlysjan41 -ispyb_xml_out ispyb.xml image=/dls/i03/data/2016/cm14451-1/20160114/tlys_jan_4/tlys_jan_4_1_0001.cbf','xia2',NULL,NULL,NULL,NULL,NULL,'2016-01-14 13:09:51',NULL),(56425952,'xia2 min_images=3 -dials -xparallel -1 -atom s -blend -project cm14451v1 -crystal xtlysjan41 -ispyb_xml_out ispyb.xml image=/dls/i03/data/2016/cm14451-1/20160114/tlys_jan_4/tlys_jan_4_1_0001.cbf','xia2',NULL,NULL,NULL,NULL,NULL,'2016-01-14 13:24:22',NULL),(56425963,'/dls_sw/apps/GPhL/autoPROC/20151214/autoPROC/bin/linux64/process -xml -Id xtlysjan41,/dls/i03/data/2016/cm14451-1/20160114/tlys_jan_4/,tlys_jan_4_1_####.cbf,1,3600 autoPROC_XdsKeyword_MAXIMUM_NUMBER_OF_PROCESSORS=12 autoPROC_XdsKeyword_MAXIMUM_NUMBER_OF_J','autoPROC 1.0.4 (see: http://www.globalphasing.com/autoproc/)',NULL,NULL,NULL,NULL,NULL,'2016-01-14 13:34:34',NULL),(56426286,'xia2 min_images=3 -dials -atom s -blend -ispyb_xml_out ispyb.xml image=/dls/i03/data/2016/cm14451-1/20160114/tlys_jan_4/linediffraction_1_0001.cbf image=/dls/i03/data/2016/cm14451-1/20160114/tlys_jan_4/tlys_jan_4_1_0001.cbf','xia2',NULL,NULL,NULL,NULL,NULL,'2016-01-14 14:01:57',NULL),(56426287,'xia2 min_images=3 -3dii -atom s -blend -ispyb_xml_out ispyb.xml image=/dls/i03/data/2016/cm14451-1/20160114/tlys_jan_4/linediffraction_1_0001.cbf image=/dls/i03/data/2016/cm14451-1/20160114/tlys_jan_4/tlys_jan_4_1_0001.cbf','xia2',NULL,NULL,NULL,NULL,NULL,'2016-01-14 14:13:57',NULL),(56983954,'/dls_sw/apps/fast_dp/2395/src/fast_dp.py -a S -j 0 -J 18 /dls/i03/data/2016/cm14451-1/20160122/gw/ins2/001/ins2_2_0001.cbf','fast_dp',NULL,NULL,NULL,NULL,NULL,'2016-01-22 11:34:03',NULL),(56985584,'xia2 min_images=3 -3d -xparallel -1 -atom s -blend -project cm14451v1 -crystal xins22 -ispyb_xml_out ispyb.xml image=/dls/i03/data/2016/cm14451-1/20160122/gw/ins2/001/ins2_2_0001.cbf','xia2',NULL,NULL,NULL,NULL,NULL,'2016-01-22 11:52:36',NULL),(56985589,'/dls_sw/apps/GPhL/autoPROC/20151214/autoPROC/bin/linux64/process -xml -Id xins22,/dls/i03/data/2016/cm14451-1/20160122/gw/ins2/001/,ins2_2_####.cbf,1,7200 autoPROC_XdsKeyword_MAXIMUM_NUMBER_OF_PROCESSORS=12 autoPROC_XdsKeyword_MAXIMUM_NUMBER_OF_JOBS=4 Sto','autoPROC 1.0.4 (see: http://www.globalphasing.com/autoproc/)',NULL,NULL,NULL,NULL,NULL,'2016-01-22 11:53:38',NULL),(56985592,'xia2 min_images=3 -3dii -xparallel -1 -atom s -blend -project cm14451v1 -crystal xins22 -ispyb_xml_out ispyb.xml image=/dls/i03/data/2016/cm14451-1/20160122/gw/ins2/001/ins2_2_0001.cbf','xia2',NULL,NULL,NULL,NULL,NULL,'2016-01-22 11:54:01',NULL),(56986673,'xia2 min_images=3 -dials -xparallel -1 -atom s -blend -project cm14451v1 -crystal xins22 -ispyb_xml_out ispyb.xml image=/dls/i03/data/2016/cm14451-1/20160122/gw/ins2/001/ins2_2_0001.cbf','xia2',NULL,NULL,NULL,NULL,NULL,'2016-01-22 12:01:59',NULL);
/*!40000 ALTER TABLE `AutoProcProgram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AutoProcProgramAttachment`
--

DROP TABLE IF EXISTS `AutoProcProgramAttachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AutoProcProgramAttachment` (
  `autoProcProgramAttachmentId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key (auto-incremented)',
  `autoProcProgramId` int(10) unsigned NOT NULL COMMENT 'Related autoProcProgram item',
  `fileType` enum('Log','Result','Graph') DEFAULT NULL COMMENT 'Type of file Attachment',
  `fileName` varchar(255) DEFAULT NULL COMMENT 'Attachment filename',
  `filePath` varchar(255) DEFAULT NULL COMMENT 'Attachment filepath to disk storage',
  `recordTimeStamp` datetime DEFAULT NULL COMMENT 'Creation or last update date/time',
  PRIMARY KEY (`autoProcProgramAttachmentId`),
  KEY `AutoProcProgramAttachmentIdx1` (`autoProcProgramId`),
  CONSTRAINT `AutoProcProgramAttachmentFk1` FOREIGN KEY (`autoProcProgramId`) REFERENCES `AutoProcProgram` (`autoProcProgramId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1037185 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AutoProcProgramAttachment`
--

LOCK TABLES `AutoProcProgramAttachment` WRITE;
/*!40000 ALTER TABLE `AutoProcProgramAttachment` DISABLE KEYS */;
INSERT INTO `AutoProcProgramAttachment` VALUES (1023947,56425592,'Log','fast_dp.log','/dls/i03/data/2016/cm14451-1/processed/20160114/tlys_jan_4/tlys_jan_4_1_/fast_dp','2016-01-14 12:46:22'),(1023955,56425944,'Result','cm14451v1_xtlysjan41_free.mtz','/dls/i03/data/2016/cm14451-1/processed/20160114/tlys_jan_4/tlys_jan_4_1_/xia2/3dii-run/DataFiles','2016-01-14 13:09:51'),(1023956,56425944,'Log','xia2.html','/dls/i03/data/2016/cm14451-1/processed/20160114/tlys_jan_4/tlys_jan_4_1_/xia2/3dii-run','2016-01-14 13:09:51'),(1023969,56425952,'Result','cm14451v1_xtlysjan41_free.mtz','/dls/i03/data/2016/cm14451-1/processed/20160114/tlys_jan_4/tlys_jan_4_1_/xia2/dials-run/DataFiles','2016-01-14 13:24:22'),(1023970,56425952,'Log','xia2.html','/dls/i03/data/2016/cm14451-1/processed/20160114/tlys_jan_4/tlys_jan_4_1_/xia2/dials-run','2016-01-14 13:24:22'),(1023971,56425963,'Log','autoPROC.log','/dls/i03/data/2016/cm14451-1/processed/20160114/tlys_jan_4/tlys_jan_4_1_/autoPROC/ap-run','2016-01-14 13:34:34'),(1023972,56425963,'Result','truncate-unique.mtz','/dls/i03/data/2016/cm14451-1/processed/20160114/tlys_jan_4/tlys_jan_4_1_/autoPROC/ap-run','2016-01-14 13:34:34'),(1023973,56426286,'Result','AUTOMATIC_DEFAULT_free.mtz','/dls/i03/data/2016/cm14451-1/processed/20160114/tlys_jan_4/linediffraction_1_/multi-xia2/dials/DataFiles','2016-01-14 14:01:57'),(1023974,56426286,'Log','xia2.html','/dls/i03/data/2016/cm14451-1/processed/20160114/tlys_jan_4/linediffraction_1_/multi-xia2/dials','2016-01-14 14:01:57'),(1023975,56426287,'Result','AUTOMATIC_DEFAULT_free.mtz','/dls/i03/data/2016/cm14451-1/processed/20160114/tlys_jan_4/linediffraction_1_/multi-xia2/3dii/DataFiles','2016-01-14 14:13:57'),(1023976,56426287,'Log','xia2.html','/dls/i03/data/2016/cm14451-1/processed/20160114/tlys_jan_4/linediffraction_1_/multi-xia2/3dii','2016-01-14 14:13:57'),(1037121,56983954,'Log','fast_dp.log','/dls/i03/data/2016/cm14451-1/processed/20160122/gw/ins2/001/ins2_2_/fast_dp','2016-01-22 11:34:03'),(1037160,56985584,'Result','cm14451v1_xins22_free.mtz','/dls/i03/data/2016/cm14451-1/processed/20160122/gw/ins2/001/ins2_2_/xia2/3d-run/DataFiles','2016-01-22 11:52:36'),(1037161,56985584,'Log','xia2.html','/dls/i03/data/2016/cm14451-1/processed/20160122/gw/ins2/001/ins2_2_/xia2/3d-run','2016-01-22 11:52:36'),(1037162,56985589,'Log','autoPROC.log','/dls/i03/data/2016/cm14451-1/processed/20160122/gw/ins2/001/ins2_2_/autoPROC/ap-run','2016-01-22 11:53:38'),(1037163,56985589,'Result','truncate-unique.mtz','/dls/i03/data/2016/cm14451-1/processed/20160122/gw/ins2/001/ins2_2_/autoPROC/ap-run','2016-01-22 11:53:38'),(1037168,56985592,'Result','cm14451v1_xins22_free.mtz','/dls/i03/data/2016/cm14451-1/processed/20160122/gw/ins2/001/ins2_2_/xia2/3dii-run/DataFiles','2016-01-22 11:54:01'),(1037169,56985592,'Log','xia2.html','/dls/i03/data/2016/cm14451-1/processed/20160122/gw/ins2/001/ins2_2_/xia2/3dii-run','2016-01-22 11:54:01'),(1037183,56986673,'Result','cm14451v1_xins22_free.mtz','/dls/i03/data/2016/cm14451-1/processed/20160122/gw/ins2/001/ins2_2_/xia2/dials-run/DataFiles','2016-01-22 12:01:59'),(1037184,56986673,'Log','xia2.html','/dls/i03/data/2016/cm14451-1/processed/20160122/gw/ins2/001/ins2_2_/xia2/dials-run','2016-01-22 12:01:59');
/*!40000 ALTER TABLE `AutoProcProgramAttachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AutoProcScaling`
--

DROP TABLE IF EXISTS `AutoProcScaling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AutoProcScaling` (
  `autoProcScalingId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key (auto-incremented)',
  `autoProcId` int(10) unsigned DEFAULT NULL COMMENT 'Related autoProc item (used by foreign key)',
  `recordTimeStamp` datetime DEFAULT NULL COMMENT 'Creation or last update date/time',
  PRIMARY KEY (`autoProcScalingId`),
  KEY `AutoProcScalingFk1` (`autoProcId`),
  KEY `AutoProcScalingIdx1` (`autoProcScalingId`,`autoProcId`),
  CONSTRAINT `AutoProcScalingFk1` FOREIGN KEY (`autoProcId`) REFERENCES `AutoProc` (`autoProcId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=603471 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AutoProcScaling`
--

LOCK TABLES `AutoProcScaling` WRITE;
/*!40000 ALTER TABLE `AutoProcScaling` DISABLE KEYS */;
INSERT INTO `AutoProcScaling` VALUES (596133,596406,'2016-01-14 12:46:22'),(596138,596411,'2016-01-14 13:09:51'),(596145,596418,'2016-01-14 13:24:22'),(596146,596419,'2016-01-14 13:34:35'),(596147,596420,'2016-01-14 14:01:57'),(596148,596421,'2016-01-14 14:13:57'),(603434,603708,'2016-01-22 11:34:03'),(603457,603731,'2016-01-22 11:52:36'),(603458,603732,'2016-01-22 11:53:38'),(603461,603735,'2016-01-22 11:54:01'),(603470,603744,'2016-01-22 12:01:59');
/*!40000 ALTER TABLE `AutoProcScaling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AutoProcScalingStatistics`
--

DROP TABLE IF EXISTS `AutoProcScalingStatistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AutoProcScalingStatistics` (
  `autoProcScalingStatisticsId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key (auto-incremented)',
  `autoProcScalingId` int(10) unsigned DEFAULT NULL COMMENT 'Related autoProcScaling item (used by foreign key)',
  `scalingStatisticsType` enum('overall','innerShell','outerShell') NOT NULL DEFAULT 'overall' COMMENT 'Scaling statistics type',
  `comments` varchar(255) DEFAULT NULL COMMENT 'Comments...',
  `resolutionLimitLow` float DEFAULT NULL COMMENT 'Low resolution limit',
  `resolutionLimitHigh` float DEFAULT NULL COMMENT 'High resolution limit',
  `rMerge` float DEFAULT NULL COMMENT 'Rmerge',
  `rMeasWithinIPlusIMinus` float DEFAULT NULL COMMENT 'Rmeas (within I+/I-)',
  `rMeasAllIPlusIMinus` float DEFAULT NULL COMMENT 'Rmeas (all I+ & I-)',
  `rPimWithinIPlusIMinus` float DEFAULT NULL COMMENT 'Rpim (within I+/I-) ',
  `rPimAllIPlusIMinus` float DEFAULT NULL COMMENT 'Rpim (all I+ & I-)',
  `fractionalPartialBias` float DEFAULT NULL COMMENT 'Fractional partial bias',
  `nTotalObservations` int(10) DEFAULT NULL COMMENT 'Total number of observations',
  `nTotalUniqueObservations` int(10) DEFAULT NULL COMMENT 'Total number unique',
  `meanIOverSigI` float DEFAULT NULL COMMENT 'Mean((I)/sd(I))',
  `completeness` float DEFAULT NULL COMMENT 'Completeness',
  `multiplicity` float DEFAULT NULL COMMENT 'Multiplicity',
  `anomalousCompleteness` float DEFAULT NULL COMMENT 'Anomalous completeness',
  `anomalousMultiplicity` float DEFAULT NULL COMMENT 'Anomalous multiplicity',
  `recordTimeStamp` datetime DEFAULT NULL COMMENT 'Creation or last update date/time',
  `anomalous` tinyint(1) DEFAULT '0' COMMENT 'boolean type:0 noanoum - 1 anoum',
  `ccHalf` float DEFAULT NULL COMMENT 'information from XDS',
  `CCANOMALOUS` float DEFAULT NULL,
  PRIMARY KEY (`autoProcScalingStatisticsId`),
  KEY `AutoProcScalingStatisticsIdx1` (`autoProcScalingId`),
  KEY `AutoProcScalingStatistics_FKindexType` (`scalingStatisticsType`),
  CONSTRAINT `AutoProcScalingStatisticsFk1` FOREIGN KEY (`autoProcScalingId`) REFERENCES `AutoProcScaling` (`autoProcScalingId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1792631 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AutoProcScalingStatistics`
--

LOCK TABLES `AutoProcScalingStatistics` WRITE;
/*!40000 ALTER TABLE `AutoProcScalingStatistics` DISABLE KEYS */;
INSERT INTO `AutoProcScalingStatistics` VALUES (1770617,596133,'outerShell',NULL,1.65,1.61,0.766,NULL,0.789,NULL,NULL,NULL,105090,3089,5.5,97.8,34,96.8,17.8,'2016-01-14 12:46:22',0,91.7,15.8),(1770618,596133,'innerShell',NULL,29.5,7.18,0.061,NULL,0.063,NULL,NULL,NULL,17093,593,61.7,98.6,28.8,100,19.5,'2016-01-14 12:46:22',0,99.9,73.4),(1770619,596133,'overall',NULL,29.5,1.61,0.106,NULL,0.109,NULL,NULL,NULL,1588225,43478,30.2,99.8,36.5,99.8,19.4,'2016-01-14 12:46:22',0,99.9,60.5),(1770632,596138,'outerShell',NULL,1.49,1.45,1.326,NULL,1.419,0.506,0.365,NULL,61482,4245,2,99.8,14.5,99.5,7.4,'2016-01-14 13:09:51',0,0.584,-0.059),(1770633,596138,'innerShell',NULL,68.18,6.48,0.064,NULL,0.07,0.015,0.012,NULL,23609,800,58.6,99.8,29.5,100,19.7,'2016-01-14 13:09:51',0,0.998,0.732),(1770634,596138,'overall',NULL,68.18,1.45,0.116,NULL,0.123,0.028,0.021,NULL,1942930,58601,22.9,99.9,33.2,99.9,17.4,'2016-01-14 13:09:51',0,0.999,0.592),(1770653,596145,'outerShell',NULL,1.46,1.42,3.758,NULL,4.107,1.67,1.216,NULL,42977,4422,2.2,97.9,9.7,96.3,5,'2016-01-14 13:24:22',0,0.497,-0.012),(1770654,596145,'innerShell',NULL,129.88,6.35,0.09,NULL,0.095,0.02,0.017,NULL,28041,858,32,100,32.7,100,21.3,'2016-01-14 13:24:22',0,0.996,0.556),(1770655,596145,'overall',NULL,129.88,1.42,0.177,NULL,0.184,0.045,0.033,NULL,1942399,62483,16.4,99.8,31.1,99.7,16.2,'2016-01-14 13:24:22',0,0.999,0.343),(1770656,596146,'outerShell',NULL,1.476,1.451,1.268,1.314,1.312,0.459,0.33,NULL,42945,2859,2.4,99.2,15,98.9,7.8,'2016-01-14 13:34:35',0,0.633,-0.059),(1770657,596146,'innerShell',NULL,129.722,3.938,0.08,0.078,0.081,0.017,0.014,NULL,103297,3251,50.7,100,31.8,99.7,19.1,'2016-01-14 13:34:35',0,0.993,-0.169),(1770658,596146,'overall',NULL,129.722,1.451,0.138,0.141,0.141,0.032,0.024,NULL,1953227,58523,22.5,100,33.4,100,17.8,'2016-01-14 13:34:35',0,0.996,0.035),(1770659,596147,'outerShell',NULL,1.47,1.43,3.442,NULL,3.711,1.471,1.058,NULL,46996,4388,1.6,99,10.7,97.8,5.5,'2016-01-14 14:01:57',0,0.627,-0.004),(1770660,596147,'innerShell',NULL,129.84,6.4,0.124,NULL,0.129,0.023,0.019,NULL,41147,842,27,100,48.9,100,31.8,'2016-01-14 14:01:57',0,0.996,0.532),(1770661,596147,'overall',NULL,129.84,1.43,0.707,NULL,0.719,0.156,0.114,NULL,2865527,61286,14.1,99.9,46.8,99.8,24.3,'2016-01-14 14:01:57',0,0.998,0.175),(1770662,596148,'outerShell',NULL,1.47,1.43,1.278,NULL,1.362,0.447,0.326,NULL,66780,4414,1.7,99.2,15.1,97,7.8,'2016-01-14 14:13:57',0,0.564,-0.056),(1770663,596148,'innerShell',NULL,80.23,6.4,0.106,NULL,0.112,0.02,0.017,NULL,36380,837,58.7,100,43.5,100,28.9,'2016-01-14 14:13:57',0,0.987,0.717),(1770664,596148,'overall',NULL,80.23,1.43,0.166,NULL,0.172,0.032,0.024,NULL,2926200,61215,22.9,99.9,47.8,99.8,25,'2016-01-14 14:13:57',0,0.997,0.589),(1792520,603434,'outerShell',NULL,1.57,1.53,0.765,NULL,0.775,NULL,NULL,NULL,64789,889,7.4,97.6,72.9,97.3,37,'2016-01-22 11:34:03',0,97.7,-4.8),(1792521,603434,'innerShell',NULL,27.63,6.84,0.043,NULL,0.044,NULL,NULL,NULL,10404,156,144.1,98.6,66.7,99,39.5,'2016-01-22 11:34:03',0,100,74.1),(1792522,603434,'overall',NULL,27.63,1.53,0.073,NULL,0.074,NULL,NULL,NULL,946151,12186,50.8,99.8,77.6,99.8,40,'2016-01-22 11:34:03',0,100,41.3),(1792589,603457,'outerShell',NULL,1.38,1.34,3.435,NULL,3.586,0.744,0.543,NULL,57789,1347,1.2,100,42.9,100,21.2,'2016-01-22 11:52:36',0,0.622,-0.017),(1792590,603457,'innerShell',NULL,31.9,6,0.044,NULL,0.046,0.007,0.006,NULL,15766,225,131.3,99.6,70.1,100,40.5,'2016-01-22 11:52:36',0,1,0.665),(1792591,603457,'overall',NULL,31.9,1.34,0.08,NULL,0.082,0.013,0.009,NULL,1309987,17989,34.2,100,72.8,100,37.2,'2016-01-22 11:52:36',0,1,0.484),(1792592,603458,'outerShell',NULL,1.4,1.376,2.142,2.136,2.156,0.345,0.249,NULL,60591,813,2.4,100,74.5,100,38.1,'2016-01-22 11:53:38',0,0.908,0.059),(1792593,603458,'innerShell',NULL,39.079,3.735,0.045,0.044,0.045,0.007,0.005,NULL,64542,887,114,99.9,72.8,99.9,40.2,'2016-01-22 11:53:38',0,1,0.267),(1792594,603458,'overall',NULL,39.079,1.376,0.083,0.084,0.083,0.013,0.009,NULL,1275766,16626,35,100,76.7,100,39.9,'2016-01-22 11:53:38',0,1,0.217),(1792601,603461,'outerShell',NULL,1.38,1.34,3.444,NULL,3.597,0.746,0.545,NULL,57746,1347,1.2,100,42.9,100,21.2,'2016-01-22 11:54:01',0,0.647,0.002),(1792602,603461,'innerShell',NULL,31.9,6,0.044,NULL,0.046,0.007,0.006,NULL,15773,225,131.2,99.6,70.1,100,40.5,'2016-01-22 11:54:01',0,1,0.654),(1792603,603461,'overall',NULL,31.9,1.34,0.08,NULL,0.082,0.013,0.009,NULL,1314502,17989,34.2,100,73.1,100,37.3,'2016-01-22 11:54:01',0,1,0.469),(1792628,603470,'outerShell',NULL,1.36,1.33,3.124,NULL,3.246,0.711,0.515,NULL,53402,1370,1.3,100,39,100,19.2,'2016-01-22 12:01:59',0,0.703,0.017),(1792629,603470,'innerShell',NULL,39.07,5.95,0.051,NULL,0.053,0.008,0.006,NULL,16799,235,117.7,99.7,71.5,100,41.9,'2016-01-22 12:01:59',0,1,0.654),(1792630,603470,'overall',NULL,39.07,1.33,0.08,NULL,0.082,0.013,0.009,NULL,1305126,18395,30.9,100,71,100,36.1,'2016-01-22 12:01:59',0,1,0.482);
/*!40000 ALTER TABLE `AutoProcScalingStatistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AutoProcScaling_has_Int`
--

DROP TABLE IF EXISTS `AutoProcScaling_has_Int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AutoProcScaling_has_Int` (
  `autoProcScaling_has_IntId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key (auto-incremented)',
  `autoProcScalingId` int(10) unsigned DEFAULT NULL COMMENT 'AutoProcScaling item',
  `autoProcIntegrationId` int(10) unsigned NOT NULL COMMENT 'AutoProcIntegration item',
  `recordTimeStamp` datetime DEFAULT NULL COMMENT 'Creation or last update date/time',
  PRIMARY KEY (`autoProcScaling_has_IntId`),
  KEY `AutoProcScalingHasInt_FKIndex3` (`autoProcScalingId`,`autoProcIntegrationId`),
  KEY `AutoProcScal_has_IntIdx2` (`autoProcIntegrationId`),
  KEY `AutoProcScl_has_IntIdx1` (`autoProcScalingId`),
  CONSTRAINT `AutoProcScaling_has_IntFk1` FOREIGN KEY (`autoProcScalingId`) REFERENCES `AutoProcScaling` (`autoProcScalingId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AutoProcScaling_has_IntFk2` FOREIGN KEY (`autoProcIntegrationId`) REFERENCES `AutoProcIntegration` (`autoProcIntegrationId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=600376 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AutoProcScaling_has_Int`
--

LOCK TABLES `AutoProcScaling_has_Int` WRITE;
/*!40000 ALTER TABLE `AutoProcScaling_has_Int` DISABLE KEYS */;
INSERT INTO `AutoProcScaling_has_Int` VALUES (592507,596133,592508,'2016-01-14 12:46:22'),(592512,596138,592513,'2016-01-14 13:09:51'),(592519,596145,592520,'2016-01-14 13:24:22'),(592520,596146,592521,'2016-01-14 13:34:35'),(592521,596147,592522,'2016-01-14 14:01:57'),(592522,596147,592523,'2016-01-14 14:01:57'),(592523,596148,592524,'2016-01-14 14:13:57'),(592524,596148,592525,'2016-01-14 14:13:57'),(600338,603434,600339,'2016-01-22 11:34:03'),(600361,603457,600362,'2016-01-22 11:52:36'),(600362,603458,600363,'2016-01-22 11:53:38'),(600365,603461,600366,'2016-01-22 11:54:01'),(600375,603470,600376,'2016-01-22 12:01:59');
/*!40000 ALTER TABLE `AutoProcScaling_has_Int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AutoProcStatus`
--

DROP TABLE IF EXISTS `AutoProcStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AutoProcStatus` (
  `autoProcStatusId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key (auto-incremented)',
  `autoProcIntegrationId` int(10) unsigned NOT NULL,
  `step` enum('Indexing','Integration','Correction','Scaling','Importing') NOT NULL COMMENT 'autoprocessing step',
  `status` enum('Launched','Successful','Failed') NOT NULL COMMENT 'autoprocessing status',
  `comments` varchar(1024) DEFAULT NULL COMMENT 'comments',
  `bltimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`autoProcStatusId`),
  KEY `AutoProcStatus_FKIndex1` (`autoProcIntegrationId`),
  CONSTRAINT `AutoProcStatus_ibfk_1` FOREIGN KEY (`autoProcIntegrationId`) REFERENCES `AutoProcIntegration` (`autoProcIntegrationId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='AutoProcStatus table is linked to AutoProcIntegration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AutoProcStatus`
--

LOCK TABLES `AutoProcStatus` WRITE;
/*!40000 ALTER TABLE `AutoProcStatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `AutoProcStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BF_component`
--

DROP TABLE IF EXISTS `BF_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BF_component` (
  `componentId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `systemId` int(10) unsigned DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`componentId`),
  KEY `bf_component_FK1` (`systemId`),
  CONSTRAINT `bf_component_FK1` FOREIGN KEY (`systemId`) REFERENCES `BF_system` (`systemId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BF_component`
--

LOCK TABLES `BF_component` WRITE;
/*!40000 ALTER TABLE `BF_component` DISABLE KEYS */;
/*!40000 ALTER TABLE `BF_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BF_component_beamline`
--

DROP TABLE IF EXISTS `BF_component_beamline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BF_component_beamline` (
  `component_beamlineId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `componentId` int(10) unsigned DEFAULT NULL,
  `beamlinename` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`component_beamlineId`),
  KEY `bf_component_beamline_FK1` (`componentId`),
  CONSTRAINT `bf_component_beamline_FK1` FOREIGN KEY (`componentId`) REFERENCES `BF_component` (`componentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BF_component_beamline`
--

LOCK TABLES `BF_component_beamline` WRITE;
/*!40000 ALTER TABLE `BF_component_beamline` DISABLE KEYS */;
/*!40000 ALTER TABLE `BF_component_beamline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BF_fault`
--

DROP TABLE IF EXISTS `BF_fault`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BF_fault` (
  `faultId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sessionId` int(10) unsigned NOT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `subcomponentId` int(10) unsigned DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `beamtimelost` tinyint(1) DEFAULT NULL,
  `beamtimelost_starttime` datetime DEFAULT NULL,
  `beamtimelost_endtime` datetime DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `description` text,
  `resolved` tinyint(1) DEFAULT NULL,
  `resolution` text,
  `attachment` varchar(200) DEFAULT NULL,
  `eLogId` int(11) DEFAULT NULL,
  `assignee` varchar(50) DEFAULT NULL,
  `personId` int(10) unsigned DEFAULT NULL,
  `assigneeId` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`faultId`),
  KEY `bf_fault_FK1` (`sessionId`),
  KEY `bf_fault_FK2` (`subcomponentId`),
  KEY `bf_fault_FK3` (`personId`),
  KEY `bf_fault_FK4` (`assigneeId`),
  CONSTRAINT `bf_fault_FK1` FOREIGN KEY (`sessionId`) REFERENCES `BLSession` (`sessionId`),
  CONSTRAINT `bf_fault_FK2` FOREIGN KEY (`subcomponentId`) REFERENCES `BF_subcomponent` (`subcomponentId`),
  CONSTRAINT `bf_fault_FK3` FOREIGN KEY (`personId`) REFERENCES `Person` (`personId`),
  CONSTRAINT `bf_fault_FK4` FOREIGN KEY (`assigneeId`) REFERENCES `Person` (`personId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BF_fault`
--

LOCK TABLES `BF_fault` WRITE;
/*!40000 ALTER TABLE `BF_fault` DISABLE KEYS */;
/*!40000 ALTER TABLE `BF_fault` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BF_subcomponent`
--

DROP TABLE IF EXISTS `BF_subcomponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BF_subcomponent` (
  `subcomponentId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `componentId` int(10) unsigned DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`subcomponentId`),
  KEY `bf_subcomponent_FK1` (`componentId`),
  CONSTRAINT `bf_subcomponent_FK1` FOREIGN KEY (`componentId`) REFERENCES `BF_component` (`componentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BF_subcomponent`
--

LOCK TABLES `BF_subcomponent` WRITE;
/*!40000 ALTER TABLE `BF_subcomponent` DISABLE KEYS */;
/*!40000 ALTER TABLE `BF_subcomponent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BF_subcomponent_beamline`
--

DROP TABLE IF EXISTS `BF_subcomponent_beamline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BF_subcomponent_beamline` (
  `subcomponent_beamlineId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subcomponentId` int(10) unsigned DEFAULT NULL,
  `beamlinename` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`subcomponent_beamlineId`),
  KEY `bf_subcomponent_beamline_FK1` (`subcomponentId`),
  CONSTRAINT `bf_subcomponent_beamline_FK1` FOREIGN KEY (`subcomponentId`) REFERENCES `BF_subcomponent` (`subcomponentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BF_subcomponent_beamline`
--

LOCK TABLES `BF_subcomponent_beamline` WRITE;
/*!40000 ALTER TABLE `BF_subcomponent_beamline` DISABLE KEYS */;
/*!40000 ALTER TABLE `BF_subcomponent_beamline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BF_system`
--

DROP TABLE IF EXISTS `BF_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BF_system` (
  `systemId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`systemId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BF_system`
--

LOCK TABLES `BF_system` WRITE;
/*!40000 ALTER TABLE `BF_system` DISABLE KEYS */;
/*!40000 ALTER TABLE `BF_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BF_system_beamline`
--

DROP TABLE IF EXISTS `BF_system_beamline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BF_system_beamline` (
  `system_beamlineId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `systemId` int(10) unsigned DEFAULT NULL,
  `beamlineName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`system_beamlineId`),
  KEY `bf_system_beamline_FK1` (`systemId`),
  CONSTRAINT `bf_system_beamline_FK1` FOREIGN KEY (`systemId`) REFERENCES `BF_system` (`systemId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BF_system_beamline`
--

LOCK TABLES `BF_system_beamline` WRITE;
/*!40000 ALTER TABLE `BF_system_beamline` DISABLE KEYS */;
/*!40000 ALTER TABLE `BF_system_beamline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLSample`
--

DROP TABLE IF EXISTS `BLSample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLSample` (
  `blSampleId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `diffractionPlanId` int(10) unsigned DEFAULT NULL,
  `crystalId` int(10) unsigned DEFAULT '0',
  `containerId` int(10) unsigned DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `holderLength` double DEFAULT NULL,
  `loopLength` double DEFAULT NULL,
  `loopType` varchar(45) DEFAULT NULL,
  `wireWidth` double DEFAULT NULL,
  `comments` varchar(1024) DEFAULT NULL,
  `completionStage` varchar(45) DEFAULT NULL,
  `structureStage` varchar(45) DEFAULT NULL,
  `publicationStage` varchar(45) DEFAULT NULL,
  `publicationComments` varchar(255) DEFAULT NULL,
  `blSampleStatus` varchar(20) DEFAULT NULL,
  `isInSampleChanger` tinyint(1) DEFAULT NULL,
  `lastKnownCenteringPosition` varchar(255) DEFAULT NULL,
  `POSITIONID` int(11) unsigned DEFAULT NULL,
  `recordTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation or last update date/time',
  `SMILES` varchar(400) DEFAULT NULL COMMENT 'the symbolic description of the structure of a chemical compound',
  `blSubSampleId` int(11) unsigned DEFAULT NULL,
  `lastImageURL` varchar(255) DEFAULT NULL,
  `screenComponentGroupId` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`blSampleId`),
  KEY `BLSample_FKIndex1` (`containerId`),
  KEY `BLSample_FKIndex2` (`crystalId`),
  KEY `BLSample_FKIndex3` (`diffractionPlanId`),
  KEY `BLSample_FKIndex_Status` (`blSampleStatus`),
  KEY `BLSample_Index1` (`name`),
  KEY `crystalId` (`crystalId`,`containerId`),
  KEY `BLSampleImage_idx1` (`blSubSampleId`),
  KEY `BLSample_fk5` (`screenComponentGroupId`),
  CONSTRAINT `BLSample_fk5` FOREIGN KEY (`screenComponentGroupId`) REFERENCES `ScreenComponentGroup` (`screenComponentGroupId`),
  CONSTRAINT `BLSample_ibfk4` FOREIGN KEY (`blSubSampleId`) REFERENCES `BLSubSample` (`blSubSampleId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `BLSample_ibfk_1` FOREIGN KEY (`containerId`) REFERENCES `Container` (`containerId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BLSample_ibfk_2` FOREIGN KEY (`crystalId`) REFERENCES `Crystal` (`crystalId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BLSample_ibfk_3` FOREIGN KEY (`diffractionPlanId`) REFERENCES `DiffractionPlan` (`diffractionPlanId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=398811 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLSample`
--

LOCK TABLES `BLSample` WRITE;
/*!40000 ALTER TABLE `BLSample` DISABLE KEYS */;
INSERT INTO `BLSample` VALUES (11550,NULL,3918,1326,'Sample-001','SAM-011550','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-17 16:16:11',NULL,NULL,NULL,NULL),(11553,NULL,3921,1326,'Sample-002','SAM-011553','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-17 16:21:43',NULL,NULL,NULL,NULL),(11556,NULL,3924,1326,'Sample-003','SAM-011556','3',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-17 16:27:25',NULL,NULL,NULL,NULL),(11559,NULL,3927,1329,'Sample-004','SAM-011559','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-17 16:27:25',NULL,NULL,NULL,NULL),(11562,NULL,3930,1329,'Sample-005','SAM-011562','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-17 16:27:25',NULL,NULL,NULL,NULL),(11565,NULL,3933,1329,'Sample-006','SAM-011565','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-17 16:27:25',NULL,NULL,NULL,NULL),(11568,NULL,3936,1332,'Sample-007','SAM-011568','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-17 16:27:25',NULL,NULL,NULL,NULL),(11571,NULL,3939,1332,'Sample-008','SAM-011571','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-17 16:27:25',NULL,NULL,NULL,NULL),(11574,NULL,3942,1332,'Sample-009','SAM-011574','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-17 16:27:25',NULL,NULL,NULL,NULL),(11577,NULL,3942,1335,'Sample-010','SAM-011577','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-17 16:27:25',NULL,NULL,NULL,NULL),(11580,NULL,3942,1335,'Sample-011','SAM-011580','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-17 16:27:25',NULL,NULL,NULL,NULL),(11583,NULL,3951,1335,'Sample-012','SAM-011583','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-17 16:27:25',NULL,NULL,NULL,NULL),(11586,NULL,3954,NULL,'Sample-013','SAM-011586',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-17 16:27:25',NULL,NULL,NULL,NULL),(11589,NULL,3957,NULL,'Sample-014','SAM-011589',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-17 16:27:25',NULL,NULL,NULL,NULL),(11592,NULL,3960,NULL,'Sample-015','SAM-011592',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-17 16:27:25',NULL,NULL,NULL,NULL),(374695,NULL,310037,33049,'tlys_jan_4','HA00AU3712','4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-19 22:57:04',NULL,NULL,NULL,NULL),(398810,197784,333301,34864,'thau8','HA00AK8934','8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-19 22:57:05',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `BLSample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLSampleImage`
--

DROP TABLE IF EXISTS `BLSampleImage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLSampleImage` (
  `blSampleImageId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `blSampleId` int(11) unsigned NOT NULL,
  `micronsPerPixelX` float DEFAULT NULL,
  `micronsPerPixelY` float DEFAULT NULL,
  `imageFullPath` varchar(255) DEFAULT NULL,
  `blSampleImageScoreId` int(11) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `blTimeStamp` datetime DEFAULT NULL,
  `containerInspectionId` int(11) unsigned DEFAULT NULL,
  `modifiedTimeStamp` datetime DEFAULT NULL,
  PRIMARY KEY (`blSampleImageId`),
  KEY `BLSampleImage_idx1` (`blSampleId`),
  KEY `BLSampleImage_fk2` (`containerInspectionId`),
  CONSTRAINT `BLSampleImage_fk1` FOREIGN KEY (`blSampleId`) REFERENCES `BLSample` (`blSampleId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `BLSampleImage_fk2` FOREIGN KEY (`containerInspectionId`) REFERENCES `ContainerInspection` (`containerInspectionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLSampleImage`
--

LOCK TABLES `BLSampleImage` WRITE;
/*!40000 ALTER TABLE `BLSampleImage` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLSampleImage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLSampleImageScore`
--

DROP TABLE IF EXISTS `BLSampleImageScore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLSampleImageScore` (
  `blSampleImageScoreId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `score` float DEFAULT NULL,
  `colour` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`blSampleImageScoreId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLSampleImageScore`
--

LOCK TABLES `BLSampleImageScore` WRITE;
/*!40000 ALTER TABLE `BLSampleImageScore` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLSampleImageScore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLSampleType_has_Component`
--

DROP TABLE IF EXISTS `BLSampleType_has_Component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLSampleType_has_Component` (
  `blSampleTypeId` int(10) unsigned NOT NULL,
  `componentId` int(10) unsigned NOT NULL,
  `abundance` float DEFAULT NULL,
  PRIMARY KEY (`blSampleTypeId`,`componentId`),
  KEY `blSampleType_has_Component_fk2` (`componentId`),
  CONSTRAINT `blSampleType_has_Component_fk1` FOREIGN KEY (`blSampleTypeId`) REFERENCES `Crystal` (`crystalId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `blSampleType_has_Component_fk2` FOREIGN KEY (`componentId`) REFERENCES `Protein` (`proteinId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLSampleType_has_Component`
--

LOCK TABLES `BLSampleType_has_Component` WRITE;
/*!40000 ALTER TABLE `BLSampleType_has_Component` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLSampleType_has_Component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLSample_has_EnergyScan`
--

DROP TABLE IF EXISTS `BLSample_has_EnergyScan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLSample_has_EnergyScan` (
  `blSampleId` int(10) unsigned NOT NULL DEFAULT '0',
  `energyScanId` int(10) unsigned NOT NULL DEFAULT '0',
  `blSampleHasEnergyScanId` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`blSampleHasEnergyScanId`),
  KEY `BLSample_has_EnergyScan_FKIndex1` (`blSampleId`),
  KEY `BLSample_has_EnergyScan_FKIndex2` (`energyScanId`),
  CONSTRAINT `BLSample_has_EnergyScan_ibfk_1` FOREIGN KEY (`blSampleId`) REFERENCES `BLSample` (`blSampleId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BLSample_has_EnergyScan_ibfk_2` FOREIGN KEY (`energyScanId`) REFERENCES `EnergyScan` (`energyScanId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLSample_has_EnergyScan`
--

LOCK TABLES `BLSample_has_EnergyScan` WRITE;
/*!40000 ALTER TABLE `BLSample_has_EnergyScan` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLSample_has_EnergyScan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLSession`
--

DROP TABLE IF EXISTS `BLSession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLSession` (
  `sessionId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `beamLineSetupId` int(10) unsigned DEFAULT NULL,
  `proposalId` int(10) unsigned NOT NULL DEFAULT '0',
  `projectCode` varchar(45) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `beamLineName` varchar(45) DEFAULT NULL,
  `scheduled` tinyint(1) DEFAULT NULL,
  `nbShifts` int(10) unsigned DEFAULT NULL,
  `comments` varchar(2000) DEFAULT NULL,
  `beamLineOperator` varchar(45) DEFAULT NULL,
  `bltimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `visit_number` int(10) unsigned DEFAULT '0',
  `usedFlag` tinyint(1) DEFAULT NULL COMMENT 'indicates if session has Datacollections or XFE or EnergyScans attached',
  `sessionTitle` varchar(255) DEFAULT NULL COMMENT 'fx accounts only',
  `structureDeterminations` float DEFAULT NULL,
  `dewarTransport` float DEFAULT NULL,
  `databackupFrance` float DEFAULT NULL COMMENT 'data backup and express delivery France',
  `databackupEurope` float DEFAULT NULL COMMENT 'data backup and express delivery Europe',
  `expSessionPk` int(11) unsigned DEFAULT NULL COMMENT 'smis session Pk ',
  `operatorSiteNumber` varchar(10) DEFAULT NULL COMMENT 'matricule site',
  `lastUpdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'last update timestamp: by default the end of the session, the last collect...',
  `protectedData` varchar(1024) DEFAULT NULL COMMENT 'indicates if the data are protected or not',
  PRIMARY KEY (`sessionId`),
  KEY `BLSession_FKIndexOperatorSiteNumber` (`operatorSiteNumber`),
  KEY `Session_FKIndex1` (`proposalId`),
  KEY `Session_FKIndex2` (`beamLineSetupId`),
  KEY `Session_FKIndexBeamLineName` (`beamLineName`),
  KEY `Session_FKIndexEndDate` (`endDate`),
  KEY `Session_FKIndexStartDate` (`startDate`),
  CONSTRAINT `BLSession_ibfk_1` FOREIGN KEY (`proposalId`) REFERENCES `Proposal` (`proposalId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BLSession_ibfk_2` FOREIGN KEY (`beamLineSetupId`) REFERENCES `BeamLineSetup` (`beamLineSetupId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=339532 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLSession`
--

LOCK TABLES `BLSession` WRITE;
/*!40000 ALTER TABLE `BLSession` DISABLE KEYS */;
INSERT INTO `BLSession` VALUES (55167,1,37027,NULL,'2016-01-01 09:00:00','2016-01-01 17:00:00','i03',NULL,NULL,'ghfg',NULL,'2015-12-21 15:20:43',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00',NULL),(55168,1,37027,NULL,'2016-03-11 09:00:00','2016-03-11 17:00:00','i03',NULL,NULL,'jhgjh',NULL,'2015-12-21 15:20:44',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00',NULL),(339525,NULL,141666,NULL,NULL,NULL,'i03',NULL,NULL,NULL,NULL,'2016-03-16 16:08:29',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00',NULL),(339528,NULL,141666,NULL,NULL,NULL,'i03',NULL,NULL,NULL,NULL,'2016-03-17 15:07:42',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00',NULL),(339531,NULL,141666,NULL,NULL,NULL,'i03',NULL,NULL,NULL,NULL,'2016-03-17 15:08:09',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00',NULL);
/*!40000 ALTER TABLE `BLSession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLSession_has_SCPosition`
--

DROP TABLE IF EXISTS `BLSession_has_SCPosition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLSession_has_SCPosition` (
  `blsessionhasscpositionid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `blsessionid` int(11) unsigned NOT NULL,
  `scContainer` smallint(5) unsigned DEFAULT NULL COMMENT 'Position of container within sample changer',
  `containerPosition` smallint(5) unsigned DEFAULT NULL COMMENT 'Position of sample within container',
  PRIMARY KEY (`blsessionhasscpositionid`),
  KEY `blsession_has_scposition_FK1` (`blsessionid`),
  CONSTRAINT `blsession_has_scposition_FK1` FOREIGN KEY (`blsessionid`) REFERENCES `BLSession` (`sessionId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLSession_has_SCPosition`
--

LOCK TABLES `BLSession_has_SCPosition` WRITE;
/*!40000 ALTER TABLE `BLSession_has_SCPosition` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLSession_has_SCPosition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLSubSample`
--

DROP TABLE IF EXISTS `BLSubSample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLSubSample` (
  `blSubSampleId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key (auto-incremented)',
  `blSampleId` int(10) unsigned NOT NULL COMMENT 'sample',
  `diffractionPlanId` int(10) unsigned DEFAULT NULL COMMENT 'eventually diffractionPlan',
  `positionId` int(11) unsigned DEFAULT NULL COMMENT 'position of the subsample',
  `motorPositionId` int(11) unsigned DEFAULT NULL COMMENT 'motor position',
  `blSubSampleUUID` varchar(45) DEFAULT NULL COMMENT 'uuid of the blsubsample',
  `imgFileName` varchar(255) DEFAULT NULL COMMENT 'image filename',
  `imgFilePath` varchar(1024) DEFAULT NULL COMMENT 'url image',
  `comments` varchar(1024) DEFAULT NULL COMMENT 'comments',
  `recordTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation or last update date/time',
  PRIMARY KEY (`blSubSampleId`),
  KEY `BLSubSample_FKIndex1` (`blSampleId`),
  KEY `BLSubSample_FKIndex2` (`diffractionPlanId`),
  KEY `BLSubSample_FKIndex3` (`positionId`),
  KEY `BLSubSample_FKIndex4` (`motorPositionId`),
  CONSTRAINT `BLSubSample_blSamplefk_1` FOREIGN KEY (`blSampleId`) REFERENCES `BLSample` (`blSampleId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BLSubSample_diffractionPlanfk_1` FOREIGN KEY (`diffractionPlanId`) REFERENCES `DiffractionPlan` (`diffractionPlanId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BLSubSample_motorPositionfk_1` FOREIGN KEY (`motorPositionId`) REFERENCES `MotorPosition` (`motorPositionId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BLSubSample_positionfk_1` FOREIGN KEY (`positionId`) REFERENCES `Position` (`positionId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLSubSample`
--

LOCK TABLES `BLSubSample` WRITE;
/*!40000 ALTER TABLE `BLSubSample` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLSubSample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BeamApertures`
--

DROP TABLE IF EXISTS `BeamApertures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BeamApertures` (
  `beamAperturesid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `beamlineStatsId` int(11) unsigned DEFAULT NULL,
  `flux` double DEFAULT NULL,
  `x` float DEFAULT NULL,
  `y` float DEFAULT NULL,
  `apertureSize` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`beamAperturesid`),
  KEY `beamapertures_FK1` (`beamlineStatsId`),
  CONSTRAINT `beamapertures_FK1` FOREIGN KEY (`beamlineStatsId`) REFERENCES `BeamlineStats` (`beamlineStatsId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BeamApertures`
--

LOCK TABLES `BeamApertures` WRITE;
/*!40000 ALTER TABLE `BeamApertures` DISABLE KEYS */;
/*!40000 ALTER TABLE `BeamApertures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BeamCentres`
--

DROP TABLE IF EXISTS `BeamCentres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BeamCentres` (
  `beamCentresid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `beamlineStatsId` int(11) unsigned DEFAULT NULL,
  `x` float DEFAULT NULL,
  `y` float DEFAULT NULL,
  `zoom` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`beamCentresid`),
  KEY `beamCentres_FK1` (`beamlineStatsId`),
  CONSTRAINT `beamCentres_FK1` FOREIGN KEY (`beamlineStatsId`) REFERENCES `BeamlineStats` (`beamlineStatsId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BeamCentres`
--

LOCK TABLES `BeamCentres` WRITE;
/*!40000 ALTER TABLE `BeamCentres` DISABLE KEYS */;
/*!40000 ALTER TABLE `BeamCentres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BeamLineSetup`
--

DROP TABLE IF EXISTS `BeamLineSetup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BeamLineSetup` (
  `beamLineSetupId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `synchrotronMode` varchar(255) DEFAULT NULL,
  `DETECTORTYPE` varchar(255) DEFAULT NULL,
  `DETECTORMANUFACTURER` varchar(255) DEFAULT NULL,
  `DETECTORMODEL` varchar(255) DEFAULT NULL,
  `DETECTORPIXELSIZEHORIZONTAL` float DEFAULT NULL,
  `DETECTORPIXELSIZEVERTICAL` float DEFAULT NULL,
  `undulatorType1` varchar(45) DEFAULT NULL,
  `undulatorType2` varchar(45) DEFAULT NULL,
  `undulatorType3` varchar(45) DEFAULT NULL,
  `focalSpotSizeAtSample` float DEFAULT NULL,
  `focusingOptic` varchar(255) DEFAULT NULL,
  `beamDivergenceHorizontal` float DEFAULT NULL,
  `beamDivergenceVertical` float DEFAULT NULL,
  `polarisation` float DEFAULT NULL,
  `monochromatorType` varchar(255) DEFAULT NULL,
  `setupDate` datetime DEFAULT NULL,
  `synchrotronName` varchar(255) DEFAULT NULL,
  `DETECTORMAXRESOLUTION` float DEFAULT NULL,
  `DETECTORMINRESOLUTION` float DEFAULT NULL,
  `maxExpTimePerDataCollection` double DEFAULT NULL,
  `minExposureTimePerImage` double DEFAULT NULL,
  `goniostatMaxOscillationSpeed` double DEFAULT NULL,
  `goniostatMinOscillationWidth` double DEFAULT NULL,
  `minTransmission` double DEFAULT NULL,
  `recordTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation or last update date/time',
  PRIMARY KEY (`beamLineSetupId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BeamLineSetup`
--

LOCK TABLES `BeamLineSetup` WRITE;
/*!40000 ALTER TABLE `BeamLineSetup` DISABLE KEYS */;
INSERT INTO `BeamLineSetup` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2007-04-26 00:00:00','Diamond Light Source',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-19 22:56:25');
/*!40000 ALTER TABLE `BeamLineSetup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BeamlineStats`
--

DROP TABLE IF EXISTS `BeamlineStats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BeamlineStats` (
  `beamlineStatsId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `beamline` varchar(10) DEFAULT NULL,
  `recordTimeStamp` datetime DEFAULT NULL,
  `ringCurrent` float DEFAULT NULL,
  `energy` float DEFAULT NULL,
  `gony` float DEFAULT NULL,
  `beamW` float DEFAULT NULL,
  `beamH` float DEFAULT NULL,
  `flux` double DEFAULT NULL,
  `scanFileW` varchar(255) DEFAULT NULL,
  `scanFileH` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`beamlineStatsId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BeamlineStats`
--

LOCK TABLES `BeamlineStats` WRITE;
/*!40000 ALTER TABLE `BeamlineStats` DISABLE KEYS */;
/*!40000 ALTER TABLE `BeamlineStats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Buffer`
--

DROP TABLE IF EXISTS `Buffer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Buffer` (
  `bufferId` int(10) NOT NULL AUTO_INCREMENT,
  `BLSESSIONID` int(11) unsigned DEFAULT NULL,
  `safetyLevelId` int(10) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `acronym` varchar(45) DEFAULT NULL,
  `pH` varchar(45) DEFAULT NULL,
  `composition` varchar(45) DEFAULT NULL,
  `comments` varchar(512) DEFAULT NULL,
  `proposalId` int(10) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`bufferId`),
  KEY `BufferToSafetyLevel` (`safetyLevelId`),
  CONSTRAINT `BufferToSafetyLevel` FOREIGN KEY (`safetyLevelId`) REFERENCES `SafetyLevel` (`safetyLevelId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Buffer`
--

LOCK TABLES `Buffer` WRITE;
/*!40000 ALTER TABLE `Buffer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Buffer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BufferHasAdditive`
--

DROP TABLE IF EXISTS `BufferHasAdditive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BufferHasAdditive` (
  `bufferHasAdditiveId` int(10) NOT NULL AUTO_INCREMENT,
  `bufferId` int(10) NOT NULL,
  `additiveId` int(10) NOT NULL,
  `measurementUnitId` int(10) DEFAULT NULL,
  `quantity` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bufferHasAdditiveId`),
  KEY `BufferHasAdditiveToAdditive` (`additiveId`),
  KEY `BufferHasAdditiveToBuffer` (`bufferId`),
  KEY `BufferHasAdditiveToUnit` (`measurementUnitId`),
  CONSTRAINT `BufferHasAdditiveToAdditive` FOREIGN KEY (`additiveId`) REFERENCES `Additive` (`additiveId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BufferHasAdditiveToBuffer` FOREIGN KEY (`bufferId`) REFERENCES `Buffer` (`bufferId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BufferHasAdditiveToUnit` FOREIGN KEY (`measurementUnitId`) REFERENCES `MeasurementUnit` (`measurementUnitId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BufferHasAdditive`
--

LOCK TABLES `BufferHasAdditive` WRITE;
/*!40000 ALTER TABLE `BufferHasAdditive` DISABLE KEYS */;
/*!40000 ALTER TABLE `BufferHasAdditive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CalendarHash`
--

DROP TABLE IF EXISTS `CalendarHash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CalendarHash` (
  `calendarHashId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ckey` varchar(50) DEFAULT NULL,
  `hash` varchar(128) DEFAULT NULL,
  `beamline` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`calendarHashId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Lets people get to their calendars without logging in using a private (hash) url';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CalendarHash`
--

LOCK TABLES `CalendarHash` WRITE;
/*!40000 ALTER TABLE `CalendarHash` DISABLE KEYS */;
/*!40000 ALTER TABLE `CalendarHash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ComponentSubType`
--

DROP TABLE IF EXISTS `ComponentSubType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ComponentSubType` (
  `componentSubTypeId` int(11) unsigned NOT NULL,
  `name` varchar(31) NOT NULL,
  `hasPh` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`componentSubTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ComponentSubType`
--

LOCK TABLES `ComponentSubType` WRITE;
/*!40000 ALTER TABLE `ComponentSubType` DISABLE KEYS */;
/*!40000 ALTER TABLE `ComponentSubType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ComponentType`
--

DROP TABLE IF EXISTS `ComponentType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ComponentType` (
  `componentTypeId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(31) NOT NULL,
  PRIMARY KEY (`componentTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ComponentType`
--

LOCK TABLES `ComponentType` WRITE;
/*!40000 ALTER TABLE `ComponentType` DISABLE KEYS */;
/*!40000 ALTER TABLE `ComponentType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Component_has_SubType`
--

DROP TABLE IF EXISTS `Component_has_SubType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Component_has_SubType` (
  `componentId` int(10) unsigned NOT NULL,
  `componentSubTypeId` int(11) unsigned NOT NULL,
  PRIMARY KEY (`componentId`,`componentSubTypeId`),
  KEY `component_has_SubType_fk2` (`componentSubTypeId`),
  CONSTRAINT `component_has_SubType_fk1` FOREIGN KEY (`componentId`) REFERENCES `Protein` (`proteinId`) ON DELETE CASCADE,
  CONSTRAINT `component_has_SubType_fk2` FOREIGN KEY (`componentSubTypeId`) REFERENCES `ComponentSubType` (`componentSubTypeId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Component_has_SubType`
--

LOCK TABLES `Component_has_SubType` WRITE;
/*!40000 ALTER TABLE `Component_has_SubType` DISABLE KEYS */;
/*!40000 ALTER TABLE `Component_has_SubType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ConcentrationType`
--

DROP TABLE IF EXISTS `ConcentrationType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ConcentrationType` (
  `concentrationTypeId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(31) NOT NULL,
  `symbol` varchar(8) NOT NULL,
  PRIMARY KEY (`concentrationTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ConcentrationType`
--

LOCK TABLES `ConcentrationType` WRITE;
/*!40000 ALTER TABLE `ConcentrationType` DISABLE KEYS */;
/*!40000 ALTER TABLE `ConcentrationType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Container`
--

DROP TABLE IF EXISTS `Container`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Container` (
  `containerId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dewarId` int(10) unsigned DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  `containerType` varchar(20) DEFAULT NULL,
  `capacity` int(10) unsigned DEFAULT NULL,
  `sampleChangerLocation` varchar(20) DEFAULT NULL,
  `containerStatus` varchar(45) DEFAULT NULL,
  `bltimeStamp` datetime DEFAULT NULL,
  `beamlineLocation` varchar(20) DEFAULT NULL,
  `screenId` int(11) unsigned DEFAULT NULL,
  `scheduleId` int(11) unsigned DEFAULT NULL,
  `barcode` varchar(45) DEFAULT NULL,
  `imagerId` int(11) unsigned DEFAULT NULL,
  `sessionId` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`containerId`),
  KEY `Container_FKIndex` (`beamlineLocation`),
  KEY `Container_FKIndex1` (`dewarId`),
  KEY `Container_FKIndexStatus` (`containerStatus`),
  KEY `Container_ibfk2` (`screenId`),
  KEY `Container_ibfk3` (`scheduleId`),
  KEY `Container_ibfk4` (`imagerId`),
  KEY `BLSession_ibfk_3` (`sessionId`),
  CONSTRAINT `BLSession_ibfk_3` FOREIGN KEY (`sessionId`) REFERENCES `BLSession` (`sessionId`),
  CONSTRAINT `Container_ibfk2` FOREIGN KEY (`screenId`) REFERENCES `Screen` (`screenId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Container_ibfk3` FOREIGN KEY (`scheduleId`) REFERENCES `Schedule` (`scheduleId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Container_ibfk4` FOREIGN KEY (`imagerId`) REFERENCES `Imager` (`imagerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Container_ibfk_1` FOREIGN KEY (`dewarId`) REFERENCES `Dewar` (`dewarId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34865 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Container`
--

LOCK TABLES `Container` WRITE;
/*!40000 ALTER TABLE `Container` DISABLE KEYS */;
INSERT INTO `Container` VALUES (1326,573,'Container-1-cm0001-1','Puck-16',16,'3','processing',NULL,'i03',NULL,NULL,'container-cm0001-1-0000001',NULL,NULL),(1329,573,'Container-2-cm0001-1','Puck-16',16,'4','processing',NULL,'i03',NULL,NULL,'container-cm0001-1-0000002',NULL,NULL),(1332,576,'Container-3-cm0001-1','Puck-16',16,'5','processing',NULL,'i03',NULL,NULL,'container-cm0001-1-0000003',NULL,NULL),(1335,579,'Container-4-cm0001-2','Puck-16',16,'6','processing',NULL,'i03',NULL,NULL,'container-cm0001-2-0001335',NULL,NULL),(1338,582,'Container-5-cm0001-3','Puck-16',16,'7','processing',NULL,'i03',NULL,NULL,'container-cm0001-3-0001338',NULL,NULL),(1341,573,'Manual',NULL,NULL,'9',NULL,NULL,'i03',NULL,NULL,NULL,NULL,NULL),(33049,8287,'cm14451-1_i03r-002','Puck',16,NULL,'at DLS',NULL,'i03',NULL,NULL,NULL,NULL,NULL),(34864,8572,'I03R-001','Puck',16,'29','processing','2016-02-24 12:13:05','i03',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Container` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ContainerInspection`
--

DROP TABLE IF EXISTS `ContainerInspection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContainerInspection` (
  `containerInspectionId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `containerId` int(11) unsigned NOT NULL,
  `inspectionTypeId` int(11) unsigned NOT NULL,
  `imagerId` int(11) unsigned DEFAULT NULL,
  `temperature` float DEFAULT NULL,
  `blTimeStamp` datetime DEFAULT NULL,
  `scheduleComponentid` int(11) unsigned DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `priority` smallint(6) DEFAULT NULL,
  `manual` tinyint(1) DEFAULT NULL,
  `scheduledTimeStamp` datetime DEFAULT NULL,
  PRIMARY KEY (`containerInspectionId`),
  KEY `ContainerInspection_idx1` (`containerId`),
  KEY `ContainerInspection_idx2` (`inspectionTypeId`),
  KEY `ContainerInspection_idx3` (`imagerId`),
  KEY `ContainerInspection_fk4` (`scheduleComponentid`),
  CONSTRAINT `ContainerInspection_fk1` FOREIGN KEY (`containerId`) REFERENCES `Container` (`containerId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ContainerInspection_fk2` FOREIGN KEY (`inspectionTypeId`) REFERENCES `InspectionType` (`inspectionTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ContainerInspection_fk3` FOREIGN KEY (`imagerId`) REFERENCES `Imager` (`imagerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ContainerInspection_fk4` FOREIGN KEY (`scheduleComponentid`) REFERENCES `ScheduleComponent` (`scheduleComponentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContainerInspection`
--

LOCK TABLES `ContainerInspection` WRITE;
/*!40000 ALTER TABLE `ContainerInspection` DISABLE KEYS */;
/*!40000 ALTER TABLE `ContainerInspection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Crystal`
--

DROP TABLE IF EXISTS `Crystal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Crystal` (
  `crystalId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `diffractionPlanId` int(10) unsigned DEFAULT NULL,
  `proteinId` int(10) unsigned NOT NULL DEFAULT '0',
  `crystalUUID` varchar(45) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `spaceGroup` varchar(20) DEFAULT NULL,
  `morphology` varchar(255) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `size_X` double DEFAULT NULL,
  `size_Y` double DEFAULT NULL,
  `size_Z` double DEFAULT NULL,
  `cell_a` double DEFAULT NULL,
  `cell_b` double DEFAULT NULL,
  `cell_c` double DEFAULT NULL,
  `cell_alpha` double DEFAULT NULL,
  `cell_beta` double DEFAULT NULL,
  `cell_gamma` double DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `pdbFileName` varchar(255) DEFAULT NULL COMMENT 'pdb file name',
  `pdbFilePath` varchar(1024) DEFAULT NULL COMMENT 'pdb file path',
  `recordTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation or last update date/time',
  PRIMARY KEY (`crystalId`),
  KEY `Crystal_FKIndex1` (`proteinId`),
  KEY `Crystal_FKIndex2` (`diffractionPlanId`),
  CONSTRAINT `Crystal_ibfk_1` FOREIGN KEY (`proteinId`) REFERENCES `Protein` (`proteinId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Crystal_ibfk_2` FOREIGN KEY (`diffractionPlanId`) REFERENCES `DiffractionPlan` (`diffractionPlanId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=333302 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Crystal`
--

LOCK TABLES `Crystal` WRITE;
/*!40000 ALTER TABLE `Crystal` DISABLE KEYS */;
INSERT INTO `Crystal` VALUES (3918,NULL,4380,NULL,'Crystal 01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-17 16:11:19'),(3921,NULL,4383,NULL,'Crystal 02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-17 16:11:19'),(3924,NULL,4386,NULL,'Crystal 03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-17 16:11:19'),(3927,NULL,4389,NULL,'Crystal 04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-17 16:11:19'),(3930,NULL,4392,NULL,'Crystal 05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-17 16:11:19'),(3933,NULL,4395,NULL,'Crystal 06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-17 16:11:19'),(3936,NULL,4398,NULL,'Crystal 07',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-17 16:11:19'),(3939,NULL,4401,NULL,'Crystal 08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-17 16:11:19'),(3942,NULL,4404,NULL,'Crystal 09',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-17 16:11:19'),(3945,NULL,4407,NULL,'Crystal 10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-17 16:11:19'),(3948,NULL,4407,NULL,'Crystal 11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-17 16:11:19'),(3951,NULL,4410,NULL,'Crystal 12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-17 16:11:19'),(3954,NULL,4410,NULL,'Crystal 13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-17 16:11:19'),(3957,NULL,4413,NULL,'Crystal 14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-17 16:11:19'),(3960,NULL,4413,NULL,'Crystal 15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-17 16:11:19'),(310037,NULL,121393,NULL,'crystal-4-cm14451-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-19 22:58:00'),(333301,NULL,123491,NULL,NULL,'P41212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-19 22:58:00');
/*!40000 ALTER TABLE `Crystal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Crystal_has_UUID`
--

DROP TABLE IF EXISTS `Crystal_has_UUID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Crystal_has_UUID` (
  `crystal_has_UUID_Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `crystalId` int(10) unsigned NOT NULL,
  `UUID` varchar(45) DEFAULT NULL,
  `imageURL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`crystal_has_UUID_Id`),
  KEY `Crystal_has_UUID_FKIndex1` (`crystalId`),
  KEY `Crystal_has_UUID_FKIndex2` (`UUID`),
  CONSTRAINT `ibfk_1` FOREIGN KEY (`crystalId`) REFERENCES `Crystal` (`crystalId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Crystal_has_UUID`
--

LOCK TABLES `Crystal_has_UUID` WRITE;
/*!40000 ALTER TABLE `Crystal_has_UUID` DISABLE KEYS */;
/*!40000 ALTER TABLE `Crystal_has_UUID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DHLTermsAccepted`
--

DROP TABLE IF EXISTS `DHLTermsAccepted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DHLTermsAccepted` (
  `dhlTermsAcceptedId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `proposalId` int(10) unsigned NOT NULL,
  `personId` int(10) unsigned NOT NULL,
  `shippingName` varchar(100) DEFAULT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`dhlTermsAcceptedId`),
  KEY `DHLTermsAccepted_FKIndex1` (`proposalId`),
  KEY `DHLTermsAccepted_FKIndex2` (`personId`),
  CONSTRAINT `DHLTermsAccepted_ibfk_1` FOREIGN KEY (`proposalId`) REFERENCES `Proposal` (`proposalId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DHLTermsAccepted_ibfk_2` FOREIGN KEY (`personId`) REFERENCES `Person` (`personId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Records acceptances of the DHL T and C';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DHLTermsAccepted`
--

LOCK TABLES `DHLTermsAccepted` WRITE;
/*!40000 ALTER TABLE `DHLTermsAccepted` DISABLE KEYS */;
/*!40000 ALTER TABLE `DHLTermsAccepted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DataAcquisition`
--

DROP TABLE IF EXISTS `DataAcquisition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DataAcquisition` (
  `dataAcquisitionId` int(10) NOT NULL AUTO_INCREMENT,
  `sampleCellId` int(10) NOT NULL,
  `framesCount` varchar(45) DEFAULT NULL,
  `energy` varchar(45) DEFAULT NULL,
  `waitTime` varchar(45) DEFAULT NULL,
  `detectorDistance` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dataAcquisitionId`),
  KEY `DataAcquisitionToCapillary` (`sampleCellId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DataAcquisition`
--

LOCK TABLES `DataAcquisition` WRITE;
/*!40000 ALTER TABLE `DataAcquisition` DISABLE KEYS */;
/*!40000 ALTER TABLE `DataAcquisition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DataCollection`
--

DROP TABLE IF EXISTS `DataCollection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DataCollection` (
  `dataCollectionId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key (auto-incremented)',
  `BLSAMPLEID` int(11) unsigned DEFAULT NULL,
  `SESSIONID` int(11) unsigned DEFAULT '0',
  `experimenttype` varchar(24) DEFAULT NULL,
  `dataCollectionNumber` int(10) unsigned DEFAULT NULL,
  `startTime` datetime DEFAULT NULL COMMENT 'Start time of the dataCollection',
  `endTime` datetime DEFAULT NULL COMMENT 'end time of the dataCollection',
  `runStatus` varchar(45) DEFAULT NULL,
  `axisStart` float DEFAULT NULL,
  `axisEnd` float DEFAULT NULL,
  `axisRange` float DEFAULT NULL,
  `overlap` float DEFAULT NULL,
  `numberOfImages` int(10) unsigned DEFAULT NULL,
  `startImageNumber` int(10) unsigned DEFAULT NULL,
  `numberOfPasses` int(10) unsigned DEFAULT NULL,
  `exposureTime` float DEFAULT NULL,
  `imageDirectory` varchar(255) DEFAULT NULL,
  `imagePrefix` varchar(45) DEFAULT NULL,
  `imageSuffix` varchar(45) DEFAULT NULL,
  `fileTemplate` varchar(255) DEFAULT NULL,
  `wavelength` float DEFAULT NULL,
  `resolution` float DEFAULT NULL,
  `detectorDistance` float DEFAULT NULL,
  `xBeam` float DEFAULT NULL,
  `yBeam` float DEFAULT NULL,
  `comments` varchar(1024) DEFAULT NULL,
  `printableForReport` tinyint(1) unsigned DEFAULT '1',
  `CRYSTALCLASS` varchar(20) DEFAULT NULL,
  `slitGapVertical` float DEFAULT NULL,
  `slitGapHorizontal` float DEFAULT NULL,
  `transmission` float DEFAULT NULL,
  `synchrotronMode` varchar(20) DEFAULT NULL,
  `xtalSnapshotFullPath1` varchar(255) DEFAULT NULL,
  `xtalSnapshotFullPath2` varchar(255) DEFAULT NULL,
  `xtalSnapshotFullPath3` varchar(255) DEFAULT NULL,
  `xtalSnapshotFullPath4` varchar(255) DEFAULT NULL,
  `rotationAxis` enum('Omega','Kappa','Phi') DEFAULT NULL,
  `phiStart` float DEFAULT NULL,
  `kappaStart` float DEFAULT NULL,
  `omegaStart` float DEFAULT NULL,
  `resolutionAtCorner` float DEFAULT NULL,
  `detector2Theta` float DEFAULT NULL,
  `DETECTORMODE` varchar(255) DEFAULT NULL,
  `undulatorGap1` float DEFAULT NULL,
  `undulatorGap2` float DEFAULT NULL,
  `undulatorGap3` float DEFAULT NULL,
  `beamSizeAtSampleX` float DEFAULT NULL,
  `beamSizeAtSampleY` float DEFAULT NULL,
  `centeringMethod` varchar(255) DEFAULT NULL,
  `averageTemperature` float DEFAULT NULL,
  `ACTUALSAMPLEBARCODE` varchar(45) DEFAULT NULL,
  `ACTUALSAMPLESLOTINCONTAINER` int(11) unsigned DEFAULT NULL,
  `ACTUALCONTAINERBARCODE` varchar(45) DEFAULT NULL,
  `ACTUALCONTAINERSLOTINSC` int(11) unsigned DEFAULT NULL,
  `actualCenteringPosition` varchar(255) DEFAULT NULL,
  `beamShape` varchar(45) DEFAULT NULL,
  `dataCollectionGroupId` int(11) NOT NULL COMMENT 'references DataCollectionGroup table',
  `POSITIONID` int(11) unsigned DEFAULT NULL,
  `detectorId` int(11) DEFAULT NULL COMMENT 'references Detector table',
  `FOCALSPOTSIZEATSAMPLEX` float DEFAULT NULL,
  `POLARISATION` float DEFAULT NULL,
  `FOCALSPOTSIZEATSAMPLEY` float DEFAULT NULL,
  `APERTUREID` int(11) unsigned DEFAULT NULL,
  `SCREENINGORIGID` int(11) unsigned DEFAULT NULL,
  `startPositionId` int(11) unsigned DEFAULT NULL,
  `endPositionId` int(11) unsigned DEFAULT NULL,
  `flux` double DEFAULT NULL,
  `strategySubWedgeOrigId` int(10) unsigned DEFAULT NULL COMMENT 'references ScreeningStrategySubWedge table',
  `blSubSampleId` int(11) unsigned DEFAULT NULL,
  `flux_end` double DEFAULT NULL COMMENT 'flux measured after the collect',
  `bestWilsonPlotPath` varchar(255) DEFAULT NULL,
  `processedDataFile` varchar(255) DEFAULT NULL,
  `datFullPath` varchar(255) DEFAULT NULL,
  `magnification` int(11) DEFAULT NULL COMMENT 'Unit: X',
  `totalAbsorbedDose` float DEFAULT NULL COMMENT 'Unit: e-/A^2 for EM',
  `binning` tinyint(1) DEFAULT '1' COMMENT '1 or 2. Number of pixels to process as 1. (Use mean value.)',
  `particleDiameter` float DEFAULT NULL COMMENT 'Unit: nm',
  `boxSize_CTF` float DEFAULT NULL COMMENT 'Unit: pixels',
  `minResolution` float DEFAULT NULL COMMENT 'Unit: A',
  `minDefocus` float DEFAULT NULL COMMENT 'Unit: A',
  `maxDefocus` float DEFAULT NULL COMMENT 'Unit: A',
  `defocusStepSize` float DEFAULT NULL COMMENT 'Unit: A',
  `amountAstigmatism` float DEFAULT NULL COMMENT 'Unit: A',
  `extractSize` float DEFAULT NULL COMMENT 'Unit: pixels',
  `bgRadius` float DEFAULT NULL COMMENT 'Unit: nm',
  `voltage` float DEFAULT NULL COMMENT 'Unit: kV',
  `objAperture` float DEFAULT NULL COMMENT 'Unit: um',
  `c1aperture` float DEFAULT NULL COMMENT 'Unit: um',
  `c2aperture` float DEFAULT NULL COMMENT 'Unit: um',
  `c3aperture` float DEFAULT NULL COMMENT 'Unit: um',
  `c1lens` float DEFAULT NULL COMMENT 'Unit: %',
  `c2lens` float DEFAULT NULL COMMENT 'Unit: %',
  `c3lens` float DEFAULT NULL COMMENT 'Unit: %',
  PRIMARY KEY (`dataCollectionId`),
  KEY `blSubSampleId` (`blSubSampleId`),
  KEY `DataCollection_FKIndex1` (`dataCollectionGroupId`),
  KEY `DataCollection_FKIndex2` (`strategySubWedgeOrigId`),
  KEY `DataCollection_FKIndex3` (`detectorId`),
  KEY `DataCollection_FKIndexDCNumber` (`dataCollectionNumber`),
  KEY `DataCollection_FKIndexImageDirectory` (`imageDirectory`),
  KEY `DataCollection_FKIndexImagePrefix` (`imagePrefix`),
  KEY `DataCollection_FKIndexStartTime` (`startTime`),
  KEY `endPositionId` (`endPositionId`),
  KEY `startPositionId` (`startPositionId`),
  KEY `DataCollection_FKIndex0` (`BLSAMPLEID`),
  KEY `DataCollection_FKIndex00` (`SESSIONID`),
  CONSTRAINT `DataCollection_ibfk_1` FOREIGN KEY (`strategySubWedgeOrigId`) REFERENCES `ScreeningStrategySubWedge` (`screeningStrategySubWedgeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DataCollection_ibfk_2` FOREIGN KEY (`detectorId`) REFERENCES `Detector` (`detectorId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DataCollection_ibfk_3` FOREIGN KEY (`dataCollectionGroupId`) REFERENCES `DataCollectionGroup` (`dataCollectionGroupId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DataCollection_ibfk_6` FOREIGN KEY (`startPositionId`) REFERENCES `MotorPosition` (`motorPositionId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DataCollection_ibfk_7` FOREIGN KEY (`endPositionId`) REFERENCES `MotorPosition` (`motorPositionId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DataCollection_ibfk_8` FOREIGN KEY (`blSubSampleId`) REFERENCES `BLSubSample` (`blSubSampleId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1066787 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DataCollection`
--

LOCK TABLES `DataCollection` WRITE;
/*!40000 ALTER TABLE `DataCollection` DISABLE KEYS */;
INSERT INTO `DataCollection` VALUES (993677,374695,55167,NULL,1,'2016-01-14 12:40:34','2016-01-14 12:41:54','DataCollection Successful',45,0.1,0.1,0,3600,1,1,0.02,'/dls/i03/data/2016/cm14451-1/20160114/tlys_jan_4/','tlys_jan_4','cbf','tlys_jan_4_1_####.cbf',1.28255,1.6,193.087,215.62,208.978,'(-402,345,142) EDNAStrategy4: subWedge:1Aperture: Medium',1,NULL,0.059918,0.099937,40.1936,'User','/dls/i03/data/2016/cm14451-1/jpegs/20160114/tlys_jan_4/tlys_jan_4_1_1_315.0.png','/dls/i03/data/2016/cm14451-1/jpegs/20160114/tlys_jan_4/tlys_jan_4_1_1_225.0.png','/dls/i03/data/2016/cm14451-1/jpegs/20160114/tlys_jan_4/tlys_jan_4_1_1_135.0.png','/dls/i03/data/2016/cm14451-1/jpegs/20160114/tlys_jan_4/tlys_jan_4_1_1_45.0.png','Omega',NULL,NULL,45,NULL,NULL,NULL,5.685,NULL,NULL,0.05,0.02,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,988855,595236,NULL,80,NULL,20,6,NULL,NULL,NULL,833107367454.3083,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1002287,NULL,55167,NULL,2,'2016-01-22 11:25:18','2016-01-22 11:28:23','DataCollection Successful',0,0.1,0.1,0,7200,1,1,0.025,'/dls/i03/data/2016/cm14451-1/20160122/gw/ins2/001/','ins2','cbf','ins2_2_####.cbf',1.2,1.41777,175,215.618,209.102,'(-307,322,-184) Aperture: Large',1,NULL,0.059918,0.099937,0.999423,'User','/dls/i03/data/2016/cm14451-1/jpegs/20160122/gw/ins2/001/ins2_2_1_270.0.png','/dls/i03/data/2016/cm14451-1/jpegs/20160122/gw/ins2/001/ins2_2_1_180.0.png','/dls/i03/data/2016/cm14451-1/jpegs/20160122/gw/ins2/001/ins2_2_1_90.0.png','/dls/i03/data/2016/cm14451-1/jpegs/20160122/gw/ins2/001/ins2_2_1_0.0.png','Omega',NULL,NULL,0,NULL,NULL,NULL,6.1213,NULL,NULL,0.08,0.02,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,996311,602072,NULL,80,NULL,20,3752,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1052494,NULL,55168,NULL,1,'2016-04-13 12:18:12','2016-04-13 12:18:50','DataCollection Successful',0,0.4,0.4,-89.6,2,1,1,0.01,'/dls/i03/data/2016/cm14451-2/20160413/test_xtal/','xtal1','cbf','xtal1_1_####.cbf',0.976254,1.24362,200,214.33,208.71,'(-703,-47,-74) Aperture: Large',1,NULL,0.059918,0.099937,100,'User','/dls/i03/data/2016/cm14451-2/jpegs/20160413/test_xtal/xtal1_1_1_90.0.png','/dls/i03/data/2016/cm14451-2/jpegs/20160413/test_xtal/xtal1_1_1_0.0.png',NULL,NULL,'Omega',NULL,NULL,0,NULL,NULL,NULL,5.30095,NULL,NULL,0.08,0.02,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1040398,647536,NULL,80,NULL,20,3752,NULL,NULL,NULL,1959830505829.428,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1052503,NULL,55168,NULL,3,'2016-04-13 12:21:26','2016-04-13 12:21:54','DataCollection Successful',93,0.3,0.3,-44.7,3,1,1,0.01,'/dls/i03/data/2016/cm14451-2/20160413/test_xtal/','xtal1','cbf','xtal1_3_####.cbf',0.976253,1.5,266.693,214.372,208.299,'(-703,-47,-74) Aperture: Large',1,NULL,0.059918,0.099937,100,'User','/dls/i03/data/2016/cm14451-2/jpegs/20160413/test_xtal/xtal1_3_1_183.0.png','/dls/i03/data/2016/cm14451-2/jpegs/20160413/test_xtal/xtal1_3_1_93.0.png',NULL,NULL,'Omega',NULL,NULL,93,NULL,NULL,NULL,5.30095,NULL,NULL,0.08,0.02,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1040407,647545,NULL,80,NULL,20,3752,NULL,NULL,NULL,1972385107622.2878,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1066786,398810,55168,NULL,2,'2016-04-18 11:04:44','2016-04-18 11:04:57','DataCollection Successful',0,0.5,0.5,-44.5,3,1,1,0.1,'/dls/i03/data/2016/cm14451-2/gw/20160418/thau/edna_test/','thau','cbf','thau_2_####.cbf',0.976253,1.5,266.693,214.372,208.299,'(-345,-241,-185) Aperture: Large',1,NULL,0.059918,0.099937,5.00016,'User','/dls/i03/data/2016/cm14451-2/jpegs/gw/20160418/thau/edna_test/thau_2_1_90.0.png','/dls/i03/data/2016/cm14451-2/jpegs/gw/20160418/thau/edna_test/thau_2_1_0.0.png',NULL,NULL,'Omega',NULL,NULL,0,NULL,NULL,NULL,5.301,NULL,NULL,0.08,0.02,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1054243,661459,NULL,80,NULL,20,3752,NULL,NULL,NULL,57087013071.909134,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `DataCollection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DataCollectionComment`
--

DROP TABLE IF EXISTS `DataCollectionComment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DataCollectionComment` (
  `dataCollectionCommentId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dataCollectionId` int(11) unsigned NOT NULL,
  `personId` int(10) unsigned NOT NULL,
  `comments` varchar(4000) DEFAULT NULL,
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modTime` date DEFAULT NULL,
  PRIMARY KEY (`dataCollectionCommentId`),
  KEY `dataCollectionComment_fk1` (`dataCollectionId`),
  KEY `dataCollectionComment_fk2` (`personId`),
  CONSTRAINT `dataCollectionComment_fk1` FOREIGN KEY (`dataCollectionId`) REFERENCES `DataCollection` (`dataCollectionId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dataCollectionComment_fk2` FOREIGN KEY (`personId`) REFERENCES `Person` (`personId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DataCollectionComment`
--

LOCK TABLES `DataCollectionComment` WRITE;
/*!40000 ALTER TABLE `DataCollectionComment` DISABLE KEYS */;
/*!40000 ALTER TABLE `DataCollectionComment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DataCollectionGroup`
--

DROP TABLE IF EXISTS `DataCollectionGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DataCollectionGroup` (
  `dataCollectionGroupId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key (auto-incremented)',
  `sessionId` int(10) unsigned NOT NULL COMMENT 'references Session table',
  `comments` varchar(1024) DEFAULT NULL COMMENT 'comments',
  `blSampleId` int(10) unsigned DEFAULT NULL COMMENT 'references BLSample table',
  `experimentType` enum('SAD','SAD - Inverse Beam','OSC','Collect - Multiwedge','MAD','Helical','Multi-positional','Mesh','Burn','MAD - Inverse Beam','Characterization','Dehydration') DEFAULT NULL COMMENT 'Experiment type flag',
  `startTime` datetime DEFAULT NULL COMMENT 'Start time of the dataCollectionGroup',
  `endTime` datetime DEFAULT NULL COMMENT 'end time of the dataCollectionGroup',
  `crystalClass` varchar(20) DEFAULT NULL COMMENT 'Crystal Class for industrials users',
  `detectorMode` varchar(255) DEFAULT NULL COMMENT 'Detector mode',
  `actualSampleBarcode` varchar(45) DEFAULT NULL COMMENT 'Actual sample barcode',
  `actualSampleSlotInContainer` int(10) unsigned DEFAULT NULL COMMENT 'Actual sample slot number in container',
  `actualContainerBarcode` varchar(45) DEFAULT NULL COMMENT 'Actual container barcode',
  `actualContainerSlotInSC` int(10) unsigned DEFAULT NULL COMMENT 'Actual container slot number in sample changer',
  `workflowId` int(11) unsigned DEFAULT NULL,
  `xtalSnapshotFullPath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dataCollectionGroupId`),
  KEY `DataCollectionGroup_FKIndex1` (`blSampleId`),
  KEY `DataCollectionGroup_FKIndex2` (`sessionId`),
  KEY `workflowId` (`workflowId`),
  CONSTRAINT `DataCollectionGroup_ibfk_1` FOREIGN KEY (`blSampleId`) REFERENCES `BLSample` (`blSampleId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DataCollectionGroup_ibfk_2` FOREIGN KEY (`sessionId`) REFERENCES `BLSession` (`sessionId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DataCollectionGroup_ibfk_3` FOREIGN KEY (`workflowId`) REFERENCES `Workflow` (`workflowId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1054244 DEFAULT CHARSET=latin1 COMMENT='a dataCollectionGroup is a group of dataCollection for a spe';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DataCollectionGroup`
--

LOCK TABLES `DataCollectionGroup` WRITE;
/*!40000 ALTER TABLE `DataCollectionGroup` DISABLE KEYS */;
INSERT INTO `DataCollectionGroup` VALUES (988855,55167,NULL,374695,'SAD',NULL,NULL,NULL,'Ext. Trigger','HA00AU3712',NULL,NULL,NULL,NULL,NULL),(996311,55167,NULL,NULL,'SAD',NULL,NULL,NULL,'Ext. Trigger',NULL,NULL,NULL,NULL,NULL,NULL),(1040398,55168,NULL,NULL,'SAD',NULL,NULL,NULL,'Ext. Trigger',NULL,NULL,NULL,NULL,NULL,NULL),(1040407,55168,NULL,NULL,'SAD',NULL,NULL,NULL,'Ext. Trigger',NULL,NULL,NULL,NULL,NULL,NULL),(1054243,55168,NULL,398810,'SAD',NULL,NULL,NULL,'Ext. Trigger','CA00AG9993',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `DataCollectionGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DataReductionStatus`
--

DROP TABLE IF EXISTS `DataReductionStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DataReductionStatus` (
  `dataReductionStatusId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dataCollectionId` int(11) unsigned NOT NULL,
  `status` varchar(15) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dataReductionStatusId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DataReductionStatus`
--

LOCK TABLES `DataReductionStatus` WRITE;
/*!40000 ALTER TABLE `DataReductionStatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `DataReductionStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DatamatrixInSampleChanger`
--

DROP TABLE IF EXISTS `DatamatrixInSampleChanger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DatamatrixInSampleChanger` (
  `datamatrixInSampleChangerId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `proposalId` int(10) unsigned NOT NULL DEFAULT '0',
  `beamLineName` varchar(45) DEFAULT NULL,
  `datamatrixCode` varchar(45) DEFAULT NULL,
  `locationInContainer` int(11) DEFAULT NULL,
  `containerLocationInSC` int(11) DEFAULT NULL,
  `containerDatamatrixCode` varchar(45) DEFAULT NULL,
  `bltimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`datamatrixInSampleChangerId`),
  KEY `DatamatrixInSampleChanger_FKIndex1` (`proposalId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DatamatrixInSampleChanger`
--

LOCK TABLES `DatamatrixInSampleChanger` WRITE;
/*!40000 ALTER TABLE `DatamatrixInSampleChanger` DISABLE KEYS */;
/*!40000 ALTER TABLE `DatamatrixInSampleChanger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Detector`
--

DROP TABLE IF EXISTS `Detector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Detector` (
  `detectorId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key (auto-incremented)',
  `detectorType` varchar(255) DEFAULT NULL,
  `detectorManufacturer` varchar(255) DEFAULT NULL,
  `detectorModel` varchar(255) DEFAULT NULL,
  `detectorPixelSizeHorizontal` float DEFAULT NULL,
  `detectorPixelSizeVertical` float DEFAULT NULL,
  `DETECTORMAXRESOLUTION` float DEFAULT NULL,
  `DETECTORMINRESOLUTION` float DEFAULT NULL,
  `detectorSerialNumber` float DEFAULT NULL,
  `detectorDistanceMin` double DEFAULT NULL,
  `detectorDistanceMax` double DEFAULT NULL,
  `trustedPixelValueRangeLower` double DEFAULT NULL,
  `trustedPixelValueRangeUpper` double DEFAULT NULL,
  `sensorThickness` float DEFAULT NULL,
  `overload` float DEFAULT NULL,
  `XGeoCorr` varchar(255) DEFAULT NULL,
  `YGeoCorr` varchar(255) DEFAULT NULL,
  `detectorMode` varchar(255) DEFAULT NULL,
  `CS` float DEFAULT NULL COMMENT 'Unit: mm',
  `detectorPixelSize` float DEFAULT NULL COMMENT 'Unit: um',
  PRIMARY KEY (`detectorId`),
  KEY `Detector_FKIndex1` (`detectorType`,`detectorManufacturer`,`detectorModel`,`detectorPixelSizeHorizontal`,`detectorPixelSizeVertical`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Detector table is linked to a dataCollection';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Detector`
--

LOCK TABLES `Detector` WRITE;
/*!40000 ALTER TABLE `Detector` DISABLE KEYS */;
/*!40000 ALTER TABLE `Detector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dewar`
--

DROP TABLE IF EXISTS `Dewar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dewar` (
  `dewarId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shippingId` int(10) unsigned DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  `comments` tinytext,
  `storageLocation` varchar(45) DEFAULT NULL,
  `dewarStatus` varchar(45) DEFAULT NULL,
  `bltimeStamp` datetime DEFAULT NULL,
  `isStorageDewar` tinyint(1) DEFAULT '0',
  `barCode` varchar(45) DEFAULT NULL,
  `firstExperimentId` int(10) unsigned DEFAULT NULL,
  `customsValue` int(11) unsigned DEFAULT NULL,
  `transportValue` int(11) unsigned DEFAULT NULL,
  `trackingNumberToSynchrotron` varchar(30) DEFAULT NULL,
  `trackingNumberFromSynchrotron` varchar(30) DEFAULT NULL,
  `type` enum('Dewar','Toolbox') NOT NULL DEFAULT 'Dewar',
  `FACILITYCODE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`dewarId`),
  UNIQUE KEY `barCode` (`barCode`),
  KEY `Dewar_FKIndex1` (`shippingId`),
  KEY `Dewar_FKIndex2` (`firstExperimentId`),
  KEY `Dewar_FKIndexCode` (`code`),
  KEY `Dewar_FKIndexStatus` (`dewarStatus`),
  CONSTRAINT `Dewar_ibfk_1` FOREIGN KEY (`shippingId`) REFERENCES `Shipping` (`shippingId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Dewar_ibfk_2` FOREIGN KEY (`firstExperimentId`) REFERENCES `BLSession` (`sessionId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8573 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dewar`
--

LOCK TABLES `Dewar` WRITE;
/*!40000 ALTER TABLE `Dewar` DISABLE KEYS */;
INSERT INTO `Dewar` VALUES (573,474,'Dewar-1-cm0001-1',NULL,NULL,'processing',NULL,0,'dewar-cm0001-1-0000001',NULL,NULL,NULL,NULL,NULL,'Dewar',NULL),(576,474,'Dewar-2-cm0001-1',NULL,NULL,'at DLS',NULL,0,'dewar-cm0001-1-0000002',NULL,NULL,NULL,NULL,NULL,'Dewar',NULL),(579,477,'Dewar-3-cm0001-2',NULL,NULL,'processing',NULL,0,'dewar-cm0001-2-0000477',NULL,NULL,NULL,NULL,NULL,'Dewar',NULL),(582,480,'Dewar-4-cm0001-3',NULL,NULL,'processing',NULL,0,'dewar-cm0001-3-0000480',NULL,NULL,NULL,NULL,NULL,'Dewar',NULL),(8287,6988,'Default Dewar:cm14451-1',NULL,NULL,'processing',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'Dewar',NULL),(8572,7227,'cm14451-2_Dewar1',NULL,NULL,'processing','2016-02-10 13:03:07',0,NULL,NULL,NULL,NULL,NULL,NULL,'Dewar',NULL);
/*!40000 ALTER TABLE `Dewar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DewarLocation`
--

DROP TABLE IF EXISTS `DewarLocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DewarLocation` (
  `eventId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dewarNumber` varchar(128) NOT NULL COMMENT 'Dewar number',
  `userId` varchar(128) DEFAULT NULL COMMENT 'User who locates the dewar',
  `dateTime` datetime DEFAULT NULL COMMENT 'Date and time of locatization',
  `locationName` varchar(128) DEFAULT NULL COMMENT 'Location of the dewar',
  `courierName` varchar(128) DEFAULT NULL COMMENT 'Carrier name who''s shipping back the dewar',
  `courierTrackingNumber` varchar(128) DEFAULT NULL COMMENT 'Tracking number of the shippment',
  PRIMARY KEY (`eventId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ISPyB Dewar location table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DewarLocation`
--

LOCK TABLES `DewarLocation` WRITE;
/*!40000 ALTER TABLE `DewarLocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `DewarLocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DewarLocationList`
--

DROP TABLE IF EXISTS `DewarLocationList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DewarLocationList` (
  `locationId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locationName` varchar(128) NOT NULL DEFAULT '' COMMENT 'Location',
  PRIMARY KEY (`locationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='List of locations for dewars';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DewarLocationList`
--

LOCK TABLES `DewarLocationList` WRITE;
/*!40000 ALTER TABLE `DewarLocationList` DISABLE KEYS */;
/*!40000 ALTER TABLE `DewarLocationList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DewarRegistry`
--

DROP TABLE IF EXISTS `DewarRegistry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DewarRegistry` (
  `facilityCode` varchar(20) NOT NULL,
  `proposalId` int(11) unsigned NOT NULL,
  `labContactId` int(11) unsigned NOT NULL,
  `purchaseDate` datetime DEFAULT NULL,
  `bltimestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`facilityCode`),
  KEY `DewarRegistry_ibfk_1` (`proposalId`),
  KEY `DewarRegistry_ibfk_2` (`labContactId`),
  CONSTRAINT `DewarRegistry_ibfk_1` FOREIGN KEY (`proposalId`) REFERENCES `Proposal` (`proposalId`) ON DELETE CASCADE,
  CONSTRAINT `DewarRegistry_ibfk_2` FOREIGN KEY (`labContactId`) REFERENCES `LabContact` (`labContactId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DewarRegistry`
--

LOCK TABLES `DewarRegistry` WRITE;
/*!40000 ALTER TABLE `DewarRegistry` DISABLE KEYS */;
/*!40000 ALTER TABLE `DewarRegistry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DewarReport`
--

DROP TABLE IF EXISTS `DewarReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DewarReport` (
  `dewarReportId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `facilityCode` varchar(20) NOT NULL,
  `report` text,
  `attachment` varchar(255) DEFAULT NULL,
  `bltimestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`dewarReportId`),
  KEY `DewarReportIdx1` (`facilityCode`),
  CONSTRAINT `DewarReport_ibfk_1` FOREIGN KEY (`facilityCode`) REFERENCES `DewarRegistry` (`facilityCode`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DewarReport`
--

LOCK TABLES `DewarReport` WRITE;
/*!40000 ALTER TABLE `DewarReport` DISABLE KEYS */;
/*!40000 ALTER TABLE `DewarReport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DewarTransportHistory`
--

DROP TABLE IF EXISTS `DewarTransportHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DewarTransportHistory` (
  `DewarTransportHistoryId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dewarId` int(10) unsigned DEFAULT NULL,
  `dewarStatus` varchar(45) NOT NULL,
  `storageLocation` varchar(45) NOT NULL,
  `arrivalDate` datetime NOT NULL,
  PRIMARY KEY (`DewarTransportHistoryId`),
  KEY `DewarTransportHistory_FKIndex1` (`dewarId`),
  CONSTRAINT `DewarTransportHistory_ibfk_1` FOREIGN KEY (`dewarId`) REFERENCES `Dewar` (`dewarId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DewarTransportHistory`
--

LOCK TABLES `DewarTransportHistory` WRITE;
/*!40000 ALTER TABLE `DewarTransportHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `DewarTransportHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DiffractionPlan`
--

DROP TABLE IF EXISTS `DiffractionPlan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DiffractionPlan` (
  `diffractionPlanId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `xmlDocumentId` int(10) unsigned DEFAULT NULL,
  `experimentKind` enum('MAD','SAD','Fixed','Ligand binding','Refinement','OSC','MAD - Inverse Beam','SAD - Inverse Beam','Default','MXPressE','MXPressO','MXPressL','MXScore') DEFAULT 'Default',
  `observedResolution` float DEFAULT NULL,
  `minimalResolution` float DEFAULT NULL,
  `exposureTime` float DEFAULT NULL,
  `oscillationRange` float DEFAULT NULL,
  `maximalResolution` float DEFAULT NULL,
  `screeningResolution` float DEFAULT NULL,
  `radiationSensitivity` float DEFAULT NULL,
  `anomalousScatterer` varchar(255) DEFAULT NULL,
  `preferredBeamSizeX` float DEFAULT NULL,
  `preferredBeamSizeY` float DEFAULT NULL,
  `comments` varchar(1024) DEFAULT NULL,
  `DIFFRACTIONPLANUUID` varchar(1000) DEFAULT NULL,
  `aimedCompleteness` double DEFAULT NULL,
  `aimedIOverSigmaAtHighestRes` double DEFAULT NULL,
  `aimedMultiplicity` double DEFAULT NULL,
  `aimedResolution` double DEFAULT NULL,
  `anomalousData` tinyint(1) DEFAULT '0',
  `complexity` varchar(45) DEFAULT NULL,
  `estimateRadiationDamage` tinyint(1) DEFAULT '0',
  `forcedSpaceGroup` varchar(45) DEFAULT NULL,
  `requiredCompleteness` double DEFAULT NULL,
  `requiredMultiplicity` double DEFAULT NULL,
  `requiredResolution` double DEFAULT NULL,
  `strategyOption` varchar(45) DEFAULT NULL,
  `kappaStrategyOption` varchar(45) DEFAULT NULL,
  `numberOfPositions` int(11) DEFAULT NULL,
  `minDimAccrossSpindleAxis` double DEFAULT NULL COMMENT 'minimum dimension accross the spindle axis',
  `maxDimAccrossSpindleAxis` double DEFAULT NULL COMMENT 'maximum dimension accross the spindle axis',
  `radiationSensitivityBeta` double DEFAULT NULL,
  `radiationSensitivityGamma` double DEFAULT NULL,
  `recordTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation or last update date/time',
  PRIMARY KEY (`diffractionPlanId`),
  KEY `DiffractionPlan_FKIndex2` (`xmlDocumentId`),
  CONSTRAINT `DiffractionPlan_ibfk_1` FOREIGN KEY (`xmlDocumentId`) REFERENCES `XmlDocument` (`xmlDocumentId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=197785 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DiffractionPlan`
--

LOCK TABLES `DiffractionPlan` WRITE;
/*!40000 ALTER TABLE `DiffractionPlan` DISABLE KEYS */;
INSERT INTO `DiffractionPlan` VALUES (197784,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-20 23:50:27');
/*!40000 ALTER TABLE `DiffractionPlan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMMicroscope`
--

DROP TABLE IF EXISTS `EMMicroscope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMMicroscope` (
  `emMicroscopeId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `instrumentName` varchar(100) NOT NULL,
  `voltage` float DEFAULT NULL,
  `CS` float DEFAULT NULL,
  `detectorPixelSize` float DEFAULT NULL,
  `C2aperture` float DEFAULT NULL,
  `ObjAperture` float DEFAULT NULL,
  `C2lens` float DEFAULT NULL,
  PRIMARY KEY (`emMicroscopeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMMicroscope`
--

LOCK TABLES `EMMicroscope` WRITE;
/*!40000 ALTER TABLE `EMMicroscope` DISABLE KEYS */;
/*!40000 ALTER TABLE `EMMicroscope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EnergyScan`
--

DROP TABLE IF EXISTS `EnergyScan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EnergyScan` (
  `energyScanId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sessionId` int(10) unsigned NOT NULL,
  `fluorescenceDetector` varchar(255) DEFAULT NULL,
  `scanFileFullPath` varchar(255) DEFAULT NULL,
  `jpegChoochFileFullPath` varchar(255) DEFAULT NULL,
  `element` varchar(45) DEFAULT NULL,
  `startEnergy` float DEFAULT NULL,
  `endEnergy` float DEFAULT NULL,
  `transmissionFactor` float DEFAULT NULL,
  `exposureTime` float DEFAULT NULL,
  `synchrotronCurrent` float DEFAULT NULL,
  `temperature` float DEFAULT NULL,
  `peakEnergy` float DEFAULT NULL,
  `peakFPrime` float DEFAULT NULL,
  `peakFDoublePrime` float DEFAULT NULL,
  `inflectionEnergy` float DEFAULT NULL,
  `inflectionFPrime` float DEFAULT NULL,
  `inflectionFDoublePrime` float DEFAULT NULL,
  `xrayDose` float DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `edgeEnergy` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `beamSizeVertical` float DEFAULT NULL,
  `beamSizeHorizontal` float DEFAULT NULL,
  `choochFileFullPath` varchar(255) DEFAULT NULL,
  `crystalClass` varchar(20) DEFAULT NULL,
  `comments` varchar(1024) DEFAULT NULL,
  `flux` double DEFAULT NULL COMMENT 'flux measured before the energyScan',
  `flux_end` double DEFAULT NULL COMMENT 'flux measured after the energyScan',
  PRIMARY KEY (`energyScanId`),
  KEY `EnergyScan_FKIndex2` (`sessionId`),
  CONSTRAINT `ES_ibfk_1` FOREIGN KEY (`sessionId`) REFERENCES `BLSession` (`sessionId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EnergyScan`
--

LOCK TABLES `EnergyScan` WRITE;
/*!40000 ALTER TABLE `EnergyScan` DISABLE KEYS */;
/*!40000 ALTER TABLE `EnergyScan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Experiment`
--

DROP TABLE IF EXISTS `Experiment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Experiment` (
  `experimentId` int(11) NOT NULL AUTO_INCREMENT,
  `proposalId` int(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `comments` varchar(512) DEFAULT NULL,
  `experimentType` varchar(128) DEFAULT NULL,
  `sourceFilePath` varchar(256) DEFAULT NULL,
  `dataAcquisitionFilePath` varchar(256) DEFAULT NULL COMMENT 'The file path pointing to the data acquisition. Eventually it may be a compressed file with all the files or just the folder',
  `status` varchar(45) DEFAULT NULL,
  `sessionId` int(10) DEFAULT NULL,
  PRIMARY KEY (`experimentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Experiment`
--

LOCK TABLES `Experiment` WRITE;
/*!40000 ALTER TABLE `Experiment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Experiment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ExperimentKindDetails`
--

DROP TABLE IF EXISTS `ExperimentKindDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExperimentKindDetails` (
  `experimentKindId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `diffractionPlanId` int(10) unsigned NOT NULL,
  `exposureIndex` int(10) unsigned DEFAULT NULL,
  `dataCollectionType` varchar(45) DEFAULT NULL,
  `dataCollectionKind` varchar(45) DEFAULT NULL,
  `wedgeValue` float DEFAULT NULL,
  PRIMARY KEY (`experimentKindId`),
  KEY `ExperimentKindDetails_FKIndex1` (`diffractionPlanId`),
  CONSTRAINT `EKD_ibfk_1` FOREIGN KEY (`diffractionPlanId`) REFERENCES `DiffractionPlan` (`diffractionPlanId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExperimentKindDetails`
--

LOCK TABLES `ExperimentKindDetails` WRITE;
/*!40000 ALTER TABLE `ExperimentKindDetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `ExperimentKindDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Frame`
--

DROP TABLE IF EXISTS `Frame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Frame` (
  `frameId` int(10) NOT NULL AUTO_INCREMENT,
  `FRAMESETID` int(11) unsigned DEFAULT NULL,
  `filePath` varchar(255) DEFAULT NULL,
  `comments` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`frameId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Frame`
--

LOCK TABLES `Frame` WRITE;
/*!40000 ALTER TABLE `Frame` DISABLE KEYS */;
/*!40000 ALTER TABLE `Frame` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FrameList`
--

DROP TABLE IF EXISTS `FrameList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FrameList` (
  `frameListId` int(10) NOT NULL AUTO_INCREMENT,
  `comments` int(10) DEFAULT NULL,
  PRIMARY KEY (`frameListId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FrameList`
--

LOCK TABLES `FrameList` WRITE;
/*!40000 ALTER TABLE `FrameList` DISABLE KEYS */;
/*!40000 ALTER TABLE `FrameList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FrameSet`
--

DROP TABLE IF EXISTS `FrameSet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FrameSet` (
  `frameSetId` int(10) NOT NULL AUTO_INCREMENT,
  `runId` int(10) NOT NULL,
  `FILEPATH` varchar(255) DEFAULT NULL,
  `INTERNALPATH` varchar(255) DEFAULT NULL,
  `frameListId` int(10) DEFAULT NULL,
  `detectorId` int(10) DEFAULT NULL,
  `detectorDistance` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`frameSetId`),
  KEY `FrameSetToFrameList` (`frameListId`),
  KEY `FramesetToRun` (`runId`),
  CONSTRAINT `FrameSetToFrameList` FOREIGN KEY (`frameListId`) REFERENCES `FrameList` (`frameListId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FramesetToRun` FOREIGN KEY (`runId`) REFERENCES `Run` (`runId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FrameSet`
--

LOCK TABLES `FrameSet` WRITE;
/*!40000 ALTER TABLE `FrameSet` DISABLE KEYS */;
/*!40000 ALTER TABLE `FrameSet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FrameToList`
--

DROP TABLE IF EXISTS `FrameToList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FrameToList` (
  `frameToListId` int(10) NOT NULL AUTO_INCREMENT,
  `frameListId` int(10) NOT NULL,
  `frameId` int(10) NOT NULL,
  PRIMARY KEY (`frameToListId`),
  KEY `FrameToLisToFrameList` (`frameListId`),
  KEY `FrameToListToFrame` (`frameId`),
  CONSTRAINT `FrameToLisToFrameList` FOREIGN KEY (`frameListId`) REFERENCES `FrameList` (`frameListId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FrameToListToFrame` FOREIGN KEY (`frameId`) REFERENCES `Frame` (`frameId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FrameToList`
--

LOCK TABLES `FrameToList` WRITE;
/*!40000 ALTER TABLE `FrameToList` DISABLE KEYS */;
/*!40000 ALTER TABLE `FrameToList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GeometryClassname`
--

DROP TABLE IF EXISTS `GeometryClassname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GeometryClassname` (
  `geometryClassnameId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `geometryClassname` varchar(45) DEFAULT NULL,
  `geometryOrder` int(2) NOT NULL,
  PRIMARY KEY (`geometryClassnameId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GeometryClassname`
--

LOCK TABLES `GeometryClassname` WRITE;
/*!40000 ALTER TABLE `GeometryClassname` DISABLE KEYS */;
/*!40000 ALTER TABLE `GeometryClassname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GridInfo`
--

DROP TABLE IF EXISTS `GridInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GridInfo` (
  `gridInfoId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key (auto-incremented)',
  `xOffset` double DEFAULT NULL,
  `yOffset` double DEFAULT NULL,
  `dx_mm` double DEFAULT NULL,
  `dy_mm` double DEFAULT NULL,
  `steps_x` double DEFAULT NULL,
  `steps_y` double DEFAULT NULL,
  `meshAngle` double DEFAULT NULL,
  `recordTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation or last update date/time',
  `workflowMeshId` int(11) unsigned NOT NULL,
  `orientation` enum('vertical','horizontal') DEFAULT 'horizontal',
  `dataCollectionGroupId` int(11) DEFAULT NULL,
  `pixelspermicronX` float DEFAULT NULL,
  `pixelspermicronY` float DEFAULT NULL,
  `snapshot_offsetxpixel` float DEFAULT NULL,
  `snapshot_offsetypixel` float DEFAULT NULL,
  PRIMARY KEY (`gridInfoId`),
  KEY `workflowMeshId` (`workflowMeshId`),
  CONSTRAINT `GridInfo_ibfk_1` FOREIGN KEY (`workflowMeshId`) REFERENCES `WorkflowMesh` (`workflowMeshId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GridInfo`
--

LOCK TABLES `GridInfo` WRITE;
/*!40000 ALTER TABLE `GridInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `GridInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Image`
--

DROP TABLE IF EXISTS `Image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Image` (
  `imageId` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `dataCollectionId` int(11) unsigned NOT NULL DEFAULT '0',
  `imageNumber` int(10) unsigned DEFAULT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `fileLocation` varchar(255) DEFAULT NULL,
  `measuredIntensity` float DEFAULT NULL,
  `jpegFileFullPath` varchar(255) DEFAULT NULL,
  `jpegThumbnailFileFullPath` varchar(255) DEFAULT NULL,
  `temperature` float DEFAULT NULL,
  `cumulativeIntensity` float DEFAULT NULL,
  `synchrotronCurrent` float DEFAULT NULL,
  `comments` varchar(1024) DEFAULT NULL,
  `machineMessage` varchar(1024) DEFAULT NULL,
  `BLTIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `motorPositionId` int(11) unsigned DEFAULT NULL,
  `recordTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation or last update date/time',
  PRIMARY KEY (`imageId`),
  KEY `Image_FKIndex1` (`dataCollectionId`),
  KEY `Image_FKIndex2` (`imageNumber`),
  KEY `Image_Index3` (`fileLocation`,`fileName`),
  KEY `motorPositionId` (`motorPositionId`),
  CONSTRAINT `Image_ibfk_1` FOREIGN KEY (`dataCollectionId`) REFERENCES `DataCollection` (`dataCollectionId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Image_ibfk_2` FOREIGN KEY (`motorPositionId`) REFERENCES `MotorPosition` (`motorPositionId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=284718119 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Image`
--

LOCK TABLES `Image` WRITE;
/*!40000 ALTER TABLE `Image` DISABLE KEYS */;
INSERT INTO `Image` VALUES (274837165,1052494,1,'xtal1_1_0001.cbf','/dls/i03/data/2016/cm14451-2/20160413/test_xtal',0,'/dls/i03/data/2016/cm14451-2/jpegs/20160413/test_xtal/xtal1_1_0001.jpeg','/dls/i03/data/2016/cm14451-2/jpegs/20160413/test_xtal/xtal1_1_0001.thumb.jpeg',294,0,298.847,NULL,NULL,'2016-04-13 11:18:39',NULL,'2016-04-13 11:18:39'),(274837168,1052494,2,'xtal1_1_0002.cbf','/dls/i03/data/2016/cm14451-2/20160413/test_xtal',0,'/dls/i03/data/2016/cm14451-2/jpegs/20160413/test_xtal/xtal1_1_0002.jpeg','/dls/i03/data/2016/cm14451-2/jpegs/20160413/test_xtal/xtal1_1_0002.thumb.jpeg',294,0,298.74,NULL,NULL,'2016-04-13 11:18:50',NULL,'2016-04-13 11:18:50'),(274837177,1052503,1,'xtal1_3_0001.cbf','/dls/i03/data/2016/cm14451-2/20160413/test_xtal',0,'/dls/i03/data/2016/cm14451-2/jpegs/20160413/test_xtal/xtal1_3_0001.jpeg','/dls/i03/data/2016/cm14451-2/jpegs/20160413/test_xtal/xtal1_3_0001.thumb.jpeg',294,0,302.004,NULL,NULL,'2016-04-13 11:21:36',NULL,'2016-04-13 11:21:36'),(274837180,1052503,2,'xtal1_3_0002.cbf','/dls/i03/data/2016/cm14451-2/20160413/test_xtal',0,'/dls/i03/data/2016/cm14451-2/jpegs/20160413/test_xtal/xtal1_3_0002.jpeg','/dls/i03/data/2016/cm14451-2/jpegs/20160413/test_xtal/xtal1_3_0002.thumb.jpeg',294,0,301.922,NULL,NULL,'2016-04-13 11:21:45',NULL,'2016-04-13 11:21:45'),(274837183,1052503,3,'xtal1_3_0003.cbf','/dls/i03/data/2016/cm14451-2/20160413/test_xtal',0,'/dls/i03/data/2016/cm14451-2/jpegs/20160413/test_xtal/xtal1_3_0003.jpeg','/dls/i03/data/2016/cm14451-2/jpegs/20160413/test_xtal/xtal1_3_0003.thumb.jpeg',294,0,301.842,NULL,NULL,'2016-04-13 11:21:54',NULL,'2016-04-13 11:21:54'),(284717989,1066786,1,'thau_2_0001.cbf','/dls/i03/data/2016/cm14451-2/gw/20160418/thau/edna_test',0,'/dls/i03/data/2016/cm14451-2/jpegs/gw/20160418/thau/edna_test/thau_2_0001.jpeg','/dls/i03/data/2016/cm14451-2/jpegs/gw/20160418/thau/edna_test/thau_2_0001.thumb.jpeg',294,0,299.987,NULL,NULL,'2016-04-14 02:19:04',NULL,'2016-04-14 02:19:04'),(284718055,1066786,2,'thau_2_0002.cbf','/dls/i03/data/2016/cm14451-2/gw/20160418/thau/edna_test',0,'/dls/i03/data/2016/cm14451-2/jpegs/gw/20160418/thau/edna_test/thau_2_0002.jpeg','/dls/i03/data/2016/cm14451-2/jpegs/gw/20160418/thau/edna_test/thau_2_0002.thumb.jpeg',294,0,299.933,NULL,NULL,'2016-04-14 02:19:04',NULL,'2016-04-14 02:19:04'),(284718118,1066786,3,'thau_2_0003.cbf','/dls/i03/data/2016/cm14451-2/gw/20160418/thau/edna_test',0,'/dls/i03/data/2016/cm14451-2/jpegs/gw/20160418/thau/edna_test/thau_2_0003.jpeg','/dls/i03/data/2016/cm14451-2/jpegs/gw/20160418/thau/edna_test/thau_2_0003.thumb.jpeg',294,0,299.908,NULL,NULL,'2016-04-14 02:19:04',NULL,'2016-04-14 02:19:04');
/*!40000 ALTER TABLE `Image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ImageQualityIndicators`
--

DROP TABLE IF EXISTS `ImageQualityIndicators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ImageQualityIndicators` (
  `imageQualityIndicatorsId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key (auto-incremented)',
  `imageId` int(12) DEFAULT NULL,
  `autoProcProgramId` int(10) unsigned DEFAULT NULL,
  `spotTotal` int(10) DEFAULT NULL COMMENT 'Total number of spots',
  `inResTotal` int(10) DEFAULT NULL COMMENT 'Total number of spots in resolution range',
  `goodBraggCandidates` int(10) DEFAULT NULL COMMENT 'Total number of Bragg diffraction spots',
  `iceRings` int(10) DEFAULT NULL COMMENT 'Number of ice rings identified',
  `method1Res` float DEFAULT NULL COMMENT 'Resolution estimate 1 (see publication)',
  `method2Res` float DEFAULT NULL COMMENT 'Resolution estimate 2 (see publication)',
  `maxUnitCell` float DEFAULT NULL COMMENT 'Estimation of the largest possible unit cell edge',
  `pctSaturationTop50Peaks` float DEFAULT NULL COMMENT 'The fraction of the dynamic range being used',
  `inResolutionOvrlSpots` int(10) DEFAULT NULL COMMENT 'Number of spots overloaded',
  `binPopCutOffMethod2Res` float DEFAULT NULL COMMENT 'Cut off used in resolution limit calculation',
  `recordTimeStamp` datetime DEFAULT NULL COMMENT 'Creation or last update date/time',
  `totalIntegratedSignal` double DEFAULT NULL,
  `dozor_score` double DEFAULT NULL COMMENT 'dozor_score',
  `dataCollectionId` int(11) unsigned DEFAULT NULL,
  `imageNumber` mediumint(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`imageQualityIndicatorsId`),
  KEY `AutoProcProgramIdx1` (`autoProcProgramId`),
  KEY `ImageQualityIndicatorsIdx1` (`imageId`),
  KEY `ImageQualityIndicators_ibfk3` (`dataCollectionId`),
  CONSTRAINT `AutoProcProgramFK1` FOREIGN KEY (`autoProcProgramId`) REFERENCES `AutoProcProgram` (`autoProcProgramId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ImageQualityIndicators_ibfk3` FOREIGN KEY (`dataCollectionId`) REFERENCES `DataCollection` (`dataCollectionId`)
) ENGINE=InnoDB AUTO_INCREMENT=62328700 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ImageQualityIndicators`
--

LOCK TABLES `ImageQualityIndicators` WRITE;
/*!40000 ALTER TABLE `ImageQualityIndicators` DISABLE KEYS */;
INSERT INTO `ImageQualityIndicators` VALUES (60845691,NULL,NULL,296,296,259,0,2.03,2.03,0,0,0,0,NULL,2.61,NULL,1052494,1),(60845694,NULL,NULL,239,239,224,0,2.12,2.12,0,0,0,0,NULL,2.95,NULL,1052494,2),(60845703,274837177,NULL,217,217,202,0,2.07,2.07,0,0,0,0,NULL,2.99,NULL,1052503,1),(60845706,NULL,NULL,257,257,236,0,2.06,2.06,0,0,0,0,NULL,3.02,NULL,1052503,2),(60845709,NULL,NULL,306,306,278,0,2.04,2.04,0,0,0,0,NULL,2.75,NULL,1052503,3),(62328693,284718055,NULL,848,848,652,0,1.56,1.56,0,0,0,0,NULL,2.03,NULL,1066786,2),(62328696,284718118,NULL,922,922,735,0,1.57,1.57,0,0,0,0,NULL,2.13,NULL,1066786,3),(62328699,284717989,NULL,1132,1132,872,0,1.63,1.63,0,0,0,0,NULL,2.09,NULL,1066786,1);
/*!40000 ALTER TABLE `ImageQualityIndicators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Imager`
--

DROP TABLE IF EXISTS `Imager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Imager` (
  `imagerId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `temperature` float DEFAULT NULL,
  `serial` varchar(45) DEFAULT NULL,
  `capacity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`imagerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Imager`
--

LOCK TABLES `Imager` WRITE;
/*!40000 ALTER TABLE `Imager` DISABLE KEYS */;
/*!40000 ALTER TABLE `Imager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InspectionType`
--

DROP TABLE IF EXISTS `InspectionType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InspectionType` (
  `inspectionTypeId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`inspectionTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InspectionType`
--

LOCK TABLES `InspectionType` WRITE;
/*!40000 ALTER TABLE `InspectionType` DISABLE KEYS */;
/*!40000 ALTER TABLE `InspectionType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Instruction`
--

DROP TABLE IF EXISTS `Instruction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Instruction` (
  `instructionId` int(10) NOT NULL AUTO_INCREMENT,
  `instructionSetId` int(10) NOT NULL,
  `INSTRUCTIONORDER` int(11) unsigned DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`instructionId`),
  KEY `InstructionToInstructionSet` (`instructionSetId`),
  CONSTRAINT `InstructionToInstructionSet` FOREIGN KEY (`instructionSetId`) REFERENCES `InstructionSet` (`instructionSetId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Instruction`
--

LOCK TABLES `Instruction` WRITE;
/*!40000 ALTER TABLE `Instruction` DISABLE KEYS */;
/*!40000 ALTER TABLE `Instruction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InstructionSet`
--

DROP TABLE IF EXISTS `InstructionSet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InstructionSet` (
  `instructionSetId` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`instructionSetId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InstructionSet`
--

LOCK TABLES `InstructionSet` WRITE;
/*!40000 ALTER TABLE `InstructionSet` DISABLE KEYS */;
/*!40000 ALTER TABLE `InstructionSet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IspybAutoProcAttachment`
--

DROP TABLE IF EXISTS `IspybAutoProcAttachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IspybAutoProcAttachment` (
  `autoProcAttachmentId` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `FILETYPE` varchar(20) DEFAULT NULL,
  `OUTPUT` tinyint(1) DEFAULT '1',
  `ANOMALOUS` varchar(6) DEFAULT NULL,
  `step` enum('XDS','XSCALE','SCALA','SCALEPACK','TRUNCATE') DEFAULT 'XDS' COMMENT 'step where the file is generated',
  `fileCategory` enum('input','output','log','correction') DEFAULT 'output',
  `hasGraph` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`autoProcAttachmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ISPyB autoProcAttachment files values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IspybAutoProcAttachment`
--

LOCK TABLES `IspybAutoProcAttachment` WRITE;
/*!40000 ALTER TABLE `IspybAutoProcAttachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `IspybAutoProcAttachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IspybCrystalClass`
--

DROP TABLE IF EXISTS `IspybCrystalClass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IspybCrystalClass` (
  `crystalClassId` int(11) NOT NULL AUTO_INCREMENT,
  `crystalClass_code` varchar(20) NOT NULL,
  `crystalClass_name` varchar(255) NOT NULL,
  PRIMARY KEY (`crystalClassId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ISPyB crystal class values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IspybCrystalClass`
--

LOCK TABLES `IspybCrystalClass` WRITE;
/*!40000 ALTER TABLE `IspybCrystalClass` DISABLE KEYS */;
/*!40000 ALTER TABLE `IspybCrystalClass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IspybReference`
--

DROP TABLE IF EXISTS `IspybReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IspybReference` (
  `referenceId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key (auto-incremented)',
  `referenceName` varchar(255) DEFAULT NULL COMMENT 'reference name',
  `referenceUrl` varchar(1024) DEFAULT NULL COMMENT 'url of the reference',
  `referenceBibtext` blob COMMENT 'bibtext value of the reference',
  `beamline` enum('All','ID14-4','ID23-1','ID23-2','ID29','XRF','AllXRF','Mesh') DEFAULT NULL COMMENT 'beamline involved',
  PRIMARY KEY (`referenceId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IspybReference`
--

LOCK TABLES `IspybReference` WRITE;
/*!40000 ALTER TABLE `IspybReference` DISABLE KEYS */;
/*!40000 ALTER TABLE `IspybReference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LabContact`
--

DROP TABLE IF EXISTS `LabContact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LabContact` (
  `labContactId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `personId` int(10) unsigned NOT NULL,
  `cardName` varchar(40) NOT NULL,
  `proposalId` int(10) unsigned NOT NULL,
  `defaultCourrierCompany` varchar(45) DEFAULT NULL,
  `courierAccount` varchar(45) DEFAULT NULL,
  `billingReference` varchar(45) DEFAULT NULL,
  `dewarAvgCustomsValue` int(10) unsigned NOT NULL DEFAULT '0',
  `dewarAvgTransportValue` int(10) unsigned NOT NULL DEFAULT '0',
  `recordTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation or last update date/time',
  PRIMARY KEY (`labContactId`),
  UNIQUE KEY `cardNameAndProposal` (`cardName`,`proposalId`),
  UNIQUE KEY `personAndProposal` (`personId`,`proposalId`),
  KEY `LabContact_FKIndex1` (`proposalId`),
  CONSTRAINT `LabContact_ibfk_1` FOREIGN KEY (`personId`) REFERENCES `Person` (`personId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `LabContact_ibfk_2` FOREIGN KEY (`proposalId`) REFERENCES `Proposal` (`proposalId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LabContact`
--

LOCK TABLES `LabContact` WRITE;
/*!40000 ALTER TABLE `LabContact` DISABLE KEYS */;
/*!40000 ALTER TABLE `LabContact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Laboratory`
--

DROP TABLE IF EXISTS `Laboratory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Laboratory` (
  `laboratoryId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `laboratoryUUID` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `organization` varchar(45) DEFAULT NULL,
  `recordTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation or last update date/time',
  PRIMARY KEY (`laboratoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Laboratory`
--

LOCK TABLES `Laboratory` WRITE;
/*!40000 ALTER TABLE `Laboratory` DISABLE KEYS */;
/*!40000 ALTER TABLE `Laboratory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Log4Stat`
--

DROP TABLE IF EXISTS `Log4Stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Log4Stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `priority` varchar(15) DEFAULT NULL,
  `LOG4JTIMESTAMP` datetime DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Log4Stat`
--

LOCK TABLES `Log4Stat` WRITE;
/*!40000 ALTER TABLE `Log4Stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `Log4Stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MXMRRun`
--

DROP TABLE IF EXISTS `MXMRRun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MXMRRun` (
  `mxMRRunId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `autoProcScalingId` int(11) unsigned NOT NULL,
  `success` tinyint(1) DEFAULT '0' COMMENT 'Indicates whether the program completed. 1 for success, 0 for failure.',
  `message` varchar(255) DEFAULT NULL COMMENT 'A short summary of the findings, success or failure.',
  `pipeline` varchar(50) DEFAULT NULL,
  `inputCoordFile` varchar(255) DEFAULT NULL,
  `outputCoordFile` varchar(255) DEFAULT NULL,
  `inputMTZFile` varchar(255) DEFAULT NULL,
  `outputMTZFile` varchar(255) DEFAULT NULL,
  `runDirectory` varchar(255) DEFAULT NULL,
  `logFile` varchar(255) DEFAULT NULL,
  `commandLine` varchar(255) DEFAULT NULL,
  `rValueStart` float DEFAULT NULL,
  `rValueEnd` float DEFAULT NULL,
  `rFreeValueStart` float DEFAULT NULL,
  `rFreeValueEnd` float DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  PRIMARY KEY (`mxMRRunId`),
  KEY `mxMRRun_FK1` (`autoProcScalingId`),
  CONSTRAINT `mxMRRun_FK1` FOREIGN KEY (`autoProcScalingId`) REFERENCES `AutoProcScaling` (`autoProcScalingId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MXMRRun`
--

LOCK TABLES `MXMRRun` WRITE;
/*!40000 ALTER TABLE `MXMRRun` DISABLE KEYS */;
/*!40000 ALTER TABLE `MXMRRun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MXMRRunBlob`
--

DROP TABLE IF EXISTS `MXMRRunBlob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MXMRRunBlob` (
  `mxMRRunBlobId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mxMRRunId` int(11) unsigned NOT NULL,
  `view1` varchar(255) DEFAULT NULL,
  `view2` varchar(255) DEFAULT NULL,
  `view3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mxMRRunBlobId`),
  KEY `mxMRRunBlob_FK1` (`mxMRRunId`),
  CONSTRAINT `mxMRRunBlob_FK1` FOREIGN KEY (`mxMRRunId`) REFERENCES `MXMRRun` (`mxMRRunId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MXMRRunBlob`
--

LOCK TABLES `MXMRRunBlob` WRITE;
/*!40000 ALTER TABLE `MXMRRunBlob` DISABLE KEYS */;
/*!40000 ALTER TABLE `MXMRRunBlob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Macromolecule`
--

DROP TABLE IF EXISTS `Macromolecule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Macromolecule` (
  `macromoleculeId` int(11) NOT NULL AUTO_INCREMENT,
  `proposalId` int(10) unsigned DEFAULT NULL,
  `safetyLevelId` int(10) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `acronym` varchar(45) DEFAULT NULL,
  `molecularMass` varchar(45) DEFAULT NULL,
  `extintionCoefficient` varchar(45) DEFAULT NULL,
  `sequence` varchar(1000) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `comments` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`macromoleculeId`),
  KEY `MacromoleculeToSafetyLevel` (`safetyLevelId`),
  CONSTRAINT `MacromoleculeToSafetyLevel` FOREIGN KEY (`safetyLevelId`) REFERENCES `SafetyLevel` (`safetyLevelId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Macromolecule`
--

LOCK TABLES `Macromolecule` WRITE;
/*!40000 ALTER TABLE `Macromolecule` DISABLE KEYS */;
/*!40000 ALTER TABLE `Macromolecule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MacromoleculeRegion`
--

DROP TABLE IF EXISTS `MacromoleculeRegion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MacromoleculeRegion` (
  `macromoleculeRegionId` int(10) NOT NULL AUTO_INCREMENT,
  `macromoleculeId` int(10) NOT NULL,
  `regionType` varchar(45) DEFAULT NULL,
  `id` varchar(45) DEFAULT NULL,
  `count` varchar(45) DEFAULT NULL,
  `sequence` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`macromoleculeRegionId`),
  KEY `MacromoleculeRegionInformationToMacromolecule` (`macromoleculeId`),
  CONSTRAINT `MacromoleculeRegionInformationToMacromolecule` FOREIGN KEY (`macromoleculeId`) REFERENCES `Macromolecule` (`macromoleculeId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MacromoleculeRegion`
--

LOCK TABLES `MacromoleculeRegion` WRITE;
/*!40000 ALTER TABLE `MacromoleculeRegion` DISABLE KEYS */;
/*!40000 ALTER TABLE `MacromoleculeRegion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Measurement`
--

DROP TABLE IF EXISTS `Measurement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Measurement` (
  `specimenId` int(10) NOT NULL,
  `runId` int(10) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `priorityLevelId` int(10) DEFAULT NULL,
  `exposureTemperature` varchar(45) DEFAULT NULL,
  `viscosity` varchar(45) DEFAULT NULL,
  `flow` tinyint(1) DEFAULT NULL,
  `extraFlowTime` varchar(45) DEFAULT NULL,
  `volumeToLoad` varchar(45) DEFAULT NULL,
  `waitTime` varchar(45) DEFAULT NULL,
  `transmission` varchar(45) DEFAULT NULL,
  `comments` varchar(512) DEFAULT NULL,
  `measurementId` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`measurementId`),
  KEY `MeasurementToRun` (`runId`),
  KEY `SpecimenToSamplePlateWell` (`specimenId`),
  CONSTRAINT `MeasurementToRun` FOREIGN KEY (`runId`) REFERENCES `Run` (`runId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SpecimenToSamplePlateWell` FOREIGN KEY (`specimenId`) REFERENCES `Specimen` (`specimenId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Measurement`
--

LOCK TABLES `Measurement` WRITE;
/*!40000 ALTER TABLE `Measurement` DISABLE KEYS */;
/*!40000 ALTER TABLE `Measurement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MeasurementToDataCollection`
--

DROP TABLE IF EXISTS `MeasurementToDataCollection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MeasurementToDataCollection` (
  `measurementToDataCollectionId` int(10) NOT NULL AUTO_INCREMENT,
  `dataCollectionId` int(10) DEFAULT NULL,
  `measurementId` int(10) DEFAULT NULL,
  `dataCollectionOrder` int(10) DEFAULT NULL,
  PRIMARY KEY (`measurementToDataCollectionId`),
  KEY `MeasurementToDataCollectionToDataCollection` (`dataCollectionId`),
  KEY `MeasurementToDataCollectionToMeasurement` (`measurementId`),
  CONSTRAINT `MeasurementToDataCollectionToDataCollection` FOREIGN KEY (`dataCollectionId`) REFERENCES `SaxsDataCollection` (`dataCollectionId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `MeasurementToDataCollectionToMeasurement` FOREIGN KEY (`measurementId`) REFERENCES `Measurement` (`measurementId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MeasurementToDataCollection`
--

LOCK TABLES `MeasurementToDataCollection` WRITE;
/*!40000 ALTER TABLE `MeasurementToDataCollection` DISABLE KEYS */;
/*!40000 ALTER TABLE `MeasurementToDataCollection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MeasurementUnit`
--

DROP TABLE IF EXISTS `MeasurementUnit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MeasurementUnit` (
  `measurementUnitId` int(10) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `unitType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`measurementUnitId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MeasurementUnit`
--

LOCK TABLES `MeasurementUnit` WRITE;
/*!40000 ALTER TABLE `MeasurementUnit` DISABLE KEYS */;
/*!40000 ALTER TABLE `MeasurementUnit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Merge`
--

DROP TABLE IF EXISTS `Merge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Merge` (
  `mergeId` int(10) NOT NULL AUTO_INCREMENT,
  `measurementId` int(10) DEFAULT NULL,
  `frameListId` int(10) DEFAULT NULL,
  `discardedFrameNameList` varchar(1024) DEFAULT NULL,
  `averageFilePath` varchar(255) DEFAULT NULL,
  `framesCount` varchar(45) DEFAULT NULL,
  `framesMerge` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`mergeId`),
  KEY `MergeToListOfFrames` (`frameListId`),
  KEY `MergeToMeasurement` (`measurementId`),
  CONSTRAINT `MergeToListOfFrames` FOREIGN KEY (`frameListId`) REFERENCES `FrameList` (`frameListId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `MergeToMeasurement` FOREIGN KEY (`measurementId`) REFERENCES `Measurement` (`measurementId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Merge`
--

LOCK TABLES `Merge` WRITE;
/*!40000 ALTER TABLE `Merge` DISABLE KEYS */;
/*!40000 ALTER TABLE `Merge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Model`
--

DROP TABLE IF EXISTS `Model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Model` (
  `modelId` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `pdbFile` varchar(255) DEFAULT NULL,
  `fitFile` varchar(255) DEFAULT NULL,
  `firFile` varchar(255) DEFAULT NULL,
  `logFile` varchar(255) DEFAULT NULL,
  `rFactor` varchar(45) DEFAULT NULL,
  `chiSqrt` varchar(45) DEFAULT NULL,
  `volume` varchar(45) DEFAULT NULL,
  `rg` varchar(45) DEFAULT NULL,
  `dMax` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`modelId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Model`
--

LOCK TABLES `Model` WRITE;
/*!40000 ALTER TABLE `Model` DISABLE KEYS */;
/*!40000 ALTER TABLE `Model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ModelBuilding`
--

DROP TABLE IF EXISTS `ModelBuilding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ModelBuilding` (
  `modelBuildingId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key (auto-incremented)',
  `phasingAnalysisId` int(11) unsigned NOT NULL COMMENT 'Related phasing analysis item',
  `phasingProgramRunId` int(11) unsigned NOT NULL COMMENT 'Related program item',
  `spaceGroupId` int(10) unsigned DEFAULT NULL COMMENT 'Related spaceGroup',
  `lowRes` double DEFAULT NULL,
  `highRes` double DEFAULT NULL,
  `recordTimeStamp` datetime DEFAULT NULL COMMENT 'Creation or last update date/time',
  PRIMARY KEY (`modelBuildingId`),
  KEY `ModelBuilding_FKIndex1` (`phasingAnalysisId`),
  KEY `ModelBuilding_FKIndex2` (`phasingProgramRunId`),
  KEY `ModelBuilding_FKIndex3` (`spaceGroupId`),
  CONSTRAINT `ModelBuilding_phasingAnalysisfk_1` FOREIGN KEY (`phasingAnalysisId`) REFERENCES `PhasingAnalysis` (`phasingAnalysisId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ModelBuilding_phasingProgramRunfk_1` FOREIGN KEY (`phasingProgramRunId`) REFERENCES `PhasingProgramRun` (`phasingProgramRunId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ModelBuilding_spaceGroupfk_1` FOREIGN KEY (`spaceGroupId`) REFERENCES `SpaceGroup` (`spaceGroupId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ModelBuilding`
--

LOCK TABLES `ModelBuilding` WRITE;
/*!40000 ALTER TABLE `ModelBuilding` DISABLE KEYS */;
/*!40000 ALTER TABLE `ModelBuilding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ModelList`
--

DROP TABLE IF EXISTS `ModelList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ModelList` (
  `modelListId` int(10) NOT NULL AUTO_INCREMENT,
  `nsdFilePath` varchar(255) DEFAULT NULL,
  `chi2RgFilePath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`modelListId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ModelList`
--

LOCK TABLES `ModelList` WRITE;
/*!40000 ALTER TABLE `ModelList` DISABLE KEYS */;
/*!40000 ALTER TABLE `ModelList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ModelToList`
--

DROP TABLE IF EXISTS `ModelToList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ModelToList` (
  `modelToListId` int(10) NOT NULL AUTO_INCREMENT,
  `modelId` int(10) NOT NULL,
  `modelListId` int(10) NOT NULL,
  PRIMARY KEY (`modelToListId`),
  KEY `ModelToListToList` (`modelListId`),
  KEY `ModelToListToModel` (`modelId`),
  CONSTRAINT `ModelToListToList` FOREIGN KEY (`modelListId`) REFERENCES `ModelList` (`modelListId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ModelToListToModel` FOREIGN KEY (`modelId`) REFERENCES `Model` (`modelId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ModelToList`
--

LOCK TABLES `ModelToList` WRITE;
/*!40000 ALTER TABLE `ModelToList` DISABLE KEYS */;
/*!40000 ALTER TABLE `ModelToList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MotorPosition`
--

DROP TABLE IF EXISTS `MotorPosition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MotorPosition` (
  `motorPositionId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key (auto-incremented)',
  `phiX` double DEFAULT NULL,
  `phiY` double DEFAULT NULL,
  `phiZ` double DEFAULT NULL,
  `sampX` double DEFAULT NULL,
  `sampY` double DEFAULT NULL,
  `omega` double DEFAULT NULL,
  `kappa` double DEFAULT NULL,
  `phi` double DEFAULT NULL,
  `chi` double DEFAULT NULL,
  `gridIndexY` int(11) DEFAULT NULL,
  `gridIndexZ` int(11) DEFAULT NULL,
  `recordTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation or last update date/time',
  PRIMARY KEY (`motorPositionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MotorPosition`
--

LOCK TABLES `MotorPosition` WRITE;
/*!40000 ALTER TABLE `MotorPosition` DISABLE KEYS */;
/*!40000 ALTER TABLE `MotorPosition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PDB`
--

DROP TABLE IF EXISTS `PDB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PDB` (
  `pdbId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `contents` text,
  `CODE` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`pdbId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PDB`
--

LOCK TABLES `PDB` WRITE;
/*!40000 ALTER TABLE `PDB` DISABLE KEYS */;
/*!40000 ALTER TABLE `PDB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PDBEntry`
--

DROP TABLE IF EXISTS `PDBEntry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PDBEntry` (
  `pdbEntryId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `autoProcProgramId` int(11) unsigned NOT NULL,
  `code` varchar(4) DEFAULT NULL,
  `cell_a` float DEFAULT NULL,
  `cell_b` float DEFAULT NULL,
  `cell_c` float DEFAULT NULL,
  `cell_alpha` float DEFAULT NULL,
  `cell_beta` float DEFAULT NULL,
  `cell_gamma` float DEFAULT NULL,
  `resolution` float DEFAULT NULL,
  `pdbTitle` varchar(255) DEFAULT NULL,
  `pdbAuthors` varchar(600) DEFAULT NULL,
  `pdbDate` datetime DEFAULT NULL,
  `pdbBeamlineName` varchar(50) DEFAULT NULL,
  `beamlines` varchar(100) DEFAULT NULL,
  `distance` float DEFAULT NULL,
  `autoProcCount` smallint(6) DEFAULT NULL,
  `dataCollectionCount` smallint(6) DEFAULT NULL,
  `beamlineMatch` tinyint(1) DEFAULT NULL,
  `authorMatch` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`pdbEntryId`),
  KEY `pdbEntryIdx1` (`autoProcProgramId`),
  CONSTRAINT `pdbEntry_FK1` FOREIGN KEY (`autoProcProgramId`) REFERENCES `AutoProcProgram` (`autoProcProgramId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PDBEntry`
--

LOCK TABLES `PDBEntry` WRITE;
/*!40000 ALTER TABLE `PDBEntry` DISABLE KEYS */;
/*!40000 ALTER TABLE `PDBEntry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PDBEntry_has_AutoProcProgram`
--

DROP TABLE IF EXISTS `PDBEntry_has_AutoProcProgram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PDBEntry_has_AutoProcProgram` (
  `pdbEntryHasAutoProcId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pdbEntryId` int(11) unsigned NOT NULL,
  `autoProcProgramId` int(11) unsigned NOT NULL,
  `distance` float DEFAULT NULL,
  PRIMARY KEY (`pdbEntryHasAutoProcId`),
  KEY `pdbEntry_AutoProcProgramIdx1` (`pdbEntryId`),
  KEY `pdbEntry_AutoProcProgramIdx2` (`autoProcProgramId`),
  CONSTRAINT `pdbEntry_AutoProcProgram_FK1` FOREIGN KEY (`pdbEntryId`) REFERENCES `PDBEntry` (`pdbEntryId`) ON DELETE CASCADE,
  CONSTRAINT `pdbEntry_AutoProcProgram_FK2` FOREIGN KEY (`autoProcProgramId`) REFERENCES `AutoProcProgram` (`autoProcProgramId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PDBEntry_has_AutoProcProgram`
--

LOCK TABLES `PDBEntry_has_AutoProcProgram` WRITE;
/*!40000 ALTER TABLE `PDBEntry_has_AutoProcProgram` DISABLE KEYS */;
/*!40000 ALTER TABLE `PDBEntry_has_AutoProcProgram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PHPSession`
--

DROP TABLE IF EXISTS `PHPSession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PHPSession` (
  `id` varchar(50) NOT NULL,
  `accessDate` datetime DEFAULT NULL,
  `data` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PHPSession`
--

LOCK TABLES `PHPSession` WRITE;
/*!40000 ALTER TABLE `PHPSession` DISABLE KEYS */;
/*!40000 ALTER TABLE `PHPSession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Particle`
--

DROP TABLE IF EXISTS `Particle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Particle` (
  `particleId` int(11) unsigned NOT NULL,
  `dataCollectionId` int(11) unsigned NOT NULL,
  `x` float DEFAULT NULL,
  `y` float DEFAULT NULL,
  PRIMARY KEY (`particleId`),
  KEY `Particle_FKIND1` (`dataCollectionId`),
  CONSTRAINT `Particle_FK1` FOREIGN KEY (`dataCollectionId`) REFERENCES `DataCollection` (`dataCollectionId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Particle`
--

LOCK TABLES `Particle` WRITE;
/*!40000 ALTER TABLE `Particle` DISABLE KEYS */;
/*!40000 ALTER TABLE `Particle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Permission`
--

DROP TABLE IF EXISTS `Permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Permission` (
  `permissionId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(15) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`permissionId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Permission`
--

LOCK TABLES `Permission` WRITE;
/*!40000 ALTER TABLE `Permission` DISABLE KEYS */;
INSERT INTO `Permission` VALUES (1,'mx_admin','MX Administrator'),(2,'manage_groups','Manage User Groups'),(4,'manage_perms','Manage User Group Permissions'),(5,'global_stats','View Global Statistics'),(6,'fault_view','View Fault Reports'),(7,'saxs_admin','SAXS Administrator'),(8,'em_admin','EM Administrator'),(9,'gen_admin','Powder Admin'),(10,'tomo_admin','Tomo Admin'),(11,'super_admin','Site Admin'),(12,'fault_global','Globally edit all faults'),(13,'schedules','Manage Imaging Schedules'),(15,'schedule_comps','Manage Imaging Schedule Components'),(16,'imaging_dash','Imaging Dashboard'),(17,'vmxi_queue','VMXi Data Collection Queue'),(18,'sm_admin','Small Molecule Admin');
/*!40000 ALTER TABLE `Permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Person`
--

DROP TABLE IF EXISTS `Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Person` (
  `personId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `laboratoryId` int(10) unsigned DEFAULT NULL,
  `personUUID` varchar(45) DEFAULT NULL,
  `familyName` varchar(100) DEFAULT NULL,
  `givenName` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `emailAddress` varchar(60) DEFAULT NULL,
  `phoneNumber` varchar(45) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `passwd` varchar(45) DEFAULT NULL,
  `faxNumber` varchar(45) DEFAULT NULL,
  `recordTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation or last update date/time',
  `cache` text,
  PRIMARY KEY (`personId`),
  UNIQUE KEY `Person_FKIndex_Login` (`login`),
  KEY `Person_FKIndex1` (`laboratoryId`),
  KEY `Person_FKIndexFamilyName` (`familyName`),
  CONSTRAINT `Person_ibfk_1` FOREIGN KEY (`laboratoryId`) REFERENCES `Laboratory` (`laboratoryId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46270 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Person`
--

LOCK TABLES `Person` WRITE;
/*!40000 ALTER TABLE `Person` DISABLE KEYS */;
INSERT INTO `Person` VALUES (1,NULL,NULL,'McBoatface','Boaty','Mr',NULL,NULL,'boaty',NULL,NULL,'2016-03-20 13:56:45','a:1:{s:9:\"container\";N;}'),(46266,NULL,NULL,NULL,NULL,'User',NULL,NULL,NULL,NULL,NULL,'2016-03-16 15:53:55',NULL),(46269,NULL,NULL,NULL,NULL,'User',NULL,NULL,NULL,NULL,NULL,'2016-03-16 15:59:22',NULL);
/*!40000 ALTER TABLE `Person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Phasing`
--

DROP TABLE IF EXISTS `Phasing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Phasing` (
  `phasingId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key (auto-incremented)',
  `phasingAnalysisId` int(11) unsigned NOT NULL COMMENT 'Related phasing analysis item',
  `phasingProgramRunId` int(11) unsigned NOT NULL COMMENT 'Related program item',
  `spaceGroupId` int(10) unsigned DEFAULT NULL COMMENT 'Related spaceGroup',
  `method` enum('solvent flattening','solvent flipping') DEFAULT NULL COMMENT 'phasing method',
  `solventContent` double DEFAULT NULL,
  `enantiomorph` tinyint(1) DEFAULT NULL COMMENT '0 or 1',
  `lowRes` double DEFAULT NULL,
  `highRes` double DEFAULT NULL,
  `recordTimeStamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`phasingId`),
  KEY `Phasing_FKIndex1` (`phasingAnalysisId`),
  KEY `Phasing_FKIndex2` (`phasingProgramRunId`),
  KEY `Phasing_FKIndex3` (`spaceGroupId`),
  CONSTRAINT `Phasing_phasingAnalysisfk_1` FOREIGN KEY (`phasingAnalysisId`) REFERENCES `PhasingAnalysis` (`phasingAnalysisId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Phasing_phasingProgramRunfk_1` FOREIGN KEY (`phasingProgramRunId`) REFERENCES `PhasingProgramRun` (`phasingProgramRunId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Phasing_spaceGroupfk_1` FOREIGN KEY (`spaceGroupId`) REFERENCES `SpaceGroup` (`spaceGroupId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Phasing`
--

LOCK TABLES `Phasing` WRITE;
/*!40000 ALTER TABLE `Phasing` DISABLE KEYS */;
/*!40000 ALTER TABLE `Phasing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PhasingAnalysis`
--

DROP TABLE IF EXISTS `PhasingAnalysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhasingAnalysis` (
  `phasingAnalysisId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key (auto-incremented)',
  `recordTimeStamp` datetime DEFAULT NULL COMMENT 'Creation or last update date/time',
  PRIMARY KEY (`phasingAnalysisId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PhasingAnalysis`
--

LOCK TABLES `PhasingAnalysis` WRITE;
/*!40000 ALTER TABLE `PhasingAnalysis` DISABLE KEYS */;
/*!40000 ALTER TABLE `PhasingAnalysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PhasingProgramAttachment`
--

DROP TABLE IF EXISTS `PhasingProgramAttachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhasingProgramAttachment` (
  `phasingProgramAttachmentId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key (auto-incremented)',
  `phasingProgramRunId` int(11) unsigned NOT NULL COMMENT 'Related program item',
  `fileType` enum('Map','Logfile') DEFAULT NULL COMMENT 'file type',
  `fileName` varchar(45) DEFAULT NULL COMMENT 'file name',
  `filePath` varchar(255) DEFAULT NULL COMMENT 'file path',
  `recordTimeStamp` datetime DEFAULT NULL COMMENT 'Creation or last update date/time',
  PRIMARY KEY (`phasingProgramAttachmentId`),
  KEY `PhasingProgramAttachment_FKIndex1` (`phasingProgramRunId`),
  CONSTRAINT `Phasing_phasingProgramAttachmentfk_1` FOREIGN KEY (`phasingProgramRunId`) REFERENCES `PhasingProgramRun` (`phasingProgramRunId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PhasingProgramAttachment`
--

LOCK TABLES `PhasingProgramAttachment` WRITE;
/*!40000 ALTER TABLE `PhasingProgramAttachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `PhasingProgramAttachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PhasingProgramRun`
--

DROP TABLE IF EXISTS `PhasingProgramRun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhasingProgramRun` (
  `phasingProgramRunId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key (auto-incremented)',
  `phasingCommandLine` varchar(255) DEFAULT NULL COMMENT 'Command line for phasing',
  `phasingPrograms` varchar(255) DEFAULT NULL COMMENT 'Phasing programs (comma separated)',
  `phasingStatus` tinyint(1) DEFAULT NULL COMMENT 'success (1) / fail (0)',
  `phasingMessage` varchar(255) DEFAULT NULL COMMENT 'warning, error,...',
  `phasingStartTime` datetime DEFAULT NULL COMMENT 'Processing start time',
  `phasingEndTime` datetime DEFAULT NULL COMMENT 'Processing end time',
  `phasingEnvironment` varchar(255) DEFAULT NULL COMMENT 'Cpus, Nodes,...',
  `recordTimeStamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`phasingProgramRunId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PhasingProgramRun`
--

LOCK TABLES `PhasingProgramRun` WRITE;
/*!40000 ALTER TABLE `PhasingProgramRun` DISABLE KEYS */;
/*!40000 ALTER TABLE `PhasingProgramRun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PhasingStatistics`
--

DROP TABLE IF EXISTS `PhasingStatistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhasingStatistics` (
  `phasingStatisticsId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key (auto-incremented)',
  `phasingHasScalingId1` int(11) unsigned NOT NULL COMMENT 'the dataset in question',
  `phasingHasScalingId2` int(11) unsigned DEFAULT NULL COMMENT 'if this is MIT or MAD, which scaling are being compared, null otherwise',
  `numberOfBins` int(11) DEFAULT NULL COMMENT 'the total number of bins',
  `binNumber` int(11) DEFAULT NULL COMMENT 'binNumber, 999 for overall',
  `lowRes` double DEFAULT NULL COMMENT 'low resolution cutoff of this binfloat',
  `highRes` double DEFAULT NULL COMMENT 'high resolution cutoff of this binfloat',
  `metric` enum('Rcullis','CC','PhasingPower','FOM','<d"/sig>','Best CC','CC(1/2)','Weak CC','CFOM','Pseudo_free_CC','CC of partial model') DEFAULT NULL COMMENT 'metric',
  `statisticsValue` double DEFAULT NULL COMMENT 'the statistics value',
  `nReflections` int(11) DEFAULT NULL,
  `recordTimeStamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`phasingStatisticsId`),
  KEY `PhasingStatistics_FKIndex1` (`phasingHasScalingId1`),
  KEY `PhasingStatistics_FKIndex2` (`phasingHasScalingId2`),
  CONSTRAINT `PhasingStatistics_phasingHasScalingfk_1` FOREIGN KEY (`phasingHasScalingId1`) REFERENCES `Phasing_has_Scaling` (`phasingHasScalingId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PhasingStatistics_phasingHasScalingfk_2` FOREIGN KEY (`phasingHasScalingId2`) REFERENCES `Phasing_has_Scaling` (`phasingHasScalingId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PhasingStatistics`
--

LOCK TABLES `PhasingStatistics` WRITE;
/*!40000 ALTER TABLE `PhasingStatistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `PhasingStatistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Phasing_has_Scaling`
--

DROP TABLE IF EXISTS `Phasing_has_Scaling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Phasing_has_Scaling` (
  `phasingHasScalingId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key (auto-incremented)',
  `phasingAnalysisId` int(11) unsigned NOT NULL COMMENT 'Related phasing analysis item',
  `autoProcScalingId` int(10) unsigned NOT NULL COMMENT 'Related autoProcScaling item',
  `datasetNumber` int(11) DEFAULT NULL COMMENT 'serial number of the dataset and always reserve 0 for the reference',
  `recordTimeStamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`phasingHasScalingId`),
  KEY `PhasingHasScaling_FKIndex1` (`phasingAnalysisId`),
  KEY `PhasingHasScaling_FKIndex2` (`autoProcScalingId`),
  CONSTRAINT `PhasingHasScaling_autoProcScalingfk_1` FOREIGN KEY (`autoProcScalingId`) REFERENCES `AutoProcScaling` (`autoProcScalingId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PhasingHasScaling_phasingAnalysisfk_1` FOREIGN KEY (`phasingAnalysisId`) REFERENCES `PhasingAnalysis` (`phasingAnalysisId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Phasing_has_Scaling`
--

LOCK TABLES `Phasing_has_Scaling` WRITE;
/*!40000 ALTER TABLE `Phasing_has_Scaling` DISABLE KEYS */;
/*!40000 ALTER TABLE `Phasing_has_Scaling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlateGroup`
--

DROP TABLE IF EXISTS `PlateGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PlateGroup` (
  `plateGroupId` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `storageTemperature` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`plateGroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlateGroup`
--

LOCK TABLES `PlateGroup` WRITE;
/*!40000 ALTER TABLE `PlateGroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `PlateGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlateType`
--

DROP TABLE IF EXISTS `PlateType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PlateType` (
  `PlateTypeId` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `shape` varchar(45) DEFAULT NULL,
  `rowCount` int(11) DEFAULT NULL,
  `columnCount` int(11) DEFAULT NULL,
  `experimentId` int(10) DEFAULT NULL,
  PRIMARY KEY (`PlateTypeId`),
  KEY `PlateTypeToExperiment` (`experimentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlateType`
--

LOCK TABLES `PlateType` WRITE;
/*!40000 ALTER TABLE `PlateType` DISABLE KEYS */;
/*!40000 ALTER TABLE `PlateType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Position`
--

DROP TABLE IF EXISTS `Position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Position` (
  `positionId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key (auto-incremented)',
  `RELATIVETOPOS` int(11) unsigned DEFAULT NULL COMMENT 'Foreign key (to Position table ) pointing to the reference point.',
  `X` double DEFAULT NULL COMMENT 'Distance from reference point in micrometer in the x direction.',
  `Y` double DEFAULT NULL COMMENT 'Distance from reference point in micrometer in the y direction.',
  `Z` double DEFAULT NULL COMMENT 'Distance from reference point in micrometer in the z direction.',
  `relativePositionId` int(11) unsigned DEFAULT NULL COMMENT 'relative position, null otherwise',
  `posX` double DEFAULT NULL,
  `posY` double DEFAULT NULL,
  `posZ` double DEFAULT NULL,
  `scale` double DEFAULT NULL,
  `recordTimeStamp` datetime DEFAULT NULL COMMENT 'Creation or last update date/time',
  PRIMARY KEY (`positionId`),
  KEY `Position_FKIndex1` (`relativePositionId`),
  CONSTRAINT `Position_relativePositionfk_1` FOREIGN KEY (`relativePositionId`) REFERENCES `Position` (`positionId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Position`
--

LOCK TABLES `Position` WRITE;
/*!40000 ALTER TABLE `Position` DISABLE KEYS */;
/*!40000 ALTER TABLE `Position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PreparePhasingData`
--

DROP TABLE IF EXISTS `PreparePhasingData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PreparePhasingData` (
  `preparePhasingDataId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key (auto-incremented)',
  `phasingAnalysisId` int(11) unsigned NOT NULL COMMENT 'Related phasing analysis item',
  `phasingProgramRunId` int(11) unsigned NOT NULL COMMENT 'Related program item',
  `spaceGroupId` int(10) unsigned DEFAULT NULL COMMENT 'Related spaceGroup',
  `lowRes` double DEFAULT NULL,
  `highRes` double DEFAULT NULL,
  `recordTimeStamp` datetime DEFAULT NULL COMMENT 'Creation or last update date/time',
  PRIMARY KEY (`preparePhasingDataId`),
  KEY `PreparePhasingData_FKIndex1` (`phasingAnalysisId`),
  KEY `PreparePhasingData_FKIndex2` (`phasingProgramRunId`),
  KEY `PreparePhasingData_FKIndex3` (`spaceGroupId`),
  CONSTRAINT `PreparePhasingData_phasingAnalysisfk_1` FOREIGN KEY (`phasingAnalysisId`) REFERENCES `PhasingAnalysis` (`phasingAnalysisId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PreparePhasingData_phasingProgramRunfk_1` FOREIGN KEY (`phasingProgramRunId`) REFERENCES `PhasingProgramRun` (`phasingProgramRunId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PreparePhasingData_spaceGroupfk_1` FOREIGN KEY (`spaceGroupId`) REFERENCES `SpaceGroup` (`spaceGroupId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PreparePhasingData`
--

LOCK TABLES `PreparePhasingData` WRITE;
/*!40000 ALTER TABLE `PreparePhasingData` DISABLE KEYS */;
/*!40000 ALTER TABLE `PreparePhasingData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project`
--

DROP TABLE IF EXISTS `Project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Project` (
  `projectId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `personId` int(11) unsigned DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `acronym` varchar(100) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`projectId`),
  KEY `Project_FK1` (`personId`),
  CONSTRAINT `Project_FK1` FOREIGN KEY (`personId`) REFERENCES `Person` (`personId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project`
--

LOCK TABLES `Project` WRITE;
/*!40000 ALTER TABLE `Project` DISABLE KEYS */;
/*!40000 ALTER TABLE `Project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project_has_BLSample`
--

DROP TABLE IF EXISTS `Project_has_BLSample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Project_has_BLSample` (
  `projectId` int(11) unsigned NOT NULL,
  `blSampleId` int(11) unsigned NOT NULL,
  PRIMARY KEY (`projectId`,`blSampleId`),
  KEY `Project_has_BLSample_FK2` (`blSampleId`),
  CONSTRAINT `Project_has_BLSample_FK1` FOREIGN KEY (`projectId`) REFERENCES `Project` (`projectId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Project_has_BLSample_FK2` FOREIGN KEY (`blSampleId`) REFERENCES `BLSample` (`blSampleId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project_has_BLSample`
--

LOCK TABLES `Project_has_BLSample` WRITE;
/*!40000 ALTER TABLE `Project_has_BLSample` DISABLE KEYS */;
/*!40000 ALTER TABLE `Project_has_BLSample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project_has_DCGroup`
--

DROP TABLE IF EXISTS `Project_has_DCGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Project_has_DCGroup` (
  `projectId` int(11) unsigned NOT NULL,
  `dataCollectionGroupId` int(11) NOT NULL,
  PRIMARY KEY (`projectId`,`dataCollectionGroupId`),
  KEY `Project_has_DCGroup_FK2` (`dataCollectionGroupId`),
  CONSTRAINT `Project_has_DCGroup_FK1` FOREIGN KEY (`projectId`) REFERENCES `Project` (`projectId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Project_has_DCGroup_FK2` FOREIGN KEY (`dataCollectionGroupId`) REFERENCES `DataCollectionGroup` (`dataCollectionGroupId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project_has_DCGroup`
--

LOCK TABLES `Project_has_DCGroup` WRITE;
/*!40000 ALTER TABLE `Project_has_DCGroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `Project_has_DCGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project_has_EnergyScan`
--

DROP TABLE IF EXISTS `Project_has_EnergyScan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Project_has_EnergyScan` (
  `projectId` int(11) unsigned NOT NULL,
  `energyScanId` int(11) unsigned NOT NULL,
  PRIMARY KEY (`projectId`,`energyScanId`),
  KEY `project_has_energyscan_FK2` (`energyScanId`),
  CONSTRAINT `project_has_energyscan_FK1` FOREIGN KEY (`projectId`) REFERENCES `Project` (`projectId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `project_has_energyscan_FK2` FOREIGN KEY (`energyScanId`) REFERENCES `EnergyScan` (`energyScanId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project_has_EnergyScan`
--

LOCK TABLES `Project_has_EnergyScan` WRITE;
/*!40000 ALTER TABLE `Project_has_EnergyScan` DISABLE KEYS */;
/*!40000 ALTER TABLE `Project_has_EnergyScan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project_has_Person`
--

DROP TABLE IF EXISTS `Project_has_Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Project_has_Person` (
  `projectId` int(11) unsigned NOT NULL,
  `personId` int(11) unsigned NOT NULL,
  PRIMARY KEY (`projectId`,`personId`),
  KEY `project_has_person_FK2` (`personId`),
  CONSTRAINT `project_has_person_FK1` FOREIGN KEY (`projectId`) REFERENCES `Project` (`projectId`) ON DELETE CASCADE,
  CONSTRAINT `project_has_person_FK2` FOREIGN KEY (`personId`) REFERENCES `Person` (`personId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project_has_Person`
--

LOCK TABLES `Project_has_Person` WRITE;
/*!40000 ALTER TABLE `Project_has_Person` DISABLE KEYS */;
/*!40000 ALTER TABLE `Project_has_Person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project_has_Protein`
--

DROP TABLE IF EXISTS `Project_has_Protein`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Project_has_Protein` (
  `projectId` int(11) unsigned NOT NULL,
  `proteinId` int(11) unsigned NOT NULL,
  PRIMARY KEY (`projectId`,`proteinId`),
  KEY `project_has_protein_FK2` (`proteinId`),
  CONSTRAINT `project_has_protein_FK1` FOREIGN KEY (`projectId`) REFERENCES `Project` (`projectId`) ON DELETE CASCADE,
  CONSTRAINT `project_has_protein_FK2` FOREIGN KEY (`proteinId`) REFERENCES `Protein` (`proteinId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project_has_Protein`
--

LOCK TABLES `Project_has_Protein` WRITE;
/*!40000 ALTER TABLE `Project_has_Protein` DISABLE KEYS */;
/*!40000 ALTER TABLE `Project_has_Protein` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project_has_Session`
--

DROP TABLE IF EXISTS `Project_has_Session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Project_has_Session` (
  `projectId` int(11) unsigned NOT NULL,
  `sessionId` int(11) unsigned NOT NULL,
  PRIMARY KEY (`projectId`,`sessionId`),
  KEY `project_has_session_FK2` (`sessionId`),
  CONSTRAINT `project_has_session_FK1` FOREIGN KEY (`projectId`) REFERENCES `Project` (`projectId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `project_has_session_FK2` FOREIGN KEY (`sessionId`) REFERENCES `BLSession` (`sessionId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project_has_Session`
--

LOCK TABLES `Project_has_Session` WRITE;
/*!40000 ALTER TABLE `Project_has_Session` DISABLE KEYS */;
/*!40000 ALTER TABLE `Project_has_Session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project_has_Shipping`
--

DROP TABLE IF EXISTS `Project_has_Shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Project_has_Shipping` (
  `projectId` int(11) unsigned NOT NULL,
  `shippingId` int(11) unsigned NOT NULL,
  PRIMARY KEY (`projectId`,`shippingId`),
  KEY `project_has_shipping_FK2` (`shippingId`),
  CONSTRAINT `project_has_shipping_FK1` FOREIGN KEY (`projectId`) REFERENCES `Project` (`projectId`) ON DELETE CASCADE,
  CONSTRAINT `project_has_shipping_FK2` FOREIGN KEY (`shippingId`) REFERENCES `Shipping` (`shippingId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project_has_Shipping`
--

LOCK TABLES `Project_has_Shipping` WRITE;
/*!40000 ALTER TABLE `Project_has_Shipping` DISABLE KEYS */;
/*!40000 ALTER TABLE `Project_has_Shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project_has_User`
--

DROP TABLE IF EXISTS `Project_has_User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Project_has_User` (
  `projecthasuserid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `projectid` int(11) unsigned NOT NULL,
  `username` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`projecthasuserid`),
  KEY `Project_Has_user_FK1` (`projectid`),
  CONSTRAINT `Project_Has_user_FK1` FOREIGN KEY (`projectid`) REFERENCES `Project` (`projectId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project_has_User`
--

LOCK TABLES `Project_has_User` WRITE;
/*!40000 ALTER TABLE `Project_has_User` DISABLE KEYS */;
/*!40000 ALTER TABLE `Project_has_User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project_has_XFEFSpectrum`
--

DROP TABLE IF EXISTS `Project_has_XFEFSpectrum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Project_has_XFEFSpectrum` (
  `projectId` int(11) unsigned NOT NULL,
  `xfeFluorescenceSpectrumId` int(11) unsigned NOT NULL,
  PRIMARY KEY (`projectId`,`xfeFluorescenceSpectrumId`),
  KEY `project_has_xfefspectrum_FK2` (`xfeFluorescenceSpectrumId`),
  CONSTRAINT `project_has_xfefspectrum_FK1` FOREIGN KEY (`projectId`) REFERENCES `Project` (`projectId`) ON DELETE CASCADE,
  CONSTRAINT `project_has_xfefspectrum_FK2` FOREIGN KEY (`xfeFluorescenceSpectrumId`) REFERENCES `XFEFluorescenceSpectrum` (`xfeFluorescenceSpectrumId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project_has_XFEFSpectrum`
--

LOCK TABLES `Project_has_XFEFSpectrum` WRITE;
/*!40000 ALTER TABLE `Project_has_XFEFSpectrum` DISABLE KEYS */;
/*!40000 ALTER TABLE `Project_has_XFEFSpectrum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proposal`
--

DROP TABLE IF EXISTS `Proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Proposal` (
  `proposalId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `personId` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(200) DEFAULT NULL,
  `proposalCode` varchar(45) DEFAULT NULL,
  `proposalNumber` varchar(45) DEFAULT NULL,
  `bltimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `proposalType` varchar(2) DEFAULT NULL COMMENT 'Proposal type: MX, BX',
  PRIMARY KEY (`proposalId`),
  UNIQUE KEY `Proposal_FKIndexCodeNumber` (`proposalCode`,`proposalNumber`),
  KEY `Proposal_FKIndex1` (`personId`),
  CONSTRAINT `Proposal_ibfk_1` FOREIGN KEY (`personId`) REFERENCES `Person` (`personId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=141667 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proposal`
--

LOCK TABLES `Proposal` WRITE;
/*!40000 ALTER TABLE `Proposal` DISABLE KEYS */;
INSERT INTO `Proposal` VALUES (37027,1,'I03 Commissioning Directory 2016','cm','14451','2015-12-21 15:20:43',NULL),(141666,46266,'Test Proposal cm-0001','cm','1','2016-03-16 16:01:34',NULL);
/*!40000 ALTER TABLE `Proposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Protein`
--

DROP TABLE IF EXISTS `Protein`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Protein` (
  `proteinId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `proposalId` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `acronym` varchar(45) DEFAULT NULL,
  `molecularMass` double DEFAULT NULL,
  `proteinType` varchar(45) DEFAULT NULL,
  `personId` int(10) unsigned DEFAULT NULL,
  `bltimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isCreatedBySampleSheet` tinyint(1) DEFAULT '0',
  `sequence` varchar(255) DEFAULT NULL,
  `MOD_ID` varchar(20) DEFAULT NULL,
  `componentTypeId` int(11) unsigned DEFAULT NULL,
  `concentrationTypeId` int(11) unsigned DEFAULT NULL,
  `global` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`proteinId`),
  KEY `ProteinAcronym_Index` (`proposalId`,`acronym`),
  KEY `Protein_FKIndex1` (`proposalId`),
  KEY `Protein_FKIndex2` (`personId`),
  KEY `Protein_Index2` (`acronym`),
  KEY `protein_fk3` (`componentTypeId`),
  KEY `protein_fk4` (`concentrationTypeId`),
  CONSTRAINT `Protein_ibfk_1` FOREIGN KEY (`proposalId`) REFERENCES `Proposal` (`proposalId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `protein_fk3` FOREIGN KEY (`componentTypeId`) REFERENCES `ComponentType` (`componentTypeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `protein_fk4` FOREIGN KEY (`concentrationTypeId`) REFERENCES `ConcentrationType` (`concentrationTypeId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=123492 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Protein`
--

LOCK TABLES `Protein` WRITE;
/*!40000 ALTER TABLE `Protein` DISABLE KEYS */;
INSERT INTO `Protein` VALUES (4380,141666,'Protein 01','PRT-01',NULL,NULL,NULL,'2016-03-17 15:57:52',0,NULL,NULL,NULL,NULL,0),(4383,141666,'Protein 02','PRT-02',NULL,NULL,NULL,'2016-03-17 16:02:07',0,NULL,NULL,NULL,NULL,0),(4386,141666,'Protein 03','PRT-03',NULL,NULL,NULL,'2016-03-17 16:02:07',0,NULL,NULL,NULL,NULL,0),(4389,141666,'Protein 04','PRT-04',NULL,NULL,NULL,'2016-03-17 16:02:07',0,NULL,NULL,NULL,NULL,0),(4392,141666,'Protein 05','PRT-05',NULL,NULL,NULL,'2016-03-17 16:02:07',0,NULL,NULL,NULL,NULL,0),(4395,141666,'Protein 06','PRT-06',NULL,NULL,NULL,'2016-03-17 16:02:07',0,NULL,NULL,NULL,NULL,0),(4398,141666,'Protein 07','PRT-07',NULL,NULL,NULL,'2016-03-17 16:02:07',0,NULL,NULL,NULL,NULL,0),(4401,141666,'Protein 08','PRT-08',NULL,NULL,NULL,'2016-03-17 16:02:07',0,NULL,NULL,NULL,NULL,0),(4404,141666,'Protein 09','PRT-09',NULL,NULL,NULL,'2016-03-17 16:02:07',0,NULL,NULL,NULL,NULL,0),(4407,141666,'Protein 10','PRT-10',NULL,NULL,NULL,'2016-03-17 16:02:07',0,NULL,NULL,NULL,NULL,0),(4410,141666,'Protein 11','PRT-11',NULL,NULL,NULL,'2016-03-17 16:02:07',0,NULL,NULL,NULL,NULL,0),(4413,141666,'Protein 12','PRT-12',NULL,NULL,NULL,'2016-03-17 16:02:07',0,NULL,NULL,NULL,NULL,0),(121393,37027,'therm','therm',NULL,NULL,NULL,'2016-01-13 13:50:20',0,NULL,NULL,NULL,NULL,0),(123491,37027,NULL,'thau',NULL,NULL,NULL,'2016-02-24 12:12:16',0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Protein` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Protein_has_PDB`
--

DROP TABLE IF EXISTS `Protein_has_PDB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Protein_has_PDB` (
  `proteinhaspdbid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `proteinid` int(11) unsigned NOT NULL,
  `pdbid` int(11) unsigned NOT NULL,
  PRIMARY KEY (`proteinhaspdbid`),
  KEY `Protein_Has_PDB_fk1` (`proteinid`),
  KEY `Protein_Has_PDB_fk2` (`pdbid`),
  CONSTRAINT `Protein_Has_PDB_fk1` FOREIGN KEY (`proteinid`) REFERENCES `Protein` (`proteinId`),
  CONSTRAINT `Protein_Has_PDB_fk2` FOREIGN KEY (`pdbid`) REFERENCES `PDB` (`pdbId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Protein_has_PDB`
--

LOCK TABLES `Protein_has_PDB` WRITE;
/*!40000 ALTER TABLE `Protein_has_PDB` DISABLE KEYS */;
/*!40000 ALTER TABLE `Protein_has_PDB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RobotAction`
--

DROP TABLE IF EXISTS `RobotAction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RobotAction` (
  `robotActionId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `blsessionId` int(11) unsigned NOT NULL,
  `blsampleId` int(11) unsigned DEFAULT NULL,
  `actionType` enum('LOAD','UNLOAD','DISPOSE','STORE','WASH','ANNEAL') DEFAULT NULL,
  `startTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endTimestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` enum('SUCCESS','ERROR','CRITICAL','WARNING','EPICSFAIL','COMMANDNOTSENT') DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `containerLocation` smallint(6) DEFAULT NULL,
  `dewarLocation` smallint(6) DEFAULT NULL,
  `sampleBarcode` varchar(45) DEFAULT NULL,
  `xtalSnapshotBefore` varchar(255) DEFAULT NULL,
  `xtalSnapshotAfter` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`robotActionId`),
  KEY `RobotAction_FK1` (`blsessionId`),
  KEY `RobotAction_FK2` (`blsampleId`),
  CONSTRAINT `RobotAction_FK1` FOREIGN KEY (`blsessionId`) REFERENCES `BLSession` (`sessionId`),
  CONSTRAINT `RobotAction_FK2` FOREIGN KEY (`blsampleId`) REFERENCES `BLSample` (`blSampleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Robot actions as reported by GDA';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RobotAction`
--

LOCK TABLES `RobotAction` WRITE;
/*!40000 ALTER TABLE `RobotAction` DISABLE KEYS */;
/*!40000 ALTER TABLE `RobotAction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Run`
--

DROP TABLE IF EXISTS `Run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Run` (
  `runId` int(10) NOT NULL AUTO_INCREMENT,
  `timePerFrame` varchar(45) DEFAULT NULL,
  `timeStart` varchar(45) DEFAULT NULL,
  `timeEnd` varchar(45) DEFAULT NULL,
  `storageTemperature` varchar(45) DEFAULT NULL,
  `exposureTemperature` varchar(45) DEFAULT NULL,
  `spectrophotometer` varchar(45) DEFAULT NULL,
  `energy` varchar(45) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `frameAverage` varchar(45) DEFAULT NULL,
  `frameCount` varchar(45) DEFAULT NULL,
  `transmission` varchar(45) DEFAULT NULL,
  `beamCenterX` varchar(45) DEFAULT NULL,
  `beamCenterY` varchar(45) DEFAULT NULL,
  `pixelSizeX` varchar(45) DEFAULT NULL,
  `pixelSizeY` varchar(45) DEFAULT NULL,
  `radiationRelative` varchar(45) DEFAULT NULL,
  `radiationAbsolute` varchar(45) DEFAULT NULL,
  `normalization` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`runId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Run`
--

LOCK TABLES `Run` WRITE;
/*!40000 ALTER TABLE `Run` DISABLE KEYS */;
/*!40000 ALTER TABLE `Run` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SAFETYREQUEST`
--

DROP TABLE IF EXISTS `SAFETYREQUEST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SAFETYREQUEST` (
  `SAFETYREQUESTID` decimal(10,0) DEFAULT NULL,
  `XMLDOCUMENTID` decimal(10,0) DEFAULT NULL,
  `PROTEINID` decimal(10,0) DEFAULT NULL,
  `PROJECTCODE` varchar(45) DEFAULT NULL,
  `SUBMISSIONDATE` datetime DEFAULT NULL,
  `RESPONSE` decimal(3,0) DEFAULT NULL,
  `REPONSEDATE` datetime DEFAULT NULL,
  `RESPONSEDETAILS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SAFETYREQUEST`
--

LOCK TABLES `SAFETYREQUEST` WRITE;
/*!40000 ALTER TABLE `SAFETYREQUEST` DISABLE KEYS */;
/*!40000 ALTER TABLE `SAFETYREQUEST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SAMPLECELL`
--

DROP TABLE IF EXISTS `SAMPLECELL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SAMPLECELL` (
  `SAMPLECELLID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `SAMPLEEXPOSUREUNITID` int(11) unsigned DEFAULT NULL,
  `ID` varchar(45) DEFAULT NULL,
  `NAME` varchar(45) DEFAULT NULL,
  `DIAMETER` varchar(45) DEFAULT NULL,
  `MATERIAL` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SAMPLECELLID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SAMPLECELL`
--

LOCK TABLES `SAMPLECELL` WRITE;
/*!40000 ALTER TABLE `SAMPLECELL` DISABLE KEYS */;
/*!40000 ALTER TABLE `SAMPLECELL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SAMPLEEXPOSUREUNIT`
--

DROP TABLE IF EXISTS `SAMPLEEXPOSUREUNIT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SAMPLEEXPOSUREUNIT` (
  `SAMPLEEXPOSUREUNITID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ID` varchar(45) DEFAULT NULL,
  `PATHLENGTH` varchar(45) DEFAULT NULL,
  `VOLUME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SAMPLEEXPOSUREUNITID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SAMPLEEXPOSUREUNIT`
--

LOCK TABLES `SAMPLEEXPOSUREUNIT` WRITE;
/*!40000 ALTER TABLE `SAMPLEEXPOSUREUNIT` DISABLE KEYS */;
/*!40000 ALTER TABLE `SAMPLEEXPOSUREUNIT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SAXSDATACOLLECTIONGROUP`
--

DROP TABLE IF EXISTS `SAXSDATACOLLECTIONGROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SAXSDATACOLLECTIONGROUP` (
  `DATACOLLECTIONGROUPID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `DEFAULTDATAACQUISITIONID` int(11) unsigned DEFAULT NULL,
  `SAXSDATACOLLECTIONARRAYID` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`DATACOLLECTIONGROUPID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SAXSDATACOLLECTIONGROUP`
--

LOCK TABLES `SAXSDATACOLLECTIONGROUP` WRITE;
/*!40000 ALTER TABLE `SAXSDATACOLLECTIONGROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `SAXSDATACOLLECTIONGROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SafetyLevel`
--

DROP TABLE IF EXISTS `SafetyLevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SafetyLevel` (
  `safetyLevelId` int(10) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`safetyLevelId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SafetyLevel`
--

LOCK TABLES `SafetyLevel` WRITE;
/*!40000 ALTER TABLE `SafetyLevel` DISABLE KEYS */;
/*!40000 ALTER TABLE `SafetyLevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SamplePlate`
--

DROP TABLE IF EXISTS `SamplePlate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SamplePlate` (
  `samplePlateId` int(10) NOT NULL AUTO_INCREMENT,
  `BLSESSIONID` int(11) unsigned DEFAULT NULL,
  `plateGroupId` int(10) DEFAULT NULL,
  `plateTypeId` int(10) DEFAULT NULL,
  `instructionSetId` int(10) DEFAULT NULL,
  `boxId` int(10) unsigned DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `slotPositionRow` varchar(45) DEFAULT NULL,
  `slotPositionColumn` varchar(45) DEFAULT NULL,
  `storageTemperature` varchar(45) DEFAULT NULL,
  `experimentId` int(10) NOT NULL,
  PRIMARY KEY (`samplePlateId`),
  KEY `PlateToPtateGroup` (`plateGroupId`),
  KEY `SamplePlateToExperiment` (`experimentId`),
  KEY `SamplePlateToInstructionSet` (`instructionSetId`),
  KEY `SamplePlateToType` (`plateTypeId`),
  CONSTRAINT `PlateToPtateGroup` FOREIGN KEY (`plateGroupId`) REFERENCES `PlateGroup` (`plateGroupId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SamplePlateToExperiment` FOREIGN KEY (`experimentId`) REFERENCES `Experiment` (`experimentId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SamplePlateToInstructionSet` FOREIGN KEY (`instructionSetId`) REFERENCES `InstructionSet` (`instructionSetId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SamplePlateToType` FOREIGN KEY (`plateTypeId`) REFERENCES `PlateType` (`PlateTypeId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SamplePlate`
--

LOCK TABLES `SamplePlate` WRITE;
/*!40000 ALTER TABLE `SamplePlate` DISABLE KEYS */;
/*!40000 ALTER TABLE `SamplePlate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SamplePlatePosition`
--

DROP TABLE IF EXISTS `SamplePlatePosition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SamplePlatePosition` (
  `samplePlatePositionId` int(10) NOT NULL AUTO_INCREMENT,
  `samplePlateId` int(10) NOT NULL,
  `rowNumber` int(11) DEFAULT NULL,
  `columnNumber` int(11) DEFAULT NULL,
  `volume` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`samplePlatePositionId`),
  KEY `PlatePositionToPlate` (`samplePlateId`),
  CONSTRAINT `PlatePositionToPlate` FOREIGN KEY (`samplePlateId`) REFERENCES `SamplePlate` (`samplePlateId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SamplePlatePosition`
--

LOCK TABLES `SamplePlatePosition` WRITE;
/*!40000 ALTER TABLE `SamplePlatePosition` DISABLE KEYS */;
/*!40000 ALTER TABLE `SamplePlatePosition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SaxsDataCollection`
--

DROP TABLE IF EXISTS `SaxsDataCollection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SaxsDataCollection` (
  `dataCollectionId` int(10) NOT NULL AUTO_INCREMENT,
  `BLSESSIONID` int(11) unsigned DEFAULT NULL,
  `experimentId` int(10) NOT NULL,
  `comments` varchar(5120) DEFAULT NULL,
  PRIMARY KEY (`dataCollectionId`),
  KEY `SaxsDataCollectionToExperiment` (`experimentId`),
  CONSTRAINT `SaxsDataCollectionToExperiment` FOREIGN KEY (`experimentId`) REFERENCES `Experiment` (`experimentId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SaxsDataCollection`
--

LOCK TABLES `SaxsDataCollection` WRITE;
/*!40000 ALTER TABLE `SaxsDataCollection` DISABLE KEYS */;
/*!40000 ALTER TABLE `SaxsDataCollection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Schedule`
--

DROP TABLE IF EXISTS `Schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Schedule` (
  `scheduleId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`scheduleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Schedule`
--

LOCK TABLES `Schedule` WRITE;
/*!40000 ALTER TABLE `Schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `Schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScheduleComponent`
--

DROP TABLE IF EXISTS `ScheduleComponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScheduleComponent` (
  `scheduleComponentId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `scheduleId` int(11) unsigned NOT NULL,
  `offset_hours` int(11) DEFAULT NULL,
  `inspectionTypeId` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`scheduleComponentId`),
  KEY `ScheduleComponent_idx1` (`scheduleId`),
  KEY `ScheduleComponent_fk2` (`inspectionTypeId`),
  CONSTRAINT `ScheduleComponent_fk1` FOREIGN KEY (`scheduleId`) REFERENCES `Schedule` (`scheduleId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ScheduleComponent_fk2` FOREIGN KEY (`inspectionTypeId`) REFERENCES `InspectionType` (`inspectionTypeId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScheduleComponent`
--

LOCK TABLES `ScheduleComponent` WRITE;
/*!40000 ALTER TABLE `ScheduleComponent` DISABLE KEYS */;
/*!40000 ALTER TABLE `ScheduleComponent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Screen`
--

DROP TABLE IF EXISTS `Screen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Screen` (
  `screenId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `proposalId` int(10) unsigned DEFAULT NULL,
  `global` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`screenId`),
  KEY `Screen_fk1` (`proposalId`),
  CONSTRAINT `Screen_fk1` FOREIGN KEY (`proposalId`) REFERENCES `Proposal` (`proposalId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Screen`
--

LOCK TABLES `Screen` WRITE;
/*!40000 ALTER TABLE `Screen` DISABLE KEYS */;
/*!40000 ALTER TABLE `Screen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScreenComponent`
--

DROP TABLE IF EXISTS `ScreenComponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScreenComponent` (
  `screenComponentId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `screenComponentGroupId` int(11) unsigned NOT NULL,
  `componentId` int(11) unsigned DEFAULT NULL,
  `concentration` float DEFAULT NULL,
  `pH` float DEFAULT NULL,
  PRIMARY KEY (`screenComponentId`),
  KEY `ScreenComponent_fk1` (`screenComponentGroupId`),
  KEY `ScreenComponent_fk2` (`componentId`),
  CONSTRAINT `ScreenComponent_fk1` FOREIGN KEY (`screenComponentGroupId`) REFERENCES `ScreenComponentGroup` (`screenComponentGroupId`),
  CONSTRAINT `ScreenComponent_fk2` FOREIGN KEY (`componentId`) REFERENCES `Protein` (`proteinId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScreenComponent`
--

LOCK TABLES `ScreenComponent` WRITE;
/*!40000 ALTER TABLE `ScreenComponent` DISABLE KEYS */;
/*!40000 ALTER TABLE `ScreenComponent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScreenComponentGroup`
--

DROP TABLE IF EXISTS `ScreenComponentGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScreenComponentGroup` (
  `screenComponentGroupId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `screenId` int(11) unsigned NOT NULL,
  `position` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`screenComponentGroupId`),
  KEY `ScreenComponentGroup_fk1` (`screenId`),
  CONSTRAINT `ScreenComponentGroup_fk1` FOREIGN KEY (`screenId`) REFERENCES `Screen` (`screenId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScreenComponentGroup`
--

LOCK TABLES `ScreenComponentGroup` WRITE;
/*!40000 ALTER TABLE `ScreenComponentGroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `ScreenComponentGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Screening`
--

DROP TABLE IF EXISTS `Screening`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Screening` (
  `screeningId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dataCollectionId` int(11) unsigned NOT NULL DEFAULT '0',
  `bltimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `programVersion` varchar(45) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `shortComments` varchar(20) DEFAULT NULL,
  `diffractionPlanId` int(10) unsigned DEFAULT NULL COMMENT 'references DiffractionPlan',
  `xmlSampleInformation` longblob,
  PRIMARY KEY (`screeningId`),
  KEY `DNAScreening_FKIndex1` (`dataCollectionId`),
  KEY `Screening_FKIndexDiffractionPlanId` (`diffractionPlanId`)
) ENGINE=InnoDB AUTO_INCREMENT=1927991 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Screening`
--

LOCK TABLES `Screening` WRITE;
/*!40000 ALTER TABLE `Screening` DISABLE KEYS */;
INSERT INTO `Screening` VALUES (1894770,1052494,'2016-04-13 11:19:21','mosflm',NULL,'Mosflm native',NULL,NULL),(1894773,1052494,'2016-04-13 11:19:21','mosflm',NULL,'Mosflm anomalous',NULL,NULL),(1894774,1052494,'2016-04-13 11:19:24','EDNA MXv1','Standard Native Dataset Multiplicity=3 I/sig=2 Maxlifespan=202 s','EDNAStrategy1',NULL,NULL),(1894777,1052494,'2016-04-13 11:19:27','EDNA MXv1','strategy with target multiplicity=16, target I/sig=2 Maxlifespan=202 s','EDNAStrategy3',NULL,NULL),(1894780,1052494,'2016-04-13 11:19:29','EDNA MXv1','Gentle: Target Multiplicity=2 and target I/Sig 2 and Maxlifespan=20 s','EDNAStrategy4',NULL,NULL),(1894783,1052494,'2016-04-13 11:19:33','EDNA MXv1','Standard Anomalous Dataset Multiplicity=3 I/sig=2 Maxlifespan=202 s','EDNAStrategy2',NULL,NULL),(1894786,1052494,'2016-04-13 11:19:34','EDNA MXv1','UnderDEV Anomalous Dataset, RadDamage of standard protein','EDNAStrategy5',NULL,NULL),(1894807,1052503,'2016-04-13 11:22:30','EDNA MXv1','strategy with target multiplicity=16, target I/sig=2 Maxlifespan=202 s','EDNAStrategy3',NULL,NULL),(1894810,1052503,'2016-04-13 11:22:34','EDNA MXv1','Standard Anomalous Dataset Multiplicity=3 I/sig=2 Maxlifespan=202 s','EDNAStrategy2',NULL,NULL),(1894812,1052503,'2016-04-13 11:22:36','mosflm',NULL,'Mosflm native',NULL,NULL),(1894815,1052503,'2016-04-13 11:22:36','mosflm',NULL,'Mosflm anomalous',NULL,NULL),(1894816,1052503,'2016-04-13 11:22:39','EDNA MXv1','Gentle: Target Multiplicity=2 and target I/Sig 2 and Maxlifespan=20 s','EDNAStrategy4',NULL,NULL),(1894819,1052503,'2016-04-13 11:22:39','EDNA MXv1','UnderDEV Anomalous Dataset, RadDamage of standard protein','EDNAStrategy5',NULL,NULL),(1894822,1052503,'2016-04-13 11:22:44','EDNA MXv1','Standard Native Dataset Multiplicity=3 I/sig=2 Maxlifespan=202 s','EDNAStrategy1',NULL,NULL),(1927968,1066786,'2016-04-18 10:05:24','mosflm',NULL,'Mosflm native',NULL,NULL),(1927971,1066786,'2016-04-18 10:05:24','mosflm',NULL,'Mosflm anomalous',NULL,NULL),(1927972,1066786,'2016-04-18 10:05:27','EDNA MXv1','Standard Native Dataset Multiplicity=3 I/sig=2 Maxlifespan=4034 s','EDNAStrategy1',NULL,NULL),(1927981,1066786,'2016-04-18 10:05:45','EDNA MXv1','Gentle: Target Multiplicity=2 and target I/Sig 2 and Maxlifespan=403 s','EDNAStrategy4',NULL,NULL),(1927984,1066786,'2016-04-18 10:05:48','EDNA MXv1','strategy with target multiplicity=16, target I/sig=2 Maxlifespan=4034 s','EDNAStrategy3',NULL,NULL),(1927987,1066786,'2016-04-18 10:05:50','EDNA MXv1','Standard Anomalous Dataset Multiplicity=3 I/sig=2 Maxlifespan=4034 s','EDNAStrategy2',NULL,NULL),(1927990,1066786,'2016-04-18 10:05:51','EDNA MXv1','UnderDEV Anomalous Dataset, RadDamage of standard protein','EDNAStrategy5',NULL,NULL);
/*!40000 ALTER TABLE `Screening` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScreeningInput`
--

DROP TABLE IF EXISTS `ScreeningInput`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScreeningInput` (
  `screeningInputId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `screeningId` int(10) unsigned NOT NULL DEFAULT '0',
  `beamX` float DEFAULT NULL,
  `beamY` float DEFAULT NULL,
  `rmsErrorLimits` float DEFAULT NULL,
  `minimumFractionIndexed` float DEFAULT NULL,
  `maximumFractionRejected` float DEFAULT NULL,
  `minimumSignalToNoise` float DEFAULT NULL,
  `diffractionPlanId` int(10) DEFAULT NULL COMMENT 'references DiffractionPlan table',
  `xmlSampleInformation` longblob,
  PRIMARY KEY (`screeningInputId`),
  KEY `ScreeningInput_FKIndex1` (`screeningId`),
  CONSTRAINT `ScreeningInput_ibfk_1` FOREIGN KEY (`screeningId`) REFERENCES `Screening` (`screeningId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1013165 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScreeningInput`
--

LOCK TABLES `ScreeningInput` WRITE;
/*!40000 ALTER TABLE `ScreeningInput` DISABLE KEYS */;
INSERT INTO `ScreeningInput` VALUES (983791,1894774,208.731,214.298,NULL,NULL,NULL,NULL,NULL,NULL),(983794,1894777,208.731,214.298,NULL,NULL,NULL,NULL,NULL,NULL),(983797,1894780,208.731,214.298,NULL,NULL,NULL,NULL,NULL,NULL),(983800,1894783,208.731,214.298,NULL,NULL,NULL,NULL,NULL,NULL),(983803,1894786,208.731,214.298,NULL,NULL,NULL,NULL,NULL,NULL),(983821,1894807,208.32,214.339,NULL,NULL,NULL,NULL,NULL,NULL),(983824,1894810,208.32,214.339,NULL,NULL,NULL,NULL,NULL,NULL),(983827,1894816,208.32,214.339,NULL,NULL,NULL,NULL,NULL,NULL),(983830,1894819,208.32,214.339,NULL,NULL,NULL,NULL,NULL,NULL),(983833,1894822,208.32,214.339,NULL,NULL,NULL,NULL,NULL,NULL),(1013146,1927972,208.32,214.339,NULL,NULL,NULL,NULL,NULL,NULL),(1013155,1927981,208.32,214.339,NULL,NULL,NULL,NULL,NULL,NULL),(1013158,1927984,208.32,214.339,NULL,NULL,NULL,NULL,NULL,NULL),(1013161,1927987,208.32,214.339,NULL,NULL,NULL,NULL,NULL,NULL),(1013164,1927990,208.32,214.339,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ScreeningInput` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScreeningOutput`
--

DROP TABLE IF EXISTS `ScreeningOutput`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScreeningOutput` (
  `screeningOutputId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `screeningId` int(10) unsigned NOT NULL DEFAULT '0',
  `statusDescription` varchar(1024) DEFAULT NULL,
  `rejectedReflections` int(10) unsigned DEFAULT NULL,
  `resolutionObtained` float DEFAULT NULL,
  `spotDeviationR` float DEFAULT NULL,
  `spotDeviationTheta` float DEFAULT NULL,
  `beamShiftX` float DEFAULT NULL,
  `beamShiftY` float DEFAULT NULL,
  `numSpotsFound` int(10) unsigned DEFAULT NULL,
  `numSpotsUsed` int(10) unsigned DEFAULT NULL,
  `numSpotsRejected` int(10) unsigned DEFAULT NULL,
  `mosaicity` float DEFAULT NULL,
  `iOverSigma` float DEFAULT NULL,
  `diffractionRings` tinyint(1) DEFAULT NULL,
  `SCREENINGSUCCESS` tinyint(1) DEFAULT '0' COMMENT 'Column to be deleted',
  `mosaicityEstimated` tinyint(1) NOT NULL DEFAULT '0',
  `rankingResolution` double DEFAULT NULL,
  `program` varchar(45) DEFAULT NULL,
  `doseTotal` double DEFAULT NULL,
  `totalExposureTime` double DEFAULT NULL,
  `totalRotationRange` double DEFAULT NULL,
  `totalNumberOfImages` int(11) DEFAULT NULL,
  `rFriedel` double DEFAULT NULL,
  `indexingSuccess` tinyint(1) NOT NULL DEFAULT '0',
  `strategySuccess` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`screeningOutputId`),
  KEY `ScreeningOutput_FKIndex1` (`screeningId`),
  CONSTRAINT `ScreeningOutput_ibfk_1` FOREIGN KEY (`screeningId`) REFERENCES `Screening` (`screeningId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1522619 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScreeningOutput`
--

LOCK TABLES `ScreeningOutput` WRITE;
/*!40000 ALTER TABLE `ScreeningOutput` DISABLE KEYS */;
INSERT INTO `ScreeningOutput` VALUES (1489401,1894770,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(1489404,1894773,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(1489405,1894774,'Labelit: Indexing successful (I23). Integration successful. Strategy calculation successful.',NULL,NULL,0.197,NULL,-0.0094,-0.0618,303,303,0,1.2,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(1489408,1894777,'Labelit: Indexing successful (I23). Integration successful. Strategy calculation successful.',NULL,NULL,0.197,NULL,-0.0094,-0.0618,303,303,0,1.2,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(1489411,1894780,'Labelit: Indexing successful (I23). Integration successful. Strategy calculation successful.',NULL,NULL,0.197,NULL,-0.0094,-0.0618,303,303,0,1.2,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(1489414,1894783,'Labelit: Indexing successful (I23). Integration successful. Strategy calculation successful.',NULL,NULL,0.197,NULL,-0.0094,-0.0618,303,303,0,1.2,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(1489417,1894786,'Labelit: Indexing successful (I23). Integration successful. Strategy calculation successful.',NULL,NULL,0.197,NULL,-0.0094,-0.0618,303,303,0,1.2,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(1489438,1894807,'Labelit: Indexing successful (I23). Integration successful. Strategy calculation successful.',NULL,NULL,0.184,NULL,0.0495,-0.0405,294,294,0,1.35,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(1489441,1894810,'Labelit: Indexing successful (I23). Integration successful. Strategy calculation successful.',NULL,NULL,0.184,NULL,0.0495,-0.0405,294,294,0,1.35,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(1489443,1894812,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.6,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(1489446,1894815,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.6,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(1489447,1894816,'Labelit: Indexing successful (I23). Integration successful. Strategy calculation successful.',NULL,NULL,0.184,NULL,0.0495,-0.0405,294,294,0,1.35,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(1489450,1894819,'Labelit: Indexing successful (I23). Integration successful. Strategy calculation successful.',NULL,NULL,0.184,NULL,0.0495,-0.0405,294,294,0,1.35,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(1489453,1894822,'Labelit: Indexing successful (I23). Integration successful. Strategy calculation successful.',NULL,NULL,0.184,NULL,0.0495,-0.0405,294,294,0,1.35,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(1522596,1927968,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.8,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(1522599,1927971,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.8,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(1522600,1927972,'Labelit: Indexing successful (P4). Integration successful. Strategy calculation successful.',NULL,NULL,0.166,NULL,0.0195,-0.0105,434,434,0,0.7,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(1522609,1927981,'Labelit: Indexing successful (P4). Integration successful. Strategy calculation successful.',NULL,NULL,0.166,NULL,0.0195,-0.0105,434,434,0,0.7,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(1522612,1927984,'Labelit: Indexing successful (P4). Integration successful. Strategy calculation successful.',NULL,NULL,0.166,NULL,0.0195,-0.0105,434,434,0,0.7,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(1522615,1927987,'Labelit: Indexing successful (P4). Integration successful. Strategy calculation successful.',NULL,NULL,0.166,NULL,0.0195,-0.0105,434,434,0,0.7,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(1522618,1927990,'Labelit: Indexing successful (P4). Integration successful. Strategy calculation successful.',NULL,NULL,0.166,NULL,0.0195,-0.0105,434,434,0,0.7,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0);
/*!40000 ALTER TABLE `ScreeningOutput` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScreeningOutputLattice`
--

DROP TABLE IF EXISTS `ScreeningOutputLattice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScreeningOutputLattice` (
  `screeningOutputLatticeId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `screeningOutputId` int(10) unsigned NOT NULL DEFAULT '0',
  `spaceGroup` varchar(45) DEFAULT NULL,
  `pointGroup` varchar(45) DEFAULT NULL,
  `bravaisLattice` varchar(45) DEFAULT NULL,
  `rawOrientationMatrix_a_x` float DEFAULT NULL,
  `rawOrientationMatrix_a_y` float DEFAULT NULL,
  `rawOrientationMatrix_a_z` float DEFAULT NULL,
  `rawOrientationMatrix_b_x` float DEFAULT NULL,
  `rawOrientationMatrix_b_y` float DEFAULT NULL,
  `rawOrientationMatrix_b_z` float DEFAULT NULL,
  `rawOrientationMatrix_c_x` float DEFAULT NULL,
  `rawOrientationMatrix_c_y` float DEFAULT NULL,
  `rawOrientationMatrix_c_z` float DEFAULT NULL,
  `unitCell_a` float DEFAULT NULL,
  `unitCell_b` float DEFAULT NULL,
  `unitCell_c` float DEFAULT NULL,
  `unitCell_alpha` float DEFAULT NULL,
  `unitCell_beta` float DEFAULT NULL,
  `unitCell_gamma` float DEFAULT NULL,
  `bltimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `labelitIndexing` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`screeningOutputLatticeId`),
  KEY `ScreeningOutputLattice_FKIndex1` (`screeningOutputId`),
  CONSTRAINT `ScreeningOutputLattice_ibfk_1` FOREIGN KEY (`screeningOutputId`) REFERENCES `ScreeningOutput` (`screeningOutputId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScreeningOutputLattice`
--

LOCK TABLES `ScreeningOutputLattice` WRITE;
/*!40000 ALTER TABLE `ScreeningOutputLattice` DISABLE KEYS */;
/*!40000 ALTER TABLE `ScreeningOutputLattice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScreeningRank`
--

DROP TABLE IF EXISTS `ScreeningRank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScreeningRank` (
  `screeningRankId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `screeningRankSetId` int(10) unsigned NOT NULL DEFAULT '0',
  `screeningId` int(10) unsigned NOT NULL DEFAULT '0',
  `rankValue` float DEFAULT NULL,
  `rankInformation` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`screeningRankId`),
  KEY `ScreeningRank_FKIndex1` (`screeningId`),
  KEY `ScreeningRank_FKIndex2` (`screeningRankSetId`),
  CONSTRAINT `ScreeningRank_ibfk_1` FOREIGN KEY (`screeningId`) REFERENCES `Screening` (`screeningId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ScreeningRank_ibfk_2` FOREIGN KEY (`screeningRankSetId`) REFERENCES `ScreeningRankSet` (`screeningRankSetId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScreeningRank`
--

LOCK TABLES `ScreeningRank` WRITE;
/*!40000 ALTER TABLE `ScreeningRank` DISABLE KEYS */;
/*!40000 ALTER TABLE `ScreeningRank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScreeningRankSet`
--

DROP TABLE IF EXISTS `ScreeningRankSet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScreeningRankSet` (
  `screeningRankSetId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rankEngine` varchar(255) DEFAULT NULL,
  `rankingProjectFileName` varchar(255) DEFAULT NULL,
  `rankingSummaryFileName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`screeningRankSetId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScreeningRankSet`
--

LOCK TABLES `ScreeningRankSet` WRITE;
/*!40000 ALTER TABLE `ScreeningRankSet` DISABLE KEYS */;
/*!40000 ALTER TABLE `ScreeningRankSet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScreeningStrategy`
--

DROP TABLE IF EXISTS `ScreeningStrategy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScreeningStrategy` (
  `screeningStrategyId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `screeningOutputId` int(10) unsigned NOT NULL DEFAULT '0',
  `phiStart` float DEFAULT NULL,
  `phiEnd` float DEFAULT NULL,
  `rotation` float DEFAULT NULL,
  `exposureTime` float DEFAULT NULL,
  `resolution` float DEFAULT NULL,
  `completeness` float DEFAULT NULL,
  `multiplicity` float DEFAULT NULL,
  `anomalous` tinyint(1) NOT NULL DEFAULT '0',
  `program` varchar(45) DEFAULT NULL,
  `rankingResolution` float DEFAULT NULL,
  `transmission` float DEFAULT NULL COMMENT 'Transmission for the strategy as given by the strategy program.',
  PRIMARY KEY (`screeningStrategyId`),
  KEY `ScreeningStrategy_FKIndex1` (`screeningOutputId`),
  CONSTRAINT `ScreeningStrategy_ibfk_1` FOREIGN KEY (`screeningOutputId`) REFERENCES `ScreeningOutput` (`screeningOutputId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1507124 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScreeningStrategy`
--

LOCK TABLES `ScreeningStrategy` WRITE;
/*!40000 ALTER TABLE `ScreeningStrategy` DISABLE KEYS */;
INSERT INTO `ScreeningStrategy` VALUES (1473909,1489401,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'mosflm - native',NULL,NULL),(1473912,1489404,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'mosflm - anomalous',NULL,NULL),(1473913,1489405,NULL,NULL,NULL,0.428,NULL,NULL,NULL,0,'BEST',1.41,NULL),(1473916,1489408,NULL,NULL,NULL,0.112,NULL,NULL,NULL,0,'BEST',1.41,NULL),(1473919,1489411,NULL,NULL,NULL,0.049,NULL,NULL,NULL,0,'BEST',1.49,NULL),(1473922,1489414,NULL,NULL,NULL,0.365,NULL,NULL,NULL,1,'BEST',1.41,NULL),(1473925,1489417,NULL,NULL,NULL,0.365,NULL,NULL,NULL,1,'BEST',1.41,NULL),(1473946,1489438,NULL,NULL,NULL,0.073,NULL,NULL,NULL,0,'BEST',1.44,NULL),(1473949,1489441,NULL,NULL,NULL,0.333,NULL,NULL,NULL,1,'BEST',1.47,NULL),(1473951,1489443,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'mosflm - native',NULL,NULL),(1473954,1489446,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'mosflm - anomalous',NULL,NULL),(1473955,1489447,NULL,NULL,NULL,0.086,NULL,NULL,NULL,0,'BEST',1.57,NULL),(1473958,1489450,NULL,NULL,NULL,0.333,NULL,NULL,NULL,1,'BEST',1.47,NULL),(1473961,1489453,NULL,NULL,NULL,0.296,NULL,NULL,NULL,0,'BEST',1.44,NULL),(1507101,1522596,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'mosflm - native',NULL,NULL),(1507104,1522599,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'mosflm - anomalous',NULL,NULL),(1507105,1522600,NULL,NULL,NULL,0.01,NULL,NULL,NULL,0,'BEST',1.13,NULL),(1507114,1522609,NULL,NULL,NULL,0.01,NULL,NULL,NULL,0,'BEST',1.23,NULL),(1507117,1522612,NULL,NULL,NULL,0.01,NULL,NULL,NULL,0,'BEST',1.14,NULL),(1507120,1522615,NULL,NULL,NULL,0.01,NULL,NULL,NULL,1,'BEST',1.16,NULL),(1507123,1522618,NULL,NULL,NULL,0.01,NULL,NULL,NULL,1,'BEST',1.16,NULL);
/*!40000 ALTER TABLE `ScreeningStrategy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScreeningStrategySubWedge`
--

DROP TABLE IF EXISTS `ScreeningStrategySubWedge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScreeningStrategySubWedge` (
  `screeningStrategySubWedgeId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `screeningStrategyWedgeId` int(10) unsigned DEFAULT NULL COMMENT 'Foreign key to parent table',
  `subWedgeNumber` int(10) unsigned DEFAULT NULL COMMENT 'The number of this subwedge within the wedge',
  `rotationAxis` varchar(45) DEFAULT NULL COMMENT 'Angle where subwedge starts',
  `axisStart` float DEFAULT NULL COMMENT 'Angle where subwedge ends',
  `axisEnd` float DEFAULT NULL COMMENT 'Exposure time for subwedge',
  `exposureTime` float DEFAULT NULL COMMENT 'Transmission for subwedge',
  `transmission` float DEFAULT NULL,
  `oscillationRange` float DEFAULT NULL,
  `completeness` float DEFAULT NULL,
  `multiplicity` float DEFAULT NULL,
  `RESOLUTION` float DEFAULT NULL,
  `doseTotal` float DEFAULT NULL COMMENT 'Total dose for this subwedge',
  `numberOfImages` int(10) unsigned DEFAULT NULL COMMENT 'Number of images for this subwedge',
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`screeningStrategySubWedgeId`),
  KEY `ScreeningStrategySubWedge_FK1` (`screeningStrategyWedgeId`),
  CONSTRAINT `ScreeningStrategySubWedge_FK1` FOREIGN KEY (`screeningStrategyWedgeId`) REFERENCES `ScreeningStrategyWedge` (`screeningStrategyWedgeId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1123988 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScreeningStrategySubWedge`
--

LOCK TABLES `ScreeningStrategySubWedge` WRITE;
/*!40000 ALTER TABLE `ScreeningStrategySubWedge` DISABLE KEYS */;
INSERT INTO `ScreeningStrategySubWedge` VALUES (1111566,1143792,NULL,'Omega',64,109,0,NULL,1.4,1,NULL,1.22,NULL,33,NULL),(1111569,1143795,NULL,'Omega',74,119,0,NULL,1.4,0.98,NULL,1.22,NULL,33,NULL),(1111570,1143796,1,'Omega',7,40,0.428,100,0.15,1,4.07,1.41,NULL,220,NULL),(1111573,1143799,1,'Omega',30,160.05,0.112,100,0.15,1,16.02,1.41,NULL,867,NULL),(1111576,1143802,1,'Omega',93,123.15,0.049,100,0.15,1,3.71,1.49,NULL,202,NULL),(1111579,1143805,1,'Omega',225,273,0.365,100,0.1,0.997,3.08,1.41,NULL,480,NULL),(1111582,1143808,1,'Omega',225,273,0.365,100,0.1,0.997,3.08,1.41,NULL,480,NULL),(1111603,1143829,1,'Omega',42,171,0.073,100,0.15,1,15.93,1.51,NULL,860,NULL),(1111606,1143832,1,'Omega',39,91.05,0.333,100,0.15,0.999,3.35,1.51,NULL,347,NULL),(1111608,1143834,NULL,'Omega',265,355,0,NULL,0.2,0.99,NULL,1.47,NULL,450,NULL),(1111611,1143837,NULL,'Omega',265,355,0,NULL,0.2,0.92,NULL,1.47,NULL,450,NULL),(1111612,1143838,1,'Omega',7,39.1,0.086,100,0.15,1,3.95,1.57,NULL,215,NULL),(1111615,1143841,1,'Omega',39,91.05,0.333,100,0.15,0.999,3.35,1.51,NULL,347,NULL),(1111618,1143844,1,'Omega',144,175.05,0.296,100,0.15,1,3.83,1.51,NULL,208,NULL),(1123965,1156191,NULL,'Omega',48,93,0,NULL,0.5,0.99,NULL,1.47,NULL,90,NULL),(1123968,1156194,NULL,'Omega',43,88,0,NULL,0.5,0.93,NULL,1.47,NULL,90,NULL),(1123969,1156195,1,'Omega',9,88,0.01,71.7436,0.1,0.999,3.34,1.51,NULL,790,NULL),(1123978,1156204,1,'Omega',10,88,0.01,72.4236,0.1,0.999,3.3,1.51,NULL,780,NULL),(1123981,1156207,1,'Omega',0,360,0.01,16.1595,0.1,1,15.21,1.51,NULL,3600,NULL),(1123984,1156210,1,'Omega',87,239,0.01,72.2048,0.1,0.99,3.29,1.51,NULL,1520,NULL),(1123987,1156213,1,'Omega',87,239,0.01,72.2048,0.1,0.99,3.29,1.51,NULL,1520,NULL);
/*!40000 ALTER TABLE `ScreeningStrategySubWedge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScreeningStrategyWedge`
--

DROP TABLE IF EXISTS `ScreeningStrategyWedge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScreeningStrategyWedge` (
  `screeningStrategyWedgeId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `screeningStrategyId` int(10) unsigned DEFAULT NULL COMMENT 'Foreign key to parent table',
  `wedgeNumber` int(10) unsigned DEFAULT NULL COMMENT 'The number of this wedge within the strategy',
  `resolution` float DEFAULT NULL,
  `completeness` float DEFAULT NULL,
  `multiplicity` float DEFAULT NULL,
  `doseTotal` float DEFAULT NULL COMMENT 'Total dose for this wedge',
  `numberOfImages` int(10) unsigned DEFAULT NULL COMMENT 'Number of images for this wedge',
  `phi` float DEFAULT NULL,
  `kappa` float DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `wavelength` double DEFAULT NULL,
  PRIMARY KEY (`screeningStrategyWedgeId`),
  KEY `ScreeningStrategyWedge_IBFK_1` (`screeningStrategyId`),
  CONSTRAINT `ScreeningStrategyWedge_IBFK_1` FOREIGN KEY (`screeningStrategyId`) REFERENCES `ScreeningStrategy` (`screeningStrategyId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1156214 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScreeningStrategyWedge`
--

LOCK TABLES `ScreeningStrategyWedge` WRITE;
/*!40000 ALTER TABLE `ScreeningStrategyWedge` DISABLE KEYS */;
INSERT INTO `ScreeningStrategyWedge` VALUES (1143792,1473909,1,1.22,1,NULL,NULL,33,NULL,NULL,NULL,NULL),(1143795,1473912,1,1.22,0.98,NULL,NULL,33,NULL,NULL,NULL,NULL),(1143796,1473913,1,1.41,1,4.07,0,220,NULL,NULL,NULL,NULL),(1143799,1473916,1,1.41,1,16.02,0,867,NULL,NULL,NULL,NULL),(1143802,1473919,1,1.49,1,3.71,0,202,NULL,NULL,NULL,NULL),(1143805,1473922,1,1.41,0.997,3.08,0,480,NULL,NULL,NULL,NULL),(1143808,1473925,1,1.41,0.997,3.08,0,480,NULL,NULL,NULL,NULL),(1143829,1473946,1,1.51,1,15.93,0,860,NULL,NULL,NULL,NULL),(1143832,1473949,1,1.51,0.999,3.35,0,347,NULL,NULL,NULL,NULL),(1143834,1473951,1,1.47,0.99,NULL,NULL,450,NULL,NULL,NULL,NULL),(1143837,1473954,1,1.47,0.92,NULL,NULL,450,NULL,NULL,NULL,NULL),(1143838,1473955,1,1.57,1,3.95,0,215,NULL,NULL,NULL,NULL),(1143841,1473958,1,1.51,0.999,3.35,0,347,NULL,NULL,NULL,NULL),(1143844,1473961,1,1.51,1,3.83,0,208,NULL,NULL,NULL,NULL),(1156191,1507101,1,1.47,0.99,NULL,NULL,90,NULL,NULL,NULL,NULL),(1156194,1507104,1,1.47,0.93,NULL,NULL,90,NULL,NULL,NULL,NULL),(1156195,1507105,1,1.51,0.999,3.34,0,790,NULL,NULL,NULL,NULL),(1156204,1507114,1,1.51,0.999,3.3,0,780,NULL,NULL,NULL,NULL),(1156207,1507117,1,1.51,1,15.21,0,3600,NULL,NULL,NULL,NULL),(1156210,1507120,1,1.51,0.99,3.29,0,1520,NULL,NULL,NULL,NULL),(1156213,1507123,1,1.51,0.99,3.29,0,1520,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ScreeningStrategyWedge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SessionType`
--

DROP TABLE IF EXISTS `SessionType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SessionType` (
  `sessionTypeId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sessionId` int(10) unsigned NOT NULL,
  `typeName` varchar(31) NOT NULL,
  PRIMARY KEY (`sessionTypeId`),
  KEY `SessionType_FKIndex1` (`sessionId`),
  CONSTRAINT `SessionType_ibfk_1` FOREIGN KEY (`sessionId`) REFERENCES `BLSession` (`sessionId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SessionType`
--

LOCK TABLES `SessionType` WRITE;
/*!40000 ALTER TABLE `SessionType` DISABLE KEYS */;
/*!40000 ALTER TABLE `SessionType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Session_has_Person`
--

DROP TABLE IF EXISTS `Session_has_Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Session_has_Person` (
  `sessionId` int(10) unsigned NOT NULL DEFAULT '0',
  `personId` int(10) unsigned NOT NULL DEFAULT '0',
  `role` enum('Local Contact','Local Contact 2','Staff','Team Leader','Co-Investigator','Principal Investigator','Alternate Contact','Data Access') DEFAULT NULL,
  PRIMARY KEY (`sessionId`,`personId`),
  KEY `Session_has_Person_FKIndex1` (`sessionId`),
  KEY `Session_has_Person_FKIndex2` (`personId`),
  CONSTRAINT `Session_has_Person_ibfk_1` FOREIGN KEY (`sessionId`) REFERENCES `BLSession` (`sessionId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Session_has_Person_ibfk_2` FOREIGN KEY (`personId`) REFERENCES `Person` (`personId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Session_has_Person`
--

LOCK TABLES `Session_has_Person` WRITE;
/*!40000 ALTER TABLE `Session_has_Person` DISABLE KEYS */;
INSERT INTO `Session_has_Person` VALUES (55167,1,'Co-Investigator'),(55168,1,'Co-Investigator');
/*!40000 ALTER TABLE `Session_has_Person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shipping`
--

DROP TABLE IF EXISTS `Shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Shipping` (
  `shippingId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `proposalId` int(10) unsigned NOT NULL DEFAULT '0',
  `shippingName` varchar(45) DEFAULT NULL,
  `deliveryAgent_agentName` varchar(45) DEFAULT NULL,
  `deliveryAgent_shippingDate` date DEFAULT NULL,
  `deliveryAgent_deliveryDate` date DEFAULT NULL,
  `deliveryAgent_agentCode` varchar(45) DEFAULT NULL,
  `deliveryAgent_flightCode` varchar(45) DEFAULT NULL,
  `shippingStatus` varchar(45) DEFAULT NULL,
  `bltimeStamp` datetime DEFAULT NULL,
  `laboratoryId` int(10) unsigned DEFAULT NULL,
  `isStorageShipping` tinyint(1) DEFAULT '0',
  `creationDate` datetime DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `sendingLabContactId` int(10) unsigned DEFAULT NULL,
  `returnLabContactId` int(10) unsigned DEFAULT NULL,
  `returnCourier` varchar(45) DEFAULT NULL,
  `dateOfShippingToUser` datetime DEFAULT NULL,
  `shippingType` varchar(45) DEFAULT NULL,
  `SAFETYLEVEL` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`shippingId`),
  KEY `laboratoryId` (`laboratoryId`),
  KEY `Shipping_FKIndex1` (`proposalId`),
  KEY `Shipping_FKIndex2` (`sendingLabContactId`),
  KEY `Shipping_FKIndex3` (`returnLabContactId`),
  KEY `Shipping_FKIndexCreationDate` (`creationDate`),
  KEY `Shipping_FKIndexName` (`shippingName`),
  KEY `Shipping_FKIndexStatus` (`shippingStatus`),
  CONSTRAINT `Shipping_ibfk_1` FOREIGN KEY (`proposalId`) REFERENCES `Proposal` (`proposalId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Shipping_ibfk_2` FOREIGN KEY (`sendingLabContactId`) REFERENCES `LabContact` (`labContactId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Shipping_ibfk_3` FOREIGN KEY (`returnLabContactId`) REFERENCES `LabContact` (`labContactId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7228 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shipping`
--

LOCK TABLES `Shipping` WRITE;
/*!40000 ALTER TABLE `Shipping` DISABLE KEYS */;
INSERT INTO `Shipping` VALUES (474,141666,'cm-0001 1 processing',NULL,NULL,NULL,NULL,NULL,'processing',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(477,141666,'cm-0001 2 processing',NULL,NULL,NULL,NULL,NULL,'processing',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(480,141666,'cm-0001 3 processing',NULL,NULL,NULL,NULL,NULL,'processing',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6988,37027,'Default Shipping:cm14451-1',NULL,NULL,NULL,NULL,NULL,'processing',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7227,37027,'cm14451-2_Shipment1',NULL,NULL,NULL,NULL,NULL,'processing','2016-02-10 13:03:07',NULL,0,'2016-02-10 13:03:07',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShippingHasSession`
--

DROP TABLE IF EXISTS `ShippingHasSession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShippingHasSession` (
  `shippingId` int(10) unsigned NOT NULL,
  `sessionId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`shippingId`,`sessionId`),
  KEY `ShippingHasSession_FKIndex1` (`shippingId`),
  KEY `ShippingHasSession_FKIndex2` (`sessionId`),
  CONSTRAINT `ShippingHasSession_ibfk_1` FOREIGN KEY (`shippingId`) REFERENCES `Shipping` (`shippingId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ShippingHasSession_ibfk_2` FOREIGN KEY (`sessionId`) REFERENCES `BLSession` (`sessionId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShippingHasSession`
--

LOCK TABLES `ShippingHasSession` WRITE;
/*!40000 ALTER TABLE `ShippingHasSession` DISABLE KEYS */;
INSERT INTO `ShippingHasSession` VALUES (474,339525),(477,339528),(480,339531),(6988,55167),(7227,55168);
/*!40000 ALTER TABLE `ShippingHasSession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SpaceGroup`
--

DROP TABLE IF EXISTS `SpaceGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SpaceGroup` (
  `spaceGroupId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `spaceGroupNumber` int(10) unsigned DEFAULT NULL COMMENT 'ccp4 number pr IUCR',
  `spaceGroupShortName` varchar(45) DEFAULT NULL COMMENT 'short name without blank',
  `spaceGroupName` varchar(45) DEFAULT NULL COMMENT 'verbose name',
  `bravaisLattice` varchar(45) DEFAULT NULL COMMENT 'short name',
  `bravaisLatticeName` varchar(45) DEFAULT NULL COMMENT 'verbose name',
  `pointGroup` varchar(45) DEFAULT NULL COMMENT 'point group',
  `geometryClassnameId` int(11) unsigned DEFAULT NULL,
  `MX_used` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if used in the crystal form',
  PRIMARY KEY (`spaceGroupId`),
  KEY `geometryClassnameId` (`geometryClassnameId`),
  KEY `SpaceGroup_FKShortName` (`spaceGroupShortName`),
  CONSTRAINT `SpaceGroup_ibfk_1` FOREIGN KEY (`geometryClassnameId`) REFERENCES `GeometryClassname` (`geometryClassnameId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SpaceGroup`
--

LOCK TABLES `SpaceGroup` WRITE;
/*!40000 ALTER TABLE `SpaceGroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `SpaceGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Specimen`
--

DROP TABLE IF EXISTS `Specimen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Specimen` (
  `specimenId` int(10) NOT NULL AUTO_INCREMENT,
  `BLSESSIONID` int(11) unsigned DEFAULT NULL,
  `bufferId` int(10) DEFAULT NULL,
  `macromoleculeId` int(10) DEFAULT NULL,
  `samplePlatePositionId` int(10) DEFAULT NULL,
  `safetyLevelId` int(10) DEFAULT NULL,
  `stockSolutionId` int(10) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `concentration` varchar(45) DEFAULT NULL,
  `volume` varchar(45) DEFAULT NULL,
  `experimentId` int(10) NOT NULL,
  `comments` varchar(5120) DEFAULT NULL,
  PRIMARY KEY (`specimenId`),
  KEY `SamplePlateWellToBuffer` (`bufferId`),
  KEY `SamplePlateWellToExperiment` (`experimentId`),
  KEY `SamplePlateWellToMacromolecule` (`macromoleculeId`),
  KEY `SamplePlateWellToSafetyLevel` (`safetyLevelId`),
  KEY `SamplePlateWellToSamplePlatePosition` (`samplePlatePositionId`),
  KEY `SampleToStockSolution` (`stockSolutionId`),
  CONSTRAINT `SamplePlateWellToBuffer` FOREIGN KEY (`bufferId`) REFERENCES `Buffer` (`bufferId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SamplePlateWellToExperiment` FOREIGN KEY (`experimentId`) REFERENCES `Experiment` (`experimentId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SamplePlateWellToMacromolecule` FOREIGN KEY (`macromoleculeId`) REFERENCES `Macromolecule` (`macromoleculeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SamplePlateWellToSafetyLevel` FOREIGN KEY (`safetyLevelId`) REFERENCES `SafetyLevel` (`safetyLevelId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SamplePlateWellToSamplePlatePosition` FOREIGN KEY (`samplePlatePositionId`) REFERENCES `SamplePlatePosition` (`samplePlatePositionId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SampleToStockSolution` FOREIGN KEY (`stockSolutionId`) REFERENCES `StockSolution` (`stockSolutionId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Specimen`
--

LOCK TABLES `Specimen` WRITE;
/*!40000 ALTER TABLE `Specimen` DISABLE KEYS */;
/*!40000 ALTER TABLE `Specimen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StockSolution`
--

DROP TABLE IF EXISTS `StockSolution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StockSolution` (
  `stockSolutionId` int(10) NOT NULL AUTO_INCREMENT,
  `BLSESSIONID` int(11) unsigned DEFAULT NULL,
  `bufferId` int(10) NOT NULL,
  `macromoleculeId` int(10) DEFAULT NULL,
  `instructionSetId` int(10) DEFAULT NULL,
  `boxId` int(10) unsigned DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `storageTemperature` varchar(55) DEFAULT NULL,
  `volume` varchar(55) DEFAULT NULL,
  `concentration` varchar(55) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `proposalId` int(10) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`stockSolutionId`),
  KEY `StockSolutionToBuffer` (`bufferId`),
  KEY `StockSolutionToInstructionSet` (`instructionSetId`),
  KEY `StockSolutionToMacromolecule` (`macromoleculeId`),
  CONSTRAINT `StockSolutionToBuffer` FOREIGN KEY (`bufferId`) REFERENCES `Buffer` (`bufferId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `StockSolutionToInstructionSet` FOREIGN KEY (`instructionSetId`) REFERENCES `InstructionSet` (`instructionSetId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `StockSolutionToMacromolecule` FOREIGN KEY (`macromoleculeId`) REFERENCES `Macromolecule` (`macromoleculeId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StockSolution`
--

LOCK TABLES `StockSolution` WRITE;
/*!40000 ALTER TABLE `StockSolution` DISABLE KEYS */;
/*!40000 ALTER TABLE `StockSolution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Stoichiometry`
--

DROP TABLE IF EXISTS `Stoichiometry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Stoichiometry` (
  `stoichiometryId` int(10) NOT NULL AUTO_INCREMENT,
  `hostMacromoleculeId` int(10) NOT NULL,
  `macromoleculeId` int(10) NOT NULL,
  `ratio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`stoichiometryId`),
  KEY `StoichiometryToHost` (`hostMacromoleculeId`),
  KEY `StoichiometryToMacromolecule` (`macromoleculeId`),
  CONSTRAINT `StoichiometryToHost` FOREIGN KEY (`hostMacromoleculeId`) REFERENCES `Macromolecule` (`macromoleculeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `StoichiometryToMacromolecule` FOREIGN KEY (`macromoleculeId`) REFERENCES `Macromolecule` (`macromoleculeId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stoichiometry`
--

LOCK TABLES `Stoichiometry` WRITE;
/*!40000 ALTER TABLE `Stoichiometry` DISABLE KEYS */;
/*!40000 ALTER TABLE `Stoichiometry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Structure`
--

DROP TABLE IF EXISTS `Structure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Structure` (
  `structureId` int(10) NOT NULL AUTO_INCREMENT,
  `macromoleculeId` int(10) NOT NULL,
  `PDB` varchar(45) DEFAULT NULL,
  `structureType` varchar(45) DEFAULT NULL,
  `fromResiduesBases` varchar(45) DEFAULT NULL,
  `toResiduesBases` varchar(45) DEFAULT NULL,
  `sequence` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`structureId`),
  KEY `StructureToMacromolecule` (`macromoleculeId`),
  CONSTRAINT `StructureToMacromolecule` FOREIGN KEY (`macromoleculeId`) REFERENCES `Macromolecule` (`macromoleculeId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Structure`
--

LOCK TABLES `Structure` WRITE;
/*!40000 ALTER TABLE `Structure` DISABLE KEYS */;
/*!40000 ALTER TABLE `Structure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SubstructureDetermination`
--

DROP TABLE IF EXISTS `SubstructureDetermination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SubstructureDetermination` (
  `substructureDeterminationId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key (auto-incremented)',
  `phasingAnalysisId` int(11) unsigned NOT NULL COMMENT 'Related phasing analysis item',
  `phasingProgramRunId` int(11) unsigned NOT NULL COMMENT 'Related program item',
  `spaceGroupId` int(10) unsigned DEFAULT NULL COMMENT 'Related spaceGroup',
  `method` enum('SAD','MAD','SIR','SIRAS','MR','MIR','MIRAS','RIP','RIPAS') DEFAULT NULL COMMENT 'phasing method',
  `lowRes` double DEFAULT NULL,
  `highRes` double DEFAULT NULL,
  `recordTimeStamp` datetime DEFAULT NULL COMMENT 'Creation or last update date/time',
  PRIMARY KEY (`substructureDeterminationId`),
  KEY `SubstructureDetermination_FKIndex1` (`phasingAnalysisId`),
  KEY `SubstructureDetermination_FKIndex2` (`phasingProgramRunId`),
  KEY `SubstructureDetermination_FKIndex3` (`spaceGroupId`),
  CONSTRAINT `SubstructureDetermination_phasingAnalysisfk_1` FOREIGN KEY (`phasingAnalysisId`) REFERENCES `PhasingAnalysis` (`phasingAnalysisId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SubstructureDetermination_phasingProgramRunfk_1` FOREIGN KEY (`phasingProgramRunId`) REFERENCES `PhasingProgramRun` (`phasingProgramRunId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SubstructureDetermination_spaceGroupfk_1` FOREIGN KEY (`spaceGroupId`) REFERENCES `SpaceGroup` (`spaceGroupId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubstructureDetermination`
--

LOCK TABLES `SubstructureDetermination` WRITE;
/*!40000 ALTER TABLE `SubstructureDetermination` DISABLE KEYS */;
/*!40000 ALTER TABLE `SubstructureDetermination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Subtraction`
--

DROP TABLE IF EXISTS `Subtraction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Subtraction` (
  `subtractionId` int(10) NOT NULL AUTO_INCREMENT,
  `dataCollectionId` int(10) NOT NULL,
  `rg` varchar(45) DEFAULT NULL,
  `rgStdev` varchar(45) DEFAULT NULL,
  `I0` varchar(45) DEFAULT NULL,
  `I0Stdev` varchar(45) DEFAULT NULL,
  `firstPointUsed` varchar(45) DEFAULT NULL,
  `lastPointUsed` varchar(45) DEFAULT NULL,
  `quality` varchar(45) DEFAULT NULL,
  `isagregated` varchar(45) DEFAULT NULL,
  `concentration` varchar(45) DEFAULT NULL,
  `gnomFilePath` varchar(255) DEFAULT NULL,
  `rgGuinier` varchar(45) DEFAULT NULL,
  `rgGnom` varchar(45) DEFAULT NULL,
  `dmax` varchar(45) DEFAULT NULL,
  `total` varchar(45) DEFAULT NULL,
  `volume` varchar(45) DEFAULT NULL,
  `creationTime` datetime DEFAULT NULL,
  `kratkyFilePath` varchar(255) DEFAULT NULL,
  `scatteringFilePath` varchar(255) DEFAULT NULL,
  `guinierFilePath` varchar(255) DEFAULT NULL,
  `SUBTRACTEDFILEPATH` varchar(255) DEFAULT NULL,
  `gnomFilePathOutput` varchar(255) DEFAULT NULL,
  `substractedFilePath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subtractionId`),
  KEY `EdnaAnalysisToMeasurement` (`dataCollectionId`),
  CONSTRAINT `EdnaAnalysisToMeasurement0` FOREIGN KEY (`dataCollectionId`) REFERENCES `SaxsDataCollection` (`dataCollectionId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Subtraction`
--

LOCK TABLES `Subtraction` WRITE;
/*!40000 ALTER TABLE `Subtraction` DISABLE KEYS */;
/*!40000 ALTER TABLE `Subtraction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SubtractionToAbInitioModel`
--

DROP TABLE IF EXISTS `SubtractionToAbInitioModel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SubtractionToAbInitioModel` (
  `subtractionToAbInitioModelId` int(10) NOT NULL AUTO_INCREMENT,
  `abInitioId` int(10) DEFAULT NULL,
  `subtractionId` int(10) DEFAULT NULL,
  PRIMARY KEY (`subtractionToAbInitioModelId`),
  KEY `substractionToAbInitioModelToAbinitioModel` (`abInitioId`),
  KEY `ubstractionToSubstraction` (`subtractionId`),
  CONSTRAINT `substractionToAbInitioModelToAbinitioModel` FOREIGN KEY (`abInitioId`) REFERENCES `AbInitioModel` (`abInitioModelId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `substractionToSubstraction` FOREIGN KEY (`subtractionId`) REFERENCES `Subtraction` (`subtractionId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubtractionToAbInitioModel`
--

LOCK TABLES `SubtractionToAbInitioModel` WRITE;
/*!40000 ALTER TABLE `SubtractionToAbInitioModel` DISABLE KEYS */;
/*!40000 ALTER TABLE `SubtractionToAbInitioModel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UntrustedRegion`
--

DROP TABLE IF EXISTS `UntrustedRegion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UntrustedRegion` (
  `untrustedRegionId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key (auto-incremented)',
  `detectorId` int(11) NOT NULL,
  `x1` int(11) NOT NULL,
  `x2` int(11) NOT NULL,
  `y1` int(11) NOT NULL,
  `y2` int(11) NOT NULL,
  PRIMARY KEY (`untrustedRegionId`),
  KEY `UntrustedRegion_FKIndex1` (`detectorId`),
  CONSTRAINT `UntrustedRegion_ibfk_1` FOREIGN KEY (`detectorId`) REFERENCES `Detector` (`detectorId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Untrsuted region linked to a detector';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UntrustedRegion`
--

LOCK TABLES `UntrustedRegion` WRITE;
/*!40000 ALTER TABLE `UntrustedRegion` DISABLE KEYS */;
/*!40000 ALTER TABLE `UntrustedRegion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserGroup`
--

DROP TABLE IF EXISTS `UserGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserGroup` (
  `userGroupId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(31) NOT NULL,
  PRIMARY KEY (`userGroupId`),
  UNIQUE KEY `UserGroup_idx1` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserGroup`
--

LOCK TABLES `UserGroup` WRITE;
/*!40000 ALTER TABLE `UserGroup` DISABLE KEYS */;
INSERT INTO `UserGroup` VALUES (8,'developers'),(9,'ehc'),(6,'em_admin'),(10,'fault_admin'),(2,'mx_admin'),(14,'pdb_stats'),(4,'powder_admin'),(3,'saxs_admin'),(12,'sm_admin'),(1,'super_admin'),(5,'tomo_admin'),(11,'vmxi');
/*!40000 ALTER TABLE `UserGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserGroup_has_Permission`
--

DROP TABLE IF EXISTS `UserGroup_has_Permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserGroup_has_Permission` (
  `userGroupId` int(11) unsigned NOT NULL,
  `permissionId` int(11) unsigned NOT NULL,
  PRIMARY KEY (`userGroupId`,`permissionId`),
  KEY `UserGroup_has_Permission_fk2` (`permissionId`),
  CONSTRAINT `UserGroup_has_Permission_fk1` FOREIGN KEY (`userGroupId`) REFERENCES `UserGroup` (`userGroupId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `UserGroup_has_Permission_fk2` FOREIGN KEY (`permissionId`) REFERENCES `Permission` (`permissionId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserGroup_has_Permission`
--

LOCK TABLES `UserGroup_has_Permission` WRITE;
/*!40000 ALTER TABLE `UserGroup_has_Permission` DISABLE KEYS */;
INSERT INTO `UserGroup_has_Permission` VALUES (1,1),(1,7),(1,8),(1,9),(1,10),(1,18),(2,1),(8,1),(8,2),(8,4),(8,7),(8,8),(8,9),(8,10),(8,11),(8,18),(9,1),(9,6),(10,12),(11,13),(11,15),(11,16),(11,17),(12,18),(14,1);
/*!40000 ALTER TABLE `UserGroup_has_Permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserGroup_has_Person`
--

DROP TABLE IF EXISTS `UserGroup_has_Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserGroup_has_Person` (
  `userGroupId` int(11) unsigned NOT NULL,
  `personId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`userGroupId`,`personId`),
  KEY `userGroup_has_Person_fk2` (`personId`),
  CONSTRAINT `userGroup_has_Person_fk1` FOREIGN KEY (`userGroupId`) REFERENCES `UserGroup` (`userGroupId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userGroup_has_Person_fk2` FOREIGN KEY (`personId`) REFERENCES `Person` (`personId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserGroup_has_Person`
--

LOCK TABLES `UserGroup_has_Person` WRITE;
/*!40000 ALTER TABLE `UserGroup_has_Person` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserGroup_has_Person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Workflow`
--

DROP TABLE IF EXISTS `Workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Workflow` (
  `workflowId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key (auto-incremented)',
  `workflowTitle` varchar(255) DEFAULT NULL,
  `workflowType` enum('Undefined','EnhancedCharacterisation','LineScan','MeshScan','Dehydration','KappaReorientation','BurnStrategy','XrayCentering','DiffractionTomography','TroubleShooting','VisualReorientation','HelicalCharacterisation','GroupedProcessing','MXPressE','MXPressO','MXPressL','MXScore') DEFAULT NULL,
  `comments` varchar(1024) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `resultFilePath` varchar(255) DEFAULT NULL,
  `logFilePath` varchar(255) DEFAULT NULL,
  `recordTimeStamp` datetime DEFAULT NULL COMMENT 'Creation or last update date/time',
  PRIMARY KEY (`workflowId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Workflow`
--

LOCK TABLES `Workflow` WRITE;
/*!40000 ALTER TABLE `Workflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `Workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkflowDehydration`
--

DROP TABLE IF EXISTS `WorkflowDehydration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WorkflowDehydration` (
  `workflowDehydrationId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key (auto-incremented)',
  `workflowId` int(11) unsigned NOT NULL COMMENT 'Related workflow',
  `dataFilePath` varchar(255) DEFAULT NULL,
  `recordTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation or last update date/time',
  PRIMARY KEY (`workflowDehydrationId`),
  KEY `WorkflowDehydration_FKIndex1` (`workflowId`),
  CONSTRAINT `WorkflowDehydration_workflowfk_1` FOREIGN KEY (`workflowId`) REFERENCES `Workflow` (`workflowId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkflowDehydration`
--

LOCK TABLES `WorkflowDehydration` WRITE;
/*!40000 ALTER TABLE `WorkflowDehydration` DISABLE KEYS */;
/*!40000 ALTER TABLE `WorkflowDehydration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkflowMesh`
--

DROP TABLE IF EXISTS `WorkflowMesh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WorkflowMesh` (
  `workflowMeshId` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key (auto-incremented)',
  `workflowId` int(11) unsigned NOT NULL COMMENT 'Related workflow',
  `bestPositionId` int(11) unsigned DEFAULT NULL,
  `bestImageId` int(12) unsigned DEFAULT NULL,
  `value1` double DEFAULT NULL,
  `value2` double DEFAULT NULL,
  `value3` double DEFAULT NULL COMMENT 'N value',
  `value4` double DEFAULT NULL,
  `cartographyPath` varchar(255) DEFAULT NULL,
  `recordTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation or last update date/time',
  PRIMARY KEY (`workflowMeshId`),
  KEY `bestImageId` (`bestImageId`),
  KEY `bestPositionId` (`bestPositionId`),
  KEY `WorkflowMesh_FKIndex1` (`workflowId`),
  CONSTRAINT `WorkflowMesh_ibfk_1` FOREIGN KEY (`bestPositionId`) REFERENCES `MotorPosition` (`motorPositionId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `WorkflowMesh_ibfk_2` FOREIGN KEY (`bestImageId`) REFERENCES `Image` (`imageId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `WorkflowMesh_workflowfk_1` FOREIGN KEY (`workflowId`) REFERENCES `Workflow` (`workflowId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkflowMesh`
--

LOCK TABLES `WorkflowMesh` WRITE;
/*!40000 ALTER TABLE `WorkflowMesh` DISABLE KEYS */;
/*!40000 ALTER TABLE `WorkflowMesh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `XFEFluorescenceSpectrum`
--

DROP TABLE IF EXISTS `XFEFluorescenceSpectrum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `XFEFluorescenceSpectrum` (
  `xfeFluorescenceSpectrumId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sessionId` int(10) unsigned NOT NULL,
  `blSampleId` int(10) unsigned DEFAULT NULL,
  `jpegScanFileFullPath` varchar(255) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `WAVELENGTH` float DEFAULT NULL,
  `exposureTime` float DEFAULT NULL,
  `beamTransmission` float DEFAULT NULL,
  `annotatedPymcaXfeSpectrum` varchar(255) DEFAULT NULL,
  `fittedDataFileFullPath` varchar(255) DEFAULT NULL,
  `scanFileFullPath` varchar(255) DEFAULT NULL,
  `energy` float DEFAULT NULL,
  `beamSizeVertical` float DEFAULT NULL,
  `beamSizeHorizontal` float DEFAULT NULL,
  `crystalClass` varchar(20) DEFAULT NULL,
  `comments` varchar(1024) DEFAULT NULL,
  `BLSUBSAMPLEID` int(11) unsigned DEFAULT NULL,
  `flux` double DEFAULT NULL COMMENT 'flux measured before the xrfSpectra',
  `flux_end` double DEFAULT NULL COMMENT 'flux measured after the xrfSpectra',
  PRIMARY KEY (`xfeFluorescenceSpectrumId`),
  KEY `XFEFluorescnceSpectrum_FKIndex1` (`blSampleId`),
  KEY `XFEFluorescnceSpectrum_FKIndex2` (`sessionId`),
  CONSTRAINT `XFE_ibfk_1` FOREIGN KEY (`sessionId`) REFERENCES `BLSession` (`sessionId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `XFE_ibfk_2` FOREIGN KEY (`blSampleId`) REFERENCES `BLSample` (`blSampleId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `XFEFluorescenceSpectrum`
--

LOCK TABLES `XFEFluorescenceSpectrum` WRITE;
/*!40000 ALTER TABLE `XFEFluorescenceSpectrum` DISABLE KEYS */;
/*!40000 ALTER TABLE `XFEFluorescenceSpectrum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `XmlDocument`
--

DROP TABLE IF EXISTS `XmlDocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `XmlDocument` (
  `xmlDocumentId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `xmlSchemaId` int(10) unsigned NOT NULL DEFAULT '0',
  `xmldata` longtext,
  PRIMARY KEY (`xmlDocumentId`),
  KEY `XmlDocument_FKIndex1` (`xmlSchemaId`),
  CONSTRAINT `XmlDocument_ibfk_1` FOREIGN KEY (`xmlSchemaId`) REFERENCES `XmlSchema` (`xmlSchemaId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `XmlDocument`
--

LOCK TABLES `XmlDocument` WRITE;
/*!40000 ALTER TABLE `XmlDocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `XmlDocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `XmlSchema`
--

DROP TABLE IF EXISTS `XmlSchema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `XmlSchema` (
  `xmlSchemaId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `schemaxml` longtext,
  PRIMARY KEY (`xmlSchemaId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `XmlSchema`
--

LOCK TABLES `XmlSchema` WRITE;
/*!40000 ALTER TABLE `XmlSchema` DISABLE KEYS */;
/*!40000 ALTER TABLE `XmlSchema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_Log4Stat`
--

DROP TABLE IF EXISTS `v_Log4Stat`;
/*!50001 DROP VIEW IF EXISTS `v_Log4Stat`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_Log4Stat` (
  `id` tinyint NOT NULL,
  `priority` tinyint NOT NULL,
  `timestamp` tinyint NOT NULL,
  `msg` tinyint NOT NULL,
  `detail` tinyint NOT NULL,
  `value` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_dewar`
--

DROP TABLE IF EXISTS `v_dewar`;
/*!50001 DROP VIEW IF EXISTS `v_dewar`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_dewar` (
  `proposalId` tinyint NOT NULL,
  `shippingId` tinyint NOT NULL,
  `shippingName` tinyint NOT NULL,
  `dewarId` tinyint NOT NULL,
  `dewarName` tinyint NOT NULL,
  `dewarStatus` tinyint NOT NULL,
  `proposalCode` tinyint NOT NULL,
  `proposalNumber` tinyint NOT NULL,
  `creationDate` tinyint NOT NULL,
  `shippingType` tinyint NOT NULL,
  `barCode` tinyint NOT NULL,
  `shippingStatus` tinyint NOT NULL,
  `beamLineName` tinyint NOT NULL,
  `nbEvents` tinyint NOT NULL,
  `storesin` tinyint NOT NULL,
  `nbSamples` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_dewarBeamline`
--

DROP TABLE IF EXISTS `v_dewarBeamline`;
/*!50001 DROP VIEW IF EXISTS `v_dewarBeamline`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_dewarBeamline` (
  `beamLineName` tinyint NOT NULL,
  `COUNT(*)` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_dewarBeamlineByWeek`
--

DROP TABLE IF EXISTS `v_dewarBeamlineByWeek`;
/*!50001 DROP VIEW IF EXISTS `v_dewarBeamlineByWeek`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_dewarBeamlineByWeek` (
  `Week` tinyint NOT NULL,
  `ID14` tinyint NOT NULL,
  `ID23` tinyint NOT NULL,
  `ID29` tinyint NOT NULL,
  `BM14` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_dewarByWeek`
--

DROP TABLE IF EXISTS `v_dewarByWeek`;
/*!50001 DROP VIEW IF EXISTS `v_dewarByWeek`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_dewarByWeek` (
  `Week` tinyint NOT NULL,
  `Dewars Tracked` tinyint NOT NULL,
  `Dewars Non-Tracked` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_dewarByWeekTotal`
--

DROP TABLE IF EXISTS `v_dewarByWeekTotal`;
/*!50001 DROP VIEW IF EXISTS `v_dewarByWeekTotal`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_dewarByWeekTotal` (
  `Week` tinyint NOT NULL,
  `Dewars Tracked` tinyint NOT NULL,
  `Dewars Non-Tracked` tinyint NOT NULL,
  `Total` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_dewarList`
--

DROP TABLE IF EXISTS `v_dewarList`;
/*!50001 DROP VIEW IF EXISTS `v_dewarList`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_dewarList` (
  `proposal` tinyint NOT NULL,
  `shippingName` tinyint NOT NULL,
  `dewarName` tinyint NOT NULL,
  `barCode` tinyint NOT NULL,
  `creationDate` tinyint NOT NULL,
  `shippingType` tinyint NOT NULL,
  `nbEvents` tinyint NOT NULL,
  `dewarStatus` tinyint NOT NULL,
  `shippingStatus` tinyint NOT NULL,
  `nbSamples` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_dewarProposalCode`
--

DROP TABLE IF EXISTS `v_dewarProposalCode`;
/*!50001 DROP VIEW IF EXISTS `v_dewarProposalCode`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_dewarProposalCode` (
  `proposalCode` tinyint NOT NULL,
  `COUNT(*)` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_dewarProposalCodeByWeek`
--

DROP TABLE IF EXISTS `v_dewarProposalCodeByWeek`;
/*!50001 DROP VIEW IF EXISTS `v_dewarProposalCodeByWeek`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_dewarProposalCodeByWeek` (
  `Week` tinyint NOT NULL,
  `MX` tinyint NOT NULL,
  `FX` tinyint NOT NULL,
  `BM14U` tinyint NOT NULL,
  `BM161` tinyint NOT NULL,
  `BM162` tinyint NOT NULL,
  `Others` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_hour`
--

DROP TABLE IF EXISTS `v_hour`;
/*!50001 DROP VIEW IF EXISTS `v_hour`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_hour` (
  `num` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_logonByHour`
--

DROP TABLE IF EXISTS `v_logonByHour`;
/*!50001 DROP VIEW IF EXISTS `v_logonByHour`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_logonByHour` (
  `Hour` tinyint NOT NULL,
  `Distinct logins` tinyint NOT NULL,
  `Total logins` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_logonByHour2`
--

DROP TABLE IF EXISTS `v_logonByHour2`;
/*!50001 DROP VIEW IF EXISTS `v_logonByHour2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_logonByHour2` (
  `Hour` tinyint NOT NULL,
  `Distinct logins` tinyint NOT NULL,
  `Total logins` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_logonByMonthDay`
--

DROP TABLE IF EXISTS `v_logonByMonthDay`;
/*!50001 DROP VIEW IF EXISTS `v_logonByMonthDay`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_logonByMonthDay` (
  `Day` tinyint NOT NULL,
  `Distinct logins` tinyint NOT NULL,
  `Total logins` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_logonByMonthDay2`
--

DROP TABLE IF EXISTS `v_logonByMonthDay2`;
/*!50001 DROP VIEW IF EXISTS `v_logonByMonthDay2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_logonByMonthDay2` (
  `Day` tinyint NOT NULL,
  `Distinct logins` tinyint NOT NULL,
  `Total logins` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_logonByWeek`
--

DROP TABLE IF EXISTS `v_logonByWeek`;
/*!50001 DROP VIEW IF EXISTS `v_logonByWeek`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_logonByWeek` (
  `Week` tinyint NOT NULL,
  `Distinct logins` tinyint NOT NULL,
  `Total logins` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_logonByWeek2`
--

DROP TABLE IF EXISTS `v_logonByWeek2`;
/*!50001 DROP VIEW IF EXISTS `v_logonByWeek2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_logonByWeek2` (
  `Week` tinyint NOT NULL,
  `Distinct logins` tinyint NOT NULL,
  `Total logins` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_logonByWeekDay`
--

DROP TABLE IF EXISTS `v_logonByWeekDay`;
/*!50001 DROP VIEW IF EXISTS `v_logonByWeekDay`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_logonByWeekDay` (
  `Day` tinyint NOT NULL,
  `Distinct logins` tinyint NOT NULL,
  `Total logins` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_logonByWeekDay2`
--

DROP TABLE IF EXISTS `v_logonByWeekDay2`;
/*!50001 DROP VIEW IF EXISTS `v_logonByWeekDay2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_logonByWeekDay2` (
  `Day` tinyint NOT NULL,
  `Distinct logins` tinyint NOT NULL,
  `Total logins` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_monthDay`
--

DROP TABLE IF EXISTS `v_monthDay`;
/*!50001 DROP VIEW IF EXISTS `v_monthDay`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_monthDay` (
  `num` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_run`
--

DROP TABLE IF EXISTS `v_run`;
/*!50001 DROP VIEW IF EXISTS `v_run`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_run` (
  `runId` tinyint NOT NULL,
  `run` tinyint NOT NULL,
  `startDate` tinyint NOT NULL,
  `endDate` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_sample`
--

DROP TABLE IF EXISTS `v_sample`;
/*!50001 DROP VIEW IF EXISTS `v_sample`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_sample` (
  `proposalId` tinyint NOT NULL,
  `shippingId` tinyint NOT NULL,
  `dewarId` tinyint NOT NULL,
  `containerId` tinyint NOT NULL,
  `blSampleId` tinyint NOT NULL,
  `proposalCode` tinyint NOT NULL,
  `proposalNumber` tinyint NOT NULL,
  `creationDate` tinyint NOT NULL,
  `shippingType` tinyint NOT NULL,
  `barCode` tinyint NOT NULL,
  `shippingStatus` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_sampleByWeek`
--

DROP TABLE IF EXISTS `v_sampleByWeek`;
/*!50001 DROP VIEW IF EXISTS `v_sampleByWeek`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_sampleByWeek` (
  `Week` tinyint NOT NULL,
  `Samples` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_week`
--

DROP TABLE IF EXISTS `v_week`;
/*!50001 DROP VIEW IF EXISTS `v_week`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_week` (
  `num` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_weekDay`
--

DROP TABLE IF EXISTS `v_weekDay`;
/*!50001 DROP VIEW IF EXISTS `v_weekDay`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_weekDay` (
  `day` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_Log4Stat`
--

/*!50001 DROP TABLE IF EXISTS `v_Log4Stat`*/;
/*!50001 DROP VIEW IF EXISTS `v_Log4Stat`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY INVOKER */
/*!50001 VIEW `v_Log4Stat` AS select `s`.`id` AS `id`,`s`.`priority` AS `priority`,`s`.`timestamp` AS `timestamp`,`s`.`msg` AS `msg`,`s`.`detail` AS `detail`,`s`.`value` AS `value` from `Log4Stat` `s` where (((`s`.`detail` like 'fx%') or (`s`.`detail` like 'ifx%') or (`s`.`detail` like 'mx%') or (`s`.`detail` like 'ix%') or (`s`.`detail` like 'bm14u%') or (`s`.`detail` like 'bm161%') or (`s`.`detail` like 'bm162%')) and (`s`.`detail` <> 'fx999') and (`s`.`detail` <> 'ifx999') and (`s`.`detail` <> 'mx415')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_dewar`
--

/*!50001 DROP TABLE IF EXISTS `v_dewar`*/;
/*!50001 DROP VIEW IF EXISTS `v_dewar`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY INVOKER */
/*!50001 VIEW `v_dewar` AS select `p`.`proposalId` AS `proposalId`,`s`.`shippingId` AS `shippingId`,`s`.`shippingName` AS `shippingName`,`d`.`dewarId` AS `dewarId`,`d`.`code` AS `dewarName`,`d`.`dewarStatus` AS `dewarStatus`,`p`.`proposalCode` AS `proposalCode`,`p`.`proposalNumber` AS `proposalNumber`,`s`.`creationDate` AS `creationDate`,`s`.`shippingType` AS `shippingType`,`d`.`barCode` AS `barCode`,`s`.`shippingStatus` AS `shippingStatus`,`ss`.`beamLineName` AS `beamLineName`,count(distinct `h1`.`DewarTransportHistoryId`) AS `nbEvents`,count(distinct `h2`.`DewarTransportHistoryId`) AS `storesin`,count(if((`bls`.`code` is not null),1,NULL)) AS `nbSamples` from (((((((`Proposal` `p` join `Shipping` `s` on((`s`.`proposalId` = `p`.`proposalId`))) join `Dewar` `d` on((`d`.`shippingId` = `s`.`shippingId`))) left join `Container` `c` on((`c`.`dewarId` = `d`.`dewarId`))) left join `BLSession` `ss` on((`ss`.`sessionId` = `d`.`firstExperimentId`))) left join `BLSample` `bls` on((`bls`.`containerId` = `c`.`containerId`))) left join `DewarTransportHistory` `h1` on(((`h1`.`dewarId` = `d`.`dewarId`) and ((`h1`.`dewarStatus` = 'at ESRF') or (`h1`.`dewarStatus` = 'sent to User'))))) left join `DewarTransportHistory` `h2` on(((`h2`.`dewarId` = `d`.`dewarId`) and (`h2`.`storageLocation` = 'STORES-IN')))) where (((`p`.`proposalCode` like 'MX%') or (`p`.`proposalCode` like 'FX%') or (`p`.`proposalCode` like 'IFX%') or (`p`.`proposalCode` like 'IX%') or (`p`.`proposalCode` like 'BM14U%') or (`p`.`proposalCode` like 'bm161%') or (`p`.`proposalCode` like 'bm162%')) and ((`p`.`proposalCode` <> 'FX') or (`p`.`proposalNumber` <> '999')) and ((`p`.`proposalCode` <> 'IFX') or (`p`.`proposalNumber` <> '999')) and ((`p`.`proposalCode` <> 'MX') or (`p`.`proposalNumber` <> '415')) and (`d`.`type` = 'Dewar') and (`s`.`creationDate` is not null)) group by `d`.`dewarId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_dewarBeamline`
--

/*!50001 DROP TABLE IF EXISTS `v_dewarBeamline`*/;
/*!50001 DROP VIEW IF EXISTS `v_dewarBeamline`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY INVOKER */
/*!50001 VIEW `v_dewarBeamline` AS select `d`.`beamLineName` AS `beamLineName`,count(0) AS `COUNT(*)` from `v_dewar` `d` where (`d`.`beamLineName` is not null) group by `d`.`beamLineName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_dewarBeamlineByWeek`
--

/*!50001 DROP TABLE IF EXISTS `v_dewarBeamlineByWeek`*/;
/*!50001 DROP VIEW IF EXISTS `v_dewarBeamlineByWeek`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY INVOKER */
/*!50001 VIEW `v_dewarBeamlineByWeek` AS select substr(`w`.`num`,6) AS `Week`,count(if((`d`.`beamLineName` like 'ID14%'),1,NULL)) AS `ID14`,count(if((`d`.`beamLineName` like 'ID23%'),1,NULL)) AS `ID23`,count(if((`d`.`beamLineName` like 'ID29%'),1,NULL)) AS `ID29`,count(if((`d`.`beamLineName` like 'BM14%'),1,NULL)) AS `BM14` from (`v_week` `w` left join `v_dewar` `d` on((`w`.`num` = date_format(`d`.`creationDate`,'%x-%v')))) group by `w`.`num` order by `w`.`num` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_dewarByWeek`
--

/*!50001 DROP TABLE IF EXISTS `v_dewarByWeek`*/;
/*!50001 DROP VIEW IF EXISTS `v_dewarByWeek`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY INVOKER */
/*!50001 VIEW `v_dewarByWeek` AS select substr(`w`.`num`,6) AS `Week`,count(if((`d`.`shippingType` = 'DewarTracking'),1,NULL)) AS `Dewars Tracked`,count(if(((`d`.`proposalCode` is not null) and ((`d`.`shippingType` <> 'DewarTracking') or isnull(`d`.`shippingType`))),1,NULL)) AS `Dewars Non-Tracked` from (`v_week` `w` left join `v_dewar` `d` on((`w`.`num` = date_format(`d`.`creationDate`,'%Y-%v')))) group by substr(`w`.`num`,6) order by `w`.`num` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_dewarByWeekTotal`
--

/*!50001 DROP TABLE IF EXISTS `v_dewarByWeekTotal`*/;
/*!50001 DROP VIEW IF EXISTS `v_dewarByWeekTotal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY INVOKER */
/*!50001 VIEW `v_dewarByWeekTotal` AS select substr(`w`.`num`,6) AS `Week`,count(if((`d`.`shippingType` = 'DewarTracking'),1,NULL)) AS `Dewars Tracked`,count(if(((`d`.`proposalCode` is not null) and ((`d`.`shippingType` <> 'DewarTracking') or isnull(`d`.`shippingType`))),1,NULL)) AS `Dewars Non-Tracked`,count(if((`d`.`proposalCode` is not null),1,NULL)) AS `Total` from (`v_week` `w` left join `v_dewar` `d` on((`w`.`num` = date_format(`d`.`creationDate`,'%Y-%v')))) group by substr(`w`.`num`,6) order by substr(`w`.`num`,6) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_dewarList`
--

/*!50001 DROP TABLE IF EXISTS `v_dewarList`*/;
/*!50001 DROP VIEW IF EXISTS `v_dewarList`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY INVOKER */
/*!50001 VIEW `v_dewarList` AS select concat(`d`.`proposalCode`,`d`.`proposalNumber`) AS `proposal`,`d`.`shippingName` AS `shippingName`,`d`.`dewarName` AS `dewarName`,`d`.`barCode` AS `barCode`,date_format(`d`.`creationDate`,'%d/%m/%Y') AS `creationDate`,`d`.`shippingType` AS `shippingType`,count(distinct `h`.`DewarTransportHistoryId`) AS `nbEvents`,`d`.`dewarStatus` AS `dewarStatus`,`d`.`shippingStatus` AS `shippingStatus`,count(if((`bls`.`blSampleId` is not null),1,NULL)) AS `nbSamples` from (((`v_dewar` `d` left join `Container` `c` on((`c`.`dewarId` = `d`.`dewarId`))) left join `BLSample` `bls` on((`bls`.`containerId` = `c`.`containerId`))) left join `DewarTransportHistory` `h` on((`h`.`dewarId` = `d`.`dewarId`))) group by `d`.`dewarId` order by `d`.`creationDate` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_dewarProposalCode`
--

/*!50001 DROP TABLE IF EXISTS `v_dewarProposalCode`*/;
/*!50001 DROP VIEW IF EXISTS `v_dewarProposalCode`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY INVOKER */
/*!50001 VIEW `v_dewarProposalCode` AS select `d`.`proposalCode` AS `proposalCode`,count(0) AS `COUNT(*)` from `v_dewar` `d` group by `d`.`proposalCode` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_dewarProposalCodeByWeek`
--

/*!50001 DROP TABLE IF EXISTS `v_dewarProposalCodeByWeek`*/;
/*!50001 DROP VIEW IF EXISTS `v_dewarProposalCodeByWeek`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY INVOKER */
/*!50001 VIEW `v_dewarProposalCodeByWeek` AS select substr(`w`.`num`,6) AS `Week`,count(if((`d`.`proposalCode` = 'MX'),1,NULL)) AS `MX`,count(if((`d`.`proposalCode` = 'FX'),1,NULL)) AS `FX`,count(if((`d`.`proposalCode` = 'BM14U'),1,NULL)) AS `BM14U`,count(if((`d`.`proposalCode` = 'BM161'),1,NULL)) AS `BM161`,count(if((`d`.`proposalCode` = 'BM162'),1,NULL)) AS `BM162`,count(if(((`d`.`proposalCode` <> 'MX') and (`d`.`proposalCode` <> 'FX') and (`d`.`proposalCode` <> 'BM14U') and (`d`.`proposalCode` <> 'BM161') and (`d`.`proposalCode` <> 'BM162')),1,NULL)) AS `Others` from (`v_week` `w` left join `v_dewar` `d` on((`w`.`num` = date_format(`d`.`creationDate`,'%Y-%v')))) group by substr(`w`.`num`,6) order by substr(`w`.`num`,6) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_hour`
--

/*!50001 DROP TABLE IF EXISTS `v_hour`*/;
/*!50001 DROP VIEW IF EXISTS `v_hour`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY INVOKER */
/*!50001 VIEW `v_hour` AS select date_format((now() - interval 23 hour),_utf8'%Y-%m-%d %H') AS `num` union select date_format((now() - interval 22 hour),_utf8'%Y-%m-%d %H') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 22 HOUR),'%Y-%m-%d %H')` union select date_format((now() - interval 21 hour),_utf8'%Y-%m-%d %H') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 21 HOUR),'%Y-%m-%d %H')` union select date_format((now() - interval 20 hour),_utf8'%Y-%m-%d %H') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 20 HOUR),'%Y-%m-%d %H')` union select date_format((now() - interval 19 hour),_utf8'%Y-%m-%d %H') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 19 HOUR),'%Y-%m-%d %H')` union select date_format((now() - interval 18 hour),_utf8'%Y-%m-%d %H') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 18 HOUR),'%Y-%m-%d %H')` union select date_format((now() - interval 17 hour),_utf8'%Y-%m-%d %H') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 17 HOUR),'%Y-%m-%d %H')` union select date_format((now() - interval 16 hour),_utf8'%Y-%m-%d %H') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 16 HOUR),'%Y-%m-%d %H')` union select date_format((now() - interval 15 hour),_utf8'%Y-%m-%d %H') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 15 HOUR),'%Y-%m-%d %H')` union select date_format((now() - interval 14 hour),_utf8'%Y-%m-%d %H') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 14 HOUR),'%Y-%m-%d %H')` union select date_format((now() - interval 13 hour),_utf8'%Y-%m-%d %H') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 13 HOUR),'%Y-%m-%d %H')` union select date_format((now() - interval 12 hour),_utf8'%Y-%m-%d %H') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 12 HOUR),'%Y-%m-%d %H')` union select date_format((now() - interval 11 hour),_utf8'%Y-%m-%d %H') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 11 HOUR),'%Y-%m-%d %H')` union select date_format((now() - interval 10 hour),_utf8'%Y-%m-%d %H') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 10 HOUR),'%Y-%m-%d %H')` union select date_format((now() - interval 9 hour),_utf8'%Y-%m-%d %H') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 9 HOUR),'%Y-%m-%d %H')` union select date_format((now() - interval 8 hour),_utf8'%Y-%m-%d %H') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 8 HOUR),'%Y-%m-%d %H')` union select date_format((now() - interval 7 hour),_utf8'%Y-%m-%d %H') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 7 HOUR),'%Y-%m-%d %H')` union select date_format((now() - interval 6 hour),_utf8'%Y-%m-%d %H') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 6 HOUR),'%Y-%m-%d %H')` union select date_format((now() - interval 5 hour),_utf8'%Y-%m-%d %H') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 5 HOUR),'%Y-%m-%d %H')` union select date_format((now() - interval 4 hour),_utf8'%Y-%m-%d %H') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 4 HOUR),'%Y-%m-%d %H')` union select date_format((now() - interval 3 hour),_utf8'%Y-%m-%d %H') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 3 HOUR),'%Y-%m-%d %H')` union select date_format((now() - interval 2 hour),_utf8'%Y-%m-%d %H') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 2 HOUR),'%Y-%m-%d %H')` union select date_format((now() - interval 1 hour),_utf8'%Y-%m-%d %H') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 1 HOUR),'%Y-%m-%d %H')` union select date_format((now() - interval 0 hour),_utf8'%Y-%m-%d %H') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 0 HOUR),'%Y-%m-%d %H')` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_logonByHour`
--

/*!50001 DROP TABLE IF EXISTS `v_logonByHour`*/;
/*!50001 DROP VIEW IF EXISTS `v_logonByHour`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY INVOKER */
/*!50001 VIEW `v_logonByHour` AS select date_format(`w`.`num`,'%H') AS `Hour`,count(distinct `s`.`detail`) AS `Distinct logins`,(count(`s`.`detail`) - count(distinct `s`.`detail`)) AS `Total logins` from (`v_hour` `w` left join `v_Log4Stat` `s` on(((`w`.`num` = date_format(`s`.`timestamp`,'%Y-%m-%d %H')) and (`s`.`msg` = 'LOGON')))) group by date_format(`w`.`num`,'%H') order by `w`.`num` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_logonByHour2`
--

/*!50001 DROP TABLE IF EXISTS `v_logonByHour2`*/;
/*!50001 DROP VIEW IF EXISTS `v_logonByHour2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY INVOKER */
/*!50001 VIEW `v_logonByHour2` AS select date_format(`w`.`num`,'%H') AS `Hour`,count(distinct `s`.`detail`) AS `Distinct logins`,(count(`s`.`detail`) - count(distinct `s`.`detail`)) AS `Total logins` from (`v_hour` `w` left join `v_Log4Stat` `s` on(((`w`.`num` = date_format(`s`.`timestamp`,'%Y-%m-%d %H')) and (`s`.`msg` = 'LOGON') and (`s`.`priority` = 'ISPYB2_STAT')))) group by date_format(`w`.`num`,'%H') order by `w`.`num` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_logonByMonthDay`
--

/*!50001 DROP TABLE IF EXISTS `v_logonByMonthDay`*/;
/*!50001 DROP VIEW IF EXISTS `v_logonByMonthDay`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY INVOKER */
/*!50001 VIEW `v_logonByMonthDay` AS select date_format(`w`.`num`,'%d/%m') AS `Day`,count(distinct `s`.`detail`) AS `Distinct logins`,(count(`s`.`detail`) - count(distinct `s`.`detail`)) AS `Total logins` from (`v_monthDay` `w` left join `v_Log4Stat` `s` on(((`w`.`num` = date_format(`s`.`timestamp`,'%Y-%m-%d')) and (`s`.`msg` = 'LOGON')))) group by date_format(`w`.`num`,'%d/%m') order by `w`.`num` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_logonByMonthDay2`
--

/*!50001 DROP TABLE IF EXISTS `v_logonByMonthDay2`*/;
/*!50001 DROP VIEW IF EXISTS `v_logonByMonthDay2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY INVOKER */
/*!50001 VIEW `v_logonByMonthDay2` AS select date_format(`w`.`num`,'%d/%m') AS `Day`,count(distinct `s`.`detail`) AS `Distinct logins`,(count(`s`.`detail`) - count(distinct `s`.`detail`)) AS `Total logins` from (`v_monthDay` `w` left join `v_Log4Stat` `s` on(((`w`.`num` = date_format(`s`.`timestamp`,'%Y-%m-%d')) and (`s`.`msg` = 'LOGON') and (`s`.`priority` = 'ISPYB2_STAT')))) group by date_format(`w`.`num`,'%d/%m') order by `w`.`num` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_logonByWeek`
--

/*!50001 DROP TABLE IF EXISTS `v_logonByWeek`*/;
/*!50001 DROP VIEW IF EXISTS `v_logonByWeek`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY INVOKER */
/*!50001 VIEW `v_logonByWeek` AS select substr(`w`.`num`,6) AS `Week`,count(distinct `s`.`detail`) AS `Distinct logins`,(count(`s`.`detail`) - count(distinct `s`.`detail`)) AS `Total logins` from (`v_week` `w` left join `v_Log4Stat` `s` on(((`w`.`num` = date_format(`s`.`timestamp`,'%Y-%v')) and (`s`.`msg` = 'LOGON')))) group by substr(`w`.`num`,6) order by `w`.`num` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_logonByWeek2`
--

/*!50001 DROP TABLE IF EXISTS `v_logonByWeek2`*/;
/*!50001 DROP VIEW IF EXISTS `v_logonByWeek2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY INVOKER */
/*!50001 VIEW `v_logonByWeek2` AS select substr(`w`.`num`,6) AS `Week`,count(distinct `s`.`detail`) AS `Distinct logins`,(count(`s`.`detail`) - count(distinct `s`.`detail`)) AS `Total logins` from (`v_week` `w` left join `v_Log4Stat` `s` on(((`w`.`num` = date_format(`s`.`timestamp`,'%Y-%v')) and (`s`.`msg` = 'LOGON') and (`s`.`priority` = 'ISPYB2_STAT')))) group by substr(`w`.`num`,6) order by `w`.`num` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_logonByWeekDay`
--

/*!50001 DROP TABLE IF EXISTS `v_logonByWeekDay`*/;
/*!50001 DROP VIEW IF EXISTS `v_logonByWeekDay`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY INVOKER */
/*!50001 VIEW `v_logonByWeekDay` AS select date_format(`w`.`day`,'%W') AS `Day`,count(distinct `s`.`detail`) AS `Distinct logins`,(count(`s`.`detail`) - count(distinct `s`.`detail`)) AS `Total logins` from (`v_weekDay` `w` left join `v_Log4Stat` `s` on(((`w`.`day` = date_format(`s`.`timestamp`,'%Y-%m-%d')) and (`s`.`msg` = 'LOGON')))) group by `w`.`day` order by `w`.`day` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_logonByWeekDay2`
--

/*!50001 DROP TABLE IF EXISTS `v_logonByWeekDay2`*/;
/*!50001 DROP VIEW IF EXISTS `v_logonByWeekDay2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY INVOKER */
/*!50001 VIEW `v_logonByWeekDay2` AS select date_format(`w`.`day`,'%W') AS `Day`,count(distinct `s`.`detail`) AS `Distinct logins`,(count(`s`.`detail`) - count(distinct `s`.`detail`)) AS `Total logins` from (`v_weekDay` `w` left join `v_Log4Stat` `s` on(((`w`.`day` = date_format(`s`.`timestamp`,'%Y-%m-%d')) and (`s`.`msg` = 'LOGON') and (`s`.`priority` = 'ISPYB2_STAT')))) group by `w`.`day` order by `w`.`day` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_monthDay`
--

/*!50001 DROP TABLE IF EXISTS `v_monthDay`*/;
/*!50001 DROP VIEW IF EXISTS `v_monthDay`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY INVOKER */
/*!50001 VIEW `v_monthDay` AS select date_format((now() - interval 31 day),_utf8'%Y-%m-%d') AS `num` union select date_format((now() - interval 30 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 30 DAY),'%Y-%m-%d')` union select date_format((now() - interval 29 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 29 DAY),'%Y-%m-%d')` union select date_format((now() - interval 28 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 28 DAY),'%Y-%m-%d')` union select date_format((now() - interval 27 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 27 DAY),'%Y-%m-%d')` union select date_format((now() - interval 26 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 26 DAY),'%Y-%m-%d')` union select date_format((now() - interval 25 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 25 DAY),'%Y-%m-%d')` union select date_format((now() - interval 24 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 24 DAY),'%Y-%m-%d')` union select date_format((now() - interval 23 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 23 DAY),'%Y-%m-%d')` union select date_format((now() - interval 22 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 22 DAY),'%Y-%m-%d')` union select date_format((now() - interval 21 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 21 DAY),'%Y-%m-%d')` union select date_format((now() - interval 20 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 20 DAY),'%Y-%m-%d')` union select date_format((now() - interval 19 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 19 DAY),'%Y-%m-%d')` union select date_format((now() - interval 18 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 18 DAY),'%Y-%m-%d')` union select date_format((now() - interval 17 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 17 DAY),'%Y-%m-%d')` union select date_format((now() - interval 16 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 16 DAY),'%Y-%m-%d')` union select date_format((now() - interval 15 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 15 DAY),'%Y-%m-%d')` union select date_format((now() - interval 14 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 14 DAY),'%Y-%m-%d')` union select date_format((now() - interval 13 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 13 DAY),'%Y-%m-%d')` union select date_format((now() - interval 12 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 12 DAY),'%Y-%m-%d')` union select date_format((now() - interval 11 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 11 DAY),'%Y-%m-%d')` union select date_format((now() - interval 10 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 10 DAY),'%Y-%m-%d')` union select date_format((now() - interval 9 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 9 DAY),'%Y-%m-%d')` union select date_format((now() - interval 8 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 8 DAY),'%Y-%m-%d')` union select date_format((now() - interval 7 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 7 DAY),'%Y-%m-%d')` union select date_format((now() - interval 6 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 6 DAY),'%Y-%m-%d')` union select date_format((now() - interval 5 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 5 DAY),'%Y-%m-%d')` union select date_format((now() - interval 4 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 4 DAY),'%Y-%m-%d')` union select date_format((now() - interval 3 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 3 DAY),'%Y-%m-%d')` union select date_format((now() - interval 2 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 2 DAY),'%Y-%m-%d')` union select date_format((now() - interval 1 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 1 DAY),'%Y-%m-%d')` union select date_format((now() - interval 0 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 0 DAY),'%Y-%m-%d')` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_run`
--

/*!50001 DROP TABLE IF EXISTS `v_run`*/;
/*!50001 DROP VIEW IF EXISTS `v_run`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY INVOKER */
/*!50001 VIEW `v_run` AS select 1 AS `runId`,'2008-01' AS `run`,str_to_date('2007-12-17 09:00:00','%Y-%m-%d %H:%i:%s') AS `startDate`,str_to_date('2008-02-09 08:59:59','%Y-%m-%d %H:%i:%s') AS `endDate` union select 2 AS `2`,'2008-02' AS `2008-02`,str_to_date('2008-02-09 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2008-02-09 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2008-03-14 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2008-03-14 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 3 AS `3`,'2008-03' AS `2008-03`,str_to_date('2008-03-14 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2008-03-14 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2008-04-28 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2008-04-28 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 4 AS `4`,'2008-04' AS `2008-04`,str_to_date('2008-04-28 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2008-04-28 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2008-05-30 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2008-05-30 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 5 AS `5`,'2008-05' AS `2008-05`,str_to_date('2008-05-30 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2008-05-30 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2008-07-12 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2008-07-12 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 6 AS `6`,'2008-06' AS `2008-06`,str_to_date('2008-07-12 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2008-07-12 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2008-08-15 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2008-08-15 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 7 AS `7`,'2008-07' AS `2008-07`,str_to_date('2008-08-15 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2008-08-15 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2008-09-27 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2008-09-27 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 8 AS `8`,'2008-08' AS `2008-08`,str_to_date('2008-09-27 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2008-09-27 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2008-10-31 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2008-10-31 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 9 AS `9`,'2008-09' AS `2008-09`,str_to_date('2008-10-31 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2008-10-31 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2008-12-19 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2008-12-19 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 10 AS `10`,'2009-01' AS `2009-01`,str_to_date('2008-12-19 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2008-12-19 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2009-02-09 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2009-02-09 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 11 AS `11`,'2009-02' AS `2009-02`,str_to_date('2009-02-09 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2009-02-09 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2009-03-13 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2009-03-13 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 12 AS `12`,'2009-03' AS `2009-03`,str_to_date('2009-03-13 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2009-03-13 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2009-04-25 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2009-04-25 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 13 AS `13`,'2009-04' AS `2009-04`,str_to_date('2009-04-25 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2009-04-25 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2009-05-29 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2009-05-29 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 14 AS `14`,'2009-05' AS `2009-05`,str_to_date('2009-05-29 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2009-05-29 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2009-07-18 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2009-07-18 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 15 AS `15`,'2009-06' AS `2009-06`,str_to_date('2009-07-18 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2009-07-18 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2009-08-14 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2009-08-14 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 16 AS `16`,'2009-07' AS `2009-07`,str_to_date('2009-08-14 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2009-08-14 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2009-09-29 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2009-09-29 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 17 AS `17`,'2009-08' AS `2009-08`,str_to_date('2009-09-29 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2009-09-29 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2009-10-30 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2009-10-30 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 18 AS `18`,'2009-09' AS `2009-09`,str_to_date('2009-10-30 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2009-10-30 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2009-12-18 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2009-12-18 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 19 AS `19`,'2010-01' AS `2010-01`,str_to_date('2009-12-18 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2009-12-18 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2010-02-08 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2010-02-08 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 20 AS `20`,'2010-02' AS `2010-02`,str_to_date('2010-02-08 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2010-02-08 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2010-03-15 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2010-03-15 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 21 AS `21`,'2010-03' AS `2010-03`,str_to_date('2010-03-15 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2010-03-15 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2010-06-01 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2010-06-01 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 22 AS `22`,'2010-04' AS `2010-04`,str_to_date('2010-06-01 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2010-06-01 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2010-08-13 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2010-08-13 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 23 AS `23`,'2010-05' AS `2010-05`,str_to_date('2010-08-13 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2010-08-13 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2010-11-01 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2010-11-01 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 24 AS `24`,'2010-06' AS `2010-06`,str_to_date('2010-11-01 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2010-11-01 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2010-12-23 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2010-12-23 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 25 AS `25`,'2011-01' AS `2011-01`,str_to_date('2010-12-23 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2010-12-23 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2011-03-04 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2011-03-04 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 26 AS `26`,'2011-02' AS `2011-02`,str_to_date('2011-03-04 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2011-03-04 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2011-06-03 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2011-06-03 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 27 AS `27`,'2011-03' AS `2011-03`,str_to_date('2011-06-03 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2011-06-03 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2011-08-12 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2011-08-12 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 28 AS `28`,'2011-04' AS `2011-04`,str_to_date('2011-08-12 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2011-08-12 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2011-11-07 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2011-11-07 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 29 AS `29`,'2011-05' AS `2011-05`,str_to_date('2011-11-07 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2011-11-07 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2011-12-22 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2011-12-22 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 30 AS `30`,'2012-01' AS `2012-01`,str_to_date('2011-12-22 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2011-12-22 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2012-03-26 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2012-03-26 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 31 AS `31`,'2012-02' AS `2012-02`,str_to_date('2012-03-26 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2012-03-26 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2012-06-01 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2012-06-01 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 32 AS `32`,'2012-03' AS `2012-03`,str_to_date('2012-06-01 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2012-06-01 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2012-08-17 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2012-08-17 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 33 AS `33`,'2012-04' AS `2012-04`,str_to_date('2012-08-17 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2012-08-17 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2012-11-02 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2012-11-02 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 34 AS `34`,'2012-05' AS `2012-05`,str_to_date('2012-11-02 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2012-11-02 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2012-12-21 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2012-12-21 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 35 AS `35`,'2013-01' AS `2013-01`,str_to_date('2012-12-21 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2012-12-21 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2013-03-22 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2013-03-22 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 36 AS `36`,'2013-02' AS `2013-02`,str_to_date('2013-03-22 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2013-03-22 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2013-05-31 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2013-05-31 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 37 AS `37`,'2013-03' AS `2013-03`,str_to_date('2013-05-31 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2013-05-31 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2013-08-16 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2013-08-16 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 38 AS `38`,'2013-04' AS `2013-04`,str_to_date('2013-08-16 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2013-08-16 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2013-11-01 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2013-11-01 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 39 AS `39`,'2013-05' AS `2013-05`,str_to_date('2013-11-01 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2013-11-01 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2013-12-20 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2013-12-20 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 40 AS `40`,'2014-01' AS `2014-01`,str_to_date('2013-12-20 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2013-12-20 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2014-03-14 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2014-03-14 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 41 AS `41`,'2014-02' AS `2014-02`,str_to_date('2014-03-14 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2014-03-14 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2014-05-30 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2014-05-30 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 42 AS `42`,'2014-03' AS `2014-03`,str_to_date('2014-05-30 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2014-05-30 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2014-08-15 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2014-08-15 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 43 AS `43`,'2014-04' AS `2014-04`,str_to_date('2014-08-15 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2014-08-15 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2014-10-24 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2014-10-24 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 44 AS `44`,'2014-05' AS `2014-05`,str_to_date('2014-10-24 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2014-10-24 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2014-12-19 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2014-12-19 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 45 AS `45`,'2015-01' AS `2015-01`,str_to_date('2014-12-19 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2014-12-19 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2015-03-13 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2015-03-13 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 46 AS `46`,'2015-02' AS `2015-02`,str_to_date('2015-03-13 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2015-03-13 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2015-05-29 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2015-05-29 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 47 AS `47`,'2015-03' AS `2015-03`,str_to_date('2015-05-29 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2015-05-29 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2015-08-14 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2015-08-14 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 48 AS `48`,'2015-04' AS `2015-04`,str_to_date('2015-08-14 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2015-08-14 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2015-10-23 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2015-10-23 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 49 AS `49`,'2015-04' AS `2015-04`,str_to_date('2015-10-23 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2015-10-23 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2015-12-18 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2015-12-18 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 50 AS `50`,'2016-01' AS `2016-01`,str_to_date('2015-12-18 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2015-12-18 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2016-03-11 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2016-03-11 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 51 AS `51`,'2016-02' AS `2016-02`,str_to_date('2016-03-11 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2016-03-11 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2016-05-20 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2016-05-20 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 52 AS `52`,'2016-03' AS `2016-03`,str_to_date('2016-05-20 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2016-05-20 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2016-08-05 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2016-08-05 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 53 AS `53`,'2016-04' AS `2016-04`,str_to_date('2016-08-05 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2016-08-05 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2016-11-04 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2016-11-04 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 54 AS `54`,'2016-05' AS `2016-05`,str_to_date('2016-11-04 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2016-11-04 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2016-12-22 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2016-12-22 08:59:59', '%Y-%m-%d %H:%i:%s')` union select 55 AS `55`,'2017-01' AS `2017-01`,str_to_date('2016-12-22 09:00:00','%Y-%m-%d %H:%i:%s') AS `str_to_date('2016-12-22 09:00:00', '%Y-%m-%d %H:%i:%s')`,str_to_date('2017-01-31 08:59:59','%Y-%m-%d %H:%i:%s') AS `str_to_date('2017-01-31 08:59:59', '%Y-%m-%d %H:%i:%s')` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_sample`
--

/*!50001 DROP TABLE IF EXISTS `v_sample`*/;
/*!50001 DROP VIEW IF EXISTS `v_sample`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY INVOKER */
/*!50001 VIEW `v_sample` AS select `d`.`proposalId` AS `proposalId`,`d`.`shippingId` AS `shippingId`,`d`.`dewarId` AS `dewarId`,`c`.`containerId` AS `containerId`,`bls`.`blSampleId` AS `blSampleId`,`d`.`proposalCode` AS `proposalCode`,`d`.`proposalNumber` AS `proposalNumber`,`d`.`creationDate` AS `creationDate`,`d`.`shippingType` AS `shippingType`,`d`.`barCode` AS `barCode`,`d`.`shippingStatus` AS `shippingStatus` from ((`BLSample` `bls` join `Container` `c` on((`c`.`containerId` = `bls`.`containerId`))) join `v_dewar` `d` on((`d`.`dewarId` = `c`.`dewarId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_sampleByWeek`
--

/*!50001 DROP TABLE IF EXISTS `v_sampleByWeek`*/;
/*!50001 DROP VIEW IF EXISTS `v_sampleByWeek`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY INVOKER */
/*!50001 VIEW `v_sampleByWeek` AS select substr(`w`.`num`,6) AS `Week`,if((`w`.`num` <= date_format(now(),'%Y-%v')),count(if((`bls`.`proposalCode` is not null),1,NULL)),NULL) AS `Samples` from (`v_week` `w` left join `v_sample` `bls` on((`w`.`num` = date_format(`bls`.`creationDate`,'%Y-%v')))) group by substr(`w`.`num`,6) order by substr(`w`.`num`,6) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_week`
--

/*!50001 DROP TABLE IF EXISTS `v_week`*/;
/*!50001 DROP VIEW IF EXISTS `v_week`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY INVOKER */
/*!50001 VIEW `v_week` AS select date_format((now() - interval 52 week),_utf8'%x-%v') AS `num` union select date_format((now() - interval 51 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 51 WEEK),'%x-%v')` union select date_format((now() - interval 50 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 50 WEEK),'%x-%v')` union select date_format((now() - interval 49 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 49 WEEK),'%x-%v')` union select date_format((now() - interval 48 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 48 WEEK),'%x-%v')` union select date_format((now() - interval 47 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 47 WEEK),'%x-%v')` union select date_format((now() - interval 46 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 46 WEEK),'%x-%v')` union select date_format((now() - interval 45 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 45 WEEK),'%x-%v')` union select date_format((now() - interval 44 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 44 WEEK),'%x-%v')` union select date_format((now() - interval 43 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 43 WEEK),'%x-%v')` union select date_format((now() - interval 42 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 42 WEEK),'%x-%v')` union select date_format((now() - interval 41 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 41 WEEK),'%x-%v')` union select date_format((now() - interval 40 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 40 WEEK),'%x-%v')` union select date_format((now() - interval 39 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 39 WEEK),'%x-%v')` union select date_format((now() - interval 38 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 38 WEEK),'%x-%v')` union select date_format((now() - interval 37 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 37 WEEK),'%x-%v')` union select date_format((now() - interval 36 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 36 WEEK),'%x-%v')` union select date_format((now() - interval 35 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 35 WEEK),'%x-%v')` union select date_format((now() - interval 34 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 34 WEEK),'%x-%v')` union select date_format((now() - interval 33 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 33 WEEK),'%x-%v')` union select date_format((now() - interval 32 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 32 WEEK),'%x-%v')` union select date_format((now() - interval 31 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 31 WEEK),'%x-%v')` union select date_format((now() - interval 30 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 30 WEEK),'%x-%v')` union select date_format((now() - interval 29 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 29 WEEK),'%x-%v')` union select date_format((now() - interval 28 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 28 WEEK),'%x-%v')` union select date_format((now() - interval 27 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 27 WEEK),'%x-%v')` union select date_format((now() - interval 26 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 26 WEEK),'%x-%v')` union select date_format((now() - interval 25 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 25 WEEK),'%x-%v')` union select date_format((now() - interval 24 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 24 WEEK),'%x-%v')` union select date_format((now() - interval 23 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 23 WEEK),'%x-%v')` union select date_format((now() - interval 22 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 22 WEEK),'%x-%v')` union select date_format((now() - interval 21 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 21 WEEK),'%x-%v')` union select date_format((now() - interval 20 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 20 WEEK),'%x-%v')` union select date_format((now() - interval 19 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 19 WEEK),'%x-%v')` union select date_format((now() - interval 18 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 18 WEEK),'%x-%v')` union select date_format((now() - interval 17 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 17 WEEK),'%x-%v')` union select date_format((now() - interval 16 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 16 WEEK),'%x-%v')` union select date_format((now() - interval 15 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 15 WEEK),'%x-%v')` union select date_format((now() - interval 14 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 14 WEEK),'%x-%v')` union select date_format((now() - interval 13 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 13 WEEK),'%x-%v')` union select date_format((now() - interval 12 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 12 WEEK),'%x-%v')` union select date_format((now() - interval 11 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 11 WEEK),'%x-%v')` union select date_format((now() - interval 10 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 10 WEEK),'%x-%v')` union select date_format((now() - interval 9 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 9 WEEK),'%x-%v')` union select date_format((now() - interval 8 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 8 WEEK),'%x-%v')` union select date_format((now() - interval 7 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 7 WEEK),'%x-%v')` union select date_format((now() - interval 6 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 6 WEEK),'%x-%v')` union select date_format((now() - interval 5 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 5 WEEK),'%x-%v')` union select date_format((now() - interval 4 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 4 WEEK),'%x-%v')` union select date_format((now() - interval 3 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 3 WEEK),'%x-%v')` union select date_format((now() - interval 2 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 2 WEEK),'%x-%v')` union select date_format((now() - interval 1 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 1 WEEK),'%x-%v')` union select date_format((now() - interval 0 week),_utf8'%x-%v') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 0 WEEK),'%x-%v')` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_weekDay`
--

/*!50001 DROP TABLE IF EXISTS `v_weekDay`*/;
/*!50001 DROP VIEW IF EXISTS `v_weekDay`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 SQL SECURITY INVOKER */
/*!50001 VIEW `v_weekDay` AS select date_format((now() - interval 6 day),_utf8'%Y-%m-%d') AS `day` union select date_format((now() - interval 5 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 5 DAY),'%Y-%m-%d')` union select date_format((now() - interval 4 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 4 DAY),'%Y-%m-%d')` union select date_format((now() - interval 3 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 3 DAY),'%Y-%m-%d')` union select date_format((now() - interval 2 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 2 DAY),'%Y-%m-%d')` union select date_format((now() - interval 1 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 1 DAY),'%Y-%m-%d')` union select date_format((now() - interval 0 day),_utf8'%Y-%m-%d') AS `DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 0 DAY),'%Y-%m-%d')` */;
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

-- Dump completed on 2016-04-22 12:26:00