-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 03, 2021 at 01:13 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `admin_panel`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `clientId` int(11) NOT NULL,
  `shdesc` varchar(1000) DEFAULT NULL,
  `fullDesc` varchar(1000) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  `numOfDays` int(50) DEFAULT NULL,
  `importance` varchar(20) DEFAULT NULL,
  `dateTime` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `userId`, `clientId`, `shdesc`, `fullDesc`, `date`, `startTime`, `endTime`, `numOfDays`, `importance`, `dateTime`, `status`) VALUES
(1, 12, 29, 'aaa', '', '2021-06-10', '16:25:15', '16:45:00', 1, 'blue', '2021-06-11 16:06:27', '1'),
(2, 14, 29, 'Termin', '', '2021-06-11', '18:21:00', '20:21:00', 1, 'green', '2021-06-13 16:21:54', '1'),
(3, 14, 29, 'wgfasg', '', '2021-06-17', '16:51:00', '18:23:00', 1, 'red', '2021-06-14 16:23:51', '1'),
(4, 14, 27, 'Temrin', '', '2021-06-22', '10:34:00', '10:53:00', 1, 'red', '2021-06-15 10:32:25', '1'),
(5, 14, 29, 'TEmrin', '', '2021-06-22', '11:03:00', '11:09:00', 1, 'blue', '2021-06-22 10:33:03', '1'),
(6, 13, 29, 'termin', '', '2021-06-25', '15:23:00', '17:23:00', 1, 'green', '2021-06-23 13:23:10', '2'),
(7, 15, 22, 'asfasf', '', '2021-06-24', '17:45:00', '20:45:00', 1, NULL, '2021-06-24 14:45:27', '1'),
(8, 14, 29, 'termin', '', '2021-06-26', '18:55:00', '20:55:00', 1, 'blue', '2021-06-24 15:55:09', '1'),
(9, 14, 29, 'termin', '', '2021-06-27', '18:55:00', '20:55:00', 1, 'blue', '2021-06-24 15:58:24', '1'),
(10, 14, 29, 'termi', '', '2021-07-01', '11:34:00', '12:31:00', 1, NULL, '2021-07-01 11:32:02', '2'),
(11, 14, 29, 'asfasf', '', '2021-07-01', '17:18:00', '18:19:00', 1, 'blue', '2021-07-01 12:13:58', '2'),
(12, 14, 29, 'gfasg', '', '2021-07-05', '15:59:00', '16:59:00', 1, NULL, '2021-07-05 14:59:21', '1'),
(13, 14, 29, 'gg', '', '2021-07-06', '19:02:00', '20:02:00', 1, 'blue', '2021-07-05 00:00:00', '1'),
(14, 14, 26, 'fasf', '', '2021-07-07', '16:03:00', '17:03:00', 1, 'red', '2021-07-05 15:03:57', '2'),
(15, 14, 30, 'ttt', '', '2021-07-06', '16:05:00', '17:05:00', 1, 'red', '2021-07-05 15:05:15', '2'),
(16, 14, 29, 'asdasd', '', '2021-07-05', '15:08:00', '15:11:00', 1, 'blue', '2021-07-05 15:07:32', '1'),
(17, 12, 29, 'tt', '', '2021-07-05', '19:14:00', '21:14:00', 1, 'green', '2021-07-05 15:14:31', '1');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) NOT NULL,
  `parent_id` int(10) DEFAULT 0,
  `category_name` varchar(255) NOT NULL,
  `menu_link` varchar(255) NOT NULL,
  `header_menu` int(10) NOT NULL,
  `footer_menu` int(10) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `category_name`, `menu_link`, `header_menu`, `footer_menu`, `description`) VALUES
(63, 64, 'second', '', 1, 0, ' off\r\n   \r\nda'),
(64, 63, 'first-chid', '', 1, 0, ' \r\n  '),
(65, 0, 'first', 'first', 1, 0, ''),
(66, 0, 'first child 1', '', 1, 0, ' \r\n   \r\n   \r\n  '),
(67, 65, 'first cat', 'first-cat', 1, 1, ' \r\n  '),
(68, 0, 'k', 'mm', 1, 0, ' \r\n  ');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `email` varchar(320) DEFAULT NULL,
  `phone1` char(20) DEFAULT NULL,
  `phone2` char(20) DEFAULT NULL,
  `address` varchar(120) DEFAULT NULL,
  `reference` varchar(50) DEFAULT NULL,
  `bussinesName` varchar(320) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `regDate` datetime NOT NULL,
  `updateDate` datetime DEFAULT NULL,
  `registeredBy` int(11) NOT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `companyId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`, `surname`, `email`, `phone1`, `phone2`, `address`, `reference`, `bussinesName`, `comment`, `regDate`, `updateDate`, `registeredBy`, `updatedBy`, `companyId`) VALUES
