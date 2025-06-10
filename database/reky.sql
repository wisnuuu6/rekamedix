-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 10, 2025 at 09:02 PM
-- Server version: 11.4.5-MariaDB-cll-lve
-- PHP Version: 8.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reky7855_medix`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_requests`
--

CREATE TABLE `access_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `checkups`
--

CREATE TABLE `checkups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `schedule_id` bigint(20) UNSIGNED NOT NULL,
  `complaint` text DEFAULT NULL,
  `diagnosis` varchar(255) DEFAULT NULL,
  `status` enum('checkup','waiting_medicine','done','canceled') NOT NULL,
  `checkup_price` bigint(20) NOT NULL DEFAULT 0,
  `total_price` bigint(20) NOT NULL DEFAULT 0,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `checkups`
--

INSERT INTO `checkups` (`id`, `patient_id`, `user_id`, `schedule_id`, `complaint`, `diagnosis`, `status`, `checkup_price`, `total_price`, `note`, `created_at`, `updated_at`) VALUES
(29, NULL, 35, 9, 'Sakit', NULL, 'done', 150000, 250000, 'Test', '2025-05-22 23:08:07', '2025-05-22 23:09:13'),
(30, NULL, 35, 10, 'Tes', NULL, 'done', 150000, 250000, 'Test', '2025-05-22 23:09:59', '2025-05-22 23:11:08'),
(31, NULL, 35, 9, 'test1', NULL, 'done', 150000, 180000, 'test', '2025-06-04 00:18:19', '2025-06-04 00:20:07'),
(32, NULL, 35, 9, 'test', NULL, 'canceled', 0, 0, NULL, '2025-06-04 00:19:11', '2025-06-04 00:20:25'),
(33, NULL, 35, 9, 'test', NULL, 'canceled', 0, 0, NULL, '2025-06-04 00:20:56', '2025-06-09 23:25:42'),
(34, NULL, 45, 9, 'sakit gigi', NULL, 'canceled', 0, 0, NULL, '2025-06-09 23:18:13', '2025-06-09 23:25:36'),
(35, NULL, 46, 9, 'sakit gigi', NULL, 'done', 150000, 180000, 'istirahat', '2025-06-09 23:21:43', '2025-06-09 23:23:45'),
(36, NULL, 47, 9, 'sakit', NULL, 'done', 150000, 240000, 'istirahat cukup', '2025-06-09 23:28:21', '2025-06-09 23:30:44');

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `checkup_id` bigint(20) UNSIGNED NOT NULL,
  `medicine_id` bigint(20) UNSIGNED NOT NULL,
  `application` varchar(255) DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  `price` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`id`, `checkup_id`, `medicine_id`, `application`, `qty`, `price`, `created_at`, `updated_at`) VALUES
(15, 29, 3, '3 kali sehari', 10, 10000, '2025-05-22 23:08:57', '2025-05-22 23:08:57'),
(16, 30, 3, 'kjkjwskhcecw', 10, 10000, '2025-05-22 23:10:49', '2025-05-22 23:10:49'),
(17, 31, 3, '1', 3, 10000, '2025-06-04 00:20:02', '2025-06-04 00:20:02'),
(18, 35, 3, '3 kali sehari', 3, 10000, '2025-06-09 23:23:36', '2025-06-09 23:23:36'),
(19, 36, 3, '3 kali sehari', 9, 10000, '2025-06-09 23:30:27', '2025-06-09 23:30:27');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medical_access_requests`
--

CREATE TABLE `medical_access_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medical_access_requests`
--

INSERT INTO `medical_access_requests` (`id`, `doctor_id`, `patient_id`, `status`, `expires_at`, `created_at`, `updated_at`) VALUES
(24, 33, 35, 'approved', '2025-05-22 23:13:23', '2025-05-22 23:08:15', '2025-05-22 23:08:23'),
(25, 34, 35, 'approved', '2025-05-22 23:15:13', '2025-05-22 23:10:08', '2025-05-22 23:10:13'),
(26, 33, 35, 'approved', '2025-06-04 00:24:02', '2025-06-04 00:18:54', '2025-06-04 00:19:02'),
(27, 33, 46, 'approved', '2025-06-09 23:27:43', '2025-06-09 23:22:26', '2025-06-09 23:22:43'),
(28, 33, 47, 'approved', '2025-06-09 23:34:39', '2025-06-09 23:29:24', '2025-06-09 23:29:39');

-- --------------------------------------------------------

--
-- Table structure for table `medical_requests`
--

CREATE TABLE `medical_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

CREATE TABLE `medicines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `price` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medicines`
--

INSERT INTO `medicines` (`id`, `name`, `unit`, `price`, `created_at`, `updated_at`) VALUES
(3, 'paracetamol', '500gr', 10000, '2025-03-12 14:15:41', '2025-03-12 14:15:41');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_12_11_143421_create_polies_table', 1),
(5, '2024_12_11_143505_create_schedules_table', 1),
(7, '2024_12_11_144404_create_checkups_table', 1),
(15, '2024_12_11_144055_create_medicines_table', 2),
(16, '2024_12_11_145920_create_details_table', 2),
(17, '2024_12_29_035022_create_personal_access_tokens_table', 2),
(18, '2025_02_25_042653_create_medical_requests_table', 2),
(19, '2025_02_25_080123_create_medical_access_requests_table', 2),
(20, '2025_02_25_081225_create_access_requests_table', 2),
(22, '2025_03_08_195106_add_expires_at_to_medical_access_requests', 3),
(23, '2025_03_10_112358_add_birth_date_to_users_table', 4),
(24, '2025_03_10_123305_add_blood_type_to_users_table', 5),
(25, '2025_03_10_123613_make_id_number_nullable', 6),
(26, '2025_03_10_133727_add_diagnosis_to_checkups', 7);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `polies`
--

