-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2022 at 12:32 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `final`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Pakaian', 'pakaian', '/storage/photos/1/Banner/banner1.jpg', '<h2><span style=\"font-weight: bold; color: rgb(99, 99, 99);\">-</span></h2>', 'active', '2020-08-14 01:47:38', '2020-08-14 01:48:21'),
(5, 'Kerajinan', 'kerajinan', '/storage/photos/1/Banner/banner2.jpg', '<h2><span style=\"font-weight: bold; color: rgb(99, 99, 99);\">-</span></h2>', 'active', NULL, NULL),
(7, 'Makanan', 'kerajinan-2208102846-612', '/storage/photos/1/banner3.jpg', '<p>makanan</p>', 'inactive', '2022-08-09 18:28:46', '2022-08-23 23:56:05');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Lokal', 'lokal', 'active', '2020-08-14 04:23:00', '2020-08-14 04:23:00'),
(2, 'Tanpa Brand', 'tanpa-brand', 'active', '2020-08-14 04:23:00', '2020-08-14 04:23:00');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','process','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(2, 12, 2, 6, 23000.00, 'delivered', 1, 23000.00, '2022-08-09 07:42:19', '2022-08-09 08:14:30'),
(3, 10, 3, 6, 140600.00, 'delivered', 1, 140600.00, '2022-08-09 09:01:54', '2022-08-09 09:04:21'),
(4, 6, 4, 6, 140000.00, 'delivered', 1, 140000.00, '2022-08-09 09:08:51', '2022-08-09 09:09:54'),
(0, 1, NULL, 1, 150000.00, 'delivered', 1, 150000.00, '2022-08-14 23:43:21', '2022-08-23 21:36:34'),
(0, 6, 7, 6, 140000.00, 'delivered', 1, 140000.00, '2022-08-23 21:20:58', '2022-08-23 21:36:34'),
(0, 7, 8, 6, 80000.00, 'delivered', 1, 80000.00, '2022-08-23 21:35:14', '2022-08-23 21:36:34');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Pakaian', 'pakaian', NULL, '/storage/photos/1/Category/mini-banner1.jpg\r\n', 1, NULL, NULL, 'active', '2022-04-15 17:00:00', '2022-04-15 17:00:00'),
(2, 'Makanan', 'makanan', NULL, '/storage/photos/1/Category/mini-banner2.jpg', 1, NULL, NULL, 'active', '2022-04-15 17:00:00', '2022-04-15 17:00:00'),
(3, 'Kerajinan', 'kerajinan', NULL, '/storage/photos/1/Category/mini-banner3.jpg', 1, NULL, NULL, 'active', '2022-04-15 17:00:00', '2022-04-15 17:00:00'),
(4, 'Wanita', 'wanita', NULL, NULL, 0, 1, 1, 'active', '2022-04-15 17:00:00', '2022-04-15 17:00:00'),
(5, 'Pria', 'pria', NULL, NULL, 0, 1, 1, 'active', '2022-04-15 17:00:00', '2022-04-15 17:00:00'),
(6, 'Anak Anak', 'anak-anak', NULL, NULL, 0, 1, 1, 'active', '2022-04-15 17:00:00', '2022-04-15 17:00:00'),
(13, 'Snack', 'snack', 'snack', NULL, 0, 2, NULL, 'inactive', '2022-08-09 18:58:38', '2022-08-23 23:56:18');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'goumkm', 'fixed', '300.00', 'active', '2022-04-15 17:00:00', '2022-04-15 17:00:00');

-- --------------------------------------------------------

