-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2019 at 08:59 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

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
-- Table structure for table `app_1_admin`
--

CREATE TABLE `app_1_admin` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `app_1_all_analytics`
--

CREATE TABLE `app_1_all_analytics` (
  `analytics_id` int(11) NOT NULL,
  `analytics_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_1_all_analytics`
--

INSERT INTO `app_1_all_analytics` (`analytics_id`, `analytics_name`) VALUES
(1, 'blood analytic'),
(2, 'any analytic');

-- --------------------------------------------------------

--
-- Table structure for table `app_1_all_chronic`
--

CREATE TABLE `app_1_all_chronic` (
  `chronic_id` int(11) NOT NULL,
  `chronic_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_1_all_chronic`
--

INSERT INTO `app_1_all_chronic` (`chronic_id`, `chronic_name`) VALUES
(1, 'first chronic'),
(2, 'second chronic');

-- --------------------------------------------------------

--
-- Table structure for table `app_1_all_medicine`
--

CREATE TABLE `app_1_all_medicine` (
  `medicine_id` int(11) NOT NULL,
  `medicine_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_1_all_medicine`
--

INSERT INTO `app_1_all_medicine` (`medicine_id`, `medicine_name`) VALUES
(1, 'first medical'),
(2, 'second medical');

-- --------------------------------------------------------

--
-- Table structure for table `app_1_all_rays`
--

CREATE TABLE `app_1_all_rays` (
  `ray_id` int(11) NOT NULL,
  `ray_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_1_all_rays`
--

INSERT INTO `app_1_all_rays` (`ray_id`, `ray_name`) VALUES
(1, 'first ray'),
(2, 'second ray');

-- --------------------------------------------------------

--
-- Table structure for table `app_1_blocked_hospitals`
--

CREATE TABLE `app_1_blocked_hospitals` (
  `id` int(11) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `manager_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `app_1_blocked_organizations`
--

CREATE TABLE `app_1_blocked_organizations` (
  `id` int(11) NOT NULL,
  `manager_id` int(11) NOT NULL,
  `organ_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `app_1_blocked_users`
--

CREATE TABLE `app_1_blocked_users` (
  `id` int(11) NOT NULL,
  `manager_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `app_1_doctor`
--

CREATE TABLE `app_1_doctor` (
  `id` int(11) NOT NULL,
  `Registration_num` varchar(50) NOT NULL,
  `Specialization` varchar(100) NOT NULL,
  `Registration_date` datetime(6) NOT NULL,
  `licence` varchar(250) NOT NULL,
  `Last_date_payment` date NOT NULL,
  `End_date` date NOT NULL,
  `Specialization_type` varchar(100) NOT NULL,
  `University` varchar(100) NOT NULL,
  `Work_place` varchar(100) NOT NULL,
  `Sub_syndicate` varchar(500) NOT NULL,
  `General_secretary` varchar(500) NOT NULL,
  `Working_till` time(6) NOT NULL,
  `Graduation_year` varchar(50) NOT NULL,
  `doc_rate` int(11) NOT NULL,
  `Doc_id` int(11) NOT NULL,
  `clinic_id` int(11),
  `hospital_id` int(11)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_1_doctor`
--

INSERT INTO `app_1_doctor` (`id`, `Registration_num`, `Specialization`, `Registration_date`, `licence`, `Last_date_payment`, `End_date`, `Specialization_type`, `University`, `Work_place`, `Sub_syndicate`, `General_secretary`, `Working_till`, `Graduation_year`, `doc_rate`, `Doc_id`, `clinic_id`, `hospital_id`) VALUES
(1, '01', 'heart', '2019-03-18 12:25:47.729479', 'none', '2016-03-04', '2019-03-06', 'heart', 'Helwan', 'Cairo', 'none', 'none', '15:38:38.331347', '2015', 6, 2, 3, NULL),
(2, '02', 'heart', '2019-03-18 12:25:47.729479', 'none', '2016-03-04', '2019-03-06', 'heart', 'Helwan', 'Cairo', 'none', 'none', '15:38:38.331347', '2015', 6, 2, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `app_1_hospital`
--

CREATE TABLE `app_1_hospital` (
  `h_id` int(11) NOT NULL,
  `h_name` varchar(500) NOT NULL,
  `h_country` varchar(100) NOT NULL,
  `h_state` varchar(100) NOT NULL,
  `h_city` varchar(100) NOT NULL,
  `h_street` varchar(100) NOT NULL,
  `h_zipcode` varchar(50) NOT NULL,
  `h_phone_num` varchar(100) NOT NULL,
  `h_type` varchar(100) NOT NULL,
  `h_ownership` varchar(100) NOT NULL,
  `h_emergency_service` tinyint(1) NOT NULL,
  `h_date` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `website` longtext NOT NULL,
  `logo` longtext NOT NULL,
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
  `hr_username` varchar(250) NOT NULL,
  `hr_password` varchar(250) NOT NULL,
  `creation_date` date NOT NULL,
  `hos_rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_1_hospital`
--

INSERT INTO `app_1_hospital` (`h_id`, `h_name`, `h_country`, `h_state`, `h_city`, `h_street`, `h_zipcode`, `h_phone_num`, `h_type`, `h_ownership`, `h_emergency_service`, `h_date`, `email`, `website`, `logo`, `internal_medicine`, `cardiology`, `endocrinology`, `hematology`, `nephrology`, `surgery`, `pediatric`, `obstertics_genacology`, `ophthalmologist`, `neurology`, `Ear_nose_threat`, `urology`, `dermatology`, `hepatology`, `Radiology`, `psychiatry`, `dentistry`, `forensic_medicine`, `enatony`, `num_of_bed`, `hr_username`, `hr_password`, `creation_date`, `hos_rate`) VALUES
(1, 'Elwatany hospital ', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 1, '2019-03-22', 'elwatany@g.com', 's', 's', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 's', '1', '2019-03-21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `app_1_manager`
--

CREATE TABLE `app_1_manager` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `blocked` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `app_1_multi_analytics`
--

CREATE TABLE `app_1_multi_analytics` (
  `id` int(11) NOT NULL,
  `P_A_id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_1_multi_analytics`
--

INSERT INTO `app_1_multi_analytics` (`id`, `P_A_id`, `report_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 2),
(4, 3, 1),
(5, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `app_1_multi_chronic`
--

CREATE TABLE `app_1_multi_chronic` (
  `id` int(11) NOT NULL,
  `P_C_id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_1_multi_chronic`
--

INSERT INTO `app_1_multi_chronic` (`id`, `P_C_id`, `report_id`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `app_1_multi_medecines`
--

CREATE TABLE `app_1_multi_medecines` (
  `id` int(11) NOT NULL,
  `P_M_id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_1_multi_medecines`
--

INSERT INTO `app_1_multi_medecines` (`id`, `P_M_id`, `report_id`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `app_1_multi_rays`
--

CREATE TABLE `app_1_multi_rays` (
  `id` int(11) NOT NULL,
  `P_R_id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_1_multi_rays`
--

INSERT INTO `app_1_multi_rays` (`id`, `P_R_id`, `report_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `app_1_organization`
--

CREATE TABLE `app_1_organization` (
  `org_id` int(11) NOT NULL,
  `org_name` varchar(250) NOT NULL,
  `org_country` varchar(100) NOT NULL,
  `org_state` varchar(100) NOT NULL,
  `org_city` varchar(100) NOT NULL,
  `org_zipcode` varchar(100) NOT NULL,
  `org_phone_num` varchar(50) NOT NULL,
  `org_email` varchar(100) NOT NULL,
  `org_website` longtext NOT NULL,
  `org_logo` longtext NOT NULL,
  `hr_username` varchar(100) NOT NULL,
  `hr_password` varchar(100) NOT NULL,
  `creation_date` date NOT NULL,
  `org_rate` int(11) NOT NULL,
  `Type` int(11) NOT NULL,
  `hospital_id` int(11)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_1_organization`
--

INSERT INTO `app_1_organization` (`org_id`, `org_name`, `org_country`, `org_state`, `org_city`, `org_zipcode`, `org_phone_num`, `org_email`, `org_website`, `org_logo`, `hr_username`, `hr_password`, `creation_date`, `org_rate`, `Type`, `hospital_id`) VALUES
(1, 'Pharmacy 01', 'Egypt', 'Cairo', 'Helwan', '11714', '01141336724', 'pharmacy01@gmail.com', 'a', 'a', 'pharmacy01@gmail.com', '01141336724', '2019-03-20', 8, 1, 1),
(2, 'Lab 01', 'Egypt', 'Cairo', 'Helwan', '11714', '01141336724', 'lab01@gmail.com', 'a', 'a', 'lab01@gmail.com', '01141336724', '2019-03-20', 8, 1, 1),
(3, 'Clinic 01', 'Egypt', 'Cairo', 'Helwan', '11714', '01141336724', 'clinic01@gmail.com', 'a', 'a', 'clinic01@gmail.com', '01141336724', '2019-03-20', 8, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `app_1_patient`
--

CREATE TABLE `app_1_patient` (
  `id` int(11) NOT NULL,
  `Emergency_contact` varchar(50) NOT NULL,
  `QR_code` varchar(500) NOT NULL,
  `Disability_status` tinyint(1) NOT NULL,
  `Height` double NOT NULL,
  `weight` double NOT NULL,
  `Blood_type` varchar(500) NOT NULL,
  `Chronic_diseases` tinyint(1) NOT NULL,
  `Patient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_1_patient`
--

INSERT INTO `app_1_patient` (`id`, `Emergency_contact`, `QR_code`, `Disability_status`, `Height`, `weight`, `Blood_type`, `Chronic_diseases`, `Patient_id`) VALUES
(1, '119', 'none', 0, 176, 72, 'a', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `app_1_patient_analytics`
--

CREATE TABLE `app_1_patient_analytics` (
  `P_A_id` int(11) NOT NULL,
  `analytics_result` longtext NOT NULL,
  `analy_id` int(11) NOT NULL,
  `lab_id` int(11) NOT NULL,
  `pat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_1_patient_analytics`
--

INSERT INTO `app_1_patient_analytics` (`P_A_id`, `analytics_result`, `analy_id`, `lab_id`, `pat_id`) VALUES
(1, 'result 1', 1, 2, 1),
(2, 'result 2', 2, 2, 1),
(3, 'result 3', 2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `app_1_patient_chronic`
--

CREATE TABLE `app_1_patient_chronic` (
  `P_C_id` int(11) NOT NULL,
  `chr_id` int(11) NOT NULL,
  `pat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_1_patient_chronic`
--

INSERT INTO `app_1_patient_chronic` (`P_C_id`, `chr_id`, `pat_id`) VALUES
(1, 1, 1),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `app_1_patient_medicine`
--

CREATE TABLE `app_1_patient_medicine` (
  `P_M_id` int(11) NOT NULL,
  `number_of_potions` int(11) NOT NULL,
  `number_of_pills` int(11) NOT NULL,
  `medicine_submit` tinyint(1) NOT NULL,
  `med_id` int(11) NOT NULL,
  `pat_id` int(11) NOT NULL,
  `pharmacy_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_1_patient_medicine`
--

INSERT INTO `app_1_patient_medicine` (`P_M_id`, `number_of_potions`, `number_of_pills`, `medicine_submit`, `med_id`, `pat_id`, `pharmacy_id`) VALUES
(1, 2, 4, 1, 1, 1, 1),
(2, 4, 0, 1, 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `app_1_patient_rays`
--

CREATE TABLE `app_1_patient_rays` (
  `P_R_id` int(11) NOT NULL,
  `rays_result` longtext NOT NULL,
  `lab_id` int(11) NOT NULL,
  `pat_id` int(11) NOT NULL,
  `ray_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_1_patient_rays`
--

INSERT INTO `app_1_patient_rays` (`P_R_id`, `rays_result`, `lab_id`, `pat_id`, `ray_id`) VALUES
(1, 'rays result 01', 2, 1, 1),
(2, 'rays result 02', 2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `app_1_prescription`
--

CREATE TABLE `app_1_prescription` (
  `prescription_id` int(11) NOT NULL,
  `Disease_name` varchar(100) NOT NULL,
  `Disease_level` varchar(100) NOT NULL,
  `Disease_disc` longtext NOT NULL,
  `Doctor_signature` varchar(500) NOT NULL,
  `next_appointment` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_1_prescription`
--

INSERT INTO `app_1_prescription` (`prescription_id`, `Disease_name`, `Disease_level`, `Disease_disc`, `Doctor_signature`, `next_appointment`) VALUES
(1, 'high pressure', 'high', 'asadasdxsdxcas gdgf gfg dfga gt hafaasadasdxsdxcas gdgf gfg dfga gt hafaasadasdxsdxcas gdgf gfg dfga gt hafaasadasdxsdxcas gdgf gfg dfga gt hafaasadasdxsdxcas gdgf gfg dfga gt hafaasadasdxsdxcas gdgf gfg dfga gt hafaasadasdxsdxcas gdgf gfg dfga gt hafaasadasdxsdxcas gdgf gfg dfga gt hafaasadasdxsdxcas gdgf gfg dfga gt hafaasadasdxsdxcas gdgf gfg dfga gt hafaasadasdxsdxcas gdgf gfg dfga gt hafaasadasdxsdxcas gdgf gfg dfga gt hafaasadasdxsdxcas gdgf gfg dfga gt hafaasadasdxsdxcas gdgf gfg dfga gt hafaasadasdxsdxcas gdgf gfg dfga gt hafaasadasdxsdxcas gdgf gfg dfga gt hafaasadasdxsdxcas gdgf gfg dfga gt hafa', 'asdasxsaxasasadasdxsdxcas gdgf gfg dfga gt hafa', '2019-03-20 04:46:19.000000');

-- --------------------------------------------------------

--
-- Table structure for table `app_1_report`
--

CREATE TABLE `app_1_report` (
  `report` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `prescription_id` int(11) NOT NULL,
  `Submit_date` datetime(6) NOT NULL,
  `clinic_id` int(11),
  `hospital_id` int(11)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_1_report`
--

INSERT INTO `app_1_report` (`report`, `doctor_id`, `patient_id`, `prescription_id`, `Submit_date`, `clinic_id`, `hospital_id`) VALUES
(1, 1, 1, 1, '2019-03-07 10:26:27.472503', 3, NULL),
(2, 2, 1, 1, '2019-03-10 10:15:17.909175', NULL, 1),
(3, 2, 1, 1, '2019-03-12 18:29:31.909175', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_1_temp`
--

CREATE TABLE `app_1_temp` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `temp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `app_1_temp_register`
--

CREATE TABLE `app_1_temp_register` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_1_temp_register`
--

INSERT INTO `app_1_temp_register` (`id`, `email`, `password`) VALUES
(3, 'abdullah@yahoo.com', 'As123456789'),
(4, 'teha@gmail.com', '01141336724'),
(5, 'abdo@g.com', '01141336724'),
(6, 'teha1@gmail.com', '01141336724');

-- --------------------------------------------------------

--
-- Table structure for table `app_1_user`
--

CREATE TABLE `app_1_user` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `gender` int(11) NOT NULL,
  `country` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `street` varchar(100) NOT NULL,
  `zip_code` varchar(100) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `home_phone_number` varchar(100) NOT NULL,
  `work_phone_number` varchar(100) NOT NULL,
  `Date_of_birth` date NOT NULL,
  `marital_status` varchar(100) NOT NULL,
  `Child_num` varchar(100) NOT NULL,
  `email_1` varchar(100) NOT NULL,
  `email_2` varchar(100) NOT NULL,
  `Nationality` varchar(100) NOT NULL,
  `Profile_picture` varchar(100) NOT NULL,
  `Job_name` varchar(100) NOT NULL,
  `Job_organization` varchar(100) NOT NULL,
  `Jop_place` varchar(100) NOT NULL,
  `Ssn` varchar(100) NOT NULL,
  `Ssn_id` varchar(100) NOT NULL,
  `New_Password` varchar(100) NOT NULL,
  `SSN_Picture` varchar(100) NOT NULL,
  `User_type` int(11) NOT NULL,
  `Create_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_1_user`
--

INSERT INTO `app_1_user` (`user_id`, `first_name`, `middle_name`, `last_name`, `gender`, `country`, `state`, `city`, `street`, `zip_code`, `phone_number`, `home_phone_number`, `work_phone_number`, `Date_of_birth`, `marital_status`, `Child_num`, `email_1`, `email_2`, `Nationality`, `Profile_picture`, `Job_name`, `Job_organization`, `Jop_place`, `Ssn`, `Ssn_id`, `New_Password`, `SSN_Picture`, `User_type`, `Create_date`) VALUES
(1, 'abdo', 'teha', 'abdo', 1, 'egypt', 'cairo', 'helwan', 'mansour', '11711', '01141336724', '0226527189', '0226527189', '2019-03-05', 'single', '0', 'teha55@gmail.com', 'teha66@gmail.com', 'egypt', '/e/1.pic', 'developer', 'cairo', 'cairo', '12345678912345', '12345678912345', 'A01141336724a', '/e/1.pic', 1, '2019-03-06 06:27:44.479238'),
(2, 'Ahmed', 'Hesham', 'abdo', 1, 'egypt', 'cairo', 'helwan', 'mansour', '11711', '01141336724', '0226527189', '0226527189', '2019-03-05', 'single', '0', 'teha55@gmail.com', 'teha66@gmail.com', 'egypt', '/e/1.pic', 'developer', 'cairo', 'cairo', '12345678912345', '12345678912345', 'A01141336724a', '/e/1.pic', 2, '2019-03-06 06:27:44.479238');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(19, 'Can add admin', 7, 'add_admin'),
(20, 'Can change admin', 7, 'change_admin'),
(21, 'Can delete admin', 7, 'delete_admin'),
(22, 'Can add temp', 8, 'add_temp'),
(23, 'Can change temp', 8, 'change_temp'),
(24, 'Can delete temp', 8, 'delete_temp'),
(25, 'Can add manager', 9, 'add_manager'),
(26, 'Can change manager', 9, 'change_manager'),
(27, 'Can delete manager', 9, 'delete_manager'),
(28, 'Can add temp_register', 10, 'add_temp_register'),
(29, 'Can change temp_register', 10, 'change_temp_register'),
(30, 'Can delete temp_register', 10, 'delete_temp_register'),
(31, 'Can add user', 11, 'add_user'),
(32, 'Can change user', 11, 'change_user'),
(33, 'Can delete user', 11, 'delete_user'),
(34, 'Can add patient', 12, 'add_patient'),
(35, 'Can change patient', 12, 'change_patient'),
(36, 'Can delete patient', 12, 'delete_patient'),
(37, 'Can add hospital', 13, 'add_hospital'),
(38, 'Can change hospital', 13, 'change_hospital'),
(39, 'Can delete hospital', 13, 'delete_hospital'),
(40, 'Can add organization', 14, 'add_organization'),
(41, 'Can change organization', 14, 'change_organization'),
(42, 'Can delete organization', 14, 'delete_organization'),
(43, 'Can add doctor', 15, 'add_doctor'),
(44, 'Can change doctor', 15, 'change_doctor'),
(45, 'Can delete doctor', 15, 'delete_doctor'),
(46, 'Can add prescription', 16, 'add_prescription'),
(47, 'Can change prescription', 16, 'change_prescription'),
(48, 'Can delete prescription', 16, 'delete_prescription'),
(49, 'Can add report', 17, 'add_report'),
(50, 'Can change report', 17, 'change_report'),
(51, 'Can delete report', 17, 'delete_report'),
(52, 'Can add all_analytics', 18, 'add_all_analytics'),
(53, 'Can change all_analytics', 18, 'change_all_analytics'),
(54, 'Can delete all_analytics', 18, 'delete_all_analytics'),
(55, 'Can add all_chronic', 19, 'add_all_chronic'),
(56, 'Can change all_chronic', 19, 'change_all_chronic'),
(57, 'Can delete all_chronic', 19, 'delete_all_chronic'),
(58, 'Can add all_medicine', 20, 'add_all_medicine'),
(59, 'Can change all_medicine', 20, 'change_all_medicine'),
(60, 'Can delete all_medicine', 20, 'delete_all_medicine'),
(61, 'Can add all_rays', 21, 'add_all_rays'),
(62, 'Can change all_rays', 21, 'change_all_rays'),
(63, 'Can delete all_rays', 21, 'delete_all_rays'),
(64, 'Can add patient_analytics', 22, 'add_patient_analytics'),
(65, 'Can change patient_analytics', 22, 'change_patient_analytics'),
(66, 'Can delete patient_analytics', 22, 'delete_patient_analytics'),
(67, 'Can add patient_chronic', 23, 'add_patient_chronic'),
(68, 'Can change patient_chronic', 23, 'change_patient_chronic'),
(69, 'Can delete patient_chronic', 23, 'delete_patient_chronic'),
(70, 'Can add patient_medicine', 24, 'add_patient_medicine'),
(71, 'Can change patient_medicine', 24, 'change_patient_medicine'),
(72, 'Can delete patient_medicine', 24, 'delete_patient_medicine'),
(73, 'Can add patient_rays', 25, 'add_patient_rays'),
(74, 'Can change patient_rays', 25, 'change_patient_rays'),
(75, 'Can delete patient_rays', 25, 'delete_patient_rays'),
(76, 'Can add multi_analytics', 26, 'add_multi_analytics'),
(77, 'Can change multi_analytics', 26, 'change_multi_analytics'),
(78, 'Can delete multi_analytics', 26, 'delete_multi_analytics'),
(79, 'Can add multi_chronic', 27, 'add_multi_chronic'),
(80, 'Can change multi_chronic', 27, 'change_multi_chronic'),
(81, 'Can delete multi_chronic', 27, 'delete_multi_chronic'),
(82, 'Can add multi_medecines', 28, 'add_multi_medecines'),
(83, 'Can change multi_medecines', 28, 'change_multi_medecines'),
(84, 'Can delete multi_medecines', 28, 'delete_multi_medecines'),
(85, 'Can add multi_rays', 29, 'add_multi_rays'),
(86, 'Can change multi_rays', 29, 'change_multi_rays'),
(87, 'Can delete multi_rays', 29, 'delete_multi_rays'),
(88, 'Can add blocked_hospitals', 30, 'add_blocked_hospitals'),
(89, 'Can change blocked_hospitals', 30, 'change_blocked_hospitals'),
(90, 'Can delete blocked_hospitals', 30, 'delete_blocked_hospitals'),
(91, 'Can add blocked_organizations', 31, 'add_blocked_organizations'),
(92, 'Can change blocked_organizations', 31, 'change_blocked_organizations'),
(93, 'Can delete blocked_organizations', 31, 'delete_blocked_organizations'),
(94, 'Can add blocked_users', 32, 'add_blocked_users'),
(95, 'Can change blocked_users', 32, 'change_blocked_users'),
(96, 'Can delete blocked_users', 32, 'delete_blocked_users');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(7, 'App_1', 'admin'),
(18, 'App_1', 'all_analytics'),
(19, 'App_1', 'all_chronic'),
(20, 'App_1', 'all_medicine'),
(21, 'App_1', 'all_rays'),
(30, 'App_1', 'blocked_hospitals'),
(31, 'App_1', 'blocked_organizations'),
(32, 'App_1', 'blocked_users'),
(15, 'App_1', 'doctor'),
(13, 'App_1', 'hospital'),
(9, 'App_1', 'manager'),
(26, 'App_1', 'multi_analytics'),
(27, 'App_1', 'multi_chronic'),
(28, 'App_1', 'multi_medecines'),
(29, 'App_1', 'multi_rays'),
(14, 'App_1', 'organization'),
(12, 'App_1', 'patient'),
(22, 'App_1', 'patient_analytics'),
(23, 'App_1', 'patient_chronic'),
(24, 'App_1', 'patient_medicine'),
(25, 'App_1', 'patient_rays'),
(16, 'App_1', 'prescription'),
(17, 'App_1', 'report'),
(8, 'App_1', 'temp'),
(10, 'App_1', 'temp_register'),
(11, 'App_1', 'user'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'App_1', '0001_initial', '2019-03-07 18:30:40.111841'),
(2, 'App_1', '0002_auto_20190307_2029', '2019-03-07 18:31:42.339894'),
(3, 'contenttypes', '0001_initial', '2019-03-07 18:31:43.267596'),
(4, 'auth', '0001_initial', '2019-03-07 18:31:54.740663'),
(5, 'admin', '0001_initial', '2019-03-07 18:31:58.458704'),
(6, 'contenttypes', '0002_remove_content_type_name', '2019-03-07 18:32:00.511182'),
(7, 'auth', '0002_alter_permission_name_max_length', '2019-03-07 18:32:02.565611'),
(8, 'auth', '0003_alter_user_email_max_length', '2019-03-07 18:32:04.041110'),
(9, 'auth', '0004_alter_user_username_opts', '2019-03-07 18:32:04.119085'),
(10, 'auth', '0005_alter_user_last_login_null', '2019-03-07 18:32:05.357858'),
(11, 'auth', '0006_require_contenttypes_0002', '2019-03-07 18:32:05.428832'),
(12, 'sessions', '0001_initial', '2019-03-07 18:32:06.237580');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('8tcaho20hbgzj4vvt8uv8kag7k0a8i8c', 'OTAzYzcxNWQ3MGMzN2MwYTU2ZGQ2M2E2MzU2NTkzZmQ3NTkwMDk4ZDp7InBhdGllbnRfaWQiOjR9', '2019-03-22 16:58:31.778508');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_1_admin`
--
ALTER TABLE `app_1_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_1_all_analytics`
--
ALTER TABLE `app_1_all_analytics`
  ADD PRIMARY KEY (`analytics_id`);

--
-- Indexes for table `app_1_all_chronic`
--
ALTER TABLE `app_1_all_chronic`
  ADD PRIMARY KEY (`chronic_id`);

--
-- Indexes for table `app_1_all_medicine`
--
ALTER TABLE `app_1_all_medicine`
  ADD PRIMARY KEY (`medicine_id`);

--
-- Indexes for table `app_1_all_rays`
--
ALTER TABLE `app_1_all_rays`
  ADD PRIMARY KEY (`ray_id`);

--
-- Indexes for table `app_1_blocked_hospitals`
--
ALTER TABLE `app_1_blocked_hospitals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `App_1_blocked_hospitals_5a552f2f` (`hospital_id`),
  ADD KEY `App_1_blocked_hospitals_7729eba5` (`manager_id`);

--
-- Indexes for table `app_1_blocked_organizations`
--
ALTER TABLE `app_1_blocked_organizations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `App_1_blocked_organizations_7729eba5` (`manager_id`),
  ADD KEY `App_1_blocked_organizations_95c91018` (`organ_id`);

--
-- Indexes for table `app_1_blocked_users`
--
ALTER TABLE `app_1_blocked_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `App_1_blocked_users_7729eba5` (`manager_id`),
  ADD KEY `App_1_blocked_users_18624dd3` (`user_id`);

--
-- Indexes for table `app_1_doctor`
--
ALTER TABLE `app_1_doctor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `App_1_doctor_40ea6cf2` (`Doc_id`),
  ADD KEY `App_1_doctor_d06b3462` (`clinic_id`),
  ADD KEY `App_1_doctor_8a738e00` (`hospital_id`);

--
-- Indexes for table `app_1_hospital`
--
ALTER TABLE `app_1_hospital`
  ADD PRIMARY KEY (`h_id`);

--
-- Indexes for table `app_1_manager`
--
ALTER TABLE `app_1_manager`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_1_multi_analytics`
--
ALTER TABLE `app_1_multi_analytics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `App_1_multi_analytics_1d12f696` (`P_A_id`),
  ADD KEY `App_1_multi_analytics_64687bd0` (`report_id`);

--
-- Indexes for table `app_1_multi_chronic`
--
ALTER TABLE `app_1_multi_chronic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `App_1_multi_chronic_2e9cc234` (`P_C_id`),
  ADD KEY `App_1_multi_chronic_64687bd0` (`report_id`);

--
-- Indexes for table `app_1_multi_medecines`
--
ALTER TABLE `app_1_multi_medecines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `App_1_multi_medecines_2c4ea25b` (`P_M_id`),
  ADD KEY `App_1_multi_medecines_64687bd0` (`report_id`);

--
-- Indexes for table `app_1_multi_rays`
--
ALTER TABLE `app_1_multi_rays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `App_1_multi_rays_3674dce4` (`P_R_id`),
  ADD KEY `App_1_multi_rays_64687bd0` (`report_id`);

--
-- Indexes for table `app_1_organization`
--
ALTER TABLE `app_1_organization`
  ADD PRIMARY KEY (`org_id`),
  ADD KEY `App_1_organization_8a738e00` (`hospital_id`);

--
-- Indexes for table `app_1_patient`
--
ALTER TABLE `app_1_patient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `App_1_patient_f0fc418d` (`Patient_id`);

--
-- Indexes for table `app_1_patient_analytics`
--
ALTER TABLE `app_1_patient_analytics`
  ADD PRIMARY KEY (`P_A_id`),
  ADD KEY `Ap_analy_id_2bd2e730093ef853_fk_App_1_all_analytics_analytics_id` (`analy_id`),
  ADD KEY `App_1_patie_lab_id_6bbc139aa216d3be_fk_App_1_organization_org_id` (`lab_id`),
  ADD KEY `App_1_patient_analyti_pat_id_f48f81c13844687_fk_App_1_patient_id` (`pat_id`);

--
-- Indexes for table `app_1_patient_chronic`
--
ALTER TABLE `app_1_patient_chronic`
  ADD PRIMARY KEY (`P_C_id`),
  ADD KEY `App_1_pa_chr_id_1cfc14106b5ba256_fk_App_1_all_chronic_chronic_id` (`chr_id`),
  ADD KEY `App_1_patient_chroni_pat_id_164590318222eaa9_fk_App_1_patient_id` (`pat_id`);

--
-- Indexes for table `app_1_patient_medicine`
--
ALTER TABLE `app_1_patient_medicine`
  ADD PRIMARY KEY (`P_M_id`),
  ADD KEY `App_1__med_id_31b3e2056a89c3f0_fk_App_1_all_medicine_medicine_id` (`med_id`),
  ADD KEY `App_1_patient_medicin_pat_id_ee5ca3b315547c8_fk_App_1_patient_id` (`pat_id`),
  ADD KEY `App_1__pharmacy_id_49a537c938ce83a4_fk_App_1_organization_org_id` (`pharmacy_id`);

--
-- Indexes for table `app_1_patient_rays`
--
ALTER TABLE `app_1_patient_rays`
  ADD PRIMARY KEY (`P_R_id`),
  ADD KEY `App_1_patie_lab_id_35057bed30cddd8f_fk_App_1_organization_org_id` (`lab_id`),
  ADD KEY `App_1_patient_rays_pat_id_4754d0e4c5a5a4d4_fk_App_1_patient_id` (`pat_id`),
  ADD KEY `App_1_patient_r_ray_id_3f1d6d954d7fc47a_fk_App_1_all_rays_ray_id` (`ray_id`);

--
-- Indexes for table `app_1_prescription`
--
ALTER TABLE `app_1_prescription`
  ADD PRIMARY KEY (`prescription_id`);

--
-- Indexes for table `app_1_report`
--
ALTER TABLE `app_1_report`
  ADD PRIMARY KEY (`report`),
  ADD KEY `App_1_report_doctor_id_6118f2f5eb79ef44_fk_App_1_doctor_id` (`doctor_id`),
  ADD KEY `App_1_report_patient_id_6b646c151313994e_fk_App_1_patient_id` (`patient_id`),
  ADD KEY `f652606d0d4e04823e82ead6bc76e53a` (`prescription_id`),
  ADD KEY `App_1_report_d06b3462` (`clinic_id`),
  ADD KEY `App_1_report_8a738e00` (`hospital_id`);

--
-- Indexes for table `app_1_temp`
--
ALTER TABLE `app_1_temp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `App_1_temp_temp_id_5b35a1bdfb20627a_fk_App_1_admin_id` (`temp_id`);

--
-- Indexes for table `app_1_temp_register`
--
ALTER TABLE `app_1_temp_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_1_user`
--
ALTER TABLE `app_1_user`
  ADD PRIMARY KEY (`user_id`);

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
  ADD UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  ADD KEY `auth_group__permission_id_1fa4136fc0e217de_fk_auth_permission_id` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `content_type_id` (`content_type_id`,`codename`);

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
  ADD UNIQUE KEY `user_id` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_584c3ac15922030e_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  ADD KEY `auth_user_u_permission_id_52216444ac7d6c4f_fk_auth_permission_id` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `djang_content_type_id_698c4935a3c2cb6f_fk_django_content_type_id` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_45a7dda0a86b481_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_30d5ad13adb34c3b_uniq` (`app_label`,`model`);

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
  ADD KEY `django_session_de54fa62` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_1_admin`
--
ALTER TABLE `app_1_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_1_all_analytics`
--
ALTER TABLE `app_1_all_analytics`
  MODIFY `analytics_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app_1_all_chronic`
--
ALTER TABLE `app_1_all_chronic`
  MODIFY `chronic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app_1_all_medicine`
--
ALTER TABLE `app_1_all_medicine`
  MODIFY `medicine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app_1_all_rays`
--
ALTER TABLE `app_1_all_rays`
  MODIFY `ray_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app_1_blocked_hospitals`
--
ALTER TABLE `app_1_blocked_hospitals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_1_blocked_organizations`
--
ALTER TABLE `app_1_blocked_organizations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_1_blocked_users`
--
ALTER TABLE `app_1_blocked_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_1_doctor`
--
ALTER TABLE `app_1_doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app_1_hospital`
--
ALTER TABLE `app_1_hospital`
  MODIFY `h_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `app_1_manager`
--
ALTER TABLE `app_1_manager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_1_multi_analytics`
--
ALTER TABLE `app_1_multi_analytics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `app_1_multi_chronic`
--
ALTER TABLE `app_1_multi_chronic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app_1_multi_medecines`
--
ALTER TABLE `app_1_multi_medecines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app_1_multi_rays`
--
ALTER TABLE `app_1_multi_rays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app_1_organization`
--
ALTER TABLE `app_1_organization`
  MODIFY `org_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `app_1_patient`
--
ALTER TABLE `app_1_patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `app_1_patient_analytics`
--
ALTER TABLE `app_1_patient_analytics`
  MODIFY `P_A_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `app_1_patient_chronic`
--
ALTER TABLE `app_1_patient_chronic`
  MODIFY `P_C_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app_1_patient_medicine`
--
ALTER TABLE `app_1_patient_medicine`
  MODIFY `P_M_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app_1_patient_rays`
--
ALTER TABLE `app_1_patient_rays`
  MODIFY `P_R_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app_1_prescription`
--
ALTER TABLE `app_1_prescription`
  MODIFY `prescription_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `app_1_report`
--
ALTER TABLE `app_1_report`
  MODIFY `report` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `app_1_temp`
--
ALTER TABLE `app_1_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_1_temp_register`
--
ALTER TABLE `app_1_temp_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `app_1_user`
--
ALTER TABLE `app_1_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `app_1_blocked_hospitals`
--
ALTER TABLE `app_1_blocked_hospitals`
  ADD CONSTRAINT `App_1_blocke_hospital_id_65efd3bc9f0379fc_fk_App_1_hospital_h_id` FOREIGN KEY (`hospital_id`) REFERENCES `app_1_hospital` (`h_id`),
  ADD CONSTRAINT `App_1_blocked_hos_manager_id_f855d661d8d5ede_fk_App_1_manager_id` FOREIGN KEY (`manager_id`) REFERENCES `app_1_manager` (`id`);

--
-- Constraints for table `app_1_blocked_organizations`
--
ALTER TABLE `app_1_blocked_organizations`
  ADD CONSTRAINT `App_1_blo_organ_id_1d7e7e35ac51ec46_fk_App_1_organization_org_id` FOREIGN KEY (`organ_id`) REFERENCES `app_1_organization` (`org_id`),
  ADD CONSTRAINT `App_1_blocked_or_manager_id_7651f5ba9297a158_fk_App_1_manager_id` FOREIGN KEY (`manager_id`) REFERENCES `app_1_manager` (`id`);

--
-- Constraints for table `app_1_blocked_users`
--
ALTER TABLE `app_1_blocked_users`
  ADD CONSTRAINT `App_1_blocked_us_manager_id_760bb5d6e52d755c_fk_App_1_manager_id` FOREIGN KEY (`manager_id`) REFERENCES `app_1_manager` (`id`),
  ADD CONSTRAINT `App_1_blocked_user_user_id_3d814aa2e1c7b39_fk_App_1_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `app_1_user` (`user_id`);

--
-- Constraints for table `app_1_doctor`
--
ALTER TABLE `app_1_doctor`
  ADD CONSTRAINT `App_1_do_clinic_id_319bedd124714e68_fk_App_1_organization_org_id` FOREIGN KEY (`clinic_id`) REFERENCES `app_1_organization` (`org_id`),
  ADD CONSTRAINT `App_1_doctor_Doc_id_2eb2bf30a60a2437_fk_App_1_user_user_id` FOREIGN KEY (`Doc_id`) REFERENCES `app_1_user` (`user_id`),
  ADD CONSTRAINT `App_1_doctor_hospital_id_441db4913ba04198_fk_App_1_hospital_h_id` FOREIGN KEY (`hospital_id`) REFERENCES `app_1_hospital` (`h_id`);

--
-- Constraints for table `app_1_multi_analytics`
--
ALTER TABLE `app_1_multi_analytics`
  ADD CONSTRAINT `App_1__P_A_id_1565e482b72bab64_fk_App_1_patient_analytics_P_A_id` FOREIGN KEY (`P_A_id`) REFERENCES `app_1_patient_analytics` (`P_A_id`),
  ADD CONSTRAINT `App_1_multi__report_id_37a88f55274f73b_fk_App_1_report_report_id` FOREIGN KEY (`report_id`) REFERENCES `app_1_report` (`report`);

--
-- Constraints for table `app_1_multi_chronic`
--
ALTER TABLE `app_1_multi_chronic`
  ADD CONSTRAINT `App_1_mu_P_C_id_5ea05ad41c084bd3_fk_App_1_patient_chronic_P_C_id` FOREIGN KEY (`P_C_id`) REFERENCES `app_1_patient_chronic` (`P_C_id`),
  ADD CONSTRAINT `App_1_multi_report_id_1836893fd6205585_fk_App_1_report_report_id` FOREIGN KEY (`report_id`) REFERENCES `app_1_report` (`report`);

--
-- Constraints for table `app_1_multi_medecines`
--
ALTER TABLE `app_1_multi_medecines`
  ADD CONSTRAINT `App_1_m_P_M_id_24de5509e4b94d98_fk_App_1_patient_medicine_P_M_id` FOREIGN KEY (`P_M_id`) REFERENCES `app_1_patient_medicine` (`P_M_id`),
  ADD CONSTRAINT `App_1_multi_report_id_2c4401b264337354_fk_App_1_report_report_id` FOREIGN KEY (`report_id`) REFERENCES `app_1_report` (`report`);

--
-- Constraints for table `app_1_multi_rays`
--
ALTER TABLE `app_1_multi_rays`
  ADD CONSTRAINT `App_1_multi_P_R_id_364a4ee20bd73a7f_fk_App_1_patient_rays_P_R_id` FOREIGN KEY (`P_R_id`) REFERENCES `app_1_patient_rays` (`P_R_id`),
  ADD CONSTRAINT `App_1_multi_report_id_74274a11ce7819cf_fk_App_1_report_report_id` FOREIGN KEY (`report_id`) REFERENCES `app_1_report` (`report`);

--
-- Constraints for table `app_1_organization`
--
ALTER TABLE `app_1_organization`
  ADD CONSTRAINT `App_1_organi_hospital_id_2bff8369ccf5bc25_fk_App_1_hospital_h_id` FOREIGN KEY (`hospital_id`) REFERENCES `app_1_hospital` (`h_id`);

--
-- Constraints for table `app_1_patient`
--
ALTER TABLE `app_1_patient`
  ADD CONSTRAINT `App_1_patient_Patient_id_7d771aa72f398619_fk_App_1_user_user_id` FOREIGN KEY (`Patient_id`) REFERENCES `app_1_user` (`user_id`);

--
-- Constraints for table `app_1_patient_analytics`
--
ALTER TABLE `app_1_patient_analytics`
  ADD CONSTRAINT `Ap_analy_id_2bd2e730093ef853_fk_App_1_all_analytics_analytics_id` FOREIGN KEY (`analy_id`) REFERENCES `app_1_all_analytics` (`analytics_id`),
  ADD CONSTRAINT `App_1_patie_lab_id_6bbc139aa216d3be_fk_App_1_organization_org_id` FOREIGN KEY (`lab_id`) REFERENCES `app_1_organization` (`org_id`),
  ADD CONSTRAINT `App_1_patient_analyti_pat_id_f48f81c13844687_fk_App_1_patient_id` FOREIGN KEY (`pat_id`) REFERENCES `app_1_patient` (`id`);

--
-- Constraints for table `app_1_patient_chronic`
--
ALTER TABLE `app_1_patient_chronic`
  ADD CONSTRAINT `App_1_pa_chr_id_1cfc14106b5ba256_fk_App_1_all_chronic_chronic_id` FOREIGN KEY (`chr_id`) REFERENCES `app_1_all_chronic` (`chronic_id`),
  ADD CONSTRAINT `App_1_patient_chroni_pat_id_164590318222eaa9_fk_App_1_patient_id` FOREIGN KEY (`pat_id`) REFERENCES `app_1_patient` (`id`);

--
-- Constraints for table `app_1_patient_medicine`
--
ALTER TABLE `app_1_patient_medicine`
  ADD CONSTRAINT `App_1__med_id_31b3e2056a89c3f0_fk_App_1_all_medicine_medicine_id` FOREIGN KEY (`med_id`) REFERENCES `app_1_all_medicine` (`medicine_id`),
  ADD CONSTRAINT `App_1__pharmacy_id_49a537c938ce83a4_fk_App_1_organization_org_id` FOREIGN KEY (`pharmacy_id`) REFERENCES `app_1_organization` (`org_id`),
  ADD CONSTRAINT `App_1_patient_medicin_pat_id_ee5ca3b315547c8_fk_App_1_patient_id` FOREIGN KEY (`pat_id`) REFERENCES `app_1_patient` (`id`);

--
-- Constraints for table `app_1_patient_rays`
--
ALTER TABLE `app_1_patient_rays`
  ADD CONSTRAINT `App_1_patie_lab_id_35057bed30cddd8f_fk_App_1_organization_org_id` FOREIGN KEY (`lab_id`) REFERENCES `app_1_organization` (`org_id`),
  ADD CONSTRAINT `App_1_patient_r_ray_id_3f1d6d954d7fc47a_fk_App_1_all_rays_ray_id` FOREIGN KEY (`ray_id`) REFERENCES `app_1_all_rays` (`ray_id`),
  ADD CONSTRAINT `App_1_patient_rays_pat_id_4754d0e4c5a5a4d4_fk_App_1_patient_id` FOREIGN KEY (`pat_id`) REFERENCES `app_1_patient` (`id`);

--
-- Constraints for table `app_1_report`
--
ALTER TABLE `app_1_report`
  ADD CONSTRAINT `App_1_re_clinic_id_17a96544a1f627b6_fk_App_1_organization_org_id` FOREIGN KEY (`clinic_id`) REFERENCES `app_1_organization` (`org_id`),
  ADD CONSTRAINT `App_1_report_doctor_id_6118f2f5eb79ef44_fk_App_1_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `app_1_doctor` (`id`),
  ADD CONSTRAINT `App_1_report_hospital_id_2dead57ff4be484a_fk_App_1_hospital_h_id` FOREIGN KEY (`hospital_id`) REFERENCES `app_1_hospital` (`h_id`),
  ADD CONSTRAINT `App_1_report_patient_id_6b646c151313994e_fk_App_1_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `app_1_patient` (`id`),
  ADD CONSTRAINT `f652606d0d4e04823e82ead6bc76e53a` FOREIGN KEY (`prescription_id`) REFERENCES `app_1_prescription` (`prescription_id`);

--
-- Constraints for table `app_1_temp`
--
ALTER TABLE `app_1_temp`
  ADD CONSTRAINT `App_1_temp_temp_id_5b35a1bdfb20627a_fk_App_1_admin_id` FOREIGN KEY (`temp_id`) REFERENCES `app_1_admin` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group__permission_id_1fa4136fc0e217de_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permission_group_id_544f7b0afcbee193_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth__content_type_id_4933cdd6ba9bab85_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_584c3ac15922030e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_20d24c764504f59b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_u_permission_id_52216444ac7d6c4f_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissi_user_id_44ee8373f955e9bb_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `djang_content_type_id_698c4935a3c2cb6f_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_45a7dda0a86b481_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
