-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2019 at 09:13 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ehr`
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
(19, 'Can add all notification', 7, 'add_allnotification'),
(20, 'Can change all notification', 7, 'change_allnotification'),
(21, 'Can delete all notification', 7, 'delete_allnotification'),
(22, 'Can add patient', 8, 'add_patient'),
(23, 'Can change patient', 8, 'change_patient'),
(24, 'Can delete patient', 8, 'delete_patient'),
(25, 'Can add rate', 9, 'add_rate'),
(26, 'Can change rate', 9, 'change_rate'),
(27, 'Can delete rate', 9, 'delete_rate'),
(28, 'Can add temp_register', 10, 'add_temp_register'),
(29, 'Can change temp_register', 10, 'change_temp_register'),
(30, 'Can delete temp_register', 10, 'delete_temp_register'),
(31, 'Can add user', 11, 'add_user'),
(32, 'Can change user', 11, 'change_user'),
(33, 'Can delete user', 11, 'delete_user'),
(34, 'Can add all_analytics', 12, 'add_all_analytics'),
(35, 'Can change all_analytics', 12, 'change_all_analytics'),
(36, 'Can delete all_analytics', 12, 'delete_all_analytics'),
(37, 'Can add all_chronic', 13, 'add_all_chronic'),
(38, 'Can change all_chronic', 13, 'change_all_chronic'),
(39, 'Can delete all_chronic', 13, 'delete_all_chronic'),
(40, 'Can add all_medicine', 14, 'add_all_medicine'),
(41, 'Can change all_medicine', 14, 'change_all_medicine'),
(42, 'Can delete all_medicine', 14, 'delete_all_medicine'),
(43, 'Can add all_rays', 15, 'add_all_rays'),
(44, 'Can change all_rays', 15, 'change_all_rays'),
(45, 'Can delete all_rays', 15, 'delete_all_rays'),
(46, 'Can add doctor', 16, 'add_doctor'),
(47, 'Can change doctor', 16, 'change_doctor'),
(48, 'Can delete doctor', 16, 'delete_doctor'),
(49, 'Can add multi_analytics', 17, 'add_multi_analytics'),
(50, 'Can change multi_analytics', 17, 'change_multi_analytics'),
(51, 'Can delete multi_analytics', 17, 'delete_multi_analytics'),
(52, 'Can add multi_chronic', 18, 'add_multi_chronic'),
(53, 'Can change multi_chronic', 18, 'change_multi_chronic'),
(54, 'Can delete multi_chronic', 18, 'delete_multi_chronic'),
(55, 'Can add multi_medecines', 19, 'add_multi_medecines'),
(56, 'Can change multi_medecines', 19, 'change_multi_medecines'),
(57, 'Can delete multi_medecines', 19, 'delete_multi_medecines'),
(58, 'Can add multi_rays', 20, 'add_multi_rays'),
(59, 'Can change multi_rays', 20, 'change_multi_rays'),
(60, 'Can delete multi_rays', 20, 'delete_multi_rays'),
(61, 'Can add patient_analytics', 21, 'add_patient_analytics'),
(62, 'Can change patient_analytics', 21, 'change_patient_analytics'),
(63, 'Can delete patient_analytics', 21, 'delete_patient_analytics'),
(64, 'Can add patient_chronic', 22, 'add_patient_chronic'),
(65, 'Can change patient_chronic', 22, 'change_patient_chronic'),
(66, 'Can delete patient_chronic', 22, 'delete_patient_chronic'),
(67, 'Can add patient_medicine', 23, 'add_patient_medicine'),
(68, 'Can change patient_medicine', 23, 'change_patient_medicine'),
(69, 'Can delete patient_medicine', 23, 'delete_patient_medicine'),
(70, 'Can add patient_rays', 24, 'add_patient_rays'),
(71, 'Can change patient_rays', 24, 'change_patient_rays'),
(72, 'Can delete patient_rays', 24, 'delete_patient_rays'),
(73, 'Can add prescription', 25, 'add_prescription'),
(74, 'Can change prescription', 25, 'change_prescription'),
(75, 'Can delete prescription', 25, 'delete_prescription'),
(76, 'Can add report', 26, 'add_report'),
(77, 'Can change report', 26, 'change_report'),
(78, 'Can delete report', 26, 'delete_report'),
(79, 'Can add hospital', 27, 'add_hospital'),
(80, 'Can change hospital', 27, 'change_hospital'),
(81, 'Can delete hospital', 27, 'delete_hospital'),
(82, 'Can add organization', 28, 'add_organization'),
(83, 'Can change organization', 28, 'change_organization'),
(84, 'Can delete organization', 28, 'delete_organization'),
(85, 'Can add predictions', 29, 'add_predictions'),
(86, 'Can change predictions', 29, 'change_predictions'),
(87, 'Can delete predictions', 29, 'delete_predictions');

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
(1, 'argon2$argon2i$v=19$m=512,t=2,p=2$VjkyeGJKalduYnRr$5zVvFWxwYd6Gb/Om4y4ShA', '2019-06-16 07:21:24.090386', 1, 'admin', '', '', 'admin@admin.com', 1, 1, '2019-06-15 10:34:19.683515'),
(2, 'argon2$argon2i$v=19$m=512,t=2,p=2$NGp2UjZnNkltaGZ5$jLz5++z4lySSTS529Dccrw', '2019-06-16 07:24:52.343867', 1, 'teha', '', '', 'tteha43@gmail.com', 1, 1, '2019-06-16 07:24:19.089520');

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
(1, '2019-06-15 10:50:40.717976', '1', 'aman@hospital.com', 1, '[{\"added\": {}}]', 27, 1),
(2, '2019-06-15 10:55:38.065445', '1', 'aman@hospital.com', 2, '[{\"changed\": {\"fields\": [\"internal_medicine\", \"cardiology\", \"endocrinology\", \"hematology\", \"obstertics_genacology\", \"ophthalmologist\", \"neurology\", \"urology\", \"hepatology\", \"psychiatry\", \"enatony\"]}}]', 27, 1),
(3, '2019-06-15 11:02:07.774269', '1', 'organization object (1)', 1, '[{\"added\": {}}]', 28, 1);

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
(12, 'doctor', 'all_analytics'),
(13, 'doctor', 'all_chronic'),
(14, 'doctor', 'all_medicine'),
(15, 'doctor', 'all_rays'),
(16, 'doctor', 'doctor'),
(17, 'doctor', 'multi_analytics'),
(18, 'doctor', 'multi_chronic'),
(19, 'doctor', 'multi_medecines'),
(20, 'doctor', 'multi_rays'),
(21, 'doctor', 'patient_analytics'),
(22, 'doctor', 'patient_chronic'),
(23, 'doctor', 'patient_medicine'),
(24, 'doctor', 'patient_rays'),
(25, 'doctor', 'prescription'),
(26, 'doctor', 'report'),
(27, 'hospital', 'hospital'),
(28, 'hospital', 'organization'),
(7, 'patient', 'allnotification'),
(8, 'patient', 'patient'),
(9, 'patient', 'rate'),
(10, 'patient', 'temp_register'),
(11, 'patient', 'user'),
(29, 'predict_risk', 'predictions'),
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
(1, 'contenttypes', '0001_initial', '2019-06-15 10:31:50.469617'),
(2, 'auth', '0001_initial', '2019-06-15 10:31:58.449953'),
(3, 'admin', '0001_initial', '2019-06-15 10:32:00.338452'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-06-15 10:32:00.418285'),
(5, 'contenttypes', '0002_remove_content_type_name', '2019-06-15 10:32:01.298171'),
(6, 'auth', '0002_alter_permission_name_max_length', '2019-06-15 10:32:02.137732'),
(7, 'auth', '0003_alter_user_email_max_length', '2019-06-15 10:32:03.029925'),
(8, 'auth', '0004_alter_user_username_opts', '2019-06-15 10:32:03.198966'),
(9, 'auth', '0005_alter_user_last_login_null', '2019-06-15 10:32:03.687856'),
(10, 'auth', '0006_require_contenttypes_0002', '2019-06-15 10:32:03.736963'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2019-06-15 10:32:03.816071'),
(12, 'auth', '0008_alter_user_username_max_length', '2019-06-15 10:32:04.536272'),
(13, 'auth', '0009_alter_user_last_name_max_length', '2019-06-15 10:32:05.549538'),
(14, 'hospital', '0001_initial', '2019-06-15 10:32:06.799926'),
(15, 'patient', '0001_initial', '2019-06-15 10:32:19.180708'),
(16, 'doctor', '0001_initial', '2019-06-15 10:32:43.017665'),
(17, 'predict_risk', '0001_initial', '2019-06-15 10:32:43.927803'),
(18, 'sessions', '0001_initial', '2019-06-15 10:32:44.288461'),
(19, 'patient', '0002_auto_20190615_1410', '2019-06-15 12:10:45.595505');

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
('2f4p4sv3o9a0mb9wp8nvhch2bpp3s3pr', 'ZmY0NzQ2ZGIyNWY5NTIwZjY4YTk0MzQ3MmM2MTNkMTcwYTRkMDZkNTp7InBhdGllbnRfaWQiOjIsInVzZXJfdHlwZSI6InJlZ2lzdGVyZWRfcGF0aWVudCIsInVzZXJfVCI6MX0=', '2019-06-29 20:57:03.623989'),
('4j1z4e1ifrlt5rzmln7pelalicegd4lb', 'ZTJkNzk3ZWRlZTIxMTU2NzgyN2EyY2MzZGJlMDBjZGYzNWMwZTM5YTp7InVzZXJfdHlwZSI6InJlZ2lzdGVyZWRfcGF0aWVudCIsInVzZXJfVCI6MSwicGF0aWVudF9pZCI6MX0=', '2019-06-29 16:41:36.276545'),
('62ww10tmdayy5731pwhq54ayze0yqlgj', 'MTA1NTAzZGEwNzQ2YTRmZGYwMTlmMzhkOTNmMGMyNWZiMGY4YmQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxMjUzZmFmNDc1ZTM1ZjE4NGU1MjM3YjI3ZjNkOTVmNGFjMzA2NjU1IiwidHlwZSI6Imhvc3BpdGFsIiwidXNlcl9UIjoyLCJEb2N0b3JfUGF0aWFudF9JRCI6MCwicGF0aWVudF90ZW1wX2lkIjoyLCJ1c2VyX3R5cGUiOiJ0ZW1wIn0=', '2019-06-29 11:57:10.326729'),
('a956up8jvsxsm54i0p1673wys2l4hidr', 'ZmY1OWIyYjg1MTc2MDM0OWIxYWQ5ZTBjM2VmNWNjYmI1ODhhMGY0YTp7InR5cGUiOiJjbGluaWMifQ==', '2019-06-29 10:39:40.962325'),
('bdjgq82mxn47yb3qnpn117eyr4e41gns', 'YmZjODEyOTg3ZDEwZmZhODY0YjJmMDdhZGYzZmFhZmM5NTZiZWEzZjp7InR5cGUiOiJsYWIifQ==', '2019-06-29 10:39:23.361590'),
('bhy77ye1aoc6eeebwa3mdh08l41gl9g0', 'M2I3ZTM5MmYwMGRkMTlhNDI4NDk1NWQzYjVhM2IzZWU1ZWE3Y2U1NTp7InVzZXJfdHlwZSI6InJlZ2lzdGVyZWRfcGF0aWVudCIsInVzZXJfVCI6MX0=', '2019-06-30 09:14:59.145489'),
('bl9r98d4w3pa4mt4u5fbochvxhnhm2v5', 'MzA4OTNhNWExNmRlZGZmNjQ3MWRmMTVmMTQwNmE1MzY0YzE5ZjBkNzp7InBhdGllbnRfaWQiOjEsInVzZXJfdHlwZSI6InJlZ2lzdGVyZWRfcGF0aWVudCIsInVzZXJfVCI6MX0=', '2019-06-29 16:37:57.364549'),
('h3fp3mmtb5ra76ugreh03blzwk730yqx', 'M2I3ZTM5MmYwMGRkMTlhNDI4NDk1NWQzYjVhM2IzZWU1ZWE3Y2U1NTp7InVzZXJfdHlwZSI6InJlZ2lzdGVyZWRfcGF0aWVudCIsInVzZXJfVCI6MX0=', '2019-06-30 09:47:46.676617'),
('i9mwdqg5h2gmdbwprn5p7nwmfimko7iv', 'ODVmNTJjMzkxYmQ1OWI0OGIwZmNlM2U2ZTNhNmNiMTdlYTZjYjg2Nzp7InVzZXJfVCI6MSwiRG9jdG9yX1BhdGlhbnRfSUQiOjEsInVzZXJfdHlwZSI6InJlZ2lzdGVyZWRfcGF0aWVudCIsInByZXNjX2lkIjoiMyIsInR5cGUiOiJjbGluaWMifQ==', '2019-06-30 08:13:04.758607'),
('iw62vi0p0rw109cxdevywgthue5snds5', 'NTEwYmZlMTM4ZmVhMzE3YmMyMzAwMDM4NGU4MGY4ZjM0MGRhOWY0Yzp7InR5cGUiOiJsYWIiLCJ1c2VyX1QiOjEsIkRvY3Rvcl9QYXRpYW50X0lEIjoxLCJ1c2VyX3R5cGUiOiJyZWdpc3RlcmVkX3BhdGllbnQiLCJwcmVzY19pZCI6IjEiLCJwYXRpZW5faWQiOjIsInBhdGllX2lkIjoyfQ==', '2019-06-29 17:43:26.984872'),
('lbvybmptu4e02wb0mbx4uc54zxzoeulp', 'OWEzYTZmNWMyYmY3ZDY2MWFhZDc0ODQ4NjcxZTk5MzZjMTQ0ODVjMzp7InR5cGUiOiJob3NwaXRhbCJ9', '2019-06-29 10:38:34.566581'),
('pex6ae2ywtcow5ali0j1y9hnfxb46gqr', 'MDE3Mzk4YWVlNDUzZTNiZDU4MzhjMDVlZmJlZDE3ZGE2NDk2ZDc4ODp7InBhdGllbnRfdGVtcF9pZCI6MywidXNlcl90eXBlIjoicmVnaXN0ZXJlZF9wYXRpZW50IiwidXNlcl9pZCI6MywidXNlcl9UIjoxfQ==', '2019-06-29 16:40:49.029453'),
('sldgbaa50zuhn7mha75gcrtlon8v3uhr', 'M2I3ZTM5MmYwMGRkMTlhNDI4NDk1NWQzYjVhM2IzZWU1ZWE3Y2U1NTp7InVzZXJfdHlwZSI6InJlZ2lzdGVyZWRfcGF0aWVudCIsInVzZXJfVCI6MX0=', '2019-06-29 21:30:07.161832'),
('syow5xcswrcgiwts43hxtc7ykk9qz03d', 'YjQ2ODdkMDJjMzEwMWU1ZmY0MTM0YjU0ZTljNjlhYjBlYTM1YWU2MDp7InVzZXJfdHlwZSI6InJlZ2lzdGVyZWRfcGF0aWVudCIsInVzZXJfVCI6MSwidHlwZSI6ImxhYiJ9', '2019-06-29 16:52:29.566594'),
('t5h8rx7jupl603b7ynd3ldmn4aeln074', 'MmVkM2QxNjgwMjlkZTZhOGVjMDU1NGFhMTRkZGRlZWI1MzBlNjlmNzp7InR5cGUiOiJwaGFybWFjeSJ9', '2019-06-29 10:39:07.959793'),
('v4ua18wlkoh79s0qepbqt4q2y1dv910e', 'YmZjODEyOTg3ZDEwZmZhODY0YjJmMDdhZGYzZmFhZmM5NTZiZWEzZjp7InR5cGUiOiJsYWIifQ==', '2019-06-29 16:52:35.163695'),
('ydcps9yen77dmds4yk5g4ttkiav3w6jb', 'M2I3ZTM5MmYwMGRkMTlhNDI4NDk1NWQzYjVhM2IzZWU1ZWE3Y2U1NTp7InVzZXJfdHlwZSI6InJlZ2lzdGVyZWRfcGF0aWVudCIsInVzZXJfVCI6MX0=', '2019-06-29 16:40:36.681194');

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
(1, '17-Hydroxyprogesterone\n'),
(2, '17-OH Progesterone\n'),
(3, '17-OHP\n'),
(4, '24-Hour Urine Protein\n'),
(5, '25-hydroxyvitamin D; 1,25 dihydroxyvitamin D\n'),
(6, '3-ANCA\n'),
(7, '3-day Measles\n'),
(8, '4q12 (CHIC2) deletion\n'),
(9, '4-marker Screen\n'),
(10, '5-HIAA\n'),
(11, '5-hydroxyindoleacetic Acid\n'),
(12, '5-HT\n'),
(13, '5-Hydroxytryptamine\n'),
(14, '72 Hour Fecal Fat\n'),
(15, 'A/G Ratio\n'),
(16, 'A1AT\n'),
(17, 'A1c\n'),
(18, 'AAT\n'),
(19, 'ABGs\n'),
(20, 'ABO Group and Rh Type\n'),
(21, 'ACA\n'),
(22, 'Acetaminophen\n'),
(23, 'Acetoacetate\n'),
(24, 'Acetoacetic Acid\n'),
(25, 'Acetone\n'),
(26, 'Acetylcholine Receptor (AChR) Antibody\n'),
(27, 'Acetylcholine Receptor Binding Antibody\n'),
(28, 'Acetylcholine Receptor Blocking Antibody\n'),
(29, 'Acetylcholine Receptor Modulating Antibody\n'),
(30, 'Acetylsalicylic acid\n'),
(31, 'AChE\n'),
(32, 'AChR Antibody\n'),
(33, 'Acid-Fast Bacillus (AFB) Testing\n'),
(34, 'Acid-Fast Bacillus Smear and Culture and Sensitivity\n'),
(35, 'aCL Antibody\n'),
(36, 'ACPA\n'),
(37, 'ACR\n'),
(38, 'ACT\n'),
(39, 'ACTA\n'),
(40, 'ACTH Stimulation Test\n'),
(41, 'Actin Antibody\n'),
(42, 'Activated Clotting Time (ACT)\n'),
(43, 'Activated Coagulation Time\n'),
(44, 'Activated Partial Thromboplastin Time\n'),
(45, 'Activated Protein C Resistance\n'),
(46, 'Acute Promyelocytic Leukemia\n'),
(47, 'Acute Viral Hepatitis Panel\n'),
(48, 'Acute Viral Hepatitis Serology Panel\n'),
(49, 'AD\n'),
(50, 'ADA\n'),
(51, 'ADB\n'),
(52, 'Adenosine Deaminase\n'),
(53, 'Adenosine Deaminase, fluid\n'),
(54, 'ADH\n'),
(55, 'ADN-B\n'),
(56, 'ADNase-B\n'),
(57, 'Adrenocorticotropic Hormone\n'),
(58, 'Adrenocorticotropic Hormone (ACTH)\n'),
(59, 'Aerobic Wound Culture\n'),
(60, 'AFB Smear and Culture\n'),
(61, 'AFP\n'),
(62, 'AFP Maternal\n'),
(63, 'AFP-L3%\n'),
(64, 'Agglutinins\n'),
(65, 'AGPA\n'),
(66, 'AIDS Screen\n'),
(67, 'AIDS Test\n'),
(68, 'ALA\n'),
(69, 'Alanine Aminotransferase (ALT)\n'),
(70, 'Alanine Transaminase\n'),
(71, 'ALB\n'),
(72, 'Albumin\n'),
(73, 'Albumin (urine)\n'),
(74, 'Albumin, serum\n'),
(75, 'Albumin/Globulin Ratio\n'),
(76, 'Alcohol\n'),
(77, 'Aldolase\n'),
(78, 'Aldosterone and Plasma Renin Activity\n'),
(79, 'Aldosterone and Renin\n'),
(80, 'Aldosterone, Serum; Aldosterone, Urine; Renin\n'),
(81, 'ALK (Anaplastic Lymphoma Receptor Tyrosine Kinase) Gene Rearrangement\n'),
(82, 'ALK Gene Fusion\n'),
(83, 'ALK Gene Rearrangement\n'),
(84, 'ALK Mutation (Gene Rearrangement)\n'),
(85, 'Alk Phos\n'),
(86, 'Alkaline Phosphatase\n'),
(87, 'Alkaline Phosphatase (ALP)\n'),
(88, 'Alkaline phosphatase isoenzymes\n'),
(89, 'Alkp\n'),
(90, 'Allergen-specific IgE Antibody Test\n'),
(91, 'Allergy Blood Testing\n'),
(92, 'Allergy Screen\n'),
(93, 'Alloantibody Identification\n'),
(94, 'ALP\n'),
(95, 'Alpha Tryptase\n'),
(96, 'Alpha-1 Antitrypsin\n'),
(97, 'Alpha-fetoprotein (AFP) Tumor Marker\n'),
(98, 'Alpha-fetoprotein, Total; Alpha-fetoprotein-L3 Percent\n'),
(99, 'Alpha1 Antitrypsin; a1-antitrypsin\n'),
(100, 'Alpha1-antitrypsin\n');

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
(1, 'Mirtazapine\n'),
(2, 'Mesalamine\n'),
(3, 'Bactrim\n'),
(4, 'Contrave\n'),
(5, 'Cyclafem 1 / 35\n'),
(6, 'Zyclara\n'),
(7, 'Copper\n'),
(8, 'Amitriptyline\n'),
(9, 'Methadone\n'),
(10, 'Levora\n'),
(11, 'Paroxetine\n'),
(12, 'Miconazole\n'),
(13, 'Belviq\n'),
(14, 'Seroquel\n'),
(15, 'Ambien\n'),
(16, 'Nuvigil\n'),
(17, 'Chantix\n'),
(18, 'Microgestin Fe 1 / 20\n'),
(19, 'Klonopin\n'),
(20, 'Ciprofloxacin\n'),
(21, 'Trazodone\n'),
(22, 'EnteraGam\n'),
(23, 'Aripiprazole\n'),
(24, 'Cyclosporine\n'),
(25, 'Oxybutynin\n'),
(26, 'Lurasidone\n'),
(27, 'Clonazepam\n'),
(28, 'Ciclopirox\n'),
(29, 'Sodium oxybate\n'),
(30, 'Lamotrigine\n'),
(31, 'Blisovi Fe 1 / 20\n'),
(32, 'Ivermectin\n'),
(33, 'Suprep Bowel Prep Kit\n'),
(34, 'Movantik\n'),
(35, 'Lorcaserin\n'),
(36, 'Actos\n'),
(37, 'Duloxetine\n'),
(38, 'NuvaRing\n'),
(39, 'Escitalopram\n'),
(40, 'Tesamorelin\n'),
(41, 'Campral\n'),
(42, 'Gabapentin\n'),
(43, 'Levonorgestrel\n'),
(44, 'Aubra\n'),
(45, 'Plan B One-Step\n'),
(46, 'Ethinyl estradiol / etonogestrel\n'),
(47, 'Microgestin Fe 1.5 / 30\n'),
(48, 'Wellbutrin\n'),
(49, 'Clonazepam\n'),
(50, 'Benzoyl peroxide / clindamycin\n'),
(51, 'Etonogestrel\n'),
(52, 'Miconazole\n'),
(53, 'Nitrofurantoin\n'),
(54, 'Etonogestrel\n'),
(55, 'Ortho Tri-Cyclen Lo\n'),
(56, 'Tamsulosin\n'),
(57, 'Tofacitinib\n'),
(58, 'Cryselle\n'),
(59, 'Amphetamine / dextroamphetamine\n'),
(60, 'Clindamycin\n'),
(61, 'Pramipexole\n'),
(62, 'Skyla\n'),
(63, 'Lastacaft\n'),
(64, 'Effexor XR\n'),
(65, 'Nifedipine\n'),
(66, 'Lurasidone\n'),
(67, 'Afrezza\n'),
(68, 'Zoloft\n'),
(69, 'Ziprasidone\n'),
(70, 'Bactrim\n'),
(71, 'Ethinyl estradiol / norethindrone\n'),
(72, 'Sertraline\n'),
(73, 'Aluminum chloride hexahydrate\n'),
(74, 'Effexor XR\n'),
(75, 'ParaGard\n'),
(76, 'Pregabalin\n'),
(77, 'Ethinyl estradiol / levonorgestrel\n'),
(78, 'Ultram\n'),
(79, 'Phentermine\n'),
(80, 'Venlafaxine\n'),
(81, 'Campral\n'),
(82, 'Venlafaxine\n'),
(83, 'Levonorgestrel\n'),
(84, 'BuSpar\n'),
(85, 'Acetaminophen / hydrocodone\n'),
(86, 'Aviane\n'),
(87, 'Inderal\n'),
(88, 'Promethazine\n'),
(89, 'Tioconazole\n'),
(90, 'Orthovisc\n'),
(91, 'Implanon\n'),
(92, 'Marezine\n'),
(93, 'Levonorgestrel\n'),
(94, 'Aripiprazole\n'),
(95, 'Minoxidil\n'),
(96, 'Humira\n'),
(97, 'Insulin inhalation, rapid acting\n'),
(98, 'Acetaminophen / hydrocodone\n'),
(99, 'Phenazopyridine\n'),
(100, 'Levonorgestrel\n');

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
(1, 'AAPM - American Association of Physics in Medicine\n'),
(2, 'AAS - Acute Abdominal Series\n'),
(3, 'ABC - Automatic Brightness Control\n'),
(4, 'ABD - Abdomen\n'),
(5, 'AC - Alternating Current\n'),
(6, 'ACR - American College of Radiology\n'),
(7, 'ADC - Analog-to-Digital Converter\n'),
(8, 'AEC - Automatic Exposure Control\n'),
(9, 'AGC - Automatic Gain Control\n'),
(10, 'AHRA - American Healthcare Radiology Administrators\n'),
(11, 'Al - Aluminium\n'),
(12, 'ALARA - As Low As Reasonably Achievable.\n'),
(13, 'AMU - Atomic mass units\n'),
(14, 'AP - Anterio-Posterior\n'),
(15, 'APR - Anatomical Programmed Radiography\n'),
(16, 'ARNA - American Radiological Nurses Association\n'),
(17, 'ARR - Academy of Radiology Research\n'),
(18, 'ARRS - American Roentgen Ray Society\n'),
(19, 'ARRT - American Registry of Radiologic Technology\n'),
(20, 'a-Se - Aamorphous Selenium\n'),
(21, 'a-Si - Amorphous Silicon\n'),
(22, 'ASRT - American Society of Radiologic Technologists\n'),
(23, 'Ba - Barium\n'),
(24, 'BAS - Barium Swallow\n'),
(25, 'Be - Beryllium\n'),
(26, 'BE - Barium Enema\n'),
(27, 'BIR - The British Institute of Radiology\n'),
(28, 'BS - British Standard\n'),
(29, 'BW - Bandwidth\n'),
(30, 'C/kg - Coulomb per Kilogram\n'),
(31, 'CAT - Computed Axial Tomography\n'),
(32, 'CAU - Caudal\n'),
(33, 'CCD - Charge Coupled Device\n'),
(34, 'CD - Compact Disc\n'),
(35, 'CDR - Recordable Compact Disc\n'),
(36, 'CEU - Continuing Education Unit\n'),
(37, 'CHD - Coronary Heart Disease\n'),
(38, 'CINE - C inematographic\n'),
(39, 'CNR - Contrast-to-Noise Ratio\n'),
(40, 'CPR - Cardio-Pulmonary Resuscitation\n'),
(41, 'CR - Computed Radiography\n'),
(42, 'CRA - Cranial\n'),
(43, 'CRT - Cathode Ray Tube\n'),
(44, 'CsI - Caesium Iodide\n'),
(45, 'CT - Computed Tomography\n'),
(46, 'CTDI - Computed Tomography Dose Index\n'),
(47, 'Cu - Copper\n'),
(48, 'CXR - Chest X-ray\n'),
(49, 'DAP - Dose Area Product\n'),
(50, 'DAS - Data Acquisition System\n'),
(51, 'DC - Direct Current\n'),
(52, 'DDR - Direct Digital Radiography\n'),
(53, 'DECUB - Decubitis\n'),
(54, 'DH - Department of Health\n'),
(55, 'DICOM - Digital Imaging and Communication in Medicine\n'),
(56, 'DLP - Dose-Length Product\n'),
(57, 'DQE - Detective Quantum Efficiency\n'),
(58, 'DSA - Digital Subtraction Angiography\n'),
(59, 'DTPA - Diethylenetriaminepentaacetic Acid\n'),
(60, 'DVD - Digital Video Disc\n'),
(61, 'Eb - Electron Binding Energy\n'),
(62, 'EBCT - Electron Beam Computed Tomography\n'),
(63, 'ECG - Electro Cardiogram\n'),
(64, 'EPI - Echo Planar Imaging\n'),
(65, 'ESR - Electron Spin Resonance\n'),
(66, 'ETL - Echo Train Length\n'),
(67, 'eV - Electron Volt\n'),
(68, 'FA - Flip Angle\n'),
(69, 'FATSAT - Fat Saturation\n'),
(70, 'FDA - Food and Drug Administration\n'),
(71, 'FDA - Food and Drug Administration\n'),
(72, 'FDD - Focus to Detector Distance\n'),
(73, 'FDD -focus to detector distance\n'),
(74, 'FE - Field Echo\n'),
(75, 'FFT - Fast Fourier Transform\n'),
(76, 'FID - Focus to Isocentre Distance, Free Induction Decay\n'),
(77, 'FOV - Field Of View\n'),
(78, 'FPR - Fluoroscopy Programmed Radiography\n'),
(79, 'FPS - Frames Per Second\n'),
(80, 'FSE - Fast Spin Echo\n'),
(81, 'FT - Fourier Transform\n'),
(82, 'GCF - Grid Conversion Factor\n'),
(83, 'Gd - Gadolinium\n'),
(84, 'Gd2O2S - Gadolinium Oxysulphide\n'),
(85, 'GE - Geometric Efficiency, General Electric, Gradient Echo\n'),
(86, 'GI - Gastrointestinal\n'),
(87, 'Gy - Gray\n'),
(88, 'H+ - Hydrogen Density\n'),
(89, 'HIS - Hospital Information System\n'),
(90, 'HU - Hounsfield Unit\n'),
(91, 'Hz - Hertz\n'),
(92, 'ICRP - International Commison on Radiological Protection\n'),
(93, 'II - Image Intensifier\n'),
(94, 'IM - Intramuscular\n'),
(95, 'IR - Inversion Recovery, Interventional Radiology\n'),
(96, 'ISO - International Organization for Standardization\n'),
(97, 'IV - Intravenous\n'),
(98, 'IVP - Intravenous Pyleogram\n'),
(99, 'IVU - Intravenous Urogram\n'),
(100, 'JRCERT - Joint Review Committee on Education in Radiologic Technology\n');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_doctor`
--

