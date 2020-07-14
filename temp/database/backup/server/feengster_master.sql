-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 14-07-2019 a las 14:48:22
-- Versión del servidor: 5.6.43-cll-lve
-- Versión de PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `feengster_master`
--

DELIMITER $$
--
-- Procedimientos
--
$$

$$

$$

$$

$$

$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `all_user_all_apps_all_company`
--

CREATE TABLE `all_user_all_apps_all_company` (
  `id` int(11) NOT NULL,
  `username` varchar(40) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `surnames` varchar(120) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `img` varchar(9000) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `oldpassword` varchar(60) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `platform` varchar(6) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(10) NOT NULL,
  `app_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_menus`
--

CREATE TABLE `app_menus` (
  `id` int(11) NOT NULL,
  `id_app` int(11) NOT NULL DEFAULT '9',
  `id_menu` int(11) NOT NULL,
  `custom` char(1) NOT NULL DEFAULT '0',
  `status` varchar(50) NOT NULL DEFAULT 'ACTIVO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Se almacena el menú de cada usuario, cada menú almacena en menu_permits los permisos necesario para que\r\nun usuario lo use.';

--
-- Volcado de datos para la tabla `app_menus`
--

INSERT INTO `app_menus` (`id`, `id_app`, `id_menu`, `custom`, `status`, `created_at`, `updated_at`) VALUES
(1, 11, 38, '0', 'ACTIVO', '2018-11-22 21:18:45', '2018-11-22 21:18:45'),
(2, 11, 40, '0', 'ACTIVO', '2018-11-22 21:20:35', '2018-11-22 15:20:31'),
(3, 11, 34, '0', 'ACTIVO', '2018-11-22 21:20:47', '2018-11-22 15:20:43'),
(4, 11, 41, '0', 'ACTIVO', '2018-11-22 21:21:05', '2018-11-22 15:21:00'),
(5, 11, 37, '0', 'ACTIVO', '2018-11-22 21:22:04', '2018-11-22 15:22:00'),
(6, 11, 36, '0', 'ACTIVO', '2018-11-22 21:22:18', '2018-11-22 15:22:14'),
(7, 11, 35, '0', 'ACTIVO', '2018-11-22 21:23:06', '2018-11-22 15:23:02'),
(8, 11, 39, '0', 'ACTIVO', '2018-11-22 21:23:27', '2018-11-22 15:23:23'),
(9, 11, 22, '0', 'ACTIVO', '2018-11-22 21:24:02', '2018-11-22 15:23:58'),
(10, 11, 42, '0', 'ACTIVO', '2018-11-22 21:49:38', '2018-11-22 15:49:33'),
(12, 11, 44, '0', 'ACTIVO', '2018-11-26 17:52:46', '2018-11-26 11:52:44'),
(13, 11, 45, '0', 'ACTIVO', '2018-11-28 21:49:20', '2018-11-28 15:49:18'),
(17, 14, 47, '0', 'ACTIVO', '2019-01-25 02:10:57', '2019-01-24 20:10:55'),
(18, 14, 48, '0', 'ACTIVO', '2019-01-25 02:13:41', '2019-01-24 20:13:36'),
(19, 14, 49, '0', 'ACTIVO', '2019-01-25 02:17:29', '2019-01-24 20:17:28'),
(20, 14, 50, '0', 'ACTIVO', '2019-01-25 02:22:24', '2019-01-24 20:22:20'),
(21, 15, 51, '0', 'ACTIVO', '2019-03-28 04:59:06', '2019-03-27 22:59:06'),
(23, 14, 41, '0', 'ACTIVO', '2019-04-29 04:07:52', '2019-04-28 23:07:52'),
(24, 15, 49, '0', 'ACTIVO', '2019-06-17 02:02:33', '2019-06-16 21:02:31'),
(25, 15, 52, '0', 'ACTIVO', '2019-06-23 22:10:43', '2019-06-23 17:10:42'),
(26, 15, 53, '0', 'ACTIVO', '2019-06-23 22:29:50', '2019-06-23 17:29:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `id_app` int(11) NOT NULL DEFAULT '0',
  `id_company` int(11) NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL,
  `name` varchar(60) NOT NULL,
  `desc_` varchar(300) DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'ACTIVO',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Categorias genericas como; Servicios, Productos...';

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `id_app`, `id_company`, `type`, `name`, `desc_`, `status`, `updated_at`, `created_at`) VALUES
(1, 5, 1, 'PRODUCTOS', 'Ceras', 'Descripción de la categoría', 'ACTIVO', '2018-06-27 10:37:03', '2018-06-27 10:37:03'),
(3, 5, 1, 'SERVICIOS', 'Cortes para caballero', '', 'ACTIVO', '2018-06-28 00:41:22', '2018-06-28 00:41:22'),
(4, 10, 9, 'PRODUCTOS', 'Block', '', 'ACTIVO', '2018-07-05 05:12:13', '2018-07-05 05:12:13'),
(5, 10, 9, 'PRODUCTOS', 'Tabique', '', 'ACTIVO', '2018-07-05 05:12:38', '2018-07-05 05:12:38'),
(6, 10, 9, 'SERVICIOS', 'Impermeabilizante', '', 'ACTIVO', '2018-07-05 05:13:37', '2018-07-05 05:13:37'),
(7, 10, 9, 'SERVICIOS', 'Pintura', '', 'ACTIVO', '2018-07-05 05:13:52', '2018-07-05 05:13:52'),
(8, 10, 9, 'SERVICIOS', 'Obra civil', '', 'ACTIVO', '2018-07-05 05:14:17', '2018-07-05 05:14:17'),
(9, 10, 9, 'SERVICIOS', 'Mantenimiento', '', 'ACTIVO', '2018-07-05 05:14:36', '2018-07-05 05:14:36'),
(10, 5, 2, 'PRODUCTOS', 'nueva', 'nueva desc', 'ACTIVO', '2018-07-16 19:28:31', '2018-07-16 19:28:31'),
(11, 5, 2, 'SERVICIOS', 'servicio', 'desc', 'ACTIVO', '2018-07-16 19:33:24', '2018-07-16 19:33:24'),
(12, 5, 2, 'CITAS', 'Cita especial', 'Esta cita puede ser dentro o fuera de las instalaciones y también puede contener promociones.', 'ACTIVO', '2018-07-23 16:34:05', '2018-07-23 16:28:07'),
(13, 5, 2, 'CITAS', 'Cita', 'Citas ordinarias. Se le darán 10 minutos de tolerancia, después de ese tiempo se le atenderá acorde a la disponibilidad.', 'ACTIVO', '2018-07-23 16:33:15', '2018-07-23 16:33:15'),
(14, 10, 1, 'PRODUCTOS', 'suela', '', 'ACTIVO', '2018-08-09 03:34:14', '2018-08-09 03:34:14'),
(15, 10, 11, 'PRODUCTOS', 'Suela A', 'La suela tipo \"A\" sirve para...', 'ACTIVO', '2018-08-09 03:46:40', '2018-08-09 03:46:40'),
(16, 10, 11, 'PRODUCTOS', 'Suela B', 'La Suela tipo \"B\" sirve para...', 'ACTIVO', '2018-08-09 03:47:03', '2018-08-09 03:47:03'),
(24, 15, 49, 'SERVICIOS', 'Lavandería', 'Lavado de cualquier tipo de ropa en menos de 24 horas.', 'ACTIVO', '2019-06-24 02:10:36', '2019-06-24 02:07:19'),
(26, 15, 49, 'SERVICIOS', 'Planchado', 'Planchado de cualquier tipo de prenda', 'ACTIVO', '2019-07-02 02:19:01', '2019-07-02 02:19:01'),
(27, 15, 49, 'SERVICIOS', 'Tintorería', 'Tintorería ...', 'ACTIVO', '2019-07-02 02:19:24', '2019-07-02 02:19:24'),
(28, 15, 49, 'SERVICIOS', 'Costura', 'Reparación de prendas ...', 'NO ACTIVO', '2019-07-02 02:19:53', '2019-07-02 02:19:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_address`
--

CREATE TABLE `cat_address` (
  `id` int(11) NOT NULL,
  `street` varchar(50) DEFAULT NULL,
  `interior_numbe` varchar(10) DEFAULT NULL,
  `exterior_number` varchar(10) DEFAULT NULL,
  `colony` varchar(70) DEFAULT NULL,
  `state` varchar(70) DEFAULT NULL,
  `country` varchar(70) DEFAULT NULL,
  `length` varchar(70) DEFAULT NULL,
  `latitude` varchar(70) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'ACTIVO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Todas las direcciónes de todos los usuarios de feengster y clientes de clientes de feengster';

--
-- Volcado de datos para la tabla `cat_address`
--

INSERT INTO `cat_address` (`id`, `street`, `interior_numbe`, `exterior_number`, `colony`, `state`, `country`, `length`, `latitude`, `status`, `created_at`, `updated_at`) VALUES
(10, 'this ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ACTIVO', '2019-05-06 05:27:02', '2019-05-06 05:27:02'),
(11, 'Torre de cotillla', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ACTIVO', '2019-05-20 01:09:19', '2019-05-20 01:09:19'),
(12, 'asdasdasd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ACTIVO', '2019-05-20 03:11:25', '2019-05-20 03:11:25'),
(13, 'qweqweqwe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ACTIVO', '2019-05-20 04:59:29', '2019-05-20 04:59:29'),
(14, 'sdfsdf', '23', '23', '234234', NULL, NULL, NULL, NULL, 'ACTIVO', '2019-05-20 05:24:44', '2019-05-20 05:24:44'),
(15, 'fsdfsdfsf', '234', '234', 'sdfsdfsdf', NULL, NULL, NULL, NULL, 'ACTIVO', '2019-05-20 05:25:22', '2019-05-20 05:25:22'),
(16, 'adasd', '2147483647', '2147483647', 'qweqwe', NULL, NULL, NULL, NULL, 'ACTIVO', '2019-05-20 05:34:51', '2019-05-20 05:34:51'),
(17, 'Torre de cotilla', '1', '1', 'Arboledas del campo2', NULL, NULL, NULL, NULL, 'ACTIVO', '2019-06-16 02:14:07', '2019-06-18 03:09:39'),
(18, 'qweqwe', '1', '1', 'eweqqw', NULL, NULL, NULL, NULL, 'ACTIVO', '2019-06-16 05:42:16', '2019-06-16 05:42:16'),
(19, 'ewrwr', '1', '1', 'qweqweqwe', NULL, NULL, NULL, NULL, 'ACTIVO', '2019-06-16 05:43:25', '2019-06-16 05:43:25'),
(20, 'Torre de cotilla', '110', '', 'Arboledas del campo', NULL, NULL, NULL, NULL, 'ACTIVO', '2019-06-19 03:50:43', '2019-06-19 03:50:43'),
(21, 'manuel doblado', '', 'sn', 'colonia centro', NULL, NULL, NULL, NULL, 'ACTIVO', '2019-06-19 17:31:37', '2019-06-20 07:53:12'),
(22, 'qwe', '@', '2', 'asdasdas', NULL, NULL, NULL, NULL, 'ACTIVO', '2019-07-14 21:32:53', '2019-07-14 21:32:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_apps`
--

CREATE TABLE `cat_apps` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `code` varchar(60) NOT NULL,
  `platform` varchar(50) DEFAULT '' COMMENT '1: web 2: móvil',
  `url` varchar(50) DEFAULT '',
  `status` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'rent',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cat_apps`
--

INSERT INTO `cat_apps` (`id`, `name`, `code`, `platform`, `url`, `status`, `type`, `updated_at`, `created_at`) VALUES
(1, 'Feengster Login', 'j85pdf788mbt6yhp8ñpn89385jybfds89pp234jmknsfdpouuybg7iy895pi', 'web', 'app/', 'PRUEBAS', 'component', '2019-04-27 21:24:44', '2018-11-28 18:01:59'),
(2, 'Feengster Panel', 'kjbsd7yuhn234ou8u9j2jkhuhsjknkjuw78j2389h324kuh89prfweuiorhw', 'web', 'app/main/', 'PRUEBAS', 'free', '2018-12-04 22:37:06', '2018-11-28 18:01:59'),
(5, 'Beaty', '8ujnbftgbvrte4ou8u9j2jkhuhsjknkjuw78j2389h324kuh89prfweu8765', 'web,android', 'beauty/', 'ANÁLISIS', 'rent', '2019-06-18 02:48:13', '2018-11-28 18:01:59'),
(10, 'ForSale', '87hyr7yuhn7yhbg8u9j2jkhuhojhnbjuw78j2389h324kuh89prfweuoiuyh', 'web', 'forsale/', 'ANÁLISIS', 'rent', '2018-12-04 22:38:18', '2018-11-28 18:01:59'),
(11, 'Lab', 'kjbsd7yuhn234ou8uuyt2jkhuhsjiujnhw78j2389h324kuh89prfweu8765', 'web', 'lab/', 'PR', 'tool', '2019-06-19 15:28:05', '2018-11-28 18:01:59'),
(13, 'Web Page', 'DPLo7oU7sdFsqXcbvdfgd87sdF7fSDF87FSD7fsd7sdfSD7fSEeUIOPA78A8', 'Web', '../index.html', 'DESARROLLO', 'component', '2018-12-04 22:40:14', '2018-11-29 17:40:07'),
(14, 'Dental', 'jk2379hipub2398h39243bwer823b23ry50weurhjcd8fb3823', 'web', 'dental\\', 'DESARROLLO', 'rent', '2019-01-13 22:00:24', '2019-01-14 04:00:24'),
(15, 'Laundry', 'ho34u98y8erh345iy898r3hrio8y39f8erphy348y5o3wr23423', 'web', 'laundry\\', 'DESARROLLO', 'rent', '2019-03-27 22:45:26', '2019-03-28 04:45:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_company`
--

CREATE TABLE `cat_company` (
  `id` int(11) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `address_id` varchar(50) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `type` varchar(50) DEFAULT NULL,
  `rfc` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'ACTIVO',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cat_company`
--

INSERT INTO `cat_company` (`id`, `name`, `admin_id`, `address_id`, `priority`, `type`, `rfc`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Feengster', 1, NULL, 0, 'Master', NULL, 'feengster@gmail.com', 'ACTIVO', '2018-10-19 15:19:38', '2018-11-20 20:00:12'),
(2, 'Cosmo Dental', 50, NULL, 1, 'Clinica Dental', NULL, NULL, 'ACTIVO', '2019-01-15 01:54:08', '2019-04-26 05:36:22'),
(3, 'Rosba', 49, NULL, 1, 'Lavandería', NULL, NULL, 'ACTIVO', '2019-03-28 04:49:03', '2019-04-26 05:34:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_menus`
--

CREATE TABLE `cat_menus` (
  `id` int(11) NOT NULL,
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
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Se enuecntran almacenados todos los menús del producto.';

--
-- Volcado de datos para la tabla `cat_menus`
--

INSERT INTO `cat_menus` (`id`, `id_module`, `name`, `order_name`, `android`, `url`, `function_`, `title`, `title_desc`, `print`, `show_`, `status`, `updated_at`) VALUES
(22, 10, 'Logout', 18, 1, '...', '$f.session.logout()', '', '', '1', '1', 'NO ACTIVO', '2018-12-17 22:27:29'),
(34, 14, 'Bootstrap 3 Form Builder', 2, 0, 'lab\\diseño\\builder\\builder\\builder.html', 'obtenerContenido(34)', 'Crear formularios', 'Crea el diseño del formulario acorde a los requerimientos del módulo.', '1', '1', 'ACTIVO', '2018-11-20 19:57:43'),
(35, 14, 'Bootstrap 3  Validator', 3, 0, 'lab\\desarrollo\\builder.html', 'obtenerContenido(35)', 'Docuementación de Bootstrap Validator', 'Aquí podrás encontrar todo la documentación de Bootstrap validator. Para la validación de los formularios creados y usad', '1', '1', 'ACTIVO', '2018-11-20 19:57:43'),
(36, 17, 'Modulos', 1, 0, 'lab\\route\\modulos\\modulos.html', 'obtenerContenido(36)', 'Administración de Modulos', 'Crea y edita módulos de cualquier aplicación de Feengster.', '1', '1', 'ACTIVO', '2018-11-20 19:57:43'),
(37, 17, 'Menus', 1, 0, 'lab\\route\\menus\\menus.html', 'obtenerContenido(37)', 'Administrador de menús', 'Crea y edita todos los menus que tiene Feengster App', '1', '1', 'ACTIVO', '2018-11-21 21:12:28'),
(38, 17, 'Asignar menús', 2, 0, 'lab\\route\\menus\\menus-app.html', 'obtenerContenido(38)', 'Asignación de Menús', 'Asigna y restringe menús de todas las appa de Feengster', '1', '1', 'ACTIVO', '2018-11-21 21:20:03'),
(39, 40, 'Código de tablas', 7, 1, 'lab\\security\\tables\\tables.html', 'obtenerContenido(39)', 'Código de tablas', 'Una vez registrada una tabla se genera automáticamente un código que representa la tabla para poder hacer peticiones desde el exterior.', '1', '1', 'ACTIVO', '2018-11-21 22:30:51'),
(40, 40, 'Logins', 6, 1, 'lab\\security\\logins\\logins.html', 'obtenerContenido(40)', 'Logins en Feengster', 'Registro de todos los accesos a todas las aplicaciones de Feengster. ', '1', '1', 'ACTIVO', '2018-11-21 23:02:21'),
(41, 5, 'Administrar Usuarios', 6, 1, 'lab\\users\\user.html', 'obtenerContenido(41)', 'Todos los Usuarios de Feengster', 'Se muestran todos los usuarios de Feengster de todas las aplicaciones.', '1', '1', 'ACTIVO', '2019-06-19 15:29:42'),
(42, 41, 'Administrar licencias 2', 6, 1, 'lab\\licenses\\administrar\\licenses.html', 'obtenerContenido(42)', 'Administrar licencias', 'Licencias que tienen las empresas que usan los aplicaciones de Feengster. ', '1', '1', 'ACTIVO', '2018-11-28 18:36:39'),
(44, 43, 'Administrar App', 5, 1, 'lab\\apps\\administrar\\apps.html', 'obtenerContenido(44)', 'Administra todas las aplicaciones de Feengster (iOs, android', 'Administra los datos más relevantes de las aplicaciones de Feengster.', '1', '1', 'ACTIVO', '2018-11-26 22:39:57'),
(45, 45, 'Dropdown options', 9, 0, 'lab\\options\\dropdown\\dropdown.html', 'obtenerContenido(45)', 'Todas las opciones que se utilizan en todas las apps de Feen', 'Generalmente se usan en los estatus, espatas y de más.  [SELECT]', '1', '1', 'ACTIVO', '2018-11-28 21:44:46'),
(46, 46, 'Administrar AP', 8, 1, 'lab\\test\\almacen.html', 'obtenerContenido(46)', 'Almacén de partes', 'Por Mauricio', '1', '1', 'ACTIVO', '2018-12-18 22:25:25'),
(47, 47, 'Nuevo paciente', 9, 1, 'dental\\pacientes\\nuevo.html', '_', '', '', '1', '1', 'ACTIVO', '2019-01-24 20:10:25'),
(48, 48, 'Por paciente', 12, 0, 'dental\\', '_', '_', '', '1', '1', 'ACTIVO', '2019-01-24 20:13:04'),
(49, 49, 'Alimentar', 16, 1, '_', '_', '_', '', '1', '1', 'ACTIVO', '2019-01-24 20:16:59'),
(50, 50, 'Historial', 17, 1, '_', '_', '_', '', '1', '1', 'ACTIVO', '2019-01-24 20:21:52'),
(51, 51, 'Administrar Clientes', 3, 1, 'laundry\\clientes\\clientes.html', 'obtenerContenido(51)', 'Administración de clientes', 'Administra la información de todos tus clientes, agrega y  actualiza información. ', '1', '1', 'ACTIVO', '2019-04-29 07:52:14'),
(52, 52, 'Administrar Servicios', 6, 1, 'laundry/servicios/administrar.html', 'obtenerContenido(52)', 'Administrar Servicios ', 'Administra aquí todos los servicios que ofreces. Crea uno nuevo o simplemente modifica las reglas de alguno existente.', '1', '1', 'ACTIVO', '2019-06-23 22:13:29'),
(53, 52, 'Categorías', 0, 1, 'laundry/servicios/categorias/categorias_servicios.html', 'obtenerContenido(53)', 'Categorías de tus servicios', 'Administra aquí las categorías de tus servicios. Crea una nueva o simplemente modifica las reglas de alguna existente.', '1', '1', 'ACTIVO', '2019-06-24 00:00:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_module`
--

CREATE TABLE `cat_module` (
  `id` int(11) NOT NULL,
  `name` varchar(70) NOT NULL,
  `icon` varchar(70) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'ACTIVO',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contiene todos los catalogos que contiene el sistema';

--
-- Volcado de datos para la tabla `cat_module`
--

INSERT INTO `cat_module` (`id`, `name`, `icon`, `status`, `updated_at`) VALUES
(5, 'Usuarios', 'account_circle', 'ACTIVO', '2019-07-10 19:37:52'),
(10, 'Ajustes', 'settings', 'ACTIVO', '2018-11-20 23:53:03'),
(14, 'Forms', 'chrome_reader_mode', 'ACTIVO', '2018-11-20 23:53:03'),
(17, 'Routing', 'router', 'ACTIVO', '2018-11-26 17:55:37'),
(40, 'Security', 'security', 'ACTIVO', '2018-11-21 16:24:40'),
(41, 'Licenses', 'verified_user', 'ACTIVO', '2018-11-22 15:42:44'),
(43, 'App', 'view_carousel', 'ACTIVO', '2018-11-28 18:50:25'),
(45, 'Options', 'sort', 'ACTIVO', '2018-11-28 13:56:08'),
(46, 'Almacén de Partes', 'view_stream', 'ACTIVO', '2018-12-18 16:22:43'),
(47, 'Pacientes ', 'accessibility', 'ACTIVO', '2019-01-24 20:08:58'),
(48, 'Historial Clínico', 'book', 'ACTIVO', '2019-01-24 20:12:06'),
(49, 'Inventario', 'filter_9_plus', 'ACTIVO', '2019-01-24 20:16:05'),
(50, 'Pagos', 'attach_money', 'ACTIVO', '2019-01-24 20:20:37'),
(51, 'Clientes', 'accessibility', 'ACTIVO', '2019-03-27 22:56:39'),
(52, 'Servicios', 'view_carousel', 'ACTIVO', '2019-06-23 17:05:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_options`
--

CREATE TABLE `cat_options` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT '' COMMENT 'No se debe permitit null o ''''',
  `value` varchar(50) NOT NULL DEFAULT '',
  `option` varchar(50) NOT NULL DEFAULT '',
  `status` varchar(50) NOT NULL DEFAULT 'ACTIVO'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cat_options`
--

INSERT INTO `cat_options` (`id`, `type`, `value`, `option`, `status`) VALUES
(1, 'status_1_0', 'ACTIVO', 'ACTIVO', 'ACTIVO'),
(2, 'status_1_0', 'NO ACTIVO', 'NO ACTIVO', 'ACTIVO'),
(3, 'yes_no_binary', '0', 'No', 'ACTIVO'),
(4, 'yes_no_binary', '1', 'Sí', 'ACTIVO'),
(5, 'status_apps', 'DESARROLLO', 'Desarrollo', 'ACTIVO'),
(6, 'status_apps', 'ANÁLISIS', 'Análisis', 'ACTIVO'),
(7, 'status_apps', 'PRUEBAS', 'Pruebas', 'ACTIVO'),
(8, 'status_apps', 'PROMOCIÓN', 'Promoción', 'ACTIVO'),
(9, 'status_apps', 'PRODUCCIÓN', 'Producción', 'ACTIVO'),
(10, 'status_apps', 'NO ACTIVO', 'No Activo', 'ACTIVO'),
(11, 'borrar', 'borrar', 'borrar', 'ACTIVO'),
(12, 'borrar', 'otre', 'etertr', 'ACTIVO'),
(13, 'status_apps', 'PR', 'Producción', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_team`
--

CREATE TABLE `cat_team` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `des` varchar(259) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='catalogo de equipos';

--
-- Volcado de datos para la tabla `cat_team`
--

INSERT INTO `cat_team` (`id`, `id_user`, `name`, `des`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ingeniería de Software', 'Equipo encargado de los proyectos relacionados con la ing de software', '2018-03-06 12:50:35', '2018-03-06 12:50:35'),
(2, 2, 'Ventas', 'Equipo encargado de la gestión de ventas', '2018-03-06 12:50:59', '2018-03-06 12:50:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_tickets`
--

CREATE TABLE `cat_tickets` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cat_tickets`
--

INSERT INTO `cat_tickets` (`id`, `name`, `status`) VALUES
(1, 'Pregunta', '1'),
(2, 'Incidente', '1'),
(3, 'Problema', '1'),
(4, 'Tarea', '1'),
(5, 'Proyecto Individual', '0'),
(6, 'Pryecto en grupo', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_users`
--

CREATE TABLE `cat_users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `abbreviated` varchar(10) DEFAULT NULL,
  `id_app` int(11) NOT NULL DEFAULT '0',
  `id_permission` int(11) NOT NULL DEFAULT '0',
  `desc_` varchar(250) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cat_users`
--

INSERT INTO `cat_users` (`id`, `name`, `abbreviated`, `id_app`, `id_permission`, `desc_`, `status`, `updated_at`) VALUES
(27, 'Desarrollador', 'Dev', 11, 10, 'Permisos de ROOT', 'ACTIVO', '2019-01-15 02:22:42'),
(28, 'Diseñador', NULL, 11, 7, 'Todos los persmisos.', 'ACTIVO', '2018-11-13 00:05:05'),
(29, 'Doctor', 'Dr.', 14, 7, NULL, NULL, '2019-01-15 02:22:59'),
(30, 'Asistente', NULL, 14, 7, NULL, NULL, '2019-01-15 02:01:59'),
(32, 'Administrador', 'Admin', 15, 7, 'Todos los permisos de super usuario', 'ACTIVO', '2019-04-30 07:21:36'),
(35, 'Lavador', 'Lav', 15, 6, 'Permisos para gestionar lavado de ropa...', 'ACTIVO', '2019-04-30 07:23:00'),
(36, 'Cliente', 'Cliente', 15, 7, 'permisos de clientes', 'ACTIVO', '2019-04-30 07:24:14'),
(37, 'Tester', 'Tester', 11, 10, 'QA (aseguramiento de la calidad)', 'ACTIVO', '2019-06-16 03:51:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT '0',
  `image foot` varchar(300) DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '0',
  `url` varchar(50) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Se almacenan todo tipo de imagenes, fotos de perfil, de protada, losgos etc...';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licenses`
--

CREATE TABLE `licenses` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `key_` varchar(60) NOT NULL,
  `bd` varchar(30) NOT NULL,
  `fecha_ini` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_fin` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(50) NOT NULL DEFAULT 'ACTIVO',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `licenses`
--

INSERT INTO `licenses` (`id`, `company_id`, `app_id`, `key_`, `bd`, `fecha_ini`, `fecha_fin`, `status`, `updated_at`) VALUES
(5, 1, 11, '$$$L123000A8745Basdasd$fdlfhkñsdjfgjbfsdkljfgdjkfhgsdhfgjkhg', 'feengster_master', '2018-11-22 23:56:46', '2019-10-19 15:21:22', 'ACTIVO', '2018-11-22 23:56:46'),
(7, 1, 1, 'WER5serJHADFSJKrwer48ybteertetrw892348UKUJBewweSDFSbvnka454', 'feengster_master', '2018-11-23 04:09:12', '2019-10-19 15:21:22', 'ACTIVO', '2018-11-23 04:09:12'),
(8, 1, 2, 'POOLMUUJ78DFSJKrwer48ybteertetrw892348UKUJBewweSD5845kijnt', 'feengster_master', '2019-02-14 18:56:23', '2019-10-19 15:21:22', 'ACTIVO', '2019-02-14 18:56:23'),
(9, 1, 14, '$$$L123000A8745Basdasd$fdlfhkñsdjfgjbfsdkl1111113313133131', 'feengster_master', '2019-01-14 04:59:05', '2019-10-19 15:21:22', 'ACTIVO', '2019-01-14 04:59:05'),
(10, 2, 14, '$$$free$$u7bhjdsjdhb$$BROTHER$$7123babsDENTAL$8798hasdjk', 'feengster_master', '2019-01-15 02:04:52', '2026-10-19 15:21:22', 'ACTIVO', '2019-01-15 02:04:52'),
(11, 3, 15, 'yg73u47324bg324kbds7f97y3iug97tsd978y973ty4932yg497ythg72372', 'feengster_master', '2019-03-28 04:49:47', '2019-10-19 15:21:22', 'ACTIVO', '2019-03-28 04:49:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logins`
--

CREATE TABLE `logins` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL DEFAULT '0',
  `platform` varchar(20) NOT NULL DEFAULT '0',
  `token` varchar(100) NOT NULL DEFAULT '1',
  `status` varchar(50) NOT NULL DEFAULT '1',
  `ip` varchar(60) DEFAULT '0',
  `city` varchar(100) DEFAULT '0',
  `explorer` varchar(60) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `logins`
--

INSERT INTO `logins` (`id`, `id_user`, `platform`, `token`, `status`, `ip`, `city`, `explorer`, `created_at`, `updated_at`) VALUES
(78, 1, 'Web', 'q6twRXLvDU8KR1ELVp0KVXbxo$1-oCuXuTURR9e6WTgHXa6X0ICDkWotE', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-04-29 07:59:36', '2019-04-29 07:59:36'),
(85, 76, 'Web', 'ZhiHcRoNXTo3NDUc2gaOgHwHn$76-Fg24olNSRq9hyU0WmMUP45Uomlu2g', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-06-16 05:33:22', '2019-06-16 05:33:22'),
(86, 1, 'Web', 'F4igdXjo83S4wXrrGyYzRV0vX$1-kuVDaJdsSedjATmaGtx0cwwY13rjA', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-06-16 06:16:34', '2019-06-16 06:16:34'),
(87, 1, 'Web', 'dRDiAVT1kRPAXWcHyFWCNzio7$1-DlJAy1WNFtn1EqKMfSAYSd8UYKTJI', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-06-16 06:34:45', '2019-06-16 06:34:45'),
(88, 1, 'Web', 'KlZuDyVYHNLfABrs0czoRk6At$1-h7n9YP1OatewJRvM07mDqET0XNbDM', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-06-16 06:35:04', '2019-06-16 06:35:04'),
(89, 1, 'Web', 'DtowAIyovCYziO8wCngTm5gyr$1-3XRg0cYRhX0GDskJp5J4i6nRiWZFk', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-06-16 19:19:16', '2019-06-16 19:19:16'),
(90, 1, 'Web', 'EkZ8iBQA3WgjXaenCbH4PUGdI$1-0l3qXtuqVx5PmVoEd02rRqZA7hB5b', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-06-18 02:47:27', '2019-06-18 02:47:27'),
(91, 1, 'Web', 'VgzUzQPWmnHqGBF02mWbAUnMg$1-mOBX48L1sdtHGw4MkQxmx3JgBuve4', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-06-18 03:32:35', '2019-06-18 03:32:35'),
(92, 76, 'Web', 'DxnmxN5Z0d8Ho2cdNZlc1M2MK$76-oDnkkHDwkbmC9DH3niLVIgwycKJx4', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-06-18 03:35:01', '2019-06-18 03:35:01'),
(93, 1, 'Web', 'QPw2pnQSFCZzedT2H9VxBHugR$1-hOzNhyoBBTpaI1k5f9LNE4imLMKVZ', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-06-19 03:37:53', '2019-06-19 03:37:53'),
(94, 1, 'Web', 'Gvou8qql7l39Dx2dlp47Hz4tk$1-uWio7k4HNrQpiQdxx9nZ8pgdimoV2', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-06-19 03:38:05', '2019-06-19 03:38:05'),
(95, 1, 'Web', 'xLNoLzjumrmNylTzsIoRlK094$1-OYqNEHetlKbK0xESc4Q9EHw30GDCk', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-06-19 04:11:24', '2019-06-19 04:11:24'),
(96, 1, 'Web', 'h3tlga2b9K5A0OJwEEHczNUw6$1-KF8i2N3HVQDDOi4m4zHim0CugFDkx', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-06-19 15:21:52', '2019-06-19 15:21:52'),
(97, 1, 'Web', 'puYgfvAKXGwXJpMNDqfST9TH1$1-5ueLuZNRhsXIxebunWkY9CvIN2fBa', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-06-19 15:59:02', '2019-06-19 15:59:02'),
(98, 1, 'Web', 'k6WubngvN7ppOD0VGcfaTzBTY$1-p2bdf1dM6knUBrH9iXUZ1bVJqeyuq', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-06-19 16:06:59', '2019-06-19 16:06:59'),
(99, 1, 'Web', 'cajFNqwgTJacbXhjXpevaT3Zv$1-pKFNPSlRnZLz186hhWf7r0fyT1b8A', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-06-19 16:09:54', '2019-06-19 16:09:54'),
(100, 1, 'Web', '9MvapCs2fo4DQqDtdZAXXKXPU$1-nazoADf0wwsozZ65IXHqtLrvNRtdu', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-06-19 17:05:36', '2019-06-19 17:05:36'),
(101, 49, 'Web', '0W3wZMr1IZ7pzXsklJO2MwJ42$49-8pWJAreK3UtOYNrIR0Y3HZcZFXGvK', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-06-19 17:09:56', '2019-06-19 17:09:56'),
(102, 49, 'Web', 'pAW9vXbZ1WZXGTX4v8AYoMhNi$49-gJONDPq96GU1YrUPHG1VGqD2RuGkF', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-06-19 17:10:04', '2019-06-19 17:10:04'),
(103, 1, 'Web', 'yLUAtridsM7p1UoRJlTeO480y$1-fdFqR8AMPbvkFOASby8TQni67B5Lg', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-06-19 18:40:29', '2019-06-19 18:40:29'),
(104, 1, 'Web', 'jZya2AekEWIWzZI2rFecXAwIB$1-tnEJRCONofhpOfbUvtaftX1qvcLv1', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-06-19 20:57:40', '2019-06-19 20:57:40'),
(105, 1, 'Web', 'UmpKHGFib76dgNxraPUXT1y21$1-fOQ96YXWIlvSyLDQY1HlvJ0uWmy9U', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-06-20 07:49:56', '2019-06-20 07:49:56'),
(106, 1, 'Web', '2hJhkvWsu1cn1GQqImOQb0IPf$1-7kmokBeYtAOywYAbYQgZGaaH3laAE', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-06-20 22:35:43', '2019-06-20 22:35:43'),
(107, 1, 'Web', '467do8u1JKemS27de2eI8LEXn$1-mJoHnG2LuEiR5qp1Kq7LiSVWX56i9', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-06-22 16:12:02', '2019-06-22 16:12:02'),
(108, 1, 'Web', 'apHQH0NLF0M0QcguUhzdIl3j8$1-AzKQkxhidJwbpnzcvVyLxPUejOF3n', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-06-24 15:13:08', '2019-06-24 15:13:08'),
(109, 49, 'Web', 'OvNPvEZv9Tn0qk7JfigLawmvv$49-Xpc2S11ZknoaQoy6EEr6uwb6tEFN6', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-06-25 20:28:10', '2019-06-25 20:28:10'),
(110, 1, 'Web', '76XlQgeK4WfePgtOqGhjnEKhz$1-T8bhiVclgR4J9hdwAkmoZmhKVlNff', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-06-26 16:06:27', '2019-06-26 16:06:27'),
(111, 1, 'Web', 'qLODRKoxsRj9VjdR4qvuUPv7g$1-TabxL6IdOeSGhf6H8krnmpwjrJYkJ', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-06-26 16:23:21', '2019-06-26 16:23:21'),
(112, 1, 'Web', 'B2zd2v5VeAKquQ3ewxSR6zbyu$1-k14EZob5H0RlZIvb2zExOm0bIzQAE', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-06-26 18:13:06', '2019-06-26 18:13:06'),
(113, 1, 'Web', 'CB4h6vqy6CZXVQMppP478gJEr$1-jBeol2TwJFhoL5nYRnCudM6XmLwEM', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-07-05 22:29:47', '2019-07-05 22:29:47'),
(115, 1, 'Web', 'GaFUybAJN9KtnndpPunv4kF29$1-1W3zSLWi5tEc17kEGmU3vHC8HZjlF', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-07-10 19:32:45', '2019-07-10 19:32:45'),
(116, 1, 'Web', 'ELzDWwSvU0dWkFUhvhKtz6gKb$1-vbSdPLNdV7QsDOsaj1POdnmRCUryy', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-07-13 20:34:57', '2019-07-13 20:34:57'),
(117, 1, 'Web', '5x2HSLoSmC0dJTmVBbKCXtBJf$1-fdOD22bK8ytmJFB3EZZcHn5VKb6lq', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-07-13 23:24:12', '2019-07-13 23:24:12'),
(118, 1, 'Web', 't6epYnmQrBMf93MihjlumHyHh$1-p7NdXk1i9q61iEhCki6zX649YxNqU', 'ACTIVO', '0.0.0.0', 'León Gto', 'Google Chrome', '2019-07-13 23:41:51', '2019-07-13 23:41:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_ticket`
--

CREATE TABLE `log_ticket` (
  `id` int(11) NOT NULL,
  `id_ticket` int(11) NOT NULL DEFAULT '0',
  `id_user` int(11) NOT NULL DEFAULT '0',
  `time` double NOT NULL DEFAULT '0.5',
  `desc` mediumtext NOT NULL,
  `crated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `log_ticket`
--

INSERT INTO `log_ticket` (`id`, `id_ticket`, `id_user`, `time`, `desc`, `crated_at`) VALUES
(0, 0, 1, 0.5, '<p>Se ha activado la cuenta.</p><p><ul><li><strong>asdas</strong></li><li><strong>dasd</strong></li><li><strong>as</strong></li><li><strong>d</strong></li><li><strong>asd</strong></li><li><strong>as</strong></li><li><strong>dsa</strong></li><li><strong>asd</strong></li><li><strong>as</strong></li><li><strong>d</strong></li></ul></p>                                        \n                                        ', '2018-04-27 10:22:30'),
(2, 33, 2, 0.5, 'Se deben registrar los avances por cada componente terminado', '2018-04-05 07:14:26'),
(3, 33, 1, 0.5, '<p>test</p>', '2018-04-17 21:41:08'),
(4, 33, 1, 1, '<p><strong><em><strike>ssdfsdf</strike></em></strong></p>                                        \n                                        ', '2018-04-17 22:04:16'),
(5, 42, 1, 1.5, '<p><strong><em><strike>nueva gestión</strike></em></strong></p>', '2018-04-17 22:20:59'),
(6, 43, 1, 1, '<p><strong>Detallar el motivo por el cual fue eliminado este ticket.</strong></p><p><strong><br></strong></p><p><img src=\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYpIQeS8RYHm86h98u7BUw08IPWFwQB7z8rrZkRVf78M8nQwpduA\" alt=\"andriod\"><strong><br></strong></p>', '2018-04-17 23:04:25'),
(7, 41, 1, 1.5, '<p><em><strong>gestion...</strong></em></p>                                        \n                                        ', '2018-04-17 23:20:46'),
(8, 41, 1, 1.5, '<p><em><strong>gestion...</strong></em></p>                                        \n                                        ', '2018-04-17 23:20:51'),
(9, 41, 1, 1.5, '<p><em><strong>gestion...</strong></em></p>                                        \n                                        ', '2018-04-17 23:21:00'),
(10, 41, 1, 1.5, '<p><em><strong>gestion...</strong></em></p>                                        \n                                        ', '2018-04-17 23:21:05'),
(11, 42, 1, 1.5, '<p><sup>gestiónes:</sup></p><p><ul><li><span style=\"font-size: 10.5px;\">1</span></li><li><span style=\"font-size: 10.5px;\">2</span></li><li><span style=\"font-size: 10.5px;\">3</span></li><li><span style=\"font-size: 10.5px;\">4</span></li><li><span style=\"font-size: 10.5px;\">5</span></li><li><span style=\"font-size: 10.5px;\">6</span></li><li><span style=\"font-size: 10.5px;\"><br></span></li></ul></p>                                        \n                                        ', '2018-04-17 23:52:52'),
(12, 42, 1, 1, '<p><sup>gestiónes:</sup></p><p><ul><li><span style=\"font-size: 10.5px;\">1</span></li><li><span style=\"font-size: 10.5px;\">2</span></li><li><span style=\"font-size: 10.5px;\">3</span></li><li><span style=\"font-size: 10.5px;\">4</span></li><li><span style=\"font-size: 10.5px;\">5</span></li><li><span style=\"font-size: 10.5px;\">6</span></li><li><span style=\"font-size: 10.5px;\"><br></span></li></ul></p>                                        \n                                        ', '2018-04-17 23:53:17'),
(13, 42, 1, 2, '<p>gestión ...</p>                                        \n                                        ', '2018-04-17 23:53:49'),
(14, 42, 1, 1.5, '<p>gestión....</p>                                        \n                                        ', '2018-04-18 00:18:55'),
(15, 42, 1, 1.5, '<p><strong>gestión&nbsp;</strong></p>', '2018-04-18 00:27:14'),
(16, 42, 1, 1, '<p><em>gestión....</em></p>                                        \n                                        ', '2018-04-18 00:29:49'),
(17, 42, 1, 2, '<p><strike>Ultima gestión</strike></p>                                        \n                                        ', '2018-04-18 00:33:24'),
(18, 42, 1, 2, '<p>jgsdhshfdsfhsgdf</p>                                        \n                                        ', '2018-04-18 22:35:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_permits`
--

CREATE TABLE `menu_permits` (
  `id` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `id_permission` int(11) NOT NULL,
  `status` char(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `select_` char(1) NOT NULL DEFAULT '0',
  `create_` char(1) NOT NULL DEFAULT '0',
  `update_` char(1) NOT NULL DEFAULT '0',
  `update_dalete` char(1) NOT NULL DEFAULT '0',
  `delete` char(1) NOT NULL DEFAULT '0',
  `restore` char(1) NOT NULL DEFAULT '0',
  `status` varchar(20) NOT NULL DEFAULT 'ACTIVO'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `permissions`
--

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `id_app`, `id_company`, `id_category`, `name`, `desc_`, `price_bay`, `price_pg`, `price_desc`, `existence`, `images`, `status`, `updated_at`, `created_at`) VALUES
(1, 10, 9, 4, 'Block hueco', 'Block hueco hecho a base de materiales pétreos medidas alta resistencia  19cm x 12cm x 39cm ', 4, 6, 0, 400, ',https://firebasestorage.googleapis.com/v0/b/feengster-app.appspot.com/o/beauty%2Fservicios%2Fimgblock.jpg?alt=media&token=1fd5d3f8-88f4-4c36-a699-cdbb01fd6f33,https://firebasestorage.googleapis.com/v0/b/feengster-app.appspot.com/o/beauty%2Fservicios%2Fimg32892048_429275290913197_2644128407406772224_n.jpg?alt=media&token=59276305-7198-42be-b944-a9155f25920a', 'ACTIVO', '2018-07-24 21:26:39', '2018-07-05 05:23:01'),
(2, 5, 2, 10, 'nuevo', 'desc', 1, 1, 1, 14, ',,,,https://firebasestorage.googleapis.com/v0/b/feengster-app.appspot.com/o/beauty%2Fservicios%2Fimglogo.jpg?alt=media&token=0414c085-9046-4d35-9c2f-cc3b97f46bff', 'ACTIVO', '2018-07-23 16:21:24', '2018-07-16 19:50:20'),
(3, 5, 2, 10, 'nuevo', 'desc', 1, 1, 1, 5, ',,https://firebasestorage.googleapis.com/v0/b/feengster-app.appspot.com/o/beauty%2Fservicios%2Fimglalo.jpg?alt=media&token=bf617037-b6d3-4d01-8d56-2c7246650721,https://firebasestorage.googleapis.com/v0/b/feengster-app.appspot.com/o/beauty%2Fservicios%2Fimgportada.png?alt=media&token=40727d0f-8ee4-4251-9548-208cbc769d25,https://firebasestorage.googleapis.com/v0/b/feengster-app.appspot.com/o/beauty%2Fservicios%2Fimg32892048_429275290913197_2644128407406772224_n.jpg?alt=media&token=5821aaed-0d75-4c71-89a8-34d9fb8c534f', 'ACTIVO', '2018-07-16 19:56:15', '2018-07-16 19:51:20'),
(4, 10, 1, 14, 'Suela', '', 0, 0, 0, 12, 'https://firebasestorage.googleapis.com/v0/b/feengster-app.appspot.com/o/beauty%2Fservicios%2Fimg32892048_429275290913197_2644128407406772224_n.jpg?alt=media&token=4bfeeca0-19a0-4c45-bcab-c57a4777371e', 'ACTIVO', '2018-08-09 03:35:12', '2018-08-09 03:35:12'),
(5, 10, 11, 15, '2do', '--', 10.9, 20.5, 15.8, 100, '', 'ACTIVO', '2018-08-09 04:22:09', '2018-08-09 04:20:17'),
(6, 10, 11, 15, 'Textil', '-', 0, 12.01, 0, 12, '', 'ACTIVO', '2018-08-09 04:33:40', '2018-08-09 04:28:42'),
(7, 10, 11, 16, 'Duramax', '-', 0, 12.9, 0, 1, ',https://firebasestorage.googleapis.com/v0/b/feengster-app.appspot.com/o/beauty%2Fservicios%2Fimg32892048_429275290913197_2644128407406772224_n.jpg?alt=media&token=94470b35-aa8c-4685-ad9e-a52e88c2942c', 'ACTIVO', '2018-08-09 04:43:07', '2018-08-09 04:32:47'),
(8, 10, 11, 15, 'Pro', '-', 0, 122.9, 0, 1, '', 'ACTIVO', '2018-08-09 04:33:51', '2018-08-09 04:33:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `services`
--

INSERT INTO `services` (`id`, `id_app`, `id_company`, `id_category`, `name`, `desc_`, `price_gn`, `price_desc`, `price_special`, `images`, `status`, `updated_at`, `created_at`) VALUES
(1, 5, 2, 11, 'nuevo sEr', 'desc', 1, 1, 1, ',https://firebasestorage.googleapis.com/v0/b/feengster-app.appspot.com/o/beauty%2Fservicios%2Fimglalo.jpg?alt=media&token=07851b24-f89c-43d9-8c79-6eff531b60de,https://firebasestorage.googleapis.com/v0/b/feengster-app.appspot.com/o/beauty%2Fservicios%2FimgINE_FRENTE.JPG?alt=media&token=f32ce6aa-d88c-4d4e-be24-ef6a7700ab5b,', 'ACTIVO', '2018-07-16 20:33:09', '2018-07-16 20:29:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tables`
--

CREATE TABLE `tables` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `code` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tables`
--

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
(14, 'user_cat_user', '41MO8VE2X4K5S6ALVBO4BXDUUGGLBKKUBPDHY4ECA6QSK3K71EI4SC21QAWD'),
(15, 'cat_address', '2B26CV5S7E44X2AWDW4OQC9XM3AXIIOLOA4GPW19XKRWUBSORHVNDKIJVGEB'),
(16, 'user_client', 'GC0PA259M132SHQW2B5K06JUE7JS1MN5IUE7JUCUYXKQQ6D1TR0KF9NA5L72'),
(19, 'categories', 'RMLSXXM3C5D7M6QVWM5L9AADQA0TS7GC1YCMRQ1P7NDMQJ75UGGPTPUR0I7A'),
(20, 'facturas', 'JJUBRKAICYICXCMV89CLQMMZQHWU65VM7VHJYXIFD9XKSY5K3J3NP9YOA4GN');

--
-- Disparadores `tables`
--
DELIMITER $$
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

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `id_user_created` int(11) NOT NULL DEFAULT '0',
  `id_user_resolve` int(11) DEFAULT '0',
  `id_user_cc` int(11) DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `id_product` int(11) NOT NULL DEFAULT '0',
  `category` varchar(50) NOT NULL DEFAULT 'TICKET' COMMENT '1: ticket, 2:proyecto: 3:tarea',
  `team` int(1) NOT NULL DEFAULT '0' COMMENT '1: si, 2: no',
  `id_team` int(11) UNSIGNED NOT NULL,
  `des` longtext NOT NULL,
  `type` varchar(50) NOT NULL COMMENT 'pregunta, incidente, problema, cambio, adecuación etc. crear un catalogo!',
  `priority` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'NUEVO' COMMENT 'sin asignar,nuevo, abierto, pendiente, resuelto, suspendido, eliminado',
  `files` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `resolve_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tickets`
--

INSERT INTO `tickets` (`id`, `id_user_created`, `id_user_resolve`, `id_user_cc`, `name`, `code`, `id_product`, `category`, `team`, `id_team`, `des`, `type`, `priority`, `status`, `files`, `created_at`, `resolve_at`) VALUES
(1, 1, 1, 0, 'Modulo de Categorías', 'T-200518-00003', 0, 'TICKET', 0, 0, 'Ingresa los detalles...', 'NUEVO MÓDULO', 'NORMAL', 'NUEVO', NULL, '2018-05-21 03:08:13', '0000-00-00 00:00:00'),
(37, 1, 3, 0, 'Testing', 'T-180225001', 0, 'TICKET', 0, 0, '<p>De prueba....</p>', 'PREGUNTA', 'BAJA', 'RESUELTO', NULL, '2018-04-05 12:41:31', '0000-00-00 00:00:00'),
(47, 1, 2, 5, 'Prueba desde Móvil', 'T-180225002', 2, 'TICKET', 0, 0, '<p>Prueba desde móvil...</p>', 'ADECUACIÓN', 'BAJA', 'NUEVO', NULL, '2018-04-18 02:06:30', '0000-00-00 00:00:00'),
(48, 1, 0, 1, 'Testin', 'T-310518-00004', 1, 'TICKET', 0, 0, '<p>TEsting esta en <strong>negrita</strong></p>', 'PREGUNTA', 'NORMAL', 'NUEVO', NULL, '2018-06-01 03:14:49', '0000-00-00 00:00:00'),
(49, 1, 0, 1, 'testing 3', 'T-310518-00005', 3, 'TICKET', 0, 0, '<p>Ingres<strong>a los detalles...</strong></p>', 'PREGUNTA', 'BAJA', 'NUEVO', '{\"0\":{\"bucket\":\"feengster-app.appspot.com\",\"path\":\"tickets\\/docs\\/Captura de pantalla (4).png\",\"name\":\"Captura de pantalla (4).png\",\"size\":\"244508\",\"contentType\":\"image\\/png\",\"urlPublic\":\"\"},\"number\":\"1\"}', '2018-06-01 03:34:37', '0000-00-00 00:00:00'),
(50, 1, 0, 1, 'Testing 4', 'T-310518-00006', 1, 'TICKET', 0, 0, '<p>Testing 4</p>', 'PROBLEMA', 'NORMAL', 'NUEVO', '{\"undefined\":{\"bucket\":\"feengster-app.appspot.com\",\"path\":\"tickets\\/docs\\/32892048_429275290913197_2644128407406772224_n.jpg\",\"name\":\"32892048_429275290913197_2644128407406772224_n.jpg\",\"size\":\"137820\",\"contentType\":\"image\\/jpeg\",\"urlPublic\":\"\"},\"number\":\"NaN\"}', '2018-06-01 03:52:35', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket_files`
--

CREATE TABLE `ticket_files` (
  `id` int(11) NOT NULL,
  `id_ticket` int(11) NOT NULL,
  `id_log` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `url` varchar(200) NOT NULL,
  `type` varchar(50) NOT NULL,
  `created_at` varchar(50) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(40) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `surnames` varchar(120) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `img` varchar(9000) DEFAULT '../assets/dist/img/perfil.png',
  `password` varchar(60) DEFAULT NULL,
  `oldpassword` varchar(60) DEFAULT '0',
  `birthdate` date DEFAULT NULL,
  `platform` varchar(6) DEFAULT 'Web',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(10) NOT NULL DEFAULT 'REGISTRADO'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `surnames`, `phone`, `email`, `img`, `password`, `oldpassword`, `birthdate`, `platform`, `updated_at`, `created_at`, `status`) VALUES
(1, '@lalo', 'Juan Eduardo', 'Rosales', '477-915-59-37', 'eduardorosales720@gmail.com', 'https://firebasestorage.googleapis.com/v0/b/feengster-app.appspot.com/o/img_profile%2FmyAvatar%20(3).png?alt=media&token=30a870f2-6160-4391-9e02-7d3b19bf507a', '123456', '$2y$10$6Xt9MWZWpy/B3wB3Phj1qu/9WEE88XtmPs6cFU2.p9EA5eesyvRYK', '1996-09-01', 'Web', '2019-06-19 00:58:45', '2018-10-18 22:43:58', 'ACTIVO'),
(49, '@bernardo', 'José Bernardo', 'Rosales Rosales', '273-000-00-00', 'bernardo@hotmail.com', 'http://feengster.com/app/assets/dist/img/perfil.png', '123456', '0', '1991-12-01', 'Web', '2019-04-26 00:34:18', '2019-04-26 05:34:19', 'ACTIVO'),
(50, '@cosme', 'José Cosme', 'Rosales Rosales', '273-000-00-01', 'cosme@gmail.com', 'http://feengster.com/app/assets/dist/img/perfil.png', '123456', '0', '1988-01-01', 'Web', '2019-06-15 19:41:23', '2019-04-26 05:36:13', 'NO ACTIVO'),
(76, '@pau', 'Paulinaa', 'Báezz', '473-114-65-09', 'paub@gmail.com', '../assets/dist/img/perfil.png', '123456', '0', '2000-01-31', 'Web', '2019-06-19 11:12:01', '2019-06-16 03:55:13', 'ACTIVO'),
(78, NULL, 'Juan Carlos', 'Ambrosio', '273-123-94-78', 'juan321345@hotmail.com', '../assets/dist/img/perfil.png', NULL, '0', '1999-04-23', 'Web', '2019-06-20 02:52:56', '2019-06-19 17:31:37', 'ACTIVO'),
(79, NULL, 'asfdasdfs', 'asdfasdf', '454-654-54-66', 'sfsdf@dsf.vsdf', '../assets/dist/img/perfil.png', NULL, '0', '1944-12-01', 'Web', '2019-07-14 16:32:53', '2019-07-14 21:32:52', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_app`
--

CREATE TABLE `user_app` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `main` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user_app`
--

INSERT INTO `user_app` (`id`, `user_id`, `app_id`, `main`) VALUES
(1, 1, 2, 0),
(2, 1, 11, 1),
(7, 1, 14, 0),
(13, 49, 15, 1),
(14, 50, 14, 1),
(16, 76, 15, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_cat_user`
--

CREATE TABLE `user_cat_user` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `id_cat_user` int(11) NOT NULL DEFAULT '0',
  `main` int(1) NOT NULL DEFAULT '0',
  `status` varchar(50) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Se almacenan los roles que tiene el usuario. Un usario puede ser Administrador, supervisor y gesto a la vez o solo cliente.';

--
-- Volcado de datos para la tabla `user_cat_user`
--

INSERT INTO `user_cat_user` (`id`, `user_id`, `id_cat_user`, `main`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 27, 1, '1', '2018-11-13 16:19:40', '2018-11-13 16:19:40'),
(6, 1, 27, 0, '1', '2018-12-11 18:03:50', '2018-12-11 18:03:50'),
(12, 49, 27, 1, '1', '2019-04-26 05:34:19', '2019-04-26 05:34:19'),
(13, 50, 27, 1, '1', '2019-04-26 05:36:13', '2019-04-26 05:36:13'),
(27, 76, 37, 1, '1', '2019-06-16 03:55:16', '2019-06-16 03:55:16'),
(29, 78, 36, 15, '1', '2019-06-19 17:31:37', '2019-06-19 17:31:37'),
(30, 79, 36, 15, '1', '2019-07-14 21:32:54', '2019-07-14 21:32:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_client`
--

CREATE TABLE `user_client` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `address_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Usuarios que son clientes de algunas de las empresas que rentan una app de feengster. Un cliente puede ser cleinte de una o mas empresas y de una o mas aplicaiones de la misma empresa.';

--
-- Volcado de datos para la tabla `user_client`
--

INSERT INTO `user_client` (`id`, `user_id`, `app_id`, `company_id`, `address_id`) VALUES
(2, 78, 15, 3, 21),
(3, 79, 15, 3, 22);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_companies`
--

CREATE TABLE `user_companies` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `id_company` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Un usuario pertenece a una sola empresa | una empresa puede tener varios usuarios';

--
-- Volcado de datos para la tabla `user_companies`
--

INSERT INTO `user_companies` (`id`, `user_id`, `id_company`) VALUES
(10, 1, 1),
(16, 49, 3),
(17, 50, 2),
(18, 51, 2),
(32, 59, 0),
(33, 60, 0),
(34, 61, 0),
(35, 62, 0),
(36, 63, 0),
(37, 64, 0),
(38, 66, 0),
(39, 67, 0),
(40, 73, 0),
(41, 74, 3),
(42, 75, 0),
(43, 76, 3),
(44, 77, 0),
(45, 78, 0),
(46, 77, 0),
(47, 78, 0),
(48, 79, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_images`
--

CREATE TABLE `user_images` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `img_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='se almacenan todas la imagenes que tienen los usuarios para ello se debe contar con id_img valido';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tittle` varchar(120) NOT NULL,
  `notification` varchar(600) NOT NULL,
  `link` varchar(300) DEFAULT NULL,
  `ico` varchar(60) DEFAULT NULL,
  `type` varchar(60) NOT NULL,
  `send_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Se almecena las notificaciónes de usuarios.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_profile`
--

CREATE TABLE `user_profile` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `role` varchar(120) DEFAULT '0',
  `slogan` varchar(120) DEFAULT '0',
  `id_address` int(11) DEFAULT '0',
  `id_img_profile` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user_profile`
--

INSERT INTO `user_profile` (`id`, `user_id`, `role`, `slogan`, `id_address`, `id_img_profile`, `status`, `created_at`, `updated_at`) VALUES
(4, 1, 'Desarrollo', 'Si lohaces en la vida real, se puede programar', 0, NULL, 0, '2018-03-06 13:41:48', '2018-05-06 00:25:58'),
(5, 3, 'Administrador', '0', 0, NULL, 0, '2018-05-06 05:58:28', '2018-05-06 05:59:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_ratings`
--

CREATE TABLE `user_ratings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `id_user_writer` int(11) NOT NULL,
  `stars` int(11) NOT NULL,
  `commentary` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='calificaciónes de los usuarios departe de otro usuarios de 1-5 estrellas.\r\n';

--
-- Volcado de datos para la tabla `user_ratings`
--

INSERT INTO `user_ratings` (`id`, `user_id`, `id_user_writer`, `stars`, `commentary`, `created_at`) VALUES
(1, 1, 2, 4, 'Good job', '2018-03-06 12:26:04'),
(3, 1, 5, 5, 'Sin comentarios', '2018-03-06 12:26:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_teams`
--

CREATE TABLE `user_teams` (
  `team_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user_teams`
--

INSERT INTO `user_teams` (`team_id`, `user_id`) VALUES
(1, 1),
(1, 5),
(1, 3),
(2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_tels`
--

CREATE TABLE `user_tels` (
  `user_id` int(11) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `code_phone` varchar(2) DEFAULT NULL,
  `tel` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user_tels`
--

INSERT INTO `user_tels` (`user_id`, `type`, `code_phone`, `tel`) VALUES
(1, 'home', NULL, '2734880615'),
(1, 'work', NULL, '4777654326'),
(1, 'work', NULL, '4778765543'),
(1, 'home', NULL, '2734880609');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `app_menus`
--
ALTER TABLE `app_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_app_menus_cat_apps` (`id_app`),
  ADD KEY `FK2_app_menu` (`id_menu`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_app` (`id_app`);

--
-- Indices de la tabla `cat_address`
--
ALTER TABLE `cat_address`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cat_apps`
--
ALTER TABLE `cat_apps`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `nombre` (`name`),
  ADD KEY `platform` (`platform`);

--
-- Indices de la tabla `cat_company`
--
ALTER TABLE `cat_company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1_admin` (`admin_id`);

--
-- Indices de la tabla `cat_menus`
--
ALTER TABLE `cat_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_cat_menus_cat_module` (`id_module`);

--
-- Indices de la tabla `cat_module`
--
ALTER TABLE `cat_module`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cat_options`
--
ALTER TABLE `cat_options`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cat_team`
--
ALTER TABLE `cat_team`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_cat_team_users` (`id_user`);

--
-- Indices de la tabla `cat_tickets`
--
ALTER TABLE `cat_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cat_users`
--
ALTER TABLE `cat_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_cat_users_cat_apps` (`id_app`),
  ADD KEY `FK_cat_users_permissions` (`id_permission`);

--
-- Indices de la tabla `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Indices de la tabla `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_licencias_cat_producto` (`app_id`),
  ADD KEY `FK_company` (`company_id`);

--
-- Indices de la tabla `logins`
--
ALTER TABLE `logins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `FK_logins_users` (`id_user`);

--
-- Indices de la tabla `log_ticket`
--
ALTER TABLE `log_ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_log_ticket_tickets` (`id_ticket`);

--
-- Indices de la tabla `menu_permits`
--
ALTER TABLE `menu_permits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_menu_permits_cat_menus` (`id_menu`),
  ADD KEY `FK_menu_permits_cat_permissions` (`id_permission`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tickets_users` (`id_user_created`),
  ADD KEY `FK_tickets_users_2` (`id_user_resolve`);

--
-- Indices de la tabla `ticket_files`
--
ALTER TABLE `ticket_files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `user_app`
--
ALTER TABLE `user_app`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_user_app_license` (`app_id`),
  ADD KEY `FK_user` (`user_id`);

--
-- Indices de la tabla `user_cat_user`
--
ALTER TABLE `user_cat_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_user_cat_user_users` (`user_id`),
  ADD KEY `FK_user_cat_user_cat_users` (`id_cat_user`);

--
-- Indices de la tabla `user_client`
--
ALTER TABLE `user_client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_user_client_users` (`user_id`),
  ADD KEY `FK_user_client_cat_apps` (`app_id`),
  ADD KEY `FK_user_client_cat_company` (`company_id`),
  ADD KEY `FK_user_client_cat_address` (`address_id`);

--
-- Indices de la tabla `user_companies`
--
ALTER TABLE `user_companies`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user_images`
--
ALTER TABLE `user_images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_img` (`img_id`),
  ADD KEY `FK__users` (`user_id`);

--
-- Indices de la tabla `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_user_notifications_users` (`user_id`);

--
-- Indices de la tabla `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_user_profile_images` (`id_img_profile`),
  ADD KEY `FK_user_profile_users` (`user_id`);

--
-- Indices de la tabla `user_tels`
--
ALTER TABLE `user_tels`
  ADD KEY `FK_user_tels_users` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `app_menus`
--
ALTER TABLE `app_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `cat_address`
--
ALTER TABLE `cat_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `cat_apps`
--
ALTER TABLE `cat_apps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `cat_company`
--
ALTER TABLE `cat_company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cat_menus`
--
ALTER TABLE `cat_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `cat_module`
--
ALTER TABLE `cat_module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `cat_options`
--
ALTER TABLE `cat_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `cat_users`
--
ALTER TABLE `cat_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `licenses`
--
ALTER TABLE `licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `logins`
--
ALTER TABLE `logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tables`
--
ALTER TABLE `tables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT de la tabla `user_app`
--
ALTER TABLE `user_app`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `user_cat_user`
--
ALTER TABLE `user_cat_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `user_client`
--
ALTER TABLE `user_client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `user_companies`
--
ALTER TABLE `user_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `app_menus`
--
ALTER TABLE `app_menus`
  ADD CONSTRAINT `FK2_app_menu` FOREIGN KEY (`id_menu`) REFERENCES `cat_menus` (`id`),
  ADD CONSTRAINT `FK_app_menus_cat_apps` FOREIGN KEY (`id_app`) REFERENCES `cat_apps` (`id`);

--
-- Filtros para la tabla `cat_company`
--
ALTER TABLE `cat_company`
  ADD CONSTRAINT `FK1_admin` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cat_menus`
--
ALTER TABLE `cat_menus`
  ADD CONSTRAINT `FK_cat_menus_cat_module` FOREIGN KEY (`id_module`) REFERENCES `cat_module` (`id`);

--
-- Filtros para la tabla `cat_users`
--
ALTER TABLE `cat_users`
  ADD CONSTRAINT `FK_cat_users_cat_apps` FOREIGN KEY (`id_app`) REFERENCES `cat_apps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cat_users_permissions` FOREIGN KEY (`id_permission`) REFERENCES `permissions` (`id`);

--
-- Filtros para la tabla `licenses`
--
ALTER TABLE `licenses`
  ADD CONSTRAINT `FK_app` FOREIGN KEY (`app_id`) REFERENCES `cat_apps` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_company` FOREIGN KEY (`company_id`) REFERENCES `cat_company` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `logins`
--
ALTER TABLE `logins`
  ADD CONSTRAINT `FK_usuario` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `user_app`
--
ALTER TABLE `user_app`
  ADD CONSTRAINT `FK_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_user_app_license` FOREIGN KEY (`app_id`) REFERENCES `cat_apps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `user_cat_user`
--
ALTER TABLE `user_cat_user`
  ADD CONSTRAINT `FK_user_cat_user_cat_users` FOREIGN KEY (`id_cat_user`) REFERENCES `cat_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_user_cat_user_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `user_client`
--
ALTER TABLE `user_client`
  ADD CONSTRAINT `FK_user_client_cat_address` FOREIGN KEY (`address_id`) REFERENCES `cat_address` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_user_client_cat_apps` FOREIGN KEY (`app_id`) REFERENCES `cat_apps` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_user_client_cat_company` FOREIGN KEY (`company_id`) REFERENCES `cat_company` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_user_client_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `user_tels`
--
ALTER TABLE `user_tels`
  ADD CONSTRAINT `FK_user_tels_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