--
-- Stand-in structure for view `detail_order`
-- (See below for the actual view)
--
CREATE TABLE `detail_order` (
`order_number` varchar(191)
,`title` varchar(191)
,`price` double(8,2)
,`photo` text
,`id_penjual` bigint(11) unsigned
,`qty` int(11)
,`total` double(19,2)
,`id_product` bigint(20) unsigned
,`cat_id` bigint(20) unsigned
,`child_cat_id` bigint(20) unsigned
,`nama_penjual` varchar(191)
,`tanggal_order` date
);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `keuntungan_penjual`
-- (See below for the actual view)
--
CREATE TABLE `keuntungan_penjual` (
`id_penjual` bigint(11) unsigned
,`nama_penjual` varchar(191)
,`keuntungan` double(19,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_07_10_021010_create_brands_table', 1),
(5, '2020_07_10_025334_create_banners_table', 1),
(6, '2020_07_10_112147_create_categories_table', 1),
(7, '2020_07_11_063857_create_products_table', 1),
(8, '2020_07_12_073132_create_post_categories_table', 1),
(9, '2020_07_12_073701_create_post_tags_table', 1),
(10, '2020_07_12_083638_create_posts_table', 1),
(11, '2020_07_13_151329_create_messages_table', 1),
(12, '2020_07_14_023748_create_shippings_table', 1),
(13, '2020_07_15_054356_create_orders_table', 1),
(14, '2020_07_15_102626_create_carts_table', 1),
(15, '2020_07_16_041623_create_notifications_table', 1),
(16, '2020_07_16_053240_create_coupons_table', 1),
(17, '2020_07_23_143757_create_wishlists_table', 1),
(18, '2020_07_24_074930_create_product_reviews_table', 1),
(19, '2020_07_24_131727_create_post_comments_table', 1),
(20, '2020_08_01_143408_create_settings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('0b5f106a-9381-4b25-a8c5-5b94fd865972', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/pelapak\\/order\\/1\",\"fas\":\"fa-file-alt\"}', NULL, '2022-08-09 06:22:13', '2022-08-09 06:22:13'),
('0fac1d78-44c5-438b-9553-f5f87296af68', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/pelapak\\/order\\/4\",\"fas\":\"fa-file-alt\"}', NULL, '2022-04-21 06:07:17', '2022-04-21 06:07:17'),
('2145a8e3-687d-444a-8873-b3b2fb77a342', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-15 07:31:21', '2020-08-15 07:31:21'),
('2537922b-1539-453b-9a49-20418e5a92b2', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/pelapak\\/order\\/1\",\"fas\":\"fa-file-alt\"}', NULL, '2022-04-10 01:40:56', '2022-04-10 01:40:56'),
('3af39f84-cab4-4152-9202-d448435c67de', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-15 07:54:52', '2020-08-15 07:54:52'),
('3dd5ee36-70af-49b3-bf63-8d2b4a86ac59', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/pelapak\\/order\\/2\",\"fas\":\"fa-file-alt\"}', NULL, '2022-08-09 07:42:44', '2022-08-09 07:42:44'),
('4a0afdb0-71ad-4ce6-bc70-c92ef491a525', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-17 21:13:51', '2020-08-17 21:13:51'),
('540ca3e9-0ff9-4e2e-9db3-6b5abc823422', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', '2020-08-15 07:30:44', '2020-08-14 07:12:28', '2020-08-15 07:30:44'),
('5d939570-0ec0-4c62-9bdc-7bf142818bc8', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/pelapak\\/order\\/3\",\"fas\":\"fa-file-alt\"}', NULL, '2022-08-09 07:12:01', '2022-08-09 07:12:01'),
('5da09dd1-3ffc-43b0-aba2-a4260ba4cc76', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-15 07:51:02', '2020-08-15 07:51:02'),
('5e91e603-024e-45c5-b22f-36931fef0d90', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/white-sports-casual-t\",\"fas\":\"fa-star\"}', NULL, '2020-08-15 07:44:07', '2020-08-15 07:44:07'),
('666f25ff-de92-451a-9caf-b0086de3abb0', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/pelapak\\/order\\/3\",\"fas\":\"fa-file-alt\"}', NULL, '2022-04-10 12:25:16', '2022-04-10 12:25:16'),
('6e5d52d9-96a5-4f14-9939-234d9ecdd64a', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/pelapak\\/order\\/4\",\"fas\":\"fa-file-alt\"}', NULL, '2022-08-09 09:09:26', '2022-08-09 09:09:26'),
('6e7c788e-d8d0-4105-abf7-a10f7043ecee', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/pelapak\\/order\\/2\",\"fas\":\"fa-file-alt\"}', NULL, '2022-04-05 00:14:44', '2022-04-05 00:14:44'),
('73a3b51a-416a-4e7d-8ca2-53b216d9ad8e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-14 07:11:03', '2020-08-14 07:11:03'),
('8605db5d-1462-496e-8b5f-8b923d88912c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/1\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-14 07:20:44', '2020-08-14 07:20:44'),
('95a99091-72a6-4c53-b997-557a43dc6c01', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/pelapak\\/order\\/1\",\"fas\":\"fa-file-alt\"}', NULL, '2022-04-01 03:30:29', '2022-04-01 03:30:29'),
('a6ec5643-748c-4128-92e2-9a9f293f53b5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}', '2022-03-31 00:33:01', '2020-08-17 21:17:03', '2022-03-31 00:33:01'),
('abdc701e-f191-4dc4-9b01-a444aa34b970', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/pelapak\\/order\\/1\",\"fas\":\"fa-file-alt\"}', NULL, '2022-08-09 07:25:39', '2022-08-09 07:25:39'),
('b12d8456-86e3-4eac-b4b3-a6b1991145b6', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/camilan-sehat-anak-yummio-rice-cakes-keju-30gr\",\"fas\":\"fa-star\"}', NULL, '2022-08-09 07:44:07', '2022-08-09 07:44:07'),
('b186a883-42f2-4a05-8fc5-f0d3e10309ff', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}', '2020-08-15 04:17:24', '2020-08-14 22:14:55', '2020-08-15 04:17:24'),
('cf03e960-4e5a-4997-a727-1a07a8961486', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/pelapak\\/order\\/2\",\"fas\":\"fa-file-alt\"}', NULL, '2022-04-10 01:46:39', '2022-04-10 01:46:39'),
('d0fbaf3e-ce2d-42d0-9cf9-0ba40ef5ceec', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/pelapak\\/order\\/3\",\"fas\":\"fa-file-alt\"}', NULL, '2022-08-09 09:02:33', '2022-08-09 09:02:33'),
('d16e11b3-68a5-4431-becd-e937bd05dd70', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/pelapak\\/order\\/5\",\"fas\":\"fa-file-alt\"}', NULL, '2022-07-19 05:47:43', '2022-07-19 05:47:43'),
('d2fd7c33-b0fe-47d6-8bc6-f377d404080d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-14 07:08:50', '2020-08-14 07:08:50'),
('dff78b90-85c8-42ee-a5b1-de8ad0b21be4', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-15 06:40:54', '2020-08-15 06:40:54'),
('e28b0a73-4819-4016-b915-0e525d4148f5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/lorem-ipsum-is-simply\",\"fas\":\"fa-star\"}', NULL, '2020-08-17 21:08:16', '2020-08-17 21:08:16'),
('ed8bbe8c-4093-4627-ada5-ed1f6dad79e1', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/pelapak\\/order\\/6\",\"fas\":\"fa-file-alt\"}', NULL, '2022-07-26 08:43:10', '2022-07-26 08:43:10'),
('f3606a1d-8c16-4d85-94e1-0ed76c4553de', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/pelapak\\/order\\/2\",\"fas\":\"fa-file-alt\"}', NULL, '2022-08-09 07:07:26', '2022-08-09 07:07:26'),
('ffffa177-c54e-4dfe-ba43-27c466ff1f4b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-17 21:13:29', '2020-08-17 21:13:29'),
('367b2d30-3459-44f7-a063-40ed95ca5f21', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/pelapak\\/order\\/6\",\"fas\":\"fa-file-alt\"}', NULL, '2022-08-14 22:41:01', '2022-08-14 22:41:01'),
('800e9b2d-7703-4884-9510-7b801cb0084a', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/pelapak\\/order\\/7\",\"fas\":\"fa-file-alt\"}', NULL, '2022-08-23 21:21:32', '2022-08-23 21:21:32'),
('0ecb46c6-abee-4194-bc1a-6190d460d765', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/pelapak\\/order\\/8\",\"fas\":\"fa-file-alt\"}', NULL, '2022-08-23 21:35:49', '2022-08-23 21:35:49');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'paid',
  `status` enum('new','process','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(2, 'ORD-EQQBW3D5JR', 6, 23000.00, NULL, NULL, 23000.00, 1, 'cod', 'paid', 'delivered', 'bening', 'ramadan', 'pembeli@gmail.com', '7812738012', 'jogja', '63491', 'RT 01 RW 01 TULAR SUKOSARI BABADAN PONOROGO', NULL, '2022-08-09', '2022-08-09 07:42:44'),
(3, 'ORD-7FWNFS21CV', 6, 140600.00, NULL, NULL, 140600.00, 1, 'cod', 'paid', 'delivered', 'Ramdhan', 'M K', 'pembeli@gmail.com', '082229119030', 'jogja', '63491', 'RT 01 RW 01 TULAR SUKOSARI BABADAN PONOROGO', NULL, '2022-08-09', '2022-08-09 09:02:32'),
(7, 'ORD-0JNCZKFOHZ', 6, 140000.00, 2, NULL, 149000.00, 1, 'cod', 'paid', 'delivered', 'Dinda', 'Putri', 'pembeli@gmail.com', '0812312312312', 'madura', '63491', 'RT 01 RW 01 TULAR SUKOSARI BABADAN PONOROGO', NULL, '2022-08-15', '2022-08-23 21:21:31'),
(8, 'ORD-FXOYXHIAHV', 6, 80000.00, 1, NULL, 91000.00, 1, 'cod', 'paid', 'delivered', 'Alfain', 'Bustami', 'pembeli@gmail.com', '082229119030', 'ponorogo', '63491', 'RT 01 RW 01 TULAR SUKOSARI BABADAN PONOROGO', NULL, '2022-08-17', '2022-08-23 21:35:49');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_pelapak`
--

CREATE TABLE `pengajuan_pelapak` (
  `id_pengajuan` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `ktp` varchar(250) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengajuan_pelapak`
--

INSERT INTO `pengajuan_pelapak` (`id_pengajuan`, `user_id`, `date`, `ktp`, `alamat`, `no_hp`) VALUES
(3, 3, '2022-04-16 15:02:30', 'ktp-1650096150.png', 'asdasdas', '123123121212'),
(4, 4, '2022-04-21 20:06:11', 'ktp-1650546371.jpg', 'bandung', '082229119030'),
(5, 5, '2022-07-19 19:56:47', 'ktp-1658235407.jpg', 'jalan telekomunikasi', '0828282812312'),
(6, 6, '2022-08-10 08:31:22', 'ktp-1660095082.jpg', 'jalan telekomunikasi 1', '082229119030');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quote` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Where does it come from?', 'where-does-it-come-from', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Contrary to popular belief, Lorem Ipsum is not simply random text.&nbsp;</span><br></p>', '<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.</span><br></p>', '/storage/photos/1/Blog/blog1.jpg', '2020', 1, NULL, 2, 'active', '2020-08-14 01:55:55', '2020-08-14 04:29:56'),
(2, 'Where can I get some?', 'where-can-i-get-some', '<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\"><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">It is a long established fact that a reader</span><br></h2>', '<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; line-height: 24px; font-size: 24px; padding: 0px; font-family: DauphinPlain;\">Why do we use it?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; line-height: 24px; font-size: 24px; padding: 0px; font-family: DauphinPlain;\">Why do we use it?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', NULL, '/storage/photos/1/Blog/blog2.jpg', 'Enjoy', 2, NULL, 1, 'active', '2020-08-14 01:58:52', '2020-08-14 07:08:14'),
(3, 'The standard Lorem Ipsum passage, used since the 1500s', 'the-standard-lorem-ipsum-passage-used-since-the-1500s', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit,</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>', NULL, '/storage/photos/1/Blog/blog3.jpg', '', 3, NULL, NULL, 'active', '2020-08-14 02:59:33', '2020-08-14 04:29:44'),
(5, 'The standard Lorem Ipsum passage,', 'the-standard-lorem-ipsum-passage', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">The standard Lorem Ipsum passage, used since the 1500s</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,</span><br></p>', '/storage/photos/1/Blog/blog2.jpg', '2020', 1, NULL, 1, 'active', '2020-08-15 06:58:45', '2020-08-15 06:58:45'),
(6, 'Lorem Ipsum is simply', 'lorem-ipsum-is-simply', '<p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry.</span><br></p>', '<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><hr><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p>', NULL, '/storage/photos/1/Blog/blog3.jpg', 'Enjoy,2020', 2, NULL, 1, 'active', '2020-08-17 20:54:19', '2020-08-17 20:54:19');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Travel', 'contrary', 'active', '2020-08-14 01:51:03', '2020-08-14 01:51:39'),
(2, 'Electronics', 'richard', 'active', '2020-08-14 01:51:22', '2020-08-14 01:52:00'),
(3, 'Cloths', 'cloths', 'active', '2020-08-14 01:52:22', '2020-08-14 01:52:22'),
(4, 'enjoy', 'enjoy', 'active', '2020-08-14 03:16:10', '2020-08-14 03:16:10'),
(5, 'Post Category', 'post-category', 'active', '2020-08-15 06:59:04', '2020-08-15 06:59:04');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `replied_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_comments`
--

INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `comment`, `status`, `replied_comment`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Testing comment edited', 'active', NULL, NULL, '2020-08-14 07:08:42', '2020-08-15 06:59:58'),
(2, NULL, 2, 'testing 2', 'active', NULL, 1, '2020-08-14 07:11:03', '2020-08-14 07:11:03'),
(3, 2, 2, 'That\'s cool', 'active', NULL, 2, '2020-08-14 07:12:27', '2020-08-14 07:12:27'),
(4, 1, 2, 'nice', 'active', NULL, NULL, '2020-08-15 07:31:19', '2020-08-15 07:31:19'),
(5, NULL, 5, 'nice blog', 'active', NULL, NULL, '2020-08-15 07:51:01', '2020-08-15 07:51:01'),
(6, 2, 3, 'nice', 'active', NULL, NULL, '2020-08-17 21:13:29', '2020-08-17 21:13:29'),
(7, 2, 3, 'really', 'active', NULL, 6, '2020-08-17 21:13:51', '2020-08-17 21:13:51');

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Enjoy', 'enjoy', 'active', '2020-08-14 01:53:52', '2020-08-14 01:53:52'),
(2, '2020', '2020', 'active', '2020-08-14 01:54:09', '2020-08-14 01:54:09'),
(3, 'Visit Bandung 2020', 'visit-bandung-2020', 'active', '2020-08-14 01:54:33', '2020-08-14 01:54:33'),
(4, 'Tag', 'tag', 'active', '2020-08-15 06:59:31', '2020-08-15 06:59:31');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'M',
  `condition` enum('default','new','hot') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `id_penjual` bigint(11) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `id_penjual`, `created_at`, `updated_at`) VALUES
(1, 'Women Blus Rayon Kerah Skipper Lengan 3/4 Wanita', 'women-blus-rayon', '<p><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">Blus elegan yang terbuat dari bahan berkualitas tinggi. Tampil stylish-kasual dengan mudah.</span><br style=\"box-sizing: inherit; color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Tidak mudah kusut sehingga mudah perawatannya.</span><br style=\"box-sizing: inherit; color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Dari bahan rayon yang lembut.</span><br style=\"box-sizing: inherit; color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Dengan kerah skipper.</span><br style=\"box-sizing: inherit; color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><br style=\"box-sizing: inherit; color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">DETAIL KAIN</span><br style=\"box-sizing: inherit; color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">76% Viskosa, 24% Poliester</span><br style=\"box-sizing: inherit; color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">INSTRUKSI PENCUCIAN</span><br style=\"box-sizing: inherit; color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">Dicuci dengan mesin menggunakan air dingin, kecepatan putaran rendah</span><br></h3>', '/storage/photos/1/Products/pakaian/kemejawanita.jpg,/storage/photos/1/Products/pakaian/kemejawanita1.jpg,/storage/photos/1/Products/pakaian/kemejawanita2.jpg', 93, 'S,M,L', 'new', 'active', 150000.00, 0.00, 1, 1, 4, 1, 2, '2020-08-14 04:38:26', '2022-04-16 02:00:17'),
(2, 'Women Jaket Mantel Saku Half Slit Pocketable Wanita', 'women-jaket-mantel', '<p><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">Mantel Wanita dengan slit di bagian samping untuk kenyamanan dalam bergerak. Desain saku (pocketable) yang mudah disimpan di tas Anda.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Bahan nylon dengan lapisan anti-air.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Tekstur kasual</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Dilapisi dengan bahan olahan resin.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Siluet A-line yang melebar dari arah bahu.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Mantel half-length untuk gerak lebih leluasa.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Slit di bagian samping agar praktis saat dipakai bersepeda.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Praktis untuk dibawa kemana saja.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Fungsional, nyaman, ringan, dan cocok untuk layering.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Cocok untuk travelling dan cuaca tidak menentu.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">DETAIL KAIN</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">100% Poliamida</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">INSTRUKSI PENCUCIAN</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">Dicuci dengan tangan</span><br></h3>', '/storage/photos/1/Products/pakaian/jaket.jpg,/storage/photos/1/Products/pakaian/jaket1.jpg,/storage/photos/1/Products/pakaian/jaket2.jpg', 100, 'S,M,L,XL', 'hot', 'active', 200000.00, 0.00, 1, 1, 4, 1, 2, '2020-08-14 04:40:21', '2022-04-16 01:59:52'),
(3, 'Women Piyama Set Satin Lengan Pendek Wanita', 'women-piyama-set', '<p><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Tidak mudah kusut.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Bahan satin dengan kilau elegan dan drape yang elegan.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Dilengkapi dengan saku praktis.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Desain lengan pendek klasik.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">DETAIL KAIN</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">100% Poliester</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">INSTRUKSI PENCUCIAN</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">Dicuci dengan mesin menggunakan air dingin, kecepatan putaran rendah</span><br></h3>', '/storage/photos/1/Products/pakaian/pijama.jpg,/storage/photos/1/Products/pakaian/pijama1.jpg,/storage/photos/1/Products/pakaian/pijama2.jpg', 100, 'S,M,L', 'hot', 'active', 150000.00, 0.00, 0, 1, 4, 2, 2, '2020-08-14 05:57:48', '2022-04-16 02:02:51'),
(4, 'T-Shirt Oversized Garis Kaos Lengan Half Pria', 'tshir-oversized', '<p><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Cocok untuk dipakai dengan sendirinya atau dilapiskan.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Potongan oversized yang modern.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Motif striped yang mudah dipadupadankan.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">DETAIL KAIN</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">100% Kapas</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">INSTRUKSI PENCUCIAN</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">Dicuci dengan mesin menggunakan air dingin</span><br></h3>', '/storage/photos/1/Products/pakaian/kaos1.jpg,/storage/photos/1/Products/pakaian/kaos2.jpg,/storage/photos/1/Products/pakaian/kaos3.jpg', 100, 'S,M,L', 'new', 'active', 80000.00, 0.00, 0, 1, 5, 1, 2, '2020-08-14 06:04:13', '2022-04-16 02:06:59'),
(5, 'Jeans Wide Fit Celana Panjang Pria', 'jeans-wide-fit', '<p><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Dibuat dengan workwear denim.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Motif yang didesain lebar dan tapered menuju hem untuk fit yang lebih nyaman dipakai.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Detail work denim yang autentik dengan fit yang lebar.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Bahan yang ringan.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Sempurna untuk gaya kasual.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">DETAIL KAIN</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">100% Kapas</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">INSTRUKSI PENCUCIAN</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">Dicuci dengan mesin menggunakan air dingin</span><br></h3>', '/storage/photos/1/Products/pakaian/celanapria.jpg,/storage/photos/1/Products/pakaian/celanapria1.jpg,/storage/photos/1/Products/pakaian/celanapria2.jpg', 100, 'S,M,L', 'hot', 'active', 90000.00, 0.00, 0, 1, 5, 1, 2, '2020-08-14 06:10:52', '2022-04-16 02:08:21'),
(6, 'Kemeja Kerah Terbuka Unsodo motif Seni Jepang', 'kemeja-kerah-terbuka', '<p><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Bahan 100% rayon dengan drape yang elegan.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Fit yang roomy di bagian bahu dan lengan.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Menampilkan motif air dan gelombang dari cetakan woodblock oleh seniman dan desainer awal abad kedua puluh Kamisaka Sekka.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Kamisaka Sekka dianggap sebagai mentor besar terakhir dari sekolah Rinpa seni lukis Jepang, yang berusaha menemukan keindahan dalam kehidupan sehari-hari.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Kemeja Aloha yang santai.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Dari kerjasama kami dengan Unsodo, penerbit buku tradisional Jepang yang dibuat dengan cetakan balok kayu yang dicetak dengan tangan sejak abad ke-19.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Menurut beberapa sumber, kemeja Aloha pertama dibuat oleh pendatang dari Jepang ke Hawaii yang membuat kembali kimono lama menjadi kemeja.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Motif asli Jepang ini sangat cocok dengan kemeja Aloha.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">DETAIL KAIN</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">100% Viskosa</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">INSTRUKSI PENCUCIAN</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">Dicuci dengan mesin menggunakan air dingin, kecepatan putaran rendah</span><br></h3>', '/storage/photos/1/Products/pakaian/kjepang.jpg,/storage/photos/1/Products/pakaian/kjepang1.jpg,/storage/photos/1/Products/pakaian/kjepang2.jpg', 97, 'S,M,L', 'hot', 'active', 140000.00, 0.00, 1, 1, 5, 1, 2, '2020-08-14 06:13:20', '2022-04-16 02:09:31'),
(7, 'Kids UT T-shirt Line Friends Kaos Anak', 'kids-shirt-line', '<p><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">Referensi ukuran pakaian anak :</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">100 : 3-4 tahun</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">110: 4-5 tahun</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">120: 6-7 tahun</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">130: 8-9 tahun</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">140: 10-11 tahun</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">150: 12-13 tahun</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">160 : 14 tahun ke atas</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">DETAIL KAIN</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">Utama: 100% Kapas/ Jaring: 100% Poliester</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">INSTRUKSI PENCUCIAN</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">Dicuci dengan mesin menggunakan air dingin, kecepatan putaran rendah</span><br></h3>', '/storage/photos/1/Products/pakaian/anak1.jpg,/storage/photos/1/Products/pakaian/anak2.jpg,/storage/photos/1/Products/pakaian/anak3.jpg', 99, 'S,M,L', 'hot', 'active', 80000.00, 0.00, 0, 1, 6, 1, 2, '2020-08-14 06:23:33', '2022-04-16 02:11:10'),
(8, 'BABY Celana AIRism Jogger Relax Bayi Unisex', 'baby-celana-airism', '<p><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">Celana legging Bayi dengan AIRism yang nyaman dan lembut untuk kulit si Kecil. Panjang crop 3/4 yang terlihat stylish. Untuk alasan kesehatan, produk ini tidak dapat dikembalikan.UPF40.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Bagian pinggang dan hem yang elastis.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Ukuran yang dapat disesuaikan berkat kancing pengencang yang terbuat dari karet.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Pinggang tidak mudah bergeser.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Tampilan katun dengan performa AIRism.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Dengan teknologi UV protection yang menjaga kulit dari sinar matahari.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Bagian pinggang dan hem yang dibuat dari bahan elastis. Bisa disesuaikan sesuai ukuran.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Potongan loose fit untuk mudah bergerak.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Ukuran panjang dan fit bisa menyesuaikan Bayi Anda seiring beranjaknya usia.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Dengan saku.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">- Terdapat 3 ukuran, dengan celana yang tetap nyaman untuk waktu lama seiring beranjaknya Balita. *Ukuran tubuh dan fit berubah seiring perkembangan Balita.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">DETAIL KAIN</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">73% Kapas, 27% Poliester</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">INSTRUKSI PENCUCIAN</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-weight: 400;\">Dicuci dengan mesin menggunakan air dingin</span><br></h3>', '/storage/photos/1/Products/pakaian/kid1.jpg,/storage/photos/1/Products/pakaian/kid2.jpg,/storage/photos/1/Products/pakaian/kid2.jpg', 100, 'S,M,L', 'new', 'active', 50000.00, 0.00, 0, 1, 6, 1, 2, '2020-08-14 06:25:42', '2022-04-16 02:12:05'),
(9, 'Kerajinan Tangan Rotan - Keranjang Piknik Kotak', 'kerajinan-tangan-rotan', '<p><br></p>', '<p><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">Material Berkualitas</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">Produk ini terbuat dari kayu yang berkualitas sehingga produk ini tentunya kuat, awet, dan tahan lama. Selain itu, material yang dimiliki oleh produk ini juga ramah lingkungan.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">Asli Buatan Indonesia</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">Produk asli 100% Made In Indonesia. Karenanya, milikilah produk persembahan dari kami dan tunjukkan apresiasi Anda sebagai bangsa Indonesia yang menyenangi produk-produk lokal.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">Terbuat dari kayu yang dibentuk menjadi Kerajinan Tangan Rotan - Keranjang Piknik Kotak Besar v2, dengan finishing menggunakan pernis yang membuat hasil akhir menjadi lebih mengkilap.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">Dapat digunakan sebagai:</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">- Aksesoris/hiasan artistik</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">- Dekorasi untuk mempercantik rumah anda</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">- Hadiah untuk keluarga/kerabat/kolega anda</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">- Digunakan sendiri sesuai dengan peruntukkannya</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">Spesifikasi</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">Ukuran : 45 x 36 x 28 cm</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">Warna : coklat</span><br></p>', '/storage/photos/1/Products/pakaian/kerajinan1.jpg,/storage/photos/1/Products/pakaian/kerajinan2.jpg,/storage/photos/1/Products/pakaian/kerajinan3.jpg', 50, '', 'new', 'active', 174900.00, 0.00, 0, 3, NULL, 1, 2, '2020-08-15 06:52:44', '2022-04-16 02:13:24'),
(10, 'Kerajinan Tangan Rotan - Keranjang Buah Bentuk Telur', 'kerajinan-tangan-rotan-telur', '<p><br></p>', '<p><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">Material Berkualitas</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">Produk ini terbuat dari kayu yang berkualitas sehingga produk ini tentunya kuat, awet, dan tahan lama. Selain itu, material yang dimiliki oleh produk ini juga ramah lingkungan.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">Asli Buatan Indonesia</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">Produk asli 100% Made In Indonesia. Karenanya, milikilah produk persembahan dari kami dan tunjukkan apresiasi Anda sebagai bangsa Indonesia yang menyenangi produk-produk lokal.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">Terbuat dari kayu yang dibentuk menjadi Kerajinan Tangan Rotan - Keranjang Buah Bentuk Telur, dengan finishing menggunakan pernis yang membuat hasil akhir menjadi lebih mengkilap.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">Dapat digunakan sebagai:</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">- Aksesoris/hiasan artistik</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">- Dekorasi untuk mempercantik rumah anda</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">- Hadiah untuk keluarga/kerabat/kolega anda</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">- Digunakan sendiri sesuai dengan peruntukkannya</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">Spesifikasi</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">Ukuran : 30 x 30 x 20 cm</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">Warna : coklat</span><br></p>', '/storage/photos/1/Products/pakaian/kera1.jpg,/storage/photos/1/Products/pakaian/kera2.jpg,/storage/photos/1/Products/pakaian/kera3.jpg', 97, '', 'hot', 'active', 140600.00, 0.00, 0, 3, NULL, 1, 2, '2020-08-17 20:50:07', '2022-04-16 02:16:15'),
(11, 'Ladang Lima Tepung Pisang Goreng 200g', 'ladang-lima-tepung-pisang-goreng-200g', '<p>&nbsp;</p>', '<p><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">Tepung pisang goreng Ladang Lima terbuat dari tepung mocaf bebas gluten dengan manis alami dari gula tanpa rafinasi. Kini pisang goreng rumahan dengan rasa vanilla yang renyah dan sehat dapat Anda nikmati dengan praktis di berbagai kesempatan.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">Manfaat kesehatan:</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">- Bebas Gluten</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">- Tanpa Pemanis Buatan</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">- Tanpa Pengawet</span><br></p>', '/storage/photos/1/Products/pakaian/jajan.jpg', 48, '', 'new', 'active', 16900.00, 0.00, 1, 2, NULL, 1, 2, '2022-04-16 02:17:48', '2022-04-16 02:19:08'),
(12, 'Camilan Sehat Anak - Yummio Rice Cakes Keju', 'camilan-sehat-anak-yummio-rice-cakes-keju-30gr', '<p>&nbsp;</p>', '<p><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">YUMMIO RICE CAKES KEJU adalah pilihan cemilan keluarga sehat, nikmat dikonsumsi dari anak kecil sampai orang dewasa.</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">- 100% Natural</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">- Gluten Free Ingredients</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">- Tanpa MSG</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">- Tidak digoreng</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">- Tanpa bahan pengawet</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">YUMMIO RICE CAKES dibuat menggunakan bahan-bahan 100% alami, premium, dan berkualitas seperti:</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">- Beras Coklat Organik</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">- Beras Putih Organik</span><br style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\"><span style=\"color: rgba(49, 53, 59, 0.96); font-family: &quot;open sans&quot;, tahoma, sans-serif; font-size: 14px;\">- Bumbu Non-MSG</span><br></p>', '/storage/photos/1/Products/pakaian/jajan2.jpg,/storage/photos/1/Products/pakaian/jajan3.jpg', 38, '', 'hot', 'active', 23000.00, 0.00, 1, 2, NULL, 1, 2, '2022-04-16 02:18:55', '2022-04-24 20:48:16');

-- --------------------------------------------------------

--
-- Table structure for table `product_orders`
--

CREATE TABLE `product_orders` (
  `id_product_order` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT 0,
  `review` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 2, 5, 'nice product', 'active', '2020-08-15 07:44:05', '2020-08-15 07:44:05'),
(2, 2, 9, 5, 'nice', 'active', '2020-08-17 21:08:14', '2020-08-17 21:18:31'),
(3, 6, 12, 5, 'tes review', 'active', '2022-08-09 07:44:07', '2022-08-09 07:44:07');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Aplikasi berbasis web untuk penyediaan informasi UMKM Kabupaten Bantul', 'Aplikasi e-commerce', '/storage/photos/1/logo.png', '/storage/photos/1/blog3.jpg', 'Telkom University, Jl. Telekomunikasi No. 1, Terusan Buahbatu - Bojongsoang, Sukapura, Kec. Dayeuhkolot, Kabupaten Bandung, Jawa Barat 40257', '+62 822 2911 9030', 'goumkm@gmail.com', '2022-04-15 17:00:00', '2022-04-15 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'JNE Regular', '11000.00', 'active', NULL, NULL),
(2, 'J&T', '9000.00', 'active', NULL, NULL),
(3, 'SiCepat Regular', '11000.00', 'active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user','pelapak') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `req_pelapak` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `req_pelapak`, `created_at`, `updated_at`) VALUES
(1, 'Alfain Azzaria B', 'admin@gmail.com', NULL, '$2y$10$euubUBAOabQ3Ru3ehQaZHuf/GD2j8.lW9MwJYjtdV4SXtJSqsoi9O', '/storage/photos/1/users/user1.jpg', 'admin', NULL, NULL, 'active', 'LRdnw3zXdig4QUA3q1mUp7QhP3ivNIw9ViVXjC5c9bd8c1GcMb31kvq6O0In', NULL, '2022-03-31 00:12:35', '2022-08-09 08:50:18'),
(2, 'Bening Ramadan M K', 'penjual@gmail.com', NULL, '$2y$10$LAFAVQy.zg.zB.7oEZz61OBSuTrUjV4CIPTBcqnllRYGhvKcB7Ww2', NULL, 'pelapak', NULL, NULL, 'active', NULL, NULL, '2022-04-01 03:19:18', '2022-08-09 08:53:56'),
(6, 'Dinda', 'pembeli@gmail.com', NULL, '$2y$10$LAFAVQy.zg.zB.7oEZz61OBSuTrUjV4CIPTBcqnllRYGhvKcB7Ww2', NULL, 'user', NULL, NULL, 'active', NULL, NULL, '2022-08-09 06:20:46', '2022-08-09 18:56:48'),
(7, 'Anindya', 'penjual2@gmail.com', NULL, '$2y$10$BQYQxlIRT5nA2AnV7bvSJuSwKJAt8TghNgho1HKFMj16AM5tIbbna', NULL, 'pelapak', NULL, NULL, 'inactive', NULL, NULL, '2022-08-09 09:11:55', '2022-08-22 21:43:54');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure for view `detail_order`
--
DROP TABLE IF EXISTS `detail_order`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detail_order`  AS SELECT `a`.`order_number` AS `order_number`, `c`.`title` AS `title`, `b`.`price` AS `price`, `c`.`photo` AS `photo`, `c`.`id_penjual` AS `id_penjual`, `b`.`quantity` AS `qty`, `b`.`price`* `b`.`quantity` AS `total`, `b`.`product_id` AS `id_product`, `c`.`cat_id` AS `cat_id`, `c`.`child_cat_id` AS `child_cat_id`, `d`.`name` AS `nama_penjual`, `a`.`created_at` AS `tanggal_order` FROM (((`orders` `a` join `carts` `b` on(`a`.`id` = `b`.`order_id`)) join `products` `c` on(`b`.`product_id` = `c`.`id`)) join `users` `d` on(`c`.`id_penjual` = `d`.`id`)) WHERE `a`.`payment_status` = 'paid''paid'  ;

-- --------------------------------------------------------

--
-- Structure for view `keuntungan_penjual`
--
DROP TABLE IF EXISTS `keuntungan_penjual`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `keuntungan_penjual`  AS SELECT `c`.`id_penjual` AS `id_penjual`, `d`.`name` AS `nama_penjual`, sum(`c`.`price`) AS `keuntungan` FROM (((`orders` `a` join `product_orders` `b` on(`a`.`id` = `b`.`order_id`)) join `products` `c` on(`b`.`product_id` = `c`.`id`)) join `users` `d` on(`c`.`id_penjual` = `d`.`id`)) WHERE `a`.`payment_status` = 'paid' GROUP BY `c`.`id_penjual``id_penjual`  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
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
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