(22, 'Ardian', 'Bujupi', 'ardria@gmail.com', '(212) 31-231-231', '', 'Istog', 'Arton Binaku', 'Trofta', 'Koment', '2021-06-05 01:06:12', NULL, 11, NULL, 2),
(23, 'Klodian', '', '', '(213) 12-312-312', '', '', '', '', '', '2021-06-05 01:12:23', NULL, 11, NULL, 2),
(24, 'Klodi', '', '', '(213) 12-312-312', '', '', '', '', '', '2021-06-05 01:15:17', NULL, 11, NULL, 2),
(25, 'Zana', '', '', '(214) 12-412-412', '', '', '', '', '', '2021-06-05 02:29:24', NULL, 11, NULL, 2),
(26, 'Qendrim', 'Demiraj', 'dimi@gmail.com', '(383) 49-562-356', '(383) 44-852-952', 'Istog', 'Arti Berisha nga Princ Coffe House', 'ToniMarket', 'Klient i ri dhe shume serioz', '2021-06-07 11:07:29', '2021-06-02 13:00:51', 12, 11, 1),
(27, 'Dadim', '', '', '(241) 24-234-124', '', '', '', '', '', '2021-06-07 15:34:35', '2021-06-01 12:58:14', 12, 14, 1),
(28, 'Rica', '', '', '(383) 68-161-654', '', 'Rr. Edi Rama', '', '', '', '2021-06-18 10:49:27', NULL, 14, NULL, 1),
(29, 'Artian', '', '', '(373) 29-865-265', '', '', '', '', '', '2021-06-18 13:20:08', NULL, 14, NULL, 1),
(30, 'Zafir', '', '', '(654) 16-516-53', '', '', '', '', 'za', '2021-07-05 14:54:25', NULL, 14, NULL, 1),
(31, 'Klient', '', '', '(124) 12-412-412', '', '', '', '', '', '2021-07-05 15:04:54', NULL, 14, NULL, 1),
(32, 'Klienttt', '', '', '(231) 24-124-124', '', '', '', '', '', '2021-07-05 15:12:42', NULL, 12, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `color_setting`
--

CREATE TABLE `color_setting` (
  `id` int(10) NOT NULL,
  `navbar_background` varchar(255) NOT NULL,
  `sidebar_background` varchar(255) NOT NULL,
  `text_color` varchar(255) NOT NULL,
  `save_button_color` varchar(255) NOT NULL,
  `edit_button_color` varchar(255) NOT NULL,
  `delete_button_color` varchar(255) NOT NULL,
  `view_button_color` varchar(255) NOT NULL,
  `label_text_color` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `color_setting`
--

INSERT INTO `color_setting` (`id`, `navbar_background`, `sidebar_background`, `text_color`, `save_button_color`, `edit_button_color`, `delete_button_color`, `view_button_color`, `label_text_color`) VALUES
(1, '#742f2f', '#ff2929', '#ff0000', '#ac1111', '#ff0000', '#ff0000', '#ff0000', '#ff0000'),
(2, '#08a206', '#00a89d', '#ffffff', '#03b300', '#00a65a', '#ff0000', '#707070', '#000000');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(20) NOT NULL,
  `client_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `dateTime` datetime NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `client_id`, `user_id`, `description`, `dateTime`, `status`) VALUES
(1, 23, 11, 'koment', '2021-06-07 14:29:21', 1),
(2, 23, 11, 'koment\r\n', '2021-06-07 14:39:15', 2),
(3, 23, 11, 'koment', '2021-06-07 14:39:22', 1),
(4, 24, 11, 'safasf', '2021-06-07 14:42:44', 1),
(5, 24, 11, 'asfasf', '2021-06-07 14:42:47', 1),
(6, 26, 12, 'asfasf', '2021-06-07 15:04:50', 1),
(7, 22, 11, 'zfasfa', '2021-06-08 15:40:22', 1),
(8, 27, 14, 'Koment\r\n', '2021-06-18 12:47:20', 1),
(9, 27, 14, 'asfas\r\n', '2021-06-18 13:02:42', 1),
(10, 22, 15, 'fasfasf', '2021-06-18 13:36:53', 1),
(11, 29, 14, 'koment\r\n', '2021-06-21 16:21:09', 1),
(12, 29, 14, 'konen\r\n', '2021-07-05 15:04:34', 1),
(13, 29, 14, '\r\n\r\n\r\n\r\n', '2021-07-05 15:04:37', 1);

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `userId` int(11) NOT NULL,
  `licenseUntil` date DEFAULT NULL,
  `phone` char(30) DEFAULT NULL,
  `registered` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `userId`, `licenseUntil`, `phone`, `registered`) VALUES
(1, 'Freskia', 1, '2021-06-30', '(233) 45-521-243', '2021-06-04 22:56:15'),
(2, 'Morea', 1, '2021-06-30', '', '2021-06-04 22:56:15'),
(8, 'Greenlife', 1, NULL, '', '2021-06-23 13:11:07'),
(9, 'Bistro', 1, NULL, '', '2021-06-24 16:14:28');

-- --------------------------------------------------------

--
-- Table structure for table `companydetails`
--

CREATE TABLE `companydetails` (
  `id` int(6) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `initials` varchar(30) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `street_address` varchar(50) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `lastUpdate` datetime DEFAULT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `companydetails`
--

INSERT INTO `companydetails` (`id`, `name`, `initials`, `state`, `city`, `street_address`, `logo`, `lastUpdate`, `userId`) VALUES
(1, 'Bit-Company', 'BIT', 'Kosove', 'Prishtine', '', 'logoBit2.png', '2021-06-25 14:10:17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contact_details`
--

CREATE TABLE `contact_details` (
  `id` int(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `google_map` text NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `google_plus` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `linkedin` varchar(255) NOT NULL,
  `youtube` varchar(255) NOT NULL,
  `instagram` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_details`
--

INSERT INTO `contact_details` (`id`, `email`, `mobile`, `address`, `google_map`, `facebook`, `google_plus`, `twitter`, `linkedin`, `youtube`, `instagram`) VALUES
(1, 'youremailaddress@gmail.com', '1234567890', 'Noida, Uttar Pradesh, India', 'Enter You Google Map Code', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `contact_email`
--

CREATE TABLE `contact_email` (
  `id` int(10) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_email`
--

INSERT INTO `contact_email` (`id`, `email`) VALUES
(8, 'email'),
(9, 'xxxxxxx');

-- --------------------------------------------------------

--
-- Table structure for table `contact_form_email`
--

CREATE TABLE `contact_form_email` (
  `id` int(10) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_form_email`
--

INSERT INTO `contact_form_email` (`id`, `email`) VALUES
(1, 'youremail@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `home_content`
--

CREATE TABLE `home_content` (
  `id` int(10) NOT NULL,
  `content_section` varchar(255) NOT NULL,
  `first_title` varchar(255) NOT NULL,
  `second_title` varchar(255) NOT NULL,
  `description` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `home_content`
--

INSERT INTO `home_content` (`id`, `content_section`, `first_title`, `second_title`, `description`) VALUES
(2, 'About Downloader', 'sscczxc', 'adsaczxczxc', 'dsnadasnckc aksdjasdklj asdljdls asldjsdl '),
(3, 'How to Download', 'dsds', 'dsds', '					\r\ndsds');

-- --------------------------------------------------------

--
-- Table structure for table `new_table_name`
--

CREATE TABLE `new_table_name` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int(10) NOT NULL DEFAULT 0,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `new_table_name`
--

INSERT INTO `new_table_name` (`id`, `name`, `surname`, `email`, `mobile`, `address`, `password`, `status`, `created_at`) VALUES
(11, 'Test admin', '', 'testadmin@gmail.com', '1234567890', 'New Delhi', '0192023a7bbd73250516f069df18b500', 1, '2020-06-17 18:39:14.874271'),
(12, 'temp admin', '', 'tempadmin@gmail.com', '12', 'Noida', '0192023a7bbd73250516f069df18b500', 1, '2020-06-17 18:39:52.830541');

-- --------------------------------------------------------

--
-- Table structure for table `theme_setting`
--

CREATE TABLE `theme_setting` (
  `id` int(10) NOT NULL,
  `header_background` varchar(255) NOT NULL,
  `footer_background` varchar(255) NOT NULL,
  `downloader_box_background` varchar(255) NOT NULL,
  `downloader_box_button` varchar(255) NOT NULL,
  `first_title` varchar(255) NOT NULL,
  `second_title` varchar(255) NOT NULL,
  `third_title` varchar(255) NOT NULL,
  `footer_menu_link` varchar(255) NOT NULL,
  `header_menu_link` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `paragraph` varchar(255) NOT NULL,
  `logo_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `theme_setting`
--

INSERT INTO `theme_setting` (`id`, `header_background`, `footer_background`, `downloader_box_background`, `downloader_box_button`, `first_title`, `second_title`, `third_title`, `footer_menu_link`, `header_menu_link`, `icon`, `paragraph`, `logo_name`) VALUES
(1, '#0a570d', '#c2c52b', '#a61c1c', '#8a7575', '#d53030', '#4d1f1f', '#1917a6', '#75c5c7', '#6ff316', '#4f24eb', '#ff0000', '#f50000');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(10) NOT NULL,
  `userId` int(6) NOT NULL,
  `username` varchar(50) NOT NULL,
  `loginDate` date NOT NULL,
  `loginTime` time NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userId`, `username`, `loginDate`, `loginTime`, `status`) VALUES
(428, 1, 'admin', '2021-06-04', '12:24:46', 0),
(429, 1, 'admin', '2021-06-04', '12:24:59', 0),
(430, 1, 'admin', '2021-06-04', '12:25:12', 0),
(431, 1, 'admin', '2021-06-04', '12:25:18', 1),
(432, 1, 'admin', '2021-06-04', '12:29:23', 0),
(433, 1, 'admin', '2021-06-04', '12:29:26', 1),
(434, 1, 'admin', '2021-06-04', '12:29:47', 1),
(435, 1, 'admin', '2021-06-04', '12:30:11', 1),
(436, 11, 'user', '2021-06-04', '12:31:25', 1),
(437, 1, 'admin', '2021-06-04', '12:32:12', 1),
(438, 11, 'user', '2021-06-04', '12:36:47', 0),
(439, 11, 'user', '2021-06-04', '12:36:52', 1),
(440, 11, 'user', '2021-06-04', '12:37:13', 1),
(441, 11, 'user', '2021-06-04', '12:38:02', 1),
(442, 1, 'admin', '2021-06-04', '12:41:03', 1),
(443, 11, 'user', '2021-06-04', '12:41:09', 0),
(444, 11, 'user', '2021-06-04', '12:41:12', 1),
(445, 1, 'admin', '2021-06-04', '12:49:50', 1),
(446, 11, 'user', '2021-06-04', '12:50:02', 1),
(447, 11, 'user', '2021-06-04', '13:29:31', 1),
(448, 11, 'user', '2021-06-04', '13:59:00', 0),
(449, 11, 'user', '2021-06-04', '13:59:02', 1),
(450, 11, 'user', '2021-06-04', '15:26:53', 0),
(451, 11, 'user', '2021-06-04', '15:26:56', 1),
(452, 11, 'user', '2021-06-04', '15:32:23', 0),
(453, 11, 'user', '2021-06-04', '15:32:27', 1),
(454, 1, 'admin', '2021-06-04', '15:40:23', 1),
(455, 11, 'user', '2021-06-04', '15:40:29', 1),
(456, 1, 'admin', '2021-06-04', '15:40:39', 1),
(457, 11, 'user', '2021-06-04', '15:40:45', 1),
(458, 11, 'user', '2021-06-04', '18:17:00', 0),
(459, 11, 'user', '2021-06-04', '18:17:03', 1),
(460, 11, 'user', '2021-06-04', '18:19:39', 0),
(461, 11, 'user', '2021-06-04', '18:19:42', 1),
(462, 11, 'user', '2021-06-04', '23:42:11', 1),
(463, 11, 'user', '2021-06-04', '23:44:27', 0),
(464, 11, 'user', '2021-06-04', '23:44:29', 1),
(465, 11, 'user', '2021-06-05', '00:48:41', 1),
(466, 1, 'admin', '2021-06-05', '01:16:58', 1),
(467, 1, 'admin', '2021-06-05', '22:03:47', 1),
(468, 11, 'user', '2021-06-05', '22:03:59', 1),
(469, 11, 'user', '2021-06-06', '02:26:37', 1),
(470, 11, 'user', '2021-06-06', '18:41:14', 1),
(471, 11, 'user', '2021-06-06', '19:07:50', 1),
(472, 11, 'user', '2021-06-06', '21:43:32', 1),
(473, 11, 'user', '2021-06-07', '11:04:18', 1),
(474, 12, 'userFreskia', '2021-06-07', '11:06:13', 1),
(475, 11, 'user', '2021-06-07', '12:26:09', 1),
(476, 11, 'user', '2021-06-07', '14:16:17', 1),
(477, 12, 'userFreskia', '2021-06-07', '15:01:31', 1),
(478, 11, 'user', '2021-06-07', '15:04:20', 1),
(479, 12, 'userFreskia', '2021-06-07', '15:04:40', 1),
(480, 11, 'user', '2021-06-08', '10:07:30', 1),
(481, 11, 'user', '2021-06-08', '10:39:42', 0),
(482, 11, 'user', '2021-06-08', '10:39:45', 1),
(483, 12, 'userFreskia', '2021-06-08', '10:40:09', 1),
(484, 13, 'userFreskia2', '2021-06-08', '10:41:27', 1),
(485, 12, 'userFreskia', '2021-06-08', '10:42:05', 0),
(486, 12, 'userFreskia', '2021-06-08', '10:42:07', 1),
(487, 11, 'user', '2021-06-08', '10:44:02', 1),
(488, 12, 'userFreskia', '2021-06-08', '10:45:44', 1),
(489, 14, 'freskia', '2021-06-08', '10:47:02', 1),
(490, 14, 'freskia', '2021-06-08', '10:49:06', 1),
(491, 14, 'freskia', '2021-06-08', '10:49:36', 1),
(492, 14, 'freskia', '2021-06-08', '10:52:38', 0),
(493, 14, 'freskia', '2021-06-08', '10:52:41', 1),
(494, 14, 'freskia', '2021-06-08', '10:59:17', 0),
(495, 14, 'freskia', '2021-06-08', '10:59:19', 0),
(496, 14, 'freskia', '2021-06-08', '10:59:22', 1),
(497, 14, 'freskia', '2021-06-08', '11:01:46', 0),
(498, 14, 'freskia', '2021-06-08', '11:01:49', 1),
(499, 11, 'user', '2021-06-08', '11:02:39', 1),
(500, 1, 'admin', '2021-06-08', '11:04:42', 1),
(501, 12, 'userFreskia', '2021-06-08', '11:04:48', 1),
(502, 14, 'freskia', '2021-06-08', '11:04:55', 1),
(503, 14, 'freskia', '2021-06-08', '11:12:30', 1),
(504, 14, 'freskia', '2021-06-08', '11:15:38', 1),
(505, 11, 'user', '2021-06-08', '14:46:03', 1),
(506, 1, 'admin', '2021-06-10', '00:32:41', 0),
(507, 1, 'admin', '2021-06-10', '00:32:44', 1),
(508, 11, 'user', '2021-06-10', '00:32:52', 1),
(509, 11, 'user', '2021-06-10', '10:25:30', 0),
(510, 11, 'user', '2021-06-10', '10:25:31', 0),
(511, 11, 'user', '2021-06-10', '10:25:33', 1),
(512, 12, 'userFreskia', '2021-06-10', '10:42:17', 1),
(513, 11, 'user', '2021-06-10', '10:42:27', 1),
(514, 11, 'user', '2021-06-10', '11:13:58', 1),
(515, 11, 'user', '2021-06-10', '11:20:03', 1),
(516, 11, 'user', '2021-06-10', '11:20:26', 1),
(517, 11, 'user', '2021-06-10', '11:20:41', 1),
(518, 11, 'user', '2021-06-10', '11:20:54', 1),
(519, 12, 'userFreskia', '2021-06-10', '11:56:36', 1),
(520, 13, 'userFreskia2', '2021-06-10', '13:16:04', 1),
(521, 12, 'userFreskia', '2021-06-10', '13:16:18', 1),
(522, 14, 'freskia', '2021-06-10', '13:18:22', 0),
(523, 14, 'freskia', '2021-06-10', '13:18:25', 1),
(524, 1, 'admin', '2021-06-10', '13:19:18', 1),
(525, 14, 'freskia', '2021-06-10', '13:19:27', 1),
(526, 1, 'ADMIN', '2021-06-10', '13:27:21', 0),
(527, 15, 'MOREA', '2021-06-10', '13:27:44', 0),
(528, 15, 'MOREA', '2021-06-10', '13:27:46', 0),
(529, 15, 'MOREA', '2021-06-10', '13:27:49', 0),
(530, 15, 'MOREA', '2021-06-10', '13:27:58', 0),
(531, 15, 'MOREA', '2021-06-10', '13:27:58', 0),
(532, 15, 'MOREA', '2021-06-10', '13:28:09', 0),
(533, 15, 'morea', '2021-06-10', '13:28:16', 1),
(534, 15, 'morea', '2021-06-10', '13:30:56', 1),
(535, 15, 'morea', '2021-06-10', '13:53:26', 0),
(536, 15, 'morea', '2021-06-10', '13:53:28', 1),
(537, 11, 'user', '2021-06-11', '09:53:09', 1),
(538, 11, 'user', '2021-06-11', '10:08:27', 0),
(539, 11, 'user', '2021-06-11', '10:08:30', 1),
(540, 11, 'user', '2021-06-11', '10:35:54', 1),
(541, 15, 'morea', '2021-06-11', '11:35:08', 1),
(542, 12, 'userFreskia', '2021-06-11', '11:35:53', 1),
(543, 13, 'userFreskia2', '2021-06-11', '11:35:58', 1),
(544, 11, 'user', '2021-06-11', '11:39:42', 1),
(545, 11, 'USER', '2021-06-11', '11:40:21', 1),
(546, 11, 'user', '2021-06-11', '11:42:36', 1),
(547, 11, 'user', '2021-06-11', '12:55:37', 1),
(548, 12, 'userFreskia', '2021-06-11', '12:57:14', 1),
(549, 13, 'userFreskia2', '2021-06-11', '12:59:14', 1),
(550, 13, 'userFreskia2', '2021-06-11', '13:47:53', 1),
(551, 11, 'user', '2021-06-11', '13:48:01', 1),
(552, 11, 'user', '2021-06-14', '10:48:52', 0),
(553, 11, 'user', '2021-06-14', '10:48:55', 1),
(554, 14, 'freskia', '2021-06-14', '10:49:16', 1),
(555, 15, 'morea', '2021-06-14', '11:05:13', 0),
(556, 15, 'morea', '2021-06-14', '11:05:15', 1),
(557, 14, 'freskia', '2021-06-14', '11:09:52', 1),
(558, 11, 'user', '2021-06-14', '11:26:31', 1),
(559, 12, 'userFreskia', '2021-06-14', '11:26:45', 1),
(560, 12, 'userFreskia', '2021-06-14', '11:27:30', 1),
(561, 14, 'freskia2', '2021-06-14', '16:51:05', 0),
(562, 14, 'freskia2', '2021-06-14', '16:51:07', 1),
(563, 14, 'freskia', '2021-06-14', '16:52:56', 1),
(564, 14, 'freskia', '2021-06-14', '16:53:14', 1),
(565, 14, 'freskia', '2021-06-14', '16:53:20', 0),
(566, 14, 'freskia', '2021-06-14', '16:53:22', 0),
(567, 14, 'freskia', '2021-06-14', '16:53:24', 1),
(568, 14, 'freskia', '2021-06-14', '17:06:09', 1),
(569, 14, 'freskia', '2021-06-14', '17:06:24', 1),
(570, 14, 'freskia', '2021-06-15', '00:31:45', 1),
(571, 14, 'freskia', '2021-06-15', '10:10:12', 1),
(572, 15, 'morea', '2021-06-15', '10:24:52', 1),
(573, 16, 'userMorea', '2021-06-15', '10:49:44', 1),
(574, 15, 'morea', '2021-06-15', '10:50:05', 1),
(575, 16, 'userMorea', '2021-06-15', '10:52:38', 0),
(576, 16, 'userMorea', '2021-06-15', '10:52:41', 1),
(577, 15, 'morea', '2021-06-15', '10:53:10', 1),
(578, 15, 'morea', '2021-06-15', '11:19:06', 1),
(579, 12, 'userFreskia', '2021-06-15', '12:13:55', 1),
(580, 17, 'userMorea2', '2021-06-15', '12:14:12', 1),
(581, 11, 'user', '2021-06-15', '12:14:47', 1),
(582, 14, 'freskia', '2021-06-15', '12:15:36', 1),
(583, 15, 'morea', '2021-06-15', '12:15:48', 1),
(584, 11, 'user', '2021-06-15', '12:16:02', 1),
(585, 14, 'freskia', '2021-06-15', '12:16:43', 1),
(586, 11, 'user', '2021-06-16', '11:06:20', 1),
(587, 11, 'user', '2021-06-16', '11:06:20', 1),
(588, 1, 'admin', '2021-06-17', '13:30:54', 1),
(589, 14, 'freskia', '2021-06-17', '13:31:01', 0),
(590, 14, 'freskia', '2021-06-17', '13:31:04', 1),
(591, 12, 'userFreskia', '2021-06-17', '13:38:29', 1),
(592, 13, 'userFreskia2', '2021-06-17', '14:14:54', 1),
(593, 14, 'freskia', '2021-06-17', '14:59:11', 1),
(594, 12, 'userFreskia', '2021-06-17', '15:00:57', 1),
(595, 14, 'freskia', '2021-06-17', '15:44:23', 1),
(596, 12, 'userFreskia', '2021-06-17', '16:46:07', 1),
(597, 14, 'freskia', '2021-06-17', '16:46:35', 1),
(598, 14, 'freskia', '2021-06-18', '10:39:10', 1),
(599, 14, 'freskia', '2021-06-18', '10:39:50', 1),
(600, 14, 'freskia', '2021-06-18', '10:41:41', 1),
(601, 14, 'freskia', '2021-06-18', '10:42:32', 1),
(602, 14, 'freskia', '2021-06-18', '10:47:43', 1),
(603, 14, 'freskia', '2021-06-18', '10:47:43', 1),
(604, 14, 'freskia', '2021-06-18', '10:47:44', 1),
(605, 14, 'freskia', '2021-06-18', '10:47:44', 1),
(606, 14, 'freskia', '2021-06-18', '10:47:44', 1),
(607, 14, 'freskia', '2021-06-18', '10:47:44', 1),
(608, 14, 'freskia', '2021-06-18', '10:47:44', 1),
(609, 14, 'freskia', '2021-06-18', '10:47:44', 1),
(610, 14, 'freskia', '2021-06-18', '10:47:44', 1),
(611, 14, 'freskia', '2021-06-18', '10:47:44', 1),
(612, 14, 'freskia', '2021-06-18', '10:47:45', 1),
(613, 12, 'userFreskia', '2021-06-18', '10:49:49', 1),
(614, 14, 'freskia', '2021-06-18', '10:50:44', 1),
(615, 14, 'freskia', '2021-06-18', '12:45:28', 1),
(616, 12, 'userFreskia', '2021-06-18', '12:45:51', 1),
(617, 15, 'morea', '2021-06-18', '13:36:23', 1),
(618, 14, 'freskia', '2021-06-18', '13:45:17', 0),
(619, 14, 'freskia', '2021-06-18', '13:45:20', 1),
(620, 15, 'morea', '2021-06-18', '13:56:50', 1),
(621, 14, 'freskia', '2021-06-18', '13:56:57', 0),
(622, 14, 'freskia', '2021-06-18', '13:56:59', 1),
(623, 12, 'userFreskia', '2021-06-18', '14:24:04', 1),
(624, 14, 'freskia', '2021-06-21', '12:16:04', 0),
(625, 14, 'freskia', '2021-06-21', '12:16:07', 1),
(626, 12, 'userFreskia', '2021-06-21', '13:35:59', 1),
(627, 14, 'freskia', '2021-06-21', '15:18:05', 0),
(628, 14, 'freskia', '2021-06-21', '15:18:08', 1),
(629, 14, 'freskia', '2021-06-21', '15:18:41', 1),
(630, 12, 'userFreskia', '2021-06-21', '15:30:02', 1),
(631, 14, 'freskia', '2021-06-21', '15:30:26', 1),
(632, 12, 'userFreskia', '2021-06-21', '15:35:53', 1),
(633, 14, 'freskia', '2021-06-21', '15:36:07', 1),
(634, 14, 'freskia', '2021-06-21', '15:42:07', 1),
(635, 12, 'userFreskia', '2021-06-21', '16:05:07', 1),
(636, 14, 'freskia', '2021-06-21', '16:07:43', 0),
(637, 14, 'freskia', '2021-06-21', '16:07:45', 1),
(638, 14, 'freskia', '2021-06-22', '10:31:26', 1),
(639, 1, 'admin', '2021-06-22', '10:34:19', 0),
(640, 1, 'admin', '2021-06-22', '10:34:22', 0),
(641, 1, 'admin', '2021-06-22', '10:34:25', 1),
(642, 1, 'admin', '2021-06-22', '10:35:45', 1),
(643, 1, 'admin', '2021-06-22', '10:37:36', 1),
(644, 14, 'freskia', '2021-06-22', '10:46:07', 1),
(645, 1, 'admin', '2021-06-22', '10:46:44', 1),
(646, 14, 'freskia', '2021-06-22', '11:53:19', 1),
(647, 1, 'admin', '2021-06-22', '11:53:31', 0),
(648, 1, 'admin', '2021-06-22', '11:53:33', 1),
(649, 12, 'userFreskia', '2021-06-22', '11:55:01', 1),
(650, 1, 'admin', '2021-06-22', '11:55:21', 1),
(651, 13, 'userFreskia2', '2021-06-22', '12:02:41', 1),
(652, 14, 'freskia', '2021-06-22', '12:02:53', 1),
(653, 1, 'admin', '2021-06-22', '12:03:00', 1),
(654, 14, 'freskia', '2021-06-22', '12:04:05', 1),
(655, 1, 'admin', '2021-06-22', '12:04:15', 1),
(656, 14, 'freskia', '2021-06-22', '12:16:29', 1),
(657, 14, 'freskia', '2021-06-22', '13:15:21', 1),
(658, 1, 'admin', '2021-06-22', '13:18:23', 1),
(659, 1, 'admin', '2021-06-22', '16:09:20', 1),
(660, 1, 'admin', '2021-06-22', '16:15:36', 0),
(661, 1, 'admin', '2021-06-22', '16:15:39', 1),
(662, 14, 'freskia', '2021-06-22', '16:22:10', 1),
(663, 14, 'freskia', '2021-06-22', '16:22:27', 1),
(664, 14, 'freskia', '2021-06-22', '16:27:17', 1),
(665, 1, 'ADMIN', '2021-06-22', '16:27:36', 0),
(666, 1, 'ADMIN', '2021-06-22', '16:27:39', 1),
(667, 1, 'administrator', '2021-06-22', '16:38:55', 1),
(668, 14, 'freskia', '2021-06-22', '16:48:02', 1),
(669, 12, 'userFreskia', '2021-06-22', '16:48:32', 1),
(670, 1, 'admin', '2021-06-22', '16:48:42', 0),
(671, 1, 'admin', '2021-06-22', '16:48:43', 1),
(672, 1, 'admin', '2021-06-23', '10:40:22', 1),
(673, 19, 'green', '2021-06-23', '10:44:57', 1),
(674, 1, 'admin', '2021-06-23', '10:45:12', 1),
(675, 1, 'admin', '2021-06-23', '12:10:38', 1),
(676, 1, 'admin', '2021-06-23', '12:13:24', 1),
(677, 1, 'admin', '2021-06-23', '13:11:18', 1),
(678, 14, 'freskia', '2021-06-23', '13:11:36', 1),
(679, 12, 'userFreskia', '2021-06-23', '13:21:42', 1),
(680, 13, 'userfreskia2', '2021-06-23', '13:21:55', 1),
(681, 14, 'freskia', '2021-06-23', '13:24:05', 1),
(682, 14, 'freskia', '2021-06-23', '13:35:10', 1),
(683, 12, 'userFreskia', '2021-06-23', '13:36:02', 1),
(684, 14, 'freskia', '2021-06-23', '13:39:52', 1),
(685, 12, 'userFreskia', '2021-06-23', '13:44:21', 1),
(686, 1, 'admin', '2021-06-23', '13:45:51', 1),
(687, 1, 'admin', '2021-06-23', '14:03:19', 1),
(688, 20, 'greenlife', '2021-06-23', '14:42:34', 1),
(689, 1, 'admin', '2021-06-23', '14:43:01', 1),
(690, 20, 'greenlife', '2021-06-23', '14:46:20', 1),
(691, 21, 'usergreen', '2021-06-23', '14:46:48', 1),
(692, 1, 'admin', '2021-06-23', '14:47:10', 1),
(693, 1, 'admin', '2021-06-23', '14:56:50', 1),
(694, 20, 'greenlife', '2021-06-23', '14:57:02', 1),
(695, 1, 'admin', '2021-06-23', '14:57:07', 1),
(696, 22, 'freskia2', '2021-06-23', '15:20:06', 1),
(697, 1, 'admin', '2021-06-23', '15:20:15', 1),
(698, 1, 'admin', '2021-06-23', '15:20:49', 1),
(699, 1, 'admin', '2021-06-24', '10:03:04', 1),
(700, 1, 'admin', '2021-06-24', '10:03:10', 1),
(701, 14, 'freskia', '2021-06-24', '10:31:33', 1),
(702, 12, 'userFreskia', '2021-06-24', '10:31:54', 1),
(703, 1, 'admin', '2021-06-24', '10:31:59', 1),
(704, 22, 'freskia2', '2021-06-24', '10:34:31', 1),
(705, 1, 'admin', '2021-06-24', '10:34:58', 1),
(706, 14, 'freskia', '2021-06-24', '11:48:19', 1),
(707, 12, 'userFreskia', '2021-06-24', '11:52:53', 1),
(708, 1, 'admin', '2021-06-24', '11:58:03', 1),
(709, 1, 'admin', '2021-06-24', '12:09:57', 0),
(710, 1, 'admin', '2021-06-24', '12:09:59', 1),
(711, 1, 'admin', '2021-06-24', '14:03:47', 0),
(712, 1, 'admin', '2021-06-24', '14:03:50', 1),
(713, 15, 'morea', '2021-06-24', '14:42:20', 1),
(714, 1, 'admin', '2021-06-24', '14:42:59', 1),
(715, 15, 'morea', '2021-06-24', '14:45:09', 1),
(716, 12, 'userFreskia', '2021-06-24', '14:46:50', 1),
(717, 14, 'freskia', '2021-06-24', '14:47:23', 0),
(718, 14, 'freskia', '2021-06-24', '14:47:26', 1),
(719, 12, 'userFreskia', '2021-06-24', '14:48:00', 1),
(720, 1, 'admin', '2021-06-24', '14:48:16', 1),
(721, 14, 'freskia', '2021-06-24', '15:54:48', 1),
(722, 1, 'admin', '2021-06-24', '16:11:11', 1),
(723, 25, 'freskiaadmin', '2021-06-24', '16:32:59', 1),
(724, 1, 'admin', '2021-06-25', '11:16:43', 1),
(725, 14, 'freskia', '2021-06-25', '13:02:39', 1),
(726, 14, 'freskia', '2021-06-25', '13:14:39', 1),
(727, 12, 'userFreskia', '2021-06-25', '13:14:53', 1),
(728, 1, 'admin', '2021-06-25', '13:19:23', 1),
(729, 12, 'userFreskia', '2021-06-25', '13:19:30', 1),
(730, 1, 'admin', '2021-06-25', '13:26:52', 1),
(731, 12, 'userFreskia', '2021-06-25', '13:27:10', 1),
(732, 1, 'admin', '2021-06-25', '13:33:39', 1),
(733, 1, 'admin', '2021-06-25', '14:03:51', 1),
(734, 14, 'freskia', '2021-06-25', '14:04:01', 1),
(735, 12, 'userFreskia', '2021-06-25', '14:04:27', 1),
(736, 14, 'freskia', '2021-06-25', '14:04:33', 1),
(737, 1, 'admin', '2021-06-25', '14:04:49', 1),
(738, 12, 'userFreskia', '2021-06-25', '14:06:08', 1),
(739, 1, 'admin', '2021-06-25', '14:07:23', 1),
(740, 12, 'userFreskia', '2021-06-25', '14:08:31', 1),
(741, 14, 'freskia', '2021-06-25', '14:09:25', 1),
(742, 1, 'admin', '2021-06-25', '14:10:08', 1),
(743, 1, 'admin', '2021-06-25', '14:10:23', 1),
(744, 14, 'freskia', '2021-06-25', '14:10:34', 1),
(745, 12, 'userFreskia', '2021-06-25', '14:10:45', 1),
(746, 14, 'freskia', '2021-07-01', '11:11:06', 1),
(747, 14, 'freskia', '2021-07-01', '11:31:29', 1),
(748, 14, 'freskia', '2021-07-01', '12:13:36', 1),
(749, 14, 'freskia', '2021-07-05', '13:30:32', 1),
(750, 14, 'freskia', '2021-07-05', '14:47:25', 1),
(751, 12, 'userFreskia', '2021-07-05', '15:08:02', 1),
(752, 1, 'admin', '2021-07-05', '15:34:43', 0),
(753, 1, 'admin', '2021-07-05', '15:34:47', 0),
(754, 1, 'admin', '2021-07-05', '15:34:50', 1),
(755, 14, 'freskia', '2021-07-05', '15:37:02', 1),
(756, 1, 'admin', '2021-07-05', '15:40:21', 1),
(757, 1, 'admin', '2021-07-05', '16:48:16', 1),
(758, 1, 'admin', '2021-07-07', '10:13:50', 1),
(759, 1, 'admin', '2021-07-07', '10:13:50', 1),
(760, 1, 'admin', '2021-07-07', '10:13:50', 1),
(761, 1, 'admin', '2021-07-07', '10:13:56', 1),
(762, 27, 'umorea1', '2021-07-07', '10:17:59', 1),
(763, 23, 'milaim', '2021-07-07', '10:18:39', 0),
(764, 23, 'milaim', '2021-07-07', '10:18:44', 0),
(765, 23, 'milaim', '2021-07-07', '10:18:51', 1),
(766, 1, 'admin', '2021-07-07', '10:20:04', 1),
(767, 14, 'freskia', '2021-07-07', '10:20:41', 0),
(768, 14, 'freskia', '2021-07-07', '10:20:45', 1),
(769, 1, 'admin', '2021-07-07', '10:21:36', 0),
(770, 1, 'admin', '2021-07-07', '10:21:39', 1),
(771, 1, 'admin', '2021-07-07', '10:23:30', 1),
(772, 1, 'admin', '2021-08-03', '13:11:57', 1),
(773, 12, 'userFreskia', '2021-08-03', '13:12:29', 0),
(774, 12, 'userFreskia', '2021-08-03', '13:12:32', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `companyId` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `email` varchar(320) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(120) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `phone` char(16) DEFAULT NULL,
  `privilege` char(1) NOT NULL,
  `photo` longblob DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `registered` datetime DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  `online` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `companyId`, `name`, `surname`, `email`, `username`, `password`, `birthday`, `gender`, `phone`, `privilege`, `photo`, `status`, `registered`, `last_updated`, `online`) VALUES
(1, NULL, 'admin', 'administrator', '', 'admin', '$2y$10$hSo/ghXllzWxcBIx0/NvRewFArcBtSR1XFYqe1iipIYThNTGT2.tq', '2021-04-24', 'm', '(383) 45-698-567', '1', 0x89504e470d0a1a0a0000000d494844520000012c0000012c0806000000797d8e75000000017352474200aece1ce90000000467414d410000b18f0bfc6105000000097048597300000ec300000ec301c76fa8640000ffa549444154785eecfd09b06dc9759e89e599f699c73bbeb15ecd4580000a85912000b2444020418820218974ab25cb106dd2922db51d961c61396c1972747728c28e7687e4a660351ba664b169da24051224a526a5220410c4509851136a7cafde78e7339fbdcfe4ff5bb9f7bdb70a55106d37f1ee2dec755fbe3d67e61ed67ffeb57265a64b259554524925955452492595545249259554524925955452492595545249259554524925955452492595545249259554524925955452492595545249259554524925955452492595545249259554524925955452492595545249259554524925955452492595545249259554524925955452492595545249259554524925955452492595545e2e9978994a2aaf28bff24ffec9cacee0e0feedad9b675ebc7ab53cecf5dc74be70bdded0158282ab554b5a066e1acddd389ab8f9746ed7950b3957aa55ddfafaba3baf546db75d4efbe73abccc2c061b17eebe5cabd59efaa99ffaa9915d904a2a7f0a4901ebfb4c2e3ff5d45dd79e7fe6be5e6fbfb3bdb793bd79ed86bbb1754300d473d1786ae7cc1780cedce5b239576f34d7b385e0eddd7ef781bd9dddf26432764b9775e16ce1b2f9bc2b286533595d337333d0489f542e9b75d959e8b2b99cab56aaaed1a8bb72b5e2723a2f93c9900695faea57f5f17db551ab75d72f5e1cdd71e1c295c6cacab7dff9ce77f6ac12a9a4f20a9202d6f7913cf2fbbf75299b0b3ebc73e3ea877a07ddb33b3bdbb91b376ebafdfd7d371a0ddc424095c9e4dd7c3615002df57164043ad99c3e92d6389cb4878341663a9d8921655cb8d45e2ddd72e9164a2cb302aa406c2b075065972ed2b98bc5c2408a637c6d051d2b1402b7c8073bf55a7bd06ab7a79df595e1dafafa17cf9d3bf7af56cab547dff7918fecc6554e259597480a58df27f25bffed272e750ffa1fea0f0e7e7619856fec1df42a7bbb3b99eddd5d371c0edd741a0973043cfa2400a5f96c6edb59b1ac7c3e9711ebca4561a46353998473675c4c40b414b0cd01256d025424006a45e620e7ce752edb4b9d339d09c0960b636e93d962d15a595faeaeac2c0bc5a2b2595e0f4ac53fae942b5f387be6cccd4ea7edba8381d5ad5c2e4567cf5cd87edd1bef7ef6ed6f7ff82645a7f2fd2929607d1fc87ff3dffc5f2ff46e6d7d7867ebd65f1a0cfa0f2de68b4a389ee40600c2486015012c0229810fc012455a17d0c88033b32e2fb30f709a0b70a248a0a5e5329fb5fd80da8c6dc04ee72c047491c0af59aeca745c1a801583a27d6994c33164bac8b846b3e55aadb69dd71bf4e7d174bad7683676363637a2b24cc968123a4cd04c2617adaead3c73ff03f7fffedde7effcb77ffea77ffaba6592caf79da480f51a974ffcd37f7aef0b2f3cfdfeeb572fff0f4683de1b8544b5309ae70099994cbf482002bb02a062cc9179877b1c338ee54b05b311c09a8963150a059d2520c377a5eb0027f20dc3d0e59705e587399898895927a03c04b1502c2e73cc8484b585b3e92297cfcd8ba5a2ac4ecef72c8fa47dbdb5d5b52f5f387fe1bfbbfbde7bbef09e877ff8d91ffcc1b7a76cebfb4c52c07a0dcaf21ffc83ecbf79fd3d777dedb1af9ded0dc387b76fddfab1bd9dadb7cca6b3a2acbb1c3e754c39ccb384f5c09ef04561be1583b2d81380e3d9d34cac290b201d3ad8052e53988f4cbd1850009da018d807359b2ddc6030b13238c679be623231755ebe907713998b94876f2ba3cc173a77b61053d369c6e894136c8de3242b239bedafacaebe70d75d773d71efdd77ffce9bdef1ae3f7cf8e1d444fc7e9214b05e23f2c8238f94f2f3d1c5279f78fcec0bcf3d532f952a6fb975ebc65b06c3e19d32ad2e4dc2b00aa3c2e4133a68097e2ccc294e9ac37eb40d3014f281311f1810be2c7c5108610c859c370f17cbb91300ba502622600728d971011da0d41f79c0827d4d552ee70274e6c857be13ea21a0ca2b3faef575981b88c2aef830977303a9c3bacc04ac996c2eeab4db83339b67fef8a11f7ef76fdc7ffffdffe6277ff22753d0fa3e9114b04eb9fcdeeffd5e510a7fe68567be7effb03b7ed7def6ad87f60f769b02aa955eb77787ccbd82584b30c3598ef927f0280810001da333f65ff219d80e030c80c7331d62a7bce3dc4c40810c2c0b10016430ffc6e3b1f9b6b23aa7582ab972b9eca218accce7a5b259627e029a5c1709af323213294766a001196065000a70e97aa7737202b452a9e8cd4895455e2595d1e9acec9ebffbde2fbcfb3deffeb57befbdf733625a2f586553794d4b0a58a75800abd96c74cfb52b977feca9c7bef1707777f71e9951770c86e37cafd7cdf50783c01ce23a1766e54d3ea1574ec0636f5e30a12560444ab669c5037c0c3c04229887a562d11814f9c1bacae59281093ea9f178e246c3a10114805511604d75ad3125cb77694063e78d466265021e313ae1919593157051a615ae73617b739995cac280aaa8b2cdcfa53c681c60bbde68ce6badcefebbdff39e3f9189f8efae5eb9f255dde3f0cefbeebbfad8638f6d7dec631f23fb545e63f29d5ed5544e850056a383837b9efbf6533ff1f4934ffecc8d2b97df39e8ef6f4cc349e5e6f65ea1d7ebe7603e06303163811961ee014c445979f140e5c1c22f0dc0c4a40023808ea5071f3133c94c80329ec8e4131266ed3cac4cf0c1830fe7613216b41e98999837d38e730b6253801f00c4b6d5828c944b9672b48e696a12031e55f3beb2c4892ff657c867f38542b1522eae0efaddb3d7ae5d7f707b7bebc1683ccc362ad5de3bdffdeeeea73ffd69324ee53524f6bda472bae4d77ffdd7cbb3d1e8aeab2f3ef7e79ffff6d33fb37debc69ba7d3716db9981a83d9da83eda0dc9871898fc8eb6e62e619360130987802137c446c1b2312d8e40d6c70a267cc8c0430f0376116c2ba888f623d5002512c6ecbf2f7b15838c90ca86061ba366147e46fe6dd1473d19b88802a80479d59a73cadba65d6d7d5ea6760e91df856aeea56aa56dd4aa7b30882622836390fc3c9f4ccfac69facafadfec1c141ffd1bbefbb6ff0c01bdf78abd3e96ccb649c5966a99c6a4901eb94c9e73ef7b9f2d5ab4fddffc293cfbdeff2d3cffde4eeced64351386e2c163337180f5cb7df97d2e70c245072000b31d350fb000b8b4c97a0fc30a2a4250e06668025e0cb6b8979978fcf3767bdc4339d65cca824875f100e746fbe89f9b8f974a23c63f0927853d2b7442a039d23a66720a4e2046e001e3eaa89989b80c78d2201d782cc3dc079d0f2806af56689292940ac542a568df164eceaf5fa7ea7dd7a6a3a5b5c3b73e952ef0d6f78d367ce9c39f3ef5badd6e514b44ebfa426e12992175f7cb17ce3f2e57b5ef8f6133ff1fcd3cf7cf8d6f5ab0f2ea6d306fe9fc164e4ba8391945c6090150b129ea0d8283bc0e515dd0781ce010da938ac8aa5a5a5370181215ce0302c9da12def67e23af2c2bc24b14d9e26ca2e290be603eb1271b37d30b8643fec0b7022ee2baf3a03a6a5626081a55c032363c9364044e86a02568895017029017c34248cc52839079f1af946615416f8752693f15db365f65e1d6bd56ab5a85aadeefcfccffffce0577ee55762a44de5344a0a58a748def18e77dc71f9d9a77ffc99a7bef5e1ed1b371fec1d74eb4b81c76c3177c3f1d88231b35274a9b8488c4c425de39993304540c6b625800466a5a599825a229efc104aa00fc380e688d5000a8054e2204f1816e773a1e549a23049b914d831c0cdfb9e3816038fce0144c92701242b477ff8b88a02b762a9ec0ac5922b291ffa1f52279d62f55781e6eb02b4c89f56445a0e6905c5a1af720bf3c5bc389dcecb8bf97c65399bd5f4a18f0bc5e2de2ffcc22fa4a0758a2505ac5322bffdf18f571e7decb1b75e7de1859fbb7ee5f9b78f46a3fa6c3e33b09a6a0980a0f8287720a58721013ad90c4085c3ddc734b14f642a0610920727ae05a00ca8ec9a18ec6c3f80e1971686a025206560299673681e4a88669f4591b127c0c47c523a27094940f085c1a0bc23de078526e7fa2e420b0b75280b88ca32314bc5bc2b2abf7c0e86a5fbe07e60830261f2f07e3a1a036616040b8b0314f5605c341e97c7fdfe8ad8572dc817c26226b377dfeb5ed74b1df2a753fc0f562a275a68117cecab5fbdf75bdffad65fdebe79e33f1e77b7ef46d1011dc022010c0f2e526c4c2fdbef5bd68c05c5c779e523010ac7e3dd31787940629907c44080580ef7c76621e72b03f33791001b8e93ec98a45a2d5bd91cb330058109e2fd5a38f47d5804a049fd12606349dd083e1523b273c9376153f8ba38ce7a7f407804611bf8e6f232671702aca9b6048a322d4b99a20117f55e5d5fdbbbe3eebbfee4dcb9739faa56ea9fddb870e146bbddeea67eadd32529c33a05f2810ffce8c5271f7ffcfd2f3cf7fc87ba077bf7baf934484006414159b7d6b358c9011614957dc79739a15146a0e14d37ef3ca77f20ad7a283efb8a0522dd89d5f2210b004a9212a739cce6b8702ee978b9fe5affdf52b48e558242190d827c00541859c2ae8e125d7f22373207bc0f3ca56c3f7284005979937f2ee30114a15180f1b83c307af658c811949a77d16cea46625ac3e16075341eadab1ee70af96c2928657a7fedaf7d74fc2fffe5bf6420af544e81a48075c2e5139ff844e9a96f7cfdedd72e5ffeb99b376fbc5da65d43ca668a9ac43c01562826a6110a8d49650013ff1d89404aa052248e89eb8d0c19a2a0f131b088dde81cf6615a7109ca6f26965dcf21cee75c9f003d24015152b15cd2350235ede374ea64ccc8d2d2873408b80027e2ba7cf2eb001863691147066085c6bcbcb39f4ed2bec3f6cc4c4b9cf9f8bca8076627e75357f6532ea6a5312f6b810ccb93c9684df9dcbb98cd3604bb23c1e0cddffccddf4c070d3c259202d60997f7bee3c1bb9e7ef2db1fdcd9baf9638bd9f42c3e1d1cd3e6998a81c93bb10186846578d3895115486646e9bc04bc6047f01d70895140f177d1471053121000586cec2ae543fe883128950318715d52b64fe0975f47cc14d5b9b64fdb24806a3a8beba7e30644029e28ae27fb31ef58671f1da83d80f934b57d0c6f330578cc14e52ea88f855e287f3f602023a57aff18d1f654d6ee5d6502ee023eba29d50496abba83bceaf4dccffeeccf5efdd4a73ee5513795132d29609d60f9f8c73f5e78faf16fbc7b7b6beb2f8693e103a5a0105834b8c0003389fe798013e001b8b00d10d8880a06023158a1b85c17ffc1a650600b5700ac30b360682c63c0f28c466c47f99007651883226172025caa0780676ccf80cc8314a0d11b8e0c403cdb23d68ad1180869c0310e3079e0f20076c4acd86f20ab7d66362a593d5467c2312cb854e7513f215b9c9f675ce68017b3a21e049f66e3582ff38de91a6395aa33b11b7a46a5e97c59cc160a3bad56ebcadffdbb7fb79fb61e9e7c4901eb84ca238f3c927ff1d967ef7deac9c73e38ec757f4460b546eb5f14850204674a48323615a7c4ff83d5c636fe21c0071031a092180b5afa5003e33e6c6b696c48e7fa8ec7ba863f2d13bf92cf47d770bac49b9432ffb4c49f643e25ad930f65e3d8870d319a0360048820008739c697309f8c8156024c5ab57bf3797880a35cf37529b1cf86ace16ec8cf000b900e3d4009b03005b957ca2894cb3a2feb8f6b9b1ac0caf26260740fd205c57cb198afd7eb8352a974ebd77ffdd753d3f084cb4b3da7a99c18991c1c9cdfdebaf6e7a3d1e4dd52e135cc40d81040012849a74d1911afd49ec9c0203099605a3019ce3590003cb40f536a341e9b7f68341ef934f2db3eca3cd4f933030624011a40882192e9fa43b71cce27252c8ff3000c50812b6bb5bab135ca1c896db1b4fa01723a2f61578061c2900036808bf3c8832a004e2400cbd8577c4f06629ccb79ba775fb7b10b75ef002d6c91bcad9b0f0c0de0d5b57325cea710016c75321a3dd4ed767f52f7f50302ca541f4eb8a40ceb04ca238f7ca2f4dc6357defdecd34ffd95b0df7fb05c081a78ad447f4c794728bf0114ca0da024a6186615a6133e234205a4e0dab6a529af37c5f0110166049a46337c4b801a8c462c8662b4f43e1f0f563edfd8440454540f8000c0b16e356cc3749458620632c283af9912795206e0a13a702b2175224fbbde0315261fdcceb81fc0478ad73d1ff42065e76869ac51e0b7503dd96766a5f69b683f8005401948a9ac433358e08f33be24933197c994cbe56250afd776fb83e1b3320b539675822505ac13287ff9c3ffd1bdcf3ef5e4876e5cbef2fee5345aaf62be989f478a277d1c8ec343f0f0a0e5cd3080c9fc462830e003d02899221b287800206649b69cb631cb003765af25db1e0662b6a4254a6ef9c4799001e5191890a7f603843028ccbfa9cc34aba7f6030e81980eb84780692806c712b09d529ed5c68351c2965e92741ef893dc63b21f002511e6e0814c498524c7092b45004a6e0cb08a333a6482dc67963c2cdf65311f1496d97cf699dffaad4f3e6717a772222505ac132652ccec1f3ff26fffdce5175ef8e99d5b37697ecfa3608040d2823636f34a8a2885f3ccc7331dc4bada5870a68f59b28872adfb6def6bb20eca3ae663b10c96f49f5f4758032c2c5f2dd17560c09892363c50d2a119a6a5f2c5d2d816a69ac90670252043be2c3dc00ae4a8af4e5c64e20054f2e6b4b8dc2491213eb3249f97aeebb86ed7875f5084f7691d4fc97ebfc40cf540c573f0604c8501dc99eb0f87819ee942a6e9373ff3d9cf7dd52e4ae5444a0a58274cfedcbbde72e9db4f3ef653575eb8fcde61afb782931805070426985d712880d4d6cef780e29ddad6d287035c80042825c0948097c52c691f0a4b0bdfa1e85a80006109b060daf9615ef04f41c80430ba8e72313771f798c35c40043b036658c2e60849b0c601e565cc49f533d331011d2bc93338edf88e443f41841ab26e35b5fd6c278973bc89e7fb4372522294e9d7782e1ea8bcef2c01314ea01b12e7f68703fd084cc262a978f9effdedffe4c9dff8eddfeefb93523969923a194f98ec1d6c3fd43d38f8a1e1b0b742f718d8c1240ce3a86f268c60b6191f518e1f86049810386a11e0f1a8a0492b62d29288a0b009a805625b0018897d2832e7d1170f2778926075e83ee590376510d600205037d89cd68c69c1ae304531d5003bf2a23332f9e0ef0279acae809fae82c519105139328c13200cfbb16d49025a490267a8af9d6eb5f3e721068e3027012dc06b51fc3a4ec883956b8005900a3c1df72bf39a7b1e8e9ac36ef7addf7ef6d9375946a99c484901eb84c9e5e79ebdb4bfbf7be73c8a2a0093544f4a353787f812809089476477321c4b123be58341a58ca6f3dec794f4f59b84bef5cf5a0819a258eb166ea0738eccbed8c414f0c09a40030b2140f961514a1e608e40236f7313023e9e9531490480019ba15eb01ff381599e628578f4ed7a5f4f96c99fb51e925857b25274cef1f4d2f33d73f22da59caf53a8f3618a433be27b230bc403964fccd2134663bb97422e5b1dec1fdc77f98567defecbbffc8fcfdac9a99c384901eb84c9f3cf3d5bedf7ba818d84209602c8a07830994c0e76e3a7da3287b212eb843ad898e828a6149401ed30fdcc3c1470c0a60034f201b07abd9ea57ebf6f210a940113438cb1c540437e00950f09f05d69001e3e9a4281e051ca178889a9889f094030d170b62f6c4c2b3fb243023ffc49e23ab26541a7d45f7527d2dea2ed93a47d243b273e7efc3cdbd6bd253e2900ca421d00d9189d5826fb93460ad61381f5f14c787e45dd77341eaf0f0eba3fb27363efc71e79e47737e3d352394192fab04e90fcd22ffdd2a5cb4f7deb47c7a3e183f3e9ac321e8ddd44091dcb097c60589868f3d8c442d910149684a08e9ccf319885f9aef06571bdb6d90f88c14c92ed8485200686e4a26df234ff97f551c461efcd499674a2a634c66e770228cfaa304fb55f689a590a92047ca4a47e89931c6130416354711989c976b8a4dc1890001403e563eba48c12d77bf3d0334496c9bec30485d22d991918df279251bd3302d922d39ae9c740c782f962d92a144ba552ad7af3939ffcd4d3f1a9a99c104901eb04c90fbde5c19fb879fdc59f18f6877786d1b480837d2ec597a6da722c336e3c1eb948261e5e1d540fa7384e788b3f120361d8e0f99441ec16526a06c4c36cd47ee1888d7525b04141bd0929d1652c8f92145e89730b5c5fc8b9725070b54ae01a95a2ab578bae5224c64a2045d5748defdee347833053cd720248551e00a4259861fb74dccab6c43a09f3924603ba0a693bc7dc88ca935123547e4efb298b7d456dfbf1be54d36cd2d2096001bc024f00d48069e182007395c33c2912e0e5cba5429cc3f142a1683e40cceee97c5e2e8a1e564aa567fff0917fff792e4fe5e4480a5827481e7cfdbd3fb3bbb5fdbe617fd411086500299aff67d2b50991dc93506662640a8ef35a14c1b329310b0c33692f3ae9026d7910c1dc92922e703e4f052404746a7b2eb8c32c93c2e2d83760d2f9c44c010625297a29f0e00038b56a25d769545ca75e71cd5ae02a3abe947915709df20f549704181940d033209f17db80d4f1563d002baf3ccc076665677c59da57a4ec02234ae46dd4d272d18356a0734905c04bac487c4acf269e504302800a81ec9e6051002f8fc83be161a200a1189b009b6767cf4fe7619ee6e9cea3ed68ee072314bf9a542b956f7ce6f35ffcf73ef7544e8aa4807582e475f7dffdc161aff7b6e9745ec394590858a268e6c6b1931c6582c5300e3afaefcd1f3fa4302081f2612ee60d1b3c28e504565966c171320549cb992b890d15a5fca5824f158143b51cb8b600a9d3acbb9556d5b5ea65d7a896dd4aa3e6d657db6e73b5e3563b4dd7d4feb2ca83b0003209301aa8080c4a4aac63421a13123819cb12907a3645d2b5009a567c3d72aeaa7baa958a9658af0a282b25a57241f5c524f54c0dc2892f8a911fe60273131e462c491c1a6931f30044e279e2ffc3f7059bc2bc54358c6121664e0afd79a6327b07e572f1cb5ffada373f1d1f4ee58448f2be523901f2d31ff8917f341d8f3f3a9fced7885f82550d8713378c1defc60c6034b0249d8f727aa7766212896548e902011d0a0e23a91431e994b4d4a644e7e4caa6d09689741d6566c0be6ab5ea2a95aa2b16f17119221a73aad5aa4e8c4300c5480e73eb43786b67cfa2db991cd562c3a63331415a0495c46ac6214e6e99aa33d89dd601035d9bc465093b0dc43c001754bf78fc76819cf9ba04acba5a79c12e677a06919b08bce9d263cbe9dc4d05c1e46d5d84b4b48edb3adf97a19579a8bbd5ba6ed406ff2b945c203004b078760658c6c03c2b4b7c66e572f9c699b367ffe9bffcaddff9873cb1544e8ea4807582e4c7defdd67f5458ba8f4ae3d650c2b14cc0e188b004c629179b42d14cfde60223effc66ac761b575de60cca56c4293e99ba8ad851b35a32a6d46e68bd5e724581dd62393545f72c442a8b620b206069f57ac3c0a928a5ce0a4d004798122d8ec46bd15a07301216b17fd0b3f82a1b9bca3a562b691bf0a261607f7f681dae092005b8f8d400aa24e27d29e0c19c2c974a5666bd5ab1996f3021f928174bfa241213b6707d3d83ee602cd052fe6256135d6bf31ace731632419fc4a4e334983d8dcbc9e95efd880f3168e1bbd3f381f1613e63060390801575341f9cf6e7f3b91b9d95d57ffac93f782405ac132629609d2079bf002b335f7c74319baf610202582143a848f94c685503486885d326e65820dda37bc9621699f25504002d9db3d26e9929b7d2aa9989d7966927cb4b0a1eb999f32613ca29b83201fc6057b02ceb1cacbc6959cc09b06027809a7d2e5ac24818e5012098099c224c3401c824ae3351f2b7aeedd8ecd08451109e81000c16cc2a205345cc64ac89b9359b989a559b74c2cc3ee53f17d82cc4b2e8943d1885ae3b1cb91ea0358edc40658c615c53c6051360510763498272251a2100b025e02c80a30b114ccdee3966573c4b181e8d0a0015f704e0fb96c5ecadf5cdf55ffdb10fbdff3fff3b7fe7ef6f5be55339119202d609920fbce7edff68114e3f3a8da2b57148d067646085b279c998d31847f554cc8578a712e00280c9dcc2a7d4145bb9b35d756736d7dde6c69a6b35abae21f6d2a857ec3a9cf6d25a03216b2d539efc8fb9695d77940032fc3dc63804589c0347a2fdd002357501e5e34f6283fdd4113002b488d7dabd7ecbc08a58af24c60b7424f29d216016f3c89cf515b1aa46a36e0c0bdf1cb961dacdc5e492fc313707a3b1006b6413c576fb033700bc42672c0e1311d09c2fb37a5e4b0bb40d05625300120686b90a80114a212076f8be00a6ac400aa62560361f17f7ad2426d93f73eeec671f7adbdbfecfffdb7ff89ffd5bab7b2a274262af652a27412e9e5d7bff72be78f37cb1a89aff87843923c533ccf2f822c1f49109034b10e86470aa6b7fb35e739b6b2beed25ac59d3fbbe1ce6eaebaa6981533d8546b159bc93967ad6f320f012701844da365f3fa61f67930b4c04d6356de810d98e5644e015e0019fb88c3827d117a50503ee41d280fc6722f962aae2a60201c82f1e36b02a376aba9d4700d012adbb56ad140b42166c5b22af3b55ca2bb10ad8dbe5f24f163d4cbea2aa0c6394f2341d91211ff3a2ec0b610088047655a98033e3231265550eb62915ac7b7e579298fcf3f53d8aa8536c46085c0b2546ebe5c2929efe2337ff2e5af7cc90ea472222405ac13249b2bcdf76733d9374b99aa36a48b74ce932b94506bf1022523e8d25abab48f41561a95c05dd85875775ed870e7d66a6e75a52553ab6e8e6c400370b27e80527a6bb5d3b53686bb808164e6904a42b1fd04a73011580849c7002a00c0d6012c4c4a42047cb229bb585a7e2a0fe0d33aa666b952f68e7b816655eb9604501eb82a6259cc3d987437a271c0d78dd82e9cfecaca0039505d00ad9a00ac0ac80a1ccb455a3c69a1f48d0cd6ff92e7031001b07a82e6e4e7c1c5eb36ee9696dcb33d5dae8941cb07c61684d1b9999ec137befad8139fb1935239119202d60992f39babefcf65f36f9ecf9755eb740c7a4891bc881168d5188492b5a40962d8ac8a999c5b6bb9bbceadbb8b673a6e6dbde5bbe748f92cb6cacc4880468a2920e2528028011aa2ceb58312540c2c055685027b76a5ff745cd76762801210601afae3da8689b11d270352ae57b939010c4c2910b014c49e0c3c555f8bb1823de9983514e85c420eb2986d0096f2c029cf070af890580756012806dfcb97002a1a1a3067d947a844c605ba3f7c7bd4ddc7657983561be698b7512378763c3cf2b7fa7bd0323358db4a63d5fbd16f3ef9ed34b4e10409df402a2744eebff7cef7bb45e6cdb3f9bc6a8e6200cb44ea2565f2408042fb7542172ac5bc5b6dd60454ab9636565baed1a8185330b0120878b0122019c6017209a30084486ca3b4ca5b0933d3a610b3f230010bd26acfb03003cd19cf3a80759862b0d292a45525ed533eb031cfe63c73a3ee36fd3cf7106f5b076eca232f808f7b8c1b17cc24f6d45289e874eaabd5ecdcb32fe5011062de5ab0aaaec54c14ccd97516b6a0f368ba209a9d251534e7bb9e2de5fab20da8ec790441306a351a5ffcdae34fa6807582843796ca09916ab92c5c38fa0d81007860f14a4d8a4d16634d55b19476a3ead657da4a1dd769b55cbd5633b662e0c075ca04a5473159faa15a50f8782f2020619bfc8d616889429b021b4879b311a04a5a0e31fb0e973a07f33063490008e8e4fcb93636173eb352592cab2c9645bf466f9e721f449933d38da5789fed57fd8d0d2a015ebe3b8d55d4ea6bf7332718d6b9b21816dd86dab5b245e4b79bb48a12f82ab353fb311fcd9f66cf2506c3f8b924f79f00167e431a09582fa9dea99c2c4901eb8449c2260ca4041289221db1226287645ae1cb01b0ea150b5de8c40e6d1cd1064c9650469f3c502989b52492944502072883fc3ddb8281003c00984049200240911240d3c97ea9644314937c29760c1003d0e8ab073091878515902780cafd9104248749db1c3326895949026462a049808bfb20a2df7c5b02359cef04c9d6ca81abd3efb156d45249db98cc30514c46eb3a64f7c8f3f4cfc19eb5f6b32f012c9e09d3e9a772b22405ac1324d6d919df95940525f24e6b188c675db476e9a0b67d57189410677bd3588437010dd8742e6395e341a7cf1fc9bce94912a4508616df21c6bc941819426861c97c4138d8631625c4b1e3f8bc165a925807b06c4208aea7285f13cb0ff30b10b47c2de9580c400993f2ecccefb763c97e2503b043d6c575f8ae888c1720ea986f48f0cfa5a4e742b79e6ae023fdab16ed1f771b521e005602cec90f02f7cd33b19659bd033ff81fd3dea772922405ac132436798340296152be25cebf229cc5c99032e8331d86e972534339a598b4a0315c8ab125fe70da8049601cc065e0c5d2b23331ccd075be0c6d48b8de200d053e04179f3c834a8ef9649990c82306381260455196002fd5c7ce3700c3bfa47cc84dfb3cdbf1f91c96417d749e8118a06209b61703a79674b521dc8273ec5a5de72ff3cc4c18e5ca3c27fa4bc2b0685184c5c520c51206c80f430258202d2db4f42e188c46e498ca09127d3da99c14c141ee430a7cc2f98c00620095398f615942001ccb34f1a38c22102e27b042d92ce9b875478993e182fe5052f23c5cb7e49597644aafeb0113d6bdf6272042b71ee74302c85f4b6dc6c99f97008f818f8148ccc274dc9f07007910226f0f5a3eb19d38c6bf33df9702972db5bdcce47d72094012e94e1d0909a1557121205f9af95c0a0a3e74424b1f3ae1010b7f1fcb845df9ba88ed4e26996812961f7df4d14abc2b95132029609d10f9e55ffee57a50284a7f60103150a178669e7866658065478e8d574590a54ea7bb4ea2e64b66b1d1b99ccfaec4fcb15001143e0615032a33b700ac189c2c7f2d6144da386467717e96a8cbec2899d9199f67a8a6a412fc5f5c1679daba019607c7e302fcf177b4a6bf1814012c6b6d8ceb6af9297920242fc051a063ebbe2cab815673f68c8ec21fcc2c14683128a16758f8d978262a991bb6f2047af379a00777c7eecd9b3f603b533911e2352395db2ee170e7f552c8b3622e7963390206bab8108f355332b0d27ed4346eb0d77a2252348e2de796442ab48c0f99fefa3379d9390111c7fcf85447e24d3c2d7512477c1d004a0126c3b4cc2369b1d22cb27e8b8ba94f4b1d5b6a7bc9fae1f654e7cd5c4640862f8d604efbd0b46e204468820acbc68599a90ac8ea9ae542d7e9fe38d78ff0e0c1cf864a36d0620b86a77a71bfcac27c5acadee04b6525c32bdb90d2718b23f159305100cbb718ea18f5125003e406865af741b9ca2f9ba928ffd7dddabef510554fe564887d47a9dc7ed9b9befd56b1a91f98cda615c02961557e7483985d498951e4844d1963e14f4b7f0ca6c3f8ea1ea71040487bedb831202d8d21295f4b30268ef10760292f7f31d7f8e38c2f4f07ebe5611220a91cd2d1be972655dac6e3e2034bc89f072b9faf81267f56ed98b5295196e54dd9563f0fdec9bdb3dfee88a52ef601ae5498637cd01edc58e283c3494f372206324ce2b3929642bb204e3cc3c37cb42e069b57bd3606ddee79ed4ce584480a582744aebcf8e2a5f178bc29702a1a88c4c9145392283be0827805f326922d011a490208a6e087db2f4dc7f33f1ce71c3dd5f987f99a421fcf334e56279fb717d68f1d7f857424c7d7bd709873a88b07660fce2404c0620899194c534098ecc7179798739e1d612ada215faed5c947b8f36c8c9de91cd81efbfc33f2e524e36921c7f3d1fde7c470d3d886132429609d10d9dede2a47b319bfeaa63c2f55f4970a878c5d295954b8d9459e6525ca8f5226c92ba60703636089461e2a662c499e316079c681f87c2d9f78f992fc5fb2aeba2bd93db027ae933f7e4ce2acadbe31701c4f88074d7f3c619b9c9fd4317198fb44ddb92aae07e5938f004f58658045443cb78439ecfd6e3e5fe2ae582247f72ea35be731cc4f2a274752c03a2142084329288a31f9162be4a5e0e1139ace71feb4a26d0f084942b9515cc026019c04b058724ee26cb63c01bb63429949b9b61eef3f2eecb70349a22e66e3f9faf8f4ea92947198bb4ef7f7a37ff1a5944f3dad1e769e3f90d4cdfbb37c3aac6b5c17ff2c0e5df2c6b07caba0aed539de470678339e97072c181c425e497e00e7241cdbfe544e86a4807542647d7dc34634c06c49c007314594967985f44a69c731956286e04d29cf4ca4a75238dfecefbbcc901fa69537aff44ffb3d2b395274d3628385a44c7f4c9f07c774c4fe6073da6f2966761672c0791e1a8ea523f1651cbb364e2f299b7503d957382fd91f9f4fb2f0860c29c987327d5d4d749fec119ec90cd4bac094a5adeb20a005a8d1a8108945250c2bc99fc4730b2713db9fcac990977e59a9dc36b970e1824c9ce0087812d0221d13bfdf3326940c66c0b4f02cd9e698f7ed247dfc7ccc13d7596cd6cbf23b92636000481c53dc641f09404d00d19240c3275d73fc4fd758aec7f338049763fb0ec188bc3d90527f962f3ff725e9b00c9ffc6d1ddb56226fce51f6ca3f3e22e04ace4298262d79766497dc3b4b508f01025339399202d609918dd5555322c2183c53f2a0653e236891c4831509b6e4d995299bcc1adf954440a6831e4c30818e945e57f9bc94b88e948023c928896a909cff92142b3e0966f31f0493574a87e011b3a65738ee63ad8ed85f72bf1e5cfc79facfb6a8efd1f350dd49ec3db69e9cce153c01aef1509664a36732f7cf8367c065497deca876105a92cac99114b04e88f4ba5d7304db28022859bca4a50bd674e893d23a714e046cd2fc0f7fb2d136c550acff20fb950fc962989489018012340368b2840945d2b53a6821004b1d5fb21d2bad07bd0444001aed4f14ffd8392f0721844195995599b0025126a500479df6f9f3287ba10591e90621e441a4bf7590f6e36d5987ed38716fe42ca8b4963e1fdba53d008d00c76c5d4b66fbda35ac1ef679d4218a85c5d9903664469eda49593675184329ebf969b7aea52b94f24e55e44449fa364e885c7bf1aa9b45616c167970308092bc1cb04c81a54ac41631c57a494a5ec40c44f904628751e852e40454ccc92ee0b1cec3c6c0040e988df17e032f8304cfc628d3a044bb48fcc7fea445efd5e488f5604a49f975ed02405479d637d14eb27f31706a9d7a53af3cc04a3f41ea73044cbe56fe6305a40ef7ab9cc3687b032a959b0035a063f7127bace2323d08ab1c5d6f6c4cc712b319b002a858b7708a29354c55e42449fa364e8830bf1ffe120f14e8ab071aef33d26b42b14de5a4ac523800886e3c1e888e580ee09398790978201cf3be2d0195804357195bc90a51b22a328392c709a59f3151a9cd3883e9a9fc2cc15a749c14e7fddd92afc7d1fae1325e0724010bf3b599bf8dfbf41cce3be9d907c8c20e3143011fc325df6730366d8f4cba385f4e92587e92a3bac4c725c020f7c13ec49e8fca49cc519eb752a4eda19d90ca899014b04e88a074de3cf109a531e54994286127b13626e7a1585e09c525503a01923fe728715ac2d08ca5097c54a04c4b2599418b294bbfcdb1049812ff5982015666acc93aea1320a1e522365d939400c4ab26f201948e8db595302bbb29dd0bdb36769625404b80a5e3400c752390344938cfad0ef6479db86fff8c8e976bfb753dcfca9edf7189cfe7989ef744cfeaf946b3fe6c7c3495132029609d10c167e57fddfd2f7c0258a444f1f833f0004894505a800ec7308e77c4cee7adc63151c74184c47e4c453a55db7500160c4549199a99e54bc2f842a93d58fab1d6613c0cc522e048f28c41cbca32a048f651be9764fdf83e2a0920f901fce281fd94b7559e633c03635d1eb000aee3c7adb418a43c5051aef2d7fd2db9774b89d9e76b97144fde47be39ff7c392f3997ed7c2e3f9ccfa65fafb75a5fb09da99c084901eb84084c266159df0154713ace0a125043503418064b7f94ff1370130e99e9e3159684c40bf331a1cccad892018581e6514ac67a3747789cfc85af9e927a22daf2cb63fb001d0324312b5816c0646044797162fbc8e716275dc33976aee5ace3877f2f5d3f0e4248f20cedf90a20fd50cc00b007ac8485f9f3728be974bad5ed769f8b2f4fe504480a58274460580482264a751c9c8eefc3a78592314e3a33e354ca1557087cab1aca66fde264d2417a7cc769d88ee5e2136082922ab9bc943a276555fe38bf17fa1acc098ec2c780e091cd3bad95bda597e4f72a29a9af374393759f3c289262f664601583908194dff61db139ff08accc4c240f1db7892b9263dab67580559f35acf0d05726b1382f819f9f7351896b95d7519dfc3df3acedb9c79af1b18f7d0cfa98ca099114b04e889482d2484a34b70eba31bb4212853b042d1d6386e6aac0aad168b87abd6ea045276003ac3808327144935e9e07ad7106565a07a06414ba99ccaaa9585ab4d0f542bbc4b96eecccfc5a38e18f9cdc89627fb764f58d41c0ca4df629195824e0a3a4838740e91916669f07538ee922bf1f4062a96b8d2991002a8eebbce329b9f7a45cdf027b9492f38e8ef9ba21c71df2a99c1c4901eb84487b7ded996cb1705dbff4118a837f06b2c25c7ea83281a1d22d31838cab8851b5ea35d7acd56c6a2b4c1b5806b83417bb9a015c24010bad7ce89d6720799de39514458681302e5562e22d381770d27e0b5f8813e6a68d8b85837bc6b8f3533f1e96c583d1b20980c1be749e928d4f9529aafe317342a07cb033d8df4c15a54c76c7f5a0f2dc279db3e7ca7bc6927a024eb041998d8446c8865462dab1825b003adcbb005c886d2953085c46db1cc3d464dcd1e99c9148a90bce7d6691664ab0c09504da59c6df52fd3d73c54454deaa1ef54895e3e449fa4e4e889cbde3fc9f4cb3b927a4ba23cc28fdbe6b2fdd6c309568119b6ac958ee59572d165cbb5671b572518ac66e004280a525a6db4ce0e0014b89d82281511625d7328a666e328adc783071937168a10be217bad227d60111dfea064381a9015602915968691e298dc76e3619bb703c72d370a2e353379d452e12d8605e0935746ddeca263f7390c3cea60240253fbebc0011d61683e09c4ec85164f94524f254f933eaa334d5cda9baca5380ae9ace54cc52e003402d0556a4ac8088e418c9215fd42d0bb04423674c59af67002001f2cd4ad935ca810bb2ca49f70913f420ea4deb85986aaa1c274fd2777242245f6e7e5be6c84d69ce54c861260b8a33a3ab0eecc34c173fdc2f33c2d8acc9388dcd2f939832524ac0216643808460c1f2876d8d27a11b0ec6eea0db7707bd81ebf6476e309ab8a1f64fa2b99b4ce72e149870de584014021a0088002a529a86631709a4a268e24738500258269cabfd539dbb00586153aa87672a8093ea62a6aad898eaa193c4d06069daaf348b94cf78e2c291f298c0dc546f9d6711fd369282c01246c7f50230f287d1198293b49198969899304e6694e619f25c389733c151009f5975aa95e2e1334ccc434cdd48e5d9acdb2a83390c53395912f3f5546eb77cf2939f9cbde3ad6ff973e361ffcd3247aa28188cc4004b09a5c259cc7455e73b0db7b1d671cd6ac9057a834cdd7ee87b41350510e69fc19c126b20da3b14b31a08107a83a11b84333712b88cb51c87533712400d464a020d4b7d9da3f308661d4f04484a065e210c2b52f68444c0bc16c6a8e8d20238515f6a51c4248341c1d0c4858ca1c5e0b354620254c22730bbd89e29dfa9eae04189082dfeb819e894f2b004d0f92589b269a448423b0019b681677b06baef48200ccb9cea38e7b3dbe2daf4ac30bb87baf79e9e4904cb332648a194bd7441be30aa55ab5f7cf2852be9cccf274852c03a41f2be3ff723efef1fecbe793a0eab3682284a29454489f03f11a15e8d016baddd9449c89c7c522e9884141073306158de56c47fb31408856e4f8c8ad41d8c5c57acaa2ba6d5ed0fdcee41cfedec77ddce5e4feb5ddbdedddd73fbfb076ebfdb1313ebbb6eb7ebfafdbe675d0296308cb4f483de119d0fd30260ac5c818cb1430251c5860e4d4a86708181099418b71d18c5ff1519200ab0948f818add03b70ed00948ccd91ffbe3284f654d940fd3708db53e16d8c11047bac731f51230479c6be095b3eb012c6b2d351c83897947fb48753cd0f300b0315d5571fda3e5d198eca85ca97cf1c9e72fa780758284ef2c951322ffe93ff8dfffc36f7df90bffe39dad9b676048985d9862c96b028c56ab817bf0d2babbebe2399b96bd28c02a89d1a0882181a028a8141ae503b0460282de60a224730b9221d6653e2eb18a488081924f710ca90c8b2a4799555c626a5ad28e40e651ad5276621dae5aaec82cadb97abdaae3b03be7cae5c0149d31d6cb3a2fb72cb86c410c4fec0f9635853de95e88acc76744643bcc6c341edb04b2dc1b0d070860652e78d5c37c5f80978ec3a0305143811469628c2f9ea8c3ee1d33987e97de442e95aa06b0cc2fc8123f988552e85e609edb83a97be6c51beee6f69e9b2ec5ba0231569ea5ce0b72d9ed56bbf54f3ef9c867fea1552a95132129609d20f967ffd53ffe85cfffd1bffd5b575f78fef552bc3c8c0286459023e615e6d246a3e41ebc63c5dd71ee8c6bd5cbae20b02895a46452404c3ccc1bfc52a1d8c3446ce3603872fbbd91eb0d051652d6a02430112ed05f702c00190cc7c6566067cac49616afa4328da4093ab2020d618f0156d35a27eb62782b6ea5ddb2b9fef2f98cab948b3a07337429f02aebbabc2b140b0281420c580217b1294cc0ac0aa105907201ac894c338ad7c566c201606124705a78d09e0244ba7f00079005aca6ba761e4d0450f8f7a83a232ec8341430526b1a2b6af5869e1f2c1033562625cc090685735e80369866dc3357afbb17af6f393d3a972be81e545f650a406fb7db4d01d61fa78075822405ac13247ff0a94ffee4effee6afffcda71e7ffc47a494351410e6c1af3e4bd2b976c5bde962db5dd85c77f54a49ec67e98ab48a49618732d32652f6edae77acef1ef4ddbe4c9ede18f34906921844a95c7395a267513013fc5a0960c162a6b13fc7c6a6121230fac3721e615cb96aa928b0aaba46ade2365b2b6e636dd5555587a250b35e2b9b339b79122b02acf9222b700c5c41d7885289f54dccb1be107864054a7d2d6177b0246379da17e1f457fd31f3fac3b94c57862896c9286025cc81982c62c4cc5f25e0ca099c303f4b2aa32c20a6fe63b129801e400af45cfc074e579bacf9d638b7a02533e784cbbc7b4e8075f9ea4d8137e1186289023aeebb520a76ce5f38f77fff2bbff8b7fff31ffff11fdfb36c52b9ed92fab06ea33cf289ffa2f5377ee26d17fe673ff9be3b3efc8e379cdbd83cfb03ddfee80d3b3b3be747c34180bf46c82113a628955bba4266e1561b658156cd35648e05059802e147022cb1a74866d1701cbaaddec46dedeebb1bdbbb6eb73b702331186ff5c944e38279e8598976e15fb21824011e1f03e69ff527c46ccbf825be26000296874bda62b50440e654c73fa52464530d7d402926170d0578e0013e9d684c117fd54c00445844b73f744381cb50800923ec0e8602d881dbddefa9ce7db7d51db91bbb7db7aded9daef6f506c616bb437f2e8cb1a77b1b4e6095843c88b109f086341a28bf9140107f5d5fe70d01449d434c9745b9077a6e022c585d7f30501a0ae4b4c1bda9ae4c0bd66cd6e717eebc73bfb971f6f26ffdc66fbcc0d1546ebfa480751be5671f7eebdbc7077b7fa9522abd6f315bbe2b3f9dbf255fa9fec0c141b7dddddfc94ea58073fdeacf0546b48c9532a15baf07eecc6a5b4c49a61d4192743561f28a7c41a6d2d4ed4bd9afef0dddde41d7f5a48c4c461a48412b621b259bd65ec0e722d7a816b59d7145b19f868e55991959a0d3142b6a96724ec5b89aceafe49dce5192b957949203928cbbb59c8b2d09a0b2ba1ed713e11374421695519d04803a6ae085fd29e432d38c90088154148e648a12622170198c5daf2f4628b375779f460081527f22708adcce70680c30827d89796921b09459280022cf3002a8c414b56f2a338e2059fc6238d9f1d14d42181ae11ada2fc647d71e4cbea2ee21c0b79611c08d861eb00074d441c05da996dde6d98ddcb98be75cb654dcfe4fff8f7feff18f7ffc57d2c1dd4f80a480759be40bbff92b2bcf7cf32b7f39eaf77eae536f3c54c805f787c3d11db36cb6bd7fb09f1f1cec0a02f48b9f2d48d968510b5d393b736bf5b2db581160954a8e31e071a25b87609d3b9272efed8b59ed745d381e0be496983602279ce400969f01b956caba96cc3ad673621475994935a59294b8ae7c6b32ed2a02b30067bb4087508a5ab9642621caae43d63a69334d534b464630be227622b6860f8c199671a2e35ce73333861512683ab4655fa03410600116340824a0d5eb8b7589259a0f4ec004536302545a150baa0ba15199e5cc55f19dd9b64f948b33df62bd045eaa98d63173b5645340647d308b02ac20677966b20b333f293394c90c4ba58fe6ca4ad35d387f365bafd70bc3fe28ac154a37fefa877efad6ffe3b77e2b1de0fd368b5e7f2ab743a2d9f86da35ef79dc3bdfd0be3836ea79ccdb672f3797dd6dfcf07d381eb94736eb55e14f391224a015142ebe42ba5438cbda0a4523c5ac6684d245e8a16c29cd858554ca223b371a55173cd0a2054708d72d1b56b5531a7c005ba262716921760c19ce8e6b3dae9b856a3e99af5866bd41a02a8b2014f49c72b5ad64b055d9bb354d7b1a24ccc85402512e8446273330126db4bb1218014b04a3a2cabc21e80850bf8c94666bac1a0300b4716ef6581a7022882460baa5723a73aabdc1691fd2abb25e6d7046c45fb561b813bbf822fad64ac73a516e81eb30258806d69e0eb59a1f66909d02963cbdb86d311b811dd1ea88ecc6f0843c4c46566684099e9f7bbdb37ebb79e7bfacd571e7be2433bbbb7def8b9cf7dae6c0f3f95db2629c3ba4df2577ff27d7f7d74f3da8f89167572b359b65ea919630a23994bbd1d979d87a6ec9833a3898f1e6f4861d75b35b7d2acb90aceeea24c417c5252365ad38632a1703abb254a2a9623d0aa8a31c04600259808cc221af4c446a4d485a280a9ee3a9d15a555576fb4646a8a7959ffc4c01cdaf435b469ea6702215a0b0506650156a558f6ec464c0608c5514d006b4da6aaa52679555db15235e0a235cfbaef840053e8b6f79248fbb139dd2d781366445eaa7b0ec7bfa811ada074452a0a48aa25989eccd7b2c0b8591570c11ac5006184627f845e0042845a70ef3c195a0b498cce8a39cbb9651de33873154ea385ea402c17fd170576c642c5ca64bef67777b2e3835eb5b4742bb9689eb974e6ccd6ffed577ff586553295db2229c3ba4db2188fef6c542a2b8d52901b0b40ba077b02abb12960a75a746b02a516a02450c88a19e022b6c940a590b02a4c1cc00ae5467c1c934c3829224c0a25af4af39a5a6f56cbda16d399476edc3b3033309002371b0db7b6b6e12af5a64ccfbc0b8517a3d9c275c791dba7cb4e2893af507015b1af924c42e6f6730b0197ea8379561610d1111ba0ca09509dd891e5ad7a017a65815545400c08626a158b25f3bbe1fc8f548e057f4e7c3c95c56961c339311fb898ccbec534b4a87873fa5bc0a9ef5b691dbd7566264390aa4053cfc05a4b61817a6675016659f7c7fd63dec22e3187cd0c543d31618d9d8af1f13c0133ff1c7d23027d2487fb3b6ebcbfeb4a8ba8b818f6ef1eec6efdf8def68df7f0ac53b97d9202d66d92ec6c569652651b029392cc9dc96cec7607fb6e2a165291b955672406b106f3cd483d13c61458df371f47046891fc6b94e2e6036bde2fe497c6421a166a80c35b2c66d477b370a433676e63f38cab894d0152fbc3b1fbf60b57dc97bef198fbda934fbba7afdd72cf5cdf72df7ae605f7cd679e7357b6765c24700aaa159713532338cb1cecaa27ad8c283b26954e91b27b730b36083ba431201050b104a8a81f4e78da1a7d8842c687334433311db12fb1443a3f3319070efcbc8026570a1c515a5d31b17d5a082773b7d51dbb17aeedb86b3bfbee0076a4ebfbba0f7c5f2019cc0fd3321088899409ac30fdf0830990942fad96d4ddc08a7a62b6aa3ed6ea293699d739459d50d135f5403f0ab349211cf42ede7ce1f27dba2c95db282960dd260180304d1a62528d95a65bcadc1b67676e3415b310032904029e42c98392fe50ac1ae69d1813230ec032bc9289178879b0b4be8662178114b42a96561360e13e0ac3a19b8c075a5fcaf46b186bda1f8cddadfd9ebbb177e09ebfb1e59ebc72cd5dde3970fd4556f508dc8eccd017f7baee6677e0066243e23a8eb6b9a5c0a920164320175869f15a302c3118eb1e24d643cc1407139f5b327e95f765d185885052e0c3fbb49248f6c4816f49e65da12ef3b45e777399ae0365395ce4dc245b71dd28e75edc1db92b3b7dd793b53c9151da1dcfdc7e77e846628753011891ed9480ef0ab35244ccf2576106a800565e801d1860a9fed4cf8efb6e4330d4867e30b8eb70d8d50fcc34bb77e346f3914f7c42379fcaed9214b06e93e4b30b57c354abcb64127bc90abc2a8daa58858fa922c83317b0ee4711409930bd4a021b8009f30f944a866d811d601e1144da68d55da922608359e0ac6e37ddeafa8a58554da09171cfbf78cd5db971d38d6773576fafb8e6ea9a80a8e8b67b7d31aa5b622e3bc6bce638bd756cf3e245d75edf7019d5114604c80452e880e159c4808a02518092fb60fc2ec1a7311d0035315d0f93b631ede87fe8c7d6c20c046c6190628832252b323feb32571b6babaeb5beea8a0d8196ea122e736e9a29bac93270bd09e6abf22fd55d506bbbb94076309eba0126a6d85a18cef4cc8825f38045ab664e60ca63830dda1038127e0c789e30579822a9188781f0e380693a19f755b76c6e391daf2c83ccebedc2546e8ba480759b24138dcc795d2c0aacb265ad975d470caa55c3ef53166649a19418772e5acafcd2b20a408809247310d2ea0523589a5f49a68c94b22c1ba82dc6b6b2d6722d2d5b9da65bdb5873eb1bebae2025dcdbdf737bddae804be77556dcb9f3e7dcf973672c2e6bd8dd75b75e7cde1ddcbae616e39eab15736e7363c5dd79e9a2bbebd21dee2cfe2e011bc14fa87bad5a73abab2b6e7565c5adac74c4de5aae22d05265747f539705680548f88e2cf440d7e0df622cadf96464a34ae40522658104a1170038cef346b5ead6573beed21de7dda53b2fbacdf535bbbedf3d70dd9d6d319e81f9f42ac592eb3475afedb62b576a16bed093d9d827985467cc64728250741d2aebf9550ab4880ab4f8ea797c027c4cdaaa9e370e79c00dc06ce84784f0075dea023d78c23882ec4247c27ba2adaba91feb364a0a58b74be69194105304bf8e58455071156d138e40bf3c940ad0ca053255a46c8196be1b0c2d5e32b50458982e805616e77356ca2744280659297ec9b55b0dd76ad6cd11cd79d2395340e8d14ab3e5ceafafbbf556d3b555d6a618cca5f58ebb73b5e52e76eaee42bbeeee5869b94b1b1db7de1480d242a77a6db4052267ceb90b9b675d198011b8b605526b029455e5d76c7bc0c241ef88d2178362481922e7a9037152ba15b724f442f5ae8afdb5c52adb2a035f5e258ef702ac2e9cdd70e705b4e7d656dc19816eb312b8c2424669387065473c5a51752fb8155db72906496c1acf8d0053fa2632b335a635ec89f1c39a02e496586755204c043f1da5f1c5c148bddf4fcf59f5041831d5e9c88d3fab28f31be697cfce95d36c7dd2edddcbeb4be5f6083f7aa9dc06f9850fbdf7e74af9dc3dd95c3e08675264d92dc4003121033e20c69962a4851d82290723d790229f5f1363aaf9c9270ecd42fd939e496892c7a42998c215047e4b7c4f13b199e95c4a2a6656c0cca9288f96ebd41b16a7d5505e9c5f9369d711709d595d756b02b44d9963972e8ae19c3b67b15b0050663a7375d563a5237068375c85982ee2bc047c009830c2bab594c4586464c9542cb34348c9d854a18bc6234b07bb3b6e1886ae28364578060047347e5e885b17bb397b76d3adaa7c3a5613f00a882c673e5814064a5c55a5987797ceaeba739b6b02e086855c4c27431bbe862876aeab0abcab5ad6056415f1231bf010764aec15497523e462226a76d01f582c18ecb52960237c03e3b612685df5afebfef2b9c2ac58adbff06b9ffec0bffad8c73e6d4f3d95efada480759be46f7ee4fd3f57cae5eec9653d60a1e8982eb49e015643993dc429ed0ab07024370402e7560558624ff88b921107002a0b699012e7012cd800fe23fdd9d46132c968692c05323bc5246a95aa4d60511350d8080b2a371050608ab5053eab62492b32b3d6b45cd512a0b45875b18d8210a924d02be37b131b635911c0e087cb0bf4f0a701a039d523bf1420c8c4b5216b64c612b60058cd640ef6f6f75d087b91898be955523d00aab680af65a9a17b2c1913227095a1a01baaef19b1adf39b1b62532db1bc5501785b402bd30db3981008cc62955f121b25de8aa05bc60fab08a888e38235f94ed0022f3d275a5b690808170b99922337194f0c0c1bcab3a26551cfadacf370ccf37cb2b96051a854af2fa3b77dedbffa97ffaf6d7b91a97c4f2535096f930495ba145a0c44c0e35bd06057586cde213deaf7ddf0a0eb9693c895a5308434c0a0f2523e00c062b1787b38b6a558b4720158c461595c91f679ff4c45a96a0a0a15237ca0d6aebace66db3557643256052879815a7ee182a200a9248595f9d5124894616f23818cea9215bbc2bca44590e15e18e685a163e89b470b1f63c0c3eefc7852902a5a370d4ebdf33d6683ec37330dd62350628909bbbada76e7ce6dbaf5f515312b312199b9f473ccce421708883aaad3b99586ccd4b6bbf7fcba7be08eb3aec130f593818b7a073a67ea561b15b74ec770dd533137b7ee474d4c57b1ac8a40ac243413e952de4b8b1bc329cfa4abbeb182baeb59504d1d4bc2480038005da7e899ba827e04ee0dc3d99fb79798caf75c52c0ba4d1294ab52f8a2b44024172d41c159a24466de4c5c3818b88c4ca1b24002b060c61c021ccd7f0508f0c7520980a2791ed068c84422b565bae16c5f5b5f7775997b001ac0325d4ca5b54e6015b85a53669d52b52ec5ae976d14889ac0816e38f87ce818cd885644a80f063db7d7db57eadac89fc45ac1f4e827381710628696646211a50e801a685137ad1fc68ec5f524f6090737604adc19be2240b56c01a6456b499c0cfb2e545a846321059dbf65f60a98b2d391cb84238b97621fb156c45c31044e3ea37d625635dd5b53f7d4d4fd349b325bc5e01ada0620798e04885a4c162d877aee38dd0d90955f4626228d03e6ffd336cc5757c0d0f4b21667a751f446ff1653f95e4b0a58b74972524a3f61a85e01002405616e3c22b97104e3732184a12225c6e98b39069e0158b8db512113b11bd63c68091894169ca87c188baa4caba394d54c3781586ba5e3fa32c96ebef8a2d235d7bdb5238632706e12bafc54ac66a972a4ccd370e886fd7db7bfb3e5b66edd705b5b37dd60347079b195d66ac7ad743aae0e73531d012afc3cb985eaa754508d2cae290153032c1a0a74afdee126c0601862dd5fa9a2a5805bdb2a56770638d3b82073527f80e158e6716f7fcfd264d0975939747301961f0c50002c403bd8db75db5bb7dc50758489e257c3d42cc9ecac88c119203704c65a96b59fb00ccc68ab9f9e1580c57536d6bc1824be125a64cd8cd4bd516fd655d1ec741a36ed2652f99e4b0a58b749c4aeba3205e7b49f8144f8b092e9d3eb02994eabe53acd9635f1e337c2244181511ae9d84b84ed041c48a368e22632d922297324f386a9b216caa04c676831aeb39d75579a655cf7da2d77f5c967dc0bdf7cca3df7b5c7ddd35ffe86fbf6a35f77cf3df1a47beeb9a7dd95179e77bb3bb74c81190e7955d79eb978ce9dbbe38285121029be88f01b097c68ca9ccd5d662a869363266a7112c0544bc018468879c83e9256956899d331c103ada5805420f0623bd03db79a6d31b09a615c5f6c737767c7ed0894b66fdd72b7ae5f77b76edc70b76ede725b4a7b7b7b168f0650c12857d6565d838601011403f9e508c6e26b6721c69427825d406581af303e3d77981f8f96fb15a2eafe78de3aae44ed3dab756e2ef33895db232960dd26c9975bdf9011757db988e6b94568bea04ca52e3bade496621e2586211640b4da35f32b15a470d90c8e6d4616c0fb82ce03509e55e5b3c40d891748b98b028cbc592f0b9b428b095251ca6ab5e65a02c2f397ee7477dc73afc0e7a26bacaeba40609411e3984b9143377319318d6aa3e95a843e5cbce0cedd7397bb70ef3d6ef3c2798140c700001645cb9ccd2b68c1a44b1f4a901570a97c956c9399caf6b53901e913485c96cdbc237b94494e9773ddc7c203811f2a06568379b71078c82cc3615e29b93ae6ed8ac04b009415c393fde8a6aaeb54e72f61a4aaffda990d77c79d77b83b952e9c3fe336d756dcdaea9accc19699987ceab0ba459c44dc0484acf336607b987f9ebb5aeba1f6d278302fe604fc7a532a4f880cc63a3d512e4ae53608ef2595db20ff9bfff5ff6ebfbb7dfdad99c9fea5f96490af361a6e596ab87966e918833cb3d02f7b50741329cbc1a8676ca0535f9179587279299190cad80b91e489831dbf104ee2b2d8098ae7089cc49f2410c96b1fac85fe7c0b296280a9d86eb9ba80a02113afb9beeada67d65ce70cec64ddad2ab5d7d65c4de7146b35eb4b5824a4a044eb9df225cc21be171b8901e6a47a9018af9d81fd7295a62b543b06a28bf1c0cd863d9b816730f6d38461de12e1ee7d5d712c99b55a0abc0ade3cb66e3fda47d06b5ea65c41a96ce66ddd3568511430adaeafb9f5cd0db72af06d339b90008c30844a9150040f3e8c920a539b03564a9024ba943331198908fe7eafaffb8a5ca756760d01388c74aa1f8ae564e26a2a5f97b965bd3ea96c9efbda3fff8d4f7dd2df7d2adf4b4919d66d92b5071e782a9acf0f16d90233f8194b125699f2d24d84d969181bdd873048b14405e85f67431c1f93c40c4c126cc1a6b432c737ad86f86b94003195a193c4d6045eda572ee3686fc88c6abbce8a145f20b5beb129202064a166a33454aa75ad57ed5cc201ac1fa340d2ccbaef22b4049adf0a9f1b75a67eda9fd4134696988738d8e97e645d75648ed1f8608e79e5813fafaaf29baa1380b4b9b9e9ce9e3be72e5cb8e02ede7187bb289678fefc7977f6ec59b7118316feb58e520d60a3ee153a98fb19712c7e4df5f7b5a1427ae6aa0fcfddca149893bc19eb3b7773cf36e5bf28d672b9b851aa551ff717a7f2bd9614b06ea34c8961c8d860c29e650002fa47047c45008192d9985752245ae5507214cc2bba3240d12c252cc5ab217dfd380660595c9680866532a01e4b94100506d018f60560acd870304a06523e55649a5659c7c1ce1858e69fa2638cff33a15cb49bc2b5ce5e03abb84e76dc4e64353e576759a7675596fbf133de0058be6fa1675fdea7473da91f205eafd76d589c9640766565d57564a2b2dea88b59a9aefeb995edbeb88678ae92ee8fe7485ed4cbea24a15c6a463dd94fe2b9906c5bfbad5141ac94fe89b379269ace97dfae14cb8f5806a97ccf2505acdb28f9a03a90dda71feebc50462f43f8258d35104249fd2c2f3201a5340c3b13113e6060e581c2e38357b824c1666c7404d8549cccb92ca5a333759ea9ac4c29bd7908db22f96d94b36011ea258143492055aa8859c1ae040228ae4ac11fed1992cac7ea4c80ca27bfed4101c77b02b0c7ea4d9d05b208fb3c70c5e3b103cc5ae75e00ac04b42c19c0126c5ab4e75292c907881665265337c034a794d58f00febce49924e069cfc7ea055cbeb43e962853e71ab0618aead91501782d99213bd4c3d7db39e816fadfb20b53f99e4b0a58b7518ae5d6d3cb6c7e4b6832a3e5290335923927b5b2163814876e3830058021629af8988198a0f8c7143159674817989436740e4900066340a9a5f028b5cd249d8d97da46e1092fc82b156023449a5beb1aca2b10c0994ef5543fa2e74dd92d297b43a978a96d4bb14022134042927a1e45ea7b212bf29e099413d0420ecf574acc449ecb1113f289fb05a8607f24dcb3b0b784c12156b5645dcba3a4edf83ccaa20c0339954d630077c7ac3b33979b176b8de1c30f7f349d90e236490a58b751826ae933cb4cee19814148a75d699763cc7196b4bef1cb0e9300b00021a66827ca1c0543fd8e988157eaa36d7c550958891101815adaf854524453d038f1097893f2c824ca0a10845ed86566ae721e8a6fb3d2447e9665537025949904c826eba443a10c5f900ec4e0237021229ff2fc6ef6731565ccacd181c95259da54f830cb18c0b89e7bb07834d59be43f63ee93ba26ac8e3ae3cbd3b3544a80cac48efbfa7ba0f23e349281569caf19b7025166eac96483289b2f6c353a2bcfc5b9a4721b2405acdb28b959e631a9c48bd95c218a647218604939012b9aff7146a3d4984280d0389c982f0b05430c1c12903a9638922833d77930c3efe495d91f3b6e261d4ffedaa5927459faba1448ce6de208a6ce4a00cb328ae53bcbf7fb8ec4eff760e55952e2004faef1f5f0637fc1b0002b1b8174e601cb838f2f337192bfb4ce47e5191829257b92e3f6645ee13cf29ee9878020554c5d4ef1e7d11753fb542799cd91d8e7b3cde6ea67fcd5a9dc0e4901eb36ca9d0f3f3cc906956f6732c1ad703c994d467d312ccca2b91b315f5e6fdf45dac74c30f46d63b20606dda3591e268152496fcd5c4281d1487c5ce6c312309899a4755816e063b1524a9888c4416565129ac2eb3330968592da89fa3068bb9422d395c794790150ca6c55625c771b3410105142e18dc57053b0bdbcc03143ec93eab89cfb6b9437f5c24756c517657e334c57ea0738d072088824b152e41603362d77ca93bae29b92c14c41ba364eb033b24000f338f90961495613bb1e18038c49f80c19831e061a4562587ab60159d15a29c024f4622e339c6713144a8b52a9b15baa6c7c232e2995db202960dd66a9b6563f97cd04df9e46d37038d8e747dd9476329db87e7fcf4d045a45291693ae8f26a11bc8440a05268c876e0aac3c6c7208c31a9954982f06561eb0e854cd0810c08929abae5810956e09f3901cc84b19503620c4b4ed32ffb2020d545c3068299b99bb7c56a6aa960096019512a066eb28bb8085911be6d9b2f216b830f63b00a7bae19d03b0ea251a1468adf489fb38042b25ea0488aaea02abd8090e5304ac12c0226fbad60056760bd4d332b1644025f0cfa85ee61bb4c38095cc5c032c95ad7398e64c9575e331e044876b9d23761b8ec4666d361f000be02fcf1b9dcdfe5b7feaa746ca2995db242960dd66a904cd6fe44bc5cbd97c219ac30c5055810d4a6fe35be5b38ea19151e10980351abb10b30c8090b2c14430a36ca8649452c093983a8918139392c2c4602c3020804c3bd16103330f683030e52b90b1fe743ae667a451e994a57d4c6d0f2058fef1d2332c7f3d65d1dab684bdc1fc0031d581e3c252031cef34875d79738e3a1bd353e26c1866d2b86038a41bc3d7c451ef6f235fdd134b1570b8adac7c0e3e79a6e5ebf89267129799f8b6662a2b9cfa597bb86fa6219bca1464ea31c219c6dac804c1767b6d339db2fe364b0a58b759d6defdee7e506f3d972d577633d9823881944a9ac7e076b59a0f7cb400d222132230a14468b315334d964e56f22624894b19a82ff1bb7805d44952f64489cdec130a2cb24a2c0fff8ed6052d3a17f0f49c0c4823a0d3fc4a621d984e666a5a8ec8d1d2581f6c8884492a80c4248d71c78ee374273813f0a43a08a06320a67ba7ac50e5ccc4f4f0970188009b01ae8e532746b4b01b26097462926962758ec1c8128097ac2bd999fa0780ceb44db808be32409fb913294f15d15d67f4e3b070c3d92c5c968bdf6eafae7ede9790caed9214b04e8014ebb52fe7cad5675d3610799a4b81a6b69ff82ba2de893067a4508218895562b4ce10259322e214b7be7c983f5240cc26402af12f253ea6c36d1d9b8b25595ae264d6f138499df5a77c0466f49b9bcd641645638194188725fc3a33e54164bec0c5cc336fbef129b124fc81637e8c2f25804dc9f811c0c535da06ac6ca81c63483448669d8d3a2ad0025430c7266301f3440089935f7507900cace8ccadfa1be30394012fd5ff30c5f7c97d5beb1fec1300673f801583169037d32acf1ba0b2492a54171868be5892795b54693937cde7a7f956f38552abf5355d92ca6d9414b04e8084b9e53745a3ae65f2a57026459b841399285222fbc59712895dd0aa063c44988593b11bc376382e8583b9e0ffc1bee30fbc31c6a16407a5a87480f61d9595602d023c4228acc5d1941cc5f720309f0a102743371ef62d8593919f2b50d740bc7c50266c48c0a45a991f0cbf13fb95888b32b0d2ba7770ab6e86044a5a37e8d11256652621751670f9d82aae1390a8aee138b234194d94c602b0914073a27a44aa87ea3a8d59e4211071cfdcaf4f76af2f4b096891742bc6252dc25ea065fd18059af45b0c4a15972b10b45b99676bb5fdf2c6da953b1f7ef880f795caed9314b04e80dcf9f0cf1ce4cab549365f5a667374b245a9f5172b168a0dbb42b5c7e3891b8cfdf4eea180c722df3922b0922e9ae3d804fdd531fde7d946a2b400150c4e4b465020b14eab58a47c27c3811bf4baaedf3b70a3614f0c6b62ca8c99461ee2448e0ec5de241418e1c8b662a89df7439963dc58157e22aa0620611ee2e8cf1a2bb4bae9b839da0d5c0420b65f58a3254c2e9a4cdd440c6b3418b95eb7e70ef6f7b53cb0e9f867534c46c05520a47b4e4c5f50c83058192520652673bc7e1cb4004e9e16a122dc1f0efe22be437e1c78de1931be62352c37dacf36cf9cf9ba4e4de5364b0a582744f2e55a942f9497015d608acc2928b64173be96f485237894e8777c584381d68811494dd1a47c283e4a2fc56408641814c32c27cb9900c9926d0bb0949c14dd62be606aca6fd2efbbfedebe3bd8d9717b3b5baed7dbd7359177ba4b915170f327a90cc01160619f25959d802bfb4d045ae0073e3640c9b75c3276292325001c474c87baf920511f286a33dfc81c1cd35227c0c23c1c8b61f5ba5d81d69ea57eaf27e617b7e4e97c032f1a23c83b492ae308b4743c06abc4d90e60c15019431f9390c92e6c2a7cdd333f1ab4b8e672415869b6af14563a5f8def2c95db2829609d10c9164b373285d2aec06a6ad3d18b55d115c5fbb07ce75f86884109c752e69140c6628704063016f367892530d9c314c5379fd3e4d0ff34135322cd65dac1b058cea5f0739997ccf3d71708ec6f6db9bdad6d37e8772df60a7f121da3a903fc092682c31fd0040c010580c012c0688a2f50937949388199982acb4c49810479001444eb334e17d7608e85aa0b33d6704f2380ca5a43476e30185a59e67f0274745fa3e1d098d6ee8eea3990b9aaf322c05b8956541f70eac1cf8ffe1003961201b098dc3c2fefb7c3f14e7d741eac533634a390c26ea7aa7ba8f3f5d0e7d5467df0def77e309d74e204480a58274472a5f297e7c5da1fcb64ba196432731bf04e4ac518e3b002635ab59a4ecc0b6ce66e3810d08452c065ce8db53d02a80414b3854040cc88a6f9488065bea7294035b6b1d117d1c8c02a1a0ddd6430706331ab2ec30bdfb8e1766f6db989984ba15074d53a430c57c530f2020bcc34913229775f00b72dc0d8db868d1db8de415f26a492d80f139d8e470301910032ecab1c95a5326793a195174d042e2a3b54bdc6c3911bf607aea7f20ffa0221997d4c9f7fd01fbbfd9ed8d470e27a9ca7f3b91fc0cf8c50189158d7c15e5775b8a1720f64c68e8c8d612e8780b59ec5643ad652650b8800df488c72325db84828c57d301aeb4c79fa1832d89611473141c6c712b82df40c7382da20d76b775652b03a21c23790ca0990bff7d15fec0e67429671f78c00e6bc8cae00730c063092d93312281d0cc7ae2b2547bb787155c6abaa54c40e22b1053f201e2d68987abeef9df77f99f71dc6a3634e290a6144b4c2091cf6f6dccd1bd76df861d851b55a71cdd51557ae37acb58f7e747e1485b9319f5e6fe0b6b777ddd64d81dcceaedbdb3f700702b99eea35527ee61f52624959aa9cf9c66c16209d375002a8f6f7bb6ef7a0eb760e7a6e5f80d515b31a8c42d717680d942893618c4ba5c005360904e0adfb569d30e3266254f404c004c667c56f2f6629f715093089cc07b461813043e2a9267a8604dd32ad173d0600365a01072a1b16da2c07ae5d092c9894c6021714bbf95aed6b77dc79ffbffeafffdbfff7939492caed9514b04e88fc17bffccbe3bffb8b7f737778b0b516cde7f746f35955e6536691c964715a4bf5050c62155272a2c1f1b330d653b988b9460cb9c089f360142831de22291de799735b7f9893531d1f0fa5d4b014b1a217af5e75376edd7413815caddd749d8d35b1ab8639ce7168fb5828867e118b1393d9df3d703764363efdfc55774d2624eb5b009780a727e00995ef7818ea7a61153e2f980d4e73806d4fcc4c00d9d53d5c133bbbaebc6eed1db85d5db7df57dedd81ee71e886ca23abeb6be582dd5fc0c085dc0f2110b1e31e7062169f81f28659597c97c07936c32c0438bd39880948dd23d52532b052d2be8999a3e2528b8ce531176075545e9bb912f16565f3f36c50be9eaf76fef585bbeefaed8fff8b5febdb8b4ae5b64a0a582748fef1273e31fa9fff8ffe6a2e9c2e2ac3f178194e6745e9533187d75bcab8b7bbe36e6def58143940c44c2fe522e359e5a46090289932620d38c62dca1c764502d2a4e0f88b50eed128723b3b7b0656d70caca6ae54afb9d6daaa2b371a2e4f4be554e70bf8c29096bad00d01ab6e5f8c4aa0a3e5759982fdd1c8ccb9be98df50ec289c4c050c4b9d2fa05a1292807f4c4c4860b6b7bbef76b7f7046e3b6e5beb2fee005a5db7d515c3d2395d9974fb022bf28241115e502d33940c9da5012c6e8310091f26610c48c002e383e51168eaa3df790e026d0117c31e035851b4b0de01e14c60053bd3f319ebde20818c40d1ed0edd52db2bb592eb30eb332119f9c24080f5e5fad9bb3ff981fff8e7bf42f1a9dc7e4901eb84c9dfffdbffabfe743e797612cd6eba7c212b13a6399e4e2b02afcc41f720b323530a6f0eca8909586692502518082108389b31197da439af17eee5016b22a51e0c876e777fe02ebf78d55dbe7a4d6c6662beb16aabe9f2a5929bcabe9ac9649c0aa8c6623a2301c90166e0ee9edba615713094793a73234c30a1c352e5642cee8a9153198e262790700287a181e350eca50f7312c0ed6ab9a5fadf52ba7e3072db62555d01dd58a031168bc3f4a5650e1f1a93a9160b32050556302740d71ce462484c2d3fd5794ce44affca03010e2629ceff82f551a4850fdf9507246b2c509d6158c22e6393239cf2626011e50a6899aaac2373b8ac1f013db769a650bdb1cc977eefe29bdffca97ffe6bbf31b49793ca6d9714b04e98601afed35ffb8d9bffc9dffd3b574b95464f3ab7904ee5a2c5b2d01b0ccb3b07dd2c8a670443504427e28acc18fc45131cdbb4aa718100c402382d5e8a96c485eb0b6cf6c5469ebd72dd5dbe7ec3f586035728975da559b7b8235ad188b49f0aa8260212c227fa6256bbbd9edb8221c984045450f87d1d0340ac03732130e09ae87a806124809865749e800036d7ef87ae37108392a9b82390da1688ed0ea76e804f4900c4a4158411d082487e8471402a5d666e8e700b85c08c53de4395df57be7d01555f75982e9840c2d9b4fe83c140a6330d1439d5c903a705a002be026173b80358f3994c42406b6cbeade954343628cd2b4130d7639de52bb59b8d8d739fafaf6cfefe5ff8f9bf93c65f9d2031a69dcac994175ffc56a7f7ec953bc2307c289c0c7ef489c71f7fcf37bff9b5f3a3d130c7c4a54cf8d569d6dcd98d8e4dc13e1af41d536fb928e3daedb66b361b369c30dd608855daded9763704544f5cbd69dd7b4a322799f6ab2e73300818fa452666a5ec88a95fe0bbc2a4527e63293761067d9978001fec664766210c8e616288b9623c2f18156616a053af655c252fa69429587d00c2a180ec408cee80487d0119dd6284ba023bfc6fba4eecaea46b6b45816849c055cababa4cb466954965e90ac4e72a70133862164ec2b1ab571bf6111fc8c41df60eb45d7017cf6fb8339b6b8e390f89cf1a8fa7e6179b6a3bd2bd0d04b83d03bc03e5811fab346fd73b7b679a8d9d7a29db6fafaf3c7ee9811ffcbdd5d50b9f7ed3073eb0c5bb48e564480a58a740ae3ef1c4ca34dc7beb171ffdd25ffcdaa35f7c7f6fe7e6450156962e2a8d6ad99ddf5c71ccfc05c322be3cec47367b4c47a045971e3ce03db1a42b57aeb8172e5f71b70446987fb43032bb340617be799bae5de70799bc234814734b1c47a0c2dc7c736b4d23c2de629a043ee42ba831301a0cc7c6be708a3309c4723971d5a0ec80bf854061349639aa3cfbca67288693d53a43c6e40494340860c70642ad92ae679a788b3a2fe174cf2b1f81a9d902049a826caab3808d78ae12136ce40b6e86f9d9db576da6eeec7ac7dd79e77957d3bd4c75afa391004be54f756da4328732136168a3691f07fca250685dbb70e6cecf5fdadcf8936276f1fccaf9b337ef7be84dcfddf3a61f4ec1ea84490a58a7449e7efaf38d27bef6e43b1ffbf297fe873b579effa034b71d89a9b49844b45373a5acd889949a2e36fbfb43b7beb6aafd7e76661cf437b7f6dce34f3ded76f67a6e5a2bf9be72598189c086c4280801b321eb8b601667823a4762302019935260838e3015658ef9d6374202886477164c4ab8c5484bc68467c25662ad6c62085a1b3113051098611399ae335d971378303b10c3e8c0aee6da8fb39b59aeb3320d2153b482e29f038c65e75af028f5c05fc6e0830b2d0963289798ea7ee632b389cbce43572f16dc1b5eff805b2d0bd40c9ce66253ba1f51ba892a6d66abea13656546cf9707cdf6c6bf79d39bdefeebaf7bdd1b3ef3de0fa601a22759f8714de514c8bdf7beb3371f2cbf9889a24fcb0cdb6718195e1f0eef6924334d4ac810340501cc52083021aa5da0329f8eddd21cd06219a3892b556a32b3ca0e9312b36f3c9c8a99e1645fca7cc259cd840b9849ca1da69357529e8c785a1103ab8bd1d4c59c9858b421406989a5b5945f4365d7c47aaa42bc8acaafc814cc0b1ce8604d30eb223315084dc5de66ae965bb8864cbe6a9071d542c600a621365425385600661da0c5b8b202313e50e197189d98e31407ba5228c0d1bdc09cfa43312bd8954c4d9a4a9930c35a0cc535193d94099be9603d17d045ca67329d5b1f4c18e26221d37791eb0a843f1b74ca29589d0231a29dcae990ffe7273f3979e77d17573399ec8f2f16f3155ac58a5276eb0327c5ac0844e0ccb47a1134c9fc7d30157c4da1c0e9d6f6b6abd69863b068f15104708e9418a1017643a02a5198309c40dbc440d5c45ec8b72a70aa8995d5c5b66a5a6f372a32399b6ea5d974cd5ad5c22baa323357b46f7375456c2f678056150061eae5334bedcb2a8fc0350570ccae8ca95797d9d79259db283374b2cad48d14648816330b6d675d4920a47f92d81c04ca543f1bc050c0436303c330139fdeac5704c419f3855d387b56798b81098069d51ce063d3330889c9d24e9e1dad9c626b7b6114fee67ff67ffaa52f534a2a275b52c03a65f2f05b7ef06e81ca07a7b3d90a5d4e7c48e5d2838c180ea10eb47cf5fb7dd759e958971e6bc5d399bb7b7baedd6eb98a00231c0dddb0d797d2d3a4cf180c9205caef6482e5043e45d7aad5cce4f4005377ab02a776b3e13a8dba40a9ed3694ffe6ca8adb1040ad2a5f80eac29933eed2f9736eadde70e7d674acd3722b8d9aaeafb9d596aed3356774de46a7a17c03b1b3a25bd3fe76b564e055136855946ac5acc0312f939059ab893b63d819fc5daa265d6974efcb6928a0848d09e0c4d4d65487826ea0ace770e9c2795d1f1838f5c738d87d6f01408bf1af6cf406e595cd07fb41a9fc075f7bfce9277804a99c6c4901eb94c9fbdef6babba5b01f8ca6d3153fe281ef064388036045ab20fde9f60f0e6c0a7a4cc040cc878ecce3e1c0359b55319e3cedfdc68a563b6d1b526520802308932188191299e1996b659979986a4a3531ab8640a726f0826dad34b5ae6543fb6158adba4047a92356d711a86d36db6ebddd1648350de0da75819696ab3abed2ac0b5cea36b67ba322b65683b989c9052a53fbd80f68150bb03e4678c8f9287531257c6374a3015c6b02ab15e55304e004786d01634efb9bd5aabb74f1bc2be97afc6efb44da035832270918f513d2d2dab9c03fb75f12607df99b4fa680750a2405ac53263ff1ae371b604d05589847361e168025db0fc7794500154d27aedbeb9a63bd26a6532e956d3c2dcca6b240a188335ca0d412b09c3b7fc6a67f1f8f476e7b67cfbaa9d0c5663418dad033cacc65c552e8744c00674666197d123333baf7306a031d93617819637930353eaa8212206a1dfd30338de361d6891909548c2b89e5d86cd7aaffcce2c70889d57e6de3d8c7978639d71d866e4f75dadbefbbe14026acca04dceebeb0e136c5e2eab5926b090c013827f6b42e103eb3be6af9139f45c02a8035963988e39f7cadbb93eea3526fee375bad3ff8932f7f2305ac532029609d32f90b3ff2d0ddf368fec110c0121b22329cd6337c55a48658c67c3e713d010ffe9abacc3862ab085f684ab19d8086563c9bdc82cebe32d93a74c9d13e822bf7f67bae3f609407194c000a60088048d189b362120c867519ecefb95e5700821f8cae390212d66d0cabd077cb2190b3d7efb9e1487511208502d2d1846e3c4337109ba3df219d9cb99e01fa185994d82f46191da82c0244f7faa1bb7530743b02abbeee29eb16626a55777173d5bdfede4be647ab8a5d3575df847964642a9e3f7bd635aa153752b93bba9fed03dd93f29c10f58eff4a004bd725d0b5d5e9ecb73b2b7ff0e93ff9520a58a740cc7591ca6913988a5e9e942e316d0027bad2b0ce7efc56bbfb07aec7d0c20205fc5c6bababd6e58556b8d5f51577e6ec866bc8446c779aeebe1fb8dfbde387dee9def496b7b8b5cd33ae5024948171b9023197b22be4e8fe43a7631f7bc508a1c20e2c33031afa0a6e6d6dbbbd9d7dd7a523b4c06abfdbf57590b949e8830f445daa8e731fc8494ba4d81ee530d722dd7a322a8f29b826d1d27547337720767530080560dc435600d571f7df73b77bf0075fe7ce6dae09a82aae259372a5d5b0e0d28accd4d595b635208c74ef7d81eb506cd197ef5b3f55730983f515c43e4be346ad292a99ca699094619d32f9d07bdf72f77cbef860144e5700213a3be3d7c1d422d8b2562dbb6031b3a67ecca16c20b02914adfb4e538a9d617209296e4d8ca4215390410173028d4aadee9a9d8eeb08d468edc373440b5fbd52311028ebdc9280ad2a36b67ee1bcabc8cc2c35b4dd59b19465981be515d06ab8b1a9eda25b968a04b9bb8500b2d46ab96abbed0ad5aacbeb5cadb83317ef76ad8d336ea2fb9ae5f3aebeb2e22a8d86b1a0ae18d181400a460763c3f97e6163d5fdc0dd17ddebeeb9c35d3cb3ee6415ba4c6e29b688437e61c3e5d05070766dd3fa437efbfa96db923908e84d664b19c4b02a25d5896e409942b1d75e5dfbea9933e7fff077febb3f7cd13fe1544eb2a48075cae4af7ce07d772f168b0f8651b4c2cc378cd0309199c5f84fa54ac915890c5fd26cefac437177c0b1a5ab0ba0aa02adaa80249a85369a698188f12c1da97316bf54d4f53531ae3302a5955ad51ceac46c65c45c026d57d63b2e10689db9fb4e6db75c5ee052dddc749d3b2eb9ead9732e2fc0ab9e3be7d6c4804aadb6abacae3168972b08ac562edee1562e5c74d5d575a53557a875dc1d0fbcced536d6dd40209aaf575d6773dde5c400fb8c2bcfe80f534316572b15dc1d1b2b02abf3eefe3bcfbb8d95a60b0a6279ba7f1bd25818341493c2843db771d695828adbdbeaba6f0ab0f6047c434219f49cf05bf9d64601a4a8d63228df08eaaddfbafbaefb3ffb9bbff33bbdf811a772822505ac53267fed677ee26e99541f1c0e872b8c6d45502443a930b90463c0c3362a52604c3a4626d8dad933ff51472653a759172b21262bd275b40632ad562085cf4b9989491288117b250654afd42c8eab25c6c430c9b546ddd85720a6d314e0641b1db754198180a92646556c759c13bb09b4aceabc422046a6f57ca5e12aed15d7de38e7ea1d015245acae2cf34d00555f6dbbb918d2641629ff8af9a2f085f5075d9795a959ce152d14e29c98d51de737ddf9736b6ea5d3b02e3b990cfc7269804583015d8f98c371634d8c4de6e60b97afb9cbfb5d3720c23e9a99199a0c4903c5a24375a15cdd9a2eb3bf71f6d25d5ffed4a73ea5a795ca4917bdc1544e9314aa8d69be589e1043444b1a0a4b28034e6466cc61d8e4e164ea0281494380430b5df760cfedec6cbbfd6ecff5e2f1a698d998886f4222601cb4dc31f81fd36465655a969b35b72ab36be3dc19b7b6beeada02ae6a5074657d321901027df948b4ffc1e0ac0b8f4c4912feb35cb9ea4ab5a6406ad5350454e57adb6554a7652e004d5d20a6379d4fdcc1c1ae0bc7038b4acfa83ee1606853c8afb79aeeee336beefe8be7dc0fdc79d1dd79e18c5b6d37745f624839b1a32cf8e2878f669c7702416bb586f2cfbb9b7bfbeef2ad9b626a43efd7d3319b744289e16660577cfa4599b5e57279fe8bbff88b7e22c8544ebca48075caa4506af616f9fcf3b3a51b44744096f907aba223f162c1a8084b0b8ec4a14dc7e772b968ec6b6767c7ddb82513a93788010b473dfd0263622160b33909c57608489d67046441ce80a552631257b13031b55c245013a814fa5d571c0d5c71d87719818edbdf75b9ee81cb6b7faebbeff2d3892b28afa2cc3612db4ee73b81538e615df6765cf7da557770e58a1b5ebbeea65b7b6eb1a76b05a832f8dc86c0f6ec6ad36d76ea6ea5499c1693ca322821bc8a4164668e31d9318743b12840bb54aeb80331b4e7afdf74d70f0e6456fa31de012ad823c84c84bc9983bae572a53269b75b29589d224901eb9449a63abf315b66be28fb6fd7944fac88a62f463d077b26b20375dc9ceef497ab88f104624c5db1ab9b5b3b367e3a2d8ac9acd1c99457b0ac0cebca8f091f6802c4918f1515c804cbe594ff64e263b2462397dbbae92a02a65abfe7ca6270f9ed2d97dbbee5dc4d81cf9517dce8ea0b6ef8e2f36ea434bef68225f685375e748b9d9b6e2ef05c6eefba6277e8aa83d005074357ec4f5c6b91732bf9b2abe70bae24801216cb8aa37e627e5873aa17ac2a9909077390dd8d5add5a30afdedc722fdeda765ddda3cd8e6de084b95bd00de6ec19410875632399be57d6cfaced916b2aa74352c03a65d2393fdb9681f344a952199bff4a0c82110b08de9c311a41ccae186a98b829865fa1458ff1d9310977c46288d18ac4b0f0e3a0bccc1c43c4bc011660a5c4baeff433979e33afa0d98d3606174c2b2be02b86912b0b144b74bc963957169805623bcb5edfcdb66e099c6eb8895224f36cb6bdede6bb3b6262625fbd9e9381e85605206782923b5bacbac63ca3fce6ae96cdbba25092a9c1a6024c823b17f8ab0cac5423dd9b8d4daffbb1e9bc54173f155ac91de8fe5eb876cd6d0b444399c87047bb0bd038be57baf530a861502eede7f2852fb4db672e93732aa74352c03a65f2d6b7fee2345f2874837265428b177310924c9ff53fd3590d47d121c32a16033f409f4ca6f13872376fed58443b33e00058c4531136401e1eace636448da809bce490cdd8c80d4141e6675ef98ab930381e26a8ae57912e4be844b5e56af5b64cb3ba5bad345dbb54756d8151a754732bec5362b952a9bb4dc21f945f4360d310a8e65406d38f01c20ce817a92e537d9d8b1ca34f78f021429dfb8b046c8c73c5ac37f8a718a090f1bbae630a8a61312a6928d6e8044c504756012a9b5d5a774d2847a5523d9847936fe8fe440b53392d9202d6299462a3dacb05c115a1c808ff0c09f0922e9ac2333a28d1e513010f406303f589652dc44c0ef6bb6e8b39057b631b136a3819e9fcbec06ce8999a4061268587b9113241de788c1832215b2aba65418025740cc57a06321f198594a8f430a4cb8dc0402051c6392fc6532d565cb3dab0542d965d395f74c56cc1e517ca0bff99ccb948e54e67a1ccb7d04de6624c2a6b2e36b760f809a525a6a86e8cd82cc6a4f793a50acc946c8455ddef42acecd67ecf5dbeb1e50e0663338901d5f881e87f86a6517930487df28b4c6658aa542f1783e2add4e17eba2405ac5328d5d6facde57cf927995c7e67895f464c083387198c89f08ea4f80cbed71f0d0cb4704459cc158c498a7fb04fbfc1039b5462afb7ef7a00964d721a89e530a01f0eeda9e587399629e4045439b708f26e0280145566967398e474eca6e1c08d7b7b6eb873cb4d64f62dfb74a3e90960466237821bb1254643a5f3f564d877bdfd3dd7ddbae906fbbb6e38609cf8a1806ae6a29c80457733c304d47da8ba0636c45b11c26149400473c4140c757fd97cc18dc5f05ed8da7757f7540f9996ba58744c200bb50200293f9c68a975ed9135bc97c9151e5d39b376d31e682aa74652c03a85d2eb4d77c2c9f8ebc552b94f6c11a60e9da0fd2cc60b818c94526c024632a46b8e96cce95724125d261d2c85894c99eaab2b70a1258d9641a6f5f2a6216a2da8c0612485b7b90df1780b07e60626b01a313b526661e0c68ccf84281ceced1820f58607ca9b049bdb77fb5dedd39218abde80fd3d012a33f04cdc047054f60bc05065b05caa1c1b6154f5b07bc2cfa63f04606522d582ee87be94fbfd81dba65fa3581e53f7e3f012f619fba25162220688f31dc06289392846fab59573f9d41c3c659202d629948f7ef4a393209b3fa8d61b21808512d262864f0ad389d8a84cc6cf900c60e17ca7159159944bc46c49a73101994895fe76cc2c83231b2008995ade5a0a3d3362c45080e37832c517a0ccf4f5cc046474bf61e8e3a1aeeb0a800ec4d660780743816277d7d28140aa371e0854466eac73463a7fac7b0975ed547998190830c60968c277065825426b26fb08849d2895ab75371c87628bfb6e301cc97c95c9a773b80653983c66535a12439b1803a629a09a343b9dab9d4ee7e6473ffa317a05a5728a2405ac532acdf6dab85eabdf9202327b95310dfc3338a643d93c0b998a742a66c663860c46ed0b41e0fb05568bc69ec66366aff13e2166d5615e43008b252396be244d59fa16494cb348a0c0745f6331b350e013097466021a5cf94381dd683a31803a9069c872108d6ddf68264625937522d40c399f8603a5b9d617ca63a92fd29200d1421754860fbba08100f0611afb29f4c965f28198dcc8edc8b42540542865e71102c1f03936d43320a744d72326c868349a3bcd66ebd1f317ef4a279838859202d629954abbbe1314cb5f2a148abb300706a563a4065aff1826861962a4a5527c628f3087e6b2ea987fcf831673f7e10f1adad03013014164a005bb628cab99002a099998e3b0565ae818897566cf61ce42265925587320136da0f3fb623efb626ffb3211f7067db78fcf4a20d30f27ae3b19bbaead6ba9737bca6768a02790559aaa8ed415f34f2875085208eb001543c6b08f40514c40267605b474eb36fa0203153208218319c23c79364c5a41cc1991f96b9b9bbbe54af94b672e5dba6119a772aa2405ac532ad37c7d4780f2b962a5b25f2896a4cc4cd0c06c3062306258f49f8ba4b0c420c1ae8876c79c230094a9df51685af546c3d0f57b431bc70a20904125acc01c54d2522b3226a5ecc2bfacfe2369a7f5d71b082c98ba7e7b7bd7dddcda76d7b7b60ed3cddd03776befc06d777b6eb73f703bbdbedbdad7f60166e2c0c6a8da3ee8bb3d1d03f8987107409a8bb16186520ae10ad413c1cc63261f1817e00538ed29cf3ed1ecba5f4218983c96cedc9e659103f74e87e7bc23c8b654a94667cf9ebdd15e695fffa99ffaa991659ccaa99214b04ea9e0c79a84839b8d7a735e6f346ca66394d59cf04a302086668175f19a5178fa0a9af37a49ec12a005cb62de3e4c41bab048bd654e81167c180948d1f208c8d10508a73d233d2c014399a1748b218afec6cd5beeeab5ebeefaad5b6e7b77d76d09acb6f6044efb3db7237062fbc6ce9ebb2520dbed0aa80436fb626704b18e881913bb23cf8caa2bc8718c6eeabb1655540799778095800c064522fe6a57f94e429987ba6f9d7418186a8d0530b4d82cb4d9a495cffac6e6ad3367cf7ff1bebb1f48a3db4fa9a480758a8540cd7aa3ee9a8da6ab492131f54aa5a299412832939bc2b430aac02d1f78291623d0f29da603032e9855d24118b0f20c25eb4d2b293de700525cc3985b3eb21c073ead8e05039ad16828a6d6b3c1f208391832fd968070a0656f3076bdbe1f7a997dd42da90765e21c3746a57299ada7288029881579f3b5ac3a649427b34acfe9ac6ca352e064274f66a1ce32eebb32e13e48163ba6a56e4240c73861815b59590b2f5dbaf494d8d523c56633f55f9d524901eb140b0ca4c4d02f41c1ad304c7029e3cac1c2655156292d2621d35bf5c3b91b0bb0c6621f7d6d13250e1d01706ab512ae2e0116a10d62385940cc0f39e393676e24980dd1ee74a86e366bae5a2b0b344bae5a29d90cd4c9441265015b5e7905cb8c2b007c8224c66a67caae8a00af2cb334c82e5da5e8278fa81489a08751e56ca0be2af96869b3506bbf635ec568ec98ce8be16f1602a2aed8e340f73173368a9f011f2c32a33a3b25ddb2f6c1ae5497a038db387bee898b77def5478dcefa931ff8c00786f1234ce594490a58a7580a623af9408aaeb7d8648aac920021604e411d93a2c39442b1aa216c8bc8f0e9c28d09bc347fd6c2980a7314e674ee4cec850ed10c4f9cc932de943231a8518202493021bd99c6f858550156c5d5eb55d76a35dcda4adb6d30add74ac7669ceed41965a16133d934756ea755d3fea62d1979818ecd65d5b9aef26b550154596c4a2055a906ae5a676cac8a0116852f045878a3f0bf5195b1d8d9402c2e9a8b1daa7e846ff82876da19547f9cec4bcce099d5b5b3ba72ebccc50bbfbf71eee2bfbeefbefbf6ed66523995c25799ca2995bffca18737a5d01f590e871bb010420104454e78640e6a80899641023ff5cf4f8e2a0586ed1464ca9598ae5e4bf31f09184a8c675564fcf6bc4d710fe00102301796d69f109054a21112ff168eee3c49400198d5eb0dd7e97404840d1b86d94cd6b680aaddb6010199ef103f18750ac4d6184d82010361694c395fd67659ebf47dc4b4c3141cdb88aa38b7c49c04aa0c91b37bd077e308a288f9b730d022da9f2e4a8431d8f8ed7a26d57a73f6c0eb7ff0cb67ce9effe54aadf18d77bdeb5d69ecd5299614b04eb1fcb50f7f6073399f7f6439196fe4960227cc27406bb6b4d8293a047be73ae0b334c652afd5eca50334410028105c3a123044c64e300399055ad8e4810a07367e2d9cef32af605959311ded3090a2b52e699963ec78a60c6b369b624a75d710c36a09ac5a9d96cd7f68830056ca87fe2f9f045a659996ccec6366604160e563a6c698b3030193cc3f637a627dbd49e4b6f7ba367517a11b30c599008ae380204b1a1a982c1596d9eaacdc7afdebdff8bb67d79a9ffae99ffdab07fec9a5725a2535094fb388e930e12983eb5562f3aa25736abd5d9749c630c74503045e722816c54c359887b3054aad7d32119968b41f3bc60f7a2377d01fba2e715543c20dfa362d17dd76002d60219a4502121f0281639ef26156c445d1c91ac0226126aeaeaeb8f5f5352d3bae8d99c82cd05a92301f9949baaaeb0af8b4ac1140f7833dab7288072342bf3f18aadea139d7a78b8cea3373fdf1d48d18b18146048113e40b4025d21f66652d8a33eb82c310cf5bf3d9f4dfb5e7a574ccf6d780a40ceb14cb5f15c3726efe11371a6ee40955c84bd5b34b33e77038c39e8843a2bb0e41a1f879d816df9292033f190f64c3b1293fad6916112e3686dfc83be1c5a4044ab02fcc2ffa1dd235066683900f4c0e36668d00cca623b3aec0880db029c65fc77414e0e5f51fe0c930cc054c4abb9e982f3f440c2d909ccb385774293a108b4aa60823320b473a33e0ecf5c76e20a025fc8af2617ba257b8bb1cc3cf504f4cc34ebbe136ce9cbdda1ff7feeb5ff8fb1fdbb60aa772aa256558a759643e014e588205a5209f3167760553a856769d66cd47b50b6c0004baef30b05f4f0acf14605d2d87630190343f195a792040e876fbaedbebb9d1988ed3f4db8b2c560a106109f321e29c6e324c31461f44000b1f17e52044d2e3e38229714e18315a8260872f8e242654d0f94cf00a80e1ab221c6212aa7e3203f70ef65507313c95495f4098d6415f00c6c0840225c6e202508960b7ee37ba37c08ac92698b6acc61464327f575656dc5a73ddea94cae99714b04eb5d07a66d69a920f1d2808241a95c0adb6f11bb55cbd5ab1514761489022d8d46038b429e97d4cd44c8abe10c3927928f0eaf6e814ed676b4e82351919a18f99a804bb621f201545a16d9338979827f603645cd3eb77ddeeeeaedbded9b2a9f3d9c7a07b001389f82a9cec0c0a4817208be512a33a1058edef31b203c3def8d9a201afbd83ae407668662cac118e8839682c4f75822de29c0f8a25d76a776c169d66b3d95b5be9889ba5f25a9014b04eb1140a55319992d60454623416dc99f32d6d4c80ca8cc8ed6ac9b5c5b69863b090cb5a07e6a198d4488c6a18cdccb462666812a39432d38ceffb87bfeb88590156b09e5da591d810333663a699b9c9d034624f91ccc8c954e74f047a30a4fd7db7b3b5ed6e5dbbe176b776adfb0f7d168950ef019a0228181566214043a0ebde81cae932d243e87a93909936b49cb93d4cc1dec8fc6d98b780d454103dd1927a0e55e7f93c1238e704d205572fd320106c379b9daf9cbde35cda0de7352229609d62a9062d8150d96544b17056d3f29763b20549ce2d5c51d659b35c70ab8db252d5c0ab560ecc793d816d09b0fa022c4cac898087c1fe26624a00c5fe7064fdfcf6042eb09b1e0c67ffc0edecefba7d22da750e0c0da0c0093f11db9ac8ec1b8ce86ed373dbdb5bae2f56c5a8a0bdbd0377b0bba7edbe811f4e7d3a431f0c07caab6b6c0ed3936e3abb02acfd81989e408ad99f591e4ce6967a93a91b11b98fa35df7389e393781011a139c59ab200d0d954066f22274cb65f6ba50f577572ebe6e600f2595532f5813a99c52f9cc6ffeda9b26fdfd7fd1bff2ad37547291f96f2602a3ec6c2285ce9a4faa3708a5f430a7c85a007b83a17b71c7c735d11506b0cb65188e8501fef22e50cae7a6c650da8d8600a0ecaa32b144ce8c41e582bcab556b36c929a61c3e2b62b8f05f91f065611e46e1d4d56a354767e5bd3ddf756f6d6dcdbad6c0d632aa2b41088cfe1031ed97c07220a634102801a03d81556f2c5353a62af32786628404c112a48fdf8a205740965f5c9cf916845a2eb906d1f75ae21b2bb5371f9dbbe287fe2fffec9f6d6798cb3e95532f692be12996bff1737f65733e1b7d243cd8da283055b2d00733adb098f916b90c20c2b02bf4cf2b0890b4541a466228b4188aa90028801781a00b9dcf889d44881357457c950ee91c01a1008831e0a7020a7ee7a698603a68fd100550f8a770c4c3c40eba07062ab43a7236ce7b1cf5534c479dcb1038439dcfe07b8c3f0f8876c5e8ba845708b0607eddf1d41d8c12f6c798ec0096b3f0065a0789bd9a89d5d94cd7e5a298a380aa541450e52c4016ff58b1dabc3e5fe67ef5273efce19461bd462405ac532c7fe3affedce622146075b73682ac8f4667b4862033377f1693ab12264020281d96319970ca4fe97a23246308191bff4a4b7088d6361b0a5dfc0c85e7f3209e89111d26843fe0ecf621e5d6cac73c80b4d461ce999f8b0ec9624fa4ac18189397c2fa183e06673f234800567d406a0458d14a0970c99454de0485d2d7b14fac954cc041b8b0e9f66155b462e22f232894c6036a49dfc2aad814feba4a29b0d6d2bc8ef8b8aebc2bd5dbd78372e6573ff385afa47d075f239202d62996bff1577e6e731e8dc5b06e09b03cc3221abc888927d38ec86f8089be8200186c8b7828a6e442a99d149ef1a716c46c09b1000300c6932806cf23621e50f3ad8838e66158802223346096d9b46202216659a6f58ec4081133196b0cca37d031421118e06facfd38c8fb0095406924ca0410d2377068cef5c875c5aa3007199c4f64cbcaf3a34cf83e90b03a90d95a18c5ae6805adc96c0db059c50cb302dda2c0d93a4fd757ae2f32cb14b05e439202d62996ffa9006b6680e51916cc6799cb5b50a6750216c3621fdd5c7cf7195d2465cf079e6de1bb6217023ff3d3b833e48b4e833d19bb62d8191f450e0011598ed9c8345b98671351324cbba14086495c8d0969ff40400620c19c4838cb31eff0ab014ea1a813f15fccce8c8f8a7d7d73b27bc0e23c3f3b3580e99920262ca08b1948547cad18b87291ee3cf47d540d557f1864891125c4b88246e77a6959fed57ff7852fa480f51a9114b04eb1fc4f00acd9f82393fd846179c0e2a502568c5a001bca8a75e1108738e1202f1464364ae9517cd897998702248b84174860ea1928c16a04245cc8902ef8b1c6c45e619a691d60f2e1101eb060504c830f10d1c2c7366c0bf061d866d2c8f2f06067402486076071de48e78d588751290f00ca0fc6a77b53bd21857e8cac929982251a08749fba53032c1f889ab33e8a066aadd5eb9972f657ffdd6752c07aad480a58a758feba006b311d7f640c60e5e8db278d06a0a4b849743b60642d785a3701b0b44aab206615e798b988392986825fc87f16590186cc439240cc7c55d348e0c22810de4c0c0122019a9982004d9cc616ebc5b933018f07243a32e3c3b2219cb50e7bc20405fc4813fc640654f8a9fc080c7e6c77b12a01262e35eb33693eabb2ab8859316d3e6c322fb0ca896112670618fbd6cbac2bb637aeeb3652c07a0d8908762aa7560a301f2d798b60951418ae04086112e2c7224cc1460915e3603d90f9c4a078287759eb1615dfacbacd4edd6db66b6e8d98ad7ad9b56c403eb118995e225b0212629d882c87793163cec2c653b7ced238dc0949c00f15866257a11b8cb56f3c72dd0193440c65ee8dfc3e422cb4ec8f995507f34fd78cf16de1d81758295ffc630015ce7f8c55e1ad072b997915997b0c0418a84e05819e6ae782dc42000c60cb7c7544c0eb5ac05be73957554ae5b52229609d72217401e79491ab63c94f18e1d995019800ca0f714c9c1520c6280f0c9a27c642447ca3ee56db0db7de69bab556d5add44bae23e06a544bae2c138b31b0bc5fcc8ff0e9cd461f66600c4960652c0ab350ac8c6e329e5531b202feada9312d000966656c8c732cb1eecd405d6a3e33866606a418c6b95261cc2cc2164a06bc190bc9987a70e65e6158f1d2ee5fd76212e7188430c5abd794a480758a2510bfc00c649817bf94b64a92f504b00cb4605c4a0cc057c0515d147b1283622c2afc413531aa66bdeadaad865b6954c4b48aaea364dd7a6c1864ae518962384c9785139f911d728cf0900b54aaf791799394e37ed4d2e552fbc5ca6066e6bc87aee95c6b81c4fc1370d944ae624bba58795147c6c9f24325035475d58d25c049eb6646a6e2528c2f9b817d11b4aa1c0da03dd011ce61be2d31ac14af5e5b9202d6a996a90709898154b23c968e1816ec8af1b30aae28a652125031faa88df2292028cbf4abcae46a88cdb46b4531ac404980a5d452a2cb4bb9ccb857009f6f716489839b3c58daf032023403b6bc58190d00020e58605cbba33f6dfab6477d84fa0f0648ac187931c89f4f024aab1f935ee09bf2fe2a032a8b15c3fcf551fa04cadaec3eba4f032b8126009d52acd796a480758a45d69439c46949a3f50f14c079fe6aa095302c802549840730ca27fe2c00cb0f02581650c94c64d910f31280352a005a4ee7c954cb0b6896736b994b86b40154ca450158a0a46d468ed0217323e555075af00292ea41a285afa43229b72c1064220a6354627374afa933643275535ee493c5f92e66055091a7351c006024d60db0940cac629645bfca14af5e539202d62916e1954d904af7182645153c99ff06f032008b05d03aceb26c1c76693ac31b1be3023c62c068542bae5eabba9accc3865253c0c528a62d8156ab9277cd72d6358a5957125014b30b8baa27064c98e3caec137814d8af2f2b108010dc5955de75d89b181d0ccea7a26b2ab16c50aed85b9d893400ce18c80806059cace5722136c9407f022c61986f3810926122b2b4164fdd3b6c8e31c2e074dc638a57af2d4901eb34cb7468019536abb31808f615e09448025a09d34a40cb7c5e301101826723b41ae62c0013b65324e812330f934c6ca7a904e362d487b546494b998d625f36fb8d408a29bb4a02291130a5a5806c2990cabbba800a406ac543dc30a8a05f966c5fb39a005660e7970b19011ea10a6251987c626944ae1310eac4ae70b6633e7a908241a9ee5ab704581964037006dd16e99f52acd796a480758ac546fa9c1ff9b14c1266759c659916c7491a4fff420331297992cc6c54f2200098c9742ce0db2a99d31b96c538f1abcd9a5b6f29751a065a55b1a2b2284f09d3109f96980fa90e63b24ec981257c51552dcd5f169ba0c9b2a8f3616316a16fa6dfcc58955517d0d20accc9fba848326d012c5dc7366630234ff8f3749184c1fd00ad545e5b9202d62995471f7db490994eaa8b7094c1f94da88145855b73bf0456029469037042816d8c4ee930807518f60040e9fa9ccc426bf153c254644667c21ee8fa5225f401734ee662b30278555da75977ed86cc46738c07de27459219c6cccdb50ae3bb13f3e57d4bc2409503ebf1cc0736443d49c6866ce9d7a97686aa2be57404bf149d9901504cd8648c799b5e0c1350d7889869a9eb74af5c184763694f2aaf25b16f3b95d327b3836b1d31a107c3f1b0eae188fff542054409af806199027b0c30054e002b49c6a650fe0408b434c77c9ce848eca7e5a2b58ed640dfb2d810db6ad448550b892002dda6e8521edebca4eb0fa61a20423d3c9850263488fa40001312689554e21c8094bb30208259e1403780f24bcf006185c0d911f8710de50058ccd1c85f2aaf2d4901eb14caf38f3c529a8cfa1767b3e97ba7e1780da73b9d964123d89181d42b48b2d72bb60786240102de11ef1381a5474940642d8a45f36f1509352011c3c568094a2c192181f3ccb1affccdaf0430aa604b0210269cb064fb7c3dbe33f9eb7c02840de38eed53d2792c0d78e3fbfa0e99cdf45fda2be7b52429609d3279e49147f2fdfcf06c66b6787b34ecbf7e399fd66821834df9a9e65ffa4ad97fe4cb3a0e0a3e256095240f5831838993f98a0a3e4a9ed99a615194998c9ac004a844a1e3efb230091db77c5515421a742a45c7944aa66a5ca7c37a498eea24be043861eae9428bb1525ee6bbd23afbfc6cd63a37065e2e48ae4f84d55934c954827275b9fc07e977fe1a91f4459e2201aca2eecd33dd9ded1f9e0cba3f3e19f52e66977e2c7394d5a6bbb2887149acbc0928bc3238bc14b01276c5ba39e293f30009c0c2c08bf394749c72012f8245098bf060959885000e4c09a0e143f3ce730c530f5a569557a8975fd765968777b21f032ed2b1bc5f29ca5fffdb7a341e549bb5d25bbefc476fe9a89cf45b7f0d087eca544e81005637a3ee99cca0fbc3a3bddd8f8483831f8e86dd4e6e39b5004c3f3e3b2621236f7a16a21dc6904ca14100ed675d7bfcbe972584a50d3113fbecc11340055821d6cbe38bce07e4000de59f4c55cf05160f86cf8ab3e27d967f0c22fe7af23b2acf9f0748f9ba7a9003a0f4816a9db005f36301aa801520c6359c6b0bc0d06fbbac9e854037932db845365b607ec246b3b33fcb4db6fecbfff2e3132b2895532b29609d027974f96861fbcae0ccfe5ef7bda3bded9f76ddddf7cade5977f3895ee0c28228516cd8469e56be18980ca01290d271b66d69a0f152b048846debef4712a818038ad713b110037c65ca0fa7b80f8d88cfd13f8ee3afb2b2b466655087e3651d634624ce25c1ee6ca9fc88666769a0a5e4d9964fec5709dc92ae3f022cc600cbe6a85bde895395668bc54abe542a675c71ffeffcfc2fecfdd2273e9182d62996635f502a274d30637eff99670acdc9e4fcf6cd9b3ffcdc95677e7ab67ded5de7e6830d022ddd6ce2964a457c4e6215309d62b16c8197061252ecacf9a3fcf18cb60d5cc49e8e8305c26c3724006a3e63703d461b9d5a602a53d1cf18f9d33a2afb69e9190186c1f7ec3c6d30c144182a45910d65cc84141c8bc8c31a053057fdb98c75c5cccdbe23b417aa415d0026c02c9f99db7d0044065a3150315a8381b3f6cd9507a6a6d6ec43666d990b5c2e28e9be8b2e572dd90416edf57337d6cfdff17b997cf9534fbdf0e2e79e1b0e8777dd7beff2fff00bbf10e9b285ca854fa6720ae4e88b49e5b60bb155d7af3398c26ee696b6575a17cf4da6990726e1f0cd93ded60feddd78eea1fcfe8b6b7764fa164280ddb69847d6d7ce338fb8eb4d4160061849b131d9121f55c284601fd6c2c639208504538ee1886dc9e809062c5a0a7c0029031df66bdd66ca017492d1160c900038002ab26b87630f581ec0187a1990220f965c0b6051b0fd6709b664ec4c75ca679986ccb334df087064120262bedade6e35931522a8ad8cd855aec004187917d46a6e309cb8a05471f5e6cad5689e7df4f2f5edaf8c0bc5c1fab94ba3b7bee5a1a7ee686d3cf9b61f7ddb560a5aa7435293f004084ceaecd9bf903f7b29b87b9259bc733c5ffef062b278fb6032fe91de24fa706f38f9b17eaf7f7f261cb41bf3816b2ffa8e6e2ae8ac3705a5e04ad26553fa8cc00c604acc2c8edb52e793187d94e401cc1f07010ea14380a2ff6c2b3e941c89b7e39dfa672623c7f44f3062210bbea4e43a2f5c63d7b1ce5f0c4c565f0113a387e6b44e3200ce320a83b67553b44e26cefea33a73ef735d8c3f0ce852fdb97f3b4efeca2f28da30346e1abae574da180f47674661f860389dbd6b3c89de3e5f2c37f2a560b4178db73ef1f18fa7b3439f024901eb36cb3f1058055f7ee64e57ecbffbd6d6de07b7fa93bfb43f18ffc460347acfc170fce0603cbb67329daf2d6751909d8d5d653e74cdc5408a192bbbf230309062c32ecc87234d4f002249097091b4e19788e5f1b27503a1978a673147fb59f39bfe5a0f40f8acfcbab9d5a960720de5bdc404c45705c07aa0f5c99b84809425dd870f16f50ccbee59c73d3b8491592dfc3ff2b6fba31e3402e890cc42c6a49f8be5d127319fcd96740ff54938a90ffa079de174be3ecf07d56c3edffb5ffcadbfb9fb894f7c2205ad132e2960dd66f95fbeff23f7f506839fb8b9b3f7d16bb7767e646b38bdbf3799ad8da3a8210bab3ecf1602a19088c4dce517912b0bb01af39e2977a2f0865c32f35c3ed01b151b113b49c029492f052c945b8527db1ea94c0e4126c619c49f734cb4ede3bde2fc011103148082b2f8acf0a3c5c0c5b9474570b9bf462b06542ce3d085235f55c69895ef33e84d410333ee5bd7fb308923b0a2caaa890e78e0a41ea1081807e8a398d5f3cb8a3966a8d7827179a66e5669d666c5daba9e596559a8867febefffbd9d7ffe4bbf94469a9e6049bea154be47f2879fffcaeb76f77a775fbfb5bb72d01f642bd5c6ebe62ef3eee1247cc37038ae8c72655728165c9d910ba4b08b5c600e6ed85569da756bd10d773ebceccd25292c2fd0e609cc0aac0a450147de9573c9cccdde2424990f4bfb48cbc4b48acf39dc1fb3a1e56c6ee3aa278e7873b29b0fcbfbaf709edb745f96605e9cc35037cbd8513f77d178a473663665bd2da7331d63e8647c5acac3404617e94296c6980c8400241f94ca6412be7e09abf29fab677b7e7c2cfc6e3c1f866ba6f636b599f9e8b26ebc64fcaec0150552f370e266aa0b43f244ca27d435ddb5fbddac7986ae45b7563bab5fae95cb9f1fecf7ae4d467dd76ad4a24be72fdd3cbbd27ce6e1877fe8052b3895db2e29607d8fe491cf7deb9eebbb5bf7ed0c06ef1b8fa7ef1c0d061be17c999dbb5cb0cce456948a00cfc8052e28e45c03fc11284d664a52f4ac18412d1bba8dd9b63b173e6f2d684166e6728c1525a1756c592809b00aae9403005e1db04457d0ecf81cbfcff6eb73600158591230bc1cb06c5d89d96d16d6f2e74d45ed1260252d8b00d6c0808959766c9b24d04a000bc73ba0e3c7f182f92c63f604eb12dbc2691e77333aaa5f02562a0fb09b4fe3baa91e0240e5668095c978c08ab2053f7020a0164ddc42f59f0ad54241e344eb7b9b6f7051eb9cf57d2c158241ad543a10cb9b4d056ef94c76daa8d59eaf568a5f90b9fdf8a50be7b7eebdfbdcd36fb8e79e17ad22a9dc164901ebcf58f051bdfe335f7860b03ffaf08dad5b1fdade0fcfcfdc725d005228148b19e29950fae96c0182b869a668e650bd200621a51cca2e1c8916c03ed8b7b1dc739be367c51aa6ae24d50b96de3fb314502d8d61f9eb51f057032c15aa377f0404c79389f263fae74370102824ec2a012c5afe7c80a93f07d098a9ae0096b51c86436b3d649a2f1ffae0d7c3d00316b3f018c352518015409538d90db0043c8016e2ebe51919e55b9d00d40575a26ceda7ca54ddd89807ac999eed329abaacea648e7cddf74ce6f548e70fa3993b38fba09b772e2a2f01e83474e542b0a856cbca6fe6c6c3a1407b3eae940abbe55269786673ed853b2f9cffdd8dcdcddf7fcf1bef7fce2a96caf75c52c0faef496edebc593d188dee7eea85ab17a40cd5edbd3db7b3d7758b7c906bb7da6f190e27efdbdad979dd280a72c44695cba56ca55635c59c1aeb989a62ce966216390f4eb4988de759379c650d188a62546b02acb3d165571658559663575c8c2c78d40225cddd55b2d006f27a35c0caeab856acde1e0cfcf230b1e36580e5998c980a29062c7f0cab2e012c0111f722c05a4c87b6cf4f2fbf144079d0636e438ec3b46049988294e7418a8104a9ab9231402198843a1daf87256381be2e9463f510f0258085c9bb10e0cdc3d065002c6dc3be223dad89e07f2680df5f7d9d0beb679587f2d1f367828da098b777118965611ae7859298a7ad7a6dd46ed5bf1ee4b3ff6ed0eb7fe381bb2f1e5c3a7fc7e51f79e79b9fb64aa6f23d11ffb5a6f2ff937cfee9ddc6a8dfbd73776fffc2417fb0a16ffdcd3be3f19b657ad4874c182aa5149dc1215d1b4f26e77bbd41c1e5ab5248992aa21345866411c8cccc6c922a49c1e8c00cb362b8619ccc8c6e15ce056452ce8c4ca0a61bba8bcb9bae3eefbadabce70acb5065088ca48c812c3de6eb5b166bc6586839f4ce70bf94e6f3cf5a1213704a24594ff6b3950016610e9888c664a4dc0014d37b71ccfbb194a4dc00919984aaeb12a7b69981986dbe633680055045623d330117d75396b04a75c4e12e56455db54e9de34a584aea918095074f0f628780a5e7a6b39527d76256668c9dcaf2b6219bb3f3c84d74ed245f738beaaaebb6ef7661b1e5f386e5612a6b49402c4288c66c22165b60ac2f8696ce8e75fc8640abdf6834b78342e94bb359ffab67d7d7fa3ff0fad73dfff01bef7f5af703d14be5cf488ebed854febf92df7ae4abad5c76f1d06032fdf183c1e8870eba8366184e9b937c76530a8595e6814269be5c64c6a3716e2210cbe74b2e0864ba4929198a85d96b08c69c4cc6da87c2a032ba566fc6f455ff9b529aa2ce5d393b73e7325db732bde9dad31d3180a99be7cac6b02a625d55a569a9e9151ec09212c25800b425994a9256b4241d1703115deb5b0b6d8701852a6040415df03bf948750f4216386aa00b9879d633d331c0cb981400a6ac0099508c07b370a9eb68e4b3d64200ca98914f886e47fff9b2615209e3b3bc548e0f44857952a723f665e0a38430defc605972d3accc64c6995f0c8d190e4a1b6edcb8c30d6b9b2ecc06761d02605af9ba75f659d0acea9a740ae798b226ac7e99cb6466aafbb56a6eda6fd46b072bedf6e726d1e02b67d636ba776e5e78f1e11f7e630a5e7f06f2d2af3595ef2a7ff8874fac0c72bd3bf7bbc3f5c17074462ce31de174f643e3e9ec9e305a64a547d965312f2bc22b4ca2007cfc8015ca9acf176d403c3a0f33405ea95432a51f8fc776fecb01044994116515f6b895ecc46dcc6e28dd34b3d0d142982dc8649c3ba9a79b0715af783160b10e301c072cbf7c296825f5fed30096ac3f3bdf000af0d03d24f5643fad88f8a922293c4085ff8925262320b65406944add8ea7a42e60374d1266fae9c11a7091bff2581c02968ce1b8cce3651f3e7f61cb4226f2428c363b9f38371bbb30537483fa25376cdee54685ba9e96075e0f9c4a71f9c6e0744f241bea46ef0649f2b6ba66b3b3203b5d14b2d945a190bf12e45daf51a9763bedd6a3f97cee2bcd467dffc137bde16a6d193e7fe79d77a67d18ff7b10ff76527945f9fc73cf6dec6c0dcedfdada5e19f447f97c36774e1fee5bc751745f7f30ae8fa3f9da74e93696996c7129b34c5fb093dae84a4c9d23254c9805ca8a390848a100f89a588789d0f72ef9154f04e545415044f230a5948959c92fdd1901d6b9c575d759f65c115220c032c5d21b050c2d1f9815a0e595eb10b062583a04ab584755965f5acb21d77f57c08a190f753a9e30cb741dad82de17e401cb9b8ede64c44c243f95627583015a1d55ffa42e19b1ab8500d8004aa62626a795976cab2cfc7dd4cdd8a792811af5a5028896b058e6319c8603abd3a4bce686edfb5caf76c9c21ef05f7913946746e162b42a03d6c812661757c997cfbbd53ae7fb77a83adbd1f94c1c56e095599483c2f54ab5b21f1483bd336bab5f89e6933f5e6fac3d33ae2e9effe8c30fa7c0f5ff8724ef229563f2af3efbd9b393feecdc7491796814466fef8f26778c2751516a5bca2c336bd3d97c2d9cce73b22e728b6c364f8439360ccabf98faef31f9c5665fc22c50563e74400ab022318a27c712c04a7ec99104b04809604d9dcacae5ddfa72c79d5fde7467967bae919998b37a9929089494af98c5cb010b249015e7eb489e71fe494a84b238dfaef96e80158343025487806afb391d7351e0a47b4bcc46ce493a5073929981aadf4b00cb5743f70238c07294f4dc60559637e5b04feb336695563e49d9d4cb4225a88024a3e7c1ac3eb0abd164e488719bb4ee74fde6ddae5b5cb786808caeb531edf55e6095be01e1581df5c783b0fd02377b16aa65720d3f02d49d495dcdc4e5d9cb5c2ce47373bdcb79bd5cb8160485cbd572f12be3d1f86ba582eb9e5bdf985c387f76fb42a7f6c2030f3cd0b7caa6f2a79214b062f9ec57be72f699cbdb67b6fbc366219f7d409afe9668ba7840c074a7526b2104028416f3654ecc213f9be90346c1687ad787abaf9defdbe5e6beb52f19870aa5c7896b8e662930fb2a95cae150c22c31178f0356022276bde438304452d2a98c9d4666e4363207ee82db71abaeeb6a39295826b040d360a172001c98d2cb000b41f950e997974365b9073fc6d577012ced93aec775f2ecc94c4240293ecec59853365a83eedbfc5b1c8fc1852f0f80e27e491eb0927a406c74fd52c0019b4a000b3052599888e431532649a80375b0e3e0093c485528e42baeb08cf42332767d3d9e4165cd8d3bf7b84179d3f532f80ef58bb3ccf8b1ece31f0a0092f745dda90fadb8c9f3f78d09c4bd1d032cde97f6500f9cf400ad8d431f772b0a32f3999651a190b996cf66f64af95cd8a89687f55af52981f96773f9e2b7efbdeb9e6b3ffeae1fdcb30aa4f25de5e80bf93e94cf3e79e5ecadadadcd5bb776aa857ce6077b93e95b06a3c9597db4ad4c2e738773f996cc88a21855ce06accb17f4d10a340c7cf4f1ca0cccc61f3bbfc57cd80581819918f621f38bad0f5d0a17328a81aed1b76c8095b02c40ea3860258a9b2c49a6fecac780424a13a90ce6e6abe72277ceedbab38096000c0521e2bd308fec7afbf59762191028258085722349fe2f9743907b35c052f9dee9ee999531272938cf8475ea9989cd39c21acc21af75f347012a5688805165f8495d8f004b97daf5b01986ac31c0d2f326af844151178011e8380e587edd2a4d092ec8d75d663612939ab95ea1e1ba8d8b6e50bfe8c6625ad46bb1e03e99252871a87b90e55ec89ff7479720b23300557db8075f770fb4c23b13ae35d136409698998545a46de593cf45ca4b26e37209fb2ae4f2b794ffd3fa061e0f82dc57f4249ebf74e7f9fd56b57e2b05af5797effc5abf0fe4b39ffdcad9ab83fd4db728bce3601cbead379aac4ca3e95a942ddc3989a2da7c36153615027d7039c009b3860f9029b0f88cd98782006236609e019637dff2fa9efdc7ec19170aeccd41efcb01b0aad5ea2160f1d11f07ac044450a044891350217fd8c26c16ba69a16ee76f2c0fdc4577c39d13dbaae4540b99a67929bb29ffab009681adf24aca392eec4f1cf5ff21c062fd38c332450758745d0666a315db2fc0623fdb48529f64e89be3404df924000590b76b0db00024cc2ee5a1f23d60f9733d60f97b623d91a2006b3e1db9d0e55daf7edeed36ef72fbc1aa803072c1aca7738b42978a7e8854beca3633937b50a2ae987884962047e5903f3f4a7a3faafb9c391479f7da6bf7c07ebd7f13e559d617a3d760f9db8f9e96e4a97b8f74de64b9986d6796f317cbc560afd5a8bd500edcd70b99e5b39756d6fa1b1bb51b0f3df4d0b6cf2c1524fe845ffb029bfafa132fae47a371b959cb3f389e4cdeaa5fdefb46d3f97d6134af8849e516f9a2d8d42c8b12d28f0dd0e10326b093274554ba3e3fdbc72f391f2cfb3cc392e8a396aaebe38c954f7f80830586a27c522a264f806195055898839c674dfd022dafb47cf4478095882939320f995cc14df20d8b6e6f2d0702ab6d7721bbef1ab9a94d155f82c5e8f485f21153f4b14dba7449371e1d8b6047da2647cbd72acf71ade81fa33df8b251c578bf14d540474a6b80853f5aeb89996701a2f13ae7670527c64ab4dfb32be0c5976749cf966480a564f7ae3fc011e0605cadb19e0be6e05c2c0b931049008bf3161925dda8c5782919bb8281e91cbbc3a0eda67a97935cd5f5c4aef62be7dc41b6ea9602b1f2bcaf3330a105582a1fa1ee09b85a5df5e75b0d01c6f87e95d8b0fada33e24c76f103a06d9d0f60d963d57f55ee0de493f87bf7cf9677ccba006b26e88f0ad9ccbc58c8ed9783dc0b8d6ab0ddacd5af0785fca33bbdf04bf75f3abbf3c1f7a6c085f0365e93c26078b34273e3cadefeeaeede76b59cafbc7977347f504ad0d2477246bfd8f7ce96d98a94aa2cb0cad25d445f6e7c75e2a3f02109f6abab8fd87f68fcaa7aa5e503e43c63541ce383b4abfd67cc479c28014df9ace798b04160c5e4a4cc05c8c73f83b1a90cbbc8ff1cfbb2941f7978655059aa1feb7422c6f9ae5ab8929bb84e76e036f343d7ce87e6cb5a752363538c0f9500162316f87826ef0703d0507c1353745f0e7530c03410f14a65f7a363d41fb3966782ffc796ec533a02ac993d1bcc3c039ff8b8311653580f02d9220d15f1baea6791ed5606797b76e5014bf9eaf9e1bba28e8780c552f7872f6d0a68cd615daabbc081203840a25bde70934cc98dc4b406453d15817c9851b9aa635e0cd086a1c905567ef29e93778db09f1f1f9566c793c433f2261fefc8bf133355f5a4ecfeb88e633a87d160a98bfd7cc5f5f7ef12a6e5993919c2bc301583426e522ac8640c82039df28c9ef3379af5d237c2e1f0c956abb65c5f6d0db5bdfbee871eba6e95fc3e139ed66b461e7d7459e8cfbeb1b13f1eb4fafd51ab18141fec0e476feaf5069d49343bb7c897ef89a6b340ac27375f2c2bb4ece9ebd147e87fa1791a46ddf5b1010e0940f011d3c2a7553b96c8f18f9373935f63f623c9b5245814cb82808a79fdaaa5b29942a6d452ca44212df4205686240ffbd095a7d54795d4e97e7402b1879ca0ab9a0b5d47a955085d231bb98bcb5d0129a0a17cc060eab3cc8bf36843cbc57ca23ca594e4cd7d2ba1489463e0c53dc5ecc7144fd7730c45e61e4c715f0658ec37608a959a7b4bd68fb3abc3e755f280c5933246ca71de03cfcb007eea26844490ef4ccf5ef96448b047f2d4157a9ffeb839c93d2872c38c58c10fcb8df27937ce56dc385773c36ccd4d33816f28d17936dc8cce231dbfb7e4fe8ed71549ee936348722c7b0858dce14bef9164ef0010b577c03be61e0450f643a26b75bdaeb21fbcc4516f63f28b710978273217f7338bd9b37a175b8d5a65d1ac96b71b95f2d7e699f9e75badb59df7bdf30d0c4efb7d237c27a75e1e79e49152b7d0ece8bb3eeb16d37776fbfd1fe80dc71d31a10bd1747a5f184e8b6251fa3a830adf1bd361a197f43bd3a7671f99be102981ff1851d4445991448960617c96ece79ae30aed937fa0c9c7ca476c714762570016eba55ad542192a4531ac57032c818501a752a20cacfbfa485185563355c4147439734176eaea32074955addfedb65cb5b074d560e102312ece9b2e02174979e799b2cb4df775f1d4971703965ff775303f4c7c6fdc63528f44a951da3991a392448993fd8942235c737c5f929f2d8f0116ff1b60ea19f08c30a123c68757198015ad8c42489d89b26372c22de9dc2cb398d144678cc420962a409ee52b6e56a81b98dd0cd6c5b08a6e92a59b78c9cd3284cfab585d4f6c1660258a65f503f8129648bda9639290e4de5922ece7fde9add8f9242fbca723d0627a7e9ceee688c734e48742e5d97762ffe1bf2301601eb8d80f2353a6fa27389e46e3423e4f7cd7b2582c0ccac5e08942907fac940bbe7e657bf72b1babed70b3d5dcffca8fbd63fb63aff1e87a1ed9a995df7ef4d14a7767d494c970c1650a6f194f676fd02fff9bc693f1ddc349589a4e17f8c0ab4bdda50df2062de1574dd71227444257514e5aab6816d799a6544942f85049938958923e58f6f3b192f8285168848fd63ecef85ab6012b9cea2494b1da6c186031e928bfa6e603c21c95b2924bc2b03c007ee7eb516954d11896072d946fee4a599f8ad999bb23db778d60ea5682d035f30c9522455be45cb828b9488a9b9df73c00e87a03292580eb38601d6799c701eb30c5809500d2f194ece79aa4d58e3c122537458e018bf2a80780c57300ac423de769a8f52940884f29d2299447743cf9b2ae6b05be002fc320f32c605383c28a1b15565d28d0ea678bd6d919f379a6e54209d0e00bc849afcdbcd77791bc5f12f54eea9a24847be6fd710ec273a1d1e438609190e3d7e2b3b473cdc5a08380adf232135289805f8289ad51c7bffaf899f04ef83150befa31a5b5d2063154c50bd9ec40e0d653359f0ca3d99566a3d22d160adf180fc75f2f07d9c94abd199d5d69f7def39e37efea5efc0b798d088fe7d4c8238f3c5fea9507cdd1fea0dceb8e72cb20b7ae5fd6378cc2f19be6f3cc9ba2a5bb5b1f4d7d365f54fd784ba60b3ef17de843a1a5865f7422b569ee36e7b9810f1f1f1fabffe0502c3e3424f99887a391b510f2a1922c8a3afea0113e58df841d873a681ba0a2db4d6212d6db2d03ac5221b0730cb0b0f1540ffb56f96295509ae3295188ac6e067f072c112545757db90c01ec276e6869bd911fbbf560e4ce144732155159a9fc94d637421bc5e878202ad30086678562b04e39caf3e580a503525a6f02d26247b84152a7241d072cce3b7e8c7c8e3fd70c3db5b9571db302553ebe2adf00a1672586c570353cb339a0c49dc2508c05fb7acaead51a7d35731614dacfb5dd5e61dd75f36bdaaeebe0d8ce660ed5a5bd27dd1380a5e43d537c079ed55939aa337208364afedefdfdf8d65eb13d09f7618d26af00585c63d7732d4023b0a21b166620c0bc303f1fc903164c8fef8692380e0be31cfb36f82e986b527914f48df2c8f89805667ce083a55e672997190b881fd3ce2b956210362aa55ebd51797cbecc7ebd5c291e9c3f7369104ccef7dffad68caffc2916ff364eb8c0a406d766f56239774fb89cbf490070a13f0a4be370da10c3b877124def99ce968d452e57b5d7ae0fe550d175bdfdda9b42d2dccfa7aa8f5cfb30f1b4db332c032c7ec1bd721d072c3e563ee8c160e8c602203ed424250a9d7cb0fc92722d1f2cd725210b7cecd423012c4669c019ce390016fe1bcb475fa43ec2c3fa274a43de5ccf07cd841398799e6f787dd72dd9dbe485e61869333b716db1ab33e5d0ad97a7ae2d53b1487c166c440a6be6a4cab467c3b76fcf287e4ee4a832b837127548caa7bee80a6c28b9e7e4d8f16dce4392ed249fc3e70a6051591db31b50b933d8950196d8e884804f8116cf5eef4db948b9fdbb659df7c6b58c1f16e66aae976f1a60ed67db6e98adcb142cbb82982467277e497b9ebacc9e1a75549df90612c0a29ed4d11a50e2f34908f743dd788f083f58bcc704b092fb47b8863ca82b08c38f2153fcc390f8fa168095f2b367438d649602588760643e39eae4fda6d902ee03be2b3f6c90c59bf11ee2f272040a675c4f79cf0afae52a1572e34aa5f8643e577c2e28065b9d66e599fc32fff5d9bc7835acf707a7b97b907f1b275400aa6bbbbbb5e2d4dd331a65dfa45f9bb7a8ca6f8ca6d3f393280ac2e922335b2c8bfa78ab7cc00b7d243ea4c0df98ffe0c88917ab172d45a3199c179d38daed884c035276692fde14ea9500ab3f18087cc68760c5077b5ca1298f8fd24c05ada308b02b002b518886002b00b0f4f1f151ff87008bfc6dbfae3510d079001611d5892c6c5bf7a584e4a584806f4106713d98bb4e71e636f291ebe4a6ae260329c8843a4b0a2325b31fea970196458ceb8ce439503e825226a065e675bc8fbabd1cb05e9e0c088e3dd70523eaf12fb90d5d4f6ba999cf6386331e9b7fca7772561e38a779b7d9bc2939a65e2f577513ccc06c43dada94495876118d0a9627cfc38f290623a57c131d03a8e6ba474097f742e29e92e7cdb9c93db324718e81a91292bcff5703ac240fbe49ee19c0626453004b0fcf9eb3de9ab56e525fce4f000b7f9cf50e980a1c75ac586148225d8bcf4d62dfa3928ad4e1a5de279681afaf2aa132f0cf6507857c1009e8c69552fe59fd907e4d2cefab2aff9bb5ecec46bd5d9adcb5ba2ad6f5d653c5bae2bb3c39f2e8a3d72abbe14eedcacdbd20935fdcd50fc3d787e1e44dd134f790beaf8baa72531f5c29f141d947cc87a16bf91079b1c44fc15e4cf800f005f022337933a5fcd0be7cb4a6ff7c61fca7174d3f3014d57f64249e907d200215006b381c1d7eac8cbae0fd5f1ed8c8c65377ff61d12d652c80e31a5ab2f828ebad960d140760f1cb4fde284e025854e0e580c5758740c13daa52740e36b6a0f38d65e9395860a8eea73a1f5bf79d19fe3a9d57cacc5c273f736bc58558d7d2ad157ae6d54161327a3659e5ab4ae85a800833444be563cf52f7c28f006275e0596a6985b20f70e3396adf7180e2c1f975ce5239ba0700da4ff8aaba8224f68f3f9d246032ff95007ea2340f87e20b630b5b881602a14cc1cdb381eea7a4a2f3169e70ad78c68d5dc9f55dd98d94b82326ea28ca142ce8c76792afaadc84bd78600100fdc4afba8f18a8ecb9ea18ec9b77cf7d1f028084f504b0c60253ee87f74f784a0258247b2e123305e3f7b7a47c330999508367c919ba5fcad392d158cdece37c1d611f801545a13d0ff69504587c575801e44b7d096de11be6f917ecfef8268043e5c07ede479c673ebb181672995e319f7bba90734fd4cbc51bcd46e58adec3b79eb97e706db39c9bbcf7c1bb4e0578d9e3bbddf2e28b2f969fba3ea8cc0ff6728b4ae575bdf1f8f53bfdd1c6289c5e1c85f3d747b3e985e93cd3d21be0274dc26b4d94810fc33e017b49f64ba5944c60c0115a807cd0a66fc236938617aa75033daed53a2f9d0f8aebe85f5608f8c0f8407c58c3603072fdfed0802ce90f781c54a0ea05993a944ddd68751a8f26aedbed591daad59aabd6fdc75738f66b696698aeb58f969b8997a4e47e105f77ce27262c39c6b388ef5fc729b7c41859523e41a42058f7a39d8c075511ae9694f06b55c4be4ab9a5ab6467ae02eb5a4c5c6e1eba0c0e6e290c486e20a37ba14182e76c208f92ab7caa4959bc87a45c9fd8c332fec190bcfc5e585f081854807fe6fca828dfa9d855381ec92414bb0a072e339bb8281318188db3b5c314654a365efb6ea1e9a62a67b2d0bd0ae579fff925315653419a7e6472655ea6ca5099aa07f50778185bde4c4d2dadd287a27aea7926ef937b4c24012c18363f808015df806a6ff78c2480755c98d496fccca4d373245cc467ebafe15dda73e339eabb642f41b2fcd0511e0d33e56a45ac5d3fa0ba9efa19ebd4391e68f503a6ba52599eabe5a94cfc3bf1891f224ad06fc42810e3aa958b9372b97859e73cdeed8faf36f2992b7775cadf080bd36782b5b5f0249b8cc75ec9ed91cf7dee73e5e699336f7ce2d91b6f1d8fa3ce6cb9b8773c09df389cced7c6d1b218ce963531a1227cc2bf625ec8d1cb485e124b7b39b124a607293997178cf0611d4ff68b445ec4654900013e90a0e85b6f3c604502ab911b28f131d76a35fb954dea40397cc841d19b84b44a52de7814badddd3dfbe0dbed1581966f1d4cea65e5c74bf279a5447908ebe6bf5039c976722cb9c73f8d54b2912b8b6955959a858545c857b3a1802e3466929f457e4aac5879a9affd7a2b7f000b1f4c7611fa32951fff7bdf171b493d8c07fa7b503ede543fba274c5f0b4ad5ba2e167888558cbdffca7c58024de9a50bc5a88619cc3e5afd1a5a17686564fac196339e1925cfd097eb9f8b5f7ae6cb7ede0589f7c0926b507a2a9d8068727df2ddf81f039f2fd70020c3e1d0f2e0ddf30d0058891caf43b2e447cfe7e5995bb28ef87a7af0c74541830e97d1b831d00f236c8e72ea0d7ee47c3e48722f24ca314be09824f520719f1460db5a07dccafaae4b417ea41f9e919e7598994e5e6c95b25f6db7da5f6c379b4f4cc2e9b7cb67abe393085cfecdde26f9c4238f945673b537cee7939fb9b11ffde4643c591d8551309dce9a0be890f92bf8e5b4d76aebc75f4622c907cabe649d8fe2e51f091f1ae71c7db0be19fb4f0d58bda1811679f1b1f22b9b9449190009ac1de6a55cac1c006b6767d7ca02b0eab5f2619d10ca4f12f9bc527ae907ce7dfbfadaea31f1c78f94e5d564aae749f33e03fe957330afb9251f1621d6a5a71d28590800cf021359899f0c6bb820f66b21938d7bd73e1812a043b2b7a4fdf6abaf2d0f56dc874041eb764ffa63d66696105cea13e9bff1448c34246854e6f7a2e0ba99aab89fcc3fd566ec8a02aa922df153c1207302d8f8960f855b3f7a0e9e75f1ec8fb70426cf0790b53abe2c93e3df8c54decee73a006b3018585ebc63be811cdf68925fbc4c846d3f128407c424cf64e9df2bef1d60f180c592a1a6fbbd81238c8611691b02aca44e087549be61ca48f627c2bee38987949889fcf854f45dd36219861337d4fdc80c0fcbb9ccc1ca6afbc576a3fea54aa1f0e5d64ae39b9571f6f1bbeeaa8727c9547cd9ebfede0840d5bf762d28d736df14cea67f4134fb83a345f93e81428197852242a579b8d410aabcd007eabd362f7d21c7959494bc3cd611b6613cfc0ab18f9796bcf0e4034e5e3cad35c8ab01560fc05222cfe380957c7c001611e6fc2af2ebcebd60122680d5e9ac0ab0e8bbe63f5a84b20fcb979842bf4af2c7394ff7ca9f29dc9124e7fc872494e2e3ef8245e5885092c9c0b4612466aec1742ce2c8d57ea29718192250ca6b9f055d6a5f293bd5aba10140cf5cdbc992f826de1441900840c533f4f790b02ce52f96a7d30cacc6b38c1b6b73102ddd281430cc96ee605976bb6255c01a63b2134785f947b2390d95776080f5d2e7c323413911bd5a7bbf000c2979d7883f5fd7f1814992e78ff06e7c3288b6635c0b60f5fb7d6b29e49ba2137b81c96b8fc9f17c10fc57144579c977c2b798a423c0621410be4701b79866afdb3300abea3b03b0926bc927f97693b2d87f5cd84f4abeab841debbf787c7a01fe7caa6fb9eb0e0e0e6c5cb072a9e25acd7ad4a814778bd9c58d5290fd62b352fee2c5bbce3d369d878fdf553f19c0e5dfd6f740f4c0b27ff4472ebbbdfd4725d7ce3ff8ec0b575f379a2d7e481fe2bb33b9fc1db32cb1d9be42be473beb3c783d741ebc3e7600257919f6025e26ec4b5e1e2f8b17cb361f17bf887c84ec4f8ef1d249c93e5811b97e37c0ea7507f6a1d5eb7557d6af1f65261f23e779c02a699f944b4a321c8ccd24a4bcd5d5f54393f0783dc98325f9240979a56d3e70ff9127af8ea57f16fe1e92f35e5de8a2824316810d192b520263a412ba5efbc94ba61f6cca8399cc6c2d01258469e4815cf615a4700531339639b136f2811b5335ea62e6e02168f954cac8da50d974c41ecfb296865396625bf38c1bba821be44af1ade97db3e059f1e76fd77c73c9bdb24c9e23cf9a75024f612c6cb33f79d647a26be34df627c7f84e0c50b4b4df48edc7e7450b66af2720c1b7a46faa52a9ba6250b46b5e4df0592585f0ce93ef31f911a5f184679f302bbe477ca507fb5dab77a3d174b5ba1ff21ad64a4eec4fee11499e4122c9bd90ecbbd2759cc17d958ad2036d8c867d7d973b2a67df2db281ab77d65cb35675255a6fa7e359de4d77b57d6b73a3f3f972b1fc270f9c5b7bec5b5f7df1b1fbeeab470f3ffcb0ded2ed9197dee99f91e8c1657fe777be5caa6f96ee7bf6caf30f0dc7d377ef0c463fd49fcc3acb5cb05a2895b3f32541983917d01a620f988f4bcaa1876ec065fffb8f3249c7e5e51f6ef29122c907e84d352fc9079cfcf2faf37d497f1ac06a369bdf15b0a81ebfc4096021ebeb9b62653e9c813a21493d92fb21afe329d997883d133d1bfff1037cfed8d13dc3323d18be9a30409d729706c5bffaf663403e3e3192a735b7d37d47a0650c8ae70250d292a8aaceb2b47fc4ac2a590aac58576d8c69596ebc4be5fd12b350fbf30ec0c2d4c7612ef550a235100685031d66b5a05a9c64cf187647ded4c12ed51ae123fede493cc7a3770963f1bebe970bc710cbceb2f7d726ef807703a0b0e4d120e49900164bbe812a80a5777d5c8ebf2b24b99ebcfd3bf3806580a864c1a4c6b068319c1b68f5640eeeefeddb35ad565b2cab7c782dfb92fb639df2926552cecb130f896b69d52e0605378b42e5bf23e6bf2de0d24f43b9e6ea2bebae52624e4bbd23e2f5642d1483dcbc5e2def940bc1d64aadf4b9703affecf90be7befacd87dff6c4edea02f4d2a7fb67207a600656ad8bf51fdc3d38f88bd76e6e7f681ccd56e7f9607da6cf764cec8d5e52465f279f320a484acc077b515a1e6ff5387c11c784f39297f74ae7708c0f2579f1c9b9c7cd8564aebd57032ccc41408b56c086008b5622ce272f12e715828c99844c3dc5878d937e4f1f1f1fffe6e6595d7be4cb40920f2f51a2a46e48b2449275639c9865f17d1c3fffb8d27d37c91068682bfa5ff7a7150300d12e5f974c5e60207812bb82ddc2c2ec34958bd94b113307f87395ea1d9f63ad51b6e49978b048ea474a9816b260b404fe0c7479ce824418b4cac5f744bec016e26ba73c6d8bfcd9a97a12bfafb2b8ef04a848c93e9afe91c33a683df98e90c487c5b9494200120f58869826b4ce4ec4ac002c62eb3c60d1520c9b8e4f9224eb87fb544fcab3f295a88b072a6f76d2e119d03a0e58dd839e7d339cdf5959d50fa35891aed30ecb2b012ccb3ede775c92fb6769c7740e6532a411bad4efeebb5b37afbb6ef7c0b69bed8eab091879ae7cefdc37c4c1f490acf5114c47c3ed62a170e3dcc6eabfbaf7ae8bbff1333ffad6c755f6f71cb462fcffb393ab57af16cfdf597bddf5ddeecff646d15fcc15cbaf6b7456d7db42f4ba941e1bbd5eafb956ade4ca4c1e27749f4613bd146f2edb0b5162f9a74989f031f0d1c1aa78594862fe71ded10773d48aa3d2ecbc57151db6329478d15c733c25f926eb48f261b18fa6ed44389ea4448eafbf5c8e3e4a7f4df251261f2692dccff1bc5f29c94eb1f820e34caa1ea11d288c29b3f2218036bf94d963e1016258b025aaa6ff8011ee88633925463df07b8018c228726e2ec00bc556491361c6e1ba4e4bb64762d44357b4596ce6022cbacee0e42f6480c2c8822103dd0bdd51720c01a3e4988e9f382c66c2d132b99fe4591c3da3e4797b1673f83ee2f39394bcab64f9f2c48fe6a1bcec5a52b2cf1ffecee3a4573a86bc529d93e3ec613feb666d704d7c8cab93f39294c8cbd7936dae4af201ec68e9ec76bb6e3c1ad9bd17f5e3ccbbc49f999789ca778a0b26d40ff8018d468349766730dfb8b6db7fc3959b3b3fbb7fd0ffd9af3c7df97ed5f1cf1c3f5e2e471af46720bff77b4f17bbcbe11bf7fae3bfb437997d449ff6dd59d9fc8c83eebb44e857566fa714109dcc2fa314504be27c6028bc4b3e1aff411dbd8c5792e32f08f11fdc4bf711871367aa5f761d57629d8fc37f245ef110fba589f3c0e9ef7d18914d8e8a5f8268750240610cfe6a65a575300925c379ca07399e84d69da752adb862b962cee8a46e562ef5e15aea14a764fbf8b144583dbeed25b9ce2f29f7683bf9a6c82f063e1db3ac39a6e4d9acafd351de5e61b4d79e93edf7979a601afa4ce27bb0750ef873488766607c91fd6fa79137316ef865f4c3a125af97e387e76abf4dee61bfa9de77631dd895004d7b76fa4e005ad6fd753e1d5f47d84e926dc7fbfc61f6273bed803f37ae10df01ef8b3250767ef430f539a7140f11e42ff4423dcdec4df2507d8f9e837f166c7b216f9fbf177e34e6c6e00869a053343eac40fa6147558784215afee4a56b8fdeb7178e23ec437768e58531e1939b08a4ae5fbfee7661fdf9c0d51b2d572c55f40e72faa64b96a83375e8f7076e301c38e6912ce8c7651e46fa455a7416b3d999f170b47cecdbcfedbcf1817fb1f3e94f7f2c7ef97ff6f2670658c457e5ebf937ee8dc6ffd1c130fae9792eb81bd4961e5be01b2f5f4fd63e473d71a1b9d88f56f5ac4cd96921e1e3408e834ff2729397961c439273926de4f8cb4b824593edc37395d8ef01cb1f275ff311a9ce280503d6013e980544b707c54080e503473d33f1bf4cf016981df49e7d4322b7755dadd9d00722c6a773fc07eceb78bc3ebecce4e33d92e45cc4af27db493e7e3b594f9e4da224c9717f8fb666dbfe9c57aa8baee3de65a6f9252d5dfe3c33ebb4d423512e2a2bbece5f7b9492f3fc3547f5f36b02751449f95ab7193b177f91370b6d9c321dd3ce4305f56c841f013d57804ae637fbbc1cdd0775f7b7e1819b6b8f8e25a54bb4ee4fd3be24d9b65f20e04dc2c0c98b6f9684a98f54f52344606d720def1bb1b2e2ef3279d7dc63928ed7c3be5f7bc6acf32c13c0620ecbc0b59a6d972f78c0b4d0047f733e4f5d404a008b94bc0b12c78c41c9ec0cb464dfc1fe81bb7aedbabee5c8359a2dd7903958a93404bef40a109fd6773b1a4d2c7c832e52f359c42fbdcb615debd86c1a6687c3c1eafec1ee99308ab2ff9fe6deb5c7922439d3f3bcdfb332b36eddd5dd33ddd3333d33e4524bce90dc5dad5624014124c115296257faa42f82a0bfa0ff227d15080882042ca105979216ea1d4210464003c48a8230ab194e4f77577755e5fd7632f35c3253f698c57bc24e649c9359971eed5b651911eee6e6e6e6ee16ee1e1e711ebefb8b833ff983ff6af79ffff3ffa6bedb7f8df85a1c16ceeae87af1d74f3addffe4e4e2f24f6c4cf2215f16084346c57a83378a06698ad8b0144700fcf5099bcbe3b800e9a814bf5b9833a06268388413961bc02458360e55ae4808fd824b95cd51f93352e2cba1e8c03a95eb62f1c6e072b85bb22d8046ce08929162e70c87c5086ba5cccfb1a839eab000f2b33e390ee8ba190ec6c5719de3542e904792422e3bfcb26b1b81ac33c8f190e215a7ce25bbf2226f3c34a8ed9cd30a9c63fb4caa7bf167282d47f1285ff10fd3f9b10e77d891fa511a7483a4073751b637c0cf1a2665c8902c28f2343949de689c9d7b1e5c0751379d0e5ff860617fbeacafadbbefa6542a93f2910cf4e208da786873acbbb24bffc5f676393838f6fd612ce8338263af17a9bb3d36c69e59de673efbf15f0f32f2f71a2fb9ee95fe2537ed733e04f0e0e8f8e4f169e77c73a7f374e60f7ff7efffec473ffad1d7eeb4b8fdbe51fceb7ffd7ca537b3faeba717bdff74ffa2fb1f9d5f96f72fdd73f33a8435366f74b541fd4e44a59941b5e6e44f33cc21708ec1a9001a29437188734038950572631847f040400d5fe97527951c90d371f4fc680cc4db7f6b1afe8ff39842043f50c3818064dd8584e635d0b58e929ff36ba6cb617538e9da49239926112e520783625f19b6bd79adf32661d3a6bd731972fd38a53851b38c90405cce23530ea3ede5b84944ba511bdeacd71c06c226919e301d45d25bf2150fc4731bdaf81406717300c727c7656f6fcfeb1247a8b735b033fbcb18d9f10e230e999b2c47fa2da257d617cbfafdb572ffad07e5e13b6fd9f98332bbb4faedcbe9f93f9e5fbef75f3ef9de6ffff0bffee493c8e86bc41b75583ffef14fd78ffbbbbf713ae8fd93b3fed51ff5aea73e1cd878d71f5d5fe2746884382d1668cd0adc6167701473de28018ec3bf796e2312b60de0c454e1188f05439c16950ba951371b421b490ee73412d2a99113de6c903a1779e3b27f724eea449c07d5699c3711200f90653649689ee7eb269af9883787e73839967184d36a3aa84cc48b97ac4439ccdf9dabc8bf8f3f7454119f21fda80fea33d3b08e92feead882d23b5f82ea9a63a691b0667cbaf69ba95d376528ec2ee4d3c0096904ce9961e865fa1b69125f0ed3b9e27494aec8a24fd177d8247a624e8b27e01b1b1bdec748c1eb56f4295e3a6784a5af8b3070b87fff7e79f2e44979f79bef96c74f1e97078f1f96076f3d2e8fdf7db73c7ae7bd998d876fbdbdbc71ff8767ddfe3f9dff62ff573ffef8e35870fb9af0c61cd64f7ffad3f5f3998b1f1c9d5ffcc727e7833fe85f4fbd7f3d3d3743f3e6db3e1cf94c48104e8bd18a05322437a3d230218c1d53aefa7b538023ec18966d08f011c6f1aea486a0c6a04ee20dddae73b8886b300c33a587533abb86381ffeabf80957992427f8463b1814ec710492a134423e6fa24dde388a69d024229fa0b6f858d3ba199e89bb3ac48bd331f5a31e6bb9e821fb88b2a3a2c364a705d02b77c4367b201710f775526dcbb87ed93c059da136e7940b07e32f3a1b9fe5120c8d748eea3acbe4281b2187be04b8d19f1c9f783e6c7a5e5b5ff338fa92f729b3f7a9f1c087bde179f4f87179ebadb7ca83870fbd2f9203bbf17b83cb32858e36b098595820a3870727c77f787472faa72f7ae57b7ff1177f317937ed6be08d38acbffef4d38dddd3c10f7a97577f727ad1fffdd3eee0db039e50dbdd94bd39577c05c01aac55af35c02b5fdfe18df9786bde1aab37b2ba3268f0541c8d5d0d33370e1a3146262c3b19c54f22bf8b55150aa81c6f7c76148f5f27021c9d173eff476010573831407a423c2aa51f27bb4942c8a9d1bc1672ba2c4784ce2285016c8c9ea2ec6c6e1036ae48cecad37999e089b265596423c21823d7c6c331eb26fd269d67fd419d2f7273d9ea701d337258337e344ec790a738e505e5b826799b18153f9236a78fd12b37c3f8d208ce26c2ebf202f143ba16386f3a2b1c0d2f96b37f8c291ed3c0cdcdadb2b8b0e8363dbf38f72d0e4c09715ef06f6d6d85a3b2d1954f19adbf5e74baa57731606a54e6a6ab37476ce4ccc7152fbae7d3e7ddfe47cf9fedfce9f3afb6fff8d3d3d3cd4aa5378ed7765836275ebfec747fe3a4dbfdc7a7e7bddf3feb5f7ea777591662919d5dd0be33c79d0f0d9eef51e1a858bce64920bf8ec275763cfce31ca36318cdb371168471ce530ce6dc4a1373edba32c7917699730ed429a08cba83a44656f1b82cef74118ea49c87a38a73cf5581b8a1ac06011d87322ae8ba199e91658872d914d6e469a7519ef0be156554d7c11fe78034cd119274781928ff5c0e4872ef82b63cefaa076ce26dab832ca7b58efc3c5d37407af821ce751d53e8ea466d237ae721811d33081774ce91bea4911a4e8b9b3b0e0bdb3115dcdcdcb01bf7b487d38778019ad78d7888f0e8d1a3f2f8f123776cc8210d75d93bb7faec9b2ed776c3e72645d1bd3eac7ecb804f8ecfedee1d7cefe9d32f7e6f70dcfb55de177685de305edb617d7a78f8cdfd8bee1f1d9c777fbfd3ef7fcbcab4e05fbf34e35358af52eeb8ac5a994dc3aeb1af0983b1c7038a7d57a8c313192a9074c5dfd9622d6bc1869ffeab262613c7c7a220736ddf5b8544f2aad65702c85347c9e1016f0c55238127f8eac54fae339cc7e273c3d03920adc3c2fc87214c0e61742c86f77c50d07f7bcf8e391dfc7e9dc3842a0cc94e551e23e927403a8a40c808fb5a69e268e4f565145375b30bff3c8ce9bb3908239e1af993a3ca16f67f28c76526b20c3d6c842c4c790a9c7ade4399e41ce189cd310c6fe321bf445e5e91c1d3b4cabe1912b819a6b6916f78ba01120709439bc36644ce917b5cbb396c06e236f6b647046d0379f19605bbe02f79db804893e54b11c6354ce3e9e249b9daab74200c6745f8b139a4cef945595d5ff79df33ce0c209f1b5065ecda13e5757d7ca7d8b7bf0e0813fd12623eabac7575f07b104c3e0618e7d5aa69fcda62cdca686d62e78799ea78a07274773dbfb47dfdf3feefcfef4f1e0fb5fc7d4f0b51cd64f7ef293b583cef9af1d757bffa833b091d5555930abe29fac80d6f8cd98fca4396fdbfb7b69e6a87884cb06363aafbf8ec0d4904f8af0a30336e2bc360f8ee362615edb1a705a787cee187e6d470cc836039c1e958981f1f6340d2e81375033a686db5ef10d108653a1023947aecffb2b5ec9d25d9d06a1c628ca305feb9d9b9f7bf74e6869f80182b969364ac6ddcfd354744356a2e17585702404dd4c2702b99ccd702733961c07eb884e666aae9d22a11dc379d1a0fd8377226e1c3c4471e756a719a637f2352bbf51e1c0b1099d2c0879ce9f74725b115e5d4343a07f550e27d950c87115e530ce955f86c719725e15fb10e2e148dd69d422c710d3e4705a4dbd38f7cb0679b8f713b38d69854db949c7f7bb62298459c5ec1c6d886f6461c5ca1955f2b195dbd1e2c85b234e6f5f76444f8869e0fee15199329db71e3e2ccbd68f58433e3b3f2b27a72776e33fb7c1c07cd9b469e0dadaba0f0c9047dde3b0d87778618e6d7ac646224b0b65de466165cea699e63ad0fd6a60038ed3e3727e76ea9baa2f2eaf1f1f9f75ff83cec5c51f1ccdaedf77a5de205ed961e1ac76fafd1f9e9d9effcef945ef7d6b870bd100239ea1acdf39ad22bcd19a91683218940aa742e6ace0541ec6d69bea6ab44095afeb75bb43f8930daf703edf12df4cf74ab2b03a1d154703a311840cf2ce724993d3a103477400feabcc06a591c3f2bc87326b285c711c3dad119b233ddccefd58f10ca1f866b841f23208cbd404f9be0cd51895474c1b3f24075353332caea36e6313307764c22c79754c329557751ca251be49e57e5d486496ad36029af9a2a7c29caaf0360cd3c2c421a551ca28360f87e414e91bb15c922978938d0c399eb64b7a7898855cf4babee78a519465eab667cd8ab52b36406f6df282f58a4f455d2793415db1178cf5ab70d24636c2423e6f7ea02c37605f1fabd6c0d8186d34db1d5c7df7e0e0f877fa67e7bff6c9279f98877b73786587753c98fef0ec7cf0479df3ee3fecf6065b0c2db021a43ba9cfc41c512100836000ad4de1cdc1f069851d31287c18872386a7e133c7667ae89562c605dc41e047a6e53ea4482fa70567dd39249bbc39124687e248fee4857ef0a96345b8393384a938760e8f53728e3a2a3ff874fd75403ae81c4cca4b7a8987a36440b259330c5b795c552f82ce9b61391c8af4314a01b26d46d6ad99fe6591d3e5f4c3f32abe2d8e631e11eba878e928885f3c92985846d20b0acb65c63ed94684a9ad42194aebb3968ac7a76ee6b068c73cf59bb78101377bb60b11cf720ace8ab42cb06f6c6e58bfa22fd217e226c3fa32fd9151dff2f2aac963f26436a06fa193f1f02b47fc92d4e1d1b14f39e7e64dfeac8dbeaeaf972decfba72747bff7c5f6d1db95aa6f04afe4b03efeebbfde383e3ffde169a7fb8fbabdeb0faeaea767fd1d2f735043b28a72a7e5151115eea86a10e3aa6238c76160200883914e15846105a5c3d9413812465984051bf2a97823ef643408c203c82500b9aa6040c3205ff4e018f2c2614172a4ae0f69249403e746b5d392938d0ea9727cdd909d38ba9ee8d442196e8f84cc87ed98c20761affa18f151ae3692dc663d43a4253e531ba48790cf5f064ad794c5951f5f820474a63d8ce89ef986bc557c75dd944338d7591e36d2b49330a5517b8580f2f634665fc2e1c16171ae0da0f7cc59210f19b4ed8383033fb2c70a5a5c64b643ddc4882e3690f6ed7ad61cd9b2c5f30ad282e962f9593abe7dc62f1a1d999cfdbdfd627ec0977d66fc3d619b994ccf313d7c7c787cf2c3cff7f61fbb926f082fdd8bfe779b0a4e5f4dffe0f4bcf70fcf7a830f4c511bf2cd7a61868be5508c1a6df8188e4b95a48a81802a8778c2700c720e40954583c799905ece8a11177c3c01f1fd51c38a0c229d2a98ce475aaf6423e27203c87a910f61f000aed189a4bef9913b0d71a9dd092edf0c10f2c2f1920ff426a02cc9bf490aafcbdc4e991fa023341a1ee518057141397d1b74d3814fe5276fc2149791afb52e247d442f8b9cae7914c4338eda7886a87456b8db37c72710da262373d3f6b00372e813b479859326db916b786537c541ea2b381ed2faab37c6cf600067c5a88b1117ce6ad9e298ad586b75eaf67898157bb19696567c74c5c66e3e9ec92ffcf08b3e364f2c179dd3b2bfb36323b5134b3555e61697cc612dfa8fbeced868ec7a7a6ee1e4ece2c9e0a2fbde9b7c62f8d20e6beafcfcc34eb7fb879d8bfe6f770765835fdde5b322fc74961bcf9c5654038d132714230d5506e6e5188db6ae08ee0a1c89c3d8c4930610462509e2c76171d413436d4e74358cac69987c2a38362f0aae871179e77d59e4c991a72f6a24404e94c648dece6fe71e1b0572925c88f4d29f3490e4bd2ec6c951783eb611fa730459e721599d516f35d16986c5bc339af902e5d10c135417d231f365e434b741e9f3b149cdf02a60984f8e1bc6270cc38de4b4b28e39ed90d7907938cf6d46a3acb8598ede6405c2b956fb52bcfa840603004785c3a2cf3c7cf8d097575867e6663e60f1bc7be1e9e87fa45bb6d1d59c8fac6ce455d5ff65bf573a369d3cdadb2d9d931397bbb0b054165756cbecbc393f3b9f62d3b039adfe65d9ec0f063fb8fcf2cd8db25eca61fde4273b6bfda9a91f9c5d9cff6e7730f860705de6f926f7c04e7c5b82db9aca30b11869e8b0ea3522818ad153400cccfc1a43021c879c961c979c09c6470e15431aee14dc5158f4ab1d963a5f34144f57392cc291275db4ee000fe1c8f52763969fc26930e8c3f9acc9d16767f837cccbca191dbd72cc469c7b1ec6af06f5daa8644c92a5b20d75ab4861ae7b45c208af5fd77413b5cd209d6b640451278a6b83e220e50bb8c6be395ee1af833639cdf32601e9056ec4573cc2b87061189f90cbced19f041bc986b41bda9fdaa31c12e7ce6f6d8c6b85a99d31bac2f93013410e32e823809115fd8638d221a36f0e8b9115d3489c957faf9e9192a916038ee873ac5bedbd7851f6b65ff88d9da7f72b2b6b657ec1060f36cae253353c68e31352267cab7376f1c3e3cec977f95164cffc35f1520eeb78b0f7bd934eef1f9cf5afcc594d2d3314e41780f9f48a0f283136cddd0c16eb395525d8d488a70ee1a0a2d264700860248db2dc805525710ec96101ce01bc1816a3f168d8c3bdbd986cfe55b25d11037712e0db1cd0d34018249d9a7920035dbc61587e5a2b805718e663e014870dbfef53313ea6912025792390ce3a17b25d851c06a7d2e6749361bcfa6769b0c10d6a844bb6ea1002395fe935d4ad92a17890cf2721cb9d04f188bf2d5dbe76cdb886af2a5b0491ae9603a7cee3ba1de3e23d2cd942ce49377b081ec2398ff65ecb92dde1c761118f5322de9f16b29e75ef9eefb5a2bfe1c8e873fce02f6d9ccddcf0c6c3ad653ff7bc69fb76ce169de3e393b2bfbf5fce8d776979c5e46d96651b5df94ff1574f124d4b9f753137ec0e2ebf7d3198fa07db3fdf7de24abe26c2f27700a3abc3f38b1f1e75babf717e39b576351d8ffd6d22e59f54312b962bebf8367ab48195a96c61d37c607f9a466a8ee7d28695ecec371b6bcf891a26c6778760d7189223c696d302f0c1a3ca54055279189885c3cef9993b4d391577a246ce6bff30a80593dac975644dca1791d13774f1cab1bc5461ccfda9349ec4483fd12848cf0861ae0c6c3cdcebd62f696b8f9873995c1132383691c34678abb00cf1ca26c26d720157a221dc3c16d2a058a384ecb2ca2be797219df33924bb910e1b53bf9ce7b87168ca1172da4ce215742dfe663c68968b78cee1d751330138eabc222d5018501e4d994354f1504ea7bc7c74646d103e9761716c5ba09d331a62342ad0369183b382787999d77c980af266487c52862782f15373c8c3fefeb689cd9298c6b1f5811fd7a02ff00ef0f565dffa38f57365d3c9fdf26c67b79c5b975ed97a58d61f3c2acb6bf7ca920d1af8c820aa301898463febdfd7d366a7e9a5c7dd41f9773b9dd38f3e7e036b5975696f41a7b7fb910def7eebbcd7ff46ef6a6a1e85e8f11486dfae9bb28e0f596fb7602ac0a3cd30dc11b8a6d3b21ec4682b1c8f2a0760381a307bb3704054148e42db16a808392c8c0df23577128d843cff243baa998614ba45efa412220c3d3c5c20c280ec8135168830ed6f21bfdcc804aee9d88cb0184d42c487c3c271871e82643449688b8384e675461b3f50988f86aaf3218f95d769c48d89129cadeed8a28c9cafe76776703b57e1aa6fa5130fc771f29a342e5c24b4c535a90d1e5ec5a99e09f33d7a298d46e88043b429c22a191572990877aaae81c200bcb9ed708d9302f070cdc651b573da3fbcd89591140e8b1deba4e197c7e91bab361252df122f23afbe392ccbadacaead97b5f57b1e4f9be7238996b939ae5e39d8df2b3bbb3be5f4ecbccc2dad948dfb8fcaeabd8d326fce8fcda63c65e413d7340ed23325f48f31cecc2f7607571f5d5e0efede49aff7da5b1ceade36013fd9b1d1d545e70767e7e73fb069ce3d5fabb1cee886331a5cc590351b3c3a680c6bb923a9c231044e48db17e8dc1490786440f0eb2e80a1e1255d330ff1734d7a1a4984a15bdd90323f060504299cb4fea4a49217b2d0a7ee58e8c81d4b954d7c384604b9982190a1f24bd69b8697c4cb532397b50d8a135f933febdde469d25d20795926205c76056d366a96edeb007934f399543ec2a56b1b8fc22443d7e3f269ca19f2a4f4ca0f7b41407cb443f1e1b008a7bfe084e82fbc61c139443ca32bedc502f42b9f3a5a3d104f9fe386ecfa5a1f472e72780acf679591b3b4b458ee6ddcf36518bea842bff19fdf97be768e5efeb3fc764d1d5ff6078ffa17ddbfb7bd73f89e67fc1ab8534f3ad93ff9fef169f7b7cecf7bef5c5d4fcd9b096da8685edf9461fae7ef9859c1584742413faf085000757240384e0bc2b91087c12830ef2461747809c341c869e5860fb961abca9373421e154b386156bd160e51d1a48feb4084c3c77b5b0279a313f1e88a2c9ca8ebc3088b1dc15492f1b92e94ab6a775ca327c4b9cacd791ba4ff5d01b7a749e9da64bb5e89049d2b5faed14f3a2a5ee7af43e401610be5a76b1118dad1e8ff2f64bd75dd04613cd899549f93906d2eb23f1e26c04388c7532f55fba10fc861a96d697942f6231c3ea67fb455d6a6f80696498d4fca189106c087b3e2a8010232867dc7da378e0c59fb36ba3a3bef58db9ff14da65b5b9b6565c50614be799bfa240d52a34cfaa6177ad1e7fa83fef2f1e9c9378f0e0edefee4353ff2772787757872f6774f2fbabfd1bbbc5a678b80ff3cb779e0289c353cd3968ecd87c0386204082703714e792804c6c109615ce2c271c5a762bc90566039332a438e4c0d5c959e41bc089d7c47bae5c8e8cd822a1efee6b4742639b07052826491177902ee56fcf0843babaa819050bc9ccb69850eb1e0aed1e39b047a35ede03adc11e8966d495a74142149798ca3dbd0e4e15a79661923f99a1ecd745f27b21ee49de926223ceb2a649db30cf89a68cbaf0d8a638d4a376d0d00b023715ab3629dcafb98c9264e8beb3c15847830c55341fa1e400ece8a3e469fe3dbf48cbc941e99c8e3951b16d8f9310a1f59dd5b7767b5ceb7b44c16377afa7ebd3e0b55e5aa06103c5d4456a773b6d6bd9afade4fbf3879071d5e1577ea493bc7c7ef5ef42f9fd85868810fd55b95d93f6b5ca6286ff34fcdd4954381213a0586c1280c25fd1316e6a06468dd1de063548591b99683e29ab4c8a2c2a2f0a34e0b7ee5cb7d496b473c9d83853466393f1761d028761853bfcee3e1c68f6cc9073a1fae5f597e9693d70d0335f2f0b52085253d3947773962d7e70d22eb09944726215f4b3f4171b2674e370e4a338ed02dcb537b90b3240cbb10af6d22b93c5cffb2419e6d147111ef1b875b6c34ca5ba7cd36b03f1e9f211e8faf203b10423876a2d3633b306c9355bfa05d625bcee1038bd68f7056846df2aee0caaa87138fb3a27f11170face27537d5073c077bfbe5c58b173ec2e257a0b6b6ee97cd8d2d9b0ab26bde9c950f06ac6c46b16e5b119954fa51cf0c1ed8357fd6ed6df4fbd7bfd5e91c7ee891af885b1d162bfb8727274bfdebc26a73f10da2d6d6fde98429886af1ba46145605d735c6b521a13fa910e1b888c3e3cb7161700a4825e0b408830fc3e68aca9d0d1e08a81289c361e18cbccaede0a751fd4e18167678425e382dc201b2240f10ae327995105711d7f1af926ebcd29173f493dc364c8a6b4543b7a69e4d796dd799af79edc8e72d18e11d03f4828ffac406512f3102278eb0dc4eee22f3eb82cadfa426143e495ff1645ef12b05e557bdf9c38f8a27433c9281ddd40fd4b6e4b0249f709c14a3a5633bd27f1859b1de849d494f187d1079382b465fa4974cc299466eefecb8b3a28f6edddff25fefe10922ce8bfe4f9fb29c2d4d0c0858b3e227db2cc07d02f2c80fe7c777e27b83c1cac9d9d9b7b60ff79e58b96ef53be3706bc2c1d4d4f7cd013cbeb679104ffaf8aa02fb313497bfb65a184e91e8b87694d3d166509c92869c8cb6302a5e5e8d97c261d0285c6c05c090c8214c4e4bbc3a576501ae81e2c5e3b003a7ba04c435a9290b280f1115029a3cb9f9a20304288bc757e96e4352b1158a6ff265f9cdbc947f84cb6e392cca0349ef5ce62629dd38b23f2e8b73d6333822d73b5db28bc8d3240ce57ccd5099654be53b2e6fc5c90e96b88ab909c9501a5d3791e3330f7a0984e7360d91bf6c876d39cad9d0e75eb0b1d3f8185df936089b0d919e752d8dae7064ac5df9baafa525fcf0e0a0ec98b3e24ba438b4070f1ff84653fa2372a50b3e60d816d1871b53b5d06e011ecfb688f848270fcdae78c2b8debb187cf42ffed5fff9ca7bb26e755807ddeedf3753fe9dfee06ac5bf6934650daf98e7bc3685ac9b5ef1ad2bbc56e5acc291c5fb4c1490e1e6ca3273e8359f2bf354810f829d9e9ef8be8ea3a3037360bc0b188e06874505e0e430268e0f100ea9e2e4ec869dc8fe912ffb84620f14737e738436858d5f0db14e64fa1b9793df256cb418a32c0c1c6b6810a02c9c4bbec7512e0b8f8ff121c5f84c0713e0fa535100fde57829074006fab681bc4400be713402d2985c8e195c66820532c92ea366471e536c9c08e71147b4eb63c726142734f573c216866679000d9a976a655b955b76ae6f7e3721de669a4c77492b0ccfb3ee49d7e6b98ea4a36de37c9b0e1e1026be4c8264795815aeb036603339098e8076c52cc71d4405da1c4e874141f7a2eb7dc74757c6a7bec50080be89334206f9f209997eb757f67676ddd13198c0416d3d785036b636cb92f55b7e34d817d9c9ce88a520fa2047c2af67168ce2ddc7e9eb41299717a5dfeb946edf74b9ec9bbfb82e83eba98dc1e5e56f7ef9f4f3ef3be32b202c3c01a7e7dd6f99e9dfb14a58e4c374ac575d4ddb340f8f6d36b66e6e151446cb1513f68f4ecf9c978d9d382c16ee705eec8c657ecb680bc7b5b3bbebe76e84aac2312c23331c1795852131bae23942341478c31971a7896ff95069ae83391ac2a51347392a1f221a71ce7c5c8d3e138d82702a3e13e15e5a0456043fbad1304833ce6135f31852153f112de908433ac4659c550ea8e2c9e1a2d029f35664218eaa5c43320ce312909389fc38526fd411701b5a7bf047e176ee7a27709d3b60adf7644296e489326e0b17a47b462e4b3e52af6a7f5ce7f28cc8b130c245825f93a6ba16c4d3e4d50d9def4f11c326e65c6efa0dce8a7ec0288b7ec336068d8ad0933561d2e3c87048d485a7b37e756469185df1e3a9a4e5b3336c5f98b773464f26c45b89ef05439e1df10784f9be341c16eb5986a92b73501727e5f4f8a09c768e6d6063ed80a9e3d4cc4ab73ff8e0f9ceabef7a9fe8b0cce8d3bdfed5b28d4ce628f42452258d23783026ce0743f2f22546c13880bd1e181ac271617c8c8c5131304f25b8261c23238f6b1c18f291cd910ac488bad3e038a483c7d991f4543ee7c801c8022a8fe0e746ee9cfc34e2c497af81f2527e0a07f97c1224f7366a4595779cc6f17590f3199b6703f051766c8afdb13561d411d4b44b1b886fd2cb827cc6e57517db4ccab34daeae390ee3523e99dff36fe840582690d3f4adad6b8405d081fe010f3773d69cb8e6c81606a672c46974a59b3d7580c3253d7d816f63edda808138a5e329237d35e4876ec443ea3bd2c16dc10dcfc2a67c7a19ef2dc613c60e5cbe91940762fdcbc162773078e5f70a273aac8f3ff9bfbe73793dbd69e6b3fe4a25848dc3a0c143189091db89e1230d37b61b7087d563d2070fee97c78f715e36d7364352509e4e308fe69c060fb823400067a4d116c68330243a7247e1eea33b8e1c1ac0b0f01107712e1dd51090011f209ce2f9b50a6a8027a3799df3cbb240d8f1f50899f91aa81c914fd89c639360bf0b01c9ce6886e9ba2d5cb6c6b65c8f7358b5de6f16e4912943f9357932b58170d5abea16887f5cdab6782fb79fd5902db23de0272f3e57cc0849f9e24ce4b0f81109fa0bfd82780605381fea804576fa0232639926368f32e262a08083a39e70500c22208dc048130e0a47455dd26fe82bdc90d12be8ca645dd3a7ac9f9f5b7e6c89e874cecd79d10ea9ef191b9131f318cccd4ccdbcf3cffed9fff24aa3acdae22d383debfd7b57d333bf62ae6009c529bc8802c4f16e8d8d3a8254f0f8b07db139f68a7b745ec864d4c5530d8077fef2cb2fcbf6f6b61b1c30ef86a8202a0692f3c1b161602a841119e7183adfe155d1e8ad8e94cb04e0119f97ab4a0721e336929d385783922cc26e43967517529a8cecac740e4bb045f8641a9599f302ba5658f308648768ec31da943d9afcc44302e150d3e619997f1c72da3619a08da78d32b856794c91a12e0a9f944e689659d7e3c271f43818de2b245fc2949fb7730b6746c1e763e84f382b7870543825fa0a3256cd11d147b891339be197a039a7dfc959d1c79407b2639b107dc48e909d5314392b2f96f5697e90a26bf920f3e8e0d0eb7fcefaa27ee20fea0daeeed9f1378f2e3a7f374af87298e8b08ecfcf3fba9e9e7dcf4cbda04e9d8902b1f6c37132281105a392599863988ad3c05373e7e51bef31e77efbedb76dc4f5d88d86b3a102705a8cba303a7701bc3f15450542185c23312a910a59b2bb08152467961b1240ffa88c7078b96389876b350aa5bd8d806c33ae83be29e43c87e77e8de3f4bee4e7d89d63f37c32d9df241f34af81aef311521b5118366cda11e4b693cf339f78757c1dbcaeacd0a776bebea65321e24675ce688653de5c66d92c8709e4a51905ed1a1e6471a47de39820fa03bf29481f60e49447578cac78ef8f3c70620c0a88677ac88021bfbaa3baabfb434d7ab0465fd6b686b9396b5736083936993bcf5ff88fb64edba86ac9bf563a1f4ecbe498d4955eaffbe1f39d9d6f22ff6531d1619d9e7757a767e666fd49d41037ef02aa887104d80e819322990a9b9d97a60a180fc3bdfbee7be59d77de71e784e1992232cfe62e824cf838e6ca82a854e4f09545788887a40771902a1a7e1c56ae2028836ba5e73889b26d484743030a6b4b930948c65d08286de81ece0abb3649ce8ae364aa750177b9ce4740c702949fbacd71205fe7b200e2dae8653149aeea3987b59190e5c4c8a26e47a02d5d4e9fc341533741e1cd38eca8768a3de5d8b033ed9e1b3b478daee0c529d15fe0f77560eb0f3cd964eae8fcdd586067eb03232cced151376ff28428a795c009c743bfd5af7a1386aad7e6ac8e7878f6e2793933f97c378e4108dfd49a358755f8f88171c37bdeed2eee1fecbfd23ad65887f5e3ffe76fbfd3ed0fd6a6a7e7cd5fc528211b5cb84ba553c1723032b48cc1398e83700ce51562bcac6f3145e4871df1fe1813c7f5ecd9331f72928ed116f933f2a21288e71c39dc61909f1d56ad4fe80c9f465720f300f2c861396e5c386900d7b1505fdb2c9fbf0e94478674189787c25f5687ccdf4cdb16c711924d471b7d3dfabc2b9a79be0cc6e57397362b6aa22d3ed779334ed0750ef77455dadb6c820db34d0169b027a32a4dedbef9cd18b8e0bce80bb47d6efa6c6f009a36e2cc4c4b9f02d2bfe82fd84532d133d71950b9c85f030cae4973b8b75f9e7ef145d9b5d9d0eccc74b9bf75bfac2eaf56db54d80ec1a8cd645931bbbdfeccd4e5d4a31ffff86f5efa4ba4631dd6c9f1f1efcdcdcd7c343533353735631ed2c8bf7153cc7999038b0d81317474a2a0155100a7e1bf307236402678793d8747b7e6dbfc6903f3643e5bc31ad7a3470fcb63735c181e07837362284b5a0c873374a3d99c9ca9239522e353c971b439b6f9f8abab41595cb0b2b0b663c6f6bd3496e745af5ffd3e5c5d61aa0c74cf8d84f071209e46c2fb5d7c970b592a3b717701d26f2387c97399992c967aa181706edad65123d79176229105c92ae89c184ce0baf0c76c49dd41ac73f85a47252363447615273b376d3ac9c6429b3c90653a115685731371a22339f72d40b6958b6306754a27a77e01b2017aa84d0b1e63d7435d920e007e514e07c4cbf69081f511d2b3c993074bbe6584f05eb71c1dee97956516cd37bdcd5f5c74a9259b022ef96c83b678c6fa92cd52f48b396b36aae269208301a0fcbdfd1890232719fadb61dafad2949571c6f4647b53efa2748e0ecbe79ffebcecefec1aff5559585a292bebf7ca127bc0ac6f5e5d5f5a9f1e14f35296876f875a9d5a98fff59f3d7bfa7742f8dd119ab5e0e2fcfc5766a7a7de2fd797f3feb953735897c67e796dc633aaaac10ba95f0486e257826db4c4229d15d22bd08882c32b10aecaf18ac381c4a0d1c269fc34fa7060ecd95ab71117a32d86bc1818a7c01d0419ba8370ce9d83c57a8dc290cd9dc7f764b95cbe57cd50d6f4232fab05c886a92e5395e48d8b38d3393b2c41f15013eeb0ac31e34829334e15ca695e9baabcac905e4e11d77157339b66a75591ea6d12a895916e63f93919141e1dae926e515e67d630a313c5b613c8519d8f8425e4b8cc33522e438ed331a3194fdda3a7c289d1f948f8387249a1477532b4200e83cf0da943c30fb2be40321ca4373e392b392ca5c924c0cb8d9ba7836c6b306e775c736cd6b4b685bd8f0ef67cd1fbb1ddd819dde0d0d08b3d54f736b72ccf69bfc9b3acb26fa32bb061d3404657be5da8ca4f7d94a23030d0120b616c2ef5a3e56f67fe77d03b2f477bdbe5e9a73f2bbb2fb64d97abb2bab6511697d7ca353f5c6136f21f149e3299a51f0e2b369caff4afa7bebdb377f0d2eb5861b116d8b06dc394c4f53a4f54a28d12ec5c0be614208c1e533d91999c24014f37526d23d721372a50e78a1ec6197137c32931dfd6e220158b61c9936b3d65a4627efad39f0ee7ef3836ce7dd46646c4a170f44d78269b8aa23c1c7363d179e831d6541e9fc135f99247a4ade99783af3f1f8a4279546f4cfb0331c2205c8e9ef311b2b036643ba9e3e6fa00c33c9b328d3248f726ad203db236e802d4ee0595a1a91318295725d351c90299078a7caa915b951761b4676626dca059b7a26ff860c188c5f5251b7171d364a98407574c05c196ddf4b9f1eb89bb8f200df46bfa863f8d3447c539fd8b7ed1eb91ef74999db2a9a0e9d43fb5a9a5c97cfef967e5d9673fb7fa98b2fc967d60c18fb252767d6e8a4dd66611d3378adcef5f4edb0870f9e4ec24b604bc04c6f642f3ac53a6ec489de786918da930cec3b8f5791021f07a9421cedb484076930fe363641c971ebd62108c0a3f232dee1afc0e1b23adcf3efbcc1d15e98e4f8e9d0f47c25d03074845282fe4c861a90c0e3b8f72d76573544a8d8419945e9d95f3280beca3bc6d8003bed721f29b44d87532dd0ecba626b74d9cc748cb46b6c9517983b54891463793800cefa0aeef282443f2b3ecdbe46678692b9bb452b08d84d91f0fcb79a127049afab421cb1bf256718264a20562b06bcc5e68b3a68385b135a873d6b151d3be4fedf8951bdab05ec9c146f4039c1547da3e4e8d3e425f91fdd0833ec14bca8caa20ff2cb3216e383c0db59bf0f45c999f9a2b9767ddb2fdf4abf2f4e7360d7cf655b9bc382f8b2bd62f37d6cbaa392cce7d777c0546a3dc60ac244e032bc3b9cd783ac76763fdcf388c7758957795610185d3c8411513e1d6412d5c068004a58f865c4ffb20928bb8160f538bfa3c78196e5281c8c6d9e0b020f48147770316e2df7fff7d5f48645af8fcf9738fd3f016dde1c3890164462962188c2c95cb4b6de72a931a97075724285c4e906bd94136f8b70761d3c93419aa1f786986a369091b8f97b145d376aa8336fa6582fcd426e45c40aef3497aa95cb96ca019e6e75384714365b4636dd4fb50fc86e0f1f1a1b5db4b9f59a86f6af68193a2fdf3e506da3b4b2a6c19c259a1173cd29fbe8193a20fa81fa8dd437c0fce02cbc549a7ec3d7b61d3c0cfcace97e6ac8c778b4daa9be630d7d7ca828dea66ad7ff2fd78ffe9faa1af3087459ee46745ea0e06d396cbfdfffe2ffeea6194f46e18ebb0e8e40c0b519e02a970644ee15144850678d1ecc814579397b795ac46d23577d64893f77871c419a00b795029dc45303efa108fd1e159b1f06f7ce31b3e45c4697df1c5172e430bf5c02bd78872bacee674257f08934973cb65023a3a52b874e4e8ef1a1a01d90f48ced74977037ce3e876501c883a8a7a8a6b1a663d3d0c9b64922da057459697e9eb42339f6c6baf630b53bb91fdc50b9a610acfd70a6b8545f9032d6edadc10afadbf58762cacefef1ff8888a29a1af9b9a93a0cf32aa8ab7454ebdaf7003c761adadad0fdb2579d267ceab9b39ce8730f4a52f0ffbb92930337d5d4e0ef77d71fd8b4f7f518ef70f2d7ca6ac6d6c95cd476fd971234656ac0ff3cdb0191e86cdba5f00c8e4c304fe1360d3c6335556ac0ffe5aaf73f4ef38c31d31de615190f37834aa8e9c3b9e3a71331c709ea96ed499e0ab8986ee5eb812134775a0512708c89f8ad2488b73c2d0159db9e37cf0c1073e1aa3e2a810ee381c55615408f3f558a40e87857ce505749eaf7574f2ab3a5c0d575322a032ffb230d46d0c19c71d6802ac28148732b1ee81dd3812160eab7d8d0a9046369a849b3a0764cb49745778491bf9646a22cb168fea9832e574e3745198e2db6814d5cddc4c16fd28c2383f3fbb28fb7b07bea6cbcd9bbcb901eb2d91f333bec1be64a3aa477ef3a69f70334157ea0c5e964cb4b99430647033a7dfd03f24f3e470b73cfbf2b3f2f4b34fcb913bc9c5b2f9e071b9f7e8edb2b0f9b02cadadfabad9d4acd53d372ccc225b587e948a5773585f9bb2be313b37b76c97df39383df9ae33dd11631d165342be89c3821d05012a24c76c603c3f61220c02d51550f1b9c183eab8a83c55364485801c86a7cfa33ac9cf8e2b3b2d883b0b3be7a950369df2a4848a110ff2b88e3ca3d1414d643d749dd10c473eb239665e5d7fdd743beec233195107510f382bd507f9e77d7baecf9d74ba89a6fd0079a8fe450acb68a67b1564094df9803cd031978f30e9d79606647d9db7bacefcb21b92d55fd88a93d3d176b9093372c23171a3dedbdf2bdb2f5e78380ee4fe83fbbe272a4f03d18db4f46d6ed884d15e71507254940b3e1c1a5f53f9c5a7ffa63c7ff679e95d74acaf2d962d7380f71e3e2e8bf7b6caccaa4d471717ca8c7f8266d60700be33c0d2d3cffcf71f4ced811df9e41337b599998569f31b6ba7a79d4d2fd01d31d661f195d0416f504e8e8efc77f4796ceaf74d5382dfdbeb591cdfc29a9ab6e9988989466b86b5fe8e7266ed8ac8e266c303184a942b18de4c55a01f9afcc463ec7c57801816632cee2cbcaac04f19753a18ffc80d49562c4af2a490a1307bbff438581d45f2873a38d0d1c882088ea82accc9fe5a3a64480efa4996f838cb14b0b2f1af6a9890f8838466f8cbd25dd0962e93fdad74ac75adc19ddc17c621bb969d3886198c3fa5713b57e720ec1e729486788e92c33193e295a60d4d7d3dcd383221a2913476ed8eca40dd02b5478e42f04f264f57a56d92fd81c3785896b11bac956b70c9d747b821f39585436bf7d3e5c1c34765607d6f776faf7cf9d5b37264ce8a1117eb55f7ab77037db46439925fcc9ecefd8569c2f810013f2ab1b8385fe699c6593e57fd9e8daa0ecaf6575f952f3fffac3c3727c82066d56efe0fac3f6dd81473f9de7a59304739b7b06453bfd1b56da832a213e571ff6081fcfcd7b5ddd44ce7e9b36e77fc70bc05631d16a2a978bec5bebffdbc744f8fcb9ce53d674a31a2eaf56c2485c39ab561e0ccbc19dd0a690331af2fbe804a1c9b4c4d399aac3ab00aa44ac180108e424e065278934f614086118fee12382f405e5c53613ccaed9b77dfb321f4c5059b548d013126efd22a900ff3317a84a4a764b8f11d96c03fe44e87e168411c156e4778d11f5da41fe7e8edd7ce63ec37c8ab326439a1a0944c3cca6f02791e1328f8c6a32d4d26cfc314825cb104d5513cc5c37ed2bda24a86ea10c8b1218f23c8f959331ca6279e8e9b89f8485fcb225c3aba9e6d48f1e328b757ea95a3da86ce89a7ccb45f8e0e0b0b44598368bb4151074175fccd7a21ccf72e5df54d66b489c165af5c74cf6c34b563ceea7e995f5c2e3bd6ae5f6c338be8f866d177df79a73c7cf0b0ac9be3622d096dd08f6f5f316aa22cf40d46664b4b0b363b3187336df95f5b1fb8382bc7fbbb65e7cba765f7aba7e5d81ce1ccfc4a59b3a9df8327ef944d73582b9b1bbe8d81bd680b33d365963e8ec2e694281676f10771d59a164f06a9287e64f5126735355b06c675753db5f6f1c71f6f90f42e08cb8f01df6ae72b9d7b3b3bfe8e50e7f4c4867778fa708a149a271431c4e3691d613145e09c7094c7b30ab97244aa64ce312aeb4c0c5521cee5c8e0133f94c3000dc717d3cd4100f1f0aa0fd3c2b9f905ff4407158663a212312c65a4529103bfe40135dcb88883306c9337c2a3a10b5c235372f8cbe908794c7dcca892fd5b05cae365b2f3111b558872a9e347b9c431625f68c8579185c1a23cea7c440d7ea71c1f3cb7018e9b726a6a42ba00c5673ec50185469a70526ab7921354311a72de59beaf3b597afa036f7e706474d5ed5ef894efb4d33167b5e39b9fd9b6c03bb8dca0dd99b04c62fd90f6ce5a15cb22f42916c371562c9bc4c2386d9f2f3e74caeeee4e79fae517e5f9f3679ec7b2f13db0e9df834736b2baffa0acacdbc8cad2f115527fd8868e28cb088af2a5727a1f34dde9c33cd8a22f4ecf30759cc3812d5b37f9cec5e5d49dbf403ad66199c962a5df94e2a7acf9283d0b79fc46193b6db9ab5d5b0107bd0b3c833b0a0c2b25a332505c23a6ec5ca2b2027503a08e20e2301e9be230d8c5457c4ac687b1666c11f3702a4f4e06c251842e38a2309445f874d117262d2f5f643459d118e20e493c40c75aff703243f2d4a1ff780a27d8745850a02d4d93c20ee3d34c06f53089421fe571936ee67793a213aa1eb11369731e16dc4873930cc1e85079e3a83c46f389783f18b2ac36aa9165ebfc368897ba6c4e7754c7ba86da609ac7dfa1fe37cb55b7378b75befa083865a739df47672d8a23afa1f102f28a8d729e3db31990f5832d73564f9e3cf165109c518cf2636445dfa1ddc387ae382a9c0e3c0c3088e717a2777676cbf3ed17367adb2f17d6ff78f2b7e5df75dff2f77b63332a830295bd52d28e4d5b502e0d2afc53cae64fe6e76c346703073e9d3e3333b7dcef0f3edadf3ff8154f70078c7558189ac2f079630ac623d4a74fbf2c9f7ffe7939d8db2d3d1b36e2b0a66d88caeb2e382410ba62fc70529cd377a9202b825f03f844c473c408b116c53a54384064b0a10dcf8fc1191df9930d9baab26808e5a71c188786c49d85c7bc184f0d8247bf787878cf8c08533c770a9d8b42cf5409b74cc7f8075f6ecc6a789e7e889b696b0a5bc411793779143e9e6a9ddb29f2998c9bf966aaeb33ec044cb4d7191401fc813f8ed8a249f6e7469828ea2de713e503e415b227d128547e9d5742264269729d0aba56588ebb89367d2cd4ca97db5c5d6ed9805947cc64ac835b2a16c3afcbf1d1a939af551b3c5cfa688b91152f3e73a4dfcac1f2a4ffd0e21959b1464bff62890487469bc799754e3bfeb471db4669101fde9b35c7726f6bab6cdab4f2ded6fdb2b6be3a7456d3335666ebb326de474d5c9baa5efe9cb740798cab2ccef3b9737e56cc6861c9063d3333ddf3eee6f3173b8f2ad65b514b6d804c580b609ecbcffbcc9b57c451ecbcd82e5fd9dcf6c5575f96a383dd3230c7c56fefe3b931b07eb78d733cb70a21504941d1b0e1e5a91247f830284661c42342073d2a472f1c13bfc4c15d0187c5131136c7c97931fc45ce70c86be7e4c739846eddca61859ee65851aa027940807490e3669b6b850f9347ca9c64dc02f1de95bf0d249d44f6b7353cd3cb60342db2e9c8761eb17e1e9023a90d89fd05d54784299cc499ec6f7dfa4a18dab8ba1e07f4a01d64bdd43642c724cb95aa318ce75fe219256719caa6cc4a37845df203299783ebb2bab266375b5e99b974a7b2bcb46a6dbfe35b787852c80e76fa8bf4a31f1c1f1ff9cbcedca459535a5e5ef17e01e83ff49dbdbdfdb2bbbd578e0ed9f673e96b609b36f5f329a0392c16daf92119ef4b3e9088feea3f4beffd17271ab31c952d836bfcc7f232bfd2839c78191bc76b03a199fdfdc3d8c57d078c7558d766244c47c7c323afdfbbe723142cb8bbbb5d7ef1e9df965ffced4fcb575ffca21cf253d667f1f54faf226bb0d81dc3f143a576b06bbc7090787c41de4806903af010ce7774fc5777aca2a81488691dfa603c1c19c6205fff90be550cef4b415406f9cb1186d39bf6cae29acaf417755dc7181d66341b0ed71114fa8f272b45725892335a89cd34354585eb4e2e9b40992f878f926c3f8942f6eb52ce37c2c83b8e354fce6bb40d04223ec0b9ae9135ec184661932064f18fe3646a87f2c9798f437b3ba8c21a32da642a6c94540ed9a746e6abcb1ed336367db2f7eaf484a95dcfdaf4bc3b2f46564c15d58e49439fa00f40e480238b7eb3e07c382ab6fab047d1bf8d75deb51b2d6bbd9b36fd7b543636ef9715cb6fc946718b261b87c3a6d419de25447feaddea11a713bf555a3bf34c80bec0c88afcd9bfc55496f2306b63048853bd2bb05a2bf4a915379c65c8288bb931434e465e27c787e5d9975f944fcd69fdfc673f2b5f7df5950f270f0fc39b6be11de3603c55745095894115e605b7022a4e15161f0bb3d192392eed6ce7c8bb532ca473e45a77162a488e8b4a4117403c7a3055142f65cc902e821a66d6ddb86e21fb6b72a8248e9251cb6ef2dfa4e0ad1baeae73fc38229e2c275196f5aad4cc13926c1d735c500d75c649840d715ad1c1dbe4dd4635943e64c4f55d51a78b34c33a85aab871f264f34c2f037d79a376500373347c89041bce787fdcdcdc727bb1ae8b6ee842bbf75195f7dd55bfd9d3eee98f4c0fd95cca3a18b3264626abe698b6cc493d7ac4e2faa3b26e7d8b2d0b7c1e86f702d121f4a79fd6443fa75f69f3b5f72bbbf601819d933f830b9cd5bc4d0959170738c8d39353d3b137d5ef5f2d7df2c92777faa0df588765630f1f610136813114e44d6cfffefac307e681373c8c69d8d32f3e2fffef4f7e52fe8dd1a73fff79796ece8b8fd0f7cc608c62e2a9417658219983ae292405046ab0d900189af93eed228cc0eb0838aef8a68f3b30230d77a90874403fde91421e3218695171e48d5169762a2772c94ffa65b89ed579132a839df9357909d1982d8c3f77801a7ea4bb5b9a5781e4b7d15d705b9a1c96ed295b11af3ace542f13d4a4b83781c9b2548735a1abda040bc79ceb1a0221d34fa36c1e16d740bc22c9a0b3eb3ccb1cf255bc0067445fa22f3032627d9676fcf693b78769b11547da35fc0047c1349076cf1a164b26382c9670e0279e5f767ec894d28e3e93e23744cdc9f11d2d062bb10134e95ae967ff1d1cfde6625344403f830f87cac86cd146578cacf88e9e252e97a6dff999e9717ac2deaef99985b9f7f64fba1f79e25b502fb434f03b7ff8c77f7a3dbbf0bddee5d4823b2c530623b1683d6f99cf9b1273e631d90486d7bff085f093d2393a2ea736c43b3747d1b5b02b530e97e0dfd432c4dd32461f76e5850d6f1da31d35286858715678351efe9114c209b0e8c73c1ae7396fa327bc392f6aa233eb5ce194422e06d45dca1b80e76b778159738056260c4d45328aa331088cf07c1dcc3b53ad1f20bdf4b43f26bb67bcf1ad24ade755ac7e743e3f1f95938fe3c2f3b10d59b6a03061527aa199a60df034cb22e7a230417c596ea4c9c79a225e7111e047451a9095e3db10f1dc4020f1e6b271debc46b61f1c9c93977754da6115a97cf9f6573c18a81d55ed64e188361e32aa363c724dfb81cf382d1d69b31dd9f348df7afeec59b47723bebafbd6db6f99b37ae2232cda2d995baceb489b473efd801b3b1910c607fc62f613376e465e2cf3acd9d1dbbcf1d23fdcf9a0030aa0abf1fb7685b874e8684ab94ed75331a0881197d9c3fab9fcc4ac392d7ed0183fc00e83f3ce713939dc2b2707bb089f79f0e0fef5d683875ffc8fffdd7ffbd795d4b118ebb07ed71cd6d41c0eab2c9869bd1332f76448c73091ddad6c589bb7a91a9d7d79619e19b97971f3ee5de6d9273635635a76e44ff44cebca909537f6a17e38a5680c37d791003c184f5045c6df6824ba2b53e1381a1c2b793887c9f721aa3928bc3c7c5498f2e59c3939771a8cdde99c7a453275947ec88a857bea212a0892c31bc278790b8086e24ececb199aa62a1ea617749e8fe4db448e17b521dbab8971b25f06b25d96d3d4a9a95b33cf66bc107cc10b8fd2358f605c39a5075904d579c5a964d437bfc462503c811141be9064298f61bbadf49253a9eb3d8eb5bd225ef2ac09796e9126a6c190781855758e4fcacef6b65fb3dd871de71f7efb437f83c31823874a5ecc42623f227d96709c14ce8a074de8411ced9d761e5335eb2fc61bfdb2b229b25cb9384a47871f4dbfb872f0a99b58c7b20b8b60519dc5fb79f30bbc3be85f11366775767a548ef677caa939aceef96999bebe9adeb8b73eb5b8bcf4b77ff9e7ffc3bf0a69e3d1eab03efef8e3c5cf768ffe747a76fe239b9d2ea0888f62e8b4381a0c6bcecb877bbe286e85b7e9d9d2ea4a595c41c985f8ecb029d8393f2b4736f23abbe8b9138bdfd98f352d8011543982c264201d411d06d57724bb32635161d1a8b883e074d0994a8aeffb548dc0ae19eac2a7a79b545e6c9c3b1b3a2ce43aaf9599d1122d83aca403e9445580dd41e26798b4c80feb30dea0f310117232425e55eb43705ef3d6f668f204eaf89b200a3b4d42e83899473a214f6521dfe60834ca73539ee239889a90ad407d8e3ca521d1a85c20d9425cb66430825afe28225dd645e51bcd3fda5d5015626968a33a0775ba808f5c529c9c867870886727a7fe9918dd681f3c7c583ef8e07d9fbed19f5c8b4a06699101e0a77db3aeab5117f13828ade5d23f08134674ab6402e92d02c48be8d3c6e51dc46732f3f1a49f9919ceaa0c7aa577765c0ef776ca815197d7fdaeacaf58d68b0bf3e773b333fff75ffdafffe25fbae009a8354de8cd2efdeafcfceca639a66946552848c7852802d7746014c243b340b7f1f07e79f4e4adf2e41bef9577deff861fdf7ef79db2f5f8917fd48b453e76e33e7dfad4f77271d4afe060d899999029c2266197e8c0ecbfc1ae0acb449846593220e74c0f713e7abaa80aa4f210433908637aa80aa58c6a183542a6fdf163ed50686c71ced1feba2e41a15bc8b93bd1408342769d5790e4be2e49f6780adddb28ea82fa0a9b87ed47e9667ef5b9ea308e19997f549f3aace6f9e550409d54902d286bd4b78e910e5da947f1e534ba069c475d5b584b9c40fbc42960eff7de7bcf9d153745a0be29a2fdc2cfc80a67c535e97413f711953935e423937890cb489caea36c41c8c9d7005e6b0516c7fec979ff34337b3717d8098f4d6cf4d53f3bb151d56e39b6d155e768df3fafcc3b8bb3d686fafd8b72547d0df536b43aac7ebff7ef5be13eb461e23c3fa6c030378ca0c56f0c5b296a05c04b33aa62a18e6f45730778f2ce93f28df7bf593ef8d607e5fd0f3ef0af2668531b46e42b893c52c569f1cd2a1c171b4419e560f4ca16062a2d8c973b87c7548dd93bb81d6544551a47f2c3a9b2288f03235e710295a69196d2722ee473e91336d079ed5442073be5aad22fc7d7049a6141925b137899f34904dac2ef4eae9e17b26eb84d0abebafc2a1351c4ab1edbc8930fd3873d6a9bb44171e308b4856702f9a8f3d057479d4b272e45a4a9f595ee71a45dd571356961dda9cef2061fce0770f3e5751cf809a34f80e81b3123a02d13c78d98b68ccef4031c157d203b2da553b99a509945e330376b8e0ab25997af8521dff859c3ee776c96b5b75b0e76776c4ac80656ded78d59107469dde3a2d7be24d444abc3eaf6fbdfb129e05b46f32cb25330e0de78507be39a4c90fdc171b9173765794c8a83622b046f8d7ff4d147e5c30fbf55de7df75ddfe0c6f67cee023c5ae56363382d3e46c6eb017c5581c7b8eceeb5ba32f918f426598c551077894bd78b8a451ff4e5a886c039ba69cece39a0a2bcd22c9eaf36f894d2f89b0e4d8d26ce21551cc7208fb670e916ec112ecafce328972d289f57f9a4920bc8500000133149444154eb5727e48ea351bd5ba99a7ec73ade4d523ee20f44f9a293d0596a8a073137eb3710b2dae3bf4eaaa1b62e44d97142c9262d14f6a89d95da6493a27d41a40b5eaee243037c642f7e829ea7f4f3368ac129f1c44fed9d36ad7e4afb95a3c2314138299c154ffefcc1540a276d2e5fe812c8e160a85b4500bd16dc612df852116b567491814d032f4e4fcb89cdae765fbc280776a42cfedb86c63f6de5b03fe5f27abaf4ebee3611d4fa0df47bfd1553d2fc1543b6d84741a1b85bf808c814a50cd1f0683c5628d3ddceccab9a13b030169e579696fd09c4fada9a3b299c17ef3abd634e0b27c6dd02b9181727c5d7118f8f4f7cff1447465d38ae18d951b1180923d68d966bc289470ea0e2fc4d71d303108eb3a5827058da3c0ac85f8f6e6930f98e27d41548c5a9f2e23ca214aeca6d8fbb0b8d76e2b06d1bdfeb90e48ea3b634a3a48e285be58e18e7993fdb21d79d28e2b0734de28f34a2acf72fc361413594b740bba0bce8ab63a6bb20777ed11076cea2bb4febec864cfbc561d196a50b6d9cb6ccb9d2d3ff1838d06f69ebdabb48dbcf0e4a90ac36e43864cb19425c13870e733336a2b2366b21bebf1187ca4bd9c736d5dbb701093f5d7f6e7df9cabcc4cc9c393623fbe35f6de85fcf94de98f5f4265a1d16ca84a2610c0a4de109d347b9689432903523ffa5573e3d338b012ddd9c5dcf9b61e6676cd465b4b030ef86dbdcdaf49f23c261e1c0d8fce99f77350353702a0347a5576ed833c239435ce294af0c0901e9826ef031526a5626e1e423872539f04527a3e1d5ce4ab2db60493d7d9c578dccd8b34e60187747481f48b2b2bc37852cbb8d6e8378dad2e99891ed403cd7b751536693de24c86f129af9895fed4524dd85a6ce9918d903a56b039d9f5109ed953ec8d2066d9cbeb46ca4f6ad768f2c6ed6f0421a49e1a49cd7649257d61748a736285869ea7e485c3562b611328cf43b9e629e9d77f86d535f9b3ab4a9204f28f934325b1c66d9408ac39a9e2f97382cd3786a66e1c19ffdd99f7d2b721a8f56877566a3956b13cc908def44b1df6a6e71d9e42ff87e2a9444592d105b15f9a63177103e3a88c56fee0a0c69cd4456181c086b4aa5cc2fcc96955533fec66a79f0c01cd8e3f85d7f465cdc0530b02a81cac259e1c4b8d3685e0ebcd22d2f9c50dc35c8ca8c6aa340e6c91cc99bc7bb7c988c0fa1f152368bfaf0432c1262ecb3b3d89defcece744776ae4c8120cbc28b6431c36bd3c47489b26728ad1ac95d01bfd2480f30aa4bddb90171d23b8783b6b04990ac9c5f138af706db20356ed130ff2a2de07a24ae22c5094d3d88231ded20cb6f42f2c6519347b246015f102a689d4d0f872447e546cf2c937f6d20ce47f555346daf12e5712a2f5f2b39393d2eabebab7eb3e729fce2d2a2cb9d9eb5fc66e2d534fda416707b55ba64a87c990f647d9b20cc478f9e26e2c349e1006d5435b768ee66a9f4ac6f5ff23d2db69cf7cecbe9c16ed97ff1b4ecef3f2f67dd631b3f599f5bb0999a3bacf02357d66baa1f655e36bff1ab2fcefabfe3194c40abc3ba30dd062608ef326f8af9efe357fbaee66c4869dabaea61d8283853292ac0cceec6bab670be83c39129d7d555dfe25927e2691c8ffe8b8dba66cbeada923b2e76ace3b0b883e8a99e86b038301a03202f350cc039770e5e98e6c72539e2a0685418981f64e5d4c3ac72f9181ac0592137f666cdd91d000737da609b15e89756a008366363be748db3462fe926e81ad96df12087abf16402e3d20a8a177f1b9a72db0819b271f35c800f649ecca78e21be3628bfcc2b1a87661a4850de2221cb85045d37f3866a705e1362b3c352fb1b8e605af2d6319f8fea1ef6d279b02163ca7f2082cf1ef366c9fd87f7dd412d9bd3a21d0fec06dcbfecfb961dd2d3ef7cbb8e1d0162e4b8b24e9cabaea49774034dfd8368bb55bfb19b3c6b55382d9b5b1997399f699b265e754beffcb49c1dec95c3e7cfcbdef6739b161e956b63995fc67fac98b3b2d98d392cf3b658b3eabb730bd637df3bee0dbe17b98e47abc3e2cec537a830049d9a110c8e0307c23093c2aa92557055800aae4af48a3482af49f0884f2f4732d4f5ddb715e1bce4c8b8d6088cf432b82a1b39e84abcf446be40bcd265fd08f34ab17fa4012a87a0f209cedf4242becee1b7a1c98baecd06f47543794e2241e514292cf3aabe9d1ae95f1559aef211b22e9390f9b23c304e86c245b423a5c9208c38d3ac0a7939487eacdd5ef9afded007384757fa23d08c035e90db35e43a24dbbc2afc8d1293157d8a1b35fdcef23587c97eaab9cb5ee99f1c95fd67cfcaf32f9e96bd9d7df32197e66097cac2f246595ebd377cdd6796598dc9c22fe0f8b8b6e39c8de256abecc6a2d561f1f48e9db19a3b9b765e015ac0e3a88e0d2f066b361a4186576380c4ab4a85f80616eb5c10af13f09de965f3ca1c45f0b8b1702d4cfd3018a3b8ea9c07029ceb0ee8a32ed393233b79e5c0943715aa0a909e6a086a006d656a42694912eca40d421f9d13277dc751a4a9d3bf0992dc71d4d44194e3f3116a96136a4b0b9f681c6f1b65de7114231cea92f6d49ecf24929d73dabbc868eaa9a511da5f6ccb89ebe0bf059199436d4ea05f313378fbedb7ca37bff19e7f938a57bf5cb625537b07cdfe04e5bef6bae023044c05e3c66df9db086fda68ca69502e8ef6cbc9cef3b2fbeccbb2bfbd5b2ece78f17abe2cad98b35a7fe80e8b4de6beeb20a6814efeaa1fd344eb8b3ca9bf0dad0e0b43752fe213c59c33870508d5484b231d8c0c0fc601d9e89cab80325ab3526450353c1a21444565220c11c8e23500488d834ae39cf93e15cab9e5e4f24665d4953852b976ce35ba318294de807095ad0df08ac833536ed477a5e08f349417ca712f2bef36923cc9be2bb5c9c9a47a6923c53565bc0cc93699daf82653d2618c9ce6f5b8b270a4dde536c931d2dd8ed17614d73c21a4bf7df7bb1f95478f1e7a1b967c5e7fa3bd479fa9da71d5bed55e9b325f07eeac4c0c7d9df52c367d5a481974cf4be7e8a03c7ffa59d93667c5223b2f59f391bed5f5adb2766fab2cae6d94d985655fb7b23fe5da64b100cfa792f950e08c8db088eb7bbf9d8cb10e0b6284c55e0f8c8f31e45c38cf5344aeddc0561019474e218c373a57ce7c005e7862310fa38f5284475cc8c271218b4a89f37c0dc11732aba3fd933eaad8288b5d9b23661b066526ce17318d5c8af164ca501972d9d0553a46749c872e117757825f1461e026dfcb52538fd0afb69dec398ea2dca3e99b54f322b9e655780e7b156ae6d7cce7e5c830418eec95e3f3b9ea48ed2bae93ec89a8db8efa85ce5948471e4fd469a3d84d231d3e930ca143cc2262f600bf4b4d72de047c7dda8872f9cddf8ad6376775b0bb5dbefafc33ffb59e5d73567de35930bfb0beb959ee6d6d96a5b57bfebeb1efcdc21e6e274b6f53417e6301624ac8e2bbf6784e4294ae0129c628465f2b54c13962080c23a7c53177688ec46340a7ca886d50ba20557c38a9a8f0202a2653e4513b1ecee34d73e6edac4b850c782503dee6dc1e1e76e532b7e63d4080a38eb5812873ad5f942f035be8a8bcb2ee39ec2ea47491574dcdeb97a12c771cc587f5c2b66df177a556198db241e29b4499bf8de41075bc6b3a91748ab2d7329a7c4d125fe6a56db1081d845c957732e454b859721471cd4d93733e8d8c73a29cfaf81d14afcd459b8efc6396409a284fd0eb0209384fc962e477d6392d87fcb2ce8bafcaf68b2f4b87bd92a6e7226bcfe6a8a0e5d5f802847fa594fe667d12c7cb4fd9f3b08b3ec71b32bea665ba23f73660d556d0a1f17847c747be1b9d2d0518828e930d019f16b9b333900101bc6d9d9d30280c1d7c4d52e551614c517124519121d3bdb53928f26dde6920ce21e925beccc335eb723c64f0bc46f2a92b7f1c725c2ee7a4349310e9c236b53c75945793f9b2c879e7639cd7656c02fd20f8645f2db4eb5af25e07e441ddb4d54fade764643e924b16b88b0c78e56852f64359cdf036109fcb9249b2d18327d8b47578e98b8027e9f43b7d4184b84c007bbf09689cc69af589f9047e456bfbf9f3727c7860d3c28b326f8e6a75eb7ed978f8a8dce3370bed7a76c17cc23c0302eb773cbda77fda888aaf38e0ac38728d13b302c4368f5bd05a1a1f8a5a87c6295c9c5f94dded67e64db7cd81d99cd96665dc980626bc6773e9011dcb1c467e2aa78a96e199525ab5a09353ac57c539e18a97a15559380c1186aa1d48dda0d409e49844ea189987cfc878c55b188bfb4c07bb17fca0e48539b290c19d0bc715a3add86c4adee8a572096a14caa7190f729942f7ba9c6d24b485497e331c64feb6f88c264fd6bfad0c424e9365e472dd26a3892c0702a4cff507daf8265d2b4c68c6e5f8ac6f9347f5d656776dfc196de17e5dc902e48d6c392711d7f0b0207d8d3dac5373b32559dcaccd11d8086b81d1899dcb569968e7be39154a204ed079d6472470c6e685fe45d7fcc07e7966d33fbe1e717c7a6a7d7faeacdedb2c9bf71fc54fd76f3d2cabeb1bee8cfce91f331e9b42b2817c716ec1bf1ccc07fde6cc61cd2e2e9a53ab5ee799327f53cd7026a1d5615d98b1f04c6616ebe0d7e5f860b7ec6db3a0b653fabd33f7e866099baf5e97aef1326fc5c81452ce8173af9c21c54224a86d41f86863c8950651711066436e7384a43c65e44c8264b3672ade4f8c8f9bc1d3e9f02a103faedaf1a793c872476da32c8ea2a8b6a85020992eb742ca7204f034cb0535d367282ec7b7954be0bc4daed234d3b5c5673b66881f6ae6a16b8501d22b5e61a02d0c34d3a28748ba109ff98074158fd0cca379de46195ce7723549fc1c73fe591f08fd8d6b44becb36e208e15090a99bb1e4479b2fbe1580e6376d9dda7230b9cc08cc11b08f6960d345fb27c7d4a4a12e2e2990f56b92d00c43976ea7534e6d34b5cf37e0f70fca79b7ef7b33efdd7f58eebff5a46c6edc2febe6a85696d76c30c0fbbae688cc99f914798a375e16cab285f32314ac69cdd800879fb6673dcce657e56a30b0cc66d6ffe58fffe6b1673a06ad0ecb15ad86996e7433e2113f83fdd96765efc576b9b611c782390cb68d5d9b03180cd77cc2c84a372cb451bc301c06b0fa70aa1d42ed9872a5490e144f0e35adbb398a1ae6e5f2db1b21a49df855a087f164f1941f89b57c910b31aaa24c9cb346471ae905b59d87631b85789ae720870bb7c5e7320a994f24dc762d482e104fa6bba22d5d33ac4919cdba046d69a0bb601cdf24190a174fbe169a3cf95cd7a0796d1737c30c7edd0857db3363f8355326e2d546ad9f7bdb03d96e4dfbb521f3a98f211b7992c9913ec0cf806dbf78510ecd6171cd6f95aedfdbf0f71ab76cfab7b9b5658e75cd474fb134146f9e683d199a236ed11c199bd0197430eab26e3875c52f4d9f9a433c5eb8babcfcd6574fbff86dcf7c0cea5d9515fee71ffdcd7b5f1d6cff914d9c3eba1e5ccf4df1ab3797fd72c68b8cc7a73e425920535382a128ef0cfa6724aad1531318c47780fb3470f48e0969631c9d3dc23cb6c5a0f5d1a45671c887bfae9cb80e204bf920930332a86cc2b8ab89b46625fde0615d0bf275020b7731d51d936b7496a31deae9df43aa217d9456d73a827c2e3dc7c7230b61914fad531c033a8ee65fdb21e26fe62baa82925c1d21d2410a939c5a5e34fcb81e06260c3330d432a9dba857d244baacb3f47e39449a3a692e4ba02daee689c8d170a0f061403aaff9f4650fe98f5d741e14eb42846bf6a07ec235fb1ef9c4534e0b184101aec35e2f07c901920d647fc258338e0f111c95e3a343efe3ec695c595d898ddceb6b855fa2e6db57ac4fa1af7417d18f089fe5151ef31becd4f7efa995cb32637ee5f2a253ce4f6c867372383d18f46d2c32fdf47ffbcbffe9af5c9916dc7058ffd97ffe5ffce3e7c787ff61ffbabc7379793d33cda0e9caa67dbd7ee127797889917316e471444b2cac592128be94cc952207c150d69fca40c6cc60243ea9aac61da31e4b5e110ea02e3861423e0f903b1517c71aba8e86415e32a874742763c479e7ace34e4be16cd9d0e82aa8ce1819c8d5a850fa1a9b87133daa67e81061a1637dae4e1fe76d6137e3ed2f02eddc0fc36384638b48238cf286fe711ee1a394c3751e689e3711f14cf5c9421450dad1f41e6f7fa29ea3aea15a9fba3d297d5dd7b79110d792e10787f8725c7d0c3e5d37cfedcc6fd40a8b6340d771a30b59371d16d343ff3c12373d6b3c2c55d0d6b0036d8f1b265f4c211d04d41e01613abf2bc83743b2657fced919c04707f8f800eff1cecd4e9b635a28ab6b7a1365d57fc29e27ecb10994014c5dd9c8412ffa3e34cd128c1d2d37fbdf2fd73df3236727e5fcf8a0748ef74bf7ecd41cd6e5b5cdd67efac9fff1a3bf74212db851d28b8bb3df3403bd6f39ce2a43e6a14bcb7ca87ecd9cd5a5ffa4d72f7efef3f2ece917656f67bb74ac50eae8521470ad1108bf4f18bf514845518d142c9c182f1f930692630b07168507a451258fa78ab96a404284d79d5415447e34085efde167bef9dd37e4e89745781a43b9dc2959b8d27314093775104297088f633e17745ec7d747d08c1fe5a9e58b6a9efa3ac049ad37106f4df0679981b86e0259214fe9a8e3b8ce24996a03411663446bc8361dede4a3e739ecee04468ffca9020c4d9e1a1150a7c9e741d2299f73599f0711d80ca31d0aea2b721edc3071566a672ea381b6b09705f2a3efc58bd43828da3ffd007d98616cdedf2a1b36f55bdfb07e62fd657179d9a6798bf113606ceae6666ee9a50ff27c7465143ec4e28af5a541b7f4cfcfcaf9d1513932dfb16f747cb85fce2cacdbbb983e3a3ebaf7e77ffee763d6b14af9ff00346f826fc58beb3b0000000049454e44ae426082, 1, '2021-04-24 12:32:42', '2021-06-23 14:11:44', 0);
INSERT INTO `users` (`id`, `companyId`, `name`, `surname`, `email`, `username`, `password`, `birthday`, `gender`, `phone`, `privilege`, `photo`, `status`, `registered`, `last_updated`, `online`) VALUES
(11, 2, 'user', 'user', 'user@gmail.com', 'user', '$2y$10$lxvgvBcnRTaCjTwbHOtJVupQrBwPBU.t74Qv9X6Npv6MNk78FJT4S', '2021-04-24', 'm', '383 45 698 566', '3', NULL, 1, '2021-04-24 12:32:42', '2021-06-08 10:44:10', 0),
(12, 1, 'userFreskia', '', 'user2@gmail.com', 'userFreskia', '$2y$10$Q0iGqPJHF78pWVc2KYBWXulo9rel3P2z0QpG6I2XfT3kxA59UBowi', '2021-04-24', 'm', '383 45 698 566', '3', NULL, 1, '2021-04-24 12:32:42', '2021-06-15 10:10:38', 0),
(13, 1, 'userFreskia', '', 'user2@gmail.com', 'userFreskia2', '$2y$10$Q0iGqPJHF78pWVc2KYBWXulo9rel3P2z0QpG6I2XfT3kxA59UBowi', '2021-04-24', 'm', '383 45 698 566', '3', NULL, 1, '2021-04-24 12:32:42', '2021-06-15 10:10:54', 0),
(14, 1, 'Freskia', 'Freskia', 'freskia@gmail.com', 'freskia', '$2y$10$q.G5nyOkF1iYn4U.9Yyxl.8c5YcRLwucPiuvRZikARYIS1ttL05lW', '2021-04-24', 'm', '(383) 45-698-567', '2', NULL, 1, '2021-04-24 12:32:42', '2021-07-05 15:06:58', 0),
(15, 2, 'morea', 'moreaAdmin', '', 'morea', '$2y$10$lUMyJQ5EPHjDAW1qHZqdm.2P51P2zy/iHmUdxy9VCdgGozTbrbqmK', '2021-06-08', '', '', '2', NULL, 1, '2021-06-11 13:25:31', '2021-06-23 14:54:53', 0),
(16, 2, 'user', '', 'morea@gmail.com', 'userMorea', '$2y$10$0wv8g8OdpcBvYfLeCI7uIOnXCqKQROyEhfwWf4TVbcRH45J8k1j2e', '2021-06-01', 'm', '(383) 45-681-186', '3', NULL, 1, '2021-06-15 10:49:29', '2021-06-15 10:50:47', 0),
(17, 2, 'user', '', '', 'userMorea2', '$2y$10$d68iV7G8r/FweTFFOWCzJ.q6C7I9ZDkbTk7LKO/yOjYFRxjX6kb3O', '0000-00-00', NULL, '', '3', NULL, 1, '2021-06-15 10:51:21', NULL, 0),
(20, 8, 'greenadminn', '', '', 'greenlife', '$2y$10$eafUm53NEWeL2ijkzbWvDuWK1OWgx7O9RkvDNqAokIFDJ6xuqGSCG', '0000-00-00', '', '(254) 36-534-342', '2', NULL, 1, '2021-06-23 14:42:06', '2021-06-23 14:42:55', 0),
(21, 8, 'usergreen', '', '', 'usergreen', '$2y$10$pJDC/TmOfAPeAN55hERgOOzj5eRG/hzJEx6jGSA1gr.lRj9/PQ0Ky', '0000-00-00', NULL, '', '3', NULL, 1, '2021-06-23 14:46:40', NULL, 0),
(22, 1, 'freskiaa', '', '', 'freskia2', '$2y$10$f441YZHPu3MoeODEWz0VHuqa7x6zojepo0nhPOeJON.WLXudmKLxu', '0000-00-00', NULL, '', '2', NULL, 1, '2021-06-23 15:04:27', NULL, 0),
(23, 2, 'Milaimi', '', '', 'Milaim', '$2y$10$0/ndI.otk26nlZcD41J7ge95jpok8zY9RTd7jc.U9U9K2rQZmBQy6', '0000-00-00', NULL, '', '3', NULL, 1, '2021-06-24 14:42:40', NULL, 0),
(24, 2, 'Visari', '', '', 'Visar', '$2y$10$2EqcIKXCJneMCTpZvPMY/u1ENnGT5XXBRoBN2OlJWvzZnMZxPsKI.', '0000-00-00', NULL, '', '3', NULL, 1, '2021-06-24 14:42:55', NULL, 0),
(25, 1, 'freskiaadmin', '', '', 'freskiaadmin', '$2y$10$qmFx/o5EzP3sUYI3A2lYgefkUGqPwLQPhOTydkJ2Gqf5lel9/NX.2', '0000-00-00', NULL, '', '2', NULL, 1, '2021-06-24 16:23:06', NULL, 0),
(26, 2, 'umorea', '', '', 'umorea', '$2y$10$9sgSnArqbQGuGmJhT/tBhu05VNhEK9F2zskrUONBS2u5rUQyaVTZu', '0000-00-00', NULL, '', '2', NULL, 1, '2021-07-05 16:49:21', NULL, 0),
(27, 2, 'umorea', '', '', 'umorea1', '$2y$10$eS9YGffa0.HVdGQi5g9/Yur7zC8pR7ThgljSNsO/Hbd1MO2FLLrpe', '2021-07-08', NULL, '', '2', NULL, 1, '2021-07-07 10:17:25', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `website_setting`
--

CREATE TABLE `website_setting` (
  `id` int(10) NOT NULL,
  `website_title` varchar(255) NOT NULL,
  `website_name` varchar(255) NOT NULL,
  `visible_website_name` int(10) NOT NULL DEFAULT 0,
  `website_logo` varchar(255) NOT NULL,
  `website_favicon` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_description` text NOT NULL,
  `google_varification_code` text NOT NULL,
  `google_analytics_code` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `website_setting`
--

INSERT INTO `website_setting` (`id`, `website_title`, `website_name`, `visible_website_name`, `website_logo`, `website_favicon`, `meta_keyword`, `meta_description`, `google_varification_code`, `google_analytics_code`) VALUES
(1, 'dd', 'dd', 0, 'codingstatus-logo.jpg', 'codingstatus-icon.jpg', 'dd', 'dd', 'dd', 'dd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `clientId` (`clientId`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `registeredBy` (`registeredBy`),
  ADD KEY `updatedBy` (`updatedBy`),
  ADD KEY `companyId` (`companyId`);

--
-- Indexes for table `color_setting`
--
ALTER TABLE `color_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `companydetails`
--
ALTER TABLE `companydetails`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_details`
--
ALTER TABLE `contact_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_email`
--
ALTER TABLE `contact_email`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_form_email`
--
ALTER TABLE `contact_form_email`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_content`
--
ALTER TABLE `home_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `new_table_name`
--
ALTER TABLE `new_table_name`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `theme_setting`
--
ALTER TABLE `theme_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companyId` (`companyId`);

--
-- Indexes for table `website_setting`
--
ALTER TABLE `website_setting`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `color_setting`
--
ALTER TABLE `color_setting`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `companydetails`
--
ALTER TABLE `companydetails`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_details`
--
ALTER TABLE `contact_details`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact_email`
--
ALTER TABLE `contact_email`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `contact_form_email`
--
ALTER TABLE `contact_form_email`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `home_content`
--
ALTER TABLE `home_content`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `new_table_name`
--
ALTER TABLE `new_table_name`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `theme_setting`
--
ALTER TABLE `theme_setting`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=775;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `website_setting`
--
ALTER TABLE `website_setting`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`clientId`) REFERENCES `clients` (`id`);

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`registeredBy`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `clients_ibfk_2` FOREIGN KEY (`updatedBy`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `clients_ibfk_3` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`);

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `companydetails`
--
ALTER TABLE `companydetails`
  ADD CONSTRAINT `companydetails_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
