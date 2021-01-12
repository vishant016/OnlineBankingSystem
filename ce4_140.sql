-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2020 at 02:42 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ce4_140`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `accountno` int(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` longtext NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cif` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `amount` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `adress` varchar(2000) NOT NULL,
  `panno` varchar(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`accountno`, `username`, `password`, `phone`, `email`, `cif`, `dob`, `amount`, `name`, `adress`, `panno`) VALUES
(456789123, 'vishant016', '35TPzAw4wttqMw3F6qSarA==', '7048448517', 'vishantvaghani257@gmail.com', '123456789', '2020-02-04', 35410, 'vishant vaghani ', '', 'BNGHY1234A'),
(456789124, 'Harshit', 'jlqAOMMGuODw8kOAgDR/3g==', '7048448518', 'vishvasvaghani@gmail.com', '123456790', '2020-03-05', 18730, 'vishvas vaghani', '', '0'),
(456789125, 'darshan016', '35TPzAw4wttqMw3F6qSarA==', '7048448519', 'vishantvaghani258@gmail.com', '123456791', '2020-03-26', 3000, 'vish vaghani', '', '0'),
(456789126, 'mauneel', '35TPzAw4wttqMw3F6qSarA==', '7048448520', 'vishantvaghani259@gmail.com', '123456792', '2020-03-26', 3000, 'vishv vaghani', '', '0'),
(456789127, 'mauneel', '35TPzAw4wttqMw3F6qSarA==', '7048448520', 'vishantvaghani259@gmail.com', '123456792', '2020-03-26', 3000, 'vishv vaghani', '', '0'),
(456789128, 'aero', '35TPzAw4wttqMw3F6qSarA==', '7048448521', 'vishantvaghani260@gmail.com', '123456793', '2020-03-27', 3000, 'vishva vaghani', '', '0'),
(456789130, 'b07', '1234', '7048448518', 'vishvasvaghani@gmail.com', '1234546794', '2020-04-21', 1000, 'user1', 'b 270', '0'),
(456789131, 'b08', '1234', '7048448519', 'vishantvaghani259@gmail.com', '123456794', '2020-04-10', 1000, 'qwerty', 'b 270', '0'),
(456789132, 'b09', '1234', '7048448520', 'vishant@gmail.com', '12456987', '2020-04-22', 4562, 'vish vaghani', 'b 270', '0'),
(456789133, 'b010', '1234', '7048448519', 'vishant@gmail.com', '1234546789', '2020-04-15', 3000, 'user1', 'b 270', '0'),
(456789135, 'qwerty013', '4Sj+QPtu83OhjIPc3VnBsQ==', '7048448516', 'vishantvaghani258@gmail.com', '1234546789', '2020-04-16', 3100, 'user1', 'b 270', '0'),
(456789136, 'k01', '1234', '7048448518', 'vishantvaghani258@gmail.com', '123456789', '2001-01-01', 5000, 'qwerty', 'b 270', '0'),
(456789137, 'vish013', '4Sj+QPtu83OhjIPc3VnBsQ==', '7048448517', 'vishantvaghani257@gmail.com', '123546789', '2001-01-01', 4900, 'user1', 'b 270', 'BNGHY1234D'),
(456789138, 'h01', '1234', '7048448517', 'vishantvaghani257@gmail.com', '12456987', '2001-01-01', 3000, 'user1', 'b 270', '0'),
(456789139, 'h02', '1234', '7048448516', 'vishantvaghani257@gmail.com', '1234546794', '2001-01-01', 1000, 'user1', 'b 270', '0'),
(456789140, 'h03', '1234', '7048448517', 'vishantvaghani257@gmail.com', '123456789', '2001-01-01', 3000, 'naman', 'b 270', '0'),
(456789141, 'naman013', '4Sj+QPtu83OhjIPc3VnBsQ==', '7048448517', 'vishantvaghani257@gmail.com', '123456789', '2001-01-01', 2000, 'qwerty', 'b 270', 'BNGHY1234D');

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `rid` int(20) NOT NULL,
  `accountno` int(20) NOT NULL,
  `request` varchar(20) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`rid`, `accountno`, `request`, `date`) VALUES
(73, 456789123, 'passbook', '2020-03-08'),
(74, 456789123, 'checkbook', '2020-03-08'),
(75, 456789124, 'passbook', '2020-03-08'),
(76, 456789124, 'checkbook', '2020-03-08'),
(87, 456789123, 'passbook', '2020-04-21'),
(88, 456789123, 'checkbook', '2020-04-21'),
(129, 456789123, 'kyc', '2020-04-23'),
(130, 456789137, 'passbook', '2020-04-23'),
(131, 456789137, 'checkbook', '2020-04-23'),
(132, 456789137, 'kyc', '2020-04-23'),
(133, 456789137, 'kyc', '2020-04-23'),
(134, 456789141, 'passbook', '2020-04-23'),
(135, 456789141, 'checkbook', '2020-04-23'),
(136, 456789141, 'kyc', '2020-04-23'),
(137, 456789141, 'kyc', '2020-04-23');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(20) NOT NULL,
  `accountno` int(20) NOT NULL,
  `targetaccno` int(20) NOT NULL,
  `deposit` int(20) NOT NULL DEFAULT 0,
  `withdrawal` int(20) NOT NULL DEFAULT 0,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `accountno`, `targetaccno`, `deposit`, `withdrawal`, `date`) VALUES
(17, 456789123, 456789124, 0, 100, '2020-03-08'),
(18, 456789124, 456789123, 100, 0, '2020-03-08'),
(19, 456789123, 456789124, 0, 100, '2020-04-20'),
(20, 456789124, 456789123, 100, 0, '2020-04-20'),
(21, 456789123, 456789124, 0, 500, '2020-04-21'),
(22, 456789124, 456789123, 500, 0, '2020-04-21'),
(23, 456789123, 456789123, 0, 100, '2020-04-22'),
(24, 456789123, 456789123, 100, 0, '2020-04-22'),
(25, 456789123, 456789123, 0, 120, '2020-04-22'),
(26, 456789123, 456789123, 120, 0, '2020-04-22'),
(27, 456789123, 456789123, 0, 120, '2020-04-22'),
(28, 456789123, 456789123, 120, 0, '2020-04-22'),
(29, 456789123, 456789123, 0, 100, '2020-04-22'),
(30, 456789123, 456789123, 100, 0, '2020-04-22'),
(31, 456789123, 456789123, 0, 100, '2020-04-22'),
(32, 456789123, 456789123, 100, 0, '2020-04-22'),
(33, 456789123, 456789124, 0, 100, '2020-04-22'),
(34, 456789124, 456789123, 100, 0, '2020-04-22'),
(35, 456789123, 456789123, 0, 100, '2020-04-22'),
(36, 456789123, 456789123, 100, 0, '2020-04-22'),
(37, 456789135, 456789135, 0, 100, '2020-04-23'),
(38, 456789135, 456789135, 100, 0, '2020-04-23'),
(39, 456789137, 456789123, 0, 100, '2020-04-23'),
(40, 456789123, 456789137, 100, 0, '2020-04-23'),
(41, 456789141, 456789123, 0, 1000, '2020-04-23'),
(42, 456789123, 456789141, 1000, 0, '2020-04-23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`accountno`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`rid`),
  ADD KEY `fr` (`accountno`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fracc` (`accountno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `rid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `fr` FOREIGN KEY (`accountno`) REFERENCES `bank` (`accountno`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `fracc` FOREIGN KEY (`accountno`) REFERENCES `bank` (`accountno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
