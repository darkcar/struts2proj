# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.23)
# Database: crm_struts2
# Generation Time: 2019-05-30 22:26:14 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table cst_customer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cst_customer`;

CREATE TABLE `cst_customer` (
  `cust_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cust_name` varchar(255) DEFAULT NULL,
  `cust_source` varchar(255) DEFAULT NULL,
  `cust_address` varchar(255) DEFAULT NULL,
  `cust_industry` varchar(255) DEFAULT NULL,
  `cust_level` varchar(255) DEFAULT NULL,
  `cust_phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cst_customer` WRITE;
/*!40000 ALTER TABLE `cst_customer` DISABLE KEYS */;

INSERT INTO `cst_customer` (`cust_id`, `cust_name`, `cust_source`, `cust_address`, `cust_industry`, `cust_level`, `cust_phone`)
VALUES
	(1,'Government of Saskatchewan','23','1155 11th Ave, Regina, SK','Public Sector','6','1-306-581-1055'),
	(2,'Saskpower','22','2811 Victor Ave, Regina, Sk','Power Util','7','1-306-881-3749'),
	(3,'Saskatchewan Government Insurance','22','1441 11th Ave, Regina, SK','Insurance','8','1-306-999-1233'),
	(4,'SaskTel','21','321 Saskatchewan Driver, Regina, SK','TeleCommunication','6','1-306-652-1033');

/*!40000 ALTER TABLE `cst_customer` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
