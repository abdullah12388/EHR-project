-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2018 at 04:30 PM
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
-- Table structure for table `all_analytics`
--

CREATE TABLE `all_analytics` (
  `analytics_id` int(11) NOT NULL,
  `analytics_name` varchar(500) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `all_analytics`
--

INSERT INTO `all_analytics` (`analytics_id`, `analytics_name`) VALUES
(1, 'first analytic'),
(2, 'second analytic'),
(3, 'third analytic');

-- --------------------------------------------------------

--
-- Table structure for table `all_chronic`
--

CREATE TABLE `all_chronic` (
  `chronic_id` int(11) NOT NULL,
  `chronic_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `all_chronic`
--

INSERT INTO `all_chronic` (`chronic_id`, `chronic_name`) VALUES
(1, 'first chronic'),
(2, 'second chronic'),
(3, 'third chronic');

-- --------------------------------------------------------

--
-- Table structure for table `all_medecine`
--

CREATE TABLE `all_medecine` (
  `medecine_id` int(11) NOT NULL,
  `medecine_name` varchar(500) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `medecine_code` text COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `all_medecine`
--

INSERT INTO `all_medecine` (`medecine_id`, `medecine_name`, `medecine_code`) VALUES
(1, 'first medecine', '001'),
(2, 'second medecine', '002'),
(3, 'third medecine', '003');

-- --------------------------------------------------------

--
-- Table structure for table `all_rays`
--

CREATE TABLE `all_rays` (
  `rays_id` int(11) NOT NULL,
  `rays_name` varchar(500) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `all_rays`
--

INSERT INTO `all_rays` (`rays_id`, `rays_name`) VALUES
(1, 'first ray'),
(2, 'second ray'),
(3, 'third ray');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `Doc_id` int(11) NOT NULL,
  `Registration_num` varchar(50) NOT NULL,
  `Specialization` varchar(500) NOT NULL,
  `Registration_date` date NOT NULL,
  `licence` varchar(50) NOT NULL,
  `Last_date_payment` date NOT NULL,
  `End_date` date NOT NULL,
  `Specialization_type` varchar(500) NOT NULL,
  `University` varchar(500) NOT NULL,
  `Work_place` varchar(500) NOT NULL,
  `Sub_syndicate` varchar(500) NOT NULL,
  `General_secretary` varchar(500) NOT NULL,
  `Working_till` date NOT NULL,
  `Graduation_year` year(4) NOT NULL,
  `hospitoal__id` int(11) DEFAULT NULL,
  `clinic__id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`Doc_id`, `Registration_num`, `Specialization`, `Registration_date`, `licence`, `Last_date_payment`, `End_date`, `Specialization_type`, `University`, `Work_place`, `Sub_syndicate`, `General_secretary`, `Working_till`, `Graduation_year`, `hospitoal__id`, `clinic__id`) VALUES
(1, '22254', 'Heart', '2018-12-03', '126587423588', '2018-12-05', '2018-12-04', 'heart diseases', 'Helwan', 'Cairo', 'aaaa', 'aa', '2018-12-11', 2015, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `h_id` int(11) NOT NULL,
  `h_name` varchar(500) NOT NULL,
  `h_country` varchar(500) NOT NULL,
  `h_state` varchar(500) NOT NULL,
  `h_city` varchar(500) NOT NULL,
  `h_street` varchar(500) NOT NULL,
  `h_zipcode` int(11) NOT NULL,
  `h_phone_num` varchar(100) NOT NULL,
  `h_type` varchar(100) NOT NULL,
  `h_ownership` varchar(100) NOT NULL,
  `h_emergency_service` tinyint(1) NOT NULL,
  `h_date` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `website` longtext NOT NULL,
  `logo` longtext NOT NULL,
  `internal_medicine` int(5) NOT NULL,
  `cardiology` int(5) NOT NULL,
  `endocrinology` int(5) NOT NULL,
  `hematology` int(5) NOT NULL,
  `nephrology` int(5) NOT NULL,
  `surgery` int(5) NOT NULL,
  `pediatric` int(5) NOT NULL,
  `obstertics_genacology` int(5) NOT NULL,
  `ophthalmologist` int(5) NOT NULL,
  `neurology` int(5) NOT NULL,
  `Ear_nose_threat` int(5) NOT NULL,
  `urology` int(5) NOT NULL,
  `dermatology` int(5) NOT NULL,
  `hepatology` int(5) NOT NULL,
  `Radiology` int(5) NOT NULL,
  `psychiatry` int(5) NOT NULL,
  `dentistry` int(5) NOT NULL,
  `forensic_medicine` int(5) NOT NULL,
  `enatony` int(5) NOT NULL,
  `num_of_bed` int(11) NOT NULL,
  `hr_username` varchar(100) NOT NULL,
  `hr_password` varchar(100) NOT NULL,
  `creation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`h_id`, `h_name`, `h_country`, `h_state`, `h_city`, `h_street`, `h_zipcode`, `h_phone_num`, `h_type`, `h_ownership`, `h_emergency_service`, `h_date`, `email`, `website`, `logo`, `internal_medicine`, `cardiology`, `endocrinology`, `hematology`, `nephrology`, `surgery`, `pediatric`, `obstertics_genacology`, `ophthalmologist`, `neurology`, `Ear_nose_threat`, `urology`, `dermatology`, `hepatology`, `Radiology`, `psychiatry`, `dentistry`, `forensic_medicine`, `enatony`, `num_of_bed`, `hr_username`, `hr_password`, `creation_date`) VALUES
(1, 'El-Aman', 'Egypt', 'Cairo', 'Helwan', 'El-Ra\'ed', 192228, '26874669', 'public', 'Mostafa Hegazy', 1, '2018-12-05', 'info@elaman.com', 'https://www.elamaneg.com', 'aaaaaaaaaaaaaaaaaaaaaaaaggggg', 1, 1, 1, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'elamn_hr@ehr.com', '12346', '2018-12-05');

-- --------------------------------------------------------

--
-- Table structure for table `multi_analytics`
--

CREATE TABLE `multi_analytics` (
  `report_id` int(11) NOT NULL,
  `P_A_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `multi_analytics`
--

INSERT INTO `multi_analytics` (`report_id`, `P_A_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `multi_chronic`
--

CREATE TABLE `multi_chronic` (
  `report_id` int(11) NOT NULL,
  `P_C_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `multi_chronic`
--

INSERT INTO `multi_chronic` (`report_id`, `P_C_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `multi_medecines`
--

CREATE TABLE `multi_medecines` (
  `report_id` int(11) NOT NULL,
  `P_M_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `multi_medecines`
--

INSERT INTO `multi_medecines` (`report_id`, `P_M_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `multi_rays`
--

CREATE TABLE `multi_rays` (
  `report_id` int(11) NOT NULL,
  `P_R_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `multi_rays`
--

INSERT INTO `multi_rays` (`report_id`, `P_R_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE `organization` (
  `org_id` int(11) NOT NULL,
  `org_name` varchar(500) NOT NULL,
  `org_country` varchar(500) NOT NULL,
  `org_state` varchar(500) NOT NULL,
  `org_city` varchar(500) NOT NULL,
  `org_zipcode` varchar(500) NOT NULL,
  `org_phone_num` varchar(100) NOT NULL,
  `org_email` varchar(100) NOT NULL,
  `org_website` longtext NOT NULL,
  `org_logo` longtext NOT NULL,
  `hr_username` varchar(500) NOT NULL,
  `hr_password` varchar(500) NOT NULL,
  `creation_date` date NOT NULL,
  `type` int(11) NOT NULL,
  `hospital_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`org_id`, `org_name`, `org_country`, `org_state`, `org_city`, `org_zipcode`, `org_phone_num`, `org_email`, `org_website`, `org_logo`, `hr_username`, `hr_password`, `creation_date`, `type`, `hospital_id`) VALUES
(1, 'El-\'aman', 'Egypt', 'Cairo', 'Helwan', '111597', '0114875634', 'el\'man_phar@gmail.com', 'elamaneg.com', 'wwwwwwwwwwwwwwwwwwwwwww', 'ahmed', '123587463', '2018-12-28', 2, 1),
(2, 'El-Porg', 'Egypt', 'Cairo', 'Nasr City', '111597', '0122874536', 'el_porg_lab@gmail.com', 'elamaneg.com', 'wwwwwwwwwwwwwwwwwwwwwww', 'Elsam@gmail.com', '123587463', '2018-12-28', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `Patient_id` int(11) NOT NULL,
  `Emergency_contact` varchar(50) NOT NULL,
  `QR_code` longtext NOT NULL,
  `Disability_status` tinyint(1) NOT NULL,
  `Height` float NOT NULL,
  `Weight` float NOT NULL,
  `Blood_type` varchar(50) NOT NULL,
  `Chronic_diseases` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`Patient_id`, `Emergency_contact`, `QR_code`, `Disability_status`, `Height`, `Weight`, `Blood_type`, `Chronic_diseases`) VALUES
(2, '119', 'ssssssssssssss', 0, 170, 50.1, 'c', 0);

-- --------------------------------------------------------

--
-- Table structure for table `patient_analytics`
--

CREATE TABLE `patient_analytics` (
  `P_A_id` int(11) NOT NULL,
  `pat_id` int(11) NOT NULL,
  `analy_id` int(11) NOT NULL,
  `analytics_code` text,
  `analytics_result` text,
  `lab_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_analytics`
--

INSERT INTO `patient_analytics` (`P_A_id`, `pat_id`, `analy_id`, `analytics_code`, `analytics_result`, `lab_id`) VALUES
(1, 2, 1, '111', 'results', 2);

-- --------------------------------------------------------

--
-- Table structure for table `patient_chronic`
--

CREATE TABLE `patient_chronic` (
  `P_C_id` int(11) NOT NULL,
  `pat_id` int(11) NOT NULL,
  `chr_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_chronic`
--

INSERT INTO `patient_chronic` (`P_C_id`, `pat_id`, `chr_id`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `patient_medecine`
--

CREATE TABLE `patient_medecine` (
  `P_M_id` int(11) NOT NULL,
  `pat_id` int(11) NOT NULL,
  `med_id` int(11) NOT NULL,
  `number_of_potions` int(11) NOT NULL,
  `number_of_pills` int(11) NOT NULL,
  `medecine_submit` tinyint(4) NOT NULL,
  `pharmacy_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_medecine`
--

INSERT INTO `patient_medecine` (`P_M_id`, `pat_id`, `med_id`, `number_of_potions`, `number_of_pills`, `medecine_submit`, `pharmacy_id`) VALUES
(1, 2, 2, 4, 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `patient_rays`
--

CREATE TABLE `patient_rays` (
  `P_R_id` int(11) NOT NULL,
  `pat_id` int(11) NOT NULL,
  `ray_id` int(11) NOT NULL,
  `rays_code` text NOT NULL,
  `rays_result` text,
  `lab_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_rays`
--

INSERT INTO `patient_rays` (`P_R_id`, `pat_id`, `ray_id`, `rays_code`, `rays_result`, `lab_id`) VALUES
(1, 2, 2, '002', 'result', 2);

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `prescription_id` int(11) NOT NULL,
  `Disease_name` varchar(100) NOT NULL,
  `Disease_code` varchar(50) NOT NULL,
  `Disease_level` varchar(50) NOT NULL,
  `Disease_disc` longtext NOT NULL,
  `Doctor_signature` varchar(100) NOT NULL,
  `Submit_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`prescription_id`, `Disease_name`, `Disease_code`, `Disease_level`, `Disease_disc`, `Doctor_signature`, `Submit_date`) VALUES
(1, 'flocanezma', '0125', 'medium', 'asdsadcxsdgtgjhgfnhfgdjdthye\\arfgvgsgsfvcrgsfdga', 'TEha', '2018-12-03');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `report_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `prescription_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`report_id`, `patient_id`, `prescription_id`, `doctor_id`) VALUES
(1, 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `gender` int(1) NOT NULL,
  `country` varchar(500) NOT NULL,
  `state` varchar(500) NOT NULL,
  `city` varchar(500) NOT NULL,
  `street` varchar(500) NOT NULL,
  `zip_code` varchar(20) NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `Home_phone_num` varchar(50) NOT NULL,
  `Work_phone_num` varchar(50) NOT NULL,
  `Date_of_birth` date NOT NULL,
  `marital_status` varchar(50) NOT NULL,
  `Child_num` int(2) NOT NULL,
  `E-mail_1` varchar(500) NOT NULL,
  `E-mail_2` varchar(500) NOT NULL,
  `Nationality` varchar(500) NOT NULL,
  `Profile_picture` varchar(500) NOT NULL,
  `Jop_name` varchar(500) NOT NULL,
  `Jop_organization` varchar(500) NOT NULL,
  `Jop_place` varchar(500) NOT NULL,
  `Ssn` varchar(500) NOT NULL,
  `Ssn_id` varchar(500) NOT NULL,
  `Password` varchar(500) NOT NULL,
  `User_type` int(2) NOT NULL,
  `Create_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `middle_name`, `last_name`, `gender`, `country`, `state`, `city`, `street`, `zip_code`, `phone_num`, `Home_phone_num`, `Work_phone_num`, `Date_of_birth`, `marital_status`, `Child_num`, `E-mail_1`, `E-mail_2`, `Nationality`, `Profile_picture`, `Jop_name`, `Jop_organization`, `Jop_place`, `Ssn`, `Ssn_id`, `Password`, `User_type`, `Create_date`) VALUES
(1, 'Emad', 'Hegazy', 'Ahmed', 1, 'Egypt', 'Cairo', 'El-Matarya', 'El-Matarawy', '193335', '0101684536', '02786412', '02856974', '2018-12-04', 'single', 2, 'hegazy@gmail.com', '-------', 'Egyptian', 'afawfawfsadcsdfrgjl,knbv b', 'Doctor', 'Elhegazy Hospital', 'Cairo', '1112368752349871', '1247841354984336', 'abcdef12345678', 1, '2018-12-05'),
(2, 'Abdul-fatah', 'Ramadan', 'Abdul-fatah', 1, 'Egypt', 'Alexandria', 'Myami', 'El-mo\'z', '115873', '01141336724', '0226527189', '268527189', '2018-12-05', 'single', 0, 'tteha43@gmail.com', 'abdelfata.ramadan42@gmail.com', 'Egyptian', 'ghhhdsyraaa', 'Pragrammer', 'ACIM company', 'Cairo', '11257874356', '12345874138/', 'abcdet123485', 2, '2018-12-05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `all_analytics`
--
ALTER TABLE `all_analytics`
  ADD PRIMARY KEY (`analytics_id`);

--
-- Indexes for table `all_chronic`
--
ALTER TABLE `all_chronic`
  ADD PRIMARY KEY (`chronic_id`);

--
-- Indexes for table `all_medecine`
--
ALTER TABLE `all_medecine`
  ADD PRIMARY KEY (`medecine_id`);

--
-- Indexes for table `all_rays`
--
ALTER TABLE `all_rays`
  ADD PRIMARY KEY (`rays_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`Doc_id`),
  ADD KEY `hospital___id` (`hospitoal__id`),
  ADD KEY `clinic__id` (`clinic__id`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`h_id`);

--
-- Indexes for table `multi_analytics`
--
ALTER TABLE `multi_analytics`
  ADD KEY `report__id` (`report_id`),
  ADD KEY `P_A_id_` (`P_A_id`);

--
-- Indexes for table `multi_chronic`
--
ALTER TABLE `multi_chronic`
  ADD KEY `report_____id` (`report_id`),
  ADD KEY `P_C_id_` (`P_C_id`);

--
-- Indexes for table `multi_medecines`
--
ALTER TABLE `multi_medecines`
  ADD KEY `report___id` (`report_id`),
  ADD KEY `P_M_id_` (`P_M_id`);

--
-- Indexes for table `multi_rays`
--
ALTER TABLE `multi_rays`
  ADD KEY `report____id` (`report_id`),
  ADD KEY `P_R_id_` (`P_R_id`);

--
-- Indexes for table `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`org_id`),
  ADD KEY `hospital_id` (`hospital_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`Patient_id`);

--
-- Indexes for table `patient_analytics`
--
ALTER TABLE `patient_analytics`
  ADD PRIMARY KEY (`P_A_id`),
  ADD KEY `pat__id` (`pat_id`),
  ADD KEY `anly_id` (`analy_id`),
  ADD KEY `lab__id` (`lab_id`);

--
-- Indexes for table `patient_chronic`
--
ALTER TABLE `patient_chronic`
  ADD PRIMARY KEY (`P_C_id`),
  ADD KEY `pat_id` (`pat_id`),
  ADD KEY `chr_id` (`chr_id`);

--
-- Indexes for table `patient_medecine`
--
ALTER TABLE `patient_medecine`
  ADD PRIMARY KEY (`P_M_id`),
  ADD KEY `pat___id` (`pat_id`),
  ADD KEY `medec_id` (`med_id`),
  ADD KEY `pharmacy__id` (`pharmacy_id`);

--
-- Indexes for table `patient_rays`
--
ALTER TABLE `patient_rays`
  ADD PRIMARY KEY (`P_R_id`),
  ADD KEY `pat____id` (`pat_id`),
  ADD KEY `ray__id` (`ray_id`),
  ADD KEY `lab___id` (`lab_id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`prescription_id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `patient__id` (`patient_id`),
  ADD KEY `prescription__id` (`prescription_id`),
  ADD KEY `doctor__id` (`doctor_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `all_analytics`
--
ALTER TABLE `all_analytics`
  MODIFY `analytics_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `all_chronic`
--
ALTER TABLE `all_chronic`
  MODIFY `chronic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `all_medecine`
--
ALTER TABLE `all_medecine`
  MODIFY `medecine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `all_rays`
--
ALTER TABLE `all_rays`
  MODIFY `rays_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `Doc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `h_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `organization`
--
ALTER TABLE `organization`
  MODIFY `org_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `Patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `patient_analytics`
--
ALTER TABLE `patient_analytics`
  MODIFY `P_A_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `patient_chronic`
--
ALTER TABLE `patient_chronic`
  MODIFY `P_C_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `patient_medecine`
--
ALTER TABLE `patient_medecine`
  MODIFY `P_M_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `patient_rays`
--
ALTER TABLE `patient_rays`
  MODIFY `P_R_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `prescription_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `D_U_Fk` FOREIGN KEY (`Doc_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hospital___id` FOREIGN KEY (`hospitoal__id`) REFERENCES `hospital` (`h_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `org___id` FOREIGN KEY (`clinic__id`) REFERENCES `organization` (`org_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `multi_analytics`
--
ALTER TABLE `multi_analytics`
  ADD CONSTRAINT `P_A_id_` FOREIGN KEY (`P_A_id`) REFERENCES `patient_analytics` (`P_A_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `report__id` FOREIGN KEY (`report_id`) REFERENCES `report` (`report_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `multi_chronic`
--
ALTER TABLE `multi_chronic`
  ADD CONSTRAINT `P_C_id_` FOREIGN KEY (`P_C_id`) REFERENCES `patient_chronic` (`P_C_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `report_____id` FOREIGN KEY (`report_id`) REFERENCES `report` (`report_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `multi_medecines`
--
ALTER TABLE `multi_medecines`
  ADD CONSTRAINT `P_M_id_` FOREIGN KEY (`P_M_id`) REFERENCES `patient_medecine` (`P_M_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `report___id` FOREIGN KEY (`report_id`) REFERENCES `report` (`report_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `multi_rays`
--
ALTER TABLE `multi_rays`
  ADD CONSTRAINT `P_R_id_` FOREIGN KEY (`P_R_id`) REFERENCES `patient_rays` (`P_R_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `report____id` FOREIGN KEY (`report_id`) REFERENCES `report` (`report_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `organization`
--
ALTER TABLE `organization`
  ADD CONSTRAINT `hospital_id` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`h_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `P_F_K` FOREIGN KEY (`Patient_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patient_analytics`
--
ALTER TABLE `patient_analytics`
  ADD CONSTRAINT `analy_id` FOREIGN KEY (`analy_id`) REFERENCES `all_analytics` (`analytics_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lab__id` FOREIGN KEY (`lab_id`) REFERENCES `organization` (`org_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pat_id` FOREIGN KEY (`pat_id`) REFERENCES `patient` (`Patient_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patient_chronic`
--
ALTER TABLE `patient_chronic`
  ADD CONSTRAINT `chro_id` FOREIGN KEY (`chr_id`) REFERENCES `all_chronic` (`chronic_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pat__ id` FOREIGN KEY (`pat_id`) REFERENCES `patient` (`Patient_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patient_medecine`
--
ALTER TABLE `patient_medecine`
  ADD CONSTRAINT `med__id` FOREIGN KEY (`med_id`) REFERENCES `all_medecine` (`medecine_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pat___id` FOREIGN KEY (`pat_id`) REFERENCES `patient` (`Patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pharmacy__id` FOREIGN KEY (`pharmacy_id`) REFERENCES `organization` (`org_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patient_rays`
--
ALTER TABLE `patient_rays`
  ADD CONSTRAINT `lab___id` FOREIGN KEY (`lab_id`) REFERENCES `organization` (`org_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pat_____id` FOREIGN KEY (`pat_id`) REFERENCES `patient` (`Patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ray__id` FOREIGN KEY (`ray_id`) REFERENCES `all_rays` (`rays_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `doctor__id` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`Doc_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient__id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`Patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prescription__id` FOREIGN KEY (`prescription_id`) REFERENCES `prescription` (`prescription_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
