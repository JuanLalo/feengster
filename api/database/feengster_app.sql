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


-- Dumping database structure for feengster_app
CREATE DATABASE IF NOT EXISTS `feengster_app` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `feengster_app`;

-- Dumping structure for table feengster_app.cat_apps
CREATE TABLE IF NOT EXISTS `cat_apps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `platform` varchar(50) DEFAULT '' COMMENT '1: web 2: móvil',
  `estatus` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nombre` (`name`),
  KEY `platform` (`platform`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table feengster_app.cat_apps: ~8 rows (approximately)
/*!40000 ALTER TABLE `cat_apps` DISABLE KEYS */;
INSERT INTO `cat_apps` (`id`, `name`, `platform`, `estatus`) VALUES
	(1, 'MySupport Web', 'web', 1),
	(2, 'MySupport Móvil', 'android', 1),
	(3, 'Pet Web', 'web', 0),
	(4, 'Pet Móvil', 'web', 0),
	(5, 'Beaty Web', 'web', 0),
	(6, 'Beaty Móvil', 'web', 0),
	(8, 'Healthy Life Estetica', 'web', 1),
	(9, 'Feengster app', '', 1);
/*!40000 ALTER TABLE `cat_apps` ENABLE KEYS */;

-- Dumping structure for table feengster_app.cat_company
CREATE TABLE IF NOT EXISTS `cat_company` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `address_id` varchar(50) DEFAULT NULL,
  `company` varchar(60) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `type` varchar(50) DEFAULT NULL,
  `rfc` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table feengster_app.cat_company: 3 rows
/*!40000 ALTER TABLE `cat_company` DISABLE KEYS */;
INSERT INTO `cat_company` (`id`, `admin_id`, `address_id`, `company`, `priority`, `type`, `rfc`, `email`, `status`, `created_at`, `updated_at`) VALUES
	(2, 3, NULL, 'D´ Javier', 1, NULL, NULL, NULL, 1, '2018-05-05 16:22:31', '2018-05-05 17:55:00'),
	(3, 2, NULL, 'Vanguardia Magisterial ', 1, NULL, NULL, NULL, 0, '2018-05-05 16:22:31', '2018-05-05 16:24:43'),
	(1, 1, NULL, 'Feengster', 5, '0', NULL, 'feengster@gmail.com', 1, '2018-05-05 16:22:31', '2018-05-05 16:29:20');
/*!40000 ALTER TABLE `cat_company` ENABLE KEYS */;

-- Dumping structure for table feengster_app.cat_menus
CREATE TABLE IF NOT EXISTS `cat_menus` (
  `id` int(11) NOT NULL,
  `id_module` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `order_name` int(11) DEFAULT NULL,
  `android` int(11) DEFAULT '0',
  `url` varchar(200) DEFAULT NULL,
  `function_` varchar(200) DEFAULT NULL,
  `title` varchar(60) DEFAULT NULL,
  `title_desc` varchar(120) DEFAULT NULL,
  `print` char(1) DEFAULT '1',
  `show_` char(1) DEFAULT '1',
  `write_` char(1) DEFAULT '1',
  `change_` char(1) DEFAULT '1',
  `delete_` char(1) DEFAULT '0',
  `status` char(1) DEFAULT '1',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `FK_cat_menus_cat_module` (`id_module`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Se enuecntran almacenados todos los menús del producto.';

-- Dumping data for table feengster_app.cat_menus: ~26 rows (approximately)
/*!40000 ALTER TABLE `cat_menus` DISABLE KEYS */;
INSERT INTO `cat_menus` (`id`, `id_module`, `name`, `order_name`, `android`, `url`, `function_`, `title`, `title_desc`, `print`, `show_`, `write_`, `change_`, `delete_`, `status`, `updated_at`) VALUES
	(1, 1, 'Nueva Mascota', 2, 0, '', 'alert(\'Aun no!!\')', 'Dashboard Personal', 'En este dashboard se ven reflejado tu trabajo personal', '1', '1', '1', '1', '0', '1', '2018-04-27 20:33:56'),
	(2, 1, 'Grupal', 2, 0, '', 'completar(\'En contrucción\')', 'Dashboard Grupal', 'En este dashboard se ve reflejado el trabajo en tus grupos', '1', '1', '1', '1', '0', '1', '2018-04-05 18:39:40'),
	(3, 1, 'Supervisión', 3, 0, '', 'completar(\'En contrucción\')', 'Dashboard de Supervisión', 'En este dashboard se ve reflejado el trabajo de todos tus jestores a tu cargo', '1', '1', '1', '1', '0', '1', '2018-04-05 18:39:42'),
	(4, 1, 'Administracion', 4, 0, '', 'completar(\'En contrucción\')', 'Dashboard de Administración', 'en este Dashboard se ve reflejado el flujo del sistema en general', '1', '1', '1', '1', '0', '1', '2018-04-17 14:12:21'),
	(5, 2, 'Sin Asignar', 5, 1, 'views\\apps\\mysupport\\tickets\\verTickets.html', 'verTickets(\'SIN ASIGNAR\', 5)', 'Sin Asignar', 'Tickets que no se han asignados a un equipo o a un gestor individual', '1', '1', '1', '1', '0', '1', '2018-04-17 14:11:45'),
	(6, 2, 'Nuevos', 6, 1, 'views\\apps\\mysupport\\tickets\\verTickets.html', 'verTickets(\'NUEVO\', 6)', 'Tickets Nuevos', 'Nuevos tickets asigandos ', '1', '1', '1', '1', '0', '1', '2018-04-17 14:11:46'),
	(7, 2, 'Pendientes', 7, 1, 'views\\apps\\mysupport\\tickets\\verTickets.html', 'verTickets(\'PENDIENTE\', 7)', 'Tickets Pendientes', 'Tickets pendientes, se recomienda atenderlos lo más pronto posible', '1', '1', '1', '1', '0', '1', '2018-04-17 14:11:48'),
	(8, 2, 'Sin resolver', 8, 1, 'views\\apps\\mysupport\\tickets\\verTickets.html', 'verTickets(\'SIN RESOLVER\', 8)', 'Tickets Sin Resolver 1', 'Tickets sin resolbver se recomienda darle prioridad', '0', '1', '1', '1', '0', '1', '2018-04-17 14:12:56'),
	(9, 2, 'Actualizados recientemente', 10, 0, 'views\\apps\\mysupport\\tickets\\verTickets.html', 'completar(\'En contrucción\')', 'Tickets Actualizados Recientemente', '0', '0', '1', '1', '1', '0', '1', '2018-04-17 07:22:34'),
	(10, 2, 'Resueltos', 9, 1, 'views\\apps\\mysupport\\tickets\\verTickets.html', 'verTickets(\'RESUELTO\', 10)', 'Tickets Resueltos', 'Tus Tickets resueltos', '1', '1', '1', '1', '0', '1', '2018-04-17 14:11:50'),
	(11, 2, 'Suspendidos', 11, 1, 'views\\apps\\mysupport\\tickets\\verTickets.html', 'verTickets(\'SUSPENDIDO\', 11)', 'Tickets Suspendidos', 'Tickets suspendidos, gestiona para restablecer', '1', '1', '1', '1', '0', '1', '2018-04-17 14:11:52'),
	(12, 2, 'Eliminados', 12, 1, 'views\\apps\\mysupport\\tickets\\verTickets.html', 'verTickets(\'ELIMINADO\', 12)', 'Tickets Eliminados', 'Tickets eliminados ingresa al historial para conocer detalles', '1', '1', '1', '1', '0', '1', '2018-04-17 14:11:57'),
	(13, 6, 'No debe aparecer', 13, 0, '', 'completar(\'En contrucción\')', '0', '0', '1', '1', '1', '1', '0', '1', '2018-04-05 18:39:47'),
	(14, 2, 'Crear Ticket', 5, 1, 'views\\apps\\mysupport\\tickets\\verTickets.html', 'nuevoTicket()', NULL, NULL, '1', '1', '1', '1', '0', '1', '2018-04-17 14:11:42'),
	(15, 5, 'Administradores', 15, 0, 'views/users/user.html', 'verUsuarios(1,15)', 'Usuarios Administradores', 'Usuarios con todos los permisos del sistema.', '1', '1', '1', '1', '0', '1', '2018-04-17 09:21:51'),
	(16, 5, 'Supervisores', 15, 0, 'views/users/user.html', 'verUsuarios(2,16 )', 'Usuarios Supervisores', 'Usuario con permisos de supervisión, sólo acceso a reportes y dashboard', '1', '1', '1', '1', '0', '1', '2018-04-17 14:13:46'),
	(17, 5, 'Clientes', 15, 0, 'views/users/user.html', 'verUsuarios(4,17 )', 'Usuarios Clientes', 'Gestión de usuarios tipo cleintes', '1', '1', '1', '1', '0', '1', '2018-04-17 09:21:55'),
	(18, 5, 'Gestores', 15, 0, 'views/users/user.html', 'verUsuarios(3,18 )', 'Usuarios Gestores', NULL, '1', '1', '1', '1', '0', '1', '2018-04-17 09:22:01'),
	(19, 2, 'Gestionar Ticket', 5, 1, 'views\\apps\\mysupport\\tickets\\gestionar.html', 'alert(\'Olvidaste colocar el código fuente de este módulo\')', 'Gestionar Ticket', 'Gestiona el ticket acorde a tu punto de vista.', '0', '1', '1', '1', '0', '1', '2018-04-17 14:12:02'),
	(20, 7, 'Nuevo!', 1, 1, 'views/app/perfil.html', 'verPerfil()', '', NULL, '1', '1', '1', '1', '0', '1', '2018-04-27 20:34:44'),
	(21, 10, 'Bloquear Pantalla', 17, 1, NULL, 'redirigir(\'lockscreen.html\')', NULL, NULL, '1', '1', '1', '1', '0', '1', '2018-04-17 14:12:43'),
	(22, 10, 'Cerrar sesión', 18, 1, NULL, 'logout()', NULL, NULL, '1', '1', '1', '1', '0', '1', '2018-04-17 14:12:48'),
	(24, 8, 'Ultima semana', 19, 0, 'views\\apps\\mysupport\\tickets\\reporte.html', 'verTickets(\'ultimaSemana\', 24)', 'Ultima Semana', NULL, '1', '1', '1', '1', '0', '1', '2018-04-17 07:44:40'),
	(25, 8, 'Ingresos estimados', 20, 0, 'views\\apps\\mysupport\\tickets\\reporte.html', 'verTickets(\'ingresosEstimados\', 25)', 'Ingresos estimados', NULL, '1', '1', '1', '1', '0', '1', '2018-04-17 07:44:45'),
	(26, 9, 'Carga de trabajo', 21, 0, 'views\\apps\\mysupport\\tickets\\reporte.html', 'verTickets(\'coladeTrabajo\', 24)', 'Cola de trabajo', NULL, '1', '1', '1', '1', '0', '1', '2018-04-17 07:44:54'),
	(27, 1, 'Nuevo 2', 3, 0, NULL, 'alert(\'aún no\')', NULL, NULL, '1', '1', '1', '1', '0', '1', '2018-04-18 10:48:58');
/*!40000 ALTER TABLE `cat_menus` ENABLE KEYS */;

-- Dumping structure for table feengster_app.cat_module
CREATE TABLE IF NOT EXISTS `cat_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(70) NOT NULL,
  `icon` varchar(70) NOT NULL,
  `status` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COMMENT='Contiene todos los catalogos que contiene el sistema';

-- Dumping data for table feengster_app.cat_module: ~10 rows (approximately)
/*!40000 ALTER TABLE `cat_module` DISABLE KEYS */;
INSERT INTO `cat_module` (`id`, `name`, `icon`, `status`) VALUES
	(1, 'Dashboeard', 'dashboard', '0'),
	(2, 'Mis tickets', 'note', '1'),
	(4, 'Clientes', 'remove', '0'),
	(5, 'Usuarios', 'people', '1'),
	(6, 'Software', 'remove', '0'),
	(7, 'Cuenta', 'account_circle', '0'),
	(8, 'Reportes de Tickets', 'line_style', '0'),
	(9, 'Reportes de Actividades', 'view_headline', '0'),
	(10, 'Ajustes', 'settings', '1'),
	(11, 'Servicios', 'new', '1');
/*!40000 ALTER TABLE `cat_module` ENABLE KEYS */;

-- Dumping structure for table feengster_app.cat_team
CREATE TABLE IF NOT EXISTS `cat_team` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `des` varchar(259) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_cat_team_users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='catalogo de equipos';

-- Dumping data for table feengster_app.cat_team: ~2 rows (approximately)
/*!40000 ALTER TABLE `cat_team` DISABLE KEYS */;
INSERT INTO `cat_team` (`id`, `id_user`, `name`, `des`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Ingeniería de Software', 'Equipo encargado de los proyectos relacionados con la ing de software', '2018-03-05 23:50:35', '2018-03-05 23:50:35'),
	(2, 2, 'Ventas', 'Equipo encargado de la gestión de ventas', '2018-03-05 23:50:59', '2018-03-05 23:50:59');
/*!40000 ALTER TABLE `cat_team` ENABLE KEYS */;

-- Dumping structure for table feengster_app.cat_users
CREATE TABLE IF NOT EXISTS `cat_users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `desc` varchar(250) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `satatus` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table feengster_app.cat_users: ~5 rows (approximately)
/*!40000 ALTER TABLE `cat_users` DISABLE KEYS */;
INSERT INTO `cat_users` (`id`, `name`, `desc`, `number`, `satatus`, `updated_at`) VALUES
	(1, 'Administrador', 'Este grupo de  usuarios contiene permisos que controlan y afectan el funcionamiento general del sistema.\r\nAsí mismo controlan a los SUPERVISORES, CLIENTES y GESTORES.\r\nEn Jerarquía el son el número 1', 1, '1', '2018-02-27 13:49:47'),
	(2, 'Supervisor', 'Este grupo de usuarios está destinado para controlar,  flujo de datos, procesos y actividad de los clientes con los gestores.\r\nSólo pueden controlar  CLIENTES y GESTORES.\r\nEn Jerarquía son el número 2.', 2, '1', '2018-02-15 11:30:47'),
	(3, 'Gestor', 'Este grupo de usuarios tiene permisos para para interactuar entre clientes y otros gestores.\r\nEn Jerarquía son los número 3.', 2, '1', '2018-02-15 11:30:59'),
	(4, 'Cliente', 'Este grupo de usuarios sólo tiene permisos para manipular sus propios datos e interactual con sus gestores asignados.\r\nEn Jerarquía son los número 4', 50, '1', '2018-02-15 11:31:06'),
	(5, 'Sistemas', 'Usuario root', 1, '1', '2018-02-15 11:31:10');
/*!40000 ALTER TABLE `cat_users` ENABLE KEYS */;

-- Dumping structure for table feengster_app.images
CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT '0',
  `image foot` varchar(300) DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '0',
  `url` varchar(50) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Se almacenan todo tipo de imagenes, fotos de perfil, de protada, losgos etc...';

-- Dumping data for table feengster_app.images: ~0 rows (approximately)
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;

-- Dumping structure for table feengster_app.licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `key_` varchar(60) NOT NULL,
  `bd` varchar(30) NOT NULL,
  `fecha_ini` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_fin` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_licencias_cat_producto` (`app_id`),
  KEY `id_cliente` (`company_id`),
  CONSTRAINT `FK_licencias_cat_producto` FOREIGN KEY (`app_id`) REFERENCES `cat_apps` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table feengster_app.licenses: ~3 rows (approximately)
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` (`id`, `company_id`, `app_id`, `key_`, `bd`, `fecha_ini`, `fecha_fin`, `status`) VALUES
	(4, 1, 9, '12ee5xcU9ibPmAYuscl4Nrs19kFELFrGQuXMXYjy9GH6M3bhRn2rrSXA7H', 'feengster_app', '2018-05-05 16:29:30', '2019-05-05 15:48:44', 1),
	(5, 1, 1, '13ee5xcU9ibPmAYuscl4Nrs19kFELFrGQuXMXYjy9GH6M3bhRn2rrSXA7H', 'feengster_apps', '2018-05-05 16:29:34', '2019-05-05 15:48:44', 1),
	(7, 2, 5, '13ee5xcU9ibPmAYuscl4Nrs19kFELFrGQuXMXYjy9GH6M3bhRn2rrSXA7H', 'feengster_apps', '2018-05-05 17:56:51', '2019-05-05 15:48:44', 0);
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;

-- Dumping structure for table feengster_app.logins
CREATE TABLE IF NOT EXISTS `logins` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL DEFAULT '0',
  `platform` varchar(20) NOT NULL DEFAULT '0',
  `token` varchar(60) NOT NULL DEFAULT '1',
  `status` char(1) NOT NULL DEFAULT '1',
  `ip` varchar(60) DEFAULT '0',
  `city` varchar(100) DEFAULT '0',
  `explorer` varchar(60) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `FK_logins_users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table feengster_app.logins: ~1 rows (approximately)
/*!40000 ALTER TABLE `logins` DISABLE KEYS */;
INSERT INTO `logins` (`id`, `id_user`, `platform`, `token`, `status`, `ip`, `city`, `explorer`, `created_at`, `updated_at`) VALUES
	(2, 1, 'web', '1', '1', '0', '0', '0', '2018-04-04 23:12:41', '2018-05-05 18:00:43');
/*!40000 ALTER TABLE `logins` ENABLE KEYS */;

-- Dumping structure for table feengster_app.menu_permits
CREATE TABLE IF NOT EXISTS `menu_permits` (
  `id` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `id_permission` int(11) NOT NULL,
  `status` char(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_menu_permits_cat_menus` (`id_menu`),
  KEY `FK_menu_permits_cat_permissions` (`id_permission`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table feengster_app.menu_permits: ~0 rows (approximately)
/*!40000 ALTER TABLE `menu_permits` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_permits` ENABLE KEYS */;

-- Dumping structure for table feengster_app.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL DEFAULT '1',
  `company_controlled_id` int(11) NOT NULL DEFAULT '1',
  `username` varchar(50) NOT NULL DEFAULT '0',
  `email` varchar(60) NOT NULL DEFAULT '0',
  `password` varchar(60) NOT NULL DEFAULT '0',
  `oldpassword` varchar(60) NOT NULL DEFAULT '0',
  `platform` varchar(6) DEFAULT NULL,
  `type_default` int(11) NOT NULL DEFAULT '4',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- Dumping data for table feengster_app.users: ~11 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `company_id`, `company_controlled_id`, `username`, `email`, `password`, `oldpassword`, `platform`, `type_default`, `updated_at`, `created_at`, `status`) VALUES
	(1, 1, 1, 'Dev', 'feengster@gmail.com', '$2y$10$bD.H7IEgeGYeH/iLG7/Q5.1FobgsU/N83ayVB7cfNHWsscgW/N8pW', '0', 'web', 1, '2018-05-05 12:25:02', '2018-02-22 15:24:09', '1'),
	(2, 2, 1, 'Hernan', 'hernan@gmail.com', '$2y$10$5uQOceqgQFCq8J5pqyTsZ.92AfG0JLaPirg0FBOfOMNNBRxea5IDK', '0', NULL, 1, '2018-05-05 17:12:26', '2018-02-24 23:27:33', '0'),
	(3, 3, 1, 'Ever', 'ever@gmail.com', '$2y$10$.gJzm4LrhLM8CiGR9eIG3OPFrAlnOU3UIPX7XZGjhr/81L0JNAAMS', '0', NULL, 4, '2018-05-05 17:10:17', '2018-02-24 23:30:21', '1'),
	(4, 1, 1, 'Mariana', 'mariana@gmail.com', '$2y$10$BZBOjYMIgm9fzGZaM3OlFujQEKgLfLAcaQT5GG6IXLalaDwOBtYei', '0', NULL, 4, '2018-05-05 16:14:35', '2018-02-24 23:30:52', '0'),
	(5, 3, 3, 'Sandra', 'sandra@gmaill.com', '$2y$10$BZBOjYMIgm9fzGZaM3OlFujQEKgLfLAcaQT5GG6IXLalaDwOBtYei', '0', NULL, 4, '2018-05-05 18:08:04', '2018-02-24 23:31:18', '1'),
	(20, 1, 1, 'LilianaTavarez', 'lily@gmail.com', '$2y$10$MkHMoUBAFvJt7s/tMhX2q.Fhx7oWowlgUz2mFRUukUks5Qq7q9YHK', '0', 'Web', 2, '2018-04-17 04:04:19', '2018-04-17 02:44:10', '1'),
	(21, 1, 1, 'Mary', 'mary@gmail.com', '$2y$10$WHNQlf5iVSMQQcendvVMaOs8IBkOf4ojC2avyWacNAJunE1cPlMvm', '0', 'Web', 2, '2018-04-17 12:43:23', '2018-04-17 02:45:20', '1'),
	(24, 1, 1, 'Villegas', 'villegas@gmail.com', '$2y$10$IUIS2Xu6H00F/gNKciD5suKkHZ9XV3beR/C96gvVJEO5PRtC2DjPS', '0', 'Web', 3, '2018-05-05 16:13:04', '2018-04-17 04:24:38', '1'),
	(25, 1, 1, 'Liliana Rosas', 'liliana@gmail.com', '$2y$10$BQY5ZIAPa3XztCtVPqbZP.4s1Zi8qxzYcxkYw7wDV0t.Lrcq0usua', '0', 'Web', 3, '2018-05-05 16:13:40', '2018-04-17 04:42:04', '1'),
	(27, 1, 1, 'Adolfo', 'adolfo@gmail.com', '$2y$10$osUif1cEMeuk3vCANx21R.Yik7ZkAmBfLpjiH0IwrmCgcGu.Ok6Ha', '0', 'Web', 3, '2018-05-05 16:14:09', '2018-04-17 04:43:36', '1'),
	(28, 3, 3, 'Javier', 'javier@gmail.com', '$2y$10$osUif1cEMeuk3vCANx21R.Yik7ZkAmBfLpjiH0IwrmCgcGu.Ok6Ha', '0', 'Web', 3, '2018-05-05 17:42:06', '2018-05-05 17:15:28', '1');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table feengster_app.user_cat_user
CREATE TABLE IF NOT EXISTS `user_cat_user` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL DEFAULT '0',
  `id_cat_user` int(11) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_user_cat_user_users` (`id_user`),
  KEY `FK_user_cat_user_cat_users` (`id_cat_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Se almacenan los roles que tiene el usuario. Un usario puede ser Administrador, supervisor y gesto a la vez o solo cliente.';

-- Dumping data for table feengster_app.user_cat_user: ~21 rows (approximately)
/*!40000 ALTER TABLE `user_cat_user` DISABLE KEYS */;
INSERT INTO `user_cat_user` (`id`, `id_user`, `id_cat_user`, `status`, `created_at`, `updated_at`) VALUES
	(0, 0, 4, '1', '2018-05-05 17:15:28', '2018-05-05 17:15:28'),
	(1, 1, 1, '1', '2018-02-22 15:24:09', '2018-02-22 15:24:09'),
	(2, 2, 4, '1', '2018-02-24 23:27:33', '2018-02-24 23:27:33'),
	(3, 3, 4, '1', '2018-02-24 23:30:21', '2018-02-24 23:30:21'),
	(4, 4, 4, '1', '2018-02-24 23:30:52', '2018-02-24 23:30:52'),
	(5, 5, 4, '1', '2018-02-24 23:31:18', '2018-02-24 23:31:18'),
	(6, 1, 4, '1', '2018-02-26 19:08:07', '2018-02-26 19:08:07'),
	(7, 7, 3, '1', '2018-04-17 01:40:34', '2018-04-17 01:40:34'),
	(8, 8, 1, '1', '2018-04-17 01:44:51', '2018-04-17 01:44:51'),
	(9, 9, 1, '1', '2018-04-17 01:56:49', '2018-04-17 01:56:49'),
	(10, 13, 1, '1', '2018-04-17 01:59:45', '2018-04-17 01:59:45'),
	(11, 14, 1, '1', '2018-04-17 02:00:09', '2018-04-17 02:00:09'),
	(12, 15, 1, '1', '2018-04-17 02:00:34', '2018-04-17 02:00:34'),
	(13, 17, 1, '1', '2018-04-17 02:32:36', '2018-04-17 02:32:36'),
	(14, 18, 2, '1', '2018-04-17 02:38:13', '2018-04-17 02:38:13'),
	(15, 19, 3, '1', '2018-04-17 02:39:31', '2018-04-17 02:39:31'),
	(16, 20, 2, '1', '2018-04-17 02:44:10', '2018-04-17 02:44:10'),
	(17, 21, 2, '1', '2018-04-17 02:45:20', '2018-04-17 02:45:20'),
	(18, 24, 3, '1', '2018-04-17 04:24:38', '2018-04-17 04:24:38'),
	(19, 25, 1, '1', '2018-04-17 04:42:04', '2018-04-17 04:42:04'),
	(20, 27, 3, '1', '2018-04-17 04:43:36', '2018-04-17 04:43:36');
/*!40000 ALTER TABLE `user_cat_user` ENABLE KEYS */;

-- Dumping structure for table feengster_app.user_companies
CREATE TABLE IF NOT EXISTS `user_companies` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL DEFAULT '0',
  `id_company` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_user` (`id_user`),
  KEY `FK_user_companies_company` (`id_company`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Un usuario pertenece a una sola empresa | una empresa puede tener varios usuarios';

-- Dumping data for table feengster_app.user_companies: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_companies` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_companies` ENABLE KEYS */;

-- Dumping structure for table feengster_app.user_images
CREATE TABLE IF NOT EXISTS `user_images` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL DEFAULT '0',
  `id_img` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_img` (`id_img`),
  KEY `FK__users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='se almacenan todas la imagenes que tienen los usuarios para ello se debe contar con id_img valido';

-- Dumping data for table feengster_app.user_images: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_images` ENABLE KEYS */;

-- Dumping structure for table feengster_app.user_menus
CREATE TABLE IF NOT EXISTS `user_menus` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `custom` char(1) NOT NULL DEFAULT '0',
  `show_c` char(1) NOT NULL DEFAULT '0',
  `write_c` char(1) NOT NULL DEFAULT '0',
  `change_c` char(1) NOT NULL DEFAULT '0',
  `delete_c` char(1) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_menu` (`id_menu`),
  KEY `FK_user_menus_users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Se almacena el menú de cada usuario, cada menú almacena en menu_permits los permisos necesario para que\r\nun usuario lo use.';

-- Dumping data for table feengster_app.user_menus: ~25 rows (approximately)
/*!40000 ALTER TABLE `user_menus` DISABLE KEYS */;
INSERT INTO `user_menus` (`id`, `id_user`, `id_menu`, `custom`, `show_c`, `write_c`, `change_c`, `delete_c`, `status`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, '0', '0', '0', '0', '0', '1', '2018-02-22 16:27:22', '2018-04-26 22:38:04'),
	(2, 1, 2, '0', '0', '0', '0', '0', '1', '2018-02-22 16:27:32', '2018-04-26 22:38:04'),
	(3, 1, 3, '0', '0', '0', '0', '0', '1', '2018-02-22 16:27:42', '2018-04-26 22:38:04'),
	(4, 1, 4, '0', '0', '0', '0', '0', '1', '2018-02-22 16:27:56', '2018-04-26 22:38:04'),
	(7, 1, 5, '0', '0', '0', '0', '0', '1', '2018-02-22 16:28:12', '2018-04-26 22:38:04'),
	(9, 1, 6, '0', '0', '0', '0', '0', '1', '2018-02-22 16:28:30', '2018-04-26 22:38:04'),
	(10, 1, 7, '0', '0', '0', '0', '0', '1', '2018-02-22 16:28:37', '2018-04-26 22:38:04'),
	(11, 1, 8, '0', '0', '0', '0', '0', '1', '2018-02-22 16:28:47', '2018-04-26 22:38:04'),
	(12, 1, 9, '0', '0', '0', '0', '0', '1', '2018-02-22 16:28:55', '2018-04-26 22:38:04'),
	(13, 1, 10, '0', '0', '0', '0', '0', '1', '2018-02-22 16:29:09', '2018-04-26 22:38:04'),
	(14, 1, 11, '0', '0', '0', '0', '0', '1', '2018-02-22 16:29:30', '2018-04-26 22:38:04'),
	(15, 1, 12, '0', '0', '0', '0', '0', '1', '2018-02-22 16:29:40', '2018-04-26 22:38:04'),
	(16, 1, 14, '0', '0', '0', '0', '0', '1', '2018-03-07 16:30:35', '2018-04-26 22:38:04'),
	(17, 1, 15, '0', '0', '0', '0', '0', '1', '2018-03-07 17:38:01', '2018-04-26 22:38:04'),
	(18, 1, 17, '0', '0', '0', '0', '0', '1', '2018-03-07 17:38:18', '2018-04-26 22:38:04'),
	(19, 1, 18, '0', '0', '0', '0', '0', '1', '2018-03-07 17:38:35', '2018-04-26 22:38:04'),
	(20, 1, 16, '0', '0', '0', '0', '0', '1', '2018-03-12 16:12:51', '2018-04-26 22:38:04'),
	(21, 1, 19, '0', '0', '0', '0', '0', '1', '2018-03-29 11:09:24', '2018-04-26 22:38:04'),
	(22, 1, 20, '0', '0', '0', '0', '0', '1', '2018-04-17 04:52:18', '2018-04-26 22:38:04'),
	(24, 1, 21, '0', '0', '0', '0', '0', '1', '2018-04-17 04:56:54', '2018-04-26 22:38:04'),
	(25, 1, 22, '0', '0', '0', '0', '0', '1', '2018-04-17 07:16:12', '2018-04-26 22:38:04'),
	(26, 1, 24, '0', '0', '0', '0', '0', '1', '2018-04-17 07:27:00', '2018-04-26 22:38:04'),
	(27, 1, 25, '0', '0', '0', '0', '0', '1', '2018-04-17 07:30:06', '2018-04-26 22:38:04'),
	(28, 1, 26, '0', '0', '0', '0', '0', '1', '2018-04-17 07:32:14', '2018-04-26 22:38:04'),
	(29, 1, 27, '1', '1', '0', '0', '0', '1', '2018-04-18 10:50:21', '2018-04-26 22:38:04');
/*!40000 ALTER TABLE `user_menus` ENABLE KEYS */;

-- Dumping structure for table feengster_app.user_notifications
CREATE TABLE IF NOT EXISTS `user_notifications` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tittle` varchar(120) NOT NULL,
  `notification` varchar(600) NOT NULL,
  `link` varchar(300) DEFAULT NULL,
  `ico` varchar(60) DEFAULT NULL,
  `type` varchar(60) NOT NULL,
  `send_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_user_notifications_users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Se almecena las notificaciónes de usuarios.';

-- Dumping data for table feengster_app.user_notifications: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_notifications` ENABLE KEYS */;

-- Dumping structure for table feengster_app.user_profile
CREATE TABLE IF NOT EXISTS `user_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) DEFAULT '0',
  `surnames` varchar(120) DEFAULT '0',
  `role` varchar(120) DEFAULT '0',
  `slogan` varchar(120) DEFAULT '0',
  `birthdate` datetime DEFAULT NULL,
  `id_address` int(11) DEFAULT '0',
  `id_img_profile` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_user_profile_images` (`id_img_profile`),
  KEY `FK_user_profile_users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table feengster_app.user_profile: ~2 rows (approximately)
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` (`id`, `id_user`, `name`, `surnames`, `role`, `slogan`, `birthdate`, `id_address`, `id_img_profile`, `status`, `created_at`, `updated_at`) VALUES
	(4, 1, 'Web developer', '', 'Desarrollo', 'Si lohaces en la vida real, se puede programar', '1996-09-01 23:59:59', 0, NULL, 0, '2018-03-06 00:41:48', '2018-05-05 12:25:58'),
	(5, 3, 'Ever', '', 'Administrador', '0', NULL, 0, NULL, 0, '2018-05-05 17:58:28', '2018-05-05 17:59:00');
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;

-- Dumping structure for table feengster_app.user_ratings
CREATE TABLE IF NOT EXISTS `user_ratings` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_user_writer` int(11) NOT NULL,
  `stars` int(11) NOT NULL,
  `commentary` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='calificaciónes de los usuarios departe de otro usuarios de 1-5 estrellas.\r\n';

-- Dumping data for table feengster_app.user_ratings: ~2 rows (approximately)
/*!40000 ALTER TABLE `user_ratings` DISABLE KEYS */;
INSERT INTO `user_ratings` (`id`, `id_user`, `id_user_writer`, `stars`, `commentary`, `created_at`) VALUES
	(1, 1, 2, 4, 'Good job', '2018-03-05 23:26:04'),
	(3, 1, 5, 5, 'Sin comentarios', '2018-03-05 23:26:26');
/*!40000 ALTER TABLE `user_ratings` ENABLE KEYS */;

-- Dumping structure for table feengster_app.user_teams
CREATE TABLE IF NOT EXISTS `user_teams` (
  `id_team` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table feengster_app.user_teams: ~4 rows (approximately)
/*!40000 ALTER TABLE `user_teams` DISABLE KEYS */;
INSERT INTO `user_teams` (`id_team`, `id_user`) VALUES
	(1, 1),
	(1, 5),
	(1, 3),
	(2, 4);
/*!40000 ALTER TABLE `user_teams` ENABLE KEYS */;

-- Dumping structure for trigger feengster_app.users_after_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `users_after_insert` AFTER INSERT ON `users` FOR EACH ROW BEGIN
INSERT INTO `user_cat_user` (`id_user`, `id_cat_user`, `status`) VALUES ( new.id, new.type_default, '1');
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
