-- --------------------------------------------------------
-- Host:                         feengster.com
-- ServerSP_get_nameSP_get_name version:               5.6.39-cll-lve - MySQL Community Server (GPL)
-- Server OS:                    Linux
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for feengster_master
CREATE DATABASE IF NOT EXISTS `feengster_master` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `feengster_master`;

-- Dumping structure for view feengster_master.all_user_all_apps_all_company
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `all_user_all_apps_all_company` (
	`id` INT(11) NOT NULL,
	`username` VARCHAR(40) NULL COLLATE 'latin1_swedish_ci',
	`name` VARCHAR(100) NOT NULL COLLATE 'latin1_swedish_ci',
	`surnames` VARCHAR(120) NULL COLLATE 'latin1_swedish_ci',
	`phone` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`email` VARCHAR(60) NOT NULL COLLATE 'latin1_swedish_ci',
	`img` VARCHAR(9000) NOT NULL COLLATE 'latin1_swedish_ci',
	`password` VARCHAR(60) NOT NULL COLLATE 'latin1_swedish_ci',
	`oldpassword` VARCHAR(60) NOT NULL COLLATE 'latin1_swedish_ci',
	`birthdate` DATE NULL,
	`platform` VARCHAR(6) NULL COLLATE 'latin1_swedish_ci',
	`updated_at` TIMESTAMP NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`status` VARCHAR(10) NOT NULL COLLATE 'latin1_swedish_ci',
	`app_id` INT(11) NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for table feengster_master.app_menus
CREATE TABLE IF NOT EXISTS `app_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_app` int(11) NOT NULL DEFAULT '9',
  `id_menu` int(11) NOT NULL,
  `custom` char(1) NOT NULL DEFAULT '0',
  `status` varchar(50) NOT NULL DEFAULT 'ACTIVO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_app_menus_cat_apps` (`id_app`),
  KEY `FK2_app_menu` (`id_menu`),
  CONSTRAINT `FK2_app_menu` FOREIGN KEY (`id_menu`) REFERENCES `cat_menus` (`id`),
  CONSTRAINT `FK_app_menus_cat_apps` FOREIGN KEY (`id_app`) REFERENCES `cat_apps` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COMMENT='Se almacena el menú de cada usuario, cada menú almacena en menu_permits los permisos necesario para que\r\nun usuario lo use.';

-- Dumping data for table feengster_master.app_menus: ~8 rows (approximately)
/*!40000 ALTER TABLE `app_menus` DISABLE KEYS */;
INSERT INTO `app_menus` (`id`, `id_app`, `id_menu`, `custom`, `status`, `created_at`, `updated_at`) VALUES
	(1, 11, 38, '0', 'ACTIVO', '2018-11-22 14:18:45', '2018-11-22 14:18:45'),
	(2, 11, 40, '0', 'ACTIVO', '2018-11-22 14:20:35', '2018-11-22 08:20:31'),
	(3, 11, 34, '0', 'ACTIVO', '2018-11-22 14:20:47', '2018-11-22 08:20:43'),
	(4, 11, 41, '0', 'ACTIVO', '2018-11-22 14:21:05', '2018-11-22 08:21:00'),
	(5, 11, 37, '0', 'ACTIVO', '2018-11-22 14:22:04', '2018-11-22 08:22:00'),
	(6, 11, 36, '0', 'ACTIVO', '2018-11-22 14:22:18', '2018-11-22 08:22:14'),
	(7, 11, 35, '0', 'ACTIVO', '2018-11-22 14:23:06', '2018-11-22 08:23:02'),
	(8, 11, 39, '0', 'ACTIVO', '2018-11-22 14:23:27', '2018-11-22 08:23:23'),
	(9, 11, 22, '0', 'ACTIVO', '2018-11-22 14:24:02', '2018-11-22 08:23:58'),
	(10, 11, 42, '0', 'ACTIVO', '2018-11-22 14:49:38', '2018-11-22 08:49:33'),
	(12, 11, 44, '0', 'ACTIVO', '2018-11-26 10:52:46', '2018-11-26 04:52:44'),
	(13, 11, 45, '0', 'ACTIVO', '2018-11-28 14:49:20', '2018-11-28 08:49:18'),
	(14, 11, 46, '0', 'ACTIVO', '2018-12-18 15:24:12', '2018-12-18 09:24:08'),
	(15, 14, 38, '0', 'ACTIVO', '2019-01-13 21:47:22', '2019-01-13 15:47:20'),
	(16, 14, 41, '0', 'ACTIVO', '2019-01-13 22:23:30', '2019-01-13 16:23:28'),
	(17, 14, 47, '0', 'ACTIVO', '2019-01-24 19:10:57', '2019-01-24 13:10:55'),
	(18, 14, 48, '0', 'ACTIVO', '2019-01-24 19:13:41', '2019-01-24 13:13:36'),
	(19, 14, 49, '0', 'ACTIVO', '2019-01-24 19:17:29', '2019-01-24 13:17:28'),
	(20, 14, 50, '0', 'ACTIVO', '2019-01-24 19:22:24', '2019-01-24 13:22:20');
/*!40000 ALTER TABLE `app_menus` ENABLE KEYS */;

-- Dumping structure for table feengster_master.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_app` int(11) NOT NULL DEFAULT '0',
  `id_company` int(11) NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL,
  `name` varchar(60) NOT NULL,
  `desc_` varchar(300) DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'ACTIVO',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_app` (`id_app`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COMMENT='Categorias genericas como; Servicios, Productos...';

-- Dumping data for table feengster_master.categories: 15 rows
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `id_app`, `id_company`, `type`, `name`, `desc_`, `status`, `updated_at`, `created_at`) VALUES
	(1, 5, 1, 'PRODUCTOS', 'Ceras', 'Descripción de la categoría', 'ACTIVO', '2018-06-27 03:37:03', '2018-06-27 03:37:03'),
	(3, 5, 1, 'SERVICIOS', 'Cortes para caballero', '', 'ACTIVO', '2018-06-27 17:41:22', '2018-06-27 17:41:22'),
	(4, 10, 9, 'PRODUCTOS', 'Block', '', 'ACTIVO', '2018-07-04 22:12:13', '2018-07-04 22:12:13'),
	(5, 10, 9, 'PRODUCTOS', 'Tabique', '', 'ACTIVO', '2018-07-04 22:12:38', '2018-07-04 22:12:38'),
	(6, 10, 9, 'SERVICIOS', 'Impermeabilizante', '', 'ACTIVO', '2018-07-04 22:13:37', '2018-07-04 22:13:37'),
	(7, 10, 9, 'SERVICIOS', 'Pintura', '', 'ACTIVO', '2018-07-04 22:13:52', '2018-07-04 22:13:52'),
	(8, 10, 9, 'SERVICIOS', 'Obra civil', '', 'ACTIVO', '2018-07-04 22:14:17', '2018-07-04 22:14:17'),
	(9, 10, 9, 'SERVICIOS', 'Mantenimiento', '', 'ACTIVO', '2018-07-04 22:14:36', '2018-07-04 22:14:36'),
	(10, 5, 2, 'PRODUCTOS', 'nueva', 'nueva desc', 'ACTIVO', '2018-07-16 12:28:31', '2018-07-16 12:28:31'),
	(11, 5, 2, 'SERVICIOS', 'servicio', 'desc', 'ACTIVO', '2018-07-16 12:33:24', '2018-07-16 12:33:24'),
	(12, 5, 2, 'CITAS', 'Cita especial', 'Esta cita puede ser dentro o fuera de las instalaciones y también puede contener promociones.', 'ACTIVO', '2018-07-23 09:34:05', '2018-07-23 09:28:07'),
	(13, 5, 2, 'CITAS', 'Cita', 'Citas ordinarias. Se le darán 10 minutos de tolerancia, después de ese tiempo se le atenderá acorde a la disponibilidad.', 'ACTIVO', '2018-07-23 09:33:15', '2018-07-23 09:33:15'),
	(14, 10, 1, 'PRODUCTOS', 'suela', '', 'ACTIVO', '2018-08-08 20:34:14', '2018-08-08 20:34:14'),
	(15, 10, 11, 'PRODUCTOS', 'Suela A', 'La suela tipo "A" sirve para...', 'ACTIVO', '2018-08-08 20:46:40', '2018-08-08 20:46:40'),
	(16, 10, 11, 'PRODUCTOS', 'Suela B', 'La Suela tipo "B" sirve para...', 'ACTIVO', '2018-08-08 20:47:03', '2018-08-08 20:47:03');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table feengster_master.cat_apps
CREATE TABLE IF NOT EXISTS `cat_apps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `code` varchar(60) NOT NULL,
  `platform` varchar(50) DEFAULT '' COMMENT '1: web 2: móvil',
  `url` varchar(50) DEFAULT '',
  `status` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'rent',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `nombre` (`name`),
  KEY `platform` (`platform`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Dumping data for table feengster_master.cat_apps: ~7 rows (approximately)
/*!40000 ALTER TABLE `cat_apps` DISABLE KEYS */;
INSERT INTO `cat_apps` (`id`, `name`, `code`, `platform`, `url`, `status`, `type`, `updated_at`, `created_at`) VALUES
	(1, 'Feengster Login1', 'j85pdf788mbt6yhp8ñpn89385jybfds89pp234jmknsfdpouuybg7iy895pi', 'web', 'app/', 'PRUEBAS', 'component', '2018-12-19 11:43:03', '2018-11-28 11:01:59'),
	(2, 'Feengster Panel', 'kjbsd7yuhn234ou8u9j2jkhuhsjknkjuw78j2389h324kuh89prfweuiorhw', 'web', 'app/main/', 'PRUEBAS', 'free', '2018-12-04 15:37:06', '2018-11-28 11:01:59'),
	(5, 'Beaty', '8ujnbftgbvrte4ou8u9j2jkhuhsjknkjuw78j2389h324kuh89prfweu8765', 'web', 'beauty/', 'ANÁLISIS', 'rent', '2018-12-04 15:38:17', '2018-11-28 11:01:59'),
	(10, 'ForSale', '87hyr7yuhn7yhbg8u9j2jkhuhojhnbjuw78j2389h324kuh89prfweuoiuyh', 'web', 'forsale/', 'ANÁLISIS', 'rent', '2018-12-04 15:38:18', '2018-11-28 11:01:59'),
	(11, 'Lab', 'kjbsd7yuhn234ou8uuyt2jkhuhsjiujnhw78j2389h324kuh89prfweu8765', 'web', 'lab/', 'PRUEBAS', 'tool', '2018-12-04 15:38:25', '2018-11-28 11:01:59'),
	(12, 'Finantial', 'ASDasdGVet4dfgDFg845dfgg7etTS7PJ8WERe87sFSR6987Tr898sdfSDFer', 'Web,android', '\\finantial', 'ANÁLISIS', 'rent', '2018-12-04 15:38:31', '2018-11-28 11:02:15'),
	(13, 'Web Page', 'DPLo7oU7sdFsqXcbvdfgd87sdF7fSDF87FSD7fsd7sdfSD7fSEeUIOPA78A8', 'Web', '../index.html', 'DESARROLLO', 'component', '2018-12-04 15:40:14', '2018-11-29 10:40:07'),
	(14, 'Dental', 'jk2379hipub2398h39243bwer823b23ry50weurhjcd8fb3823', 'web', 'dental\\', 'DESARROLLO', 'rent', '2019-01-13 15:00:24', '2019-01-13 21:00:24');
/*!40000 ALTER TABLE `cat_apps` ENABLE KEYS */;

-- Dumping structure for table feengster_master.cat_company
CREATE TABLE IF NOT EXISTS `cat_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `address_id` varchar(50) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `type` varchar(50) DEFAULT NULL,
  `rfc` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'ACTIVO',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK1_admin` (`admin_id`),
  CONSTRAINT `FK1_admin` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table feengster_master.cat_company: ~0 rows (approximately)
/*!40000 ALTER TABLE `cat_company` DISABLE KEYS */;
INSERT INTO `cat_company` (`id`, `name`, `admin_id`, `address_id`, `priority`, `type`, `rfc`, `email`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Feengster', 1, NULL, 0, 'Master', NULL, 'feengster@gmail.com', 'ACTIVO', '2018-10-19 08:19:38', '2018-11-20 13:00:12'),
	(2, 'Cosmo Dental', NULL, NULL, 1, 'Clinica Dental', NULL, NULL, 'ACTIVO', '2019-01-14 18:54:08', '2019-01-14 18:54:08');
/*!40000 ALTER TABLE `cat_company` ENABLE KEYS */;

-- Dumping structure for table feengster_master.cat_menus
CREATE TABLE IF NOT EXISTS `cat_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_module` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `order_name` int(11) DEFAULT NULL,
  `android` int(11) DEFAULT '0',
  `url` varchar(200) DEFAULT NULL,
  `function_` varchar(200) DEFAULT NULL,
  `title` varchar(60) DEFAULT NULL,
  `title_desc` varchar(300) DEFAULT NULL,
  `print` char(1) DEFAULT '1',
  `show_` char(1) DEFAULT '1',
  `status` varchar(50) DEFAULT '1',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_cat_menus_cat_module` (`id_module`),
  CONSTRAINT `FK_cat_menus_cat_module` FOREIGN KEY (`id_module`) REFERENCES `cat_module` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1 COMMENT='Se enuecntran almacenados todos los menús del producto.';

-- Dumping data for table feengster_master.cat_menus: ~9 rows (approximately)
/*!40000 ALTER TABLE `cat_menus` DISABLE KEYS */;
INSERT INTO `cat_menus` (`id`, `id_module`, `name`, `order_name`, `android`, `url`, `function_`, `title`, `title_desc`, `print`, `show_`, `status`, `updated_at`) VALUES
	(22, 10, 'Logout', 18, 1, '...', '$f.session.logout()', '', '', '1', '1', 'NO ACTIVO', '2018-12-17 15:27:29'),
	(34, 14, 'Bootstrap 3 Form Builder', 2, 0, 'lab\\diseño\\builder\\builder\\builder.html', 'obtenerContenido(34)', 'Crear formularios', 'Crea el diseño del formulario acorde a los requerimientos del módulo.', '1', '1', 'ACTIVO', '2018-11-20 12:57:43'),
	(35, 14, 'Bootstrap 3  Validator', 3, 0, 'lab\\desarrollo\\builder.html', 'obtenerContenido(35)', 'Docuementación de Bootstrap Validator', 'Aquí podrás encontrar todo la documentación de Bootstrap validator. Para la validación de los formularios creados y usad', '1', '1', 'ACTIVO', '2018-11-20 12:57:43'),
	(36, 17, 'Modulos', 1, 0, 'lab\\route\\modulos\\modulos.html', 'obtenerContenido(36)', 'Administración de Modulos', 'Crea y edita módulos de cualquier aplicación de Feengster.', '1', '1', 'ACTIVO', '2018-11-20 12:57:43'),
	(37, 17, 'Menus', 1, 0, 'lab\\route\\menus\\menus.html', 'obtenerContenido(37)', 'Administrador de menús', 'Crea y edita todos los menus que tiene Feengster App', '1', '1', 'ACTIVO', '2018-11-21 14:12:28'),
	(38, 17, 'Asignar menús', 2, 0, 'lab\\route\\menus\\menus-app.html', 'obtenerContenido(38)', 'Asignación de Menús', 'Asigna y restringe menús de todas las appa de Feengster', '1', '1', 'ACTIVO', '2018-11-21 14:20:03'),
	(39, 40, 'Código de tablas', 7, 1, 'lab\\security\\tables\\tables.html', 'obtenerContenido(39)', 'Código de tablas', 'Una vez registrada una tabla se genera automáticamente un código que representa la tabla para poder hacer peticiones desde el exterior.', '1', '1', 'ACTIVO', '2018-11-21 15:30:51'),
	(40, 40, 'Logins', 6, 1, 'lab\\security\\logins\\logins.html', 'obtenerContenido(40)', 'Logins en Feengster', 'Registro de todos los accesos a todas las aplicaciones de Feengster. ', '1', '1', 'ACTIVO', '2018-11-21 16:02:21'),
	(41, 5, 'Administrar Usuarios FG', 6, 1, 'lab\\users\\user.html', 'obtenerContenido(41)', 'Todos los Usuarios de Feengster', 'Se muestran todos los usuarios de Feengster de todas las aplicaciones.', '1', '1', 'ACTIVO', '2018-11-28 11:36:30'),
	(42, 41, 'Administrar licencias 2', 6, 1, 'lab\\licenses\\administrar\\licenses.html', 'obtenerContenido(42)', 'Administrar licencias', 'Licencias que tienen las empresas que usan los aplicaciones de Feengster. ', '1', '1', 'ACTIVO', '2018-11-28 11:36:39'),
	(44, 43, 'Administrar App', 5, 1, 'lab\\apps\\administrar\\apps.html', 'obtenerContenido(44)', 'Administra todas las aplicaciones de Feengster (iOs, android', 'Administra los datos más relevantes de las aplicaciones de Feengster.', '1', '1', 'ACTIVO', '2018-11-26 15:39:57'),
	(45, 45, 'Dropdown options', 9, 0, 'lab\\options\\dropdown\\dropdown.html', 'obtenerContenido(45)', 'Todas las opciones que se utilizan en todas las apps de Feen', 'Generalmente se usan en los estatus, espatas y de más.  [SELECT]', '1', '1', 'ACTIVO', '2018-11-28 14:44:46'),
	(46, 46, 'Administrar AP', 8, 1, 'lab\\test\\almacen.html', 'obtenerContenido(46)', 'Almacén de partes', 'Por Mauricio', '1', '1', 'ACTIVO', '2018-12-18 15:25:25'),
	(47, 47, 'Nuevo paciente', 9, 1, 'dental\\pacientes\\nuevo.html', '_', '', '', '1', '1', 'ACTIVO', '2019-01-24 13:10:25'),
	(48, 48, 'Por paciente', 12, 0, 'dental\\', '_', '_', '', '1', '1', 'ACTIVO', '2019-01-24 13:13:04'),
	(49, 49, 'Alimentar', 16, 1, '_', '_', '_', '', '1', '1', 'ACTIVO', '2019-01-24 13:16:59'),
	(50, 50, 'Historial', 17, 1, '_', '_', '_', '', '1', '1', 'ACTIVO', '2019-01-24 13:21:52');
/*!40000 ALTER TABLE `cat_menus` ENABLE KEYS */;

-- Dumping structure for table feengster_master.cat_module
CREATE TABLE IF NOT EXISTS `cat_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(70) NOT NULL,
  `icon` varchar(70) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'ACTIVO',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1 COMMENT='Contiene todos los catalogos que contiene el sistema';

-- Dumping data for table feengster_master.cat_module: ~8 rows (approximately)
/*!40000 ALTER TABLE `cat_module` DISABLE KEYS */;
INSERT INTO `cat_module` (`id`, `name`, `icon`, `status`, `updated_at`) VALUES
	(5, 'Usuarios', 'people', 'ACTIVO', '2018-11-26 09:55:00'),
	(10, 'Ajustes', 'settings', 'ACTIVO', '2018-11-20 16:53:03'),
	(14, 'Forms', 'chrome_reader_mode', 'ACTIVO', '2018-11-20 16:53:03'),
	(17, 'Routing', 'router', 'ACTIVO', '2018-11-26 10:55:37'),
	(40, 'Security', 'security', 'ACTIVO', '2018-11-21 09:24:40'),
	(41, 'Licenses', 'verified_user', 'ACTIVO', '2018-11-22 08:42:44'),
	(43, 'App', 'view_carousel', 'ACTIVO', '2018-11-28 11:50:25'),
	(45, 'Options', 'sort', 'ACTIVO', '2018-11-28 06:56:08'),
	(46, 'Almacén de Partes', 'view_stream', 'ACTIVO', '2018-12-18 09:22:43'),
	(47, 'Pacientes ', 'accessibility', 'ACTIVO', '2019-01-24 13:08:58'),
	(48, 'Historial Clínico', 'book', 'ACTIVO', '2019-01-24 13:12:06'),
	(49, 'Inventario', 'filter_9_plus', 'ACTIVO', '2019-01-24 13:16:05'),
	(50, 'Pagos', 'attach_money', 'ACTIVO', '2019-01-24 13:20:37');
/*!40000 ALTER TABLE `cat_module` ENABLE KEYS */;

-- Dumping structure for table feengster_master.cat_options
CREATE TABLE IF NOT EXISTS `cat_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `value` varchar(50) NOT NULL,
  `option` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table feengster_master.cat_options: ~10 rows (approximately)
/*!40000 ALTER TABLE `cat_options` DISABLE KEYS */;
INSERT INTO `cat_options` (`id`, `type`, `value`, `option`, `status`) VALUES
	(1, 'status_1_0', 'ACTIVO', 'ACTIVO', 'ACTIVO'),
	(2, 'status_1_0', 'NO ACTIVO', 'NO ACTIVO', 'ACTIVO'),
	(3, 'yes_no_binary', '0', 'No', 'ACTIVO'),
	(4, 'yes_no_binary', '1', 'Sí', 'ACTIVO'),
	(5, 'status_apps', 'DESARROLLO', 'Desarrollo', 'ACTIVO'),
	(6, 'status_apps', 'ANÁLISIS', 'Análisis', 'ACTIVO'),
	(7, 'status_apps', 'PRUEBAS', 'Pruebas', 'ACTIVO'),
	(8, 'status_apps', 'PROMOCIÓN', 'Promoción', 'ACTIVO'),
	(9, 'status_apps', 'PRODUCCIÓN', 'Producción', 'NO ACTIVO'),
	(10, 'status_apps', 'NO ACTIVO', 'No Activo', 'ACTIVO'),
	(11, 'borrar', 'borrar', 'borrar', 'ACTIVO'),
	(12, 'borrar', 'otre', 'etertr', 'ACTIVO');
/*!40000 ALTER TABLE `cat_options` ENABLE KEYS */;

-- Dumping structure for table feengster_master.cat_team
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

-- Dumping data for table feengster_master.cat_team: ~2 rows (approximately)
/*!40000 ALTER TABLE `cat_team` DISABLE KEYS */;
INSERT INTO `cat_team` (`id`, `id_user`, `name`, `des`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Ingeniería de Software', 'Equipo encargado de los proyectos relacionados con la ing de software', '2018-03-06 05:50:35', '2018-03-06 05:50:35'),
	(2, 2, 'Ventas', 'Equipo encargado de la gestión de ventas', '2018-03-06 05:50:59', '2018-03-06 05:50:59');
/*!40000 ALTER TABLE `cat_team` ENABLE KEYS */;

-- Dumping structure for table feengster_master.cat_tickets
CREATE TABLE IF NOT EXISTS `cat_tickets` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table feengster_master.cat_tickets: ~6 rows (approximately)
/*!40000 ALTER TABLE `cat_tickets` DISABLE KEYS */;
INSERT INTO `cat_tickets` (`id`, `name`, `status`) VALUES
	(1, 'Pregunta', '1'),
	(2, 'Incidente', '1'),
	(3, 'Problema', '1'),
	(4, 'Tarea', '1'),
	(5, 'Proyecto Individual', '0'),
	(6, 'Pryecto en grupo', '0');
/*!40000 ALTER TABLE `cat_tickets` ENABLE KEYS */;

-- Dumping structure for table feengster_master.cat_users
CREATE TABLE IF NOT EXISTS `cat_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `abbreviated` varchar(10) DEFAULT NULL,
  `id_app` int(11) NOT NULL DEFAULT '0',
  `id_permission` int(11) NOT NULL DEFAULT '0',
  `desc_` varchar(250) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_cat_users_cat_apps` (`id_app`),
  KEY `FK_cat_users_permissions` (`id_permission`),
  CONSTRAINT `FK_cat_users_cat_apps` FOREIGN KEY (`id_app`) REFERENCES `cat_apps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_cat_users_permissions` FOREIGN KEY (`id_permission`) REFERENCES `permissions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- Dumping data for table feengster_master.cat_users: ~4 rows (approximately)
/*!40000 ALTER TABLE `cat_users` DISABLE KEYS */;
INSERT INTO `cat_users` (`id`, `name`, `abbreviated`, `id_app`, `id_permission`, `desc_`, `status`, `updated_at`) VALUES
	(27, 'Desarrollador', 'Dev', 11, 10, 'Permisos de ROOT', 'ACTIVO', '2019-01-14 19:22:42'),
	(28, 'Diseñador', NULL, 11, 7, 'Todos los persmisos.', 'ACTIVO', '2018-11-12 17:05:05'),
	(29, 'Doctor', 'Dr.', 14, 7, NULL, NULL, '2019-01-14 19:22:59'),
	(30, 'Asistente', NULL, 14, 7, NULL, NULL, '2019-01-14 19:01:59');
/*!40000 ALTER TABLE `cat_users` ENABLE KEYS */;

-- Dumping structure for procedure feengster_master.get_users_app_company_rol
DELIMITER //
CREATE DEFINER=`i4688130_wp1`@`%` PROCEDURE `get_users_app_company_rol`(
	IN `id_app` INT
,
	IN `id_company` INT,
	IN `id_rol` INT,
	IN `from_` DATE,
	IN `to_` DATE


)
BEGIN
  
  select `u`.`id` AS `id`,`u`.`username` AS `username`,`u`.`name` AS `name`,`u`.`surnames` AS `surnames`,`u`.`phone` AS `phone`,`u`.`email` AS `email`,`u`.`img` AS `img`,`u`.`password` AS `password`,`u`.`oldpassword` AS `oldpassword`,`u`.`birthdate` AS `birthdate`,`u`.`platform` AS `platform`,`u`.`updated_at` AS `updated_at`,`u`.`created_at` AS `created_at`,`u`.`status` AS `status`,`a`.`app_id` AS `app_id` from (((`users` `u` join `user_app` `a` on(((`u`.`id` = `a`.`user_id`) and (`a`.`main` = 1)))) join `user_cat_user` `cu` on(((`u`.`id` = `cu`.`user_id`) and (`cu`.`main` = 1)))) join `user_companies` `c` on((`u`.`id` = `c`.`user_id`))) where (`u`.`status` <> 'ELIMINADO') order by `u`.`created_at`;
END//
DELIMITER ;

-- Dumping structure for table feengster_master.images
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

-- Dumping data for table feengster_master.images: ~0 rows (approximately)
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;

-- Dumping structure for table feengster_master.licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `key_` varchar(60) NOT NULL,
  `bd` varchar(30) NOT NULL,
  `fecha_ini` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_fin` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(50) NOT NULL DEFAULT 'ACTIVO',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_licencias_cat_producto` (`app_id`),
  KEY `FK_company` (`company_id`),
  CONSTRAINT `FK_app` FOREIGN KEY (`app_id`) REFERENCES `cat_apps` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_company` FOREIGN KEY (`company_id`) REFERENCES `cat_company` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table feengster_master.licenses: ~3 rows (approximately)
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` (`id`, `company_id`, `app_id`, `key_`, `bd`, `fecha_ini`, `fecha_fin`, `status`, `updated_at`) VALUES
	(5, 1, 11, '$$$L123000A8745Basdasd$fdlfhkñsdjfgjbfsdkljfgdjkfhgsdhfgjkhg', 'feengster_master', '2018-11-22 16:56:46', '2019-10-19 08:21:22', 'ACTIVO', '2018-11-22 16:56:46'),
	(7, 1, 1, 'WER5serJHADFSJKrwer48ybteertetrw892348UKUJBewweSDFSbvnka454', 'feengster_master', '2018-11-22 21:09:12', '2019-10-19 08:21:22', 'ACTIVO', '2018-11-22 21:09:12'),
	(8, 1, 2, 'POOLMUUJ78DFSJKrwer48ybteertetrw892348UKUJBewweSD5845kijnt', 'feengster_master', '2019-02-14 11:56:23', '2019-10-19 08:21:22', 'ACTIVO', '2019-02-14 11:56:23'),
	(9, 1, 14, '$$$L123000A8745Basdasd$fdlfhkñsdjfgjbfsdkl1111113313133131', 'feengster_master', '2019-01-13 21:59:05', '2019-10-19 08:21:22', 'ACTIVO', '2019-01-13 21:59:05'),
	(10, 2, 14, '$$$free$$u7bhjdsjdhb$$BROTHER$$7123babsDENTAL$8798hasdjk', 'feengster_master', '2019-01-14 19:04:52', '2026-10-19 08:21:22', 'ACTIVO', '2019-01-14 19:04:52');
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;

-- Dumping structure for table feengster_master.logins
CREATE TABLE IF NOT EXISTS `logins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL DEFAULT '0',
  `platform` varchar(20) NOT NULL DEFAULT '0',
  `token` varchar(100) NOT NULL DEFAULT '1',
  `status` varchar(50) NOT NULL DEFAULT '1',
  `ip` varchar(60) DEFAULT '0',
  `city` varchar(100) DEFAULT '0',
  `explorer` varchar(60) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `FK_logins_users` (`id_user`),
  CONSTRAINT `FK_usuario` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;

-- Dumping data for table feengster_master.logins: ~12 rows (approximately)
/*!40000 ALTER TABLE `logins` DISABLE KEYS */;
INSERT INTO `logins` (`id`, `id_user`, `platform`, `token`, `status`, `ip`, `city`, `explorer`, `created_at`, `updated_at`) VALUES
	(19, 1, 'Web', 'cwWqyyq3FMCkGzfoV5LVatZHv$1-wRTn6tdvXZAZpGxCCCDScR2Hu0zED', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2018-11-22 09:36:46', '2018-11-22 09:36:46'),
	(21, 1, 'Web', 'PvVO9bG1NYJhekHRpBGHjoy4s$1-xGWSRxvFgNhhsz0QoGiCDHhIqmaUO', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2018-11-22 13:18:35', '2018-11-22 13:18:35'),
	(40, 1, 'Web', 'HqHUkWHoitWc4mn3cJea2VYcV$1-YkAMOgWhBqnUzgS9KwEY4vvtRyfpy', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2018-12-01 09:34:37', '2018-12-01 09:34:37'),
	(41, 1, 'Web', 'kyLgTG3hTQ6iPwpllPxxEjE1J$1-ZPjncuRmnVUXDVIwOJ3HfcTcYaDcw', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2018-12-04 08:45:55', '2018-12-04 08:45:55'),
	(42, 1, 'Web', 'lS6kcwsjyZ6JwtT6Y0d0yUZ6u$1-v5bi7DysLfgXJKK7Iip6JH00oMiFq', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2018-12-05 08:46:06', '2018-12-05 08:46:06'),
	(43, 1, 'Web', 'gwa9NjygcxpvPkjajy4OW1MMi$1-IDTL1QLA7XdHhd7nV9fOVBmmjTrjf', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2018-12-06 14:32:57', '2018-12-06 14:32:57'),
	(44, 1, 'Web', '1oO9zFW2rXazNcZyzFo1Xnuyf$1-H0R6qbaMPBivrPEHyK4wjlIc5Mfhz', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2018-12-09 23:03:05', '2018-12-09 23:03:05'),
	(45, 1, 'Web', 'O7h4MhB30uOkMObZfpKF14go1$1-x4V4UkZ0V1727VcJTzo6jCtVoK7to', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2018-12-10 13:33:42', '2018-12-10 13:33:42'),
	(46, 43, 'Web', 'lAPPpZONw1g7v5mA1CJoYW5Hn$43-ca9YsPpcB6c2qHB7aX96xbCaZY8fY', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2018-12-10 15:13:17', '2018-12-10 15:13:17'),
	(47, 1, 'Web', 'WwKbrGPcYQbLs2mHit6q1e6Ny$1-ggiTdDuYjTX1ANc6TLGM8xUol7UNx', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2018-12-11 08:52:38', '2018-12-11 08:52:38'),
	(48, 1, 'Web', '1Nsvile8DrAOSAn5or98UE2SF$1-s8GJ35Sqik4JWhLOkm1x0NmwHqGNu', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2018-12-13 11:49:44', '2018-12-13 11:49:44'),
	(49, 1, 'Web', 'w63t80nY3s0FR1usAa82xzfNk$1-E5d3qlmTdyCi7fRe1AEc3DJDiR9oa', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2018-12-14 09:00:35', '2018-12-14 09:00:35'),
	(50, 1, 'Web', '7RbDGV74WGjGz30S5PWDI3r2a$1-NSy4mpf4DeeuoL7uQGEgQRK24zSa1', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2018-12-21 12:41:30', '2018-12-21 12:41:30'),
	(51, 1, 'Web', 'TjB1Nc3ROepwpX17vPfXLPVkr$1-gdMr80SnTR7MV5Ecq4m2dtp2VHd4j', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2018-12-21 13:05:45', '2018-12-21 13:05:45'),
	(52, 1, 'Web', 'qvv1ISJgZoRIVW3rE7htVDhOG$1-ovD75RFPAfWzqeRW3gn7ZpsfmfjCG', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-01-07 10:07:34', '2019-01-07 10:07:34'),
	(53, 1, 'Web', 'S1HzTCCnUBaMzd12WLrJlpBwu$1-MdJ51sP1WgAyqbVp41zcq5IunHRKw', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-01-13 21:49:25', '2019-01-13 21:49:25'),
	(54, 1, 'Web', 'oOPsQayjS12nVFhpvoHmNJ7sG$1-oZAiZcbT4UVevbfP6sQ5XZOEqQLvA', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-01-13 21:55:06', '2019-01-13 21:55:06'),
	(55, 1, 'Web', 'dmWb56HwZIZjPeAE6nhd3rajT$1-3WAbxWlJfyrR527FIFFpOJiKVyG1J', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-01-14 18:44:12', '2019-01-14 18:44:12'),
	(56, 44, 'Web', 'zksIgin6oxdI4X0T8gjLgduU1$44-bLweC1xvLCsTqDnJJgVznkxcMJPhJ', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-01-14 19:09:56', '2019-01-14 19:09:56'),
	(57, 44, 'Web', 'Y6Rgqds1h00cq8a72vjM3vDfd$44-KvFZAQrz3OvC17Y1Foho0zTzY8uR4', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-01-16 20:24:39', '2019-01-16 20:24:39'),
	(58, 1, 'Web', 'T8DAFm3jzUIyJ27r5FnxAqwAn$1-vak1JJIwTdwTz0312Y0NScH4ve3ln', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-01-17 13:59:28', '2019-01-17 13:59:28'),
	(59, 1, 'Web', 'YLtIC68oPwhovfVxux9Q7e7Ts$1-5LzF1HeurokMTX92EjS5MeYrv4oQg', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-01-17 15:25:12', '2019-01-17 15:25:12'),
	(60, 1, 'Web', 'IbOlNh6dVCM4H7wmy21jmh6hH$1-3vi13JjovC5h6B2cnL3G9ytQozClM', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-01-17 15:29:50', '2019-01-17 15:29:50'),
	(61, 1, 'Web', '1g2XjYAbU99meZFmsnrv335d6$1-lXtFfBhylKQjAz20CQbDJo97rAAxH', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-01-28 16:24:41', '2019-01-28 16:24:41'),
	(62, 1, 'Web', 'clEJtvipCSmr1HP7hEADbC6Y2$1-PkLWdAdB8MYcF5TnQB4S4fHPE5pGj', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-01-31 15:33:11', '2019-01-31 15:33:11'),
	(63, 1, 'Web', 'fwGoVCe2IKq1511SbUHQ9kh4h$1-wH9iZpzYHvefWYuTPcT6Sp6WGFHyw', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-02-05 09:16:49', '2019-02-05 09:16:49'),
	(64, 1, 'Web', 'pNMDXWBTUnMuWkvlO2FgA6Q2h$1-wxM7OvqN7RvjSRI94r7nikc82XHNy', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-02-14 10:50:44', '2019-02-14 10:50:44'),
	(65, 1, 'Web', 'BBkV4jiFF5wybYHYOwmazhNT4$1-yehrjWiKIwd4pEcmuVBQzCeVR1Sjd', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-02-14 11:08:41', '2019-02-14 11:08:41'),
	(66, 1, 'Web', 'hNzdzXtXpPSbkUjPk52GvmKgR$1-IWkhWOTRW5u4TS4VIUWfpHwZ1Qw5V', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-02-26 21:19:48', '2019-02-26 21:19:48');
/*!40000 ALTER TABLE `logins` ENABLE KEYS */;

-- Dumping structure for table feengster_master.log_ticket
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

-- Dumping data for table feengster_master.log_ticket: ~18 rows (approximately)
/*!40000 ALTER TABLE `log_ticket` DISABLE KEYS */;
INSERT INTO `log_ticket` (`id`, `id_ticket`, `id_user`, `time`, `desc`, `crated_at`) VALUES
	(0, 0, 1, 0.5, '<p>Se ha activado la cuenta.</p><p><ul><li><strong>asdas</strong></li><li><strong>dasd</strong></li><li><strong>as</strong></li><li><strong>d</strong></li><li><strong>asd</strong></li><li><strong>as</strong></li><li><strong>dsa</strong></li><li><strong>asd</strong></li><li><strong>as</strong></li><li><strong>d</strong></li></ul></p>                                        \n                                        ', '2018-04-27 03:22:30'),
	(2, 33, 2, 0.5, 'Se deben registrar los avances por cada componente terminado', '2018-04-05 00:14:26'),
	(3, 33, 1, 0.5, '<p>test</p>', '2018-04-17 14:41:08'),
	(4, 33, 1, 1, '<p><strong><em><strike>ssdfsdf</strike></em></strong></p>                                        \n                                        ', '2018-04-17 15:04:16'),
	(5, 42, 1, 1.5, '<p><strong><em><strike>nueva gestión</strike></em></strong></p>', '2018-04-17 15:20:59'),
	(6, 43, 1, 1, '<p><strong>Detallar el motivo por el cual fue eliminado este ticket.</strong></p><p><strong><br></strong></p><p><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYpIQeS8RYHm86h98u7BUw08IPWFwQB7z8rrZkRVf78M8nQwpduA" alt="andriod"><strong><br></strong></p>', '2018-04-17 16:04:25'),
	(7, 41, 1, 1.5, '<p><em><strong>gestion...</strong></em></p>                                        \n                                        ', '2018-04-17 16:20:46'),
	(8, 41, 1, 1.5, '<p><em><strong>gestion...</strong></em></p>                                        \n                                        ', '2018-04-17 16:20:51'),
	(9, 41, 1, 1.5, '<p><em><strong>gestion...</strong></em></p>                                        \n                                        ', '2018-04-17 16:21:00'),
	(10, 41, 1, 1.5, '<p><em><strong>gestion...</strong></em></p>                                        \n                                        ', '2018-04-17 16:21:05'),
	(11, 42, 1, 1.5, '<p><sup>gestiónes:</sup></p><p><ul><li><span style="font-size: 10.5px;">1</span></li><li><span style="font-size: 10.5px;">2</span></li><li><span style="font-size: 10.5px;">3</span></li><li><span style="font-size: 10.5px;">4</span></li><li><span style="font-size: 10.5px;">5</span></li><li><span style="font-size: 10.5px;">6</span></li><li><span style="font-size: 10.5px;"><br></span></li></ul></p>                                        \n                                        ', '2018-04-17 16:52:52'),
	(12, 42, 1, 1, '<p><sup>gestiónes:</sup></p><p><ul><li><span style="font-size: 10.5px;">1</span></li><li><span style="font-size: 10.5px;">2</span></li><li><span style="font-size: 10.5px;">3</span></li><li><span style="font-size: 10.5px;">4</span></li><li><span style="font-size: 10.5px;">5</span></li><li><span style="font-size: 10.5px;">6</span></li><li><span style="font-size: 10.5px;"><br></span></li></ul></p>                                        \n                                        ', '2018-04-17 16:53:17'),
	(13, 42, 1, 2, '<p>gestión ...</p>                                        \n                                        ', '2018-04-17 16:53:49'),
	(14, 42, 1, 1.5, '<p>gestión....</p>                                        \n                                        ', '2018-04-17 17:18:55'),
	(15, 42, 1, 1.5, '<p><strong>gestión&nbsp;</strong></p>', '2018-04-17 17:27:14'),
	(16, 42, 1, 1, '<p><em>gestión....</em></p>                                        \n                                        ', '2018-04-17 17:29:49'),
	(17, 42, 1, 2, '<p><strike>Ultima gestión</strike></p>                                        \n                                        ', '2018-04-17 17:33:24'),
	(18, 42, 1, 2, '<p>jgsdhshfdsfhsgdf</p>                                        \n                                        ', '2018-04-18 15:35:26');
/*!40000 ALTER TABLE `log_ticket` ENABLE KEYS */;

-- Dumping structure for table feengster_master.menu_permits
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

-- Dumping data for table feengster_master.menu_permits: ~0 rows (approximately)
/*!40000 ALTER TABLE `menu_permits` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_permits` ENABLE KEYS */;

-- Dumping structure for table feengster_master.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `select_` char(1) NOT NULL DEFAULT '0',
  `create_` char(1) NOT NULL DEFAULT '0',
  `update_` char(1) NOT NULL DEFAULT '0',
  `update_dalete` char(1) NOT NULL DEFAULT '0',
  `delete` char(1) NOT NULL DEFAULT '0',
  `restore` char(1) NOT NULL DEFAULT '0',
  `status` varchar(20) NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table feengster_master.permissions: ~11 rows (approximately)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `name`, `select_`, `create_`, `update_`, `update_dalete`, `delete`, `restore`, `status`) VALUES
	(1, 'SOLO CREAR', '0', '1', '0', '0', '0', '0', 'ACTIVO'),
	(2, 'SOLO VER', '1', '0', '0', '0', '0', '0', 'ACTIVO'),
	(3, 'SOLO VER Y ACTUALIZAR', '1', '0', '1', '0', '0', '0', 'ACTIVO'),
	(4, 'VER Y ELIMNAR (POR ESTATUS)', '1', '0', '0', '1', '0', '0', 'ACTIVO'),
	(5, 'VER Y ELIMINAR DIFINITIVAMENTE', '1', '0', '0', '0', '1', '0', 'ACTIVO'),
	(6, 'CREAR, VER Y ACTUALIZAR', '1', '1', '1', '0', '0', '0', 'ACTIVO'),
	(7, 'CREAR, VER, ACTUALIZAR Y ELIMINAR (POR ESTATUS)', '1', '1', '1', '1', '0', '0', 'ACTIVO'),
	(8, 'CREAR, VER, ACTUALIZAR Y ELIMINAR DIFINITIVAMENTE', '1', '1', '1', '0', '1', '0', 'ACTIVO'),
	(9, 'CREAR, VER, ACTUALIZAR, ELIMINAR DIFINITIVAMENTE Y', '1', '1', '1', '0', '1', '1', 'ACTIVO'),
	(10, 'ROOT', '1', '1', '1', '1', '1', '1', 'ACTIVO'),
	(11, 'DENEGAR', '0', '0', '0', '0', '0', '0', 'ACTIVO');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table feengster_master.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_app` int(11) NOT NULL DEFAULT '0',
  `id_company` int(11) NOT NULL DEFAULT '0',
  `id_category` int(11) NOT NULL DEFAULT '0',
  `name` varchar(150) NOT NULL DEFAULT '0',
  `desc_` varchar(1000) DEFAULT '0',
  `price_bay` double NOT NULL DEFAULT '0',
  `price_pg` double DEFAULT '0',
  `price_desc` double NOT NULL DEFAULT '0',
  `existence` int(11) DEFAULT '0',
  `images` text NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'ACTIVO',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table feengster_master.products: 8 rows
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `id_app`, `id_company`, `id_category`, `name`, `desc_`, `price_bay`, `price_pg`, `price_desc`, `existence`, `images`, `status`, `updated_at`, `created_at`) VALUES
	(1, 10, 9, 4, 'Block hueco', 'Block hueco hecho a base de materiales pétreos medidas alta resistencia  19cm x 12cm x 39cm ', 4, 6, 0, 400, ',https://firebasestorage.googleapis.com/v0/b/feengster-app.appspot.com/o/beauty%2Fservicios%2Fimgblock.jpg?alt=media&token=1fd5d3f8-88f4-4c36-a699-cdbb01fd6f33,https://firebasestorage.googleapis.com/v0/b/feengster-app.appspot.com/o/beauty%2Fservicios%2Fimg32892048_429275290913197_2644128407406772224_n.jpg?alt=media&token=59276305-7198-42be-b944-a9155f25920a', 'ACTIVO', '2018-07-24 14:26:39', '2018-07-04 22:23:01'),
	(2, 5, 2, 10, 'nuevo', 'desc', 1, 1, 1, 14, ',,,,https://firebasestorage.googleapis.com/v0/b/feengster-app.appspot.com/o/beauty%2Fservicios%2Fimglogo.jpg?alt=media&token=0414c085-9046-4d35-9c2f-cc3b97f46bff', 'ACTIVO', '2018-07-23 09:21:24', '2018-07-16 12:50:20'),
	(3, 5, 2, 10, 'nuevo', 'desc', 1, 1, 1, 5, ',,https://firebasestorage.googleapis.com/v0/b/feengster-app.appspot.com/o/beauty%2Fservicios%2Fimglalo.jpg?alt=media&token=bf617037-b6d3-4d01-8d56-2c7246650721,https://firebasestorage.googleapis.com/v0/b/feengster-app.appspot.com/o/beauty%2Fservicios%2Fimgportada.png?alt=media&token=40727d0f-8ee4-4251-9548-208cbc769d25,https://firebasestorage.googleapis.com/v0/b/feengster-app.appspot.com/o/beauty%2Fservicios%2Fimg32892048_429275290913197_2644128407406772224_n.jpg?alt=media&token=5821aaed-0d75-4c71-89a8-34d9fb8c534f', 'ACTIVO', '2018-07-16 12:56:15', '2018-07-16 12:51:20'),
	(4, 10, 1, 14, 'Suela', '', 0, 0, 0, 12, 'https://firebasestorage.googleapis.com/v0/b/feengster-app.appspot.com/o/beauty%2Fservicios%2Fimg32892048_429275290913197_2644128407406772224_n.jpg?alt=media&token=4bfeeca0-19a0-4c45-bcab-c57a4777371e', 'ACTIVO', '2018-08-08 20:35:12', '2018-08-08 20:35:12'),
	(5, 10, 11, 15, '2do', '--', 10.9, 20.5, 15.8, 100, '', 'ACTIVO', '2018-08-08 21:22:09', '2018-08-08 21:20:17'),
	(6, 10, 11, 15, 'Textil', '-', 0, 12.01, 0, 12, '', 'ACTIVO', '2018-08-08 21:33:40', '2018-08-08 21:28:42'),
	(7, 10, 11, 16, 'Duramax', '-', 0, 12.9, 0, 1, ',https://firebasestorage.googleapis.com/v0/b/feengster-app.appspot.com/o/beauty%2Fservicios%2Fimg32892048_429275290913197_2644128407406772224_n.jpg?alt=media&token=94470b35-aa8c-4685-ad9e-a52e88c2942c', 'ACTIVO', '2018-08-08 21:43:07', '2018-08-08 21:32:47'),
	(8, 10, 11, 15, 'Pro', '-', 0, 122.9, 0, 1, '', 'ACTIVO', '2018-08-08 21:33:51', '2018-08-08 21:33:25');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table feengster_master.services
CREATE TABLE IF NOT EXISTS `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_app` int(11) NOT NULL DEFAULT '0',
  `id_company` int(11) NOT NULL DEFAULT '0',
  `id_category` int(11) NOT NULL DEFAULT '0',
  `name` varchar(150) NOT NULL DEFAULT '0',
  `desc_` varchar(1000) DEFAULT '0',
  `price_gn` double NOT NULL DEFAULT '0',
  `price_desc` double DEFAULT '0',
  `price_special` double DEFAULT '0',
  `images` text NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'ACTIVO',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table feengster_master.services: 1 rows
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` (`id`, `id_app`, `id_company`, `id_category`, `name`, `desc_`, `price_gn`, `price_desc`, `price_special`, `images`, `status`, `updated_at`, `created_at`) VALUES
	(1, 5, 2, 11, 'nuevo sEr', 'desc', 1, 1, 1, ',https://firebasestorage.googleapis.com/v0/b/feengster-app.appspot.com/o/beauty%2Fservicios%2Fimglalo.jpg?alt=media&token=07851b24-f89c-43d9-8c79-6eff531b60de,https://firebasestorage.googleapis.com/v0/b/feengster-app.appspot.com/o/beauty%2Fservicios%2FimgINE_FRENTE.JPG?alt=media&token=f32ce6aa-d88c-4d4e-be24-ef6a7700ab5b,', 'ACTIVO', '2018-07-16 13:33:09', '2018-07-16 13:29:03');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;

-- Dumping structure for procedure feengster_master.SP_get_name
DELIMITER //
CREATE DEFINER=`i4688130_wp1`@`%` PROCEDURE `SP_get_name`(
	IN `_id_app` INT
,
	IN `_id_company` INT,
	IN `_status` VARCHAR(50)










)
BEGIN
  
 /* Comenyarios
 */

  SELECT
    _status 'EE',
    u.id
	 , u.username
	 , u.name
	 , u.surnames
	 , u.phone
	 , u.email
	 , u.img 
	 , u.password
	 , u.oldpassword
	 , u.birthdate 
	 , u.platform
	 , u.updated_at
	 , u.created_at 
	 , u.status
	 , a.app_id
	 , cu.id_cat_user
	 , c.id_company 
	 
  FROM 
    users u
      INNER JOIN user_app a 
	     ON
		    u.id = a.user_id  
		    AND a.main = 1
       INNER JOIN user_cat_user cu 
		   ON
			  u.id = cu.user_id 
			  AND cu.main = 1
       INNER JOIN user_companies c 
		   ON
			  u.id = c.user_id
	WHERE
	  
	  u.status = _status
	  
	  
	ORDER BY u.created_at;
  
  
END//
DELIMITER ;

-- Dumping structure for table feengster_master.tables
CREATE TABLE IF NOT EXISTS `tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `code` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Dumping data for table feengster_master.tables: 14 rows
/*!40000 ALTER TABLE `tables` DISABLE KEYS */;
INSERT INTO `tables` (`id`, `name`, `code`) VALUES
	(1, 'app_menus', 'KNA816HOMRNRI1FP1P8QNRKBNYLSWWJPNW72EJ89DTNLODLKPKHD5E9SX0XD'),
	(2, 'cat_module', 'JQUOMQJAHC0QB38NA819T1GVPP31MTVL5NJF9ROXBG4ZB93FK9DREI1FP1QC'),
	(3, 'cat_menus', 'AT0915E8PJBPA3AXGAQLG7E3ZCJBSNLQMN3ATZ6NIAN25BTTC20MROSMIGFJ'),
	(4, 'tables', 'OKJNERAVAKQLJM7YSUM95QW1AYPDH0CEQ5BSR58G7HHOMU1EMLVCRI2GSD8R'),
	(5, 'permissions', '0PB4EDCCDLM0YFYBCKIMBFX3GNKPH0ENRKAICYEY816HOLQJ773LEY83IZ4F'),
	(6, 'logins', 'BDNUZ4FHWSWVF8N7S4Y3DB5K4MF1LM3AXE1P46BRLF2Q8M6S3VT50EMPCEMN'),
	(7, 'users', 'NN1X86VL02X984LDTPRFKBLSUNDMQHXYN7RX29VAIFC5GK85R2Q9SY26E9RT'),
	(8, 'licenses', '50CGY4IXSX00O344XYSS8LYSS8KVF6E6CYIE5BW72ELF58CRGSBYKPI61GTF'),
	(9, 'cat_apps', 'K05D7KXN93EDGTHPRFLEYCLM0W9999ADO1W2C900O4C33X16HL9AETNH7AMX'),
	(10, 'cat_options', 'NZO6M97YU2MJKYU3MIIOKLXLVBRIY232SFGR7GB1W3IZ5HPUS40EP2X4J1B5'),
	(11, 'tablas', 'K9ABJF9SUL7WLZU090ZLSWVBO5GJ1B5J05GK7Z38M4JYXF69KQNTSAROSMHB'),
	(12, 'user_companies', '3PW4PVWOEQ47E0O1W5PUVHK5PTNJFAU2LG8KS0EQ6D2YACJDZJF8L148JQSE'),
	(13, 'user_app', 'KZYIGGOP8SWWJOI8BNYN4AV8AG53SB0UXRR9ROX99707OJCW4OO37IK3I1B5'),
	(14, 'user_cat_user', '41MO8VE2X4K5S6ALVBO4BXDUUGGLBKKUBPDHY4ECA6QSK3K71EI4SC21QAWD');
/*!40000 ALTER TABLE `tables` ENABLE KEYS */;

-- Dumping structure for table feengster_master.tickets
CREATE TABLE IF NOT EXISTS `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `files` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `resolve_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `FK_tickets_users` (`id_user_created`),
  KEY `FK_tickets_users_2` (`id_user_resolve`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

-- Dumping data for table feengster_master.tickets: ~6 rows (approximately)
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` (`id`, `id_user_created`, `id_user_resolve`, `id_user_cc`, `name`, `code`, `id_product`, `category`, `team`, `id_team`, `des`, `type`, `priority`, `status`, `files`, `created_at`, `resolve_at`) VALUES
	(1, 1, 1, 0, 'Modulo de Categorías', 'T-200518-00003', 0, 'TICKET', 0, 0, 'Ingresa los detalles...', 'NUEVO MÓDULO', 'NORMAL', 'NUEVO', NULL, '2018-05-20 20:08:13', '0000-00-00 00:00:00'),
	(37, 1, 3, 0, 'Testing', 'T-180225001', 0, 'TICKET', 0, 0, '<p>De prueba....</p>', 'PREGUNTA', 'BAJA', 'RESUELTO', NULL, '2018-04-05 05:41:31', '0000-00-00 00:00:00'),
	(47, 1, 2, 5, 'Prueba desde Móvil', 'T-180225002', 2, 'TICKET', 0, 0, '<p>Prueba desde móvil...</p>', 'ADECUACIÓN', 'BAJA', 'NUEVO', NULL, '2018-04-17 19:06:30', '0000-00-00 00:00:00'),
	(48, 1, 0, 1, 'Testin', 'T-310518-00004', 1, 'TICKET', 0, 0, '<p>TEsting esta en <strong>negrita</strong></p>', 'PREGUNTA', 'NORMAL', 'NUEVO', NULL, '2018-05-31 20:14:49', '0000-00-00 00:00:00'),
	(49, 1, 0, 1, 'testing 3', 'T-310518-00005', 3, 'TICKET', 0, 0, '<p>Ingres<strong>a los detalles...</strong></p>', 'PREGUNTA', 'BAJA', 'NUEVO', '{"0":{"bucket":"feengster-app.appspot.com","path":"tickets\\/docs\\/Captura de pantalla (4).png","name":"Captura de pantalla (4).png","size":"244508","contentType":"image\\/png","urlPublic":""},"number":"1"}', '2018-05-31 20:34:37', '0000-00-00 00:00:00'),
	(50, 1, 0, 1, 'Testing 4', 'T-310518-00006', 1, 'TICKET', 0, 0, '<p>Testing 4</p>', 'PROBLEMA', 'NORMAL', 'NUEVO', '{"undefined":{"bucket":"feengster-app.appspot.com","path":"tickets\\/docs\\/32892048_429275290913197_2644128407406772224_n.jpg","name":"32892048_429275290913197_2644128407406772224_n.jpg","size":"137820","contentType":"image\\/jpeg","urlPublic":""},"number":"NaN"}', '2018-05-31 20:52:35', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;

-- Dumping structure for table feengster_master.ticket_files
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

-- Dumping data for table feengster_master.ticket_files: ~0 rows (approximately)
/*!40000 ALTER TABLE `ticket_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_files` ENABLE KEYS */;

-- Dumping structure for table feengster_master.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `surnames` varchar(120) DEFAULT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(60) NOT NULL,
  `img` varchar(9000) NOT NULL DEFAULT 'http://feengster.com/app/assets/dist/img/perfil.png',
  `password` varchar(60) NOT NULL DEFAULT '0',
  `oldpassword` varchar(60) NOT NULL DEFAULT '0',
  `birthdate` date DEFAULT NULL,
  `platform` varchar(6) DEFAULT 'Web',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(10) NOT NULL DEFAULT 'REGISTRADO',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

-- Dumping data for table feengster_master.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `name`, `surnames`, `phone`, `email`, `img`, `password`, `oldpassword`, `birthdate`, `platform`, `updated_at`, `created_at`, `status`) VALUES
	(1, '@lalo', 'Juan Eduardo', 'Rosales Rosales', '477-112-58-87', 'eduardorosales720@gmail.com', 'https://firebasestorage.googleapis.com/v0/b/feengster-app.appspot.com/o/img_profile%2FmyAvatar%20(3).png?alt=media&token=30a870f2-6160-4391-9e02-7d3b19bf507a', '$2y$10$6Xt9MWZWpy/B3wB3Phj1qu/9WEE88XtmPs6cFU2.p9EA5eesyvRYK', '$2y$10$6Xt9MWZWpy/B3wB3Phj1qu/9WEE88XtmPs6cFU2.p9EA5eesyvRYK', '1996-09-01', 'Web', '2018-12-13 11:49:00', '2018-10-18 15:43:58', 'ACTIVO'),
	(43, '@gera', 'Gerardo', 'Flores Marchena', '477-112-58-97', 'gera@gmail.com', 'http://feengster.com/app/assets/dist/img/perfil.png', '123456', '0', '1995-02-01', 'Web', '2018-12-10 15:12:51', '2018-12-10 15:12:51', 'ACTIVO'),
	(44, '@cosme', 'José Cosme', 'Rosales Rosales', '273-118-31-53', 'dr.cosmerosales@gmail.com', 'https://firebasestorage.googleapis.com/v0/b/feengster-app.appspot.com/o/img_profile%2Ff28b31f6-c5d1-4692-9933-b3dd7c98a5d8.jpg?alt=media&token=bca708df-ca11-403e-ad6a-93f4155c2422', '123456', '0', '1988-02-02', 'Web', '2019-01-14 19:19:14', '2019-01-14 18:58:11', 'ACTIVO'),
	(45, '@test', 'Tester', 'QA', '477-858-98-52', 'test@gmail.com', 'http://feengster.com/app/assets/dist/img/perfil.png', '123456', '0', '1966-02-01', 'Web', '2019-02-14 05:47:28', '2019-02-14 11:47:34', 'NO ACTIVO');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table feengster_master.user_app
CREATE TABLE IF NOT EXISTS `user_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `main` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_user_app_license` (`app_id`),
  KEY `FK_user` (`user_id`),
  CONSTRAINT `FK_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_user_app_license` FOREIGN KEY (`app_id`) REFERENCES `cat_apps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table feengster_master.user_app: ~2 rows (approximately)
/*!40000 ALTER TABLE `user_app` DISABLE KEYS */;
INSERT INTO `user_app` (`id`, `user_id`, `app_id`, `main`) VALUES
	(1, 1, 2, 0),
	(2, 1, 11, 1),
	(6, 43, 11, 0),
	(7, 1, 14, 0),
	(8, 44, 14, 1),
	(9, 45, 11, 1);
/*!40000 ALTER TABLE `user_app` ENABLE KEYS */;

-- Dumping structure for table feengster_master.user_cat_user
CREATE TABLE IF NOT EXISTS `user_cat_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `id_cat_user` int(11) NOT NULL DEFAULT '0',
  `main` int(1) NOT NULL DEFAULT '0',
  `status` varchar(50) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_user_cat_user_users` (`user_id`),
  KEY `FK_user_cat_user_cat_users` (`id_cat_user`),
  CONSTRAINT `FK_user_cat_user_cat_users` FOREIGN KEY (`id_cat_user`) REFERENCES `cat_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_user_cat_user_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COMMENT='Se almacenan los roles que tiene el usuario. Un usario puede ser Administrador, supervisor y gesto a la vez o solo cliente.';

-- Dumping data for table feengster_master.user_cat_user: ~3 rows (approximately)
/*!40000 ALTER TABLE `user_cat_user` DISABLE KEYS */;
INSERT INTO `user_cat_user` (`id`, `user_id`, `id_cat_user`, `main`, `status`, `created_at`, `updated_at`) VALUES
	(1, 1, 27, 1, '1', '2018-11-13 09:19:40', '2018-11-13 09:19:40'),
	(6, 1, 27, 0, '1', '2018-12-11 11:03:50', '2018-12-11 11:03:50'),
	(7, 44, 29, 1, '1', '2019-01-14 18:58:13', '2019-01-14 18:58:13'),
	(8, 45, 27, 1, '1', '2019-02-14 11:47:36', '2019-02-14 11:47:36');
/*!40000 ALTER TABLE `user_cat_user` ENABLE KEYS */;

-- Dumping structure for table feengster_master.user_companies
CREATE TABLE IF NOT EXISTS `user_companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `id_company` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_user` (`user_id`),
  KEY `FK_user_companies_company` (`id_company`),
  CONSTRAINT `FK1_user_` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK2_company_` FOREIGN KEY (`id_company`) REFERENCES `cat_company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COMMENT='Un usuario pertenece a una sola empresa | una empresa puede tener varios usuarios';

-- Dumping data for table feengster_master.user_companies: ~2 rows (approximately)
/*!40000 ALTER TABLE `user_companies` DISABLE KEYS */;
INSERT INTO `user_companies` (`id`, `user_id`, `id_company`) VALUES
	(10, 1, 1),
	(11, 44, 2),
	(12, 45, 1);
/*!40000 ALTER TABLE `user_companies` ENABLE KEYS */;

-- Dumping structure for table feengster_master.user_images
CREATE TABLE IF NOT EXISTS `user_images` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `img_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_img` (`img_id`),
  KEY `FK__users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='se almacenan todas la imagenes que tienen los usuarios para ello se debe contar con id_img valido';

-- Dumping data for table feengster_master.user_images: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_images` ENABLE KEYS */;

-- Dumping structure for table feengster_master.user_notifications
CREATE TABLE IF NOT EXISTS `user_notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tittle` varchar(120) NOT NULL,
  `notification` varchar(600) NOT NULL,
  `link` varchar(300) DEFAULT NULL,
  `ico` varchar(60) DEFAULT NULL,
  `type` varchar(60) NOT NULL,
  `send_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_user_notifications_users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Se almecena las notificaciónes de usuarios.';

-- Dumping data for table feengster_master.user_notifications: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_notifications` ENABLE KEYS */;

-- Dumping structure for table feengster_master.user_profile
CREATE TABLE IF NOT EXISTS `user_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
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
  KEY `FK_user_profile_users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table feengster_master.user_profile: ~2 rows (approximately)
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` (`id`, `user_id`, `name`, `surnames`, `role`, `slogan`, `birthdate`, `id_address`, `id_img_profile`, `status`, `created_at`, `updated_at`) VALUES
	(4, 1, 'Web developer', '', 'Desarrollo', 'Si lohaces en la vida real, se puede programar', '1996-09-01 23:59:59', 0, NULL, 0, '2018-03-06 06:41:48', '2018-05-05 17:25:58'),
	(5, 3, 'Ever', '', 'Administrador', '0', NULL, 0, NULL, 0, '2018-05-05 22:58:28', '2018-05-05 22:59:00');
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;

-- Dumping structure for table feengster_master.user_ratings
CREATE TABLE IF NOT EXISTS `user_ratings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `id_user_writer` int(11) NOT NULL,
  `stars` int(11) NOT NULL,
  `commentary` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='calificaciónes de los usuarios departe de otro usuarios de 1-5 estrellas.\r\n';

-- Dumping data for table feengster_master.user_ratings: ~2 rows (approximately)
/*!40000 ALTER TABLE `user_ratings` DISABLE KEYS */;
INSERT INTO `user_ratings` (`id`, `user_id`, `id_user_writer`, `stars`, `commentary`, `created_at`) VALUES
	(1, 1, 2, 4, 'Good job', '2018-03-06 05:26:04'),
	(3, 1, 5, 5, 'Sin comentarios', '2018-03-06 05:26:26');
/*!40000 ALTER TABLE `user_ratings` ENABLE KEYS */;

-- Dumping structure for table feengster_master.user_teams
CREATE TABLE IF NOT EXISTS `user_teams` (
  `team_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table feengster_master.user_teams: ~4 rows (approximately)
/*!40000 ALTER TABLE `user_teams` DISABLE KEYS */;
INSERT INTO `user_teams` (`team_id`, `user_id`) VALUES
	(1, 1),
	(1, 5),
	(1, 3),
	(2, 4);
/*!40000 ALTER TABLE `user_teams` ENABLE KEYS */;

-- Dumping structure for table feengster_master.user_tels
CREATE TABLE IF NOT EXISTS `user_tels` (
  `user_id` int(11) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `code_phone` varchar(2) DEFAULT NULL,
  `tel` varchar(10) DEFAULT NULL,
  KEY `FK_user_tels_users` (`user_id`),
  CONSTRAINT `FK_user_tels_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table feengster_master.user_tels: ~4 rows (approximately)
/*!40000 ALTER TABLE `user_tels` DISABLE KEYS */;
INSERT INTO `user_tels` (`user_id`, `type`, `code_phone`, `tel`) VALUES
	(1, 'home', NULL, '2734880615'),
	(1, 'work', NULL, '4777654326'),
	(1, 'work', NULL, '4778765543'),
	(1, 'home', NULL, '2734880609');
/*!40000 ALTER TABLE `user_tels` ENABLE KEYS */;

-- Dumping structure for trigger feengster_master.generateCodeTable
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `generateCodeTable` BEFORE INSERT ON `tables` FOR EACH ROW BEGIN 
DECLARE code_ varchar(60) CHARSET utf8;

    SET @returnStr = '';
    SET @allowedChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    SET @i = 0;

    WHILE (@i < 60) DO
        SET @returnStr = CONCAT(@returnStr, substring(@allowedChars, FLOOR(RAND() * LENGTH(@allowedChars) + 1), 1));
        SET @i = @i + 1;
    END WHILE;

   SET new.code = @returnStr;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger feengster_master.tickets_before_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
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

-- Dumping structure for view feengster_master.all_user_all_apps_all_company
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `all_user_all_apps_all_company`;
CREATE ALGORITHM=UNDEFINED DEFINER=`i4688130_wp1`@`%` 
SQL SECURITY
 DEFINER VIEW `all_user_all_apps_all_company` 
 AS 
 select `u`.`id` AS
  `id`,`u`.`username` AS
   `username`,`u`.`name` AS
	 `name`,`u`.`surnames` AS
	  `surnames`,`u`.`phone` AS
	   `phone`,`u`.`email` AS
		 `email`,`u`.`img` AS 
		 `img`,`u`.`password` AS
		  `password`,`u`.`oldpassword` AS
		   `oldpassword`,`u`.`birthdate` AS
			 `birthdate`,`u`.`platform` AS 
			 `platform`,`u`.`updated_at` AS 
			 `updated_at`,`u`.`created_at` AS 
			 `created_at`,`u`.`status` AS 
			 `status`,`a`.`app_id` AS 
			 `app_id` 
			 from 
			 (((`users` `u` join `user_app` `a` on(((`u`.`id` = `a`.`user_id`) and (`a`.`main` = 1)))) join `user_cat_user` `cu` 
			 on(((`u`.`id` = `cu`.`user_id`) and (`cu`.`main` = 1)))) join `user_companies` `c`
			  on((`u`.`id` = `c`.`user_id`))) where (`u`.`status` <> 'ELIMINADO') order by `u`.`created_at`;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
