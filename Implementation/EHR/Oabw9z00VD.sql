-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 12, 2019 at 04:51 PM
-- Server version: 8.0.13-4
-- PHP Version: 7.2.15-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Oabw9z00VD`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL
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
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL
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
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'argon2$argon2i$v=19$m=512,t=2,p=2$U01QWlpWTHJIWjJC$/K+dHhn8T2qSQoX1OVjJQA', '2019-04-08 05:56:56.259205', 1, 'mohamedashraf', '', '', 'm7md.mai1997@gmail.com', 1, 1, '2019-04-08 05:56:22.917350'),
(2, 'argon2$argon2i$v=19$m=512,t=2,p=2$VVhWMUZYSEJEQkRN$H9wHc22oxrxE4/lAghaNNw', '2019-04-09 12:06:06.224555', 1, 'omar', '', '', 'oma55r@gmail.com', 1, 1, '2019-04-08 09:19:01.072533');

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
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
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
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL
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
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
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
(25, 'doctor', '0007_auto_20190412_0534', '2019-04-12 03:34:33.856849');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('28w3ahhlt2jkr047l3hbrea80f5kfwlu', 'N2VjMDg5YjdkYTFmNTRiMTQ3MjI2MzZiY2VjNTEwY2U1OTBkOWY2MTp7InVzZXJfdHlwZSI6InJlZ2lzdGVyZWRfcGF0aWVudCIsInVzZXJfVCI6MSwicGF0aWVudF9pZCI6NX0=', '2019-04-26 16:48:20.352244'),
('8b5s51mkoexy5ux0i8yl28s614yamjy9', 'MDZhNzZmMDM5OGEwNGMyMzgxNWFhMDg1NmQ3ZDU0ZDQ2Zjc0ZGMzYjp7InBhdGllbnRfdGVtcF9pZCI6NSwidXNlcl90eXBlIjoidGVtcCJ9', '2019-04-24 20:46:35.110333'),
('8g7qrp1qrd1mystz6u72p1yo135zovzf', 'MDU2NmQzYTAxZWM5NTNkYjEzM2I0MjJmMTNhY2ZiY2VmOGUyYmE2Njp7Im9yZ19pZCI6MSwicGF0aWVudF9pZCI6NH0=', '2019-04-24 15:48:55.868111'),
('g2seai63ira3qk7r0hwp8c6iefk20ix5', 'MDU2NmQzYTAxZWM5NTNkYjEzM2I0MjJmMTNhY2ZiY2VmOGUyYmE2Njp7Im9yZ19pZCI6MSwicGF0aWVudF9pZCI6NH0=', '2019-04-24 01:23:21.459569'),
('hrfdd8s2lzl7shulrlpn3yngg9bn1i13', 'Y2Y1ZjhjYmQ4NjI5ZWQzMDViNTg3YmRmMTJhMTVmNzM0Njk5YTkzOTp7InVzZXJfVCI6MiwiRG9jdG9yX1BhdGlhbnRfSUQiOjUsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0MjEyMGRjYWI4MDlkMDU0N2M1ODRjNTQ3YjA4MDU0ZGM4YTFlNDJjIiwidXNlcl90eXBlIjoicmVnaXN0ZXJlZF9wYXRpZW50In0=', '2019-04-26 11:08:33.152575'),
('ieuxfscr8qmtn78q1zcec6p77vj7qnan', 'MTI2NTUzOWI1N2VmNjhhMTM0MDM5MmU5YjU2MjkwNDljZmJiZWFjYzp7InBhdGllbnRfdGVtcF9pZCI6MywidXNlcl90eXBlIjoicmVnaXN0ZXJlZF9wYXRpZW50In0=', '2019-04-20 17:45:43.065830'),
('nllrevr3tcvkjyya9762xpt909afk9ig', 'YWMxNjc1MmVhNzE1ZDMxNDQ1ZDcxNmZhZDI4N2JkZDM5Y2M1NDI3YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhOGEyNDg4NjZkZWI2YmJiZjJmN2I2MzdjYjE2Yjg4ZjE1ODFkOGI1In0=', '2019-04-22 05:56:56.709188'),
('o2yh1enqdj39wd5vona6rqvzkfn0hrf7', 'ZTBhOWZhMDMzODBiM2MwNjZiYTA4YzVmZGQ4MjljYzE2N2ZmMzRiMDp7ImRvY3Rvcl9pZCI6MSwidXNlcl9UIjoyLCJEb2N0b3JfUGF0aWFudF9JRCI6NX0=', '2019-04-25 10:43:28.985927'),
('onj07u17ndcbvisk5fcepiaii3z9xsn7', 'NmUwYmZmMjIzZDk0OWZlNjJmYzAyNDkyYTJmMGQ3NTcwMjQ2NzM2NDp7InBhdGllbnREYXRhIjo0LCJwaGFybWFjeUlkIjoxLCJzc25faWQiOiIwMTAxNjk3IiwicGF0aWVudF90ZW1wX2lkIjoyLCJ1c2VyX3R5cGUiOiJ0ZW1wIiwib3JnX2lkIjoxLCJwYXRpZW50X2lkIjo0fQ==', '2019-04-24 00:48:08.115476'),
('qma5npq03s28ly2xrojsdmnek21e16jj', 'YWJjYzdlNDc1ZTRiMDgxY2FkNzc5MmY0ODdlNWNiMGJkNWExMWI3YTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0MjEyMGRjYWI4MDlkMDU0N2M1ODRjNTQ3YjA4MDU0ZGM4YTFlNDJjIiwidXNlcl9UIjoyLCJwYXRpZW50X3RlbXBfaWQiOjQsInVzZXJfdHlwZSI6InJlZ2lzdGVyZWRfcGF0aWVudCIsIkRvY3Rvcl9QYXRpYW50X0lEIjo1fQ==', '2019-04-22 13:15:41.924353'),
('qtg5cp1ixdmobv19si2va8w0m2pmdjss', 'MzI5N2Y5OTY3OTc5MWEzNTlkOWQ5Y2MyMjBjOTY3ZjkyYWYyZTM5ZDp7InBhdGllbnRfdGVtcF9pZCI6OSwidXNlcl90eXBlIjoicmVnaXN0ZXJlZF9wYXRpZW50IiwidXNlcl9UIjoxLCJEb2N0b3JfUGF0aWFudF9JRCI6MCwicGF0aWVudF9pZCI6NX0=', '2019-04-25 20:04:30.458595'),
('rjwh2v66cpn2ygpy5msysua1vll7s1ps', 'ZDMxMjc1OGI0N2YxYzdlZmI1NDU2NWYzNzhmOGRjNmM2NTM3NzdjNzp7InBhdGllbnREYXRhIjo0LCJwaGFybWFjeUlkIjoxfQ==', '2019-04-23 01:36:16.718851'),
('v19e1rzss544qdezrtf5ugf8o23dl8kv', 'YWU0MDYyZDRjYjM4Y2JhNTk1NTgyYWQzNWJiNzY2MjEyMzZkZDczOTp7InVzZXJfdHlwZSI6InJlZ2lzdGVyZWRfcGF0aWVudCIsInBhdGllbnRfdGVtcF9pZCI6MSwicGF0aWVudF9pZCI6MX0=', '2019-04-20 03:12:18.796099'),
('wgvnnfb8agayf3tojq2124ovx2pi1yjq', 'NTQyN2ZhMmI5YTdmYzVkNzdlNWE5YjRiY2Q4MTU0YzIyZjAzZjcwZjp7Im9yZ19pZCI6MSwicGF0aWVudF90ZW1wX2lkIjoxMCwidXNlcl90eXBlIjoicmVnaXN0ZXJlZF9wYXRpZW50IiwidXNlcl9pZCI6Mzh9', '2019-04-26 14:30:10.682261');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_all_analytics`
--

