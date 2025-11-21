-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2025 at 10:05 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `image_analysis`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_accountuser`
--

CREATE TABLE `accounts_accountuser` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_accountuser`
--

INSERT INTO `accounts_accountuser` (`id`, `password`, `last_login`, `is_superuser`, `full_name`, `email`, `is_active`, `is_staff`) VALUES
(1, 'pbkdf2_sha256$600000$trLpMUNLGthPRIAzQPfCl6$UH6WUoDbVvEGC246NJZdhrhHBk7ZaT53vTqEDN8YHg4=', '2025-11-20 15:37:43.424565', 0, 'tast', 'tast@gmail.com', 1, 0),
(3, 'pbkdf2_sha256$600000$IT2MXR1WpXpVMC6J1zPGWI$82L/0aXjXSIJitcxcTZrEIG1mnP0eOid4LBghdMcDxo=', '2025-11-21 07:45:41.256812', 0, 'test test', 'test@gmail.com', 1, 0),
(4, 'pbkdf2_sha256$600000$T7QIKQ8Ss7KxTKX6ESMDI8$Y/P1Cpa/mYLhnBhP3taB2h13ZFEKMkwLMsW+uX8TOTQ=', '2025-11-21 08:16:07.502088', 0, 'hasan korim', 'hasan@gmail.com', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_accountuser_groups`
--

CREATE TABLE `accounts_accountuser_groups` (
  `id` int(11) NOT NULL,
  `accountuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_accountuser_user_permissions`
--

CREATE TABLE `accounts_accountuser_user_permissions` (
  `id` int(11) NOT NULL,
  `accountuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add Blacklisted Token', 6, 'add_blacklistedtoken'),
(22, 'Can change Blacklisted Token', 6, 'change_blacklistedtoken'),
(23, 'Can delete Blacklisted Token', 6, 'delete_blacklistedtoken'),
(24, 'Can view Blacklisted Token', 6, 'view_blacklistedtoken'),
(25, 'Can add Outstanding Token', 7, 'add_outstandingtoken'),
(26, 'Can change Outstanding Token', 7, 'change_outstandingtoken'),
(27, 'Can delete Outstanding Token', 7, 'delete_outstandingtoken'),
(28, 'Can view Outstanding Token', 7, 'view_outstandingtoken'),
(29, 'Can add account user', 8, 'add_accountuser'),
(30, 'Can change account user', 8, 'change_accountuser'),
(31, 'Can delete account user', 8, 'delete_accountuser'),
(32, 'Can view account user', 8, 'view_accountuser');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(8, 'accounts', 'accountuser'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session'),
(6, 'token_blacklist', 'blacklistedtoken'),
(7, 'token_blacklist', 'outstandingtoken');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-11-20 15:30:31.999466'),
(2, 'contenttypes', '0002_remove_content_type_name', '2025-11-20 15:30:32.043582'),
(3, 'auth', '0001_initial', '2025-11-20 15:30:32.238164'),
(4, 'auth', '0002_alter_permission_name_max_length', '2025-11-20 15:30:32.294547'),
(5, 'auth', '0003_alter_user_email_max_length', '2025-11-20 15:30:32.298806'),
(6, 'auth', '0004_alter_user_username_opts', '2025-11-20 15:30:32.302573'),
(7, 'auth', '0005_alter_user_last_login_null', '2025-11-20 15:30:32.306268'),
(8, 'auth', '0006_require_contenttypes_0002', '2025-11-20 15:30:32.307856'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2025-11-20 15:30:32.311252'),
(10, 'auth', '0008_alter_user_username_max_length', '2025-11-20 15:30:32.316201'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2025-11-20 15:30:32.320440'),
(12, 'auth', '0010_alter_group_name_max_length', '2025-11-20 15:30:32.328516'),
(13, 'auth', '0011_update_proxy_permissions', '2025-11-20 15:30:32.333566'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2025-11-20 15:30:32.337641'),
(15, 'accounts', '0001_initial', '2025-11-20 15:30:32.568905'),
(16, 'admin', '0001_initial', '2025-11-20 15:30:32.663645'),
(17, 'admin', '0002_logentry_remove_auto_add', '2025-11-20 15:30:32.669776'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2025-11-20 15:30:32.674325'),
(19, 'sessions', '0001_initial', '2025-11-20 15:30:32.696471'),
(20, 'token_blacklist', '0001_initial', '2025-11-20 15:30:32.866100'),
(21, 'token_blacklist', '0002_outstandingtoken_jti_hex', '2025-11-20 15:30:32.881774'),
(22, 'token_blacklist', '0003_auto_20171017_2007', '2025-11-20 15:30:32.891874'),
(23, 'token_blacklist', '0004_auto_20171017_2013', '2025-11-20 15:30:32.933675'),
(24, 'token_blacklist', '0005_remove_outstandingtoken_jti', '2025-11-20 15:30:32.946571'),
(25, 'token_blacklist', '0006_auto_20171017_2113', '2025-11-20 15:30:32.958562'),
(26, 'token_blacklist', '0007_auto_20171017_2214', '2025-11-20 15:30:33.462687'),
(27, 'token_blacklist', '0008_migrate_to_bigautofield', '2025-11-20 15:30:33.674989'),
(28, 'token_blacklist', '0010_fix_migrate_to_bigautofield', '2025-11-20 15:30:33.682937'),
(29, 'token_blacklist', '0011_linearizes_history', '2025-11-20 15:30:33.692265'),
(30, 'token_blacklist', '0012_alter_outstandingtoken_user', '2025-11-20 15:30:33.699015'),
(31, 'token_blacklist', '0013_alter_blacklistedtoken_options_and_more', '2025-11-20 15:30:33.706856'),
(32, 'accounts', '0002_alter_accountuser_table', '2025-11-21 08:12:40.374657');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('3gll3eh64vt29xaluyqxxz8733kenaoo', '.eJxVjDEOgzAMAP_iuYpiAiYwdu8bkB3HhbYCicBU9e8VEkO73p3uDQPv2zjsJa_DpNBDBZdfJpyeeT6EPni-Ly4t87ZO4o7Enba426L5dT3bv8HIZYQeKHXSxsbXpJ2QcZdMBUnIzEu0FDRE9VVGzMFCi5jMak8kbWRsGOHzBf8vOGQ:1vM6tw:XntzjMHfNIjnSIjzQ4nnzEavDyGgUAXN_OAqMv94OzA', '2025-12-04 15:48:52.302010');

-- --------------------------------------------------------

--
-- Table structure for table `token_blacklist_blacklistedtoken`
--

CREATE TABLE `token_blacklist_blacklistedtoken` (
  `id` bigint(20) NOT NULL,
  `blacklisted_at` datetime(6) NOT NULL,
  `token_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `token_blacklist_outstandingtoken`
--

CREATE TABLE `token_blacklist_outstandingtoken` (
  `id` bigint(20) NOT NULL,
  `token` longtext NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `jti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `token_blacklist_outstandingtoken`
--

INSERT INTO `token_blacklist_outstandingtoken` (`id`, `token`, `created_at`, `expires_at`, `user_id`, `jti`) VALUES
(1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2NDI1OTYzMiwiaWF0IjoxNzYzNjU0ODMyLCJqdGkiOiI4ZTRjYmRmNzE5MjA0MzAyOGRmZGJmMWE3MjBiZWE0NyIsInVzZXJfaWQiOiIzIn0.UxLcuFf2Mjq3cak1GK1QdZFaA-yIjfu-HmhzgnQjNA0', '2025-11-20 16:07:12.176763', '2025-11-27 16:07:12.000000', 3, '8e4cbdf7192043028dfdbf1a720bea47'),
(2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2NDI1OTY4NywiaWF0IjoxNzYzNjU0ODg3LCJqdGkiOiJiYzA4ZTdiNzBkYTc0MWY0YmIyM2VhZjc1MWJlNWRmNiIsInVzZXJfaWQiOiIzIn0.YSkHTpemzDsZfgTbAJPxs-1dg45lAen2mZNyat9-3pE', '2025-11-20 16:08:07.101912', '2025-11-27 16:08:07.000000', 3, 'bc08e7b70da741f4bb23eaf751be5df6'),
(3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2NDI1OTgwNywiaWF0IjoxNzYzNjU1MDA3LCJqdGkiOiIxYzE5ZjgyYTM1MzY0ZmVkOWE2YzA2MmMyMTlkMDdmYSIsInVzZXJfaWQiOiIzIn0.zaicMwW_W2dbm4DrKTQ8PpxklB2-nUfMMRp_DMnAVZ8', '2025-11-20 16:10:07.667040', '2025-11-27 16:10:07.000000', 3, '1c19f82a35364fed9a6c062c219d07fa'),
(4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2NDI2MDEwNSwiaWF0IjoxNzYzNjU1MzA1LCJqdGkiOiJkMGEyMDU0NzFiMDk0OTM3ODM5OGY5YTBjMGE0MGE4ZCIsInVzZXJfaWQiOiIzIn0.Mn_v4b9FtmErOzVeAR41ktAgudmD3SEsq8_qLeBDvz4', '2025-11-20 16:15:05.395553', '2025-11-27 16:15:05.000000', 3, 'd0a205471b0949378398f9a0c0a40a8d'),
(5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2NDMwMjAyMCwiaWF0IjoxNzYzNjk3MjIwLCJqdGkiOiJkZjgwMDBkM2U4MWQ0NDljYjkwZDQzNTAwODgwMWViNyIsInVzZXJfaWQiOiIzIn0.V4f1oj6iYcHnrVTWt913_Uf93j0HxmyuzjWMgEMJFw4', '2025-11-21 03:53:40.502430', '2025-11-28 03:53:40.000000', 3, 'df8000d3e81d449cb90d435008801eb7'),
(6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2NDMwMjE5MSwiaWF0IjoxNzYzNjk3MzkxLCJqdGkiOiIxZmUwYjJmYjI4MTM0Zjc5OGU0YjAwYjQxOTFmMzg4YyIsInVzZXJfaWQiOiIzIn0.mmnN7giePaFeBu1J1zB4voFlvVo-M4xFCo0GysIIPfI', '2025-11-21 03:56:31.534699', '2025-11-28 03:56:31.000000', 3, '1fe0b2fb28134f798e4b00b4191f388c'),
(7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2NDMwMjIxOSwiaWF0IjoxNzYzNjk3NDE5LCJqdGkiOiI3MWJiMGZlZjJjN2Q0ZjRiODczM2FlYTcyMDY2MTRhMiIsInVzZXJfaWQiOiIzIn0.-_CuC8D0bsJq8EWx3Tb2FuB6RVdzed2Sp5pvpxZA2p8', '2025-11-21 03:56:59.535820', '2025-11-28 03:56:59.000000', 3, '71bb0fef2c7d4f4b8733aea7206614a2'),
(8, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2NDMwMjg0MywiaWF0IjoxNzYzNjk4MDQzLCJqdGkiOiIzN2Q1NDdiNmNmMDE0NzY1OTU5NjY1ZWUxMGRjODg2ZCIsInVzZXJfaWQiOiIzIn0.aFKDG4UdCPlFdAlK1rS5fgRvRA-LIb5r7xXE6ntag5k', '2025-11-21 04:07:23.606410', '2025-11-28 04:07:23.000000', 3, '37d547b6cf014765959665ee10dc886d'),
(9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2NDMwMzA2NywiaWF0IjoxNzYzNjk4MjY3LCJqdGkiOiI1ODk1N2Q5NjRiMWQ0ZDI5ODg3MmY1NDFhMjcwMDAyYSIsInVzZXJfaWQiOiIzIn0.BNuGUZVvFDGWcZc0jKnUunzX-jk_jG7Ytyia5ViNjj8', '2025-11-21 04:11:07.002869', '2025-11-28 04:11:07.000000', 3, '58957d964b1d4d298872f541a270002a'),
(10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2NDMwMzA5OCwiaWF0IjoxNzYzNjk4Mjk4LCJqdGkiOiIxMDkxMjliMGRjMTU0MDViYjMxZjUxMDZhYjk4OGZjYSIsInVzZXJfaWQiOiIzIn0.cISIEuHuJ1w01oAKUEe7ArTe1WTPjyhZ4LR68VTA2Wk', '2025-11-21 04:11:38.107827', '2025-11-28 04:11:38.000000', 3, '109129b0dc15405bb31f5106ab988fca'),
(11, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2NDMwMzMxOCwiaWF0IjoxNzYzNjk4NTE4LCJqdGkiOiI1OGMxZTFhZmRhODc0OWE0YTI1ZmQ0YTFmMzFhOWMxMSIsInVzZXJfaWQiOiIzIn0.M5BzncMoArM6B4oDTjqQelIGVWKwhxchN-iCKFbRwUw', '2025-11-21 04:15:18.297727', '2025-11-28 04:15:18.000000', 3, '58c1e1afda8749a4a25fd4a1f31a9c11'),
(12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2NDMwMzM2MSwiaWF0IjoxNzYzNjk4NTYxLCJqdGkiOiI4OWE1MWY0NzgwYWU0MzRlYmRiOGU5Y2JjYzllYTZiZiIsInVzZXJfaWQiOiIzIn0.MoSVlVy1qalkzRF_rYqSWPKIAswXbNLzBzj_WkKRCQk', '2025-11-21 04:16:01.982694', '2025-11-28 04:16:01.000000', 3, '89a51f4780ae434ebdb8e9cbcc9ea6bf'),
(13, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2NDMwNDk4OCwiaWF0IjoxNzYzNzAwMTg4LCJqdGkiOiJiZmNmMDU4MWM1OWE0MDMxYTgxMjI3YTZmNGNhNjg4YSIsInVzZXJfaWQiOiIzIn0.KxJHgcBp8E9c41xBk__2_dnvMBgQqwsOKNMGi12gwjg', '2025-11-21 04:43:08.936294', '2025-11-28 04:43:08.000000', 3, 'bfcf0581c59a4031a81227a6f4ca688a'),
(14, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2NDMwNjIzMSwiaWF0IjoxNzYzNzAxNDMxLCJqdGkiOiIzZmE0YWEwNWUwOTM0YzYwOTNiMjExMmU4ZDRjMzA1NyIsInVzZXJfaWQiOiIzIn0.OEJlXfQ_EaqCXVlv_VOp8_9NRovh58_jAjtXLG-NEAU', '2025-11-21 05:03:51.179143', '2025-11-28 05:03:51.000000', 3, '3fa4aa05e0934c6093b2112e8d4c3057'),
(15, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2NDMwNjc2OCwiaWF0IjoxNzYzNzAxOTY4LCJqdGkiOiI1NWEzZmIwNTViZjk0MDZjYmFjNDk2ODQ4ODAzY2E3NCIsInVzZXJfaWQiOiIzIn0.6ukzG2HgWU9LNMmRFLI37E-IicYlwHAeTsE96Uw8RWU', '2025-11-21 05:12:48.639453', '2025-11-28 05:12:48.000000', 3, '55a3fb055bf9406cbac496848803ca74'),
(16, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2NDMwNzgzNSwiaWF0IjoxNzYzNzAzMDM1LCJqdGkiOiJjYmM3MWJmY2Y4MjQ0Njg3ODc2YTA2Y2Y3MTkzMzkwMCIsInVzZXJfaWQiOiIzIn0.HCCTtY_fRiEgAWycB_vPkN9jcjfRZ7Nafra849qPc2Y', '2025-11-21 05:30:35.812541', '2025-11-28 05:30:35.000000', 3, 'cbc71bfcf8244687876a06cf71933900'),
(17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2NDMwOTAxNywiaWF0IjoxNzYzNzA0MjE3LCJqdGkiOiI3NGZkM2YxNTllNDI0YjAzOTFhYWJlNjE3OTkxYjUyYSIsInVzZXJfaWQiOiIzIn0.iKmIyYBrv_q0okK30dWXDJhkkmBFRfzcj52W2mBSBFw', '2025-11-21 05:50:17.061260', '2025-11-28 05:50:17.000000', 3, '74fd3f159e424b0391aabe617991b52a'),
(18, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2NDMwOTkwNiwiaWF0IjoxNzYzNzA1MTA2LCJqdGkiOiIzOWFlYTI3YTc2NGQ0NTUwODIzOTdhYjU1ZjRhZGJkMSIsInVzZXJfaWQiOiIzIn0.L90YJmw1Q4hJfn4t3oMv7j0L7C5kqbM1GSxiIeKcThc', '2025-11-21 06:05:06.299817', '2025-11-28 06:05:06.000000', 3, '39aea27a764d455082397ab55f4adbd1'),
(19, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2NDMxMDEzNSwiaWF0IjoxNzYzNzA1MzM1LCJqdGkiOiIxNjFhMDYwYmY4OWY0NTM2ODVmZDczNzUwZDg4OTEyZSIsInVzZXJfaWQiOiIzIn0.mH44F1Ej98vz2GKVXxrlPVAIJD1SHs6DmlsyAD6-fSM', '2025-11-21 06:08:55.696858', '2025-11-28 06:08:55.000000', 3, '161a060bf89f453685fd73750d88912e'),
(20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2NDMxMTA3NSwiaWF0IjoxNzYzNzA2Mjc1LCJqdGkiOiI4NzZkNDE4ZTA5NzQ0MWRhOGZiZWEwZWRmN2JmYjEzMCIsInVzZXJfaWQiOiIzIn0.lUqx7LrfmqF798p1WsZAMY-Wu9nXHpL8zufrxW48Nps', '2025-11-21 06:24:35.156215', '2025-11-28 06:24:35.000000', 3, '876d418e097441da8fbea0edf7bfb130'),
(21, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2NDMxMTM4MiwiaWF0IjoxNzYzNzA2NTgyLCJqdGkiOiI5ZTAyNGRmZDU4NGU0YjMzYmE0ZTVmOTEyNmZhMjkwZSIsInVzZXJfaWQiOiIzIn0.3OFpuGsWAzanxVRsFT-gXPM7ouCcz2HOdnzlSmH3hEQ', '2025-11-21 06:29:42.332310', '2025-11-28 06:29:42.000000', 3, '9e024dfd584e4b33ba4e5f9126fa290e'),
(22, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2NDMxNDkzNCwiaWF0IjoxNzYzNzEwMTM0LCJqdGkiOiJmNzdlNjgzOTIwNTg0ZTJmOTdmOGQ2NzkwMTcxNGQ5ZCIsInVzZXJfaWQiOiIzIn0.tMxuhroo1xMQ6L1HUeAinL721jVNuLzBq0MFWtSDYi8', '2025-11-21 07:28:54.730055', '2025-11-28 07:28:54.000000', 3, 'f77e683920584e2f97f8d67901714d9d'),
(23, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2NDMxNTk0MSwiaWF0IjoxNzYzNzExMTQxLCJqdGkiOiIyOTQxZGRhYjdiZjM0ODgyYThmZWMxNDhiZTUyYzk4MyIsInVzZXJfaWQiOiIzIn0.LfhNcmx7zOIk3HK_IwbGZMIE6JgcXaftCv-Bc_RbX98', '2025-11-21 07:45:41.250157', '2025-11-28 07:45:41.000000', 3, '2941ddab7bf34882a8fec148be52c983'),
(24, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2NDMxNzYyNywiaWF0IjoxNzYzNzEyODI3LCJqdGkiOiIwM2M4MWEzMTU2NDQ0MTdlYmZkMjkwNjQyYzdhODE3MiIsInVzZXJfaWQiOiI0In0.42UjtLZAh8BvKGnai9PV3jCb5e6ILphnuHbgy9A6J80', '2025-11-21 08:13:47.077049', '2025-11-28 08:13:47.000000', 4, '03c81a315644417ebfd290642c7a8172'),
(25, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc2NDMxNzc2NywiaWF0IjoxNzYzNzEyOTY3LCJqdGkiOiIzNWFhZTQ3YTQ5NDE0NTY4OWI4NmY1MWUyYTFhZjJjMyIsInVzZXJfaWQiOiI0In0.Lo51CbmaIBzGzvL5R0BxOPiI6aAIvGAhcvZH6sUTcvI', '2025-11-21 08:16:07.495959', '2025-11-28 08:16:07.000000', 4, '35aae47a494145689b86f51e2a1af2c3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_accountuser`
--
ALTER TABLE `accounts_accountuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `accounts_accountuser_groups`
--
ALTER TABLE `accounts_accountuser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accountuser_groups_accountuser_id_group_id_5b65791b_uniq` (`accountuser_id`,`group_id`),
  ADD KEY `accountuser_groups_group_id_094e0a6e_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `accounts_accountuser_user_permissions`
--
ALTER TABLE `accounts_accountuser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accountuser_user_permiss_accountuser_id_permissio_15026646_uniq` (`accountuser_id`,`permission_id`),
  ADD KEY `accountuser_user_per_permission_id_baa473a2_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_accountuser_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `token_blacklist_blacklistedtoken`
--
ALTER TABLE `token_blacklist_blacklistedtoken`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token_id` (`token_id`);

--
-- Indexes for table `token_blacklist_outstandingtoken`
--
ALTER TABLE `token_blacklist_outstandingtoken`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq` (`jti`),
  ADD KEY `token_blacklist_outs_user_id_83bc629a_fk_accountus` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_accountuser`
--
ALTER TABLE `accounts_accountuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `accounts_accountuser_groups`
--
ALTER TABLE `accounts_accountuser_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_accountuser_user_permissions`
--
ALTER TABLE `accounts_accountuser_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `token_blacklist_blacklistedtoken`
--
ALTER TABLE `token_blacklist_blacklistedtoken`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `token_blacklist_outstandingtoken`
--
ALTER TABLE `token_blacklist_outstandingtoken`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_accountuser_groups`
--
ALTER TABLE `accounts_accountuser_groups`
  ADD CONSTRAINT `accountuser_groups_accountuser_id_a0a001d6_fk_accountuser_id` FOREIGN KEY (`accountuser_id`) REFERENCES `accounts_accountuser` (`id`),
  ADD CONSTRAINT `accountuser_groups_group_id_094e0a6e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `accounts_accountuser_user_permissions`
--
ALTER TABLE `accounts_accountuser_user_permissions`
  ADD CONSTRAINT `accountuser_user_per_accountuser_id_cea63506_fk_accountus` FOREIGN KEY (`accountuser_id`) REFERENCES `accounts_accountuser` (`id`),
  ADD CONSTRAINT `accountuser_user_per_permission_id_baa473a2_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accountuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_accountuser` (`id`);

--
-- Constraints for table `token_blacklist_blacklistedtoken`
--
ALTER TABLE `token_blacklist_blacklistedtoken`
  ADD CONSTRAINT `token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk` FOREIGN KEY (`token_id`) REFERENCES `token_blacklist_outstandingtoken` (`id`);

--
-- Constraints for table `token_blacklist_outstandingtoken`
--
ALTER TABLE `token_blacklist_outstandingtoken`
  ADD CONSTRAINT `token_blacklist_outs_user_id_83bc629a_fk_accountus` FOREIGN KEY (`user_id`) REFERENCES `accounts_accountuser` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