CREATE TABLE `doctor_doctor` (
  `id` int(11) NOT NULL,
  `Registration_num` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Specialization` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Registration_date` date NOT NULL,
  `licence` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `Last_date_payment` date NOT NULL,
  `End_date` date NOT NULL,
  `Specialization_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `University` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Work_place` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Sub_syndicate` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `General_secretary` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
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
(1, '12345', 'public', '2019-06-15', '252436548', '2019-05-15', '2019-08-15', 'surgery', 'cairo', 'cairo', 'ehab taher', 'maher', '2019-06-10', '2016-11-17', 10, 1, NULL, 1);

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
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

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
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

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
(2, 2, 2),
(3, 3, 3);

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
(1, '/lab/media/Elevated%20serum%20level%20table1.jpg', 94, 3, 1),
(2, '', 87, NULL, 1),
(3, '', 10, NULL, 1);

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
(1, 2, 2, 57, 1, 2),
(2, 1, 1, 78, 1, NULL),
(3, 2, 4, 3, 1, NULL);

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
(1, '/lab/media/F3.large.jpg', 3, 1, 4),
(2, '', NULL, 1, 1),
(3, '', NULL, 1, 7);

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
(1, 'flu', '1', 'she has a flu with level one it is simple just need some rest and don\'t get cold', 'ahmed', '2019-06-15 00:00:00.000000'),
(2, 'caugh', '2', 'she has a hard caugh of level 2 and she need an argunt operation for heal', 'ahmed', '2019-06-23 00:00:00.000000'),
(3, 'heartattack', '2', 'She can\'t breathe so well', 'ahmed', '2019-06-18 00:00:00.000000');

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
(1, '2019-06-15 17:07:54.507105', NULL, 1, 1, 1, 1),
(2, '2019-06-16 07:35:03.932885', NULL, 1, 1, 1, 2),
(3, '2019-06-16 07:39:10.173855', NULL, 1, 1, 1, 3);

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
(1, 'aman', 'egypt', 'cairo', 'helwan', 'mahatta', '11723', '01234567891', 'general', 'private', 1, '2019-06-15', 'aman@hospital.com', 'https://amanhospital.com/', '/hospital/media/aman.png', 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 'aman', 'As123456', '2019-06-15', 10);

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
  `org_rate` int(11) DEFAULT NULL,
  `Type` int(11) NOT NULL,
  `hospital_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hospital_organization`
--

INSERT INTO `hospital_organization` (`org_id`, `org_name`, `org_country`, `org_state`, `org_city`, `org_zipcode`, `org_phone_num`, `org_email`, `org_website`, `org_logo`, `hr_username`, `hr_password`, `creation_date`, `org_rate`, `Type`, `hospital_id`) VALUES
(1, 'alsafwa', 'egypt', 'cairo', 'maadi', '11987', '01234567891', 'alsafwa@clinic.com', 'https://www.oasisclinics.com/', '/clinic/media/alsafwa.png', 'safwa', 'As123456', '2019-06-15', 0, 3, NULL),
(2, 'elezaby', 'egypt', 'cairo', 'geza', '11432', '02229010801', 'contactus@elezabypharmacy.com', 'https://elezabypharmacy.com/en/home/', '/hospital/media/elezaby.png', 'ezaby', 'As123456', '2019-06-15', 10, 1, 1),
(3, 'alborg', 'egypt', 'cairo', 'helwan', '11987', '01234567891', 'info@alborglab.com', 'http://www.alborglab.com/', '/hospital/media/Borg.png', 'borg', 'As123456', '2019-06-15', 10, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `patient_allnotification`
--

CREATE TABLE `patient_allnotification` (
  `id` int(11) NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL,
  `recieved_date` datetime(6) NOT NULL,
  `LabSenderId_id` int(11) DEFAULT NULL,
  `doctorSenderId_id` int(11) DEFAULT NULL,
  `hospitalSenderId_id` int(11) DEFAULT NULL,
  `patientRecipient_id` int(11) NOT NULL,
  `pharmacySenderId_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `patient_allnotification`
--

INSERT INTO `patient_allnotification` (`id`, `message`, `read`, `recieved_date`, `LabSenderId_id`, `doctorSenderId_id`, `hospitalSenderId_id`, `patientRecipient_id`, `pharmacySenderId_id`) VALUES
(1, 'Doctor ahmed is waiting for your review.', 1, '2019-06-15 17:07:54.560835', NULL, 1, 1, 1, NULL),
(2, 'Pharmacy elezaby is waiting for your review.', 1, '2019-06-15 17:24:26.359229', NULL, NULL, NULL, 1, 2),
(3, 'labalborg is waiting for your review.', 1, '2019-06-15 17:37:59.068260', 3, NULL, NULL, 1, NULL),
(4, 'lab alborg is waiting for your review.', 1, '2019-06-15 17:40:31.004024', 3, NULL, NULL, 1, NULL),
(5, 'Doctor ahmed is waiting for your review.', 1, '2019-06-16 07:35:04.097758', NULL, 1, 1, 1, NULL),
(6, 'Doctor ahmed is waiting for your review.', 1, '2019-06-16 07:39:10.238264', NULL, 1, 1, 1, NULL);

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
(1, '01141336724', '/patient/media/0101697.png', 'none', 164, 65, 'A-', 'none', 2),
(2, '01288456383', '/patient/media/8912345.png', 'none', 179, 72, 'A+', 'none', 3);

-- --------------------------------------------------------

--
-- Table structure for table `patient_rate`
--

CREATE TABLE `patient_rate` (
  `id` int(11) NOT NULL,
  `Rate` int(11) NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `Doctor_id` int(11) DEFAULT NULL,
  `Hospital_id` int(11) DEFAULT NULL,
  `Lab_id` int(11) DEFAULT NULL,
  `Patient_id` int(11) NOT NULL,
  `Pharmacy_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `patient_rate`
--

INSERT INTO `patient_rate` (`id`, `Rate`, `comment`, `Doctor_id`, `Hospital_id`, `Lab_id`, `Patient_id`, `Pharmacy_id`) VALUES
(1, 10, 'Thank you for helping me', 1, NULL, NULL, 1, NULL),
(2, 10, '', NULL, 1, NULL, 1, NULL),
(3, 10, '', NULL, NULL, NULL, 1, 2),
(4, 10, '', NULL, NULL, 3, 1, NULL);

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
(1, 'ab@ab.com', 'argon2$argon2i$v=19$m=512,t=2,p=2$dFRGbWJ3YXRhT3V1$CbrMl5LPmF2PRP/OK/RfUA');

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
  `email_2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
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
(1, 'ahmed', 'kamel', 'taha', 'male', 'egypt', 'caior', 'giza', 'alharam', '11721', '01234567891', '0225243544', '01230456789', '1991-05-08', 'single', 0, 'ahmedkamel@gmail.com', 'hmedkamel21@gmail.com', 'egyption', '/hospital/media/doc_2.jpg', 'doctor', 'amanhospital', 'helwan', '25200145263012', '5263012', 'argon2$argon2i$v=19$m=512,t=2,p=2$WkZUWkpPTTdtYXp0$OSlwnHwkb1r6oATiJGhuOg', '/hospital/media/1.jpg', 2, '2019-06-15 11:34:00.125440'),
(2, 'noran', 'yahia', 'ahmed', 'female', 'egypt', 'cairo', 'kobrielkobba', 'elgash', '11714', '01141336724', '0226527189', '0226527189', '1996-02-08', 'single', 0, 'noranyahia64@gmail.com', 'noranyahia64@gmail.com', 'egyption', '/patient/media/noran.jpg', 'developer', 'hawawui', 'cairo', '29612120101697', '0101697', 'argon2$argon2i$v=19$m=512,t=2,p=2$NFo2TkN0NkZORFhT$e5BBPiT0pNM0MQbgUEOg4w', '/patient/media/SSN.png', 1, '2019-06-15 12:07:40.055163'),
(3, 'abdelfatah', 'ramadan', 'abdelfatah', 'male', 'egypt', 'cairo', 'helwan', 'elmahatta', '11714', '01141336724', '01288456383', '0226527189', '1996-11-28', 'single', 0, 'tteha43@gmail.com', 'tteha43@gmail.com', 'egyption', '/patient/media/Teha.jpg', 'programmer', 'google', 'cairo', '12345678912345', '8912345', 'argon2$argon2i$v=19$m=512,t=2,p=2$OUg0Y0M4aldlTDll$ztMWtB+TcbZP7Rmz0zyJGg', '/patient/media/SSN_nKOuLVM.png', 1, '2019-06-15 12:14:43.674626');

-- --------------------------------------------------------

--
-- Table structure for table `predict_risk_predictions`
--

CREATE TABLE `predict_risk_predictions` (
  `id` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `sex` int(11) NOT NULL,
  `cp` int(11) NOT NULL,
  `resting_bp` int(11) NOT NULL,
  `serum_cholesterol` int(11) NOT NULL,
  `fasting_blood_sugar` int(11) NOT NULL,
  `resting_ecg` int(11) NOT NULL,
  `max_heart_rate` int(11) NOT NULL,
  `exercise_induced_angina` int(11) NOT NULL,
  `st_depression` decimal(4,2) NOT NULL,
  `st_slope` int(11) NOT NULL,
  `number_of_vessels` int(11) NOT NULL,
  `thallium_scan_results` int(11) NOT NULL,
  `predicted_on` datetime(6) NOT NULL,
  `num` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `predict_risk_predictions`
--

INSERT INTO `predict_risk_predictions` (`id`, `age`, `sex`, `cp`, `resting_bp`, `serum_cholesterol`, `fasting_blood_sugar`, `resting_ecg`, `max_heart_rate`, `exercise_induced_angina`, `st_depression`, `st_slope`, `number_of_vessels`, `thallium_scan_results`, `predicted_on`, `num`, `profile_id`) VALUES
(1, 23, 0, 1, 160, 226, 0, 0, 98, 1, '1.50', 2, 0, 7, '2019-06-15 17:19:16.030731', 1, 1),
(2, 23, 0, 4, 160, 226, 0, 1, 98, 1, '1.50', 1, 0, 7, '2019-06-16 07:31:13.013129', 1, 1);

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
  ADD KEY `doctor_patient_analy_lab_id_36ab6a75_fk_hospital_` (`lab_id`),
  ADD KEY `doctor_patient_analytics_pat_id_b7c1d6d5_fk_patient_patient_id` (`pat_id`);

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
  ADD KEY `doctor_patient_medic_med_id_3c2960de_fk_doctor_al` (`med_id`),
  ADD KEY `doctor_patient_medicine_pat_id_640f0e4c_fk_patient_patient_id` (`pat_id`),
  ADD KEY `doctor_patient_medic_pharmacy_id_2a3706e6_fk_hospital_` (`pharmacy_id`);

--
-- Indexes for table `doctor_patient_rays`
--
ALTER TABLE `doctor_patient_rays`
  ADD PRIMARY KEY (`P_R_id`),
  ADD KEY `doctor_patient_rays_lab_id_4358513e_fk_hospital_` (`lab_id`),
  ADD KEY `doctor_patient_rays_pat_id_1abc666b_fk_patient_patient_id` (`pat_id`),
  ADD KEY `doctor_patient_rays_ray_id_3e37ea33_fk_doctor_all_rays_ray_id` (`ray_id`);

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
-- Indexes for table `patient_allnotification`
--
ALTER TABLE `patient_allnotification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_allnotificat_LabSenderId_id_77d30199_fk_hospital_` (`LabSenderId_id`),
  ADD KEY `patient_allnotificat_doctorSenderId_id_9de08901_fk_patient_u` (`doctorSenderId_id`),
  ADD KEY `patient_allnotificat_hospitalSenderId_id_21f8c4d5_fk_hospital_` (`hospitalSenderId_id`),
  ADD KEY `patient_allnotificat_patientRecipient_id_0311ebfb_fk_patient_p` (`patientRecipient_id`),
  ADD KEY `patient_allnotificat_pharmacySenderId_id_c49c1675_fk_hospital_` (`pharmacySenderId_id`);

--
-- Indexes for table `patient_patient`
--
ALTER TABLE `patient_patient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_patient_Patient_id_56f106d0_fk_patient_user_user_id` (`Patient_id`);

--
-- Indexes for table `patient_rate`
--
ALTER TABLE `patient_rate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_rate_Doctor_id_cc257801_fk_patient_user_user_id` (`Doctor_id`),
  ADD KEY `patient_rate_Hospital_id_f562a1e5_fk_hospital_hospital_h_id` (`Hospital_id`),
  ADD KEY `patient_rate_Lab_id_6933ff40_fk_hospital_organization_org_id` (`Lab_id`),
  ADD KEY `patient_rate_Patient_id_a61aafd8_fk_patient_patient_id` (`Patient_id`),
  ADD KEY `patient_rate_Pharmacy_id_3341d6cd_fk_hospital_` (`Pharmacy_id`);

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
-- Indexes for table `predict_risk_predictions`
--
ALTER TABLE `predict_risk_predictions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `predict_risk_predict_profile_id_570c25fb_fk_patient_p` (`profile_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `doctor_all_analytics`
--
ALTER TABLE `doctor_all_analytics`
  MODIFY `analytics_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `doctor_all_chronic`
--
ALTER TABLE `doctor_all_chronic`
  MODIFY `chronic_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_all_medicine`
--
ALTER TABLE `doctor_all_medicine`
  MODIFY `medicine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `doctor_all_rays`
--
ALTER TABLE `doctor_all_rays`
  MODIFY `ray_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `doctor_doctor`
--
ALTER TABLE `doctor_doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `doctor_multi_analytics`
--
ALTER TABLE `doctor_multi_analytics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `doctor_multi_chronic`
--
ALTER TABLE `doctor_multi_chronic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_multi_medecines`
--
ALTER TABLE `doctor_multi_medecines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `doctor_multi_rays`
--
ALTER TABLE `doctor_multi_rays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `doctor_patient_analytics`
--
ALTER TABLE `doctor_patient_analytics`
  MODIFY `P_A_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `doctor_patient_chronic`
--
ALTER TABLE `doctor_patient_chronic`
  MODIFY `P_C_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_patient_medicine`
--
ALTER TABLE `doctor_patient_medicine`
  MODIFY `P_M_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `doctor_patient_rays`
--
ALTER TABLE `doctor_patient_rays`
  MODIFY `P_R_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `doctor_prescription`
--
ALTER TABLE `doctor_prescription`
  MODIFY `prescription_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `doctor_report`
--
ALTER TABLE `doctor_report`
  MODIFY `report` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hospital_hospital`
--
ALTER TABLE `hospital_hospital`
  MODIFY `h_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hospital_organization`
--
ALTER TABLE `hospital_organization`
  MODIFY `org_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `patient_allnotification`
--
ALTER TABLE `patient_allnotification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `patient_patient`
--
ALTER TABLE `patient_patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `patient_rate`
--
ALTER TABLE `patient_rate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `patient_temp_register`
--
ALTER TABLE `patient_temp_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `patient_user`
--
ALTER TABLE `patient_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `predict_risk_predictions`
--
ALTER TABLE `predict_risk_predictions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  ADD CONSTRAINT `doctor_multi_analyti_P_A_id_45277bd3_fk_doctor_pa` FOREIGN KEY (`P_A_id`) REFERENCES `doctor_patient_analytics` (`P_A_id`),
  ADD CONSTRAINT `doctor_multi_analyti_report_id_c1aacb18_fk_doctor_re` FOREIGN KEY (`report_id`) REFERENCES `doctor_report` (`report`);

--
-- Constraints for table `doctor_multi_chronic`
--
ALTER TABLE `doctor_multi_chronic`
  ADD CONSTRAINT `doctor_multi_chronic_P_C_id_73ec80eb_fk_doctor_pa` FOREIGN KEY (`P_C_id`) REFERENCES `doctor_patient_chronic` (`P_C_id`),
  ADD CONSTRAINT `doctor_multi_chronic_report_id_5e998a28_fk_doctor_report_report` FOREIGN KEY (`report_id`) REFERENCES `doctor_report` (`report`);

--
-- Constraints for table `doctor_multi_medecines`
--
ALTER TABLE `doctor_multi_medecines`
  ADD CONSTRAINT `doctor_multi_medecin_P_M_id_32dacdfa_fk_doctor_pa` FOREIGN KEY (`P_M_id`) REFERENCES `doctor_patient_medicine` (`P_M_id`),
  ADD CONSTRAINT `doctor_multi_medecin_report_id_aff71713_fk_doctor_re` FOREIGN KEY (`report_id`) REFERENCES `doctor_report` (`report`);

--
-- Constraints for table `doctor_multi_rays`
--
ALTER TABLE `doctor_multi_rays`
  ADD CONSTRAINT `doctor_multi_rays_P_R_id_b584fe56_fk_doctor_patient_rays_P_R_id` FOREIGN KEY (`P_R_id`) REFERENCES `doctor_patient_rays` (`P_R_id`),
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
-- Constraints for table `patient_allnotification`
--
ALTER TABLE `patient_allnotification`
  ADD CONSTRAINT `patient_allnotificat_LabSenderId_id_77d30199_fk_hospital_` FOREIGN KEY (`LabSenderId_id`) REFERENCES `hospital_organization` (`org_id`),
  ADD CONSTRAINT `patient_allnotificat_doctorSenderId_id_9de08901_fk_patient_u` FOREIGN KEY (`doctorSenderId_id`) REFERENCES `patient_user` (`user_id`),
  ADD CONSTRAINT `patient_allnotificat_hospitalSenderId_id_21f8c4d5_fk_hospital_` FOREIGN KEY (`hospitalSenderId_id`) REFERENCES `hospital_hospital` (`h_id`),
  ADD CONSTRAINT `patient_allnotificat_patientRecipient_id_0311ebfb_fk_patient_p` FOREIGN KEY (`patientRecipient_id`) REFERENCES `patient_patient` (`id`),
  ADD CONSTRAINT `patient_allnotificat_pharmacySenderId_id_c49c1675_fk_hospital_` FOREIGN KEY (`pharmacySenderId_id`) REFERENCES `hospital_organization` (`org_id`);

--
-- Constraints for table `patient_patient`
--
ALTER TABLE `patient_patient`
  ADD CONSTRAINT `patient_patient_Patient_id_56f106d0_fk_patient_user_user_id` FOREIGN KEY (`Patient_id`) REFERENCES `patient_user` (`user_id`);

--
-- Constraints for table `patient_rate`
--
ALTER TABLE `patient_rate`
  ADD CONSTRAINT `patient_rate_Doctor_id_cc257801_fk_patient_user_user_id` FOREIGN KEY (`Doctor_id`) REFERENCES `patient_user` (`user_id`),
  ADD CONSTRAINT `patient_rate_Hospital_id_f562a1e5_fk_hospital_hospital_h_id` FOREIGN KEY (`Hospital_id`) REFERENCES `hospital_hospital` (`h_id`),
  ADD CONSTRAINT `patient_rate_Lab_id_6933ff40_fk_hospital_organization_org_id` FOREIGN KEY (`Lab_id`) REFERENCES `hospital_organization` (`org_id`),
  ADD CONSTRAINT `patient_rate_Patient_id_a61aafd8_fk_patient_patient_id` FOREIGN KEY (`Patient_id`) REFERENCES `patient_patient` (`id`),
  ADD CONSTRAINT `patient_rate_Pharmacy_id_3341d6cd_fk_hospital_` FOREIGN KEY (`Pharmacy_id`) REFERENCES `hospital_organization` (`org_id`);

--
-- Constraints for table `predict_risk_predictions`
--
ALTER TABLE `predict_risk_predictions`
  ADD CONSTRAINT `predict_risk_predict_profile_id_570c25fb_fk_patient_p` FOREIGN KEY (`profile_id`) REFERENCES `patient_patient` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
