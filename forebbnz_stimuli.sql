-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 25, 2024 at 01:36 PM
-- Server version: 5.7.23-23
-- PHP Version: 8.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `forebbnz_stimuli`
--

-- --------------------------------------------------------

--
-- Table structure for table `affirmations`
--

CREATE TABLE `affirmations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `affirmation_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `voice_one` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `voice_two` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `voice_three` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `voice_four` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `affirmations`
--

INSERT INTO `affirmations` (`id`, `affirmation_text`, `voice_one`, `voice_two`, `voice_three`, `voice_four`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'मैं अपनी mistakes को सुधार कर एक better person बन रहा हूँ।', 'one', 'two', 'three', 'four', '1', '2024-03-21 05:21:57', '2024-05-29 01:31:59', NULL),
(2, 'मुझे मेरी self-worth पता है और मैं उसे accept करता हूँ।', 'one', 'two', 'three', 'four', '1', '2024-03-21 05:23:05', '2024-05-29 01:38:47', NULL),
(3, 'मैं खुद को without any condition स्वीकार करता हूं।', 'one', 'two', 'three', 'four', '1', '2024-03-21 05:23:36', '2024-05-29 01:40:41', NULL),
(4, ' मैं हर दिन Success के लिए कदम बड़ा रहा हूँ।', 'one', 'two', 'three', 'four', '1', '2024-03-21 05:24:14', '2024-05-29 01:42:06', NULL),
(5, 'मैं Fear की Place पर faith को चुनता हूँ।', 'one', 'two', 'three', 'four', '1', '2024-03-21 05:27:44', '2024-05-29 01:43:13', NULL),
(6, 'मैं love, compassion और sympathy को deserve करता हूँ।', 'one', 'two', 'three', 'four', '1', '2024-03-27 03:52:51', '2024-05-29 01:46:41', NULL),
(7, 'i m checking', '11', '22', '33', '44', '1', '2024-04-08 09:29:09', '2024-04-08 09:31:59', '2024-04-08 09:31:59'),
(8, 'i m checking', '11', '22', '33', '44', '1', '2024-04-08 09:29:36', '2024-04-08 09:31:55', '2024-04-08 09:31:55'),
(9, ' मैंने आज तक जो कुछ भी achieve किया है उस पर मुझे Proud है।', '11', '22', '33', '44', '1', '2024-04-08 09:31:26', '2024-05-29 01:48:27', NULL),
(10, 'i m checking', '11', '22', '33', '44', '1', '2024-04-08 09:32:10', '2024-05-29 01:48:48', '2024-05-29 01:48:48'),
(11, 'i m checking', '11', '22', '33', '44', '1', '2024-04-10 02:44:29', '2024-05-29 01:48:48', '2024-05-29 01:48:48'),
(12, 'i m checking', '11', '22', '33', '44', '1', '2024-04-11 02:12:54', '2024-05-29 01:48:48', '2024-05-29 01:48:48'),
(13, 'i m checking', '11', '22', '33', '44', '1', '2024-04-16 01:15:11', '2024-05-29 01:48:48', '2024-05-29 01:48:48'),
(14, 'i m checking', '11', '22', '33', '44', '1', '2024-04-16 04:30:20', '2024-05-29 01:48:48', '2024-05-29 01:48:48'),
(15, 'i m checking', '11', '22', '33', '44', '1', '2024-04-18 06:54:49', '2024-05-29 01:48:48', '2024-05-29 01:48:48'),
(16, 'मुझे खुद पर विश्वास है।', NULL, NULL, NULL, NULL, '1', '2024-05-01 01:55:16', '2024-05-29 01:48:48', '2024-05-29 01:48:48');

-- --------------------------------------------------------

--
-- Table structure for table `affirmation_category`
--

