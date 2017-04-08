CREATE DATABASE `commit-log` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `commit-log`;
CREATE TABLE `bulk_tbl` (
  `repo` varchar(255) DEFAULT NULL,
  `sha` char(40) NOT NULL DEFAULT '',
  `message` text,
  PRIMARY KEY (`sha`),
  KEY `test` (`message`(3))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
