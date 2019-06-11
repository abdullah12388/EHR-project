-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 01, 2019 at 08:06 PM
-- Server version: 8.0.13-4
-- PHP Version: 7.2.17-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `1Pa0YLLAaQ`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add patient', 7, 'add_patient'),
(20, 'Can change patient', 7, 'change_patient'),
(21, 'Can delete patient', 7, 'delete_patient'),
(22, 'Can add temp_register', 8, 'add_temp_register'),
(23, 'Can change temp_register', 8, 'change_temp_register'),
(24, 'Can delete temp_register', 8, 'delete_temp_register'),
(25, 'Can add user', 9, 'add_user'),
(26, 'Can change user', 9, 'change_user'),
(27, 'Can delete user', 9, 'delete_user'),
(28, 'Can add all_analytics', 10, 'add_all_analytics'),
(29, 'Can change all_analytics', 10, 'change_all_analytics'),
(30, 'Can delete all_analytics', 10, 'delete_all_analytics'),
(31, 'Can add all_chronic', 11, 'add_all_chronic'),
(32, 'Can change all_chronic', 11, 'change_all_chronic'),
(33, 'Can delete all_chronic', 11, 'delete_all_chronic'),
(34, 'Can add all_medicine', 12, 'add_all_medicine'),
(35, 'Can change all_medicine', 12, 'change_all_medicine'),
(36, 'Can delete all_medicine', 12, 'delete_all_medicine'),
(37, 'Can add all_rays', 13, 'add_all_rays'),
(38, 'Can change all_rays', 13, 'change_all_rays'),
(39, 'Can delete all_rays', 13, 'delete_all_rays'),
(40, 'Can add doctor', 14, 'add_doctor'),
(41, 'Can change doctor', 14, 'change_doctor'),
(42, 'Can delete doctor', 14, 'delete_doctor'),
(43, 'Can add multi_analytics', 15, 'add_multi_analytics'),
(44, 'Can change multi_analytics', 15, 'change_multi_analytics'),
(45, 'Can delete multi_analytics', 15, 'delete_multi_analytics'),
(46, 'Can add multi_chronic', 16, 'add_multi_chronic'),
(47, 'Can change multi_chronic', 16, 'change_multi_chronic'),
(48, 'Can delete multi_chronic', 16, 'delete_multi_chronic'),
(49, 'Can add multi_medecines', 17, 'add_multi_medecines'),
(50, 'Can change multi_medecines', 17, 'change_multi_medecines'),
(51, 'Can delete multi_medecines', 17, 'delete_multi_medecines'),
(52, 'Can add multi_rays', 18, 'add_multi_rays'),
(53, 'Can change multi_rays', 18, 'change_multi_rays'),
(54, 'Can delete multi_rays', 18, 'delete_multi_rays'),
(55, 'Can add patient_analytics', 19, 'add_patient_analytics'),
(56, 'Can change patient_analytics', 19, 'change_patient_analytics'),
(57, 'Can delete patient_analytics', 19, 'delete_patient_analytics'),
(58, 'Can add patient_chronic', 20, 'add_patient_chronic'),
(59, 'Can change patient_chronic', 20, 'change_patient_chronic'),
(60, 'Can delete patient_chronic', 20, 'delete_patient_chronic'),
(61, 'Can add patient_medicine', 21, 'add_patient_medicine'),
(62, 'Can change patient_medicine', 21, 'change_patient_medicine'),
(63, 'Can delete patient_medicine', 21, 'delete_patient_medicine'),
(64, 'Can add patient_rays', 22, 'add_patient_rays'),
(65, 'Can change patient_rays', 22, 'change_patient_rays'),
(66, 'Can delete patient_rays', 22, 'delete_patient_rays'),
(67, 'Can add prescription', 23, 'add_prescription'),
(68, 'Can change prescription', 23, 'change_prescription'),
(69, 'Can delete prescription', 23, 'delete_prescription'),
(70, 'Can add report', 24, 'add_report'),
(71, 'Can change report', 24, 'change_report'),
(72, 'Can delete report', 24, 'delete_report'),
(73, 'Can add hospital', 25, 'add_hospital'),
(74, 'Can change hospital', 25, 'change_hospital'),
(75, 'Can delete hospital', 25, 'delete_hospital'),
(76, 'Can add organization', 26, 'add_organization'),
(77, 'Can change organization', 26, 'change_organization'),
(78, 'Can delete organization', 26, 'delete_organization');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'argon2$argon2i$v=19$m=512,t=2,p=2$U01QWlpWTHJIWjJC$/K+dHhn8T2qSQoX1OVjJQA', '2019-04-08 05:56:56.259205', 1, 'mohamedashraf', '', '', 'm7md.mai1997@gmail.com', 1, 1, '2019-04-08 05:56:22.917350'),
(2, 'argon2$argon2i$v=19$m=512,t=2,p=2$VVhWMUZYSEJEQkRN$H9wHc22oxrxE4/lAghaNNw', '2019-04-09 12:06:06.224555', 1, 'omar', '', '', 'oma55r@gmail.com', 1, 1, '2019-04-08 09:19:01.072533'),
(3, 'argon2$argon2i$v=19$m=512,t=2,p=2$QnhGMU9BcHVodFdT$KN0oIpVR7FEBSzwTuxnz+Q', '2019-05-17 04:55:08.649931', 1, 'abdullah', '', '', 'a@a.com', 1, 1, '2019-05-17 04:54:29.919217');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2019-04-08 09:24:08.758027', '4', 'Ahmed', 1, '[{\"added\": {}}]', 9, 2),
(2, '2019-04-08 09:36:23.099573', '1', 'abdelfatah', 2, '[{\"changed\": {\"fields\": [\"Ssn_id\"]}}]', 9, 1),
(3, '2019-04-08 09:41:16.975293', '1', 'doctor object', 1, '[{\"added\": {}}]', 14, 2),
(4, '2019-04-08 10:20:44.941926', '4', 'Ahmed', 1, '[{\"added\": {}}]', 7, 1),
(5, '2019-04-08 10:23:03.564998', '4', 'Ahmed', 2, '[{\"changed\": {\"fields\": [\"Ssn_id\"]}}]', 9, 1),
(6, '2019-04-08 11:45:23.555921', '1', 'mohamedashrafibraheem@gmail.com', 1, '[{\"added\": {}}]', 26, 1),
(7, '2019-04-08 11:46:33.826203', '1', 'all_medicine object (1)', 1, '[{\"added\": {}}]', 12, 1),
(8, '2019-04-08 11:47:25.054816', '2', 'all_medicine object (2)', 1, '[{\"added\": {}}]', 12, 1),
(9, '2019-04-08 11:51:24.726800', '1', 'to7otmos', 1, '[{\"added\": {}}]', 23, 1),
(10, '2019-04-08 11:55:25.144458', '2', 'patient_medicine object (2)', 1, '[{\"added\": {}}]', 21, 1),
(11, '2019-04-09 12:15:53.648656', '1', 'report object', 1, '[{\"added\": {}}]', 24, 2),
(12, '2019-04-09 14:01:24.234646', '2', '7a7a', 1, '[{\"added\": {}}]', 23, 2),
(13, '2019-04-09 14:01:59.211194', '2', 'report object', 1, '[{\"added\": {}}]', 24, 2),
(14, '2019-04-11 06:12:51.835499', '6', 'patient_medicine object', 1, '[{\"added\": {}}]', 21, 2),
(15, '2019-04-11 06:21:01.397070', '1', 'multi_medecines object', 1, '[{\"added\": {}}]', 17, 2);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(10, 'doctor', 'all_analytics'),
(11, 'doctor', 'all_chronic'),
(12, 'doctor', 'all_medicine'),
(13, 'doctor', 'all_rays'),
(14, 'doctor', 'doctor'),
(15, 'doctor', 'multi_analytics'),
(16, 'doctor', 'multi_chronic'),
(17, 'doctor', 'multi_medecines'),
(18, 'doctor', 'multi_rays'),
(19, 'doctor', 'patient_analytics'),
(20, 'doctor', 'patient_chronic'),
(21, 'doctor', 'patient_medicine'),
(22, 'doctor', 'patient_rays'),
(23, 'doctor', 'prescription'),
(24, 'doctor', 'report'),
(25, 'hospital', 'hospital'),
(26, 'hospital', 'organization'),
(7, 'patient', 'patient'),
(8, 'patient', 'temp_register'),
(9, 'patient', 'user'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-04-05 20:09:39.544987'),
(2, 'auth', '0001_initial', '2019-04-05 20:09:47.226474'),
(3, 'admin', '0001_initial', '2019-04-05 20:09:49.660986'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-04-05 20:09:50.141878'),
(5, 'contenttypes', '0002_remove_content_type_name', '2019-04-05 20:09:51.427464'),
(6, 'auth', '0002_alter_permission_name_max_length', '2019-04-05 20:09:52.214636'),
(7, 'auth', '0003_alter_user_email_max_length', '2019-04-05 20:09:53.002408'),
(8, 'auth', '0004_alter_user_username_opts', '2019-04-05 20:09:53.472584'),
(9, 'auth', '0005_alter_user_last_login_null', '2019-04-05 20:09:54.234063'),
(10, 'auth', '0006_require_contenttypes_0002', '2019-04-05 20:09:54.715040'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2019-04-05 20:09:55.228111'),
(12, 'auth', '0008_alter_user_username_max_length', '2019-04-05 20:09:56.018173'),
(13, 'auth', '0009_alter_user_last_name_max_length', '2019-04-05 20:09:56.819143'),
(14, 'patient', '0001_initial', '2019-04-05 20:10:03.295447'),
(15, 'hospital', '0001_initial', '2019-04-05 20:10:11.110305'),
(16, 'doctor', '0001_initial', '2019-04-05 20:10:33.610452'),
(17, 'sessions', '0001_initial', '2019-04-05 20:10:34.923978'),
(18, 'doctor', '0002_auto_20190408_2211', '2019-04-08 20:12:30.414656'),
(19, 'doctor', '0003_auto_20190410_0134', '2019-04-09 23:34:21.986242'),
(20, 'doctor', '0004_auto_20190410_0140', '2019-04-09 23:41:06.237666'),
(21, 'doctor', '0005_auto_20190410_0153', '2019-04-09 23:53:22.372996'),
(22, 'doctor', '0006_auto_20190410_0204', '2019-04-10 00:05:01.075158'),
(23, 'patient', '0002_auto_20190411_1136', '2019-04-11 09:36:23.147696'),
(24, 'patient', '0003_auto_20190411_1636', '2019-04-11 14:37:03.173869'),
(25, 'doctor', '0007_auto_20190412_0534', '2019-04-12 03:34:33.856849'),
(26, 'doctor', '0008_auto_20190521_1537', '2019-05-21 13:37:32.165979'),
(27, 'doctor', '0009_auto_20190522_0458', '2019-05-22 02:59:06.289407'),
(28, 'hospital', '0002_auto_20190522_0952', '2019-05-22 07:52:46.275002'),
(29, 'doctor', '0002_auto_20190526_1513', '2019-05-26 13:13:46.164948');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0k1y5m7d4vmtxy59er7c85fekuu3u60i', 'MTNlZWNkN2NjNjQ4YTllYWE3MzgzMzMxN2Y0ZmQwNmFkNTYxMGRmNDp7InVzZXJfdHlwZSI6InJlZ2lzdGVyZWRfcGF0aWVudCIsInVzZXJfVCI6MSwidXNlcl9pZCI6MzgsIkRvY3Rvcl9QYXRpYW50X0lEIjozOCwidHlwZSI6Imhvc3BpdGFsIiwiaG9zcGl0YWxfaWQiOjF9', '2019-06-10 05:17:56.308440'),
('0kxqsm0vr4kqh8lfaewxgr0hx54x4krk', 'OWEzYTZmNWMyYmY3ZDY2MWFhZDc0ODQ4NjcxZTk5MzZjMTQ0ODVjMzp7InR5cGUiOiJob3NwaXRhbCJ9', '2019-06-10 15:25:32.540616'),
('28w3ahhlt2jkr047l3hbrea80f5kfwlu', 'N2VjMDg5YjdkYTFmNTRiMTQ3MjI2MzZiY2VjNTEwY2U1OTBkOWY2MTp7InVzZXJfdHlwZSI6InJlZ2lzdGVyZWRfcGF0aWVudCIsInVzZXJfVCI6MSwicGF0aWVudF9pZCI6NX0=', '2019-04-26 16:48:20.352244'),
('2vou7gc0hoonrl7xmwck50z41qh7lxtp', 'OWEzYTZmNWMyYmY3ZDY2MWFhZDc0ODQ4NjcxZTk5MzZjMTQ0ODVjMzp7InR5cGUiOiJob3NwaXRhbCJ9', '2019-06-09 13:24:56.827916'),
('3vbd3iiwiybahy4ex7lpt89tzrsq7vsr', 'MjdhZTgyYjUzNzdlOTc0ZWZkN2Y1YzEwNDVmZmRhYTE1NDkzOTkxODp7InBhdGllbnRfaWQiOjMxLCJ1c2VyX3R5cGUiOiJyZWdpc3RlcmVkX3BhdGllbnQiLCJ1c2VyX1QiOjF9', '2019-06-07 10:12:36.226192'),
('3z5w25to0s7sbd3gpbidmkey7o5n7lpx', 'ZjQyM2Y5MDg1NjUwN2ZkODJhMDE0YjE3M2UxZmU4ZDAwNzcxMWFjODp7InR5cGUiOiJwaGFybWFjeSIsInBoYXJtYWN5X2lkIjoxfQ==', '2019-06-10 15:33:21.426917'),
('40kn7aq2pjh1lukgg668forchf4crrcw', 'OWEzYTZmNWMyYmY3ZDY2MWFhZDc0ODQ4NjcxZTk5MzZjMTQ0ODVjMzp7InR5cGUiOiJob3NwaXRhbCJ9', '2019-06-06 10:10:18.579512'),
('4hdpdvplmh2xno5hsbsycvvm15iflako', 'OTU1NGI1NDgyYzE3NGRhOWU5MzNjODM2NmU5NzE3YTUwY2I4ZGQyNTp7InR5cGUiOiJob3NwaXRhbCIsImxhYl9pZCI6MiwicGF0aWVudF9pZCI6MzEsInVzZXJfdHlwZSI6InJlZ2lzdGVyZWRfcGF0aWVudCIsInVzZXJfVCI6MiwiRG9jdG9yX1BhdGlhbnRfSUQiOjAsImhvc3BpdGFsX2lkIjoxLCJwaGFybWFjeV9pZCI6MSwidXNlcl9pZCI6Mzh9', '2019-06-08 05:38:10.378170'),
('4w092gwfy92cm7r2njha89rmfh780ltn', 'MzZmMTQyZjAyNTBhZTk4MzVlOWUzZDY5ZWJiM2RmZDVlOGQzZDExZDp7InR5cGUiOiJsYWIiLCJwYXRpZW5faWQiOjQwLCJsYWJfaWQiOjJ9', '2019-06-10 15:49:20.198471'),
('58uhmzkgjj7jz2idy0lucwk92tn6qb8p', 'ZjhhYTcxNjE0NWNlYTMxYzU1NDlmMTA3N2NjZmYyZWU3MTNkMjNkZjp7InR5cGUiOiJwaGFybWFjeSIsInVzZXJfVCI6MiwiRG9jdG9yX1BhdGlhbnRfSUQiOjMzfQ==', '2019-06-11 05:42:19.773166'),
('61lygw580w9660b9mm8h1k5yene39qyf', 'OWEzYTZmNWMyYmY3ZDY2MWFhZDc0ODQ4NjcxZTk5MzZjMTQ0ODVjMzp7InR5cGUiOiJob3NwaXRhbCJ9', '2019-06-09 13:03:50.962432'),
('6bgjmo0wcc6vw62ql8fy0q7for2gf2lt', 'ZDZjNjFlYmRmNDA3MmUxZTA1MjU1ZjI5ZDBlN2JjODdhMTE5NWRjMzp7InR5cGUiOiJob3NwaXRhbCIsImhvc3BpdGFsX2lkIjoxfQ==', '2019-06-08 09:18:32.448583'),
('6k10eseqsgnhpds3sgtamqtdn1tlexcv', 'NzM0ZDZlMDk2MWRlMGFhYzY4ZjA2ZmNhMmE3Njc5NzAxNmQ0NmIyMzp7InVzZXJfVCI6MSwiRG9jdG9yX1BhdGlhbnRfSUQiOjAsInVzZXJfdHlwZSI6InJlZ2lzdGVyZWRfcGF0aWVudCIsInVzZXJfaWQiOjM4LCJ0eXBlIjoiaG9zcGl0YWwifQ==', '2019-06-11 08:52:35.025119'),
('6yllb5625hlt01celohctndsallpc89j', 'MTQ3Y2RlMzNiOGYxNDhiMWYyYzI5YThjNThhYjU5ZDUwNGQzNzAzZDp7InR5cGUiOiJwaGFybWFjeSIsInBoYXJtYWN5X2lkIjoxLCJwYXRpZW5faWQiOjQwfQ==', '2019-06-11 06:45:19.693701'),
('73a3atwz47k435bphp1g7izkf82yjzdl', 'NWI5MzY1ZjUxMGFiNDFmYzk2MzA4MDJlNzFmMDcwMzFiMWEzMjY1ZDp7InR5cGUiOiJob3NwaXRhbCIsInVzZXJfdHlwZSI6InJlZ2lzdGVyZWRfcGF0aWVudCIsInVzZXJfVCI6MX0=', '2019-06-10 05:54:46.038823'),
('74w0qix5ss0rinze5pnyw8rqvewq5vqm', 'NjJiMzA0ZDhlNzliMTI2ZmQzZTdiODA1Njk2OWNjYTBlZmU5NzU0Mjp7ImRvY3Rvcl9pZCI6MywidXNlcl9UIjoyLCJEb2N0b3JfUGF0aWFudF9JRCI6Mzh9', '2019-06-10 09:00:08.277373'),
('767upzsr32uqsns9csp699ncjn8ioi4y', 'NzQ1YzNlN2IwOGI4OTViZWNiNzMxMWQzMjFkZGUzOWM3OGRlOWI3Zjp7InR5cGUiOiJob3NwaXRhbCIsInVzZXJfVCI6MiwiRG9jdG9yX1BhdGlhbnRfSUQiOjMzLCJob3NwaXRhbF9pZCI6MX0=', '2019-06-11 09:33:03.571667'),
('7y99g8qf2fsjitbl7chggv8lz7i1wjr9', 'MWY3MDlmZWM3OWIzZGEwNDczYWNiY2ZkNThjNTMzMzRmYTA5MDdmNzp7InVzZXJfVCI6MiwiRG9jdG9yX1BhdGlhbnRfSUQiOjAsInR5cGUiOiJob3NwaXRhbCIsImhvc3BpdGFsX2lkIjoxfQ==', '2019-06-11 09:34:03.631746'),
('84zetrl01yed6ye7cmaxhcswo1me359z', 'YTI1Y2MxZjdhOGVhNWEyZjU2NzAzYTNmNDM0ODQzNzk2Y2IwZmM0Yzp7InR5cGUiOiJsYWIiLCJkb2N0b3JfaWQiOjMsInVzZXJfVCI6MiwiRG9jdG9yX1BhdGlhbnRfSUQiOjB9', '2019-06-06 10:30:55.537136'),
('8b5s51mkoexy5ux0i8yl28s614yamjy9', 'MDZhNzZmMDM5OGEwNGMyMzgxNWFhMDg1NmQ3ZDU0ZDQ2Zjc0ZGMzYjp7InBhdGllbnRfdGVtcF9pZCI6NSwidXNlcl90eXBlIjoidGVtcCJ9', '2019-04-24 20:46:35.110333'),
('8g7qrp1qrd1mystz6u72p1yo135zovzf', 'MDU2NmQzYTAxZWM5NTNkYjEzM2I0MjJmMTNhY2ZiY2VmOGUyYmE2Njp7Im9yZ19pZCI6MSwicGF0aWVudF9pZCI6NH0=', '2019-04-24 15:48:55.868111'),
('8nosqie36p439wry5sadzi2kmbqw32kf', 'NWRmZDcyYWY5MjJhYjc2OTY1OTc5YzJjOTYwNzM0YWZkZjU4OTJmODp7InR5cGUiOiJsYWIiLCJzc25JRCI6IjAxMDE2OTciLCJzc25pZCI6IjAxMDE2OTciLCJwYXRpZV9pZCI6NDAsInVzZXJfdHlwZSI6InJlZ2lzdGVyZWRfcGF0aWVudCIsInVzZXJfVCI6MiwiZG9jdG9yX2lkIjozLCJEb2N0b3JfUGF0aWFudF9JRCI6MH0=', '2019-06-11 07:26:59.948309'),
('8rv9cqo1oivrp02kpylflrbgwupzwl3s', 'NzdhYjhjZTQ2OTJlM2EzODU1MTM4OTdiNGRhMzM0ZDgxZWM2ODM1MTp7InVzZXJfdHlwZSI6InJlZ2lzdGVyZWRfcGF0aWVudCIsInVzZXJfVCI6MiwidXNlcl9pZCI6MzgsImRvY3Rvcl9pZCI6MywiRG9jdG9yX1BhdGlhbnRfSUQiOjMxfQ==', '2019-06-10 17:21:36.325847'),
('91boig60euyn0pmw1ufnu0i6t71t4xn8', 'MDZjZmVhMDllNDU4NDhlNDRjMTk4NjgwYjM5N2IwMjdmMDg5YWVkMjp7InR5cGUiOiJsYWIiLCJsYWJfaWQiOjIsInBhdGllbnRfaWQiOjQwfQ==', '2019-06-07 08:31:57.182202'),
('9ds1jui4m8zkctekjlfztm6j1u783rtg', 'ZjVjNTk3ODk2NDU5MjI4MzMyYTQ3ZTIyZmMyMTI3Yjk5MzhjNTQ1Nzp7InR5cGUiOiJwaGFybWFjeSIsInNzbklEIjoiMDEwMTY5NyIsInBoYXJtYWN5X2lkIjoxfQ==', '2019-06-11 06:44:50.258044'),
('9xltigv7a401vl806upiyehejawjvb1z', 'YTYyMTlmMDEwOWI1NjJkODlhMmViMDQ0NzM5NzgxNjBmM2E0NDMxODp7InR5cGUiOiJwaGFybWFjeSIsInBoYXJtYWN5X2lkIjoxLCJzc25JRCI6IjAxMDE2OTcifQ==', '2019-06-11 06:37:34.736841'),
('b5q1vecs4xwgleodue3855q44f74jvuc', 'YTVmZTk2YjU2YTZjOGNmMWYzYTk5Y2MyYjMxN2I2ODVkMTQ4M2FkNTp7InVzZXJfdHlwZSI6InJlZ2lzdGVyZWRfcGF0aWVudCIsInVzZXJfVCI6MSwidXNlcl9pZCI6MzgsInR5cGUiOiJob3NwaXRhbCJ9', '2019-06-06 10:11:52.132145'),
('b73a18chdupiqvmh0ofvnwvj774alw6b', 'ZjQyM2Y5MDg1NjUwN2ZkODJhMDE0YjE3M2UxZmU4ZDAwNzcxMWFjODp7InR5cGUiOiJwaGFybWFjeSIsInBoYXJtYWN5X2lkIjoxfQ==', '2019-06-07 09:10:44.834490'),
('beza973aoiqn6ugx34yu0z6pval9ou5f', 'ZDZjNjFlYmRmNDA3MmUxZTA1MjU1ZjI5ZDBlN2JjODdhMTE5NWRjMzp7InR5cGUiOiJob3NwaXRhbCIsImhvc3BpdGFsX2lkIjoxfQ==', '2019-06-10 05:20:47.333462'),
('buar7hywny47popi2kgjno5wyca2qq1j', 'ZDZjNjFlYmRmNDA3MmUxZTA1MjU1ZjI5ZDBlN2JjODdhMTE5NWRjMzp7InR5cGUiOiJob3NwaXRhbCIsImhvc3BpdGFsX2lkIjoxfQ==', '2019-06-10 15:25:51.612148'),
('c80w2r4iawpsgdkotvqhbs3l3kcmivlf', 'OWRjNDg2ODY3ZmEyNDdiZTljNzlhZDY0YjM1YTQ0ZjNiOWMzZjRiZTp7ImRvY3Rvcl9pZCI6MywidXNlcl9UIjoyLCJEb2N0b3JfUGF0aWFudF9JRCI6MH0=', '2019-06-11 07:51:04.735580'),
('dvx1onz1yih3bxr4m08yaov2r4pqhnfz', 'MDU0NGU0MzBmZDllNDAxZDYxNDAwY2JhODY5Mjg4ODQ3NzQ0MzY1Mzp7InVzZXJfVCI6MiwiRG9jdG9yX1BhdGlhbnRfSUQiOjMxLCJwYXRpZW50X3RlbXBfaWQiOjEwLCJ1c2VyX3R5cGUiOiJ0ZW1wIiwidXNlcl9pZCI6NDcsInR5cGUiOiJob3NwaXRhbCIsImhvc3BpdGFsX2lkIjoxfQ==', '2019-06-10 10:41:59.238264'),
('edhjurers5s2eeccpkpuhr6bzv32r3wb', 'OWY4ZWU3NTVjNTJlNmRmZTEzZTdlNjVlNzlmNjMwYmE5ZWMyMWFjYjp7InVzZXJfdHlwZSI6InJlZ2lzdGVyZWRfcGF0aWVudCIsInVzZXJfVCI6MiwidXNlcl9pZCI6MzgsIkRvY3Rvcl9QYXRpYW50X0lEIjowLCJ0eXBlIjoiaG9zcGl0YWwiLCJob3NwaXRhbF9pZCI6MX0=', '2019-06-11 09:35:23.022792'),
('eg3ah1og5be208q9sb2ywk3eafafc4st', 'YWY5YjQ5YTYzNWI1MWFlZjA5NjgzNmZlMGJlN2Y5YjA3ZTVmNWVjMDp7InVzZXJfVCI6MiwiRG9jdG9yX1BhdGlhbnRfSUQiOjAsInR5cGUiOiJsYWIiLCJob3NwaXRhbF9pZCI6MSwibGFiX2lkIjoyLCJwYXRpZW50X2lkIjo0MH0=', '2019-06-07 08:29:50.524466'),
('epb0bcnx1apklo4sdwbz0p6m8eel0jpx', 'MjEwNDE3YjIzM2VjMWNlMTVmYmQzNjBlNTMzMWZkMDNhOWViODQ0ZTp7InVzZXJfdHlwZSI6InJlZ2lzdGVyZWRfcGF0aWVudCIsInVzZXJfVCI6MSwicGF0aWVudF9pZCI6NCwib3JnX2lkIjoxfQ==', '2019-04-27 22:26:24.759535'),
('eug83b94bs1spo9sj0y2cvan5j4w212m', 'ZDU4YmViODNmMjhlYzgzNjMzOTc2NDM0YzNlMWI4ODE0ZDBjYWMyMTp7InR5cGUiOiJwaGFybWFjeSIsInBhdF9pZCI6NDAsImxhYl9pZCI6Mn0=', '2019-06-07 08:56:11.061635'),
('f9jycrrdtd22em1hefbht41015vqj9vm', 'YjlhN2I2YjBmZWZmOGYzZmJhMWZlNjYwMGQ3ZjBiZGExMTNlMTBiZDp7InR5cGUiOiJwaGFybWFjeSIsInNzbklEIjoiODkxMjM0NSJ9', '2019-06-11 06:52:09.171084'),
('ffbrkjcojoideclreaxrydium9ollz4e', 'M2FhMmQ2ZGY4MTMyNmIwM2ViNWI2YTBkNmUwYmIyZmEzNjdhZWEyNDp7InVzZXJfVCI6MiwiRG9jdG9yX1BhdGlhbnRfSUQiOjM4LCJ0eXBlIjoiaG9zcGl0YWwiLCJob3NwaXRhbF9pZCI6MX0=', '2019-06-10 08:33:46.002288'),
('fjlvn2eadb1rwjecynqva8j9axoxman4', 'MDZjZmVhMDllNDU4NDhlNDRjMTk4NjgwYjM5N2IwMjdmMDg5YWVkMjp7InR5cGUiOiJsYWIiLCJsYWJfaWQiOjIsInBhdGllbnRfaWQiOjQwfQ==', '2019-06-07 08:42:40.018497'),
('fjtz1r3x5sbg3xoh8hchiv8j17h7lj5h', 'M2I3ZTM5MmYwMGRkMTlhNDI4NDk1NWQzYjVhM2IzZWU1ZWE3Y2U1NTp7InVzZXJfdHlwZSI6InJlZ2lzdGVyZWRfcGF0aWVudCIsInVzZXJfVCI6MX0=', '2019-06-07 10:15:46.476183'),
('g0qqym48kuar4xlg54ybhwo04kkgdmo6', 'MWY3MDlmZWM3OWIzZGEwNDczYWNiY2ZkNThjNTMzMzRmYTA5MDdmNzp7InVzZXJfVCI6MiwiRG9jdG9yX1BhdGlhbnRfSUQiOjAsInR5cGUiOiJob3NwaXRhbCIsImhvc3BpdGFsX2lkIjoxfQ==', '2019-06-11 09:46:09.682915'),
('g2seai63ira3qk7r0hwp8c6iefk20ix5', 'MDU2NmQzYTAxZWM5NTNkYjEzM2I0MjJmMTNhY2ZiY2VmOGUyYmE2Njp7Im9yZ19pZCI6MSwicGF0aWVudF9pZCI6NH0=', '2019-04-24 01:23:21.459569'),
('gxb86hntdm7r1vg5313uu65pfczzo8eo', 'ZmJjMTVhZGExMDk4NTQ4MDJmNWMyMTUxYjgwMTFiOWY3YTg3MmY3Mzp7InR5cGUiOiJob3NwaXRhbCIsInVzZXJfVCI6MiwiRG9jdG9yX1BhdGlhbnRfSUQiOjB9', '2019-06-08 11:31:48.720671'),
('gyleb9z0wo620mr7fvcgsugmxc8gmlcf', 'OWRjNDg2ODY3ZmEyNDdiZTljNzlhZDY0YjM1YTQ0ZjNiOWMzZjRiZTp7ImRvY3Rvcl9pZCI6MywidXNlcl9UIjoyLCJEb2N0b3JfUGF0aWFudF9JRCI6MH0=', '2019-06-11 08:00:12.075760'),
('h26q23a01kpt9wh1inw732y9derh6sof', 'OWEzYTZmNWMyYmY3ZDY2MWFhZDc0ODQ4NjcxZTk5MzZjMTQ0ODVjMzp7InR5cGUiOiJob3NwaXRhbCJ9', '2019-06-09 13:24:46.884374'),
('hrfdd8s2lzl7shulrlpn3yngg9bn1i13', 'Y2Y1ZjhjYmQ4NjI5ZWQzMDViNTg3YmRmMTJhMTVmNzM0Njk5YTkzOTp7InVzZXJfVCI6MiwiRG9jdG9yX1BhdGlhbnRfSUQiOjUsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0MjEyMGRjYWI4MDlkMDU0N2M1ODRjNTQ3YjA4MDU0ZGM4YTFlNDJjIiwidXNlcl90eXBlIjoicmVnaXN0ZXJlZF9wYXRpZW50In0=', '2019-04-26 11:08:33.152575'),
('ieuxfscr8qmtn78q1zcec6p77vj7qnan', 'MTI2NTUzOWI1N2VmNjhhMTM0MDM5MmU5YjU2MjkwNDljZmJiZWFjYzp7InBhdGllbnRfdGVtcF9pZCI6MywidXNlcl90eXBlIjoicmVnaXN0ZXJlZF9wYXRpZW50In0=', '2019-04-20 17:45:43.065830'),
('imittq500jmsfs1oufzz5x2zc3f0alqx', 'YTRiMDg0ZjcwN2IwZGQzNGUzMWJhOTNkY2RiMDk1OGMxNjBhYjUyNjp7InR5cGUiOiJsYWIiLCJ1c2VyX1QiOjIsIkRvY3Rvcl9QYXRpYW50X0lEIjowfQ==', '2019-06-09 19:54:07.281373'),
('ipwoljk5ohraes6oteo9cfmxqkizrbvw', 'OWRjNDg2ODY3ZmEyNDdiZTljNzlhZDY0YjM1YTQ0ZjNiOWMzZjRiZTp7ImRvY3Rvcl9pZCI6MywidXNlcl9UIjoyLCJEb2N0b3JfUGF0aWFudF9JRCI6MH0=', '2019-06-09 19:54:24.451554'),
('jfnpaq4hgh3ty6gevyn2n77r7cpxy76x', 'ZTA2NTgwZDlmZjMxMTNhY2E1ODlmOWU5MDQwMjkwYjBmNWFkOWI5NDp7InVzZXJfdHlwZSI6InJlZ2lzdGVyZWRfcGF0aWVudCIsInVzZXJfVCI6MSwidXNlcl9pZCI6NDcsIkRvY3Rvcl9QYXRpYW50X0lEIjowLCJ0eXBlIjoiaG9zcGl0YWwifQ==', '2019-06-11 11:10:40.956909'),
('jkrzurovwt3c1nuwo8kp1v7ic4d6opkk', 'N2U2ZTA2MzRiMzAwNDhmMjYwZDdhN2E3YjRlNGM0ZTdhN2ZiM2I0MTp7InR5cGUiOiJwaGFybWFjeSIsInBhdGllbl9pZCI6NDB9', '2019-06-10 15:18:19.618464'),
('k87ejj33zp61td93ks4iyc7o63ujv7t3', 'MDZjZmVhMDllNDU4NDhlNDRjMTk4NjgwYjM5N2IwMjdmMDg5YWVkMjp7InR5cGUiOiJsYWIiLCJsYWJfaWQiOjIsInBhdGllbnRfaWQiOjQwfQ==', '2019-06-07 08:52:13.006340'),
('kaerxfr46if8rpz1lkab1nfk9d5699ps', 'ZDZjNjFlYmRmNDA3MmUxZTA1MjU1ZjI5ZDBlN2JjODdhMTE5NWRjMzp7InR5cGUiOiJob3NwaXRhbCIsImhvc3BpdGFsX2lkIjoxfQ==', '2019-06-10 05:23:29.398528'),
('kxh65521zsi67qbmknka85pxisqs3sxg', 'ODEyMjAyMGQ0ZGM1MWYxY2YxZDFjNGM1ODkyODc5NTdjNzEwNTMwYjp7InR5cGUiOiJwaGFybWFjeSIsInBhdGllbl9pZCI6MzgsInNzbklEIjoiMDEwMTY5NyIsInBoYXJtYWN5X2lkIjoxfQ==', '2019-06-11 06:35:11.337186'),
('mng856rd2dvbzcnh4srwlv5fr8ua7uu2', 'ZDZjNjFlYmRmNDA3MmUxZTA1MjU1ZjI5ZDBlN2JjODdhMTE5NWRjMzp7InR5cGUiOiJob3NwaXRhbCIsImhvc3BpdGFsX2lkIjoxfQ==', '2019-06-10 06:19:56.481382'),
('mwai6nelkum9rjvjk7i9q906qpct52qp', 'OWEzYTZmNWMyYmY3ZDY2MWFhZDc0ODQ4NjcxZTk5MzZjMTQ0ODVjMzp7InR5cGUiOiJob3NwaXRhbCJ9', '2019-06-09 12:19:56.325683'),
('n30yw6pxhza3nh07bbv8t0rcwry3bobx', 'OTEzNGE2NGZkODVlNWExNzBhZWE0M2E2Y2U3MGI3MjdkMTUwOTNjZDp7InR5cGUiOiJob3NwaXRhbCIsImRvY3Rvcl9pZCI6MywidXNlcl9UIjoyLCJEb2N0b3JfUGF0aWFudF9JRCI6MzF9', '2019-06-11 09:04:56.394090'),
('n76fbkazmkgx758l1xp82zlknrjdg9x9', 'ZDZjNjFlYmRmNDA3MmUxZTA1MjU1ZjI5ZDBlN2JjODdhMTE5NWRjMzp7InR5cGUiOiJob3NwaXRhbCIsImhvc3BpdGFsX2lkIjoxfQ==', '2019-06-10 05:30:53.053024'),
('nllrevr3tcvkjyya9762xpt909afk9ig', 'YWMxNjc1MmVhNzE1ZDMxNDQ1ZDcxNmZhZDI4N2JkZDM5Y2M1NDI3YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhOGEyNDg4NjZkZWI2YmJiZjJmN2I2MzdjYjE2Yjg4ZjE1ODFkOGI1In0=', '2019-04-22 05:56:56.709188'),
('o1l9zam01ppesj8njafvr5d55rvatyuq', 'YTQzMmRmZGU4YTRmMTkxNDVhMjBkNWUwMWUwM2NlMWVmYWU0MmJjYzp7InVzZXJfVCI6MiwiRG9jdG9yX1BhdGlhbnRfSUQiOjMxLCJ0eXBlIjoicGhhcm1hY3kifQ==', '2019-06-10 14:22:34.232561'),
('o2e3egqxjhl1c1ssxrbifkjh6rz82ic4', 'NTBhYWE5MWEwMzQyMjFlZjYzY2Y2YjVkOTczOTY2OGZiNDZkNGJiZjp7InVzZXJfdHlwZSI6InJlZ2lzdGVyZWRfcGF0aWVudCIsInVzZXJfVCI6MiwidHlwZSI6InBoYXJtYWN5Iiwic3NuaWQiOiI4OTEyMzQ1IiwicGF0aWVfaWQiOjQwLCJEb2N0b3JfUGF0aWFudF9JRCI6MzMsInNzbklEIjoiMDEwMTY5NyIsInBoYXJtYWN5X2lkIjoxfQ==', '2019-06-11 06:29:19.979294'),
('o2yh1enqdj39wd5vona6rqvzkfn0hrf7', 'ZTBhOWZhMDMzODBiM2MwNjZiYTA4YzVmZGQ4MjljYzE2N2ZmMzRiMDp7ImRvY3Rvcl9pZCI6MSwidXNlcl9UIjoyLCJEb2N0b3JfUGF0aWFudF9JRCI6NX0=', '2019-04-25 10:43:28.985927'),
('od6fp8u4uttk9lzaup40gvnz4hm8foaq', 'YmZjODEyOTg3ZDEwZmZhODY0YjJmMDdhZGYzZmFhZmM5NTZiZWEzZjp7InR5cGUiOiJsYWIifQ==', '2019-06-07 08:47:39.237931'),
('onj07u17ndcbvisk5fcepiaii3z9xsn7', 'NmUwYmZmMjIzZDk0OWZlNjJmYzAyNDkyYTJmMGQ3NTcwMjQ2NzM2NDp7InBhdGllbnREYXRhIjo0LCJwaGFybWFjeUlkIjoxLCJzc25faWQiOiIwMTAxNjk3IiwicGF0aWVudF90ZW1wX2lkIjoyLCJ1c2VyX3R5cGUiOiJ0ZW1wIiwib3JnX2lkIjoxLCJwYXRpZW50X2lkIjo0fQ==', '2019-04-24 00:48:08.115476'),
('opw3p72vyc3z2nvh21psmq14olof6x9f', 'NTU5Yjg1ODU5NmY0OTkzMjExMDA1NjhkNGZmOTgzMmI2M2U5MGM4Mzp7InBhdGllbnRfdGVtcF9pZCI6MTIsInVzZXJfdHlwZSI6InJlZ2lzdGVyZWRfcGF0aWVudCIsInVzZXJfaWQiOjQwLCJ1c2VyX1QiOjEsIkRvY3Rvcl9QYXRpYW50X0lEIjo0MCwib3JnX2lkIjozLCJfYXV0aF91c2VyX2lkIjoiMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTA2MGQyODkxMjI2YzVmODQ2ZmNjNTkzZGY0MmFhZjkxMjQ5OGEzMSIsInR5cGUiOiJwaGFybWFjeSJ9', '2019-06-06 10:01:30.098405'),
('pr8rssp8pmioswthpq8uc603tcnbuij6', 'MTA1ZTg0MDQxZjhmYjY5NDNlYTdhYzJjZjg5MmU3MzQ4YzMwMWM1ZDp7InVzZXJfdHlwZSI6InJlZ2lzdGVyZWRfcGF0aWVudCIsInVzZXJfVCI6MSwidXNlcl9pZCI6MzgsInBhdGllbnRfaWQiOjMxfQ==', '2019-06-07 10:30:28.982426'),
('psh4un0b2b4a4s21jm6oiiel0sa5jylt', 'OWEzYTZmNWMyYmY3ZDY2MWFhZDc0ODQ4NjcxZTk5MzZjMTQ0ODVjMzp7InR5cGUiOiJob3NwaXRhbCJ9', '2019-06-09 13:19:41.186212'),
('pvcrw7c6lxhf2t72p0gvltkk27cdyydt', 'ZjA4Njk5NzQ3MzU0NWY3ZjhiNTdhYmQxNjYzMmMwNTUyZDI4ODBmNDp7InVzZXJfdHlwZSI6InJlZ2lzdGVyZWRfcGF0aWVudCIsInVzZXJfVCI6MSwidXNlcl9pZCI6MzgsInR5cGUiOiJob3NwaXRhbCIsInBhdGllbnRfaWQiOjMxfQ==', '2019-06-07 10:11:27.789950'),
('qma5npq03s28ly2xrojsdmnek21e16jj', 'YWJjYzdlNDc1ZTRiMDgxY2FkNzc5MmY0ODdlNWNiMGJkNWExMWI3YTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0MjEyMGRjYWI4MDlkMDU0N2M1ODRjNTQ3YjA4MDU0ZGM4YTFlNDJjIiwidXNlcl9UIjoyLCJwYXRpZW50X3RlbXBfaWQiOjQsInVzZXJfdHlwZSI6InJlZ2lzdGVyZWRfcGF0aWVudCIsIkRvY3Rvcl9QYXRpYW50X0lEIjo1fQ==', '2019-04-22 13:15:41.924353'),
('qtg5cp1ixdmobv19si2va8w0m2pmdjss', 'MzI5N2Y5OTY3OTc5MWEzNTlkOWQ5Y2MyMjBjOTY3ZjkyYWYyZTM5ZDp7InBhdGllbnRfdGVtcF9pZCI6OSwidXNlcl90eXBlIjoicmVnaXN0ZXJlZF9wYXRpZW50IiwidXNlcl9UIjoxLCJEb2N0b3JfUGF0aWFudF9JRCI6MCwicGF0aWVudF9pZCI6NX0=', '2019-04-25 20:04:30.458595'),
('rjwh2v66cpn2ygpy5msysua1vll7s1ps', 'ZDMxMjc1OGI0N2YxYzdlZmI1NDU2NWYzNzhmOGRjNmM2NTM3NzdjNzp7InBhdGllbnREYXRhIjo0LCJwaGFybWFjeUlkIjoxfQ==', '2019-04-23 01:36:16.718851'),
('seysaplia2064hswslqqk71p5djazcyj', 'N2Q4YjM4ODM5ZWE0YWFjMjM2OTM1YjQ5YTA3ZjhkNGE1NzQ4ZjQxZTp7InVzZXJfVCI6MSwiRG9jdG9yX1BhdGlhbnRfSUQiOjAsInVzZXJfdHlwZSI6InJlZ2lzdGVyZWRfcGF0aWVudCJ9', '2019-06-10 04:06:15.018732'),
('tag3k3l8880zbl1q1gh4p5shuwso0nd3', 'MjhhMDJiZmJmNjIzNzM1OWY5NjNkZTc5YTBkMzVhMmU5MTI0ZTQzMDp7InR5cGUiOiJwaGFybWFjeSIsInBhdGllbl9pZCI6NDAsInBoYXJtYWN5X2lkIjoxfQ==', '2019-06-07 09:12:58.332755'),
('tdnk5nkt0vx9wnitjt003hgl2icjn1ag', 'N2U2ZTA2MzRiMzAwNDhmMjYwZDdhN2E3YjRlNGM0ZTdhN2ZiM2I0MTp7InR5cGUiOiJwaGFybWFjeSIsInBhdGllbl9pZCI6NDB9', '2019-06-07 09:15:42.035286'),
('tvezht1g55r8agmr5i0ak03zm9ndpoks', 'ZDhiNDc4NWJiYjI5MDMwYTYxMGZiYmE5YjYxNDJmNTk4N2ExMDExNDp7InVzZXJfVCI6MiwiRG9jdG9yX1BhdGlhbnRfSUQiOjMxLCJ1c2VyX3R5cGUiOiJyZWdpc3RlcmVkX3BhdGllbnQiLCJ1c2VyX2lkIjozOCwidHlwZSI6InBoYXJtYWN5IiwicGhhcm1hY3lfaWQiOjEsInNzbklEIjoiODkxMjM0NSIsInBhdGllbl9pZCI6NDd9', '2019-06-11 13:07:18.319222'),
('uzbsl8585yftb7uu4w4uoambm93xms53', 'OWRjNDg2ODY3ZmEyNDdiZTljNzlhZDY0YjM1YTQ0ZjNiOWMzZjRiZTp7ImRvY3Rvcl9pZCI6MywidXNlcl9UIjoyLCJEb2N0b3JfUGF0aWFudF9JRCI6MH0=', '2019-06-11 09:08:50.889033'),
('v19e1rzss544qdezrtf5ugf8o23dl8kv', 'YWU0MDYyZDRjYjM4Y2JhNTk1NTgyYWQzNWJiNzY2MjEyMzZkZDczOTp7InVzZXJfdHlwZSI6InJlZ2lzdGVyZWRfcGF0aWVudCIsInBhdGllbnRfdGVtcF9pZCI6MSwicGF0aWVudF9pZCI6MX0=', '2019-04-20 03:12:18.796099'),
('wgvnnfb8agayf3tojq2124ovx2pi1yjq', 'MzQ1M2UyZmE1NDQ1ZGNiZDc4YWMwYmU3YjE2M2EwNzg5MDU5YzBlYTp7Im9yZ19pZCI6MSwicGF0aWVudF90ZW1wX2lkIjoxMCwidXNlcl90eXBlIjoicmVnaXN0ZXJlZF9wYXRpZW50IiwidXNlcl9pZCI6MzgsInBhdGllbnRfaWQiOjMxfQ==', '2019-04-27 22:38:56.992492'),
('wh352olr77jtb451xao4ogg1fx7k5no7', 'ZDZjNjFlYmRmNDA3MmUxZTA1MjU1ZjI5ZDBlN2JjODdhMTE5NWRjMzp7InR5cGUiOiJob3NwaXRhbCIsImhvc3BpdGFsX2lkIjoxfQ==', '2019-06-09 13:05:34.407526'),
('whs2lg5vuzp030ry6muotp1c177y22ra', 'OGI5NDYxYWYxMmZkNWJhNTRlM2NjOGZhOTRiNTkyZWVhMWY4ZjhmMTp7InR5cGUiOiJob3NwaXRhbCIsImRvY3Rvcl9pZCI6MywidXNlcl9UIjoyLCJEb2N0b3JfUGF0aWFudF9JRCI6Mzh9', '2019-06-10 08:11:42.634295'),
('wixggwvxykilz2pk7lby88cib3x3j6e9', 'OWEzYTZmNWMyYmY3ZDY2MWFhZDc0ODQ4NjcxZTk5MzZjMTQ0ODVjMzp7InR5cGUiOiJob3NwaXRhbCJ9', '2019-06-09 13:05:23.172363'),
('wvr2iggvr7d47taz1cc7otfe2zmqreu9', 'Y2U1YWE4OGEyZTBjNjM1Yzc5MDcxZTgyYzhiYzAxMDUwOGM0MTdlNDp7InR5cGUiOiJwaGFybWFjeSIsInBoYXJtYWN5X2lkIjoxLCJwYXRpZW50X2lkIjo0MH0=', '2019-06-07 08:56:41.643862'),
('x66fo6wotv5toyfrf031fdtibcab73os', 'OGRhYzdmZTcwMmU1ZmZhYjhmNDY4OTk4OWFhN2RlZDdjYWE5OGE3Mzp7InVzZXJfVCI6MiwiRG9jdG9yX1BhdGlhbnRfSUQiOjAsImRvY3Rvcl9pZCI6M30=', '2019-06-11 07:42:50.389925'),
('xzvdjbjw2kk2evhzo2v105f3vz8t4h7f', 'YzRjNjEzNWY5NWE2NmY3MmJiZTUxYWRlZjBiM2QxYzI1ZTQwMGFlZjp7InR5cGUiOiJwaGFybWFjeSIsInBhdGlfaWQiOjQwLCJwYXRpZW5faWQiOjQwLCJwaGFybWFjeV9pZCI6MX0=', '2019-06-07 09:04:32.038896'),
('ys0fsejf1unl6vep4hxjd4gm61qzcwg1', 'OWEzYTZmNWMyYmY3ZDY2MWFhZDc0ODQ4NjcxZTk5MzZjMTQ0ODVjMzp7InR5cGUiOiJob3NwaXRhbCJ9', '2019-06-09 12:58:57.127895'),
('zg8grtjs1rrglxocbroma5b3i1513mcs', 'YTVhOTc5MDY4NzNhYmNkYmRlY2FiYzkwNmY4MzgwOGUwMzVhYmE0Yjp7InR5cGUiOiJob3NwaXRhbCIsInBhdGllX2lkIjo0MCwiaG9zcGl0YWxfaWQiOjF9', '2019-06-10 15:57:16.549326'),
('zwj8rb8ba69se62x5vt7wxbellytmkyh', 'ZDZjNjFlYmRmNDA3MmUxZTA1MjU1ZjI5ZDBlN2JjODdhMTE5NWRjMzp7InR5cGUiOiJob3NwaXRhbCIsImhvc3BpdGFsX2lkIjoxfQ==', '2019-06-10 06:18:54.645762');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_all_analytics`
--

CREATE TABLE `doctor_all_analytics` (
  `analytics_id` int(11) NOT NULL,
  `analytics_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctor_all_analytics`
--

INSERT INTO `doctor_all_analytics` (`analytics_id`, `analytics_name`) VALUES
(1, 'CBC'),
(2, 'Blood type');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_all_chronic`
--

CREATE TABLE `doctor_all_chronic` (
  `chronic_id` int(11) NOT NULL,
  `chronic_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_all_medicine`
--

CREATE TABLE `doctor_all_medicine` (
  `medicine_id` int(11) NOT NULL,
  `medicine_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctor_all_medicine`
--

INSERT INTO `doctor_all_medicine` (`medicine_id`, `medicine_name`) VALUES
(1, 'antibiotic'),
(2, 'oplex'),
(3, 'Olvint\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_all_rays`
--

CREATE TABLE `doctor_all_rays` (
  `ray_id` int(11) NOT NULL,
  `ray_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctor_all_rays`
--

INSERT INTO `doctor_all_rays` (`ray_id`, `ray_name`) VALUES
(1, 'Arm Rays'),
(2, 'Leg Rays'),
(3, 'body Rays');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_doctor`
--

CREATE TABLE `doctor_doctor` (
  `id` int(11) NOT NULL,
  `Registration_num` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Specialization` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Registration_date` date NOT NULL,
  `licence` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Last_date_payment` date NOT NULL,
  `End_date` date NOT NULL,
  `Specialization_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `University` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Work_place` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Sub_syndicate` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `General_secretary` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Working_till` date NOT NULL,
  `Graduation_year` date NOT NULL,
  `doc_rate` int(11) DEFAULT NULL,
  `Doc_id` int(11) NOT NULL,
  `clinic_id` int(11) DEFAULT NULL,
  `hospital_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctor_doctor`
--

INSERT INTO `doctor_doctor` (`id`, `Registration_num`, `Specialization`, `Registration_date`, `licence`, `Last_date_payment`, `End_date`, `Specialization_type`, `University`, `Work_place`, `Sub_syndicate`, `General_secretary`, `Working_till`, `Graduation_year`, `doc_rate`, `Doc_id`, `clinic_id`, `hospital_id`) VALUES
(1, '123123', 'heart', '2019-04-08', '123456', '2019-04-08', '2019-04-08', 'heart', 'helwan', 'maddi', 'sadasd', 'asdasd', '2019-05-22', '2019-05-22', 7, 4, NULL, 1),
(2, '2', 'sdasdasd', '2019-05-01', 'qwswqs', '2019-05-02', '2019-05-03', 'sacasxasx', 'cz cx cc', 'dcsacds', 'zczxczxc', 'erferferf', '2019-05-22', '2019-05-15', 2, 39, NULL, 1),
(3, '275468', 'Human Doctor', '2019-05-01', '276695', '2019-05-02', '2019-05-03', 'general practor', 'helwan', 'helwan', 'el oksour', 'Dr.ehab el taher', '2019-05-20', '2019-05-15', 10, 46, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_multi_analytics`
--

CREATE TABLE `doctor_multi_analytics` (
  `id` int(11) NOT NULL,
  `P_A_id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctor_multi_analytics`
--

INSERT INTO `doctor_multi_analytics` (`id`, `P_A_id`, `report_id`) VALUES
(5, 8, 18),
(6, 9, 18),
(7, 10, 19),
(8, 11, 20),
(9, 12, 20),
(10, 13, 30),
(12, 15, 31),
(13, 16, 32),
(14, 17, 34),
(15, 18, 36),
(16, 19, 38),
(17, 20, 39);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_multi_chronic`
--

CREATE TABLE `doctor_multi_chronic` (
  `id` int(11) NOT NULL,
  `P_C_id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_multi_medecines`
--

CREATE TABLE `doctor_multi_medecines` (
  `id` int(11) NOT NULL,
  `P_M_id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctor_multi_medecines`
--

INSERT INTO `doctor_multi_medecines` (`id`, `P_M_id`, `report_id`) VALUES
(15, 2, 1),
(16, 23, 18),
(17, 24, 19),
(18, 25, 20),
(19, 26, 20),
(20, 27, 21),
(21, 28, 22),
(22, 29, 23),
(23, 30, 24),
(24, 31, 25),
(25, 32, 27),
(26, 33, 28),
(27, 34, 29),
(28, 35, 29),
(29, 36, 30),
(30, 37, 31),
(31, 38, 32),
(32, 39, 33),
(33, 40, 34),
(34, 41, 35),
(35, 42, 36),
(36, 43, 37),
(37, 44, 38),
(38, 45, 39);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_multi_rays`
--

CREATE TABLE `doctor_multi_rays` (
  `id` int(11) NOT NULL,
  `P_R_id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctor_multi_rays`
--

INSERT INTO `doctor_multi_rays` (`id`, `P_R_id`, `report_id`) VALUES
(9, 8, 18),
(10, 9, 18),
(11, 10, 18),
(12, 11, 20),
(13, 12, 20),
(14, 13, 20),
(15, 14, 30),
(17, 16, 31),
(18, 17, 34),
(19, 18, 36),
(20, 19, 38),
(21, 20, 39);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_patient_analytics`
--

CREATE TABLE `doctor_patient_analytics` (
  `P_A_id` int(11) NOT NULL,
  `analytics_result` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `analy_id` int(11) NOT NULL,
  `lab_id` int(11) DEFAULT NULL,
  `pat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctor_patient_analytics`
--

INSERT INTO `doctor_patient_analytics` (`P_A_id`, `analytics_result`, `analy_id`, `lab_id`, `pat_id`) VALUES
(1, '/lab/media/Abdelfatah-Ramadan.pdf', 1, 1, 5),
(2, '/lab/media/Diagrams.docx', 2, 1, 5),
(3, '/lab/media/Abdelfatah-Ramadan_qP83THA.pdf', 1, 1, 5),
(4, '', 2, 1, 5),
(5, '/lab/media/53633581_2278774658930603_1978313927116718080_o.jpg', 1, 1, 5),
(6, '/lab/media/Abdelfatah-Ramadan_ta6xUZj.pdf', 1, 1, 5),
(7, '/lab/media/PythonForDataScience.pdf', 2, 1, 31),
(8, '/lab/media/PythonForDataScience_xMNbAIr.pdf', 1, 1, 31),
(9, '/lab/media/scan0006.jpg', 2, 1, 31),
(10, '/lab/media/scan0005.jpg', 1, 1, 31),
(11, '/lab/media/%D8%AA%D9%85%D8%A8%D8%A7%D8%AA%D9%83%20%D8%AA%D9%85%D8%A8%20%D8%A7%D9%83%D8%AA%D8%B1%20%D9%85%D9%86%20%D9%83%D8%AF%D9%87.jpg', 1, 1, 31),
(12, '/lab/media/Big%20Data%20Engineer%20v2%20Mastery%20Award%20for%20Students%20%20(2018)_certificate.pdf', 2, 1, 31),
(13, '/lab/media/PythonForDataScience_cEpUslK.pdf', 1, 1, 31),
(14, '/lab/media/scan0006_vhwhQ9S.jpg', 2, 1, 31),
(15, '/lab/media/2019-05-01_234414_EhnnmI5.png', 1, 1, 33),
(16, '', 1, NULL, 31),
(17, '', 2, NULL, 31),
(18, '', 2, NULL, 34),
(19, '', 1, NULL, 34),
(20, '', 2, NULL, 31);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_patient_chronic`
--

CREATE TABLE `doctor_patient_chronic` (
  `P_C_id` int(11) NOT NULL,
  `chr_id` int(11) NOT NULL,
  `pat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_patient_medicine`
--

CREATE TABLE `doctor_patient_medicine` (
  `P_M_id` int(11) NOT NULL,
  `number_of_potions` int(11) NOT NULL,
  `number_of_pills` int(11) NOT NULL,
  `med_id` int(11) NOT NULL,
  `pat_id` int(11) NOT NULL,
  `pharmacy_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctor_patient_medicine`
--

INSERT INTO `doctor_patient_medicine` (`P_M_id`, `number_of_potions`, `number_of_pills`, `med_id`, `pat_id`, `pharmacy_id`) VALUES
(2, 5, 5, 1, 4, 1),
(3, 10, 10, 2, 4, 1),
(4, 69, 68, 1, 4, 1),
(5, 4, 13, 1, 4, 1),
(6, 5, 3, 1, 4, 1),
(7, 5, 10, 2, 5, 1),
(8, 5, 10, 2, 5, 1),
(9, 5, 10, 2, 5, 1),
(10, 5, 10, 1, 5, 1),
(11, 5, 10, 1, 5, 1),
(12, 5, 10, 1, 5, 1),
(13, 10, 5, 1, 4, 1),
(14, 5, 10, 1, 5, 1),
(15, 7, 3, 2, 5, 1),
(16, 11, 12, 1, 5, 1),
(17, 10, 5, 1, 5, 1),
(18, 10, 5, 2, 4, 1),
(19, 10, 2, 1, 4, 1),
(20, 11, 6, 1, 4, 1),
(21, 12, 7, 3, 31, 1),
(22, 13, 8, 2, 31, 1),
(23, 2, 1, 1, 31, 1),
(24, 10, 3, 2, 31, 1),
(25, 2, 2, 1, 31, 1),
(26, 7, 3, 2, 31, 1),
(27, 1, 1, 1, 31, 1),
(28, 5, 4, 1, 31, 1),
(29, 1, 1, 1, 31, 1),
(30, 1, 1, 1, 31, 1),
(31, 4, 4, 1, 31, 1),
(32, 1, 1, 1, 31, 1),
(33, 2, 1, 1, 31, 1),
(34, 1, 1, 1, 31, 1),
(35, 5, 5, 2, 31, 1),
(36, 7, 5, 1, 33, 1),
(37, 1, 1, 1, 33, 1),
(38, 1, 1, 1, 31, NULL),
(39, 5, 5, 1, 31, NULL),
(40, 5, 5, 2, 31, NULL),
(41, 5, 5, 2, 31, NULL),
(42, 5, 14, 2, 34, NULL),
(43, 10, 10, 2, 34, NULL),
(44, 5, 5, 2, 34, NULL),
(45, 80, 8, 2, 31, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_patient_rays`
--

CREATE TABLE `doctor_patient_rays` (
  `P_R_id` int(11) NOT NULL,
  `rays_result` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lab_id` int(11) DEFAULT NULL,
  `pat_id` int(11) NOT NULL,
  `ray_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctor_patient_rays`
--

INSERT INTO `doctor_patient_rays` (`P_R_id`, `rays_result`, `lab_id`, `pat_id`, `ray_id`) VALUES
(1, '/lab/media/cv.pdf', 1, 5, 1),
(2, '/lab/media/Abdelfatah-Ramadan.pdf', 1, 4, 2),
(3, '/lab/media/53633581_2278774658930603_1978313927116718080_o_RY6onBM.jpg', 1, 5, 2),
(4, '/lab/media/53633581_2278774658930603_1978313927116718080_o_OYnF0wQ.jpg', 1, 5, 1),
(5, '/lab/media/45200989_2469934389687943_3172656873715269632_n_0V52SIq.jpg', 1, 5, 2),
(6, '/lab/media/53633581_2278774658930603_1978313927116718080_o_OYnF0wQ.jpg', 1, 5, 2),
(7, '/lab/media/studentTimeTable.pdf', 1, 4, 3),
(8, '/lab/media/PythonForDataScience_TdYlBJX.pdf', 1, 31, 1),
(9, '/lab/media/PythonForDataScience_Yvk7P73.pdf', 1, 31, 2),
(10, '/lab/media/45200989_2469934389687943_3172656873715269632_n.jpg', 1, 31, 3),
(11, '/lab/media/PythonForDataScience_VNn3O3y.pdf', 1, 31, 1),
(12, '/lab/media/Big%20Data%20Engineer%20v2%20Mastery%20Award%20for%20Students%20%20(2018)_certificate_XC0v2WQ.pdf', 1, 31, 2),
(13, '/lab/media/PythonForDataScience_qpt9yom.pdf', 1, 31, 3),
(14, '/lab/media/PythonForDataScience_zgeWgRl.pdf', 1, 31, 1),
(15, '/lab/media/%D8%AA%D9%85%D8%A8%D8%A7%D8%AA%D9%83%20%D8%AA%D9%85%D8%A8%20%D8%A7%D9%83%D8%AA%D8%B1%20%D9%85%D9%86%20%D9%83%D8%AF%D9%87_HlPTWrI.jpg', 1, 31, 2),
(16, '/lab/media/IMG_20190212_115352_Kvxrx09.jpg', 1, 33, 3),
(17, '', NULL, 31, 2),
(18, '', NULL, 34, 2),
(19, '', NULL, 34, 1),
(20, '', NULL, 31, 2);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_prescription`
--

CREATE TABLE `doctor_prescription` (
  `prescription_id` int(11) NOT NULL,
  `Disease_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Disease_level` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Disease_disc` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Doctor_signature` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `next_appointment` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctor_prescription`
--

INSERT INTO `doctor_prescription` (`prescription_id`, `Disease_name`, `Disease_level`, `Disease_disc`, `Doctor_signature`, `next_appointment`) VALUES
(1, 'heartattck', '10', 'lkadknaldkje asndlkawed o;j;lakd ;lkwe klansd;lkamwe;l', 'ahmed', '2019-04-10 00:00:00.000000'),
(2, '7a7a', '5', 'sdsadbadbaudbuy', 'ahmed', '2019-04-10 14:01:17.000000'),
(3, 'Tamer', '7', 'shdbashdbasdbh', 'ahmed', '2019-04-10 14:01:17.000000'),
(4, 'heartattack', '5', 'hdahdbasdbauysdbuy', 'ahmed', '2019-04-10 14:01:17.000000'),
(5, 'heartattack', '7', 'msdmfsdnfsdfnusidf', 'ahmed', '2019-04-10 14:01:17.000000'),
(6, 'heartattack', '7', 'dfgfdgdfgdfgdfg', 'ahmed', '2019-04-10 14:01:17.000000'),
(7, 'heartattack', '7', 'fdgfdgdfgfdgfdg', 'ahmed', '2019-04-10 14:01:17.000000'),
(8, 'heartattack', '7', 'msdmfsdnfsdfnusidf', 'ahmed', '2019-04-10 14:01:17.000000'),
(9, 'heartattack', '7', 'sdasdassadsdsadsadsd', 'ahmed', '2019-04-10 14:01:17.000000'),
(10, 'heartattack', '7', 'dasdassasadadasd', 'ahmed', '2019-04-10 14:01:17.000000'),
(11, 'heartattack', '7', 'dasdassasadadasd', 'ahmed', '2019-04-10 14:01:17.000000'),
(12, 'heartattack', '8', 'dasdassasaasdsaddadasd', 'ahmed', '2019-04-10 14:01:17.000000'),
(13, 'heartattack', '8', 'dasdassasaasdsaddadasd', 'ahmed', '2019-04-10 14:01:17.000000'),
(14, 'heartattack', '8', 'vgdfgdfgdfgfdgfdg', 'ahmed', '2019-04-10 14:01:17.000000'),
(15, 'heartattack', '8', 'vgdfgdfgdfgfdgfdg', 'ahmed', '2019-04-10 14:01:17.000000'),
(16, 'heartattack', '8', 'vgdfgdfgdfgfdgfdg', 'ahmed', '2019-04-10 14:01:17.000000'),
(17, 'heartattack', '8', 'vgdfgdfgdfgfdgfdg', 'ahmed', '2019-04-10 14:01:17.000000'),
(18, 'heartattack', '8', 'abdullahabdullahabdullahabdullah', 'ahmed', '2019-04-10 14:01:17.000000'),
(19, 'heartattack', '8', 'vgdfgdfgdfgfdgfdg', 'ahmed', '2019-04-10 14:01:17.000000'),
(20, 'heartattack', '8', 'vgdfgdfgdfgfdgfdg', 'ahmed', '2019-04-10 14:01:17.000000'),
(21, 'heartattack', '8', 'vgdfgdfgdfgfdgfdg', 'ahmed', '2019-04-10 14:01:17.000000'),
(22, 'heartattack', '8', 'vgdfgdfgdfgfdgfdg', 'ahmed', '2019-04-10 14:01:17.000000'),
(23, 'heartattack', '8', 'vgdfgdfgdfgfdgfdg', 'ahmed', '2019-04-10 14:01:17.000000'),
(24, 'heartattack', '8', 'xczxczxcxzcxzc', 'ahmed', '2019-04-10 14:01:17.000000'),
(25, 'heartattack', '7', 'dsfdsfdsfdsfsd', 'ahmed', '2019-04-10 14:01:17.000000'),
(26, 'heartattack', '7', 'dsfdsfdsfdsfsd', 'ahmed', '2019-04-10 14:01:17.000000'),
(27, 'heartattack', '7', 'dsfdsfdsfdsfsd', 'ahmed', '2019-04-10 14:01:17.000000'),
(28, 'heartattack', '7', 'dsfdsfdsfdsfsd', 'ahmed', '2019-04-10 14:01:17.000000'),
(29, 'heartattack', '7', 'dfdsfdsfsdfsf', 'ahmed', '2019-04-10 14:01:17.000000'),
(30, 'heartattack', '7', 'fdsfdsfdsfsdfdsf', 'ahmed', '2019-04-10 14:01:17.000000'),
(31, 'heartattack', '7', 'fdsfdsfdsfsdfdsf', 'ahmed', '2019-04-10 14:01:17.000000'),
(32, 'ooops', '8', 'sadasdassdasdas', 'ahmed', '2019-04-10 14:01:17.000000'),
(33, 'Disheart', '7', 'sadasdasdsadadad', 'ahmed', '2019-04-10 14:01:17.000000'),
(34, 'ooop', '7', 'fdsfsdfsfsf', 'ahmed', '2019-04-10 14:01:17.000000'),
(35, 'ooop', '7', 'fdsfsdfsfsf', 'ahmed', '2019-04-10 14:01:17.000000'),
(36, 'heartattack', '7', 'cxvxccxv', 'ahmed', '2019-04-10 14:01:17.000000'),
(37, 'hamada', '10', 'abdhadbasbdiuadh', 'ahmed', '2019-04-10 12:01:17.000000'),
(38, 'Tamer', '8', 'sadaasdasdsdsada', 'ahmed', '2019-04-10 14:01:17.000000'),
(39, 'Tamer', '8', 'sadaasdasdsdsada', 'ahmed', '2019-04-10 14:01:17.000000'),
(40, '7a7a', '8', 'sadasdsadsadsad', 'ahmed', '2019-04-10 14:01:17.000000'),
(41, '7a7a', '7', 'asdasdadad', 'ahmed', '2019-04-10 14:01:17.000000'),
(42, '7a7a', '7', 'asdasdadad', 'ahmed', '2019-04-10 14:01:17.000000'),
(43, 'to7otmo', '3', 'there\'s no top pharmacies at this time. please try again Laterthere\'s no top pharmacies at this time. please try again Laterthere\'s no top pharmacies at this time. please try again Laterthere\'s no top pharmacies at this time. please try again Laterthere\'s no top pharmacies at this time. please try again Laterthere\'s no top pharmacies at this time. please try again Laterthere\'s no top pharmacies at this time. please try again Laterthere\'s no top pharmacies at this time. please try again Laterthere\'s no top pharmacies at this time. please try again Laterthere\'s no top pharmacies at this time. please try again Laterthere\'s no top pharmacies at this time. please try again Laterthere\'s no top pharmacies at this time. please try again Laterthere\'s no top pharmacies at this time. please try again Laterthere\'s no top pharmacies at this time. please try again Laterthere\'s no top pharmacies at this time. please try again Laterthere\'s no top pharmacies at this time. please try again Laterthere\'s no top pharmacies at this time. please try again Laterthere\'s no top pharmacies at this time. please try again Later', 'ahmed', '2019-04-10 14:01:17.000000'),
(44, 'heartattack', '10', 'gvgvghvhvghvh', 'ahmed', '2019-04-10 14:01:17.000000'),
(45, 'flu', '2', 'mxlaskmxaskxasx', 'ali', '2019-04-08 12:23:43.740586'),
(46, 'flus', '5', 'saxasmlaskmxasx', 'ali', '2019-04-08 12:23:43.740586'),
(47, 'flu', '2', 'abdullahabdullahabdullahabdullahabdullahabdullahabdullahabdullahabdullahabdullahabdullahabdullahabdullahabdullahabdullahabdullahabdullahabdullahabdullahabdullahabdullahabdullah', 'ali', '2019-04-08 12:23:43.740586'),
(48, 'flu', '2', 'ali@gmail.comali@gmail.comali@gmail.comali@gmail.com', 'ali', '2019-04-08 12:23:43.740586'),
(49, 'flus', '2', 'klnnnnnnnnnnnnnnn', 'ali', '2019-04-08 12:23:43.740586'),
(50, 'flu', '2', 'kmkm,m,,m,njk', 'ali', '2019-04-08 12:23:43.740586'),
(51, 'flu', '5', 'qqqqqqqqqqqqqq', 'ali', '2019-04-08 12:23:43.740586'),
(52, 'flu', '2', '///////////././,/,./,', 'ali', '2019-04-08 12:23:43.740586'),
(53, 'flu', '5', 'qwqwqwqwali@gmail.com', 'ali', '2019-04-08 12:23:43.740586'),
(54, 'flu', '2', 'ali@gmail.comali@gmail.com', 'ali', '2019-04-08 12:23:43.740586'),
(55, 'flu', '2', 'qwqwqwqwqw', 'ali', '2019-04-08 12:23:43.740586'),
(56, 'abdullah', '1', 'http://127.0.0.1:8000http://127.0.0.1:8000http://127.0.0.1:8000http://127.0.0.1:8000', 'ali', '2019-04-08 12:23:43.740586'),
(57, 'flu', '2', 'asdasaxasxasxasxa', 'ali', '2019-04-08 12:23:43.740586'),
(58, 'flu', '2', 'Anyone know startups that is based on digital fabrication ( 3D printing , laser cutting,...)', 'ali', NULL),
(59, 'flu', '2', 'ascasdmcasklxamc', 'ali', '2019-04-08 12:23:43.740586'),
(60, 'flu', '5', 'jjfbdsfshfb', 'ali', '2019-04-08 12:23:43.740586'),
(61, 'flu', '2', 'sdasdasdad', 'ali', '2019-04-08 12:23:43.740586'),
(62, 'flu', '5', 'hbbhbhbh', 'ali', '2019-04-08 12:23:43.740586'),
(63, 'flu', '5', 'sadadasda', 'ali', '2019-04-08 12:23:43.740586'),
(64, 'flu', '5', 'hshdbasdbahdbh', 'Ahmed', '2019-04-08 12:23:43.740586'),
(65, 'Omar', 'Ahmed', 'njfjfkk', 'ali', '2019-04-08 12:23:43.740586'),
(66, 'Omar', 'Ahmed', 'njfjfkk', 'ali', '2019-04-08 12:23:43.740586'),
(67, 'omar', 'dnsajda', 'dajsdnasjdn', 'ajsdnajd', '2019-04-08 12:23:43.740586');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_report`
--

CREATE TABLE `doctor_report` (
  `report` int(11) NOT NULL,
  `Submit_date` datetime(6) NOT NULL,
  `clinic_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) NOT NULL,
  `hospital_id` int(11) DEFAULT NULL,
  `patient_id` int(11) NOT NULL,
  `prescription_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctor_report`
--

INSERT INTO `doctor_report` (`report`, `Submit_date`, `clinic_id`, `doctor_id`, `hospital_id`, `patient_id`, `prescription_id`) VALUES
(1, '2019-04-09 12:15:53.554344', NULL, 1, 1, 5, 1),
(2, '2019-04-09 14:01:59.106849', 1, 1, NULL, 5, 2),
(3, '2019-04-02 17:40:11.472072', NULL, 1, 1, 5, 31),
(4, '2019-04-09 17:41:39.261936', 1, 1, NULL, 5, 32),
(5, '2019-04-09 18:06:25.880175', NULL, 1, 1, 5, 33),
(6, '2019-04-11 09:20:09.794128', 1, 1, NULL, 5, 34),
(7, '2019-04-11 09:21:31.701823', NULL, 1, 1, 5, 35),
(8, '2019-04-11 09:41:35.343125', 1, 1, NULL, 5, 36),
(9, '2019-04-11 10:50:59.833987', NULL, 1, 1, 5, 37),
(10, '2019-04-11 11:36:17.987333', 1, 1, NULL, 5, 38),
(11, '2019-04-11 11:37:44.604536', NULL, 1, 1, 5, 39),
(12, '2019-04-11 11:39:13.390109', 1, 1, NULL, 5, 40),
(13, '2019-04-11 11:41:53.623221', NULL, 1, 1, 5, 41),
(14, '2019-04-11 11:42:12.390535', 1, 1, NULL, 5, 42),
(15, '2019-04-11 15:46:46.241963', NULL, 1, 1, 5, 43),
(16, '2019-04-12 11:06:48.753832', 1, 1, NULL, 5, 44),
(17, '2019-04-13 11:06:48.753832', NULL, 1, 1, 30, 44),
(18, '2019-05-17 03:57:10.742544', NULL, 2, NULL, 31, 45),
(19, '2019-05-17 03:59:40.587791', NULL, 2, NULL, 31, 46),
(20, '2019-05-17 04:20:43.280234', NULL, 2, NULL, 31, 47),
(21, '2019-05-17 04:25:18.202108', NULL, 2, NULL, 31, 48),
(22, '2019-05-17 04:26:33.136111', NULL, 2, NULL, 31, 49),
(23, '2019-05-17 04:27:44.509082', NULL, 2, NULL, 31, 50),
(24, '2019-05-17 04:28:28.213316', NULL, 2, NULL, 31, 51),
(25, '2019-05-17 04:29:09.555489', NULL, 2, NULL, 31, 52),
(26, '2019-05-17 04:30:02.702391', NULL, 2, NULL, 31, 53),
(27, '2019-05-17 04:47:59.737649', NULL, 2, NULL, 31, 54),
(28, '2019-05-17 04:51:30.204525', NULL, 1, NULL, 31, 55),
(29, '2019-05-17 04:59:40.574192', NULL, 2, NULL, 31, 56),
(30, '2019-05-17 05:28:30.455242', NULL, 2, NULL, 31, 57),
(31, '2019-05-21 02:34:28.108675', NULL, 2, NULL, 33, 58),
(32, '2019-05-23 11:04:19.209713', NULL, 3, NULL, 31, 59),
(33, '2019-05-27 08:30:30.318283', NULL, 3, NULL, 31, 60),
(34, '2019-05-27 08:31:14.120477', NULL, 3, NULL, 31, 61),
(35, '2019-05-27 09:02:30.237608', NULL, 3, NULL, 31, 62),
(36, '2019-05-27 09:21:12.120165', NULL, 3, NULL, 34, 63),
(37, '2019-05-27 09:37:19.041472', NULL, 3, NULL, 34, 64),
(38, '2019-05-27 09:54:04.549794', NULL, 3, NULL, 34, 66),
(39, '2019-05-27 10:34:22.429166', NULL, 3, NULL, 31, 67);

-- --------------------------------------------------------

--
-- Table structure for table `hospital_hospital`
--

CREATE TABLE `hospital_hospital` (
  `h_id` int(11) NOT NULL,
  `h_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `h_country` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `h_state` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `h_city` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `h_street` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `h_zipcode` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `h_phone_num` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `h_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `h_ownership` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `h_emergency_service` tinyint(1) NOT NULL,
  `h_date` date NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `website` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `logo` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `internal_medicine` int(11) NOT NULL,
  `cardiology` int(11) NOT NULL,
  `endocrinology` int(11) NOT NULL,
  `hematology` int(11) NOT NULL,
  `nephrology` int(11) NOT NULL,
  `surgery` int(11) NOT NULL,
  `pediatric` int(11) NOT NULL,
  `obstertics_genacology` int(11) NOT NULL,
  `ophthalmologist` int(11) NOT NULL,
  `neurology` int(11) NOT NULL,
  `Ear_nose_threat` int(11) NOT NULL,
  `urology` int(11) NOT NULL,
  `dermatology` int(11) NOT NULL,
  `hepatology` int(11) NOT NULL,
  `Radiology` int(11) NOT NULL,
  `psychiatry` int(11) NOT NULL,
  `dentistry` int(11) NOT NULL,
  `forensic_medicine` int(11) NOT NULL,
  `enatony` int(11) NOT NULL,
  `num_of_bed` int(11) NOT NULL,
  `hr_username` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `hr_password` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` date NOT NULL,
  `hos_rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hospital_hospital`
--

INSERT INTO `hospital_hospital` (`h_id`, `h_name`, `h_country`, `h_state`, `h_city`, `h_street`, `h_zipcode`, `h_phone_num`, `h_type`, `h_ownership`, `h_emergency_service`, `h_date`, `email`, `website`, `logo`, `internal_medicine`, `cardiology`, `endocrinology`, `hematology`, `nephrology`, `surgery`, `pediatric`, `obstertics_genacology`, `ophthalmologist`, `neurology`, `Ear_nose_threat`, `urology`, `dermatology`, `hepatology`, `Radiology`, `psychiatry`, `dentistry`, `forensic_medicine`, `enatony`, `num_of_bed`, `hr_username`, `hr_password`, `creation_date`, `hos_rate`) VALUES
(1, 'elhady', 'egypt', 'helwan', 'helwan', '24 helwan', '11227', '01112554133', 'Children', 'no owner', 1, '2019-04-17', 'abdullah.mk96@yahoo.com', 'https://www.tutorialrepublic.com/twitter-bootstrap-tutorial/bootstrap-list-groups.php', '/hospital/media/IMG_20190212_115352.jpg', 14, 8, 16, 8, 37, 72, 100, 26, 2, 3, 5, 44, 0, 0, 0, 0, 0, 0, -1, 335, 'admin', 'admin', '2019-04-03', 6);

-- --------------------------------------------------------

--
-- Table structure for table `hospital_organization`
--

CREATE TABLE `hospital_organization` (
  `org_id` int(11) NOT NULL,
  `org_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `org_country` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `org_state` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `org_city` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `org_zipcode` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `org_phone_num` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `org_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `org_website` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `org_logo` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `hr_username` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `hr_password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` date NOT NULL,
  `org_rate` int(11) DEFAULT NULL,
  `Type` int(11) NOT NULL,
  `hospital_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hospital_organization`
--

INSERT INTO `hospital_organization` (`org_id`, `org_name`, `org_country`, `org_state`, `org_city`, `org_zipcode`, `org_phone_num`, `org_email`, `org_website`, `org_logo`, `hr_username`, `hr_password`, `creation_date`, `org_rate`, `Type`, `hospital_id`) VALUES
(1, 'aman pharmacy', 'Egypt', 'cairo', 'helwan', '11722', '01114185027', 'mohamedashrafibraheem@gmail.com', 'https://www.facebook.com/', '/hospital/media/IMG_20190212_115352.jpg', 'admin', 'As123123123', '2019-04-08', 5, 1, 1),
(2, 'nasr lab', 'egypt', 'cairo', 'helwan', '11734', '01288456383', 'a@a.com', 'https://remotemysql.com', '/hospital/media/IMG_20190212_115352.jpg', 'admin', 'As123123123', '2019-05-21', 10, 2, 1),
(4, 'helwanpharmacy', 'Egypt', 'Cairo', 'Helwan', '11432', '01234567891', 'ph@phphph.com', 'https://stackoverflow.com/', '/hospital/media/scan0005.jpg', 'pharm', 'As123123123', '2019-05-28', NULL, 1, 1),
(5, 'helwanlab', 'Egypt', 'Cairo', 'Helwan', '11432', '01234567891', 'ph@phphph.com', 'https://stackoverflow.com/123', '/hospital/media/scan0006.jpg', 'admin', 'As123123123', '2019-05-28', NULL, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `patient_patient`
--

CREATE TABLE `patient_patient` (
  `id` int(11) NOT NULL,
  `Emergency_contact` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `QR_code` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Disability_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Height` double NOT NULL,
  `weight` double NOT NULL,
  `Blood_type` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Chronic_diseases` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Patient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `patient_patient`
--

INSERT INTO `patient_patient` (`id`, `Emergency_contact`, `QR_code`, `Disability_status`, `Height`, `weight`, `Blood_type`, `Chronic_diseases`, `Patient_id`) VALUES
(1, '01141336724', '/media/-67-01-.png', '0', 176, 72, 'b', '0', 1),
(2, '01141336724', '/media/-59-15-.png', '0', 176, 72, 'a', '0', 3),
(4, '01114185027', '670156945', '0', 160, 100, 'a', '0', 4),
(5, '4444444444', '/media/8912345.png', '1', 166, 55, 'C', '0', 5),
(30, '01288456383', '/patient/media/0101697.png', 'none', 170, 60, 'O+', 'none', 37),
(31, '01288456383', '/patient/media/0101697.png', 'none', 170, 70, 'O+', 'none', 38),
(32, '01234567898', '/patient/media/8912345.png', 'none', 170, 70, 'O+', 'none', 39),
(33, '01234567898', '/patient/media/0101697.png', 'disabled', 176, 65, 'O+', 'have', 40),
(34, '01234567898', '/patient/media/8912345.png', 'disabled', 180, 55, 'O+', 'have', 47);

-- --------------------------------------------------------

--
-- Table structure for table `patient_temp_register`
--

CREATE TABLE `patient_temp_register` (
  `id` int(11) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `patient_temp_register`
--

INSERT INTO `patient_temp_register` (`id`, `email`, `password`) VALUES
(5, 'noranyahia64@gmail.com', 'argon2$argon2i$v=19$m=512,t=2,p=2$OHpldWJ3UEJjbnoy$uso2nnLQ5HtEC6k8i/T8MA'),
(9, 'teha20@gmail.com', 'argon2$argon2i$v=19$m=512,t=2,p=2$d1ZIbm9YSnhraklC$Z4LNu5Fg7yxu+SDMoheZMA');

-- --------------------------------------------------------

--
-- Table structure for table `patient_user`
--

CREATE TABLE `patient_user` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `middle_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `street` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `zip_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `home_phone_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `work_phone_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Date_of_birth` date NOT NULL,
  `marital_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Child_num` int(11) NOT NULL,
  `email_1` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email_2` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Nationality` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Profile_picture` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Job_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Job_organization` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Jop_place` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Ssn` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Ssn_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `New_Password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `SSN_Picture` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `User_type` int(11) NOT NULL,
  `Create_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `patient_user`
--

INSERT INTO `patient_user` (`user_id`, `first_name`, `middle_name`, `last_name`, `gender`, `country`, `state`, `city`, `street`, `zip_code`, `phone_number`, `home_phone_number`, `work_phone_number`, `Date_of_birth`, `marital_status`, `Child_num`, `email_1`, `email_2`, `Nationality`, `Profile_picture`, `Job_name`, `Job_organization`, `Jop_place`, `Ssn`, `Ssn_id`, `New_Password`, `SSN_Picture`, `User_type`, `Create_date`) VALUES
(1, 'abdelfatah', 'ramadan', 'abdelfatah', '1', 'egypt', 'cairo', 'helwan', 'mansour', '11714', '01141336724', '0226527189', '0226527189', '1996-02-11', 'maried', 0, 'tteha43@gmail.com', 'tteha22@gmail.com', 'egyption', '/media/56627487_424872361613948_6842597189949063168_n(1).jpg', 'developer', 'orange', 'cairo', '1-23-45-67-01-569-44', '670156944', 'argon2$argon2i$v=19$m=512,t=2,p=2$VzVnSE1VR25BVjl2$JnBnHMJyrkTMFV+dk98ing', '/media/V2%20english.jpg', 1, '2019-04-06 02:44:29.525165'),
(3, 'omar', 'gamal', 'lhzy', '1', 'egypt', 'cairo', 'helwan', 'mansour', '11714', '01141336724', '0226527189', '0226527189', '1996-02-08', 'married', 2, 'tteha44@gmail.com', 'tteha42@gmail.com', 'egypt', '/media/56627487_424872361613948_6842597189949063168_n(1)_IHaTRRq.jpg', 'developer', 'orange', 'cairo', '1-88-55-59-15-250-89', '1525089', 'argon2$argon2i$v=19$m=512,t=2,p=2$MzJHa1FnY1lJVHpG$7MZO1a9C8deyqjlF0dB31Q', '/media/56582216_2270646636527679_1629244269770309632_n_AHY7dYV.jpg', 1, '2019-04-06 17:33:45.152231'),
(4, 'ali', 'Gamal', 'Tamer', 'female', 'Egypt', 'cairo', 'Abden', 'salah salam', '123456789', '115348949', '02255468', '02154848', '2019-04-08', 'married', 5, 'ahmed@gmail.com', 'ahmed2@gmail.com', 'egyption', '/patient/media/51579866_815607482125333_2512201945674940416_n.png', 'doctor', 'hospital', 'maadi', '12345679588', '0101697', 'argon2$argon2i$v=19$m=512,t=2,p=2$VnpnNWZneUFIaWMy$jepjYOTCg4QnobYMGYQ+2w', '/hospital/media/1469734741_427_105379_13724820_10210600534707798_4652159112252170220_o1_W5YKF9j.jpg', 2, '2019-04-08 09:24:08.662711'),
(5, 'omargamal', 'lahzyahmed', 'tamerhossny', 'male', 'hemalaya', 'cairo', 'maddi', 'salahsalam', '12345', '20516615778', '1153489497', '1153489495', '1990-02-01', 'single', 5, 'hamed@gmail.com', 'hamed2@gmail.com', 'maddi', '/media/51579866_815607482125333_2512201945674940416_n_8jfw3D6.png', 'doctor', 'hospital', 'maadi', '12345678912346', '8912347', 'argon2$argon2i$v=19$m=512,t=2,p=2$OUdLY1dvT2ViaGNr$AVAaf6Iyo4/3N3GGJunE/A', '/media/Addclinic_ukBJ2AD.jpg', 1, '2019-04-08 12:23:43.740586'),
(37, 'abdullah', 'muhammed', 'bbbbbbbbbbbb', 'male', 'egypt', 'cairo', 'helwan', 'elmahatta', '11721', '01288456383', '01288456383', '01288456383', '1996-12-12', 'single', 0, 'a@body.com', 'a@body.com', 'egyption', '/patient/media/45200989_2469934389687943_3172656873715269632_n.jpg', 'programmer', 'asasaaaaaaaaaaa', 'smartvallage', '29612120101698', '0101696', 'argon2$argon2i$v=19$m=512,t=2,p=2$MWVVQVlqWUE5a1Ey$usbAHrf1PNvJjDxonJQvqw', '/patient/media/45200989_2469934389687943_3172656873715269632_n_ceu7OCv.jpg', 1, '2019-04-11 18:58:11.469147'),
(38, 'abdullah', 'muhammed', 'kamal', 'male', 'egypt', 'cairo', 'helwan', 'elmahatta', '11721', '01288456383', '01288456383', '01288456383', '1996-12-12', 'single', 0, 'abdullah.mk96@yahoo.com', 'a@body.com', 'egyption', '/patient/media/53633581_2278774658930603_1978313927116718080_o_GkQGbzb.jpg', 'programmer', 'google', 'smartvallage', '29612120101696', '0101695', 'argon2$argon2i$v=19$m=512,t=2,p=2$cHNCZllBTDM1ZG1P$NhENyF54YyMFgC7wNDPa0g', '/patient/media/53633581_2278774658930603_1978313927116718080_o_GkQGbzb.jpg', 1, '2019-04-12 14:12:40.393969'),
(39, 'ali', 'mohamed', 'ali', 'male', 'egypt', 'cairo', 'helwan', 'maadi', '11732', '01234567891', '01234567891', '01234567894', '2019-05-05', 'married', 1, 'ali@gmail.com', 'ali2@gmail.com', 'egypt', '/patient/media/IMG_20190212_115352.jpg', 'doctor', 'hospital', 'helwan', '12345678912345', '8912344', 'argon2$argon2i$v=19$m=512,t=2,p=2$OFE1OEFqcHhDblVi$PRh6xUpuGgAaixSOzum7Gw', '/hospital/media/1469734741_427_105379_13724820_10210600534707798_4652159112252170220_o1_sC8cC8X.jpg', 2, '2019-05-17 03:36:27.256668'),
(40, 'abdullah', 'mohamed', 'ali', 'male', 'egypt', 'cairo', 'helwan', 'maadi', '11732', '01234567891', '01234567891', '01234567894', '1996-12-12', 'single', 0, 'abdullah.mk@yahoo.com', 'ali2@gmail.com', 'egyption', '/patient/media/IMG_20190212_115352.jpg', 'doctor', 'hospital', 'helwan', '29612120101697', '0101691', 'argon2$argon2i$v=19$m=512,t=2,p=2$eDJOUTVXanBIZDRR$1+S8wrY3RMYdnVbGdYfz6A', '/patient/media/2019-05-01_234414.png', 1, '2019-05-20 14:55:12.356652'),
(46, 'ali', 'mohamed', 'hassan', 'male', 'egypt', 'cairo', 'helwan', 'maadi', '11732', '01234567891', '01234567891', '01234567894', '2019-05-01', 'single', 0, 'b@b.com', 'ali2@gmail.com', 'egyption', '/hospital/media/IMG_20190212_115352.jpg', 'doctor', 'hospital', 'helwan', '30407040103101', '0103101', 'argon2$argon2i$v=19$m=512,t=2,p=2$OFE1OEFqcHhDblVi$PRh6xUpuGgAaixSOzum7Gw', '/hospital/media/1469734741_427_105379_13724820_10210600534707798_4652159112252170220_o1.jpg', 2, '2019-05-22 05:17:10.745846'),
(47, 'abdullah', 'mohamed', 'ali', 'male', 'egypt', 'cairo', 'helwan', 'maadi', '11732', '01234567891', '01234567891', '01234567894', '1999-05-05', 'single', 0, 'max@gmail.com', 'ali2@gmail.com', 'egyption', '/patient/media/45200989_2469934389687943_3172656873715269632_n_R2QP9cH.jpg', 'doctor', 'hospital', 'helwan', '12345678912345', '8912345', 'argon2$argon2i$v=19$m=512,t=2,p=2$OUdLY1dvT2ViaGNr$AVAaf6Iyo4/3N3GGJunE/A', '/patient/media/%D8%AA%D9%85%D8%A8%D8%A7%D8%AA%D9%83%20%D8%AA%D9%85%D8%A8%20%D8%A7%D9%83%D8%AA%D8%B1%', 1, '2019-05-27 09:20:20.932753');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `doctor_all_analytics`
--
ALTER TABLE `doctor_all_analytics`
  ADD PRIMARY KEY (`analytics_id`);

--
-- Indexes for table `doctor_all_chronic`
--
ALTER TABLE `doctor_all_chronic`
  ADD PRIMARY KEY (`chronic_id`);

--
-- Indexes for table `doctor_all_medicine`
--
ALTER TABLE `doctor_all_medicine`
  ADD PRIMARY KEY (`medicine_id`);

--
-- Indexes for table `doctor_all_rays`
--
ALTER TABLE `doctor_all_rays`
  ADD PRIMARY KEY (`ray_id`);

--
-- Indexes for table `doctor_doctor`
--
ALTER TABLE `doctor_doctor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_doctor_Doc_id_49b18e85_fk_patient_user_user_id` (`Doc_id`),
  ADD KEY `doctor_doctor_clinic_id_5ccb0b3f_fk_hospital_organization_org_id` (`clinic_id`),
  ADD KEY `doctor_doctor_hospital_id_90495d0c_fk_hospital_hospital_h_id` (`hospital_id`);

--
-- Indexes for table `doctor_multi_analytics`
--
ALTER TABLE `doctor_multi_analytics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_multi_analyti_P_A_id_45277bd3_fk_doctor_pa` (`P_A_id`),
  ADD KEY `doctor_multi_analyti_report_id_c1aacb18_fk_doctor_re` (`report_id`);

--
-- Indexes for table `doctor_multi_chronic`
--
ALTER TABLE `doctor_multi_chronic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_multi_chronic_P_C_id_73ec80eb_fk_doctor_pa` (`P_C_id`),
  ADD KEY `doctor_multi_chronic_report_id_5e998a28_fk_doctor_report_report` (`report_id`);

--
-- Indexes for table `doctor_multi_medecines`
--
ALTER TABLE `doctor_multi_medecines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_multi_medecin_P_M_id_32dacdfa_fk_doctor_pa` (`P_M_id`),
  ADD KEY `doctor_multi_medecin_report_id_aff71713_fk_doctor_re` (`report_id`);

--
-- Indexes for table `doctor_multi_rays`
--
ALTER TABLE `doctor_multi_rays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_multi_rays_P_R_id_b584fe56_fk_doctor_patient_rays_P_R_id` (`P_R_id`),
  ADD KEY `doctor_multi_rays_report_id_ee51a2b2_fk_doctor_report_report` (`report_id`);

--
-- Indexes for table `doctor_patient_analytics`
--
ALTER TABLE `doctor_patient_analytics`
  ADD PRIMARY KEY (`P_A_id`),
  ADD KEY `doctor_patient_analy_analy_id_3a48894e_fk_doctor_al` (`analy_id`),
  ADD KEY `doctor_patient_analytics_pat_id_b7c1d6d5_fk_patient_patient_id` (`pat_id`),
  ADD KEY `doctor_patient_analy_lab_id_36ab6a75_fk_hospital_` (`lab_id`);

--
-- Indexes for table `doctor_patient_chronic`
--
ALTER TABLE `doctor_patient_chronic`
  ADD PRIMARY KEY (`P_C_id`),
  ADD KEY `doctor_patient_chron_chr_id_720c382a_fk_doctor_al` (`chr_id`),
  ADD KEY `doctor_patient_chronic_pat_id_e5d074e9_fk_patient_patient_id` (`pat_id`);

--
-- Indexes for table `doctor_patient_medicine`
--
ALTER TABLE `doctor_patient_medicine`
  ADD PRIMARY KEY (`P_M_id`),
  ADD KEY `doctor_patient_medic_pharmacy_id_2a3706e6_fk_hospital_` (`pharmacy_id`),
  ADD KEY `doctor_patient_medic_med_id_3c2960de_fk_doctor_al` (`med_id`),
  ADD KEY `doctor_patient_medicine_pat_id_640f0e4c_fk_patient_patient_id` (`pat_id`);

--
-- Indexes for table `doctor_patient_rays`
--
ALTER TABLE `doctor_patient_rays`
  ADD PRIMARY KEY (`P_R_id`),
  ADD KEY `doctor_patient_rays_pat_id_1abc666b_fk_patient_patient_id` (`pat_id`),
  ADD KEY `doctor_patient_rays_ray_id_3e37ea33_fk_doctor_all_rays_ray_id` (`ray_id`),
  ADD KEY `doctor_patient_rays_lab_id_4358513e_fk_hospital_` (`lab_id`);

--
-- Indexes for table `doctor_prescription`
--
ALTER TABLE `doctor_prescription`
  ADD PRIMARY KEY (`prescription_id`);

--
-- Indexes for table `doctor_report`
--
ALTER TABLE `doctor_report`
  ADD PRIMARY KEY (`report`),
  ADD KEY `doctor_report_clinic_id_46a1b0cb_fk_hospital_organization_org_id` (`clinic_id`),
  ADD KEY `doctor_report_doctor_id_a4a9ecfa_fk_doctor_doctor_id` (`doctor_id`),
  ADD KEY `doctor_report_hospital_id_e207a1ab_fk_hospital_hospital_h_id` (`hospital_id`),
  ADD KEY `doctor_report_patient_id_9912cbae_fk_patient_patient_id` (`patient_id`),
  ADD KEY `doctor_report_prescription_id_2b885092_fk_doctor_pr` (`prescription_id`);

--
-- Indexes for table `hospital_hospital`
--
ALTER TABLE `hospital_hospital`
  ADD PRIMARY KEY (`h_id`);

--
-- Indexes for table `hospital_organization`
--
ALTER TABLE `hospital_organization`
  ADD PRIMARY KEY (`org_id`),
  ADD KEY `hospital_organizatio_hospital_id_4ed97056_fk_hospital_` (`hospital_id`);

--
-- Indexes for table `patient_patient`
--
ALTER TABLE `patient_patient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_patient_Patient_id_56f106d0_fk_patient_user_user_id` (`Patient_id`);

--
-- Indexes for table `patient_temp_register`
--
ALTER TABLE `patient_temp_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_user`
--
ALTER TABLE `patient_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `doctor_all_analytics`
--
ALTER TABLE `doctor_all_analytics`
  MODIFY `analytics_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `doctor_all_chronic`
--
ALTER TABLE `doctor_all_chronic`
  MODIFY `chronic_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_all_medicine`
--
ALTER TABLE `doctor_all_medicine`
  MODIFY `medicine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `doctor_all_rays`
--
ALTER TABLE `doctor_all_rays`
  MODIFY `ray_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `doctor_doctor`
--
ALTER TABLE `doctor_doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `doctor_multi_analytics`
--
ALTER TABLE `doctor_multi_analytics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `doctor_multi_chronic`
--
ALTER TABLE `doctor_multi_chronic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_multi_medecines`
--
ALTER TABLE `doctor_multi_medecines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `doctor_multi_rays`
--
ALTER TABLE `doctor_multi_rays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `doctor_patient_analytics`
--
ALTER TABLE `doctor_patient_analytics`
  MODIFY `P_A_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `doctor_patient_chronic`
--
ALTER TABLE `doctor_patient_chronic`
  MODIFY `P_C_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_patient_medicine`
--
ALTER TABLE `doctor_patient_medicine`
  MODIFY `P_M_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `doctor_patient_rays`
--
ALTER TABLE `doctor_patient_rays`
  MODIFY `P_R_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `doctor_prescription`
--
ALTER TABLE `doctor_prescription`
  MODIFY `prescription_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `doctor_report`
--
ALTER TABLE `doctor_report`
  MODIFY `report` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `hospital_hospital`
--
ALTER TABLE `hospital_hospital`
  MODIFY `h_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hospital_organization`
--
ALTER TABLE `hospital_organization`
  MODIFY `org_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `patient_patient`
--
ALTER TABLE `patient_patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `patient_temp_register`
--
ALTER TABLE `patient_temp_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `patient_user`
--
ALTER TABLE `patient_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `doctor_doctor`
--
ALTER TABLE `doctor_doctor`
  ADD CONSTRAINT `doctor_doctor_Doc_id_49b18e85_fk_patient_user_user_id` FOREIGN KEY (`Doc_id`) REFERENCES `patient_user` (`user_id`),
  ADD CONSTRAINT `doctor_doctor_clinic_id_5ccb0b3f_fk_hospital_organization_org_id` FOREIGN KEY (`clinic_id`) REFERENCES `hospital_organization` (`org_id`),
  ADD CONSTRAINT `doctor_doctor_hospital_id_90495d0c_fk_hospital_hospital_h_id` FOREIGN KEY (`hospital_id`) REFERENCES `hospital_hospital` (`h_id`);

--
-- Constraints for table `doctor_multi_analytics`
--
ALTER TABLE `doctor_multi_analytics`
  ADD CONSTRAINT `doctor_multi_analyti_P_A_id_45277bd3_fk_doctor_pa` FOREIGN KEY (`P_A_id`) REFERENCES `doctor_patient_analytics` (`p_a_id`),
  ADD CONSTRAINT `doctor_multi_analyti_report_id_c1aacb18_fk_doctor_re` FOREIGN KEY (`report_id`) REFERENCES `doctor_report` (`report`);

--
-- Constraints for table `doctor_multi_chronic`
--
ALTER TABLE `doctor_multi_chronic`
  ADD CONSTRAINT `doctor_multi_chronic_P_C_id_73ec80eb_fk_doctor_pa` FOREIGN KEY (`P_C_id`) REFERENCES `doctor_patient_chronic` (`p_c_id`),
  ADD CONSTRAINT `doctor_multi_chronic_report_id_5e998a28_fk_doctor_report_report` FOREIGN KEY (`report_id`) REFERENCES `doctor_report` (`report`);

--
-- Constraints for table `doctor_multi_medecines`
--
ALTER TABLE `doctor_multi_medecines`
  ADD CONSTRAINT `doctor_multi_medecin_P_M_id_32dacdfa_fk_doctor_pa` FOREIGN KEY (`P_M_id`) REFERENCES `doctor_patient_medicine` (`p_m_id`),
  ADD CONSTRAINT `doctor_multi_medecin_report_id_aff71713_fk_doctor_re` FOREIGN KEY (`report_id`) REFERENCES `doctor_report` (`report`);

--
-- Constraints for table `doctor_multi_rays`
--
ALTER TABLE `doctor_multi_rays`
  ADD CONSTRAINT `doctor_multi_rays_P_R_id_b584fe56_fk_doctor_patient_rays_P_R_id` FOREIGN KEY (`P_R_id`) REFERENCES `doctor_patient_rays` (`p_r_id`),
  ADD CONSTRAINT `doctor_multi_rays_report_id_ee51a2b2_fk_doctor_report_report` FOREIGN KEY (`report_id`) REFERENCES `doctor_report` (`report`);

--
-- Constraints for table `doctor_patient_analytics`
--
ALTER TABLE `doctor_patient_analytics`
  ADD CONSTRAINT `doctor_patient_analy_analy_id_3a48894e_fk_doctor_al` FOREIGN KEY (`analy_id`) REFERENCES `doctor_all_analytics` (`analytics_id`),
  ADD CONSTRAINT `doctor_patient_analy_lab_id_36ab6a75_fk_hospital_` FOREIGN KEY (`lab_id`) REFERENCES `hospital_organization` (`org_id`),
  ADD CONSTRAINT `doctor_patient_analytics_pat_id_b7c1d6d5_fk_patient_patient_id` FOREIGN KEY (`pat_id`) REFERENCES `patient_patient` (`id`);

--
-- Constraints for table `doctor_patient_chronic`
--
ALTER TABLE `doctor_patient_chronic`
  ADD CONSTRAINT `doctor_patient_chron_chr_id_720c382a_fk_doctor_al` FOREIGN KEY (`chr_id`) REFERENCES `doctor_all_chronic` (`chronic_id`),
  ADD CONSTRAINT `doctor_patient_chronic_pat_id_e5d074e9_fk_patient_patient_id` FOREIGN KEY (`pat_id`) REFERENCES `patient_patient` (`id`);

--
-- Constraints for table `doctor_patient_medicine`
--
ALTER TABLE `doctor_patient_medicine`
  ADD CONSTRAINT `doctor_patient_medic_med_id_3c2960de_fk_doctor_al` FOREIGN KEY (`med_id`) REFERENCES `doctor_all_medicine` (`medicine_id`),
  ADD CONSTRAINT `doctor_patient_medic_pharmacy_id_2a3706e6_fk_hospital_` FOREIGN KEY (`pharmacy_id`) REFERENCES `hospital_organization` (`org_id`),
  ADD CONSTRAINT `doctor_patient_medicine_pat_id_640f0e4c_fk_patient_patient_id` FOREIGN KEY (`pat_id`) REFERENCES `patient_patient` (`id`);

--
-- Constraints for table `doctor_patient_rays`
--
ALTER TABLE `doctor_patient_rays`
  ADD CONSTRAINT `doctor_patient_rays_lab_id_4358513e_fk_hospital_` FOREIGN KEY (`lab_id`) REFERENCES `hospital_organization` (`org_id`),
  ADD CONSTRAINT `doctor_patient_rays_pat_id_1abc666b_fk_patient_patient_id` FOREIGN KEY (`pat_id`) REFERENCES `patient_patient` (`id`),
  ADD CONSTRAINT `doctor_patient_rays_ray_id_3e37ea33_fk_doctor_all_rays_ray_id` FOREIGN KEY (`ray_id`) REFERENCES `doctor_all_rays` (`ray_id`);

--
-- Constraints for table `doctor_report`
--
ALTER TABLE `doctor_report`
  ADD CONSTRAINT `doctor_report_clinic_id_46a1b0cb_fk_hospital_organization_org_id` FOREIGN KEY (`clinic_id`) REFERENCES `hospital_organization` (`org_id`),
  ADD CONSTRAINT `doctor_report_doctor_id_a4a9ecfa_fk_doctor_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctor_doctor` (`id`),
  ADD CONSTRAINT `doctor_report_hospital_id_e207a1ab_fk_hospital_hospital_h_id` FOREIGN KEY (`hospital_id`) REFERENCES `hospital_hospital` (`h_id`),
  ADD CONSTRAINT `doctor_report_patient_id_9912cbae_fk_patient_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient_patient` (`id`),
  ADD CONSTRAINT `doctor_report_prescription_id_2b885092_fk_doctor_pr` FOREIGN KEY (`prescription_id`) REFERENCES `doctor_prescription` (`prescription_id`);

--
-- Constraints for table `hospital_organization`
--
ALTER TABLE `hospital_organization`
  ADD CONSTRAINT `hospital_organizatio_hospital_id_4ed97056_fk_hospital_` FOREIGN KEY (`hospital_id`) REFERENCES `hospital_hospital` (`h_id`);

--
-- Constraints for table `patient_patient`
--
ALTER TABLE `patient_patient`
  ADD CONSTRAINT `patient_patient_Patient_id_56f106d0_fk_patient_user_user_id` FOREIGN KEY (`Patient_id`) REFERENCES `patient_user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
