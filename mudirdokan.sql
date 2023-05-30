-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2023 at 06:11 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mudirdokan`
--

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_ID` int(11) NOT NULL,
  `Product_Name` varchar(30) DEFAULT NULL,
  `Supplier_ID` int(11) DEFAULT NULL,
  `Product_Type` varchar(20) DEFAULT NULL,
  `Unit_price` int(11) DEFAULT NULL,
  `Unit_Purchase` double(5,2) DEFAULT NULL,
  `Curr_Avail` double(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_ID`, `Product_Name`, `Supplier_ID`, `Product_Type`, `Unit_price`, `Unit_Purchase`, `Curr_Avail`) VALUES
(1001, 'Fresh Chinigura', 2001, 'Rice', 70, 50.00, 50.00),
(1002, 'Masur', 2002, 'Lentil', 60, 80.00, 80.00),
(1003, 'Chips', 2001, 'Snacks', 20, 50.00, 50.00),
(1004, 'Fresh Chini', 2003, 'Sugar', 50, 40.00, 40.00),
(1005, 'Atop', 2002, 'Rice', 60, 90.00, 90.00),
(1006, 'MugDal', 2004, 'Lentil', 105, 60.00, 60.00),
(1007, 'ACI Chanachur', 2001, 'Snacks', 40, 65.00, 65.00),
(1008, 'Soyabean Oil', 2005, 'Oil', 180, 55.00, 55.00),
(1009, 'Nutti Biscuit', 2003, 'Snacks', 25, 70.00, 70.00),
(1010, 'Harpic', 2002, 'Utility', 195, 20.00, 20.00);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `Sales_Id` int(11) NOT NULL,
  `Trx_Id` int(11) DEFAULT NULL,
  `product_Id` int(11) DEFAULT NULL,
  `Unit_Sale` double(4,2) DEFAULT NULL,
  `Amount` double(6,2) DEFAULT NULL,
  `Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`Sales_Id`, `Trx_Id`, `product_Id`, `Unit_Sale`, `Amount`, `Date`) VALUES
(1, 10000, 1001, 2.00, 140.00, '2023-05-12'),
(2, 10000, 1003, 3.00, 60.00, '2023-05-15'),
(3, 10000, 1004, 4.00, 200.00, '2023-05-15'),
(4, 10001, 1005, 5.00, 300.00, '2023-05-16'),
(5, 10002, 1008, 3.00, 540.00, '2023-05-16'),
(6, 10002, 1007, 1.00, 40.00, '2023-05-16'),
(7, 10003, 1009, 2.00, 50.00, '2023-05-16'),
(8, 10004, 1010, 1.00, 195.00, '2023-05-17'),
(9, 10004, 1005, 7.00, 420.00, '2023-05-17'),
(10, 10005, 1003, 3.00, 60.00, '2023-05-17'),
(11, 10006, 1007, 1.00, 40.00, '2023-05-18');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `Supplier_ID` int(11) NOT NULL,
  `Supplier_Name` varchar(30) DEFAULT NULL,
  `Address` varchar(20) DEFAULT NULL,
  `Contact_No` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`Supplier_ID`, `Supplier_Name`, `Address`, `Contact_No`) VALUES
(2000, 'Bashundhara', 'Dhaka', 98373),
(2001, 'ACI', 'Habiganj', 29837),
(2002, 'Meghna', 'Rajshahi', 55437),
(2003, 'Padma', 'Barishal', 98322),
(2004, 'Surma', 'Sylhet', 88337),
(2005, 'Jamuna', 'Chandpur', 76567);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_ID`),
  ADD KEY `Supplier_ID` (`Supplier_ID`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`Sales_Id`),
  ADD KEY `product_Id` (`product_Id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`Supplier_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `Product_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1016;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `Sales_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `Supplier_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2006;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Supplier_ID`) REFERENCES `supplier` (`Supplier_ID`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`product_Id`) REFERENCES `product` (`Product_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
