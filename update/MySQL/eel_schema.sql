# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.23)
# Database: eel2013
# Generation Time: 2015-06-11 01:42:44 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table AGRUPACIONDEMUNICIPIOS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AGRUPACIONDEMUNICIPIOS`;

CREATE TABLE `AGRUPACIONDEMUNICIPIOS` (
  `IDAGRUPACION` smallint(6) NOT NULL,
  `DESCRIPCION` char(50) NOT NULL,
  `CREADAEL` datetime DEFAULT NULL,
  `USADAEL` datetime DEFAULT NULL,
  PRIMARY KEY (`IDAGRUPACION`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table AGRUPACIONDETALLE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AGRUPACIONDETALLE`;

CREATE TABLE `AGRUPACIONDETALLE` (
  `IDAGRUPACION` smallint(6) NOT NULL,
  `IDCOMUNIDAD` tinyint(3) unsigned NOT NULL,
  `IDPROVINCIA` tinyint(3) unsigned NOT NULL,
  `IDMUNICIPIO` smallint(6) NOT NULL,
  PRIMARY KEY (`IDAGRUPACION`,`IDCOMUNIDAD`,`IDPROVINCIA`,`IDMUNICIPIO`),
  KEY `IDAGRUPACION` (`IDAGRUPACION`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



# Dump of table ALTERACION
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ALTERACION`;

CREATE TABLE `ALTERACION` (
  `IDALTERACION` tinyint(3) unsigned NOT NULL,
  `IDIDIOMA` tinyint(3) unsigned NOT NULL,
  `DESCRIPCION` char(50) DEFAULT NULL,
  PRIMARY KEY (`IDALTERACION`,`IDIDIOMA`),
  KEY `IDIDIOMA` (`IDIDIOMA`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ATAQUE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ATAQUE`;

CREATE TABLE `ATAQUE` (
  `IDATAQUE` tinyint(3) unsigned NOT NULL,
  `IDIDIOMA` tinyint(3) unsigned NOT NULL,
  `DESCRIPCION` char(50) DEFAULT NULL,
  PRIMARY KEY (`IDATAQUE`,`IDIDIOMA`),
  KEY `IDIDIOMA` (`IDIDIOMA`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table CAUSA
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CAUSA`;

CREATE TABLE `CAUSA` (
  `IDCAUSA` tinyint(3) unsigned NOT NULL,
  `IDIDIOMA` tinyint(3) unsigned NOT NULL,
  `DESCRIPCION` char(15) DEFAULT NULL,
  PRIMARY KEY (`IDCAUSA`,`IDIDIOMA`),
  KEY `IDIDIOMA` (`IDIDIOMA`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table CAUSANTE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CAUSANTE`;

CREATE TABLE `CAUSANTE` (
  `IDCAUSANTE` tinyint(3) unsigned NOT NULL,
  `IDIDIOMA` tinyint(3) unsigned NOT NULL,
  `DESCRIPCION` char(20) DEFAULT NULL,
  PRIMARY KEY (`IDCAUSANTE`,`IDIDIOMA`),
  KEY `IDIDIOMA` (`IDIDIOMA`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table CAUSAS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CAUSAS`;

CREATE TABLE `CAUSAS` (
  `IDGRUPOCAUSA` tinyint(3) unsigned NOT NULL,
  `IDCAUSAS` char(2) NOT NULL,
  `IDIDIOMA` tinyint(3) unsigned NOT NULL,
  `DESCRIPCION` char(75) DEFAULT NULL,
  `DESC_CORTA` char(40) DEFAULT NULL,
  PRIMARY KEY (`IDGRUPOCAUSA`,`IDCAUSAS`,`IDIDIOMA`),
  KEY `IDIDIOMA` (`IDIDIOMA`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table CLASEDIA
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CLASEDIA`;

CREATE TABLE `CLASEDIA` (
  `IDCLASEDIA` tinyint(3) unsigned NOT NULL,
  `IDIDIOMA` tinyint(3) unsigned NOT NULL,
  `DESCRIPCION` char(50) DEFAULT NULL,
  PRIMARY KEY (`IDCLASEDIA`,`IDIDIOMA`),
  KEY `IDIDIOMA` (`IDIDIOMA`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table COMARCAOISLA
# ------------------------------------------------------------

DROP TABLE IF EXISTS `COMARCAOISLA`;

CREATE TABLE `COMARCAOISLA` (
  `IDCOMUNIDAD` tinyint(3) unsigned NOT NULL,
  `IDCOI` smallint(6) NOT NULL,
  `NOMBRE` char(45) DEFAULT NULL,
  PRIMARY KEY (`IDCOMUNIDAD`,`IDCOI`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table COMUNIDADES
# ------------------------------------------------------------

DROP TABLE IF EXISTS `COMUNIDADES`;

CREATE TABLE `COMUNIDADES` (
  `IDCOMUNIDAD` tinyint(3) unsigned NOT NULL,
  `NOMBRE` char(15) NOT NULL,
  PRIMARY KEY (`IDCOMUNIDAD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table DETECTADOPOR
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DETECTADOPOR`;

CREATE TABLE `DETECTADOPOR` (
  `IDDETECTADOPOR` tinyint(3) unsigned NOT NULL,
  `IDIDIOMA` tinyint(3) unsigned NOT NULL,
  `DESCRIPCION` char(20) DEFAULT NULL,
  PRIMARY KEY (`IDDETECTADOPOR`,`IDIDIOMA`),
  KEY `IDIDIOMA` (`IDIDIOMA`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table EFECTOVSYEL
# ------------------------------------------------------------

DROP TABLE IF EXISTS `EFECTOVSYEL`;

CREATE TABLE `EFECTOVSYEL` (
  `IDEFECTO` tinyint(3) unsigned NOT NULL,
  `IDIDIOMA` tinyint(3) unsigned NOT NULL,
  `DESCRIPCION` char(25) DEFAULT NULL,
  PRIMARY KEY (`IDEFECTO`,`IDIDIOMA`),
  KEY `IDIDIOMA` (`IDIDIOMA`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ENP
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ENP`;

CREATE TABLE `ENP` (
  `IDENP` char(7) NOT NULL,
  `NOMBRE` char(75) DEFAULT NULL,
  `IDTIPOENP` tinyint(3) unsigned NOT NULL,
  `SUPERFICIE` decimal(20,4) DEFAULT NULL,
  PRIMARY KEY (`IDENP`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ENTIDADESMENORES
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ENTIDADESMENORES`;

CREATE TABLE `ENTIDADESMENORES` (
  `IDCOMUNIDAD` tinyint(3) unsigned NOT NULL,
  `IDPROVINCIA` tinyint(3) unsigned NOT NULL,
  `IDMUNICIPIO` smallint(6) NOT NULL,
  `IDENTIDADMENOR` smallint(6) NOT NULL,
  `NOMBRE` char(45) NOT NULL,
  `HOJA` char(4) DEFAULT NULL,
  `CUADRICULA` char(3) DEFAULT NULL,
  `HUSO` tinyint(3) unsigned DEFAULT NULL,
  `X` int(11) DEFAULT NULL,
  `Y` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDCOMUNIDAD`,`IDPROVINCIA`,`IDMUNICIPIO`,`IDENTIDADMENOR`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ESPECIES
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ESPECIES`;

CREATE TABLE `ESPECIES` (
  `IDESPECIE` smallint(6) NOT NULL,
  `NOMBRE` char(25) NOT NULL,
  PRIMARY KEY (`IDESPECIE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ESPECIES_VALORACION
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ESPECIES_VALORACION`;

CREATE TABLE `ESPECIES_VALORACION` (
  `IDESPECIE` smallint(6) NOT NULL,
  `ANIO` smallint(6) NOT NULL,
  `IDPROVINCIA` tinyint(3) unsigned NOT NULL,
  `VT` int(11) DEFAULT NULL,
  `A` decimal(20,4) DEFAULT NULL,
  `INTERES` decimal(20,4) DEFAULT NULL,
  `COEFSELV` decimal(20,4) DEFAULT NULL,
  `T` int(11) DEFAULT NULL,
  `CREP` decimal(20,4) DEFAULT NULL,
  `CREG` decimal(20,4) DEFAULT NULL,
  `PT` decimal(20,4) DEFAULT NULL,
  PRIMARY KEY (`IDESPECIE`,`ANIO`,`IDPROVINCIA`),
  KEY `IDESPECIE` (`IDESPECIE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



# Dump of table ESTACIONESMETEOROLOGICAS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ESTACIONESMETEOROLOGICAS`;

CREATE TABLE `ESTACIONESMETEOROLOGICAS` (
  `IDESTACION` char(6) NOT NULL,
  `NOMBRE` char(30) DEFAULT NULL,
  `HUSO` tinyint(3) unsigned DEFAULT NULL,
  `X` int(11) DEFAULT NULL,
  `Y` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDESTACION`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table GRUPOCAUSAS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `GRUPOCAUSAS`;

CREATE TABLE `GRUPOCAUSAS` (
  `IDGRUPOCAUSA` tinyint(3) unsigned NOT NULL,
  `IDIDIOMA` tinyint(3) unsigned NOT NULL,
  `DESCRIPCION` char(50) DEFAULT NULL,
  PRIMARY KEY (`IDGRUPOCAUSA`,`IDIDIOMA`),
  KEY `IDIDIOMA` (`IDIDIOMA`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table IDIOMAS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `IDIOMAS`;

CREATE TABLE `IDIOMAS` (
  `IDIDIOMA` tinyint(3) unsigned NOT NULL,
  `DESCRIPCION` char(20) DEFAULT NULL,
  PRIMARY KEY (`IDIDIOMA`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table INCIDENCIASPC
# ------------------------------------------------------------

DROP TABLE IF EXISTS `INCIDENCIASPC`;

CREATE TABLE `INCIDENCIASPC` (
  `IDINCIDENCIAPC` tinyint(3) unsigned NOT NULL,
  `IDIDIOMA` tinyint(3) unsigned NOT NULL,
  `DESCRIPCION` char(50) DEFAULT NULL,
  PRIMARY KEY (`IDINCIDENCIAPC`,`IDIDIOMA`),
  KEY `IDIDIOMA` (`IDIDIOMA`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table INICIADOJUNTOA
# ------------------------------------------------------------

DROP TABLE IF EXISTS `INICIADOJUNTOA`;

CREATE TABLE `INICIADOJUNTOA` (
  `IDINICIADOJUNTOA` tinyint(3) unsigned NOT NULL,
  `IDIDIOMA` tinyint(3) unsigned NOT NULL,
  `DESCRIPCION` char(50) DEFAULT NULL,
  PRIMARY KEY (`IDINICIADOJUNTOA`,`IDIDIOMA`),
  KEY `IDIDIOMA` (`IDIDIOMA`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table MEDIOSTRANSPORTE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `MEDIOSTRANSPORTE`;

CREATE TABLE `MEDIOSTRANSPORTE` (
  `IDMEDIO` tinyint(3) unsigned NOT NULL,
  `IDIDIOMA` tinyint(3) unsigned NOT NULL,
  `DESCRIPCION` char(30) DEFAULT NULL,
  PRIMARY KEY (`IDMEDIO`,`IDIDIOMA`),
  KEY `IDIDIOMA` (`IDIDIOMA`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table MODELOSCOMBUSTIBLE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `MODELOSCOMBUSTIBLE`;

CREATE TABLE `MODELOSCOMBUSTIBLE` (
  `IDMODELOCOMBUSTIBLE` tinyint(3) unsigned NOT NULL,
  `IDIDIOMA` tinyint(3) unsigned NOT NULL,
  `DESCRIPCION` char(50) DEFAULT NULL,
  PRIMARY KEY (`IDMODELOCOMBUSTIBLE`,`IDIDIOMA`),
  KEY `IDIDIOMA` (`IDIDIOMA`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table MONTES
# ------------------------------------------------------------

DROP TABLE IF EXISTS `MONTES`;

CREATE TABLE `MONTES` (
  `IDPROVINCIA` tinyint(3) unsigned NOT NULL,
  `IDNUMCATALOGO` char(8) NOT NULL,
  `DESCRIPCION` char(50) DEFAULT NULL,
  `IDSITUACIONLM` tinyint(3) unsigned NOT NULL,
  `PROPIETARIO` char(50) DEFAULT NULL,
  `IDMUNICIPIO` smallint(6) NOT NULL,
  PRIMARY KEY (`IDPROVINCIA`,`IDNUMCATALOGO`,`IDSITUACIONLM`,`IDMUNICIPIO`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table MOTIVACION
# ------------------------------------------------------------

DROP TABLE IF EXISTS `MOTIVACION`;

CREATE TABLE `MOTIVACION` (
  `IDMOTIVACION` tinyint(3) unsigned NOT NULL,
  `IDIDIOMA` tinyint(3) unsigned NOT NULL,
  `DESCRIPCION` char(85) DEFAULT NULL,
  PRIMARY KEY (`IDMOTIVACION`,`IDIDIOMA`),
  KEY `IDIDIOMA` (`IDIDIOMA`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table MUNICIPIOS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `MUNICIPIOS`;

CREATE TABLE `MUNICIPIOS` (
  `IDCOMUNIDAD` tinyint(3) unsigned NOT NULL,
  `IDPROVINCIA` tinyint(3) unsigned NOT NULL,
  `IDMUNICIPIO` smallint(6) NOT NULL,
  `NOMBRE` char(30) DEFAULT NULL,
  `HUSO` tinyint(3) unsigned DEFAULT NULL,
  `X` int(11) DEFAULT NULL,
  `Y` int(11) DEFAULT NULL,
  `HOJA` char(4) DEFAULT NULL,
  `CUADRICULA` char(3) DEFAULT NULL,
  `IDCOI` smallint(6) DEFAULT NULL,
  `LONGITUD` decimal(11,8) DEFAULT NULL COMMENT 'Not in the original DB',
  `LATITUD` decimal(11,8) DEFAULT NULL COMMENT 'Not in the original DB',
  PRIMARY KEY (`IDCOMUNIDAD`,`IDPROVINCIA`,`IDMUNICIPIO`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table PDPM0
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PDPM0`;

CREATE TABLE `PDPM0` (
  `IDPIF` int(11) NOT NULL,
  `IDPDPM` tinyint(3) unsigned NOT NULL,
  `IDCOMUNIDAD` tinyint(3) unsigned DEFAULT NULL,
  `IDPROVINCIA` tinyint(3) unsigned DEFAULT NULL,
  `IDCOI` smallint(6) DEFAULT NULL,
  `IDMUNICIPIO` smallint(6) DEFAULT NULL,
  `IDSITUACIONLM` tinyint(3) unsigned DEFAULT NULL,
  `NOTAS` longblob,
  PRIMARY KEY (`IDPIF`,`IDPDPM`),
  KEY `IDPIF` (`IDPIF`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



# Dump of table PDPM1
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PDPM1`;

CREATE TABLE `PDPM1` (
  `IDPIF` int(11) NOT NULL,
  `IDPDPM` tinyint(3) unsigned NOT NULL,
  `IDNUMCATALOGO` char(8) DEFAULT NULL,
  PRIMARY KEY (`IDPIF`,`IDPDPM`),
  KEY `IDPIF` (`IDPIF`,`IDPDPM`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table PDPM2
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PDPM2`;

CREATE TABLE `PDPM2` (
  `IDPIF` int(11) NOT NULL,
  `IDPDPM` tinyint(3) unsigned NOT NULL,
  `TOTALMA` decimal(20,4) DEFAULT NULL,
  `MONTEABIERTO` decimal(20,4) DEFAULT NULL,
  `MATORRALYMB` decimal(20,4) DEFAULT NULL,
  `DEHESAS` decimal(20,4) DEFAULT NULL,
  `PASTIZALES` decimal(20,4) DEFAULT NULL,
  `ZHUMEDAS` decimal(20,4) DEFAULT NULL,
  `SUPNF` decimal(20,4) DEFAULT NULL,
  PRIMARY KEY (`IDPIF`,`IDPDPM`),
  KEY `IDPIF` (`IDPIF`,`IDPDPM`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



# Dump of table PDPM3
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PDPM3`;

CREATE TABLE `PDPM3` (
  `IDPIF` int(11) NOT NULL,
  `IDPDPM` tinyint(3) unsigned NOT NULL,
  `IDESPECIE` smallint(6) NOT NULL,
  `EDADR` tinyint(3) unsigned DEFAULT NULL,
  `SHAR` decimal(20,4) DEFAULT NULL,
  `FCCR` smallint(6) DEFAULT NULL,
  `EDADMB` tinyint(3) unsigned DEFAULT NULL,
  `SHAMB` decimal(20,4) DEFAULT NULL,
  `FCCMB` decimal(20,4) DEFAULT NULL,
  `EDADMBL` tinyint(3) unsigned DEFAULT NULL,
  `SHAMBL` decimal(20,4) DEFAULT NULL,
  `FCCMBL` smallint(6) DEFAULT NULL,
  `EDADLF` tinyint(3) unsigned DEFAULT NULL,
  `SHALF` decimal(20,4) DEFAULT NULL,
  `FCCLF` smallint(6) DEFAULT NULL,
  `EDADF1` tinyint(3) unsigned DEFAULT NULL,
  `SHAF1` decimal(20,4) DEFAULT NULL,
  `FCCF1` smallint(6) DEFAULT NULL,
  `EDADF2` tinyint(3) unsigned DEFAULT NULL,
  `SHAF2` decimal(20,4) DEFAULT NULL,
  `FCCF2` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`IDPIF`,`IDPDPM`,`IDESPECIE`),
  KEY `IDESPECIE` (`IDESPECIE`),
  KEY `IDPIF` (`IDPIF`,`IDPDPM`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



# Dump of table PDPM4
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PDPM4`;

CREATE TABLE `PDPM4` (
  `IDPIF` int(11) NOT NULL,
  `IDPDPM` tinyint(3) unsigned NOT NULL,
  `IDESPECIE` smallint(6) NOT NULL,
  `VOLMALF` int(11) DEFAULT NULL,
  `VOLDALF` int(11) DEFAULT NULL,
  `VOLMAF` int(11) DEFAULT NULL,
  `VOLDAF` int(11) DEFAULT NULL,
  `PMADLF` decimal(20,4) DEFAULT NULL,
  `PMAQLF` decimal(20,4) DEFAULT NULL,
  `PMADF` decimal(20,4) DEFAULT NULL,
  `PMAQF` decimal(20,4) DEFAULT NULL,
  PRIMARY KEY (`IDPIF`,`IDPDPM`,`IDESPECIE`),
  KEY `IDPIF` (`IDPIF`,`IDPDPM`),
  KEY `IDESPECIE` (`IDESPECIE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



# Dump of table PDPM5
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PDPM5`;

CREATE TABLE `PDPM5` (
  `IDPIF` int(11) NOT NULL,
  `IDPDPM` tinyint(3) unsigned NOT NULL,
  `IDPRODUCTO` tinyint(3) unsigned NOT NULL,
  `SX` decimal(20,4) DEFAULT NULL,
  PRIMARY KEY (`IDPIF`,`IDPDPM`,`IDPRODUCTO`),
  KEY `IDPIF` (`IDPIF`,`IDPDPM`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



# Dump of table PDPM6
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PDPM6`;

CREATE TABLE `PDPM6` (
  `IDPIF` int(11) NOT NULL,
  `IDPDPM` tinyint(3) unsigned NOT NULL,
  `IDRENTA` tinyint(3) unsigned NOT NULL,
  `SR` decimal(20,4) DEFAULT NULL,
  PRIMARY KEY (`IDPIF`,`IDPDPM`,`IDRENTA`),
  KEY `IDPIF` (`IDPIF`,`IDPDPM`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



# Dump of table PDPM7
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PDPM7`;

CREATE TABLE `PDPM7` (
  `IDPIF` int(11) NOT NULL,
  `IDPDPM` tinyint(3) unsigned NOT NULL,
  `DANSIN` int(11) DEFAULT NULL,
  `PERJSIN` int(11) DEFAULT NULL,
  `TOTALSIN` int(11) DEFAULT NULL,
  `DANCON` int(11) DEFAULT NULL,
  `PERJCON` int(11) DEFAULT NULL,
  `TOTALCON` int(11) DEFAULT NULL,
  `CORCHO` int(11) DEFAULT NULL,
  `RESINAS` int(11) DEFAULT NULL,
  `FRUTSET` int(11) DEFAULT NULL,
  `LENAS` int(11) DEFAULT NULL,
  `PASTOS` int(11) DEFAULT NULL,
  `CAZA` int(11) DEFAULT NULL,
  `OTRASP` int(11) DEFAULT NULL,
  `TOTALPER` int(11) DEFAULT NULL,
  `GEXT` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDPIF`,`IDPDPM`),
  KEY `IDPIF` (`IDPIF`,`IDPDPM`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



# Dump of table PELIGRO
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PELIGRO`;

CREATE TABLE `PELIGRO` (
  `IDPELIGRO` tinyint(3) unsigned NOT NULL,
  `IDIDIOMA` tinyint(3) unsigned NOT NULL,
  `DESCRIPCION` char(25) DEFAULT NULL,
  PRIMARY KEY (`IDPELIGRO`,`IDIDIOMA`),
  KEY `IDIDIOMA` (`IDIDIOMA`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table PENP
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PENP`;

CREATE TABLE `PENP` (
  `IDPIF` int(11) NOT NULL,
  `IDENP` char(7) NOT NULL,
  `SARBOLADA` decimal(20,4) DEFAULT NULL,
  `SNFORESTAL` decimal(20,4) DEFAULT NULL,
  `SNALENOSA` decimal(20,4) DEFAULT NULL,
  `SNAHERBACEA` decimal(20,4) DEFAULT NULL,
  PRIMARY KEY (`IDPIF`,`IDENP`),
  KEY `IDENP` (`IDENP`),
  KEY `IDPIF` (`IDPIF`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table PIF0
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PIF0`;

CREATE TABLE `PIF0` (
  `IDPIF` int(11) NOT NULL,
  `ANIO` smallint(6) NOT NULL,
  `NOTAS` longblob,
  PRIMARY KEY (`IDPIF`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



# Dump of table PIF1
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PIF1`;

CREATE TABLE `PIF1` (
  `IDPIF` int(11) NOT NULL,
  `IDCOMUNIDAD` tinyint(3) unsigned DEFAULT NULL,
  `IDPROVINCIA` tinyint(3) unsigned DEFAULT NULL,
  `IDCOI` smallint(6) DEFAULT NULL,
  `IDMUNICIPIO` smallint(6) DEFAULT NULL,
  `IDENTIDADMENOR` smallint(6) DEFAULT NULL,
  `PARAJE` char(50) DEFAULT NULL,
  `HOJA` char(4) DEFAULT NULL,
  `CUADRICULA` char(3) DEFAULT NULL,
  `HUSO` tinyint(3) unsigned DEFAULT NULL,
  `X` int(11) DEFAULT NULL,
  `Y` int(11) DEFAULT NULL,
  `LONGITUD` decimal(11,8) DEFAULT NULL COMMENT 'Not in the original DB',
  `LATITUD` decimal(11,8) DEFAULT NULL COMMENT 'Not in the original DB',
  PRIMARY KEY (`IDPIF`),
  KEY `IDPIF` (`IDPIF`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table PIF10
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PIF10`;

CREATE TABLE `PIF10` (
  `IDPIF` int(11) NOT NULL,
  `IDPIA` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDPIF`),
  KEY `IDPIF` (`IDPIF`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



# Dump of table PIF2
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PIF2`;

CREATE TABLE `PIF2` (
  `IDPIF` int(11) NOT NULL,
  `DETECCION` datetime NOT NULL,
  `HDETECCION` datetime DEFAULT NULL,
  `LLEGADAPMT` datetime DEFAULT NULL,
  `HLLEGADAPMT` datetime DEFAULT NULL,
  `LLEGADAPMAE` datetime DEFAULT NULL,
  `HLLEGADAPMAE` datetime DEFAULT NULL,
  `LLEGADAPBH` datetime DEFAULT NULL,
  `HLLEGADAPBH` datetime DEFAULT NULL,
  `INCENDIOC` datetime DEFAULT NULL,
  `HINCENDIOC` datetime DEFAULT NULL,
  `INCENDIOE` datetime DEFAULT NULL,
  `HINCENDIOE` datetime DEFAULT NULL,
  `COMB_DET` datetime DEFAULT NULL COMMENT 'Not in the original DB',
  `COMB_CTRL` datetime DEFAULT NULL COMMENT 'Not in the original DB',
  `COMB_EXT` datetime DEFAULT NULL COMMENT 'Not in the original DB',
  `COMB_LLEGPMT` datetime DEFAULT NULL COMMENT 'Not in the original DB',
  `COMB_LLEGPMAE` datetime DEFAULT NULL COMMENT 'Not in the original DB',
  `COMB_LLEGPBH` datetime DEFAULT NULL COMMENT 'Not in the original DB',
  PRIMARY KEY (`IDPIF`),
  KEY `IDPIF` (`IDPIF`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



# Dump of table PIF3
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PIF3`;

CREATE TABLE `PIF3` (
  `IDPIF` int(11) NOT NULL,
  `IDDETECTADOPOR` tinyint(3) unsigned NOT NULL,
  `IDINICIADOJUNTOA` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`IDPIF`),
  KEY `IDPIF` (`IDPIF`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



# Dump of table PIF4
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PIF4`;

CREATE TABLE `PIF4` (
  `IDPIF` int(11) NOT NULL,
  `IDCAUSA` tinyint(3) unsigned NOT NULL,
  `IDGRUPOCAUSA` tinyint(3) unsigned NOT NULL,
  `IDCAUSAS` char(2) NOT NULL,
  `IDMOTIVACION` tinyint(3) unsigned DEFAULT NULL,
  `DIASTORMENTA` tinyint(3) unsigned DEFAULT NULL,
  `IDCAUSANTE` tinyint(3) unsigned NOT NULL,
  `IDCLASEDIA` tinyint(3) unsigned NOT NULL,
  `NOMBRECAUSANTE` char(50) DEFAULT NULL,
  PRIMARY KEY (`IDPIF`),
  KEY `IDPIF` (`IDPIF`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table PIF5
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PIF5`;

CREATE TABLE `PIF5` (
  `IDPIF` int(11) NOT NULL,
  `IDESTACION` char(6) DEFAULT NULL,
  `HORA` datetime DEFAULT NULL,
  `DULLUVIA` smallint(6) DEFAULT NULL,
  `TEMPMAX` smallint(6) DEFAULT NULL,
  `HRELATIVA` tinyint(3) unsigned DEFAULT NULL,
  `VVIENTO` tinyint(3) unsigned DEFAULT NULL,
  `DVIENTO` smallint(6) DEFAULT NULL,
  `IDMODELOCOMBUSTIBLE` tinyint(3) unsigned DEFAULT NULL,
  `PIGNICION` tinyint(3) unsigned DEFAULT NULL,
  `IDPELIGRO` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`IDPIF`),
  KEY `IDESTACION` (`IDESTACION`),
  KEY `IDPIF` (`IDPIF`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table PIF6
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PIF6`;

CREATE TABLE `PIF6` (
  `IDPIF` int(11) NOT NULL,
  `IDTIPOFUEGO` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`IDPIF`),
  KEY `IDPIF` (`IDPIF`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



# Dump of table PIF7
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PIF7`;

CREATE TABLE `PIF7` (
  `IDPIF` int(11) NOT NULL,
  `IDMEDIO` tinyint(3) unsigned DEFAULT NULL,
  `DISTAPIE` smallint(6) DEFAULT NULL,
  `TECNICOS` smallint(6) DEFAULT NULL,
  `AGENTESF` smallint(6) DEFAULT NULL,
  `CUADYBRIG` smallint(6) DEFAULT NULL,
  `BOMBEROS` smallint(6) DEFAULT NULL,
  `VOLUNORG` smallint(6) DEFAULT NULL,
  `OPERCIVIL` smallint(6) DEFAULT NULL,
  `GUARDIACI` smallint(6) DEFAULT NULL,
  `FUEJERCIT` smallint(6) DEFAULT NULL,
  `AUTOBOMBA` smallint(6) DEFAULT NULL,
  `BULLDOZER` tinyint(3) unsigned DEFAULT NULL,
  `TRACTORES` tinyint(3) unsigned DEFAULT NULL,
  `OTROS` tinyint(3) unsigned DEFAULT NULL,
  `AVIANFNUM` tinyint(3) unsigned DEFAULT NULL,
  `AVIANFDES` smallint(6) DEFAULT NULL,
  `AVICARNUM` tinyint(3) unsigned DEFAULT NULL,
  `AVICARDES` smallint(6) DEFAULT NULL,
  `HELEXTNUM` tinyint(3) unsigned DEFAULT NULL,
  `HELEXTBT` tinyint(3) unsigned DEFAULT NULL,
  `HELEXTDES` smallint(6) DEFAULT NULL,
  `HELTRANUM` tinyint(3) unsigned DEFAULT NULL,
  `HELTRABT` tinyint(3) unsigned DEFAULT NULL,
  `HELTRADES` smallint(6) DEFAULT NULL,
  `AERCOONUM` tinyint(3) unsigned DEFAULT NULL,
  `IDRETARDANTE` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`IDPIF`),
  KEY `IDPIF` (`IDPIF`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



# Dump of table PIF8
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PIF8`;

CREATE TABLE `PIF8` (
  `IDPIF` int(11) NOT NULL,
  `IDATAQUE` tinyint(3) unsigned NOT NULL,
  `IDTECNICAAI` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`IDPIF`),
  KEY `IDPIF` (`IDPIF`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



# Dump of table PIF9
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PIF9`;

CREATE TABLE `PIF9` (
  `IDPIF` int(11) NOT NULL,
  `MUERTOS` tinyint(3) unsigned DEFAULT NULL,
  `HERIDOS` tinyint(3) unsigned DEFAULT NULL,
  `ARPUBLIC` decimal(20,4) DEFAULT NULL,
  `ARESTADO` decimal(20,4) DEFAULT NULL,
  `ARCONSOR` decimal(20,4) DEFAULT NULL,
  `ARPUNCA` decimal(20,4) DEFAULT NULL,
  `ARPARTIC` decimal(20,4) DEFAULT NULL,
  `TOTALAR` decimal(20,4) DEFAULT NULL,
  `NARPUBLIC` decimal(20,4) DEFAULT NULL,
  `NARESTADO` decimal(20,4) DEFAULT NULL,
  `NARCONSOR` decimal(20,4) DEFAULT NULL,
  `NARPUNCA` decimal(20,4) DEFAULT NULL,
  `NARPARTIC` decimal(20,4) DEFAULT NULL,
  `TOTALNAR` decimal(20,4) DEFAULT NULL,
  `SUPERNF` decimal(20,4) DEFAULT NULL,
  `ESTIMPGLOBAL` tinyint(3) unsigned DEFAULT NULL,
  `IDSUPERFICIEQA` tinyint(3) unsigned DEFAULT NULL,
  `IDEFECTO` tinyint(3) unsigned DEFAULT NULL,
  `IDEROSION` tinyint(3) unsigned DEFAULT NULL,
  `IDALTERACION` tinyint(3) unsigned DEFAULT NULL,
  `IDEFECTO1` tinyint(3) unsigned DEFAULT NULL,
  `CCARRETERAS` tinyint(4) DEFAULT NULL,
  `CLINFERREAS` tinyint(4) DEFAULT NULL,
  `CSUMELECTRICO` tinyint(4) DEFAULT NULL,
  `CTELEFONO` tinyint(4) DEFAULT NULL,
  `DVIVIENDAS` tinyint(4) DEFAULT NULL,
  `DAVIVONAVIN` tinyint(4) DEFAULT NULL,
  `ENPIDSINO` tinyint(3) unsigned DEFAULT NULL,
  `REFORSINO` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`IDPIF`),
  KEY `IDPIF` (`IDPIF`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



# Dump of table PRODUCTOS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PRODUCTOS`;

CREATE TABLE `PRODUCTOS` (
  `IDPRODUCTO` tinyint(3) unsigned NOT NULL,
  `IDIDIOMA` tinyint(3) unsigned NOT NULL,
  `DESCRIPCION` char(25) DEFAULT NULL,
  PRIMARY KEY (`IDPRODUCTO`,`IDIDIOMA`),
  KEY `IDIDIOMA` (`IDIDIOMA`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table PRODUCTOS_VALORACION
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PRODUCTOS_VALORACION`;

CREATE TABLE `PRODUCTOS_VALORACION` (
  `IDPRODUCTO` tinyint(3) unsigned NOT NULL,
  `ANIO` smallint(6) NOT NULL,
  `IDPROVINCIA` tinyint(3) unsigned NOT NULL,
  `PX` decimal(20,4) DEFAULT NULL,
  `RX` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDPRODUCTO`,`ANIO`,`IDPROVINCIA`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



# Dump of table PROVINCIAS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PROVINCIAS`;

CREATE TABLE `PROVINCIAS` (
  `IDPROVINCIA` tinyint(3) unsigned NOT NULL,
  `NOMBRE` char(13) NOT NULL,
  `IDCOMUNIDAD` tinyint(3) unsigned NOT NULL,
  `SUPARBOLADA` decimal(20,4) DEFAULT NULL,
  `SUPFORESTAL` decimal(20,4) DEFAULT NULL,
  PRIMARY KEY (`IDPROVINCIA`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table REL_PIF3_VIGILANTEFIJO
# ------------------------------------------------------------

DROP TABLE IF EXISTS `REL_PIF3_VIGILANTEFIJO`;

CREATE TABLE `REL_PIF3_VIGILANTEFIJO` (
  `IDPIF` int(11) NOT NULL,
  `IDPROVINCIA` tinyint(3) unsigned NOT NULL,
  `IDVIGILANTE` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`IDPIF`,`IDPROVINCIA`,`IDVIGILANTE`),
  KEY `IDPIF` (`IDPIF`),
  KEY `IDPROVINCIA` (`IDPROVINCIA`,`IDVIGILANTE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



# Dump of table REL_TIPOSENP
# ------------------------------------------------------------

DROP TABLE IF EXISTS `REL_TIPOSENP`;

CREATE TABLE `REL_TIPOSENP` (
  `IDTIPOENP` tinyint(3) unsigned NOT NULL,
  `CODCOMBI` char(6) NOT NULL,
  PRIMARY KEY (`IDTIPOENP`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table REROSION
# ------------------------------------------------------------

DROP TABLE IF EXISTS `REROSION`;

CREATE TABLE `REROSION` (
  `IDEROSION` tinyint(3) unsigned NOT NULL,
  `IDIDIOMA` tinyint(3) unsigned NOT NULL,
  `DESCRIPCION` char(50) DEFAULT NULL,
  PRIMARY KEY (`IDEROSION`,`IDIDIOMA`),
  KEY `IDIDIOMA` (`IDIDIOMA`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table RETARDANTE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RETARDANTE`;

CREATE TABLE `RETARDANTE` (
  `IDRETARDANTE` tinyint(3) unsigned NOT NULL,
  `IDIDIOMA` tinyint(3) unsigned NOT NULL,
  `DESCRIPCION` char(50) DEFAULT NULL,
  PRIMARY KEY (`IDRETARDANTE`,`IDIDIOMA`),
  KEY `IDIDIOMA` (`IDIDIOMA`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table SINO
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SINO`;

CREATE TABLE `SINO` (
  `IDSINO` tinyint(3) unsigned NOT NULL,
  `IDIDIOMA` tinyint(3) unsigned NOT NULL,
  `DESCRIPCION` char(10) DEFAULT NULL,
  PRIMARY KEY (`IDSINO`,`IDIDIOMA`),
  KEY `IDIDIOMA` (`IDIDIOMA`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table SITUACIONLM
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SITUACIONLM`;

CREATE TABLE `SITUACIONLM` (
  `IDSITUACIONLM` tinyint(3) unsigned NOT NULL,
  `IDIDIOMA` tinyint(3) unsigned NOT NULL,
  `DESCRIPCION` char(50) DEFAULT NULL,
  PRIMARY KEY (`IDSITUACIONLM`,`IDIDIOMA`),
  KEY `IDIDIOMA` (`IDIDIOMA`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table SUPARBOLADAAFAUTOR
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SUPARBOLADAAFAUTOR`;

CREATE TABLE `SUPARBOLADAAFAUTOR` (
  `IDSUPERFICIEQA` tinyint(3) unsigned NOT NULL,
  `IDIDIOMA` tinyint(3) unsigned NOT NULL,
  `DESCRIPCION` char(15) DEFAULT NULL,
  PRIMARY KEY (`IDSUPERFICIEQA`,`IDIDIOMA`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table TECNICAATAQUEINDIRECTO
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TECNICAATAQUEINDIRECTO`;

CREATE TABLE `TECNICAATAQUEINDIRECTO` (
  `IDTECNICAAI` tinyint(3) unsigned NOT NULL,
  `IDIDIOMA` tinyint(3) unsigned NOT NULL,
  `DESCRIPCION` char(50) DEFAULT NULL,
  PRIMARY KEY (`IDTECNICAAI`,`IDIDIOMA`),
  KEY `IDIDIOMA` (`IDIDIOMA`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table TIPOENPDESCRIPCION
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TIPOENPDESCRIPCION`;

CREATE TABLE `TIPOENPDESCRIPCION` (
  `IDTIPOENP` tinyint(3) unsigned NOT NULL,
  `IDIDIOMA` tinyint(3) unsigned NOT NULL,
  `DESCRIPICON` char(75) DEFAULT NULL,
  PRIMARY KEY (`IDTIPOENP`,`IDIDIOMA`),
  KEY `IDIDIOMA` (`IDIDIOMA`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table TIPOFUEGO
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TIPOFUEGO`;

CREATE TABLE `TIPOFUEGO` (
  `IDTIPOFUEGO` tinyint(3) unsigned NOT NULL,
  `IDIDIOMA` tinyint(3) unsigned NOT NULL,
  `DESCRIPCION` char(50) DEFAULT NULL,
  PRIMARY KEY (`IDTIPOFUEGO`,`IDIDIOMA`),
  KEY `IDIDIOMA` (`IDIDIOMA`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table TIPORENTA
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TIPORENTA`;

CREATE TABLE `TIPORENTA` (
  `IDRENTA` tinyint(3) unsigned NOT NULL,
  `IDIDIOMA` tinyint(3) unsigned NOT NULL,
  `DESCRIPCION` char(50) DEFAULT NULL,
  PRIMARY KEY (`IDRENTA`,`IDIDIOMA`),
  KEY `IDIDIOMA` (`IDIDIOMA`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table TIPORENTA_VALORACION
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TIPORENTA_VALORACION`;

CREATE TABLE `TIPORENTA_VALORACION` (
  `IDRENTA` tinyint(3) unsigned NOT NULL,
  `ANIO` smallint(6) NOT NULL,
  `IDPROVINCIA` tinyint(3) unsigned NOT NULL,
  `R` decimal(20,4) DEFAULT NULL,
  PRIMARY KEY (`IDRENTA`,`ANIO`,`IDPROVINCIA`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;



# Dump of table TIPOSENP
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TIPOSENP`;

CREATE TABLE `TIPOSENP` (
  `IDTIPOENP` tinyint(3) unsigned NOT NULL,
  `IDIDIOMA` tinyint(3) unsigned NOT NULL,
  `DESCRIPCION` char(100) DEFAULT NULL,
  PRIMARY KEY (`IDTIPOENP`,`IDIDIOMA`),
  KEY `IDIDIOMA` (`IDIDIOMA`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table VIGILANTEFIJO
# ------------------------------------------------------------

DROP TABLE IF EXISTS `VIGILANTEFIJO`;

CREATE TABLE `VIGILANTEFIJO` (
  `IDPROVINCIA` tinyint(3) unsigned NOT NULL,
  `IDVIGILANTE` tinyint(3) unsigned NOT NULL,
  `NOMBRE` char(40) DEFAULT NULL,
  `HUSO` tinyint(3) unsigned DEFAULT NULL,
  `X` int(11) DEFAULT NULL,
  `Y` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDPROVINCIA`,`IDVIGILANTE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
