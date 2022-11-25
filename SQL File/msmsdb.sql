-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2022 at 01:34 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `msmsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `ID` int(10) NOT NULL,
  `AdminName` char(50) DEFAULT NULL,
  `UserName` char(50) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `AdminName`, `UserName`, `MobileNumber`, `Email`, `Password`, `AdminRegdate`) VALUES
(1, 'Admin', 'admin', 7898799798, 'tester1@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2019-07-25 06:21:50');

-- --------------------------------------------------------

--
-- Table structure for table `tblappointment`
--

CREATE TABLE `tblappointment` (
  `ID` int(10) NOT NULL,
  `AptNumber` varchar(80) DEFAULT NULL,
  `Name` varchar(120) DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `PhoneNumber` bigint(11) DEFAULT NULL,
  `AptDate` varchar(120) DEFAULT NULL,
  `AptTime` varchar(120) DEFAULT NULL,
  `Services` varchar(120) DEFAULT NULL,
  `ApplyDate` timestamp NULL DEFAULT current_timestamp(),
  `Remark` varchar(250) NOT NULL,
  `Status` varchar(50) NOT NULL,
  `RemarkDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblappointment`
--

INSERT INTO `tblappointment` (`ID`, `AptNumber`, `Name`, `Email`, `PhoneNumber`, `AptDate`, `AptTime`, `Services`, `ApplyDate`, `Remark`, `Status`, `RemarkDate`) VALUES
(17, '120003521', 'afnasudheer', 'a@gmail.com', 234567891, '2022-11-19', '15:30', 'Loreal Hair Color(Full)', '2022-11-11 06:59:45', 'accepted', '1', '2022-11-11 07:05:42'),
(18, '909928198', 'fathima nessrien', 'f@gmail.com', 3456789012, '2022-11-13', '12:30', 'Fruit Facial', '2022-11-11 07:00:38', 'accepted', '1', '2022-11-11 07:06:04'),
(19, '862430424', 'shafeena', 'sh@gmail.com', 567890123, '2022-11-25', '18:35', 'Hair Wash', '2022-11-11 07:01:29', 'accepted', '1', '2022-11-11 07:06:21'),
(20, '963122346', 'sana allanur', 's@gmail.com', 4567890123, '2022-11-28', '13:45', 'O3 Facial', '2022-11-11 07:03:19', 'accepted', '1', '2022-11-11 07:06:38'),
(21, '650321852', 'irfana', 'i@gmail.com', 1356789025, '2022-11-30', '14:40', 'Hair Cut', '2022-11-11 07:07:53', 'rejected', '2', '2022-11-11 07:09:35'),
(22, '711371778', 'alifna', 'al@gmail.com', 1234509876, '2022-11-14', '17:00', 'Normal Pedicure', '2022-11-11 07:08:49', 'rejected', '2', '2022-11-11 07:09:58');

-- --------------------------------------------------------

--
-- Table structure for table `tblcustomers`
--

CREATE TABLE `tblcustomers` (
  `ID` int(10) NOT NULL,
  `Name` varchar(120) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(11) DEFAULT NULL,
  `Gender` enum('Female','Male','Transgender') DEFAULT NULL,
  `Details` mediumtext DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblinvoice`
--

