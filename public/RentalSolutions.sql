-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2023 at 06:04 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateflat` (IN `Name` VARCHAR(30), IN `landmark` VARCHAR(20), IN `contact` VARCHAR(10), IN `address` VARCHAR(80), IN `type` VARCHAR(5), IN `F_ID` INT)   BEGIN
 UPDATE flat SET Name = Name, landmark=landmark,contact=contact,address=address,type=type WHERE Flat_ID = F_ID ;
     
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_pg` (IN `Name` VARCHAR(15), IN `landmark` VARCHAR(20), IN `Noofrooms` INT, IN `roomsfilled` INT, IN `roomsvac` INT, IN `address` VARCHAR(20), IN `facilities` VARCHAR(50), IN `food` VARCHAR(50), IN `P_ID` INT)   BEGIN
 UPDATE pg SET Name = Name, landmark=landmark,No_Rooms=Noofrooms,Rooms_filled=roomsfilled,Rooms_vac=roomsvac,Address=address,facilities=facilities,foods=food WHERE PG_ID = P_ID ;
     
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `flat`
--

CREATE TABLE `flat` (
  `type` varchar(5) DEFAULT NULL,
  `Flat_ID` int(11) NOT NULL,
  `address` varchar(80) DEFAULT NULL,
  `landmark` varchar(50) DEFAULT NULL,
  `contact` varchar(10) NOT NULL,
  `Owner_ID` int(11) DEFAULT NULL,
  `Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flat`
--

INSERT INTO `flat` (`type`, `Flat_ID`, `address`, `landmark`, `contact`, `Owner_ID`, `Name`) VALUES
('1bhk', 1, 'Opp RNSIT,Chennasandra,Bangalore', 'RNSIT', '8317394348', 1, 'Shiva Nilaya'),
('2bhk', 2, 'vijaynagara ,Bangalore', 'vijaynagar metro', '8527419632', 2, 'Thrupthi Nilaya'),
('2bhk', 3, 'university road gandhinagar,bangalore', 'university', '8527419633', 3, 'Samruddhi Nilaya'),
('1bhk', 4, 'banaswadi,bangalore', 'banaswadi park', '8527419632', 2, 'Kutira'),
('3bhk', 5, 'Opp Sadhana school,Shivajinagar,Bangalore', 'Sadhana school', '8317394348', 1, 'Summane'),
('2bhk', 8, 'near Rnsit', 'RNSIT', '8317394348', 1, 'Aamane'),
('2bhk', 10, 'near global college', 'Global college', '8317394348', 1, 'Siri'),
('2bhk', 11, 'sadashivnagar banglore', 'sadashivnagar ', '8529637412', 8, 'mane'),
('2bhk', 12, 'near global college', 'Global college', '7441829212', 9, 'Svarnagruha'),
('2bhk', 13, 'near Ullal bus stand', 'Ullal Bus Stand', '842695317', 13, 'Ullas Nilaya'),
('3bhk', 14, 'near Ullal bus stand', 'Ullal Bus Stand', '842695317', 13, 'Madhu Nilaya');

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `Name` varchar(15) DEFAULT NULL,
  `Owner_ID` int(11) NOT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `username` varchar(20) NOT NULL,
  `email_ID` varchar(50) NOT NULL,
  `contact` varchar(14) NOT NULL,
  `address` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`Name`, `Owner_ID`, `pwd`, `username`, `email_ID`, `contact`, `address`) VALUES
('Likhith', 1, '123', 'likkic', 'likhi0802@gmail.com', '8317394347', 'Bangalore'),
('Maharsh', 2, 'mah123', 'maha', 'mah@gmail.com', '741523689', 'Vijaynagar,Bangalore'),
('Nigam', 3, 'nig123', 'niga', 'nig@gmail.com', '874569321', 'University,Bangalore'),
('Darshan', 4, 'dar123', 'dar', 'dar@gmail.com', '4567529631', 'RR nagar Bangalore'),
('Arjun', 5, 'arj123', 'arj', 'arj@gmail.com', '4568225631', 'KR Market'),
('hai', 6, '412', 'hnj', 'hnj@gmail.com', '8527419632', 'near RR temple'),
('raj', 7, '523', 'rajs', 'raj@gmail.com', '8527419632', 'near Rnsit'),
('Sudeep', 8, 'deep123', 'deep', 'sudeep@gmail.com', '8529637412', 'sadashivnagar banglore'),
('Vinod', 9, 'vin123', 'vini', 'vin@gmail.com', '7441829212', 'near rnsit'),
('', 10, '', '', '', '', ''),
('Ramesh', 11, 'ramesh', 'ramesh', 'ramesh@gmail.com', '4567893215', '5th main vijayanagar'),
('Mahesh', 12, '123', 'maha', 'm@gmail.com', '7418529632', 'Shivajinagar'),
('Manish', 13, 'man123', 'man', 'man@gmail.com', '8426953172', 'Ullal');

