-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-08-2018 a las 16:44:01
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.1.13

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_menus`
--

CREATE TABLE `app_menus` (
  `id` int(11) NOT NULL,
  `id_app` int(11) NOT NULL DEFAULT '9',
  `id_menu` int(11) NOT NULL,
  `custom` char(1) NOT NULL DEFAULT '0',
  `show_c` char(1) NOT NULL DEFAULT '0',
  `write_c` char(1) NOT NULL DEFAULT '0',
  `change_c` char(1) NOT NULL DEFAULT '0',
  `delete_c` char(1) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Se almacena el menú de cada usuario, cada menú almacena en menu_permits los permisos necesario para que\r\nun usuario lo use.';

--
-- Volcado de datos para la tabla `app_menus`
--

INSERT INTO `app_menus` (`id`, `id_app`, `id_menu`, `custom`, `show_c`, `write_c`, `change_c`, `delete_c`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '0', '0', '0', '0', '0', '1', '2018-02-23 05:27:22', '2018-06-05 02:31:08'),
(2, 1, 2, '0', '0', '0', '0', '0', '1', '2018-02-23 05:27:32', '2018-06-05 02:31:08'),
(3, 1, 3, '0', '0', '0', '0', '0', '1', '2018-02-23 05:27:42', '2018-06-05 02:31:08'),
(4, 1, 4, '0', '0', '0', '0', '0', '1', '2018-02-23 05:27:56', '2018-06-05 02:31:08'),
(7, 1, 5, '0', '0', '0', '0', '0', '1', '2018-02-23 05:28:12', '2018-06-05 02:31:08'),
(9, 1, 6, '0', '0', '0', '0', '0', '1', '2018-02-23 05:28:30', '2018-06-05 02:31:08'),
(10, 1, 7, '0', '0', '0', '0', '0', '1', '2018-02-23 05:28:37', '2018-06-05 02:31:08'),
(11, 1, 8, '0', '0', '0', '0', '0', '1', '2018-02-23 05:28:47', '2018-06-05 02:31:08'),
(12, 1, 9, '0', '0', '0', '0', '0', '1', '2018-02-23 05:28:55', '2018-06-05 02:31:08'),
(13, 1, 10, '0', '0', '0', '0', '0', '1', '2018-02-23 05:29:09', '2018-06-05 02:31:08'),
(14, 1, 11, '0', '0', '0', '0', '0', '1', '2018-02-23 05:29:30', '2018-06-05 02:31:08'),
(15, 1, 12, '0', '0', '0', '0', '0', '1', '2018-02-23 05:29:40', '2018-06-05 02:31:08'),
(16, 1, 14, '0', '0', '0', '0', '0', '1', '2018-03-08 05:30:35', '2018-06-05 02:31:08'),
(17, 5, 15, '0', '0', '0', '0', '0', '1', '2018-03-08 06:38:01', '2018-06-19 10:09:54'),
(18, 5, 17, '0', '0', '0', '0', '0', '1', '2018-03-08 06:38:18', '2018-06-19 10:09:58'),
(19, 5, 18, '0', '0', '0', '0', '0', '1', '2018-03-08 06:38:35', '2018-06-19 10:10:06'),
(20, 5, 16, '0', '0', '0', '0', '0', '1', '2018-03-13 05:12:51', '2018-06-19 10:10:12'),
(21, 1, 19, '0', '0', '0', '0', '0', '1', '2018-03-30 00:09:24', '2018-06-05 02:31:08'),
(22, 1, 20, '0', '0', '0', '0', '0', '1', '2018-04-17 16:52:18', '2018-06-05 02:31:08'),
(24, 1, 21, '0', '0', '0', '0', '0', '1', '2018-04-17 16:56:54', '2018-06-05 02:31:08'),
(25, 1, 22, '0', '0', '0', '0', '0', '1', '2018-04-17 19:16:12', '2018-06-05 02:31:08'),
(26, 1, 24, '0', '0', '0', '0', '0', '1', '2018-04-17 19:27:00', '2018-06-05 02:31:08'),
(27, 1, 25, '0', '0', '0', '0', '0', '1', '2018-04-17 19:30:06', '2018-06-05 02:31:08'),
(28, 1, 26, '0', '0', '0', '0', '0', '1', '2018-04-17 19:32:14', '2018-06-05 02:31:08'),
(29, 5, 27, '1', '1', '0', '0', '0', '1', '2018-04-18 22:50:21', '2018-06-05 03:10:43'),
(30, 5, 28, '0', '0', '0', '0', '0', '1', '2018-06-05 03:02:17', '2018-06-05 03:10:47'),
(31, 5, 29, '0', '0', '0', '0', '0', '1', '2018-06-05 03:11:01', '2018-06-05 03:11:01'),
(32, 5, 30, '0', '0', '0', '0', '0', '1', '2018-06-19 10:27:46', '2018-06-19 10:27:46'),
(33, 10, 28, '0', '0', '0', '0', '0', '1', '2018-07-05 03:06:04', '2018-07-05 03:06:04'),
(34, 10, 29, '0', '0', '0', '0', '0', '1', '2018-07-05 03:06:14', '2018-07-05 03:06:14'),
(35, 10, 30, '0', '0', '0', '0', '0', '1', '2018-07-05 03:06:20', '2018-07-05 03:06:20'),
(36, 10, 27, '0', '0', '0', '0', '0', '1', '2018-07-05 03:07:13', '2018-07-05 03:07:49'),
(37, 10, 31, '0', '0', '0', '0', '0', '1', '2018-07-05 03:07:19', '2018-07-05 03:07:19'),
(38, 10, 15, '0', '0', '0', '0', '0', '1', '2018-07-05 03:08:25', '2018-07-05 03:08:25'),
(39, 1, 15, '0', '0', '0', '0', '0', '1', '2018-07-05 03:44:52', '2018-07-05 03:44:52'),
(40, 5, 31, '0', '0', '0', '0', '0', '1', '2018-07-23 16:25:31', '2018-07-23 16:26:07'),
(41, 5, 32, '0', '0', '0', '0', '0', '1', '2018-07-23 16:39:12', '2018-07-23 16:39:12'),
(42, 5, 33, '0', '0', '0', '0', '0', '1', '2018-07-23 22:02:05', '2018-07-23 22:02:05');

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
(16, 10, 11, 'PRODUCTOS', 'Suela B', 'La Suela tipo \"B\" sirve para...', 'ACTIVO', '2018-08-09 03:47:03', '2018-08-09 03:47:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_apps`
--

