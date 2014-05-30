/*
SQLyog Community Edition- MySQL GUI v8.04 Beta2
MySQL - 5.5.20 : Database - mydemo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`mydemo` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mydemo`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `flag` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51523 DEFAULT CHARSET=utf8;

/*Data for the table `account` */

insert  into `account`(`account_id`,`status`,`username`,`password`,`flag`) values (1,11,'aa','123456','o'),(2,22,'bb','222222','p'),(10339,2,'abcdef','123132',NULL),(51522,2,'abcdef','123132',NULL);

/*Table structure for table `person` */

DROP TABLE IF EXISTS `person`;

CREATE TABLE `person` (
  `personId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `age` varchar(32) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`personId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `person` */

insert  into `person`(`personId`,`name`,`age`,`address`) values (98,'w','11','wwwwwwwwwwwwwwww'),(2,'qq','22','qqqqqqqqqqqqqqq'),(8,'我','88','88'),(18,'才','在','aaa');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