CREATE TABLE `doctor_all_analytics` (
  `analytics_id` int(11) NOT NULL,
  `analytics_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL
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
  `chronic_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_all_medicine`
--

CREATE TABLE `doctor_all_medicine` (
  `medicine_id` int(11) NOT NULL,
  `medicine_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctor_all_medicine`
--

INSERT INTO `doctor_all_medicine` (`medicine_id`, `medicine_name`) VALUES
(1, 'antibiotic'),
(2, 'oplex');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_all_rays`
--

CREATE TABLE `doctor_all_rays` (
  `ray_id` int(11) NOT NULL,
  `ray_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctor_all_rays`
--

INSERT INTO `doctor_all_rays` (`ray_id`, `ray_name`) VALUES
(1, 'Arm Rays'),
(2, 'Leg Rays');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_doctor`
--

CREATE TABLE `doctor_doctor` (
  `id` int(11) NOT NULL,
  `Registration_num` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Specialization` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Registration_date` datetime(6) NOT NULL,
  `licence` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `Last_date_payment` date NOT NULL,
  `End_date` date NOT NULL,
  `Specialization_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `University` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Work_place` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Sub_syndicate` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `General_secretary` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `Working_till` time(6) NOT NULL,
  `Graduation_year` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `doc_rate` int(11) NOT NULL,
  `Doc_id` int(11) NOT NULL,
  `clinic_id` int(11) DEFAULT NULL,
  `hospital_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctor_doctor`
--

INSERT INTO `doctor_doctor` (`id`, `Registration_num`, `Specialization`, `Registration_date`, `licence`, `Last_date_payment`, `End_date`, `Specialization_type`, `University`, `Work_place`, `Sub_syndicate`, `General_secretary`, `Working_till`, `Graduation_year`, `doc_rate`, `Doc_id`, `clinic_id`, `hospital_id`) VALUES
(1, '1', 'heart', '2019-04-08 09:41:16.882833', '123456', '2019-04-08', '2019-04-08', 'heart', 'helwan', 'maddi', 'sadasd', 'asdasd', '11:41:16.883853', '2019', 7, 4, NULL, NULL);

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
(1, 4, 1),
(2, 5, 1),
(3, 6, 15),
(4, 7, 16);

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
(1, 6, 1),
(2, 9, 1),
(3, 10, 1),
(4, 11, 7),
(5, 12, 8),
(6, 13, 1),
(7, 14, 1),
(8, 15, 9),
(9, 17, 14),
(10, 18, 14),
(11, 19, 15),
(12, 20, 16);

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
(1, 1, 1),
(2, 3, 1),
(3, 4, 1),
(4, 5, 1),
(5, 6, 15),
(6, 7, 16);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_patient_analytics`
--

CREATE TABLE `doctor_patient_analytics` (
  `P_A_id` int(11) NOT NULL,
  `analytics_result` longtext COLLATE utf8_unicode_ci NOT NULL,
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
(7, '', 2, NULL, 5);

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
(18, 5, 10, 2, 5, NULL),
(19, 5, 10, 1, 5, NULL),
(20, 5, 10, 1, 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_patient_rays`
--

CREATE TABLE `doctor_patient_rays` (
  `P_R_id` int(11) NOT NULL,
  `rays_result` longtext COLLATE utf8_unicode_ci NOT NULL,
  `lab_id` int(11) DEFAULT NULL,
  `pat_id` int(11) NOT NULL,
  `ray_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctor_patient_rays`
--

INSERT INTO `doctor_patient_rays` (`P_R_id`, `rays_result`, `lab_id`, `pat_id`, `ray_id`) VALUES
(1, '/lab/media/cv.pdf', 1, 5, 2),
(2, '/lab/media/Abdelfatah-Ramadan.pdf', 1, 4, 2),
(3, '/lab/media/53633581_2278774658930603_1978313927116718080_o_RY6onBM.jpg', 1, 5, 2),
(4, '/lab/media/53633581_2278774658930603_1978313927116718080_o_OYnF0wQ.jpg', 1, 5, 1),
(5, '/lab/media/45200989_2469934389687943_3172656873715269632_n_0V52SIq.jpg', 1, 5, 2),
(6, '/lab/media/53633581_2278774658930603_1978313927116718080_o_OYnF0wQ.jpg', 1, 5, 1),
(7, '', NULL, 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_prescription`
--

CREATE TABLE `doctor_prescription` (
  `prescription_id` int(11) NOT NULL,
  `Disease_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Disease_level` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Disease_disc` longtext COLLATE utf8_unicode_ci NOT NULL,
  `Doctor_signature` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
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
(18, 'heartattack', '8', 'vgdfgdfgdfgfdgfdg', 'ahmed', '2019-04-10 14:01:17.000000'),
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
(44, 'heartattack', '10', 'gvgvghvhvghvh', 'ahmed', '2019-04-10 14:01:17.000000');

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
(1, '2019-04-09 12:15:53.554344', NULL, 1, NULL, 5, 1),
(2, '2019-04-09 14:01:59.106849', NULL, 1, NULL, 5, 2),
(3, '2019-04-09 17:40:11.472072', NULL, 1, NULL, 5, 31),
(4, '2019-04-09 17:41:39.261936', NULL, 1, NULL, 5, 32),
(5, '2019-04-09 18:06:25.880175', NULL, 1, NULL, 5, 33),
(6, '2019-04-11 09:20:09.794128', NULL, 1, NULL, 5, 34),
(7, '2019-04-11 09:21:31.701823', NULL, 1, NULL, 5, 35),
(8, '2019-04-11 09:41:35.343125', NULL, 1, NULL, 5, 36),
(9, '2019-04-11 10:50:59.833987', NULL, 1, NULL, 5, 37),
(10, '2019-04-11 11:36:17.987333', NULL, 1, NULL, 5, 38),
(11, '2019-04-11 11:37:44.604536', NULL, 1, NULL, 5, 39),
(12, '2019-04-11 11:39:13.390109', NULL, 1, NULL, 5, 40),
(13, '2019-04-11 11:41:53.623221', NULL, 1, NULL, 5, 41),
(14, '2019-04-11 11:42:12.390535', NULL, 1, NULL, 5, 42),
(15, '2019-04-11 15:46:46.241963', NULL, 1, NULL, 5, 43),
(16, '2019-04-12 11:06:48.753832', NULL, 1, NULL, 5, 44),
(17, '2019-04-12 11:06:48.753832', NULL, 1, NULL, 30, 44);

-- --------------------------------------------------------

--
-- Table structure for table `hospital_hospital`
--

CREATE TABLE `hospital_hospital` (
  `h_id` int(11) NOT NULL,
  `h_name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `h_country` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `h_state` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `h_city` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `h_street` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `h_zipcode` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `h_phone_num` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `h_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `h_ownership` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `h_emergency_service` tinyint(1) NOT NULL,
  `h_date` date NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `website` longtext COLLATE utf8_unicode_ci NOT NULL,
  `logo` longtext COLLATE utf8_unicode_ci NOT NULL,
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
  `hr_username` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `hr_password` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` date NOT NULL,
  `hos_rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hospital_hospital`
--

INSERT INTO `hospital_hospital` (`h_id`, `h_name`, `h_country`, `h_state`, `h_city`, `h_street`, `h_zipcode`, `h_phone_num`, `h_type`, `h_ownership`, `h_emergency_service`, `h_date`, `email`, `website`, `logo`, `internal_medicine`, `cardiology`, `endocrinology`, `hematology`, `nephrology`, `surgery`, `pediatric`, `obstertics_genacology`, `ophthalmologist`, `neurology`, `Ear_nose_threat`, `urology`, `dermatology`, `hepatology`, `Radiology`, `psychiatry`, `dentistry`, `forensic_medicine`, `enatony`, `num_of_bed`, `hr_username`, `hr_password`, `creation_date`, `hos_rate`) VALUES
(1, 'elhady', 'egypt', 'helwan', 'helwan', '24 helwan', '11227', '01112554133', 'all', 'no owner', 1, '2019-04-17', 'm@m.com', 'jjjj@k.com', '', 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 1, 1, 'admin', 'admin', '2019-04-03', 5);

-- --------------------------------------------------------

--
-- Table structure for table `hospital_organization`
--

CREATE TABLE `hospital_organization` (
  `org_id` int(11) NOT NULL,
  `org_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `org_country` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `org_state` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `org_city` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `org_zipcode` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `org_phone_num` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `org_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `org_website` longtext COLLATE utf8_unicode_ci NOT NULL,
  `org_logo` longtext COLLATE utf8_unicode_ci NOT NULL,
  `hr_username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `hr_password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` date NOT NULL,
  `org_rate` int(11) NOT NULL,
  `Type` int(11) NOT NULL,
  `hospital_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hospital_organization`
--

INSERT INTO `hospital_organization` (`org_id`, `org_name`, `org_country`, `org_state`, `org_city`, `org_zipcode`, `org_phone_num`, `org_email`, `org_website`, `org_logo`, `hr_username`, `hr_password`, `creation_date`, `org_rate`, `Type`, `hospital_id`) VALUES
(1, 'aman', 'Egypt', 'cairo', 'helwan', '11722', '01114185027', 'mohamedashrafibraheem@gmail.com', 'we@we.com', 'lllll', 'admin', 'admin', '2019-04-08', 5, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `patient_patient`
--

CREATE TABLE `patient_patient` (
  `id` int(11) NOT NULL,
  `Emergency_contact` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `QR_code` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `Disability_status` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Height` double NOT NULL,
  `weight` double NOT NULL,
  `Blood_type` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `Chronic_diseases` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
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
(31, '01288456383', '/patient/media/0101697.png', 'none', 170, 70, 'O+', 'none', 38);

-- --------------------------------------------------------

--
-- Table structure for table `patient_temp_register`
--

CREATE TABLE `patient_temp_register` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL
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
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `middle_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `street` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `zip_code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `home_phone_number` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `work_phone_number` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Date_of_birth` date NOT NULL,
  `marital_status` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Child_num` int(11) NOT NULL,
  `email_1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email_2` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Nationality` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Profile_picture` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Job_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Job_organization` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Jop_place` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Ssn` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Ssn_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `New_Password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `SSN_Picture` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `User_type` int(11) NOT NULL,
  `Create_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `patient_user`
--

INSERT INTO `patient_user` (`user_id`, `first_name`, `middle_name`, `last_name`, `gender`, `country`, `state`, `city`, `street`, `zip_code`, `phone_number`, `home_phone_number`, `work_phone_number`, `Date_of_birth`, `marital_status`, `Child_num`, `email_1`, `email_2`, `Nationality`, `Profile_picture`, `Job_name`, `Job_organization`, `Jop_place`, `Ssn`, `Ssn_id`, `New_Password`, `SSN_Picture`, `User_type`, `Create_date`) VALUES
(1, 'abdelfatah', 'ramadan', 'abdelfatah', '1', 'egypt', 'cairo', 'helwan', 'mansour', '11714', '01141336724', '0226527189', '0226527189', '1996-02-11', 'maried', 0, 'tteha43@gmail.com', 'tteha22@gmail.com', 'egyption', '/media/56627487_424872361613948_6842597189949063168_n(1).jpg', 'developer', 'orange', 'cairo', '1-23-45-67-01-569-44', '670156944', 'argon2$argon2i$v=19$m=512,t=2,p=2$VzVnSE1VR25BVjl2$JnBnHMJyrkTMFV+dk98ing', '/media/V2%20english.jpg', 1, '2019-04-06 02:44:29.525165'),
(3, 'omar', 'gamal', 'lhzy', '1', 'egypt', 'cairo', 'helwan', 'mansour', '11714', '01141336724', '0226527189', '0226527189', '1996-02-08', 'married', 2, 'tteha44@gmail.com', 'tteha42@gmail.com', 'egypt', '/media/56627487_424872361613948_6842597189949063168_n(1)_IHaTRRq.jpg', 'developer', 'orange', 'cairo', '1-88-55-59-15-250-89', '1525089', 'argon2$argon2i$v=19$m=512,t=2,p=2$MzJHa1FnY1lJVHpG$7MZO1a9C8deyqjlF0dB31Q', '/media/56582216_2270646636527679_1629244269770309632_n_AHY7dYV.jpg', 1, '2019-04-06 17:33:45.152231'),
(4, 'Ahmed', 'Gamal', 'Tamer', '1', 'Egypt', 'cairo', 'Abden', 'salah salam', '123456789', '115348949', '02255468', '02154848', '2019-04-08', '12', 5, 'ahmed@gmail.com', 'ahmed2@gmail.com', 'egyption', '/patient/media/51579866_815607482125333_2512201945674940416_n.png', 'doctor', 'hospital', 'maadi', '12345679588', '1234567', 'argon2$argon2i$v=19$m=512,t=2,p=2$MzJHa1FnY1lJVHpG$7MZO1a9C8deyqjlF0dB31Q', 'Addclinic.jpg', 2, '2019-04-08 09:24:08.662711'),
(5, 'omargamal', 'lahzyahmed', 'tamerhossny', '1', 'hemalaya', 'cairo', 'maddi', 'salahsalam', '12345', '20516615778', '1153489497', '1153489495', '2019-04-10', 'single', 5, 'hamed@gmail.com', 'hamed2@gmail.com', 'maddi', '/media/51579866_815607482125333_2512201945674940416_n_8jfw3D6.png', 'doctor', 'hospital', 'maadi', '12345678912345', '8912345', 'argon2$argon2i$v=19$m=512,t=2,p=2$bGNlZUExa2x6Y1V5$AXCfKpdCgXmjvGJ2FxBu8A', '/media/Addclinic_ukBJ2AD.jpg', 1, '2019-04-08 12:23:43.740586'),
(37, 'abdullah', 'muhammed', 'bbbbbbbbbbbb', 'male', 'egypt', 'cairo', 'helwan', 'elmahatta', '11721', '01288456383', '01288456383', '01288456383', '1996-12-12', 'single', 0, 'a@body.com', 'a@body.com', 'egyption', '/patient/media/45200989_2469934389687943_3172656873715269632_n.jpg', 'programmer', 'asasaaaaaaaaaaa', 'smartvallage', '29612120101697', '0101697', 'argon2$argon2i$v=19$m=512,t=2,p=2$MWVVQVlqWUE5a1Ey$usbAHrf1PNvJjDxonJQvqw', '/patient/media/45200989_2469934389687943_3172656873715269632_n_ceu7OCv.jpg', 1, '2019-04-11 18:58:11.469147'),
(38, 'abdullah', 'muhammed', 'kamal', 'male', 'egypt', 'cairo', 'helwan', 'elmahatta', '11721', '01288456383', '01288456383', '01288456383', '1996-12-12', 'single', 0, 'abdullah.mk96@yahoo.com', 'a@body.com', 'egyption', '/patient/media/53633581_2278774658930603_1978313927116718080_o.jpg', 'programmer', 'google', 'smartvallage', '29612120101697', '0101697', 'argon2$argon2i$v=19$m=512,t=2,p=2$cHNCZllBTDM1ZG1P$NhENyF54YyMFgC7wNDPa0g', '/patient/media/53633581_2278774658930603_1978313927116718080_o_GkQGbzb.jpg', 1, '2019-04-12 14:12:40.393969');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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
  MODIFY `medicine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `doctor_all_rays`
--
ALTER TABLE `doctor_all_rays`
  MODIFY `ray_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `doctor_doctor`
--
ALTER TABLE `doctor_doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `doctor_multi_analytics`
--
ALTER TABLE `doctor_multi_analytics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `doctor_multi_chronic`
--
ALTER TABLE `doctor_multi_chronic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_multi_medecines`
--
ALTER TABLE `doctor_multi_medecines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `doctor_multi_rays`
--
ALTER TABLE `doctor_multi_rays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `doctor_patient_analytics`
--
ALTER TABLE `doctor_patient_analytics`
  MODIFY `P_A_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `doctor_patient_chronic`
--
ALTER TABLE `doctor_patient_chronic`
  MODIFY `P_C_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_patient_medicine`
--
ALTER TABLE `doctor_patient_medicine`
  MODIFY `P_M_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `doctor_patient_rays`
--
ALTER TABLE `doctor_patient_rays`
  MODIFY `P_R_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `doctor_prescription`
--
ALTER TABLE `doctor_prescription`
  MODIFY `prescription_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `doctor_report`
--
ALTER TABLE `doctor_report`
  MODIFY `report` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `hospital_hospital`
--
ALTER TABLE `hospital_hospital`
  MODIFY `h_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hospital_organization`
--
ALTER TABLE `hospital_organization`
  MODIFY `org_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `patient_patient`
--
ALTER TABLE `patient_patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `patient_temp_register`
--
ALTER TABLE `patient_temp_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `patient_user`
--
ALTER TABLE `patient_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

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