CREATE TABLE `polies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `polies`
--

INSERT INTO `polies` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Poli Gigi', 'Keluhan Gigi dan Mulut', '2025-02-24 14:19:14', '2025-03-08 04:06:13');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `poly_id` bigint(20) UNSIGNED NOT NULL,
  `day` varchar(255) NOT NULL,
  `start` time NOT NULL,
  `finish` time NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `user_id`, `poly_id`, `day`, `start`, `finish`, `status`, `created_at`, `updated_at`) VALUES
(9, 33, 1, 'monday', '10:00:00', '17:00:00', 1, '2025-05-22 23:06:07', '2025-06-09 23:28:58'),
(10, 34, 1, 'tuesday', '10:00:00', '17:00:00', 1, '2025-05-22 23:09:43', '2025-05-22 23:09:46');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0eivpjOgjoKWklud9U8CTErrmkV8vg7demw6UYY5', NULL, '216.144.248.30', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicnJjN0FuVmdKNDlOUmhKUW5kcnE4V2loZUNNRkcxQ2w4UEs2Rks4VCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749547785),
('1D08IlU4OJc8ZkTbuWb4JEOZUFqgr8x5iPm41owc', NULL, '84.247.154.5', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTRsYzhLSTN2bmdqTVpmQllwcGk1cUtuWnNZVFRXckxpRjAxQm9sTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vcmVrYW1lZGl4LnNpdGUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1749557754),
('1wVF0wdxeezHCKROnHQ7ezexdj3eVIJm62FI0Zvi', NULL, '216.144.248.28', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiWUpNVVp4ZkdDcWpwWGp5WTdkQnFFYjhNaVhGRTE5Y0VhbG1UZzVqQiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749559693),
('3g8iTlmbkZhud2BwA9zZzkXLgtdsyvlwyPcJvj6L', NULL, '216.144.248.30', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiaGVBVWZ5ZDlTb3FYR0dvSENaeUNvZzJ3NjZac1JiQ0t0eXJON1ZtVSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749556944),
('4nQgyMDdesRDtPu4veNqJeFsF9cPWUOeDlOyiZcG', NULL, '216.144.248.30', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNWxtdnNldTB4SGNKdXJpUjA4dlJyeFNwTkJqM0k1UGZXOXl0WktERyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749556639),
('50DugSz7kaNtkYLfdjCmz0DOTSwTYCYIW5BUfn9J', NULL, '205.210.31.107', 'Expanse, a Palo Alto Networks company, searches across the global IPv4 space multiple times per day to identify customers&#39; presences on the Internet. If you would like to be excluded from our scans, please send IP addresses/domains to: scaninfo@paloaltonetworks.com', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicG5oZlhSdmFIcVlLV0ZsWFlsWUpsR1h6RlVmbUJ1Y1FRUmhrY0w5SCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9yZWthbWVkaXguc2l0ZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1749553271),
('7iLv6PqORMfF9gozHmXx2a5vU3hVBuQhX2IpoHNL', NULL, '43.159.128.237', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiazVta282b0FpN0pRSFFpaGhTMllObG5FNTJZSkhZNEprZDhpMkVGYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly93d3cucmVrYW1lZGl4LnNpdGUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1749558745),
('81WrqBSPhar4UtRKTc7uztJh6d3kNdwAUdsswpvI', NULL, '175.45.186.196', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQzNWMEhrREF4dDk4NmJLQ1Q2WEtzczdBdnFsQWo4UmJ0ZlJNaUNsTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vcmVrYW1lZGl4LnNpdGUvcmVnaXN0ZXIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1749547465),
('88twnvJArxLJJ1Y9Cnk4z9pTNyS9WGC0bqTvWcXW', NULL, '216.144.248.29', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoic09IOVN4T010S0JvOHFHbUNNV3ZZTkxLaXhxTFBPeDBQclUxaDVIVSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749552977),
('8d3RDIILP7wj7uFCQBq9bVwLzyX0nCrStW0cMp1R', NULL, '216.144.248.19', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRXhUNzhBMms3TUU5Y0JZVFlId0lqMjFqMmpzU1JGVUNkUGJHd0tIMyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749563664),
('9DffdjWy9CGVwuzW2M2QXYtgdYgltDTc8e2hNApP', NULL, '216.144.248.18', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiT3gxUE1NaDJSaTAxc3NvSGg1aVRzRmJSWUV6WlJDb01TN0pRSEhyTyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749549312),
('9mrZgegUdjt7mKpM9pncajAXk9uMC8JCY2flavWA', NULL, '139.155.139.22', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEFhMkw5c2loNno4eU5LUE9ncE15cnY0YUprOTZ6eGlkVmNqOFdDZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9yZWthbWVkaXguc2l0ZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1749541908),
('9n926XkyizmZaBhx7fCESuBmNmafuaVTMS7dzZpx', NULL, '216.144.248.19', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVUVTbzNJQ2pBdHpxQTZxcTVzSHZvQldGZTlobnNQWTlKU0VEUTdYNCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749557251),
('9Q9l6vqcuPayXP9clBW46KeXZlmHFdInZ29xPucM', NULL, '216.144.248.27', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNngyZ0xnYVlwSEFDMHJmUEc3ajZqS3dVUDFYbDNWMjllT1g5MHFjTyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749543815),
('ARMjfBnQ3FNWxTLOvM6NEMeIxLqn8TOeXjZNyrPA', NULL, '216.144.248.28', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidHZLa01TZVlXN052eFZMY3hQQkNhZFh1OXFmbTNJbTh5MzhGR1lFVCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749555722),
('b0MGNLDwK4B7TFOMg9FimdhPRuJ1mxclnG5LwcKq', NULL, '216.144.248.21', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMFJWanA1SkRHd0lDRm9QYkdMbEhXekZXb0ZSVEpjcXJjWjYwQ05pRiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749541981),
('BbkFx31aAisGBXedcR525hKZYiBiSfbxxp5sasF8', NULL, '217.113.194.207', 'Mozilla/5.0 (compatible; Barkrowler/0.9; +https://babbar.tech/crawler)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiREtIVXAxZUNVVjVweFB1NEtzaWlteXRkeGN1V3d6cjJHZEllTlRIbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vcmVrYW1lZGl4LnNpdGUvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1749543409),
('BFq9RagelbuLShEAyKH5cWckEiyBqjYyfIixvjV7', NULL, '216.144.248.21', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNnR5Y1cxQklLMjVpVnF5Q09YdlAxNlNMUDVIellpVWR3MENGMURZNyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749562441),
('C7HQCPhJzN7CeBgYadIcj8oH7axvMJFPAuFr4Tg0', NULL, '69.162.124.238', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYlVFUU54UWxuakJaUW9CZTNlRzg5M2VCQmxuMnhJR0UyVWRXQVhnYyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749541674),
('cABYL4hVMirvN2ttVUD6LPAa30HgQWCZgbrWLx7k', NULL, '216.144.248.27', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYXk1cU43YUdDbmh2TXlIbFB0SmNKN254Y0Nobml3R0hnQTkycU9SOSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749548089),
('Ced2xsLTYbVqWM32jnBGOWvhsqlFeUyYGn36AF6D', NULL, '216.144.248.23', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoieDhPcjI1SW1CclZKNzdFQUt6WXpCZmU4WDV2c05iTDJQcGFxdFJpViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749563359),
('CMWifSJD6Kdxefq2AGf5uH0zwnkXxHAoqmqpxDvO', NULL, '69.162.124.235', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYmRBRlRlc3daMFcwRFBxa0psTHR4ZHJkeDhxc0RLODZUbFo0RG14TCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749553281),
('deMsgk8df0PGfySmiBxcPQhgjXVfL2hj3ynANTti', NULL, '216.144.248.21', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidVZqWnpBbks3b0xzaFB0aDZnaWc4WGplZXd1Q2Y5RTNxUGhZSUFKayI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749545036),
('DNhUYPxGCrr1UqGdpB48IuoLiUo2eZOuRzwU3yE9', NULL, '216.144.248.26', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoibGtVelJXcHA0MGQwejZqaktxN2xmOVl1ZXV3RXR2STk5Q2N2d3dFTyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749545341),
('DPjO70UGI6ItUroTUY1HLGtICZyHJzNZkuVwe753', NULL, '216.144.248.19', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoienlhTndsNVptTEdxcERndURhRUpJbXBXQ0x3dzFXanNCOVRDVjVoSSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749541369),
('em1m3CufeUmdOFqbmPZftxfch4NHZ3gzj8cV5OOT', NULL, '217.113.194.207', 'Mozilla/5.0 (compatible; Barkrowler/0.9; +https://babbar.tech/crawler)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicVYxNDNjYnY4aE9tYUFCREkzOGdUS2UwSklZdnQzZWJwY3BVNlUyWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vcmVrYW1lZGl4LnNpdGUvZG9jdG9ycyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1749543441),
('Ent9WdEm3lRrKW9hNRj7kLNmCihrJmTbMSpnpYfr', NULL, '216.144.248.23', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZGtqbGJrVWFwNU1QNUgzUVVwZEtMOGZqTnJaVDNrQWc2aG1IQlVyNyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749554502),
('FclEGw7NaroY1Tj2DgmHO6OH4d9MIMWg1iULyeYk', NULL, '216.144.248.21', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoic1BmM05IZVZGWDliM01pZ2VURVNWMlM0a1BCV0FudVJwME9yZ0ZaMSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749561830),
('FCpedv9DFa5qx8F84kurgqvZGUGNr88tA4IjDXWF', NULL, '216.144.248.28', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZnN6cENFVHkwZ1dyeW1nMUIwSW5tRHJVeUlEWjlxQTJEUGh1VTZVcSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749561525),
('FjRnUWKWeGQ52FqjhkAiYykl6WLl4ZNpdI1ynnXr', NULL, '216.144.248.27', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRUxRR2V4SnpvMWY0UVpjTVpsQjFTdDRUMWtJd0lJckV3VHhJM1RqNCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749544423),
('fK9H5cuvaCWvmEbIneNIvgnsGBoW1X954q06MqAQ', NULL, '216.144.248.29', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVElLU1VqVWdvbVp1T2paZHlhVHl3S0FnZzRadlRVNXFNOVU4cllWdiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749552671),
('flw9cKc1ys2wLrZUN0JBfZp0BJ6gAFhkSvXD8kXK', NULL, '5.104.81.235', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVEhpVlN0SlJudGc0YWZURTRUSEpaeGh4TDlDaWlRUkt2TUtmWnZHNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vcmVrYW1lZGl4LnNpdGUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1749554150),
('fLzPEawgv69Abfpqm6FbuuaIj4jT7CyOWuEAJU0v', NULL, '176.53.223.210', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiencyd1k0TjVnYm9sekRLZE82cEQxR2dLMm5SeHVYMDdFOUJJRXlqSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9yZWthbWVkaXguc2l0ZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1749562145),
('Foeci5Hg16oEChyewembIMGVTax7JFlwdNAjl1lF', NULL, '183.134.59.131', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_3; ca-es) AppleWebKit/533.16 (KHTML, like Gecko) Version/5.0 Safari/533.16', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS2psNHA5SDNGS0xydXFoeUY4ZFcwb1FMOUJLbTBwNFo0SWhCaGI0NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9yZWthbWVkaXguc2l0ZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1749555722),
('FsTjUMFdn7zqZs9yG8agFJCGtQd0PnveKlC7l7gg', NULL, '216.144.248.21', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMThMbTFhMkRLUk1rcFFBRVdIdG5IVDF2TnVMeE55TGxKRGhJRk5oVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749560914),
('FxezgYJyYAtJHDld2AnB76x4yNIjuqLU6kV5gSaL', NULL, '85.208.96.209', 'Mozilla/5.0 (compatible; SemrushBot/7~bl; +http://www.semrush.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHNSTGxaYk44TlpyWjRJbHlEaHYzeURlbUpRUUI5NVRRS0ZVUFRMUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vcmVrYW1lZGl4LnNpdGUvYWJvdXQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1749552247),
('FzWoksxOfg9HekVNdWtzuc5pMpIqiua66bHDARO8', NULL, '216.144.248.25', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiaVVuUndVa2UzbGI4cTd0TnVMRzNwMEhOcWxBd3E4ZjJPVVVaV1dkRCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749552365),
('gkjlbEWR0GYSiJIv3iJ1DIGFW9g0Nnz0G3ZCVZ6J', NULL, '216.144.248.21', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiWFBCbmlvRVkydlZNOW54WjBpbVFwNGRZRUdZU091TWNIZHBnd1JjTSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749548395),
('h7jW2fXhqxyDUbAGXMRMLfpYiIkfn2RepSnRjMYB', NULL, '216.144.248.21', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUmI0QWVFT3FSZVpZMktDT3RzbTU2UGx2NjhKdFBuNjBlUG4weXE4cSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749540453),
('itdamB8CsIJ5f7c333gMMlat37tzea0UKBdMBvji', NULL, '216.144.248.22', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZ2I5d0lNaFZHTjFrbFR6V0E4NjVLRnZQek1UU0EzbmRsN0hBN05nQyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749542287),
('IW8pGxcTHBlMSm2u3tIfZDXsaPxo8pcPb6GZ2uZr', NULL, '216.144.248.28', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVFdkUnFxdkcwT0hJOGtBd0d5cG1PcENiV3FueERQWjlaNDUzUms1VyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749546260),
('Jg7UjayIWRbY52wVQc5vDWVjwcqHQM1NQxa5ONzo', NULL, '154.54.249.215', 'Mozilla/5.0 (compatible; Barkrowler/0.9; +https://babbar.tech/crawler)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNmtJWHlLeHpDUE9iVjFiTnhhNkR3Y29xcXhhTmFTdmIybFBDRkxGWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vcmVrYW1lZGl4LnNpdGUvc2VydmljZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1749543425),
('Ji0NOGSU1398SzCkLhhSaW8GYGdsRU0wptDwxxhS', NULL, '125.94.144.102', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYU5QZWVWQVV5RDRCVm9QZnRCSXB5WTFOSjZVdkxvSWhkMjMwWkgySSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly93d3cucmVrYW1lZGl4LnNpdGUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1749552775),
('jLgqfNCGezUslrO4T4nfUw89D4XSR2YJaIJdzudx', NULL, '69.162.124.238', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMnJOWlZDTHpMQ0RCeGhGN1RLc0QwMVplalo3bTVHbFg1V09vS0lPdyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749551451),
('jpC85kufzoHpGJvwywbSKVL1bEEWm5VijmO6FnpM', NULL, '216.144.248.25', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNFVmaVZmOEh0N1JtZW1oU21RUVZRUElia01EbFZBc1dzYnVqTnNxWSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749552061),
('jxSFFEtcNu3NluFgVcFRNJj1yB7k5DOTXQMpaMBz', NULL, '216.144.248.27', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicDdKTUE1VzJHS3N2eGdaRVRmY3NYWEVFZWM5OEM1cHFYUXpDVHNXOSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749560304),
('k4ga5Rbx6bFp8GY57RL9dRBTMjyK4ZmVfwummRyT', NULL, '216.144.248.25', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicDlvdExnRFg0V3U2bGE4bnVhZUhEQVRWbXExZGxLR2pkUFJ4Vm9wVCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749559083),
('K7arkjUWWceGsZzEU4uIdjpEIeZhLjhOtF5NR1Lz', NULL, '216.144.248.18', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiU2V3ekR2ckRoVGF1RXQzTFQwaDdabHNTT3RNSGhnYXF4QVV3a2F0VyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749548702),
('KbvURgLMi2RHHtcnphNJkaQXI9rX91tL33fIfj58', NULL, '216.144.248.25', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoibFRyVjBFNUdYVVU5b0tSNHZBVUtSa2tsMTFuYXBXeVJqYXVqMG5DZiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749545952),
('kKZJGHC3wOPYmO79YTFLtVPS1RmSqQi0Q6BtjmCA', NULL, '216.144.248.22', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiR2YxRVhmVDVzdms1S3RteVRKdEhPZGtoTDdrQjBjbkphQ2J5RzhRaSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749549924),
('kllOcsIdngqsNueBcgrIFo21lfLa3eYV2Hkh9PsU', NULL, '185.177.72.113', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSlZZRHVnSnA3SXViUWZXeUM3V3RTNkVhaU9TMFBDQ1A4T2VFT2UxdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9tYWlsLnJla2FtZWRpeC5zaXRlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749557699),
('KR2Q5pslpJ75V5Hwyh1KHUiiKA2q4lEmk7AGOrle', NULL, '216.144.248.19', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicTFrajJ3RnBpUXBTampnTGY1NlBYUXN0SmRWbDJtRUVJSDBZWk00ZyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749547481),
('kuAZiMsSGMzVJuboY8vQBfiCedFUIjqLNdoVSFPz', NULL, '216.144.248.18', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZUFJMWpEaUgwNTVEU1E3VVEwVGNCRzhwMzVVZG5VZmJVaVZVVW8zZyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749541063),
('KUv2EhgXX6dcMrgC2pBWLKwboeABhBjZU0jUYgOF', NULL, '216.144.248.30', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoibU94U2FLZWVDTXNvRThMdDN5WFplMEdSb2NpcFUwUTAwNXZvS2dnUCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749551145),
('kvJzLSAooVxJZiTWBPWxNXgBrbK5wQjks43RE418', NULL, '191.96.252.58', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 12.5; rv:114.0) Gecko/20100101 Firefox/114.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZkFYZko5WFhEakJaV2c1OXBNSDh6TndsanlpdVNLcUdIcnZBMDZ6YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9yZWthbWVkaXguc2l0ZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1749540093),
('l2Jub2tMzVBpmTDjlOwMAV1htsgbpbKOnFoMY4vM', NULL, '69.162.124.238', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVVlWa29QbU9rd25rMmxBaGUwa0xTOVJySG9yYWM0dGV1U2xOVDlZcyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749550839),
('lfmJf8hm4agJDc4ziPSVJMCRqmGPA8yuWcWbcaof', NULL, '216.144.248.30', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMnk2ZXBmVFNZcTVvMzFHTG5pbU9pY0kySTBYZ2FsSXNEeTB6TXNvVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749547177),
('LOSNaHRccmpkB9xmy2vQeMIkbJbemQ1SaXreAm9Z', NULL, '84.247.154.4', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicjU5bXBwR2hZUlJReUxBdnVZV0JhZlN5ZGx4bU9RWjJ3Z2xneDkybSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vcmVrYW1lZGl4LnNpdGUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1749550563),
('lQs5o4CoeYQJDBBSEERQ20UIUAQnUfaO3MO9bQLf', NULL, '69.162.124.238', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidEZGSGFIVzhyY3QwRHNaZVluUjRPTHZpVjljVmZVeUhoQnN1SjBtVSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749555110),
('M1pjSqBSa8XiRwFkQxBPGlKR0amSj9sYcnYy0WGI', NULL, '69.162.124.227', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiaWFqQmdKQm5hVHNVZDJmRjFjdGkyb1plazNtQzJBWEtIMWRGdU5BQyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749559998),
('MhDRpuWWFBtwk24hQUdBi78glMODVWcLGUSw3naR', NULL, '5.104.85.13', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0g1ejc4eVZzRjRJYWpJYXZ6bEpkNWExd29IUnN5SDRmbUh5dVYzRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vcmVrYW1lZGl4LnNpdGUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1749543355),
('NPKk9RAdprErjI4ewQZ0Xgj0mtdS4xQ5m3R0Y5Ki', NULL, '216.144.248.22', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoid0N6YlA0SHlaamtucGdnUnZydk5lMTl6TnBocmJwRU5WOTVnNWF0UyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749558777),
('O8pKYkZelvIHr1jJ8JMBcyUSfy85f8BsGhS1Z4SF', NULL, '216.144.248.19', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYU9lQUZxRTBLVWVlS0sxZ014MWJmV3o3NlliQ3lCREZhSUhieXF6dSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749544728),
('P77eMM3bd9f147uk3DHBt5oUhD7zRGkEgIUVA3B9', NULL, '69.162.124.238', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiU1U2OFVvaVNLMUd2VE9kalBlZWZpaVAzVXc5SGdST3JWM1pnM3R6cyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749560610),
('qvEGw47NANYXdtg2z8cfNGmKpbi1BnNFOrSzjQq4', NULL, '216.144.248.29', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZ3VxOWFDZUxsYk5FM2pPNHBiR09qSnROWFVLNmZmTUZ3TU5TamtFYSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749546870),
('RdL1Pih1MvszHx2b2UIWktdoEZjlVRdlH5ixP1MP', NULL, '216.144.248.29', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidWNWQVJFZUQyZ0JmWlY2WDV2ek5yeFhzSWhXUXFXZTBma3hmZFJMViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749558165),
('RMu5AyOAJ5sTKznM5WLGNC6NW6Pjck3bSQHlnZVH', NULL, '217.113.194.211', 'Mozilla/5.0 (compatible; Barkrowler/0.9; +https://babbar.tech/crawler)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1VQMGlteWZrTGRmZ1o0U0xPVEFFTnpSQ3d2OGgzeW56WnE3YjdwTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vcmVrYW1lZGl4LnNpdGUvYWJvdXQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1749543393),
('RoFkLM55FgTsucMss1uzmzdZOEnFVksScdR6mQW2', NULL, '69.162.124.235', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiQjZhdVdVSGpPRGlRYnlHUXNPT0VZYzZBbHhwMlZ3UTBYV29lVjNIUiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749544119),
('RsTV32iN4cJ8HOZT5qN246MNq2H8b9htM6Y6gvBM', NULL, '157.230.184.96', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVnlpVWZIS0hNSXVYdUl2eXdmdEo4aHltMlZ6ZGQwd3NOZUpFSHJYciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHBzOi8vd3d3LnJla2FtZWRpeC5zaXRlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749547827),
('s34dlghri6kTu65LRIOLFxhu9VHJ8emcnZ2zR0Ab', NULL, '69.162.124.235', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSG41OEpXYWVFeTZ2NkhZV0s0ZWxPcWhwM3hMMG9YRmsxWmZneWtYcSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749540149),
('SC04w1RQxVX1VSUJyWqNih2gEcY09mZD8FODfiNF', NULL, '69.162.124.227', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVm1kakJLUUsweG5XRjFBNmk0aGFjT25nYzZtVFdRcjRuY2N4SmRyRyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749542898),
('snI0d18Yq8DN2cyCM0El2tbYdK8yEhcxU8L6no80', NULL, '216.144.248.29', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicUJkSk16ZHhzVTViTGdhb05hVzczU1VZOG5yeXp3aWUxMjVONWtjNCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749557555),
('tNcbVEivOoFzeavjiq0Q8cVbV2ntdXxQxXPoiRBf', NULL, '106.119.167.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVIycHZUOE5VN3lRcjFrVkxQSjRGTlNRTmh3aXd2RUJUelRjTWQxZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9yZWthbWVkaXguc2l0ZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1749564092),
('tpbw05Bovwby4QC0SgHqqN2Y6g2hX3ZP6rdKjMaL', NULL, '216.144.248.18', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiM0RVdUhHWnR6U29zUlJiWDJKTDV6cEpQajNpOHloY1BYMGR5OHRuZiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749543203),
('TrgAy7QPhvQsFfZ5ebCaahzhRfwqsjqzn6bCZ0GY', NULL, '216.144.248.30', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiek81V1BYUFNKTmkyWHFYQWlJVmZDWWdyZ0hZUzgzeUJ4RjJBMEhIRiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749562135),
('UqQx6O7COeSp5vEssoVl9fRD6QTvREgdb0TLZELw', NULL, '216.245.221.83', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiaFZGczFHU1NrbTd2VkY5T1N6VjVnOGxaSFlPUURWamhEUjJvb1dlRyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749543508),
('uyMxhMrKddjSVECkHwMLEhPgE9TUqrGSjWmUJivd', NULL, '216.144.248.26', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiQ1Z1VjlrY3hDbDl6Z1o3aWRaWnJNeUtPa1FodU1lN08yNGZEQ3BKQyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749556027),
('VPQ6qCRLrOvKRU2Xo8Qg6tO19qXPbgr7L4a7kfDQ', NULL, '157.230.184.96', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXNpUlpnUExsclB0OXlSZ0N4YmN3QkVVelU2NmRwc3o1cHVlZXlyRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly93d3cucmVrYW1lZGl4LnNpdGUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1749547825),
('vtE0NqQjBRTjZ7JeymoNTIgg8wBvu6MeiJDR6DAO', NULL, '69.162.124.235', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoid3l2dktJYUpleHNFZzVKWEt1S0dMMEE3aFJ4UWlUUThaQVhrdzhkdCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749549006),
('vVy8gmYYRlTVGiLfizlE48THxQ1hoiZ89QPUydQ3', NULL, '216.144.248.25', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiQWdWREVBZE1yTFIzUFdrNWYzeFViZk1qcEo3blRVOXF0V0U3S3ROeiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749550227),
('w0VfeE3hPpBDXZNIsOKQeL8D3Dboyies3x0DM8sI', NULL, '216.144.248.28', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidVpnRFczbGpjQk45M2xCYk5VaEZZYjZFbVRtTU5INWdyR3lyZ0VpYSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749556331),
('x25qzLaAWpTETL6PMEkYBtAslUtr8cebOYFqed0l', NULL, '216.144.248.19', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUmljRzlzcGx5Nk5SaU12ZURoQTFkWkV3YzhPYTlEcDBVQ0o1dDZnNSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749546564),
('X4nawMQJXHXJO7ueOfRDR5xGg8kYdsIxoy8KUK5i', NULL, '216.245.221.83', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYVdBNWxsb0hJemlkS0VBTG10TEoxY2ZZU05HT3dpemJyVzZBUjBIOSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749558471),
('Xfpxcbfo54MOKvdNWhP6nqypJ0VE1woRcNNuC35G', NULL, '114.10.151.217', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib1l1YXNsR2ZvdUpCaHM5d1p6aGxuZzBrSE5uN082WDUxS2Q1ZG1xSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vcmVrYW1lZGl4LnNpdGUvcmVnaXN0ZXIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1749547515),
('XN12IiIG4Y6Z7iWl89cXNhSYS26EvAsAsXsf0sRh', NULL, '216.144.248.26', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiWnY3YlJUVnA3Y2k4ZzBqbU1QTW9DNG9QeWtTN0RRQ3lPdVFFWkM3VCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749553893),
('XQ84ehoqpKlebh2KSuHKjvfOMuh3UFbeyHmqN1U2', NULL, '84.247.154.4', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidHo3SjFVRmFCaXlkalBOanltZExkNmFESk5YMWgxUFhsalM1RWM2cyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vcmVrYW1lZGl4LnNpdGUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1749546957),
('XRC7tiMIYy4EtPfOUYAD33eVEVYWgI2MUgNmmsGF', NULL, '216.144.248.18', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiS2NBcGRNM1NzQWZXSXZNRUM3ZlJzbVlnSHJ2bHhWUE1nMVdveTZlayI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749550534),
('XsGRJsDm8UJB1tOtcweihiMd6hRbj2IbBS4lkmsy', NULL, '216.144.248.19', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicXNTSmw1eFlqOTRodFp2NnJ2eHFlQWZhVTV0RlZCODBDeDJkczM5WCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749563052),
('xteA68rTSCdrr76I5t0FfWjL0ymMRJeUWRPdaIwf', NULL, '216.144.248.18', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVDZKejRsTDAyazhQaEZ2WEI4WW5YMVJuN0pYcFRxNjFQZlBOaFExQyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749559388),
('y3DYzcFupUGDtXvxFueTpNf4hHtim4NfgTzg8Lfz', NULL, '216.144.248.21', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiaTgzMndMTnVWWlJIbHg3OFl6NEpPOFJxRk11ZlhPa2dzeGVNVE5wWCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749551756),
('y6IfyE06yCqRVT72atoQ54legj7VooXz9TsFADqp', NULL, '216.144.248.30', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidmY3aVl4OFhPUTc1ZVJUWHk0cjNBYjFld3dvWDY1cDZkQmZYb0hMdyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749557859),
('yHp6yqWBjksiDvZsfo3Ewg28hzKFtKNdbmhmcs6O', NULL, '49.51.233.95', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaURjemt0WURGeWtVT0FieGZqUXluRGs3R25PRVFQUkc2UEFBZlVQSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9yZWthbWVkaXguc2l0ZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1749547106),
('yQEKDWvqLvTd00joR0C8dykrNXFoXrGieQ50c9uH', NULL, '216.144.248.28', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZUgxRlJSbUJYZEtzQmNTR1JrYzZOYWhkMmF3cmYyT2xkd3VkNUZoaiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749545648),
('yvHlzDVq1q4KxjWzHrB6m1ew0yeIrYVh8eHCsJFe', NULL, '216.144.248.28', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiV2hOTDZSazNnQTNTakh3aXROT0R3cEJiTkNIYUhOTlZ0ekFkR0xRViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749542591),
('Z16AuRKmmovi5XmXAQsMOOkTqBwY5XDf78eOCu7C', NULL, '69.162.124.238', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiTWlkZEQ2TlhuZmlOYWljUjlUR1BGWHJ6YktEU0FUMVFEc01mVzNPSiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749563971),
('z1W1f5TcmGi2dsCcIQal3lTfojXI6Oomno6Eqfby', NULL, '216.144.248.27', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiR3p3aVpKa1AzdVNZSU0ybDlRb1RnMHNHZDJ5U3dkSGNmeUtNaGxtOCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749553588),
('Z69DSbR0s9bkPqPC3p8BK9YZ4GVexnz9wWjwEKwO', NULL, '2602:80d:1006::35', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicVF5cDdpWjAzV095enV6TDFjcEhWMnNPUmp0UGZHM210UHVXRXRaayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vWzIwMDE6ZGYwOjI3YjoyOjo5OmMzNGVdIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749544741),
('zaXf1rL4gGrZ8GvHiLg8cIvNrTKdZusOiclIRvv7', NULL, '216.144.248.30', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiQ2FEZmJpZHpGRW1lZDNxdDJDbmpORkhMY1M5dWQ2N1BDb3dwcTFQbSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749554806),
('zkRefawARmzcxA0AE4a6n87PFp0auEnZ08V9koa2', NULL, '216.144.248.28', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZlIwcXV2cllzSzNJZHVFSWp3TnF2M2Q0b2FoT2lpYVdROElOdWx4SSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749540758),
('zNGA7zXh8H9DuKEd15nY1m0UMXZS3YoIySO19QuZ', NULL, '216.144.248.19', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVTllR1ZGN0hTU1dxOFJucXlqTnlINkM3ZmxBOU1yeXEzSHNDOENVQiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749555415),
('zNHoFJsZIms9YyNOIQdp62uBtu6a1cpwHZtiP0uY', NULL, '216.144.248.30', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNkQ2TVB4M1k0QWpieTR6YUozZjlGdXE5SGNEdE5xQVhtMzg1RjRQMSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749562747),
('zNNu4ULkPqTars91latZQiUdkT3mxB0Kr0OW6c86', NULL, '216.144.248.24', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidE9wVmJDcUczMTlVdllFejFicFZmbkxKMEZNRTVZb3FWWlF1ZXBvWCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749554197),
('ZWdn5J4QjTiBBJBCCPKEmanVQUZmSfzncdgfPvl9', NULL, '69.162.124.227', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZ1FoYzBURzIyM2VSWXVuZ2ZremRsSFFwdFpyZUJiWVhjMlhmMnlvOCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749549618),
('ZwgMS03AnfpWgZxbLTK99b5LKU3I6wxQ90ntZfJx', NULL, '35.230.21.155', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUpEMjNTN2ZUUW1id21wdUZwMUd1RUJWR2dUdjdvVUVaUDZ5Q2xHQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9yZWthbWVkaXguc2l0ZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1749560800),
('zy3BPbsvAZSz6pBSmqlvfz2NZUV1kGoNEXWYNHKx', NULL, '216.144.248.28', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNWJnaXAzenFrc1dpT2huQlQ1aDJpZW9CSGQyV0kyMFJEbGlWQXhxVCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749561220),
('ZzfTzi3Lhah63d1GEdvGj87uATfDinc6hwIMPQqv', NULL, '84.247.154.5', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2lYZkNGMlBmWjBYVVpLVzZxTXdtM0pyZk9xWE5LTDV6ZXIybmdSOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHBzOi8vcmVrYW1lZGl4LnNpdGUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1749561360);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `blood_type` varchar(255) DEFAULT NULL,
  `id_number` varchar(255) DEFAULT NULL,
  `rm` varchar(255) DEFAULT NULL,
  `role` enum('patient','pharmacist','doctor','admin') NOT NULL DEFAULT 'patient',
  `address` text NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `birth_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `blood_type`, `id_number`, `rm`, `role`, `address`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `birth_date`) VALUES