CREATE TABLE `tblinvoice` (
  `id` int(11) NOT NULL,
  `Userid` int(11) DEFAULT NULL,
  `ServiceId` int(11) DEFAULT NULL,
  `BillingId` int(11) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblinvoice`
--

INSERT INTO `tblinvoice` (`id`, `Userid`, `ServiceId`, `BillingId`, `PostingDate`) VALUES
(1, 2, 7, 600922156, '2021-07-21 07:48:58'),
(2, 2, 9, 600922156, '2021-07-21 07:48:58'),
(3, 5, 7, 777590972, '2021-07-23 05:16:41'),
(4, 5, 9, 777590972, '2021-07-23 05:16:41'),
(6, 7, 9, 631074383, '2021-07-25 17:26:51'),
(7, 7, 15, 631074383, '2021-07-25 17:26:51'),
(8, 7, 1, 373904957, '2022-11-11 04:41:30'),
(9, 8, 2, 214310929, '2022-11-11 04:42:51'),
(10, 8, 10, 214310929, '2022-11-11 04:42:51');

-- --------------------------------------------------------

--
-- Table structure for table `tblpage`
--

CREATE TABLE `tblpage` (
  `ID` int(10) NOT NULL,
  `PageType` varchar(200) DEFAULT NULL,
  `PageTitle` mediumtext DEFAULT NULL,
  `PageDescription` mediumtext DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `UpdationDate` date DEFAULT NULL,
  `Timing` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpage`
--

INSERT INTO `tblpage` (`ID`, `PageType`, `PageTitle`, `PageDescription`, `Email`, `MobileNumber`, `UpdationDate`, `Timing`) VALUES
(1, 'aboutus', 'About Us', '                Our main focus is on quality and hygiene. Our Parlour is well equipped with advanced technology equipments and provides best quality services. Our staff is well trained and experienced, offering advanced services in Skin, Hair and Body Shaping that will provide you with a luxurious experience that leave you feeling relaxed and stress free. The specialities in the parlour are, apart from regular bleachings and Facials, many types of hairstyles, Bridal and cine make-up and different types of Facials &amp; fashion hair colourings.', NULL, NULL, NULL, ''),
(2, 'contactus', 'Contact Us', '    ernakulam,kerala', 'salonmanagement@gmail.com', 1234567890, NULL, '10:30 am to 8:30 pm');

-- --------------------------------------------------------

--
-- Table structure for table `tblservices`
--

CREATE TABLE `tblservices` (
  `ID` int(10) NOT NULL,
  `ServiceName` varchar(200) DEFAULT NULL,
  `Description` mediumtext DEFAULT NULL,
  `Cost` int(10) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblservices`
--

INSERT INTO `tblservices` (`ID`, `ServiceName`, `Description`, `Cost`, `CreationDate`) VALUES
(1, 'O3 Facial', 'Activated charcoal draws bacteria, toxins, dirt and oil from the skin.', 250, '2019-07-25 11:22:38'),
(2, 'Fruit Facial', 'If its a peel-off mask, it also works as an excellent exfoliator, ridding the skin of dead cells.', 500, '2019-07-25 11:22:53'),
(3, 'Charcol Facial', 'The end result is skin that is clean and clear. When used as a powder, charcoal masks can reach deep in your pores and suck out impurities with them.', 1000, '2019-07-25 11:23:10'),
(4, 'Deluxe Menicure', 'The end result is skin that is clean and clear. When used as a powder, charcoal masks can reach deep in your pores and suck out impurities with them.', 500, '2019-07-25 11:23:34'),
(5, 'Deluxe Pedicure', 'A pedicure is a therapeutic treatment for your feet that removes dead skin, softens hard skin and shapes and treats your toenails.', 600, '2019-07-25 11:23:47'),
(6, 'Normal Menicure', 'A pedicure is a therapeutic treatment for your feet that removes dead skin, softens hard skin and shapes and treats your toenails.', 300, '2019-07-25 11:24:01'),
(7, 'Normal Pedicure', 'A pedicure is a therapeutic treatment for your feet that removes dead skin, softens hard skin and shapes and treats your toenails.', 400, '2019-07-25 11:24:19'),
(8, 'Hair Cut', 'A hairstyle, hairdo, or haircut refers to the styling of hair, usually on the human scalp. Sometimes, this could also mean an editing of facial or body hair', 250, '2019-07-25 11:24:38'),
(9, 'Style Haircut', 'A hairstyle, hairdo, or haircut refers to the styling of hair, usually on the human scalp. Sometimes, this could also mean an editing of facial or body hair', 550, '2019-07-25 11:24:53'),
(10, 'Hair Wash', 'A hairstyle, hairdo, or haircut refers to the styling of hair, usually on the human scalp. Sometimes, this could also mean an editing of facial or body hair', 399, '2019-07-25 11:25:08'),
(11, 'Loreal Hair Color(Full)', 'hgfhgj', 1200, '2019-07-25 11:25:35'),
(12, 'Body Spa', 'It is full body spa including hair wash', 1500, '2019-08-19 13:36:27'),
(14, 'Test', 'test test', 100, '2019-08-21 15:45:50'),
(15, 'ABC', 'gjhgjhgbkhhioljhoioi', 200, '2019-08-21 16:23:23'),
(16, 'Tradinational Cut', 'khghkhlkjlkjlkjflkrjnvoireyviutyouopyiuiosueoibvjmyruopo kjhkjhkhk kjh nkhu k iuyhiu kjhihiur', 450, '2021-07-19 07:37:40'),
(17, 'MUSTACHE TRIM', 'Trim Trim Trim', 85, '2021-07-19 07:38:02'),
(18, 'Beard Trim', 'Beard Trim', 10, '2021-07-19 07:38:20');

-- --------------------------------------------------------

--
-- Table structure for table `tblsubscriber`
--

CREATE TABLE `tblsubscriber` (
  `ID` int(5) NOT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `DateofSub` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblappointment`
--
ALTER TABLE `tblappointment`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblcustomers`
--
ALTER TABLE `tblcustomers`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblinvoice`
--
ALTER TABLE `tblinvoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `tblpage`
--
ALTER TABLE `tblpage`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblservices`
--
ALTER TABLE `tblservices`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblsubscriber`
--
ALTER TABLE `tblsubscriber`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblappointment`
--
ALTER TABLE `tblappointment`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tblcustomers`
--
ALTER TABLE `tblcustomers`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblinvoice`
--
ALTER TABLE `tblinvoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblpage`
--
ALTER TABLE `tblpage`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblservices`
--
ALTER TABLE `tblservices`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tblsubscriber`
--
ALTER TABLE `tblsubscriber`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
