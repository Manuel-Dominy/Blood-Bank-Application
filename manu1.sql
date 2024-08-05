-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 27, 2024 at 06:00 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `manu`
--

-- --------------------------------------------------------

--
-- Table structure for table `blood`
--

CREATE TABLE `blood` (
  `cost` int(11) NOT NULL,
  `cod` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `bno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blood`
--

INSERT INTO `blood` (`cost`, `cod`, `bid`, `bno`) VALUES
(1000, 2, 7036, 2),
(900, 4, 7099, 3),
(1100, 5, 7002, 4),
(1125, 7, 7001, 1),
(1200, 267, 3923, 311),
(1000, 334, 7471, 841),
(1500, 408, 5311, 605),
(2000, 708, 8253, 624),
(800, 1011, 9636, 427),
(2300, 1560, 6413, 50),
(900, 1846, 3933, 651),
(1300, 1909, 6535, 185);

-- --------------------------------------------------------

--
-- Table structure for table `bloodbank`
--

CREATE TABLE `bloodbank` (
  `amount` int(11) NOT NULL,
  `b_no` int(11) NOT NULL,
  `hname` varchar(20) NOT NULL,
  `bloodtype` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bloodbank`
--

INSERT INTO `bloodbank` (`amount`, `b_no`, `hname`, `bloodtype`) VALUES
(2, 1, 'IMA Blood Bank', 'A+'),
(1, 2, 'IMA Blood Bank', 'A-'),
(1, 3, 'IMA Blood Bank', 'O+'),
(1, 4, 'IMA Blood Bank', 'O-'),
(1, 50, 'IMA Blood Bank', 'AB+'),
(1, 185, 'IMA Blood Bank', 'A+'),
(2, 311, 'SKP hospital', 'A+'),
(4, 427, 'IMA Blood Bank', 'O+'),
(5, 605, 'Sheela Hospital', 'O+'),
(2, 624, 'IMA Blood Bank', 'A+'),
(2, 651, 'IMA Blood Bank', 'AB-'),
(1, 821, 'IMA Blood Bank', 'A+'),
(1, 841, 'IMA Blood Bank', 'A+');

-- --------------------------------------------------------

--
-- Table structure for table `donor`
--

CREATE TABLE `donor` (
  `phno` varchar(10) NOT NULL,
  `address` text NOT NULL,
  `age` int(11) NOT NULL,
  `sex` text NOT NULL,
  `Name` text NOT NULL,
  `DiD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `donor`
--

INSERT INTO `donor` (`phno`, `address`, `age`, `sex`, `Name`, `DiD`) VALUES
('996165461', 'manikkapadam(H)', 20, 'Female', 'VISMAYA', 3590),
('7834564', 'thaliparambu', 56, 'Male', 'Kanaran', 3923),
('7865435', 'dasamoolam(H)', 32, 'Male', 'Lonappan', 3933),
('90872123', 'melepparambu(h)', 27, 'Female', 'Kavitha', 5311),
('789654', 'parambilly', 46, 'Male', 'Tony', 6413),
('78967890', 'Panambally(H) Palakkad', 34, 'Female', 'Soumya', 6535),
('6759879', 'Kuruvath(H),Thrissur', 32, 'Male', 'Adarsh', 7001),
('906166565', 'Bombay,india', 24, 'Male', 'Rajubhai', 7002),
('98786908', 'Akkanath(H) P.O.Paralam Venginissery', 18, 'Male', 'Manuel Dominy', 7036),
('78563213', 'Lovely Nagar,Kottayam', 29, 'Female', 'Leena', 7099),
('90616546', 'Manikkapadam', 20, 'Female', 'Vismaya', 7471),
('87698234', 'Malappuram', 18, 'Male', 'Alan', 8253),
('890767564', 'parambilly', 45, 'Female', 'Tara', 8880),
('99989765', 'Selam,Tamilnadu', 48, 'Male', 'Vikram', 9636);

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `Hname` varchar(20) NOT NULL,
  `Hph_no` int(11) NOT NULL,
  `Haddress` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`Hname`, `Hph_no`, `Haddress`) VALUES
('IMA Blood Bank', 906165461, 'Coimbature,TownHall'),
('K G Blood Bank', 938867385, 'Coimbature,Tamilnadu'),
('Palakkad Blood Bank', 996165461, 'Palakkad,kerala'),
('Sheela Hospital', 859014752, 'Coimbature,Tatabad'),
('SKP hospital', 908, 'tha');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blood`
--
ALTER TABLE `blood`
  ADD PRIMARY KEY (`cod`),
  ADD KEY `bid` (`bid`),
  ADD KEY `bno` (`bno`);

--
-- Indexes for table `bloodbank`
--
ALTER TABLE `bloodbank`
  ADD PRIMARY KEY (`b_no`),
  ADD KEY `hname` (`hname`);

--
-- Indexes for table `donor`
--
ALTER TABLE `donor`
  ADD PRIMARY KEY (`DiD`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`Hname`,`Hph_no`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blood`
--
ALTER TABLE `blood`
  ADD CONSTRAINT `blood_ibfk_1` FOREIGN KEY (`bid`) REFERENCES `donor` (`DiD`),
  ADD CONSTRAINT `blood_ibfk_2` FOREIGN KEY (`bno`) REFERENCES `bloodbank` (`b_no`);

--
-- Constraints for table `bloodbank`
--
ALTER TABLE `bloodbank`
  ADD CONSTRAINT `bloodbank_ibfk_1` FOREIGN KEY (`hname`) REFERENCES `hospital` (`Hname`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
