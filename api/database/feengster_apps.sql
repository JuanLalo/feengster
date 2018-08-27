-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.31-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for feengster_apps
CREATE DATABASE IF NOT EXISTS `feengster_apps` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `feengster_apps`;

-- Dumping structure for table feengster_apps.cat_tickets
CREATE TABLE IF NOT EXISTS `cat_tickets` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table feengster_apps.cat_tickets: ~6 rows (approximately)
/*!40000 ALTER TABLE `cat_tickets` DISABLE KEYS */;
INSERT INTO `cat_tickets` (`id`, `name`, `status`) VALUES
	(1, 'Pregunta', '1'),
	(2, 'Incidente', '1'),
	(3, 'Problema', '1'),
	(4, 'Tarea', '1'),
	(5, 'Proyecto Individual', '0'),
	(6, 'Pryecto en grupo', '0');
/*!40000 ALTER TABLE `cat_tickets` ENABLE KEYS */;

-- Dumping structure for table feengster_apps.log_ticket
CREATE TABLE IF NOT EXISTS `log_ticket` (
  `id` int(11) NOT NULL,
  `id_ticket` int(11) NOT NULL DEFAULT '0',
  `id_user` int(11) NOT NULL DEFAULT '0',
  `time` double NOT NULL DEFAULT '0.5',
  `desc` mediumtext NOT NULL,
  `crated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_log_ticket_tickets` (`id_ticket`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table feengster_apps.log_ticket: ~18 rows (approximately)
/*!40000 ALTER TABLE `log_ticket` DISABLE KEYS */;
INSERT INTO `log_ticket` (`id`, `id_ticket`, `id_user`, `time`, `desc`, `crated_at`) VALUES
	(0, 0, 1, 0.5, '<p>Se ha activado la cuenta.</p><p><ul><li><strong>asdas</strong></li><li><strong>dasd</strong></li><li><strong>as</strong></li><li><strong>d</strong></li><li><strong>asd</strong></li><li><strong>as</strong></li><li><strong>dsa</strong></li><li><strong>asd</strong></li><li><strong>as</strong></li><li><strong>d</strong></li></ul></p>                                        \n                                        ', '2018-04-26 22:22:30'),
	(2, 33, 2, 0.5, 'Se deben registrar los avances por cada componente terminado', '2018-04-04 19:14:26'),
	(3, 33, 1, 0.5, '<p>test</p>', '2018-04-17 09:41:08'),
	(4, 33, 1, 1, '<p><strong><em><strike>ssdfsdf</strike></em></strong></p>                                        \n                                        ', '2018-04-17 10:04:16'),
	(5, 42, 1, 1.5, '<p><strong><em><strike>nueva gestión</strike></em></strong></p>', '2018-04-17 10:20:59'),
	(6, 43, 1, 1, '<p><strong>Detallar el motivo por el cual fue eliminado este ticket.</strong></p><p><strong><br></strong></p><p><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYpIQeS8RYHm86h98u7BUw08IPWFwQB7z8rrZkRVf78M8nQwpduA" alt="andriod"><strong><br></strong></p>', '2018-04-17 11:04:25'),
	(7, 41, 1, 1.5, '<p><em><strong>gestion...</strong></em></p>                                        \n                                        ', '2018-04-17 11:20:46'),
	(8, 41, 1, 1.5, '<p><em><strong>gestion...</strong></em></p>                                        \n                                        ', '2018-04-17 11:20:51'),
	(9, 41, 1, 1.5, '<p><em><strong>gestion...</strong></em></p>                                        \n                                        ', '2018-04-17 11:21:00'),
	(10, 41, 1, 1.5, '<p><em><strong>gestion...</strong></em></p>                                        \n                                        ', '2018-04-17 11:21:05'),
	(11, 42, 1, 1.5, '<p><sup>gestiónes:</sup></p><p><ul><li><span style="font-size: 10.5px;">1</span></li><li><span style="font-size: 10.5px;">2</span></li><li><span style="font-size: 10.5px;">3</span></li><li><span style="font-size: 10.5px;">4</span></li><li><span style="font-size: 10.5px;">5</span></li><li><span style="font-size: 10.5px;">6</span></li><li><span style="font-size: 10.5px;"><br></span></li></ul></p>                                        \n                                        ', '2018-04-17 11:52:52'),
	(12, 42, 1, 1, '<p><sup>gestiónes:</sup></p><p><ul><li><span style="font-size: 10.5px;">1</span></li><li><span style="font-size: 10.5px;">2</span></li><li><span style="font-size: 10.5px;">3</span></li><li><span style="font-size: 10.5px;">4</span></li><li><span style="font-size: 10.5px;">5</span></li><li><span style="font-size: 10.5px;">6</span></li><li><span style="font-size: 10.5px;"><br></span></li></ul></p>                                        \n                                        ', '2018-04-17 11:53:17'),
	(13, 42, 1, 2, '<p>gestión ...</p>                                        \n                                        ', '2018-04-17 11:53:49'),
	(14, 42, 1, 1.5, '<p>gestión....</p>                                        \n                                        ', '2018-04-17 12:18:55'),
	(15, 42, 1, 1.5, '<p><strong>gestión&nbsp;</strong></p>', '2018-04-17 12:27:14'),
	(16, 42, 1, 1, '<p><em>gestión....</em></p>                                        \n                                        ', '2018-04-17 12:29:49'),
	(17, 42, 1, 2, '<p><strike>Ultima gestión</strike></p>                                        \n                                        ', '2018-04-17 12:33:24'),
	(18, 42, 1, 2, '<p>jgsdhshfdsfhsgdf</p>                                        \n                                        ', '2018-04-18 10:35:26');
/*!40000 ALTER TABLE `log_ticket` ENABLE KEYS */;

-- Dumping structure for table feengster_apps.tickets
CREATE TABLE IF NOT EXISTS `tickets` (
  `id` int(11) NOT NULL,
  `id_user_created` int(11) NOT NULL DEFAULT '0',
  `id_user_resolve` int(11) DEFAULT '0',
  `id_user_cc` int(11) DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `id_product` int(11) NOT NULL DEFAULT '0',
  `category` varchar(50) NOT NULL DEFAULT 'TICKET' COMMENT '1: ticket, 2:proyecto: 3:tarea',
  `team` int(1) NOT NULL DEFAULT '0' COMMENT '1: si, 2: no',
  `id_team` int(11) unsigned NOT NULL,
  `des` longtext NOT NULL,
  `type` varchar(50) NOT NULL COMMENT 'pregunta, incidente, problema, cambio, adecuación etc. crear un catalogo!',
  `priority` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'NUEVO' COMMENT 'sin asignar,nuevo, abierto, pendiente, resuelto, suspendido, eliminado',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `resolve_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `FK_tickets_users` (`id_user_created`),
  KEY `FK_tickets_users_2` (`id_user_resolve`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table feengster_apps.tickets: ~2 rows (approximately)
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` (`id`, `id_user_created`, `id_user_resolve`, `id_user_cc`, `name`, `code`, `id_product`, `category`, `team`, `id_team`, `des`, `type`, `priority`, `status`, `created_at`, `resolve_at`) VALUES
	(37, 1, 3, 0, 'Testing', 'T-180225001', 0, 'TICKET', 0, 0, '<p>De prueba....</p>', 'PREGUNTA', 'BAJA', 'RESUELTO', '2018-04-05 00:41:31', '0000-00-00 00:00:00'),
	(47, 1, 2, 5, 'Prueba desde Móvil', NULL, 2, 'TICKET', 0, 0, '<p>Prueba desde móvil...</p>', 'ADECUACIÓN', 'BAJA', 'NUEVO', '2018-04-17 14:06:30', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;

-- Dumping structure for table feengster_apps.ticket_files
CREATE TABLE IF NOT EXISTS `ticket_files` (
  `id` int(11) NOT NULL,
  `id_ticket` int(11) NOT NULL,
  `id_log` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `url` varchar(200) NOT NULL,
  `type` varchar(50) NOT NULL,
  `created_at` varchar(50) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table feengster_apps.ticket_files: ~0 rows (approximately)
/*!40000 ALTER TABLE `ticket_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_files` ENABLE KEYS */;

-- Dumping structure for trigger feengster_apps.tickets_before_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `tickets_before_insert` BEFORE INSERT ON `tickets` FOR EACH ROW BEGIN 
DECLARE n varchar(10);
DECLARE c varchar(10);

SELECT count(*) INTO n from tickets;
 SET n = n + 1;

IF (n < 10 ) THEN
  SET c = concat('0000', n); 
END IF;

IF (n < 100 and n > 10) THEN
  SET c = concat('000', n);
END IF;

IF (n < 1000 and n > 100) THEN
  SET c = concat('00', n);
END IF;

IF (n < 10000 and n > 1000) THEN
  SET c = concat('0', n);
END IF;

SET new.code = concat( 'T-', Date_format(now(),'%d%m%y') , '-', c);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
