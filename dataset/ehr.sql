-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2018 at 02:40 PM
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
-- Table structure for table `analytics`
--

CREATE TABLE `analytics` (
  `analytics_id` int(11) NOT NULL,
  `analytics_name` varchar(100) NOT NULL,
  `analytics_code` varchar(50) NOT NULL,
  `analytics_result` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `chronic`
--

CREATE TABLE `chronic` (
  `chronic_id` int(11) NOT NULL,
  `chronic_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `Graduation_year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `ph_username` varchar(100) NOT NULL,
  `ph_password` varchar(100) NOT NULL,
  `lab_username` varchar(100) NOT NULL,
  `lab_password` varchar(100) NOT NULL,
  `creation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `medicine_id` int(11) NOT NULL,
  `medicine_name` varchar(100) NOT NULL,
  `medicine_code` varchar(50) NOT NULL,
  `number_of_potions` int(11) NOT NULL,
  `number_of_pills` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Table structure for table `patient_chronic`
--

CREATE TABLE `patient_chronic` (
  `pat_id` int(11) NOT NULL,
  `chr_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `prescription_id` int(11) NOT NULL,
  `p_p_fk` int(11) NOT NULL,
  `Disease_name` varchar(100) NOT NULL,
  `Disease_code` varchar(50) NOT NULL,
  `Disease_level` varchar(50) NOT NULL,
  `Disease_disc` longtext NOT NULL,
  `Doctor_signature` varchar(100) NOT NULL,
  `Submit_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rays`
--

CREATE TABLE `rays` (
  `rays_id` int(11) NOT NULL,
  `rays_name` varchar(100) NOT NULL,
  `rays_code` varchar(50) NOT NULL,
  `rays_result` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Indexes for dumped tables
--

--
-- Indexes for table `chronic`
--
ALTER TABLE `chronic`
  ADD PRIMARY KEY (`chronic_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`Doc_id`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`h_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`Patient_id`);

--
-- Indexes for table `patient_chronic`
--
ALTER TABLE `patient_chronic`
  ADD KEY `pat_id` (`pat_id`),
  ADD KEY `chr_id` (`chr_id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`prescription_id`),
  ADD KEY `p_p_fk` (`p_p_fk`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `D_U_Fk` FOREIGN KEY (`Doc_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `P_U_Fk` FOREIGN KEY (`Patient_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patient_chronic`
--
ALTER TABLE `patient_chronic`
  ADD CONSTRAINT `chr_id` FOREIGN KEY (`chr_id`) REFERENCES `chronic` (`chronic_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pat_id` FOREIGN KEY (`pat_id`) REFERENCES `patient` (`Patient_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `p_p_fk` FOREIGN KEY (`p_p_fk`) REFERENCES `patient` (`Patient_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