CREATE TABLE `affirmation_category` (
  `affirmation_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `affirmation_category`
--

INSERT INTO `affirmation_category` (`affirmation_id`, `category_id`) VALUES
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 17),
(1, 17),
(2, 17),
(3, 17),
(4, 17),
(5, 17),
(6, 17),
(9, 17);

-- --------------------------------------------------------

--
-- Table structure for table `affirmation_favorite`
--

CREATE TABLE `affirmation_favorite` (
  `favorite_id` bigint(20) UNSIGNED NOT NULL,
  `affirmation_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `affirmation_favorite`
--

INSERT INTO `affirmation_favorite` (`favorite_id`, `affirmation_id`) VALUES
(1, 2),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `affirmation_group`
--

CREATE TABLE `affirmation_group` (
  `affirmation_id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `affirmation_group`
--

INSERT INTO `affirmation_group` (`affirmation_id`, `group_id`) VALUES
(6, 5),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 5),
(1, 5),
(2, 5),
(3, 5),
(4, 5),
(5, 5),
(9, 5);

-- --------------------------------------------------------

--
-- Table structure for table `bgsounds`
--

CREATE TABLE `bgsounds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bgsound_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sound` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_premium` int(255) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bgsounds`
--

INSERT INTO `bgsounds` (`id`, `bgsound_name`, `sound`, `status`, `is_premium`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Volume One', 'test', '1', 0, '2024-03-21 05:29:26', '2024-04-30 04:34:08', NULL),
(2, 'Volume Two', 'test', '1', 1, '2024-03-21 05:30:16', '2024-04-30 04:41:59', NULL),
(3, 'Volume Three', 'test', '1', 1, '2024-03-21 06:37:30', '2024-04-30 04:45:10', NULL),
(4, 'Volume Four', 'test', '1', 1, '2024-04-11 06:21:07', '2024-04-30 04:46:34', NULL),
(5, 'madditation', NULL, '1', 1, '2024-04-12 06:03:52', '2024-04-30 04:46:46', '2024-04-30 04:46:46'),
(6, 'Volume One', NULL, '1', 1, '2024-04-30 04:19:17', '2024-04-30 04:46:46', '2024-04-30 04:46:46'),
(7, 'madditation', NULL, '1', 1, '2024-04-30 04:20:23', '2024-04-30 04:46:46', '2024-04-30 04:46:46'),
(8, 'Checking Test', NULL, '1', 0, '2024-04-30 05:46:15', '2024-05-29 01:22:44', '2024-05-29 01:22:44'),
(9, 'Volume Five', NULL, '1', 0, '2024-05-28 05:00:20', '2024-05-29 01:22:34', '2024-05-29 01:22:34'),
(10, 'Volume Six', NULL, '1', 0, '2024-05-28 05:02:08', '2024-05-29 01:22:34', '2024-05-29 01:22:34'),
(11, 'Volume sevan', NULL, '1', 0, '2024-05-28 05:02:35', '2024-05-29 01:22:34', '2024-05-29 01:22:34'),
(12, 'Volume Eight', NULL, '1', 0, '2024-05-28 05:03:56', '2024-05-29 01:22:34', '2024-05-29 01:22:34'),
(13, 'Volume Nine', NULL, '1', 0, '2024-05-28 05:04:42', '2024-05-29 01:22:34', '2024-05-29 01:22:34'),
(14, 'Volume Ten', NULL, '1', 0, '2024-05-28 05:05:15', '2024-05-29 01:22:34', '2024-05-29 01:22:34'),
(15, 'Volume Eleven', NULL, '1', 0, '2024-05-28 05:06:11', '2024-05-29 01:22:34', '2024-05-29 01:22:34');

-- --------------------------------------------------------

--
-- Table structure for table `bg_categories`
--

CREATE TABLE `bg_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bg_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bg_categories`
--

INSERT INTO `bg_categories` (`id`, `bg_name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Relax', '1', '2024-03-21 05:24:35', '2024-03-21 05:25:16', NULL),
(2, 'Focus', '1', '2024-03-21 05:25:05', '2024-03-21 05:25:05', NULL),
(3, 'Sleep', '1', '2024-03-21 05:25:26', '2024-03-21 05:25:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bg_category_bgsound`
--

CREATE TABLE `bg_category_bgsound` (
  `bgsound_id` bigint(20) UNSIGNED NOT NULL,
  `bg_category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bg_category_bgsound`
--

INSERT INTO `bg_category_bgsound` (`bgsound_id`, `bg_category_id`) VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 3),
(5, 3),
(6, 3),
(7, 2),
(8, 2),
(9, 1),
(10, 3),
(11, 2),
(12, 2),
(13, 1),
(14, 3),
(15, 1),
(15, 2);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `categories_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categories_name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'A waken Your Money Power', '1', '2024-03-21 04:55:52', '2024-03-28 04:57:17', '2024-03-28 04:57:17'),
(2, 'Billionaire Mindset', '1', '2024-03-21 04:57:08', '2024-03-21 04:57:08', NULL),
(3, 'Change your beliefs About', '1', '2024-03-21 05:00:19', '2024-03-21 05:00:19', NULL),
(4, 'Debt Management', '1', '2024-03-21 05:01:26', '2024-03-21 05:01:26', NULL),
(5, 'Get Out of Debt', '1', '2024-03-21 05:04:01', '2024-03-21 05:04:01', NULL),
(6, 'Manifest Wealth  ', '1', '2024-03-21 05:05:55', '2024-03-21 05:05:55', NULL),
(7, 'Gynecologists', '1', '2024-03-27 09:21:29', '2024-03-27 09:31:55', NULL),
(8, 'test', '1', '2024-03-28 02:20:24', '2024-03-28 02:20:24', NULL),
(9, 'test', '1', '2024-03-28 02:27:10', '2024-03-28 02:27:10', NULL),
(10, 'Gynecol', '1', '2024-03-28 02:36:06', '2024-03-28 02:36:06', NULL),
(11, 'TestCategory', '1', '2024-03-28 02:56:52', '2024-03-28 02:56:52', NULL),
(12, 'Gynecologists', '1', '2024-03-28 04:50:20', '2024-03-28 04:50:20', NULL),
(13, 'Plastic and Reconstructive Surgeon', '1', '2024-03-28 04:51:29', '2024-03-28 04:51:29', NULL),
(14, 'Gynecologists', '1', '2024-03-28 04:52:28', '2024-03-28 04:57:23', '2024-03-28 04:57:23'),
(15, 'test', '0', '2024-03-28 04:57:34', '2024-03-28 04:58:41', NULL),
(16, 'Gynecol', '1', '2024-03-28 05:04:22', '2024-04-02 00:59:10', '2024-04-02 00:59:10'),
(17, 'खुद से प्यार', '1', '2024-05-01 01:36:26', '2024-05-01 01:40:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_favorite`
--

CREATE TABLE `category_favorite` (
  `favorite_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_favorite`
--

INSERT INTO `category_favorite` (`favorite_id`, `category_id`) VALUES
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `category_group`
--

CREATE TABLE `category_group` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_group`
--

INSERT INTO `category_group` (`category_id`, `group_id`) VALUES
(17, 5),
(7, 7),
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `iso` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `nicename` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  `phonecode` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL, 0),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, 0),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL, 246),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56),
(44, 'CN', 'CHINA', 'China', 'CHN', 156, 86),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL, 61),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, 672),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 242),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506),
(53, 'CI', 'COTE D\'IVOIRE', 'Cote D\'Ivoire', 'CIV', 384, 225),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203, 420),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1809),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, 0),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL, 0),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354),
(99, 'IN', 'INDIA', 'India', 'IND', 356, 91),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'Korea, Democratic People\'s Republic of', 'PRK', 408, 850),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996),
(116, 'LA', 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC', 'Lao People\'s Democratic Republic', 'LAO', 418, 856),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230),
(137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL, 269),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595),
(168, 'PE', 'PERU', 'Peru', 'PER', 604, 51),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642, 40),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 70),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221),
(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL, 381),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL, 670),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 7370),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, 1),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263);

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `item`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, '2024-05-24 01:00:25', '2024-06-10 12:13:19', '2024-06-12 08:23:43'),
(2, NULL, '2024-05-24 01:00:33', '2024-06-10 12:17:24', '2024-06-12 08:23:51'),
(3, NULL, '2024-05-24 01:00:38', '2024-05-24 01:00:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `favorite_user`
--

CREATE TABLE `favorite_user` (
  `favorite_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favorite_user`
--

INSERT INTO `favorite_user` (`favorite_id`, `user_id`) VALUES
(1, 3),
(2, 2),
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `group_name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Money Mastery ', '1', '2024-03-21 10:20:10', '2024-03-21 04:53:26', NULL),
(2, 'Sleep And Relaxation', '1', '2024-03-21 05:07:51', '2024-03-21 05:07:51', NULL),
(3, 'Relationships', '1', '2024-03-21 05:16:23', '2024-03-21 05:17:28', NULL),
(4, 'Positive Thinking', '1', '2024-03-21 05:17:46', '2024-03-21 05:17:46', NULL),
(5, 'Personal Growth', '1', '2024-03-21 05:18:10', '2024-03-21 05:18:10', NULL),
(6, 'Family Life', '1', '2024-03-21 05:18:36', '2024-03-21 05:18:36', NULL),
(7, 'Law Of Attraction', '1', '2024-03-21 05:19:11', '2024-03-21 05:19:11', NULL),
(8, 'Addctions', '1', '2024-03-21 05:19:33', '2024-03-21 05:19:33', NULL),
(9, 'chill song qqqq', '1', '2024-03-27 08:25:31', '2024-03-27 08:25:31', NULL),
(10, 'chill song', '1', '2024-03-28 05:24:14', '2024-03-28 05:24:14', NULL),
(11, 'sdsdsd', '1', '2024-03-28 05:25:36', '2024-03-28 05:25:36', NULL),
(12, 'chill song ', '1', '2024-03-28 05:26:17', '2024-03-28 05:36:05', NULL),
(13, 'chill song', '1', '2024-03-28 05:27:55', '2024-03-28 05:27:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `last_session`
--

CREATE TABLE `last_session` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000' ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `last_session`
--

INSERT INTO `last_session` (`id`, `user_id`, `category_id`, `date`, `time`, `created_at`, `updated_at`, `deleted_at`) VALUES
(62, 11, 17, '2024-05-30', '17:52:16', '2024-05-30 12:22:16.000000', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00'),
(100, 11, 2, '2024-06-06', '11:22:47', '2024-06-06 05:52:47.000000', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00'),
(111, 1, 7, '2024-06-06', '15:16:37', '2024-06-06 09:46:37.000000', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00'),
(149, 1, 4, '2024-06-07', '17:24:49', '2024-06-07 11:54:49.000000', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00'),
(247, 1, 17, '2024-06-13', '18:56:17', '2024-06-13 13:26:17.000000', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00'),
(265, 1, 2, '2024-06-26', '17:31:46', '2024-06-26 12:01:46.000000', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00'),
(266, 1, 3, '2024-06-26', '17:34:54', '2024-06-26 12:04:54.000000', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_time` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `response` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `user_id`, `user_name`, `date_time`, `status`, `response`, `created_at`) VALUES
(1, 2, 'bhupendra', '20:29:00', '0', '{\"multicast_id\":6590076861570856976,\"success\":0,\"failure\":1,\"canonical_ids\":0,\"results\":[{\"error\":\"NotRegistered\"}]}', '2024-05-29 14:59:49.000000'),
(2, 2, 'bhupendra', '20:35:00', '0', '{\"multicast_id\":6001636854590225020,\"success\":0,\"failure\":1,\"canonical_ids\":0,\"results\":[{\"error\":\"NotRegistered\"}]}', '2024-05-29 15:05:03.000000'),
(3, 2, 'bhupendra', '20:35:00', '0', '{\"multicast_id\":3613156676897581568,\"success\":0,\"failure\":1,\"canonical_ids\":0,\"results\":[{\"error\":\"NotRegistered\"}]}', '2024-05-29 15:05:07.000000');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Category', 1, '4f4b73db-03c4-4f4c-95c2-9d133899e0be', 'category_categories_image', 'download (7)', 'download-(7).jpg', 'image/jpeg', 'public', 'public', 3849, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 1, '2024-03-21 04:55:49', '2024-03-21 04:55:52'),
(3, 'App\\Models\\Category', 3, 'bee51744-ba24-4106-9e0a-66ebd3feff8f', 'category_categories_image', 'download (8)', 'download-(8).jpg', 'image/jpeg', 'public', 'public', 7819, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 1, '2024-03-21 05:00:14', '2024-03-21 05:00:19'),
(4, 'App\\Models\\Category', 4, '797bb8e2-45e6-4790-b384-a53595706449', 'category_categories_image', 'download (9)', 'download-(9).jpg', 'image/jpeg', 'public', 'public', 9396, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 1, '2024-03-21 05:01:22', '2024-03-21 05:01:26'),
(5, 'App\\Models\\Category', 5, '83ea12ab-f709-4348-bfe9-d39a4bd28c22', 'category_categories_image', 'download (10)', 'download-(10).jpg', 'image/jpeg', 'public', 'public', 8101, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 1, '2024-03-21 05:03:58', '2024-03-21 05:04:01'),
(6, 'App\\Models\\Category', 6, '3c41a21b-ae17-4065-86a6-6c14f2834850', 'category_categories_image', 'images (2)', 'images-(2).jpg', 'image/jpeg', 'public', 'public', 7690, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 1, '2024-03-21 05:05:51', '2024-03-21 05:19:54'),
(7, 'App\\Models\\Bgsound', 1, '1a236276-484d-4f71-bc57-e3ee00728afa', 'bgsound_bgsound_image', 'gugsali8_happy-faces_625x300_20_March_23', 'gugsali8_happy-faces_625x300_20_March_23.png', 'image/webp', 'public', 'public', 149008, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 1, '2024-03-21 05:29:20', '2024-04-30 06:36:39'),
(8, 'App\\Models\\Bgsound', 2, 'a0c842f3-df6f-4b23-9327-1771f6845c3d', 'bgsound_bgsound_image', 'hollybood1', 'hollybood1.jpg', 'image/jpeg', 'public', 'public', 60927, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 1, '2024-03-21 05:30:10', '2024-06-11 07:27:43'),
(9, 'App\\Models\\Bgsound', 0, '9f698a68-6acc-4a14-aed0-11096ed52da6', 'bgsound_bgsound_image', 'download (1)', 'download-(1).png', 'image/png', 'public', 'public', 3323, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 1, '2024-03-21 06:19:59', '2024-03-21 06:20:00'),
(10, 'App\\Models\\Bgsound', 0, 'b1800eb6-d4f6-4d41-a889-b0d89026d6df', 'bgsound_bgsound_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 2, '2024-03-21 06:36:16', '2024-03-21 06:36:17'),
(12, 'App\\Models\\Category', 0, 'd0981ca6-1651-4bd4-a356-7437b3f496ba', 'category_categories_image', 'dkfk', 'dkfk.jpg', 'image/jpeg', 'public', 'public', 8373, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 1, '2024-03-27 08:55:34', '2024-03-27 08:55:37'),
(13, 'App\\Models\\Category', 0, 'db567237-9608-4712-80d8-ec5c2350b729', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 2, '2024-03-27 08:57:11', '2024-03-27 08:57:11'),
(14, 'App\\Models\\Category', 0, '31f6c5de-c9b9-45e6-acae-bf83054b61d3', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 3, '2024-03-27 09:01:07', '2024-03-27 09:01:08'),
(15, 'App\\Models\\Category', 0, '2217e524-f4bf-4794-8ff2-f33e26a78167', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 4, '2024-03-27 09:03:46', '2024-03-27 09:03:47'),
(16, 'App\\Models\\Category', 0, '3bc3162c-bd86-4a44-adfb-40bbfba42c1f', 'category_categories_image', 'dkfk', 'dkfk.jpg', 'image/jpeg', 'public', 'public', 8373, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 5, '2024-03-27 09:10:47', '2024-03-27 09:10:48'),
(17, 'App\\Models\\Category', 0, '60a4cba3-930c-447a-981a-2a80b4371a58', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 6, '2024-03-27 09:12:05', '2024-03-27 09:12:05'),
(18, 'App\\Models\\Category', 0, 'c5cd51e8-ac96-4cd7-909d-25c2ec2c9ce3', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 7, '2024-03-27 09:15:49', '2024-03-27 09:15:50'),
(20, 'App\\Models\\Category', 0, '1412f709-666b-4589-8820-be64d0de1de6', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 8, '2024-03-28 01:03:11', '2024-03-28 01:03:14'),
(21, 'App\\Models\\Category', 0, '3ad7ba98-325e-4e48-a30a-29c3e449309f', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 9, '2024-03-28 01:07:55', '2024-03-28 01:07:56'),
(22, 'App\\Models\\Category', 0, '69432258-4c15-4bdf-a133-ab6d1e4aecb3', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 10, '2024-03-28 01:12:04', '2024-03-28 01:12:04'),
(23, 'App\\Models\\Category', 0, '10ee9935-3d01-46ac-b53b-ab50014c7d49', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 11, '2024-03-28 01:13:09', '2024-03-28 01:13:09'),
(24, 'App\\Models\\Category', 0, 'df1ca5ba-8516-4b9a-b3fe-21728e57cf0c', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 12, '2024-03-28 01:15:04', '2024-03-28 01:15:04'),
(25, 'App\\Models\\Category', 0, '50dd3ec0-5106-40f4-b0b5-9e12f20c993e', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 13, '2024-03-28 02:04:34', '2024-03-28 02:04:37'),
(26, 'App\\Models\\Category', 0, '64a9bdb5-589a-4a01-971c-fc3a4765f9b0', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 14, '2024-03-28 02:15:05', '2024-03-28 02:15:06'),
(27, 'App\\Models\\Category', 0, '7d43670c-1bf4-4e52-8d92-f7aa86542f63', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 15, '2024-03-28 02:16:37', '2024-03-28 02:16:37'),
(28, 'App\\Models\\Category', 0, 'cb5fdac2-1843-429d-912f-5c44332fd01d', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 16, '2024-03-28 02:17:03', '2024-03-28 02:17:04'),
(29, 'App\\Models\\Category', 0, '013c681f-e1cb-4c1f-8854-53d3b2dda770', 'category_categories_image', 'download (1)', 'download-(1).jpg', 'image/jpeg', 'public', 'public', 8568, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 17, '2024-03-28 02:17:41', '2024-03-28 02:17:42'),
(30, 'App\\Models\\Category', 0, '36fa81b9-8c6e-42e2-8a59-6013e91fa325', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 18, '2024-03-28 02:18:16', '2024-03-28 02:18:17'),
(31, 'App\\Models\\Category', 0, '9b9cfaa9-541f-496a-8353-20a1cf1cef36', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 19, '2024-03-28 02:19:09', '2024-03-28 02:19:10'),
(32, 'App\\Models\\Category', 8, 'fb86b99d-59a6-45b3-b5d2-4f5c8c136215', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 20, '2024-03-28 02:20:04', '2024-03-28 02:20:24'),
(33, 'App\\Models\\Category', 0, '0440fd08-913d-46fa-ae69-1a6742f75564', 'category_categories_image', 'Covers-2', 'Covers-2.jpeg', 'image/jpeg', 'public', 'public', 81873, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 20, '2024-03-28 02:26:33', '2024-03-28 02:26:34'),
(34, 'App\\Models\\Category', 0, '68b8e345-997e-4b46-ba5d-1bd9a29234fa', 'category_categories_image', 'depositphotos_84028170-stock-photo-work-hard-dream-big-on', 'depositphotos_84028170-stock-photo-work-hard-dream-big-on.jpg', 'image/jpeg', 'public', 'public', 102699, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 21, '2024-03-28 02:27:09', '2024-03-28 02:27:10'),
(35, 'App\\Models\\Category', 10, '8eef65d1-da9a-4af8-b4d1-4a4245da52c5', 'category_categories_image', 'Covers-2', 'Covers-2.jpeg', 'image/jpeg', 'public', 'public', 81873, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 22, '2024-03-28 02:34:48', '2024-03-28 02:36:06'),
(36, 'App\\Models\\Category', 0, '82dcab53-f72a-4617-a137-29f96affbd52', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 22, '2024-03-28 02:41:10', '2024-03-28 02:41:11'),
(37, 'App\\Models\\Category', 0, 'ba04c647-a171-4b0b-b9c5-79220257eeef', 'category_categories_image', 'Congratulation-1', 'Congratulation-1.jpeg', 'image/jpeg', 'public', 'public', 157731, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 23, '2024-03-28 02:44:53', '2024-03-28 02:44:54'),
(38, 'App\\Models\\Category', 0, '94b1c490-7dc3-4826-930f-939b273bb87a', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 24, '2024-03-28 02:46:05', '2024-03-28 02:46:06'),
(39, 'App\\Models\\Category', 0, '171acdbb-0215-4b4f-9bf3-cba6dff3e105', 'category_categories_image', 'download (1)', 'download-(1).jpg', 'image/jpeg', 'public', 'public', 8568, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 25, '2024-03-28 02:46:57', '2024-03-28 02:46:57'),
(40, 'App\\Models\\Category', 0, 'f29c8837-733f-42d6-8435-00b15e77ef64', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 26, '2024-03-28 02:47:39', '2024-03-28 02:47:40'),
(41, 'App\\Models\\Category', 0, '56f88b14-71a5-48a4-8d54-0e6611025f88', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 27, '2024-03-28 02:48:50', '2024-03-28 02:48:50'),
(42, 'App\\Models\\Category', 0, '561fd799-39f6-489c-acc8-e7792d831a4a', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 28, '2024-03-28 02:50:17', '2024-03-28 02:50:17'),
(43, 'App\\Models\\Category', 11, '555c2f03-1f74-4976-a30f-21686fc56b45', 'category_categories_image', 'dkfk', 'dkfk.jpg', 'image/jpeg', 'public', 'public', 8373, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 29, '2024-03-28 02:56:41', '2024-03-28 02:56:52'),
(44, 'App\\Models\\Category', 0, '63cb095d-06f2-48d8-9020-3687d7e5dff9', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 29, '2024-03-28 02:58:34', '2024-03-28 02:58:35'),
(45, 'App\\Models\\Category', 0, 'fd59104d-8f51-456e-a3c1-a4f263e6a9a0', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 30, '2024-03-28 03:55:50', '2024-03-28 03:55:53'),
(46, 'App\\Models\\Category', 0, '800aa67c-e6fe-46e0-be6e-c4eef0b6cb61', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 31, '2024-03-28 03:59:20', '2024-03-28 03:59:20'),
(47, 'App\\Models\\Category', 0, '9b2e942f-5880-4b47-8a35-5fc15ee36407', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 32, '2024-03-28 04:03:30', '2024-03-28 04:03:31'),
(48, 'App\\Models\\Category', 0, '574be24c-425a-47ad-9196-c151f3d77aea', 'category_categories_image', 'dkfk', 'dkfk.jpg', 'image/jpeg', 'public', 'public', 8373, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 33, '2024-03-28 04:07:18', '2024-03-28 04:07:19'),
(49, 'App\\Models\\Category', 0, '324af6c0-2e0e-4d17-9d29-4f310f0a7408', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 34, '2024-03-28 04:08:51', '2024-03-28 04:08:51'),
(50, 'App\\Models\\Category', 0, '427757c9-9f06-46c2-95d8-1a3b3a68050c', 'category_categories_image', 'depositphotos_84028170-stock-photo-work-hard-dream-big-on', 'depositphotos_84028170-stock-photo-work-hard-dream-big-on.jpg', 'image/jpeg', 'public', 'public', 102699, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 35, '2024-03-28 04:11:38', '2024-03-28 04:11:39'),
(51, 'App\\Models\\Category', 0, '8d7a21c4-c61b-4b52-89fc-61ecf25a6233', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 36, '2024-03-28 04:13:24', '2024-03-28 04:13:25'),
(52, 'App\\Models\\Category', 0, '0b945fcb-c3d1-4b2c-b64f-e94a1ef1897e', 'category_categories_image', 'depositphotos_84028170-stock-photo-work-hard-dream-big-on', 'depositphotos_84028170-stock-photo-work-hard-dream-big-on.jpg', 'image/jpeg', 'public', 'public', 102699, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 37, '2024-03-28 04:14:41', '2024-03-28 04:14:42'),
(53, 'App\\Models\\Category', 0, '0e40ab9c-1d96-4d3e-bf25-54a706c02da7', 'category_categories_image', 'depositphotos_84028170-stock-photo-work-hard-dream-big-on', 'depositphotos_84028170-stock-photo-work-hard-dream-big-on.jpg', 'image/jpeg', 'public', 'public', 102699, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 38, '2024-03-28 04:15:47', '2024-03-28 04:15:48'),
(54, 'App\\Models\\Category', 0, '3552c94e-e63f-4993-8d47-73e6b7b4a1bc', 'category_categories_image', 'depositphotos_84028170-stock-photo-work-hard-dream-big-on', 'depositphotos_84028170-stock-photo-work-hard-dream-big-on.jpg', 'image/jpeg', 'public', 'public', 102699, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 39, '2024-03-28 04:17:07', '2024-03-28 04:17:08'),
(55, 'App\\Models\\Category', 0, '083e872d-2b5f-411f-8e30-db5ad668015e', 'category_categories_image', 'depositphotos_84028170-stock-photo-work-hard-dream-big-on', 'depositphotos_84028170-stock-photo-work-hard-dream-big-on.jpg', 'image/jpeg', 'public', 'public', 102699, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 40, '2024-03-28 04:18:59', '2024-03-28 04:19:00'),
(56, 'App\\Models\\Category', 0, '38c8d0f8-8221-4a3f-90ca-bc230c99e52d', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 41, '2024-03-28 04:21:04', '2024-03-28 04:21:05'),
(57, 'App\\Models\\Category', 0, '4af3a34f-ce05-4330-85f1-bf89e24f3808', 'category_categories_image', 'depositphotos_84028170-stock-photo-work-hard-dream-big-on', 'depositphotos_84028170-stock-photo-work-hard-dream-big-on.jpg', 'image/jpeg', 'public', 'public', 102699, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 42, '2024-03-28 04:27:40', '2024-03-28 04:27:41'),
(58, 'App\\Models\\Category', 0, '62493a99-8002-4ddd-90d9-1cc2d5f48b70', 'category_categories_image', 'depositphotos_84028170-stock-photo-work-hard-dream-big-on', 'depositphotos_84028170-stock-photo-work-hard-dream-big-on.jpg', 'image/jpeg', 'public', 'public', 102699, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 43, '2024-03-28 04:29:06', '2024-03-28 04:29:07'),
(59, 'App\\Models\\Category', 0, '5539f210-df12-4a2e-bdd2-cb8905bcfcc7', 'category_categories_image', 'depositphotos_84028170-stock-photo-work-hard-dream-big-on', 'depositphotos_84028170-stock-photo-work-hard-dream-big-on.jpg', 'image/jpeg', 'public', 'public', 102699, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 44, '2024-03-28 04:30:20', '2024-03-28 04:30:21'),
(60, 'App\\Models\\Category', 0, '84e2648c-3c1e-4b06-9754-86295e1d44e3', 'category_categories_image', 'depositphotos_84028170-stock-photo-work-hard-dream-big-on', 'depositphotos_84028170-stock-photo-work-hard-dream-big-on.jpg', 'image/jpeg', 'public', 'public', 102699, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 45, '2024-03-28 04:31:18', '2024-03-28 04:31:18'),
(61, 'App\\Models\\Category', 0, 'ae1792c1-4cf0-45ac-a161-c72b8f8eb541', 'category_categories_image', 'depositphotos_84028170-stock-photo-work-hard-dream-big-on', 'depositphotos_84028170-stock-photo-work-hard-dream-big-on.jpg', 'image/jpeg', 'public', 'public', 102699, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 46, '2024-03-28 04:32:11', '2024-03-28 04:32:12'),
(62, 'App\\Models\\Category', 0, '4ef7eb2f-d8d5-415f-abe2-be7af2fa0398', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 47, '2024-03-28 04:45:32', '2024-03-28 04:45:32'),
(63, 'App\\Models\\Category', 0, 'ddd28336-86df-4f8e-83db-cf7021a34503', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 48, '2024-03-28 04:48:03', '2024-03-28 04:48:04'),
(64, 'App\\Models\\Category', 12, 'bbf49a4d-0acc-43a7-b269-b83a9eae2312', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 49, '2024-03-28 04:50:06', '2024-03-28 04:50:20'),
(65, 'App\\Models\\Category', 13, '775acff1-2ff7-4c44-98d7-f01ea4ceb2d0', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 49, '2024-03-28 04:51:26', '2024-03-28 04:51:29'),
(66, 'App\\Models\\Category', 14, '94d897e3-ef6a-4910-a008-bfccb2a510f0', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 49, '2024-03-28 04:52:20', '2024-03-28 04:52:28'),
(67, 'App\\Models\\Category', 15, 'b9a975f9-21dc-4c32-90b0-dd0f5bdf1140', 'category_categories_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 49, '2024-03-28 04:57:30', '2024-03-28 04:58:52'),
(68, 'App\\Models\\Category', 16, 'af992791-f6b1-4a7e-b582-756a838daaa5', 'category_categories_image', 'download (8)', 'download-(8).jpg', 'image/jpeg', 'public', 'public', 7819, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 49, '2024-03-28 05:04:11', '2024-03-28 05:04:22'),
(69, 'App\\Models\\Bgsound', 5, 'fbdaf203-263c-4223-8bf0-d916178ed833', 'bgsound_sound', 'canvas', 'canvas.mp3', 'audio/mpeg', 'public', 'public', 22372, '[]', '[]', '[]', '[]', 3, '2024-04-12 06:03:39', '2024-04-12 06:03:52'),
(70, 'App\\Models\\Bgsound', 5, 'fe387bd7-790b-4d19-9883-9b9de193a3c0', 'bgsound_bgsound_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 4, '2024-04-12 06:03:44', '2024-04-12 06:03:52'),
(76, 'App\\Models\\Bgsound', 0, '1482e053-cd44-47bc-b11f-44fa45768a51', 'bgsound_bgsound_image', 'download (1)', 'download-(1).png', 'image/png', 'public', 'public', 3323, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 3, '2024-04-30 01:42:02', '2024-04-30 01:42:02'),
(77, 'App\\Models\\Bgsound', 0, 'c244d9f1-2cda-48e5-b23e-da52a7fcfd71', 'bgsound_bgsound_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 4, '2024-04-30 01:47:57', '2024-04-30 01:47:57'),
(78, 'App\\Models\\Bgsound', 0, '7c37651a-871a-41b2-9e02-363ee57ca852', 'bgsound_bgsound_image', 'download (1)', 'download-(1).png', 'image/png', 'public', 'public', 3323, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 5, '2024-04-30 01:48:09', '2024-04-30 01:48:09'),
(79, 'App\\Models\\Bgsound', 0, '4dfb4513-be26-4336-90b4-609e193bd6b0', 'bgsound_bgsound_image', 'crewstore-log', 'crewstore-log.png', 'image/png', 'public', 'public', 70476, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 6, '2024-04-30 01:56:12', '2024-04-30 01:56:12'),
(80, 'App\\Models\\Bgsound', 0, '44642185-b229-4569-b5a7-a95dce2b357b', 'bgsound_sound', 'blender', 'blender.mp3', 'audio/mpeg', 'public', 'public', 16521, '[]', '[]', '[]', '[]', 7, '2024-04-30 02:10:37', '2024-04-30 02:10:37'),
(81, 'App\\Models\\Bgsound', 6, '7ab802b0-115a-47ec-847c-c7c1b665ad31', 'bgsound_sound', 'cloud', 'cloud.mp3', 'audio/mpeg', 'public', 'public', 16103, '[]', '[]', '[]', '[]', 8, '2024-04-30 04:18:59', '2024-04-30 04:19:18'),
(82, 'App\\Models\\Bgsound', 6, '048d00dc-4b09-4879-ac5f-a06227fec245', 'bgsound_bgsound_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 9, '2024-04-30 04:19:13', '2024-04-30 04:19:18'),
(83, 'App\\Models\\Bgsound', 7, '280ed6b6-c959-4b2f-927c-142321e08dd7', 'bgsound_sound', 'BgFourth', 'BgFourth.mp3', 'audio/mpeg', 'public', 'public', 9368137, '[]', '[]', '[]', '[]', 8, '2024-04-30 04:20:02', '2024-04-30 04:20:23'),
(84, 'App\\Models\\Bgsound', 7, '2e9b13e6-198b-4953-a3b6-1086590d68fd', 'bgsound_bgsound_image', 'crewstore-log', 'crewstore-log.png', 'image/png', 'public', 'public', 70476, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 9, '2024-04-30 04:20:12', '2024-04-30 04:20:23'),
(87, 'App\\Models\\Bgsound', 3, 'bdd0ddf2-de89-4163-b62d-893445df7ad6', 'bgsound_bgsound_image', 'download (1)', 'download-(1).png', 'image/png', 'public', 'public', 3323, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 8, '2024-04-30 04:42:54', '2024-06-11 07:27:16'),
(89, 'App\\Models\\Bgsound', 4, '23263219-5bd4-4116-b734-f16b19cbaa86', 'bgsound_bgsound_image', 'download (8)', 'download-(8).jpg', 'image/jpeg', 'public', 'public', 7819, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 8, '2024-04-30 04:46:19', '2024-06-11 07:25:52'),
(92, 'App\\Models\\Bgsound', 8, '3fa9c8d9-a666-4c1d-88ee-a95ecf658ca5', 'bgsound_bgsound_image', '[FREE - HDconvert.com] dkfk', '[FREE---HDconvert.com]-dkfk.png', 'image/png', 'public', 'public', 61404, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 9, '2024-04-30 05:46:09', '2024-04-30 06:25:05'),
(94, 'App\\Models\\Bgsound', 8, '62a2f22c-acf6-4b34-8134-e5bc44ee9e5d', 'bgsound_sound', 'BGONE', 'BGONE.mp3', 'audio/mpeg', 'public', 'public', 2269583, '[]', '[]', '[]', '[]', 8, '2024-04-30 06:24:54', '2024-04-30 06:25:05'),
(97, 'App\\Models\\Bgsound', 0, '21e87a87-8152-4bb4-bdb1-6c4d9fad9528', 'bgsound_sound', 'BGFOUR', 'BGFOUR.mp3', 'audio/mpeg', 'public', 'public', 2476452, '[]', '[]', '[]', '[]', 8, '2024-04-30 06:27:34', '2024-04-30 06:27:34'),
(99, 'App\\Models\\Bgsound', 1, 'ab3b9b77-b5d9-46cc-abdf-fac95529da2b', 'bgsound_sound', 'BGTHREE', 'BGTHREE.mp3', 'audio/mpeg', 'public', 'public', 2080557, '[]', '[]', '[]', '[]', 9, '2024-04-30 06:36:35', '2024-04-30 06:36:39'),
(100, 'App\\Models\\Affirmation', 16, 'bc7db433-2f82-422b-95e1-e7fd7a843776', 'affirmation_voice_one', '1714547844703qkqetrfg-voicemaker.in-speech', '1714547844703qkqetrfg-voicemaker.in-speech.mp3', 'audio/mpeg', 'public', 'public', 58036, '[]', '[]', '[]', '[]', 1, '2024-05-01 01:54:46', '2024-05-01 01:55:16'),
(101, 'App\\Models\\Affirmation', 16, '25279140-37a8-42cb-850c-c346df5fd7cc', 'affirmation_voice_three', 'मुझे खुद पर विश्वास ', 'मुझे-खुद-पर-विश्वास-.m4a', 'audio/x-m4a', 'public', 'public', 25293, '[]', '[]', '[]', '[]', 2, '2024-05-01 01:55:13', '2024-05-01 01:55:16'),
(102, 'App\\Models\\Bgsound', 9, '6123eb0b-42fd-4ea6-8eb8-90637797f931', 'bgsound_sound', 'MeApniMisteksKo', 'MeApniMisteksKo.mp3', 'audio/mpeg', 'public', 'public', 79245, '[]', '[]', '[]', '[]', 9, '2024-05-28 05:00:07', '2024-05-28 05:00:21'),
(103, 'App\\Models\\Bgsound', 0, '39f3fd9e-86d7-4ecd-b332-91f19d82c44f', 'bgsound_sound', 'MeFearKiPlaceParFaith', 'MeFearKiPlaceParFaith.wav', 'audio/mpeg', 'public', 'public', 10944, '[]', '[]', '[]', '[]', 9, '2024-05-28 05:01:31', '2024-05-28 05:01:31'),
(104, 'App\\Models\\Bgsound', 10, 'cf0a130d-f2b3-4dd9-b308-369f88f59e8e', 'bgsound_sound', 'MeFearKiPlaceParFaith', 'MeFearKiPlaceParFaith.wav', 'audio/mpeg', 'public', 'public', 10944, '[]', '[]', '[]', '[]', 10, '2024-05-28 05:02:03', '2024-05-28 05:02:09'),
(105, 'App\\Models\\Bgsound', 11, 'd2934ad4-a068-41f1-a743-d81038c4d872', 'bgsound_sound', 'MeHarDinSuccess', 'MeHarDinSuccess.mp3', 'audio/mpeg', 'public', 'public', 58125, '[]', '[]', '[]', '[]', 10, '2024-05-28 05:02:25', '2024-05-28 05:02:35'),
(106, 'App\\Models\\Bgsound', 12, '1447e40c-d659-4f74-85dc-3330c3fa0c3e', 'bgsound_sound', 'MeKhudKoWithout', 'MeKhudKoWithout.mp3', 'audio/mpeg', 'public', 'public', 63405, '[]', '[]', '[]', '[]', 10, '2024-05-28 05:03:49', '2024-05-28 05:03:56'),
(107, 'App\\Models\\Bgsound', 13, '5cbb74cb-475f-4840-aca1-237e50da9855', 'bgsound_sound', 'MeLoveCompassion', 'MeLoveCompassion.mp3', 'audio/mpeg', 'public', 'public', 69165, '[]', '[]', '[]', '[]', 10, '2024-05-28 05:04:34', '2024-05-28 05:04:42'),
(109, 'App\\Models\\Bgsound', 14, '8b60fe22-faab-4668-9bac-55d87e8c287d', 'bgsound_sound', 'MeneAajTakJoKuchBhi', 'MeneAajTakJoKuchBhi.mp3', 'audio/mpeg', 'public', 'public', 84045, '[]', '[]', '[]', '[]', 10, '2024-05-28 05:05:33', '2024-05-28 05:05:36'),
(110, 'App\\Models\\Bgsound', 15, 'ad3278c5-4c28-4df0-b6d0-b4025cb7b450', 'bgsound_sound', 'MujheMeriSelfWorthPataHai', 'MujheMeriSelfWorthPataHai.mp3', 'audio/mpeg', 'public', 'public', 80205, '[]', '[]', '[]', '[]', 10, '2024-05-28 05:05:59', '2024-05-28 05:06:11'),
(111, 'App\\Models\\Affirmation', 0, '70b1ac8a-2875-41f6-923f-d1aa26d8da6f', 'affirmation_voice_one', 'MeApniMisteksKo', 'MeApniMisteksKo.mp3', 'audio/mpeg', 'public', 'public', 79245, '[]', '[]', '[]', '[]', 1, '2024-05-29 01:19:53', '2024-05-29 01:19:53'),
(112, 'App\\Models\\Affirmation', 0, 'ae4ebf61-2e58-4104-aab6-d7e7224f1b4c', 'affirmation_voice_two', 'MeFearKiPlaceParFaith', 'MeFearKiPlaceParFaith.wav', 'audio/mpeg', 'public', 'public', 10944, '[]', '[]', '[]', '[]', 2, '2024-05-29 01:19:55', '2024-05-29 01:19:55'),
(113, 'App\\Models\\Affirmation', 0, 'dd5f5977-ee6c-416d-99cf-5b600a4edce7', 'affirmation_voice_three', 'MeKhudKoWithout', 'MeKhudKoWithout.mp3', 'audio/mpeg', 'public', 'public', 63405, '[]', '[]', '[]', '[]', 3, '2024-05-29 01:20:00', '2024-05-29 01:20:00'),
(114, 'App\\Models\\Affirmation', 0, 'b5ef0ea7-3ff3-4ef2-80a1-1432e2c1756f', 'affirmation_voice_four', 'MeKhudKoWithout', 'MeKhudKoWithout.mp3', 'audio/mpeg', 'public', 'public', 63405, '[]', '[]', '[]', '[]', 4, '2024-05-29 01:20:08', '2024-05-29 01:20:08'),
(115, 'App\\Models\\Affirmation', 1, '7d1ad4e3-995b-4036-ac1a-ae98cf412b23', 'affirmation_voice_one', 'MeApniMisteksKo', 'MeApniMisteksKo.mp3', 'audio/mpeg', 'public', 'public', 79245, '[]', '[]', '[]', '[]', 5, '2024-05-29 01:31:14', '2024-05-29 01:31:59'),
(116, 'App\\Models\\Affirmation', 1, 'af46e0a9-3621-4f0b-b529-5333d608be8c', 'affirmation_voice_two', 'MeApniMisteksKo', 'MeApniMisteksKo.mp3', 'audio/mpeg', 'public', 'public', 79245, '[]', '[]', '[]', '[]', 6, '2024-05-29 01:31:14', '2024-05-29 01:31:59'),
(117, 'App\\Models\\Affirmation', 1, '8d7bebca-7293-4424-9bad-7210bfdde8f4', 'affirmation_voice_three', 'MeApniMisteksKo', 'MeApniMisteksKo.mp3', 'audio/mpeg', 'public', 'public', 79245, '[]', '[]', '[]', '[]', 7, '2024-05-29 01:31:21', '2024-05-29 01:31:59'),
(118, 'App\\Models\\Affirmation', 1, 'e0859f5a-8185-4d69-9e79-4d31e8576de2', 'affirmation_voice_four', 'MeApniMisteksKo', 'MeApniMisteksKo.mp3', 'audio/mpeg', 'public', 'public', 79245, '[]', '[]', '[]', '[]', 8, '2024-05-29 01:31:25', '2024-05-29 01:31:59'),
(119, 'App\\Models\\Affirmation', 2, '5f0251c3-818a-4030-a65c-cfa4125ced18', 'affirmation_voice_one', 'MujheMeriSelfWorthPataHai', 'MujheMeriSelfWorthPataHai.mp3', 'audio/mpeg', 'public', 'public', 80205, '[]', '[]', '[]', '[]', 5, '2024-05-29 01:38:24', '2024-05-29 01:38:47'),
(120, 'App\\Models\\Affirmation', 2, '759780b7-9a1c-4347-9c1d-fa29a6be72a9', 'affirmation_voice_two', 'MujheMeriSelfWorthPataHai', 'MujheMeriSelfWorthPataHai.mp3', 'audio/mpeg', 'public', 'public', 80205, '[]', '[]', '[]', '[]', 6, '2024-05-29 01:38:26', '2024-05-29 01:38:47'),
(121, 'App\\Models\\Affirmation', 2, '46cb69a5-64f9-4dca-b1a8-f56bd7cd70ee', 'affirmation_voice_three', 'MujheMeriSelfWorthPataHai', 'MujheMeriSelfWorthPataHai.mp3', 'audio/mpeg', 'public', 'public', 80205, '[]', '[]', '[]', '[]', 7, '2024-05-29 01:38:30', '2024-05-29 01:38:47'),
(122, 'App\\Models\\Affirmation', 2, 'b39f2d21-cd86-40a1-a7d0-8141aa861301', 'affirmation_voice_four', 'MujheMeriSelfWorthPataHai', 'MujheMeriSelfWorthPataHai.mp3', 'audio/mpeg', 'public', 'public', 80205, '[]', '[]', '[]', '[]', 8, '2024-05-29 01:38:33', '2024-05-29 01:38:47'),
(123, 'App\\Models\\Affirmation', 3, '172748a0-3467-47c5-b7f7-67e832f2c8a8', 'affirmation_voice_one', 'MeKhudKoWithout', 'MeKhudKoWithout.mp3', 'audio/mpeg', 'public', 'public', 63405, '[]', '[]', '[]', '[]', 5, '2024-05-29 01:40:15', '2024-05-29 01:40:41'),
(124, 'App\\Models\\Affirmation', 3, '62537202-0813-42dd-a097-8d405a9726e0', 'affirmation_voice_two', 'MeKhudKoWithout', 'MeKhudKoWithout.mp3', 'audio/mpeg', 'public', 'public', 63405, '[]', '[]', '[]', '[]', 6, '2024-05-29 01:40:20', '2024-05-29 01:40:41'),
(125, 'App\\Models\\Affirmation', 3, '289e1005-8b7b-4db0-9b42-c1534631d454', 'affirmation_voice_three', 'MeKhudKoWithout', 'MeKhudKoWithout.mp3', 'audio/mpeg', 'public', 'public', 63405, '[]', '[]', '[]', '[]', 7, '2024-05-29 01:40:23', '2024-05-29 01:40:41'),
(126, 'App\\Models\\Affirmation', 3, 'c10045e2-c815-40fe-9b6f-27802d7bbddb', 'affirmation_voice_four', 'MeKhudKoWithout', 'MeKhudKoWithout.mp3', 'audio/mpeg', 'public', 'public', 63405, '[]', '[]', '[]', '[]', 8, '2024-05-29 01:40:27', '2024-05-29 01:40:41'),
(127, 'App\\Models\\Affirmation', 4, '1031c36f-e5af-42c7-bfac-25ae0f9564a1', 'affirmation_voice_one', 'MeHarDinSuccess', 'MeHarDinSuccess.mp3', 'audio/mpeg', 'public', 'public', 58125, '[]', '[]', '[]', '[]', 5, '2024-05-29 01:41:33', '2024-05-29 01:42:07'),
(128, 'App\\Models\\Affirmation', 4, '061b1959-9163-4dc8-9f57-751d68f70287', 'affirmation_voice_two', 'MeHarDinSuccess', 'MeHarDinSuccess.mp3', 'audio/mpeg', 'public', 'public', 58125, '[]', '[]', '[]', '[]', 6, '2024-05-29 01:41:37', '2024-05-29 01:42:07'),
(129, 'App\\Models\\Affirmation', 4, '44246dc8-cb12-4ff9-89c6-277544291690', 'affirmation_voice_three', 'MeHarDinSuccess', 'MeHarDinSuccess.mp3', 'audio/mpeg', 'public', 'public', 58125, '[]', '[]', '[]', '[]', 7, '2024-05-29 01:41:46', '2024-05-29 01:42:07'),
(130, 'App\\Models\\Affirmation', 4, '9b437495-2a54-4222-97e6-081db17f5615', 'affirmation_voice_four', 'MeHarDinSuccess', 'MeHarDinSuccess.mp3', 'audio/mpeg', 'public', 'public', 58125, '[]', '[]', '[]', '[]', 8, '2024-05-29 01:41:51', '2024-05-29 01:42:07'),
(131, 'App\\Models\\Affirmation', 5, '4b4fa0c2-319e-4e92-b445-d280cbc08fd4', 'affirmation_voice_one', 'MeFearKiPlaceParFaith', 'MeFearKiPlaceParFaith.wav', 'audio/mpeg', 'public', 'public', 10944, '[]', '[]', '[]', '[]', 5, '2024-05-29 01:42:51', '2024-05-29 01:43:13'),
(132, 'App\\Models\\Affirmation', 5, '773259ae-2bd1-4d92-913f-36b0ed64d39e', 'affirmation_voice_two', 'MeFearKiPlaceParFaith', 'MeFearKiPlaceParFaith.wav', 'audio/mpeg', 'public', 'public', 10944, '[]', '[]', '[]', '[]', 6, '2024-05-29 01:42:55', '2024-05-29 01:43:13'),
(133, 'App\\Models\\Affirmation', 5, '8e253195-7fbc-494e-a421-6d38c2c33b13', 'affirmation_voice_three', 'MeFearKiPlaceParFaith', 'MeFearKiPlaceParFaith.wav', 'audio/mpeg', 'public', 'public', 10944, '[]', '[]', '[]', '[]', 7, '2024-05-29 01:42:59', '2024-05-29 01:43:13'),
(134, 'App\\Models\\Affirmation', 5, '101e836c-8d3f-462a-88e9-4f68cc11ad87', 'affirmation_voice_four', 'MeFearKiPlaceParFaith', 'MeFearKiPlaceParFaith.wav', 'audio/mpeg', 'public', 'public', 10944, '[]', '[]', '[]', '[]', 8, '2024-05-29 01:43:03', '2024-05-29 01:43:13'),
(135, 'App\\Models\\Affirmation', 6, '41e107fa-e262-4ed1-bdd9-e591a8600a3d', 'affirmation_voice_one', 'MeLoveCompassion', 'MeLoveCompassion.mp3', 'audio/mpeg', 'public', 'public', 69165, '[]', '[]', '[]', '[]', 5, '2024-05-29 01:46:17', '2024-05-29 01:46:41'),
(136, 'App\\Models\\Affirmation', 6, '3bbb276f-e9be-47b7-98d5-ffc498733fcd', 'affirmation_voice_two', 'MeLoveCompassion', 'MeLoveCompassion.mp3', 'audio/mpeg', 'public', 'public', 69165, '[]', '[]', '[]', '[]', 6, '2024-05-29 01:46:21', '2024-05-29 01:46:41'),
(137, 'App\\Models\\Affirmation', 6, 'c070e7af-1714-4368-ae48-0269c997949f', 'affirmation_voice_three', 'MeLoveCompassion', 'MeLoveCompassion.mp3', 'audio/mpeg', 'public', 'public', 69165, '[]', '[]', '[]', '[]', 7, '2024-05-29 01:46:25', '2024-05-29 01:46:41'),
(138, 'App\\Models\\Affirmation', 6, 'd18d7e69-dbf3-45e0-bf9d-eae3bbfa8be8', 'affirmation_voice_four', 'MeLoveCompassion', 'MeLoveCompassion.mp3', 'audio/mpeg', 'public', 'public', 69165, '[]', '[]', '[]', '[]', 8, '2024-05-29 01:46:29', '2024-05-29 01:46:41'),
(139, 'App\\Models\\Affirmation', 9, 'a9baebc5-9925-4bfe-9c05-826379ef2ed9', 'affirmation_voice_one', 'MeneAajTakJoKuchBhi', 'MeneAajTakJoKuchBhi.mp3', 'audio/mpeg', 'public', 'public', 84045, '[]', '[]', '[]', '[]', 5, '2024-05-29 01:48:05', '2024-05-29 01:48:27'),
(140, 'App\\Models\\Affirmation', 9, 'e31a900a-df35-47ca-b917-ccf7673f927f', 'affirmation_voice_two', 'MeneAajTakJoKuchBhi', 'MeneAajTakJoKuchBhi.mp3', 'audio/mpeg', 'public', 'public', 84045, '[]', '[]', '[]', '[]', 6, '2024-05-29 01:48:08', '2024-05-29 01:48:27'),
(141, 'App\\Models\\Affirmation', 9, '3471cf24-951b-440f-aa3b-ec6a52949682', 'affirmation_voice_three', 'MeneAajTakJoKuchBhi', 'MeneAajTakJoKuchBhi.mp3', 'audio/mpeg', 'public', 'public', 84045, '[]', '[]', '[]', '[]', 7, '2024-05-29 01:48:12', '2024-05-29 01:48:27'),
(142, 'App\\Models\\Affirmation', 9, 'b8c3e975-e6ea-478d-8d7c-0de2ab15c0cc', 'affirmation_voice_four', 'MeneAajTakJoKuchBhi', 'MeneAajTakJoKuchBhi.mp3', 'audio/mpeg', 'public', 'public', 84045, '[]', '[]', '[]', '[]', 8, '2024-05-29 01:48:15', '2024-05-29 01:48:27'),
(143, 'App\\Models\\Bgsound', 4, '819c40fa-8117-4359-be38-8137d8ee2308', 'bgsound_sound', 'BGTWO_2', 'BGTWO_2.mp3', 'audio/mpeg', 'public', 'public', 707344, '[]', '[]', '[]', '[]', 10, '2024-06-11 07:25:48', '2024-06-11 07:25:52'),
(144, 'App\\Models\\Bgsound', 3, '47b7f2c5-9acc-44fc-bd76-07b196575ef1', 'bgsound_sound', 'BGTHREE_2', 'BGTHREE_2.mp3', 'audio/mpeg', 'public', 'public', 926781, '[]', '[]', '[]', '[]', 10, '2024-06-11 07:27:13', '2024-06-11 07:27:16'),
(145, 'App\\Models\\Bgsound', 2, 'f8b9a4a3-41bd-4414-b1a5-04b88c835330', 'bgsound_sound', 'BGFOUR_2', 'BGFOUR_2.mp3', 'audio/mpeg', 'public', 'public', 842736, '[]', '[]', '[]', '[]', 10, '2024-06-11 07:27:38', '2024-06-11 07:27:43'),
(146, 'App\\Models\\Bgsound', 0, 'a81608db-a1d6-4b12-bae7-1e92394550d4', 'bgsound_sound', 'BGTWO_2', 'BGTWO_2.mp3', 'audio/mpeg', 'public', 'public', 707344, '[]', '[]', '[]', '[]', 10, '2024-06-11 07:28:14', '2024-06-11 07:28:14'),
(147, 'App\\Models\\Playlist', 59, '462e5747-1927-41f5-bcc2-c0772cc1bc04', 'playlist_images', 'download (4)', 'download-(4).jpg', 'image/jpeg', 'public', 'public', 5738, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 1, '2024-06-13 06:58:08', '2024-06-13 06:58:08'),
(148, 'App\\Models\\Playlist', 60, '0791af15-6f61-4a50-8af7-8f369e58266f', 'playlist_images', 'arabic', 'arabic.png', 'image/png', 'public', 'public', 108403, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 1, '2024-06-13 07:29:41', '2024-06-13 07:29:42'),
(149, 'App\\Models\\Playlist', 61, '01e26707-798a-45d7-b9c8-bcf5b6ba93ec', 'playlist_images', 'arabic', 'arabic.png', 'image/png', 'public', 'public', 108403, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 1, '2024-06-13 07:45:41', '2024-06-13 07:45:42'),
(150, 'App\\Models\\Playlist', 62, '34f7298e-a679-4332-b7dc-0e3673f9994b', 'playlist_images', 'arabic', 'arabic.png', 'image/png', 'public', 'public', 108403, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 1, '2024-06-13 07:47:34', '2024-06-13 07:47:34'),
(151, 'App\\Models\\Playlist', 63, 'c849f1b2-00eb-4a11-8667-ac0792a5a3f1', 'playlist_images', 'arabic', 'arabic.png', 'image/png', 'public', 'public', 108403, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 1, '2024-06-13 07:47:52', '2024-06-13 07:47:52'),
(152, 'App\\Models\\Playlist', 64, '7bdfa776-86ec-49fa-ad74-ced896c39ac8', 'playlist_images', 'images', 'images.jpeg', 'image/jpeg', 'public', 'public', 5611, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 1, '2024-06-13 08:17:57', '2024-06-13 08:17:57'),
(153, 'App\\Models\\Playlist', 65, '74f019b5-4555-4db5-b427-f645c4457f0a', 'playlist_images', 'IMG_20240409_161932', 'IMG_20240409_161932.jpg', 'image/jpeg', 'public', 'public', 1080422, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 1, '2024-06-13 10:01:45', '2024-06-13 10:01:46'),
(154, 'App\\Models\\Playlist', 67, '0c20e99a-0856-4455-863c-5dee5af123cf', 'playlist_images', 'pexels-pixabay-60597', 'pexels-pixabay-60597.jpg', 'image/jpeg', 'public', 'public', 770371, '[]', '[]', '{\"thumbnail\":true,\"preview_thumbnail\":true}', '[]', 1, '2024-06-25 13:51:02', '2024-06-25 13:51:03');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2024_02_23_000001_create_media_table', 1),
(4, '2024_02_23_000002_create_permissions_table', 1),
(5, '2024_02_23_000003_create_roles_table', 1),
(6, '2024_02_23_000004_create_users_table', 1),
(7, '2024_02_23_000005_create_groups_table', 1),
(8, '2024_02_23_000006_create_categories_table', 1),
(9, '2024_02_23_000007_create_affirmations_table', 1),
(10, '2024_02_23_000008_create_bg_categories_table', 1),
(11, '2024_02_23_000009_create_bgsounds_table', 1),
(12, '2024_02_23_000010_create_permission_role_pivot_table', 1),
(13, '2024_02_23_000011_create_role_user_pivot_table', 1),
(14, '2024_02_23_000012_create_category_user_pivot_table', 1),
(15, '2024_02_23_000013_create_affirmation_group_pivot_table', 1),
(16, '2024_02_23_000014_create_bg_category_bgsound_pivot_table', 1),
(35, '2024_03_01_070949_create_group_category_table', 2),
(105, '2016_06_01_000001_create_oauth_auth_codes_table', 3),
(106, '2016_06_01_000002_create_oauth_access_tokens_table', 3),
(107, '2016_06_01_000003_create_oauth_refresh_tokens_table', 3),
(108, '2016_06_01_000004_create_oauth_clients_table', 3),
(109, '2016_06_01_000005_create_oauth_personal_access_clients_table', 3),
(110, '2024_02_28_131637_create_groups_categories_table', 3),
(111, '2024_02_29_141733_create_affirmation_category_table', 3),
(112, '2024_03_21_141616_create_favorites_table', 3),
(113, '2024_03_21_142001_create_favorite_users_pivot_table', 3),
(114, '2024_03_21_144250_create_playlists_table', 3),
(115, '2024_03_21_144332_create_playlist_user_table', 3),
(116, '2024_03_22_123843_create_affirmation_favorite_table', 3),
(117, '2024_03_22_123944_create_category_favorite_table', 3),
(118, '2024_03_27_112154_create_playlist_items_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0289443281d2756ec8efaf227faaf920f9e9a8b66f5ac68c883d93939b2286e9532abc9135c6f5ae', 1, 2, NULL, '[\"*\"]', 0, '2024-06-26 12:01:28', '2024-06-26 12:01:28', '2025-06-26 17:31:28'),
('06964f36a7424138b7aaccd5878663ab34f97c8b1efc4c0a054155f602e6d3eb8d93b2d34cc74ee5', 14, 1, 'Laravel Password Grant Client', '[]', 0, '2024-05-29 04:36:51', '2024-05-29 04:36:51', '2025-05-29 10:06:51'),
('091af7fd25db79ce0c1c5ad059cc540f1389a19b638e6bc01362b470b2c018ceb7b96e5739d68422', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2024-06-26 12:03:38', '2024-06-26 12:03:38', '2025-06-26 17:33:38'),
('096dd81951bfc5bd4265bceb4d57489a24c387c121e92272bdaaa5b799d208c5c9443f97289ac602', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2024-06-27 05:24:49', '2024-06-27 05:24:49', '2025-06-27 10:54:49'),
('1856cf607708b0bde33b13644dbc45426bef9eabc72f54df17a4e5a9984f2dc0f8a64cd992b66b6e', 13, 1, 'Laravel Password Grant Client', '[]', 0, '2024-05-29 04:35:34', '2024-05-29 04:35:34', '2025-05-29 10:05:34'),
('1c5fba29f2f166b1dc8b2d9677243a22367a22d9d246c023eddb8adbac1296a3ccd1a6b45369cb67', 11, 1, 'Laravel Password Grant Client', '[]', 0, '2024-05-29 04:53:43', '2024-05-29 04:53:43', '2025-05-29 10:23:43'),
('2bebaa8a20c06120b84f51388c374261f8508cf09b74747ca76577a968ab829c8f046d96c9a3bb38', 15, 1, 'Laravel Password Grant Client', '[]', 0, '2024-05-29 04:38:58', '2024-05-29 04:38:58', '2025-05-29 10:08:58'),
('3177e796b14909289c71d7e9590780c843c514f67fcf1cf76a84422221ed8453195035744a031637', 10, 1, 'Laravel Password Grant Client', '[]', 0, '2024-05-29 02:03:17', '2024-05-29 02:03:17', '2025-05-29 07:33:17'),
('373eef772b09924713a564f7accb15a1e1a2153381c1b6e14716e76f56583e87ec8651c1bbf09dde', 1, 2, NULL, '[\"*\"]', 0, '2024-06-26 09:32:39', '2024-06-26 09:32:39', '2025-06-26 15:02:39'),
('38ceacca5bd2a5312c6d872ce7851024570145608eb6f86c9977a80d2dc7e7cdd41bb7672d79ae3c', 1, 2, NULL, '[\"*\"]', 0, '2024-06-26 11:22:03', '2024-06-26 11:22:03', '2025-06-26 16:52:03'),
('421cb9c6d1bca2ac6d949323ec3549af6b55dbdcffbf5f20612fd086977454a6f38294cc2aa82284', 1, 2, NULL, '[\"*\"]', 0, '2024-06-26 11:13:05', '2024-06-26 11:13:05', '2025-06-26 16:43:05'),
('47835fd1dfdb765d5770373b5e03c903ab1f734eaa40c0309e1758228a721c9999f2823e03b720a6', 17, 1, 'Laravel Password Grant Client', '[]', 0, '2024-06-25 11:06:13', '2024-06-25 11:06:14', '2025-06-25 16:36:13'),
('5792052e6dfa11e6cbbe41f0d8e9a58a1feee215e5fe7df4b48e4d9556d8069b67ccd37161aea40b', 16, 1, 'Laravel Password Grant Client', '[]', 0, '2024-05-29 04:43:02', '2024-05-29 04:43:02', '2025-05-29 10:13:02'),
('5a66aab926d9d976f73b1081fea5f7feac262c56cf0d5b4e5cb24b32e99c216083ea1aa4af01c1c3', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2024-06-26 07:04:14', '2024-06-26 07:04:14', '2025-06-26 12:34:14'),
('61f413efca85c38c4f4477b1cb7cf9053b1e927d7cab6204d148baae1b7c035541276259c36781a0', 3, 1, 'Laravel Password Grant Client', '[]', 0, '2024-05-23 06:36:59', '2024-05-23 06:36:59', '2025-05-23 12:06:59'),
('6580cae4d054a2cbd9b05e6041099a594184f049d3e8e96702eea50af923f8f4a47955a732be1d99', 1, 2, NULL, '[\"*\"]', 0, '2024-06-26 07:20:28', '2024-06-26 07:20:28', '2025-06-26 12:50:28'),
('6fd9427b7288e5b77429d945d227d6ca45200ce0897f412108e5537eb876e5ec6892a434de35924c', 4, 1, 'Laravel Password Grant Client', '[]', 0, '2024-05-23 06:37:41', '2024-05-23 06:37:41', '2025-05-23 12:07:41'),
('72c7216c965fa2303145c03285f2ab1e4621e9f0a36e28e5cc9c51b89e4c20edc8eb9d5bd9871caf', 5, 1, 'Laravel Password Grant Client', '[]', 0, '2024-05-23 06:39:39', '2024-05-23 06:39:39', '2025-05-23 12:09:39'),
('72f42b40cd94b6157d6b9357e3e713c4b23f69f1c88107214c062447d79795a0c5fb7b9216f64361', 1, 2, NULL, '[\"*\"]', 0, '2024-06-27 05:25:49', '2024-06-27 05:25:49', '2025-06-27 10:55:49'),
('73459373976fe57b5d02171b566e34e1649cff93a563a0ad1493d5494e430b0f721a2ade9058f452', 1, 2, NULL, '[\"*\"]', 0, '2024-06-26 12:03:37', '2024-06-26 12:03:37', '2025-06-26 17:33:37'),
('7579396ac864c168a7a932fc4259211d0a13f89e008cdc210b71fa1752603039bee9ca104a08d67f', 11, 2, NULL, '[\"*\"]', 0, '2024-05-29 04:53:41', '2024-05-29 04:53:41', '2025-05-29 10:23:41'),
('7db3f8b20004e17d0fe059db47551c18d4ba22fcdeaf432a93dc123f04421729132483ed0bd5ae0b', 1, 2, NULL, '[\"*\"]', 0, '2024-06-26 07:04:10', '2024-06-26 07:04:10', '2025-06-26 12:34:10'),
('8add8d9067ba9a9555c1d84bcd82223b8794a1aa2b0a01ba4a63cff35a4c17a8c3d2bd5717bb4249', 1, 2, NULL, '[\"*\"]', 0, '2024-06-26 13:06:08', '2024-06-26 13:06:08', '2025-06-26 18:36:08'),
('91fd85412dd12bd0d0c6d463ffc671a30b9decaa520250c26c980218d86bcb46a98c44f36dbfe1f0', 7, 1, 'Laravel Password Grant Client', '[]', 0, '2024-05-28 06:42:38', '2024-05-28 06:42:38', '2025-05-28 12:12:38'),
('92b04151772e9fbc72770e6938ea738f7e22ac8b89079ae7eff47f034717d5fd240ba5a63d2cccda', 8, 1, 'Laravel Password Grant Client', '[]', 0, '2024-05-28 06:46:40', '2024-05-28 06:46:40', '2025-05-28 12:16:40'),
('9cd8febded647e3f563227a942000d61af0683e7096c84557c62b20f5a7664bee1d811677dbb7b24', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2024-06-26 11:13:07', '2024-06-26 11:13:07', '2025-06-26 16:43:07'),
('af3294b8aa3ac041229076185d873fc98610f225149fd7ae3907c21518c1fbfcdf7474e08dd96844', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2024-06-26 08:27:14', '2024-06-26 08:27:14', '2025-06-26 13:57:14'),
('b1a4bd7699f220bd8682fa75b57bc56114b8f7c424504f5c6876378f7566bcd3756ba8c0e647f227', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2024-06-26 12:01:29', '2024-06-26 12:01:29', '2025-06-26 17:31:29'),
('b359967def01ff47c0230cd993b09a2f3997cfcb6d2bcd49ba629f3782401c3c3bdb0000ed76a625', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2024-06-26 09:32:40', '2024-06-26 09:32:40', '2025-06-26 15:02:40'),
('b3826c30f6ece260201abf20ea191991e0900d27f938000c728dbe4a2506b97831e9e506179db4fd', 1, 2, NULL, '[\"*\"]', 0, '2024-06-27 05:22:15', '2024-06-27 05:22:15', '2025-06-27 10:52:15'),
('b8845ee3c7741522bb16927277daa455a66671f4ed322b489fcdc7b288d9ac24547f267fe7e43dfc', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2024-06-26 11:22:04', '2024-06-26 11:22:04', '2025-06-26 16:52:04'),
('cd7d914ad616436b92f8fcc6ea73fe71469c795394b10120c36c7223dfb0acfdba676ae91558ec12', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2024-06-27 05:25:50', '2024-06-27 05:25:50', '2025-06-27 10:55:50'),
('db14d0099c60921f51ab7600ed43dad9eba73d9ce3d890c4ccb535cfba5ecaf2a973e584aae21e3a', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2024-06-26 07:20:30', '2024-06-26 07:20:30', '2025-06-26 12:50:30'),
('e867d48280f09f4fa8999cab12123fb974e6546b6387067379897baa10e0c119bf6cd96847b655ca', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2024-06-26 13:06:09', '2024-06-26 13:06:09', '2025-06-26 18:36:09'),
('f6f1da6317ab218bf9c62de346cce77bab3d840ed9198d0b9e33efd9f42fc33eacb874b7369d3307', 9, 1, 'Laravel Password Grant Client', '[]', 0, '2024-05-29 00:18:40', '2024-05-29 00:18:40', '2025-05-29 05:48:40'),
('f8b51c9e41a5cb2cccffc55d75675e424f7d8bc4dee9b98a0a3662bece3fa85dee6a1a348a2d19c3', 12, 1, 'Laravel Password Grant Client', '[]', 0, '2024-05-29 02:32:38', '2024-05-29 02:32:38', '2025-05-29 08:02:38'),
('f9752c10384d658447eb4e49e010bc8b653372b8649a39c5e9ea90e3ba5a2fd1c23e03a34737903e', 6, 1, 'Laravel Password Grant Client', '[]', 0, '2024-05-28 06:40:43', '2024-05-28 06:40:43', '2025-05-28 12:10:43'),
('fd37182431a38260da08848c59605b72ca73411d852937c08a3dc6780d13e721c161af85b44f60ba', 1, 2, NULL, '[\"*\"]', 0, '2024-06-26 08:27:12', '2024-06-26 08:27:12', '2025-06-26 13:57:12');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'laDlnZtTkzpJxLDhI6UKyArUBjyLYIEuUCmLRXyB', NULL, 'http://localhost', 1, 0, 0, '2024-03-28 06:00:32', '2024-03-28 06:00:32'),
(2, NULL, 'Laravel Password Grant Client', 'UtjTgffhEHELdKHPggA6feRwByUtcDbWrUJs2LJy', 'users', 'http://localhost', 0, 1, 0, '2024-03-28 06:00:32', '2024-03-28 06:00:32');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-03-28 06:00:32', '2024-03-28 06:00:32');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('0010b0de37a36013c8ae6665d4921943ece629c730c83ae71a9dfb822d3419c9d4f7c540a1ef7a04', '838d568d868b65c50084c85e2b03e216fe2ef4315f201d1b49b6ef380a8c9afa06317a67fe4581eb', 0, '2025-06-10 16:18:12'),
('00df91f7bc392d89b604a74081d550d8b9393858d1dd760478bfde3ab0745da6efe9a08acef82d7b', '09c1e00a8c224603793a2b41e961b5f27f92ef97ccb6f427c1e3818ec6bee9627b43f944f04d6680', 0, '2025-03-29 07:04:53'),
('01575df2e58212bf08c011836355ea9dbc87e019d9af22383aa47523e2a0040e3de44a4d1ed050d7', '3ffb1b750f93e14f73766ac32308fbf63ccab7321957172166a06bcc637ef326bdfcee7191ef14b0', 0, '2025-04-22 05:57:16'),
('03e54b62139d7c309beaa4aacff15729405a95c2994d0aed19824350416faeb28677a110d34445f4', '88be1f4dbcdb5db5dff20f66ac9504085ce36d1bb439a363973a43baea0e47776623f91a4fc5c907', 0, '2025-05-09 12:08:50'),
('045a27f39b6384ee71324d040719021f14dca76f1721169d176017f7d09a116b6409f3e48c7659be', '144c3b0fb7c718e20a79fb747f7c85967535a70c9dd6b7af7f9355cea57fba37912e35378e4996b8', 0, '2025-05-18 10:58:49'),
('046132867f281f5132188de4ba43e358785b8d082f56bb4249c52c22c2d486c457a6ef19d59ba09e', 'e298ed730142b6735377033715b7992ac7897256572a436d314cad023714664013b21948ccbcd3ab', 0, '2025-04-08 13:46:17'),
('05593fbc3768008302f998b7b1fbb6c1ed813aa95eae0786f842a116c70fbddb9fcb35aecf1a66b8', 'f40cf240a6f79357c8455b9f912ea1bbbf1ca146c3a301d4000a36a76721ff3d3a06487080ab9e1d', 0, '2025-04-22 08:04:12'),
('05ea2a96b01b37479e1f63bde36e57c2427531b53c842e7c9c288b963cc9eb98611075aec18cb166', 'fbdfe0288729130648c599e59e1b51c50e7b688fe3848b51340940a1c40b5bc215f56c117461dc77', 0, '2025-05-29 10:15:46'),
('07f543144b1dbe07ee9b9dd025593a37c08f83e2563cd897b248aac89a5700c1ba2931c1b9f36cd1', '963e46d3f4d16716d88c37e231de6f0d6b434e32bab7cf160c2656a3385d55b264de913710492257', 0, '2025-06-10 10:50:34'),
('090b6999e8a26f40302eb5a2d4628cffc274ff05d6c1ae69d21b70133a6c30efde2fd996e603944e', 'e5aec822f58978034e9788d6606ec5fa7f2f521d56896d949ab72ef10341569bbadd670f74c9bac7', 0, '2025-04-09 05:13:37'),
('0bdf09a8389a9a33e25988ef9f4089b979eab094365f176a74b18c97f870b58e9b702c8496194ab0', 'eabebb072b0eade131d9bac439e75e8d70da06048750ab62330610cb071551963742b90d4cc2d349', 0, '2025-03-29 10:59:33'),
('0c893abd67c216c35fadc6b68e8b18ca2c7bd51c7bb74e58f0abca2e79b9116e44000b61fc5772f1', 'a4331e5038e3a4a4b471d3c0758d8b9538099d1e7dd7918291032182afd65dd31723ed72a0852ff8', 0, '2025-06-10 15:52:50'),
('0cf530da908cbe0ffa1b8904e839cf166d7ab5d5ca3c23967f8087888e25f1e2408e45b68c7869f0', 'dbdf68a443bde1c7d2eb19fadebafff17f610bc6f06fc4c6b83cc08a08fcb99b0fae256366506885', 0, '2025-06-11 18:06:24'),
('0f22e03bada8c2ad9744c50871a8eeb3cd1d72ed7779cae8aa9056a2446011ff80f8f1293999a813', 'c5141976ba0a9891b074f69d7cdaaf0832d4d5870a35a9236e2bb2e1047d82bb438d23711401df28', 0, '2025-04-18 11:46:54'),
('0ffa91b949bb758cf8b183a5534b41a712d5461f04526ffc23d97fa8a8998a2b342fa504aac412c3', '7422d78b531e8310e305cb1200a855d4ac71d10037b8ed291deb95241ca8632f8fca710dfecb1fc4', 0, '2025-04-09 06:05:59'),
('0ffe96f2fbaabef2357458405cbeeb8d90f72bb8a65c9bab21ff01f3f75053731664005807d702ca', '3f19f2c13ea832c7348e69b88455fad6151d6bfded9fc51745e8067f15ccc4854a1d3d9cb4b10636', 0, '2025-05-29 10:10:37'),
('10331b7f623101555cfa3a4b174d738096d5679003adacced75b1bda4135412c5a142d7c050e39ec', 'cfaf53b34580a7d33f5c2571cb422be2bb0f297c7238345a0dd5abde4f20191a11a8926cf22d081f', 0, '2025-06-11 17:12:36'),
('10ab1d7d46273c623929d3d616e98973dec81d1cf78d3602e82b9e89625298e240cb2ddb25ab00e6', '2cc242b01bbbd65f4bf4379571b7ceefdfe4b2b2417f37029c60cc9adc0a0f6f1f480b02331f4559', 0, '2025-05-29 10:15:37'),
('14cb244d7c637a294dff551a76d53df1579e8e8752606b98487a0bcfe9a5b0cc0476088df412fe3a', 'cd312e9ffe1089ff9f45b1a9aa5b66c6e994746233434078d89822c71368e8cc73c52d876e184d13', 0, '2025-06-07 16:07:44'),
('154238c4eb0e9dfc23fd57a6447724c2a731e02861d932c7e85d3a289dd59a6873f3db2bbb58230d', '65d2f89a09b46858af3a7cfade750344e739b63ec9759a9c139583131d3d95b6dc90bad4ceb7804d', 0, '2025-05-24 09:31:31'),
('15f0121bdde4b20b302c538eb2a9ccccb134ab7f4808f527214010a4e49978632d5d7f90279d0c98', '781a8c0fc1cc4bdb5cf34a146bc9697ffd61c15859fab982185fbeafb08e61d973e198a86708ed9b', 0, '2025-05-30 19:27:11'),
('1657518e69aaa137d3ffeead0cc4bace1e776cdd8c3f1013ac82888cb94dc7b16cad1e2e32bcb93a', '985dff4f5087c1afbef08ce725c23414a995191c919ed734e5fa981cae2558713cabf75a8633fe66', 0, '2025-05-04 05:50:46'),
('16584e7464dd8c800c749feb0b7c0d8375b8bc0eab8ca3be60fe320bf17612788ccc6cfcf22252e9', '15112ee2db234e5a5709eb2451ed40a52177dec10e0d77d8429c5235510268095c2ec16a05c6700a', 0, '2025-03-29 10:02:52'),
('17dd3198bd9107ff6cd19c993a0498415ff25e9f476ca8fcbe72e3c0268c4158b72dd843af6dd593', 'bbdfa9d0a5f9777705c5f887f417189c69db2e3c3494ab1480c0fa3b5bd25ad78339261092e2f498', 0, '2025-06-25 17:11:37'),
('18f897a651cd5ce6fb17706c11d8316a1d04a20be9c6f009ef125dadf697f855fff312e6abfcab21', '00ae65f315afef41b5c9cad3139ad41e3e63eaa6ab35c82753c27331daf2728326b62c6df8f1f315', 0, '2025-05-18 06:23:08'),
('18fd6a39a93fa845ec00a8f1b53c37ffe663ba56c27c375ae3f09ba04be44b371776d6a17079910a', 'a6bb7c6e566ad8c149c944b421af0c3d1407b6e38d94394e4c3fa813807b7ea4a26fb9a53ae088ef', 0, '2025-04-18 11:54:48'),
('1a01796b22571c59f94db7ecc6089933fca41c3928b31c5451a90e1322f88e815d55f9b10c931ebb', '2e571a05c310a6ec3f67431464cdd3e54ef01716c6ba8289ee716a6ae02139a791ccb2f7ee7bb80b', 0, '2025-06-10 16:03:53'),
('1accc957d15ebf071d9a78a549511ff3762cd89aaa858b98097f45040d984ead6c1b8fc450f980d8', '5a8fc38cc73af1c88ee455ecf5db3c457e07f0e4c72c9d55cd829d7e417aa4039d3b20e8260a03b2', 0, '2025-05-29 07:02:55'),
('1c70cef638af1f8402ca1a95bf68d529c8cfa98510d544eafdff8e73907f698ea1b9e97e216b22b0', 'a1ba7347384f6659a122c52aee01b510dfd7b35885670b84227462c059dcfe2c83a054f4609e75e5', 0, '2025-06-06 12:27:06'),
('1d2873d4d3456af10f962a3ce67f88a3b6d4af949d2885c54d6e8028c05a2c61a95d03af711ffe22', '2a595bcba340eee7ebaef1642608e440329c1d69f870cf7db100eebd3f0195eb0e2293feaea73c88', 0, '2025-05-28 09:22:39'),
('1ed7e0fddcfcd68108590a48f91e3c0bb8ecd8536b10a0b57f37b5cfb9544fda18c3a316e5741229', '1933a608214399696e885d7ea0370f8d31f825b3829b9d6ea23a30f9a1c8eb02a3b12e6c74d1675c', 0, '2025-04-03 09:31:42'),
('1fef3e84516d8c2b0bb1c7c47fb14af945296b90e3793f72c153fad8e3b6a802459674412c1cf0c0', '169fbddab5819d4e4ffddc259d2b28d050eccd6f0a9979c063b0854e65987daad2c2b6274c539b2b', 0, '2025-06-10 17:20:46'),
('20bf3667529c4e9aa01d8c33c4d2293ecb67a1621d9624290f6da3dbc8c7141359838c2cb679551e', '7c81b4583c2b5b96a65ee689a0f6c53bfa2f311d589a7be08e29148689574047ecfe3846d16d5ae0', 0, '2025-04-22 08:23:03'),
('215573da8389f68a72311293c6fb004ef25ccfa41c29e58bf47626db96d690a67e41cff309b29735', 'b9e373ec23c85724eaa5c3a76340e6ccfaa68d9039f483d3dd3fb03a162f0d973819a3fdba0ab4f9', 0, '2025-05-08 14:06:23'),
('2162c4544b3d9627f9629bc419c032348cf8808c6b2a129e183255b4d01827852197b405f607edf1', 'b16c0aaf1a5fbc754a24fd1f7a761319c4cdf3031af671f9f27f3aa0a9159130cdaff157d33f4b16', 0, '2025-06-11 15:16:28'),
('24163f67b8e780d6c3e7c8727c8d910de159b1b30969008b437dae27469808362ba58631006bb417', '8add8d9067ba9a9555c1d84bcd82223b8794a1aa2b0a01ba4a63cff35a4c17a8c3d2bd5717bb4249', 0, '2025-06-26 18:36:08'),
('24f3b00f876f9fb416187db257811930ff3134cac31672995e74ea7438e5d15a75eafed2491d0375', '8bc20adbdc6178f486a8aedac650a2aad7ebdf5a6859e5b1bdd18d0ffdc48bb3b4a1417684436cff', 0, '2025-06-25 18:00:57'),
('25847ac6412596e9268e460e2c1b7f74adf3aa7871e758e5ca2462624a7da00f910d270effa19e74', '35041ee5203bebf0314afe163dcc9e89b4ba03e7f7cc35b3222c0afd7e5c2b19ee621872cd7ff26d', 0, '2025-05-30 17:36:14'),
('25c1ebc96274a4ca62aa9bc153b26f341e390655ddf4eca769db614b356979daece3f7b1c250fcb0', '49ddacca291e83673a32509742f16cca0994c49ff0888f2bd81243c74b504ff3519760c04bc1e7e3', 0, '2025-05-03 10:16:47'),
('26060086758d680b12e9e192c2fd463440976cabf0c4430a39dbcf1e028de9cfda9cb338e943d738', '939ce5845422448bb03ec0c7c509c96566c484802af0c51f4ec801fe249ebc6e9afcd16445476449', 0, '2025-05-18 06:01:14'),
('26669f4dfdb70111362761dfbe6c0bce429fbcb560342df3e73ef4ae77c9bb8e26daa4b306e82989', '4b7129032d7324dfaf93fb47bfefa209c4fac524cb79a9f1a8a29a4577441f465fd1817add2b75fe', 0, '2025-06-10 19:30:55'),
('27afb4dffbcb927cb47ad3ecf880ac264cb106adc1c8cbb7202464185fb9d3ca86f2a1de6fc05503', '8640e45048e906ee0a0593fcc7dc9addc3fc4e62d07bf3f59520967d4b31c10b786bc0778b2c2960', 0, '2025-05-20 13:40:51'),
('2837d492238f137efa7b554e82360e2bd0136c0eeea3272474cac397b21e35d1691a3924e5747fe1', 'f09681a1a4e1a725c000d0e74e146edc40d75f1e93c44a1ba209d47bb5042affc8f888f4e0c13e45', 0, '2025-05-11 04:33:28'),
('2961c9f706be74d7e97ed3d7f90f56f7224718bd31f94d631c2c937f7d100952a5de7381369c9c2a', 'd8088e016121d9ae841c951d5d3ed984dd9481345bc31cb4dc549ff8ced154299d0aec1309f42591', 0, '2025-04-11 09:36:34'),
('2a7943bb3f839c1866c765abc67c71c5d65e7c2321abec40f32b76b52ea31e9a99ff900408998bec', '38ceacca5bd2a5312c6d872ce7851024570145608eb6f86c9977a80d2dc7e7cdd41bb7672d79ae3c', 0, '2025-06-26 16:52:03'),
('2a9ed5acdb908cafef920b71d59aef361438e1ffa39963551ad6853fc5852804f6a20a89ff824293', 'd7bbdb26af982471a82ec74753e6260ca307b2af2200e013293d8be70b47b670420c14bb79259e2c', 0, '2025-05-20 13:09:49'),
('2ab9c2fc9f29b593a8636d4a6a831bd2344465108bedb1e8a28c834f126a407f93db3babd37aa624', 'a7801bec54f6b3ce3b6f536bcc3e06bb4339ad0625e8f49ba33ab2d268d39718eb4303fdebb21985', 0, '2025-05-28 07:45:06'),
('2b8ef59c2d37119a841fc5ff63dc020cb1dca383f63e27b92bb442416f1138759297bc0b1ca78588', '3998c93544cd84c426929b40c6897e52fb761998c1e4b76052d4a7b53c932b8cee9772136714b1e3', 0, '2025-06-25 19:13:41'),
('2cb4dc19ee91403ef1c07b08630af2b230d1125c9a1dad55bc88852031a04d8dd06d4dedb588cae7', 'e735228bb35779f65853c28c9c745ab909ac422d525cdce24141f0e21b69f28f819e8b08f392d712', 0, '2025-05-16 10:32:15'),
('2e874a664b906dfc3ef0473115635373e41ec2e67cfe1015e2552f2540c1398c6e1ebc00364c160e', '0e834515992af90d2f6346a862c8db0598b9c011f1a7a607f83a88aca60d698b90bd0e60c7dde50f', 0, '2025-04-16 07:29:11'),
('2f2ad5b80f898b63f4a0689a76dab58f7282c07d9939f3007974ca9da303a0182cc976bd1a258af7', '7f104ac8c94000b2fc7ccbbdb0f9acc2acadac391c942b47d9d6f73c4e5d6a0b6922546cf21433fa', 0, '2025-05-28 07:14:03'),
('2ff8f58e07c2074fbd72205219ae4e0811f7c8b773d6fee750eefa7a12f90366227dc7c293f12a50', '7015e482b5e7f53b408b3746adda05709e3718b14bd1d0e2698ac2498b30dde6539a81856c217be4', 0, '2025-05-24 07:22:05'),
('31063fd7ccd2045effb267e612c21c1236f0da79466a4db1aca5335662517e7c494f54635fa7300a', '589b63dbd72e5a9b63b2b9b306b596decc5ad2b1ec5245d6ce2bc4c26d05e8dec1fe5412c9507639', 0, '2025-04-30 13:03:05'),
('314bde23354aa95224e965063ffb4fd0b250f1df978c8ea075ff918e4027c876eeebd9f2aa367e43', '7a11558aaa2905d4d526419051eaf2a7458daac4933832da0d828ee2433ad2bf4f11845fb23d09ef', 0, '2025-06-10 15:59:13'),
('33243855fc2db2d2fa06e493f7f57200dddfd1496d284f56037b524b67b9f5d5b0802b7824c0b0ad', 'adf094b2f62df95a025278a1cb0cb0e1cd34c7f8e87e6b6df306568dce43f69495af8c75e703648f', 0, '2025-04-22 05:58:27'),
('333db8de75cc0095b8a66b563ec146f7f883cac0e9d0bc5b085fa7bb606cd1c3649e13871c76ecfc', '746521a50c9e68f29994843bac7da2c8aada80633fff49d0e95906dc66a9adf015254bdc5998dae7', 0, '2025-06-25 12:50:22'),
('33b99c72a2c53fada1a1bf2368b6bb4a18eb62c9c56dbd3a0fdccccf3dfd905823744f4833019923', 'da16f10c72a134d93ff45bde796050a443c64e2b4c87341b1f4c58b8ddd7b3daa5d3bc2cb385f0c1', 0, '2025-04-01 05:01:27'),
('33fcf1748cd5b1406264d8e1251399be3faaca377d972c36c71046120ba7e89fc047c9ea477bbc52', '4bcc646695135471a5bfc2ecc41d46a20477d67af7b562e93e65792592c7b8ff9c66ad3c6550c7d6', 0, '2025-06-10 16:49:13'),
('34a1d19c994dd999a859c73eee4345a79bcc667c98e72c4fae964f6333d5704781b5fb6a341828e1', 'e0389bfb4546531968e7e95957bc7b591d2fe558e16758f3980aa04d9136d1a08d4670fdda15008d', 0, '2025-04-08 12:06:01'),
('36584e6991bc85bfe7f43fc02b42e822073bcc82900e6b5ae3d8dfec009681b00c523e17ef24d264', 'c59745feccce7c98c9aace1078792774f12927ab120b6277d5ee6b5d6242b25c54f1dad4d3c767e6', 0, '2025-05-09 09:21:57'),
('3694c3412c6e4f16ce15db4207c4eecb3999bdd7e9e83e29ca1df4b11c20cfee74809d68a1b05c6a', '5f19e17602e9a34266b23d1a5ec88b928960c63305e185da8ed4acd37bc86e2c96d8532e279d82d3', 0, '2025-06-11 17:28:31'),
('37d04cb4571b4828e6d04e6f8a051e582204c26d1cbc571926a70d92ac2e9ef415d17de5c56bcb02', 'fd37182431a38260da08848c59605b72ca73411d852937c08a3dc6780d13e721c161af85b44f60ba', 0, '2025-06-26 13:57:12'),
('3876266aa1ab2b2b4368e566c01831490b9fc706279e61d1a34c24ba712e5f60dff253786843039b', '9fc46d0ba967e33a714111cea25881fb6b5d85cb859b29b9c9d23ed747920b232a9437eb63de23ec', 0, '2025-05-29 06:24:36'),
('39f777dfb296dd197241e89972b9b1ea791fa01af5fc49f606de376b35f7a947ea8ecf023464e582', '31585a0a03a46404ee326be078cd3f6f99100b8ce2fb486e5fd25b9054704f3f48bc5cf44f122750', 0, '2025-05-17 05:29:17'),
('3cb111ba4d3aacab188ba447f0941c75ce585579c3776b7b71e1689c6b62e709892952cbaa7cc30a', '7bb602c4032f6cb13641a44cb94e102cb7834fafd0251c2499cbcecbbcd1bd91063bf637042f5f57', 0, '2025-05-06 11:11:11'),
('3d7e5b5819e109fed7f043ed1532d8ab4ca185177e8fc9fff89f724f82d4cb17721c664096a883d9', '4766cb0373c3467f03132f2b7cb2d4bf11126153fc1fda8df25a24f5982ec04134e479c98d0effac', 0, '2025-05-08 07:06:55'),
('3d8523a904837c0b9f25bf1df321eedefcd2bfcf71edc440259d4a09f6a48128584b869f8d337fcc', 'c0f386f1ca66b076bfa01071173e0d2503bc9aa056953168a5b7f4cf7a4bed21786f76483f1954f3', 0, '2025-05-21 13:52:23'),
('3e2d9a82c8b499a0bcfe0035ebb7f43f07ad9202057b21385c3b02b11712e20752887a971bdce23e', 'bdfed3d56da1555ebd0778376b91a6b720d59e4b14076241e71765a68b6d96bc992d84d8d6d353bb', 0, '2025-04-19 12:05:24'),
('3edfee5b0ee1763e9dfb81ccc458ebfa79d9b67b420ce8842dc508ba01b0a69d2c388079ca92fb6d', 'fa21beb9fd7395081090d458c0148ca657b167e336cee32abf66488117ffb6853969df53341a9a62', 0, '2025-03-29 10:05:53'),
('3eec1997a94f0de8213354a8c19bd7b82c73b182c0ef0addca85e797d1fc17d7ee7dcf1449dd5e28', '09c92dad75c36b0a3faedf7d56bbb152bd521d4049c3577ed1caa6b6cf0506a4592d87150b03c19b', 0, '2025-04-20 06:18:41'),
('403b1c4032176f16adbb238401b49f7f8a55b3ed48275b2f52af0ed447c71836415563ebcc7a89e2', '49a92c75a381d205358c16836ef1dee3719f137a406e508e53d5630854f74b4aca50dc5fd102e043', 0, '2025-04-18 14:05:58'),
('427eb847e5fcc86a02b6063f61ebee35ed4794cf63325da2ced1601fea7eedbb68f09f65f4957998', '0761ef34ccedb90c7c8e4c75ffdb670fc46d048ca255f94324b33715a96649d0ddb93499ce17c4d5', 0, '2025-03-29 06:48:34'),
('43e8b271978c417c9acc50a680ee1ca3a14f8a53836e25fae33e7d0dd4606b2831f657e0cf5874ab', '6c203db52ac66ffc27b67de235de6135513479bb94fa35cc581008fb6aefac7a4b5748982d78ebdc', 0, '2025-05-29 09:37:28'),
('43fbe0168322a4cae11f266dc9377d5f60b780223dd4ac4fe2b3c34d05238a9680fb4cd46a3be686', '9d9126a15ae8f41de8e509888f9c7b34202786353f259d5b042e573e45eb2b7cc26f01fc9d6d7c68', 0, '2025-04-05 14:08:59'),
('447c723a52041de72aebc042e34b98f6f4eea7b6b3b770545894bd4ac23ce324d30976ff46672484', '33f5ffde764c1113db351eb3b30efc7b8573d3ad64e313c319a7c8263b2cda3ae99cc4aa6fd149f6', 0, '2025-05-29 05:55:35'),
('452b9c3f6aa21308b2d61c294c5a31116994768fb648b838f4950831beaa79cc4fa9845ae8d0a609', '284f8e0285fa617e940e41fb79e48bcdaf9402b7213a2de9c86057e1c4e10bd300ccac2e6439bc27', 0, '2025-04-23 08:40:27'),
('477b1fdd06feb6bea804d4cc63d326292ae88dface9eb12d7c4249bc41e9d361a82037025f94372a', 'c29f6a922d740db9cf0e52dd1bba202a45bfb2b7bd987e5ceccb6c6fce1af14506418195780479c4', 0, '2025-04-04 05:55:16'),
('481ebf101a5b946de8e4b8482e7b41e68b846a91a055e336084ee77eafb2f7ce163f5b021221478c', '4d9afe1e899984b2087e15ee607d03572be0e867163341acbc3d40ea915899ec7f923d3d5a66cc86', 0, '2025-04-22 12:13:02'),
('48c2badf3ddb3042e57c37f754f53597839d5c4e855d5aafcf74e5adb5b830d577d2bc37ffec9ce6', '54ef9fcedd03ea64e9b68777aa80532b06aa5e181d1723642e7bdd90b8a7d6ee8cb6369e024e2489', 0, '2025-05-17 13:21:46'),
('4915fc07106154c29c32d65dab4fa7ba50b6c5eaf570cf066dc3f2d2e87175e69b5d55a597236fc5', '2b6be3652e6219dcb7b101095ce8c101481762467c2a5a2020c441f93da3b90c2cefb753baecce9a', 0, '2025-05-08 14:31:27'),
('497ddb894c95ad3a319215d07ee6bd5ed5bfbc17537b4ab84f87c26a1468fc70471cfe2581c74a05', 'ab52a6ed53abfe51780d6de9f89ea8ab74196ee5bcd7a87a70f91eff45feab1de0b10daab81b179e', 0, '2025-06-13 11:38:47'),
('4ae1907f4a0dc5d6b5dca6fd073ba5c76f22f935b7dbafb7987794c10b4926b7ad5df38f91c9d661', '15d2681433773d95aa2cdd2750fa0676b3a62ea72f2f20964e3d9cda9ea49ce87fa15b4ee2e3bdcf', 0, '2025-05-03 12:42:38'),
('4ddc1f588838440fba2ba587385382f8eaeeccbc2ceaede5220220af11a05bcd9840301b9b5dc56d', 'c0166956807f174d31d29c1cb06f94c5f3a3dbfe64040342ba8d81381499d7fb2d384b743336a68f', 0, '2025-05-04 09:47:08'),
('4e420df9950575685a379a367504ab50dc25cf05881c496a24d966bfcafe447f78bdb4b188942ec4', 'd4d2a43a69c9cdbdfcae0cdb78c90341cf85b135896cd4582b6830a1adb6d69bf96cad994d32ae48', 0, '2025-05-23 12:48:17'),
('4e932a84ef4a2665f7b48a100e9bb5203afd3a2d2e746ee5d8f8c90dbfbfe9b52f8398d904878cc5', 'e212a78f8e5cf5f4c262b8879a7e3deecc51099d9a2f16a2531053aa2288eee30aef20be0ec64615', 0, '2025-05-29 06:22:34'),
('4f2029dd860d15e7cd845cd79ac9156236d6546c0e7fa8cb391beb5b35cf27e5442e5806c05d3dbf', 'ac06524ab7569d48a6392272a50edd112e0fc6d46f23c4f887fe327b78aa5169e7a77004ae390e82', 0, '2025-06-10 17:32:35'),
('4fcea46e1ea44261b77e5a5bd950171506b5bd7952dc368cfb2a290ea5c31eadf8abe705407273e0', '58bc576cf7d185e08df33a752ff7a556a920f5b00d045cc787767f878c633c14ad8b2447861ab1ff', 0, '2025-06-06 17:44:36'),
('4ffdb7927875a47e39f68cb3c5aa6bb9fd26f5bc44856dbe0d4faaef3ba00b6c99defa09758b6f82', '7579396ac864c168a7a932fc4259211d0a13f89e008cdc210b71fa1752603039bee9ca104a08d67f', 0, '2025-05-29 10:23:41'),
('505dada150958f2e36c33ad343784c026ad853ee0de3cd6f4e1849fe1064b024a1c38f59ad913d62', 'f36328a281a0a7bebd25dda675f2125ec3e2dbcb52becb2008922117d7bc277b6fb0513efa4d29f6', 0, '2025-05-21 04:59:01'),
('506d5cf5c7f31a7eb2a9b659635ac092a3f51444dc177ceb8d71ed78c4562a18fc97646d7dbfb996', 'a62fa50eb9ca369585b4644e3c92cdbe65200dc43b61363b4716381166bbf0265299d5b3936c1153', 0, '2025-05-20 08:00:00'),
('523d2278555766b866bfc9fe932192b6fcea6bee83c5ee456ee70ccdb22821d82a02f6e4532e846c', '5625634818e723f6df0ae48b0f43293dbfd153e2b48081a4067fe806e50f447e2e1e9e4e702f3fda', 0, '2025-05-21 05:24:23'),
('528ab59b4a0b8869dd41e0ff3e2c9505b07d602dfb42bd59a30f4fffe09a03fe351681dda5bbba2f', '7adcecbcd55ea95e0f13e0df8670408409778a37dfb337b17985d8f1e081bfd71487961bde3c30ae', 0, '2025-05-23 12:14:40'),
('5343636a2a289379864d20317105f09056e57e3756b7fecbb070586adfed89d46ec6fc940ab1c931', 'a5a28e231fcd64af23500126b6417d52b8398272d73e460c3288e6db061a5953592641b71004aa10', 0, '2025-05-18 05:41:20'),
('54380a551809984f8a2fa84507287400db2c3aa71972d5f4aa66e88aaa83af117318f39f54258c50', 'f39c2be80e9863add5f1b16a5574bf8c19a7ff3cfd7a521beee9656ff41a810700e1f050448a3199', 0, '2025-05-27 05:54:22'),
('55492b120a44b6b4a4b01a9988a906455cb603f7748e63a52bf039a03cc64978186d23ddb5b98a55', 'd1722c064960a42f3a7fcb4d4cd0fa8738758fb40551eab35e7022e44b5c421a3ae0f9d18fd8e3d2', 0, '2025-04-30 04:32:12'),
('579837b4b07e779d761b39973515ae812d4e1b0240858bd460f113062a0e2aa7428c36a95843b0d2', '200a7bdd313b598b95c2d6eacb9d03535b6dac58c21b09f50498dfa2756943e359396390ccd411b5', 0, '2025-06-11 17:27:51'),
('583301f74727aefb7b0d37d9a40045858638e52eb510fdd1c25f5e1c668026d28c41f3af71f54f90', 'a7522fa22cd546b46d5c7ad62a6799f60762478b06c49b04311deb4abc44370c9bb6760148532584', 0, '2025-06-07 16:31:58'),
('5860acf57babd022cc3aa79a0f59da2dc3dd3448dd83d74cf41175f6eb2461ead7f4d1e412c30cc1', 'beac0334c546b318b77ff12284ce78d90fb13332ee245f89e54ab0bc558d82932d01e5be32ef9562', 0, '2025-06-06 19:07:05'),
('59111c3847404dfb40bd3b47411caf8e449c81595f4fd5a8a06d24144905f4b76a62f9b7a456d46f', '25ba0b3593528fedb2f56fef375158ca0e4beb8d2d7cf31bc00b75647a9b0c348db5c6bf18138378', 0, '2025-06-06 16:01:05'),
('59802e8cd077753bbcab53b154247fff5b7fedc98f6c569a954b59bb1b54d1751f165831e3f973a3', '64be0079282d80c3f9ab0da8b2399f48872d5aef8b0c420601a80585bcd2710dca0c70e4ca0df3cc', 0, '2025-05-24 04:27:49'),
('5adbf873b5e7b01dd04495ae9683f045d067b0fb37cde66426c8abae36e67d7cb5bb36b840d03432', '337c55e093003969b15758d71cc9288cd335c21379caf6c045277d89dc0daa031223daaf89111bcc', 0, '2025-04-08 13:44:06'),
('5ae9e46305c61998c3aae1bd135b9694921f0c8c5ac294b5c488bf808a246030cebfe11b839934a9', '1e9ff241d9e76ebbc4e9145204cf1c54a764ef0f35580762bb56269b4d34f334c4f75e997cd10c58', 0, '2025-04-29 12:12:46'),
('5b0f7cec7494bb9fd470d280b7a2556da7a6e4540132842bf73889dfeaedb3e2ae2d3042d9ef6d3a', 'c231b2a3824d3b9d0cd2d4c092be753880775c8414da8cc1882506cfd2cab3de739b2008323b9401', 0, '2025-06-25 18:22:10'),
('5b7236dcec72a87ee3058299a8833b2a37b16ffa6f59072fe3fcda7924e165caa288221778cf24db', '287bc4ba5442401a337b72ea09021545a8db2bd7024578d3bdbe02c98f8346fee50012c531b4531e', 0, '2025-06-13 11:40:22'),
('5beac038172ef483165ce2fd704f44f9f1dd87b77bf76a656f66416a4a125cd34004e963df79b4d2', '74de2a91d8639805aa66943706f1414cefb120e0ab2d8891c738946a3355d3cf9662dbcd80aa21a0', 0, '2025-06-10 12:09:47'),
('5bff2e8b4b1e97c04f13c955256551757ec5eb871562f8525469e029a21515df9c67f72e68a8e6b1', 'c375badce21e0bfab4ccd78c0eec2a5b24d000336039af7fc6d1bd246612eeb9ff5b0d58cb1b4d59', 0, '2025-03-29 07:10:01'),
('5c53912aaf148dbc7ae58ab23a03c1aea63f5b71bc3d1936e6da25a8b63a92c26abcd3e5be9c2051', 'c8ec6cd4970b5d2a5be090b3c5a95da42213fba4b4f5a7ef9b539d42bf050ca9a9757bbcc616724f', 0, '2025-06-01 10:30:57'),
('5e9944d0adfd3d13092e28ace5f387fc0ee6bdc0f8e7ce585bcaf92cf1a7ca3c8f94adc3e40714d9', 'ea0580fcdf9c41596a6e65737a23084e187a09cb08b15e2b786bc2eab18d8276b22cf0f23e6f6824', 0, '2025-05-29 08:12:43'),
('5ff286d8ca3664651d0c3bf11b1caa3854c731a53a38bb4f6476aaf925744b075a39cb21eaab9da9', 'e3231cd61f1ada553df7dd81cc767ee2c282b917976503ea55780fc33d6a91b703feeae5f2aef259', 0, '2025-03-29 08:18:17'),
('6013b369ffb0bcc98d5d3c841b5a346f58d6c062d5968f1d0a500f0aaabce7063d26d3e1140c2c10', '2aa026701f44b9c824e60345c87e1a59c32af153329bdd12e26f658c295e6ae12820ba0df54999ee', 0, '2025-05-29 06:18:45'),
('6060d4f4e76ad620b17a28e3dc4d55d30d2e6e560a34576aed45d985b01128e995cbb9823c79f131', '365ae4214f57b6b3ae5f483df5ddcbdca206ecb205782e823aaf53ef37818f92049cd15e8162442d', 0, '2025-05-03 13:41:38'),
('60831bd703c5d1dc7684cfd0c7f704c5a75bfcdc3a9c7b0d877b9d7725f5b08c79702b68996fbdd2', '25e679e17c14fc9d77e84e72d5cc08c6a2e03a5616815531a7de2ecbe9a7b0f1a15330293a736155', 0, '2025-04-18 11:53:24'),
('6354976b5f88ffdac3ec271891ba520a4a90c3e1c4ce272b16c2b7b3d778508e45663953102f5337', 'e5ffa9eaf9a144083d47fcaf5553d3516ed2715b8d48244ad64fd8156331391f54e62d0b6082900c', 0, '2025-04-20 05:54:24'),
('658c507b117360e8f92f3e4496b92544716e2c288ce3ec596ce09b5cc03c95b44ccfc7b98a374b92', 'a9e3760a3d2f22c71a55aa7ecd62d3caea212dc1cd35ef76cdbc550deff39879ce2c77713ff07a2d', 0, '2025-06-07 19:46:23'),
('665d9d1f3a2884c08c7959b89803ed01e53c194b4b8c8eb1a9f8f2e8c78943bdf1c991c3be1c08c7', 'f21a0fc41179e0440f89e00344916a005ead41e9f442d6748451b782c6ab14f744bf27f747e82b71', 0, '2025-05-03 12:41:24'),
('665fe82c548003908fcfbee4fa7890bde89d887856c3ede37aa626ed22b41de020ed1061526296d2', 'c479e4c1328cdfb5ed6b6f49683e2d9801d00841e4f0b6782ff8b8ff66fde924c1aee16ea00f92b2', 0, '2025-03-29 12:08:18'),
('66f7455fd641bb4126dc93c341fcbe5c410e86862c97abb4b055e8f42fc3f19683180de770c62955', '7bc35dcc59bfcba5610678d79532fd44b987a56ddf5fa410467d011637c3159b5d1d5f9b79926033', 0, '2025-05-23 11:47:18'),
('6792cc27518c02b52d006eb7e824588c25bbe65f131f17d065b210961dc9b12878433f7e8c315bfc', 'cda052c8a521a37af7b293d7a7d9b1d8dfb26b13b0e89d7308a8e1ebead8d77f664fce9c80f15507', 0, '2025-04-04 06:18:35'),
('67940c3af64ec638c1c272c6888b84d33a7f4f2b1010bbfbdf4842be953b6d4760418c29a791255b', 'd8fb9cb51cbc269b80acf205998878535b7ae7bd467d8b8a10b52774fc7a104d0ea22aa9fa7ead83', 0, '2025-06-13 18:55:49'),
('686689ff343a7d7ff71758f9c0f208124a72d49d8f7df419ebaaa2642b0af7ec5eadd383f6f9dcbe', '7481bbd69cfabd071104d43c18a001650da3c089cdbc86275ada55e2a65580ec49a41657ce76194c', 0, '2025-04-08 13:39:33'),
('693200d9da79d622d5ed2d1da3b3e3d3df795f14dffbcf76ce410cffa27be261e68d6fb8451961d9', '6d8d6ccfbb46d231801e4431689ed6de998500838964cf45dc3317daf63be8ce1c23fcf9d7fb06b3', 0, '2025-04-18 11:33:57'),
('6d8b4d104a6898512bc26139754d8aea7480d75b254d8b362c39dc705bec9c226cf8e17fe945676e', '8e75bfcdcd897375f61c277541bce17e3a71d4a8a47ddd80f25d8187e9e223e7c3cbb72b65b801e7', 0, '2025-06-07 12:44:33'),
('6e21a92802b7ef9b629b249edc32726aa1a2b1be49f2861cccc22d03fe72f14145cd478a6df80759', '31d59513ab51bcebd89451316f4607c35071a48e48207d9219227097547c6ccfb5714a0c13f619bd', 0, '2025-04-03 06:28:21'),
('6e7e47652656f061daf3d0c8fa0ff64ab9d5497dc0f80dfa95e8bb83b5fc14c113cc55a1e9b9411e', 'c1b77ea0f84d68671664fceec2a89d0334d8505888bbf4480f1f2a947d0c6283655e53a0bdd9c46f', 0, '2025-03-29 10:55:48'),
('708b57363a67b10b957217a0c961500e6fd4067989da9dde22bc1815706afb611492c43ed23afbd4', '2c1624b1cb906e0b8671b000779151827518674cfa173065232b2686a057e4117f04497e9c7a51d7', 0, '2025-05-17 09:35:02'),
('710687f9558ecd5a9192ef68910c3f967cbd892e5a26adf160c843d5639d7eadf53334fc2077ce77', '04f8609065c871dbcba6a651be78ce2a1b35cc67906d5d19f4766825fb5dd756863b480d4c8c104c', 0, '2025-05-04 06:07:00'),
('7118e74922c3878d81a22c84998312fec5125c21900aaa1b7450634a87d42a8074d209c10ce857c9', '1c3b968d5827c80426e3b4c342c0bc151bcf6be975b0d9c76f7e8bb3030e83c5862e15ca20fd3f40', 0, '2025-06-26 12:32:09'),
('719ce8aa8b74a8de22d813452dc26500a2da4f88c02b4e31a148d342b5f27abdad58f29c414781d4', 'cd16e16882a8b1de40ca75c483461bc8a1ad4b44e3157077ae9292c553d6592390c0dfe548f6255e', 0, '2025-05-08 09:16:10'),
('72f9109465c2ce70c1d737927be3d00ff3a013fe77f1f2572773315439cd6b28c91a1185a8395cde', '535e8794961e3fdd003c045753e5d49ccf7a57d87175152b14ebc3f6905728fc7cd8a1e283673fcb', 0, '2025-04-12 11:46:42'),
('7305b22d4adc27fd0c52054115e9f7389b8650ce9c5b7201cdca8980c9fb1e8b43b1265b7991fbf7', '8c2bee1690051938e29535a5e5cfab7893f35c49530d0cf106e7f2e1b44cd82f9c141b5778992b98', 0, '2025-05-17 13:43:21'),
('73158544eb30b6a65e501750972029a1a2814f3009a0bcc790ad1ff1e59e4178fe0f230e5e30f37f', '3938e257a902e0db95d6920cc83fa0434f916408082823becff747eac631ef3db845dedea5b27df1', 0, '2025-04-12 10:44:42'),
('75532ee98674fe232fc8e281de4f66f4174c051de7450b7d643d9649e0e378049bb8698089fe1f4a', '36a940a4e3d02b60daabe86957684899ef4a721808ba586efb0553d96fb6687412ba98db7623e718', 0, '2025-05-03 14:04:47'),
('7623a25df73202714ed7828f449ca0de28cc51a03728696400ec7d6fe1b5783f63c34ab36c82e04b', '623cc4a80cfb9e296a8ef5e5074fedf3bc362e233c46d73613fb8ac94d70b14e05284676c22ae9f2', 0, '2025-06-25 18:07:56'),
('78dec6a9e020f7d2e9f1c68714bb5d618a1dcc28a686ff44737699688379fd8777bff18de6307d0a', '8958234a3bacc2a35e3b74d8b209cf5dd6e2d024d2d891c7d761c2f5a077614098c04bb2b89a8c2f', 0, '2025-05-03 10:02:33'),
('7ae1851dbfbb005ff7cd94566464094fda31d2f21879cf1475a36a9f31edaa21289de454b9b75224', '877ea150e5bd1decfde85c3a157b7750ff1206cc1c8128abde3b396f51fc32455a2083ba84f4d7a5', 0, '2025-04-12 11:46:12'),
('7b89e0b7f5ea078fc1c683756f1b6fd4001034941163d21bf287cb7205f00da90c2c36ad0413a7d4', 'cedff71e51493f2a175e804ccb83b5f610d4f497b19064d609c54f38a9bb187768f39195df337684', 0, '2025-05-16 11:44:56'),
('7c007b463f426b2a0cee9bcd59577c01346493b0c625a09a951161bbc1ada3e284d7735e079d940b', 'b3826c30f6ece260201abf20ea191991e0900d27f938000c728dbe4a2506b97831e9e506179db4fd', 0, '2025-06-27 10:52:15'),
('7c13c7cd88976e839f8f07df382f764edcc8ec49570cc823b56f646928bdaa584320e63de56703fc', 'c1a5864de3ec485172f7016be0af0aa83d8e4ee28ed1fd7ec95e1e810682487e485faa8d9568055e', 0, '2025-05-11 06:21:29'),
('7c498871263c7ede3056125b979cd6ba4ddf7289f65bd1a6fa9829d9276024a7b54ea543289a94db', '238f86f107c2f1a83db290db9cc48d1dd7c3158c8519ee11dbe1aa4d90df8128ea6da0241d83bf84', 0, '2025-04-20 13:29:01'),
('7d821f5ba9cbb534d4ca4a2aba078b361cc1cab67909697e08d5483e3d5a0632fee2fb2279155c3e', 'dfe1922e4ad427865c9841bd87273b5f021357cd1b862acec47756b2fab5da5da07221cd2027d75c', 0, '2025-04-01 06:39:27'),
('7dfe47daccaf8194a07ec8396b134c7026f1456ede6dc97a70409ad32cce88aac4b3fc09ed2fa77e', '9cb4d50bf5a1d8b867abd75d7fea33942c23211d63b29661ff1e89d59198908398e8368ee3192df2', 0, '2025-06-07 18:46:22'),
('7e9b8fe58b928cf563bc7dd7969d9b7f9892c4396e36c4ac5267d951dc9d0b196e2ff4c78de01196', '7db3f8b20004e17d0fe059db47551c18d4ba22fcdeaf432a93dc123f04421729132483ed0bd5ae0b', 0, '2025-06-26 12:34:10'),
('7f81974d3d892b225170c2871ffbd5f46b381470eabb6ce2d2b6900f54551765e3bbf72f2bca72c4', 'a6ee2c15ecb05f33a386962473eae5648025ecf0890803ffc5aaa9cc71f9fb434e3f60c598eb6151', 0, '2025-05-20 05:57:16'),
('8024df084510f2e5d70489926f7ba893760e9734b2a5243282f7acce3df96a82b7142348823b2d55', 'b849895caa6d70a447c9d5692cae3b36053d7453ff15e6e1d0819b8a85da8a7a9e9b87ed06dfa249', 0, '2025-06-10 17:32:35'),
('81311c8527e473141b1752307e295490529860dde04d601651dad763988672ebc68c4d4df2faf779', '0849fa8577aea41232e1e84e190b5dc80822d61f3d0d92a9f4ec3eeb26f3c8fa99193de5d2304fba', 0, '2025-04-16 07:06:57'),
('81d3d4d30b2d1fcfccfc262843e71d96b6d9e7add00a6561209ef4d726cc98588388ea0ba942cfcf', '561e5f3b06fba5a28710e7077a49f68f5164b1f01d2ca0058a4b8c19794d990486e3722a3e263dc7', 0, '2025-06-25 17:25:52'),
('8256abd7ddc2f4935977b9f583095917b67e73016588804d417c39a8c6cb2db9abaaac529a8f5892', 'e672dbbe2307849c62a94e8f30f320dfa8e92905f8b034619d310193601bb35553302acca681a54f', 0, '2025-03-29 10:07:47'),
('829d6d13e37bad7a263c477e26b59b9469e15675e2aae410e6f5da788d0502c042851d5da7c2c960', '02b442ddeacfd952e87ddb5d5482b01a66f234706700af51ff01fb469353202bae811b35b4804fae', 0, '2025-05-24 06:15:51'),
('82d061f25055cf9b03711842e366f01c441698476b436a1c1be9f7ebccbac07625c5e2b9cb442259', 'ee4902604deece3ff1cb3d4793c93ccf197c539b101f181510b36ccc1a09fee742776ef502acd23b', 0, '2025-06-11 11:22:04'),
('82df3ce93d6df95e05da26d415bf912bd48d766ed5d4d5b75e23e90468f043705a91d8a7bc1f0723', 'ed95d706500d819faeebb880e3d72a24d2aa33ddf08519a645c5db0873476d211447b21cb55ff4cf', 0, '2025-05-10 09:29:47'),
('8419b3fcaa392065281245313b81dbb2bf6be0ae40939b9b6a536b9a07b6ca0915655309f9e1aa6b', '2780c8446a574672ce109b89f48865b4a396d2083b470803abd6c072559fdf806c1d776aca135dbd', 0, '2025-05-23 09:28:28'),
('841ca6a261d06b61bae47bbb78c74d06230e3084b6abd735a645121591be60d70be678a63fa4c35d', '4ec5da222cb2ccdfb00c2ad0ed4fadc26445cf1432d31a9818ef12ad27e6caf80e9511181ed5d06c', 0, '2025-04-18 11:50:22'),
('849b0d1f006789976d67df920ebd12570a4916fdd7cfaf0f333746e074707a2b682e6d313adea3e4', 'a123f152169775ef583c2c24176bd86398186a02917096bfe56a1375d6b51a2af4a43db08286b9bc', 0, '2025-03-29 10:57:15'),
('8567e6725d9bd3298abf83be6edbe1f1e4a4a83d46300f5edd6869637ce1b5b6258514a5f4b456ef', '44fd562edea8204b9e0a3533dfa24ea8080e984237ca0b39e11513f5de439bfe859f2705decbf1a2', 0, '2025-05-29 10:13:02'),
('86aaceef75021bcbeefcdf78dee1819e15381f6fd3e52b9023615f93c81a48ec3915a98eed006453', '6ffbe09005b8ead979d226c2da220f930d7ca92472ef26d78ffdaea07f5ce2dc5e55e6cf22118282', 0, '2025-05-09 12:08:15'),
('87952ec17fec6441d0e6e1cf35cc7c34394af07fdb9742230e289cf9ffd934b9dd50110c23e5c9df', '0edcc238a7b62752013fdf1cf6467934ec52ff637bcae2153fbc13f383b95e952514833bf07d1397', 0, '2025-05-10 07:36:05'),
('8898ca94393546e74e23013239ae66efa42fcc59fed46afe96120a138b17b549992dd461beafa5bf', '77a5cffe11c4100d8906389b4bc750537b8e54cd8884a6f27867ac18124b772c5b1b6f3eaea17f4b', 0, '2025-05-16 13:11:06'),
('890ba50d686905ddb84589070ab413df0205c07889161d7614720e9205c4e28c78239184237dfce3', '00a71d1315a3a20ea00097a402e170a3f44725b969be0ece9c36f47350c4605dbba4c7b0d1c023c3', 0, '2025-03-29 10:53:52'),
('89e14c61a2bc6c2b62003e8cba86a69e1b09f3e41bea28ab1aceb2ac2e230ff7838bb16b6c3d81bb', 'e61bbe36f1f96285864dbf9f1f1bec446a872ecaccf218667f37ffb9cad5b6e404dd3734bc6e79a4', 0, '2025-05-29 05:51:15'),
('8a0ed5cc387fe9c6531fd42df098cf0905bbecbf88baee7a89205d3fd852592009af0c013658a566', '66f5abc6c1f33c7c4a5499280cdbcc096ea4f68eff43f0bc2516fd612170902e678e2d7744b66117', 0, '2025-04-20 10:33:46'),
('8b7d7d01a4e4f586c69b04524e05e9d197c9ff89c33397ac0f6399c135ad4de2243b6b75c862b570', '4b2b01e3c59b1f20de1a882f3739aba8acf478d14d8ec0a2382bb2964bdfc5649b64dbdf7f98eb35', 0, '2025-05-23 04:53:49'),
('8dc287c6e13e17c4fb06eb07c59a7a3b49384b55ade470cf38500b3a15a0f01ea6bf20dab0b1f656', '6d8b697131b20ea65fcc5a5997860b263376a3f93b99f4ac60737bce9d43cfd845865f511529e4be', 0, '2025-03-29 10:50:47'),
('8dd7dfec93fadb06cca5b0c1daaa8284821fc1a060e4cb69360afde69ea31c358237b9d502e2062c', '72b849fa8dc9a15efbf6871aed3cb9e06ec2789df0aea0f392fe5b9ab5a90b205ba9b380542a4e58', 0, '2025-05-30 19:24:04'),
('8ded0934239442ac104290ad74a9a7720d95378497364786f3de3797fff10b0cecea83330097cab0', '991beb8bf6609c210565dbd8fbede47094ffb2d1c12bbbce5304f0fbdf25735723e75b3e7d336805', 0, '2025-06-11 15:49:16'),
('8e0004752e0a554812fd2de33aaa8e98e75cb45686824872dff9c42f6c02a238cab9460d901efd3f', '5a887374fec262630264ddaffab2cee0f1003d75739e5378b3abac1c58ad1805ae990c6da55fc9f0', 0, '2025-03-29 10:05:09'),
('8edfa30a8b74558180b1b75f82f4255e0e3b19a2db8b11eeb949dafcc6a444965f9a5f4b9271da45', '4c8ad29e6f11db3c99650e8f6f961284a4ccd7f8358357b6ff2de7ac9ed795e8e7b6065cf17cd552', 0, '2025-04-29 11:52:04'),
('8f7239a4097c9ae80e1237e1d9e7dbce780178bf486d064dedcd5a783b3d935e4d239a0abb2ab353', '44784c6a6c09317a4357bed2155eb3f9f3859c58da1981aa14c5f26b3bbbb30a3a889591179872e3', 0, '2025-04-01 06:48:23'),
('925b4cbf806e195d14b824ed082b2d1efd2295733e79d1e6f35ef132c116ba79f503cfe1b8ff9d87', '3aa65d6f3354c37de25190798ab00481433100cc0707dbb12c9971d66428a4713b3a89db34beb1b1', 0, '2025-05-09 04:50:53'),
('95368040aa72a85f9b2292c77176cb8f25bc00a6ecaad2ddbb24a6d0003334062451917d8d7d0eb5', '1bac6a81952d122b75d441443f22045fbc54aa53bc1b50feaa48bb40456811e0efe7c899def196f6', 0, '2025-06-13 10:39:05'),
('95f023f52139344327e71c6bdb0f77996e90eeba1e9596d67fa05cb838e3cb3f956fe2e0f9a010a1', '9e677013e8a9a6795e1b85f2556a4f1e4681f01ad5f25a9b1bc914a1fbea24bf6b08909e09ac8b29', 0, '2025-03-29 08:10:42'),
('97c79f8cad74e153ec70d723a45f7f1033a714fa7bfdfb0065590b531aa285866830f58a09ba4f93', 'f6a67b36d4f953df2aebb2b7b485930c5f560e5d376b9060041b69493709880102bfcc08bf7d17f7', 0, '2025-05-29 05:52:51'),
('9825d8e5b30c7d98cbff3023abfe597eb2373139d52c498b0d974ff3ae11712daf1a7fa503b8cd8b', 'edc1e9e2fdc4289138985bd909f64a521abb2aebbae8927327126de622405f5afa22ab8cb89c0338', 0, '2025-03-29 10:03:57'),
('983ab765b049c94ac32a5eba13a62d231afe641ba3dffcc9f16fc7c4a30430a39dd28c91e2a72d39', '0c8d4ddec76af3d3005eb7c029951a23a1b3f895eaf60ad6eb6020c9823d47dcb142fc32e9414410', 0, '2025-05-06 07:02:23'),
('983c0ad9660f079906f04c9746751972ac62076e4d2fcd628def3e2f0757cc9ef412a7aa72d4671f', '862da4734d64094d61c2847d84f2c0526b6ae5e80a2e8f1ac5a3655ec8a2689539cfbac4ff7dc8d6', 0, '2025-05-09 10:04:54'),
('98cf8b8a0390a9d11ab4c28ac23ecd3240557787b6be5278d53983275e4657bb5da7024a72ed62b5', '373eef772b09924713a564f7accb15a1e1a2153381c1b6e14716e76f56583e87ec8651c1bbf09dde', 0, '2025-06-26 15:02:39'),
('98e39f8f8abddc151b4e54bc04fc0861cea7e63095c7d426f53af9a8d3c9a568f0446782ce879390', '86fccc1fa50f170c2fc98649a71c623e7314e3f00e340a3d949634592086bb2f44b0096ae2900784', 0, '2025-05-28 05:31:32'),
('993e3a748c390b75da4a69373f8e2fc853211e15e56723c0efbf38cf669f39cb9fc3cb21c2e88464', '54c2093bc06c5f89ea74b734b94ba6e27936e9dbd252cff0e975b83662ff70f9cd6ef61333bed145', 0, '2025-04-30 09:39:40'),
('9a7a87e17b07c9be25c46c67e83db3fa1e42f09ceb4bbebff3b07a34e574bd4d947ed4916a1a8829', '3825ddfdbecfa76bfc3bffcfaf1e7dc66d40dd72534a487ca630c385445826ae6469f879351edf21', 0, '2025-06-13 11:39:28'),
('9b046f0558b1e592a1bd6b7b9c8205cfa52d0574a7916e0bd472de2297f39fd0b05db5274aa0388e', 'd6d6fe2451af34dd7a278befa180a5261d1b5c531e607baeb01be90721471bb9bf97ee73a18abaed', 0, '2025-05-09 11:46:06'),
('9c856158281033d11afe16ea94d340383b171dcfa01541eab04c9570ed97fd6e647d2d1aeea36382', '3d9f5087a973ad544a0470ccd9d94953f4f9133c1072441bde8c124e20df586e76297f2b83b42e30', 0, '2025-06-07 16:08:34'),
('9d6314e4acd952cb43af69380584237b34791f0a1ac723d16c5841c892e9db7778bb7aa7673030f4', 'c882fc4bc1b731b47c3c9039b2be1082e68ac0444f524e83156692f6d1cc87a4d24c1feaf75ce358', 0, '2025-06-25 16:52:39'),
('9e11f178d8185911ccec12d5dec829132d636b05f8fb26c50fecfd44a31e683f92352a3e0f30001c', '412b72acc7413b964964a0a184924dafdd2b0f7a965027da68c51e9facaf58c971878c0098fb3e3a', 0, '2025-06-07 17:59:05'),
('9e1d708c60c18c9c327d7d7fcb0616084f14e1549dabc3014bddb7ff7b4af57aa6bcc05924f81df1', '77cc1e4d24c58a6849ddde1056a6f727f8871a7d392853c51aced0b35b3397858eeee6cda7c7ad1a', 0, '2025-04-20 05:03:03'),
('a0d7ad1f3879ba53647efd9841036a6b25aa5b14be612454548cde705b0335704b0c68a6c04d6e95', '8a60042e581e9c9067db18aa4f054e6de598a5090c6e6d3d2847175e6560659cc48b0f24cd7f7ad9', 0, '2025-04-08 13:24:30'),
('a25f509aaf7f9f37cddce9b24491f0b4c9f2bdac2c6bf9b2180534ea491fde1328f08d3870deb008', '1970401e77b9bb9fd011d1776ecf3420c06a0a1eb69ed654044bf4ef1e70560a747f99ba970197e5', 0, '2025-06-10 14:52:57'),
('a2ad43a1fd67a192822ea73de35d18fc714bf70f9230d68ee8c382c51950ed593dd655244e5e5f66', '8b79fbfc419a81fece32454cb0fc06fef1cd8790b8c011c26b30c19220b02ffa4bce0e5ee3e8868a', 0, '2025-06-07 13:01:16'),
('a2f25779106a4d82465b394ab0adf7df4ec2e5d4a9fac0ff889fb2b9a8029ddd689784fcd9bdb56b', 'f884b06fd57c27f4b2d7d32a0f726244041e9b68ba9b99473953102ef9f3d838a08888231fb3acce', 0, '2025-05-06 09:55:17'),
('a3269fddfe4390f1f58e84453a4ffb14974d45902d809f12d6830244394a4f8d5d6c4d76ceac2de2', '95a751c8e7622fac9c81ad05d28f7633256b0d6083960ae8a59e6e5d0948319c37340e5174a01b4b', 0, '2025-05-23 11:52:21'),
('a32adce00950b635b6539e7b1a4877e2fbff6e00bac9fd28f01394ceb93c524b94f7df911a610507', '14ef76873076d20bf92209fd0112fffc57211d3af8d13281b5eff99e5e602345400357493fdcd47e', 0, '2025-05-08 14:27:26'),
('a34e05e304fdc3e4628d4b07d3269400f347de04aae76d2d75f6685c93d6bd29f8b3c0f1a40bc389', '1e1c43c324dfee22a57edc1dc8fda20af8e424995de99db8ba30cc96729aca90f3ddd4fbbe95de2d', 0, '2025-05-04 05:40:38'),
('a5abab86fae72e0fe9686fd041e554ae50803cf9e7f18862bd5763efe0ddf105e799edebf0860881', '68f8de735f6c910a81a2d47542f868a753a417b74e820beca1d57ef2783534cc16c8eb097263051b', 0, '2025-05-29 09:34:32'),
('a5da36b076d22b5c7345e6cef3c8ec03b1d320c637f810880a9d62aee770e17f39435c50428a7295', 'f9ad8a7b13f65393de183de2c69cad3afa61baac3a23f7e97c6621fecde0fb509d58b6daeb5f7d69', 0, '2025-05-30 19:29:04'),
('a5f91b7ace0584d50e78fee87d8ab57fb071602086b4382f0e19821b671375181e7924b9fa78e562', '2c59bcbab420288e1cb74863d0118d0f1f21e0733ae12d7dbdbf50c7a028ee0d3bd47254dd89720b', 0, '2025-04-15 05:59:46'),
('a6a1394373c5ead714c2a19a311bc2dbc298c07ed0208d748c0fd6169e4b627c418b5ef555619eaa', '0289443281d2756ec8efaf227faaf920f9e9a8b66f5ac68c883d93939b2286e9532abc9135c6f5ae', 0, '2025-06-26 17:31:28'),
('a732d7df6e28a819e09cd58d10079d90e16a396cd063399fa5a674c1043329f6e1366266ca389a06', '48716ec02f2e734f79e820a7006dc4ea14e991fe75648084dc4d024f3b12d7d6d59ed78fa5a225a6', 0, '2025-06-10 15:02:19'),
('a76f4e59ccfe40019549b5af5586e9e7a85a74da12774fd01de887d0dc7b33ea828db89d09bf4e64', 'baf21b0d2ceeb45427be91e76c5242f40befbcaf79cb2cdb129710387c878fb343a6a97748d45f39', 0, '2025-04-20 10:34:41'),
('a8981db6350e73e719edb60edac1be24780f112c463e0992315b27c5984467c4bad5c4f723763328', 'fefb27addba01332f470854f8f987013e2ec275478a01b2ea947fcaccfd93a65afca55ee1d3fa4f2', 0, '2025-06-13 11:40:47'),
('ab4574a8bfbf98add1bea5ce603b9e3a1e335c111daded9d992e87f50bcdb6b2388fa7174a997a0a', '304f6009d202bc1e229d781b07e8215ae7aaa6da3dc5b5afcdfeefa34fa1860b265bf46292cd3bb5', 0, '2025-05-15 06:27:14'),
('ac26d5f4051d8528c50669d25d3ebda7875680f809af3a76e566a6f34e93901f2e1e6b34713595cd', 'b5eba437cd97c56e10afd0a789ee109b37d22eeb3225a1cd567131d876aea93030917ad963051bdb', 0, '2025-05-23 12:14:35'),
('aca28cc20247e8820023d53af8052443a48b526ba38d5602c49af4d7e8eeb1e53ce9db55d6a7a436', 'b8f44cf49438ea6678e9bb33ab1e7872220e41b682b589c41cdd72b541f1baa9b0cefadc5cb7305e', 0, '2025-03-29 11:01:00'),
('acba6aa5a79bfee4799e9334eef5db65b83e9537520f103b0df87ac4ddd7071bc4dd32a9defdc23b', '75c52018eddd4fbf02ad495bb5902b4450d8f81c85e3709cfd08c44aad1754e5464f66285d5a7b5c', 0, '2025-05-27 12:19:57'),
('accdc1119b1c00e3985a18fdf50b8fb9bd77edbb7be595552ac58a77e70ccd9da4457125f3e22209', 'bfc6b586557028aa5016fb64d81aa9366d552abe97c005f4979e44eaa3732d861961e84a699d7791', 0, '2025-05-29 09:45:25'),
('ad2e801c78d8de38d05b70a84763970f2d7d59f4824cb2d452d7517d82f9a3767cd3bba3e8c5a225', 'e3082024703991ae893d605471f9e6f1a0e78a2a975bf9035795ae5ab9e612f681409cc0ebf63ade', 0, '2025-05-29 10:02:31'),
('aec6cf856b0ce2fa87af111681e86cebc76914831209a9b4a0f522bd745485886c76769d9b70ea60', 'f23686176b758f24b6972b5772e7cba89e30052c12d0d1c44ba81e49539f5ae54d85ee3c16feeff6', 0, '2025-05-20 13:32:52'),
('af1f278d4ccba374e0d10bcab509a3eab4f3b1a3d972a361c58300e0209515137b2b42b04ba3cf4c', '1876e5af966f4eac5a6e5cd43173aa13f27f3e5ba6005b9ab4304cef9df14ac2d02922eea350a623', 0, '2025-06-06 15:12:05'),
('af88e00a6c5a8a62090465598393798812bef79fc86e4756433cf87c1f2d4f452e20a3de01b00ba9', '7c8de83f450eb9a7163d0d5ac8763346934444b4da28421f6d185c8f0b93000a9ec7d61f7399a17a', 0, '2025-05-16 12:10:06'),
('b001c69441e3176da08d729a0a6cff855bc1cb889de4964ced08fb0c27dc32a78b0d8c955858093e', '3d09f29400c81f939d989a9087905cc1c141a79898c642896c9a0040513af0da2cf1d7545c14c4d3', 0, '2025-05-06 07:02:41'),
('b192afb78441becded05cdec84132a2a02f1793c46da41d8facbb7cf181d1de8d44ff9bd30b8300e', '955ecdaa7e7f5383e30d24bdef73449747c99b864184a5c2b50549efdc26babc729682fe1bfba2cb', 0, '2025-04-01 05:04:00'),
('b219566236750cabc3d1352d6f954c0561de87bf170b12e97d40c4bec5bc80fc6767a652e18f2787', '56f896d33a9959ca9f77bd6be7ce881aefbf771fc6c0cf8b9734b844ceb6dcff1c16bbedaad5acbb', 0, '2025-04-19 14:34:28'),
('b26de0030f23dfdc653806a6a82f4551b656970cde4bbbb5ce093a11acb42c3bf2ff1f83a750ec9a', '7c5224f17b0cacd4d1b05f2d1831b9255bae4cac47168a91c36e1af919cc64e6214d052ced4f5d68', 0, '2025-06-06 16:50:29'),
('b2e7eef42eecbf6722ec6ebb6693222e14f284a2372874fd22a9d8274e61a5f90fa019a4571c2625', 'c1ea4228c3134b18a1731b175b6db85a4d9a1fc9d1ddad37f1e5c34479c9407344a3394a70572dde', 0, '2025-05-27 08:18:13'),
('b3ee3564ee5cc2a2c9c337ecd03ae27575e3e7eeb657ec4098fa265f4b50ebc7306b5ea964fbea33', '32213b8a9642db3bfb7ad5c541e68d39baaa463a6d1918e9f94701c835b0c2f7713e70e569bd19b9', 0, '2025-04-19 08:02:12'),
('b42cf131a4c5ade0bb3248fe2498518f6f24d25597fc0f74cf043188ff5c85faccb088383424f7e9', 'ec16b4084587879cca7b552d7e14101dc2a6dab4e5c68b66b9170d2deb513ae224ec7272ba035a60', 0, '2025-06-12 19:05:45'),
('b445b28533955114a083e600b19b6d0d1c1888cb4780f259f2271e409656e3c11ec656d5ae94400f', '379ba2545807d6895f297851701d82818380389eaf9ddbb99c6cdf1c9ca92f9ba4d49d280985948d', 0, '2025-04-18 05:54:12'),
('b4b5f6f3078f08bbff824e46bbe251b977ac9e2a90ad98aa3060f980d1cacd728e7853d233ae0a61', 'f7edae3848bba06ff3125858ab81fd072c99e9cf8db9d880438b7ff51bf633457758677ec891f32f', 0, '2025-05-06 07:03:05'),
('b51b0e64104ddbad83fc0a3f1e7bcd49a49e4d7c0c77fdc3bab73058d77c8720e2902ae35cf23196', '9f79395aff7ab8f436adf9d8fd9cb1199196e2827b643152a06f003801d721926a3369e6e993b2f3', 0, '2025-03-29 08:09:45'),
('b563fdbbb497b89e745199a9dc7505bbf62569bfa6d52eaa407853bd9f89d3d1f38479d34a5f0027', 'f1b55430a382572b3d14b6b52bf2f6475e28e21b0dfd9768df193b8b8541444cab720c12d5ae2aae', 0, '2025-04-08 14:06:35'),
('b64e7177f82a03e2d4d252064b15765e5e2c497468f12f5bb28915ecaeff0e52d3b13d9576bd272b', 'a2e6b88501ff6233f58f711a8e3596d37404e59dff3ee88ee0d2f0f6b71481b41a3e4aa8249b58fd', 0, '2025-06-07 17:08:42'),
('b7120f1a5d085dd7969b7f5f75fd54b68a1ab33ecfb924e8abf33f265411736f122112a85d309a59', 'c7a4ab1e39267011bf523d54e02c658762a18bfacee30254168360cd3486df4016d59148029546f2', 0, '2025-05-30 18:24:45'),
('b7305fb5816a98bba430b0b8e0568490f932c95731fefdb674c5d721bed92e44be4b81e1443727c6', '1d3588fc1092dbef578f4a111401fb1eb1c04c61f50ae476bdfea4d5d100c88da3ccb0c564100b20', 0, '2025-05-10 09:39:06'),
('b7fa542a2e27d34bd2b66bab111469af4301c3cf726559c77f8aa67abbe1918c01a620b21dfd7399', '4a7e8813ab9da91c0daba884e3eb3e227d1b284fd4da9c42fe128f880b9e07a955d4f245c999bc0e', 0, '2025-06-11 16:07:57'),
('b822981e781ddb770fcea44b8b2e08651909e2b0d55d47d5394842a4922778f4333c58b8ec27661f', 'c9b5ec4018e86ee2bd9f13e43e5996a08b09306f10334a1404e32657a186ffa6e275d00d882f70d9', 0, '2025-06-10 17:32:35'),
('b849eb3109ce3bebc491458c4978b3efd114bfbab73e3bd977711f172239c02eb8da1bdbdab69134', '770d0cef6fc988c092fd4d908e0dc71039c8073948b4780bfe6735deba71b35499711f51dc55e5c1', 0, '2025-06-11 18:01:38'),
('b899c9eab166cd4ea97debc68bac753c066012c68c44612276c22ffa5238f00a4ac50c03c25d8878', '139bfce4a6e28a6e13c03f8067b46bc384a376f294501d254a2b1737961d40fb1152ecf9fe584537', 0, '2025-04-18 11:47:23'),
('b98d5ced35f310a3586097899c19eebacc8cfa401793870dd627c742786083b0457a439691b068b4', '3b5796292992795027e6a916ac91b9b70e03fe58095e150d78e1efa7c01dc870deb37db4db03c6c5', 0, '2025-06-06 11:48:04'),
('b9ab36bd51f4eb8b81f6490ab9fec3c6ccf01bea9cf16e9f854300b9d3c913ecbf3ea1f44cd67c9e', '464939d179b73161ce57d7e05a57219d3f8abd397f977627215096e0f42d120044be3525d600495f', 0, '2025-05-29 07:28:58'),
('ba19145be38c815773b3a97b5ac0ae34b09b7d8a4ef671d8209e4f62c57891623fd346808d98b10e', '6580cae4d054a2cbd9b05e6041099a594184f049d3e8e96702eea50af923f8f4a47955a732be1d99', 0, '2025-06-26 12:50:28'),
('baa7bba46815a5f8c74ac4f008d1322f79e701a154f0d2228161c2a06fc4bf27d4607f69694c3d2e', '034a14ad3d14337a352a4aa78f238b920791cff65391f51af59f3a5ca06d4ef862d66ff879fb2e1b', 0, '2025-06-25 19:25:20'),
('bae3afcd9e05c890dd314d82db03243744834a4f561e1aa898ba971769f7be2ce407509ef34761c1', 'c68f9455c744c817e32404ecae11c274787a7759d5d46d775c699809a6f3300fdfc8ac372edae6fa', 0, '2025-06-12 13:36:49'),
('bc1535cd48696a59472122815632bc3cab0bd958e6d0d3b67b70ea58b119270cd7163f476ce2d35d', 'bd6621610891fc251c2160fd60d79e6a93763ca050a70ed73034f29df39b84df9c2364386f49e972', 0, '2025-05-18 11:58:10'),
('bc902b1635dcdf7f6744ec4bfe8a7838e4f53f58273fef4b5a4d653ab37c6306aa98438ad2554b6b', 'bb1cbb90b1935a5f8c7604c8b2ef71fd8617aee7c4c6e63d5c0cbd80a8404dcf0a7b49ec4299b82f', 0, '2025-04-18 11:49:07'),
('be03fbc44a81fa76960c122128ca5c8fdca3d37ffca5884b5ef1e4986dc0401f32d7af70943d1265', '4cf1032e2331bd532fa4b1c84a228bf9ac4d9ece47c802dc0bd77184ee3d8cda3044303ea4f0ecd6', 0, '2025-06-11 12:32:57'),
('c013c67d44a546b0f2d99c1db0d58b33579ebd400944349d303b762b372ed76b185c30715b962a8f', '92e5ffd3c066db58f7abb89e7afa237022e5d87f5fc13d83fbf819a0664f466f84e42c5a5875291c', 0, '2025-06-06 12:47:25'),
('c073c005d1ce77c97c0e14086deb57b8011e1279e1d86b5e32637d7b424f35903284894eb84f2319', '1d67dbc4d0c96f6b6cb2d72332d26f34658c96c09bd6fb2098794f16a609c0f2d64861d65b908321', 0, '2025-05-29 06:32:31'),
('c1b0e24786b6e95feaa911036f705efb9b636e6e3fba980c78e5d3f78dda12a71cde8c7fbf577cea', '00a6c96de592ddcab093721de4356c5cf3e7f28eef8ec0fb5fd6f2d0159fc432f86252aa65b35eb2', 0, '2025-04-05 09:30:21'),
('c1e0ea48ef766c2f24072b4dce14690a80cc9ff0d1f045994c603e1736cfb8d54f8b8b3e7bb19ff7', '73459373976fe57b5d02171b566e34e1649cff93a563a0ad1493d5494e430b0f721a2ade9058f452', 0, '2025-06-26 17:33:37'),
('c3385b1f573fcce565b32553b47715edc0a949a15659e4ebc35773cafa951ff4eb35c4761ffe4196', 'eda814568ff52e9ee366575c26a07820916c4ad7e172bdce8177e5a8813a568497d42195bf1bb155', 0, '2025-05-04 10:00:28'),
('c3452670ebbe9a7fa593260420691e3a754570fcbfc188bb9bc66f91d3a3a46dc7eb3d25839e6bea', '0f7c00265e7a280c6e24ad2e1937e7cd9671b42bae67875a795e8ee84be3266ab213f26632e6d5e7', 0, '2025-05-20 13:57:03'),
('c3b0bb47f7da8153a0d6a1b96dcc59ef4a5337ee66c12e2f3b0e605bd966964955d4ff5d4e931eb3', '3024a122bab0512caace29f2c86ba4c61c4522974899f5215233da5a984bcdd747d1179cb900b1d0', 0, '2025-05-18 06:26:58'),
('c44aa20b9ec0331b421d70cedbff8558f0c18cc3f1837af252f7d14b7bdd7a0247cb4c2b4d7ee33a', '7ab668d2de930ca602647785ac5f28c04e20835be132ebec1577f8ecd65b5d0cbf5fcfaedd37ff2e', 0, '2025-06-12 16:31:30'),
('c5dabf3e394ac2a5a8772a45e3622995f26c5f9ff52a8cc8815cd6f63daf4a22e5b514f9bcb92cc3', '994b200835a1f37d377ef60f4a339ab51c70da4b4a6d20a3c31b695a9094c799f598c92936123a0f', 0, '2025-05-23 11:23:21'),
('c60fb44a7a194fcda30848096dbff95097eea00184b135ab6738d508a470ba6d37c9d41b60d841d4', 'd32234199d7e996a50ad351da5fe25901dd1288ccee48b58cb7bd71786d029d00ca2a69b45aa817f', 0, '2025-04-16 06:09:07'),
('c691118d20af28aca206118453ff3c59a4fec7711ab3456e94a135f2fbcbf15e230773f2984168bb', '8429d5993303f76318c704dc498f14ad955d34c79ca16dd465ca49f7222d566a0e4a7737efbfc32c', 0, '2025-06-06 15:48:54'),
('c6f6490847f42d5e479c44ccb191adf3840a3e954a1c74a2f3489fea7e4ad9fea76713365a2023fe', 'a31b290f1cddd95ee2509890c64451f4c1fd9b982960552e2b632607afa87cd95bc06c24df2414b0', 0, '2025-06-13 19:39:20'),
('c700474f7a805ac4ba92e888ede154ca5075e94e2769148edcb55d0f8f644df67f11c60ce66281e6', 'fc7c701bcbb53e2b97fbb5338dec0e49ffa049c1464064ae374a5e06e4d0f2d280e00e88d1ae345e', 0, '2025-06-25 17:20:59'),
('c730a4235b740e1a4747673956a27b34830c01f4e4880f0c0416db0bdef6f55fb49e053569792f5b', '2b0dc0d4e26e30d6ea115ac5802ce89ae2eea22d0fd5ebf5771dd5610344137130b0304cc96bd6ed', 0, '2025-05-30 18:12:10'),
('c771ca1bec201cd49e7561921b1ae14593643a216b7d6a2ef04c70215ff8e25af74564906416ff2a', '6cbb2c9c411234d397f41de816a204b20bd0ca619260ee60622257e0ca60f5781d31a80634a262b5', 0, '2025-05-28 07:12:12'),
('c8a4444a78c4ef849f78b5b17fd325ea4377208ee58c3d5edf96b767855bdabe569964567ba916b7', '9c0da66ccd6574df89b856bbaf2b02cc1bdb5f9856bf4f4793d102a18c9278680efb5a0f2c880078', 0, '2025-05-07 06:09:59'),
('caacefc32978141daa4a02d3448ca1127e3d0bae3d312b7dc2241a0fc6d1cc6c5e3018ba9055798c', '7a7ce2dcb7050461dd595d391a8c6563ebff0f07823c9c7cf62f2bb2c62b79c8d5ca1eea30940cf1', 0, '2025-05-29 10:13:51'),
('cb7f72cd1b04ff419cfb51b83cb4893a5790f4a5b2b94ce143a197c0993c8f755491ceb43ae431af', '5c0cc91e13cd769d228b90f46fecce64fc863f93846f66bdc49d980474633d2f3a8e42d013a4efd1', 0, '2025-05-15 04:59:47'),
('cc1a043a14b106ca6f11c11d8dbec68139334bd63dc3d68404d81f66d050d93fa180c83e5253713d', 'bcfef5a34451ff76970c3e8c695cf1df34cbecf74c7d89d37cfe4a759ee416a19061a11944b40ac5', 0, '2025-05-18 06:48:55'),
('cc70c1e053b4c2e83ca910175ec1341cf34450e7d2c4e61c886ee48fae39217d87768259e2d6ad8d', 'acf29281b5cd1bdcdab4e10e516b5f0b7c2a9cda26dc603a099fff561bfa8755540fd889bf7fd06f', 0, '2025-03-29 11:09:11'),
('cd3c5f5d35999dbd48fa68fdc4ad3159be3a11e998833140a7faa09a0d432bf6e75aa928e7e1e991', '1ad0cabf0d2c3722a63ce71ec7e1e9172463f5cd2864c7c2d74b238b51c93b2ec0bf567ac434a357', 0, '2025-05-03 13:38:24'),
('cdf192ddcd188ba2224cc1dc32c34fa2900ba2dbbd625ce6413714d30183bdb9859b19ac0c6b216b', 'f49de74c8fa9b5e4456808af64606f9f0bfb30a0a60e0dde4d3e7dfe04f0a85a783af443cafb34ae', 0, '2025-06-10 19:04:10'),
('ceca9c91c6226d89e5f472bbbabafd74a486bb8155a6e8b6b0deadb3f57e01564d010e8feb2f275f', 'de811fc1fd3d8986d0e11b312826711fd121f7d56c73df5d8942da6bba6f7b70859f29aeedb20197', 0, '2025-06-07 11:41:04'),
('cf81d70be2a905e245dc6bb10896f7868b81e6f4ad4f89cbeb7a70d4e31b0190c492b148ac891320', 'da8a0a3e4e867ff921b507aadcb11696a517a449d35a2f757767c9c7670def23fbabf02c17ff8a18', 0, '2025-06-06 16:32:06'),
('d0394daeb4248cf6aa33e955788dc703c048cc63b22b20fba296136194ac9ad7aec9de31ae31c322', 'f2df4861bbaaeb002be9a4051ddc0c8fd258fdf9e653c8c2d5f9f7b25c46438f4bbefb16324a50ae', 0, '2025-06-06 12:42:42');
INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('d06c5541bfb8fd233d154ca7f20aed1d15f62e02a97ca02ccab8cdf10d5a69b325cdd50a4d5d8af3', '3fed31b051ec94aaaad43a18ed070a83052ed4a14f3bc9dda83374a9b1cea0981b9ae964b72badbb', 0, '2025-05-03 13:18:45'),
('d0af38be49e320a11d9627ef2cb80b79862b72c8f747a1dce911be8d9edbcb1720a4345e42d8efd1', 'fcd1c8e048cf56998c9550aa5318d265a3cb636d9fc098a421e4606bc3420cf44daa55bdb7f7a247', 0, '2025-05-23 09:31:54'),
('d0f42d516079ac4f60fbacea13aeea14e236817a13590b1402dbc054b319485227225fc2e01a8041', 'd4417c5ba44e0ad2f1dd9cfdefef262b6380157bba2e3bba50019d399834e96791f96e9c2c6161f4', 0, '2025-06-10 10:50:34'),
('d11650db4566d9a7a0f2d4b9b070b53c23b4e099d83ad997bc6a0f6b092d7f8094e853feb8744197', '804d67b6b91c70abfcd54997a9008bc34ea1710b4151db48cc95a2dec7b3b7478292a62c0030e2e0', 0, '2025-05-18 06:29:33'),
('d15cf97ff593dcff03c8f4e1c11cfee0380eb24e49e18122127ab041c2d2be2f44d1c7f5d8a02412', '5202a290348afbbdf9342c82f73e75a36587160ed8c7a9e8b670e4117960afea1f4a6ba3b128987a', 0, '2025-04-08 13:10:04'),
('d16532cf9d4a229716aab1d802a831e2e9ca01a266ddbc492935bad54106fb77aa29e8fee803280a', '6d6c48999141256abb29f016a1028509eece6272e011a224632fd24c02c6f191f23fae0faa9642d7', 0, '2025-03-29 10:31:41'),
('d33affa67a53ffb769e487909bcc488a0a1845eb415d4067b722147341ff5efb14f8c66df4ea0144', 'bd7704a850080a394b9d615bb8d0325319621d224778926e5debf510ac65175bae211d7fe6cbee02', 0, '2025-05-15 06:21:06'),
('d41cd2f8f0610cb84b8ea69e4d432f6d2b823cb0dbe55bd0b36e11eb4714f53543e43b3b4da8c117', '57032335baa3cce920411bcfb368c74a92fd38d90532f1b0f5b0c1799cd4a29e4bf36fa06e818773', 0, '2025-05-28 13:48:36'),
('d595e25cb0d937bcdc480cd50c3ccdf54bbcf44ced1aecf92151ebc6f65f8b7071701928b0f3c0be', '4bef73aa3b64ed1b98538f28d7a11a9d95f31a530e49faa35c9ddad5e2e2c9febd183a8ff8730417', 0, '2025-04-16 07:06:57'),
('d85586b1c7dd279513b9a496a4bf7d810bb166aada48580f442c4062c3489661548280668503ce4f', 'fb5dc98e46e6b513294daff751c451170cb2ae0987fdaedfd9eb7287d3db686a2f29bf7141b58663', 0, '2025-04-22 08:03:53'),
('d863191c8404dad6e35bb9341eef8d7800128849b0ffa975d2e0ba45fbcbe11a290987154f55632f', 'd1a954d200cde243b1a61b889c7a2d01cb81043419e3701e3c1d240aeb41c4d9187576d9134906b4', 0, '2025-04-11 06:08:34'),
('d9848f460a950559ee698872095dc29a4b4960557c60df64bff3545894e9f3dc95c5c3e19f507b95', '48a146dc54ad7027a87b19d3ea34a9315774a229e1e93d1de8d26c1ef94c692b3699e150fbfefaee', 0, '2025-05-21 12:45:03'),
('dc34c3178492308a14bebfbb7ad1ffa543b26289ed4b4ce51bab3a598fdd293e916db2d666ad06cd', '46e7c1dcea5c6931e47ad86fc0ec2bf4b92cef6f317d62925840a49f5d0d5a224322600ee7cf419d', 0, '2025-03-29 10:51:39'),
('dcdf073d082a25dcef92b5346ceff2389b03e269826d3c911f22c2fea1700e5a9484b93f93313f6a', 'cea52739cc16528a75f08589a20f38b75a59a48e383f379d70cec13e2db0d71799f0901699a97338', 0, '2025-03-28 12:24:25'),
('dd66e21a757386a9d8b844ae4ca0111ad2e7f96d2ff56848ce5f53f729a69021c693d8b0976b4809', 'c8d5039261d37d7ab6afe316939249fd4c223d76bb7099440f6675970311af4f64ce9fcc59770424', 0, '2025-04-01 06:20:49'),
('de7c2e9d5ba908dd5a4735860be2e29da6fec1995a3c919ec8f7d7bd47fb6f69c2333ae67e85f7e1', '807618a8cfe72b21841e66590e9068212394b3ff83ec85f3c322116ffd1c3f6b59d488db869591ea', 0, '2025-05-29 10:08:14'),
('dee0a00dabef4df14ae2086d89b2ae8c81d0fec6257c125764cf67aeae8fc871c2dd829074d4c130', 'c14cade54567a0f3edadf36033fc6d2151d48392bc1e2b550a2c3dd1f3927372669335871bcb5e05', 0, '2025-06-10 16:03:53'),
('df9636e6441adff78c4dbc243bb5d18c4c8c54eff418e0dd945aa3c984beced362eb8720d96ca0e4', '6335396394a6deea420386399e1f2542726a2d6827f242111378a353955fcc6acbc81a90cee2653a', 0, '2025-06-07 19:04:59'),
('e00a37ab6b58beca433614e2ef2857bb98f3465683221e6a5568d60ef12cbd5349d75370e3026276', 'a03c2ef2c1c4b5a2e11bcc4f9638e152081d46ed913619c08accdfefd432e6a7567a31f82d8a5a6a', 0, '2025-04-18 11:51:19'),
('e15e79283e44179894354f290deabbdc759325b2271043199e90c41489d425ab108ffff44f292465', 'f7ed08e3f72cdcf3b01004d2abbabe948568bb37a5bf88f98a0df8a14cb55b34419c510568b2749d', 0, '2025-06-11 12:47:50'),
('e2c5ac96987c36262261dc05b3fa78392032ba20327399f1a7e60c73f78984c0467cebadc9f7705d', 'b74359e2a8d6f7f3032763149403c51dd6d3b2b0712d5281fbcd9eb62d02ff147d5d7d21418fe2b7', 0, '2025-05-27 05:57:56'),
('e4f2c9dae1332927fbca5a9e304cd9edeb5336982f0505dbdbfb9b87f8d3170305e0e77ecf4b9d76', '278ad5650c7222af2850c4f53e9be03720eb1312b69b6c3211bc72f6891368a69a750f09150c266d', 0, '2025-05-29 06:26:26'),
('e64081159e1a4c92e0b2d1dab1241bed508ee53ec2b7bea043c65caba0356a0e3744612db82a9610', 'be5e87148d1b234d6057dc78a738a026e72f36c8cda9c402e0d6d578a60c1fc97be98f536ce49305', 0, '2025-05-29 06:41:53'),
('e6849ce053a77269c6d6ccfb0954e0c5d92f4947fe3b263f73802a740b21f561953022602309c698', '1d1fa2dd715e2adc80f2f3c3d7252eb32f6bbe68d398ded71e0eb6a12f3ad99c2b42e75ad4d4e973', 0, '2025-04-19 14:40:18'),
('e815b856de03f5b88cf1e978f1795af1865705a7f6eac783cd8f4947af801721a0e09c40f841123c', '68521b28eaaa891eeefd9140a8bfd970a6cc3b365439cafe0c5745cf49145d30bae73ed57dadc876', 0, '2025-06-10 18:12:36'),
('e825c1d0d8c65bd64392c1b106128416a6e46085cb03f054bc70610ab95053459839150869eab44a', '6bb3c3e7af83a24f49a1effbed0e270191fe145769c38b5fae85719db72eb02b72106bf134e0d2aa', 0, '2025-04-29 13:06:22'),
('e854549ca68619baafcd2f22c30d24e3f34dc4902f4417e9158a14832ced17c9ceeb30da79915d71', 'f8c85470c4cbcbc64175ce19c272fa15b06dfd3e50cd713150a92fa34e695e900179a6aefd3218b7', 0, '2025-06-01 12:21:54'),
('e900cc62edc5eb8edc99e8ce38277688d8e2bbb65d965be98aad3943651ab4b46779a4f2f16ff29f', '1b9749922ad7e79f1e8c5fe225cb4d4e172c4fa55c8acc1d9a258171872b91b411d8d7409eb85bbb', 0, '2025-06-13 11:39:00'),
('ecd9d552578327792557aaee374c46d9e30dd361585ffe2fdb49bc2573075854e69679bdd1b556cb', 'aa645bb3f4c8db67a1900b302419ce32325dba92dab36fba24588bb086405ef66929812417766617', 0, '2025-03-29 09:40:53'),
('ed6f09cad2d1b05871f923a8be846b9d59000f2281257f4b7c5ba0ab31490e440204bcc70faf407b', '8f601839bf78f88efb8486ed283f945305827af681d87a4a65dbaca77f64db88bafda1fbc18f2783', 0, '2025-06-12 19:04:27'),
('edfb22708e30ad15a6d2dcfa980da8d6bdbf15d34a5ff6ec10654e874dcbf06bbe6c2f751f70d318', '72f42b40cd94b6157d6b9357e3e713c4b23f69f1c88107214c062447d79795a0c5fb7b9216f64361', 0, '2025-06-27 10:55:49'),
('ee2f8b27825a22b9e51eccbf2dccb91127ad9b5d57b538f30aafabae00f84a68a627cc440fb6fd48', '587556ced4cf4d900215c8fcf9db7afa032e1d47b3b46a69aee77bc476d19f789ee5b1d0d4da7afc', 0, '2025-04-19 12:12:59'),
('f0099e8343fdd810d0e034be10d9d7e1cb6f5ab21f6f9f28808f530ee3ff02291dd6607800273bb2', '69a7caddd13653f621dc0f8d67737682eb3d327f94b22317637df2a40c4cf54f04123acdd4b9561a', 0, '2025-05-08 05:57:48'),
('f09e151e5e06dc447bcc9606e2ed9a54799e2477e1992d9775a755ee3323687cc668d5784aec1aec', '971555f85037c3ab543ba3bea28db8fdcfe8d26325221713a014361c373bc1fb8dfc6cbda22e59cf', 0, '2025-04-22 09:50:47'),
('f0c20128e4bf4e62f79797db7c9f98e4ecb6b145ff095040573750daffc432b72f2edc83c7a5defb', '421cb9c6d1bca2ac6d949323ec3549af6b55dbdcffbf5f20612fd086977454a6f38294cc2aa82284', 0, '2025-06-26 16:43:05'),
('f37082b6f27e5abe05e854ff9c5711048c0d900ceee2e614fc31e97ba88bd48557667bf8af4b6930', '0c027aa89938c73cb994345f59ea6a99183769a73c74075ae0d9a27b8e873032bda61d636a4d0919', 0, '2025-04-01 06:47:30'),
('f5884c9b86683532965db8e5a57ae0c7166d7300d63b4b968bfb6d67a193229cdb08f90b8b83728d', '2aaba868a37cd2c950bd7b1aa6910192ff366296869da310da252c416b24d5678bd5910e89d99b27', 0, '2025-05-24 05:22:52'),
('f670b75ab5967c82b09e94a6f80245deac94e4e8495335676f9f26d452c13c6041e0d53df984a74b', '2c3056c1f6ae2a2e58586e127cde22e58ece47554585ac0b47d23202685623e758d930d98c78af27', 0, '2025-04-08 13:29:41'),
('f6f3961210556c79ba4abc5180e650a3787b1c44f57927e3920bb41058569095b0d1c9674df36389', 'f75a2a403d226d84fb4bd8ddf6f248bcc279c9dc8891320579d950a6a9da53906c0a2d3d31d94657', 0, '2025-06-06 19:19:35'),
('fb79a6fe51419360e0695bc86b127803f68ca105b4ac73d22eda796fca53b65e31b7b05bbfa2720e', 'bc567383778f83af5930a4897a4191fb150eb222f6f655387a52e6afa8992c0cf5d92b4281e0a204', 0, '2025-03-29 10:02:21'),
('fb8060bfc7e1c55c028b73024435a9e7c6e374736cd7882d8b19bf128b67ce5968f077f5d19c8b7b', '9483e2317e636c0235b0f1ce8be8628980f7e3207004e12a9e1208505e25445e3e3b1f0e4d1496c6', 0, '2025-06-11 13:46:04'),
('fbf6d19ce648c7f287167dd1c3bff12e54a591813a917a4bd93a86b2f2afa1aa1e1becaf64ee3607', '82c3834921ccf9643e611c325cbc2c24f1493fc51e3a1ee08f5505c97da896194f27b4c569f418da', 0, '2025-05-30 20:43:27'),
('fc0904d56d0369378541ac7fe486ac02ba964028fbcd934c874b65b6776cb2bbea80d3137914c2c8', '12edce65affb78a75d77364e11d650e85510a7272f1a990e762b281d6abca37ffefeeffb6742f6f0', 0, '2025-04-19 14:12:48'),
('fcc70287d8a9d75935e847e68e33d55e03af1822a95fd7d1ea61f737783158cf69961de9a2d9950f', '33d101b9bab9fba415276ca089438c1a93d367dde156aba1c5e811154891a3a6625a6c08a86e38cf', 0, '2025-03-29 09:51:16'),
('fdf8b1e413f2a2199f5ac4332f83242e11a3630b8ff718b76110a828018205431e8ef4a7600f433e', '9e1bc44b0c01999f0b27112099d139ff3e91a85b2685d1f9843602587ae04c260e45a34bb328c2a7', 0, '2025-04-20 08:17:51');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('admin@admin.com', '$2y$10$C6uf7DzfjBKazmnRPT6jrueTMIPIvf7RS0pjRnq8YUFjnJTc1LSzq', '2024-03-16 02:00:02');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'auth_profile_edit', NULL, NULL, NULL),
(2, 'user_management_access', NULL, NULL, NULL),
(3, 'permission_create', NULL, NULL, NULL),
(4, 'permission_edit', NULL, NULL, NULL),
(5, 'permission_show', NULL, NULL, NULL),
(6, 'permission_delete', NULL, NULL, NULL),
(7, 'permission_access', NULL, NULL, NULL),
(8, 'role_create', NULL, NULL, NULL),
(9, 'role_edit', NULL, NULL, NULL),
(10, 'role_show', NULL, NULL, NULL),
(11, 'role_delete', NULL, NULL, NULL),
(12, 'role_access', NULL, NULL, NULL),
(13, 'user_create', NULL, NULL, NULL),
(14, 'user_edit', NULL, NULL, NULL),
(15, 'user_show', NULL, NULL, NULL),
(16, 'user_delete', NULL, NULL, NULL),
(17, 'user_access', NULL, NULL, NULL),
(18, 'group_create', NULL, NULL, NULL),
(19, 'group_edit', NULL, NULL, NULL),
(20, 'group_show', NULL, NULL, NULL),
(21, 'group_delete', NULL, NULL, NULL),
(22, 'group_access', NULL, NULL, NULL),
(23, 'category_create', NULL, NULL, NULL),
(24, 'category_edit', NULL, NULL, NULL),
(25, 'category_show', NULL, NULL, NULL),
(26, 'category_delete', NULL, NULL, NULL),
(27, 'category_access', NULL, NULL, NULL),
(28, 'affirmation_create', NULL, NULL, NULL),
(29, 'affirmation_edit', NULL, NULL, NULL),
(30, 'affirmation_show', NULL, NULL, NULL),
(31, 'affirmation_delete', NULL, NULL, NULL),
(32, 'affirmation_access', NULL, NULL, NULL),
(33, 'bg_category_create', NULL, NULL, NULL),
(34, 'bg_category_edit', NULL, NULL, NULL),
(35, 'bg_category_show', NULL, NULL, NULL),
(36, 'bg_category_delete', NULL, NULL, NULL),
(37, 'bg_category_access', NULL, NULL, NULL),
(38, 'bgsound_create', NULL, NULL, NULL),
(39, 'bgsound_edit', NULL, NULL, NULL),
(40, 'bgsound_show', NULL, NULL, NULL),
(41, 'bgsound_delete', NULL, NULL, NULL),
(42, 'bgsound_access', NULL, NULL, NULL),
(43, 'favorite_access', '2024-03-21 07:30:46', '2024-03-21 07:30:46', NULL),
(44, 'favorite_create', '2024-03-21 07:30:56', '2024-03-21 07:30:56', NULL),
(45, 'favorite_edit', '2024-03-21 07:31:06', '2024-03-21 07:31:06', NULL),
(46, 'favorite_show', '2024-03-21 07:31:14', '2024-03-21 07:31:14', NULL),
(47, 'favorite_delete', '2024-03-21 09:03:14', '2024-03-21 09:03:14', NULL),
(48, 'playlist_access', '2024-03-21 09:37:57', '2024-03-21 09:37:57', NULL),
(49, 'playlist_create', '2024-03-21 09:38:07', '2024-03-21 09:38:07', NULL),
(50, 'playlist_edit', '2024-03-21 09:38:15', '2024-03-21 09:38:15', NULL),
(51, 'playlist_show', '2024-03-21 09:38:23', '2024-03-21 09:38:23', NULL),
(52, 'playlist_delete', '2024-03-21 09:38:40', '2024-03-21 09:38:40', NULL),
(53, 'playlist_item_access', '2024-03-27 05:24:50', '2024-03-27 05:24:50', NULL),
(54, 'playlist_item_create', '2024-03-27 05:25:04', '2024-03-27 05:25:04', NULL),
(55, 'playlist_item_edit', '2024-03-27 05:25:30', '2024-03-27 05:25:30', NULL),
(56, 'playlist_item_show', '2024-03-27 05:25:50', '2024-03-27 05:25:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 41),
(1, 42),
(2, 18),
(2, 19),
(2, 21),
(2, 22),
(2, 23),
(2, 24),
(2, 26),
(2, 27),
(2, 28),
(2, 29),
(2, 31),
(2, 32),
(2, 33),
(2, 34),
(2, 36),
(2, 37),
(2, 38),
(2, 39),
(2, 41),
(2, 42),
(1, 5),
(1, 10),
(1, 15),
(1, 20),
(1, 25),
(1, 30),
(1, 35),
(1, 40),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(1, 54),
(1, 55),
(1, 56);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `playlists`
--

CREATE TABLE `playlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `last_session` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `playlists`
--

INSERT INTO `playlists` (`id`, `title`, `description`, `last_session`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'first playlist', 'This is my favoriot affermations', NULL, '2024-05-17 04:37:53', '2024-05-21 07:30:55', '2024-05-21 07:30:55'),
(2, 'Billionaire Mindset Two', 'Billionaire Mindset', NULL, '2024-05-20 04:09:04', '2024-05-20 05:56:40', NULL),
(3, 'raju', 'check it two', NULL, '2024-05-20 04:36:08', '2024-05-21 07:40:38', '2024-05-21 07:40:38'),
(4, 'New PLayList', 'New Playlit', NULL, '2024-05-20 07:41:34', '2024-05-22 23:49:17', '2024-05-22 23:49:17'),
(5, 'playlist2', 'this is my second playlist', NULL, '2024-05-21 06:22:44', '2024-05-21 08:34:41', '2024-05-21 08:34:41'),
(6, 'testing', 'testingnngg', NULL, '2024-05-21 08:23:51', '2024-05-22 23:52:20', '2024-05-22 23:52:20'),
(7, 'Virendra new', 'this is my playlist', NULL, '2024-05-22 23:53:14', '2024-05-30 07:16:33', '2024-05-30 07:16:33'),
(8, 'Tester1', 'My Favourite playlist', NULL, '2024-05-24 00:00:04', '2024-05-24 00:03:15', '2024-05-24 00:03:15'),
(9, 'Test 2', 'testigng 2', NULL, '2024-05-24 07:32:37', '2024-05-28 02:11:06', '2024-05-28 02:11:06'),
(10, 'Tester 554', 'Hnhdkgdgg', NULL, '2024-05-28 04:12:12', '2024-05-28 04:18:26', '2024-05-28 04:18:26'),
(11, 'Tester1', 'Ebxg h f', NULL, '2024-05-28 04:15:13', '2024-05-28 04:18:31', '2024-05-28 04:18:31'),
(12, 'Tester12', 'Dgfyekr', NULL, '2024-05-28 04:17:48', '2024-05-28 04:18:09', '2024-05-28 04:18:09'),
(13, 'Tester1256', 'Shzjdnhx', NULL, '2024-05-28 05:59:42', '2024-05-28 06:02:26', '2024-05-28 06:02:26'),
(14, 'Tester1256', 'Shzjdnhx', NULL, '2024-05-28 05:59:53', '2024-05-28 06:02:20', '2024-05-28 06:02:20'),
(15, 'Tester1256', 'Shzjdnhx', NULL, '2024-05-28 06:00:28', '2024-05-28 06:46:06', '2024-05-28 06:46:06'),
(16, 'Tester1256', 'Shzjdnhx', NULL, '2024-05-28 06:00:41', '2024-05-28 06:02:13', '2024-05-28 06:02:13'),
(17, 'Tester98', 'Fghhghkhh', NULL, '2024-05-28 06:02:00', '2024-05-30 07:16:46', '2024-05-30 07:16:46'),
(18, 'TEST PLAYLIST', 'TESTING PLAYLIST', NULL, '2024-06-06 05:58:21', '2024-06-06 05:58:21', NULL),
(19, 'TEST PLAYLIST', 'TESTING PLAYLIST', NULL, '2024-06-06 05:58:22', '2024-06-06 05:58:22', NULL),
(20, 'Name1', 'Gmail ad', NULL, '2024-06-06 06:59:35', '2024-06-10 07:42:12', '2024-06-10 07:42:12'),
(21, 'Test 1', 'Yajajhsgs', NULL, '2024-06-06 07:20:44', '2024-06-07 05:51:18', '2024-06-07 05:51:18'),
(22, 'Testing', 'Testing playlist', NULL, '2024-06-06 12:19:25', '2024-06-10 07:57:34', '2024-06-10 07:57:34'),
(23, 'Testing', 'Testing playlist', NULL, '2024-06-10 10:26:15', '2024-06-13 07:33:57', '2024-06-13 07:33:57'),
(24, 'Testing', 'Testing playlist', NULL, '2024-06-10 10:26:15', '2024-06-13 07:34:20', '2024-06-13 07:34:20'),
(25, 'testing2', 'testing playlist', NULL, '2024-06-11 12:23:02', '2024-06-11 12:23:50', '2024-06-11 12:23:50'),
(26, 'Tester Test', 'Shsjsjsj', NULL, '2024-06-11 12:38:34', '2024-06-13 07:34:30', '2024-06-13 07:34:30'),
(27, 'check it', 'check it two', NULL, '2024-06-13 06:23:09', '2024-06-13 06:23:09', NULL),
(28, 'check it', 'check it two', NULL, '2024-06-13 06:24:09', '2024-06-13 07:34:34', '2024-06-13 07:34:34'),
(29, 'check it', 'check it two', NULL, '2024-06-13 06:24:47', '2024-06-13 07:45:05', '2024-06-13 07:45:05'),
(30, 'check it', 'check it two', NULL, '2024-06-13 06:25:03', '2024-06-13 07:33:44', '2024-06-13 07:33:44'),
(31, 'check it', 'check it two', NULL, '2024-06-13 06:25:37', '2024-06-13 07:33:36', '2024-06-13 07:33:36'),
(32, 'check it', 'check it two', NULL, '2024-06-13 06:25:59', '2024-06-13 06:25:59', NULL),
(33, 'check it', 'check it two', NULL, '2024-06-13 06:26:21', '2024-06-13 06:26:21', NULL),
(34, 'check it', 'check it two', NULL, '2024-06-13 06:26:51', '2024-06-13 06:26:51', NULL),
(35, 'check it', 'check it two', NULL, '2024-06-13 06:27:43', '2024-06-13 07:33:27', '2024-06-13 07:33:27'),
(36, 'check it', 'check it two', NULL, '2024-06-13 06:28:16', '2024-06-13 07:33:18', '2024-06-13 07:33:18'),
(37, 'check it', 'check it two', NULL, '2024-06-13 06:28:33', '2024-06-13 07:33:07', '2024-06-13 07:33:07'),
(38, 'check it', 'check it two', NULL, '2024-06-13 06:31:25', '2024-06-13 06:31:25', NULL),
(39, 'check it', 'check it two', NULL, '2024-06-13 06:32:11', '2024-06-13 07:32:46', '2024-06-13 07:32:46'),
(40, 'check it', 'check it two', NULL, '2024-06-13 06:32:46', '2024-06-13 07:31:40', '2024-06-13 07:31:40'),
(41, 'check it', 'check it two', NULL, '2024-06-13 06:33:32', '2024-06-13 07:32:29', '2024-06-13 07:32:29'),
(42, 'check it', 'check it two', NULL, '2024-06-13 06:33:56', '2024-06-13 07:45:13', '2024-06-13 07:45:13'),
(43, 'check it', 'check it two', NULL, '2024-06-13 06:34:19', '2024-06-13 07:45:17', '2024-06-13 07:45:17'),
(44, 'check it', 'check it two', NULL, '2024-06-13 06:35:19', '2024-06-13 07:45:24', '2024-06-13 07:45:24'),
(45, 'check it', 'check it two', NULL, '2024-06-13 06:36:01', '2024-06-13 07:34:50', '2024-06-13 07:34:50'),
(46, 'check it', 'check it two', NULL, '2024-06-13 06:36:21', '2024-06-13 06:36:21', NULL),
(47, 'check it', 'check it two', NULL, '2024-06-13 06:39:22', '2024-06-13 06:39:22', NULL),
(48, 'check it', 'check it two', NULL, '2024-06-13 06:39:40', '2024-06-13 06:39:40', NULL),
(49, 'check it', 'check it two', NULL, '2024-06-13 06:39:48', '2024-06-13 06:39:48', NULL),
(50, 'check it', 'check it two', NULL, '2024-06-13 06:40:03', '2024-06-13 06:40:03', NULL),
(51, 'check it', 'check it two', NULL, '2024-06-13 06:40:12', '2024-06-13 06:40:12', NULL),
(52, 'check it', 'check it two', NULL, '2024-06-13 06:41:57', '2024-06-13 06:41:57', NULL),
(53, 'check it', 'check it two', NULL, '2024-06-13 06:42:18', '2024-06-13 06:42:18', NULL),
(54, 'check it', 'check it two', NULL, '2024-06-13 06:45:44', '2024-06-13 06:45:44', NULL),
(55, 'check it', 'check it two', NULL, '2024-06-13 06:49:12', '2024-06-13 06:49:12', NULL),
(56, 'check it', 'check it two', NULL, '2024-06-13 06:49:38', '2024-06-13 06:49:38', NULL),
(57, 'check it', 'check it two', NULL, '2024-06-13 06:50:03', '2024-06-13 06:50:03', NULL),
(58, 'check it', 'check it two', NULL, '2024-06-13 06:50:23', '2024-06-13 06:50:23', NULL),
(59, 'check it', 'check it two', NULL, '2024-06-13 06:58:08', '2024-06-13 06:58:08', NULL),
(60, 'check it', 'check it two', NULL, '2024-06-13 07:29:41', '2024-06-13 07:29:41', NULL),
(61, 'check it', 'check it two', NULL, '2024-06-13 07:45:41', '2024-06-13 07:45:41', NULL),
(62, 'check it', 'check it two', NULL, '2024-06-13 07:47:34', '2024-06-13 07:47:34', NULL),
(63, 'check it', 'check it two', NULL, '2024-06-13 07:47:52', '2024-06-13 10:00:23', '2024-06-13 10:00:23'),
(64, 'new playlist', 'this is new', NULL, '2024-06-13 08:17:57', '2024-06-13 08:17:57', NULL),
(65, 'test2', 'testing', NULL, '2024-06-13 10:01:45', '2024-06-26 07:49:36', '2024-06-26 07:49:36'),
(66, 'check it', 'check it two', NULL, '2024-06-13 12:38:09', '2024-06-13 12:38:09', NULL),
(67, 'Test 345', 'Ahsnsjgjguh', NULL, '2024-06-25 13:51:02', '2024-06-25 13:51:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `playlist_items`
--

CREATE TABLE `playlist_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `playlist_id` bigint(20) UNSIGNED DEFAULT NULL,
  `affirmation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `playlist_items`
--

INSERT INTO `playlist_items` (`id`, `category_id`, `playlist_id`, `affirmation_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 2, 2, 4, '2024-05-20 04:09:33', '2024-05-20 05:56:40', '2024-05-20 05:56:40'),
(6, 0, 18, 3, '2024-06-06 05:58:32', '2024-06-06 05:58:32', NULL),
(7, 0, 18, 4, '2024-06-06 05:58:32', '2024-06-06 05:58:32', NULL),
(8, 0, 18, 5, '2024-06-06 05:58:32', '2024-06-06 05:58:32', NULL),
(9, 0, 19, 3, '2024-06-06 05:58:36', '2024-06-06 05:58:36', NULL),
(10, 0, 19, 4, '2024-06-06 05:58:37', '2024-06-06 05:58:37', NULL),
(11, 0, 19, 5, '2024-06-06 05:58:37', '2024-06-06 05:58:37', NULL),
(49, 0, 1, 1, '2024-06-13 06:10:55', '2024-06-13 06:10:55', NULL),
(50, 0, 1, 1, '2024-06-13 06:15:54', '2024-06-13 06:15:54', NULL),
(59, 0, 64, 3, '2024-06-13 13:30:46', '2024-06-13 13:30:46', NULL),
(60, 0, 64, 4, '2024-06-13 13:30:46', '2024-06-13 13:30:46', NULL),
(61, 0, 64, 1, '2024-06-13 13:30:46', '2024-06-13 13:30:46', NULL),
(62, 0, 67, 2, '2024-06-25 13:51:06', '2024-06-25 13:51:06', NULL),
(63, 0, 67, 1, '2024-06-25 13:51:06', '2024-06-25 13:51:06', NULL),
(64, 0, 67, 5, '2024-06-25 13:51:06', '2024-06-25 13:51:06', NULL),
(65, 0, 67, 6, '2024-06-25 13:51:06', '2024-06-25 13:51:06', NULL),
(66, 0, 64, 1, '2024-06-26 07:51:15', '2024-06-26 07:51:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `playlist_user`
--

CREATE TABLE `playlist_user` (
  `playlist_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `playlist_user`
--

INSERT INTO `playlist_user` (`playlist_id`, `user_id`) VALUES
(2, 2),
(15, 1),
(16, 1),
(17, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 2),
(33, 2),
(34, 2),
(35, 1),
(36, 1),
(37, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(1, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(18, 11),
(19, 11),
(27, 2),
(38, 2),
(59, 2),
(60, 2),
(61, 2),
(62, 2),
(63, 1),
(64, 1),
(65, 1),
(67, 1);

-- --------------------------------------------------------

--
-- Table structure for table `popular_playlist`
--

CREATE TABLE `popular_playlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `playlist_id` int(11) NOT NULL,
  `affirmation_id` int(11) NOT NULL,
  `countdown` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deleted _at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `popular_playlist`
--

INSERT INTO `popular_playlist` (`id`, `user_id`, `playlist_id`, `affirmation_id`, `countdown`, `created_at`, `updated_at`, `deleted _at`) VALUES
(1, 1, 1, 0, 4, '2024-05-24 04:50:20', '2024-05-24 04:53:33', '0000-00-00 00:00:00'),
(2, 1, 0, 1, 1, '2024-05-24 04:53:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 1, 2, 0, 205, '2024-05-24 04:54:14', '2024-06-26 12:01:45', '0000-00-00 00:00:00'),
(4, 1, 0, 2, 2, '2024-05-24 04:54:14', '2024-05-24 04:54:25', '0000-00-00 00:00:00'),
(5, 2, 3, 0, 1, '2024-05-24 05:13:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 2, 0, 2, 1, '2024-05-24 05:13:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 1, 4, 0, 5, '2024-05-28 03:47:57', '2024-06-07 11:54:44', '0000-00-00 00:00:00'),
(8, 11, 17, 0, 1, '2024-05-30 12:22:15', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 1, 3, 0, 15, '2024-05-30 12:55:47', '2024-06-26 12:04:50', '0000-00-00 00:00:00'),
(10, 1, 8, 0, 1, '2024-05-30 14:10:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 1, 7, 0, 2, '2024-05-30 14:11:08', '2024-06-06 09:46:36', '0000-00-00 00:00:00'),
(12, 11, 2, 0, 16, '2024-06-05 09:42:19', '2024-06-06 05:52:38', '0000-00-00 00:00:00'),
(13, 1, 17, 0, 5, '2024-06-06 13:09:22', '2024-06-13 13:26:16', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', NULL, NULL, NULL),
(2, 'User', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `affirmation_id` int(11) DEFAULT NULL,
  `playlist_id` int(11) DEFAULT NULL,
  `start_at` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `end_at` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `r_status` int(11) NOT NULL DEFAULT '1' COMMENT '1=>''On'',0=>''off''',
  `mon` int(255) NOT NULL DEFAULT '0',
  `tues` int(255) NOT NULL DEFAULT '0',
  `wed` int(255) NOT NULL DEFAULT '0',
  `thurs` int(255) NOT NULL DEFAULT '0',
  `fri` int(255) NOT NULL DEFAULT '0',
  `sat` int(255) NOT NULL DEFAULT '0',
  `sun` int(255) NOT NULL DEFAULT '0',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000' ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`id`, `user_id`, `affirmation_id`, `playlist_id`, `start_at`, `end_at`, `r_status`, `mon`, `tues`, `wed`, `thurs`, `fri`, `sat`, `sun`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 11, 0, 0, '18:30', NULL, 1, 1, 0, 0, 1, 0, 0, 1, '2024-05-30 07:35:42.000000', '2024-05-30 07:35:42.155350', '0000-00-00 00:00:00.000000'),
(4, 2, 0, 0, '20:35:00', NULL, 1, 1, 0, 1, 0, 0, 0, 0, '2024-05-29 14:03:05.000000', '2024-05-29 15:04:54.315630', '0000-00-00 00:00:00.000000'),
(5, 11, 0, 0, '11:00', NULL, 0, 1, 1, 0, 1, 0, 1, 1, '2024-05-30 11:23:24.000000', '2024-05-30 11:23:24.088183', '0000-00-00 00:00:00.000000'),
(14, 11, 0, 0, '15:00', NULL, 1, 0, 1, 0, 1, 0, 0, 0, '2024-05-30 11:37:36.000000', '2024-05-30 11:37:36.520564', '0000-00-00 00:00:00.000000'),
(15, 1, 0, 0, '11:30', NULL, 0, 0, 0, 0, 0, 1, 0, 0, '2024-06-12 11:06:15.000000', '2024-06-12 11:06:15.846225', '0000-00-00 00:00:00.000000'),
(16, 1, 0, 0, '09:30', NULL, 0, 0, 0, 1, 1, 0, 0, 0, '2024-06-10 09:43:06.000000', '2024-06-10 09:43:06.443856', '0000-00-00 00:00:00.000000'),
(17, 1, 0, 0, '9:00', NULL, 1, 0, 0, 1, 1, 1, 0, 0, '2024-06-20 06:55:52.000000', '2024-06-20 06:55:52.716554', '0000-00-00 00:00:00.000000'),
(19, 1, 0, 0, '9:00', NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2024-06-13 14:22:20.000000', '2024-06-13 14:22:20.591756', '0000-00-00 00:00:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(255) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `mobile_no`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `country_id`, `locale`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', 'admin', '0987654321', 'Admin', 'admin@admin.com', NULL, '$2y$10$1EqU/lGov5AN9MNihKT.9OfoBuKT.acrWOwfTWhVzYgs5J3TSUcE6', 'o9NQzJCygkHPT9Pil10VrchdLXGLCV0twxYK3BNODLwEzGSC2eLZo8HbXipc', 99, 'indore', '1', NULL, '2024-03-19 08:42:06', NULL),
(2, 'Bhupendra', 'Rajput', '7049419271', 'bhupendra', 'bhupendrarajput70.forbear@gmail.com', NULL, '$2y$10$uFT1tqlHHUJZALR9nAmjZ.u6Io.WQuIHxDN5oZThdtGvGMVkBitW.', 'o6y1ue7oFrkg4R7SB0FHIet4Gt426aWHtIbe6mXletoio2MzLQhj8DtVkqDC', 99, 'indore', '1', '2024-02-27 07:19:29', '2024-05-23 09:29:15', NULL),
(3, NULL, NULL, NULL, 'rohontest', 'rohontest21323@gmail.com', NULL, '$2y$10$flzX8pksJ5ouhE3/Lfl6jOXqG7oYF/DCIRv8plF/R7BsQHp2ww8wO', NULL, 99, NULL, NULL, '2024-05-23 06:36:59', '2024-05-23 06:36:59', NULL),
(4, NULL, NULL, NULL, 'rohontest', 'rohontest223@gmail.com', NULL, '$2y$10$N7ZLdRLPxbszdjdFDuRKZuIPFPd2mriKVORH3V3pcdQUQmMu8Ie5m', NULL, 99, NULL, NULL, '2024-05-23 06:37:41', '2024-05-23 06:37:41', NULL),
(5, NULL, NULL, NULL, 'rohontest', 'rohontes3@gmail.com', NULL, '$2y$10$pXyzpj.vWIUrh3lARYTRN.fb.5E8BoOYawZ2YYzhvf3E4//93epqm', NULL, 99, NULL, NULL, '2024-05-23 06:39:39', '2024-05-23 06:39:39', NULL),
(6, NULL, NULL, NULL, 'testRohit', 'testRohit@gmail.com', NULL, '$2y$10$O3UMLAhaAmeQZpYFWGTEhOGmMkyTkIddewesI9H13OfjzrBf.Yoge', NULL, 99, NULL, NULL, '2024-05-28 06:40:43', '2024-05-28 06:40:43', NULL),
(7, NULL, NULL, NULL, 'testRohit23', 'testRohit23@gmail.com', NULL, '$2y$10$b1fG2WSrf6Oq7Slvq81uFOC4zobyMLbreEYpAjEUXv3hl3oz9RDrm', NULL, 99, NULL, NULL, '2024-05-28 06:42:38', '2024-05-28 06:42:38', NULL),
(8, NULL, NULL, NULL, 'testRohit2312', 'testRohit2313@gmail.com', NULL, '$2y$10$GcCCO/G./4s/jlyUqECl.e.RSAYSoQ3AypFSPOsSaImhZVnB1Kq0y', NULL, 99, NULL, NULL, '2024-05-28 06:46:40', '2024-05-28 06:46:40', NULL),
(9, NULL, NULL, NULL, 'testRohit2312', 'testrohit231355@gmail.com', NULL, '$2y$10$h8CJsJRwv3Vi8Ik4yeRgX.5PXT0flZiLv9zGoVH9WegTYQit/qaLm', NULL, 99, NULL, NULL, '2024-05-29 00:18:40', '2024-05-29 00:18:40', NULL),
(10, NULL, NULL, NULL, 'testRohit2312', 'testrohit52313@gmail.com', NULL, '$2y$10$eFr4WpFQPy2sPaggK5.3B.A37J/VrtBo7pEusnbTBrt19kyA0Ro9G', NULL, 99, NULL, NULL, '2024-05-29 02:03:17', '2024-05-29 02:03:17', NULL),
(11, NULL, NULL, NULL, 'raju', 'raju@gmail.com', NULL, '$2y$10$6TsFwX1TcQhbzMliDX7XmeNIAdbQM2DDkFQMPDUII36TEELT9twuy', NULL, 99, NULL, NULL, '2024-05-29 02:26:35', '2024-05-29 02:26:35', NULL),
(12, NULL, NULL, NULL, 'ram', 'ram@gamil.com', NULL, '$2y$10$Mf9bTwWnv3DYSr9Jy4LQeOJz1Gi6KJPq5GoZlvxlZXHuHu0HSQj2i', NULL, 99, NULL, NULL, '2024-05-29 02:32:37', '2024-05-29 02:32:37', NULL),
(13, NULL, NULL, NULL, 'test', 'test@gmail.com', NULL, '$2y$10$qaDiuahEJSot3Nj2rsjNwe8uu5ZT87TAYE0mA5HTqr7lrnim5zaxe', NULL, 99, NULL, NULL, '2024-05-29 04:35:34', '2024-05-29 04:35:34', NULL),
(14, NULL, NULL, NULL, 'test', 'admin344@admin.com', NULL, '$2y$10$LEZqD8uf2Bgdehh0NJ/wFOYCij2gb9V0njH/9gxnqdhucNC4SJxXK', NULL, 99, NULL, NULL, '2024-05-29 04:36:51', '2024-05-29 04:36:51', NULL),
(15, NULL, NULL, NULL, 'raju', 'raju01@gmail.com', NULL, '$2y$10$jjV6AMl2M5QuG2MnJE/2ZeqTzYVkeKS76VOkGfUFWl1sYGq4Uin7W', NULL, 99, NULL, NULL, '2024-05-29 04:38:58', '2024-05-29 04:38:58', NULL),
(16, NULL, NULL, NULL, 'mail', 'main@mail.com', NULL, '$2y$10$OtYktlQsyYyVQuOze1Esqutmee5XFPGa6M0NtlqeFIqvCAzcrWWSe', NULL, 1, NULL, NULL, '2024-05-29 04:43:02', '2024-05-29 04:43:02', NULL),
(17, NULL, NULL, NULL, 'test 2', 'tested@gmail.com', NULL, '$2y$10$GGbN7ANOYmK4JMCDzs4MseZ.6/OInvpars9165pEP.gyJtsRKfLMC', NULL, 99, NULL, NULL, '2024-06-25 11:06:13', '2024-06-25 11:06:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userslogindevice`
--

CREATE TABLE `userslogindevice` (
  `id` int(11) NOT NULL,
  `user_id` int(255) NOT NULL,
  `fcm_token` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000' ON UPDATE CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `userslogindevice`
--

INSERT INTO `userslogindevice` (`id`, `user_id`, `fcm_token`, `created_at`, `updated_at`) VALUES
(1, 2, 'eaNTcT6oTAqFaZFYH0Gnez:APA91bGCaILXCtWA4RKocVDU6Oq7GwgrWpz7ENckRc5UqTYM3ThoRAKiMEmPb7pxGCayRU8mhYA4jELDmbA2toK_iDgw-0McmXUuez7y1UtRU95tvmwuBHKwK1rxKfSzv7-r5DfcYfCL', '2024-05-28 09:08:07.000000', '2024-05-29 14:24:31.690018'),
(2, 1, 'eaNTcT6oTAqFaZFYH0Gnez:APA91bGCaILXCtWA4RKocVDU6Oq7GwgrWpz7ENckRc5UqTYM3ThoRAKiMEmPb7pxGCayRU8mhYA4jELDmbA2toK_iDgw-0McmXUuez7y1UtRU95tvmwuBHKwK1rxKfSzv7-r5DfcUIR', '2024-05-28 09:08:41.000000', '2024-06-13 06:09:43.000000'),
(3, 1, 'eiDVoD9OR3OlS6CwHQbZuo:APA91bFiLjMFnOLjbppFEVmQwYPz4ud5D-gmMj_pdc26aQGZJaLPjqFB8Q1d9l8yemsPspUuUs4muxEUbHZem5_ItIquQs1X4XInUPxAzxElm0E6XASf70wdP4ZpNpEWaVHjglgdLTK2', '2024-05-29 00:29:45.000000', '2024-05-29 00:58:56.000000'),
(4, 1, 'undefined', '2024-05-29 00:48:46.000000', '2024-06-27 05:25:50.000000'),
(5, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiNDY0OTM5ZDE3OWI3MzE2MWNlNTdkN2UwNWE1NzIxOWQzZjhhYmQzOTdmOTc3NjI3MjE1MDk2ZTBmNDJkMTIwMDQ0YmUzNTI1ZDYwMDQ5NWYiLCJpYXQiOjE3MTY5Njc3MzkuMDAyNjc0MTAyNzgzMjAzMTI1LCJuYmYiOjE3MTY5Njc3MzkuMDAyNjc3OTE3NDgwNDY4NzUsImV4cCI6MTc0ODUwMzczOC45NTY4ODM5MDczMTgxMTUyMzQzNzUsInN1YiI6IjEiLCJzY29wZXMiOlsiKiJdfQ.C0LTNZXu55PAEepHrTZ_5l7wfrJAKBX7awuohU2t5YC61hdKiKY9Xc3aSReBEoo_AYT9v5iXgV_qyKUwUJqZEVnDWLYAI1vmQ2ZrXNfkosGVz9SDIWqMuPSNscV8FMC39gMReHuwTmyuxihr2_65qrf-qjzFfgqKjEMB6zY--rTGKloSPF5iOH84CxJ_IS0jHu2OPUHB6zqqqR6TojntmaZfW-f97rf9ubV8o0MAnJuEMGzTR7jtUXHeDdKnspsKEAX_91g-SgBagh70YsGge1GZlB2REdKF0XXtViIzJytpF7udmgZL-lhgYOVv_WEGVMkQLeLeBfU3jBtEDoj8cuESbw_k5DvHAYTJZm6VGNkzyRNhSIc-BCK_or_VaZGKWGuiFGhF82neP4W580iaEOsvRK9KoOt7kQj4CKhOiDlWZk0vUlFlU84jUoENPRaiDCgsp_kN2rq_nfC0DtJa0wEkFtXSSLctlEJNqtgSEMFvgIpTdgKVZ3GYAzdIUJuLzJZghfQZBnlClAxSK960fyALOX8hghhfb9rSeBK-7o4YvPaS3CkFROClr1UmHR4RQALWPUOfnhpUAXGOwAeV8q0USsjVg6UFM1Y6oxftpmI9Vlg26LQADCNXuJ9IL8mLD2D9QeJMBJ9i8FKlfRj3xMyU3Z2nR_ib9vyrY_UGKCU-gmMj_pdc26aQGZJaLPjqFB8Q1d9l8yemsPspUuUs4muxEUbHZem5_ItIquQs1X4XInUPxAzxElm0E6XASf70wdP4ZpNpEWaVHjglgdLTK2', '2024-05-29 02:00:05.000000', '2024-06-13 06:10:43.000000'),
(6, 11, 'undefined', '2024-05-29 02:42:45.000000', '2024-05-29 04:53:43.000000'),
(7, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiYzY4Zjk0NTVjNzQ0YzgxN2UzMjQwNGVjYWUxMWMyNzQ3ODdhNzc1OWQ1ZDQ2ZDc3NWM2OTk4MDlhNmYzMzAwZmRmYzhhYzM3MmVkYWU2ZmEiLCJpYXQiOjE3MTgxNzk2MDkuODk1NDYyMDM2MTMyODEyNSwibmJmIjoxNzE4MTc5NjA5Ljg5NTQ2NjA4OTI0ODY1NzIyNjU2MjUsImV4cCI6MTc0OTcxNTYwOS41OTk2NDc5OTg4MDk4MTQ0NTMxMjUsInN1YiI6IjEiLCJzY29wZXMiOlsiKiJdfQ.Mr1cHWKCIMBKo221BtvJUGLCwYQ1ias9bJYWttgTPZDy1JB_buOdVpYA5J4eS51naoLEyWBv2NMZjCfzyXnRZ-8SuD9DQJpGoXYv3H4sLFn5g6QpcnrZalZbd7V9VcDtwvb3dw18NSi0IZWLFIJE95YVhRJ6NpRmyyk7E1oqHg0r5y-kM47Syp5AfnVrAWNHzEUm_QJd048GeEuOOlxkG7eUzp2_QktVD41boH3BmeDxU2-Q6nCM7SloTK_SiD_crTGbCvrRHudO8LlT8SvAhHzxi_CKOI6ZlGdoUAFs1EloSUK_LBb21qZgXPsnsxy4WIeGvMGP6WDNQe38N6fT-mucxYR_3WSnqmXCc6_MObnKtlPKmZO1fbMDGMu3Lf7N38DZHagksWPYNQLWeqpNFwCzW1YFMJeAq47hE_5Kdzx0WRpyyYVOmhtKbnecwbbKJ5NBFt-PR_HP2_xpf3xzsjEA8wh2-y2ngme4YBXBI1pZuqK0LXDDr43hhfGM4QkdUJVRouF0lafUM8Ld1ZrQ8YhvQMSgFGyRhi3oVT6aaUut4H1Pjo-j4p1qhQXXxcK8bKGEmRH2MyiTsHZ_MJM7K6WtspP79Wj7PVI_BmuI18wSe2oXxrHZuRcFDMZSjTQJtjoTeEl6KqX-Fvyb4royxwZKKHlAsOp3WUEG77mlVjQ', '2024-06-12 08:07:21.000000', '0000-00-00 00:00:00.000000'),
(8, 1, 'rjrprghdfgopdfjv;odfjv;ldfkfgglfggkgfkgplggfdlkgdfgdfgdfmbdfkmbdflgg,gfgf', '2024-06-27 05:24:49.000000', '0000-00-00 00:00:00.000000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `affirmations`
--
ALTER TABLE `affirmations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affirmation_category`
--
ALTER TABLE `affirmation_category`
  ADD KEY `affirmation_category_affirmation_id_foreign` (`affirmation_id`),
  ADD KEY `affirmation_category_category_id_foreign` (`category_id`);

--
-- Indexes for table `affirmation_favorite`
--
ALTER TABLE `affirmation_favorite`
  ADD KEY `favorite_id_fk_9623304` (`favorite_id`),
  ADD KEY `affirmation_id_fk_9623304` (`affirmation_id`);

--
-- Indexes for table `affirmation_group`
--
ALTER TABLE `affirmation_group`
  ADD KEY `affirmation_id_fk_9528512` (`affirmation_id`),
  ADD KEY `group_id_fk_9528512` (`group_id`);

--
-- Indexes for table `bgsounds`
--
ALTER TABLE `bgsounds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bg_categories`
--
ALTER TABLE `bg_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bg_category_bgsound`
--
ALTER TABLE `bg_category_bgsound`
  ADD KEY `bgsound_id_fk_9528755` (`bgsound_id`),
  ADD KEY `bg_category_id_fk_9528755` (`bg_category_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_favorite`
--
ALTER TABLE `category_favorite`
  ADD KEY `favorite_id_fk_9623305` (`favorite_id`),
  ADD KEY `category_id_fk_9623305` (`category_id`);

--
-- Indexes for table `category_group`
--
ALTER TABLE `category_group`
  ADD KEY `category_group_category_id_foreign` (`category_id`),
  ADD KEY `category_group_group_id_foreign` (`group_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorite_user`
--
ALTER TABLE `favorite_user`
  ADD KEY `favorite_id_fk_9620548` (`favorite_id`),
  ADD KEY `user_id_fk_9620548` (`user_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `last_session`
--
ALTER TABLE `last_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD KEY `role_id_fk_9528235` (`role_id`),
  ADD KEY `permission_id_fk_9528235` (`permission_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `playlists`
--
ALTER TABLE `playlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `playlist_items`
--
ALTER TABLE `playlist_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `playlist_fk_9637506` (`playlist_id`),
  ADD KEY `affirmation_fk_9637507` (`affirmation_id`);

--
-- Indexes for table `playlist_user`
--
ALTER TABLE `playlist_user`
  ADD KEY `playlist_id_fk_9620892` (`playlist_id`),
  ADD KEY `user_id_fk_9620892` (`user_id`);

--
-- Indexes for table `popular_playlist`
--
ALTER TABLE `popular_playlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD KEY `user_id_fk_9528244` (`user_id`),
  ADD KEY `role_id_fk_9528244` (`role_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `userslogindevice`
--
ALTER TABLE `userslogindevice`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `affirmations`
--
ALTER TABLE `affirmations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `bgsounds`
--
ALTER TABLE `bgsounds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `bg_categories`
--
ALTER TABLE `bg_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `last_session`
--
ALTER TABLE `last_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=267;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `playlists`
--
ALTER TABLE `playlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `playlist_items`
--
ALTER TABLE `playlist_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `popular_playlist`
--
ALTER TABLE `popular_playlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `userslogindevice`
--
ALTER TABLE `userslogindevice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `affirmation_category`
--
ALTER TABLE `affirmation_category`
  ADD CONSTRAINT `affirmation_category_affirmation_id_foreign` FOREIGN KEY (`affirmation_id`) REFERENCES `affirmations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `affirmation_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `affirmation_favorite`
--
ALTER TABLE `affirmation_favorite`
  ADD CONSTRAINT `affirmation_id_fk_9623304` FOREIGN KEY (`affirmation_id`) REFERENCES `affirmations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorite_id_fk_9623304` FOREIGN KEY (`favorite_id`) REFERENCES `favorites` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `affirmation_group`
--
ALTER TABLE `affirmation_group`
  ADD CONSTRAINT `affirmation_id_fk_9528512` FOREIGN KEY (`affirmation_id`) REFERENCES `affirmations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_id_fk_9528512` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bg_category_bgsound`
--
ALTER TABLE `bg_category_bgsound`
  ADD CONSTRAINT `bg_category_id_fk_9528755` FOREIGN KEY (`bg_category_id`) REFERENCES `bg_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bgsound_id_fk_9528755` FOREIGN KEY (`bgsound_id`) REFERENCES `bgsounds` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_favorite`
--
ALTER TABLE `category_favorite`
  ADD CONSTRAINT `category_id_fk_9623305` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorite_id_fk_9623305` FOREIGN KEY (`favorite_id`) REFERENCES `favorites` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_group`
--
ALTER TABLE `category_group`
  ADD CONSTRAINT `category_group_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_group_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `favorite_user`
--
ALTER TABLE `favorite_user`
  ADD CONSTRAINT `favorite_id_fk_9620548` FOREIGN KEY (`favorite_id`) REFERENCES `favorites` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_id_fk_9620548` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_id_fk_9528235` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_id_fk_9528235` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `playlist_items`
--
ALTER TABLE `playlist_items`
  ADD CONSTRAINT `affirmation_fk_9637507` FOREIGN KEY (`affirmation_id`) REFERENCES `affirmations` (`id`),
  ADD CONSTRAINT `playlist_fk_9637506` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`id`);

--
-- Constraints for table `playlist_user`
--
ALTER TABLE `playlist_user`
  ADD CONSTRAINT `playlist_id_fk_9620892` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_id_fk_9620892` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_id_fk_9528244` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_id_fk_9528244` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