(1, 'admin', 'admin@gmail.com', '082158863345', NULL, '3326132010000001', NULL, 'admin', 'semarang', NULL, '$2y$12$ugtXeTgKy25KeRCcqk/QmOyRT9dwX3AzZVhzmDKGaJZB1wVmMzody', NULL, '2025-02-24 14:17:00', '2025-02-24 14:17:00', NULL),
(33, 'Dokter 1', 'dokter1@gmail.com', '0853290827280', 'B', NULL, NULL, 'doctor', 'kramat', NULL, '$2y$12$pAyTrJAvgkeGcUDI4fzmj.ygMdnhfcLuYil3.yHHZHRNQPihE6o1i', NULL, '2025-05-22 23:03:41', '2025-05-22 23:03:41', '2002-02-08'),
(34, 'Dokter 2', 'dokter2@gmail.com', '081297047677', 'A', NULL, NULL, 'doctor', 'jl raya kramat no 19 desa kramat\r\nkembaran', NULL, '$2y$12$77ss/tgcwRjlXlKmeDmNded9RAiXFsHbFZwL8ZiVTpmIo5ImeVuIO', NULL, '2025-05-22 23:04:29', '2025-05-22 23:04:29', '2003-12-28'),
(35, 'Amanda', '20080723@example.com', '081297047677', 'O', NULL, '202505-001', 'patient', 'jl raya kramat no 19 desa kramat', NULL, '$2y$12$e2rRNak2sOlaHE9Iw2Sgo.q/OysTEbMz9vf0duHEXb.iBeGV8UUhK', NULL, '2025-05-22 23:05:19', '2025-05-22 23:05:19', '2008-07-23'),
(36, 'shelvia', '20031026@example.com', '085606298983', 'O', NULL, '202505-002', 'patient', 'Purwokerto', NULL, '$2y$12$5JptnD4BSlmjrb1js1zIneaktgagQxjW1uQGcJuuYN0orZbAfC.bu', NULL, '2025-05-31 16:50:48', '2025-05-31 16:50:48', '2003-10-26'),
(38, 'putri', '20030508@example.com', '0895617949800', 'B', NULL, '202506-004', 'patient', 'pwt', NULL, '$2y$12$K9pmluuIn8R2ZcRbti/f2ezAlqIUwubkx6qa9cCtEYLLu1oiKIsdW', NULL, '2025-05-31 21:02:22', '2025-05-31 21:02:22', '2003-05-08'),
(45, 'Pasien1', '20031228@example.com', '081353748392', 'A', NULL, '202506-004', 'patient', 'Purwokerto', NULL, '$2y$12$iw1FDMUSrQA8UsQbo2vmtOE4oEkRvNBzaAn5Cn89eE9L6tZ8XxOSC', NULL, '2025-06-09 23:17:24', '2025-06-09 23:17:24', '2003-12-28'),
(46, 'Pasien2', '20030208@example.com', '0853290827280', 'A', NULL, '202506-005', 'patient', 'jl.raya kramat no2 rt04/01 desa kramat, kec kembaran, kab banyumas, jawa tengah', NULL, '$2y$12$YBJiGal7IfTP4pOi9jC5jOrpQCBFLdRwf.WSo9LIVi2P/XDyHXrc2', NULL, '2025-06-09 23:21:15', '2025-06-09 23:21:15', '2003-02-08'),
(47, 'Pasien3', '20020202@example.com', '081297047655', 'A', NULL, '202506-006', 'patient', 'Purwokerto', NULL, '$2y$12$THgKamngm0j58Wac9gGm.OehYw.m2U.wJRLJ8Vbu/ZZ.eP5J4oGq2', NULL, '2025-06-09 23:27:40', '2025-06-09 23:27:40', '2002-02-02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_requests`
--
ALTER TABLE `access_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `access_requests_patient_id_foreign` (`patient_id`),
  ADD KEY `access_requests_doctor_id_foreign` (`doctor_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `checkups`
--
ALTER TABLE `checkups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `checkups_user_id_foreign` (`user_id`),
  ADD KEY `checkups_schedule_id_foreign` (`schedule_id`);

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `details_checkup_id_foreign` (`checkup_id`),
  ADD KEY `details_medicine_id_foreign` (`medicine_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medical_access_requests`
--
ALTER TABLE `medical_access_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medical_access_requests_doctor_id_foreign` (`doctor_id`),
  ADD KEY `medical_access_requests_patient_id_foreign` (`patient_id`);

--
-- Indexes for table `medical_requests`
--
ALTER TABLE `medical_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medical_requests_doctor_id_foreign` (`doctor_id`),
  ADD KEY `medical_requests_patient_id_foreign` (`patient_id`);

--
-- Indexes for table `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `polies`
--
ALTER TABLE `polies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedules_user_id_foreign` (`user_id`),
  ADD KEY `schedules_poly_id_foreign` (`poly_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_requests`
--
ALTER TABLE `access_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `checkups`
--
ALTER TABLE `checkups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medical_access_requests`
--
ALTER TABLE `medical_access_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `medical_requests`
--
ALTER TABLE `medical_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicines`
--
ALTER TABLE `medicines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `polies`
--
ALTER TABLE `polies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `access_requests`
--
ALTER TABLE `access_requests`
  ADD CONSTRAINT `access_requests_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `access_requests_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `checkups`
--
ALTER TABLE `checkups`
  ADD CONSTRAINT `checkups_schedule_id_foreign` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`),
  ADD CONSTRAINT `checkups_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `details`
--
ALTER TABLE `details`
  ADD CONSTRAINT `details_checkup_id_foreign` FOREIGN KEY (`checkup_id`) REFERENCES `checkups` (`id`),
  ADD CONSTRAINT `details_medicine_id_foreign` FOREIGN KEY (`medicine_id`) REFERENCES `medicines` (`id`);

--
-- Constraints for table `medical_access_requests`
--
ALTER TABLE `medical_access_requests`
  ADD CONSTRAINT `medical_access_requests_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `medical_access_requests_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `medical_requests`
--
ALTER TABLE `medical_requests`
  ADD CONSTRAINT `medical_requests_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `medical_requests_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_poly_id_foreign` FOREIGN KEY (`poly_id`) REFERENCES `polies` (`id`),
  ADD CONSTRAINT `schedules_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
