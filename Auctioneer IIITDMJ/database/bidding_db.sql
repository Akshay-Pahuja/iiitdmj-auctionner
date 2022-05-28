-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2021 at 06:23 AM
-- Server version: 5.7.35-0ubuntu0.18.04.2
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bidding_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `bid_amount` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=bid,2=confirmed,3=cancelled',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bids`
--

INSERT INTO `bids` (`id`, `user_id`, `product_id`, `bid_amount`, `status`, `date_created`) VALUES
(5, 6, 1, 1000, 1, '2021-11-15 10:04:48'),
(6, 6, 3, 40000, 1, '2021-11-14 18:12:51'),
(7, 6, 5, 100, 1, '2021-11-14 10:24:09'),
(8, 1, 4, 213123, 1, '2021-11-14 11:46:18'),
(9, 6, 6, 5000, 1, '2021-11-14 12:48:06'),
(10, 1, 5, 34234, 1, '2021-11-14 12:54:26'),
(11, 7, 4, 245245, 1, '2021-11-14 13:19:15'),
(12, 6, 4, 65400, 1, '2021-11-14 18:13:11'),
(13, 8, 5, 35000, 1, '2021-11-15 10:03:49'),
(14, 10, 8, 6000, 1, '2021-11-17 10:44:29');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(7, 'all'),
(8, 'utility and tools'),
(9, 'Games'),
(10, 'Educational; and utility Software'),
(11, 'Clothing and Accesories'),
(12, 'Hostle Room Must Haves'),
(13, 'Sports'),
(14, 'Vehicles'),
(15, 'Ready to Eat Food stocks'),
(16, 'Electrical Appliences'),
(17, 'Collectibles'),
(18, 'Outdoor Activity Stuff'),
(19, 'Open Source Content'),
(20, 'OTT Accounts'),
(21, 'Plants'),
(22, 'Pets'),
(23, 'Cycles'),
(24, 'Cricket Accesores'),
(25, 'Football Accessories'),
(26, 'Gaming Peripherals'),
(27, 'Electonics and Computers');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `start_bid` float NOT NULL,
  `regular_price` float NOT NULL,
  `bid_end_datetime` datetime NOT NULL,
  `img_fname` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `start_bid`, `regular_price`, `bid_end_datetime`, `img_fname`, `date_created`) VALUES
(1, 7, 'Hercules Mountain Cycle', 'Excellent condition,brand new!', 6000, 8000, '2022-11-14 05:04:41', 'cycle.jpeg', '2021-11-14 09:35:49'),
(2, 7, 'Mi Wireless Headphones', 'like brand-new', 1000, 2000, '2031-11-14 05:06:01', 'mi.jpeg', '2021-11-14 09:36:46'),
(3, 8, 'Plumbing Tool', 'good for broken taps', 200, 200, '2024-10-27 17:00:00', 'tool.jpeg', '2021-10-27 09:59:39'),
(4, 7, 'calculator', 'working condition', 1000, 1200, '2022-11-14 04:57:48', 'calc.jpeg', '2021-11-14 09:28:41'),
(5, 7, 'Badminton', 'old but gold', 50, 100, '2022-11-14 05:07:20', 'badminton.jpeg', '2021-11-14 09:37:55'),
(6, 7, 'bottle', 'good quality', 1000, 1000, '2022-11-14 05:09:55', 'bottle.jpeg', '2021-11-14 09:40:28'),
(7, 7, 'Speakers', 'Brand new condition, in warranty.', 600, 800, '2024-11-15 09:47:00', 'speaker.jpg', '2021-11-15 09:49:42'),
(8, 8, 'Book Shelf', 'Glossy blue smart metal open book shelf (DIY),\r\ntotal number of shelves: 6 (can be build as per need),\r\nresistant to corrosion, abrasion and UV.\r\nEasy to carry and useful ! ', 400, 550, '2024-11-15 09:47:00', 'book_shelf.jpg', '2021-11-15 10:26:06'),
(10, 7, 'Redmi 9 Power Smartphone', 'Redmi 9 power, Electric Greeen,\r\n4GB RAM, 64GB ROM,\r\n48MP + 8MP + 2MP + 2MP\r\n6000mAh,\r\nin good condition without any scratches with bill', 6000, 8000, '2023-11-15 10:41:00', 'redmi_9_power.jpg', '2021-11-15 10:41:18'),
(14, 8, 'Wireless Keyboard and Mouse combo', 'HP Multimedia Slim wireless keyboard and mouse combo,\r\ncan connect with laptop, android tv, tablet, etc.\r\nelegant design with soft touch keys !\r\nlightweight and easy to carry anywhere.\r\n', 650, 850, '2022-08-05 10:53:00', 'wireless_keyboard_mouse.jpg', '2021-11-15 10:53:53');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'Auctioneer IIITDMJ', '20bcs160@iiitdmj.ac.in', '9914173314', '12.jpeg', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1=Admin,2=Subscriber',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `email`, `contact`, `address`, `type`, `date_created`) VALUES
(1, 'Administrator', 'admin', '0192023a7bbd73250516f069df18b500', 'admin@admin.com', '20bcs500', 'jabalpur', 1, '2021-09-27 09:19:59'),
(7, 'prakhar', 'prakhar', '202cb962ac59075b964b07152d234b70', 'pra@gmail.com', '1234', 'jabalpur', 2, '2021-11-14 13:18:33'),
(8, 'Atul Raj', 'Atul046', '827ccb0eea8a706c4c34a16891f84e7b', 'atulraj0710@gmail.com', '8318262563', 'Varanasi', 2, '2021-11-15 09:43:01'),
(9, 'Aman', 'aman', '827ccb0eea8a706c4c34a16891f84e7b', 'aman@gmail.com', '8653214562', 'Ranchi', 2, '2021-11-15 10:17:21'),
(10, 'jaswanth', 'jee', '3591daf03f80ee638643d8e173087e83', 'jaswanth@jaw.ca', '061', 'room number 12345', 2, '2021-11-17 10:44:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