-- --------------------------------------------------------

--
-- Table structure for table `ownersignup`
--

CREATE TABLE `ownersignup` (
  `name` varchar(20) DEFAULT NULL,
  `email_id` varchar(50) DEFAULT NULL,
  `contact` varchar(14) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `address` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ownersignup`
--

INSERT INTO `ownersignup` (`name`, `email_id`, `contact`, `username`, `pwd`, `address`) VALUES
('LIKHITH C', 'likhith9945456753@gmail.com', '08317394347', 'likkic', '123', '#04 Fire Station Quarters,Maranagere road, Tiptur'),
('Maharsh', 'mah@gmail.com', '741523689', 'maha', 'mah123', 'Vijaynagar,Bangalore'),
('Darshan', 'dar@gmail.com', '4567529631', 'dar', 'dar123', 'RR nagar Bangalore'),
('Arjun', 'arj@gmail.com', '4568225631', 'arj', 'arj123', 'KR Market'),
('hai', 'hnj@gmail.com', '8527419632', 'hnj', '412', 'near RR temple'),
('raj', 'raj@gmail.com', '8527419632', 'rajs', '523', 'near Rnsit'),
('Sudeep', 'sudeep@gmail.com', '8529637412', 'deep', 'deep123', 'sadashivnagar banglore'),
('Vinod', 'vin@gmail.com', '7441829212', 'vini', 'vin123', 'near rnsit'),
('', '', '', '', '', ''),
('Ramesh', 'ramesh@gmail.com', '4567893215', 'ramesh', 'ramesh', '5th main vijayanagar'),
('Mahesh', 'm@gmail.com', '7418529632', 'maha', '123', 'Shivajinagar'),
('Manish', 'man@gmail.com', '8426953172', 'man', 'man123', 'Ullal'),
('LIKHITH C', 'likhith9945456753@gmail.com', '08317394347', 'k', '210', '#04 Fire Station Quarters,Maranagere road, Tiptur');

--
-- Triggers `ownersignup`
--
DELIMITER $$
CREATE TRIGGER `OWNER_UPDATE` AFTER INSERT ON `ownersignup` FOR EACH ROW BEGIN INSERT INTO owner(Name,pwd,username,email_ID,contact,address)VALUES(NEW.Name,NEW.pwd,NEW.username,NEW.email_id,NEW.contact,NEW.address); END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pg`
--

CREATE TABLE `pg` (
  `Name` varchar(15) DEFAULT NULL,
  `PG_ID` int(11) NOT NULL,
  `landmark` varchar(50) DEFAULT NULL,
  `No_Rooms` int(11) DEFAULT NULL,
  `Rooms_Filled` int(11) DEFAULT NULL,
  `Rooms_vac` int(11) DEFAULT NULL,
  `Address` varchar(80) DEFAULT NULL,
  `facilities` varchar(50) DEFAULT NULL,
  `foods` varchar(50) DEFAULT NULL,
  `Owner_ID` int(11) DEFAULT NULL,
  `contact` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pg`
--

INSERT INTO `pg` (`Name`, `PG_ID`, `landmark`, `No_Rooms`, `Rooms_Filled`, `Rooms_vac`, `Address`, `facilities`, `foods`, `Owner_ID`, `contact`) VALUES
('shiva', 1, 'rnsit', 20, 10, 10, 'opp rnsit college', 'food,wifi', 'chapathi,rice', 1, '8317394347'),
('Rama', 2, 'university', 20, 10, 10, 'university road', 'food,wifi', 'chapathi,rice', 1, '8317394348'),
('Nigam', 3, 'university', 20, 10, 10, 'opp rnsit college', 'food,wifi', 'chapathi,rice', 3, '7418529632'),
('Athitya', 4, 'RNSIT', 20, 10, 10, 'opp rnsit college', 'food,wifi', 'chapathi,rice', 2, '8317394348'),
('Vajra', 5, 'RR Nagar', 20, 10, 10, 'opp rnsit college', 'food,wifi', 'chapathi,rice', 2, '8317394348'),
('Sagar', 50, 'RNSIT', 20, 10, 10, 'opp rnsit college', 'food,wifi', 'chapathi,rice', 1, '8317394347'),
('hallimane', 52, 'sadashivnagar mainro', 30, 20, 10, 'sadashivnagar', 'food,wifi', 'chapathi,rice', 8, '852741962'),
('mahaan', 53, 'rnsit', 30, 20, 10, 'opp rnsit college', 'food,wifi', 'chapathi,rice', 2, '8317394348'),
('Royals', 55, 'Global college', 30, 20, 10, 'near global college', 'food,wifi', 'chapathi,rice,chicken,north indian ', 9, '7441829212'),
('Vilas ', 56, 'Ullal Bus Stand', 30, 20, 10, 'near Ullal bus stand', 'food,wifi', 'veg,non veg', 13, '842695317'),
('Madan', 57, 'Ullal Bus Stand', 40, 20, 20, 'near Ullal bus stand', 'TV,wifi,geyser', 'veg,non veg', 13, '842695317');

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `name` varchar(20) DEFAULT NULL,
  `email_id` varchar(50) DEFAULT NULL,
  `contact` varchar(14) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`name`, `email_id`, `contact`, `username`, `pwd`) VALUES
('LIKHITH C', 'likhith9945456753@gmail.com', '08317394347', 'likkic', '123'),
('Maharsh', 'mah@gmail.com', '741852963', 'mah', 'm123'),
('Rajesh', 'raj@gmail.com', '45987321', 'raj', 'r123'),
('ram', 'ram@gmail.com', '417596312', 'ram', 'ram123'),
('Arjun', 'arjun@gmail.com', '8317394347', 'arj', 'arj123'),
('Sharan', 'sharan@gmail.com', '7418529631', 'shar', 'sharan123'),
('', '', '', '', ''),
('1', 'hn@gmail', '7415', 'uh', '123'),
('liki', 'lo@gmail.com', '7418529632', 'likki', '456'),
('Vivek', 'viv@gmail.com', '7569871232', 'viv', 'viv123'),
('LIKHITH C', 'likhith9945456753@gmail.com', '08317394347', 'man', '123');

-- --------------------------------------------------------

--
-- Table structure for table `tenant`
--

CREATE TABLE `tenant` (
  `name` varchar(15) DEFAULT NULL,
  `username` varchar(20) NOT NULL,
  `Review` varchar(20) DEFAULT NULL,
  `email_ID` varchar(20) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `PG_Flat_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `flat`
--
ALTER TABLE `flat`
  ADD PRIMARY KEY (`Flat_ID`,`contact`),
  ADD KEY `Owner_ID` (`Owner_ID`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`Owner_ID`,`username`,`email_ID`,`contact`);

--
-- Indexes for table `pg`
--
ALTER TABLE `pg`
  ADD PRIMARY KEY (`PG_ID`),
  ADD KEY `Owner_ID` (`Owner_ID`);

--
-- Indexes for table `tenant`
--
ALTER TABLE `tenant`
  ADD PRIMARY KEY (`username`,`email_ID`,`contact`,`PG_Flat_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `flat`
--
ALTER TABLE `flat`
  MODIFY `Flat_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `owner`
--
ALTER TABLE `owner`
  MODIFY `Owner_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pg`
--
ALTER TABLE `pg`
  MODIFY `PG_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `flat`
--
ALTER TABLE `flat`
  ADD CONSTRAINT `flat_ibfk_1` FOREIGN KEY (`Owner_ID`) REFERENCES `owner` (`Owner_ID`);

--
-- Constraints for table `pg`
--
ALTER TABLE `pg`
  ADD CONSTRAINT `pg_ibfk_1` FOREIGN KEY (`Owner_ID`) REFERENCES `owner` (`Owner_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