CREATE TABLE `cat_apps` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `platform` varchar(50) DEFAULT '' COMMENT '1: web 2: móvil',
  `url` varchar(50) DEFAULT '',
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cat_apps`
--

INSERT INTO `cat_apps` (`id`, `name`, `platform`, `url`, `estatus`) VALUES
(1, 'MySupport Web', 'web', 'mysupport/', 1),
(2, 'MySupport Móvil', 'android', '', 1),
(3, 'Pet Web', 'web', 'pet/', 0),
(4, 'Pet Móvil', 'web', '', 0),
(5, 'Beaty Web', 'web', 'beauty/', 1),
(6, 'Beaty Móvil', 'web', '', 0),
(8, 'Healthy Life Estetica', 'web', '', 1),
(9, 'Feengster apps', 'web', 'main/', 1),
(10, 'ForSale', 'web', 'forsale/', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_company`
--

CREATE TABLE `cat_company` (
  `id` int(11) UNSIGNED NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `address_id` varchar(50) DEFAULT NULL,
  `company` varchar(60) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `type` varchar(50) DEFAULT NULL,
  `rfc` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cat_company`
--

INSERT INTO `cat_company` (`id`, `admin_id`, `address_id`, `company`, `priority`, `type`, `rfc`, `email`, `status`, `created_at`, `updated_at`) VALUES
(2, 15, NULL, 'D´Javier', 1, NULL, NULL, NULL, 1, '2018-05-06 04:22:31', '2018-07-16 18:53:32'),
(3, 2, NULL, 'Demo', 1, NULL, NULL, NULL, 1, '2018-05-06 04:22:31', '2018-07-05 03:51:29'),
(1, 1, NULL, 'Feengster', 5, '0', NULL, '', 1, '2018-05-06 04:22:31', '2018-07-05 01:43:47'),
(9, 9, NULL, 'Ros Block', 1, NULL, NULL, NULL, 1, '2018-07-05 03:30:09', '2018-07-05 03:52:29'),
(10, 11, NULL, '[Nombre de tú empresa]', 1, NULL, NULL, NULL, 1, '2018-07-08 20:47:40', '2018-07-08 20:58:41'),
(11, NULL, NULL, 'Lulu', 1, NULL, NULL, NULL, 1, '2018-08-09 02:59:20', '2018-08-09 02:59:20');

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
  `title_desc` varchar(120) DEFAULT NULL,
  `print` char(1) DEFAULT '1',
  `show_` char(1) DEFAULT '1',
  `status` char(1) DEFAULT '1',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Se enuecntran almacenados todos los menús del producto.';

--
-- Volcado de datos para la tabla `cat_menus`
--

INSERT INTO `cat_menus` (`id`, `id_module`, `name`, `order_name`, `android`, `url`, `function_`, `title`, `title_desc`, `print`, `show_`, `status`, `updated_at`) VALUES
(1, 1, 'Nueva Mascota', 2, 0, '', 'alert(\'Aun no!!\')', 'Dashboard Personal', 'En este dashboard se ven reflejado tu trabajo personal', '1', '1', '1', '2018-04-28 08:33:56'),
(2, 1, 'Grupal', 2, 0, '', 'completar(\'En contrucción\')', 'Dashboard Grupal', 'En este dashboard se ve reflejado el trabajo en tus grupos', '1', '1', '1', '2018-04-06 06:39:40'),
(3, 1, 'Supervisión', 3, 0, '', 'completar(\'En contrucción\')', 'Dashboard de Supervisión', 'En este dashboard se ve reflejado el trabajo de todos tus jestores a tu cargo', '1', '1', '1', '2018-04-06 06:39:42'),
(4, 1, 'Administracion', 4, 0, '', 'completar(\'En contrucción\')', 'Dashboard de Administración', 'en este Dashboard se ve reflejado el flujo del sistema en general', '1', '1', '1', '2018-04-18 02:12:21'),
(5, 2, 'Sin Asignar', 5, 1, 'mysupport\\tickets\\verticket\\verTickets.html', 'verTickets(\'SIN ASIGNAR\', 5)', 'Sin Asignar', 'Tickets que no se han asignados a un equipo o a un gestor individual', '1', '1', '1', '2018-05-30 23:45:40'),
(6, 2, 'Nuevos', 6, 1, 'mysupport\\tickets\\verticket\\verTickets.html', 'verTickets(\'NUEVO\', 6)', 'Tickets Nuevos', 'Nuevos tickets asigandos ', '1', '1', '1', '2018-05-30 23:46:16'),
(7, 2, 'Pendientes', 7, 1, 'mysupport\\tickets\\verticket\\verTickets.html', 'verTickets(\'PENDIENTE\', 7)', 'Tickets Pendientes', 'Tickets pendientes, se recomienda atenderlos lo más pronto posible', '1', '1', '1', '2018-05-30 23:46:21'),
(8, 2, 'Sin resolver', 8, 1, 'mysupport\\tickets\\verticket\\verTickets.html', 'verTickets(\'SIN RESOLVER\', 8)', 'Tickets Sin Resolver 1', 'Tickets sin resolbver se recomienda darle prioridad', '0', '1', '1', '2018-05-30 23:46:23'),
(9, 2, 'Actualizados recientemente', 10, 0, 'mysupport\\tickets\\verticket\\verTickets.html', 'completar(\'En contrucción\')', 'Tickets Actualizados Recientemente', '0', '0', '1', '1', '2018-05-30 23:46:28'),
(10, 2, 'Resueltos', 9, 1, 'mysupport\\tickets\\verticket\\verTickets.html', 'verTickets(\'RESUELTO\', 10)', 'Tickets Resueltos', 'Tus Tickets resueltos', '1', '1', '1', '2018-05-30 23:46:32'),
(11, 2, 'Suspendidos', 11, 1, 'mysupport\\tickets\\verticket\\verTickets.html', 'verTickets(\'SUSPENDIDO\', 11)', 'Tickets Suspendidos', 'Tickets suspendidos, gestiona para restablecer', '1', '1', '1', '2018-05-30 23:46:37'),
(12, 2, 'Eliminados', 12, 1, 'mysupport\\tickets\\verticket\\verTickets.html', 'verTickets(\'ELIMINADO\', 12)', 'Tickets Eliminados', 'Tickets eliminados ingresa al historial para conocer detalles', '1', '1', '1', '2018-05-30 23:46:42'),
(13, 6, 'No debe aparecer', 13, 0, '', 'completar(\'En contrucción\')', '0', '0', '1', '1', '1', '2018-04-06 06:39:47'),
(14, 2, 'Crear Ticket', 5, 1, '', 'nuevoTicket()', NULL, NULL, '1', '1', '1', '2018-05-30 23:48:29'),
(15, 5, 'Administrar', 15, 0, 'main/usuarios/usuarios.html', 'obtenerContenido(15)', 'Usuarios Administradores', 'Usuarios con todos los permisos del sistema.', '1', '1', '1', '2018-06-27 10:34:07'),
(19, 2, 'Gestionar Ticket', 5, 1, 'mysupport\\tickets\\gestionar\\gestionar.html', 'alert(\'Olvidaste colocar el código fuente de este módulo\')', 'Gestionar Ticket', 'Gestiona el ticket acorde a tu punto de vista.', '0', '1', '1', '2018-05-30 23:50:39'),
(20, 7, 'Nuevo!', 1, 1, 'views/app/perfil.html', 'verPerfil()', '', NULL, '1', '1', '1', '2018-04-28 08:34:44'),
(21, 10, 'Bloquear Pantalla', 17, 1, NULL, 'redirigir(\'lockscreen.html\')', NULL, NULL, '1', '1', '1', '2018-04-18 02:12:43'),
(22, 10, 'Cerrar sesión', 18, 1, NULL, 'logout()', NULL, NULL, '1', '1', '1', '2018-04-18 02:12:48'),
(24, 8, 'Ultima semana', 19, 0, 'mysupport\\tickets\\reporte\\reporte.html', 'verTickets(\'ultimaSemana\', 24)', 'Ultima Semana', NULL, '1', '1', '1', '2018-05-30 23:49:59'),
(25, 8, 'Ingresos estimados', 20, 0, 'mysupport\\tickets\\reporte\\reporte.html', 'verTickets(\'ingresosEstimados\', 25)', 'Ingresos estimados', NULL, '1', '1', '1', '2018-05-30 23:50:08'),
(26, 9, 'Carga de trabajo', 21, 0, 'mysupport\\tickets\\reporte\\reporte.html', 'verTickets(\'coladeTrabajo\', 24)', 'Cola de trabajo', NULL, '1', '1', '1', '2018-05-30 23:50:10'),
(27, 11, 'Cetegorías', 3, 0, 'main/categorias/categorias.html', 'obtenerContenido(27)', 'Categorías de servicios', 'Agrega, modifica y consulta tus categorías', '1', '1', '1', '2018-06-07 10:10:42'),
(28, 11, 'Administrar', 4, 0, 'main/servicios/administrar.html', 'obtenerContenido(28)', 'Administrar Servicios', 'Agrega, modifica y modifica tus servicios', '1', '1', '1', '2018-06-18 20:00:50'),
(29, 12, 'Categorías', NULL, 0, 'main/categorias/categorias.html', 'obtenerContenido(29)', 'Categorías de productos', 'Agrega, modifica y consulta las categorías de tus productos', '1', '1', '1', '2018-06-19 09:55:54'),
(30, 12, 'Administrar', NULL, 0, 'main/productos/administrar.html', 'obtenerContenido(30)', 'Administrar Productos', 'Agrega, modifica y consulta tus productos', '1', '1', '1', '2018-06-19 10:32:37'),
(31, 13, 'Categorías ', 6, 0, 'main/categorias/categorias.html', 'obtenerContenido(31)', 'Tipos de Citas', 'Agrega, modifica y consulta tus tipos de citas', '1', '1', '1', '2018-07-23 16:40:49'),
(32, 13, 'Crear cita', 6, 0, 'beauty/citas/nuevacita/citas.html', 'obtenerContenido(32)', 'Nueva Cita', 'Crea una nueva cita', '1', '1', '1', '2018-07-23 22:01:07'),
(33, 13, 'Agenda', 6, 0, 'beauty/citas/agenda/agenda.html', 'obtenerContenido(33)', 'Agenda', 'Consulta o modifica  tus citas / eventos', '1', '1', '1', '2018-07-23 22:01:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_module`
--

CREATE TABLE `cat_module` (
  `id` int(11) NOT NULL,
  `name` varchar(70) NOT NULL,
  `icon` varchar(70) NOT NULL,
  `status` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contiene todos los catalogos que contiene el sistema';

--
-- Volcado de datos para la tabla `cat_module`
--

INSERT INTO `cat_module` (`id`, `name`, `icon`, `status`) VALUES
(1, 'Dashboeard', 'dashboard', '0'),
(2, 'Mis tickets', 'note', '1'),
(4, 'Clientes', 'remove', '0'),
(5, 'Usuarios', 'people', '1'),
(6, 'Software', 'remove', '0'),
(7, 'Cuenta', 'account_circle', '0'),
(8, 'Reportes de Tickets', 'line_style', '0'),
(9, 'Reportes de Actividades', 'view_headline', '0'),
(10, 'Ajustes', 'settings', '0'),
(11, 'Servicios', 'list', '1'),
(12, 'Productos', 'shopping_cart', '1'),
(13, 'Citas', 'perm_contact_calendar', '1');

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
  `id_app` int(11) NOT NULL DEFAULT '0',
  `id_company` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `desc_` varchar(250) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cat_users`
--

INSERT INTO `cat_users` (`id`, `id_app`, `id_company`, `name`, `desc_`, `number`, `status`, `updated_at`) VALUES
(1, 5, 0, 'Administrador', 'Este grupo de  usuarios contiene permisos que controlan y afectan el funcionamiento general del sistema.\r\nAsí mismo controlan a los SUPERVISORES, CLIENTES y GESTORES.\r\nEn Jerarquía el son el número 1', 1, 'ACTIVO', '2018-07-08 21:09:04'),
(2, 5, 0, 'Supervisor', 'Este grupo de usuarios está destinado para controlar,  flujo de datos, procesos y actividad de los clientes con los gestores.\r\nSólo pueden controlar  CLIENTES y GESTORES.\r\nEn Jerarquía son el número 2.', 2, 'ACTIVO', '2018-07-08 21:09:05'),
(3, 5, 0, 'Gestor', 'Este grupo de usuarios tiene permisos para para interactuar entre clientes y otros gestores.\r\nEn Jerarquía son los número 3.', 2, 'ACTIVO', '2018-07-08 21:09:06'),
(4, 5, 0, 'Cliente', 'Este grupo de usuarios sólo tiene permisos para manipular sus propios datos e interactual con sus gestores asignados.\r\nEn Jerarquía son los número 4', 50, 'ACTIVO', '2018-07-08 21:09:09'),
(6, 10, 0, 'Administrador', 'Este grupo de  usuarios contiene permisos que controlan y afectan el funcionamiento general del sistema.\r\nAsí mismo controlan a los SUPERVISORES, CLIENTES y GESTORES.\r\nEn Jerarquía el son el número 1', 1, 'ACTIVO', '2018-07-08 21:09:10'),
(7, 10, 0, 'Supervisor', 'Este grupo de usuarios está destinado para controlar,  flujo de datos, procesos y actividad de los clientes con los gestores.\r\nSólo pueden controlar  CLIENTES y GESTORES.\r\nEn Jerarquía son el número 2.', 2, 'ACTIVO', '2018-07-08 21:09:28'),
(8, 10, 0, 'Gestor', 'Este grupo de usuarios tiene permisos para para interactuar entre clientes y otros gestores.\r\nEn Jerarquía son los número 3.', 2, 'ACTIVO', '2018-07-08 21:09:13'),
(9, 10, 0, 'Cliente', 'Este grupo de usuarios sólo tiene permisos para manipular sus propios datos e interactual con sus gestores asignados.\r\nEn Jerarquía son los número 4', 50, 'ACTIVO', '2018-07-08 21:09:15'),
(11, 1, 0, 'Administrador', 'Este grupo de  usuarios contiene permisos que controlan y afectan el funcionamiento general del sistema.\r\nAsí mismo controlan a los SUPERVISORES, CLIENTES y GESTORES.\r\nEn Jerarquía el son el número 1', 1, 'ACTIVO', '2018-07-08 21:09:17'),
(12, 1, 0, 'Supervisor', 'Este grupo de usuarios está destinado para controlar,  flujo de datos, procesos y actividad de los clientes con los gestores.\r\nSólo pueden controlar  CLIENTES y GESTORES.\r\nEn Jerarquía son el número 2.', 2, 'ACTIVO', '2018-07-08 21:09:18'),
(13, 1, 0, 'Gestor', 'Este grupo de usuarios tiene permisos para para interactuar entre clientes y otros gestores.\r\nEn Jerarquía son los número 3.', 2, 'ACTIVO', '2018-07-08 21:09:19'),
(24, 1, 0, 'Cliente', 'Tiene permiso para ver tus productos y tus servicios', 100, 'ACTIVO', '2018-07-08 21:16:05');

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
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `licenses`
--

INSERT INTO `licenses` (`id`, `company_id`, `app_id`, `key_`, `bd`, `fecha_ini`, `fecha_fin`, `status`) VALUES
(4, 1, 9, '12ee5xcU9ibPmAYuscl4Nrs19kFELFrGQuXMXYjy9GH6M3bhRn2rrSXA7H', 'feengster_master', '2018-05-21 01:51:26', '2019-05-06 03:48:44', 1),
(8, 1, 5, 'adasdee5xcU9ibPmAYuscl4Nrs19kFELFrertXMXYjy9GH6M3bhRn2rrSXA7', 'feengster_master', '2018-06-05 02:22:59', '2019-05-06 03:48:44', 1),
(9, 1, 10, 'adasdee5xcU9ibPmAYuscl4Nrs19kFELFrertXMXYjy9GH6M3bhRn2rrSXrf', 'feengster_master', '2018-07-05 20:09:03', '2019-05-06 03:48:44', 1),
(10, 9, 10, '12ee5xcU9ibPmAYuscl4Nrs19kFELFrGQuXMXYjy9GH6M3bhRn2rrSXA7H', 'feengster_master', '2018-07-05 04:06:10', '2019-05-06 03:48:44', 1),
(11, 9, 9, '12ee5xcU9ibPmAYuscl4Nrs19kFELFrGQuXMXYjy9GH6M3bhRn2rrSXA7H', 'feengster_master', '2018-07-05 03:51:49', '2019-05-06 03:48:44', 1),
(13, 1, 1, '12ee5xcU9ibPmAYuscl4Nrs19kFELFrGQuXMXYjy9GH6M3bhRn2rrSXA7H', 'feengster_master', '2018-07-05 04:06:11', '2018-07-05 03:43:56', 1),
(14, 10, 9, 'adasdee5xcU9ibPmAYuscl4Nrs19kFELFrertXMXYjy9GH6M3bhRn2rrSXrf', 'feengster_master', '2018-07-08 20:56:16', '2019-05-06 03:48:44', 1),
(15, 10, 1, '12ee5xcU9ibPmAYuscl4Nrs19kFELFrGQuXMXYjy9GH6M3bhRn2rrSXA7H', 'feengster_master', '2018-07-08 20:57:59', '2019-05-06 03:48:44', 1),
(17, 2, 9, '12ee5xcU9ibPmAYuscl4Nrs19kFELFrGQuXMXYjy9GH6M3bhRn2rrSXA7H', 'feengster_master', '2018-07-16 18:55:56', '2019-05-06 03:48:44', 1),
(18, 2, 5, '12ee5xcU9ibPmAYuscl4Nrs19kFELFrGQuXMXYjy9GH6M3bhRn2rrSXA7H', 'feengster_master', '2018-07-16 18:56:28', '2019-05-06 03:48:44', 1),
(19, 10, 5, '12ee5xcU9ibPmAYuscl4Nrs19kFELFrGQuXMXYjy9GH6M3bhRn2rrSXA7H', 'feengster_master', '2018-07-30 16:52:20', '2019-05-06 03:48:44', 1),
(20, 10, 10, '12ee5xcU9ibPmAYuscl4Nrs19kFELFrGQuXMXYjy9GH6M3bhRn2rrSXA7H', 'feengster_master', '2018-07-30 16:52:15', '2019-05-06 03:48:44', 1),
(21, 11, 9, '12ee5xcU9ibPmAYuscl4Nrs19kFELFrGQuXMXYjy9GH6M3bhRn2rrSXA7H', 'feengster_master', '2018-08-09 03:03:32', '2019-05-06 03:48:44', 1),
(22, 11, 10, '12ee5xcU9ibPmAYuscl4Nrs19kFELFrGQuXMXYjy9GH6M3bhRn2rrSXA7H', 'feengster_master', '2018-08-09 03:04:05', '2019-05-06 03:48:44', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logins`
--

CREATE TABLE `logins` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL DEFAULT '0',
  `platform` varchar(20) NOT NULL DEFAULT '0',
  `token` varchar(60) NOT NULL DEFAULT '1',
  `status` char(1) NOT NULL DEFAULT '1',
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
(2, 1, 'web', '1', '1', '0', '0', '0', '2018-04-05 11:12:41', '2018-05-06 06:00:43');

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

--
-- Disparadores `tickets`
--
DELIMITER $$
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
END
$$
DELIMITER ;

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
  `app_id` int(11) NOT NULL DEFAULT '0',
  `company_id` int(11) NOT NULL DEFAULT '0',
  `company_controlled_id` int(11) NOT NULL DEFAULT '1',
  `username` varchar(50) NOT NULL DEFAULT '0',
  `email` varchar(60) NOT NULL DEFAULT '0',
  `img` varchar(1000) NOT NULL DEFAULT '0',
  `password` varchar(60) NOT NULL DEFAULT '0',
  `oldpassword` varchar(60) NOT NULL DEFAULT '0',
  `platform` varchar(6) DEFAULT NULL,
  `type_default` int(11) NOT NULL DEFAULT '4',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `app_id`, `company_id`, `company_controlled_id`, `username`, `email`, `img`, `password`, `oldpassword`, `platform`, `type_default`, `updated_at`, `created_at`, `status`) VALUES
(1, 9, 1, 1, 'Eduardo', 'dev@gmail.com', 'https://firebasestorage.googleapis.com/v0/b/feengster-app.appspot.com/o/img_profile%2Flalo.jpg?alt=media&token=9155d312-592d-4e6a-8cec-7a4f3354cfe5', '$2y$10$72PuH8rZutGSj2MG5hx8l.YIXeVBSYPwCMccvryXX/zJXI3iPGjba', '0', NULL, 11, '2018-07-08 21:12:51', '2018-06-27 18:07:26', 'ACTIVO'),
(9, 1, 9, 1, 'bernardo', 'ber@gmail.com', 'https://firebasestorage.googleapis.com/v0/b/feengster-app.appspot.com/o/img_profile%2FWhatsApp%20Image%202018-07-04%20at%2023.47.42.jpeg?alt=media&token=dd3701b1-31fc-4420-9657-f04ecd779796', '$2y$10$72PuH8rZutGSj2MG5hx8l.YIXeVBSYPwCMccvryXX/zJXI3iPGjba', '0', NULL, 11, '2018-07-08 21:10:50', '2018-07-05 03:48:08', 'ACTIVO'),
(10, 1, 1, 1, 'nuevo', 'nuevo@gmail.com', '0', '1234', '0', NULL, 11, '2018-07-08 21:10:52', '2018-07-05 05:05:21', 'ACTIVO'),
(11, 1, 10, 10, 'demo', 'demo@feengster.com', '0', '$2y$10$72PuH8rZutGSj2MG5hx8l.YIXeVBSYPwCMccvryXX/zJXI3iPGjba', '0', NULL, 11, '2018-07-08 21:10:48', '2018-07-08 20:46:34', 'ACTIVO'),
(12, 1, 10, 10, 'supervisor_1', 'supervisor_1@demo.com', '0', '1234', '0', NULL, 12, '2018-07-30 16:47:38', '2018-07-08 21:16:43', 'ELIMINADO'),
(13, 1, 10, 10, 'gestor_1', 'gestor_1@demo.com', '0', '1234', '0', NULL, 13, '2018-07-08 21:17:05', '2018-07-08 21:17:05', 'ACTIVO'),
(14, 1, 10, 10, 'cliente_1', 'cliente_1@demo.com', '0', '1234', '0', NULL, 11, '2018-08-09 03:01:58', '2018-07-08 21:17:30', 'ACTIVO'),
(15, 5, 2, 1, 'Ever', 'ever@gmail.com', '0', '$2y$10$72PuH8rZutGSj2MG5hx8l.YIXeVBSYPwCMccvryXX/zJXI3iPGjba', '0', NULL, 1, '2018-07-20 19:08:52', '2018-07-16 18:52:48', 'ACTIVO'),
(16, 5, 2, 2, 'borrar1', 'borrar1@gmail.com', '0', '123', '0', NULL, 2, '2018-07-16 19:14:17', '2018-07-16 19:14:03', 'ELIMINADO'),
(17, 5, 2, 2, 'borrar2', 'borrar2@gmail.com', '0', '1213', '0', NULL, 2, '2018-07-16 19:20:07', '2018-07-16 19:20:00', 'ELIMINADO'),
(18, 1, 0, 1, '0', '0', '0', '0', '0', NULL, 4, '2018-08-09 02:58:47', '2018-08-09 02:58:47', '1'),
(19, 1, 11, 11, 'lulu', 'luluvegahdez@gmail.com', '0', '$2y$10$72PuH8rZutGSj2MG5hx8l.YIXeVBSYPwCMccvryXX/zJXI3iPGjba', '0', NULL, 11, '2018-08-09 03:02:36', '2018-08-09 03:00:41', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_cat_user`
--

CREATE TABLE `user_cat_user` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL DEFAULT '0',
  `id_cat_user` int(11) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Se almacenan los roles que tiene el usuario. Un usario puede ser Administrador, supervisor y gesto a la vez o solo cliente.';

--
-- Volcado de datos para la tabla `user_cat_user`
--

INSERT INTO `user_cat_user` (`id`, `id_user`, `id_cat_user`, `status`, `created_at`, `updated_at`) VALUES
(0, 0, 4, '1', '2018-05-06 05:15:28', '2018-05-06 05:15:28'),
(1, 1, 1, '1', '2018-02-23 04:24:09', '2018-02-23 04:24:09'),
(2, 2, 4, '1', '2018-02-25 12:27:33', '2018-02-25 12:27:33'),
(3, 3, 4, '1', '2018-02-25 12:30:21', '2018-02-25 12:30:21'),
(4, 4, 4, '1', '2018-02-25 12:30:52', '2018-02-25 12:30:52'),
(5, 5, 4, '1', '2018-02-25 12:31:18', '2018-02-25 12:31:18'),
(6, 1, 4, '1', '2018-02-27 08:08:07', '2018-02-27 08:08:07'),
(7, 7, 3, '1', '2018-04-17 13:40:34', '2018-04-17 13:40:34'),
(8, 8, 1, '1', '2018-04-17 13:44:51', '2018-04-17 13:44:51'),
(9, 9, 1, '1', '2018-04-17 13:56:49', '2018-04-17 13:56:49'),
(10, 13, 1, '1', '2018-04-17 13:59:45', '2018-04-17 13:59:45'),
(11, 14, 1, '1', '2018-04-17 14:00:09', '2018-04-17 14:00:09'),
(12, 15, 1, '1', '2018-04-17 14:00:34', '2018-04-17 14:00:34'),
(13, 17, 1, '1', '2018-04-17 14:32:36', '2018-04-17 14:32:36'),
(14, 18, 2, '1', '2018-04-17 14:38:13', '2018-04-17 14:38:13'),
(15, 19, 3, '1', '2018-04-17 14:39:31', '2018-04-17 14:39:31'),
(16, 20, 2, '1', '2018-04-17 14:44:10', '2018-04-17 14:44:10'),
(17, 21, 2, '1', '2018-04-17 14:45:20', '2018-04-17 14:45:20'),
(18, 24, 3, '1', '2018-04-17 16:24:38', '2018-04-17 16:24:38'),
(19, 25, 1, '1', '2018-04-17 16:42:04', '2018-04-17 16:42:04'),
(20, 27, 3, '1', '2018-04-17 16:43:36', '2018-04-17 16:43:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_companies`
--

CREATE TABLE `user_companies` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL DEFAULT '0',
  `id_company` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Un usuario pertenece a una sola empresa | una empresa puede tener varios usuarios';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_images`
--

CREATE TABLE `user_images` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL DEFAULT '0',
  `id_img` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='se almacenan todas la imagenes que tienen los usuarios para ello se debe contar con id_img valido';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
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
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user_profile`
--

INSERT INTO `user_profile` (`id`, `id_user`, `name`, `surnames`, `role`, `slogan`, `birthdate`, `id_address`, `id_img_profile`, `status`, `created_at`, `updated_at`) VALUES
(4, 1, 'Web developer', '', 'Desarrollo', 'Si lohaces en la vida real, se puede programar', '1996-09-01 23:59:59', 0, NULL, 0, '2018-03-06 13:41:48', '2018-05-06 00:25:58'),
(5, 3, 'Ever', '', 'Administrador', '0', NULL, 0, NULL, 0, '2018-05-06 05:58:28', '2018-05-06 05:59:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_ratings`
--

CREATE TABLE `user_ratings` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_user_writer` int(11) NOT NULL,
  `stars` int(11) NOT NULL,
  `commentary` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='calificaciónes de los usuarios departe de otro usuarios de 1-5 estrellas.\r\n';

--
-- Volcado de datos para la tabla `user_ratings`
--

INSERT INTO `user_ratings` (`id`, `id_user`, `id_user_writer`, `stars`, `commentary`, `created_at`) VALUES
(1, 1, 2, 4, 'Good job', '2018-03-06 12:26:04'),
(3, 1, 5, 5, 'Sin comentarios', '2018-03-06 12:26:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_teams`
--

CREATE TABLE `user_teams` (
  `id_team` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user_teams`
--

INSERT INTO `user_teams` (`id_team`, `id_user`) VALUES
(1, 1),
(1, 5),
(1, 3),
(2, 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `app_menus`
--
ALTER TABLE `app_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_app` (`id_app`);

--
-- Indices de la tabla `cat_apps`
--
ALTER TABLE `cat_apps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nombre` (`name`),
  ADD KEY `platform` (`platform`);

--
-- Indices de la tabla `cat_company`
--
ALTER TABLE `cat_company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

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
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `id_cliente` (`company_id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user_cat_user`
--
ALTER TABLE `user_cat_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_user_cat_user_users` (`id_user`),
  ADD KEY `FK_user_cat_user_cat_users` (`id_cat_user`);

--
-- Indices de la tabla `user_companies`
--
ALTER TABLE `user_companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_user` (`id_user`),
  ADD KEY `FK_user_companies_company` (`id_company`);

--
-- Indices de la tabla `user_images`
--
ALTER TABLE `user_images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_img` (`id_img`),
  ADD KEY `FK__users` (`id_user`);

--
-- Indices de la tabla `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_user_notifications_users` (`id_user`);

--
-- Indices de la tabla `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_user_profile_images` (`id_img_profile`),
  ADD KEY `FK_user_profile_users` (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `app_menus`
--
ALTER TABLE `app_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `cat_apps`
--
ALTER TABLE `cat_apps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `cat_company`
--
ALTER TABLE `cat_company`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `cat_menus`
--
ALTER TABLE `cat_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `cat_module`
--
ALTER TABLE `cat_module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `cat_users`
--
ALTER TABLE `cat_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `licenses`
--
ALTER TABLE `licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
-- AUTO_INCREMENT de la tabla `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `licenses`
--
ALTER TABLE `licenses`
  ADD CONSTRAINT `FK_licencias_cat_producto` FOREIGN KEY (`app_id`) REFERENCES `cat_apps` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
