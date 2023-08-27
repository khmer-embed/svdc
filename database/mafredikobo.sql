-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 25, 2023 at 12:44 PM
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
-- Database: `mafredikobo`
--

-- --------------------------------------------------------

--
-- Table structure for table `cms_filecategory`
--

CREATE TABLE `cms_filecategory` (
  `fc_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `c_name` varchar(250) NOT NULL,
  `ordering` int(11) NOT NULL,
  `blongobj` varchar(100) NOT NULL,
  `objid` int(11) NOT NULL,
  `blongto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms_filemanager`
--

CREATE TABLE `cms_filemanager` (
  `id` int(11) NOT NULL,
  `filecategory_id` int(11) NOT NULL,
  `media_type` varchar(30) NOT NULL,
  `media` tinytext NOT NULL,
  `filename` tinytext NOT NULL,
  `mwidth` int(11) NOT NULL,
  `mheight` int(11) NOT NULL,
  `disk` varchar(50) NOT NULL,
  `path` varchar(250) NOT NULL,
  `url` tinytext NOT NULL,
  `extra` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`extra`)),
  `fix_extra` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`fix_extra`)),
  `blongobj` varchar(50) NOT NULL,
  `blongto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_filemanager`
--

INSERT INTO `cms_filemanager` (`id`, `filecategory_id`, `media_type`, `media`, `filename`, `mwidth`, `mheight`, `disk`, `path`, `url`, `extra`, `fix_extra`, `blongobj`, `blongto`) VALUES
(1, 0, 'upload', '1686539586_logo.png', 'logo.png', 0, 0, 'public', 'dcxresea_dcxdpa', '', '{}', '{}', 'public', 1);

-- --------------------------------------------------------

--
-- Table structure for table `endpoint`
--

CREATE TABLE `endpoint` (
  `endpoint_id` int(11) NOT NULL,
  `table_name` varchar(222) NOT NULL,
  `json` text NOT NULL,
  `trash` varchar(111) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `endpoint`
--

INSERT INTO `endpoint` (`endpoint_id`, `table_name`, `json`, `trash`) VALUES
(1, 'tbl_02_authority', '', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `importtable`
--

CREATE TABLE `importtable` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kobo3_choices`
--

CREATE TABLE `kobo3_choices` (
  `_id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `$kuid` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `list_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `$autovalue` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label_0` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label_1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kobo3_choices`
--

INSERT INTO `kobo3_choices` (`_id`, `name`, `$kuid`, `list_name`, `$autovalue`, `label_0`, `label_1`) VALUES
(1, '1', 'n1HNU0UtR', 'Q8_Head', '1', 'ប្រុស', 'Male'),
(2, '2', '0mLLLCilM', 'Q8_Head', '2', 'ស្រី', 'Female'),
(3, '1', 'qZ4IvSteA', 'Q3_1', '1', 'មករា', 'January'),
(4, '2', 'UAInSv6VO', 'Q3_1', '2', 'កុម្ភៈ', 'February'),
(5, '3', 'VdGBKw0v1', 'Q3_1', '3', 'មីនា', 'March'),
(6, '4', 'HFgKNJQcV', 'Q3_1', '4', 'មេសា', 'April'),
(7, '5', 'KdV0wQ1q5', 'Q3_1', '5', 'ឧសភា', 'May'),
(8, '6', 'HIdjg5pNz', 'Q3_1', '6', 'មិថុនា', 'June'),
(9, '7', 'NiZn8n6xs', 'Q3_1', '7', 'កក្កដា', 'July'),
(10, '8', 'tcB7wZu8K', 'Q3_1', '8', 'សីហា', 'August'),
(11, '9', '9NamF7dfD', 'Q3_1', '9', 'កញ្ញា', 'September'),
(12, '10', 'nnSXBJlAP', 'Q3_1', '10', 'តុលា', 'October'),
(13, '11', 'uLLCVvUnw', 'Q3_1', '11', 'វិច្ឆិកា', 'November'),
(14, '12', 'R0lwTtHEs', 'Q3_1', '12', 'ធ្នូ', 'December'),
(15, '1', 'DqfIy82dx', 'Q2_Tpye', '1', 'L=ដីស្រែជម្រៅ (មានលិចទឹកចាប់ពី ៣-៤, ៤-៥ និង ៦-៧ ខែ)', 'L = Low land  (from 3-4, 4-5, and 6-7 months)'),
(16, '2', 'QKX7uqdIG', 'Q2_Tpye', '2', 'M=ស្រែទំនាប (ស្រែនៅជិត ទន្លេស្ទឹងអូរប្រឡាយ ចំការ)', 'M = Middle Land (River bank rice, Chamkar)'),
(17, '3', 'Nf3Ie82bs', 'Q2_Tpye', '3', 'H=ដីទួល (មានលិចទឹកចាប់ពី ៣-៤, ៤-៥ និង ចំការ)', 'H = High Land (from 3-4, 4-5 months and Chamkar)'),
(18, '1', '8z6CQJV5x', 'Q2_Purpose', '1', '១. ដីស្រែ', '1. Rice Field'),
(19, '2', 'loEp229EZ', 'Q2_Purpose', '2', '២. ដីដាំដំណាំនៅផ្ទះ', '2. House Garden'),
(20, '3', 'lZ6PrWnvC', 'Q2_Purpose', '3', '៣. ដីដាំដំណាំសម្រាប់លក់', '3. Cash crop garden'),
(21, '4', 'BKjaV6PyU', 'Q2_Purpose', '4', '៤. ដីដំណាំផ្លែឈើ', '4. Fruit Tree'),
(22, '5', '42Esx1NO0', 'Q2_Purpose', '5', '៥. ស្រះត្រី ឬឈូក', '5. Fish or Lotus pond'),
(23, '6', 'WxzuAlCrM', 'Q2_Purpose', '6', '៦. ដីចំណត ឬឃ្លាំងស្តុក', '6. Parking or Storage'),
(24, '7', 'd0s9aahWB', 'Q2_Purpose', '7', '៧. ហាង/ភោជនីយដ្ឋាន', '7. Shop/ restaurant'),
(25, '8', 'IXK8kUBZv', 'Q2_Purpose', '8', '៨.តូបចាប់ហួយ', '8. Small store for selling'),
(26, '9', 'ifBo3PGTz', 'Q2_Purpose', '9', '៩. ផ្សេងៗ សូមបញ្ជាក់…', '9. Other');

-- --------------------------------------------------------

--
-- Table structure for table `kobo3_questions`
--

CREATE TABLE `kobo3_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_xlsform_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hint` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `list_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `autovalue` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `required` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validation` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'kobo->constraint',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `select_from_list_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label_0` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label_1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kobo3_questions`
--

INSERT INTO `kobo3_questions` (`id`, `team_xlsform_id`, `name`, `kuid`, `hint`, `list_name`, `autovalue`, `required`, `validation`, `created_at`, `updated_at`, `select_from_list_name`, `type`, `label_0`, `label_1`) VALUES
(1, 3, 'DATE', 'Em297vC8w', '', '', 'DATE', '1', '', NULL, NULL, '', 'date', 'កាលបរិច្ចេទសម្ភាសន៍', 'Date of interview'),
(2, 3, 'NAME_INT', 'hgVNmX35h', '', '', 'NAME_INT', '1', '', NULL, NULL, '', 'text', 'ឈ្មោះអ្នកសម្ភាសន៍', 'Name of interview'),
(3, 3, 'QID', 'oUfDHIKLC', '', '', 'QID', '1', '', NULL, NULL, '', 'integer', 'លេខកូដ កម្រសំណួរ', 'Questionnaire'),
(4, 3, 'Q8_Head', 'ptqhn9ePw', '', '', 'Q8_Head', '1', '', NULL, NULL, 'Q8_Head', 'select_one', '៨. ភេទមេគ្រួសារ', '8.HH head gender'),
(5, 3, 'tbl_agriland', 'krKr3Hb4W', '', '', 'tbl_agriland', '', '', NULL, NULL, '', 'begin_repeat', 'ដីកសិកម្ម', 'agriculture land'),
(6, 3, 'DATE_2', 'HWkUmfn8c', '', '', 'DATE_2', '', '', NULL, NULL, '', 'calculate', '', ''),
(7, 3, 'NAME_INT_2', '2sWcBB0Fk', '', '', 'NAME_INT_2', '', '', NULL, NULL, '', 'calculate', '', ''),
(8, 3, 'QID_2', 'Nt7hoyDFV', '', '', 'QID_2', '', '', NULL, NULL, '', 'calculate', '', ''),
(9, 3, 'group_Q2_land', 'wKETcI2AM', '', '', 'group_Q2_land', 'Field-list', '', NULL, NULL, '', 'begin_group', '##២. កម្មសិទ្ធដីកសិកម្ម', '##2. Cultivated land Ownership'),
(10, 3, 'Q2_Size', 'd2RuS5IZn', '', '', 'Q2_Size', '1', '', NULL, NULL, '', 'decimal', 'ទំហំ (ផ្ទៃក្រឡា ឬ ហិកតា)', 'Size (area or ha)'),
(11, 3, 'Q2_Tpye', 'rqJXNd15r', '', '', 'Q2_Tpye', '1', '', NULL, NULL, 'Q2_Tpye', 'select_one', 'ប្រភេទដី (L,M,H)', 'Type of Land (L,M,H)'),
(12, 3, 'Q2_Purpose', 'UVD0JQZuG', '', '', 'Q2_Purpose', '1', '', NULL, NULL, 'Q2_Purpose', 'select_multiple', 'គោលបំណងក្នុងការប្រើប្រាស់ដី', 'Purpose of land use'),
(13, 3, 'Q2_Purpose_Other', '1g60TP7bx', '', '', 'Q2_Purpose_Other', '', '', NULL, NULL, '', 'text', '៩. សូមបញ្ជាក់…', '9. Please confirm…'),
(14, 3, 'Q2_Yield', '1KHFrId4e', '', '', 'Q2_Yield', '1', '', NULL, NULL, '', 'decimal', 'ទិន្នផល (គក)/ឆ្នាំ', 'Yield (kg)/year'),
(15, 3, '', 'lh9xUgo5H', '', '', '', '', '', NULL, NULL, '', 'end_group', '', ''),
(16, 3, '', 'PpfCN9fSp', '', '', '', '', '', NULL, NULL, '', 'end_repeat', '', ''),
(17, 3, 'Q3_1', 'H0dIkfso9', '', '', 'Q3_1', '1', '', NULL, NULL, 'Q3_1', 'select_multiple', 'តើសមាជិកណាម្នាក់ក្នុងគ្រួសារអ្នកទៅនេសាទ ឬប្រមូលយកវារីសត្វដទៃទៀត ប៉ុន្មានដងក្នុងឆ្នាំ២០២១?', 'How many times did your household fish/collecting OAA per month in 2021'),
(18, 3, 'group_Q3_2', 'Vqo5wnQbm', '', '', 'group_Q3_2', 'Feild-list', '', NULL, NULL, '', 'begin_group', '###ចំនួនថ្ងៃ/ខែ', '###Fishing days/month'),
(19, 3, 'Q3_2_1', 'fS9vx1A7Y', '', '', 'Q3_2_1', '', '', NULL, NULL, '', 'integer', 'ចំនួនថ្ងៃ/ខែ មករា', 'Fishing days/month  January'),
(20, 3, 'Q3_2_2', 'T9rjTnNBs', '', '', 'Q3_2_2', '', '', NULL, NULL, '', 'integer', 'ចំនួនថ្ងៃ/ខែ កុម្ភៈ', 'Fishing days/month  February'),
(21, 3, 'Q3_2_3', 'Pq6z6GacC', '', '', 'Q3_2_3', '', '', NULL, NULL, '', 'integer', 'ចំនួនថ្ងៃ/ខែ មីនា', 'Fishing days/month  March'),
(22, 3, 'Q3_2_4', 'e30bwH147', '', '', 'Q3_2_4', '', '', NULL, NULL, '', 'integer', 'ចំនួនថ្ងៃ/ខែ មេសា', 'Fishing days/month  April'),
(23, 3, 'Q3_2_5', 'dnumVyoys', '', '', 'Q3_2_5', '', '', NULL, NULL, '', 'integer', 'ចំនួនថ្ងៃ/ខែ ឧសភា', 'Fishing days/month  May'),
(24, 3, 'Q3_2_6', 'PocHsqCsg', '', '', 'Q3_2_6', '', '', NULL, NULL, '', 'integer', 'ចំនួនថ្ងៃ/ខែ មិថុនា', 'Fishing days/month  June'),
(25, 3, 'Q3_2_7', 'fgtxBdRHZ', '', '', 'Q3_2_7', '', '', NULL, NULL, '', 'integer', 'ចំនួនថ្ងៃ/ខែ កក្កដា', 'Fishing days/month  July'),
(26, 3, 'Q3_2_8', 'M3M5IM710', '', '', 'Q3_2_8', '', '', NULL, NULL, '', 'integer', 'ចំនួនថ្ងៃ/ខែ សីហា', 'Fishing days/month  August'),
(27, 3, 'Q3_2_9', 'kr1dB1E0V', '', '', 'Q3_2_9', '', '', NULL, NULL, '', 'integer', 'ចំនួនថ្ងៃ/ខែ កញ្ញា', 'Fishing days/month  September'),
(28, 3, 'Q3_2_10', 'aR48oBoeE', '', '', 'Q3_2_10', '', '', NULL, NULL, '', 'integer', 'ចំនួនថ្ងៃ/ខែ តុលា', 'Fishing days/month  October'),
(29, 3, 'Q3_2_11', 'IVPVmYWwZ', '', '', 'Q3_2_11', '', '', NULL, NULL, '', 'integer', 'ចំនួនថ្ងៃ/ខែ វិច្ឆិកា', 'Fishing days/month  November'),
(30, 3, 'Q3_2_12', 'MVihb7oiU', '', '', 'Q3_2_12', '', '', NULL, NULL, '', 'integer', 'ចំនួនថ្ងៃ/ខែ ធ្នូ', 'Fishing days/month  December'),
(31, 3, '', 'kzCTJetQ7', '', '', '', '', '', NULL, NULL, '', 'end_group', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `kobo3_survey1`
--

CREATE TABLE `kobo3_survey1` (
  `_id` int(10) UNSIGNED NOT NULL,
  `original` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DATE` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME_INT` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `QID` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Q8_Head` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Q3_1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Q3_2_4` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Q3_2_10` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instanceID` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deprecatedID` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uuid` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idate` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `__version__` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_xform_id_string` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_uuid` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_attachments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_geolocation` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_submission_time` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_tags` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_validation_status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_submitted_by` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kobo3_survey1`
--

INSERT INTO `kobo3_survey1` (`_id`, `original`, `DATE`, `NAME_INT`, `QID`, `Q8_Head`, `Q3_1`, `Q3_2_4`, `Q3_2_10`, `instanceID`, `deprecatedID`, `uuid`, `idate`, `__version__`, `_xform_id_string`, `_uuid`, `_attachments`, `_status`, `_geolocation`, `_submission_time`, `_tags`, `_notes`, `_validation_status`, `_submitted_by`) VALUES
(343513547, '{\"_id\":343513547,\"DATE\":\"2022-10-04\",\"NAME_INT\":\"\\u179f\\u17b8\\u17a0\\u17b6\",\"QID\":\"1\",\"Q8_Head\":\"2\",\"tbl_agriland\":[{\"tbl_agriland\\/DATE_2\":\"2022-10-04\",\"tbl_agriland\\/NAME_INT_2\":\"\\u179f\\u17b8\\u17a0\\u17b6\",\"tbl_agriland\\/QID_2\":\"1\",\"tbl_agriland\\/group_Q2_land\\/Q2_Size\":\"1.2\",\"tbl_agriland\\/group_Q2_land\\/Q2_Tpye\":\"1\",\"tbl_agriland\\/group_Q2_land\\/Q2_Purpose\":\"1\",\"tbl_agriland\\/group_Q2_land\\/Q2_Yield\":\"1\"},{\"tbl_agriland\\/DATE_2\":\"2022-10-04\",\"tbl_agriland\\/NAME_INT_2\":\"\\u179f\\u17b8\\u17a0\\u17b6\",\"tbl_agriland\\/QID_2\":\"1\",\"tbl_agriland\\/group_Q2_land\\/Q2_Size\":\"11\",\"tbl_agriland\\/group_Q2_land\\/Q2_Tpye\":\"1\",\"tbl_agriland\\/group_Q2_land\\/Q2_Purpose\":\"8\",\"tbl_agriland\\/group_Q2_land\\/Q2_Yield\":\"1\"}],\"Q3_1\":\"4 10\",\"group_Q3_2\\/Q3_2_4\":\"12\",\"group_Q3_2\\/Q3_2_10\":\"14\",\"meta\\/instanceID\":\"uuid:5baca037-ce53-4128-a7c0-580512c1f155\",\"meta\\/deprecatedID\":\"uuid:b9fd187f-3079-4618-b77d-68d2315c526d\",\"formhub\\/uuid\":\"a9bcce04ab2e49dcb2bfac6211a74215\",\"idate\":\"2022-10-03\",\"__version__\":\"vN3Nhzz22Pi5M2roYMhW9d\",\"_xform_id_string\":\"a3Geq6ZNTcfUKfZR7DHasQ\",\"_uuid\":\"5baca037-ce53-4128-a7c0-580512c1f155\",\"_attachments\":[],\"_status\":\"submitted_via_web\",\"_geolocation\":[null,null],\"_submission_time\":\"2022-10-04T02:54:13\",\"_tags\":[],\"_notes\":[],\"_validation_status\":[],\"_submitted_by\":null}', '2022-10-04', 'សីហា', '1', '2', '4 10', '12', '14', 'uuid:5baca037-ce53-4128-a7c0-580512c1f155', 'uuid:b9fd187f-3079-4618-b77d-68d2315c526d', 'a9bcce04ab2e49dcb2bfac6211a74215', '2022-10-03', 'vN3Nhzz22Pi5M2roYMhW9d', 'a3Geq6ZNTcfUKfZR7DHasQ', '5baca037-ce53-4128-a7c0-580512c1f155', '[]', 'submitted_via_web', '[null,null]', '2022-10-04T02:54:13', '[]', '[]', '[]', NULL),
(343513629, '{\"_id\":343513629,\"DATE\":\"2022-10-03\",\"NAME_INT\":\"\\u1794\\u1784 \\u179f\\u17c4\\u1797\\u17b6\",\"QID\":\"2\",\"Q8_Head\":\"1\",\"tbl_agriland\":[{\"tbl_agriland\\/DATE_2\":\"2022-10-03\",\"tbl_agriland\\/NAME_INT_2\":\"\\u1794\\u1784 \\u179f\\u17c4\\u1797\\u17b6\",\"tbl_agriland\\/QID_2\":\"2\",\"tbl_agriland\\/group_Q2_land\\/Q2_Size\":\"1\",\"tbl_agriland\\/group_Q2_land\\/Q2_Tpye\":\"2\",\"tbl_agriland\\/group_Q2_land\\/Q2_Purpose\":\"1\",\"tbl_agriland\\/group_Q2_land\\/Q2_Yield\":\"1140\"}],\"Q3_1\":\"3\",\"group_Q3_2\\/Q3_2_3\":\"24\",\"meta\\/instanceID\":\"uuid:f13423ad-0598-4440-9d8b-2faab6029cd6\",\"meta\\/deprecatedID\":\"uuid:b2b690dc-6b86-43fc-80dc-1f06ad28f44d\",\"formhub\\/uuid\":\"a9bcce04ab2e49dcb2bfac6211a74215\",\"idate\":\"2022-10-04\",\"__version__\":\"vN3Nhzz22Pi5M2roYMhW9d\",\"_xform_id_string\":\"a3Geq6ZNTcfUKfZR7DHasQ\",\"_uuid\":\"f13423ad-0598-4440-9d8b-2faab6029cd6\",\"_attachments\":[],\"_status\":\"submitted_via_web\",\"_geolocation\":[null,null],\"_submission_time\":\"2022-10-04T02:54:59\",\"_tags\":[],\"_notes\":[],\"_validation_status\":[],\"_submitted_by\":null}', '2022-10-03', 'បង សោភា', '2', '1', '3', NULL, NULL, 'uuid:f13423ad-0598-4440-9d8b-2faab6029cd6', 'uuid:b2b690dc-6b86-43fc-80dc-1f06ad28f44d', 'a9bcce04ab2e49dcb2bfac6211a74215', '2022-10-04', 'vN3Nhzz22Pi5M2roYMhW9d', 'a3Geq6ZNTcfUKfZR7DHasQ', 'f13423ad-0598-4440-9d8b-2faab6029cd6', '[]', 'submitted_via_web', '[null,null]', '2022-10-04T02:54:59', '[]', '[]', '[]', NULL),
(343513700, '{\"_id\":343513700,\"DATE\":\"2022-10-05\",\"NAME_INT\":\"\\u1794\\u1784\\u179a\\u17c9\\u17b6\\u178c\\u17b8\",\"QID\":\"3\",\"Q8_Head\":\"1\",\"tbl_agriland\":[{\"tbl_agriland\\/DATE_2\":\"2022-10-05\",\"tbl_agriland\\/NAME_INT_2\":\"\\u1794\\u1784\\u179a\\u17c9\\u17b6\\u178c\\u17b8\",\"tbl_agriland\\/QID_2\":\"3\",\"tbl_agriland\\/group_Q2_land\\/Q2_Size\":\"1\",\"tbl_agriland\\/group_Q2_land\\/Q2_Tpye\":\"3\",\"tbl_agriland\\/group_Q2_land\\/Q2_Purpose\":\"2\",\"tbl_agriland\\/group_Q2_land\\/Q2_Yield\":\"1234\"}],\"Q3_1\":\"3 10\",\"group_Q3_2\\/Q3_2_3\":\"12\",\"group_Q3_2\\/Q3_2_10\":\"30\",\"meta\\/instanceID\":\"uuid:f9fe35b9-52a9-4657-a4f2-e0cd3782403e\",\"meta\\/deprecatedID\":\"uuid:92c8044d-38c0-4511-9a2b-91d20673e933\",\"formhub\\/uuid\":\"a9bcce04ab2e49dcb2bfac6211a74215\",\"idate\":\"2022-10-05\",\"__version__\":\"vN3Nhzz22Pi5M2roYMhW9d\",\"_xform_id_string\":\"a3Geq6ZNTcfUKfZR7DHasQ\",\"_uuid\":\"f9fe35b9-52a9-4657-a4f2-e0cd3782403e\",\"_attachments\":[],\"_status\":\"submitted_via_web\",\"_geolocation\":[null,null],\"_submission_time\":\"2022-10-04T02:55:27\",\"_tags\":[],\"_notes\":[],\"_validation_status\":[],\"_submitted_by\":null}', '2022-10-05', 'បងរ៉ាឌី', '3', '1', '3 10', NULL, '30', 'uuid:f9fe35b9-52a9-4657-a4f2-e0cd3782403e', 'uuid:92c8044d-38c0-4511-9a2b-91d20673e933', 'a9bcce04ab2e49dcb2bfac6211a74215', '2022-10-05', 'vN3Nhzz22Pi5M2roYMhW9d', 'a3Geq6ZNTcfUKfZR7DHasQ', 'f9fe35b9-52a9-4657-a4f2-e0cd3782403e', '[]', 'submitted_via_web', '[null,null]', '2022-10-04T02:55:27', '[]', '[]', '[]', NULL),
(343522109, '{\"_id\":343522109,\"formhub\\/uuid\":\"a9bcce04ab2e49dcb2bfac6211a74215\",\"DATE\":\"2022-10-05\",\"NAME_INT\":\"\\u179f\\u17c0\\u179c\\u17a1\\u17b8\",\"QID\":\"4\",\"Q8_Head\":\"1\",\"tbl_agriland\":[{\"tbl_agriland\\/DATE_2\":\"2022-10-05\",\"tbl_agriland\\/NAME_INT_2\":\"\\u179f\\u17c0\\u179c\\u17a1\\u17b8\",\"tbl_agriland\\/QID_2\":\"4\",\"tbl_agriland\\/group_Q2_land\\/Q2_Size\":\"11\",\"tbl_agriland\\/group_Q2_land\\/Q2_Tpye\":\"2\",\"tbl_agriland\\/group_Q2_land\\/Q2_Purpose\":\"1 2 9\",\"tbl_agriland\\/group_Q2_land\\/Q2_Purpose_Other\":\"\\u1785\\u17c6\\u1780\\u17b6\\u179a\",\"tbl_agriland\\/group_Q2_land\\/Q2_Yield\":\"2333\"}],\"Q3_1\":\"3\",\"group_Q3_2\\/Q3_2_3\":\"4\",\"__version__\":\"v5q7jqsMUPWhc7YTDo6oFT\",\"meta\\/instanceID\":\"uuid:d1e3da07-2113-4dac-8ef6-ad7e6ba77713\",\"idate\":\"2022-10-03\",\"_xform_id_string\":\"a3Geq6ZNTcfUKfZR7DHasQ\",\"_uuid\":\"d1e3da07-2113-4dac-8ef6-ad7e6ba77713\",\"_attachments\":[],\"_status\":\"submitted_via_web\",\"_geolocation\":[null,null],\"_submission_time\":\"2022-10-04T03:51:01\",\"_tags\":[],\"_notes\":[],\"_validation_status\":[],\"_submitted_by\":null}', '2022-10-05', 'សៀវឡី', '4', '1', '3', NULL, NULL, 'uuid:d1e3da07-2113-4dac-8ef6-ad7e6ba77713', NULL, 'a9bcce04ab2e49dcb2bfac6211a74215', '2022-10-03', 'v5q7jqsMUPWhc7YTDo6oFT', 'a3Geq6ZNTcfUKfZR7DHasQ', 'd1e3da07-2113-4dac-8ef6-ad7e6ba77713', '[]', 'submitted_via_web', '[null,null]', '2022-10-04T03:51:01', '[]', '[]', '[]', NULL),
(343956110, '{\"_id\":343956110,\"formhub\\/uuid\":\"a9bcce04ab2e49dcb2bfac6211a74215\",\"DATE\":\"2022-10-05\",\"NAME_INT\":\"\\u179f\\u17c0\\u179c\\u17a1\\u17b8\",\"QID\":\"4\",\"Q8_Head\":\"1\",\"tbl_agriland\":[{\"tbl_agriland\\/DATE_2\":\"2022-10-05\",\"tbl_agriland\\/NAME_INT_2\":\"\\u179f\\u17c0\\u179c\\u17a1\\u17b8\",\"tbl_agriland\\/QID_2\":\"4\",\"tbl_agriland\\/group_Q2_land\\/Q2_Size\":\"11\",\"tbl_agriland\\/group_Q2_land\\/Q2_Tpye\":\"1\",\"tbl_agriland\\/group_Q2_land\\/Q2_Purpose\":\"7\",\"tbl_agriland\\/group_Q2_land\\/Q2_Yield\":\"10000\"}],\"Q3_1\":\"2\",\"group_Q3_2\\/Q3_2_2\":\"11\",\"__version__\":\"v5q7jqsMUPWhc7YTDo6oFT\",\"meta\\/instanceID\":\"uuid:ec89b82d-a98b-4213-9335-9b3b0148f517\",\"_xform_id_string\":\"a3Geq6ZNTcfUKfZR7DHasQ\",\"_uuid\":\"ec89b82d-a98b-4213-9335-9b3b0148f517\",\"_attachments\":[],\"_status\":\"submitted_via_web\",\"_geolocation\":[null,null],\"_submission_time\":\"2022-10-05T02:59:38\",\"_tags\":[],\"_notes\":[],\"_validation_status\":[],\"_submitted_by\":null}', '2022-10-05', 'សៀវឡី', '4', '1', '2', NULL, NULL, 'uuid:ec89b82d-a98b-4213-9335-9b3b0148f517', NULL, 'a9bcce04ab2e49dcb2bfac6211a74215', NULL, 'v5q7jqsMUPWhc7YTDo6oFT', 'a3Geq6ZNTcfUKfZR7DHasQ', 'ec89b82d-a98b-4213-9335-9b3b0148f517', '[]', 'submitted_via_web', '[null,null]', '2022-10-05T02:59:38', '[]', '[]', '[]', NULL),
(343956128, '{\"_id\":343956128,\"formhub\\/uuid\":\"a9bcce04ab2e49dcb2bfac6211a74215\",\"DATE\":\"2022-10-03\",\"NAME_INT\":\"h\",\"QID\":\"10\",\"Q8_Head\":\"1\",\"tbl_agriland\":[{\"tbl_agriland\\/DATE_2\":\"2022-10-03\",\"tbl_agriland\\/NAME_INT_2\":\"h\",\"tbl_agriland\\/QID_2\":\"10\",\"tbl_agriland\\/group_Q2_land\\/Q2_Size\":\"12\",\"tbl_agriland\\/group_Q2_land\\/Q2_Tpye\":\"3\",\"tbl_agriland\\/group_Q2_land\\/Q2_Purpose\":\"7\",\"tbl_agriland\\/group_Q2_land\\/Q2_Yield\":\"1555\"}],\"Q3_1\":\"2\",\"group_Q3_2\\/Q3_2_2\":\"12\",\"__version__\":\"v5q7jqsMUPWhc7YTDo6oFT\",\"meta\\/instanceID\":\"uuid:d21a1bfe-11dd-4bd2-8ef5-98adfa6e8c1c\",\"_xform_id_string\":\"a3Geq6ZNTcfUKfZR7DHasQ\",\"_uuid\":\"d21a1bfe-11dd-4bd2-8ef5-98adfa6e8c1c\",\"_attachments\":[],\"_status\":\"submitted_via_web\",\"_geolocation\":[null,null],\"_submission_time\":\"2022-10-05T02:59:54\",\"_tags\":[],\"_notes\":[],\"_validation_status\":[],\"_submitted_by\":null}', '2022-10-03', 'h', '10', '1', '2', NULL, NULL, 'uuid:d21a1bfe-11dd-4bd2-8ef5-98adfa6e8c1c', NULL, 'a9bcce04ab2e49dcb2bfac6211a74215', NULL, 'v5q7jqsMUPWhc7YTDo6oFT', 'a3Geq6ZNTcfUKfZR7DHasQ', 'd21a1bfe-11dd-4bd2-8ef5-98adfa6e8c1c', '[]', 'submitted_via_web', '[null,null]', '2022-10-05T02:59:54', '[]', '[]', '[]', NULL),
(344359792, '{\"_id\":344359792,\"formhub\\/uuid\":\"a9bcce04ab2e49dcb2bfac6211a74215\",\"DATE\":\"2022-10-06\",\"NAME_INT\":\"\\u179c\\u1784\\u17cb \\u178e\\u1799\",\"QID\":\"9\",\"Q8_Head\":\"1\",\"tbl_agriland\":[{\"tbl_agriland\\/DATE_2\":\"2022-10-06\",\"tbl_agriland\\/NAME_INT_2\":\"\\u179c\\u1784\\u17cb \\u178e\\u1799\",\"tbl_agriland\\/QID_2\":\"9\",\"tbl_agriland\\/group_Q2_land\\/Q2_Size\":\"1.5\",\"tbl_agriland\\/group_Q2_land\\/Q2_Tpye\":\"1\",\"tbl_agriland\\/group_Q2_land\\/Q2_Purpose\":\"1 7\",\"tbl_agriland\\/group_Q2_land\\/Q2_Yield\":\"1200\"}],\"Q3_1\":\"1\",\"group_Q3_2\\/Q3_2_1\":\"23\",\"__version__\":\"v5q7jqsMUPWhc7YTDo6oFT\",\"meta\\/instanceID\":\"uuid:304f835c-97c3-4f3c-bcbf-500e893304c2\",\"_xform_id_string\":\"a3Geq6ZNTcfUKfZR7DHasQ\",\"_uuid\":\"304f835c-97c3-4f3c-bcbf-500e893304c2\",\"_attachments\":[],\"_status\":\"submitted_via_web\",\"_geolocation\":[null,null],\"_submission_time\":\"2022-10-06T04:13:45\",\"_tags\":[],\"_notes\":[],\"_validation_status\":[],\"_submitted_by\":null}', '2022-10-06', 'វង់ ណយ', '9', '1', '1', NULL, NULL, 'uuid:304f835c-97c3-4f3c-bcbf-500e893304c2', NULL, 'a9bcce04ab2e49dcb2bfac6211a74215', NULL, 'v5q7jqsMUPWhc7YTDo6oFT', 'a3Geq6ZNTcfUKfZR7DHasQ', '304f835c-97c3-4f3c-bcbf-500e893304c2', '[]', 'submitted_via_web', '[null,null]', '2022-10-06T04:13:45', '[]', '[]', '[]', NULL),
(344363479, '{\"_id\":344363479,\"formhub\\/uuid\":\"a9bcce04ab2e49dcb2bfac6211a74215\",\"DATE\":\"2022-10-07\",\"NAME_INT\":\"\\u179f\\u17b6\\u179c\\u17d0\\u1793\\u17d2\\u178f\",\"QID\":\"10\",\"Q8_Head\":\"1\",\"tbl_agriland\":[{\"tbl_agriland\\/DATE_2\":\"2022-10-07\",\"tbl_agriland\\/NAME_INT_2\":\"\\u179f\\u17b6\\u179c\\u17d0\\u1793\\u17d2\\u178f\",\"tbl_agriland\\/QID_2\":\"10\",\"tbl_agriland\\/group_Q2_land\\/Q2_Size\":\"0.5\",\"tbl_agriland\\/group_Q2_land\\/Q2_Tpye\":\"3\",\"tbl_agriland\\/group_Q2_land\\/Q2_Purpose\":\"5\",\"tbl_agriland\\/group_Q2_land\\/Q2_Yield\":\"300\"}],\"Q3_1\":\"5 6 7\",\"group_Q3_2\\/Q3_2_5\":\"15\",\"group_Q3_2\\/Q3_2_6\":\"15\",\"group_Q3_2\\/Q3_2_7\":\"15\",\"__version__\":\"v5q7jqsMUPWhc7YTDo6oFT\",\"meta\\/instanceID\":\"uuid:95a554c0-6f49-4c8a-9864-7ac92e768bf3\",\"_xform_id_string\":\"a3Geq6ZNTcfUKfZR7DHasQ\",\"_uuid\":\"95a554c0-6f49-4c8a-9864-7ac92e768bf3\",\"_attachments\":[],\"_status\":\"submitted_via_web\",\"_geolocation\":[null,null],\"_submission_time\":\"2022-10-06T04:37:17\",\"_tags\":[],\"_notes\":[],\"_validation_status\":[],\"_submitted_by\":null}', '2022-10-07', 'សាវ័ន្ត', '10', '1', '5 6 7', NULL, NULL, 'uuid:95a554c0-6f49-4c8a-9864-7ac92e768bf3', NULL, 'a9bcce04ab2e49dcb2bfac6211a74215', NULL, 'v5q7jqsMUPWhc7YTDo6oFT', 'a3Geq6ZNTcfUKfZR7DHasQ', '95a554c0-6f49-4c8a-9864-7ac92e768bf3', '[]', 'submitted_via_web', '[null,null]', '2022-10-06T04:37:17', '[]', '[]', '[]', NULL),
(470810204, '{\"_id\":470810204,\"formhub\\/uuid\":\"a9bcce04ab2e49dcb2bfac6211a74215\",\"DATE\":\"2023-08-24\",\"NAME_INT\":\"leyley\",\"QID\":\"11111\",\"Q8_Head\":\"1\",\"tbl_agriland\":[{\"tbl_agriland\\/DATE_2\":\"2023-08-24T00:00:00.000+07:00\",\"tbl_agriland\\/NAME_INT_2\":\"leyley\",\"tbl_agriland\\/QID_2\":\"11111\",\"tbl_agriland\\/group_Q2_land\\/Q2_Size\":\"2.0\",\"tbl_agriland\\/group_Q2_land\\/Q2_Tpye\":\"2\",\"tbl_agriland\\/group_Q2_land\\/Q2_Purpose\":\"3 4 2\",\"tbl_agriland\\/group_Q2_land\\/Q2_Yield\":\"2000.0\"}],\"Q3_1\":\"1\",\"group_Q3_2\\/Q3_2_1\":\"10\",\"__version__\":\"v5q7jqsMUPWhc7YTDo6oFT\",\"meta\\/instanceID\":\"uuid:d35a0dde-554e-4298-b483-d41f31c36e0a\",\"_xform_id_string\":\"a3Geq6ZNTcfUKfZR7DHasQ\",\"_uuid\":\"d35a0dde-554e-4298-b483-d41f31c36e0a\",\"_attachments\":[],\"_status\":\"submitted_via_web\",\"_geolocation\":[null,null],\"_submission_time\":\"2023-08-24T07:33:13\",\"_tags\":[],\"_notes\":[],\"_validation_status\":[],\"_submitted_by\":\"leyley_sup2\"}', '2023-08-24', 'leyley', '11111', '1', '1', NULL, NULL, 'uuid:d35a0dde-554e-4298-b483-d41f31c36e0a', NULL, 'a9bcce04ab2e49dcb2bfac6211a74215', NULL, 'v5q7jqsMUPWhc7YTDo6oFT', 'a3Geq6ZNTcfUKfZR7DHasQ', 'd35a0dde-554e-4298-b483-d41f31c36e0a', '[]', 'submitted_via_web', '[null,null]', '2023-08-24T07:33:13', '[]', '[]', '[]', 'leyley_sup2');

-- --------------------------------------------------------

--
-- Table structure for table `kobo3_tbl_agriland_a3geq6zntcfukfzr7dhasq`
--

CREATE TABLE `kobo3_tbl_agriland_a3geq6zntcfukfzr7dhasq` (
  `_id` int(10) UNSIGNED NOT NULL,
  `_parent_index` int(11) NOT NULL,
  `_submission__id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `_parent_table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kobo_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DATE_2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME_INT_2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `QID_2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_Q2_land` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Q2_Size` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Q2_Tpye` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Q2_Purpose` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Q2_Purpose_Other` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Q2_Yield` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kobo3_tbl_agriland_a3geq6zntcfukfzr7dhasq`
--

INSERT INTO `kobo3_tbl_agriland_a3geq6zntcfukfzr7dhasq` (`_id`, `_parent_index`, `_submission__id`, `_parent_table_name`, `kobo_id`, `DATE_2`, `NAME_INT_2`, `QID_2`, `group_Q2_land`, `Q2_Size`, `Q2_Tpye`, `Q2_Purpose`, `Q2_Purpose_Other`, `Q2_Yield`) VALUES
(1, 343513547, '5baca037-ce53-4128-a7c0-580512c1f155', 'kobo3_survey1', 'a3Geq6ZNTcfUKfZR7DHasQ', '2022-10-04', 'សីហា', '1', NULL, '1.2', '1', '1', NULL, '1'),
(2, 343513547, '5baca037-ce53-4128-a7c0-580512c1f155', 'kobo3_survey1', 'a3Geq6ZNTcfUKfZR7DHasQ', '2022-10-04', 'សីហា', '1', NULL, '11', '1', '8', NULL, '1'),
(3, 343513629, 'f13423ad-0598-4440-9d8b-2faab6029cd6', 'kobo3_survey1', 'a3Geq6ZNTcfUKfZR7DHasQ', '2022-10-03', 'បង សោភា', '2', NULL, '1', '2', '1', NULL, '1140'),
(4, 343513700, 'f9fe35b9-52a9-4657-a4f2-e0cd3782403e', 'kobo3_survey1', 'a3Geq6ZNTcfUKfZR7DHasQ', '2022-10-05', 'បងរ៉ាឌី', '3', NULL, '1', '3', '2', NULL, '1234'),
(5, 343522109, 'd1e3da07-2113-4dac-8ef6-ad7e6ba77713', 'kobo3_survey1', 'a3Geq6ZNTcfUKfZR7DHasQ', '2022-10-05', 'សៀវឡី', '4', NULL, '11', '2', '1 2 9', 'ចំការ', '2333'),
(6, 343956110, 'ec89b82d-a98b-4213-9335-9b3b0148f517', 'kobo3_survey1', 'a3Geq6ZNTcfUKfZR7DHasQ', '2022-10-05', 'សៀវឡី', '4', NULL, '11', '1', '7', NULL, '10000'),
(7, 343956128, 'd21a1bfe-11dd-4bd2-8ef5-98adfa6e8c1c', 'kobo3_survey1', 'a3Geq6ZNTcfUKfZR7DHasQ', '2022-10-03', 'h', '10', NULL, '12', '3', '7', NULL, '1555'),
(8, 344359792, '304f835c-97c3-4f3c-bcbf-500e893304c2', 'kobo3_survey1', 'a3Geq6ZNTcfUKfZR7DHasQ', '2022-10-06', 'វង់ ណយ', '9', NULL, '1.5', '1', '1 7', NULL, '1200'),
(9, 344363479, '95a554c0-6f49-4c8a-9864-7ac92e768bf3', 'kobo3_survey1', 'a3Geq6ZNTcfUKfZR7DHasQ', '2022-10-07', 'សាវ័ន្ត', '10', NULL, '0.5', '3', '5', NULL, '300'),
(10, 470810204, 'd35a0dde-554e-4298-b483-d41f31c36e0a', 'kobo3_survey1', 'a3Geq6ZNTcfUKfZR7DHasQ', '2023-08-24T00:00:00.000+07:00', 'leyley', '11111', NULL, '2.0', '2', '3 4 2', NULL, '2000.0');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_02_03_150145_create_kobo_link_tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `abilities` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'myapptoken', 'bd4c2b77c4c4e5e8552785e4c5cf8519d14d25432b8787e57a4658a2c105345f', '[\"*\"]', '2023-06-22 09:46:55', '2022-03-14 03:17:37', '2023-06-22 09:46:55'),
(2, 'App\\Models\\User', 2, 'myapptoken', '7637df762b9dd6cbc4f0dc0857e95b8c3946950fc374edef8b42695de1011ef5', '[\"*\"]', '2022-04-26 01:17:44', '2022-04-09 00:57:33', '2022-04-26 01:17:44'),
(1, 'App\\Models\\User', 1, 'myapptoken', 'bd4c2b77c4c4e5e8552785e4c5cf8519d14d25432b8787e57a4658a2c105345f', '[\"*\"]', '2023-06-22 09:46:55', '2022-03-14 03:17:37', '2023-06-22 09:46:55'),
(2, 'App\\Models\\User', 2, 'myapptoken', '7637df762b9dd6cbc4f0dc0857e95b8c3946950fc374edef8b42695de1011ef5', '[\"*\"]', '2022-05-02 15:04:17', '2022-04-09 00:57:33', '2022-05-02 15:04:17'),
(1, 'App\\Models\\User', 1, 'myapptoken', 'bd4c2b77c4c4e5e8552785e4c5cf8519d14d25432b8787e57a4658a2c105345f', '[\"*\"]', '2023-06-22 09:46:55', '2022-03-14 03:17:37', '2023-06-22 09:46:55'),
(2, 'App\\Models\\User', 2, 'myapptoken', '7637df762b9dd6cbc4f0dc0857e95b8c3946950fc374edef8b42695de1011ef5', '[\"*\"]', '2022-04-26 01:17:44', '2022-04-09 00:57:33', '2022-04-26 01:17:44'),
(1, 'App\\Models\\User', 1, 'myapptoken', 'bd4c2b77c4c4e5e8552785e4c5cf8519d14d25432b8787e57a4658a2c105345f', '[\"*\"]', '2023-06-22 09:46:55', '2022-03-14 03:17:37', '2023-06-22 09:46:55'),
(2, 'App\\Models\\User', 2, 'myapptoken', '7637df762b9dd6cbc4f0dc0857e95b8c3946950fc374edef8b42695de1011ef5', '[\"*\"]', '2022-05-16 07:28:14', '2022-04-09 00:57:33', '2022-05-16 07:28:14'),
(0, 'App\\Models\\User', 13, 'myapptoken', '642240879693a6837958e6e99c56259b686f606fab91cc3016563e82e923a199', '[\"*\"]', NULL, '2022-05-25 18:57:58', '2022-05-25 18:57:58'),
(0, 'App\\Models\\User', 5, 'myapptoken', 'ca48bd8efb1f62323740980e6563790c946827d976a06a4c799d6367ca8c7e5b', '[\"*\"]', NULL, '2022-05-31 00:05:17', '2022-05-31 00:05:17'),
(0, 'App\\Models\\User', 14, 'myapptoken', 'afa99254ad70330781b78f0e9387e42746751ac0045b51f2d472610a64d0ecbe', '[\"*\"]', NULL, '2022-05-31 00:49:32', '2022-05-31 00:49:32'),
(0, 'App\\Models\\User', 15, 'myapptoken', 'c90cd20a9d949175688edc10ff5ded59e80eb7c71773dcadfc5ac8dd383457dc', '[\"*\"]', NULL, '2022-05-31 20:43:26', '2022-05-31 20:43:26'),
(0, 'App\\Models\\User', 16, 'myapptoken', '0036f3cc5a6de7374048089ee801450dbcc1c6066819d5e8050ada410393e0cb', '[\"*\"]', NULL, '2022-06-07 19:54:55', '2022-06-07 19:54:55'),
(0, 'App\\Models\\User', 17, 'myapptoken', 'de83698cb82faf2d849f176159dc721d0cd1aa95faa28bdb457396116eda0d62', '[\"*\"]', NULL, '2022-07-06 00:08:44', '2022-07-06 00:08:44'),
(0, 'App\\Models\\User', 18, 'myapptoken', '9b4a660d1416b93b0f5da47d83e79f0389c580f541c9f849beab62d2969ec94c', '[\"*\"]', NULL, '2022-07-06 00:12:05', '2022-07-06 00:12:05'),
(0, 'App\\Models\\User', 2, 'myapptoken', 'a7da22d8453acd2b7e12b86490d92f1c39df55e36ba9b3a18c666fb8d7ac48f4', '[\"*\"]', NULL, '2022-07-18 06:17:54', '2022-07-18 06:17:54'),
(0, 'App\\Models\\User', 4, 'myapptoken', '9cc4584c2c2c404bceff9f9eafa8e78b9dfa02da437cfed5098cf8fa511d184b', '[\"*\"]', NULL, '2022-08-02 09:01:41', '2022-08-02 09:01:41'),
(0, 'App\\Models\\User', 5, 'myapptoken', 'eaf9d56d8cf6955d41cbb1169150a8c7ae1f847990ab6ac989ae6e55eb871165', '[\"*\"]', NULL, '2022-08-04 01:43:37', '2022-08-04 01:43:37'),
(0, 'App\\Models\\User', 6, 'myapptoken', '7e44d8d17406e840fe4e7f48ad36600f18f14bf5b6db0bb3eb3a4a137e7e9284', '[\"*\"]', NULL, '2022-08-04 01:56:07', '2022-08-04 01:56:07'),
(0, 'App\\Models\\User', 7, 'myapptoken', '505de1952bbe73e390bd5e9ce03869136c7b3a2cf9bc11a5dc358b72978db249', '[\"*\"]', NULL, '2022-08-30 08:20:20', '2022-08-30 08:20:20'),
(0, 'App\\Models\\User', 8, 'myapptoken', 'a64dd09ccec5568f017246db37e48762f65cdd300442311136015755f3482c8e', '[\"*\"]', NULL, '2022-09-01 03:12:13', '2022-09-01 03:12:13'),
(0, 'App\\Models\\User', 9, 'myapptoken', '94bb011ba3bcc6a8e0662ae252f8d274e1c7c198327077858df73619ab552388', '[\"*\"]', NULL, '2022-09-07 10:45:32', '2022-09-07 10:45:32'),
(0, 'App\\Models\\User', 10, 'myapptoken', 'f2ae60e36cc5cd0a905f1f140df74bbd35468f4c60c4235ef5d51dafd2140da2', '[\"*\"]', NULL, '2022-09-07 11:42:10', '2022-09-07 11:42:10'),
(0, 'App\\Models\\User', 8, 'myapptoken', '94d0b230a8e0334890271040a2a6291f2431802c584cc31348f29532f8e24a1c', '[\"*\"]', NULL, '2022-09-08 07:53:36', '2022-09-08 07:53:36'),
(0, 'App\\Models\\User', 7, 'myapptoken', '36745a7e8c0868fae8cb369a066a3c298ff594c142dcc76d42e2f2de4bc0e302', '[\"*\"]', NULL, '2022-09-08 07:54:11', '2022-09-08 07:54:11'),
(0, 'App\\Models\\User', 9, 'myapptoken', '28ad93ebf773975f192daa25195c63eff6c052d192618c3297e31af336c83439', '[\"*\"]', NULL, '2022-09-08 08:36:14', '2022-09-08 08:36:14'),
(0, 'App\\Models\\User', 10, 'myapptoken', '2d32fb0477402e33d596d0b7820f0edd5dc3d1e0f0f790b1fea494e00e956c0c', '[\"*\"]', NULL, '2022-09-08 08:44:29', '2022-09-08 08:44:29'),
(0, 'App\\Models\\User', 16, 'myapptoken', 'b4236ddb6b2611d966c9de5a14b7b2f499b9b13da94063d57d7ad233b7480abd', '[\"*\"]', NULL, '2022-09-09 07:51:27', '2022-09-09 07:51:27'),
(0, 'App\\Models\\User', 17, 'myapptoken', '4b11b2dda0fb6d03c5e77415f15a058670237c75cbea96f8a1add7aa847003b9', '[\"*\"]', NULL, '2022-09-13 09:05:40', '2022-09-13 09:05:40'),
(0, 'App\\Models\\User', 20, 'myapptoken', '0aa5e34237930aefe4242a941251c244af4843b3092c5de4921a72d8134deb30', '[\"*\"]', NULL, '2022-09-13 09:45:54', '2022-09-13 09:45:54'),
(0, 'App\\Models\\User', 23, 'myapptoken', '05c35aafb33fc7f8f90ac4640d871278996ca538df8a07c4de5c9112e6ab6398', '[\"*\"]', NULL, '2022-09-14 07:18:21', '2022-09-14 07:18:21'),
(0, 'App\\Models\\User', 24, 'myapptoken', '584e8af7ee933d897d002dd9d1c33d368bc88b65e55964d46e8368ac8e17dadc', '[\"*\"]', NULL, '2022-09-14 07:22:36', '2022-09-14 07:22:36'),
(0, 'App\\Models\\User', 18, 'myapptoken', 'dac6b7c757076fdd4b0eec5f38baa406ec5dc83e147af98547462f6b2326b8d1', '[\"*\"]', NULL, '2022-09-21 20:38:35', '2022-09-21 20:38:35'),
(0, 'App\\Models\\User', 33, 'myapptoken', '557a171e886c4e2c2a5a9e3e4565a8572d81f48ffcd6dec1221b016b9fca9c8f', '[\"*\"]', NULL, '2022-09-22 11:53:24', '2022-09-22 11:53:24'),
(0, 'App\\Models\\User', 34, 'myapptoken', '85341312dad4f1be42fb5daf729ab4a8251aa2c4f0a220f41dd458f454598ba5', '[\"*\"]', NULL, '2022-09-22 14:43:56', '2022-09-22 14:43:56'),
(0, 'App\\Models\\User', 36, 'myapptoken', '41e72871dcf1a7cb5a345bf84f176735f4826ecdd6f6fe44549618e619a27e8d', '[\"*\"]', NULL, '2022-09-22 14:59:43', '2022-09-22 14:59:43'),
(0, 'App\\Models\\User', 38, 'myapptoken', '4781f6e9493bcde6f310c20d562403dac1c194a9436d6558112bd8b03f700a90', '[\"*\"]', NULL, '2022-09-22 15:08:14', '2022-09-22 15:08:14'),
(0, 'App\\Models\\User', 39, 'myapptoken', 'a483320f29c421e8aacd6ed3936e790e6728b258dd627116816cf2c34fe79906', '[\"*\"]', NULL, '2022-09-28 08:44:24', '2022-09-28 08:44:24'),
(0, 'App\\Models\\User', 40, 'myapptoken', '272e807d32d8030111d5a7e042e61243f9a1a7d0944610f5c0edcc8e28242024', '[\"*\"]', NULL, '2022-09-28 09:54:15', '2022-09-28 09:54:15'),
(0, 'App\\Models\\User', 19, 'myapptoken', '925c18788158dcf110531760ff0f64ee59f61a726343201657b5d0131ce14c71', '[\"*\"]', NULL, '2022-09-28 10:08:33', '2022-09-28 10:08:33'),
(0, 'App\\Models\\User', 42, 'myapptoken', '5d3ab74bb65990f209a1646287dcc87a2a8a7b5c4854266715dd306ac0b8140b', '[\"*\"]', NULL, '2022-09-28 11:50:34', '2022-09-28 11:50:34');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_xlsform_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hint` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `list_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `autovalue` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `required` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validation` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'kobo->constraint',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `team_xlsform_id`, `name`, `kuid`, `label`, `hint`, `list_name`, `autovalue`, `required`, `validation`, `created_at`, `updated_at`) VALUES
(1, 3, 'DATE', 'Em297vC8w', '{\"kh\":\"\\u1780\\u17b6\\u179b\\u1794\\u179a\\u17b7\\u1785\\u17d2\\u1785\\u17c1\\u1791\\u179f\\u1798\\u17d2\\u1797\\u17b6\\u179f\\u1793\\u17cd\",\"en\":\"Date of interview\"}', '', 'date', 'DATE', '1', '', '2023-08-24 06:45:02', '2023-08-24 07:49:40'),
(2, 3, 'NAME_INT', 'hgVNmX35h', '{\"kh\":\"\\u1788\\u17d2\\u1798\\u17c4\\u17c7\\u17a2\\u17d2\\u1793\\u1780\\u179f\\u1798\\u17d2\\u1797\\u17b6\\u179f\\u1793\\u17cd\",\"en\":\"Name of interview\"}', '', 'text', 'NAME_INT', '1', '', '2023-08-24 06:45:02', '2023-08-24 07:49:40'),
(3, 3, 'QID', 'oUfDHIKLC', '{\"kh\":\"\\u179b\\u17c1\\u1781\\u1780\\u17bc\\u178a \\u1780\\u1798\\u17d2\\u179a\\u179f\\u17c6\\u178e\\u17bd\\u179a\",\"en\":\"Questionnaire\"}', '', 'integer', 'QID', '1', '', '2023-08-24 06:45:02', '2023-08-24 07:49:40'),
(4, 3, 'Q8_Head', 'ptqhn9ePw', '{\"kh\":\"\\u17e8. \\u1797\\u17c1\\u1791\\u1798\\u17c1\\u1782\\u17d2\\u179a\\u17bd\\u179f\\u17b6\\u179a\",\"en\":\"8.HH head gender\"}', '', 'select_one', 'Q8_Head', '1', '', '2023-08-24 06:45:02', '2023-08-24 07:49:40'),
(5, 3, 'tbl_agriland', 'krKr3Hb4W', '{\"kh\":\"\\u178a\\u17b8\\u1780\\u179f\\u17b7\\u1780\\u1798\\u17d2\\u1798\",\"en\":\"agriculture land\"}', '', 'begin_repeat', 'tbl_agriland', '', '', '2023-08-24 06:45:02', '2023-08-24 06:45:02'),
(6, 3, 'DATE_2', 'HWkUmfn8c', '{\"kh\":\"\",\"en\":\"\"}', '', 'calculate', 'DATE_2', '', '', '2023-08-24 06:45:02', '2023-08-24 06:45:02'),
(7, 3, 'NAME_INT_2', '2sWcBB0Fk', '{\"kh\":\"\",\"en\":\"\"}', '', 'calculate', 'NAME_INT_2', '', '', '2023-08-24 06:45:02', '2023-08-24 06:45:02'),
(8, 3, 'QID_2', 'Nt7hoyDFV', '{\"kh\":\"\",\"en\":\"\"}', '', 'calculate', 'QID_2', '', '', '2023-08-24 06:45:02', '2023-08-24 06:45:02'),
(9, 3, 'group_Q2_land', 'wKETcI2AM', '{\"kh\":\"##\\u17e2. \\u1780\\u1798\\u17d2\\u1798\\u179f\\u17b7\\u1791\\u17d2\\u1792\\u178a\\u17b8\\u1780\\u179f\\u17b7\\u1780\\u1798\\u17d2\\u1798\",\"en\":\"##2. Cultivated land Ownership\"}', '', 'begin_group', 'group_Q2_land', 'Field-list', '', '2023-08-24 06:45:02', '2023-08-24 06:45:02'),
(10, 3, 'Q2_Size', 'd2RuS5IZn', '{\"kh\":\"\\u1791\\u17c6\\u17a0\\u17c6 (\\u1795\\u17d2\\u1791\\u17c3\\u1780\\u17d2\\u179a\\u17a1\\u17b6 \\u17ac \\u17a0\\u17b7\\u1780\\u178f\\u17b6)\",\"en\":\"Size (area or ha)\"}', '', 'decimal', 'Q2_Size', '1', '', '2023-08-24 06:45:02', '2023-08-24 07:49:40'),
(11, 3, 'Q2_Tpye', 'rqJXNd15r', '{\"kh\":\"\\u1794\\u17d2\\u179a\\u1797\\u17c1\\u1791\\u178a\\u17b8 (L,M,H)\",\"en\":\"Type of Land (L,M,H)\"}', '', 'select_one', 'Q2_Tpye', '1', '', '2023-08-24 06:45:02', '2023-08-24 07:49:40'),
(12, 3, 'Q2_Purpose', 'UVD0JQZuG', '{\"kh\":\"\\u1782\\u17c4\\u179b\\u1794\\u17c6\\u178e\\u1784\\u1780\\u17d2\\u1793\\u17bb\\u1784\\u1780\\u17b6\\u179a\\u1794\\u17d2\\u179a\\u17be\\u1794\\u17d2\\u179a\\u17b6\\u179f\\u17cb\\u178a\\u17b8\",\"en\":\"Purpose of land use\"}', '', 'select_multiple', 'Q2_Purpose', '1', '', '2023-08-24 06:45:02', '2023-08-24 07:49:40'),
(13, 3, 'Q2_Purpose_Other', '1g60TP7bx', '{\"kh\":\"\\u17e9. \\u179f\\u17bc\\u1798\\u1794\\u1789\\u17d2\\u1787\\u17b6\\u1780\\u17cb\\u2026\",\"en\":\"9. Please confirm\\u2026\"}', '', 'text', 'Q2_Purpose_Other', '', '', '2023-08-24 06:45:02', '2023-08-24 06:45:02'),
(14, 3, 'Q2_Yield', '1KHFrId4e', '{\"kh\":\"\\u1791\\u17b7\\u1793\\u17d2\\u1793\\u1795\\u179b (\\u1782\\u1780)\\/\\u1786\\u17d2\\u1793\\u17b6\\u17c6\",\"en\":\"Yield (kg)\\/year\"}', '', 'decimal', 'Q2_Yield', '1', '', '2023-08-24 06:45:02', '2023-08-24 07:49:40'),
(15, 3, '', 'lh9xUgo5H', '{\"kh\":\"\",\"en\":\"\"}', '', 'end_group', '', '', '', '2023-08-24 06:45:02', '2023-08-24 06:45:02'),
(16, 3, '', 'PpfCN9fSp', '{\"kh\":\"\",\"en\":\"\"}', '', 'end_repeat', '', '', '', '2023-08-24 06:45:02', '2023-08-24 06:45:02'),
(17, 3, 'Q3_1', 'H0dIkfso9', '{\"kh\":\"\\u178f\\u17be\\u179f\\u1798\\u17b6\\u1787\\u17b7\\u1780\\u178e\\u17b6\\u1798\\u17d2\\u1793\\u17b6\\u1780\\u17cb\\u1780\\u17d2\\u1793\\u17bb\\u1784\\u1782\\u17d2\\u179a\\u17bd\\u179f\\u17b6\\u179a\\u17a2\\u17d2\\u1793\\u1780\\u1791\\u17c5\\u1793\\u17c1\\u179f\\u17b6\\u1791 \\u17ac\\u1794\\u17d2\\u179a\\u1798\\u17bc\\u179b\\u1799\\u1780\\u179c\\u17b6\\u179a\\u17b8\\u179f\\u178f\\u17d2\\u179c\\u178a\\u1791\\u17c3\\u1791\\u17c0\\u178f \\u1794\\u17c9\\u17bb\\u1793\\u17d2\\u1798\\u17b6\\u1793\\u178a\\u1784\\u1780\\u17d2\\u1793\\u17bb\\u1784\\u1786\\u17d2\\u1793\\u17b6\\u17c6\\u17e2\\u17e0\\u17e2\\u17e1?\",\"en\":\"How many times did your household fish\\/collecting OAA per month in 2021\"}', '', 'select_multiple', 'Q3_1', '1', '', '2023-08-24 06:45:02', '2023-08-24 07:49:40'),
(18, 3, 'group_Q3_2', 'Vqo5wnQbm', '{\"kh\":\"###\\u1785\\u17c6\\u1793\\u17bd\\u1793\\u1790\\u17d2\\u1784\\u17c3\\/\\u1781\\u17c2\",\"en\":\"###Fishing days\\/month\"}', '', 'begin_group', 'group_Q3_2', 'Feild-list', '', '2023-08-24 06:45:02', '2023-08-24 06:45:02'),
(19, 3, 'Q3_2_1', 'fS9vx1A7Y', '{\"kh\":\"\\u1785\\u17c6\\u1793\\u17bd\\u1793\\u1790\\u17d2\\u1784\\u17c3\\/\\u1781\\u17c2 \\u1798\\u1780\\u179a\\u17b6\",\"en\":\"Fishing days\\/month  January\"}', '', 'integer', 'Q3_2_1', '', '', '2023-08-24 06:45:02', '2023-08-24 06:45:02'),
(20, 3, 'Q3_2_2', 'T9rjTnNBs', '{\"kh\":\"\\u1785\\u17c6\\u1793\\u17bd\\u1793\\u1790\\u17d2\\u1784\\u17c3\\/\\u1781\\u17c2 \\u1780\\u17bb\\u1798\\u17d2\\u1797\\u17c8\",\"en\":\"Fishing days\\/month  February\"}', '', 'integer', 'Q3_2_2', '', '', '2023-08-24 06:45:02', '2023-08-24 06:45:02'),
(21, 3, 'Q3_2_3', 'Pq6z6GacC', '{\"kh\":\"\\u1785\\u17c6\\u1793\\u17bd\\u1793\\u1790\\u17d2\\u1784\\u17c3\\/\\u1781\\u17c2 \\u1798\\u17b8\\u1793\\u17b6\",\"en\":\"Fishing days\\/month  March\"}', '', 'integer', 'Q3_2_3', '', '', '2023-08-24 06:45:02', '2023-08-24 06:45:02'),
(22, 3, 'Q3_2_4', 'e30bwH147', '{\"kh\":\"\\u1785\\u17c6\\u1793\\u17bd\\u1793\\u1790\\u17d2\\u1784\\u17c3\\/\\u1781\\u17c2 \\u1798\\u17c1\\u179f\\u17b6\",\"en\":\"Fishing days\\/month  April\"}', '', 'integer', 'Q3_2_4', '', '', '2023-08-24 06:45:02', '2023-08-24 06:45:02'),
(23, 3, 'Q3_2_5', 'dnumVyoys', '{\"kh\":\"\\u1785\\u17c6\\u1793\\u17bd\\u1793\\u1790\\u17d2\\u1784\\u17c3\\/\\u1781\\u17c2 \\u17a7\\u179f\\u1797\\u17b6\",\"en\":\"Fishing days\\/month  May\"}', '', 'integer', 'Q3_2_5', '', '', '2023-08-24 06:45:02', '2023-08-24 06:45:02'),
(24, 3, 'Q3_2_6', 'PocHsqCsg', '{\"kh\":\"\\u1785\\u17c6\\u1793\\u17bd\\u1793\\u1790\\u17d2\\u1784\\u17c3\\/\\u1781\\u17c2 \\u1798\\u17b7\\u1790\\u17bb\\u1793\\u17b6\",\"en\":\"Fishing days\\/month  June\"}', '', 'integer', 'Q3_2_6', '', '', '2023-08-24 06:45:02', '2023-08-24 06:45:02'),
(25, 3, 'Q3_2_7', 'fgtxBdRHZ', '{\"kh\":\"\\u1785\\u17c6\\u1793\\u17bd\\u1793\\u1790\\u17d2\\u1784\\u17c3\\/\\u1781\\u17c2 \\u1780\\u1780\\u17d2\\u1780\\u178a\\u17b6\",\"en\":\"Fishing days\\/month  July\"}', '', 'integer', 'Q3_2_7', '', '', '2023-08-24 06:45:02', '2023-08-24 06:45:02'),
(26, 3, 'Q3_2_8', 'M3M5IM710', '{\"kh\":\"\\u1785\\u17c6\\u1793\\u17bd\\u1793\\u1790\\u17d2\\u1784\\u17c3\\/\\u1781\\u17c2 \\u179f\\u17b8\\u17a0\\u17b6\",\"en\":\"Fishing days\\/month  August\"}', '', 'integer', 'Q3_2_8', '', '', '2023-08-24 06:45:02', '2023-08-24 06:45:02'),
(27, 3, 'Q3_2_9', 'kr1dB1E0V', '{\"kh\":\"\\u1785\\u17c6\\u1793\\u17bd\\u1793\\u1790\\u17d2\\u1784\\u17c3\\/\\u1781\\u17c2 \\u1780\\u1789\\u17d2\\u1789\\u17b6\",\"en\":\"Fishing days\\/month  September\"}', '', 'integer', 'Q3_2_9', '', '', '2023-08-24 06:45:02', '2023-08-24 06:45:02'),
(28, 3, 'Q3_2_10', 'aR48oBoeE', '{\"kh\":\"\\u1785\\u17c6\\u1793\\u17bd\\u1793\\u1790\\u17d2\\u1784\\u17c3\\/\\u1781\\u17c2 \\u178f\\u17bb\\u179b\\u17b6\",\"en\":\"Fishing days\\/month  October\"}', '', 'integer', 'Q3_2_10', '', '', '2023-08-24 06:45:02', '2023-08-24 06:45:02'),
(29, 3, 'Q3_2_11', 'IVPVmYWwZ', '{\"kh\":\"\\u1785\\u17c6\\u1793\\u17bd\\u1793\\u1790\\u17d2\\u1784\\u17c3\\/\\u1781\\u17c2 \\u179c\\u17b7\\u1785\\u17d2\\u1786\\u17b7\\u1780\\u17b6\",\"en\":\"Fishing days\\/month  November\"}', '', 'integer', 'Q3_2_11', '', '', '2023-08-24 06:45:02', '2023-08-24 06:45:02'),
(30, 3, 'Q3_2_12', 'MVihb7oiU', '{\"kh\":\"\\u1785\\u17c6\\u1793\\u17bd\\u1793\\u1790\\u17d2\\u1784\\u17c3\\/\\u1781\\u17c2 \\u1792\\u17d2\\u1793\\u17bc\",\"en\":\"Fishing days\\/month  December\"}', '', 'integer', 'Q3_2_12', '', '', '2023-08-24 06:45:02', '2023-08-24 06:45:02'),
(31, 3, '', 'kzCTJetQ7', '{\"kh\":\"\",\"en\":\"\"}', '', 'end_group', '', '', '', '2023-08-24 06:45:02', '2023-08-24 06:45:02');

-- --------------------------------------------------------

--
-- Table structure for table `questions_info`
--

CREATE TABLE `questions_info` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_xlsform_id` bigint(20) UNSIGNED NOT NULL,
  `kobo_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `countq` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions_info`
--

INSERT INTO `questions_info` (`id`, `team_xlsform_id`, `kobo_id`, `countq`) VALUES
(1, 3, 'a3Geq6ZNTcfUKfZR7DHasQ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `realtimeinsert`
--

CREATE TABLE `realtimeinsert` (
  `id` int(11) NOT NULL,
  `table_name` varchar(222) NOT NULL,
  `json` text NOT NULL,
  `trash` varchar(111) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `realtimeinsert`
--

INSERT INTO `realtimeinsert` (`id`, `table_name`, `json`, `trash`) VALUES
(1, 'kobo3_survey1', '', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `submissions`
--

CREATE TABLE `submissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_xlsform_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `submitted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `errors` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT 0,
  `entries` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_profile`
--

CREATE TABLE `system_profile` (
  `id` int(11) NOT NULL,
  `optioninput` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`optioninput`)),
  `textinput` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`textinput`)),
  `general` text NOT NULL,
  `contact` text NOT NULL,
  `socialnetwork` text NOT NULL,
  `smtp` text NOT NULL,
  `blongto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `system_profile`
--

INSERT INTO `system_profile` (`id`, `optioninput`, `textinput`, `general`, `contact`, `socialnetwork`, `smtp`, `blongto`) VALUES
(1, '[]', '[]', '{\"latinname\":\"DAP\",\"nativename\":\"\\u178c\\u17b8\\u1797\\u17b8\\u17a2\\u17c1\",\"logo\":\"1686539586_logo.png\",\"icon\":\"\",\"companyid\":\"\",\"vatnumber\":\"\"}', '{\"receiveremail\":\"ngimbunny@gmail.com\",\"address\":\"Phnom Penh\",\"phone\":\"\",\"otherphone\":\"\",\"saleemail\":\"ngimbunny@gmail.com\",\"supportemail\":\"ngimbunny@gmail.com\",\"website\":\"airlyo.com\",\"map\":\"pp\"}', '{\"facebook\":\"\",\"youtube\":\"\",\"twitter\":\"\",\"linkedin\":\"\",\"line\":\"\",\"telegram\":\"\"}', '{\"maildriver\":\"SMTP\",\"encryption\":\"\",\"host\":\"\",\"mailport\":\"\",\"mailuser\":\"\",\"mailpassword\":\"\",\"fromemail\":\"\",\"fromname\":\"\"}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `system_setting`
--

CREATE TABLE `system_setting` (
  `id` int(11) NOT NULL,
  `optioninput` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`optioninput`)),
  `textinput` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`textinput`)),
  `main_currency` text NOT NULL,
  `sub_currency` text NOT NULL,
  `idformat` text NOT NULL,
  `accounting` text NOT NULL,
  `printing` text NOT NULL,
  `blongto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `system_setting`
--

INSERT INTO `system_setting` (`id`, `optioninput`, `textinput`, `main_currency`, `sub_currency`, `idformat`, `accounting`, `printing`, `blongto`) VALUES
(1, '{\"telegramtoken\":\"6383320230:AAFwIO_KRXTuurMNq4sXU5SYPwIGHLPwFx0\",\"telegramid\":\"-987314401\",\"dashboardform\":\"\",\"provincefield\":\"cProvince\",\"districtfield\":\"cDistrict\",\"communefield\":\"cCommune\",\"metabaseurl\":\"https:\\/\\/metabase.analyticalx.org\",\"metabasesecret\":\"551d9823395196dd2dc6d495a18f7d1f45e66ecf45b5defebf9ec12c8c54f52b\",\"metabasedashboard\":\"4\",\"metabasequestion\":\"\",\"phpmyadmin\":\"\"}', '{\"storagedisk\":\"public\",\"storagepath\":\"dcxresea_dcxdpa\",\"backgroundimage\":\"\",\"partnerimage\":\"\",\"disclaimer\":\"\"}', '', '', '', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_02_authority`
--

CREATE TABLE `tbl_02_authority` (
  `id` int(10) UNSIGNED NOT NULL,
  `contents` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `_xform_id_string` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uuid` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tstart` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tend` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ttoday` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deviceid` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_interview` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_interview` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex_interview` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_respon` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commune` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `village` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `q0201` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `q0202` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `q0203` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `q0204` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `q0301` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `q0302` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `q0303` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `q0304` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `q0401` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `q0402` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `q0501` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `q0502` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `q0503` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ifinish` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `__version__` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `audit` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instanceid` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_uuid` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_attachments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_geolocation` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_submission_time` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_tags` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_validation_status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_submitted_by` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phonenumber` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_02_authority`
--

INSERT INTO `tbl_02_authority` (`id`, `contents`, `_xform_id_string`, `trash`, `_id`, `uuid`, `tstart`, `tend`, `ttoday`, `username`, `deviceid`, `date_interview`, `name_interview`, `sex_interview`, `name_respon`, `province`, `district`, `commune`, `village`, `q0201`, `q0202`, `q0203`, `q0204`, `q0301`, `q0302`, `q0303`, `q0304`, `q0401`, `q0402`, `q0501`, `q0502`, `q0503`, `comments`, `ifinish`, `__version__`, `audit`, `instanceid`, `_uuid`, `_attachments`, `_status`, `_geolocation`, `_submission_time`, `_tags`, `_notes`, `_validation_status`, `_submitted_by`, `phonenumber`) VALUES
(1, '{\"_id\": 417787404, \"formhub/uuid\": \"64e1b288cc89466aa9aa09283a963f3d\", \"Tstart\": \"2023-04-16T06:09:16.397+07:00\", \"Tend\": \"2023-04-16T06:13:22.482+07:00\", \"Ttoday\": \"2023-04-16\", \"username\": \"eiseinetworkapp_kobo\", \"deviceid\": \"collect:OY4Q8ZWAzWA8j106\", \"g_intro/date_interview\": \"2023-04-16\", \"g_intro/name_interview\": \"\\u178a\\u17b6\\u178e\\u17c1\", \"g_intro/sex_interview\": \"1\", \"g_intro/name_respon\": \"\\u1798\\u17b7\\u1793\", \"g_intro/province\": \"K2\", \"g_intro/district\": \"1103\", \"g_intro/commune\": \"110302\", \"g_intro/village\": \"11030203\", \"g_envirog_natural/q0201\": \"\\u1798\\u17b7\\u1793\\u1799\\u179b\\u17cb\", \"g_envirog_natural/q0202\": \"\\u1793\\u17c5\\u1791\\u17c1\", \"g_envirog_natural/q0203\": \"\\u1798\\u17b7\\u1793\", \"g_envirog_natural/q0204\": \"\\u1793\\u17c5\", \"g_violation/q0301\": \"\\u1798\\u17b7\\u1793\", \"g_violation/q0302\": \"\\u1798\\u17b7\\u1793\", \"g_violation/q0303\": \"\\u1798\\u17b7\\u1793\", \"g_violation/q0304\": \"\\u1798\\u17b7\\u1793\", \"g_q0401/q0401\": \"\\u1798\\u17b7\\u1793\", \"g_q0401/q0402\": \"\\u1798\\u17b7\\u1793\", \"g_q0501/q0501\": \"\\u1798\\u17b7\\u1793\", \"g_q0501/q0502\": \"\\u1798\\u17b7\\u1793\", \"g_q0501/q0503\": \"\\u1798\\u17b7\\u1793\", \"comments\": \"\\u1798\\u17b7\\u1793\", \"iFinish\": \"1\", \"__version__\": \"vAnFNXXvoVVPH9oLMQMNDp\", \"meta/audit\": \"audit.csv\", \"meta/instanceID\": \"uuid:d599dba7-4141-49d7-be17-e654ffe22ec3\", \"_xform_id_string\": \"aP25nUip6ExqJGKfahmqAR\", \"_uuid\": \"d599dba7-4141-49d7-be17-e654ffe22ec3\", \"_attachments\": [{\"download_url\": \"https://kc.humanitarianresponse.info/media/original?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2Fd599dba7-4141-49d7-be17-e654ffe22ec3%2Faudit.csv\", \"download_large_url\": \"https://kc.humanitarianresponse.info/media/large?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2Fd599dba7-4141-49d7-be17-e654ffe22ec3%2Faudit.csv\", \"download_medium_url\": \"https://kc.humanitarianresponse.info/media/medium?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2Fd599dba7-4141-49d7-be17-e654ffe22ec3%2Faudit.csv\", \"download_small_url\": \"https://kc.humanitarianresponse.info/media/small?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2Fd599dba7-4141-49d7-be17-e654ffe22ec3%2Faudit.csv\", \"mimetype\": \"text/csv\", \"filename\": \"koboadmin_eiseinetworkapp/attachments/64e1b288cc89466aa9aa09283a963f3d/d599dba7-4141-49d7-be17-e654ffe22ec3/audit.csv\", \"instance\": 417787404, \"xform\": 1363857, \"id\": 173503219}], \"_status\": \"submitted_via_web\", \"_geolocation\": [null, null], \"_submission_time\": \"2023-04-18T01:50:21\", \"_tags\": [], \"_notes\": [], \"_validation_status\": {}, \"_submitted_by\": \"koboadmin_eiseinetworkapp\"}', 'aP25nUip6ExqJGKfahmqAR', 'no', '417787404', '64e1b288cc89466aa9aa09283a963f3d', '2023-04-16T06:09:16.397+07:00', '2023-04-16T06:13:22.482+07:00', '2023-04-16', 'eiseinetworkapp_kobo', 'collect:OY4Q8ZWAzWA8j106', '2023-04-16', 'ដាណេ', '1', 'មិន', 'K2', '1103', '110302', '11030203', 'មិនយល់', 'នៅទេ', 'មិន', 'នៅ', 'មិន', 'មិន', 'មិន', 'មិន', 'មិន', 'មិន', 'មិន', 'មិន', 'មិន', 'មិន', '1', 'vAnFNXXvoVVPH9oLMQMNDp', 'audit.csv', 'uuid:d599dba7-4141-49d7-be17-e654ffe22ec3', 'd599dba7-4141-49d7-be17-e654ffe22ec3', '[{\"download_url\":\"https:\\/\\/kc.humanitarianresponse.info\\/media\\/original?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2Fd599dba7-4141-49d7-be17-e654ffe22ec3%2Faudit.csv\",\"download_large_url\":\"https:\\/\\/kc.humanitarianresponse.info\\/media\\/large?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2Fd599dba7-4141-49d7-be17-e654ffe22ec3%2Faudit.csv\",\"download_medium_url\":\"https:\\/\\/kc.humanitarianresponse.info\\/media\\/medium?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2Fd599dba7-4141-49d7-be17-e654ffe22ec3%2Faudit.csv\",\"download_small_url\":\"https:\\/\\/kc.humanitarianresponse.info\\/media\\/small?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2Fd599dba7-4141-49d7-be17-e654ffe22ec3%2Faudit.csv\",\"mimetype\":\"text\\/csv\",\"filename\":\"koboadmin_eiseinetworkapp\\/attachments\\/64e1b288cc89466aa9aa09283a963f3d\\/d599dba7-4141-49d7-be17-e654ffe22ec3\\/audit.csv\",\"instance\":417787404,\"xform\":1363857,\"id\":173503219}]', 'submitted_via_web', '[null,null]', '2023-04-18T01:50:21', '[]', '[]', '[]', 'koboadmin_eiseinetworkapp', NULL),
(2, '{\"_id\": 417792660, \"formhub/uuid\": \"64e1b288cc89466aa9aa09283a963f3d\", \"Tstart\": \"2023-04-18T09:04:17.935+07:00\", \"Tend\": \"2023-04-18T09:54:41.875+07:00\", \"Ttoday\": \"2023-04-18\", \"username\": \"username not found\", \"phonenumber\": \"phonenumber not found\", \"deviceid\": \"ee.humanitarianresponse.info:Dk1Iso7yYjSke7GR\", \"g_intro/date_interview\": \"2023-04-18\", \"g_intro/name_interview\": \"Ninea\", \"g_intro/sex_interview\": \"1\", \"g_intro/name_respon\": \"NA\", \"g_intro/province\": \"16\", \"g_intro/district\": \"1601\", \"g_intro/commune\": \"160101\", \"g_intro/village\": \"16010101\", \"g_envirog_natural/q0201\": \"\\u1781\\u17d2\\u1789\\u17bb\\u17c6\\u1798\\u17b7\\u1793\\u1792\\u17d2\\u179b\\u17b6\\u1794\\u17cb\\u1794\\u17b6\\u1793\\u1782\\u17c1\\u179a\\u17b6\\u1799\\u1780\\u17b6\\u179a\\u1791\\u17c1\\u1796\\u17d2\\u179a\\u17c4\\u17c7\\u179f\\u1782\\u1798\\u1793\\u17cd\\u1798\\u17b7\\u1793\\u1794\\u17b6\\u1793\\u1794\\u17d2\\u179a\\u17be\\u1794\\u17d2\\u179a\\u17b6\\u179f\\u17cb\\u1794\\u17d2\\u179a\\u1797\\u1796\\u1791\\u17b9\\u1780\\u1793\\u17c5\\u1780\\u17d2\\u1794\\u17c2\\u17a2\\u17b6\\u1787\\u17b8\\u179c\\u1780\\u1798\\u17d2\\u1798\\u179a\\u17c9\\u17c2\", \"g_envirog_natural/q0202\": \"\\u178a\\u17b8\\u1796\\u17d2\\u179a\\u17c3\\u179f\\u17a0\\u1782\\u1798\\u1793\\u17cd\\u178a\\u17c2\\u179b\\u1794\\u17b6\\u1793\\u1795\\u17d2\\u178f\\u179b\\u17cb\\u17a2\\u17b6\\u1787\\u17d2\\u1789\\u17b6\\u1794\\u17d0\\u178e\\u17d2\\u178e\\u17a2\\u17c4\\u1799\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793\\u178f\\u17d2\\u179a\\u17bd\\u178f\\u1787\\u17b6\\u1798\\u17bd\\u1799\\u1796\\u17d2\\u179a\\u17c3\\u179f\\u17a0\\u1782\\u1798\\u1793\\u17cd\\u179c\\u17b6\\u179b\\u1790\\u17d2\\u1798\\u1780\\u17c6\\u1794\\u17c4\\u1785\\u17c6\\u1793\\u17bd\\u1793\\u17e1\\u17e0\\u17e0\\u17a0\\u178f\\u17d2\\u1790\\u17d4 \\u178a\\u17c4\\u1799\\u179f\\u17b6\\u179a\\u178f\\u17c2\\u17a2\\u17b6\\u1787\\u17b8\\u179c\\u1780\\u1798\\u17d2\\u1798\\u1790\\u17d2\\u1798\\u179f\\u17c6\\u178e\\u1784\\u17cb\\u1793\\u17c1\\u17c7\\u1793\\u17c5\\u1786\\u17d2\\u1784\\u17b6\\u1799\\u1796\\u17b8\\u178f\\u17c6\\u1794\\u1793\\u17cb\\u178a\\u17c2\\u179b\\u1794\\u17d2\\u179a\\u1787\\u17b6\\u1787\\u1793\\u179a\\u179f\\u17cb\\u1793\\u17c5\\u1785\\u17c6\\u1793\\u17bd\\u1793\\u17e1\\u17e5 \\u1782\\u17b8\\u17a1\\u17bc\\u1798\\u17c9\\u17c2\\u178f \\u1780\\u17b6\\u179a\\u179a\\u17c6\\u1781\\u17b6\\u1793\\u178a\\u17c4\\u1799\\u179f\\u17c6\\u17a1\\u17c1\\u1784 \\u1793\\u17b7\\u1784\\u179a\\u17c6\\u1789\\u17d0\\u179a\\u1796\\u17bb\\u17c6\\u1798\\u17b6\\u1798\\u1791\\u17c1\\u17d4 \\u1794\\u17c9\\u17bb\\u1793\\u17d2\\u178f\\u17c2\\u1793\\u17c5\\u178f\\u17c6\\u1794\\u1793\\u17cb\\u1793\\u17c1\\u17c7\\u1798\\u17b6\\u1793\\u1794\\u17d2\\u179a\\u1787\\u17b6\\u1787\\u1793\\u1785\\u17c6\\u1793\\u17bd\\u1793\\u17e7\\u17e5\\u17e0\\u1782\\u17d2\\u179a\\u17bd\\u179f\\u17b6\\u179a \\u178a\\u17c2\\u179b\\u1794\\u17c9\\u17c7\\u1796\\u17b6\\u179b\\u17cb\\u178a\\u17c4\\u1799\\u1780\\u17b6\\u179a\\u1794\\u17d2\\u179a\\u17be\\u1794\\u17d2\\u179a\\u17b6\\u179f\\u17cb\\u1794\\u17d2\\u179a\\u1797\\u1796\\u1791\\u17b9\\u1780\\u1785\\u17c1\\u1789\\u1796\\u17b8\\u1791\\u1793\\u17d2\\u179b\\u17c1\\u179f\\u17d2\\u179a\\u17c2\\u1796\\u1780 \\u178a\\u17c2\\u179b\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793\\u1794\\u17b6\\u1793\\u1784\\u17d2\\u17a0\\u17bc\\u179a \\u179f\\u17b6\\u179a\\u1792\\u17b6\\u178f\\u17bb\\u1782\\u17b8\\u1798\\u17b8\\u178f\\u17b6\\u1798\\u178a\\u17c3\\u17a2\\u17bc\\u179a\\u1785\\u17bc\\u179b\\u1791\\u17c5\\u1791\\u1793\\u17d2\\u179b\\u17c1\\u179f\\u17d2\\u179a\\u17c2\\u1796\\u1780\\u17d4\", \"g_envirog_natural/q0203\": \"\\u1798\\u17b7\\u1793\\u1798\\u17b6\\u1793\\u1791\\u17c1\", \"g_envirog_natural/q0204\": \"\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793\\u179a\\u17c9\\u17c2\\u1794\\u17b6\\u1793\\u1792\\u17d2\\u179c\\u17be\\u17a2\\u17b6\\u1784\\u179f\\u17d2\\u178f\\u17bb\\u1780\\u1791\\u17b9\\u1780\\u178a\\u17c2\\u179b\\u1798\\u17b6\\u1793\\u179f\\u17b6\\u179a\\u1792\\u17b6\\u178f\\u17bb\\u1796\\u17bb\\u179b \\u1793\\u17c5\\u1781\\u17c2\\u1794\\u17d2\\u179a\\u17b6\\u17c6\\u1784\\u1796\\u17bb\\u17c6\\u1798\\u17b6\\u1793\\u1795\\u179b\\u1794\\u17c9\\u17c7\\u1796\\u17b6\\u179b\\u17cb\\u1791\\u17c1 \\u1794\\u17c9\\u17bb\\u1793\\u17d2\\u178f\\u17c2\\u1793\\u17c5\\u1781\\u17c2\\u179c\\u179f\\u17d2\\u179f\\u17b6\\u1798\\u17b6\\u1793\\u1791\\u17b9\\u1780\\u1785\\u17d2\\u179a\\u17be\\u1793 \\u1780\\u17b6\\u1780\\u179f\\u17c6\\u178e\\u179f\\u17cb\\u178a\\u17c2\\u179b\\u1787\\u17b6\\u179f\\u17b6\\u179a\\u1792\\u17b6\\u178f\\u17bb\\u179a\\u17b6\\u179c\\u1796\\u17bb\\u179b\\u1793\\u17b9\\u1784\\u1798\\u17b7\\u1793\\u1798\\u17b6\\u1793\\u1780\\u17b6\\u179a\\u1782\\u17d2\\u179a\\u1794\\u17cb\\u1782\\u17d2\\u179a\\u1784\\u1794\\u17b6\\u1793\\u179b\\u17d2\\u17a2\\u1794\\u178e\\u17d2\\u178f\\u17b6\\u179b\\u17a2\\u17c4\\u1799\\u17a0\\u17bc\\u179a\\u1785\\u17bc\\u179b\\u17a2\\u17bc\\u1793\\u1785\\u17d2\\u179a\\u17a1\\u1784\\u17cb\\u1785\\u17b6\\u1780\\u17cb\\u1791\\u17c5\\u1791\\u1793\\u17d2\\u179b\\u17c1\\u179f\\u17d2\\u179a\\u17c2\\u178e\\u1780\\u178a\\u17c2\\u179b\\u1787\\u17b6\\u1794\\u17d2\\u179a\\u1797\\u1796\\u1791\\u17b9\\u1780\\u178a\\u17c2\\u179b\\u1794\\u17d2\\u179a\\u1787\\u17b6\\u1787\\u1793\\u1785\\u17c6\\u1793\\u17bd\\u1793\\u17e7\\u17e5\\u17e0\\u1782\\u17d2\\u179a\\u17bd\\u179f\\u17b6\\u179a\\u1794\\u17d2\\u179a\\u17be\\u1794\\u17d2\\u179a\\u17b6\\u179f\\u17cb\", \"g_violation/q0301\": \"\\u178f\\u17c6\\u178e\\u17b6\\u1784\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793\\u1794\\u17b6\\u1793\\u1798\\u1780\\u1787\\u17bd\\u1794\\u1794\\u17d2\\u179a\\u1792\\u17b6\\u1793\\u179f\\u17a0\\u1782\\u1798\\u1793\\u17cd\\u1796\\u17d2\\u179a\\u17c3\\u1788\\u17be \\u1793\\u17b7\\u1784\\u17a2\\u17b6\\u1787\\u17d2\\u1789\\u17b6\\u1792\\u179a\\u178a\\u17be\\u1798\\u17d2\\u1794\\u17b8\\u1796\\u17b7\\u1797\\u17b6\\u1780\\u17d2\\u179f\\u17b6\\u17a2\\u17c6\\u1796\\u17b8\\u1791\\u17bb\\u1780\\u17d2\\u1781\\u1780\\u1784\\u17d2\\u179c\\u179b\\u17cb \\u1793\\u17b7\\u1784\\u178a\\u17c6\\u178e\\u17bb\\u1798\\u1796\\u179a\\u1795\\u17d2\\u179f\\u17c1\\u1784\\u17d7 \\u1794\\u17c9\\u17bb\\u1793\\u17d2\\u178f\\u17c2\\u1780\\u17b6\\u179a\\u1785\\u17bb\\u17c7\\u1798\\u1780\\u1796\\u17b7\\u1797\\u17b6\\u1780\\u17d2\\u179f\\u17b6\\u1787\\u17b6\\u1798\\u17bd\\u1799\\u1794\\u17d2\\u179a\\u1787\\u17b6\\u1787\\u1793\\u179a\\u1784\\u1795\\u179b\\u1794\\u17c9\\u17c7\\u1796\\u17b6\\u179b\\u17cb\\u178a\\u17c4\\u1799\\u1795\\u17d2\\u1791\\u17b6\\u179b\\u17cb\\u17a0\\u17b6\\u1780\\u17cb\\u178a\\u17bc\\u1785\\u1787\\u17b6\\u1798\\u17b7\\u1793\\u1794\\u17b6\\u1793\\u1782\\u17d2\\u179a\\u1794\\u17cb\\u1787\\u17d2\\u179a\\u17bb\\u1784\\u1787\\u17d2\\u179a\\u17c4\\u1799\\u178a\\u17c4\\u1799\\u17a0\\u17c1\\u178f\\u17bb\\u1790\\u17b6 \\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793\\u1794\\u17b6\\u1793\\u1787\\u17bd\\u1794\\u1787\\u17b6\\u1798\\u17bd\\u1799\\u1797\\u17bc\\u1798\\u17b7\\u178a\\u17c2\\u179b\\u179a\\u1784\\u1795\\u179b\\u1794\\u17c9\\u17c7\\u1796\\u17b6\\u179b\\u17cb\\u178f\\u17b7\\u1785 \\u1793\\u17b7\\u1784\\u1793\\u17c5\\u1786\\u17d2\\u1784\\u17b6\\u1799\\u1796\\u17b8\\u1797\\u17bc\\u1798\\u17b7\\u178a\\u17c2\\u179b\\u179a\\u1784\\u1795\\u179b\\u1794\\u17c9\\u17c7\\u1796\\u17b6\\u179b\\u17cb\\u178a\\u17c4\\u1799\\u1795\\u17d2\\u1791\\u17b6\\u179b\\u17cb\", \"g_violation/q0302\": \"\\u1798\\u17b7\\u1793\\u1798\\u17b6\\u1793\\u1791\\u17c1\", \"g_violation/q0303\": \"\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793\\u1793\\u17c1\\u17c7\\u1791\\u17be\\u1794\\u178f\\u17c2\\u1791\\u1791\\u17bd\\u179b\\u1794\\u17b6\\u1793\\u17a2\\u17b6\\u1787\\u17d2\\u1789\\u17b6\\u1794\\u17d0\\u178e\\u17d2\\u178e\\u178a\\u17bc\\u1785\\u17d2\\u1793\\u17c1\\u17c7\\u1796\\u17bb\\u17c6\\u1791\\u17b6\\u1793\\u17cb\\u1798\\u17b6\\u1793\\u1780\\u17b6\\u179a\\u1780\\u17b6\\u1794\\u17cb\\u1796\\u17d2\\u179a\\u17c3\\u1788\\u17be\\u1781\\u17bb\\u179f\\u1785\\u17d2\\u1794\\u17b6\\u1794\\u17cb\\u1791\\u17c1\", \"g_violation/q0304\": \"\\u17e1\\u17e0\\u1786\\u17d2\\u1793\\u17b6\\u17c6 \\u17a2\\u17b6\\u1787\\u17d2\\u1789\\u17b6\\u1794\\u17d0\\u178e\\u17d2\\u178e\\u17a2\\u17b6\\u1787\\u17b7\\u179c\\u1780\\u1798\\u17d2\\u1798\\u17d4 \\u178f\\u17b6\\u1798\\u1794\\u1791\\u1796\\u17b7\\u179f\\u17c4\\u1792\\u1793\\u17cd\\u1798\\u17b7\\u1793\\u179f\\u17bc\\u179c\\u1782\\u17c4\\u179a\\u1796\\u1791\\u17c1\", \"g_q0401/q0401\": \"\\u1798\\u17b7\\u1793\\u1792\\u17d2\\u179b\\u17b6\\u1794\\u17cb\\u1791\\u17c1\", \"g_q0401/q0402\": \"\\u1798\\u17b7\\u1793\\u1798\\u17b6\\u1793\\u1780\\u17c6\\u1794\\u17c4\\u1791\\u17c1 \\u1794\\u17c9\\u17bb\\u1793\\u17d2\\u178f\\u17c2\\u1798\\u17b6\\u1793\\u1780\\u17c6\\u1791\\u17c1\\u1785\\u1790\\u17d2\\u1798\\u17a2\\u178e\\u17d2\\u178f\\u17c2\\u178f\\u179b\\u17be\\u1791\\u17b9\\u1780\\u1791\\u1793\\u17d2\\u179b\\u17c1\", \"g_q0501/q0501\": \"\\u1798\\u17b7\\u1793\\u1798\\u17b6\\u1793\\u1791\\u17c1\", \"g_q0501/q0502\": \"\\u1798\\u17b7\\u1793\\u1798\\u17b6\\u1793\\u1791\\u17c1\", \"g_q0501/q0503\": \"\\u1798\\u17b7\\u1793\\u1798\\u17b6\\u1793\\u1791\\u17c1\", \"comments\": \"\\u1798\\u17b7\\u1793\\u1798\\u17b6\\u1793\\u1791\\u17c1\", \"iFinish\": \"1\", \"__version__\": \"vFFd6cfwoCYGvnq6W7xRhA\", \"meta/instanceID\": \"uuid:4b08d9d6-80ce-4702-bec2-b4f1836fc41c\", \"_xform_id_string\": \"aP25nUip6ExqJGKfahmqAR\", \"_uuid\": \"4b08d9d6-80ce-4702-bec2-b4f1836fc41c\", \"_attachments\": [], \"_status\": \"submitted_via_web\", \"_geolocation\": [null, null], \"_submission_time\": \"2023-04-18T02:54:53\", \"_tags\": [], \"_notes\": [], \"_validation_status\": {}, \"_submitted_by\": null}', 'aP25nUip6ExqJGKfahmqAR', 'no', '417792660', '64e1b288cc89466aa9aa09283a963f3d', '2023-04-18T09:04:17.935+07:00', '2023-04-18T09:54:41.875+07:00', '2023-04-18', 'username not found', 'ee.humanitarianresponse.info:Dk1Iso7yYjSke7GR', '2023-04-18', 'Ninea', '1', 'NA', '16', '1601', '160101', '16010101', 'ខ្ញុំមិនធ្លាប់បានគេរាយការទេព្រោះសគមន៍មិនបានប្រើប្រាស់ប្រភពទឹកនៅក្បែអាជីវកម្មរ៉ែ', 'ដីព្រៃសហគមន៍ដែលបានផ្តល់អាជ្ញាប័ណ្ណអោយក្រុមហ៊ុនត្រួតជាមួយព្រៃសហគមន៍វាលថ្មកំបោចំនួន១០០ហត្ថ។ ដោយសារតែអាជីវកម្មថ្មសំណង់នេះនៅឆ្ងាយពីតំបន់ដែលប្រជាជនរស់នៅចំនួន១៥ គីឡូម៉ែត ការរំខានដោយសំឡេង និងរំញ័រពុំមាមទេ។ ប៉ុន្តែនៅតំបន់នេះមានប្រជាជនចំនួន៧៥០គ្រួសារ ដែលប៉ះពាល់ដោយការប្រើប្រាស់ប្រភពទឹកចេញពីទន្លេស្រែពក ដែលក្រុមហ៊ុនបានង្ហូរ សារធាតុគីមីតាមដៃអូរចូលទៅទន្លេស្រែពក។', 'មិនមានទេ', 'ក្រុមហ៊ុនរ៉ែបានធ្វើអាងស្តុកទឹកដែលមានសារធាតុពុល នៅខែប្រាំងពុំមានផលប៉ះពាល់ទេ ប៉ុន្តែនៅខែវស្សាមានទឹកច្រើន កាកសំណស់ដែលជាសារធាតុរាវពុលនឹងមិនមានការគ្រប់គ្រងបានល្អបណ្តាលអោយហូរចូលអូនច្រឡង់ចាក់ទៅទន្លេស្រែណកដែលជាប្រភពទឹកដែលប្រជាជនចំនួន៧៥០គ្រួសារប្រើប្រាស់', 'តំណាងក្រុមហ៊ុនបានមកជួបប្រធានសហគមន៍ព្រៃឈើ និងអាជ្ញាធរដើម្បីពិភាក្សាអំពីទុក្ខកង្វល់ និងដំណុមពរផ្សេងៗ ប៉ុន្តែការចុះមកពិភាក្សាជាមួយប្រជាជនរងផលប៉ះពាល់ដោយផ្ទាល់ហាក់ដូចជាមិនបានគ្រប់ជ្រុងជ្រោយដោយហេតុថា ក្រុមហ៊ុនបានជួបជាមួយភូមិដែលរងផលប៉ះពាល់តិច និងនៅឆ្ងាយពីភូមិដែលរងផលប៉ះពាល់ដោយផ្ទាល់', 'មិនមានទេ', 'ក្រុមហ៊ុននេះទើបតែទទួលបានអាជ្ញាប័ណ្ណដូច្នេះពុំទាន់មានការកាប់ព្រៃឈើខុសច្បាប់ទេ', '១០ឆ្នាំ អាជ្ញាប័ណ្ណអាជិវកម្ម។ តាមបទពិសោធន៍មិនសូវគោរពទេ', 'មិនធ្លាប់ទេ', 'មិនមានកំបោទេ ប៉ុន្តែមានកំទេចថ្មអណ្តែតលើទឹកទន្លេ', 'មិនមានទេ', 'មិនមានទេ', 'មិនមានទេ', 'មិនមានទេ', '1', 'vFFd6cfwoCYGvnq6W7xRhA', NULL, 'uuid:4b08d9d6-80ce-4702-bec2-b4f1836fc41c', '4b08d9d6-80ce-4702-bec2-b4f1836fc41c', '[]', 'submitted_via_web', '[null,null]', '2023-04-18T02:54:53', '[]', '[]', '[]', NULL, 'phonenumber not found'),
(3, '{\"_id\": 417793109, \"formhub/uuid\": \"64e1b288cc89466aa9aa09283a963f3d\", \"Tstart\": \"2023-04-18T09:04:45.920+07:00\", \"Tend\": \"2023-04-18T09:52:09.033+07:00\", \"Ttoday\": \"2023-04-18\", \"username\": \"eiseinetworkapp_kobo\", \"deviceid\": \"collect:cV3OqcZ3hXSoD5M6\", \"g_intro/date_interview\": \"2023-04-18\", \"g_intro/name_interview\": \"\\u1796\\u17bc \\u17a1\\u17b6\", \"g_intro/sex_interview\": \"2\", \"g_intro/name_respon\": \"\\u1796\\u17bc \\u17a1\\u17b6 (\\u1794), \\u1796\\u17bc \\u179f\\u17bb\\u1780 (\\u1794)\", \"g_intro/province\": \"11\", \"g_intro/district\": \"1101\", \"g_intro/commune\": \"110101\", \"g_intro/village\": \"11010102\", \"g_envirog_natural/q0201\": \"\\u1798\\u17b7\\u1793\\u1792\\u17d2\\u179b\\u17b6\\u1794\\u17cb\\u1798\\u17b6\\u1793\\u1780\\u17b6\\u179a\\u179a\\u17b6\\u1799\\u1780\\u17b6\\u179a\\u178e\\u17cd\\u1791\\u17c1\", \"g_envirog_natural/q0202\": \"\\u1798\\u17b7\\u1793\\u1798\\u17b6\\u1793\\u1780\\u17b6\\u179a\\u1791\\u1793\\u17d2\\u1791\\u17d2\\u179a\\u17b6\\u1793\\u1799\\u1780\\u1791\\u17c1 \\u178a\\u17c4\\u1799\\u179f\\u17b6\\u179a\\u179c\\u17b6\\u1787\\u17b6\\u178a\\u17b8\\u1796\\u17d2\\u179a\\u17c3\", \"g_envirog_natural/q0203\": \"\\u1798\\u17b7\\u1793\\u1798\\u17b6\\u1793\\u1791\\u17c1\", \"g_envirog_natural/q0204\": \"\\u1798\\u17b6\\u1793\\u1780\\u17b6\\u179a\\u1782\\u17d2\\u179a\\u1794\\u17cb\\u1782\\u17d2\\u179a\\u1784\\u1780\\u17b6\\u1780\\u179f\\u17c6\\u178e\\u179b\\u17cb \\u1798\\u17b6\\u1793\\u17a2\\u17b6\\u1784\\u179f\\u17d2\\u178f\\u17bb\\u1780\\u1791\\u17b9\\u1780 \\u17a0\\u17be\\u1799\\u1798\\u17b6\\u1793\\u1780\\u17b6\\u179a\\u1796\\u17d0\\u1793\\u17d2\\u1792\\u179a\\u1794\\u1784\\u1798\\u17b7\\u1793\\u17a2\\u17c4\\u1799\\u179f\\u17a0\\u1782\\u1798\\u1793\\u17cd\\u1785\\u17bc\\u179b\\u1794\\u17b6\\u1793\\u1791\\u17c1\", \"g_violation/q0301\": \"\\u1798\\u17b6\\u1793 \\u17a0\\u17be\\u1799\\u179f\\u17a0\\u1782\\u1798\\u1793\\u17cd\\u1780\\u17cf\\u1798\\u17b6\\u1793\\u1780\\u17b6\\u179a\\u1799\\u179b\\u17cb\\u1796\\u17d2\\u179a\\u1798\\u178a\\u17c2\\u179a\", \"g_violation/q0302\": \"\\u1798\\u17b6\\u1793\\u17e1\\u1797\\u17bc\\u1798\\u17b7\\u178a\\u17c2\\u179b\\u1794\\u17c9\\u17c7\\u1796\\u17b6\\u179b\\u17cb\\u1787\\u17b6\\u1798\\u17bd\\u1799\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793 \\u17a0\\u17be\\u1799\\u1780\\u17cf\\u1794\\u17b6\\u1793\\u1795\\u17d2\\u179b\\u17b6\\u179f\\u17cb\\u1794\\u17d2\\u178f\\u17bc\\u179a\\u1791\\u17b8\\u179b\\u17c6\\u1793\\u17c5\\u178a\\u17c4\\u1799\\u1791\\u1791\\u17bd\\u179b\\u1794\\u17b6\\u1793\\u179f\\u17c6\\u178e\\u1784\\u1796\\u17b8\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793\\u1795\\u1784\\u178a\\u17c2\\u179a\", \"g_violation/q0303\": \"\\u179f\\u17a0\\u1782\\u1798\\u1793\\u17cd\\u1792\\u17d2\\u179b\\u17b6\\u1794\\u17cb\\u1798\\u17b6\\u1793\\u1791\\u17c6\\u1793\\u17b6\\u179f\\u17cb\\u1787\\u17b6\\u1798\\u17bd\\u1799\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793\\u1791\\u17b6\\u1780\\u17cb\\u1791\\u1784\\u178a\\u17be\\u1798\\u1787\\u17d0\\u179a \\u1794\\u17c9\\u17bb\\u1793\\u17d2\\u178f\\u17c2\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793\\u1794\\u17b6\\u1793\\u178a\\u17c4\\u17c7\\u179f\\u17d2\\u179a\\u17b6\\u1799\\u1793\\u17b7\\u1784\\u1795\\u17d2\\u178f\\u179b\\u17cb\\u1787\\u17b6\\u179f\\u17c6\\u178e\\u1784\\u178a\\u179b\\u17cb\\u1796\\u17bd\\u1780\\u1782\\u17c1\", \"g_violation/q0304\": \"\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793\\u1798\\u17b6\\u1793\\u17a2\\u17b6\\u1787\\u17d2\\u1789\\u17b6\\u1794\\u17d0\\u178e\\u17d2\\u178e\\u1785\\u17d2\\u1794\\u17b6\\u179f\\u17cb\\u179b\\u17b6\\u179f\\u17cb \\u1794\\u17d2\\u179a\\u1797\\u17c1\\u1791\\u17a2\\u17b6\\u1787\\u17b8\\u179c\\u1780\\u1798\\u17d2\\u1798 \\u1787\\u17b6\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793\\u179f\\u17d2\\u178f\\u1784\\u17cb\\u178a\\u17b6\\u179a\\u1798\\u17b6\\u1793\\u1780\\u17b6\\u179a\\u1782\\u17c4\\u179a\\u1796\\u178f\\u17b6\\u1798\\u1782\\u17c4\\u179b\\u1780\\u17b6\\u179a\\u178e\\u17cd \\u1792\\u17d2\\u179b\\u17b6\\u1794\\u17cb\\u1798\\u17b6\\u1793\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793\\u1798\\u1780\\u1796\\u17b9\\u1784\\u1796\\u17b6\\u1780\\u17cb\\u17a2\\u17c4\\u1799\\u1787\\u17bd\\u1799\\u17a2\\u1793\\u17d2\\u178f\\u179a\\u17b6\\u1782\\u1798\\u1793\\u17cd \\u17a0\\u17be\\u1799\\u1781\\u17d2\\u1789\\u17bb\\u17c6\\u1780\\u17cf\\u1794\\u17b6\\u1793\\u1796\\u17b6\\u17c6\\u1793\\u17b6\\u17c6\\u1780\\u17b6\\u179a\\u1796\\u17b7\\u1782\\u17d2\\u179a\\u17c4\\u17c7\\u1799\\u17c4\\u1794\\u179b\\u17cb\\u1791\\u17b6\\u17c6\\u1784\\u17a2\\u179f\\u17cb\\u1791\\u17c5\\u178a\\u179b\\u17cb\\u179f\\u17a0\\u1782\\u1798\\u1793\\u17cd\\u1795\\u1784\\u178a\\u17c2\\u179a\", \"g_q0401/q0401\": \"\\u1798\\u17b7\\u1793\\u1792\\u17d2\\u179b\\u17b6\\u1794\\u17cb\\u1798\\u17b6\\u1793\\u1791\\u17c1 \\u17a0\\u17be\\u1799\\u1780\\u17cf\\u1798\\u17b7\\u1793\\u1780\\u179a\\u178e\\u17b8\\u1793\\u17c1\\u17c7\\u1780\\u17be\\u178f\\u17a1\\u17be\\u1784\\u1793\\u17c5\\u1780\\u17d2\\u1793\\u17bb\\u1784\\u178f\\u17c6\\u1794\\u1793\\u17cb\\u179a\\u1794\\u179f\\u17cb\\u1781\\u17d2\\u1789\\u17bb\\u17c6\\u178a\\u17c2\\u179a\", \"g_q0401/q0402\": \"\\u1791\\u17b9\\u1780\\u1798\\u17b7\\u1793\\u1798\\u17b6\\u1793\\u1780\\u17b6\\u179a\\u1794\\u17d2\\u179a\\u17c2\\u1794\\u17d2\\u179a\\u17bd\\u179b\\u1791\\u17c1 \\u179c\\u17b6\\u1794\\u17d2\\u179a\\u17c2\\u1794\\u17d2\\u179a\\u17bd\\u179b\\u1791\\u17c5\\u178f\\u17b6\\u1798\\u179a\\u178a\\u17bc\\u179c\\u1780\\u17b6\\u179b\\u179a\\u1794\\u179f\\u17cb\\u179c\\u17b6 \\u1781\\u17c2\\u1794\\u17d2\\u179a\\u17b6\\u17c6\\u1784 \\u1781\\u17c2\\u179c\\u179f\\u17d2\\u179f\\u17b6\", \"g_q0501/q0501\": \"\\u17a2\\u178f\\u17cb\\u1798\\u17b6\\u1793\\u1791\\u17c1\", \"g_q0501/q0502\": \"\\u1798\\u17b7\\u1793\\u1798\\u17b6\\u1793\\u17a2\\u17d2\\u1793\\u1780\\u1785\\u17c6\\u178e\\u17b6\\u1780\\u179f\\u17d2\\u179a\\u17bb\\u1780\\u1791\\u17c1 \\u1798\\u17b6\\u1793\\u178f\\u17c2\\u1780\\u1798\\u17d2\\u1798\\u1780\\u179a\\u1785\\u17c6\\u178e\\u17bc\\u179b\\u179f\\u17d2\\u179a\\u17bb\\u1780\\u1798\\u1780\\u1792\\u17d2\\u179c\\u17be\\u1780\\u17b6\\u179a\\u1787\\u17b6\\u1798\\u17bd\\u1799\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793\", \"g_q0501/q0503\": \"\\u1798\\u17b7\\u1793\\u1798\\u17b6\\u1793\\u1780\\u17b6\\u179a\\u1787\\u17bd\\u1789\\u178a\\u17bc\\u179a\\u17a2\\u17d2\\u179c\\u17b8\\u1780\\u17be\\u178f\\u17a1\\u17be\\u1784\\u1791\\u17c1 \\u178a\\u17c4\\u1799\\u179f\\u17b6\\u179a\\u1780\\u17d2\\u179a\\u17b7\\u1798\\u17a0\\u17ca\\u17bb\\u1793\\u1798\\u17b7\\u1793\\u1798\\u17b6\\u1793\\u1780\\u17b6\\u179a\\u1796\\u17b6\\u1780\\u17cb\\u1796\\u17d0\\u1793\\u17d2\\u1792\\u1787\\u17b6\\u1798\\u17bd\\u1799\\u17a2\\u17d2\\u1793\\u1780\\u1781\\u17b6\\u1784\\u1780\\u17d2\\u179a\\u17c5\\u1791\\u17c1\", \"comments\": \"\\u1798\\u17b7\\u1793\\u1798\\u17b6\\u1793\\u1791\\u17c1\", \"iFinish\": \"1\", \"__version__\": \"vFFd6cfwoCYGvnq6W7xRhA\", \"meta/audit\": \"audit.csv\", \"meta/instanceID\": \"uuid:b0ab66d5-9214-44e9-9dd7-5bcd0164d6bb\", \"_xform_id_string\": \"aP25nUip6ExqJGKfahmqAR\", \"_uuid\": \"b0ab66d5-9214-44e9-9dd7-5bcd0164d6bb\", \"_attachments\": [{\"download_url\": \"https://kc.humanitarianresponse.info/media/original?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2Fb0ab66d5-9214-44e9-9dd7-5bcd0164d6bb%2Faudit.csv\", \"download_large_url\": \"https://kc.humanitarianresponse.info/media/large?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2Fb0ab66d5-9214-44e9-9dd7-5bcd0164d6bb%2Faudit.csv\", \"download_medium_url\": \"https://kc.humanitarianresponse.info/media/medium?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2Fb0ab66d5-9214-44e9-9dd7-5bcd0164d6bb%2Faudit.csv\", \"download_small_url\": \"https://kc.humanitarianresponse.info/media/small?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2Fb0ab66d5-9214-44e9-9dd7-5bcd0164d6bb%2Faudit.csv\", \"mimetype\": \"text/comma-separated-values\", \"filename\": \"koboadmin_eiseinetworkapp/attachments/64e1b288cc89466aa9aa09283a963f3d/b0ab66d5-9214-44e9-9dd7-5bcd0164d6bb/audit.csv\", \"instance\": 417793109, \"xform\": 1363857, \"id\": 173506716}], \"_status\": \"submitted_via_web\", \"_geolocation\": [null, null], \"_submission_time\": \"2023-04-18T02:59:44\", \"_tags\": [], \"_notes\": [], \"_validation_status\": {}, \"_submitted_by\": \"eiseinetworkapp_kobo\"}', 'aP25nUip6ExqJGKfahmqAR', 'no', '417793109', '64e1b288cc89466aa9aa09283a963f3d', '2023-04-18T09:04:45.920+07:00', '2023-04-18T09:52:09.033+07:00', '2023-04-18', 'eiseinetworkapp_kobo', 'collect:cV3OqcZ3hXSoD5M6', '2023-04-18', 'ពូ ឡា', '2', 'ពូ ឡា (ប), ពូ សុក (ប)', '11', '1101', '110101', '11010102', 'មិនធ្លាប់មានការរាយការណ៍ទេ', 'មិនមានការទន្ទ្រានយកទេ ដោយសារវាជាដីព្រៃ', 'មិនមានទេ', 'មានការគ្រប់គ្រងកាកសំណល់ មានអាងស្តុកទឹក ហើយមានការព័ន្ធរបងមិនអោយសហគមន៍ចូលបានទេ', 'មាន ហើយសហគមន៍ក៏មានការយល់ព្រមដែរ', 'មាន១ភូមិដែលប៉ះពាល់ជាមួយក្រុមហ៊ុន ហើយក៏បានផ្លាស់ប្តូរទីលំនៅដោយទទួលបានសំណងពីក្រុមហ៊ុនផងដែរ', 'សហគមន៍ធ្លាប់មានទំនាស់ជាមួយក្រុមហ៊ុនទាក់ទងដើមជ័រ ប៉ុន្តែក្រុមហ៊ុនបានដោះស្រាយនិងផ្តល់ជាសំណងដល់ពួកគេ', 'ក្រុមហ៊ុនមានអាជ្ញាប័ណ្ណច្បាស់លាស់ ប្រភេទអាជីវកម្ម ជាក្រុមហ៊ុនស្តង់ដារមានការគោរពតាមគោលការណ៍ ធ្លាប់មានក្រុមហ៊ុនមកពឹងពាក់អោយជួយអន្តរាគមន៍ ហើយខ្ញុំក៏បានពាំនាំការពិគ្រោះយោបល់ទាំងអស់ទៅដល់សហគមន៍ផងដែរ', 'មិនធ្លាប់មានទេ ហើយក៏មិនករណីនេះកើតឡើងនៅក្នុងតំបន់របស់ខ្ញុំដែរ', 'ទឹកមិនមានការប្រែប្រួលទេ វាប្រែប្រួលទៅតាមរដូវកាលរបស់វា ខែប្រាំង ខែវស្សា', 'អត់មានទេ', 'មិនមានអ្នកចំណាកស្រុកទេ មានតែកម្មករចំណូលស្រុកមកធ្វើការជាមួយក្រុមហ៊ុន', 'មិនមានការជួញដូរអ្វីកើតឡើងទេ ដោយសារក្រិមហ៊ុនមិនមានការពាក់ព័ន្ធជាមួយអ្នកខាងក្រៅទេ', 'មិនមានទេ', '1', 'vFFd6cfwoCYGvnq6W7xRhA', 'audit.csv', 'uuid:b0ab66d5-9214-44e9-9dd7-5bcd0164d6bb', 'b0ab66d5-9214-44e9-9dd7-5bcd0164d6bb', '[{\"download_url\":\"https:\\/\\/kc.humanitarianresponse.info\\/media\\/original?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2Fb0ab66d5-9214-44e9-9dd7-5bcd0164d6bb%2Faudit.csv\",\"download_large_url\":\"https:\\/\\/kc.humanitarianresponse.info\\/media\\/large?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2Fb0ab66d5-9214-44e9-9dd7-5bcd0164d6bb%2Faudit.csv\",\"download_medium_url\":\"https:\\/\\/kc.humanitarianresponse.info\\/media\\/medium?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2Fb0ab66d5-9214-44e9-9dd7-5bcd0164d6bb%2Faudit.csv\",\"download_small_url\":\"https:\\/\\/kc.humanitarianresponse.info\\/media\\/small?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2Fb0ab66d5-9214-44e9-9dd7-5bcd0164d6bb%2Faudit.csv\",\"mimetype\":\"text\\/comma-separated-values\",\"filename\":\"koboadmin_eiseinetworkapp\\/attachments\\/64e1b288cc89466aa9aa09283a963f3d\\/b0ab66d5-9214-44e9-9dd7-5bcd0164d6bb\\/audit.csv\",\"instance\":417793109,\"xform\":1363857,\"id\":173506716}]', 'submitted_via_web', '[null,null]', '2023-04-18T02:59:44', '[]', '[]', '[]', 'eiseinetworkapp_kobo', NULL),
(4, '{\"_id\": 417794128, \"formhub/uuid\": \"64e1b288cc89466aa9aa09283a963f3d\", \"Tstart\": \"2023-04-18T09:09:16.094+07:00\", \"Tend\": \"2023-04-18T10:09:14.092+07:00\", \"Ttoday\": \"2023-04-18\", \"username\": \"eiseinetworkapp_kobo\", \"deviceid\": \"collect:bKdVxU70MEdPYuEk\", \"g_intro/date_interview\": \"2023-04-18\", \"g_intro/name_interview\": \"\\u1782\\u17b9\\u1798 \\u179f\\u17b6\\u179a\\u17c9\\u17b6\\u1793\\u17cb\", \"g_intro/sex_interview\": \"2\", \"g_intro/name_respon\": \"1-\\u1794\\u17ca\\u17bb\\u1793 \\u1792\\u17bf\\u1793 \\u1794\\u17d2\\u179a\\u17bb\\u179f 2- \\u17a1\\u17b6\\u1799 \\u1793\\u17c0\\u1780 \\u1794\\u17d2\\u179a\\u17bb\\u179f 3- \\u179f\\u17c2\\u1798 \\u1798\\u17bf\\u1793\", \"g_intro/province\": \"16\", \"g_intro/district\": \"1604\", \"g_intro/commune\": \"160401\", \"g_intro/village\": \"16040102\", \"g_envirog_natural/q0201\": \"\\u1798\\u17b6\\u17932\\u1781\\u17c2\\u17a0\\u17be\\u1799  \\u1792\\u17d2\\u179b\\u17b6\\u1794\\u17cb\\u1794\\u17b6\\u1793\\u179a\\u17b6\\u1799\\u1780\\u17b6\\u1799\\u17a0\\u17be\\u1799  \\u1780\\u17b6\\u179a\\u1794\\u17d2\\u179a\\u17c2\\u1794\\u17d2\\u179a\\u17bd\\u179b\\u1798\\u179f\\u1793\\u1795\\u179b\\u1794\\u17c9\\u17c7\\u1796\\u17b6\\u179b  \\u1794\\u17b6\\u1793\\u1787\\u17bc\\u1793\\u178a\\u17c6\\u178e\\u17b9\\u1784\\u1791\\u17c5\", \"g_envirog_natural/q0202\": \"\\u1798\\u17b6\\u1793 \\u1780\\u17b6\\u179a\\u1791\\u1793\\u17d2\\u179a\\u17b6\\u1793\\u1799\\u1780\\u178a\\u17b8  02 \\u17a0\\u17b7\\u178f\\u179f\\u178a\\u17c4\\u1799\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793\\u179a\\u17c9\\u17c2 \\u1798\\u17b6\\u179310\\u1782\\u17d2\\u179a\\u17bd\\u179f\\u17b6\\u179a \\u179b\\u17be\\u178a\\u17b8\\u179f\\u17d2\\u179a\\u17c2 \\u1795\\u17d2\\u178f\\u179b\\u17cb\\u1791\\u17c5\\u1790\\u17d2\\u1793\\u17b6\\u1780\\u17cb\\u179b\\u17be\", \"g_envirog_natural/q0203\": \"\\u1798\\u17b6\\u1793\\u1780\\u17b6\\u179a\\u1794\\u17b6\\u1780\\u17cb\\u178a\\u17b8 \\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793\\u1793\\u17c1\\u17c7\\u1794\\u17b6\\u1793\\u1787\\u17bd\\u1799\\u1787\\u17b6\\u1780\\u17b6\\u179a\\u179f\\u17b6\\u1784\\u179f\\u1784\\u17cb\\u179f\\u17d2\\u179a\\u17c7\\u1791\\u1794\\u17cb\\u179f\\u17d2\\u1780\\u17b6\\u178f\\u17cb\", \"g_envirog_natural/q0204\": \"\\u1798\\u17b6\\u1793 \\u1794\\u17c9\\u17c7\\u1796\\u17b6\\u179b\\u17cb\\u1780\\u17b6\\u1780\\u179f\\u17c6\\u178e\\u179b\\u17cb \\u1785\\u17c6\\u1793\\u17bd\\u1793 10\\u1782\\u17d2\\u179a\\u17bd\\u179f\\u17b6\\u179a\\u1780\\u17be\\u178f\\u178f\\u17b6\\u17c6\\u1784\\u1796\\u17b8\\u1786\\u17d2\\u1793\\u17b6\\u17c62022  \\u178a\\u17c4\\u1799\\u1798\\u17b6\\u1793\\u1780\\u17b6\\u179a\\u178a\\u17c4\\u17c7\\u179f\\u17d2\\u179a\\u17b6\\u1799\\u1787\\u17b6\\u178a\\u17c6\\u178e\\u1784\\u179a\\u17bd\\u1785\\u17a0\\u17be\\u1799\\u17d4\", \"g_violation/q0301\": \"\\u1798\\u17b7\\u1793\\u1798\\u17b6\\u1793\\u1780\\u17b6\\u179a\\u1794\\u17d2\\u179a\\u1787\\u17bb\\u17c6\\u1796\\u17b7\\u1782\\u17d2\\u179a\\u17c4\\u17c7\\u1799\\u17c4\\u1794\\u179b\\u17cb\\u1791\\u17c1\", \"g_violation/q0302\": \"\\u1798\\u17b7\\u1793\\u1798\\u17b6\\u1793 \\u1780\\u17b6\\u179a\\u1795\\u17d2\\u179b\\u17b6\\u179f\\u17cb\\u1794\\u17d2\\u178f\\u17bc\\u179a\\u1791\\u17b8\\u178f\\u17b6\\u17c6\\u1784\\u178a\\u17c4\\u1799\\u1794\\u1784\\u17d2\\u1781\\u17c6\\u1793\\u17c5\\u17a1\\u17be\\u1799\\u1791\\u17c1\", \"g_violation/q0303\": \"\\u1798\\u17b6\\u1793 \\u1794\\u17b6\\u1793\\u179a\\u17b6\\u1799\\u1780\\u17b6\\u179a\\u178e\\u17cf \\u1782\\u178e\\u17c7\\u1780\\u1798\\u17d2\\u1798\\u17b6\\u1796\\u17d2\\u179a\\u17c3\\u1788\\u17be \\u178f\\u17c1\\u1798\\u1780\\u1780\\u17d2\\u179a\\u17c4\\u1798\\u1798\\u17d2\\u178a\\u1784\\u1798\\u17be\\u179b\\u17a2\\u17b6\\u1793\\u17c1\\u17c7\\u179c\\u17b7\\u1789\\u178f\\u17c2\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793\\u178e\\u17b6\\u178a\\u17c2\\u179a\\u1780\\u17c6\\u1796 \\u17bb\\u1784\\u178f\\u17c2\\u1793\\u17c5\\u1780\\u17d2\\u1793\\u17bb\\u1784\\u178f\\u17c6\\u1794\\u1793\\u17cb\\u17a2\\u17d2\\u1793\\u1780\\u17d4\", \"g_violation/q0304\": \"\\u1798\\u17b6\\u1793\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793\\u179a\\u17c9\\u17c2\\u1798\\u17bd\\u1799\\u1793\\u17c5\\u1780\\u17d2\\u1793\\u17bb\\u1784\\u178f\\u17c6\\u1794\\u1793\\u17cb\\u179a\\u1794\\u179f\\u17cb\\u1781\\u17d2\\u1789\\u17bb\\u17c6 \\u1796\\u17bd\\u1780\\u1782\\u17c1\\u1798\\u17b6\\u1793\\u17a2\\u17b6\\u1787\\u17d2\\u1789\\u17b6\\u1794\\u17d0\\u178e\\u17d2\\u178e \\u1794\\u17c9\\u17bb\\u1793\\u17d2\\u178f\\u17c2\\u1796\\u17bd\\u1780\\u1782\\u17c1\\u17a2\\u178f\\u17cb\\u1782\\u17c4\\u179a\\u1796 \\u178f\\u17b6\\u1798\\u1782\\u17c4\\u179b\\u1780\\u17b6\\u179a\\u178e\\u17cd\\u1791\\u17c1\\u17d4 \\u1796\\u17bd\\u1780\\u1782\\u17c1\\u17a2\\u178f\\u17cb\\u1794\\u17b6\\u1793\\u1798\\u1780\\u1791\\u17b6\\u1780\\u17cb\\u1791\\u1784\\u1787\\u17b6\\u1798\\u17bd\\u1799\\u1796\\u17bd\\u1780\\u1799\\u17be\\u1784\\u1781\\u17d2\\u1789\\u17bb\\u17c6\\u17a1\\u17be\\u1799 \\u1780\\u17d2\\u1793\\u17bb\\u1784\\u1780\\u17b6\\u179a\\u1792\\u17d2\\u179c\\u17be\\u17a2\\u1793\\u17d2\\u178f\\u179a\\u17b6\\u1782\\u1798\\u1793\\u17cd\", \"g_q0401/q0401\": \"\\u1782\\u17c1\\u1794\\u17b6\\u1793\\u179a\\u17b6\\u1799\\u1780\\u17b6\\u179a\\u178e\\u17cd\\u17a2\\u17c6\\u1796\\u17b8\\u1780\\u17b6\\u179a\\u179a\\u17c6\\u179b\\u17c4\\u1797\\u179f\\u17c1\\u1796\\u1795\\u17d2\\u179f\\u17c6\\u179f\\u17bb\\u179c\\u17c8 \\u178a\\u17c4\\u1799\\u17a0\\u17c5\\u1787\\u1793\\u179b\\u17d2\\u1798\\u17be\\u179f \\u1798\\u1780\\u1796\\u17b7\\u1797\\u17b6\\u1780\\u17d2\\u179f\\u17b6 \\u178a\\u17c4\\u17c7\\u179f\\u17d2\\u179a\\u17b6\\u1799\\u1780\\u17d2\\u1793\\u17bb\\u1784\\u1794\\u1789\\u17d2\\u17a0\\u17b6\\u17a0\\u17d2\\u1793\\u17b9\\u1784 \\u1782\\u17c1\\u1794\\u17b6\\u1793\\u179a\\u17b6\\u1799\\u1780\\u17b6\\u179a\\u178e\\u17cd\\u1798\\u1780\\u178a\\u179b\\u17cb\\u1796\\u17bd\\u1780\\u1799\\u17be\\u1784\\u1781\\u17d2\\u1789\\u17bb\\u17c6\\u1796\\u17b8\\u1783\\u17b6\\u178f\\u1780\\u1798\\u17d2\\u1798\\u17d4\", \"g_q0401/q0402\": \"\\u1782\\u17c1\\u1794\\u17b6\\u1793\\u179a\\u17b6\\u1799\\u1780\\u17b6\\u179a\\u178e\\u17cd\\u1798\\u17c9\\u17c4\\u1784\\u17a2\\u17c6\\u1796\\u17b8\\u179a\\u17bf\\u1784\\u1798\\u17b6\\u1793\\u1780\\u17c6\\u178e\\u1780\\u1780\\u17c6 \\u1793\\u17c5\\u1780\\u17d2\\u1793\\u17bb\\u1784\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793\\u179a\\u17c9\\u17c2\\u1793\\u17c4\\u17c7\\u17af\\u1784 \\u1799\\u17be\\u1784\\u1781\\u17d2\\u1789\\u17bb\\u17c6\\u1787\\u17b6\\u17a2\\u17b6\\u1787\\u17d2\\u1789\\u17b6\\u1792\\u179a\\u1794\\u17b6\\u1793\\u1792\\u17d2\\u179c\\u17be\\u1780\\u17b6\\u179a\\u1794\\u17d2\\u178a\\u17b9\\u1784\\u1791\\u17c5\\u1790\\u17d2\\u1793\\u17b6\\u1780\\u17cb\\u179b\\u17be\\u17b2\\u17d2\\u1799\\u1787\\u17bd\\u1799\\u178a\\u17c4\\u17c7\\u179f\\u17d2\\u179a\\u17b6\\u1799\\u179f\\u1798\\u17d2\\u179a\\u17bd\\u179b\", \"g_q0501/q0501\": \"\\u1782\\u17c1\\u1794\\u17b6\\u1793\\u179a\\u17b6\\u1799\\u1780\\u17b6\\u179a\\u178e\\u17cd \\u1798\\u1780\\u1799\\u17be\\u1784\\u1781\\u17d2\\u1789\\u17bb\\u17c6\\u17a2\\u17c6\\u1796\\u17b8\\u1780\\u17b6\\u179a\\u179f\\u17d2\\u179b\\u17b6\\u1794\\u17cb\\u179f\\u178f\\u17d2\\u179c\\u1793\\u17c5\\u1780\\u17d2\\u1793\\u17bb\\u1784\\u178f\\u17c6\\u1794\\u1793\\u17cb \\u1798\\u17b6\\u1793\\u1785\\u17c6\\u1793\\u17bd\\u1793 100 \\u1780\\u17d2\\u1794\\u17b6\\u179b \\u1793\\u17c5\\u1780\\u17d2\\u1793\\u17bb\\u1784\\u1793\\u17c4\\u17c7\\u1798\\u17b6\\u1793\\u179f\\u178f\\u17d2\\u179c\\u1798\\u17b6\\u1793\\u17cb \\u1785\\u17c6\\u1793\\u17bd\\u1793 70 \\u1780\\u17d2\\u1794\\u17b6\\u179b \\u179a\\u17bd\\u1798\\u1791\\u17b6\\u17c6\\u1784\\u179f\\u178f\\u17d2\\u179c\\u1787\\u17d2\\u179a\\u17bc\\u1780 30 \\u1780\\u17d2\\u1794\\u17b6\\u179b\\u1795\\u1784\\u178a\\u17c2\\u179a\\u17d4\", \"g_q0501/q0502\": \"\\u1780\\u17d2\\u1793\\u17bb\\u1784\\u179a\\u1799\\u17c8\\u1796\\u17c1\\u179b 6 \\u1781\\u17c2\\u1793\\u17c1\\u17c7 \\u1798\\u17b6\\u1793\\u1798\\u1793\\u17bb\\u179f\\u17d2\\u179f\\u1785\\u17c6\\u178e\\u17b6\\u1780\\u179f\\u17d2\\u179a\\u17bb\\u1780\\u1785\\u17c6\\u1793\\u17bd\\u1793 60 \\u1782\\u17d2\\u179a\\u17bd\\u179f\\u17b6\\u179a\\u17d4 \\u1791\\u17c5\\u1790\\u17c3\\u1785\\u17c6\\u1793\\u17bd\\u1793 40 \\u1782\\u17d2\\u179a\\u17bd\\u179f\\u17b6\\u179a \\u1793\\u17b7\\u1784\\u1791\\u17c5\\u1781\\u17c1\\u178f\\u17d2\\u178f\\u1795\\u17d2\\u179f\\u17c1\\u1784\\u17d7 20 \\u1782\\u17d2\\u179a\\u17bd\\u179f\\u17b6\\u179a \\u178f\\u17be\\u17a2\\u17d2\\u1793\\u1780\\u1785\\u17c6\\u178e\\u17b6\\u1780\\u179f\\u17d2\\u179a\\u17bb\\u1780\\u17a0\\u17d2\\u1793\\u17b9\\u1784\\u1794\\u17c9\\u17c7\\u1796\\u17b6\\u179b\\u17cb\\u178a\\u17c4\\u1799\\u179f\\u17b6\\u179a\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793 \\u1798\\u1780\\u178f\\u17b6\\u17c6\\u1784\\u1791\\u17b8\\u179b\\u17c6\\u1793\\u17c5 \\u17a5\\u17a1\\u17bc\\u179c\\u1793\\u17c1\\u17c7\\u1798\\u17b6\\u1793\\u17a2\\u17d2\\u1793\\u1780\\u178f\\u17d2\\u179a\\u17a1\\u1794\\u17cb\\u1798\\u1780\\u179c\\u17b7\\u1789 20 \\u1782\\u17d2\\u179a\\u17bd\\u179f\\u17b6\\u179a\", \"g_q0501/q0503\": \"\\u1785\\u17b6\\u1794\\u17cb\\u178f\\u17b6\\u17c6\\u1784\\u1796\\u17b8\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793\\u1793\\u17c1\\u17c7 \\u1798\\u1780\\u1794\\u1784\\u17d2\\u1780\\u17be\\u178f\\u1793\\u17c5\\u1791\\u17b8\\u1793\\u17c1\\u17c7\\u1782\\u17ba\\u1798\\u17b6\\u1793 \\u1796\\u17c1\\u179b\\u179f\\u17ca\\u17c2\\u179a\\u1785\\u17c2 \\u1785\\u17d2\\u179a\\u17be\\u1793 \\u178a\\u17c2\\u179b\\u1793\\u17b6\\u17c6\\u17b2\\u17d2\\u1799\\u1795\\u179b\\u179c\\u17b7\\u1794\\u17b6\\u1780\\u1793\\u17c5\\u1780\\u17d2\\u1793\\u17bb\\u1784 \\u1798\\u17bc\\u179b\\u178a\\u17d2\\u178b\\u17b6\\u1793\", \"comments\": \"\\u17a2\\u178f\\u17cb\\u1798\\u17b6\\u1793\\u1791\\u17c1\", \"iFinish\": \"1\", \"__version__\": \"vFFd6cfwoCYGvnq6W7xRhA\", \"meta/audit\": \"audit.csv\", \"meta/instanceID\": \"uuid:683a52d0-601c-4256-abd5-866f7b0d8eff\", \"_xform_id_string\": \"aP25nUip6ExqJGKfahmqAR\", \"_uuid\": \"683a52d0-601c-4256-abd5-866f7b0d8eff\", \"_attachments\": [{\"download_url\": \"https://kc.humanitarianresponse.info/media/original?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2F683a52d0-601c-4256-abd5-866f7b0d8eff%2Faudit.csv\", \"download_large_url\": \"https://kc.humanitarianresponse.info/media/large?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2F683a52d0-601c-4256-abd5-866f7b0d8eff%2Faudit.csv\", \"download_medium_url\": \"https://kc.humanitarianresponse.info/media/medium?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2F683a52d0-601c-4256-abd5-866f7b0d8eff%2Faudit.csv\", \"download_small_url\": \"https://kc.humanitarianresponse.info/media/small?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2F683a52d0-601c-4256-abd5-866f7b0d8eff%2Faudit.csv\", \"mimetype\": \"text/comma-separated-values\", \"filename\": \"koboadmin_eiseinetworkapp/attachments/64e1b288cc89466aa9aa09283a963f3d/683a52d0-601c-4256-abd5-866f7b0d8eff/audit.csv\", \"instance\": 417794128, \"xform\": 1363857, \"id\": 173507359}], \"_status\": \"submitted_via_web\", \"_geolocation\": [null, null], \"_submission_time\": \"2023-04-18T03:09:55\", \"_tags\": [], \"_notes\": [], \"_validation_status\": {}, \"_submitted_by\": \"eiseinetworkapp_kobo\"}', 'aP25nUip6ExqJGKfahmqAR', 'no', '417794128', '64e1b288cc89466aa9aa09283a963f3d', '2023-04-18T09:09:16.094+07:00', '2023-04-18T10:09:14.092+07:00', '2023-04-18', 'eiseinetworkapp_kobo', 'collect:bKdVxU70MEdPYuEk', '2023-04-18', 'គឹម សារ៉ាន់', '2', '1-ប៊ុន ធឿន ប្រុស 2- ឡាយ នៀក ប្រុស 3- សែម មឿន', '16', '1604', '160401', '16040102', 'មាន2ខែហើយ  ធ្លាប់បានរាយកាយហើយ  ការប្រែប្រួលមសនផលប៉ះពាល  បានជូនដំណឹងទៅ', 'មាន ការទន្រានយកដី  02 ហិតសដោយក្រុមហ៊ុនរ៉ែ មាន10គ្រួសារ លើដីស្រែ ផ្តល់ទៅថ្នាក់លើ', 'មានការបាក់ដី ក្រុមហ៊ុននេះបានជួយជាការសាងសង់ស្រះទប់ស្កាត់', 'មាន ប៉ះពាល់កាកសំណល់ ចំនួន 10គ្រួសារកើតតាំងពីឆ្នាំ2022  ដោយមានការដោះស្រាយជាដំណងរួចហើយ។', 'មិនមានការប្រជុំពិគ្រោះយោបល់ទេ', 'មិនមាន ការផ្លាស់ប្តូរទីតាំងដោយបង្ខំនៅឡើយទេ', 'មាន បានរាយការណ៏ គណះកម្មាព្រៃឈើ តេមកក្រោមម្ដងមើលអានេះវិញតែក្រុមហ៊ុនណាដែរកំព ុងតែនៅក្នុងតំបន់អ្នក។', 'មានក្រុមហ៊ុនរ៉ែមួយនៅក្នុងតំបន់របស់ខ្ញុំ ពួកគេមានអាជ្ញាប័ណ្ណ ប៉ុន្តែពួកគេអត់គោរព តាមគោលការណ៍ទេ។ ពួកគេអត់បានមកទាក់ទងជាមួយពួកយើងខ្ញុំឡើយ ក្នុងការធ្វើអន្តរាគមន៍', 'គេបានរាយការណ៍អំពីការរំលោភសេពផ្សំសុវៈ ដោយហៅជនល្មើស មកពិភាក្សា ដោះស្រាយក្នុងបញ្ហាហ្នឹង គេបានរាយការណ៍មកដល់ពួកយើងខ្ញុំពីឃាតកម្ម។', 'គេបានរាយការណ៍ម៉ោងអំពីរឿងមានកំណកកំ នៅក្នុងក្រុមហ៊ុនរ៉ែនោះឯង យើងខ្ញុំជាអាជ្ញាធរបានធ្វើការប្ដឹងទៅថ្នាក់លើឲ្យជួយដោះស្រាយសម្រួល', 'គេបានរាយការណ៍ មកយើងខ្ញុំអំពីការស្លាប់សត្វនៅក្នុងតំបន់ មានចំនួន 100 ក្បាល នៅក្នុងនោះមានសត្វមាន់ ចំនួន 70 ក្បាល រួមទាំងសត្វជ្រូក 30 ក្បាលផងដែរ។', 'ក្នុងរយៈពេល 6 ខែនេះ មានមនុស្សចំណាកស្រុកចំនួន 60 គ្រួសារ។ ទៅថៃចំនួន 40 គ្រួសារ និងទៅខេត្តផ្សេងៗ 20 គ្រួសារ តើអ្នកចំណាកស្រុកហ្នឹងប៉ះពាល់ដោយសារក្រុមហ៊ុន មកតាំងទីលំនៅ ឥឡូវនេះមានអ្នកត្រឡប់មកវិញ 20 គ្រួសារ', 'ចាប់តាំងពីក្រុមហ៊ុននេះ មកបង្កើតនៅទីនេះគឺមាន ពេលស៊ែរចែ ច្រើន ដែលនាំឲ្យផលវិបាកនៅក្នុង មូលដ្ឋាន', 'អត់មានទេ', '1', 'vFFd6cfwoCYGvnq6W7xRhA', 'audit.csv', 'uuid:683a52d0-601c-4256-abd5-866f7b0d8eff', '683a52d0-601c-4256-abd5-866f7b0d8eff', '[{\"download_url\":\"https:\\/\\/kc.humanitarianresponse.info\\/media\\/original?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2F683a52d0-601c-4256-abd5-866f7b0d8eff%2Faudit.csv\",\"download_large_url\":\"https:\\/\\/kc.humanitarianresponse.info\\/media\\/large?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2F683a52d0-601c-4256-abd5-866f7b0d8eff%2Faudit.csv\",\"download_medium_url\":\"https:\\/\\/kc.humanitarianresponse.info\\/media\\/medium?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2F683a52d0-601c-4256-abd5-866f7b0d8eff%2Faudit.csv\",\"download_small_url\":\"https:\\/\\/kc.humanitarianresponse.info\\/media\\/small?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2F683a52d0-601c-4256-abd5-866f7b0d8eff%2Faudit.csv\",\"mimetype\":\"text\\/comma-separated-values\",\"filename\":\"koboadmin_eiseinetworkapp\\/attachments\\/64e1b288cc89466aa9aa09283a963f3d\\/683a52d0-601c-4256-abd5-866f7b0d8eff\\/audit.csv\",\"instance\":417794128,\"xform\":1363857,\"id\":173507359}]', 'submitted_via_web', '[null,null]', '2023-04-18T03:09:55', '[]', '[]', '[]', 'eiseinetworkapp_kobo', NULL);
INSERT INTO `tbl_02_authority` (`id`, `contents`, `_xform_id_string`, `trash`, `_id`, `uuid`, `tstart`, `tend`, `ttoday`, `username`, `deviceid`, `date_interview`, `name_interview`, `sex_interview`, `name_respon`, `province`, `district`, `commune`, `village`, `q0201`, `q0202`, `q0203`, `q0204`, `q0301`, `q0302`, `q0303`, `q0304`, `q0401`, `q0402`, `q0501`, `q0502`, `q0503`, `comments`, `ifinish`, `__version__`, `audit`, `instanceid`, `_uuid`, `_attachments`, `_status`, `_geolocation`, `_submission_time`, `_tags`, `_notes`, `_validation_status`, `_submitted_by`, `phonenumber`) VALUES
(5, '{\"_id\": 417804273, \"formhub/uuid\": \"64e1b288cc89466aa9aa09283a963f3d\", \"Tstart\": \"2023-04-18T10:18:45.177+07:00\", \"Tend\": \"2023-04-18T11:26:59.526+07:00\", \"Ttoday\": \"2023-04-18\", \"username\": \"username not found\", \"phonenumber\": \"phonenumber not found\", \"deviceid\": \"ee.humanitarianresponse.info:bbu0XUyrgsxA6sO3\", \"g_intro/date_interview\": \"2023-04-18\", \"g_intro/name_interview\": \"\\u179f\\u17d2\\u179a\\u17be\\u179c \\u1780\\u17b6\\u17a0\\u1793\", \"g_intro/sex_interview\": \"2\", \"g_intro/name_respon\": \"\\u17e1-\\u179f\\u17d2\\u179a\\u17be\\u179c \\u1780\\u17b6\\u17a0\\u1793 (\\u1794\\u17d2\\u179a\\u17bb\\u179f\\n\\u17e2-\\u178a\\u17c1\\u178f \\u1793\\u17b8 (\\u1794\\u17d2\\u179a\\u17bb\\u179f)\", \"g_intro/province\": \"11\", \"g_intro/district\": \"1101\", \"g_intro/commune\": \"110101\", \"g_intro/village\": \"11010102\", \"g_envirog_natural/q0201\": \"\\u1798\\u17b7\\u1793\\u1792\\u17d2\\u179b\\u17b6\\u1794\\u17cb\\u1798\\u17b6\\u1793\\u1780\\u17b6\\u179a\\u179a\\u17b6\\u1799\\u1780\\u17b6\\u179a\\u178e\\u17cd\\u17a2\\u17c6\\u1796\\u17b8\\u1794\\u1789\\u17d2\\u17a0\\u17b6\\u1791\\u17b9\\u1780\\u1780\\u1784\\u17d2\\u179c\\u1780\\u17a1\\u17be\\u1799\\u17d4 \\u1787\\u17b6\\u1792\\u1798\\u17d2\\u1798\\u178f\\u17b6\\u1791\\u17b9\\u1780\\u178f\\u17c2\\u1798\\u17b6\\u1793\\u1780\\u17b6\\u179a\\u1794\\u17d2\\u179a\\u17c2\\u1794\\u17d2\\u179a\\u17bd\\u179b\\u1791\\u17c5\\u178f\\u17b6\\u1798\\u179a\\u178a\\u17bc\\u179c\\u1780\\u17b6\\u179b \\u178a\\u17bc\\u1785\\u1787\\u17b6 \\u1793\\u17c5\\u179a\\u178a\\u17bc\\u179c\\u1794\\u17d2\\u179a\\u17b6\\u17c6\\u1784\\u1796\\u17b8\\u1781\\u17c2\\u179c\\u17b7\\u1785\\u17d2\\u1786\\u17b7\\u1780\\u17b6 \\u178a\\u179b\\u17cb\\u1781\\u17c2\\u1798\\u17c1\\u179f\\u17b6 \\u1791\\u17b9\\u1780\\u1790\\u17d2\\u179b\\u17b6\\u1787\\u17b6\\u1792\\u1798\\u17d2\\u1798\\u178f\\u17b6 \\u1785\\u17c6\\u1796\\u17c4\\u17c7\\u179a\\u178a\\u17bc\\u179c\\u179c\\u179f\\u17d2\\u179f\\u17b6\\u1785\\u17b6\\u1794\\u17cb\\u1796\\u17b8\\u1781\\u17c2\\u17a7\\u179f\\u1797\\u17b6 \\u178a\\u179b\\u17cb\\u1781\\u17c2\\u178f\\u17bb\\u179b\\u17b6\\u1798\\u17b6\\u1793\\u1797\\u17d2\\u1789\\u17c0\\u1784\\u1792\\u17d2\\u179c\\u17be\\u17a2\\u17c4\\u1799\\u179a\\u1794\\u17b6\\u1799\\u178a\\u17b8\\u17a0\\u17bc\\u1785\\u17d2\\u179a\\u17c4\\u17c7\\u1785\\u17bc\\u179b\\u1791\\u17b9\\u1780 \\u1792\\u17d2\\u179c\\u17be\\u17a2\\u17c4\\u1799\\u179f\\u1797\\u17b6\\u1796\\u1791\\u17b9\\u1780\\u1794\\u17d2\\u179a\\u17c2\\u1787\\u17b6\\u179b\\u17d2\\u17a2\\u1780\\u17cb\\u17d4\\n\\u1785\\u17c6\\u1796\\u17c4\\u17c7\\u1780\\u17b6\\u179a\\u1794\\u17d2\\u179a\\u17c2\\u1794\\u17d2\\u179a\\u17bd\\u179b\\u1794\\u17c2\\u1793\\u1792\\u1798\\u17d2\\u1798\\u1787\\u17b6\\u178f\\u17b7 \\u1798\\u17b7\\u1793\\u1798\\u17b6\\u1793\\u17a2\\u17d2\\u179c\\u17b8\\u1794\\u17c9\\u17c7\\u1796\\u17b6\\u179b\\u17cb\\u178a\\u179b\\u17cb\\u1794\\u17d2\\u179a\\u1787\\u17b6\\u1796\\u179b\\u179a\\u178a\\u17d2\\u178b\\u1792\\u17d2\\u1784\\u1793\\u17cb\\u1792\\u17d2\\u1784\\u179a\\u17a1\\u17be\\u1799\\u17d4\", \"g_envirog_natural/q0202\": \"\\u1785\\u17c6\\u1796\\u17c4\\u17c7\\u1795\\u17d2\\u1791\\u17c3\\u178a\\u17b8\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793\\u1792\\u17d2\\u179c\\u17be\\u1780\\u17b6\\u179a\\u179c\\u17b7\\u1793\\u17b7\\u1799\\u17c4\\u1782\\u1793\\u17c1\\u17c7\\u1798\\u17b7\\u1793\\u1798\\u17b6\\u1793\\u1794\\u17c9\\u17c7\\u1796\\u17b6\\u179b\\u17cb\\u178a\\u179b\\u17cb\\u178a\\u17b8\\u1780\\u179f\\u17b7\\u1780\\u1798\\u17d2\\u1798\\u179a\\u1794\\u179f\\u17cb\\u1794\\u17d2\\u179a\\u1787\\u17b6\\u1796\\u179b\\u179a\\u178a\\u17d2\\u178b\\u17a1\\u17be\\u1799 \\u178a\\u17c4\\u1799\\u179f\\u17b6\\u179a\\u179f\\u17d2\\u1790\\u17b7\\u178f\\u1793\\u17c5\\u1780\\u17d2\\u1793\\u17bb\\u1784\\u178f\\u17c6\\u1794\\u1793\\u17cb\\u1796\\u17d2\\u179a\\u17c3\\u179a\\u1794\\u179f\\u17cb\\u179f\\u17a0\\u1782\\u1798\\u1793\\u17cd\\u17d4\", \"g_envirog_natural/q0203\": \"\\u1798\\u17b7\\u1793\\u1798\\u17b6\\u1793\\u1780\\u179a\\u178e\\u17b8\\u1794\\u17b6\\u1780\\u17cb\\u178a\\u17b8 \\u17ac\\u17a0\\u17bc\\u179a\\u1785\\u17d2\\u179a\\u17c4\\u17c7\\u178a\\u17b8\\u17a1\\u17be\\u1799\", \"g_envirog_natural/q0204\": \"\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793\\u1798\\u17b6\\u1793\\u1780\\u17b6\\u179a\\u1782\\u17d2\\u179a\\u1794\\u17cb\\u1782\\u17d2\\u179a\\u1784\\u178f\\u17d2\\u179a\\u17b9\\u1798\\u178f\\u17d2\\u179a\\u17bc\\u179c \\u178a\\u17c4\\u1799\\u1782\\u17c1\\u1794\\u17b6\\u1793\\u1792\\u17d2\\u179c\\u17cb\\u179a\\u1794\\u1784\\u1796\\u17d0\\u1793\\u17d2\\u1792\\u1787\\u17bb\\u17c6\\u179c\\u17b7\\u1789\\u178f\\u17c6\\u1794\\u1793\\u17cb\\u1793\\u17c4\\u17c7 \\u178a\\u17be\\u1798\\u17d2\\u1794\\u17b8\\u1780\\u17a6\\u17a2\\u17c4\\u1799\\u179f\\u17a0\\u1782\\u1798\\u1793\\u17cd\\u1798\\u17b6\\u1793\\u1782\\u17d2\\u179a\\u17c4\\u17c7\\u1790\\u17d2\\u1793\\u17b6\\u1780\\u17cb\\u17d4\", \"g_violation/q0301\": \"\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793\\u178f\\u17c2\\u1784\\u1798\\u17b6\\u1793\\u1787\\u17b6\\u1780\\u17b7\\u1785\\u17d2\\u1785\\u1794\\u17d2\\u179a\\u1787\\u17bb\\u17c6\\u1787\\u17b6\\u1798\\u17bd\\u1799\\u17a2\\u17b6\\u1787\\u17d2\\u1789\\u17b6\\u1792\\u179a\\u1798\\u17bc\\u179b\\u178a\\u17d2\\u178b\\u17b6\\u1793 \\u1796\\u17c1\\u179b\\u1798\\u17b6\\u1793\\u1794\\u1789\\u17d2\\u17a0\\u17b6\\u17a2\\u17d2\\u179c\\u17b8\\u1798\\u17bd\\u1799\\u1780\\u17be\\u178f\\u17a1\\u17be\\u1784\\u17d4 \\u17a0\\u17be\\u1799\\u17a2\\u17b6\\u1787\\u17d2\\u1789\\u17b6\\u178f\\u1792\\u179a\\u178f\\u17c2\\u1799\\u1780\\u1799\\u1780\\u1796\\u17d0\\u178f\\u17cc\\u1798\\u17b6\\u1793\\u1793\\u17b6\\u1793\\u17b6 \\u1791\\u17c5\\u1796\\u17b7\\u1782\\u17d2\\u179a\\u17c4\\u17c7\\u1799\\u17c4\\u1794\\u179b\\u17cb\\u1787\\u17b6\\u1798\\u17bd\\u1799\\u179f\\u17a0\\u1782\\u1798\\u1793\\u17cd\\u17d4\", \"g_violation/q0302\": \"\\u179f\\u17a0\\u1782\\u1798\\u1793\\u17cd\\u1785\\u17c6\\u1793\\u17bd\\u1793\\u1798\\u17bd\\u1799\\u1797\\u17bc\\u1798\\u17b7\\u1794\\u17c9\\u17c7\\u1785\\u17c6\\u178f\\u17c6\\u1794\\u1793\\u17cb\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793\\u179c\\u17b7\\u1793\\u17b7\\u1799\\u17c4\\u1782 \\u178a\\u17c4\\u1799\\u179f\\u17a0\\u1782\\u1798\\u1793\\u17cd\\u1796\\u17d2\\u179a\\u1798\\u1785\\u17b6\\u1780\\u17cb\\u1785\\u17c1\\u1789\\u1796\\u17b8\\u178f\\u17c6\\u1794\\u1793\\u17cb\\u1793\\u17c4\\u17c7\\u1787\\u17b6\\u1798\\u17bd\\u1799\\u1780\\u17b6\\u179a\\u1795\\u17d2\\u178a\\u179b\\u17cb\\u179f\\u17c6\\u178e\\u1784\\u1796\\u17b8\\u179f\\u17c6\\u178e\\u17b6\\u1780\\u17cb\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793\\u1795\\u1784\\u178a\\u17c2\\u179a\\u17d4\", \"g_violation/q0303\": \"\\u178f\\u17c6\\u1794\\u1793\\u17cb\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793\\u179c\\u17b7\\u1793\\u17b7\\u1799\\u17c4\\u1782\\u1787\\u17b6\\u178f\\u17c6\\u1794\\u1793\\u17cb\\u179f\\u17a0\\u1782\\u1798\\u1793\\u17cd\\u1792\\u17d2\\u179c\\u17be\\u1780\\u17b6\\u179a\\u179c\\u17b7\\u1793\\u17b7\\u1799\\u17c4\\u1782\\u178a\\u17bc\\u1785\\u1793\\u17c1\\u17c7\\u1798\\u17b6\\u1793\\u1780\\u17b6\\u179a\\u1794\\u17c9\\u17c7\\u1796\\u17b6\\u179b\\u17cb\\u178a\\u179b\\u17cb\\u178a\\u17be\\u1798\\u1787\\u17d0\\u179a\\u1787\\u17d0\\u179a\\u1785\\u17d2\\u1794\\u17c4\\u17c7\\u179a\\u1794\\u179f\\u17cb\\u179f\\u17a0\\u1782\\u1798\\u1793\\u17cd \\u17a0\\u17be\\u1799\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793\\u1794\\u17b6\\u1793\\u1795\\u17d2\\u178a\\u179b\\u17cb\\u1787\\u17b6\\u179f\\u17c6\\u178e\\u1784\\u1785\\u17c6\\u1796\\u17c4\\u17c7\\u1780\\u17b6\\u179a\\u1781\\u17bc\\u1785\\u1781\\u17b6\\u178f\\u178a\\u17be\\u1798\\u1787\\u17d0\\u179a\\u1785\\u17d2\\u1794\\u17c4\\u17c7\\u179a\\u1794\\u179f\\u17cb\\u179f\\u17a0\\u1782\\u1798\\u1793\\u17cd \\u178a\\u17c4\\u1799\\u17a2\\u17c4\\u1799\\u1798\\u17bd\\u1799\\u178a\\u17be\\u1798 \\u17e2\\u17e0\\u17e0\\u17e0\\u17e0\\u17e0\\u179a\\u17c0\\u179b\\u17d4\", \"g_violation/q0304\": \"\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793\\u1793\\u17c1\\u17c7\\u1787\\u17b6\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793\\u179f\\u17d2\\u179a\\u1794\\u1785\\u17d2\\u1794\\u17b6\\u1794\\u17ad\\u1798\\u17b6\\u1793\\u17a2\\u17b6\\u1787\\u17d2\\u1789\\u17b6\\u1794\\u17d0\\u178e\\u17d2\\u178e\\u178f\\u17d2\\u179a\\u17b9\\u1798\\u178f\\u17d2\\u179a\\u17bc\\u179c\\u17d4\", \"g_q0401/q0401\": \"\\u1781\\u17d2\\u1789\\u17bb\\u17c6\\u1798\\u17b7\\u1793\\u1791\\u1791\\u17bc\\u179b\\u1794\\u17b6\\u1793\\u1780\\u17b6\\u179a\\u179a\\u17b6\\u1799\\u1780\\u17b6\\u179a\\u178e\\u17cd\\u1785\\u17c6\\u1796\\u17c4\\u17c7\\u1780\\u179a\\u178e\\u17b8\\u1783\\u17b6\\u178f\\u17cb\\u1780\\u1798\\u17d2\\u1798 \\u1793\\u17b7\\u1784\\u179a\\u17c6\\u179b\\u17c4\\u1797\\u179f\\u17c1\\u1796\\u179f\\u1793\\u17d2\\u1790\\u179c: \\u178a\\u17c2\\u179b\\u1794\\u1784\\u17d2\\u1780\\u178a\\u17c4\\u1799\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793\\u17a1\\u17be\\u1799\\u17d4\", \"g_q0401/q0402\": \"\\u1791\\u17b9\\u1780\\u1798\\u17b7\\u1793\\u1798\\u17b6\\u1793\\u1780\\u17b6\\u179a\\u1794\\u17d2\\u179a\\u17c2\\u1794\\u17d2\\u179a\\u17bd\\u179b\\u17a1\\u17be\\u1799 \\u17a0\\u17be\\u1799\\u1781\\u17d2\\u1789\\u17bb\\u17c6\\u1798\\u17b7\\u1793\\u1791\\u1791\\u17bc\\u179b\\u1794\\u17b6\\u1793\\u1780\\u17b6\\u179a\\u179a\\u17b6\\u1799\\u1780\\u17b6\\u179a\\u178e\\u17cd\\u178a\\u17bc\\u1785\\u1782\\u17d2\\u1793\\u17b6\\u17d4\", \"g_q0501/q0501\": \"\\u1781\\u17d2\\u1789\\u17bb\\u17c6\\u1798\\u17b7\\u1793\\u1791\\u1791\\u17bc\\u179b\\u1794\\u17b6\\u1793\\u1780\\u17b6\\u179a\\u179a\\u17b6\\u1799\\u1780\\u17b6\\u179a\\u178e\\u17cd\\u1791\\u17b6\\u1780\\u17cb\\u1791\\u17a0\\u1787\\u17b6\\u1798\\u17bd\\u1799\\u1780\\u179a\\u178e\\u17cd\\u179f\\u178f\\u17d2\\u1790\\u1784\\u17b6\\u1794\\u17cb\\u17a1\\u17be\\u1799\\u17d4\", \"g_q0501/q0502\": \"\\u179f\\u17a0\\u1782\\u1798\\u1793\\u17cd\\u1793\\u17c5\\u1791\\u17b8\\u1793\\u17c1\\u17c7 \\u1798\\u17b7\\u1793\\u1798\\u17b6\\u1793\\u17a2\\u17d2\\u1793\\u1780\\u1785\\u17c6\\u178e\\u17b6\\u1780\\u17cb\\u179f\\u17d2\\u179a\\u17bb\\u1780\\u17a1\\u17be\\u1799\\u17d4\", \"g_q0501/q0503\": \"\\u1798\\u17b7\\u1793\\u1798\\u17b6\\u1793\\u1780\\u179a\\u178e\\u17b8\\u1787\\u17bd\\u1789\\u178a\\u17bc\\u179a\\u1795\\u17d2\\u179b\\u17bc\\u179c\\u1797\\u17c1\\u1791\\u1793\\u17c5\\u1780\\u17d2\\u1793\\u17bb\\u1784\\u179f\\u17a0\\u1782\\u1798\\u1793\\u17cd\\u17a1\\u17be\\u1799\\u17d4\", \"comments\": \"\\u1798\\u17b7\\u1793\\u1798\\u17b6\\u1793\\u1791\\u17c1\", \"iFinish\": \"1\", \"__version__\": \"vLVP2uauEGwdMMJcncy9E3\", \"meta/instanceID\": \"uuid:06f3dc7b-451b-462e-bafb-f478780ab208\", \"_xform_id_string\": \"aP25nUip6ExqJGKfahmqAR\", \"_uuid\": \"06f3dc7b-451b-462e-bafb-f478780ab208\", \"_attachments\": [], \"_status\": \"submitted_via_web\", \"_geolocation\": [null, null], \"_submission_time\": \"2023-04-18T04:27:11\", \"_tags\": [], \"_notes\": [], \"_validation_status\": {}, \"_submitted_by\": null}', 'aP25nUip6ExqJGKfahmqAR', 'no', '417804273', '64e1b288cc89466aa9aa09283a963f3d', '2023-04-18T10:18:45.177+07:00', '2023-04-18T11:26:59.526+07:00', '2023-04-18', 'username not found', 'ee.humanitarianresponse.info:bbu0XUyrgsxA6sO3', '2023-04-18', 'ស្រើវ កាហន', '2', '១-ស្រើវ កាហន (ប្រុស\n២-ដេត នី (ប្រុស)', '11', '1101', '110101', '11010102', 'មិនធ្លាប់មានការរាយការណ៍អំពីបញ្ហាទឹកកង្វកឡើយ។ ជាធម្មតាទឹកតែមានការប្រែប្រួលទៅតាមរដូវកាល ដូចជា នៅរដូវប្រាំងពីខែវិច្ឆិកា ដល់ខែមេសា ទឹកថ្លាជាធម្មតា ចំពោះរដូវវស្សាចាប់ពីខែឧសភា ដល់ខែតុលាមានភ្ញៀងធ្វើអោយរបាយដីហូច្រោះចូលទឹក ធ្វើអោយសភាពទឹកប្រែជាល្អក់។\nចំពោះការប្រែប្រួលបែនធម្មជាតិ មិនមានអ្វីប៉ះពាល់ដល់ប្រជាពលរដ្ឋធ្ងន់ធ្ងរឡើយ។', 'ចំពោះផ្ទៃដីក្រុមហ៊ុនធ្វើការវិនិយោគនេះមិនមានប៉ះពាល់ដល់ដីកសិកម្មរបស់ប្រជាពលរដ្ឋឡើយ ដោយសារស្ថិតនៅក្នុងតំបន់ព្រៃរបស់សហគមន៍។', 'មិនមានករណីបាក់ដី ឬហូរច្រោះដីឡើយ', 'ក្រុមហ៊ុនមានការគ្រប់គ្រងត្រឹមត្រូវ ដោយគេបានធ្វ់របងព័ន្ធជុំវិញតំបន់នោះ ដើម្បីកឦអោយសហគមន៍មានគ្រោះថ្នាក់។', 'ក្រុមហ៊ុនតែងមានជាកិច្ចប្រជុំជាមួយអាជ្ញាធរមូលដ្ឋាន ពេលមានបញ្ហាអ្វីមួយកើតឡើង។ ហើយអាជ្ញាតធរតែយកយកព័ត៌មាននានា ទៅពិគ្រោះយោបល់ជាមួយសហគមន៍។', 'សហគមន៍ចំនួនមួយភូមិប៉ះចំតំបន់ក្រុមហ៊ុនវិនិយោគ ដោយសហគមន៍ព្រមចាក់ចេញពីតំបន់នោះជាមួយការផ្ដល់សំណងពីសំណាក់ក្រុមហ៊ុនផងដែរ។', 'តំបន់ក្រុមហ៊ុនវិនិយោគជាតំបន់សហគមន៍ធ្វើការវិនិយោគដូចនេះមានការប៉ះពាល់ដល់ដើមជ័រជ័រច្បោះរបស់សហគមន៍ ហើយក្រុមហ៊ុនបានផ្ដល់ជាសំណងចំពោះការខូចខាតដើមជ័រច្បោះរបស់សហគមន៍ ដោយអោយមួយដើម ២០០០០០រៀល។', 'ក្រុមហ៊ុននេះជាក្រុមហ៊ុនស្របច្បាបឭមានអាជ្ញាប័ណ្ណត្រឹមត្រូវ។', 'ខ្ញុំមិនទទូលបានការរាយការណ៍ចំពោះករណីឃាត់កម្ម និងរំលោភសេពសន្ថវ: ដែលបង្កដោយក្រុមហ៊ុនឡើយ។', 'ទឹកមិនមានការប្រែប្រួលឡើយ ហើយខ្ញុំមិនទទូលបានការរាយការណ៍ដូចគ្នា។', 'ខ្ញុំមិនទទូលបានការរាយការណ៍ទាក់ទហជាមួយករណ៍សត្ថងាប់ឡើយ។', 'សហគមន៍នៅទីនេះ មិនមានអ្នកចំណាក់ស្រុកឡើយ។', 'មិនមានករណីជួញដូរផ្លូវភេទនៅក្នុងសហគមន៍ឡើយ។', 'មិនមានទេ', '1', 'vLVP2uauEGwdMMJcncy9E3', NULL, 'uuid:06f3dc7b-451b-462e-bafb-f478780ab208', '06f3dc7b-451b-462e-bafb-f478780ab208', '[]', 'submitted_via_web', '[null,null]', '2023-04-18T04:27:11', '[]', '[]', '[]', NULL, 'phonenumber not found'),
(6, '{\"_id\": 417861033, \"formhub/uuid\": \"64e1b288cc89466aa9aa09283a963f3d\", \"Tstart\": \"2023-04-18T09:45:04.498+07:00\", \"Tend\": \"2023-04-18T10:13:34.014+07:00\", \"Ttoday\": \"2023-04-18\", \"username\": \"eiseinetworkapp_kobo\", \"deviceid\": \"collect:sYl64sSVMyvKnaat\", \"g_intro/date_interview\": \"2023-04-18\", \"g_intro/name_interview\": \"\\\"\\u1780\\u200b\\\"008\", \"g_intro/sex_interview\": \"2\", \"g_intro/name_respon\": \"1\", \"g_intro/province\": \"11\", \"g_intro/district\": \"1102\", \"g_intro/commune\": \"110203\", \"g_intro/village\": \"11020303\", \"g_envirog_natural/q0201\": \"\\u1798\\u17b7\\u1793\\u1798\\u17b6\\u1793\\u1791\\u17c1\", \"g_envirog_natural/q0202\": \"\\u1798\\u17b7\\u1793\\u1798\\u17b6\\u1793\\u1791\\u17c1\", \"g_envirog_natural/q0203\": \"\\u1798\\u17b6\\u1793 \\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17bb\\u17ca\\u1793\\u179a\\u17c9\\u17c2\\u1780\\u17cf\\u1794\\u17b6\\u1793\\u179a\\u17bd\\u1798\\u1785\\u17c6\\u178e\\u17c2\\u1780\\u1781\\u17d2\\u179b\\u17c7\\u178a\\u17c2\\u179a\\u178a\\u17c2\\u179b\\u1792\\u17d2\\u179c\\u17be\\u17b2\\u17d2\\u1799\\u1780\\u17be\\u178f\\u1798\\u17b6\\u1793\\u1794\\u1789\\u17d2\\u17a0\\u17b6\\u1793\\u17c1\\u17c7   \\u1785\\u17c6\\u1796\\u17c4\\u17c7\\u1782\\u17d2\\u179a\\u17bd\\u179f\\u17b6\\u179a\\u178a\\u17c2\\u179a\\u179a\\u1784\\u1795\\u179b\\u1794\\u17c9\\u17c7\\u1796\\u17b6\\u179b\\u17cb\\u1798\\u17b6\\u1793\\u1794\\u17d2\\u179a\\u17a0\\u17c2\\u179b\\u200b26 \\u1782\\u17d2\\u179a\\u17bd\\u179f\\u17b6\\u179a\\u17d4 \\u1785\\u17c6\\u1796\\u17c4\\u17c7\\u1780\\u17b6\\u179a\\u178a\\u17c4\\u17c7\\u179f\\u17d2\\u179a\\u17b6\\u1799\\u1780\\u17cf\\u1794\\u17b6\\u1793\\u1791\\u17c5\\u1785\\u1785\\u17c2\\u1780\\u1787\\u17b6\\u1798\\u17bd\\u1799\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u1793\\u178a\\u17c2\\u179a \\u178f\\u17c2\\u1798\\u17b7\\u1793\\u1791\\u17b6\\u1793\\u1798\\u17b6\\u1793\\u1794\\u17d2\\u179a\\u179f\\u17b7\\u1791\\u17d2\\u1792\\u1797\\u17b6\\u1796\\u1793\\u17c5\\u17a1\\u17be\\u1799\\u17d4\\u200b\", \"g_envirog_natural/q0204\": \"\\u1798\\u17b6\\u1793\\u200b\\u1794\\u17d2\\u179a\\u17a0\\u17c2\\u179b\\u1787\\u17b63   4  \\u1781\\u17c2\\u1798\\u17bb\\u1793\\n\", \"g_violation/q0301\": \"\\u1792\\u17d2\\u179b\\u17b6\\u1794\\u17cb\\u1796\\u17b7\\u1797\\u17b6\\u1780\\u17d2\\u179f\\u17b6\\u179a\\u178a\\u17c2\\u179a \", \"g_violation/q0302\": \"\\u1798\\u17b7\\u1793\\u1791\\u17b6\\u1793\\u1798\\u17b6\\u1793\\u1791\\u17c1\", \"g_violation/q0303\": \"\\u1798\\u17b7\\u1793\\u1792\\u17d2\\u179b\\u17b6\\u1794\\u17cb\\u1798\\u17b6\\u1793\\u1791\\u17c1\", \"g_violation/q0304\": \"\\u1798\\u17b6\\u1793\\u1780\\u17d2\\u179a\\u17bb\\u1798\\u17a0\\u17ca\\u17bb\\u17931 \\u1793\\u17c5\\u1780\\u17d2\\u1793\\u17bb\\u1784\\u178f\\u17c6\\u1794\\u1793\\u17cb \\u1785\\u17c6\\u1796\\u17c4\\u17c7\\u17a2\\u17b6\\u1787\\u17d2\\u1789\\u17b6\\u1794\\u17d0\\u178e\\u17d2\\u178e\\u1798\\u17b7\\u1793\\u178a\\u17b9\\u1784\\u1791\\u17c1\", \"g_q0401/q0401\": \"\\u1792\\u17d2\\u179b\\u17b6\\u1794\\u17cb \\u1785\\u17c6\\u1796\\u17c4\\u17c7\\u1787\\u1793\\u179b\\u17d2\\u1798\\u17be\\u179f\\u1793\\u17c5\\u1798\\u17b7\\u1793\\u1791\\u17b6\\u1793\\u178a\\u17c4\\u17c7\\u179f\\u17d2\\u179a\\u17b6\\u1799\\u179a\\u17bd\\u1785\\u179a\\u17b6\\u179b\\u1791\\u17c1 \\u1793\\u17c5\\u1794\\u1793\\u17d2\\u178f\\u179f\\u17be\\u1794\\u17a2\\u1784\\u17d2\\u1782\\u17c1\\u178f\\u1793\\u17c5\\u17a1\\u17be\\u1784  \", \"g_q0401/q0402\": \"\\u1798\\u17b7\\u1793\\u1798\\u17b6\\u1793\\u1791\\u17c1\", \"g_q0501/q0501\": \"\\u1798\\u17b6\\u1793\\u1781\\u17d2\\u179b\\u17c7\\u178a\\u17c2\\u179a\", \"g_q0501/q0502\": \"\\u1798\\u17b7\\u1793\\u1798\\u17b6\\u1793\\u1791\\u17c1\", \"g_q0501/q0503\": \"\\u17a2\\u178f\\u17cb\\u1798\\u17b6\\u1793\\u1791\\u17c1\", \"comments\": \"\\u1798\\u17b7\\u1793\\u1791\\u17b6\\u1793\\u1798\\u17b6\\u1793\\u1799\\u17c4\\u179b\\u1794\\u179b\\u17cb\\u17a2\\u17d2\\u179c\\u17b8\\u1791\\u17c1   \\u17a2\\u179a\\u1782\\u17bb\\u178e\\u17d4\\u200b\", \"iFinish\": \"1\", \"__version__\": \"vLVP2uauEGwdMMJcncy9E3\", \"meta/audit\": \"audit.csv\", \"meta/instanceID\": \"uuid:23acc0b5-df0f-4463-bc69-577acb971764\", \"_xform_id_string\": \"aP25nUip6ExqJGKfahmqAR\", \"_uuid\": \"23acc0b5-df0f-4463-bc69-577acb971764\", \"_attachments\": [{\"download_url\": \"https://kc.humanitarianresponse.info/media/original?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2F23acc0b5-df0f-4463-bc69-577acb971764%2Faudit.csv\", \"download_large_url\": \"https://kc.humanitarianresponse.info/media/large?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2F23acc0b5-df0f-4463-bc69-577acb971764%2Faudit.csv\", \"download_medium_url\": \"https://kc.humanitarianresponse.info/media/medium?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2F23acc0b5-df0f-4463-bc69-577acb971764%2Faudit.csv\", \"download_small_url\": \"https://kc.humanitarianresponse.info/media/small?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2F23acc0b5-df0f-4463-bc69-577acb971764%2Faudit.csv\", \"mimetype\": \"text/comma-separated-values\", \"filename\": \"koboadmin_eiseinetworkapp/attachments/64e1b288cc89466aa9aa09283a963f3d/23acc0b5-df0f-4463-bc69-577acb971764/audit.csv\", \"instance\": 417861033, \"xform\": 1363857, \"id\": 173535221}], \"_status\": \"submitted_via_web\", \"_geolocation\": [null, null], \"_submission_time\": \"2023-04-18T07:34:14\", \"_tags\": [], \"_notes\": [], \"_validation_status\": {}, \"_submitted_by\": \"eiseinetworkapp_kobo\"}', 'aP25nUip6ExqJGKfahmqAR', 'no', '417861033', '64e1b288cc89466aa9aa09283a963f3d', '2023-04-18T09:45:04.498+07:00', '2023-04-18T10:13:34.014+07:00', '2023-04-18', 'eiseinetworkapp_kobo', 'collect:sYl64sSVMyvKnaat', '2023-04-18', '\"ក​\"008', '2', '1', '11', '1102', '110203', '11020303', 'មិនមានទេ', 'មិនមានទេ', 'មាន ក្រុមហុ៊នរ៉ែក៏បានរួមចំណែកខ្លះដែរដែលធ្វើឲ្យកើតមានបញ្ហានេះ   ចំពោះគ្រួសារដែររងផលប៉ះពាល់មានប្រហែល​26 គ្រួសារ។ ចំពោះការដោះស្រាយក៏បានទៅចចែកជាមួយក្រុមហ៊ុនដែរ តែមិនទានមានប្រសិទ្ធភាពនៅឡើយ។​', 'មាន​ប្រហែលជា3   4  ខែមុន\n', 'ធ្លាប់ពិភាក្សារដែរ ', 'មិនទានមានទេ', 'មិនធ្លាប់មានទេ', 'មានក្រុមហ៊ុន1 នៅក្នុងតំបន់ ចំពោះអាជ្ញាប័ណ្ណមិនដឹងទេ', 'ធ្លាប់ ចំពោះជនល្មើសនៅមិនទានដោះស្រាយរួចរាលទេ នៅបន្តសើបអង្គេតនៅឡើង  ', 'មិនមានទេ', 'មានខ្លះដែរ', 'មិនមានទេ', 'អត់មានទេ', 'មិនទានមានយោលបល់អ្វីទេ   អរគុណ។​', '1', 'vLVP2uauEGwdMMJcncy9E3', 'audit.csv', 'uuid:23acc0b5-df0f-4463-bc69-577acb971764', '23acc0b5-df0f-4463-bc69-577acb971764', '[{\"download_url\":\"https:\\/\\/kc.humanitarianresponse.info\\/media\\/original?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2F23acc0b5-df0f-4463-bc69-577acb971764%2Faudit.csv\",\"download_large_url\":\"https:\\/\\/kc.humanitarianresponse.info\\/media\\/large?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2F23acc0b5-df0f-4463-bc69-577acb971764%2Faudit.csv\",\"download_medium_url\":\"https:\\/\\/kc.humanitarianresponse.info\\/media\\/medium?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2F23acc0b5-df0f-4463-bc69-577acb971764%2Faudit.csv\",\"download_small_url\":\"https:\\/\\/kc.humanitarianresponse.info\\/media\\/small?media_file=koboadmin_eiseinetworkapp%2Fattachments%2F64e1b288cc89466aa9aa09283a963f3d%2F23acc0b5-df0f-4463-bc69-577acb971764%2Faudit.csv\",\"mimetype\":\"text\\/comma-separated-values\",\"filename\":\"koboadmin_eiseinetworkapp\\/attachments\\/64e1b288cc89466aa9aa09283a963f3d\\/23acc0b5-df0f-4463-bc69-577acb971764\\/audit.csv\",\"instance\":417861033,\"xform\":1363857,\"id\":173535221}]', 'submitted_via_web', '[null,null]', '2023-04-18T07:34:14', '[]', '[]', '[]', 'eiseinetworkapp_kobo', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_location`
--

CREATE TABLE `tbl_location` (
  `location_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT 0,
  `title` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_en` mediumtext CHARACTER SET utf8 NOT NULL,
  `title_kh` mediumtext CHARACTER SET utf8 NOT NULL,
  `shortname` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `ordering` int(11) DEFAULT 0,
  `ab_id` int(11) NOT NULL DEFAULT 0,
  `blongto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_location`
--

INSERT INTO `tbl_location` (`location_id`, `parent_id`, `title`, `title_en`, `title_kh`, `shortname`, `type`, `prefix`, `image`, `display`, `tag`, `trash`, `ordering`, `ab_id`, `blongto`) VALUES
(1, 0, '{\"en\":\"Banteay Meanchey\",\"kh\":\"\\u1794\\u1793\\u17d2\\u1791\\u17b6\\u1799\\u1798\\u17b6\\u1793\\u1787\\u17d0\\u1799\"}', 'Banteay Meanchey', 'បន្ទាយមានជ័យ', 'BMC', 'Province', 101, '', 'yes', '', 'no', 0, 0, 1),
(2, 0, '{\"en\":\"Battambang\",\"kh\":\"\\u1794\\u17b6\\u178f\\u17cb\\u178a\\u17c6\\u1794\\u1784\"}', 'Battambang', 'បាត់ដំបង', 'BAT', 'Province', 101, '', 'yes', '', 'no', 0, 0, 1),
(3, 0, '{\"en\":\"Kampong Cham\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1785\\u17b6\\u1798\"}', 'Kampong Cham', 'កំពង់ចាម', 'KPC', 'Province', 101, '', 'yes', '', 'no', 0, 0, 1),
(4, 0, '{\"en\":\"Kampong Chhnang\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1786\\u17d2\\u1793\\u17b6\\u17c6\\u1784\"}', 'Kampong Chhnang', 'កំពង់ឆ្នាំង', 'KCH', 'Province', 101, '', 'yes', '', 'no', 0, 0, 1),
(5, 0, '{\"en\":\"Kampong Speu\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u179f\\u17d2\\u1796\\u17ba\"}', 'Kampong Speu', 'កំពង់ស្ពឺ', 'KSP', 'Province', 101, '', 'yes', '', 'no', 0, 0, 1),
(6, 0, '{\"en\":\"Kampong Thom\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1792\\u17c6\"}', 'Kampong Thom', 'កំពង់ធំ', 'KPT', 'Province', 101, '', 'yes', '', 'no', 0, 0, 1),
(7, 0, '{\"en\":\"Kampot\",\"kh\":\"\\u1780\\u17c6\\u1796\\u178f\"}', 'Kampot', 'កំពត', 'KAM', 'Province', 101, '', 'yes', '', 'no', 0, 0, 1),
(8, 0, '{\"en\":\"Kandal\",\"kh\":\"\\u1780\\u178e\\u17d2\\u178a\\u17b6\\u179b\"}', 'Kandal', 'កណ្ដាល', 'KDL', 'Province', 101, '', 'yes', '', 'no', 0, 0, 1),
(9, 0, '{\"en\":\"Koh Kong\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u1780\\u17bb\\u1784\"}', 'Koh Kong', 'កោះកុង', 'KKG', 'Province', 101, '', 'yes', '', 'no', 0, 0, 1),
(10, 0, '{\"en\":\"Kratie\",\"kh\":\"\\u1780\\u17d2\\u179a\\u1785\\u17c1\\u17c7\"}', 'Kratie', 'ក្រចេះ', 'KRT', 'Province', 101, '', 'yes', '', 'no', 0, 0, 1),
(11, 0, '{\"en\":\"Mondul Kiri\",\"kh\":\"\\u1798\\u178e\\u17d2\\u178c\\u179b\\u1782\\u17b7\\u179a\\u17b8\"}', 'Mondul Kiri', 'មណ្ឌលគិរី', 'MKR', 'Province', 101, '', 'yes', '', 'no', 0, 0, 1),
(12, 0, '{\"en\":\"Phnom Penh\",\"kh\":\"\\u1797\\u17d2\\u1793\\u17c6\\u1796\\u17c1\\u1789\"}', 'Phnom Penh', 'ភ្នំពេញ', 'PNP', 'Capital', 102, '', 'yes', '', 'no', 0, 0, 1),
(13, 0, '{\"en\":\"Preah Vihear\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c7\\u179c\\u17b7\\u17a0\\u17b6\\u179a\"}', 'Preah Vihear', 'ព្រះវិហារ', 'PVR', 'Province', 101, '', 'yes', '', 'no', 0, 0, 1),
(14, 0, '{\"en\":\"Prey Veng\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u179c\\u17c2\\u1784\"}', 'Prey Veng', 'ព្រៃវែង', 'PVG', 'Province', 101, '', 'yes', '', 'no', 0, 0, 1),
(15, 0, '{\"en\":\"Pursat\",\"kh\":\"\\u1796\\u17c4\\u1792\\u17b7\\u17cd\\u179f\\u17b6\\u178f\\u17cb\"}', 'Pursat', 'ពោធិ៍សាត់', 'PUR', 'Province', 101, '', 'yes', '', 'no', 0, 0, 1),
(16, 0, '{\"en\":\"Ratanak Kiri\",\"kh\":\"\\u179a\\u178f\\u1793\\u1782\\u17b7\\u179a\\u17b8\"}', 'Ratanak Kiri', 'រតនគិរី', 'RAT', 'Province', 101, '', 'yes', '', 'no', 0, 0, 1),
(17, 0, '{\"en\":\"Siemreap\",\"kh\":\"\\u179f\\u17c0\\u1798\\u179a\\u17b6\\u1794\"}', 'Siemreap', 'សៀមរាប', 'SRP', 'Province', 101, '', 'yes', '', 'no', 0, 0, 1),
(18, 0, '{\"en\":\"Preah Sihanouk\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c7\\u179f\\u17b8\\u17a0\\u1793\\u17bb\"}', 'Preah Sihanouk', 'ព្រះសីហនុ', 'SHV', 'Province', 101, '', 'yes', '', 'no', 0, 0, 1),
(19, 0, '{\"en\":\"Stung Treng\",\"kh\":\"\\u179f\\u17d2\\u1791\\u17b9\\u1784\\u178f\\u17d2\\u179a\\u17c2\\u1784\"}', 'Stung Treng', 'ស្ទឹងត្រែង', 'STG', 'Province', 101, '', 'yes', '', 'no', 0, 0, 1),
(20, 0, '{\"en\":\"Svay Rieng\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u179a\\u17c0\\u1784\"}', 'Svay Rieng', 'ស្វាយរៀង', 'SVR', 'Province', 101, '', 'yes', '', 'no', 0, 0, 1),
(21, 0, '{\"en\":\"Takeo\",\"kh\":\"\\u178f\\u17b6\\u1780\\u17c2\\u179c\"}', 'Takeo', 'តាកែវ', 'TAK', 'Province', 101, '', 'yes', '', 'no', 0, 0, 1),
(22, 0, '{\"en\":\"Oddar Meanchey\",\"kh\":\"\\u17a7\\u178f\\u17d2\\u178a\\u179a\\u1798\\u17b6\\u1793\\u1787\\u17d0\\u1799\"}', 'Oddar Meanchey', 'ឧត្ដរមានជ័យ', 'OMC', 'Province', 101, '', 'yes', '', 'no', 0, 0, 1),
(23, 0, '{\"en\":\"Kep\",\"kh\":\"\\u1780\\u17c2\\u1794\"}', 'Kep', 'កែប', 'KEP', 'Province', 101, '', 'yes', '', 'no', 0, 0, 1),
(24, 0, '{\"en\":\"Pailin\",\"kh\":\"\\u1794\\u17c9\\u17c3\\u179b\\u17b7\\u1793\"}', 'Pailin', 'ប៉ៃលិន', 'PLN', 'Province', 101, '', 'yes', '', 'no', 0, 0, 1),
(25, 0, '{\"en\":\"Tboung Khmum\",\"kh\":\"\\u178f\\u17d2\\u1794\\u17bc\\u1784\\u1783\\u17d2\\u1798\\u17bb\\u17c6\"}', 'Tboung Khmum', 'ត្បូងឃ្មុំ', 'TKM', 'Province', 101, '', 'yes', '', 'no', 0, 0, 1),
(102, 1, '{\"en\":\"Mongkol Borei\",\"kh\":\"\\u1798\\u1784\\u17d2\\u1782\\u179b\\u1794\\u17bc\\u179a\\u17b8\"}', 'Mongkol Borei', 'មង្គលបូរី', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(103, 1, '{\"en\":\"Phnum Srok\",\"kh\":\"\\u1797\\u17d2\\u1793\\u17c6\\u179f\\u17d2\\u179a\\u17bb\\u1780\"}', 'Phnum Srok', 'ភ្នំស្រុក', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(104, 1, '{\"en\":\"Preah Netr Preah\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c7\\u1793\\u17c1\\u178f\\u17d2\\u179a\\u1796\\u17d2\\u179a\\u17c7\"}', 'Preah Netr Preah', 'ព្រះនេត្រព្រះ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(105, 1, '{\"en\":\"Ou Chrov\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u1787\\u17d2\\u179a\\u17c5\"}', 'Ou Chrov', 'អូរជ្រៅ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(106, 1, '{\"en\":\"Serei Saophoan\",\"kh\":\"\\u179f\\u17b7\\u179a\\u17b8\\u179f\\u17c4\\u1797\\u17d0\\u178e\"}', 'Serei Saophoan', 'សិរីសោភ័ណ', '', 'Municipality', 201, '', 'yes', '', 'no', 0, 0, 1),
(107, 1, '{\"en\":\"Thma Puok\",\"kh\":\"\\u1790\\u17d2\\u1798\\u1796\\u17bd\\u1780\"}', 'Thma Puok', 'ថ្មពួក', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(108, 1, '{\"en\":\"Svay Chek\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u1785\\u17c1\\u1780\"}', 'Svay Chek', 'ស្វាយចេក', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(109, 1, '{\"en\":\"Malai\",\"kh\":\"\\u1798\\u17c9\\u17b6\\u17a1\\u17c3\"}', 'Malai', 'ម៉ាឡៃ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(110, 1, '{\"en\":\"Paoy Paet\",\"kh\":\"\\u1794\\u17c9\\u17c4\\u1799\\u1794\\u17c9\\u17c2\\u178f\"}', 'Paoy Paet', 'ប៉ោយប៉ែត', '', 'Municipality', 201, '', 'yes', '', 'no', 0, 0, 1),
(201, 2, '{\"en\":\"Banan\",\"kh\":\"\\u1794\\u17b6\\u178e\\u1793\\u17cb\"}', 'Banan', 'បាណន់', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(202, 2, '{\"en\":\"Thma Koul\",\"kh\":\"\\u1790\\u17d2\\u1798\\u1782\\u17c4\\u179b\"}', 'Thma Koul', 'ថ្មគោល', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(203, 2, '{\"en\":\"Battambang\",\"kh\":\"\\u1794\\u17b6\\u178f\\u17cb\\u178a\\u17c6\\u1794\\u1784\"}', 'Battambang', 'បាត់ដំបង', '', 'Municipality', 201, '', 'yes', '', 'no', 0, 0, 1),
(204, 2, '{\"en\":\"Bavel\",\"kh\":\"\\u1794\\u179c\\u17c1\\u179b\"}', 'Bavel', 'បវេល', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(205, 2, '{\"en\":\"Aek Phnum\",\"kh\":\"\\u17af\\u1780\\u1797\\u17d2\\u1793\\u17c6\"}', 'Aek Phnum', 'ឯកភ្នំ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(206, 2, '{\"en\":\"Moung Ruessei\",\"kh\":\"\\u1798\\u17c4\\u1784\\u17ab\\u179f\\u17d2\\u179f\\u17b8\"}', 'Moung Ruessei', 'មោងឫស្សី', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(207, 2, '{\"en\":\"Rotonak Mondol\",\"kh\":\"\\u179a\\u178f\\u1793\\u1798\\u178e\\u17d2\\u178c\\u179b\"}', 'Rotonak Mondol', 'រតនមណ្ឌល', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(208, 2, '{\"en\":\"Sangkae\",\"kh\":\"\\u179f\\u1784\\u17d2\\u1780\\u17c2\"}', 'Sangkae', 'សង្កែ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(209, 2, '{\"en\":\"Samlout\",\"kh\":\"\\u179f\\u17c6\\u17a1\\u17bc\\u178f\"}', 'Samlout', 'សំឡូត', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(210, 2, '{\"en\":\"Sampov Lun\",\"kh\":\"\\u179f\\u17c6\\u1796\\u17c5\\u179b\\u17bc\\u1793\"}', 'Sampov Lun', 'សំពៅលូន', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(211, 2, '{\"en\":\"Phnum Proek\",\"kh\":\"\\u1797\\u17d2\\u1793\\u17c6\\u1796\\u17d2\\u179a\\u17b9\\u1780\"}', 'Phnum Proek', 'ភ្នំព្រឹក', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(212, 2, '{\"en\":\"Kamrieng\",\"kh\":\"\\u1780\\u17c6\\u179a\\u17c0\\u1784\"}', 'Kamrieng', 'កំរៀង', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(213, 2, '{\"en\":\"Koas Krala\",\"kh\":\"\\u1782\\u17b6\\u179f\\u17cb\\u1780\\u17d2\\u179a\\u17a1\"}', 'Koas Krala', 'គាស់ក្រឡ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(214, 2, '{\"en\":\"Rukh Kiri\",\"kh\":\"\\u179a\\u17bb\\u1780\\u17d2\\u1781\\u1782\\u17b7\\u179a\\u17b8\"}', 'Rukh Kiri', 'រុក្ខគិរី', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(301, 3, '{\"en\":\"Batheay\",\"kh\":\"\\u1794\\u17b6\\u1792\\u17b6\\u1799\"}', 'Batheay', 'បាធាយ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(302, 3, '{\"en\":\"Chamkar Leu\",\"kh\":\"\\u1785\\u17c6\\u1780\\u17b6\\u179a\\u179b\\u17be\"}', 'Chamkar Leu', 'ចំការលើ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(303, 3, '{\"en\":\"Cheung Prey\",\"kh\":\"\\u1787\\u17be\\u1784\\u1796\\u17d2\\u179a\\u17c3\"}', 'Cheung Prey', 'ជើងព្រៃ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(305, 3, '{\"en\":\"Kampong Cham\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1785\\u17b6\\u1798\"}', 'Kampong Cham', 'កំពង់ចាម', '', 'Municipality', 201, '', 'yes', '', 'no', 0, 0, 1),
(306, 3, '{\"en\":\"Kampong Siem\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u179f\\u17c0\\u1798\"}', 'Kampong Siem', 'កំពង់សៀម', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(307, 3, '{\"en\":\"Kang Meas\",\"kh\":\"\\u1780\\u1784\\u1798\\u17b6\\u179f\"}', 'Kang Meas', 'កងមាស', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(308, 3, '{\"en\":\"Kaoh Soutin\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u179f\\u17bc\\u1791\\u17b7\\u1793\"}', 'Kaoh Soutin', 'កោះសូទិន', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(313, 3, '{\"en\":\"Prey Chhor\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1788\\u179a\"}', 'Prey Chhor', 'ព្រៃឈរ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(314, 3, '{\"en\":\"Srei Santhor\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17b8\\u179f\\u1793\\u17d2\\u1792\\u179a\"}', 'Srei Santhor', 'ស្រីសន្ធរ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(315, 3, '{\"en\":\"Stueng Trang\",\"kh\":\"\\u179f\\u17d2\\u1791\\u17b9\\u1784\\u178f\\u17d2\\u179a\\u1784\\u17cb\"}', 'Stueng Trang', 'ស្ទឹងត្រង់', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(401, 4, '{\"en\":\"Baribour\",\"kh\":\"\\u1794\\u179a\\u17b7\\u1794\\u17bc\\u178e\\u17cc\"}', 'Baribour', 'បរិបូណ៌', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(402, 4, '{\"en\":\"Chol Kiri\",\"kh\":\"\\u1787\\u179b\\u1782\\u17b8\\u179a\\u17b8\"}', 'Chol Kiri', 'ជលគីរី', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(403, 4, '{\"en\":\"Kampong Chhnang\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1786\\u17d2\\u1793\\u17b6\\u17c6\\u1784\"}', 'Kampong Chhnang', 'កំពង់ឆ្នាំង', '', 'Municipality', 201, '', 'yes', '', 'no', 0, 0, 1),
(404, 4, '{\"en\":\"Kampong Leaeng\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u179b\\u17c2\\u1784\"}', 'Kampong Leaeng', 'កំពង់លែង', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(405, 4, '{\"en\":\"Kampong Tralach\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u178f\\u17d2\\u179a\\u17a1\\u17b6\\u1785\"}', 'Kampong Tralach', 'កំពង់ត្រឡាច', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(406, 4, '{\"en\":\"Rolea B\'ier\",\"kh\":\"\\u179a\\u179b\\u17b6\\u1794\\u17d2\\u17a2\\u17c0\\u179a\"}', 'Rolea B\'ier', 'រលាប្អៀរ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(407, 4, '{\"en\":\"Sameakki Mean Chey\",\"kh\":\"\\u179f\\u17b6\\u1798\\u1782\\u17d2\\u1782\\u17b8\\u1798\\u17b6\\u1793\\u1787\\u17d0\\u1799\"}', 'Sameakki Mean Chey', 'សាមគ្គីមានជ័យ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(408, 4, '{\"en\":\"Tuek Phos\",\"kh\":\"\\u1791\\u17b9\\u1780\\u1795\\u17bb\\u179f\"}', 'Tuek Phos', 'ទឹកផុស', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(501, 5, '{\"en\":\"Basedth\",\"kh\":\"\\u1794\\u179a\\u179f\\u17c1\\u178a\\u17d2\\u178b\"}', 'Basedth', 'បរសេដ្ឋ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(502, 5, '{\"en\":\"Chbar Mon\",\"kh\":\"\\u1785\\u17d2\\u1794\\u17b6\\u179a\\u1798\\u1793\"}', 'Chbar Mon', 'ច្បារមន', '', 'Municipality', 201, '', 'yes', '', 'no', 0, 0, 1),
(503, 5, '{\"en\":\"Kong Pisei\",\"kh\":\"\\u1782\\u1784\\u1796\\u17b7\\u179f\\u17b8\"}', 'Kong Pisei', 'គងពិសី', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(504, 5, '{\"en\":\"Aoral\",\"kh\":\"\\u17b1\\u179a\\u17c9\\u17b6\\u179b\\u17cb\"}', 'Aoral', 'ឱរ៉ាល់', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(505, 5, '{\"en\":\"Odongk\",\"kh\":\"\\u17a7\\u178a\\u17bb\\u1784\\u17d2\\u1782\"}', 'Odongk', 'ឧដុង្គ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(506, 5, '{\"en\":\"Phnum Sruoch\",\"kh\":\"\\u1797\\u17d2\\u1793\\u17c6\\u179f\\u17d2\\u179a\\u17bd\\u1785\"}', 'Phnum Sruoch', 'ភ្នំស្រួច', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(507, 5, '{\"en\":\"Samraong Tong\",\"kh\":\"\\u179f\\u17c6\\u179a\\u17c4\\u1784\\u1791\\u1784\"}', 'Samraong Tong', 'សំរោងទង', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(508, 5, '{\"en\":\"Thpong\",\"kh\":\"\\u1790\\u17d2\\u1796\\u1784\"}', 'Thpong', 'ថ្ពង', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(601, 6, '{\"en\":\"Baray\",\"kh\":\"\\u1794\\u17b6\\u179a\\u17b6\\u1799\\u178e\\u17cd\"}', 'Baray', 'បារាយណ៍', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(602, 6, '{\"en\":\"Kampong Svay\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u179f\\u17d2\\u179c\\u17b6\\u1799\"}', 'Kampong Svay', 'កំពង់ស្វាយ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(603, 6, '{\"en\":\"Stueng Saen\",\"kh\":\"\\u179f\\u17d2\\u1791\\u17b9\\u1784\\u179f\\u17c2\\u1793\"}', 'Stueng Saen', 'ស្ទឹងសែន', '', 'Municipality', 201, '', 'yes', '', 'no', 0, 0, 1),
(604, 6, '{\"en\":\"Prasat Ballangk\",\"kh\":\"\\u1794\\u17d2\\u179a\\u17b6\\u179f\\u17b6\\u1791\\u1794\\u179b\\u17d2\\u179b\\u17d0\\u1784\\u17d2\\u1782\"}', 'Prasat Ballangk', 'ប្រាសាទបល្ល័ង្គ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(605, 6, '{\"en\":\"Prasat Sambour\",\"kh\":\"\\u1794\\u17d2\\u179a\\u17b6\\u179f\\u17b6\\u1791\\u179f\\u17c6\\u1794\\u17bc\\u179a\"}', 'Prasat Sambour', 'ប្រាសាទសំបូរ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(606, 6, '{\"en\":\"Sandan\",\"kh\":\"\\u179f\\u178e\\u17d2\\u178a\\u17b6\\u1793\\u17cb\"}', 'Sandan', 'សណ្ដាន់', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(607, 6, '{\"en\":\"Santuk\",\"kh\":\"\\u179f\\u1793\\u17d2\\u1791\\u17bb\\u1780\"}', 'Santuk', 'សន្ទុក', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(608, 6, '{\"en\":\"Stoung\",\"kh\":\"\\u179f\\u17d2\\u1791\\u17c4\\u1784\"}', 'Stoung', 'ស្ទោង', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(609, 6, '{\"en\":\"Taing Kouk\",\"kh\":\"\\u178f\\u17b6\\u17c6\\u1784\\u1782\\u17c4\\u1780\"}', 'Taing Kouk', 'តាំងគោក', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(701, 7, '{\"en\":\"Angkor Chey\",\"kh\":\"\\u17a2\\u1784\\u17d2\\u1782\\u179a\\u1787\\u17d0\\u1799\"}', 'Angkor Chey', 'អង្គរជ័យ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(702, 7, '{\"en\":\"Banteay Meas\",\"kh\":\"\\u1794\\u1793\\u17d2\\u1791\\u17b6\\u1799\\u1798\\u17b6\\u179f\"}', 'Banteay Meas', 'បន្ទាយមាស', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(703, 7, '{\"en\":\"Chhuk\",\"kh\":\"\\u1788\\u17bc\\u1780\"}', 'Chhuk', 'ឈូក', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(704, 7, '{\"en\":\"Chum Kiri\",\"kh\":\"\\u1787\\u17bb\\u17c6\\u1782\\u17b7\\u179a\\u17b8\"}', 'Chum Kiri', 'ជុំគិរី', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(705, 7, '{\"en\":\"Dang Tong\",\"kh\":\"\\u178a\\u1784\\u1791\\u1784\\u17cb\"}', 'Dang Tong', 'ដងទង់', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(706, 7, '{\"en\":\"Kampong Trach\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u178f\\u17d2\\u179a\\u17b6\\u1785\"}', 'Kampong Trach', 'កំពង់ត្រាច', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(707, 7, '{\"en\":\"Tuek Chhou\",\"kh\":\"\\u1791\\u17b9\\u1780\\u1788\\u17bc\"}', 'Tuek Chhou', 'ទឹកឈូ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(708, 7, '{\"en\":\"Kampot\",\"kh\":\"\\u1780\\u17c6\\u1796\\u178f\"}', 'Kampot', 'កំពត', '', 'Municipality', 201, '', 'yes', '', 'no', 0, 0, 1),
(709, 7, '{\"en\":\"Bokor\",\"kh\":\"\\u1794\\u17bc\\u1780\\u1782\\u17c4\"}', 'Bokor', 'បូកគោ', '', 'Municipality', 201, '', 'yes', '', 'no', 0, 0, 1),
(801, 8, '{\"en\":\"Kandal Stueng\",\"kh\":\"\\u1780\\u178e\\u17d2\\u178a\\u17b6\\u179b\\u179f\\u17d2\\u1791\\u17b9\\u1784\"}', 'Kandal Stueng', 'កណ្ដាលស្ទឹង', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(802, 8, '{\"en\":\"Kien Svay\",\"kh\":\"\\u1780\\u17c0\\u1793\\u179f\\u17d2\\u179c\\u17b6\\u1799\"}', 'Kien Svay', 'កៀនស្វាយ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(803, 8, '{\"en\":\"Khsach Kandal\",\"kh\":\"\\u1781\\u17d2\\u179f\\u17b6\\u1785\\u17cb\\u1780\\u178e\\u17d2\\u178a\\u17b6\\u179b\"}', 'Khsach Kandal', 'ខ្សាច់កណ្ដាល', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(804, 8, '{\"en\":\"Kaoh Thum\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u1792\\u17c6\"}', 'Kaoh Thum', 'កោះធំ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(805, 8, '{\"en\":\"Leuk Daek\",\"kh\":\"\\u179b\\u17be\\u1780\\u178a\\u17c2\\u1780\"}', 'Leuk Daek', 'លើកដែក', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(806, 8, '{\"en\":\"Lvea Aem\",\"kh\":\"\\u179b\\u17d2\\u179c\\u17b6\\u17af\\u1798\"}', 'Lvea Aem', 'ល្វាឯម', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(807, 8, '{\"en\":\"Mukh Kampul\",\"kh\":\"\\u1798\\u17bb\\u1781\\u1780\\u17c6\\u1796\\u17bc\\u179b\"}', 'Mukh Kampul', 'មុខកំពូល', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(808, 8, '{\"en\":\"Angk Snuol\",\"kh\":\"\\u17a2\\u1784\\u17d2\\u1782\\u179f\\u17d2\\u1793\\u17bd\\u179b\"}', 'Angk Snuol', 'អង្គស្នួល', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(809, 8, '{\"en\":\"Ponhea Lueu\",\"kh\":\"\\u1796\\u1789\\u17b6\\u17ae\"}', 'Ponhea Lueu', 'ពញាឮ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(810, 8, '{\"en\":\"S\'ang\",\"kh\":\"\\u179f\\u17d2\\u17a2\\u17b6\\u1784\"}', 'S\'ang', 'ស្អាង', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(811, 8, '{\"en\":\"Ta Khmau\",\"kh\":\"\\u178f\\u17b6\\u1781\\u17d2\\u1798\\u17c5\"}', 'Ta Khmau', 'តាខ្មៅ', '', 'Municipality', 201, '', 'yes', '', 'no', 0, 0, 1),
(901, 9, '{\"en\":\"Botum Sakor\",\"kh\":\"\\u1794\\u17bb\\u1791\\u17bb\\u1798\\u179f\\u17b6\\u1782\\u179a\"}', 'Botum Sakor', 'បុទុមសាគរ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(902, 9, '{\"en\":\"Kiri Sakor\",\"kh\":\"\\u1782\\u17b7\\u179a\\u17b8\\u179f\\u17b6\\u1782\\u179a\"}', 'Kiri Sakor', 'គិរីសាគរ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(903, 9, '{\"en\":\"Kaoh Kong\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u1780\\u17bb\\u1784\"}', 'Kaoh Kong', 'កោះកុង', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(904, 9, '{\"en\":\"Khemara Phoumin\",\"kh\":\"\\u1781\\u17c1\\u1798\\u179a\\u1797\\u17bc\\u1798\\u17b7\\u1793\\u17d2\\u1791\"}', 'Khemara Phoumin', 'ខេមរភូមិន្ទ', '', 'Municipality', 201, '', 'yes', '', 'no', 0, 0, 1),
(905, 9, '{\"en\":\"Mondol Seima\",\"kh\":\"\\u1798\\u178e\\u17d2\\u178c\\u179b\\u179f\\u17b8\\u1798\\u17b6\"}', 'Mondol Seima', 'មណ្ឌលសីមា', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(906, 9, '{\"en\":\"Srae Ambel\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17c2 \\u17a2\\u17c6\\u1794\\u17b7\\u179b\"}', 'Srae Ambel', 'ស្រែ អំបិល', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(907, 9, '{\"en\":\"Thma Bang\",\"kh\":\"\\u1790\\u17d2\\u1798\\u1794\\u17b6\\u17c6\\u1784\"}', 'Thma Bang', 'ថ្មបាំង', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1001, 10, '{\"en\":\"Chhloung\",\"kh\":\"\\u1786\\u17d2\\u179b\\u17bc\\u1784\"}', 'Chhloung', 'ឆ្លូង', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1002, 10, '{\"en\":\"Kracheh\",\"kh\":\"\\u1780\\u17d2\\u179a\\u1785\\u17c1\\u17c7\"}', 'Kracheh', 'ក្រចេះ', '', 'Municipality', 201, '', 'yes', '', 'no', 0, 0, 1),
(1003, 10, '{\"en\":\"Prek Prasab\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1794\\u17d2\\u179a\\u179f\\u1796\\u17d2\\u179c\"}', 'Prek Prasab', 'ព្រែកប្រសព្វ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1004, 10, '{\"en\":\"Sambour\",\"kh\":\"\\u179f\\u17c6\\u1794\\u17bc\\u179a\"}', 'Sambour', 'សំបូរ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1005, 10, '{\"en\":\"Snuol\",\"kh\":\"\\u179f\\u17d2\\u1793\\u17bd\\u179b\"}', 'Snuol', 'ស្នួល', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1006, 10, '{\"en\":\"Chetr Borei\",\"kh\":\"\\u1785\\u17b7\\u178f\\u17d2\\u179a\\u1794\\u17bb\\u179a\\u17b8\"}', 'Chetr Borei', 'ចិត្របុរី', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1101, 11, '{\"en\":\"Kaev Seima\",\"kh\":\"\\u1780\\u17c2\\u179c\\u179f\\u17b8\\u1798\\u17b6\"}', 'Kaev Seima', 'កែវសីមា', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1102, 11, '{\"en\":\"Kaoh Nheaek\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u1789\\u17c2\\u1780\"}', 'Kaoh Nheaek', 'កោះញែក', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1103, 11, '{\"en\":\"Ou Reang\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u179a\\u17b6\\u17c6\\u1784\"}', 'Ou Reang', 'អូររាំង', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1104, 11, '{\"en\":\"Pech Chreada\",\"kh\":\"\\u1796\\u17c1\\u1787\\u17d2\\u179a\\u17b6\\u178a\\u17b6\"}', 'Pech Chreada', 'ពេជ្រាដា', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1105, 11, '{\"en\":\"Saen Monourom\",\"kh\":\"\\u179f\\u17c2\\u1793\\u1798\\u1793\\u17c4\\u179a\\u1798\\u17d2\\u1799\"}', 'Saen Monourom', 'សែនមនោរម្យ', '', 'Municipality', 201, '', 'yes', '', 'no', 0, 0, 1),
(1201, 12, '{\"en\":\"Chamkar Mon\",\"kh\":\"\\u1785\\u17c6\\u1780\\u17b6\\u179a\\u1798\\u1793\"}', 'Chamkar Mon', 'ចំការមន', '', 'Khan', 203, '', 'yes', '', 'no', 0, 0, 1),
(1202, 12, '{\"en\":\"Doun Penh\",\"kh\":\"\\u178a\\u17bc\\u1793\\u1796\\u17c1\\u1789\"}', 'Doun Penh', 'ដូនពេញ', '', 'Khan', 203, '', 'yes', '', 'no', 0, 0, 1),
(1203, 12, '{\"en\":\"Prampir Meakkakra\",\"kh\":\"\\u17e7\\u1798\\u1780\\u179a\\u17b6\"}', 'Prampir Meakkakra', '៧មករា', '', 'Khan', 203, '', 'yes', '', 'no', 0, 0, 1),
(1204, 12, '{\"en\":\"Tuol Kouk\",\"kh\":\"\\u1791\\u17bd\\u179b\\u1782\\u17c4\\u1780\"}', 'Tuol Kouk', 'ទួលគោក', '', 'Khan', 203, '', 'yes', '', 'no', 0, 0, 1),
(1205, 12, '{\"en\":\"Dangkao\",\"kh\":\"\\u178a\\u1784\\u17d2\\u1780\\u17c4\"}', 'Dangkao', 'ដង្កោ', '', 'Khan', 203, '', 'yes', '', 'no', 0, 0, 1),
(1206, 12, '{\"en\":\"Mean Chey\",\"kh\":\"\\u1798\\u17b6\\u1793\\u1787\\u17d0\\u1799\"}', 'Mean Chey', 'មានជ័យ', '', 'Khan', 203, '', 'yes', '', 'no', 0, 0, 1),
(1207, 12, '{\"en\":\"Russey Keo\",\"kh\":\"\\u17ab\\u179f\\u17d2\\u179f\\u17b8\\u1780\\u17c2\\u179c\"}', 'Russey Keo', 'ឫស្សីកែវ', '', 'Khan', 203, '', 'yes', '', 'no', 0, 0, 1),
(1208, 12, '{\"en\":\"Saensokh\",\"kh\":\"\\u179f\\u17c2\\u1793\\u179f\\u17bb\\u1781\"}', 'Saensokh', 'សែនសុខ', '', 'Khan', 203, '', 'yes', '', 'no', 0, 0, 1),
(1209, 12, '{\"en\":\"Pur SenChey\",\"kh\":\"\\u1796\\u17c4\\u1792\\u17b7\\u17cd\\u179f\\u17c2\\u1793\\u1787\\u17d0\\u1799\"}', 'Pur SenChey', 'ពោធិ៍សែនជ័យ', '', 'Khan', 203, '', 'yes', '', 'no', 0, 0, 1),
(1210, 12, '{\"en\":\"Chraoy Chongvar\",\"kh\":\"\\u1787\\u17d2\\u179a\\u17c4\\u1799\\u1785\\u1784\\u17d2\\u179c\\u17b6\\u179a\"}', 'Chraoy Chongvar', 'ជ្រោយចង្វារ', '', 'Khan', 203, '', 'yes', '', 'no', 0, 0, 1),
(1211, 12, '{\"en\":\"Praek Pnov\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1796\\u17d2\\u1793\\u17c5\"}', 'Praek Pnov', 'ព្រែកព្នៅ', '', 'Khan', 203, '', 'yes', '', 'no', 0, 0, 1),
(1212, 12, '{\"en\":\"Chbar Ampov\",\"kh\":\"\\u1785\\u17d2\\u1794\\u17b6\\u179a\\u17a2\\u17c6\\u1796\\u17c5\"}', 'Chbar Ampov', 'ច្បារអំពៅ', '', 'Khan', 203, '', 'yes', '', 'no', 0, 0, 1),
(1213, 12, '{\"en\":\"Boeng Keng Kang\",\"kh\":\"\\u1794\\u17b9\\u1784\\u1780\\u17c1\\u1784\\u1780\\u1784\"}', 'Boeng Keng Kang', 'បឹងកេងកង', '', 'Khan', 203, '', 'yes', '', 'no', 0, 0, 1),
(1214, 12, '{\"en\":\"Kamboul\",\"kh\":\"\\u1780\\u17c6\\u1794\\u17bc\\u179b\"}', 'Kamboul', 'កំបូល', '', 'Khan', 203, '', 'yes', '', 'no', 0, 0, 1),
(1301, 13, '{\"en\":\"Chey Saen\",\"kh\":\"\\u1787\\u17d0\\u1799\\u179f\\u17c2\\u1793\"}', 'Chey Saen', 'ជ័យសែន', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1302, 13, '{\"en\":\"Chhaeb\",\"kh\":\"\\u1786\\u17c2\\u1794\"}', 'Chhaeb', 'ឆែប', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1303, 13, '{\"en\":\"Choam Ksant\",\"kh\":\"\\u1787\\u17b6\\u17c6\\u1780\\u17d2\\u179f\\u17b6\\u1793\\u17d2\\u178a\"}', 'Choam Ksant', 'ជាំក្សាន្ដ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1304, 13, '{\"en\":\"Kuleaen\",\"kh\":\"\\u1782\\u17bc\\u179b\\u17c2\\u1793\"}', 'Kuleaen', 'គូលែន', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1305, 13, '{\"en\":\"Rovieng\",\"kh\":\"\\u179a\\u179c\\u17c0\\u1784\"}', 'Rovieng', 'រវៀង', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1306, 13, '{\"en\":\"Sangkum Thmei\",\"kh\":\"\\u179f\\u1784\\u17d2\\u1782\\u1798\\u1790\\u17d2\\u1798\\u17b8\"}', 'Sangkum Thmei', 'សង្គមថ្មី', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1307, 13, '{\"en\":\"Tbaeng Mean Chey\",\"kh\":\"\\u178f\\u17d2\\u1794\\u17c2\\u1784\\u1798\\u17b6\\u1793\\u1787\\u17d0\\u1799\"}', 'Tbaeng Mean Chey', 'ត្បែងមានជ័យ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1308, 13, '{\"en\":\"Preah Vihear\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c7\\u179c\\u17b7\\u17a0\\u17b6\\u179a\"}', 'Preah Vihear', 'ព្រះវិហារ', '', 'Municipality', 201, '', 'yes', '', 'no', 0, 0, 1),
(1401, 14, '{\"en\":\"Ba Phnum\",\"kh\":\"\\u1794\\u17b6\\u1797\\u17d2\\u1793\\u17c6\"}', 'Ba Phnum', 'បាភ្នំ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1402, 14, '{\"en\":\"Kamchay Mear\",\"kh\":\"\\u1780\\u17c6\\u1785\\u17b6\\u1799\\u1798\\u17b6\\u179a\"}', 'Kamchay Mear', 'កំចាយមារ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1403, 14, '{\"en\":\"Kampong Trabaek\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u178f\\u17d2\\u179a\\u1794\\u17c2\\u1780\"}', 'Kampong Trabaek', 'កំពង់ត្របែក', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1404, 14, '{\"en\":\"Kanhchriech\",\"kh\":\"\\u1780\\u1789\\u17d2\\u1787\\u17d2\\u179a\\u17c0\\u1785\"}', 'Kanhchriech', 'កញ្ជ្រៀច', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1405, 14, '{\"en\":\"Me Sang\",\"kh\":\"\\u1798\\u17c1\\u179f\\u17b6\\u1784\"}', 'Me Sang', 'មេសាង', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1406, 14, '{\"en\":\"Peam Chor\",\"kh\":\"\\u1796\\u17b6\\u1798\\u1787\\u179a\"}', 'Peam Chor', 'ពាមជរ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1407, 14, '{\"en\":\"Peam Ro\",\"kh\":\"\\u1796\\u17b6\\u1798\\u179a\\u1780\\u17cd\"}', 'Peam Ro', 'ពាមរក៍', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1408, 14, '{\"en\":\"Pea Reang\",\"kh\":\"\\u1796\\u17b6\\u179a\\u17b6\\u17c6\\u1784\"}', 'Pea Reang', 'ពារាំង', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1409, 14, '{\"en\":\"Preah Sdach\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c7\\u179f\\u17d2\\u178a\\u17c1\\u1785\"}', 'Preah Sdach', 'ព្រះស្ដេច', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1410, 14, '{\"en\":\"Prey Veng\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u179c\\u17c2\\u1784\"}', 'Prey Veng', 'ព្រៃវែង', '', 'Municipality', 201, '', 'yes', '', 'no', 0, 0, 1),
(1411, 14, '{\"en\":\"Pur Rieng\",\"kh\":\"\\u1796\\u17c4\\u1792\\u17b7\\u17cd\\u179a\\u17c0\\u1784\"}', 'Pur Rieng', 'ពោធិ៍រៀង', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1412, 14, '{\"en\":\"Sithor Kandal\",\"kh\":\"\\u179f\\u17ca\\u17b8\\u1792\\u179a\\u1780\\u178e\\u17d2\\u178a\\u17b6\\u179b\"}', 'Sithor Kandal', 'ស៊ីធរកណ្ដាល', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1413, 14, '{\"en\":\"Svay Antor\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u17a2\\u1793\\u17d2\\u1791\\u179a\"}', 'Svay Antor', 'ស្វាយអន្ទរ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1501, 15, '{\"en\":\"Bakan\",\"kh\":\"\\u1794\\u17b6\\u1780\\u17b6\\u1793\"}', 'Bakan', 'បាកាន', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1502, 15, '{\"en\":\"Kandieng\",\"kh\":\"\\u1780\\u178e\\u17d2\\u178a\\u17c0\\u1784\"}', 'Kandieng', 'កណ្ដៀង', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1503, 15, '{\"en\":\"Krakor\",\"kh\":\"\\u1780\\u17d2\\u179a\\u1782\\u179a\"}', 'Krakor', 'ក្រគរ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1504, 15, '{\"en\":\"Phnum Kravanh\",\"kh\":\"\\u1797\\u17d2\\u1793\\u17c6\\u1780\\u17d2\\u179a\\u179c\\u17c9\\u17b6\\u1789\"}', 'Phnum Kravanh', 'ភ្នំក្រវ៉ាញ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1505, 15, '{\"en\":\"Pursat\",\"kh\":\"\\u1796\\u17c4\\u1792\\u17b7\\u17cd\\u179f\\u17b6\\u178f\\u17cb\"}', 'Pursat', 'ពោធិ៍សាត់', '', 'Municipality', 201, '', 'yes', '', 'no', 0, 0, 1),
(1506, 15, '{\"en\":\"Veal Veaeng\",\"kh\":\"\\u179c\\u17b6\\u179b\\u179c\\u17c2\\u1784\"}', 'Veal Veaeng', 'វាលវែង', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1507, 15, '{\"en\":\"Ta Lou Senchey\",\"kh\":\"\\u178f\\u17b6\\u179b\\u17c4\\u179f\\u17c2\\u1793\\u1787\\u17d0\\u1799\"}', 'Ta Lou Senchey', 'តាលោសែនជ័យ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1601, 16, '{\"en\":\"Andoung Meas\",\"kh\":\"\\u17a2\\u178e\\u17d2\\u178a\\u17bc\\u1784\\u1798\\u17b6\\u179f\"}', 'Andoung Meas', 'អណ្ដូងមាស', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1602, 16, '{\"en\":\"Ban Lung\",\"kh\":\"\\u1794\\u17b6\\u1793\\u179b\\u17bb\\u1784\"}', 'Ban Lung', 'បានលុង', '', 'Municipality', 201, '', 'yes', '', 'no', 0, 0, 1),
(1603, 16, '{\"en\":\"Bar Kaev\",\"kh\":\"\\u1794\\u179a\\u1780\\u17c2\\u179c\"}', 'Bar Kaev', 'បរកែវ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1604, 16, '{\"en\":\"Koun Mom\",\"kh\":\"\\u1780\\u17bc\\u1793\\u1798\\u17bb\\u17c6\"}', 'Koun Mom', 'កូនមុំ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1605, 16, '{\"en\":\"Lumphat\",\"kh\":\"\\u179b\\u17c6\\u1795\\u17b6\\u178f\\u17cb\"}', 'Lumphat', 'លំផាត់', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1606, 16, '{\"en\":\"Ou Chum\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u1787\\u17bb\\u17c6\"}', 'Ou Chum', 'អូរជុំ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1607, 16, '{\"en\":\"Ou Ya Dav\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u1799\\u17c9\\u17b6\\u178a\\u17b6\\u179c\"}', 'Ou Ya Dav', 'អូរយ៉ាដាវ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1608, 16, '{\"en\":\"Ta Veaeng\",\"kh\":\"\\u178f\\u17b6\\u179c\\u17c2\\u1784\"}', 'Ta Veaeng', 'តាវែង', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1609, 16, '{\"en\":\"Veun Sai\",\"kh\":\"\\u179c\\u17be\\u1793\\u179f\\u17c3\"}', 'Veun Sai', 'វើនសៃ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1701, 17, '{\"en\":\"Angkor Chum\",\"kh\":\"\\u17a2\\u1784\\u17d2\\u1782\\u179a\\u1787\\u17bb\\u17c6\"}', 'Angkor Chum', 'អង្គរជុំ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1702, 17, '{\"en\":\"Angkor Thum\",\"kh\":\"\\u17a2\\u1784\\u17d2\\u1782\\u179a\\u1792\\u17c6\"}', 'Angkor Thum', 'អង្គរធំ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1703, 17, '{\"en\":\"Banteay Srei\",\"kh\":\"\\u1794\\u1793\\u17d2\\u1791\\u17b6\\u1799\\u179f\\u17d2\\u179a\\u17b8\"}', 'Banteay Srei', 'បន្ទាយស្រី', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1704, 17, '{\"en\":\"Chi Kraeng\",\"kh\":\"\\u1787\\u17b8\\u1780\\u17d2\\u179a\\u17c2\\u1784\"}', 'Chi Kraeng', 'ជីក្រែង', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1706, 17, '{\"en\":\"Kralanh\",\"kh\":\"\\u1780\\u17d2\\u179a\\u17a1\\u17b6\\u1789\\u17cb\"}', 'Kralanh', 'ក្រឡាញ់', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1707, 17, '{\"en\":\"Puok\",\"kh\":\"\\u1796\\u17bd\\u1780\"}', 'Puok', 'ពួក', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1709, 17, '{\"en\":\"Prasat Bakong\",\"kh\":\"\\u1794\\u17d2\\u179a\\u17b6\\u179f\\u17b6\\u1791\\u1794\\u17b6\\u1782\\u1784\"}', 'Prasat Bakong', 'ប្រាសាទបាគង', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1710, 17, '{\"en\":\"Siem Reap\",\"kh\":\"\\u179f\\u17c0\\u1798\\u179a\\u17b6\\u1794\"}', 'Siem Reap', 'សៀមរាប', '', 'Municipality', 201, '', 'yes', '', 'no', 0, 0, 1),
(1711, 17, '{\"en\":\"Soutr Nikom\",\"kh\":\"\\u179f\\u17bc\\u1791\\u17d2\\u179a\\u1793\\u17b7\\u1782\\u1798\"}', 'Soutr Nikom', 'សូទ្រនិគម', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1712, 17, '{\"en\":\"Srei Snam\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17b8\\u179f\\u17d2\\u1793\\u17c6\"}', 'Srei Snam', 'ស្រីស្នំ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1713, 17, '{\"en\":\"Svay Leu\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u179b\\u17be\"}', 'Svay Leu', 'ស្វាយលើ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1714, 17, '{\"en\":\"Varin\",\"kh\":\"\\u179c\\u17c9\\u17b6\\u179a\\u17b7\\u1793\"}', 'Varin', 'វ៉ារិន', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1801, 18, '{\"en\":\"Preah Sihanouk\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c7\\u179f\\u17b8\\u17a0\\u1793\\u17bb\"}', 'Preah Sihanouk', 'ព្រះសីហនុ', '', 'Municipality', 201, '', 'yes', '', 'no', 0, 0, 1),
(1802, 18, '{\"en\":\"Prey Nob\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1793\\u1794\\u17cb\"}', 'Prey Nob', 'ព្រៃនប់', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1803, 18, '{\"en\":\"Stueng Hav\",\"kh\":\"\\u179f\\u17d2\\u1791\\u17b9\\u1784\\u17a0\\u17b6\\u179c\"}', 'Stueng Hav', 'ស្ទឹងហាវ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1804, 18, '{\"en\":\"Kampong Seila\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u179f\\u17b8\\u179b\\u17b6\"}', 'Kampong Seila', 'កំពង់សីលា', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1805, 18, '{\"en\":\"Kaoh Rung\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u179a\\u17c9\\u17bb\\u1784\"}', 'Kaoh Rung', 'កោះរ៉ុង', '', 'Municipality', 201, '', 'yes', '', 'no', 0, 0, 1),
(1901, 19, '{\"en\":\"Sesan\",\"kh\":\"\\u179f\\u17c1\\u179f\\u17b6\\u1793\"}', 'Sesan', 'សេសាន', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1902, 19, '{\"en\":\"Siem Bouk\",\"kh\":\"\\u179f\\u17c0\\u1798\\u1794\\u17bc\\u1780\"}', 'Siem Bouk', 'សៀមបូក', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1903, 19, '{\"en\":\"Siem Pang\",\"kh\":\"\\u179f\\u17c0\\u1798\\u1794\\u17c9\\u17b6\\u1784\"}', 'Siem Pang', 'សៀមប៉ាង', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1904, 19, '{\"en\":\"Stueng Traeng\",\"kh\":\"\\u179f\\u17d2\\u1791\\u17b9\\u1784\\u178f\\u17d2\\u179a\\u17c2\\u1784\"}', 'Stueng Traeng', 'ស្ទឹងត្រែង', '', 'Municipality', 201, '', 'yes', '', 'no', 0, 0, 1),
(1905, 19, '{\"en\":\"Thala Barivat\",\"kh\":\"\\u1790\\u17b6\\u17a1\\u17b6\\u1794\\u179a\\u17b7\\u179c\\u17c9\\u17b6\\u178f\\u17cb\"}', 'Thala Barivat', 'ថាឡាបរិវ៉ាត់', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(1906, 19, '{\"en\":\"Borei Ou Svay Senchey\",\"kh\":\"\\u1794\\u17bb\\u179a\\u17b8\\u17a2\\u17bc\\u179a\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u179f\\u17c2\\u1793\\u1787\\u17d0\\u1799\"}', 'Borei Ou Svay Senchey', 'បុរីអូរស្វាយសែនជ័យ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(2001, 20, '{\"en\":\"Chantrea\",\"kh\":\"\\u1785\\u1793\\u17d2\\u1791\\u17d2\\u179a\\u17b6\"}', 'Chantrea', 'ចន្ទ្រា', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(2002, 20, '{\"en\":\"Kampong Rou\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u179a\\u17c4\\u1791\\u17b7\\u17cd\"}', 'Kampong Rou', 'កំពង់រោទិ៍', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(2003, 20, '{\"en\":\"Rumduol\",\"kh\":\"\\u179a\\u17c6\\u178a\\u17bd\\u179b\"}', 'Rumduol', 'រំដួល', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(2004, 20, '{\"en\":\"Romeas Haek\",\"kh\":\"\\u179a\\u1798\\u17b6\\u179f\\u17a0\\u17c2\\u1780\"}', 'Romeas Haek', 'រមាសហែក', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(2005, 20, '{\"en\":\"Svay Chrum\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u1787\\u17d2\\u179a\\u17c6\"}', 'Svay Chrum', 'ស្វាយជ្រំ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(2006, 20, '{\"en\":\"Svay Rieng\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u179a\\u17c0\\u1784\"}', 'Svay Rieng', 'ស្វាយរៀង', '', 'Municipality', 201, '', 'yes', '', 'no', 0, 0, 1),
(2007, 20, '{\"en\":\"Svay Teab\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u1791\\u17b6\\u1794\"}', 'Svay Teab', 'ស្វាយទាប', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(2008, 20, '{\"en\":\"Bavet\",\"kh\":\"\\u1794\\u17b6\\u179c\\u17b7\\u178f\"}', 'Bavet', 'បាវិត', '', 'Municipality', 201, '', 'yes', '', 'no', 0, 0, 1),
(2101, 21, '{\"en\":\"Angkor Borei\",\"kh\":\"\\u17a2\\u1784\\u17d2\\u1782\\u179a\\u1794\\u17bc\\u179a\\u17b8\"}', 'Angkor Borei', 'អង្គរបូរី', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(2102, 21, '{\"en\":\"Bati\",\"kh\":\"\\u1794\\u17b6\\u1791\\u17b8\"}', 'Bati', 'បាទី', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(2103, 21, '{\"en\":\"Borei Cholsar\",\"kh\":\"\\u1794\\u17bc\\u179a\\u17b8\\u1787\\u179b\\u179f\\u17b6\\u179a\"}', 'Borei Cholsar', 'បូរីជលសារ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(2104, 21, '{\"en\":\"Kiri Vong\",\"kh\":\"\\u1782\\u17b8\\u179a\\u17b8\\u179c\\u1784\\u17cb\"}', 'Kiri Vong', 'គីរីវង់', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(2105, 21, '{\"en\":\"Kaoh Andaet\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u17a2\\u178e\\u17d2\\u178a\\u17c2\\u178f\"}', 'Kaoh Andaet', 'កោះអណ្ដែត', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(2106, 21, '{\"en\":\"Prey Kabbas\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1780\\u1794\\u17d2\\u1794\\u17b6\\u179f\"}', 'Prey Kabbas', 'ព្រៃកប្បាស', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(2107, 21, '{\"en\":\"Samraong\",\"kh\":\"\\u179f\\u17c6\\u179a\\u17c4\\u1784\"}', 'Samraong', 'សំរោង', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(2108, 21, '{\"en\":\"Doun Kaev\",\"kh\":\"\\u178a\\u17bc\\u1793\\u1780\\u17c2\\u179c\"}', 'Doun Kaev', 'ដូនកែវ', '', 'Municipality', 201, '', 'yes', '', 'no', 0, 0, 1),
(2109, 21, '{\"en\":\"Tram Kak\",\"kh\":\"\\u178f\\u17d2\\u179a\\u17b6\\u17c6\\u1780\\u1780\\u17cb\"}', 'Tram Kak', 'ត្រាំកក់', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(2110, 21, '{\"en\":\"Treang\",\"kh\":\"\\u1791\\u17d2\\u179a\\u17b6\\u17c6\\u1784\"}', 'Treang', 'ទ្រាំង', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(2201, 22, '{\"en\":\"Anlong Veaeng\",\"kh\":\"\\u17a2\\u1793\\u17d2\\u179b\\u1784\\u17cb\\u179c\\u17c2\\u1784\"}', 'Anlong Veaeng', 'អន្លង់វែង', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(2202, 22, '{\"en\":\"Banteay Ampil\",\"kh\":\"\\u1794\\u1793\\u17d2\\u1791\\u17b6\\u1799\\u17a2\\u17c6\\u1796\\u17b7\\u179b\"}', 'Banteay Ampil', 'បន្ទាយអំពិល', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(2203, 22, '{\"en\":\"Chong Kal\",\"kh\":\"\\u1785\\u17bb\\u1784\\u1780\\u17b6\\u179b\\u17cb\"}', 'Chong Kal', 'ចុងកាល់', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(2204, 22, '{\"en\":\"Samraong\",\"kh\":\"\\u179f\\u17c6\\u179a\\u17c4\\u1784\"}', 'Samraong', 'សំរោង', '', 'Municipality', 201, '', 'yes', '', 'no', 0, 0, 1),
(2205, 22, '{\"en\":\"Trapeang Prasat\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u1794\\u17d2\\u179a\\u17b6\\u179f\\u17b6\\u1791\"}', 'Trapeang Prasat', 'ត្រពាំងប្រាសាទ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(2301, 23, '{\"en\":\"Damnak Chang\'aeur\",\"kh\":\"\\u178a\\u17c6\\u178e\\u17b6\\u1780\\u17cb\\u1785\\u1784\\u17d2\\u17a2\\u17be\\u179a\"}', 'Damnak Chang\'aeur', 'ដំណាក់ចង្អើរ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(2302, 23, '{\"en\":\"Kaeb\",\"kh\":\"\\u1780\\u17c2\\u1794\"}', 'Kaeb', 'កែប', '', 'Municipality', 201, '', 'yes', '', 'no', 0, 0, 1),
(2401, 24, '{\"en\":\"Pailin\",\"kh\":\"\\u1794\\u17c9\\u17c3\\u179b\\u17b7\\u1793\"}', 'Pailin', 'ប៉ៃលិន', '', 'Municipality', 201, '', 'yes', '', 'no', 0, 0, 1),
(2402, 24, '{\"en\":\"Sala Krau\",\"kh\":\"\\u179f\\u17b6\\u179b\\u17b6\\u1780\\u17d2\\u179a\\u17c5\"}', 'Sala Krau', 'សាលាក្រៅ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(2501, 25, '{\"en\":\"Dambae\",\"kh\":\"\\u178f\\u17c6\\u1794\\u17c2\\u179a\"}', 'Dambae', 'តំបែរ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(2502, 25, '{\"en\":\"Krouch Chhmar\",\"kh\":\"\\u1780\\u17d2\\u179a\\u17bc\\u1785\\u1786\\u17d2\\u1798\\u17b6\\u179a\"}', 'Krouch Chhmar', 'ក្រូចឆ្មារ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(2503, 25, '{\"en\":\"Memot\",\"kh\":\"\\u1798\\u17c1\\u1798\\u178f\\u17cb\"}', 'Memot', 'មេមត់', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(2504, 25, '{\"en\":\"Ou Reang Ov\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u179a\\u17b6\\u17c6\\u1784\\u17aa\"}', 'Ou Reang Ov', 'អូររាំងឪ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(2505, 25, '{\"en\":\"Ponhea Kraek\",\"kh\":\"\\u1796\\u1789\\u17b6\\u1780\\u17d2\\u179a\\u17c2\\u1780\"}', 'Ponhea Kraek', 'ពញាក្រែក', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(2506, 25, '{\"en\":\"Suong\",\"kh\":\"\\u179f\\u17bd\\u1784\"}', 'Suong', 'សួង', '', 'Municipality', 201, '', 'yes', '', 'no', 0, 0, 1),
(2507, 25, '{\"en\":\"Tboung Khmum\",\"kh\":\"\\u178f\\u17d2\\u1794\\u17bc\\u1784\\u1783\\u17d2\\u1798\\u17bb\\u17c6\"}', 'Tboung Khmum', 'ត្បូងឃ្មុំ', '', 'District', 202, '', 'yes', '', 'no', 0, 0, 1),
(10201, 102, '{\"en\":\"Banteay Neang\",\"kh\":\"\\u1794\\u1793\\u17d2\\u1791\\u17b6\\u1799\\u1793\\u17b6\\u1784\"}', 'Banteay Neang', 'បន្ទាយនាង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10202, 102, '{\"en\":\"Bat Trang\",\"kh\":\"\\u1794\\u178f\\u17cb\\u178f\\u17d2\\u179a\\u1784\\u17cb\"}', 'Bat Trang', 'បត់ត្រង់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10203, 102, '{\"en\":\"Chamnaom\",\"kh\":\"\\u1785\\u17c6\\u178e\\u17c4\\u1798\"}', 'Chamnaom', 'ចំណោម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10204, 102, '{\"en\":\"Kouk Ballangk\",\"kh\":\"\\u1782\\u17c4\\u1780\\u1794\\u179b\\u17d2\\u179b\\u17d0\\u1784\\u17d2\\u1782\"}', 'Kouk Ballangk', 'គោកបល្ល័ង្គ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10205, 102, '{\"en\":\"Koy Maeng\",\"kh\":\"\\u1782\\u1799\\u1798\\u17c9\\u17c2\\u1784\"}', 'Koy Maeng', 'គយម៉ែង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10206, 102, '{\"en\":\"Ou Prasat\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u1794\\u17d2\\u179a\\u17b6\\u179f\\u17b6\\u1791\"}', 'Ou Prasat', 'អូរប្រាសាទ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10207, 102, '{\"en\":\"Phnum Touch\",\"kh\":\"\\u1797\\u17d2\\u1793\\u17c6\\u178f\\u17bc\\u1785\"}', 'Phnum Touch', 'ភ្នំតូច', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10208, 102, '{\"en\":\"Rohat Tuek\",\"kh\":\"\\u179a\\u17a0\\u17b6\\u178f\\u17cb\\u1791\\u17b9\\u1780\"}', 'Rohat Tuek', 'រហាត់ទឹក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10209, 102, '{\"en\":\"Ruessei Kraok\",\"kh\":\"\\u17ab\\u179f\\u17d2\\u179f\\u17b8\\u1780\\u17d2\\u179a\\u17c4\\u1780\"}', 'Ruessei Kraok', 'ឫស្សីក្រោក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10210, 102, '{\"en\":\"Sambuor\",\"kh\":\"\\u179f\\u17c6\\u1794\\u17bd\\u179a\"}', 'Sambuor', 'សំបួរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10211, 102, '{\"en\":\"Soea\",\"kh\":\"\\u179f\\u17bf\"}', 'Soea', 'សឿ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10212, 102, '{\"en\":\"Srah Reang\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17c7\\u179a\\u17b6\\u17c6\\u1784\"}', 'Srah Reang', 'ស្រះរាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10213, 102, '{\"en\":\"Ta Lam\",\"kh\":\"\\u178f\\u17b6\\u17a1\\u17c6\"}', 'Ta Lam', 'តាឡំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10301, 103, '{\"en\":\"Nam Tau\",\"kh\":\"\\u178e\\u17b6\\u17c6\\u178f\\u17c5\"}', 'Nam Tau', 'ណាំតៅ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10302, 103, '{\"en\":\"Poy Char\",\"kh\":\"\\u1794\\u17c9\\u17c4\\u1799\\u1785\\u17b6\\u179a\"}', 'Poy Char', 'ប៉ោយចារ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10303, 103, '{\"en\":\"Ponley\",\"kh\":\"\\u1796\\u1793\\u17d2\\u179b\\u17c3\"}', 'Ponley', 'ពន្លៃ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10304, 103, '{\"en\":\"Spean Sraeng\",\"kh\":\"\\u179f\\u17d2\\u1796\\u17b6\\u1793\\u179f\\u17d2\\u179a\\u17c2\\u1784\"}', 'Spean Sraeng', 'ស្ពានស្រែង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10305, 103, '{\"en\":\"Srah Chik\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17c7\\u1787\\u17b8\\u1780\"}', 'Srah Chik', 'ស្រះជីក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10306, 103, '{\"en\":\"Phnum Dei\",\"kh\":\"\\u1797\\u17d2\\u1793\\u17c6\\u178a\\u17b8\"}', 'Phnum Dei', 'ភ្នំដី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10401, 104, '{\"en\":\"Chnuor Mean Chey\",\"kh\":\"\\u1788\\u17d2\\u1793\\u17bd\\u179a\\u1798\\u17b6\\u1793\\u1787\\u17d0\\u1799\"}', 'Chnuor Mean Chey', 'ឈ្នួរមានជ័យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10402, 104, '{\"en\":\"Chob Vari\",\"kh\":\"\\u1787\\u1794\\u17cb\\u179c\\u17b6\\u179a\\u17b8\"}', 'Chob Vari', 'ជប់វារី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10403, 104, '{\"en\":\"Phnum Lieb\",\"kh\":\"\\u1797\\u17d2\\u1793\\u17c6\\u179b\\u17c0\\u1794\"}', 'Phnum Lieb', 'ភ្នំលៀប', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10404, 104, '{\"en\":\"Prasat\",\"kh\":\"\\u1794\\u17d2\\u179a\\u17b6\\u179f\\u17b6\\u1791\"}', 'Prasat', 'ប្រាសាទ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10405, 104, '{\"en\":\"Preak Netr Preah\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c7\\u1793\\u17c1\\u178f\\u17d2\\u179a\\u1796\\u17d2\\u179a\\u17c7\"}', 'Preak Netr Preah', 'ព្រះនេត្រព្រះ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10406, 104, '{\"en\":\"Rohal\",\"kh\":\"\\u179a\\u17a0\\u17b6\\u179b\"}', 'Rohal', 'រហាល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10407, 104, '{\"en\":\"Tean Kam\",\"kh\":\"\\u1791\\u17b6\\u1793\\u1780\\u17b6\\u17c6\"}', 'Tean Kam', 'ទានកាំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10408, 104, '{\"en\":\"Tuek Chour\",\"kh\":\"\\u1791\\u17b9\\u1780\\u1787\\u17c4\\u179a\"}', 'Tuek Chour', 'ទឹកជោរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10409, 104, '{\"en\":\"Bos Sbov\",\"kh\":\"\\u1794\\u17bb\\u179f\\u17d2\\u1794\\u17bc\\u179c\"}', 'Bos Sbov', 'បុស្បូវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10501, 105, '{\"en\":\"Changha\",\"kh\":\"\\u1785\\u1784\\u17d2\\u17a0\\u17b6\"}', 'Changha', 'ចង្ហា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10502, 105, '{\"en\":\"Koub\",\"kh\":\"\\u1780\\u17bc\\u1794\"}', 'Koub', 'កូប', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10503, 105, '{\"en\":\"Kuttasat\",\"kh\":\"\\u1782\\u17bb\\u178f\\u17d2\\u178a\\u179f\\u178f\"}', 'Kuttasat', 'គុត្ដសត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10505, 105, '{\"en\":\"Samraong\",\"kh\":\"\\u179f\\u17c6\\u179a\\u17c4\\u1784\"}', 'Samraong', 'សំរោង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10506, 105, '{\"en\":\"Souphi\",\"kh\":\"\\u179f\\u17bc\\u1797\\u17b8\"}', 'Souphi', 'សូភី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10507, 105, '{\"en\":\"Soengh\",\"kh\":\"\\u179f\\u17b9\\u1784\\u17d2\\u17a0\"}', 'Soengh', 'សឹង្ហ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10509, 105, '{\"en\":\"Ou Beichoan\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u1794\\u17b8\\u1787\\u17b6\\u1793\\u17cb\"}', 'Ou Beichoan', 'អូរបីជាន់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10602, 106, '{\"en\":\"Kampong Svay\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u179f\\u17d2\\u179c\\u17b6\\u1799\"}', 'Kampong Svay', 'កំពង់ស្វាយ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(10603, 106, '{\"en\":\"Kaoh Pong Satv\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u1796\\u1784\\u179f\\u178f\\u17d2\\u179c\"}', 'Kaoh Pong Satv', 'កោះពងសត្វ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(10604, 106, '{\"en\":\"Mkak\",\"kh\":\"\\u1798\\u17d2\\u1780\\u17b6\\u1780\\u17cb\"}', 'Mkak', 'ម្កាក់', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(10605, 106, '{\"en\":\"Ou Ambel\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u17a2\\u17c6\\u1794\\u17b7\\u179b\"}', 'Ou Ambel', 'អូរអំបិល', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(10606, 106, '{\"en\":\"Phniet\",\"kh\":\"\\u1797\\u17d2\\u1793\\u17c0\\u178f\"}', 'Phniet', 'ភ្នៀត', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(10607, 106, '{\"en\":\"Preah Ponlea\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c7\\u1796\\u1793\\u17d2\\u179b\\u17b6\"}', 'Preah Ponlea', 'ព្រះពន្លា', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(10608, 106, '{\"en\":\"Tuek Thla\",\"kh\":\"\\u1791\\u17b9\\u1780\\u1790\\u17d2\\u179b\\u17b6\"}', 'Tuek Thla', 'ទឹកថ្លា', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(10701, 107, '{\"en\":\"Banteay Chhmar\",\"kh\":\"\\u1794\\u1793\\u17d2\\u1791\\u17b6\\u1799\\u1786\\u17d2\\u1798\\u17b6\\u179a\"}', 'Banteay Chhmar', 'បន្ទាយឆ្មារ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10702, 107, '{\"en\":\"Kouk Romiet\",\"kh\":\"\\u1782\\u17c4\\u1780\\u179a\\u1798\\u17c0\\u178f\"}', 'Kouk Romiet', 'គោករមៀត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10703, 107, '{\"en\":\"Phum Thmei\",\"kh\":\"\\u1797\\u17bc\\u1798\\u17b7\\u1790\\u17d2\\u1798\\u17b8\"}', 'Phum Thmei', 'ភូមិថ្មី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10704, 107, '{\"en\":\"Thma Puok\",\"kh\":\"\\u1790\\u17d2\\u1798\\u1796\\u17bd\\u1780\"}', 'Thma Puok', 'ថ្មពួក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10705, 107, '{\"en\":\"Kouk Kakthen\",\"kh\":\"\\u1782\\u17c4\\u1780\\u1780\\u178b\\u17b7\\u1793\"}', 'Kouk Kakthen', 'គោកកឋិន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10706, 107, '{\"en\":\"Kumru\",\"kh\":\"\\u1782\\u17c6\\u179a\\u17bc\"}', 'Kumru', 'គំរូ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10801, 108, '{\"en\":\"Phkoam\",\"kh\":\"\\u1795\\u17d2\\u1782\\u17b6\\u17c6\"}', 'Phkoam', 'ផ្គាំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10802, 108, '{\"en\":\"Sarongk\",\"kh\":\"\\u179f\\u17b6\\u179a\\u1784\\u17d2\\u1782\"}', 'Sarongk', 'សារង្គ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10803, 108, '{\"en\":\"Sla Kram\",\"kh\":\"\\u179f\\u17d2\\u179b\\u1780\\u17d2\\u179a\\u17b6\\u1798\"}', 'Sla Kram', 'ស្លក្រាម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10804, 108, '{\"en\":\"Svay Chek\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u1785\\u17c1\\u1780\"}', 'Svay Chek', 'ស្វាយចេក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10805, 108, '{\"en\":\"Ta Baen\",\"kh\":\"\\u178f\\u17b6\\u1794\\u17c2\\u1793\"}', 'Ta Baen', 'តាបែន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1);
INSERT INTO `tbl_location` (`location_id`, `parent_id`, `title`, `title_en`, `title_kh`, `shortname`, `type`, `prefix`, `image`, `display`, `tag`, `trash`, `ordering`, `ab_id`, `blongto`) VALUES
(10806, 108, '{\"en\":\"Ta Phou\",\"kh\":\"\\u178f\\u17b6\\u1795\\u17bc\"}', 'Ta Phou', 'តាផូ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10807, 108, '{\"en\":\"Treas\",\"kh\":\"\\u1791\\u17d2\\u179a\\u17b6\\u179f\"}', 'Treas', 'ទ្រាស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10808, 108, '{\"en\":\"Roluos\",\"kh\":\"\\u179a\\u179b\\u17bd\\u179f\"}', 'Roluos', 'រលួស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10901, 109, '{\"en\":\"Boeng Beng\",\"kh\":\"\\u1794\\u17b9\\u1784\\u1794\\u17c1\\u1784\"}', 'Boeng Beng', 'បឹងបេង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10902, 109, '{\"en\":\"Malai\",\"kh\":\"\\u1798\\u17c9\\u17b6\\u17a1\\u17c3\"}', 'Malai', 'ម៉ាឡៃ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10903, 109, '{\"en\":\"Ou Sampoar\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u179f\\u17c6\\u1796\\u17d0\\u179a\"}', 'Ou Sampoar', 'អូរសំព័រ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10904, 109, '{\"en\":\"Ou Sralau\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u179f\\u17d2\\u179a\\u17a1\\u17c5\"}', 'Ou Sralau', 'អូរស្រឡៅ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10905, 109, '{\"en\":\"Tuol Pongro\",\"kh\":\"\\u1791\\u17bd\\u179b\\u1796\\u1784\\u17d2\\u179a\"}', 'Tuol Pongro', 'ទួលពង្រ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(10906, 109, '{\"en\":\"Ta Kong\",\"kh\":\"\\u178f\\u17b6\\u1782\\u1784\\u17cb\"}', 'Ta Kong', 'តាគង់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(11001, 110, '{\"en\":\"Nimitt\",\"kh\":\"\\u1793\\u17b7\\u1798\\u17b7\\u178f\\u17d2\\u178a\"}', 'Nimitt', 'និមិត្ដ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(11002, 110, '{\"en\":\"Paoy Paet\",\"kh\":\"\\u1794\\u17c9\\u17c4\\u1799\\u1794\\u17c9\\u17c2\\u178f\"}', 'Paoy Paet', 'ប៉ោយប៉ែត', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(11003, 110, '{\"en\":\"Phsar Kandal\",\"kh\":\"\\u1795\\u17d2\\u179f\\u17b6\\u179a\\u1780\\u178e\\u17d2\\u178f\\u17b6\\u179b\"}', 'Phsar Kandal', 'ផ្សារកណ្តាល', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(11004, 110, '{\"en\":\"Ou Chrov\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u1787\\u17d2\\u179a\\u17c5\"}', 'Ou Chrov', 'អូរជ្រៅ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(11005, 110, '{\"en\":\"Ou Reusey\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u17ab\\u179f\\u17d2\\u179f\\u17b8\"}', 'Ou Reusey', 'អូរឫស្សី', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(20101, 201, '{\"en\":\"Kantueu Muoy\",\"kh\":\"\\u1780\\u1793\\u17d2\\u1791\\u17ba \\u17e1\"}', 'Kantueu Muoy', 'កន្ទឺ ១', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20102, 201, '{\"en\":\"Kantueu Pir\",\"kh\":\"\\u1780\\u1793\\u17d2\\u1791\\u17ba \\u17e2\"}', 'Kantueu Pir', 'កន្ទឺ ២', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20103, 201, '{\"en\":\"Bay Damram\",\"kh\":\"\\u1794\\u17b6\\u1799\\u178a\\u17c6\\u179a\\u17b6\\u17c6\"}', 'Bay Damram', 'បាយដំរាំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20104, 201, '{\"en\":\"Chheu Teal\",\"kh\":\"\\u1788\\u17be\\u1791\\u17b6\\u179b\"}', 'Chheu Teal', 'ឈើទាល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20105, 201, '{\"en\":\"Chaeng Mean Chey\",\"kh\":\"\\u1785\\u17c2\\u1784\\u1798\\u17b6\\u1793\\u1787\\u17d0\\u1799\"}', 'Chaeng Mean Chey', 'ចែងមានជ័យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20106, 201, '{\"en\":\"Phnum Sampov\",\"kh\":\"\\u1797\\u17d2\\u1793\\u17c6\\u179f\\u17c6\\u1796\\u17c5\"}', 'Phnum Sampov', 'ភ្នំសំពៅ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20107, 201, '{\"en\":\"Snoeng\",\"kh\":\"\\u179f\\u17d2\\u1793\\u17b9\\u1784\"}', 'Snoeng', 'ស្នឹង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20108, 201, '{\"en\":\"Ta Kream\",\"kh\":\"\\u178f\\u17b6\\u1782\\u17d2\\u179a\\u17b6\\u1798\"}', 'Ta Kream', 'តាគ្រាម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20201, 202, '{\"en\":\"Ta Pung\",\"kh\":\"\\u178f\\u17b6\\u1796\\u17bc\\u1784\"}', 'Ta Pung', 'តាពូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20202, 202, '{\"en\":\"Ta Meun\",\"kh\":\"\\u178f\\u17b6\\u1798\\u17c9\\u17ba\\u1793\"}', 'Ta Meun', 'តាម៉ឺន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20203, 202, '{\"en\":\"Ou Ta Ki\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u178f\\u17b6\\u1782\\u17b8\"}', 'Ou Ta Ki', 'អូរតាគី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20204, 202, '{\"en\":\"Chrey\",\"kh\":\"\\u1787\\u17d2\\u179a\\u17c3\"}', 'Chrey', 'ជ្រៃ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20205, 202, '{\"en\":\"Anlong Run\",\"kh\":\"\\u17a2\\u1793\\u17d2\\u179b\\u1784\\u17cb\\u179a\\u17bb\\u1793\"}', 'Anlong Run', 'អន្លង់រុន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20206, 202, '{\"en\":\"Chrouy Sdau\",\"kh\":\"\\u1787\\u17d2\\u179a\\u17c4\\u1799\\u179f\\u17d2\\u178a\\u17c5\"}', 'Chrouy Sdau', 'ជ្រោយស្ដៅ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20207, 202, '{\"en\":\"Boeng Pring\",\"kh\":\"\\u1794\\u17b9\\u1784\\u1796\\u17d2\\u179a\\u17b8\\u1784\"}', 'Boeng Pring', 'បឹងព្រីង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20208, 202, '{\"en\":\"Kouk Khmum\",\"kh\":\"\\u1782\\u17c4\\u1780\\u1783\\u17d2\\u1798\\u17bb\\u17c6\"}', 'Kouk Khmum', 'គោកឃ្មុំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20209, 202, '{\"en\":\"Bansay Traeng\",\"kh\":\"\\u1794\\u1793\\u17d2\\u179f\\u17b6\\u1799\\u178f\\u17d2\\u179a\\u17c2\\u1784\"}', 'Bansay Traeng', 'បន្សាយត្រែង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20210, 202, '{\"en\":\"Rung Chrey\",\"kh\":\"\\u179a\\u17bc\\u1784\\u1787\\u17d2\\u179a\\u17c3\"}', 'Rung Chrey', 'រូងជ្រៃ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20301, 203, '{\"en\":\"Tuol Ta Ek\",\"kh\":\"\\u1791\\u17bd\\u179b\\u178f\\u17b6\\u17af\\u1780\"}', 'Tuol Ta Ek', 'ទួលតាឯក', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(20302, 203, '{\"en\":\"Prek Preah Sdach\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1796\\u17d2\\u179a\\u17c7\\u179f\\u17d2\\u178a\\u17c1\\u1785\"}', 'Prek Preah Sdach', 'ព្រែកព្រះស្ដេច', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(20303, 203, '{\"en\":\"Rottanak\",\"kh\":\"\\u179a\\u178f\\u1793\\u17c8\"}', 'Rottanak', 'រតនៈ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(20304, 203, '{\"en\":\"Chomkar Somraong\",\"kh\":\"\\u1785\\u17c6\\u1780\\u17b6\\u179a\\u179f\\u17c6\\u179a\\u17c4\\u1784\"}', 'Chomkar Somraong', 'ចំការសំរោង', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(20305, 203, '{\"en\":\"Sla Ket\",\"kh\":\"\\u179f\\u17d2\\u179b\\u17b6\\u1780\\u17c2\\u178f\"}', 'Sla Ket', 'ស្លាកែត', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(20306, 203, '{\"en\":\"Kdol Doun Teav\",\"kh\":\"\\u1780\\u17d2\\u178a\\u17bb\\u179b\\u178a\\u17bc\\u1793\\u1791\\u17b6\\u179c\"}', 'Kdol Doun Teav', 'ក្ដុលដូនទាវ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(20307, 203, '{\"en\":\"OMal\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u1798\\u17c9\\u17b6\\u179b\\u17cb\"}', 'OMal', 'អូរម៉ាល់', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(20308, 203, '{\"en\":\"wat Kor\",\"kh\":\"\\u179c\\u178f\\u17d2\\u178a\\u1782\\u179a\"}', 'wat Kor', 'វត្ដគរ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(20309, 203, '{\"en\":\"Ou Char\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u1785\\u17b6\\u179a\"}', 'Ou Char', 'អូរចារ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(20310, 203, '{\"en\":\"Svay Por\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u1794\\u17c9\\u17c4\"}', 'Svay Por', 'ស្វាយប៉ោ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(20401, 204, '{\"en\":\"Bavel\",\"kh\":\"\\u1794\\u179c\\u17c1\\u179b\"}', 'Bavel', 'បវេល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20402, 204, '{\"en\":\"Khnach Romeas\",\"kh\":\"\\u1781\\u17d2\\u1793\\u17b6\\u1785\\u179a\\u1798\\u17b6\\u179f\"}', 'Khnach Romeas', 'ខ្នាចរមាស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20403, 204, '{\"en\":\"Lvea\",\"kh\":\"\\u179b\\u17d2\\u179c\\u17b6\"}', 'Lvea', 'ល្វា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20404, 204, '{\"en\":\"Prey Khpos\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1781\\u17d2\\u1796\\u179f\\u17cb\"}', 'Prey Khpos', 'ព្រៃខ្ពស់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20405, 204, '{\"en\":\"Ampil Pram Daeum\",\"kh\":\"\\u17a2\\u17c6\\u1796\\u17b7\\u179b\\u1794\\u17d2\\u179a\\u17b6\\u17c6\\u178a\\u17be\\u1798\"}', 'Ampil Pram Daeum', 'អំពិលប្រាំដើម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20406, 204, '{\"en\":\"Kdol Ta Haen\",\"kh\":\"\\u1780\\u17d2\\u178a\\u17bb\\u179b\\u178f\\u17b6\\u17a0\\u17c2\\u1793\"}', 'Kdol Ta Haen', 'ក្ដុលតាហែន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20407, 204, '{\"en\":\"Khlaeng Meas\",\"kh\":\"\\u1783\\u17d2\\u179b\\u17b6\\u17c6\\u1784\\u1798\\u17b6\\u179f\"}', 'Khlaeng Meas', 'ឃ្លាំងមាស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20408, 204, '{\"en\":\"Boeung Pram\",\"kh\":\"\\u1794\\u17b9\\u1784\\u1794\\u17d2\\u179a\\u17b6\\u17c6\"}', 'Boeung Pram', 'បឹងប្រាំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20409, 204, '{\"en\":\"Bouvel\",\"kh\":\"\\u1794\\u17bd\\u179c\\u17b7\\u179b\"}', 'Bouvel', 'បួវិល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20501, 205, '{\"en\":\"Preaek Norint\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1793\\u179a\\u17b7\\u1793\\u17d2\\u1791\"}', 'Preaek Norint', 'ព្រែកនរិន្ទ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20502, 205, '{\"en\":\"Samraong Knong\",\"kh\":\"\\u179f\\u17c6\\u179a\\u17c4\\u1784\\u1780\\u17d2\\u1793\\u17bb\\u1784\"}', 'Samraong Knong', 'សំរោងក្នុង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20503, 205, '{\"en\":\"Preaek Khpob\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1781\\u17d2\\u1796\\u1794\"}', 'Preaek Khpob', 'ព្រែកខ្ពប', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20504, 205, '{\"en\":\"Preaek Luong\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u17a0\\u17d2\\u179b\\u17bd\\u1784\"}', 'Preaek Luong', 'ព្រែកហ្លួង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20505, 205, '{\"en\":\"Peam Aek\",\"kh\":\"\\u1796\\u17b6\\u1798\\u17af\\u1780\"}', 'Peam Aek', 'ពាមឯក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20506, 205, '{\"en\":\"Prey Chas\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1785\\u17b6\\u179f\\u17cb\"}', 'Prey Chas', 'ព្រៃចាស់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20507, 205, '{\"en\":\"Kaoh Chiveang\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u1787\\u17b8\\u179c\\u17b6\\u17c6\\u1784\"}', 'Kaoh Chiveang', 'កោះជីវាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20601, 206, '{\"en\":\"Moung\",\"kh\":\"\\u1798\\u17c4\\u1784\"}', 'Moung', 'មោង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20602, 206, '{\"en\":\"Kear\",\"kh\":\"\\u1782\\u17b6\\u179a\"}', 'Kear', 'គារ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20603, 206, '{\"en\":\"Prey Svay\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u179f\\u17d2\\u179c\\u17b6\\u1799\"}', 'Prey Svay', 'ព្រៃស្វាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20604, 206, '{\"en\":\"Ruessei Krang\",\"kh\":\"\\u17ab\\u179f\\u17d2\\u179f\\u17b8\\u1780\\u17d2\\u179a\\u17b6\\u17c6\\u1784\"}', 'Ruessei Krang', 'ឫស្សីក្រាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20605, 206, '{\"en\":\"Chrey\",\"kh\":\"\\u1787\\u17d2\\u179a\\u17c3\"}', 'Chrey', 'ជ្រៃ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20606, 206, '{\"en\":\"Ta Loas\",\"kh\":\"\\u178f\\u17b6\\u179b\\u17b6\\u179f\\u17cb\"}', 'Ta Loas', 'តាលាស់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20607, 206, '{\"en\":\"Kakaoh\",\"kh\":\"\\u1780\\u1780\\u17c4\\u17c7\"}', 'Kakaoh', 'កកោះ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20608, 206, '{\"en\":\"Prey Touch\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u178f\\u17bc\\u1785\"}', 'Prey Touch', 'ព្រៃតូច', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20609, 206, '{\"en\":\"Robas Mongkol\",\"kh\":\"\\u179a\\u1794\\u179f\\u17cb\\u1798\\u1784\\u17d2\\u1782\\u179b\"}', 'Robas Mongkol', 'របស់មង្គល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20701, 207, '{\"en\":\"Sdau\",\"kh\":\"\\u179f\\u17d2\\u178a\\u17c5\"}', 'Sdau', 'ស្ដៅ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20702, 207, '{\"en\":\"Andaeuk Haeb\",\"kh\":\"\\u17a2\\u178e\\u17d2\\u178a\\u17be\\u1780\\u17a0\\u17c2\\u1794\"}', 'Andaeuk Haeb', 'អណ្ដើកហែប', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20703, 207, '{\"en\":\"Phlov Meas\",\"kh\":\"\\u1795\\u17d2\\u179b\\u17bc\\u179c\\u1798\\u17b6\\u179f\"}', 'Phlov Meas', 'ផ្លូវមាស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20704, 207, '{\"en\":\"Traeng\",\"kh\":\"\\u178f\\u17d2\\u179a\\u17c2\\u1784\"}', 'Traeng', 'ត្រែង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20705, 207, '{\"en\":\"Reaksmei Songha\",\"kh\":\"\\u179a\\u179f\\u17d2\\u1798\\u17b8\\u179f\\u1784\\u17d2\\u17a0\\u17b6\\u179a\"}', 'Reaksmei Songha', 'រស្មីសង្ហារ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20801, 208, '{\"en\":\"Anlong Vil\",\"kh\":\"\\u17a2\\u1793\\u17d2\\u179b\\u1784\\u17cb\\u179c\\u17b7\\u179b\"}', 'Anlong Vil', 'អន្លង់វិល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20802, 208, '{\"en\":\"Norea\",\"kh\":\"\\u1793\\u179a\\u17b6\"}', 'Norea', 'នរា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20803, 208, '{\"en\":\"Ta Pon\",\"kh\":\"\\u178f\\u17b6\\u1794\\u17c9\\u17bb\\u1793\"}', 'Ta Pon', 'តាប៉ុន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20804, 208, '{\"en\":\"Roka\",\"kh\":\"\\u179a\\u1780\\u17b6\"}', 'Roka', 'រកា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20805, 208, '{\"en\":\"Kampong Preah\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1796\\u17d2\\u179a\\u17c7\"}', 'Kampong Preah', 'កំពង់ព្រះ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20806, 208, '{\"en\":\"Kampong Prieng\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1796\\u17d2\\u179a\\u17c0\\u1784\"}', 'Kampong Prieng', 'កំពង់ព្រៀង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20807, 208, '{\"en\":\"Reang Kesei\",\"kh\":\"\\u179a\\u17b6\\u17c6\\u1784\\u1780\\u17c1\\u179f\\u17b8\"}', 'Reang Kesei', 'រាំងកេសី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20808, 208, '{\"en\":\"Ou Dambang Muoy\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u178a\\u17c6\\u1794\\u1784 \\u17e1\"}', 'Ou Dambang Muoy', 'អូរដំបង ១', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20809, 208, '{\"en\":\"Ou Dambang Pir\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u178a\\u17c6\\u1794\\u1784 \\u17e2\"}', 'Ou Dambang Pir', 'អូរដំបង ២', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20810, 208, '{\"en\":\"Vaot Ta Muem\",\"kh\":\"\\u179c\\u178f\\u17d2\\u178a\\u178f\\u17b6\\u1798\\u17b7\\u1798\"}', 'Vaot Ta Muem', 'វត្ដតាមិម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20901, 209, '{\"en\":\"Ta Taok\",\"kh\":\"\\u178f\\u17b6\\u178f\\u17c4\\u1780\"}', 'Ta Taok', 'តាតោក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20902, 209, '{\"en\":\"Kampong Lpov\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u179b\\u17d2\\u1796\\u17c5\"}', 'Kampong Lpov', 'កំពង់ល្ពៅ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20903, 209, '{\"en\":\"Ou Samril\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u179f\\u17c6\\u179a\\u17b7\\u179b\"}', 'Ou Samril', 'អូរសំរិល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20904, 209, '{\"en\":\"Sung\",\"kh\":\"\\u179f\\u17ca\\u17bb\\u1784\"}', 'Sung', 'ស៊ុង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20905, 209, '{\"en\":\"Samlout\",\"kh\":\"\\u179f\\u17c6\\u17a1\\u17bc\\u178f\"}', 'Samlout', 'សំឡូត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20906, 209, '{\"en\":\"Mean Chey\",\"kh\":\"\\u1798\\u17b6\\u1793\\u1787\\u17d0\\u1799\"}', 'Mean Chey', 'មានជ័យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(20907, 209, '{\"en\":\"Ta Sanh\",\"kh\":\"\\u178f\\u17b6\\u179f\\u17b6\\u1789\"}', 'Ta Sanh', 'តាសាញ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(21001, 210, '{\"en\":\"Sampov Lun\",\"kh\":\"\\u179f\\u17c6\\u1796\\u17c5\\u179b\\u17bc\\u1793\"}', 'Sampov Lun', 'សំពៅលូន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(21002, 210, '{\"en\":\"Angkor Ban\",\"kh\":\"\\u17a2\\u1784\\u17d2\\u1782\\u179a\\u1794\\u17b6\\u1793\"}', 'Angkor Ban', 'អង្គរបាន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(21003, 210, '{\"en\":\"Ta Sda\",\"kh\":\"\\u178f\\u17b6\\u179f\\u17d2\\u178a\\u17b6\"}', 'Ta Sda', 'តាស្ដា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(21004, 210, '{\"en\":\"Santepheap\",\"kh\":\"\\u179f\\u1793\\u17d2\\u178a\\u17b7\\u1797\\u17b6\\u1796\"}', 'Santepheap', 'សន្ដិភាព', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(21005, 210, '{\"en\":\"Serei Mean Chey\",\"kh\":\"\\u179f\\u17c1\\u179a\\u17b8\\u1798\\u17b6\\u1793\\u1787\\u17d0\\u1799\"}', 'Serei Mean Chey', 'សេរីមានជ័យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(21006, 210, '{\"en\":\"Chrey Seima\",\"kh\":\"\\u1787\\u17d2\\u179a\\u17c3\\u179f\\u17b8\\u1798\\u17b6\"}', 'Chrey Seima', 'ជ្រៃសីមា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(21101, 211, '{\"en\":\"Phnum Proek\",\"kh\":\"\\u1797\\u17d2\\u1793\\u17c6\\u1796\\u17d2\\u179a\\u17b9\\u1780\"}', 'Phnum Proek', 'ភ្នំព្រឹក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(21102, 211, '{\"en\":\"Pech Chenda\",\"kh\":\"\\u1796\\u17c1\\u1787\\u17d2\\u179a\\u1785\\u17b7\\u1793\\u17d2\\u178a\\u17b6\"}', 'Pech Chenda', 'ពេជ្រចិន្ដា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(21103, 211, '{\"en\":\"Bour\",\"kh\":\"\\u1794\\u17bd\\u179a\"}', 'Bour', 'បួរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(21104, 211, '{\"en\":\"Barang Thleak\",\"kh\":\"\\u1794\\u17b6\\u179a\\u17b6\\u17c6\\u1784\\u1792\\u17d2\\u179b\\u17b6\\u1780\\u17cb\"}', 'Barang Thleak', 'បារាំងធ្លាក់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(21105, 211, '{\"en\":\"Ou Rumduol\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u179a\\u17c6\\u178a\\u17bd\\u179b\"}', 'Ou Rumduol', 'អូររំដួល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(21201, 212, '{\"en\":\"Kamrieng\",\"kh\":\"\\u1780\\u17c6\\u179a\\u17c0\\u1784\"}', 'Kamrieng', 'កំរៀង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(21202, 212, '{\"en\":\"Boeng Reang\",\"kh\":\"\\u1794\\u17b9\\u1784\\u179a\\u17b6\\u17c6\\u1784\"}', 'Boeng Reang', 'បឹងរាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(21203, 212, '{\"en\":\"Ou Da\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u178a\\u17b6\"}', 'Ou Da', 'អូរដា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(21204, 212, '{\"en\":\"Trang\",\"kh\":\"\\u178f\\u17d2\\u179a\\u17b6\\u1784\"}', 'Trang', 'ត្រាង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(21205, 212, '{\"en\":\"Ta Saen\",\"kh\":\"\\u178f\\u17b6\\u179f\\u17c2\\u1793\"}', 'Ta Saen', 'តាសែន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(21206, 212, '{\"en\":\"Ta Krei\",\"kh\":\"\\u178f\\u17b6\\u1780\\u17d2\\u179a\\u17b8\"}', 'Ta Krei', 'តាក្រី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(21301, 213, '{\"en\":\"Thipakdei\",\"kh\":\"\\u1792\\u17b7\\u1794\\u178f\\u17b8\"}', 'Thipakdei', 'ធិបតី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(21302, 213, '{\"en\":\"Kaos Krala\",\"kh\":\"\\u1782\\u17b6\\u179f\\u17cb\\u1780\\u17d2\\u179a\\u17a1\"}', 'Kaos Krala', 'គាស់ក្រឡ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(21303, 213, '{\"en\":\"Hab\",\"kh\":\"\\u17a0\\u1794\\u17cb\"}', 'Hab', 'ហប់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(21304, 213, '{\"en\":\"Preah Phos\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c7\\u1795\\u17bb\\u179f\"}', 'Preah Phos', 'ព្រះផុស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(21305, 213, '{\"en\":\"Doun Ba\",\"kh\":\"\\u178a\\u17bc\\u1793\\u1794\\u17b6\"}', 'Doun Ba', 'ដូនបា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(21306, 213, '{\"en\":\"Chhnal Moan\",\"kh\":\"\\u1786\\u17d2\\u1793\\u17b6\\u179b\\u17cb\\u1798\\u17b6\\u1793\\u17cb\"}', 'Chhnal Moan', 'ឆ្នាល់មាន់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(21401, 214, '{\"en\":\"Preaek Chik\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1787\\u17b8\\u1780\"}', 'Preaek Chik', 'ព្រែកជីក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(21402, 214, '{\"en\":\"Prey Tralach\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u178f\\u17d2\\u179a\\u17a1\\u17b6\\u1785\"}', 'Prey Tralach', 'ព្រៃត្រឡាច', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(21403, 214, '{\"en\":\"Mukh Reah\",\"kh\":\"\\u1798\\u17bb\\u1781\\u179a\\u17b6\\u17a0\\u17cd\"}', 'Mukh Reah', 'មុខរាហ៍', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(21404, 214, '{\"en\":\"Sdok Pravoek\",\"kh\":\"\\u179f\\u17d2\\u178f\\u17bb\\u1780\\u1794\\u17d2\\u179a\\u179c\\u17b9\\u1780\"}', 'Sdok Pravoek', 'ស្តុកប្រវឹក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(21405, 214, '{\"en\":\"Basak\",\"kh\":\"\\u1794\\u17b6\\u179f\\u17b6\\u1780\\u17cb\"}', 'Basak', 'បាសាក់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30101, 301, '{\"en\":\"Batheay\",\"kh\":\"\\u1794\\u17b6\\u1792\\u17b6\\u1799\"}', 'Batheay', 'បាធាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30102, 301, '{\"en\":\"Chbar Ampov\",\"kh\":\"\\u1785\\u17d2\\u1794\\u17b6\\u179a\\u17a2\\u17c6\\u1796\\u17c5\"}', 'Chbar Ampov', 'ច្បារអំពៅ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30103, 301, '{\"en\":\"Chealea\",\"kh\":\"\\u1787\\u17b6\\u179b\\u17b6\"}', 'Chealea', 'ជាលា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30104, 301, '{\"en\":\"Cheung Prey\",\"kh\":\"\\u1787\\u17be\\u1784\\u1796\\u17d2\\u179a\\u17c3\"}', 'Cheung Prey', 'ជើងព្រៃ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30105, 301, '{\"en\":\"Me Pring\",\"kh\":\"\\u1798\\u17c1\\u1796\\u17d2\\u179a\\u17b8\\u1784\"}', 'Me Pring', 'មេព្រីង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30106, 301, '{\"en\":\"Ph\'av\",\"kh\":\"\\u1795\\u17d2\\u17a2\\u17b6\\u179c\"}', 'Ph\'av', 'ផ្អាវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30107, 301, '{\"en\":\"Sambour\",\"kh\":\"\\u179f\\u17c6\\u1794\\u17bc\\u179a\"}', 'Sambour', 'សំបូរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30108, 301, '{\"en\":\"Sandaek\",\"kh\":\"\\u179f\\u178e\\u17d2\\u178a\\u17c2\\u1780\"}', 'Sandaek', 'សណ្ដែក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30109, 301, '{\"en\":\"Tang Krang\",\"kh\":\"\\u178f\\u17b6\\u17c6\\u1784\\u1780\\u17d2\\u179a\\u17b6\\u17c6\\u1784\"}', 'Tang Krang', 'តាំងក្រាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30110, 301, '{\"en\":\"Tang Krasang\",\"kh\":\"\\u178f\\u17b6\\u17c6\\u1784\\u1780\\u17d2\\u179a\\u179f\\u17b6\\u17c6\\u1784\"}', 'Tang Krasang', 'តាំងក្រសាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30111, 301, '{\"en\":\"Trab\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1794\\u17cb\"}', 'Trab', 'ត្រប់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30112, 301, '{\"en\":\"Tumnob\",\"kh\":\"\\u1791\\u17c6\\u1793\\u1794\\u17cb\"}', 'Tumnob', 'ទំនប់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30201, 302, '{\"en\":\"Bos Khnor\",\"kh\":\"\\u1794\\u17bb\\u179f\\u1781\\u17d2\\u1793\\u17bb\\u179a\"}', 'Bos Khnor', 'បុសខ្នុរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30202, 302, '{\"en\":\"Chamkar Andoung\",\"kh\":\"\\u1785\\u17c6\\u1780\\u17b6\\u179a\\u17a2\\u178e\\u17d2\\u178a\\u17bc\\u1784\"}', 'Chamkar Andoung', 'ចំការអណ្ដូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30203, 302, '{\"en\":\"Cheyyou\",\"kh\":\"\\u1787\\u1799\\u17c4\"}', 'Cheyyou', 'ជយោ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30204, 302, '{\"en\":\"Lvea Leu\",\"kh\":\"\\u179b\\u17d2\\u179c\\u17b6\\u179b\\u17be\"}', 'Lvea Leu', 'ល្វាលើ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30205, 302, '{\"en\":\"Spueu\",\"kh\":\"\\u179f\\u17d2\\u1796\\u17ba\"}', 'Spueu', 'ស្ពឺ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30206, 302, '{\"en\":\"Svay Teab\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u1791\\u17b6\\u1794\"}', 'Svay Teab', 'ស្វាយទាប', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30207, 302, '{\"en\":\"Ta Ong\",\"kh\":\"\\u178f\\u17b6\\u17a2\\u17bb\\u1784\"}', 'Ta Ong', 'តាអុង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30208, 302, '{\"en\":\"Ta Prok\",\"kh\":\"\\u178f\\u17b6\\u1794\\u17d2\\u179a\\u17bb\\u1780\"}', 'Ta Prok', 'តាប្រុក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30301, 303, '{\"en\":\"Khnor Dambang\",\"kh\":\"\\u1781\\u17d2\\u1793\\u17bb\\u179a\\u178a\\u17c6\\u1794\\u1784\"}', 'Khnor Dambang', 'ខ្នុរដំបង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30302, 303, '{\"en\":\"Kouk Rovieng\",\"kh\":\"\\u1782\\u17c4\\u1780\\u179a\\u179c\\u17c0\\u1784\"}', 'Kouk Rovieng', 'គោករវៀង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30303, 303, '{\"en\":\"Pdau Chum\",\"kh\":\"\\u1795\\u17d2\\u178a\\u17c5\\u1787\\u17bb\\u17c6\"}', 'Pdau Chum', 'ផ្ដៅជុំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30304, 303, '{\"en\":\"Prey Char\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1785\\u17b6\\u179a\"}', 'Prey Char', 'ព្រៃចារ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30305, 303, '{\"en\":\"Pring Chrum\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17b8\\u1784\\u1787\\u17d2\\u179a\\u17bb\\u17c6\"}', 'Pring Chrum', 'ព្រីងជ្រុំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30306, 303, '{\"en\":\"Sampong Chey\",\"kh\":\"\\u179f\\u17c6\\u1796\\u1784\\u1787\\u17d0\\u1799\"}', 'Sampong Chey', 'សំពងជ័យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30307, 303, '{\"en\":\"Sdaeung Chey\",\"kh\":\"\\u179f\\u17d2\\u178a\\u17be\\u1784\\u1787\\u17d0\\u1799\"}', 'Sdaeung Chey', 'ស្ដើងជ័យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30308, 303, '{\"en\":\"Soutib\",\"kh\":\"\\u179f\\u17bc\\u1791\\u17b7\\u1796\\u17d2\\u179c\"}', 'Soutib', 'សូទិព្វ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30309, 303, '{\"en\":\"Sramar\",\"kh\":\"\\u179f\\u17d2\\u179a\\u1798\\u17c9\\u179a\"}', 'Sramar', 'ស្រម៉រ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30310, 303, '{\"en\":\"Trapeang Kor\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u1782\\u179a\"}', 'Trapeang Kor', 'ត្រពាំងគរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30501, 305, '{\"en\":\"Boeng Kok\",\"kh\":\"\\u1794\\u17b9\\u1784\\u1780\\u17bb\\u1780\"}', 'Boeng Kok', 'បឹងកុក', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(30502, 305, '{\"en\":\"Kampong Cham\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1785\\u17b6\\u1798\"}', 'Kampong Cham', 'កំពង់ចាម', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(30503, 305, '{\"en\":\"Sambuor Meas\",\"kh\":\"\\u179f\\u17c6\\u1794\\u17bd\\u179a\\u1798\\u17b6\\u179f\"}', 'Sambuor Meas', 'សំបួរមាស', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(30504, 305, '{\"en\":\"Veal Vong\",\"kh\":\"\\u179c\\u17b6\\u179b\\u179c\\u1784\\u17cb\"}', 'Veal Vong', 'វាលវង់', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(30601, 306, '{\"en\":\"Ampil\",\"kh\":\"\\u17a2\\u17c6\\u1796\\u17b7\\u179b\"}', 'Ampil', 'អំពិល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30602, 306, '{\"en\":\"Hanchey\",\"kh\":\"\\u17a0\\u17b6\\u1793\\u17cb\\u1787\\u17d0\\u1799\"}', 'Hanchey', 'ហាន់ជ័យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30603, 306, '{\"en\":\"Kien Chrey\",\"kh\":\"\\u1780\\u17c0\\u1793\\u1787\\u17d2\\u179a\\u17c3\"}', 'Kien Chrey', 'កៀនជ្រៃ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30604, 306, '{\"en\":\"Kokor\",\"kh\":\"\\u1782\\u1782\\u179a\"}', 'Kokor', 'គគរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30605, 306, '{\"en\":\"Kaoh Mitt\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u1798\\u17b7\\u178f\\u17d2\\u178a\"}', 'Kaoh Mitt', 'កោះមិត្ដ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30606, 306, '{\"en\":\"Kaoh Roka\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u179a\\u1780\\u17b6\"}', 'Kaoh Roka', 'កោះរកា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30607, 306, '{\"en\":\"Kaoh Samraong\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u179f\\u17c6\\u179a\\u17c4\\u1784\"}', 'Kaoh Samraong', 'កោះសំរោង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30608, 306, '{\"en\":\"Kaoh Tontuem\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u1791\\u1793\\u17d2\\u1791\\u17b9\\u1798\"}', 'Kaoh Tontuem', 'កោះទន្ទឹម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30609, 306, '{\"en\":\"Krala\",\"kh\":\"\\u1780\\u17d2\\u179a\\u17a1\\u17b6\"}', 'Krala', 'ក្រឡា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30610, 306, '{\"en\":\"Ou Svay\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u179f\\u17d2\\u179c\\u17b6\\u1799\"}', 'Ou Svay', 'អូរស្វាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30611, 306, '{\"en\":\"Ro\'ang\",\"kh\":\"\\u179a\\u17a2\\u17b6\\u1784\"}', 'Ro\'ang', 'រអាង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30612, 306, '{\"en\":\"Rumchek\",\"kh\":\"\\u179a\\u17c6\\u1785\\u17c1\\u1780\"}', 'Rumchek', 'រំចេក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30613, 306, '{\"en\":\"Srak\",\"kh\":\"\\u179f\\u17d2\\u179a\\u1780\"}', 'Srak', 'ស្រក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30614, 306, '{\"en\":\"Trean\",\"kh\":\"\\u1791\\u17d2\\u179a\\u17b6\\u1793\"}', 'Trean', 'ទ្រាន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30615, 306, '{\"en\":\"Vihear Thum\",\"kh\":\"\\u179c\\u17b7\\u17a0\\u17b6\\u179a\\u1792\\u17c6\"}', 'Vihear Thum', 'វិហារធំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30701, 307, '{\"en\":\"Angkor Ban\",\"kh\":\"\\u17a2\\u1784\\u17d2\\u1782\\u179a\\u1794\\u17b6\\u1793\"}', 'Angkor Ban', 'អង្គរបាន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30702, 307, '{\"en\":\"Kang Ta Noeng\",\"kh\":\"\\u1780\\u1784\\u178f\\u17b6\\u178e\\u17b9\\u1784\"}', 'Kang Ta Noeng', 'កងតាណឹង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30703, 307, '{\"en\":\"Khchau\",\"kh\":\"\\u1781\\u17d2\\u1785\\u17c5\"}', 'Khchau', 'ខ្ចៅ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30704, 307, '{\"en\":\"Peam Chi Kang\",\"kh\":\"\\u1796\\u17b6\\u1798\\u1787\\u17b8\\u1780\\u1784\"}', 'Peam Chi Kang', 'ពាមជីកង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30705, 307, '{\"en\":\"Preaek Koy\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1780\\u17bb\\u1799\"}', 'Preaek Koy', 'ព្រែកកុយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30706, 307, '{\"en\":\"Preaek Krabau\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1780\\u17d2\\u179a\\u1794\\u17c5\"}', 'Preaek Krabau', 'ព្រែកក្របៅ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30707, 307, '{\"en\":\"Reay Pay\",\"kh\":\"\\u179a\\u17b6\\u1799\\u1794\\u17c9\\u17b6\\u1799\"}', 'Reay Pay', 'រាយប៉ាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30708, 307, '{\"en\":\"Roka Ar\",\"kh\":\"\\u179a\\u1780\\u17b6\\u17a2\\u17b6\\u179a\"}', 'Roka Ar', 'រកាអារ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30709, 307, '{\"en\":\"Roka Koy\",\"kh\":\"\\u179a\\u1780\\u17b6\\u1782\\u1799\"}', 'Roka Koy', 'រកាគយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30710, 307, '{\"en\":\"Sdau\",\"kh\":\"\\u179f\\u17d2\\u178a\\u17c5\"}', 'Sdau', 'ស្ដៅ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30711, 307, '{\"en\":\"Sour Kong\",\"kh\":\"\\u179f\\u17bc\\u179a\\u1782\\u1784\"}', 'Sour Kong', 'សូរគង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30801, 308, '{\"en\":\"Kampong Reab\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u179a\\u17b6\\u1794\"}', 'Kampong Reab', 'កំពង់រាប', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30802, 308, '{\"en\":\"Kaoh Sotin\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u179f\\u17bc\\u1791\\u17b7\\u1793\"}', 'Kaoh Sotin', 'កោះសូទិន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30803, 308, '{\"en\":\"Lve\",\"kh\":\"\\u179b\\u17d2\\u179c\\u17c1\"}', 'Lve', 'ល្វេ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30804, 308, '{\"en\":\"Moha Leaph\",\"kh\":\"\\u1798\\u17a0\\u17b6\\u179b\\u17b6\\u1797\"}', 'Moha Leaph', 'មហាលាភ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30805, 308, '{\"en\":\"Moha Khnhoung\",\"kh\":\"\\u1798\\u17a0\\u17b6\\u1781\\u17d2\\u1789\\u17bc\\u1784\"}', 'Moha Khnhoung', 'មហាខ្ញូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30806, 308, '{\"en\":\"Peam Prathnuoh\",\"kh\":\"\\u1796\\u17b6\\u1798\\u1794\\u17d2\\u179a\\u1792\\u17d2\\u1793\\u17c4\\u17c7\"}', 'Peam Prathnuoh', 'ពាមប្រធ្នោះ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30807, 308, '{\"en\":\"Pongro\",\"kh\":\"\\u1796\\u1784\\u17d2\\u179a\"}', 'Pongro', 'ពង្រ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(30808, 308, '{\"en\":\"Preaek Ta Nong\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u178f\\u17b6\\u1793\\u1784\\u17cb\"}', 'Preaek Ta Nong', 'ព្រែកតានង់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31301, 313, '{\"en\":\"Baray\",\"kh\":\"\\u1794\\u17b6\\u179a\\u17b6\\u1799\\u178e\\u17cd\"}', 'Baray', 'បារាយណ៍', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31302, 313, '{\"en\":\"Boeng Nay\",\"kh\":\"\\u1794\\u17b9\\u1784\\u178e\\u17b6\\u1799\"}', 'Boeng Nay', 'បឹងណាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31303, 313, '{\"en\":\"Chrey Vien\",\"kh\":\"\\u1787\\u17d2\\u179a\\u17c3\\u179c\\u17c0\\u1793\"}', 'Chrey Vien', 'ជ្រៃវៀន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31304, 313, '{\"en\":\"Khvet Thum\",\"kh\":\"\\u1781\\u17d2\\u179c\\u17b7\\u178f\\u1792\\u17c6\"}', 'Khvet Thum', 'ខ្វិតធំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31305, 313, '{\"en\":\"Kor\",\"kh\":\"\\u1782\\u179a\"}', 'Kor', 'គរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31306, 313, '{\"en\":\"Krouch\",\"kh\":\"\\u1780\\u17d2\\u179a\\u17bc\\u1785\"}', 'Krouch', 'ក្រូច', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31307, 313, '{\"en\":\"Lvea\",\"kh\":\"\\u179b\\u17d2\\u179c\\u17b6\"}', 'Lvea', 'ល្វា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31308, 313, '{\"en\":\"Mien\",\"kh\":\"\\u1798\\u17c0\\u1793\"}', 'Mien', 'មៀន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31309, 313, '{\"en\":\"Prey Chhor\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1788\\u179a\"}', 'Prey Chhor', 'ព្រៃឈរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31310, 313, '{\"en\":\"Sour Saen\",\"kh\":\"\\u179f\\u17bc\\u179a\\u17d2\\u1799\\u179f\\u17c2\\u1793\"}', 'Sour Saen', 'សូរ្យសែន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31311, 313, '{\"en\":\"Samraong\",\"kh\":\"\\u179f\\u17c6\\u179a\\u17c4\\u1784\"}', 'Samraong', 'សំរោង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31312, 313, '{\"en\":\"Sragnae\",\"kh\":\"\\u179f\\u17d2\\u179a\\u1784\\u17c9\\u17c2\"}', 'Sragnae', 'ស្រង៉ែ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31313, 313, '{\"en\":\"Thma Pun\",\"kh\":\"\\u1790\\u17d2\\u1798\\u1796\\u17bc\\u1793\"}', 'Thma Pun', 'ថ្មពូន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31314, 313, '{\"en\":\"Tong Rong\",\"kh\":\"\\u178f\\u17bb\\u1784\\u179a\\u17c9\\u17bb\\u1784\"}', 'Tong Rong', 'តុងរ៉ុង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31315, 313, '{\"en\":\"Trapeang Preah\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u1796\\u17d2\\u179a\\u17c7\"}', 'Trapeang Preah', 'ត្រពាំងព្រះ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31401, 314, '{\"en\":\"Baray\",\"kh\":\"\\u1794\\u17b6\\u179a\\u17b6\\u1799\\u178e\\u17cd\"}', 'Baray', 'បារាយណ៍', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31402, 314, '{\"en\":\"Chi Bal\",\"kh\":\"\\u1787\\u17b8\\u1794\\u17b6\\u179b\"}', 'Chi Bal', 'ជីបាល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31403, 314, '{\"en\":\"Khnar Sa\",\"kh\":\"\\u1781\\u17d2\\u1793\\u17b6\\u179a\\u179f\"}', 'Khnar Sa', 'ខ្នារស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31404, 314, '{\"en\":\"Kaoh Andaet\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u17a2\\u178e\\u17d2\\u178a\\u17c2\\u178f\"}', 'Kaoh Andaet', 'កោះអណ្ដែត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31405, 314, '{\"en\":\"Mean Chey\",\"kh\":\"\\u1798\\u17b6\\u1793\\u1787\\u17d0\\u1799\"}', 'Mean Chey', 'មានជ័យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31406, 314, '{\"en\":\"Phteah Kandal\",\"kh\":\"\\u1795\\u17d2\\u1791\\u17c7\\u1780\\u178e\\u17d2\\u178a\\u17b6\\u179b\"}', 'Phteah Kandal', 'ផ្ទះកណ្ដាល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31407, 314, '{\"en\":\"Pram Yam\",\"kh\":\"\\u1794\\u17d2\\u179a\\u17b6\\u17c6\\u1799\\u17c9\\u17b6\\u1798\"}', 'Pram Yam', 'ប្រាំយ៉ាម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31408, 314, '{\"en\":\"Preaek Dambouk\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u178a\\u17c6\\u1794\\u17bc\\u1780\"}', 'Preaek Dambouk', 'ព្រែកដំបូក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31409, 314, '{\"en\":\"Preaek Pou\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1796\\u17c4\\u1792\\u17b7\"}', 'Preaek Pou', 'ព្រែកពោធិ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31410, 314, '{\"en\":\"Preaek Rumdeng\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u179a\\u17c6\\u178a\\u17c1\\u1784\"}', 'Preaek Rumdeng', 'ព្រែករំដេង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31411, 314, '{\"en\":\"Ruessei Srok\",\"kh\":\"\\u17ab\\u179f\\u17d2\\u179f\\u17b8\\u179f\\u17d2\\u179a\\u17bb\\u1780\"}', 'Ruessei Srok', 'ឫស្សីស្រុក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31412, 314, '{\"en\":\"Svay Pou\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u1796\\u17c4\\u1792\\u17b7\"}', 'Svay Pou', 'ស្វាយពោធិ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31413, 314, '{\"en\":\"Svay Khsach Phnum\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u1781\\u17d2\\u179f\\u17b6\\u1785\\u17cb\\u1797\\u17d2\\u1793\\u17c6\"}', 'Svay Khsach Phnum', 'ស្វាយខ្សាច់ភ្នំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31414, 314, '{\"en\":\"Tong Tralach\",\"kh\":\"\\u1791\\u1784\\u178f\\u17d2\\u179a\\u17a1\\u17b6\\u1785\"}', 'Tong Tralach', 'ទងត្រឡាច', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31501, 315, '{\"en\":\"Areaks Tnot\",\"kh\":\"\\u17a2\\u17b6\\u179a\\u1780\\u17d2\\u179f\\u178f\\u17d2\\u1793\\u17c4\\u178f\"}', 'Areaks Tnot', 'អារក្សត្នោត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31503, 315, '{\"en\":\"Dang Kdar\",\"kh\":\"\\u178a\\u1784\\u1780\\u17d2\\u178a\\u17b6\\u179a\"}', 'Dang Kdar', 'ដងក្ដារ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31504, 315, '{\"en\":\"Khpob Ta Nguon\",\"kh\":\"\\u1781\\u17d2\\u1796\\u1794\\u178f\\u17b6\\u1784\\u17bd\\u1793\"}', 'Khpob Ta Nguon', 'ខ្ពបតាងួន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31505, 315, '{\"en\":\"Me Sar Chrey\",\"kh\":\"\\u1798\\u17c1\\u179f\\u179a\\u1787\\u17d2\\u179a\\u17c3\"}', 'Me Sar Chrey', 'មេសរជ្រៃ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31506, 315, '{\"en\":\"Ou Mlu\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u1798\\u17d2\\u179b\\u17bc\"}', 'Ou Mlu', 'អូរម្លូ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31507, 315, '{\"en\":\"Peam Kaoh Snar\",\"kh\":\"\\u1796\\u17b6\\u1798\\u1780\\u17c4\\u17c7\\u179f\\u17d2\\u1793\\u17b6\"}', 'Peam Kaoh Snar', 'ពាមកោះស្នា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31508, 315, '{\"en\":\"Preah Andoung\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c7\\u17a2\\u178e\\u17d2\\u178a\\u17bc\\u1784\"}', 'Preah Andoung', 'ព្រះអណ្ដូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31509, 315, '{\"en\":\"Preaek Bak\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1794\\u17b6\\u1780\\u17cb\"}', 'Preaek Bak', 'ព្រែកបាក់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31510, 315, '{\"en\":\"Preak Kak\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1780\\u1780\\u17cb\"}', 'Preak Kak', 'ព្រែកកក់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31512, 315, '{\"en\":\"Soupheas\",\"kh\":\"\\u179f\\u17bc\\u1797\\u17b6\\u179f\"}', 'Soupheas', 'សូភាស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31513, 315, '{\"en\":\"Tuol Preah Khleang\",\"kh\":\"\\u1791\\u17bd\\u179b\\u1796\\u17d2\\u179a\\u17c7\\u1783\\u17d2\\u179b\\u17b6\\u17c6\\u1784\"}', 'Tuol Preah Khleang', 'ទួលព្រះឃ្លាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(31514, 315, '{\"en\":\"Tuol Sambuor\",\"kh\":\"\\u1791\\u17bd\\u179b\\u179f\\u17c6\\u1794\\u17bd\\u179a\"}', 'Tuol Sambuor', 'ទួលសំបួរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40101, 401, '{\"en\":\"Anhchanh Rung\",\"kh\":\"\\u17a2\\u1789\\u17d2\\u1785\\u17b6\\u1789\\u179a\\u17bc\\u1784\"}', 'Anhchanh Rung', 'អញ្ចាញរូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40102, 401, '{\"en\":\"Chhnok Tru\",\"kh\":\"\\u1786\\u17d2\\u1793\\u17bb\\u1780\\u1791\\u17d2\\u179a\\u17bc\"}', 'Chhnok Tru', 'ឆ្នុកទ្រូ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40103, 401, '{\"en\":\"Chak\",\"kh\":\"\\u1785\\u1780\"}', 'Chak', 'ចក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40104, 401, '{\"en\":\"Khon Rang\",\"kh\":\"\\u1781\\u17bb\\u1793\\u179a\\u17c9\\u1784\"}', 'Khon Rang', 'ខុនរ៉ង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40105, 401, '{\"en\":\"Kampong Preah Kokir\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1796\\u17d2\\u179a\\u17c7\\u1782\\u1782\\u17b8\\u179a\"}', 'Kampong Preah Kokir', 'កំពង់ព្រះគគីរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40106, 401, '{\"en\":\"Melum\",\"kh\":\"\\u1798\\u17c1\\u179b\\u17c6\"}', 'Melum', 'មេលំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40107, 401, '{\"en\":\"Phsar\",\"kh\":\"\\u1795\\u17d2\\u179f\\u17b6\\u179a\"}', 'Phsar', 'ផ្សារ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40108, 401, '{\"en\":\"Pech Changvar\",\"kh\":\"\\u1796\\u17c1\\u1787\\u1785\\u1784\\u17d2\\u179c\\u17b6\\u179a\"}', 'Pech Changvar', 'ពេជចង្វារ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40109, 401, '{\"en\":\"Popel\",\"kh\":\"\\u1796\\u1796\\u17c1\\u179b\"}', 'Popel', 'ពពេល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40110, 401, '{\"en\":\"Ponley\",\"kh\":\"\\u1796\\u1793\\u17d2\\u179b\\u17c3\"}', 'Ponley', 'ពន្លៃ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40111, 401, '{\"en\":\"Trapeang Chan\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u1785\\u17b6\\u1793\\u17cb\"}', 'Trapeang Chan', 'ត្រពាំងចាន់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40201, 402, '{\"en\":\"Chol Sar\",\"kh\":\"\\u1787\\u179b\\u179f\\u17b6\"}', 'Chol Sar', 'ជលសា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40202, 402, '{\"en\":\"Kaoh Thkov\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u1790\\u17d2\\u1780\\u17bc\\u179c\"}', 'Kaoh Thkov', 'កោះថ្កូវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40203, 402, '{\"en\":\"Kampong Ous\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u17a2\\u17bb\\u179f\"}', 'Kampong Ous', 'កំពង់អុស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40204, 402, '{\"en\":\"Peam Chhkaok\",\"kh\":\"\\u1796\\u17b6\\u1798\\u1786\\u17d2\\u1780\\u17c4\\u1780\"}', 'Peam Chhkaok', 'ពាមឆ្កោក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40205, 402, '{\"en\":\"Prey Kri\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1782\\u17d2\\u179a\\u17b8\"}', 'Prey Kri', 'ព្រៃគ្រី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40301, 403, '{\"en\":\"Phsar Chhnang\",\"kh\":\"\\u1795\\u17d2\\u179f\\u17b6\\u179a\\u1786\\u17d2\\u1793\\u17b6\\u17c6\\u1784\"}', 'Phsar Chhnang', 'ផ្សារឆ្នាំង', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(40302, 403, '{\"en\":\"Kampong Chhnang\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1786\\u17d2\\u1793\\u17b6\\u17c6\\u1784\"}', 'Kampong Chhnang', 'កំពង់ឆ្នាំង', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(40303, 403, '{\"en\":\"B\'er\",\"kh\":\"\\u1794\\u17d2\\u17a2\\u17c1\\u179a\"}', 'B\'er', 'ប្អេរ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(40304, 403, '{\"en\":\"Khsam\",\"kh\":\"\\u1781\\u17d2\\u179f\\u17b6\\u1798\"}', 'Khsam', 'ខ្សាម', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(40401, 404, '{\"en\":\"Chranouk\",\"kh\":\"\\u1785\\u17d2\\u179a\\u178e\\u17bc\\u1780\"}', 'Chranouk', 'ច្រណូក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40402, 404, '{\"en\":\"Dar\",\"kh\":\"\\u178a\\u17b6\\u179a\"}', 'Dar', 'ដារ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40403, 404, '{\"en\":\"Kampong Hau\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u17a0\\u17c5\"}', 'Kampong Hau', 'កំពង់ហៅ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40404, 404, '{\"en\":\"Phlov Tuk\",\"kh\":\"\\u1795\\u17d2\\u179b\\u17bc\\u179c\\u1791\\u17bc\\u1780\"}', 'Phlov Tuk', 'ផ្លូវទូក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40405, 404, '{\"en\":\"Pou\",\"kh\":\"\\u1796\\u17c4\\u1792\\u17b7\\u17cd\"}', 'Pou', 'ពោធិ៍', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40406, 404, '{\"en\":\"Pralay Meas\",\"kh\":\"\\u1794\\u17d2\\u179a\\u17a1\\u17b6\\u1799\\u1798\\u17b6\\u179f\"}', 'Pralay Meas', 'ប្រឡាយមាស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40407, 404, '{\"en\":\"Samraong Saen\",\"kh\":\"\\u179f\\u17c6\\u179a\\u17c4\\u1784\\u179f\\u17c2\\u1793\"}', 'Samraong Saen', 'សំរោងសែន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40408, 404, '{\"en\":\"Svay Rumpear\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u179a\\u17c6\\u1796\\u17b6\\u179a\"}', 'Svay Rumpear', 'ស្វាយរំពារ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40409, 404, '{\"en\":\"Trangel\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1784\\u17b7\\u179b\"}', 'Trangel', 'ត្រងិល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40501, 405, '{\"en\":\"Ampil Tuek\",\"kh\":\"\\u17a2\\u17c6\\u1796\\u17b7\\u179b\\u1791\\u17b9\\u1780\"}', 'Ampil Tuek', 'អំពិលទឹក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40502, 405, '{\"en\":\"Chhuk Sa\",\"kh\":\"\\u1788\\u17bc\\u1780\\u179f\"}', 'Chhuk Sa', 'ឈូកស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40503, 405, '{\"en\":\"Chres\",\"kh\":\"\\u1785\\u17d2\\u179a\\u17c1\\u179f\"}', 'Chres', 'ច្រេស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40504, 405, '{\"en\":\"Kampong Tralach\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u178f\\u17d2\\u179a\\u17a1\\u17b6\\u1785\"}', 'Kampong Tralach', 'កំពង់ត្រឡាច', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40505, 405, '{\"en\":\"Longveaek\",\"kh\":\"\\u179b\\u1784\\u17d2\\u179c\\u17c2\\u1780\"}', 'Longveaek', 'លង្វែក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40506, 405, '{\"en\":\"Ou Ruessei\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u17ab\\u179f\\u17d2\\u179f\\u17b8\"}', 'Ou Ruessei', 'អូរឫស្សី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40507, 405, '{\"en\":\"Peani\",\"kh\":\"\\u1796\\u17b6\\u1793\\u17b8\"}', 'Peani', 'ពានី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40508, 405, '{\"en\":\"Saeb\",\"kh\":\"\\u179f\\u17c2\\u1794\"}', 'Saeb', 'សែប', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40509, 405, '{\"en\":\"Ta Ches\",\"kh\":\"\\u178f\\u17b6\\u1787\\u17c1\\u179f\"}', 'Ta Ches', 'តាជេស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40510, 405, '{\"en\":\"Thma Edth\",\"kh\":\"\\u1790\\u17d2\\u1798\\u17a5\\u178a\\u17d2\\u178b\"}', 'Thma Edth', 'ថ្មឥដ្ឋ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40601, 406, '{\"en\":\"Andoung Snay\",\"kh\":\"\\u17a2\\u178e\\u17d2\\u178a\\u17bc\\u1784\\u179f\\u17d2\\u1793\\u17b6\\u1799\"}', 'Andoung Snay', 'អណ្ដូងស្នាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40602, 406, '{\"en\":\"Banteay Preal\",\"kh\":\"\\u1794\\u1793\\u17d2\\u1791\\u17b6\\u1799\\u1796\\u17d2\\u179a\\u17b6\\u179b\"}', 'Banteay Preal', 'បន្ទាយព្រាល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40603, 406, '{\"en\":\"Cheung Kreav\",\"kh\":\"\\u1787\\u17be\\u1784\\u1782\\u17d2\\u179a\\u17b6\\u179c\"}', 'Cheung Kreav', 'ជើងគ្រាវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40604, 406, '{\"en\":\"Chrey Bak\",\"kh\":\"\\u1787\\u17d2\\u179a\\u17c3\\u1794\\u17b6\\u1780\\u17cb\"}', 'Chrey Bak', 'ជ្រៃបាក់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40605, 406, '{\"en\":\"Kouk Banteay\",\"kh\":\"\\u1782\\u17c4\\u1780\\u1794\\u1793\\u17d2\\u1791\\u17b6\\u1799\"}', 'Kouk Banteay', 'គោកបន្ទាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40606, 406, '{\"en\":\"Krang Leav\",\"kh\":\"\\u1780\\u17d2\\u179a\\u17b6\\u17c6\\u1784\\u179b\\u17b6\\u179c\"}', 'Krang Leav', 'ក្រាំងលាវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40607, 406, '{\"en\":\"Pongro\",\"kh\":\"\\u1796\\u1784\\u17d2\\u179a\"}', 'Pongro', 'ពង្រ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40608, 406, '{\"en\":\"Prasnoeb\",\"kh\":\"\\u1794\\u17d2\\u179a\\u179f\\u17d2\\u1793\\u17b9\\u1794\"}', 'Prasnoeb', 'ប្រស្នឹប', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40609, 406, '{\"en\":\"Prey Mul\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1798\\u17bc\\u179b\"}', 'Prey Mul', 'ព្រៃមូល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40610, 406, '{\"en\":\"Rolea B\'ier\",\"kh\":\"\\u179a\\u179b\\u17b6\\u1794\\u17d2\\u17a2\\u17c0\\u179a\"}', 'Rolea B\'ier', 'រលាប្អៀរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40611, 406, '{\"en\":\"Srae Thmei\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17c2\\u1790\\u17d2\\u1798\\u17b8\"}', 'Srae Thmei', 'ស្រែថ្មី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40612, 406, '{\"en\":\"Svay Chrum\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u1787\\u17d2\\u179a\\u17bb\\u17c6\"}', 'Svay Chrum', 'ស្វាយជ្រុំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40613, 406, '{\"en\":\"Tuek Hout\",\"kh\":\"\\u1791\\u17b9\\u1780\\u17a0\\u17bc\\u178f\"}', 'Tuek Hout', 'ទឹកហូត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40614, 406, '{\"en\":\"Phnom Kraing Dey Meas\",\"kh\":\"\\u1797\\u17d2\\u1793\\u17c6\\u1780\\u17d2\\u179a\\u17b6\\u17c6\\u1784\\u178a\\u17b8\\u1798\\u17b6\\u179f\"}', 'Phnom Kraing Dey Meas', 'ភ្នំក្រាំងដីមាស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40701, 407, '{\"en\":\"Chhean Laeung\",\"kh\":\"\\u1788\\u17b6\\u1793\\u17a1\\u17be\\u1784\"}', 'Chhean Laeung', 'ឈានឡើង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40702, 407, '{\"en\":\"Khnar Chhmar\",\"kh\":\"\\u1781\\u17d2\\u1793\\u17b6\\u179a\\u1786\\u17d2\\u1798\\u17b6\\u179a\"}', 'Khnar Chhmar', 'ខ្នារឆ្មារ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40703, 407, '{\"en\":\"Krang Lvea\",\"kh\":\"\\u1780\\u17d2\\u179a\\u17b6\\u17c6\\u1784\\u179b\\u17d2\\u179c\\u17b6\"}', 'Krang Lvea', 'ក្រាំងល្វា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40704, 407, '{\"en\":\"Peam\",\"kh\":\"\\u1796\\u17b6\\u1798\"}', 'Peam', 'ពាម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40705, 407, '{\"en\":\"Sedthei\",\"kh\":\"\\u179f\\u17c1\\u178a\\u17d2\\u178b\\u17b8\"}', 'Sedthei', 'សេដ្ឋី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1);
INSERT INTO `tbl_location` (`location_id`, `parent_id`, `title`, `title_en`, `title_kh`, `shortname`, `type`, `prefix`, `image`, `display`, `tag`, `trash`, `ordering`, `ab_id`, `blongto`) VALUES
(40706, 407, '{\"en\":\"Svay\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\"}', 'Svay', 'ស្វាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40707, 407, '{\"en\":\"Svay Chuk\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u1787\\u17bb\\u1780\"}', 'Svay Chuk', 'ស្វាយជុក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40708, 407, '{\"en\":\"Tbaeng Khpos\",\"kh\":\"\\u178f\\u17d2\\u1794\\u17c2\\u1784\\u1781\\u17d2\\u1796\\u179f\\u17cb\"}', 'Tbaeng Khpos', 'ត្បែងខ្ពស់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40709, 407, '{\"en\":\"Thlok Vien\",\"kh\":\"\\u1792\\u17d2\\u179b\\u1780\\u179c\\u17c0\\u1793\"}', 'Thlok Vien', 'ធ្លកវៀន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40801, 408, '{\"en\":\"Akphivoadth\",\"kh\":\"\\u17a2\\u1797\\u17b7\\u179c\\u178c\\u17d2\\u178d\\u1793\\u17cd\"}', 'Akphivoadth', 'អភិវឌ្ឍន៍', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40802, 408, '{\"en\":\"Chieb\",\"kh\":\"\\u1787\\u17c0\\u1794\"}', 'Chieb', 'ជៀប', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40803, 408, '{\"en\":\"Chaong Maong\",\"kh\":\"\\u1785\\u17c4\\u1784\\u1798\\u17c9\\u17c4\\u1784\"}', 'Chaong Maong', 'ចោងម៉ោង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40804, 408, '{\"en\":\"Kbal Tuek\",\"kh\":\"\\u1780\\u17d2\\u1794\\u17b6\\u179b\\u1791\\u17b9\\u1780\"}', 'Kbal Tuek', 'ក្បាលទឹក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40805, 408, '{\"en\":\"Khlong Popok\",\"kh\":\"\\u1781\\u17d2\\u179b\\u17bb\\u1784\\u1796\\u1796\\u1780\"}', 'Khlong Popok', 'ខ្លុងពពក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40806, 408, '{\"en\":\"Krang Skear\",\"kh\":\"\\u1780\\u17d2\\u179a\\u17b6\\u17c6\\u1784\\u179f\\u17d2\\u1782\\u17b6\\u179a\"}', 'Krang Skear', 'ក្រាំងស្គារ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40807, 408, '{\"en\":\"Tang Krasang\",\"kh\":\"\\u178f\\u17b6\\u17c6\\u1784\\u1780\\u17d2\\u179a\\u179f\\u17b6\\u17c6\\u1784\"}', 'Tang Krasang', 'តាំងក្រសាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40808, 408, '{\"en\":\"Tuol Khpos\",\"kh\":\"\\u1791\\u17bd\\u179b\\u1781\\u17d2\\u1796\\u179f\\u17cb\"}', 'Tuol Khpos', 'ទួលខ្ពស់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(40809, 408, '{\"en\":\"Kdol Saen Chey\",\"kh\":\"\\u1780\\u17d2\\u178f\\u17bb\\u179b\\u179f\\u17c2\\u1793\\u1787\\u17d0\\u1799\"}', 'Kdol Saen Chey', 'ក្តុលសែនជ័យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50101, 501, '{\"en\":\"Basedth\",\"kh\":\"\\u1794\\u179a\\u179f\\u17c1\\u178a\\u17d2\\u178b\"}', 'Basedth', 'បរសេដ្ឋ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50102, 501, '{\"en\":\"Kat Phluk\",\"kh\":\"\\u1780\\u17b6\\u178f\\u17cb\\u1797\\u17d2\\u179b\\u17bb\\u1780\"}', 'Kat Phluk', 'កាត់ភ្លុក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50103, 501, '{\"en\":\"Nitean\",\"kh\":\"\\u1793\\u17b7\\u1791\\u17b6\\u1793\"}', 'Nitean', 'និទាន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50104, 501, '{\"en\":\"Pheakdei\",\"kh\":\"\\u1797\\u1780\\u17d2\\u178a\\u17b8\"}', 'Pheakdei', 'ភក្ដី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50105, 501, '{\"en\":\"Pheari Mean Chey\",\"kh\":\"\\u1797\\u17b6\\u179a\\u17b8\\u1798\\u17b6\\u1793\\u1787\\u17d0\\u1799\"}', 'Pheari Mean Chey', 'ភារីមានជ័យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50106, 501, '{\"en\":\"Phong\",\"kh\":\"\\u1795\\u17bb\\u1784\"}', 'Phong', 'ផុង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50107, 501, '{\"en\":\"Pou Angkrang\",\"kh\":\"\\u1796\\u17c4\\u1792\\u17b7\\u17a2\\u1784\\u17d2\\u1780\\u17d2\\u179a\\u1784\"}', 'Pou Angkrang', 'ពោធិអង្ក្រង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50108, 501, '{\"en\":\"Pou Chamraeun\",\"kh\":\"\\u1796\\u17c4\\u1792\\u17b7\\u17cd\\u1785\\u17c6\\u179a\\u17be\\u1793\"}', 'Pou Chamraeun', 'ពោធិ៍ចំរើន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50109, 501, '{\"en\":\"Pou Mreal\",\"kh\":\"\\u1796\\u17c4\\u1792\\u17b7\\u17cd\\u1798\\u17d2\\u179a\\u17b6\\u179b\"}', 'Pou Mreal', 'ពោធិ៍ម្រាល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50110, 501, '{\"en\":\"Svay Chacheb\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u1785\\u1785\\u17b7\\u1794\"}', 'Svay Chacheb', 'ស្វាយចចិប', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50111, 501, '{\"en\":\"Tuol Ampil\",\"kh\":\"\\u1791\\u17bd\\u179b\\u17a2\\u17c6\\u1796\\u17b7\\u179b\"}', 'Tuol Ampil', 'ទួលអំពិល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50112, 501, '{\"en\":\"Tuol Sala\",\"kh\":\"\\u1791\\u17bd\\u179b\\u179f\\u17b6\\u179b\\u17b6\"}', 'Tuol Sala', 'ទួលសាលា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50113, 501, '{\"en\":\"Kak\",\"kh\":\"\\u1780\\u1780\\u17cb\"}', 'Kak', 'កក់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50114, 501, '{\"en\":\"Svay Rumpear\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u179a\\u17c6\\u1796\\u17b6\\u179a\"}', 'Svay Rumpear', 'ស្វាយរំពារ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50115, 501, '{\"en\":\"Preah Khae\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c7\\u1781\\u17c2\"}', 'Preah Khae', 'ព្រះខែ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50201, 502, '{\"en\":\"Chbar Mon\",\"kh\":\"\\u1785\\u17d2\\u1794\\u17b6\\u179a\\u1798\\u1793\"}', 'Chbar Mon', 'ច្បារមន', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(50202, 502, '{\"en\":\"Kandaol Dom\",\"kh\":\"\\u1780\\u178e\\u17d2\\u178a\\u17c4\\u179b\\u178a\\u17bb\\u17c6\"}', 'Kandaol Dom', 'កណ្ដោលដុំ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(50203, 502, '{\"en\":\"Rokar Thum\",\"kh\":\"\\u179a\\u1780\\u17b6\\u179a\\u1792\\u17c6\"}', 'Rokar Thum', 'រការធំ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(50204, 502, '{\"en\":\"Sopoar Tep\",\"kh\":\"\\u179f\\u17bb\\u1796\\u17d0\\u179a\\u1791\\u17c1\\u1796\"}', 'Sopoar Tep', 'សុព័រទេព', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(50205, 502, '{\"en\":\"Svay Kravan\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u1780\\u17d2\\u179a\\u179c\\u17c9\\u17b6\\u1793\\u17cb\"}', 'Svay Kravan', 'ស្វាយក្រវ៉ាន់', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(50301, 503, '{\"en\":\"Angk Popel\",\"kh\":\"\\u17a2\\u1784\\u17d2\\u1782\\u1796\\u1796\\u17c1\\u179b\"}', 'Angk Popel', 'អង្គពពេល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50302, 503, '{\"en\":\"Chongruk\",\"kh\":\"\\u1787\\u1784\\u17d2\\u179a\\u17bb\\u1780\"}', 'Chongruk', 'ជង្រុក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50303, 503, '{\"en\":\"Moha Ruessei\",\"kh\":\"\\u1798\\u17a0\\u17b6\\u17ab\\u179f\\u17d2\\u179f\\u17b8\"}', 'Moha Ruessei', 'មហាឫស្សី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50304, 503, '{\"en\":\"Pechr Muni\",\"kh\":\"\\u1796\\u17c1\\u1787\\u17d2\\u179a\\u1798\\u17bb\\u1793\\u17b8\"}', 'Pechr Muni', 'ពេជ្រមុនី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50305, 503, '{\"en\":\"Preah Nipean\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c7\\u1793\\u17b7\\u1796\\u17d2\\u179c\\u17b6\\u1793\"}', 'Preah Nipean', 'ព្រះនិព្វាន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50306, 503, '{\"en\":\"Prey Nheat\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1789\\u17b6\\u178f\\u17b7\"}', 'Prey Nheat', 'ព្រៃញាតិ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50307, 503, '{\"en\":\"Prey Vihear\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u179c\\u17b7\\u17a0\\u17b6\\u179a\"}', 'Prey Vihear', 'ព្រៃវិហារ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50308, 503, '{\"en\":\"Roka Kaoh\",\"kh\":\"\\u179a\\u1780\\u17b6\\u1780\\u17c4\\u17c7\"}', 'Roka Kaoh', 'រកាកោះ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50309, 503, '{\"en\":\"Sdok\",\"kh\":\"\\u179f\\u17d2\\u178a\\u17bb\\u1780\"}', 'Sdok', 'ស្ដុក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50310, 503, '{\"en\":\"Snam Krapeu\",\"kh\":\"\\u179f\\u17d2\\u1793\\u17c6\\u1780\\u17d2\\u179a\\u1796\\u17be\"}', 'Snam Krapeu', 'ស្នំក្រពើ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50311, 503, '{\"en\":\"Srang\",\"kh\":\"\\u179f\\u17d2\\u179a\\u1784\\u17cb\"}', 'Srang', 'ស្រង់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50312, 503, '{\"en\":\"Tuek L\'ak\",\"kh\":\"\\u1791\\u17b9\\u1780\\u179b\\u17d2\\u17a2\\u1780\\u17cb\"}', 'Tuek L\'ak', 'ទឹកល្អក់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50313, 503, '{\"en\":\"Veal\",\"kh\":\"\\u179c\\u17b6\\u179b\"}', 'Veal', 'វាល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50401, 504, '{\"en\":\"Haong Samnam\",\"kh\":\"\\u17a0\\u17c4\\u1784\\u179f\\u17c6\\u178e\\u17c6\"}', 'Haong Samnam', 'ហោងសំណំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50402, 504, '{\"en\":\"Reaksmei Sameakki\",\"kh\":\"\\u179a\\u179f\\u17d2\\u1798\\u17b8\\u179f\\u17b6\\u1798\\u1782\\u17d2\\u1782\\u17b8\"}', 'Reaksmei Sameakki', 'រស្មីសាមគ្គី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50403, 504, '{\"en\":\"Trapeang Chour\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u1787\\u17c4\"}', 'Trapeang Chour', 'ត្រពាំងជោ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50404, 504, '{\"en\":\"Sangkae Satob\",\"kh\":\"\\u179f\\u1784\\u17d2\\u1780\\u17c2\\u179f\\u17b6\\u1791\\u1794\"}', 'Sangkae Satob', 'សង្កែសាទប', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50405, 504, '{\"en\":\"Ta Sal\",\"kh\":\"\\u178f\\u17b6\\u179f\\u17b6\\u179b\"}', 'Ta Sal', 'តាសាល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50501, 505, '{\"en\":\"Chan Saen\",\"kh\":\"\\u1785\\u17b6\\u1793\\u17cb\\u179f\\u17c2\\u1793\"}', 'Chan Saen', 'ចាន់សែន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50502, 505, '{\"en\":\"Cheung Roas\",\"kh\":\"\\u1787\\u17be\\u1784\\u179a\\u17b6\\u179f\\u17cb\"}', 'Cheung Roas', 'ជើងរាស់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50503, 505, '{\"en\":\"Chumpu Proeks\",\"kh\":\"\\u1787\\u17c6\\u1796\\u17bc\\u1796\\u17d2\\u179a\\u17b9\\u1780\\u17d2\\u179f\"}', 'Chumpu Proeks', 'ជំពូព្រឹក្ស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50504, 505, '{\"en\":\"Khsem Khsant\",\"kh\":\"\\u1780\\u17d2\\u179f\\u17c1\\u1798\\u1780\\u17d2\\u179f\\u17b6\\u1793\\u17d2\\u178a\"}', 'Khsem Khsant', 'ក្សេមក្សាន្ដ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50505, 505, '{\"en\":\"Krang Chek\",\"kh\":\"\\u1780\\u17d2\\u179a\\u17b6\\u17c6\\u1784\\u1785\\u17c1\\u1780\"}', 'Krang Chek', 'ក្រាំងចេក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50506, 505, '{\"en\":\"Mean Chey\",\"kh\":\"\\u1798\\u17b6\\u1793\\u1787\\u17d0\\u1799\"}', 'Mean Chey', 'មានជ័យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50507, 505, '{\"en\":\"Preah Srae\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c7\\u179f\\u17d2\\u179a\\u17c2\"}', 'Preah Srae', 'ព្រះស្រែ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50508, 505, '{\"en\":\"Prey Krasang\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1780\\u17d2\\u179a\\u179f\\u17b6\\u17c6\\u1784\"}', 'Prey Krasang', 'ព្រៃក្រសាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50509, 505, '{\"en\":\"Trach Tong\",\"kh\":\"\\u178f\\u17d2\\u179a\\u17b6\\u1785\\u1791\\u1784\"}', 'Trach Tong', 'ត្រាចទង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50510, 505, '{\"en\":\"Veal Pong\",\"kh\":\"\\u179c\\u17b6\\u179b\\u1796\\u1784\\u17cb\"}', 'Veal Pong', 'វាលពង់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50511, 505, '{\"en\":\"Veang Chas\",\"kh\":\"\\u179c\\u17b6\\u17c6\\u1784\\u1785\\u17b6\\u179f\\u17cb\"}', 'Veang Chas', 'វាំងចាស់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50512, 505, '{\"en\":\"Yutth Sameakki\",\"kh\":\"\\u1799\\u17bb\\u1791\\u17d2\\u1792\\u179f\\u17b6\\u1798\\u1782\\u17d2\\u1782\\u17b8\"}', 'Yutth Sameakki', 'យុទ្ធសាមគ្គី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50513, 505, '{\"en\":\"Damnak Reang\",\"kh\":\"\\u178a\\u17c6\\u178e\\u17b6\\u1780\\u17cb\\u179a\\u17b6\\u17c6\\u1784\"}', 'Damnak Reang', 'ដំណាក់រាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50514, 505, '{\"en\":\"Peang Lvea\",\"kh\":\"\\u1796\\u17b6\\u17c6\\u1784\\u179b\\u17d2\\u179c\\u17b6\"}', 'Peang Lvea', 'ពាំងល្វា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50515, 505, '{\"en\":\"Phnom Touch\",\"kh\":\"\\u1797\\u17d2\\u1793\\u17c6\\u178f\\u17bc\\u1785\"}', 'Phnom Touch', 'ភ្នំតូច', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50601, 506, '{\"en\":\"Chambak\",\"kh\":\"\\u1785\\u17c6\\u1794\\u1780\\u17cb\"}', 'Chambak', 'ចំបក់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50602, 506, '{\"en\":\"Choam Sangkae\",\"kh\":\"\\u1787\\u17b6\\u17c6\\u179f\\u1784\\u17d2\\u1780\\u17c2\"}', 'Choam Sangkae', 'ជាំសង្កែ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50603, 506, '{\"en\":\"Dambouk Rung\",\"kh\":\"\\u178a\\u17c6\\u1794\\u17bc\\u1780\\u179a\\u17bc\\u1784\"}', 'Dambouk Rung', 'ដំបូករូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50604, 506, '{\"en\":\"Kiri Voan\",\"kh\":\"\\u1782\\u17b7\\u179a\\u17b8\\u179c\\u1793\\u17d2\\u178a\"}', 'Kiri Voan', 'គិរីវន្ដ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50605, 506, '{\"en\":\"Krang Dei Vay\",\"kh\":\"\\u1780\\u17d2\\u179a\\u17b6\\u17c6\\u1784\\u178a\\u17b8\\u179c\\u17c9\\u17b6\\u1799\"}', 'Krang Dei Vay', 'ក្រាំងដីវ៉ាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50606, 506, '{\"en\":\"Moha Sang\",\"kh\":\"\\u1798\\u17a0\\u17b6\\u179f\\u17b6\\u17c6\\u1784\"}', 'Moha Sang', 'មហាសាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50607, 506, '{\"en\":\"Ou\",\"kh\":\"\\u17a2\\u17bc\\u179a\"}', 'Ou', 'អូរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50608, 506, '{\"en\":\"Prey Rumduol\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u179a\\u17c6\\u178a\\u17bd\\u179b\"}', 'Prey Rumduol', 'ព្រៃរំដួល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50609, 506, '{\"en\":\"Prey Kmeng\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1780\\u17d2\\u1798\\u17c1\\u1784\"}', 'Prey Kmeng', 'ព្រៃក្មេង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50610, 506, '{\"en\":\"Tang Samraong\",\"kh\":\"\\u178f\\u17b6\\u17c6\\u1784\\u179f\\u17c6\\u179a\\u17c4\\u1784\"}', 'Tang Samraong', 'តាំងសំរោង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50611, 506, '{\"en\":\"Tang Sya\",\"kh\":\"\\u178f\\u17b6\\u17c6\\u1784\\u179f\\u17d2\\u1799\\u17b6\"}', 'Tang Sya', 'តាំងស្យា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50613, 506, '{\"en\":\"Traeng Trayueng\",\"kh\":\"\\u178f\\u17d2\\u179a\\u17c2\\u1784\\u178f\\u17d2\\u179a\\u1799\\u17b9\\u1784\"}', 'Traeng Trayueng', 'ត្រែងត្រយឹង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50614, 506, '{\"en\":\"Yeay Mao Pichnil\",\"kh\":\"\\u1799\\u17b6\\u1799\\u1798\\u17c9\\u17c5\\u1796\\u17c1\\u1787\\u17d2\\u1799\\u1793\\u17b7\\u179b\"}', 'Yeay Mao Pichnil', 'យាយម៉ៅពេជ្យនិល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50701, 507, '{\"en\":\"Roleang Chak\",\"kh\":\"\\u179a\\u179b\\u17b6\\u17c6\\u1784\\u1785\\u1780\"}', 'Roleang Chak', 'រលាំងចក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50702, 507, '{\"en\":\"Kahaeng\",\"kh\":\"\\u1780\\u17b6\\u17a0\\u17c2\\u1784\"}', 'Kahaeng', 'កាហែង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50703, 507, '{\"en\":\"Khtum Krang\",\"kh\":\"\\u1781\\u17d2\\u1791\\u17bb\\u17c6\\u1780\\u17d2\\u179a\\u17b6\\u17c6\\u1784\"}', 'Khtum Krang', 'ខ្ទុំក្រាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50704, 507, '{\"en\":\"Krang Ampil\",\"kh\":\"\\u1780\\u17d2\\u179a\\u17b6\\u17c6\\u1784\\u17a2\\u17c6\\u1796\\u17b7\\u179b\"}', 'Krang Ampil', 'ក្រាំងអំពិល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50705, 507, '{\"en\":\"Pneay\",\"kh\":\"\\u1796\\u17d2\\u1793\\u17b6\\u1799\"}', 'Pneay', 'ព្នាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50706, 507, '{\"en\":\"Roleang Kreul\",\"kh\":\"\\u179a\\u179b\\u17b6\\u17c6\\u1784\\u1782\\u17d2\\u179a\\u17be\\u179b\"}', 'Roleang Kreul', 'រលាំងគ្រើល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50707, 507, '{\"en\":\"Samrong Tong\",\"kh\":\"\\u179f\\u17c6\\u179a\\u17c4\\u1784\\u1791\\u1784\"}', 'Samrong Tong', 'សំរោងទង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50708, 507, '{\"en\":\"Sambour\",\"kh\":\"\\u179f\\u17c6\\u1794\\u17bc\\u179a\"}', 'Sambour', 'សំបូរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50709, 507, '{\"en\":\"Saen Dei\",\"kh\":\"\\u179f\\u17c2\\u1793\\u178a\\u17b8\"}', 'Saen Dei', 'សែនដី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50710, 507, '{\"en\":\"Skuh\",\"kh\":\"\\u179f\\u17d2\\u1782\\u17bb\\u17c7\"}', 'Skuh', 'ស្គុះ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50711, 507, '{\"en\":\"Tang Krouch\",\"kh\":\"\\u178f\\u17b6\\u17c6\\u1784\\u1780\\u17d2\\u179a\\u17bc\\u1785\"}', 'Tang Krouch', 'តាំងក្រូច', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50712, 507, '{\"en\":\"Thummoda Ar\",\"kh\":\"\\u1792\\u1798\\u17d2\\u1798\\u178f\\u17b6\\u17a2\\u179a\"}', 'Thummoda Ar', 'ធម្មតាអរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50713, 507, '{\"en\":\"Trapeang Kong\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u1782\\u1784\"}', 'Trapeang Kong', 'ត្រពាំងគង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50714, 507, '{\"en\":\"Tumpoar Meas\",\"kh\":\"\\u1791\\u17c6\\u1796\\u17d0\\u179a\\u1798\\u17b6\\u179f\"}', 'Tumpoar Meas', 'ទំព័រមាស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50715, 507, '{\"en\":\"Voa Sar\",\"kh\":\"\\u179c\\u179b\\u17d2\\u179b\\u17b7\\u179f\\u179a\"}', 'Voa Sar', 'វល្លិសរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50801, 508, '{\"en\":\"Amleang\",\"kh\":\"\\u17a2\\u1798\\u179b\\u17b6\\u17c6\\u1784\"}', 'Amleang', 'អមលាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50802, 508, '{\"en\":\"Monourom\",\"kh\":\"\\u1798\\u1793\\u17c4\\u179a\\u1798\\u17d2\\u1799\"}', 'Monourom', 'មនោរម្យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50804, 508, '{\"en\":\"Prambei Mum\",\"kh\":\"\\u1794\\u17d2\\u179a\\u17b6\\u17c6\\u1794\\u17b8\\u1798\\u17bb\\u1798\"}', 'Prambei Mum', 'ប្រាំបីមុម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50805, 508, '{\"en\":\"Rung Roeang\",\"kh\":\"\\u179a\\u17bb\\u1784\\u179a\\u17bf\\u1784\"}', 'Rung Roeang', 'រុងរឿង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50806, 508, '{\"en\":\"Toap Mean\",\"kh\":\"\\u1791\\u17d0\\u1796\\u1798\\u17b6\\u1793\"}', 'Toap Mean', 'ទ័ពមាន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50807, 508, '{\"en\":\"Veal Pon\",\"kh\":\"\\u179c\\u17b6\\u179b\\u1796\\u1793\\u17cb\"}', 'Veal Pon', 'វាលពន់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(50808, 508, '{\"en\":\"Yea Angk\",\"kh\":\"\\u1799\\u17b6\\u17a2\\u1784\\u17d2\\u1782\"}', 'Yea Angk', 'យាអង្គ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60101, 601, '{\"en\":\"Bak Sna\",\"kh\":\"\\u1794\\u17b6\\u1780\\u17cb\\u179f\\u17d2\\u1793\\u17b6\"}', 'Bak Sna', 'បាក់ស្នា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60102, 601, '{\"en\":\"Ballangk\",\"kh\":\"\\u1794\\u179b\\u17d2\\u179b\\u17d0\\u1784\\u17d2\\u1782\"}', 'Ballangk', 'បល្ល័ង្គ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60103, 601, '{\"en\":\"Baray\",\"kh\":\"\\u1794\\u17b6\\u179a\\u17b6\\u1799\\u178e\\u17cd\"}', 'Baray', 'បារាយណ៍', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60104, 601, '{\"en\":\"Boeng\",\"kh\":\"\\u1794\\u17b9\\u1784\"}', 'Boeng', 'បឹង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60105, 601, '{\"en\":\"Chaeung Daeung\",\"kh\":\"\\u1785\\u17be\\u1784\\u178a\\u17be\\u1784\"}', 'Chaeung Daeung', 'ចើងដើង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60107, 601, '{\"en\":\"Chhuk Khsach\",\"kh\":\"\\u1788\\u17bc\\u1780\\u1781\\u17d2\\u179f\\u17b6\\u1785\\u17cb\"}', 'Chhuk Khsach', 'ឈូកខ្សាច់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60108, 601, '{\"en\":\"Chong Doung\",\"kh\":\"\\u1785\\u17bb\\u1784\\u178a\\u17bc\\u1784\"}', 'Chong Doung', 'ចុងដូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60110, 601, '{\"en\":\"Kokir Thum\",\"kh\":\"\\u1782\\u1782\\u17b8\\u1792\\u17c6\"}', 'Kokir Thum', 'គគីធំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60111, 601, '{\"en\":\"Krava\",\"kh\":\"\\u1780\\u17d2\\u179a\\u179c\\u17c9\\u17b6\"}', 'Krava', 'ក្រវ៉ា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60117, 601, '{\"en\":\"Tnaot Chum\",\"kh\":\"\\u178f\\u17d2\\u1793\\u17c4\\u178f\\u1787\\u17bb\\u17c6\"}', 'Tnaot Chum', 'ត្នោតជុំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60201, 602, '{\"en\":\"Chey\",\"kh\":\"\\u1787\\u17d0\\u1799\"}', 'Chey', 'ជ័យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60202, 602, '{\"en\":\"Damrei Slab\",\"kh\":\"\\u178a\\u17c6\\u179a\\u17b8\\u179f\\u17d2\\u179b\\u17b6\\u1794\\u17cb\"}', 'Damrei Slab', 'ដំរីស្លាប់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60203, 602, '{\"en\":\"Kampong Kou\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1782\\u17c4\"}', 'Kampong Kou', 'កំពង់គោ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60204, 602, '{\"en\":\"Kampong Svay\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u179f\\u17d2\\u179c\\u17b6\\u1799\"}', 'Kampong Svay', 'កំពង់ស្វាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60205, 602, '{\"en\":\"Nipech\",\"kh\":\"\\u1793\\u17b8\\u1796\\u17c1\\u1787\"}', 'Nipech', 'នីពេជ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60206, 602, '{\"en\":\"Phat Sanday\",\"kh\":\"\\u1795\\u17b6\\u178f\\u17cb\\u179f\\u178e\\u17d2\\u178a\\u17b6\\u1799\"}', 'Phat Sanday', 'ផាត់សណ្ដាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60207, 602, '{\"en\":\"San Kor\",\"kh\":\"\\u179f\\u17b6\\u1793\\u17cb\\u1782\"}', 'San Kor', 'សាន់គ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60208, 602, '{\"en\":\"Tbaeng\",\"kh\":\"\\u178f\\u17d2\\u1794\\u17c2\\u1784\"}', 'Tbaeng', 'ត្បែង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60209, 602, '{\"en\":\"Trapeang Ruessei\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u17ab\\u179f\\u17d2\\u179f\\u17b8\"}', 'Trapeang Ruessei', 'ត្រពាំងឫស្សី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60210, 602, '{\"en\":\"Kdei Doung\",\"kh\":\"\\u1780\\u17d2\\u178a\\u17b8\\u178a\\u17bc\\u1784\"}', 'Kdei Doung', 'ក្ដីដូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60211, 602, '{\"en\":\"Prey Kuy\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1782\\u17bb\\u1799\"}', 'Prey Kuy', 'ព្រៃគុយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60301, 603, '{\"en\":\"Damrei Choan Khla\",\"kh\":\"\\u178a\\u17c6\\u179a\\u17b8\\u1787\\u17b6\\u1793\\u17cb\\u1781\\u17d2\\u179b\\u17b6\"}', 'Damrei Choan Khla', 'ដំរីជាន់ខ្លា', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(60302, 603, '{\"en\":\"Kampong Thum\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1792\\u17c6\"}', 'Kampong Thum', 'កំពង់ធំ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(60303, 603, '{\"en\":\"Kampong Roteh\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u179a\\u1791\\u17c1\\u17c7\"}', 'Kampong Roteh', 'កំពង់រទេះ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(60304, 603, '{\"en\":\"Ou Kanthor\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u1780\\u1793\\u17d2\\u1792\\u179a\"}', 'Ou Kanthor', 'អូរកន្ធរ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(60306, 603, '{\"en\":\"Kampong Krabau\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1780\\u17d2\\u179a\\u1794\\u17c5\"}', 'Kampong Krabau', 'កំពង់ក្របៅ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(60308, 603, '{\"en\":\"Prey Ta Hu\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u178f\\u17b6\\u17a0\\u17ca\\u17bc\"}', 'Prey Ta Hu', 'ព្រៃតាហ៊ូ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(60309, 603, '{\"en\":\"Achar Leak\",\"kh\":\"\\u17a2\\u17b6\\u1785\\u17b6\\u179a\\u17d2\\u1799\\u179b\\u17b6\\u1780\\u17cb\"}', 'Achar Leak', 'អាចារ្យលាក់', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(60310, 603, '{\"en\":\"Srayov\",\"kh\":\"\\u179f\\u17d2\\u179a\\u1799\\u17c9\\u17bc\\u179c\"}', 'Srayov', 'ស្រយ៉ូវ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(60401, 604, '{\"en\":\"Doung\",\"kh\":\"\\u178a\\u17bc\\u1784\"}', 'Doung', 'ដូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60402, 604, '{\"en\":\"Kraya\",\"kh\":\"\\u1780\\u17d2\\u179a\\u1799\\u17b6\"}', 'Kraya', 'ក្រយា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60403, 604, '{\"en\":\"Phan Nheum\",\"kh\":\"\\u1795\\u17b6\\u1793\\u17cb\\u1789\\u17be\\u1798\"}', 'Phan Nheum', 'ផាន់ញើម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60404, 604, '{\"en\":\"Sakream\",\"kh\":\"\\u179f\\u17b6\\u1782\\u17d2\\u179a\\u17b6\\u1798\"}', 'Sakream', 'សាគ្រាម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60405, 604, '{\"en\":\"Sala Visai\",\"kh\":\"\\u179f\\u17b6\\u179b\\u17b6\\u179c\\u17b7\\u179f\\u17d0\\u1799\"}', 'Sala Visai', 'សាលាវិស័យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60406, 604, '{\"en\":\"Sameakki\",\"kh\":\"\\u179f\\u17b6\\u1798\\u1782\\u17d2\\u1782\\u17b8\"}', 'Sameakki', 'សាមគ្គី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60407, 604, '{\"en\":\"Tuol Kreul\",\"kh\":\"\\u1791\\u17bd\\u179b\\u1782\\u17d2\\u179a\\u17be\\u179b\"}', 'Tuol Kreul', 'ទួលគ្រើល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60501, 605, '{\"en\":\"Chhuk\",\"kh\":\"\\u1788\\u17bc\\u1780\"}', 'Chhuk', 'ឈូក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60502, 605, '{\"en\":\"Koul\",\"kh\":\"\\u1782\\u17c4\\u179b\"}', 'Koul', 'គោល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60503, 605, '{\"en\":\"Sambour\",\"kh\":\"\\u179f\\u17c6\\u1794\\u17bc\\u179a\\u178e\\u17cd\"}', 'Sambour', 'សំបូរណ៍', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60504, 605, '{\"en\":\"Sraeung\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17be\\u1784\"}', 'Sraeung', 'ស្រើង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60505, 605, '{\"en\":\"Tang Krasau\",\"kh\":\"\\u178f\\u17b6\\u17c6\\u1784\\u1780\\u17d2\\u179a\\u179f\\u17c5\"}', 'Tang Krasau', 'តាំងក្រសៅ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60601, 606, '{\"en\":\"Chheu Teal\",\"kh\":\"\\u1788\\u17be\\u1791\\u17b6\\u179b\"}', 'Chheu Teal', 'ឈើទាល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60602, 606, '{\"en\":\"Dang Kambet\",\"kh\":\"\\u178a\\u1784\\u1780\\u17b6\\u17c6\\u1794\\u17b7\\u178f\"}', 'Dang Kambet', 'ដងកាំបិត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60603, 606, '{\"en\":\"Klaeng\",\"kh\":\"\\u1780\\u17d2\\u179b\\u17c2\\u1784\"}', 'Klaeng', 'ក្លែង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60604, 606, '{\"en\":\"Mean Rith\",\"kh\":\"\\u1798\\u17b6\\u1793\\u179a\\u17b7\\u1791\\u17d2\\u1792\"}', 'Mean Rith', 'មានរិទ្ធ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60605, 606, '{\"en\":\"Mean Chey\",\"kh\":\"\\u1798\\u17b6\\u1793\\u1787\\u17d0\\u1799\"}', 'Mean Chey', 'មានជ័យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60606, 606, '{\"en\":\"Ngan\",\"kh\":\"\\u1784\\u1793\"}', 'Ngan', 'ងន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60607, 606, '{\"en\":\"Sandan\",\"kh\":\"\\u179f\\u178e\\u17d2\\u178a\\u17b6\\u1793\\u17cb\"}', 'Sandan', 'សណ្ដាន់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60608, 606, '{\"en\":\"Sochet\",\"kh\":\"\\u179f\\u17bb\\u1785\\u17b7\\u178f\\u17d2\\u179a\"}', 'Sochet', 'សុចិត្រ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60609, 606, '{\"en\":\"Tum Ring\",\"kh\":\"\\u1791\\u17c6\\u179a\\u17b8\\u1784\"}', 'Tum Ring', 'ទំរីង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60701, 607, '{\"en\":\"Boeng Lvea\",\"kh\":\"\\u1794\\u17b9\\u1784\\u179b\\u17d2\\u179c\\u17b6\"}', 'Boeng Lvea', 'បឹងល្វា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60702, 607, '{\"en\":\"Chroab\",\"kh\":\"\\u1787\\u17d2\\u179a\\u17b6\\u1794\\u17cb\"}', 'Chroab', 'ជ្រាប់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60703, 607, '{\"en\":\"Kampong Thma\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1790\\u17d2\\u1798\"}', 'Kampong Thma', 'កំពង់ថ្ម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60704, 607, '{\"en\":\"Kakaoh\",\"kh\":\"\\u1780\\u1780\\u17c4\\u17c7\"}', 'Kakaoh', 'កកោះ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60705, 607, '{\"en\":\"Kraya\",\"kh\":\"\\u1780\\u17d2\\u179a\\u1799\\u17b6\"}', 'Kraya', 'ក្រយា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60706, 607, '{\"en\":\"Pnov\",\"kh\":\"\\u1796\\u17d2\\u1793\\u17c5\"}', 'Pnov', 'ព្នៅ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60707, 607, '{\"en\":\"Prasat\",\"kh\":\"\\u1794\\u17d2\\u179a\\u17b6\\u179f\\u17b6\\u1791\"}', 'Prasat', 'ប្រាសាទ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60708, 607, '{\"en\":\"Tang Krasang\",\"kh\":\"\\u178f\\u17b6\\u17c6\\u1784\\u1780\\u17d2\\u179a\\u179f\\u17b6\\u17c6\\u1784\"}', 'Tang Krasang', 'តាំងក្រសាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60709, 607, '{\"en\":\"Ti Pou\",\"kh\":\"\\u1791\\u17b8\\u1796\\u17c4\"}', 'Ti Pou', 'ទីពោ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60710, 607, '{\"en\":\"Tboung Krapeu\",\"kh\":\"\\u178f\\u17d2\\u1794\\u17bc\\u1784\\u1780\\u17d2\\u179a\\u1796\\u17be\"}', 'Tboung Krapeu', 'ត្បូងក្រពើ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60801, 608, '{\"en\":\"Banteay Stoung\",\"kh\":\"\\u1794\\u1793\\u17d2\\u1791\\u17b6\\u1799\\u179f\\u17d2\\u1791\\u17c4\\u1784\"}', 'Banteay Stoung', 'បន្ទាយស្ទោង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60802, 608, '{\"en\":\"Chamna Kraom\",\"kh\":\"\\u1785\\u17c6\\u178e\\u17b6\\u1780\\u17d2\\u179a\\u17c4\\u1798\"}', 'Chamna Kraom', 'ចំណាក្រោម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60803, 608, '{\"en\":\"Chamna Leu\",\"kh\":\"\\u1785\\u17c6\\u178e\\u17b6\\u179b\\u17be\"}', 'Chamna Leu', 'ចំណាលើ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60804, 608, '{\"en\":\"Kampong Chen Cheung\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1785\\u17b7\\u1793\\u1787\\u17be\\u1784\"}', 'Kampong Chen Cheung', 'កំពង់ចិនជើង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60805, 608, '{\"en\":\"Kampong Chen Tboung\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1785\\u17b7\\u1793\\u178f\\u17d2\\u1794\\u17bc\\u1784\"}', 'Kampong Chen Tboung', 'កំពង់ចិនត្បូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60806, 608, '{\"en\":\"Msa Krang\",\"kh\":\"\\u1798\\u17d2\\u179f\\u17b6\\u1780\\u17d2\\u179a\\u1784\"}', 'Msa Krang', 'ម្សាក្រង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60807, 608, '{\"en\":\"Peam Bang\",\"kh\":\"\\u1796\\u17b6\\u1798\\u1794\\u17b6\\u1784\"}', 'Peam Bang', 'ពាមបាង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60808, 608, '{\"en\":\"Popok\",\"kh\":\"\\u1796\\u1796\\u1780\"}', 'Popok', 'ពពក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60809, 608, '{\"en\":\"Pralay\",\"kh\":\"\\u1794\\u17d2\\u179a\\u17a1\\u17b6\\u1799\"}', 'Pralay', 'ប្រឡាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60810, 608, '{\"en\":\"Preah Damrei\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c7\\u178a\\u17c6\\u179a\\u17b8\"}', 'Preah Damrei', 'ព្រះដំរី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60811, 608, '{\"en\":\"Rung Roeang\",\"kh\":\"\\u179a\\u17bb\\u1784\\u179a\\u17bf\\u1784\"}', 'Rung Roeang', 'រុងរឿង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60812, 608, '{\"en\":\"Samprouch\",\"kh\":\"\\u179f\\u17c6\\u1796\\u17d2\\u179a\\u17c4\\u1787\"}', 'Samprouch', 'សំព្រោជ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60813, 608, '{\"en\":\"Trea\",\"kh\":\"\\u1791\\u17d2\\u179a\\u17b6\"}', 'Trea', 'ទ្រា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60901, 609, '{\"en\":\"Pongro\",\"kh\":\"\\u1796\\u1784\\u17d2\\u179a\"}', 'Pongro', 'ពង្រ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60902, 609, '{\"en\":\"Chraneang\",\"kh\":\"\\u1785\\u17d2\\u179a\\u1793\\u17b6\\u1784\"}', 'Chraneang', 'ច្រនាង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60903, 609, '{\"en\":\"Chrolong\",\"kh\":\"\\u1787\\u17d2\\u179a\\u179b\\u1784\"}', 'Chrolong', 'ជ្រលង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60904, 609, '{\"en\":\"Triel\",\"kh\":\"\\u1791\\u17d2\\u179a\\u17c0\\u179b\"}', 'Triel', 'ទ្រៀល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60905, 609, '{\"en\":\"Sou Young\",\"kh\":\"\\u179f\\u17bc\\u1799\\u17c4\\u1784\"}', 'Sou Young', 'សូយោង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60906, 609, '{\"en\":\"Sralau\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17a1\\u17c5\"}', 'Sralau', 'ស្រឡៅ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60907, 609, '{\"en\":\"Svay Phleung\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u1797\\u17d2\\u179b\\u17be\\u1784\"}', 'Svay Phleung', 'ស្វាយភ្លើង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(60908, 609, '{\"en\":\"Andoung Pou\",\"kh\":\"\\u17a2\\u178e\\u17d2\\u178a\\u17bc\\u1784\\u1796\\u17c4\\u1792\\u17b7\\u17cd\"}', 'Andoung Pou', 'អណ្ដូងពោធិ៍', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70101, 701, '{\"en\":\"Angk Phnum Touch\",\"kh\":\"\\u17a2\\u1784\\u17d2\\u1782\\u1797\\u17d2\\u1793\\u17c6\\u178f\\u17bc\\u1785\"}', 'Angk Phnum Touch', 'អង្គភ្នំតូច', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70102, 701, '{\"en\":\"Ankor Chey\",\"kh\":\"\\u17a2\\u1784\\u17d2\\u1782\\u179a\\u1787\\u17d0\\u1799\"}', 'Ankor Chey', 'អង្គរជ័យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70103, 701, '{\"en\":\"Champei\",\"kh\":\"\\u1785\\u17c6\\u1794\\u17c9\\u17b8\"}', 'Champei', 'ចំប៉ី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70104, 701, '{\"en\":\"Dambouk Khpos\",\"kh\":\"\\u178a\\u17c6\\u1794\\u17bc\\u1780\\u1781\\u17d2\\u1796\\u179f\\u17cb\"}', 'Dambouk Khpos', 'ដំបូកខ្ពស់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70105, 701, '{\"en\":\"Dan Koum\",\"kh\":\"\\u178a\\u17b6\\u1793\\u1782\\u17c4\\u1798\"}', 'Dan Koum', 'ដានគោម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70106, 701, '{\"en\":\"Daeum Doung\",\"kh\":\"\\u178a\\u17be\\u1798\\u178a\\u17bc\\u1784\"}', 'Daeum Doung', 'ដើមដូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70107, 701, '{\"en\":\"Mroum\",\"kh\":\"\\u1798\\u17d2\\u179a\\u17c4\\u1798\"}', 'Mroum', 'ម្រោម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70108, 701, '{\"en\":\"Phnum Kong\",\"kh\":\"\\u1797\\u17d2\\u1793\\u17c6\\u1780\\u17bb\\u1784\"}', 'Phnum Kong', 'ភ្នំកុង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70109, 701, '{\"en\":\"Praphnum\",\"kh\":\"\\u1794\\u17d2\\u179a\\u1797\\u17d2\\u1793\\u17c6\"}', 'Praphnum', 'ប្រភ្នំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70110, 701, '{\"en\":\"Samlanh\",\"kh\":\"\\u179f\\u17c6\\u17a1\\u17b6\\u1789\"}', 'Samlanh', 'សំឡាញ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70111, 701, '{\"en\":\"Tani\",\"kh\":\"\\u178f\\u17b6\\u1793\\u17b8\"}', 'Tani', 'តានី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70201, 702, '{\"en\":\"Banteay Meas Khang Kaeut\",\"kh\":\"\\u1794\\u1793\\u17d2\\u1791\\u17b6\\u1799\\u1798\\u17b6\\u179f\\u1781\\u17b6\\u1784\\u1780\\u17be\\u178f\"}', 'Banteay Meas Khang Kaeut', 'បន្ទាយមាសខាងកើត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70202, 702, '{\"en\":\"Banteay Meas Khang lech\",\"kh\":\"\\u1794\\u1793\\u17d2\\u1791\\u17b6\\u1799\\u1798\\u17b6\\u179f\\u1781\\u17b6\\u1784\\u179b\\u17b7\\u1785\"}', 'Banteay Meas Khang lech', 'បន្ទាយមាសខាងលិច', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70203, 702, '{\"en\":\"Prey Tonle\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1791\\u1793\\u17d2\\u179b\\u17c1\"}', 'Prey Tonle', 'ព្រៃទន្លេ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70204, 702, '{\"en\":\"Samraong Kraom\",\"kh\":\"\\u179f\\u17c6\\u179a\\u17c4\\u1784\\u1780\\u17d2\\u179a\\u17c4\\u1798\"}', 'Samraong Kraom', 'សំរោងក្រោម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70205, 702, '{\"en\":\"Samraong Leu\",\"kh\":\"\\u179f\\u17c6\\u179a\\u17c4\\u1784\\u179b\\u17be\"}', 'Samraong Leu', 'សំរោងលើ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70206, 702, '{\"en\":\"Sdach Kong Khang Cheung\",\"kh\":\"\\u179f\\u17d2\\u178a\\u17c1\\u1785\\u1782\\u1784\\u17cb\\u1781\\u17b6\\u1784\\u1787\\u17be\\u1784\"}', 'Sdach Kong Khang Cheung', 'ស្ដេចគង់ខាងជើង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70207, 702, '{\"en\":\"Sdach Kong Khang lech\",\"kh\":\"\\u179f\\u17d2\\u178a\\u17c1\\u1785\\u1782\\u1784\\u17cb\\u1781\\u17b6\\u1784\\u179b\\u17b7\\u1785\"}', 'Sdach Kong Khang lech', 'ស្ដេចគង់ខាងលិច', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70208, 702, '{\"en\":\"Sdach Kong Khang Tboung\",\"kh\":\"\\u179f\\u17d2\\u178a\\u17c1\\u1785\\u1782\\u1784\\u17cb\\u1781\\u17b6\\u1784\\u178f\\u17d2\\u1794\\u17bc\\u1784\"}', 'Sdach Kong Khang Tboung', 'ស្ដេចគង់ខាងត្បូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70209, 702, '{\"en\":\"Tnoat Chong Srang\",\"kh\":\"\\u178f\\u17d2\\u1793\\u17c4\\u178f\\u1785\\u17bb\\u1784\\u179f\\u17d2\\u179a\\u1784\\u17cb\"}', 'Tnoat Chong Srang', 'ត្នោតចុងស្រង់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70210, 702, '{\"en\":\"Trapeang Sala Khang Kaeut\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u179f\\u17b6\\u179b\\u17b6\\u1781\\u17b6\\u1784\\u1780\\u17be\\u178f\"}', 'Trapeang Sala Khang Kaeut', 'ត្រពាំងសាលាខាងកើត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70211, 702, '{\"en\":\"Trapeang Sala Khang Lech\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u179f\\u17b6\\u179b\\u17b6\\u1781\\u17b6\\u1784\\u179b\\u17b7\\u1785\"}', 'Trapeang Sala Khang Lech', 'ត្រពាំងសាលាខាងលិច', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70212, 702, '{\"en\":\"Tuk Meas Khang Kaeut\",\"kh\":\"\\u1791\\u17bc\\u1780\\u1798\\u17b6\\u179f\\u1781\\u17b6\\u1784\\u1780\\u17be\\u178f\"}', 'Tuk Meas Khang Kaeut', 'ទូកមាសខាងកើត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70213, 702, '{\"en\":\"Tuk Meas Khang Lech\",\"kh\":\"\\u1791\\u17bc\\u1780\\u1798\\u17b6\\u179f\\u1781\\u17b6\\u1784\\u179b\\u17b7\\u1785\"}', 'Tuk Meas Khang Lech', 'ទូកមាសខាងលិច', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70214, 702, '{\"en\":\"Voat Angk Khang Cheung\",\"kh\":\"\\u179c\\u178f\\u17d2\\u178a\\u17a2\\u1784\\u17d2\\u1782\\u1781\\u17b6\\u1784\\u1787\\u17be\\u1784\"}', 'Voat Angk Khang Cheung', 'វត្ដអង្គខាងជើង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70215, 702, '{\"en\":\"Voat Angk Khang Tboung\",\"kh\":\"\\u179c\\u178f\\u17d2\\u178a\\u17a2\\u1784\\u17d2\\u1782\\u1781\\u17b6\\u1784\\u178f\\u17d2\\u1794\\u17bc\\u1784\"}', 'Voat Angk Khang Tboung', 'វត្ដអង្គខាងត្បូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70301, 703, '{\"en\":\"Baniev\",\"kh\":\"\\u1794\\u17b6\\u1793\\u17c0\\u179c\"}', 'Baniev', 'បានៀវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70302, 703, '{\"en\":\"Takaen\",\"kh\":\"\\u178f\\u17b6\\u1780\\u17c2\\u1793\"}', 'Takaen', 'តាកែន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70303, 703, '{\"en\":\"Boeng Nimol\",\"kh\":\"\\u1794\\u17b9\\u1784\\u1793\\u17b7\\u1798\\u179b\"}', 'Boeng Nimol', 'បឹងនិមល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70304, 703, '{\"en\":\"Chhuk\",\"kh\":\"\\u1788\\u17bc\\u1780\"}', 'Chhuk', 'ឈូក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70305, 703, '{\"en\":\"Doun Yay\",\"kh\":\"\\u178a\\u17bc\\u1793\\u1799\\u17c9\\u1799\"}', 'Doun Yay', 'ដូនយ៉យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70306, 703, '{\"en\":\"Krang Sbov\",\"kh\":\"\\u1780\\u17d2\\u179a\\u17b6\\u17c6\\u1784\\u179f\\u17d2\\u1794\\u17bc\\u179c\"}', 'Krang Sbov', 'ក្រាំងស្បូវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70307, 703, '{\"en\":\"Krang Snay\",\"kh\":\"\\u1780\\u17d2\\u179a\\u17b6\\u17c6\\u1784\\u179f\\u17d2\\u1793\\u17b6\\u1799\"}', 'Krang Snay', 'ក្រាំងស្នាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70308, 703, '{\"en\":\"Lbaeuk\",\"kh\":\"\\u179b\\u17d2\\u1794\\u17be\\u1780\"}', 'Lbaeuk', 'ល្បើក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70309, 703, '{\"en\":\"Trapeang Phleang\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u1797\\u17d2\\u179b\\u17b6\\u17c6\\u1784\"}', 'Trapeang Phleang', 'ត្រពាំងភ្លាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70310, 703, '{\"en\":\"Mean Chey\",\"kh\":\"\\u1798\\u17b6\\u1793\\u1787\\u17d0\\u1799\"}', 'Mean Chey', 'មានជ័យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70311, 703, '{\"en\":\"Neareay\",\"kh\":\"\\u1793\\u17b6\\u179a\\u17b6\\u1799\\u178e\\u17cd\"}', 'Neareay', 'នារាយណ៍', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70312, 703, '{\"en\":\"Satv Pong\",\"kh\":\"\\u179f\\u178f\\u17d2\\u179c\\u1796\\u1784\"}', 'Satv Pong', 'សត្វពង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70313, 703, '{\"en\":\"Trapeang Bei\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u1794\\u17b8\"}', 'Trapeang Bei', 'ត្រពាំងបី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70314, 703, '{\"en\":\"Tramaeng\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1798\\u17c2\\u1784\"}', 'Tramaeng', 'ត្រមែង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70315, 703, '{\"en\":\"Dechou Akphivoadth\",\"kh\":\"\\u178f\\u17c1\\u1787\\u17c4\\u17a2\\u1797\\u17b7\\u179c\\u178c\\u17d2\\u178d\\u1793\\u17cd\"}', 'Dechou Akphivoadth', 'តេជោអភិវឌ្ឍន៍', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70401, 704, '{\"en\":\"Chres\",\"kh\":\"\\u1785\\u17d2\\u179a\\u17c1\\u179f\"}', 'Chres', 'ច្រេស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70402, 704, '{\"en\":\"Chumpu Voan\",\"kh\":\"\\u1787\\u17c6\\u1796\\u17bc\\u179c\\u1793\\u17d2\\u178a\"}', 'Chumpu Voan', 'ជំពូវន្ដ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70403, 704, '{\"en\":\"Snay Anhchit\",\"kh\":\"\\u179f\\u17d2\\u1793\\u17b6\\u1799\\u17a2\\u1789\\u17d2\\u1787\\u17b7\\u178f\"}', 'Snay Anhchit', 'ស្នាយអញ្ជិត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70404, 704, '{\"en\":\"Srae Chaeng\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17c2\\u1785\\u17c2\\u1784\"}', 'Srae Chaeng', 'ស្រែចែង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70405, 704, '{\"en\":\"Srae Knong\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17c2\\u1780\\u17d2\\u1793\\u17bb\\u1784\"}', 'Srae Knong', 'ស្រែក្នុង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70406, 704, '{\"en\":\"Srae Samraong\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17c2\\u179f\\u17c6\\u179a\\u17c4\\u1784\"}', 'Srae Samraong', 'ស្រែសំរោង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70407, 704, '{\"en\":\"Trapeang Reang\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u179a\\u17b6\\u17c6\\u1784\"}', 'Trapeang Reang', 'ត្រពាំងរាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70501, 705, '{\"en\":\"Damnak Sokram\",\"kh\":\"\\u178a\\u17c6\\u178e\\u17b6\\u1780\\u17cb\\u179f\\u17bb\\u1780\\u17d2\\u179a\\u17c6\"}', 'Damnak Sokram', 'ដំណាក់សុក្រំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70502, 705, '{\"en\":\"Dang Tong\",\"kh\":\"\\u178a\\u1784\\u1791\\u1784\\u17cb\"}', 'Dang Tong', 'ដងទង់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70503, 705, '{\"en\":\"Khcheay Khang Cheung\",\"kh\":\"\\u1783\\u17d2\\u1787\\u17b6\\u1799\\u1781\\u17b6\\u1784\\u1787\\u17be\\u1784\"}', 'Khcheay Khang Cheung', 'ឃ្ជាយខាងជើង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70504, 705, '{\"en\":\"Khcheay Khang Tboung\",\"kh\":\"\\u1781\\u17d2\\u1787\\u17b6\\u1799\\u1781\\u17b6\\u1784\\u178f\\u17d2\\u1794\\u17bc\\u1784\"}', 'Khcheay Khang Tboung', 'ខ្ជាយខាងត្បូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70505, 705, '{\"en\":\"Mean Ritth\",\"kh\":\"\\u1798\\u17b6\\u1793\\u179a\\u17b7\\u1791\\u17d2\\u1792\\u17b7\"}', 'Mean Ritth', 'មានរិទ្ធិ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70506, 705, '{\"en\":\"Srae Chea Khang Cheung\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17c2\\u1787\\u17b6\\u1781\\u17b6\\u1784\\u1787\\u17be\\u1784\"}', 'Srae Chea Khang Cheung', 'ស្រែជាខាងជើង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70507, 705, '{\"en\":\"Srae Chea Khang Tboung\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17c2\\u1787\\u17b6\\u1781\\u17b6\\u1784\\u178f\\u17d2\\u1794\\u17bc\\u1784\"}', 'Srae Chea Khang Tboung', 'ស្រែជាខាងត្បូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70508, 705, '{\"en\":\"Totung\",\"kh\":\"\\u1791\\u1791\\u17bb\\u1784\"}', 'Totung', 'ទទុង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70509, 705, '{\"en\":\"Angk  Romeas\",\"kh\":\"\\u17a2\\u1784\\u17d2\\u1782 \\u179a\\u1798\\u17b6\\u179f\"}', 'Angk  Romeas', 'អង្គ រមាស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70510, 705, '{\"en\":\"L\'ang\",\"kh\":\"\\u179b\\u17d2\\u17a2\\u17b6\\u1784\"}', 'L\'ang', 'ល្អាង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70601, 706, '{\"en\":\"Boeng Sala Khang Cheung\",\"kh\":\"\\u1794\\u17b9\\u1784\\u179f\\u17b6\\u179b\\u17b6\\u1781\\u17b6\\u1784\\u1787\\u17be\\u1784\"}', 'Boeng Sala Khang Cheung', 'បឹងសាលាខាងជើង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70602, 706, '{\"en\":\"Boeng Sala Khang Tboung\",\"kh\":\"\\u1794\\u17b9\\u1784\\u179f\\u17b6\\u179b\\u17b6\\u1781\\u17b6\\u1784\\u178f\\u17d2\\u1794\\u17bc\\u1784\"}', 'Boeng Sala Khang Tboung', 'បឹងសាលាខាងត្បូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70603, 706, '{\"en\":\"Damnak Kantuot Khang Cheung\",\"kh\":\"\\u178a\\u17c6\\u178e\\u17b6\\u1780\\u17cb\\u1780\\u1793\\u17d2\\u1791\\u17bd\\u178f\\u1781\\u17b6\\u1784\\u1787\\u17be\\u1784\"}', 'Damnak Kantuot Khang Cheung', 'ដំណាក់កន្ទួតខាងជើង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70604, 706, '{\"en\":\"Damnak Kantuot Khang Tboung\",\"kh\":\"\\u178a\\u17c6\\u178e\\u17b6\\u1780\\u17cb\\u1780\\u1793\\u17d2\\u1791\\u17bd\\u178f\\u1781\\u17b6\\u1784\\u178f\\u17d2\\u1794\\u17bc\\u1784\"}', 'Damnak Kantuot Khang Tboung', 'ដំណាក់កន្ទួតខាងត្បូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70605, 706, '{\"en\":\"Kampong Trach Khang Kaeut\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u178f\\u17d2\\u179a\\u17b6\\u1785\\u1781\\u17b6\\u1784\\u1780\\u17be\\u178f\"}', 'Kampong Trach Khang Kaeut', 'កំពង់ត្រាចខាងកើត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70606, 706, '{\"en\":\"Kampong Trach Khang Lech\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u178f\\u17d2\\u179a\\u17b6\\u1785\\u1781\\u17b6\\u1784\\u179b\\u17b7\\u1785\"}', 'Kampong Trach Khang Lech', 'កំពង់ត្រាចខាងលិច', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70607, 706, '{\"en\":\"Prasat Phnom Khyang\",\"kh\":\"\\u1794\\u17d2\\u179a\\u17b6\\u179f\\u17b6\\u1791\\u1797\\u17d2\\u1793\\u17c6\\u1781\\u17d2\\u1799\\u1784\"}', 'Prasat Phnom Khyang', 'ប្រាសាទភ្នំខ្យង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70608, 706, '{\"en\":\"Phnom Prasat\",\"kh\":\"\\u1797\\u17d2\\u1793\\u17c6\\u1794\\u17d2\\u179a\\u17b6\\u179f\\u17b6\\u1791\"}', 'Phnom Prasat', 'ភ្នំប្រាសាទ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70609, 706, '{\"en\":\"Ang Sophy\",\"kh\":\"\\u17a2\\u1784\\u17d2\\u1782\\u179f\\u17bb\\u179a\\u1797\\u17b8\"}', 'Ang Sophy', 'អង្គសុរភី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70612, 706, '{\"en\":\"Preaek Kroes\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1780\\u17d2\\u179a\\u17b9\\u179f\"}', 'Preaek Kroes', 'ព្រែកក្រឹស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70613, 706, '{\"en\":\"Ruessei Srok Khang Kaeut\",\"kh\":\"\\u17ab\\u179f\\u17d2\\u179f\\u17b8\\u179f\\u17d2\\u179a\\u17bb\\u1780\\u1781\\u17b6\\u1784\\u1780\\u17be\\u178f\"}', 'Ruessei Srok Khang Kaeut', 'ឫស្សីស្រុកខាងកើត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70614, 706, '{\"en\":\"Ruessei Srok Khang Lech\",\"kh\":\"\\u17ab\\u179f\\u17d2\\u179f\\u17b8\\u179f\\u17d2\\u179a\\u17bb\\u1780\\u1781\\u17b6\\u1784\\u179b\\u17b7\\u1785\"}', 'Ruessei Srok Khang Lech', 'ឫស្សីស្រុកខាងលិច', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70615, 706, '{\"en\":\"Svay Tong Khang Cheung\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u1791\\u1784\\u1781\\u17b6\\u1784\\u1787\\u17be\\u1784\"}', 'Svay Tong Khang Cheung', 'ស្វាយទងខាងជើង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70616, 706, '{\"en\":\"Svay Tong Khang Tboung\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u1791\\u1784\\u1781\\u17b6\\u1784\\u178f\\u17d2\\u1794\\u17bc\\u1784\"}', 'Svay Tong Khang Tboung', 'ស្វាយទងខាងត្បូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70702, 707, '{\"en\":\"Chum Kriel\",\"kh\":\"\\u1787\\u17bb\\u17c6\\u1782\\u17d2\\u179a\\u17c0\\u179b\"}', 'Chum Kriel', 'ជុំគ្រៀល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70703, 707, '{\"en\":\"Kampong Kraeng\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1780\\u17d2\\u179a\\u17c2\\u1784\"}', 'Kampong Kraeng', 'កំពង់ក្រែង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70704, 707, '{\"en\":\"Kampong Samraong\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u179f\\u17c6\\u179a\\u17c4\\u1784\"}', 'Kampong Samraong', 'កំពង់សំរោង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70705, 707, '{\"en\":\"Kandaol\",\"kh\":\"\\u1780\\u178e\\u17d2\\u178a\\u17c4\\u179b\"}', 'Kandaol', 'កណ្ដោល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70708, 707, '{\"en\":\"Koun Satv\",\"kh\":\"\\u1780\\u17bc\\u1793\\u179f\\u178f\\u17d2\\u179c\"}', 'Koun Satv', 'កូនសត្វ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70709, 707, '{\"en\":\"Makprang\",\"kh\":\"\\u1798\\u17c9\\u17b6\\u1780\\u17cb\\u1794\\u17d2\\u179a\\u17b6\\u1784\\u17d2\\u1782\"}', 'Makprang', 'ម៉ាក់ប្រាង្គ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70712, 707, '{\"en\":\"Prey Khmum\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1783\\u17d2\\u1798\\u17bb\\u17c6\"}', 'Prey Khmum', 'ព្រៃឃ្មុំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70713, 707, '{\"en\":\"Prey Thnang\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1790\\u17d2\\u1793\\u1784\"}', 'Prey Thnang', 'ព្រៃថ្នង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70715, 707, '{\"en\":\"Stueng Kaev\",\"kh\":\"\\u179f\\u17d2\\u1791\\u17b9\\u1784\\u1780\\u17c2\\u179c\"}', 'Stueng Kaev', 'ស្ទឹងកែវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70716, 707, '{\"en\":\"Thmei\",\"kh\":\"\\u1790\\u17d2\\u1798\\u17b8\"}', 'Thmei', 'ថ្មី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70717, 707, '{\"en\":\"Trapeang Pring\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u1796\\u17d2\\u179a\\u17b8\\u1784\"}', 'Trapeang Pring', 'ត្រពាំងព្រីង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1);
INSERT INTO `tbl_location` (`location_id`, `parent_id`, `title`, `title_en`, `title_kh`, `shortname`, `type`, `prefix`, `image`, `display`, `tag`, `trash`, `ordering`, `ab_id`, `blongto`) VALUES
(70718, 707, '{\"en\":\"Trapeang Sangkae\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u179f\\u1784\\u17d2\\u1780\\u17c2\"}', 'Trapeang Sangkae', 'ត្រពាំងសង្កែ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70719, 707, '{\"en\":\"Trapeang Thum\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u1792\\u17c6\"}', 'Trapeang Thum', 'ត្រពាំងធំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(70801, 708, '{\"en\":\"Kampong Kandal\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1780\\u178e\\u17d2\\u178a\\u17b6\\u179b\"}', 'Kampong Kandal', 'កំពង់កណ្ដាល', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(70802, 708, '{\"en\":\"Krang Ampil\",\"kh\":\"\\u1780\\u17d2\\u179a\\u17b6\\u17c6\\u1784\\u17a2\\u17c6\\u1796\\u17b7\\u179b\"}', 'Krang Ampil', 'ក្រាំងអំពិល', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(70803, 708, '{\"en\":\"Kampong Bay\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1794\\u17b6\\u1799\"}', 'Kampong Bay', 'កំពង់បាយ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(70804, 708, '{\"en\":\"Andoung Khmer\",\"kh\":\"\\u17a2\\u178e\\u17d2\\u178a\\u17bc\\u1784\\u1781\\u17d2\\u1798\\u17c2\\u179a\"}', 'Andoung Khmer', 'អណ្ដូងខ្មែរ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(70805, 708, '{\"en\":\"Traeuy Kaoh\",\"kh\":\"\\u178f\\u17d2\\u179a\\u17be\\u1799\\u1780\\u17c4\\u17c7\"}', 'Traeuy Kaoh', 'ត្រើយកោះ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(70901, 709, '{\"en\":\"Boeng Tuk\",\"kh\":\"\\u1794\\u17b9\\u1784\\u1791\\u17bc\\u1780\"}', 'Boeng Tuk', 'បឹងទូក', '', 'Commune', 302, '', 'yes', '', 'no', 0, 0, 1),
(70902, 709, '{\"en\":\"Kaoh Touch\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u178f\\u17bc\\u1785\"}', 'Kaoh Touch', 'កោះតូច', '', 'Commune', 302, '', 'yes', '', 'no', 0, 0, 1),
(70903, 709, '{\"en\":\"Preaek Tnoat\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u178f\\u17d2\\u1793\\u17c4\\u178f\"}', 'Preaek Tnoat', 'ព្រែកត្នោត', '', 'Commune', 302, '', 'yes', '', 'no', 0, 0, 1),
(80101, 801, '{\"en\":\"Ampov Prey\",\"kh\":\"\\u17a2\\u17c6\\u1796\\u17c5\\u1796\\u17d2\\u179a\\u17c3\"}', 'Ampov Prey', 'អំពៅព្រៃ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80102, 801, '{\"en\":\"Anlong Romiet\",\"kh\":\"\\u17a2\\u1793\\u17d2\\u179b\\u1784\\u17cb\\u179a\\u1798\\u17c0\\u178f\"}', 'Anlong Romiet', 'អន្លង់រមៀត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80103, 801, '{\"en\":\"Barku\",\"kh\":\"\\u1794\\u17b6\\u179a\\u1782\\u17bc\"}', 'Barku', 'បារគូ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80104, 801, '{\"en\":\"Boeng Khyang\",\"kh\":\"\\u1794\\u17b9\\u1784\\u1781\\u17d2\\u1799\\u17b6\\u1784\"}', 'Boeng Khyang', 'បឹងខ្យាង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80105, 801, '{\"en\":\"Cheung Kaeub\",\"kh\":\"\\u1787\\u17be\\u1784\\u1780\\u17be\\u1794\"}', 'Cheung Kaeub', 'ជើងកើប', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80106, 801, '{\"en\":\"Daeum Rues\",\"kh\":\"\\u178a\\u17be\\u1798\\u17ab\\u179f\"}', 'Daeum Rues', 'ដើមឫស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80107, 801, '{\"en\":\"Kandaok\",\"kh\":\"\\u1780\\u178e\\u17d2\\u178a\\u17c4\\u1780\"}', 'Kandaok', 'កណ្ដោក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80108, 801, '{\"en\":\"Thmei\",\"kh\":\"\\u1790\\u17d2\\u1798\\u17b8\"}', 'Thmei', 'ថ្មី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80109, 801, '{\"en\":\"Kouk Trab\",\"kh\":\"\\u1782\\u17c4\\u1780\\u178f\\u17d2\\u179a\\u1794\\u17cb\"}', 'Kouk Trab', 'គោកត្រប់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80113, 801, '{\"en\":\"Preah Putth\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c7\\u1796\\u17bb\\u1791\\u17d2\\u1792\"}', 'Preah Putth', 'ព្រះពុទ្ធ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80115, 801, '{\"en\":\"Preaek Roka\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u179a\\u1780\\u17b6\"}', 'Preaek Roka', 'ព្រែករកា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80116, 801, '{\"en\":\"Preaek Slaeng\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u179f\\u17d2\\u179b\\u17c2\\u1784\"}', 'Preaek Slaeng', 'ព្រែកស្លែង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80117, 801, '{\"en\":\"Roka\",\"kh\":\"\\u179a\\u1780\\u17b6\"}', 'Roka', 'រកា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80118, 801, '{\"en\":\"Roleang Kaen\",\"kh\":\"\\u179a\\u179b\\u17b6\\u17c6\\u1784\\u1780\\u17c2\\u1793\"}', 'Roleang Kaen', 'រលាំងកែន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80122, 801, '{\"en\":\"Siem Reab\",\"kh\":\"\\u179f\\u17c0\\u1798\\u179a\\u17b6\\u1794\"}', 'Siem Reab', 'សៀមរាប', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80125, 801, '{\"en\":\"Tbaeng\",\"kh\":\"\\u178f\\u17d2\\u1794\\u17c2\\u1784\"}', 'Tbaeng', 'ត្បែង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80127, 801, '{\"en\":\"Trapeang Veaeng\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u179c\\u17c2\\u1784\"}', 'Trapeang Veaeng', 'ត្រពាំងវែង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80128, 801, '{\"en\":\"Trea\",\"kh\":\"\\u1791\\u17d2\\u179a\\u17b6\"}', 'Trea', 'ទ្រា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80201, 802, '{\"en\":\"Banteay Daek\",\"kh\":\"\\u1794\\u1793\\u17d2\\u1791\\u17b6\\u1799\\u178a\\u17c2\\u1780\"}', 'Banteay Daek', 'បន្ទាយដែក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80202, 802, '{\"en\":\"Chheu Teal\",\"kh\":\"\\u1788\\u17be\\u1791\\u17b6\\u179b\"}', 'Chheu Teal', 'ឈើទាល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80203, 802, '{\"en\":\"Dei Edth\",\"kh\":\"\\u178a\\u17b8\\u17a5\\u178a\\u17d2\\u178b\"}', 'Dei Edth', 'ដីឥដ្ឋ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80204, 802, '{\"en\":\"Kampong Svay\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u179f\\u17d2\\u179c\\u17b6\\u1799\"}', 'Kampong Svay', 'កំពង់ស្វាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80206, 802, '{\"en\":\"Kokir\",\"kh\":\"\\u1782\\u1782\\u17b8\\u179a\"}', 'Kokir', 'គគីរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80207, 802, '{\"en\":\"Kokir Thum\",\"kh\":\"\\u1782\\u1782\\u17b8\\u179a\\u1792\\u17c6\"}', 'Kokir Thum', 'គគីរធំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80208, 802, '{\"en\":\"Phum Thum\",\"kh\":\"\\u1797\\u17bc\\u1798\\u17b7\\u1792\\u17c6\"}', 'Phum Thum', 'ភូមិធំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80211, 802, '{\"en\":\"Samraong Thum\",\"kh\":\"\\u179f\\u17c6\\u179a\\u17c4\\u1784\\u1792\\u17c6\"}', 'Samraong Thum', 'សំរោងធំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80301, 803, '{\"en\":\"Bak Dav\",\"kh\":\"\\u1794\\u17b6\\u1780\\u17cb\\u178a\\u17b6\\u179c\"}', 'Bak Dav', 'បាក់ដាវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80302, 803, '{\"en\":\"Chey Thum\",\"kh\":\"\\u1787\\u17d0\\u1799\\u1792\\u17c6\"}', 'Chey Thum', 'ជ័យធំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80303, 803, '{\"en\":\"Kampong Chamlang\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1785\\u17c6\\u179b\\u1784\"}', 'Kampong Chamlang', 'កំពង់ចំលង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80304, 803, '{\"en\":\"Kaoh Chouram\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u1785\\u17bc\\u179a\\u17c9\\u17b6\\u1798\"}', 'Kaoh Chouram', 'កោះចូរ៉ាម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80305, 803, '{\"en\":\"Kaoh Oknha Tei\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u17a7\\u1780\\u1789\\u17c9\\u17b6\\u178f\\u17b8\"}', 'Kaoh Oknha Tei', 'កោះឧកញ៉ាតី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80306, 803, '{\"en\":\"Preah Prasab\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c7\\u1794\\u17d2\\u179a\\u179f\\u1794\\u17cb\"}', 'Preah Prasab', 'ព្រះប្រសប់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80307, 803, '{\"en\":\"Preaek Ampil\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u17a2\\u17c6\\u1796\\u17b7\\u179b\"}', 'Preaek Ampil', 'ព្រែកអំពិល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80308, 803, '{\"en\":\"Preaek Luong\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u179b\\u17bd\\u1784\"}', 'Preaek Luong', 'ព្រែកលួង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80309, 803, '{\"en\":\"Preaek Ta kov\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u178f\\u17b6\\u1780\\u17bc\\u179c\"}', 'Preaek Ta kov', 'ព្រែកតាកូវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80310, 803, '{\"en\":\"Preaek Ta Meak\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u178f\\u17b6\\u1798\\u17b6\\u1780\\u17cb\"}', 'Preaek Ta Meak', 'ព្រែកតាមាក់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80311, 803, '{\"en\":\"Puk Ruessei\",\"kh\":\"\\u1796\\u17bb\\u1780\\u17ab\\u179f\\u17d2\\u179f\\u17b8\"}', 'Puk Ruessei', 'ពុកឫស្សី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80312, 803, '{\"en\":\"Roka Chonlueng\",\"kh\":\"\\u179a\\u1780\\u17b6\\u1787\\u1793\\u17d2\\u179b\\u17b9\\u1784\"}', 'Roka Chonlueng', 'រកាជន្លឹង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80313, 803, '{\"en\":\"Sanlung\",\"kh\":\"\\u179f\\u1793\\u17d2\\u179b\\u17bb\\u1784\"}', 'Sanlung', 'សន្លុង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80314, 803, '{\"en\":\"Sithor\",\"kh\":\"\\u179f\\u17ca\\u17b8\\u1792\\u179a\"}', 'Sithor', 'ស៊ីធរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80315, 803, '{\"en\":\"Svay Chrum\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u1787\\u17d2\\u179a\\u17c6\"}', 'Svay Chrum', 'ស្វាយជ្រំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80316, 803, '{\"en\":\"Svay Romiet\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u179a\\u1798\\u17c0\\u178f\"}', 'Svay Romiet', 'ស្វាយរមៀត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80317, 803, '{\"en\":\"Ta Aek\",\"kh\":\"\\u178f\\u17b6\\u17af\\u1780\"}', 'Ta Aek', 'តាឯក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80318, 803, '{\"en\":\"Vihear Suork\",\"kh\":\"\\u179c\\u17b7\\u17a0\\u17b6\\u179a\\u179f\\u17bd\\u1782\\u17cc\"}', 'Vihear Suork', 'វិហារសួគ៌', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80401, 804, '{\"en\":\"Chheu Kmau\",\"kh\":\"\\u1788\\u17be\\u1781\\u17d2\\u1798\\u17c5\"}', 'Chheu Kmau', 'ឈើខ្មៅ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80402, 804, '{\"en\":\"Chrouy Ta Kaev\",\"kh\":\"\\u1787\\u17d2\\u179a\\u17c4\\u1799\\u178f\\u17b6\\u1780\\u17c2\\u179c\"}', 'Chrouy Ta Kaev', 'ជ្រោយតាកែវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80403, 804, '{\"en\":\"Kampong Kong\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1780\\u17bb\\u1784\"}', 'Kampong Kong', 'កំពង់កុង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80404, 804, '{\"en\":\"Kaoh Thum Ka\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u1792\\u17c6 \\u2039\\u1780\\u203a\"}', 'Kaoh Thum Ka', 'កោះធំ ‹ក›', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80405, 804, '{\"en\":\"Kaoh Thum Kha\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u1792\\u17c6 \\u2039\\u1781\\u203a\"}', 'Kaoh Thum Kha', 'កោះធំ ‹ខ›', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80407, 804, '{\"en\":\"Leuk Daek\",\"kh\":\"\\u179b\\u17be\\u1780\\u178a\\u17c2\\u1780\"}', 'Leuk Daek', 'លើកដែក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80408, 804, '{\"en\":\"Pouthi Ban\",\"kh\":\"\\u1796\\u17c4\\u1792\\u17b7\\u17cd\\u1794\\u17b6\\u1793\"}', 'Pouthi Ban', 'ពោធិ៍បាន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80409, 804, '{\"en\":\"Prea\\u200bek Chrey\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1787\\u17d2\\u179a\\u17c3\"}', 'Prea​ek Chrey', 'ព្រែកជ្រៃ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80410, 804, '{\"en\":\"Preaek Sdei\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u179f\\u17d2\\u178a\\u17b8\"}', 'Preaek Sdei', 'ព្រែកស្ដី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80411, 804, '{\"en\":\"Preaek Thmei\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1790\\u17d2\\u1798\\u17b8\"}', 'Preaek Thmei', 'ព្រែកថ្មី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80412, 804, '{\"en\":\"Sampeou Poun\",\"kh\":\"\\u179f\\u17c6\\u1796\\u17c5\\u1796\\u17bc\\u1793\"}', 'Sampeou Poun', 'សំពៅពូន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80501, 805, '{\"en\":\"Kampong Phnum\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1797\\u17d2\\u1793\\u17c6\"}', 'Kampong Phnum', 'កំពង់ភ្នំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80502, 805, '{\"en\":\"K\'am Samnar\",\"kh\":\"\\u1780\\u17d2\\u17a2\\u1798\\u179f\\u17c6\\u178e\\u179a\"}', 'K\'am Samnar', 'ក្អមសំណរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80503, 805, '{\"en\":\"Khpob Ateav\",\"kh\":\"\\u1781\\u17d2\\u1796\\u1794\\u17a2\\u17b6\\u1791\\u17b6\\u179c\"}', 'Khpob Ateav', 'ខ្ពបអាទាវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80504, 805, '{\"en\":\"Peam Reang\",\"kh\":\"\\u1796\\u17b6\\u1798\\u179a\\u17b6\\u17c6\\u1784\"}', 'Peam Reang', 'ពាមរាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80505, 805, '{\"en\":\"Preaek Dach\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u178a\\u17b6\\u1785\\u17cb\"}', 'Preaek Dach', 'ព្រែកដាច់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80506, 805, '{\"en\":\"Preaek Tonloab\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1791\\u1793\\u17d2\\u179b\\u17b6\\u1794\\u17cb\"}', 'Preaek Tonloab', 'ព្រែកទន្លាប់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80507, 805, '{\"en\":\"Sandar\",\"kh\":\"\\u179f\\u178e\\u17d2\\u178a\\u17b6\\u179a\"}', 'Sandar', 'សណ្ដារ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80601, 806, '{\"en\":\"Akreiy Ksatr\",\"kh\":\"\\u17a2\\u179a\\u17b7\\u1799\\u1780\\u17d2\\u179f\\u178f\\u17d2\\u179a\"}', 'Akreiy Ksatr', 'អរិយក្សត្រ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80602, 806, '{\"en\":\"Barong\",\"kh\":\"\\u1794\\u17b6\\u179a\\u17bb\\u1784\"}', 'Barong', 'បារុង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80603, 806, '{\"en\":\"Boeng Krum\",\"kh\":\"\\u1794\\u17b9\\u1784\\u1782\\u17d2\\u179a\\u17c6\"}', 'Boeng Krum', 'បឹងគ្រំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80604, 806, '{\"en\":\"Kaoh Kaev\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u1780\\u17c2\\u179c\"}', 'Kaoh Kaev', 'កោះកែវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80605, 806, '{\"en\":\"Kaoh Reah\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u179a\\u17c7\"}', 'Kaoh Reah', 'កោះរះ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80606, 806, '{\"en\":\"Lvea Sar\",\"kh\":\"\\u179b\\u17d2\\u179c\\u17b6\\u179f\\u179a\"}', 'Lvea Sar', 'ល្វាសរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80607, 806, '{\"en\":\"Peam Oknha Ong\",\"kh\":\"\\u1796\\u17b6\\u1798\\u17a7\\u1780\\u1789\\u17c9\\u17b6\\u17a2\\u17bb\\u1784\"}', 'Peam Oknha Ong', 'ពាមឧកញ៉ាអុង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80608, 806, '{\"en\":\"Phum Thum\",\"kh\":\"\\u1797\\u17bc\\u1798\\u17b7\\u1792\\u17c6\"}', 'Phum Thum', 'ភូមិធំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80609, 806, '{\"en\":\"Preaek Kmeng\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1780\\u17d2\\u1798\\u17c1\\u1784\"}', 'Preaek Kmeng', 'ព្រែកក្មេង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80610, 806, '{\"en\":\"Preaek Rey\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u179a\\u17c3\"}', 'Preaek Rey', 'ព្រែករៃ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80611, 806, '{\"en\":\"Preaek Ruessei\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u17ab\\u179f\\u17d2\\u179f\\u17b8\"}', 'Preaek Ruessei', 'ព្រែកឫស្សី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80612, 806, '{\"en\":\"Sambuor\",\"kh\":\"\\u179f\\u17c6\\u1794\\u17bd\\u179a\"}', 'Sambuor', 'សំបួរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80613, 806, '{\"en\":\"Sarikakaev\",\"kh\":\"\\u179f\\u17b6\\u179a\\u17b7\\u1780\\u17b6\\u1780\\u17c2\\u179c\"}', 'Sarikakaev', 'សារិកាកែវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80614, 806, '{\"en\":\"Thma Kor\",\"kh\":\"\\u1790\\u17d2\\u1798\\u1782\\u179a\"}', 'Thma Kor', 'ថ្មគរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80615, 806, '{\"en\":\"Tuek Khleang\",\"kh\":\"\\u1791\\u17b9\\u1780\\u1783\\u17d2\\u179b\\u17b6\\u17c6\\u1784\"}', 'Tuek Khleang', 'ទឹកឃ្លាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80703, 807, '{\"en\":\"Preaek Anhchanh\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u17a2\\u1789\\u17d2\\u1785\\u17b6\\u1789\"}', 'Preaek Anhchanh', 'ព្រែកអញ្ចាញ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80704, 807, '{\"en\":\"Preaek Dambang\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u178a\\u17c6\\u1794\\u1784\"}', 'Preaek Dambang', 'ព្រែកដំបង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80707, 807, '{\"en\":\"Roka Kong Ti Muoy\",\"kh\":\"\\u179a\\u1780\\u17b6\\u1780\\u17c4\\u1784 \\u1791\\u17b8 \\u17e1\"}', 'Roka Kong Ti Muoy', 'រកាកោង ទី ១', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80708, 807, '{\"en\":\"Roka Kong Ti Pir\",\"kh\":\"\\u179a\\u1780\\u17b6\\u1780\\u17c4\\u1784 \\u1791\\u17b8 \\u17e2\"}', 'Roka Kong Ti Pir', 'រកាកោង ទី ២', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80709, 807, '{\"en\":\"Ruessei Chrouy\",\"kh\":\"\\u17ab\\u179f\\u17d2\\u179f\\u17b8\\u1787\\u17d2\\u179a\\u17c4\\u1799\"}', 'Ruessei Chrouy', 'ឫស្សីជ្រោយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80710, 807, '{\"en\":\"Sambuor Meas\",\"kh\":\"\\u179f\\u17c6\\u1794\\u17bd\\u179a\\u1798\\u17b6\\u179f\"}', 'Sambuor Meas', 'សំបួរមាស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80711, 807, '{\"en\":\"Svay Ampear\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u17a2\\u17c6\\u1796\\u17b6\\u179a\"}', 'Svay Ampear', 'ស្វាយអំពារ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80801, 808, '{\"en\":\"Baek Chan\",\"kh\":\"\\u1794\\u17c2\\u1780\\u1785\\u17b6\\u1793\"}', 'Baek Chan', 'បែកចាន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80803, 808, '{\"en\":\"Chhak Chheu Neang\",\"kh\":\"\\u1786\\u1780\\u17cb\\u1788\\u17be\\u1793\\u17b6\\u1784\"}', 'Chhak Chheu Neang', 'ឆក់ឈើនាង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80804, 808, '{\"en\":\"Damnak Ampil\",\"kh\":\"\\u178a\\u17c6\\u178e\\u17b6\\u1780\\u17cb\\u17a2\\u17c6\\u1796\\u17b7\\u179b\"}', 'Damnak Ampil', 'ដំណាក់អំពិល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80807, 808, '{\"en\":\"Krang Mkak\",\"kh\":\"\\u1780\\u17d2\\u179a\\u17b6\\u17c6\\u1784\\u1798\\u17d2\\u1780\\u17b6\\u1780\\u17cb\"}', 'Krang Mkak', 'ក្រាំងម្កាក់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80808, 808, '{\"en\":\"Lumhach\",\"kh\":\"\\u179b\\u17c6\\u17a0\\u17b6\\u1785\"}', 'Lumhach', 'លំហាច', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80809, 808, '{\"en\":\"Mkak\",\"kh\":\"\\u1798\\u17d2\\u1780\\u17b6\\u1780\\u17cb\"}', 'Mkak', 'ម្កាក់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80811, 808, '{\"en\":\"Peuk\",\"kh\":\"\\u1796\\u17be\\u1780\"}', 'Peuk', 'ពើក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80813, 808, '{\"en\":\"Prey Puoch\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1796\\u17bd\\u1785\"}', 'Prey Puoch', 'ព្រៃពួច', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80814, 808, '{\"en\":\"Samraong Leu\",\"kh\":\"\\u179f\\u17c6\\u179a\\u17c4\\u1784\\u179b\\u17be\"}', 'Samraong Leu', 'សំរោងលើ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80816, 808, '{\"en\":\"Tuol Prech\",\"kh\":\"\\u1791\\u17bd\\u179b\\u1796\\u17d2\\u179a\\u17c1\\u1787\"}', 'Tuol Prech', 'ទួលព្រេជ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80901, 809, '{\"en\":\"Chhveang\",\"kh\":\"\\u1788\\u17d2\\u179c\\u17b6\\u17c6\\u1784\"}', 'Chhveang', 'ឈ្វាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80902, 809, '{\"en\":\"Chrey Loas\",\"kh\":\"\\u1787\\u17d2\\u179a\\u17c3\\u179b\\u17b6\\u179f\\u17cb\"}', 'Chrey Loas', 'ជ្រៃលាស់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80903, 809, '{\"en\":\"Kampong Luong\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u17a0\\u17d2\\u179b\\u17bd\\u1784\"}', 'Kampong Luong', 'កំពង់ហ្លួង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80904, 809, '{\"en\":\"Kampong Os\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u17a2\\u17bb\\u179f\"}', 'Kampong Os', 'កំពង់អុស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80905, 809, '{\"en\":\"Kaoh Chen\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u1785\\u17b7\\u1793\"}', 'Kaoh Chen', 'កោះចិន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80906, 809, '{\"en\":\"Phnum Bat\",\"kh\":\"\\u1797\\u17d2\\u1793\\u17c6\\u1794\\u17b6\\u178f\"}', 'Phnum Bat', 'ភ្នំបាត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80907, 809, '{\"en\":\"Ponhea Lueu\",\"kh\":\"\\u1796\\u1789\\u17b6\\u17ae\"}', 'Ponhea Lueu', 'ពញាឮ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80910, 809, '{\"en\":\"Preaek Ta Teaen\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u178f\\u17b6\\u1791\\u17c2\\u1793\"}', 'Preaek Ta Teaen', 'ព្រែកតាទែន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80911, 809, '{\"en\":\"Phsar Daek\",\"kh\":\"\\u1795\\u17d2\\u179f\\u17b6\\u179a\\u178a\\u17c2\\u1780\"}', 'Phsar Daek', 'ផ្សារដែក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80913, 809, '{\"en\":\"Tumnob Thum\",\"kh\":\"\\u1791\\u17c6\\u1793\\u1794\\u17cb\\u1792\\u17c6\"}', 'Tumnob Thum', 'ទំនប់ធំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(80914, 809, '{\"en\":\"Vihear Luong\",\"kh\":\"\\u179c\\u17b7\\u17a0\\u17b6\\u179a\\u17a0\\u17d2\\u179b\\u17bd\\u1784\"}', 'Vihear Luong', 'វិហារហ្លួង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(81001, 810, '{\"en\":\"Khpob\",\"kh\":\"\\u1781\\u17d2\\u1796\\u1794\"}', 'Khpob', 'ខ្ពប', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(81003, 810, '{\"en\":\"Kaoh Khael\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u1781\\u17c2\\u179b\"}', 'Kaoh Khael', 'កោះខែល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(81004, 810, '{\"en\":\"Kaoh Khsach Tonlea\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u1781\\u17d2\\u179f\\u17b6\\u1785\\u17cb\\u1791\\u1793\\u17d2\\u179b\\u17b6\"}', 'Kaoh Khsach Tonlea', 'កោះខ្សាច់ទន្លា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(81005, 810, '{\"en\":\"Krang Yov\",\"kh\":\"\\u1780\\u17d2\\u179a\\u17b6\\u17c6\\u1784\\u1799\\u17c9\\u17bc\\u179c\"}', 'Krang Yov', 'ក្រាំងយ៉ូវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(81006, 810, '{\"en\":\"Prasat\",\"kh\":\"\\u1794\\u17d2\\u179a\\u17b6\\u179f\\u17b6\\u1791\"}', 'Prasat', 'ប្រាសាទ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(81007, 810, '{\"en\":\"Preaek Ambel\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u17a2\\u17c6\\u1794\\u17b7\\u179b\"}', 'Preaek Ambel', 'ព្រែកអំបិល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(81008, 810, '{\"en\":\"Preaek Koy\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1782\\u1799\"}', 'Preaek Koy', 'ព្រែកគយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(81010, 810, '{\"en\":\"S\'ang Phnum\",\"kh\":\"\\u179f\\u17d2\\u17a2\\u17b6\\u1784\\u1797\\u17d2\\u1793\\u17c6\"}', 'S\'ang Phnum', 'ស្អាងភ្នំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(81012, 810, '{\"en\":\"Svay Prateal\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u1794\\u17d2\\u179a\\u1791\\u17b6\\u179b\"}', 'Svay Prateal', 'ស្វាយប្រទាល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(81014, 810, '{\"en\":\"Ta Lon\",\"kh\":\"\\u178f\\u17b6\\u179b\\u1793\\u17cb\"}', 'Ta Lon', 'តាលន់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(81015, 810, '{\"en\":\"Traeuy Sla\",\"kh\":\"\\u178f\\u17d2\\u179a\\u17be\\u1799\\u179f\\u17d2\\u179b\\u17b6\"}', 'Traeuy Sla', 'ត្រើយស្លា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(81016, 810, '{\"en\":\"Tuek Vil\",\"kh\":\"\\u1791\\u17b9\\u1780\\u179c\\u17b7\\u179b\"}', 'Tuek Vil', 'ទឹកវិល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(81101, 811, '{\"en\":\"Ta Kdol\",\"kh\":\"\\u178f\\u17b6\\u1780\\u17d2\\u178a\\u17bb\\u179b\"}', 'Ta Kdol', 'តាក្ដុល', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(81102, 811, '{\"en\":\"Prek Ruessey\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u17ab\\u179f\\u17d2\\u179f\\u17b8\"}', 'Prek Ruessey', 'ព្រែកឫស្សី', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(81103, 811, '{\"en\":\"Doeum Mien\",\"kh\":\"\\u178a\\u17be\\u1798\\u1798\\u17c0\\u1793\"}', 'Doeum Mien', 'ដើមមៀន', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(81104, 811, '{\"en\":\"Ta Khmao\",\"kh\":\"\\u178f\\u17b6\\u1781\\u17d2\\u1798\\u17c5\"}', 'Ta Khmao', 'តាខ្មៅ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(81105, 811, '{\"en\":\"Prek Ho\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u17a0\\u17bc\\u179a\"}', 'Prek Ho', 'ព្រែកហូរ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(81106, 811, '{\"en\":\"Kampong Samnanh\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u179f\\u17c6\\u178e\\u17b6\\u1789\\u17cb\"}', 'Kampong Samnanh', 'កំពង់សំណាញ់', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(81107, 811, '{\"en\":\"Svay Rolum\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u179a\\u179b\\u17c6\"}', 'Svay Rolum', 'ស្វាយរលំ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(81108, 811, '{\"en\":\"Kaoh Anlong Chen\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u17a2\\u1793\\u17d2\\u179b\\u1784\\u17cb\\u1785\\u17b7\\u1793\"}', 'Kaoh Anlong Chen', 'កោះអន្លង់ចិន', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(81109, 811, '{\"en\":\"Setbou\",\"kh\":\"\\u179f\\u17b7\\u178f\\u17d2\\u1794\\u17bc\"}', 'Setbou', 'សិត្បូ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(81110, 811, '{\"en\":\"Roka Khpos\",\"kh\":\"\\u179a\\u1780\\u17b6\\u1781\\u17d2\\u1796\\u179f\\u17cb\"}', 'Roka Khpos', 'រកាខ្ពស់', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(90101, 901, '{\"en\":\"Andoung Tuek\",\"kh\":\"\\u17a2\\u178e\\u17d2\\u178a\\u17bc\\u1784\\u1791\\u17b9\\u1780\"}', 'Andoung Tuek', 'អណ្ដូងទឹក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(90102, 901, '{\"en\":\"Kandaol\",\"kh\":\"\\u1780\\u178e\\u17d2\\u178a\\u17c4\\u179b\"}', 'Kandaol', 'កណ្ដោល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(90103, 901, '{\"en\":\"Ta Noun\",\"kh\":\"\\u178f\\u17b6\\u1793\\u17bc\\u1793\"}', 'Ta Noun', 'តានូន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(90104, 901, '{\"en\":\"Thma Sa\",\"kh\":\"\\u1790\\u17d2\\u1798\\u179f\"}', 'Thma Sa', 'ថ្មស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(90201, 902, '{\"en\":\"Kaoh Sdach\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u179f\\u17d2\\u178a\\u17c1\\u1785\"}', 'Kaoh Sdach', 'កោះស្ដេច', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(90202, 902, '{\"en\":\"Phnhi Meas\",\"kh\":\"\\u1797\\u17d2\\u1789\\u17b8\\u1798\\u17b6\\u179f\"}', 'Phnhi Meas', 'ភ្ញីមាស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(90203, 902, '{\"en\":\"Preaek Khsach\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1781\\u17d2\\u179f\\u17b6\\u1785\\u17cb\"}', 'Preaek Khsach', 'ព្រែកខ្សាច់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(90301, 903, '{\"en\":\"Chrouy Pras\",\"kh\":\"\\u1787\\u17d2\\u179a\\u17c4\\u1799\\u1794\\u17d2\\u179a\\u179f\\u17cb\"}', 'Chrouy Pras', 'ជ្រោយប្រស់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(90302, 903, '{\"en\":\"Kaoh Kapi\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u1780\\u17b6\\u1796\\u17b7\"}', 'Kaoh Kapi', 'កោះកាពិ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(90303, 903, '{\"en\":\"Ta Tai Kraom\",\"kh\":\"\\u178f\\u17b6\\u178f\\u17c3\\u1780\\u17d2\\u179a\\u17c4\\u1798\"}', 'Ta Tai Kraom', 'តាតៃក្រោម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(90304, 903, '{\"en\":\"Trapeang Rung\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u179a\\u17bc\\u1784\"}', 'Trapeang Rung', 'ត្រពាំងរូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(90401, 904, '{\"en\":\"Smach Mean Chey\",\"kh\":\"\\u179f\\u17d2\\u1798\\u17b6\\u1785\\u17cb\\u1798\\u17b6\\u1793\\u1787\\u17d0\\u1799\"}', 'Smach Mean Chey', 'ស្មាច់មានជ័យ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(90402, 904, '{\"en\":\"Dang Tong\",\"kh\":\"\\u178a\\u1784\\u1791\\u1784\\u17cb\"}', 'Dang Tong', 'ដងទង់', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(90403, 904, '{\"en\":\"Stueng Veaeng\",\"kh\":\"\\u179f\\u17d2\\u1791\\u17b9\\u1784\\u179c\\u17c2\\u1784\"}', 'Stueng Veaeng', 'ស្ទឹងវែង', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(90501, 905, '{\"en\":\"Pak Khlang\",\"kh\":\"\\u1794\\u17c9\\u17b6\\u1780\\u17cb\\u1781\\u17d2\\u179b\\u1784\"}', 'Pak Khlang', 'ប៉ាក់ខ្លង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(90502, 905, '{\"en\":\"Peam Krasaob\",\"kh\":\"\\u1796\\u17b6\\u1798\\u1780\\u17d2\\u179a\\u179f\\u17c4\\u1794\"}', 'Peam Krasaob', 'ពាមក្រសោប', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(90503, 905, '{\"en\":\"Tuol Kokir\",\"kh\":\"\\u1791\\u17bd\\u179b\\u1782\\u1782\\u17b8\\u179a\"}', 'Tuol Kokir', 'ទួលគគីរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(90601, 906, '{\"en\":\"Boeng Preav\",\"kh\":\"\\u1794\\u17b9\\u1784\\u1796\\u17d2\\u179a\\u17b6\\u179c\"}', 'Boeng Preav', 'បឹងព្រាវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(90602, 906, '{\"en\":\"Chi Kha Kraom\",\"kh\":\"\\u1787\\u17b8 \\u1781 \\u1780\\u17d2\\u179a\\u17c4\\u1798\"}', 'Chi Kha Kraom', 'ជី ខ ក្រោម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(90603, 906, '{\"en\":\"Chi kha Leu\",\"kh\":\"\\u1787\\u17b8 \\u1781 \\u179b\\u17be\"}', 'Chi kha Leu', 'ជី ខ លើ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(90604, 906, '{\"en\":\"Chrouy Svay\",\"kh\":\"\\u1787\\u17d2\\u179a\\u17c4\\u1799\\u179f\\u17d2\\u179c\\u17b6\\u1799\"}', 'Chrouy Svay', 'ជ្រោយស្វាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(90605, 906, '{\"en\":\"Dang Peaeng\",\"kh\":\"\\u178a\\u1784\\u1796\\u17c2\\u1784\"}', 'Dang Peaeng', 'ដងពែង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(90606, 906, '{\"en\":\"Srae Ambel\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17c2\\u17a2\\u17c6\\u1794\\u17b7\\u179b\"}', 'Srae Ambel', 'ស្រែអំបិល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(90701, 907, '{\"en\":\"Ta Tey Leu\",\"kh\":\"\\u178f\\u17b6\\u1791\\u17c3\\u179b\\u17be\"}', 'Ta Tey Leu', 'តាទៃលើ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(90702, 907, '{\"en\":\"Pralay\",\"kh\":\"\\u1794\\u17d2\\u179a\\u17a1\\u17b6\\u1799\"}', 'Pralay', 'ប្រឡាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(90703, 907, '{\"en\":\"Chumnoab\",\"kh\":\"\\u1787\\u17c6\\u1793\\u17b6\\u1794\\u17cb\"}', 'Chumnoab', 'ជំនាប់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(90704, 907, '{\"en\":\"Ruessei Chrum\",\"kh\":\"\\u17ab\\u179f\\u17d2\\u179f\\u17b8\\u1787\\u17d2\\u179a\\u17bb\\u17c6\"}', 'Ruessei Chrum', 'ឫស្សីជ្រុំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(90705, 907, '{\"en\":\"Chi Phat\",\"kh\":\"\\u1787\\u17b8\\u1795\\u17b6\\u178f\"}', 'Chi Phat', 'ជីផាត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(90706, 907, '{\"en\":\"Thma Doun Pov\",\"kh\":\"\\u1790\\u17d2\\u1798\\u178a\\u17bc\\u1793\\u1796\\u17c5\"}', 'Thma Doun Pov', 'ថ្មដូនពៅ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100101, 1001, '{\"en\":\"Chhloung\",\"kh\":\"\\u1786\\u17d2\\u179b\\u17bc\\u1784\"}', 'Chhloung', 'ឆ្លូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100102, 1001, '{\"en\":\"Damrei Phong\",\"kh\":\"\\u178a\\u17c6\\u179a\\u17b8\\u1795\\u17bb\\u1784\"}', 'Damrei Phong', 'ដំរីផុង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100103, 1001, '{\"en\":\"Han Chey\",\"kh\":\"\\u17a0\\u17b6\\u1793\\u17cb\\u1787\\u17d0\\u1799\"}', 'Han Chey', 'ហាន់ជ័យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100104, 1001, '{\"en\":\"Kampong Damrei\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u178a\\u17c6\\u179a\\u17b8\"}', 'Kampong Damrei', 'កំពង់ដំរី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100105, 1001, '{\"en\":\"Kanhchor\",\"kh\":\"\\u1780\\u1789\\u17d2\\u1787\\u179a\"}', 'Kanhchor', 'កញ្ជរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100106, 1001, '{\"en\":\"Khsach Andeth\",\"kh\":\"\\u1781\\u17d2\\u179f\\u17b6\\u1785\\u17cb\\u17a2\\u178e\\u17d2\\u178a\\u17c2\\u178f\"}', 'Khsach Andeth', 'ខ្សាច់អណ្ដែត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100107, 1001, '{\"en\":\"Pongro\",\"kh\":\"\\u1796\\u1784\\u17d2\\u179a\"}', 'Pongro', 'ពង្រ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100108, 1001, '{\"en\":\"Preaek Saman\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u179f\\u17b6\\u1798\\u17c9\\u17b6\\u1793\\u17cb\"}', 'Preaek Saman', 'ព្រែកសាម៉ាន់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100207, 1002, '{\"en\":\"Kaoh Trong\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u1791\\u17d2\\u179a\\u1784\\u17cb\"}', 'Kaoh Trong', 'កោះទ្រង់', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(100208, 1002, '{\"en\":\"Krakor\",\"kh\":\"\\u1780\\u17d2\\u179a\\u1782\\u179a\"}', 'Krakor', 'ក្រគរ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(100209, 1002, '{\"en\":\"Kracheh\",\"kh\":\"\\u1780\\u17d2\\u179a\\u1785\\u17c1\\u17c7\"}', 'Kracheh', 'ក្រចេះ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(100210, 1002, '{\"en\":\"Ou Ruessei\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u17ab\\u179f\\u17d2\\u179f\\u17b8\"}', 'Ou Ruessei', 'អូរឫស្សី', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(100211, 1002, '{\"en\":\"Roka Kandal\",\"kh\":\"\\u179a\\u1780\\u17b6\\u1780\\u178e\\u17d2\\u178a\\u17b6\\u179b\"}', 'Roka Kandal', 'រកាកណ្ដាល', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(100301, 1003, '{\"en\":\"Chamb\\u00e2k\",\"kh\":\"\\u1785\\u17c6\\u1794\\u1780\\u17cb\"}', 'Chambâk', 'ចំបក់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100302, 1003, '{\"en\":\"Chrouy Banteay\",\"kh\":\"\\u1787\\u17d2\\u179a\\u17c4\\u1799\\u1794\\u1793\\u17d2\\u1791\\u17b6\\u1799\"}', 'Chrouy Banteay', 'ជ្រោយបន្ទាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100303, 1003, '{\"en\":\"Kampong Kor\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1782\\u179a\"}', 'Kampong Kor', 'កំពង់គរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100304, 1003, '{\"en\":\"Koh Ta Suy\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u178f\\u17b6\\u179f\\u17ca\\u17bb\\u1799\"}', 'Koh Ta Suy', 'កោះតាស៊ុយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100305, 1003, '{\"en\":\"Preaek Prasab\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1794\\u17d2\\u179a\\u179f\\u1796\\u17d2\\u179c\"}', 'Preaek Prasab', 'ព្រែកប្រសព្វ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100306, 1003, '{\"en\":\"Russey Keo\",\"kh\":\"\\u17ab\\u179f\\u17d2\\u179f\\u17b8\\u1780\\u17c2\\u179c\"}', 'Russey Keo', 'ឫស្សីកែវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100307, 1003, '{\"en\":\"Saob\",\"kh\":\"\\u179f\\u17c4\\u1794\"}', 'Saob', 'សោប', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100308, 1003, '{\"en\":\"Ta Mao\",\"kh\":\"\\u178f\\u17b6\\u1798\\u17c9\\u17c5\"}', 'Ta Mao', 'តាម៉ៅ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100401, 1004, '{\"en\":\"Boeng Char\",\"kh\":\"\\u1794\\u17b9\\u1784\\u1785\\u17b6\\u179a\"}', 'Boeng Char', 'បឹងចារ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100402, 1004, '{\"en\":\"Kampong Cham\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1785\\u17b6\\u1798\"}', 'Kampong Cham', 'កំពង់ចាម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100403, 1004, '{\"en\":\"Kbal Damrei\",\"kh\":\"\\u1780\\u17d2\\u1794\\u17b6\\u179b\\u178a\\u17c6\\u179a\\u17b8\"}', 'Kbal Damrei', 'ក្បាលដំរី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100404, 1004, '{\"en\":\"Kaoh Khnhaer\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u1781\\u17d2\\u1789\\u17c2\\u179a\"}', 'Kaoh Khnhaer', 'កោះខ្ញែរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100405, 1004, '{\"en\":\"Ou Krieng\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u1782\\u17d2\\u179a\\u17c0\\u1784\"}', 'Ou Krieng', 'អូរគ្រៀង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100406, 1004, '{\"en\":\"Roluos Mean Chey\",\"kh\":\"\\u179a\\u179b\\u17bd\\u179f\\u1798\\u17b6\\u1793\\u1787\\u17d0\\u1799\"}', 'Roluos Mean Chey', 'រលួសមានជ័យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100407, 1004, '{\"en\":\"Sambour\",\"kh\":\"\\u179f\\u17c6\\u1794\\u17bc\\u179a\"}', 'Sambour', 'សំបូរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100408, 1004, '{\"en\":\"Sandan\",\"kh\":\"\\u179f\\u178e\\u17d2\\u178a\\u17b6\\u1793\\u17cb\"}', 'Sandan', 'សណ្ដាន់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100409, 1004, '{\"en\":\"Srae Chis\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17c2\\u1787\\u17b7\\u17c7\"}', 'Srae Chis', 'ស្រែជិះ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100410, 1004, '{\"en\":\"Voadthonak\",\"kh\":\"\\u179c\\u178c\\u17d2\\u178d\\u1793\\u17c8\"}', 'Voadthonak', 'វឌ្ឍនៈ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100411, 1004, '{\"en\":\"Oukondear Senchey\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u1780\\u178e\\u17d2\\u178f\\u17c0\\u179a\\u179f\\u17c2\\u1793\\u1787\\u17d0\\u1799\"}', 'Oukondear Senchey', 'អូរកណ្តៀរសែនជ័យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100501, 1005, '{\"en\":\"Khsuem\",\"kh\":\"\\u1783\\u17d2\\u179f\\u17b9\\u1798\"}', 'Khsuem', 'ឃ្សឹម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100502, 1005, '{\"en\":\"Pir Thnu\",\"kh\":\"\\u1796\\u17b8\\u179a\\u1792\\u17d2\\u1793\\u17bc\"}', 'Pir Thnu', 'ពីរធ្នូ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100503, 1005, '{\"en\":\"Snuol\",\"kh\":\"\\u179f\\u17d2\\u1793\\u17bd\\u179b\"}', 'Snuol', 'ស្នួល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100504, 1005, '{\"en\":\"Srae Char\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17c2\\u1785\\u17b6\\u179a\"}', 'Srae Char', 'ស្រែចារ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100505, 1005, '{\"en\":\"Svay Chreah\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u1787\\u17d2\\u179a\\u17c7\"}', 'Svay Chreah', 'ស្វាយជ្រះ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100506, 1005, '{\"en\":\"Kronhoung Saen Chey\",\"kh\":\"\\u1782\\u17d2\\u179a\\u1789\\u17bc\\u1784\\u179f\\u17c2\\u1793\\u1787\\u17d0\\u1799\"}', 'Kronhoung Saen Chey', 'គ្រញូងសែនជ័យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100601, 1006, '{\"en\":\"Bos Leav\",\"kh\":\"\\u1794\\u17bb\\u179f\\u179b\\u17b6\\u179c\"}', 'Bos Leav', 'បុសលាវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100602, 1006, '{\"en\":\"Changkrang\",\"kh\":\"\\u1785\\u1784\\u17d2\\u1780\\u17d2\\u179a\\u1784\\u17cb\"}', 'Changkrang', 'ចង្ក្រង់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100603, 1006, '{\"en\":\"Dar\",\"kh\":\"\\u178a\\u17b6\\u179a\"}', 'Dar', 'ដារ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100604, 1006, '{\"en\":\"Kantuot\",\"kh\":\"\\u1780\\u1793\\u17d2\\u1791\\u17bd\\u178f\"}', 'Kantuot', 'កន្ទួត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100605, 1006, '{\"en\":\"Kou Loab\",\"kh\":\"\\u1782\\u17c4\\u179b\\u17b6\\u1794\\u17cb\"}', 'Kou Loab', 'គោលាប់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100606, 1006, '{\"en\":\"Kaoh Chraeng\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u1785\\u17d2\\u179a\\u17c2\\u1784\"}', 'Kaoh Chraeng', 'កោះច្រែង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100607, 1006, '{\"en\":\"Sambok\",\"kh\":\"\\u179f\\u17c6\\u1794\\u17bb\\u1780\"}', 'Sambok', 'សំបុក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100608, 1006, '{\"en\":\"Thma Andaeuk\",\"kh\":\"\\u1790\\u17d2\\u1798\\u17a2\\u178e\\u17d2\\u178a\\u17be\\u1780\"}', 'Thma Andaeuk', 'ថ្មអណ្ដើក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100609, 1006, '{\"en\":\"Thma Kreae\",\"kh\":\"\\u1790\\u17d2\\u1798\\u1782\\u17d2\\u179a\\u17c2\"}', 'Thma Kreae', 'ថ្មគ្រែ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(100610, 1006, '{\"en\":\"Thmei\",\"kh\":\"\\u1790\\u17d2\\u1798\\u17b8\"}', 'Thmei', 'ថ្មី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(110101, 1101, '{\"en\":\"Chong Phlah\",\"kh\":\"\\u1785\\u17bb\\u1784\\u1795\\u17d2\\u179b\\u17b6\\u179f\\u17cb\"}', 'Chong Phlah', 'ចុងផ្លាស់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(110102, 1101, '{\"en\":\"Memang\",\"kh\":\"\\u1798\\u17c1\\u1798\\u17c9\\u1784\\u17cb\"}', 'Memang', 'មេម៉ង់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(110103, 1101, '{\"en\":\"Srae Chhuk\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17c2\\u1788\\u17bc\\u1780\"}', 'Srae Chhuk', 'ស្រែឈូក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(110104, 1101, '{\"en\":\"Srae Khtum\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17c2\\u1781\\u17d2\\u1791\\u17bb\\u1798\"}', 'Srae Khtum', 'ស្រែខ្ទុម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(110105, 1101, '{\"en\":\"Srae Preah\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17c2\\u1796\\u17d2\\u179a\\u17c7\"}', 'Srae Preah', 'ស្រែព្រះ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(110201, 1102, '{\"en\":\"Nang Khi Lik\",\"kh\":\"\\u178e\\u1784\\u1783\\u17b8\\u179b\\u17b7\\u1780\"}', 'Nang Khi Lik', 'ណងឃីលិក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(110202, 1102, '{\"en\":\"A Buon Leu\",\"kh\":\"\\u17a2 \\u1794\\u17bd\\u1793\\u179b\\u17be\"}', 'A Buon Leu', 'អ បួនលើ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(110203, 1102, '{\"en\":\"Roya\",\"kh\":\"\\u179a\\u1799\\u17c9\"}', 'Roya', 'រយ៉', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(110204, 1102, '{\"en\":\"Sokh Sant\",\"kh\":\"\\u179f\\u17bb\\u1781\\u179f\\u17b6\\u1793\\u17d2\\u178a\"}', 'Sokh Sant', 'សុខសាន្ដ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(110205, 1102, '{\"en\":\"Srae Huy\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17c2\\u17a0\\u17ca\\u17bb\\u1799\"}', 'Srae Huy', 'ស្រែហ៊ុយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(110206, 1102, '{\"en\":\"Srae Sangkum\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17c2\\u179f\\u1784\\u17d2\\u1782\\u1798\"}', 'Srae Sangkum', 'ស្រែសង្គម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(110301, 1103, '{\"en\":\"Dak Dam\",\"kh\":\"\\u178a\\u17b6\\u1780\\u17cb\\u178a\\u17b6\\u17c6\"}', 'Dak Dam', 'ដាក់ដាំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(110302, 1103, '{\"en\":\"Saen Monourom\",\"kh\":\"\\u179f\\u17c2\\u1793\\u1798\\u1793\\u17c4\\u179a\\u1798\\u17d2\\u1799\"}', 'Saen Monourom', 'សែនមនោរម្យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(110401, 1104, '{\"en\":\"Krang Teh\",\"kh\":\"\\u1780\\u17d2\\u179a\\u1784\\u17cb\\u178f\\u17c1\\u17c7\"}', 'Krang Teh', 'ក្រង់តេះ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(110402, 1104, '{\"en\":\"Pu Chrey\",\"kh\":\"\\u1796\\u17bc\\u1787\\u17d2\\u179a\\u17c3\"}', 'Pu Chrey', 'ពូជ្រៃ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(110403, 1104, '{\"en\":\"Srae Ampum\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17c2\\u17a2\\u17c6\\u1796\\u17bc\\u1798\"}', 'Srae Ampum', 'ស្រែអំពូម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(110404, 1104, '{\"en\":\"Bu Sra\",\"kh\":\"\\u1794\\u17ca\\u17bc\\u179f\\u17d2\\u179a\\u17b6\"}', 'Bu Sra', 'ប៊ូស្រា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(110501, 1105, '{\"en\":\"Monourom\",\"kh\":\"\\u1798\\u1793\\u17c4\\u179a\\u1798\\u17d2\\u1799\"}', 'Monourom', 'មនោរម្យ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(110502, 1105, '{\"en\":\"Sokh Dom\",\"kh\":\"\\u179f\\u17bb\\u1781\\u178a\\u17bb\\u1798\"}', 'Sokh Dom', 'សុខដុម', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(110503, 1105, '{\"en\":\"Spean Mean Chey\",\"kh\":\"\\u179f\\u17d2\\u1796\\u17b6\\u1793\\u1798\\u17b6\\u1793\\u1787\\u17d0\\u1799\"}', 'Spean Mean Chey', 'ស្ពានមានជ័យ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(110504, 1105, '{\"en\":\"Romonea\",\"kh\":\"\\u179a\\u1798\\u1793\\u17b6\"}', 'Romonea', 'រមនា', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120101, 1201, '{\"en\":\"Tonle Basak\",\"kh\":\"\\u1791\\u1793\\u17d2\\u179b\\u17c1\\u1794\\u17b6\\u179f\\u17b6\\u1780\\u17cb\"}', 'Tonle Basak', 'ទន្លេបាសាក់', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120109, 1201, '{\"en\":\"Tuol Tumpung Ti Pir\",\"kh\":\"\\u1791\\u17bd\\u179b\\u1791\\u17c6\\u1796\\u17bc\\u1784\\u1791\\u17b8 \\u17e2\"}', 'Tuol Tumpung Ti Pir', 'ទួលទំពូងទី ២', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120110, 1201, '{\"en\":\"Tuol Tumpung Ti Muoy\",\"kh\":\"\\u1791\\u17bd\\u179b\\u1791\\u17c6\\u1796\\u17bc\\u1784\\u1791\\u17b8 \\u17e1\"}', 'Tuol Tumpung Ti Muoy', 'ទួលទំពូងទី ១', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120111, 1201, '{\"en\":\"Boeng Trabaek\",\"kh\":\"\\u1794\\u17b9\\u1784\\u178f\\u17d2\\u179a\\u1794\\u17c2\\u1780\"}', 'Boeng Trabaek', 'បឹងត្របែក', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120112, 1201, '{\"en\":\"Phsar Daeum Thkov\",\"kh\":\"\\u1795\\u17d2\\u179f\\u17b6\\u179a\\u178a\\u17be\\u1798\\u1790\\u17d2\\u1780\\u17bc\\u179c\"}', 'Phsar Daeum Thkov', 'ផ្សារដើមថ្កូវ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120201, 1202, '{\"en\":\"Phsar Thmei Ti Muoy\",\"kh\":\"\\u1795\\u17d2\\u179f\\u17b6\\u179a\\u1790\\u17d2\\u1798\\u17b8\\u1791\\u17b8 \\u17e1\"}', 'Phsar Thmei Ti Muoy', 'ផ្សារថ្មីទី ១', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120202, 1202, '{\"en\":\"Phsar Thmei Ti Pir\",\"kh\":\"\\u1795\\u17d2\\u179f\\u17b6\\u179a\\u1790\\u17d2\\u1798\\u17b8\\u1791\\u17b8 \\u17e2\"}', 'Phsar Thmei Ti Pir', 'ផ្សារថ្មីទី ២', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120203, 1202, '{\"en\":\"Phsar Thmei Ti Bei\",\"kh\":\"\\u1795\\u17d2\\u179f\\u17b6\\u179a\\u1790\\u17d2\\u1798\\u17b8\\u1791\\u17b8 \\u17e3\"}', 'Phsar Thmei Ti Bei', 'ផ្សារថ្មីទី ៣', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120204, 1202, '{\"en\":\"Boeng Reang\",\"kh\":\"\\u1794\\u17b9\\u1784\\u179a\\u17b6\\u17c6\\u1784\"}', 'Boeng Reang', 'បឹងរាំង', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120205, 1202, '{\"en\":\"Phsar Kandal Ti Muoy\",\"kh\":\"\\u1795\\u17d2\\u179f\\u17b6\\u179a\\u1780\\u178e\\u17d2\\u178a\\u17b6\\u179b\\u1791\\u17b8\\u17e1\"}', 'Phsar Kandal Ti Muoy', 'ផ្សារកណ្ដាលទី១', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120206, 1202, '{\"en\":\"Phsar Kandal Ti Pir\",\"kh\":\"\\u1795\\u17d2\\u179f\\u17b6\\u179a\\u1780\\u178e\\u17d2\\u178a\\u17b6\\u179b\\u1791\\u17b8\\u17e2\"}', 'Phsar Kandal Ti Pir', 'ផ្សារកណ្ដាលទី២', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120207, 1202, '{\"en\":\"Chakto Mukh\",\"kh\":\"\\u1785\\u178f\\u17bb\\u1798\\u17bb\\u1781\"}', 'Chakto Mukh', 'ចតុមុខ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120208, 1202, '{\"en\":\"Chey Chummeah\",\"kh\":\"\\u1787\\u17d0\\u1799\\u1787\\u17c6\\u1793\\u17c7\"}', 'Chey Chummeah', 'ជ័យជំនះ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120209, 1202, '{\"en\":\"Phsar Chas\",\"kh\":\"\\u1795\\u17d2\\u179f\\u17b6\\u179a\\u1785\\u17b6\\u179f\\u17cb\"}', 'Phsar Chas', 'ផ្សារចាស់', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120210, 1202, '{\"en\":\"Srah Chak\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17c7\\u1785\\u1780\"}', 'Srah Chak', 'ស្រះចក', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120211, 1202, '{\"en\":\"Voat Phnum\",\"kh\":\"\\u179c\\u178f\\u17d2\\u178a\\u1797\\u17d2\\u1793\\u17c6\"}', 'Voat Phnum', 'វត្ដភ្នំ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120301, 1203, '{\"en\":\"Ou Ruessei Ti Muoy\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u17ab\\u179f\\u17d2\\u179f\\u17b8\\u1791\\u17b8 \\u17e1\"}', 'Ou Ruessei Ti Muoy', 'អូរឫស្សីទី ១', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120302, 1203, '{\"en\":\"Ou Ruessei Ti Pir\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u17ab\\u179f\\u17d2\\u179f\\u17b8\\u1791\\u17b8 \\u17e2\"}', 'Ou Ruessei Ti Pir', 'អូរឫស្សីទី ២', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120303, 1203, '{\"en\":\"Ou Ruessei Ti Bei\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u17ab\\u179f\\u17d2\\u179f\\u17b8\\u1791\\u17b8 \\u17e3\"}', 'Ou Ruessei Ti Bei', 'អូរឫស្សីទី ៣', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120304, 1203, '{\"en\":\"Ou Ruessei Ti Buon\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u17ab\\u179f\\u17d2\\u179f\\u17b8\\u1791\\u17b8 \\u17e4\"}', 'Ou Ruessei Ti Buon', 'អូរឫស្សីទី ៤', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120305, 1203, '{\"en\":\"Monourom\",\"kh\":\"\\u1798\\u1793\\u17c4\\u179a\\u1798\\u17d2\\u1799\"}', 'Monourom', 'មនោរម្យ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120306, 1203, '{\"en\":\"Mittapheap\",\"kh\":\"\\u1798\\u17b7\\u178f\\u17d2\\u178a\\u1797\\u17b6\\u1796\"}', 'Mittapheap', 'មិត្ដភាព', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120307, 1203, '{\"en\":\"Veal Vong\",\"kh\":\"\\u179c\\u17b6\\u179b\\u179c\\u1784\\u17cb\"}', 'Veal Vong', 'វាលវង់', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120308, 1203, '{\"en\":\"Boeng Proluet\",\"kh\":\"\\u1794\\u17b9\\u1784\\u1796\\u17d2\\u179a\\u179b\\u17b9\\u178f\"}', 'Boeng Proluet', 'បឹងព្រលឹត', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120401, 1204, '{\"en\":\"Phsar Depou Ti Muoy\",\"kh\":\"\\u1795\\u17d2\\u179f\\u17b6\\u179a\\u178a\\u17c1\\u1794\\u17c9\\u17bc\\u1791\\u17b8 \\u17e1\"}', 'Phsar Depou Ti Muoy', 'ផ្សារដេប៉ូទី ១', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120402, 1204, '{\"en\":\"Phsar Depou Ti Pir\",\"kh\":\"\\u1795\\u17d2\\u179f\\u17b6\\u179a\\u178a\\u17c1\\u1794\\u17c9\\u17bc\\u1791\\u17b8 \\u17e2\"}', 'Phsar Depou Ti Pir', 'ផ្សារដេប៉ូទី ២', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120403, 1204, '{\"en\":\"Phsar Depou Ti Bei\",\"kh\":\"\\u1795\\u17d2\\u179f\\u17b6\\u179a\\u178a\\u17c1\\u1794\\u17c9\\u17bc\\u1791\\u17b8 \\u17e3\"}', 'Phsar Depou Ti Bei', 'ផ្សារដេប៉ូទី ៣', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120404, 1204, '{\"en\":\"Tuek L\'ak Ti Muoy\",\"kh\":\"\\u1791\\u17b9\\u1780\\u179b\\u17d2\\u17a2\\u1780\\u17cb\\u1791\\u17b8 \\u17e1\"}', 'Tuek L\'ak Ti Muoy', 'ទឹកល្អក់ទី ១', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120405, 1204, '{\"en\":\"Tuek L\'ak Ti Pir\",\"kh\":\"\\u1791\\u17b9\\u1780\\u179b\\u17d2\\u17a2\\u1780\\u17cb\\u1791\\u17b8 \\u17e2\"}', 'Tuek L\'ak Ti Pir', 'ទឹកល្អក់ទី ២', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120406, 1204, '{\"en\":\"Tuek L\'ak Ti Bei\",\"kh\":\"\\u1791\\u17b9\\u1780\\u179b\\u17d2\\u17a2\\u1780\\u17cb\\u1791\\u17b8 \\u17e3\"}', 'Tuek L\'ak Ti Bei', 'ទឹកល្អក់ទី ៣', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120407, 1204, '{\"en\":\"Boeng Kak Ti Muoy\",\"kh\":\"\\u1794\\u17b9\\u1784\\u1780\\u1780\\u17cb\\u1791\\u17b8 \\u17e1\"}', 'Boeng Kak Ti Muoy', 'បឹងកក់ទី ១', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120408, 1204, '{\"en\":\"Boeng Kak Ti Pir\",\"kh\":\"\\u1794\\u17b9\\u1784\\u1780\\u1780\\u17cb\\u1791\\u17b8 \\u17e2\"}', 'Boeng Kak Ti Pir', 'បឹងកក់ទី ២', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120409, 1204, '{\"en\":\"Phsar Daeum Kor\",\"kh\":\"\\u1795\\u17d2\\u179f\\u17b6\\u179a\\u178a\\u17be\\u1798\\u1782\\u179a\"}', 'Phsar Daeum Kor', 'ផ្សារដើមគរ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1);
INSERT INTO `tbl_location` (`location_id`, `parent_id`, `title`, `title_en`, `title_kh`, `shortname`, `type`, `prefix`, `image`, `display`, `tag`, `trash`, `ordering`, `ab_id`, `blongto`) VALUES
(120410, 1204, '{\"en\":\"Boeng Salang\",\"kh\":\"\\u1794\\u17b9\\u1784\\u179f\\u17b6\\u17a1\\u17b6\\u1784\"}', 'Boeng Salang', 'បឹងសាឡាង', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120501, 1205, '{\"en\":\"Dangkao\",\"kh\":\"\\u178a\\u1784\\u17d2\\u1780\\u17c4\"}', 'Dangkao', 'ដង្កោ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120507, 1205, '{\"en\":\"Pong Tuek\",\"kh\":\"\\u1796\\u1784\\u1791\\u17b9\\u1780\"}', 'Pong Tuek', 'ពងទឹក', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120508, 1205, '{\"en\":\"Prey Veaeng\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u179c\\u17c2\\u1784\"}', 'Prey Veaeng', 'ព្រៃវែង', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120510, 1205, '{\"en\":\"Prey Sa\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u179f\"}', 'Prey Sa', 'ព្រៃស', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120512, 1205, '{\"en\":\"Krang Pongro\",\"kh\":\"\\u1780\\u17d2\\u179a\\u17b6\\u17c6\\u1784\\u1796\\u1784\\u17d2\\u179a\"}', 'Krang Pongro', 'ក្រាំងពង្រ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120514, 1205, '{\"en\":\"Sak Sampov\",\"kh\":\"\\u179f\\u17b6\\u1780\\u17cb\\u179f\\u17c6\\u1796\\u17c5\"}', 'Sak Sampov', 'សាក់សំពៅ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120515, 1205, '{\"en\":\"Cheung Aek\",\"kh\":\"\\u1787\\u17be\\u1784\\u17af\\u1780\"}', 'Cheung Aek', 'ជើងឯក', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120516, 1205, '{\"en\":\"Kong Noy\",\"kh\":\"\\u1782\\u1784\\u1793\\u1799\"}', 'Kong Noy', 'គងនយ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120517, 1205, '{\"en\":\"Preaek Kampues\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1780\\u17c6\\u1796\\u17b9\\u179f\"}', 'Preaek Kampues', 'ព្រែកកំពឹស', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120518, 1205, '{\"en\":\"Roluos\",\"kh\":\"\\u179a\\u179b\\u17bd\\u179f\"}', 'Roluos', 'រលួស', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120519, 1205, '{\"en\":\"Spean Thma\",\"kh\":\"\\u179f\\u17d2\\u1796\\u17b6\\u1793\\u1790\\u17d2\\u1798\"}', 'Spean Thma', 'ស្ពានថ្ម', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120520, 1205, '{\"en\":\"Tien\",\"kh\":\"\\u1791\\u17c0\\u1793\"}', 'Tien', 'ទៀន', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120606, 1206, '{\"en\":\"Chak Angrae Leu\",\"kh\":\"\\u1785\\u17b6\\u1780\\u17cb\\u17a2\\u1784\\u17d2\\u179a\\u17c2\\u179b\\u17be\"}', 'Chak Angrae Leu', 'ចាក់អង្រែលើ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120607, 1206, '{\"en\":\"Chak Angrae Kraom\",\"kh\":\"\\u1785\\u17b6\\u1780\\u17cb\\u17a2\\u1784\\u17d2\\u179a\\u17c2\\u1780\\u17d2\\u179a\\u17c4\\u1798\"}', 'Chak Angrae Kraom', 'ចាក់អង្រែក្រោម', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120608, 1206, '{\"en\":\"Stueng Mean chey 1\",\"kh\":\"\\u179f\\u17d2\\u1791\\u17b9\\u1784\\u1798\\u17b6\\u1793\\u1787\\u17d0\\u1799\\u1791\\u17b8\\u17e1\"}', 'Stueng Mean chey 1', 'ស្ទឹងមានជ័យទី១', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120609, 1206, '{\"en\":\"Stueng Mean chey 2\",\"kh\":\"\\u179f\\u17d2\\u1791\\u17b9\\u1784\\u1798\\u17b6\\u1793\\u1787\\u17d0\\u1799\\u1791\\u17b8\\u17e2\"}', 'Stueng Mean chey 2', 'ស្ទឹងមានជ័យទី២', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120610, 1206, '{\"en\":\"Stueng Mean chey 3\",\"kh\":\"\\u179f\\u17d2\\u1791\\u17b9\\u1784\\u1798\\u17b6\\u1793\\u1787\\u17d0\\u1799\\u1791\\u17b8\\u17e3\"}', 'Stueng Mean chey 3', 'ស្ទឹងមានជ័យទី៣', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120611, 1206, '{\"en\":\"Boeng Tumpun 1\",\"kh\":\"\\u1794\\u17b9\\u1784\\u1791\\u17c6\\u1796\\u17bb\\u1793\\u1791\\u17b8\\u17e1\"}', 'Boeng Tumpun 1', 'បឹងទំពុនទី១', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120612, 1206, '{\"en\":\"Boeng Tumpun 2\",\"kh\":\"\\u1794\\u17b9\\u1784\\u1791\\u17c6\\u1796\\u17bb\\u1793\\u1791\\u17b8\\u17e2\"}', 'Boeng Tumpun 2', 'បឹងទំពុនទី២', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120703, 1207, '{\"en\":\"Svay Pak\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u1794\\u17c9\\u17b6\\u1780\"}', 'Svay Pak', 'ស្វាយប៉ាក', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120704, 1207, '{\"en\":\"Kilomaetr Lekh Prammuoy\",\"kh\":\"\\u1782\\u17b8\\u17a1\\u17bc\\u1798\\u17c9\\u17c2\\u178f\\u17d2\\u179a\\u179b\\u17c1\\u1781\\u17e6\"}', 'Kilomaetr Lekh Prammuoy', 'គីឡូម៉ែត្រលេខ៦', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120706, 1207, '{\"en\":\"Ruessei Kaev\",\"kh\":\"\\u17ab\\u179f\\u17d2\\u179f\\u17b8\\u1780\\u17c2\\u179c\"}', 'Ruessei Kaev', 'ឫស្សីកែវ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120711, 1207, '{\"en\":\"Chrang Chamreh Ti Muoy\",\"kh\":\"\\u1785\\u17d2\\u179a\\u17b6\\u17c6\\u1784\\u1785\\u17c6\\u179a\\u17c1\\u17c7\\u1791\\u17b8 \\u17e1\"}', 'Chrang Chamreh Ti Muoy', 'ច្រាំងចំរេះទី ១', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120712, 1207, '{\"en\":\"Chrang Chamreh Ti Pir\",\"kh\":\"\\u1785\\u17d2\\u179a\\u17b6\\u17c6\\u1784\\u1785\\u17c6\\u179a\\u17c1\\u17c7\\u1791\\u17b8 \\u17e2\"}', 'Chrang Chamreh Ti Pir', 'ច្រាំងចំរេះទី ២', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120713, 1207, '{\"en\":\"Tuol Sangkae 1\",\"kh\":\"\\u1791\\u17bd\\u179b\\u179f\\u1784\\u17d2\\u1780\\u17c2\\u1791\\u17b8\\u17e1\"}', 'Tuol Sangkae 1', 'ទួលសង្កែទី១', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120714, 1207, '{\"en\":\"Tuol Sangkae 2\",\"kh\":\"\\u1791\\u17bd\\u179b\\u179f\\u1784\\u17d2\\u1780\\u17c2\\u1791\\u17b8\\u17e2\"}', 'Tuol Sangkae 2', 'ទួលសង្កែទី២', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120801, 1208, '{\"en\":\"Phnom Penh Thmei\",\"kh\":\"\\u1797\\u17d2\\u1793\\u17c6\\u1796\\u17c1\\u1789\\u1790\\u17d2\\u1798\\u17b8\"}', 'Phnom Penh Thmei', 'ភ្នំពេញថ្មី', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120802, 1208, '{\"en\":\"Tuek Thla\",\"kh\":\"\\u1791\\u17b9\\u1780\\u1790\\u17d2\\u179b\\u17b6\"}', 'Tuek Thla', 'ទឹកថ្លា', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120803, 1208, '{\"en\":\"Khmuonh\",\"kh\":\"\\u1783\\u17d2\\u1798\\u17bd\\u1789\"}', 'Khmuonh', 'ឃ្មួញ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120807, 1208, '{\"en\":\"Krang Thnong\",\"kh\":\"\\u1780\\u17d2\\u179a\\u17b6\\u17c6\\u1784\\u1792\\u17d2\\u1793\\u1784\\u17cb\"}', 'Krang Thnong', 'ក្រាំងធ្នង់', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120808, 1208, '{\"en\":\"Ou Baek K\'am\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u1794\\u17c2\\u1780\\u1780\\u17d2\\u17a2\\u1798\"}', 'Ou Baek K\'am', 'អូរបែកក្អម', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120809, 1208, '{\"en\":\"Kouk Khleang\",\"kh\":\"\\u1782\\u17c4\\u1780\\u1783\\u17d2\\u179b\\u17b6\\u1784\"}', 'Kouk Khleang', 'គោកឃ្លាង', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120901, 1209, '{\"en\":\"Trapeang Krasang\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u1780\\u17d2\\u179a\\u179f\\u17b6\\u17c6\\u1784\"}', 'Trapeang Krasang', 'ត្រពាំងក្រសាំង', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120906, 1209, '{\"en\":\"Samraong Kraom\",\"kh\":\"\\u179f\\u17c6\\u179a\\u17c4\\u1784\\u1780\\u17d2\\u179a\\u17c4\\u1798\"}', 'Samraong Kraom', 'សំរោងក្រោម', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120914, 1209, '{\"en\":\"Chaom Chau 1\",\"kh\":\"\\u1785\\u17c4\\u1798\\u1785\\u17c5\\u1791\\u17b8\\u17e1\"}', 'Chaom Chau 1', 'ចោមចៅទី១', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120915, 1209, '{\"en\":\"Chaom Chau 2\",\"kh\":\"\\u1785\\u17c4\\u1798\\u1785\\u17c5\\u1791\\u17b8\\u17e2\"}', 'Chaom Chau 2', 'ចោមចៅទី២', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120916, 1209, '{\"en\":\"Chaom Chau 3\",\"kh\":\"\\u1785\\u17c4\\u1798\\u1785\\u17c5\\u1791\\u17b8\\u17e3\"}', 'Chaom Chau 3', 'ចោមចៅទី៣', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120917, 1209, '{\"en\":\"Kakab 1\",\"kh\":\"\\u1780\\u17b6\\u1780\\u17b6\\u1794\\u1791\\u17b8\\u17e1\"}', 'Kakab 1', 'កាកាបទី១', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(120918, 1209, '{\"en\":\"Kakab 2\",\"kh\":\"\\u1780\\u17b6\\u1780\\u17b6\\u1794\\u1791\\u17b8\\u17e2\"}', 'Kakab 2', 'កាកាបទី២', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121001, 1210, '{\"en\":\"Chrouy Changvar\",\"kh\":\"\\u1787\\u17d2\\u179a\\u17c4\\u1799\\u1785\\u1784\\u17d2\\u179c\\u17b6\\u179a\"}', 'Chrouy Changvar', 'ជ្រោយចង្វារ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121002, 1210, '{\"en\":\"Preaek Lieb\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u179b\\u17c0\\u1794\"}', 'Preaek Lieb', 'ព្រែកលៀប', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121003, 1210, '{\"en\":\"Preaek Ta Sek\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u178f\\u17b6\\u179f\\u17c1\\u1780\"}', 'Preaek Ta Sek', 'ព្រែកតាសេក', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121004, 1210, '{\"en\":\"Kaoh Dach\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u178a\\u17b6\\u1785\\u17cb\"}', 'Kaoh Dach', 'កោះដាច់', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121005, 1210, '{\"en\":\"Bak Kaeng\",\"kh\":\"\\u1794\\u17b6\\u1780\\u17cb\\u1781\\u17c2\\u1784\"}', 'Bak Kaeng', 'បាក់ខែង', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121101, 1211, '{\"en\":\"Preaek Phnov\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1796\\u17d2\\u1793\\u17c5\"}', 'Preaek Phnov', 'ព្រែកព្នៅ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121102, 1211, '{\"en\":\"Ponhea Pon\",\"kh\":\"\\u1796\\u1789\\u17b6\\u1796\\u1793\\u17cb\"}', 'Ponhea Pon', 'ពញាពន់', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121103, 1211, '{\"en\":\"Samraong\",\"kh\":\"\\u179f\\u17c6\\u179a\\u17c4\\u1784\"}', 'Samraong', 'សំរោង', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121104, 1211, '{\"en\":\"Kouk Roka\",\"kh\":\"\\u1782\\u17c4\\u1780\\u179a\\u1780\\u17b6\"}', 'Kouk Roka', 'គោករកា', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121105, 1211, '{\"en\":\"Ponsang\",\"kh\":\"\\u1796\\u1793\\u17d2\\u179f\\u17b6\\u17c6\\u1784\"}', 'Ponsang', 'ពន្សាំង', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121201, 1212, '{\"en\":\"Chhbar Ampov Ti Muoy\",\"kh\":\"\\u1785\\u17d2\\u1794\\u17b6\\u179a\\u17a2\\u17c6\\u1796\\u17c5\\u1791\\u17b8 \\u17e1\"}', 'Chhbar Ampov Ti Muoy', 'ច្បារអំពៅទី ១', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121202, 1212, '{\"en\":\"Chbar Ampov Ti Pir\",\"kh\":\"\\u1785\\u17d2\\u1794\\u17b6\\u179a\\u17a2\\u17c6\\u1796\\u17c5\\u1791\\u17b8 \\u17e2\"}', 'Chbar Ampov Ti Pir', 'ច្បារអំពៅទី ២', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121203, 1212, '{\"en\":\"Nirouth\",\"kh\":\"\\u1793\\u17b7\\u179a\\u17c4\\u1792\"}', 'Nirouth', 'និរោធ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121204, 1212, '{\"en\":\"Preaek Pra\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1794\\u17d2\\u179a\\u17b6\"}', 'Preaek Pra', 'ព្រែកប្រា', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121205, 1212, '{\"en\":\"Veal Sbov\",\"kh\":\"\\u179c\\u17b6\\u179b\\u179f\\u17d2\\u1794\\u17bc\\u179c\"}', 'Veal Sbov', 'វាលស្បូវ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121206, 1212, '{\"en\":\"Preaek Aeng\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u17af\\u1784\"}', 'Preaek Aeng', 'ព្រែកឯង', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121207, 1212, '{\"en\":\"Kbal Kaoh\",\"kh\":\"\\u1780\\u17d2\\u1794\\u17b6\\u179b\\u1780\\u17c4\\u17c7\"}', 'Kbal Kaoh', 'ក្បាលកោះ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121208, 1212, '{\"en\":\"Preaek Thmei\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1790\\u17d2\\u1798\\u17b8\"}', 'Preaek Thmei', 'ព្រែកថ្មី', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121301, 1213, '{\"en\":\"Boeng Keng Kang Ti Muoy\",\"kh\":\"\\u1794\\u17b9\\u1784\\u1780\\u17c1\\u1784\\u1780\\u1784\\u1791\\u17b8 \\u17e1\"}', 'Boeng Keng Kang Ti Muoy', 'បឹងកេងកងទី ១', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121302, 1213, '{\"en\":\"Boeng Keng Kang Ti Pir\",\"kh\":\"\\u1794\\u17b9\\u1784\\u1780\\u17c1\\u1784\\u1780\\u1784\\u1791\\u17b8 \\u17e2\"}', 'Boeng Keng Kang Ti Pir', 'បឹងកេងកងទី ២', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121303, 1213, '{\"en\":\"Boeng Keng Kang Ti Bei\",\"kh\":\"\\u1794\\u17b9\\u1784\\u1780\\u17c1\\u1784\\u1780\\u1784\\u1791\\u17b8 \\u17e3\"}', 'Boeng Keng Kang Ti Bei', 'បឹងកេងកងទី ៣', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121304, 1213, '{\"en\":\"Olympic\",\"kh\":\"\\u17a2\\u17bc\\u17a1\\u17b6\\u17c6\\u1796\\u17b7\\u1780\"}', 'Olympic', 'អូឡាំពិក', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121305, 1213, '{\"en\":\"Tumnob Tuek\",\"kh\":\"\\u1791\\u17c6\\u1793\\u1794\\u17cb\\u1791\\u17b9\\u1780\"}', 'Tumnob Tuek', 'ទំនប់ទឹក', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121306, 1213, '{\"en\":\"Tuol Svay Prey Ti Muoy\",\"kh\":\"\\u1791\\u17bd\\u179b\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u1796\\u17d2\\u179a\\u17c3\\u1791\\u17b8 \\u17e1\"}', 'Tuol Svay Prey Ti Muoy', 'ទួលស្វាយព្រៃទី ១', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121307, 1213, '{\"en\":\"Tuol Svay Prey Ti Pir\",\"kh\":\"\\u1791\\u17bd\\u179b\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u1796\\u17d2\\u179a\\u17c3\\u1791\\u17b8 \\u17e2\"}', 'Tuol Svay Prey Ti Pir', 'ទួលស្វាយព្រៃទី ២', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121401, 1214, '{\"en\":\"Kamboul\",\"kh\":\"\\u1780\\u17c6\\u1794\\u17bc\\u179b\"}', 'Kamboul', 'កំបូល', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121402, 1214, '{\"en\":\"Kantaok\",\"kh\":\"\\u1780\\u1793\\u17d2\\u1791\\u17c4\\u1780\"}', 'Kantaok', 'កន្ទោក', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121403, 1214, '{\"en\":\"Ovlaok\",\"kh\":\"\\u17aa\\u17a1\\u17c4\\u1780\"}', 'Ovlaok', 'ឪឡោក', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121404, 1214, '{\"en\":\"Snaor\",\"kh\":\"\\u179f\\u17d2\\u1793\\u17c4\\u179a\"}', 'Snaor', 'ស្នោរ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121405, 1214, '{\"en\":\"Phleung Chheh Roteh\",\"kh\":\"\\u1797\\u17d2\\u179b\\u17be\\u1784\\u1786\\u17c1\\u17c7\\u179a\\u1791\\u17c1\\u17c7\"}', 'Phleung Chheh Roteh', 'ភ្លើងឆេះរទេះ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121406, 1214, '{\"en\":\"Boeng Thum\",\"kh\":\"\\u1794\\u17b9\\u1784\\u1792\\u17c6\"}', 'Boeng Thum', 'បឹងធំ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(121407, 1214, '{\"en\":\"Prateah Lang\",\"kh\":\"\\u1794\\u17d2\\u179a\\u1791\\u17c7\\u17a1\\u17b6\\u1784\"}', 'Prateah Lang', 'ប្រទះឡាង', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(130101, 1301, '{\"en\":\"S\'ang\",\"kh\":\"\\u179f\\u17d2\\u17a2\\u17b6\\u1784\"}', 'S\'ang', 'ស្អាង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130102, 1301, '{\"en\":\"Tasu\",\"kh\":\"\\u178f\\u179f\\u17ca\\u17bc\"}', 'Tasu', 'តស៊ូ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130103, 1301, '{\"en\":\"Khyang\",\"kh\":\"\\u1781\\u17d2\\u1799\\u1784\"}', 'Khyang', 'ខ្យង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130104, 1301, '{\"en\":\"Chrach\",\"kh\":\"\\u1785\\u17d2\\u179a\\u17b6\\u1785\\u17cb\"}', 'Chrach', 'ច្រាច់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130105, 1301, '{\"en\":\"Thmea\",\"kh\":\"\\u1792\\u17d2\\u1798\\u17b6\"}', 'Thmea', 'ធ្មា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130106, 1301, '{\"en\":\"Putrea\",\"kh\":\"\\u1796\\u17bb\\u1791\\u17d2\\u179a\\u17b6\"}', 'Putrea', 'ពុទ្រា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130201, 1302, '{\"en\":\"Chhaeb Muoy\",\"kh\":\"\\u1786\\u17c2\\u1794\\u1798\\u17bd\\u1799\"}', 'Chhaeb Muoy', 'ឆែបមួយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130202, 1302, '{\"en\":\"Chhaeb Pir\",\"kh\":\"\\u1786\\u17c2\\u1794\\u1796\\u17b8\\u179a\"}', 'Chhaeb Pir', 'ឆែបពីរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130203, 1302, '{\"en\":\"Sangkae Muoy\",\"kh\":\"\\u179f\\u1784\\u17d2\\u1780\\u17c2\\u1798\\u17bd\\u1799\"}', 'Sangkae Muoy', 'សង្កែមួយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130204, 1302, '{\"en\":\"Sangkae Pir\",\"kh\":\"\\u179f\\u1784\\u17d2\\u1780\\u17c2\\u1796\\u17b8\\u179a\"}', 'Sangkae Pir', 'សង្កែពីរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130205, 1302, '{\"en\":\"Mlu Prey Muoy\",\"kh\":\"\\u1798\\u17d2\\u179b\\u17bc\\u1796\\u17d2\\u179a\\u17c3\\u1798\\u17bd\\u1799\"}', 'Mlu Prey Muoy', 'ម្លូព្រៃមួយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130206, 1302, '{\"en\":\"Mlu Prey Pir\",\"kh\":\"\\u1798\\u17d2\\u179b\\u17bc\\u1796\\u17d2\\u179a\\u17c3\\u1796\\u17b8\\u179a\"}', 'Mlu Prey Pir', 'ម្លូព្រៃពីរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130207, 1302, '{\"en\":\"Kampong Sralau Muoy\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u179f\\u17d2\\u179a\\u17a1\\u17c5\\u1798\\u17bd\\u1799\"}', 'Kampong Sralau Muoy', 'កំពង់ស្រឡៅមួយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130208, 1302, '{\"en\":\"Kampong Sralau Pir\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u179f\\u17d2\\u179a\\u17a1\\u17c5\\u1796\\u17b8\\u179a\"}', 'Kampong Sralau Pir', 'កំពង់ស្រឡៅពីរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130301, 1303, '{\"en\":\"Choam Ksant\",\"kh\":\"\\u1787\\u17b6\\u17c6\\u1780\\u17d2\\u179f\\u17b6\\u1793\\u17d2\\u178a\"}', 'Choam Ksant', 'ជាំក្សាន្ដ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130302, 1303, '{\"en\":\"Tuek Kraham\",\"kh\":\"\\u1791\\u17b9\\u1780\\u1780\\u17d2\\u179a\\u17a0\\u1798\"}', 'Tuek Kraham', 'ទឹកក្រហម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130303, 1303, '{\"en\":\"Pring Thum\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17b8\\u1784\\u1792\\u17c6\"}', 'Pring Thum', 'ព្រីងធំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130304, 1303, '{\"en\":\"Rumdaoh Srae\",\"kh\":\"\\u179a\\u17c6\\u178a\\u17c4\\u17c7\\u179f\\u17d2\\u179a\\u17c2\"}', 'Rumdaoh Srae', 'រំដោះស្រែ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130305, 1303, '{\"en\":\"Yeang\",\"kh\":\"\\u1799\\u17b6\\u1784\"}', 'Yeang', 'យាង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130306, 1303, '{\"en\":\"Kantuot\",\"kh\":\"\\u1780\\u1793\\u17d2\\u1791\\u17bd\\u178f\"}', 'Kantuot', 'កន្ទួត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130307, 1303, '{\"en\":\"Sror Aem\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17a2\\u17c2\\u1798\"}', 'Sror Aem', 'ស្រអែម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130308, 1303, '{\"en\":\"Morokot\",\"kh\":\"\\u1798\\u179a\\u1780\\u178f\"}', 'Morokot', 'មរកត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130401, 1304, '{\"en\":\"Kuleaen Tboung\",\"kh\":\"\\u1782\\u17bc\\u179b\\u17c2\\u1793\\u178f\\u17d2\\u1794\\u17bc\\u1784\"}', 'Kuleaen Tboung', 'គូលែនត្បូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130402, 1304, '{\"en\":\"Kuleaen Cheung\",\"kh\":\"\\u1782\\u17bc\\u179b\\u17c2\\u1793\\u1787\\u17be\\u1784\"}', 'Kuleaen Cheung', 'គូលែនជើង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130403, 1304, '{\"en\":\"Thmei\",\"kh\":\"\\u1790\\u17d2\\u1798\\u17b8\"}', 'Thmei', 'ថ្មី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130404, 1304, '{\"en\":\"Phnum Penh\",\"kh\":\"\\u1797\\u17d2\\u1793\\u17c6\\u1796\\u17c1\\u1789\"}', 'Phnum Penh', 'ភ្នំពេញ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130405, 1304, '{\"en\":\"Phnum Tbaeng Pir\",\"kh\":\"\\u1797\\u17d2\\u1793\\u17c6\\u178f\\u17d2\\u1794\\u17c2\\u1784\\u1796\\u17b8\\u179a\"}', 'Phnum Tbaeng Pir', 'ភ្នំត្បែងពីរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130406, 1304, '{\"en\":\"Srayang\",\"kh\":\"\\u179f\\u17d2\\u179a\\u1799\\u1784\\u17cb\"}', 'Srayang', 'ស្រយង់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130501, 1305, '{\"en\":\"Robieb\",\"kh\":\"\\u179a\\u1794\\u17c0\\u1794\"}', 'Robieb', 'របៀប', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130502, 1305, '{\"en\":\"Reaksmei\",\"kh\":\"\\u179a\\u179f\\u17d2\\u1798\\u17b8\"}', 'Reaksmei', 'រស្មី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130503, 1305, '{\"en\":\"Rohas\",\"kh\":\"\\u179a\\u17a0\\u17d0\\u179f\"}', 'Rohas', 'រហ័ស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130504, 1305, '{\"en\":\"Rung Roeang\",\"kh\":\"\\u179a\\u17bb\\u1784\\u179a\\u17bf\\u1784\"}', 'Rung Roeang', 'រុងរឿង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130505, 1305, '{\"en\":\"Rik Reay\",\"kh\":\"\\u179a\\u17b8\\u1780\\u179a\\u17b6\\u1799\"}', 'Rik Reay', 'រីករាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130506, 1305, '{\"en\":\"Ruos Roan\",\"kh\":\"\\u179a\\u17bd\\u179f\\u179a\\u17b6\\u1793\\u17cb\"}', 'Ruos Roan', 'រួសរាន់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130507, 1305, '{\"en\":\"Rotanak\",\"kh\":\"\\u179a\\u178f\\u1793\\u17c8\"}', 'Rotanak', 'រតនៈ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130508, 1305, '{\"en\":\"Rieb Roy\",\"kh\":\"\\u179a\\u17c0\\u1794\\u179a\\u1799\"}', 'Rieb Roy', 'រៀបរយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130509, 1305, '{\"en\":\"Reaksa\",\"kh\":\"\\u179a\\u1780\\u17d2\\u179f\\u17b6\"}', 'Reaksa', 'រក្សា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130510, 1305, '{\"en\":\"Rumdaoh\",\"kh\":\"\\u179a\\u17c6\\u178a\\u17c4\\u17c7\"}', 'Rumdaoh', 'រំដោះ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130511, 1305, '{\"en\":\"Romtum\",\"kh\":\"\\u179a\\u1798\\u1791\\u1798\"}', 'Romtum', 'រមទម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130512, 1305, '{\"en\":\"Romoneiy\",\"kh\":\"\\u179a\\u1798\\u178e\\u17b8\\u1799\"}', 'Romoneiy', 'រមណីយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130601, 1306, '{\"en\":\"Chamraeun\",\"kh\":\"\\u1785\\u17c6\\u179a\\u17be\\u1793\"}', 'Chamraeun', 'ចំរើន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130602, 1306, '{\"en\":\"Ro\'ang\",\"kh\":\"\\u179a\\u17a2\\u17b6\\u1784\"}', 'Ro\'ang', 'រអាង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130603, 1306, '{\"en\":\"Phnum Tbaeng Muoy\",\"kh\":\"\\u1797\\u17d2\\u1793\\u17c6\\u178f\\u17d2\\u1794\\u17c2\\u1784\\u1798\\u17bd\\u1799\"}', 'Phnum Tbaeng Muoy', 'ភ្នំត្បែងមួយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130604, 1306, '{\"en\":\"Sdau\",\"kh\":\"\\u179f\\u17d2\\u178a\\u17c5\"}', 'Sdau', 'ស្ដៅ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130605, 1306, '{\"en\":\"Ronak Ser\",\"kh\":\"\\u179a\\u178e\\u179f\\u17b7\\u179a\\u17d2\\u179f\"}', 'Ronak Ser', 'រណសិរ្ស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130703, 1307, '{\"en\":\"Chhean Mukh\",\"kh\":\"\\u1788\\u17b6\\u1793\\u1798\\u17bb\\u1781\"}', 'Chhean Mukh', 'ឈានមុខ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130704, 1307, '{\"en\":\"Pou\",\"kh\":\"\\u1796\\u17c4\\u1792\\u17b7\\u17cd\"}', 'Pou', 'ពោធិ៍', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130705, 1307, '{\"en\":\"Prame\",\"kh\":\"\\u1794\\u17d2\\u179a\\u1798\\u17c1\\u179a\\u17bb\"}', 'Prame', 'ប្រមេរុ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130706, 1307, '{\"en\":\"Preah Khleang\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c7\\u1783\\u17d2\\u179b\\u17b6\\u17c6\\u1784\"}', 'Preah Khleang', 'ព្រះឃ្លាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(130801, 1308, '{\"en\":\"Kampong Pranak\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1794\\u17d2\\u179a\\u178e\\u17b6\\u1780\"}', 'Kampong Pranak', 'កំពង់ប្រណាក', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(130802, 1308, '{\"en\":\"Pal Hal\",\"kh\":\"\\u1794\\u17c9\\u17b6\\u179b\\u17a0\\u17b6\\u179b\"}', 'Pal Hal', 'ប៉ាលហាល', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(140101, 1401, '{\"en\":\"Boeng Preah\",\"kh\":\"\\u1794\\u17b9\\u1784\\u1796\\u17d2\\u179a\\u17c7\"}', 'Boeng Preah', 'បឹងព្រះ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140102, 1401, '{\"en\":\"Cheung Phnum\",\"kh\":\"\\u1787\\u17be\\u1784\\u1797\\u17d2\\u1793\\u17c6\"}', 'Cheung Phnum', 'ជើងភ្នំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140103, 1401, '{\"en\":\"Chheu Kach\",\"kh\":\"\\u1788\\u17be\\u1780\\u17b6\\u1785\\u17cb\"}', 'Chheu Kach', 'ឈើកាច់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140104, 1401, '{\"en\":\"Reaks Chey\",\"kh\":\"\\u179a\\u1780\\u17d2\\u179f\\u1787\\u17d0\\u1799\"}', 'Reaks Chey', 'រក្សជ័យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140105, 1401, '{\"en\":\"Roung Damrei\",\"kh\":\"\\u179a\\u17c4\\u1784\\u178a\\u17c6\\u179a\\u17b8\"}', 'Roung Damrei', 'រោងដំរី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140106, 1401, '{\"en\":\"Sdau Kaong\",\"kh\":\"\\u179f\\u17d2\\u178a\\u17c5\\u1780\\u17c4\\u1784\"}', 'Sdau Kaong', 'ស្ដៅកោង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140107, 1401, '{\"en\":\"Spueu Ka\",\"kh\":\"\\u179f\\u17d2\\u1796\\u17ba  \\u1780\"}', 'Spueu Ka', 'ស្ពឺ  ក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140108, 1401, '{\"en\":\"Spueu Kha\",\"kh\":\"\\u179f\\u17d2\\u1796\\u17ba  \\u1781\"}', 'Spueu Kha', 'ស្ពឺ  ខ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140109, 1401, '{\"en\":\"Theay\",\"kh\":\"\\u1792\\u17b6\\u1799\"}', 'Theay', 'ធាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140201, 1402, '{\"en\":\"Cheach\",\"kh\":\"\\u1787\\u17b6\\u1785\"}', 'Cheach', 'ជាច', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140202, 1402, '{\"en\":\"Doun Koeng\",\"kh\":\"\\u178a\\u17bc\\u1793\\u1780\\u17b9\\u1784\"}', 'Doun Koeng', 'ដូនកឹង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140203, 1402, '{\"en\":\"Kranhung\",\"kh\":\"\\u1780\\u17d2\\u179a\\u1789\\u17bc\\u1784\"}', 'Kranhung', 'ក្រញូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140204, 1402, '{\"en\":\"Krabau\",\"kh\":\"\\u1780\\u17d2\\u179a\\u1794\\u17c5\"}', 'Krabau', 'ក្របៅ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140205, 1402, '{\"en\":\"Seang Khveang\",\"kh\":\"\\u179f\\u17ca\\u17b6\\u1784\\u1783\\u17d2\\u179c\\u17b6\\u1784\"}', 'Seang Khveang', 'ស៊ាងឃ្វាង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140206, 1402, '{\"en\":\"Smaong Khang Cheung\",\"kh\":\"\\u179f\\u17d2\\u1798\\u17c4\\u1784\\u1781\\u17b6\\u1784\\u1787\\u17be\\u1784\"}', 'Smaong Khang Cheung', 'ស្មោងខាងជើង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140207, 1402, '{\"en\":\"Smaong Khang Tboung\",\"kh\":\"\\u179f\\u17d2\\u1798\\u17c4\\u1784\\u1781\\u17b6\\u1784\\u178f\\u17d2\\u1794\\u17bc\\u1784\"}', 'Smaong Khang Tboung', 'ស្មោងខាងត្បូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140208, 1402, '{\"en\":\"Trabaek\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1794\\u17c2\\u1780\"}', 'Trabaek', 'ត្របែក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140301, 1403, '{\"en\":\"Ansaong\",\"kh\":\"\\u17a2\\u1793\\u17d2\\u179f\\u17c4\\u1784\"}', 'Ansaong', 'អន្សោង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140302, 1403, '{\"en\":\"Cham\",\"kh\":\"\\u1785\\u17b6\\u1798\"}', 'Cham', 'ចាម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140303, 1403, '{\"en\":\"Cheang Daek\",\"kh\":\"\\u1787\\u17b6\\u1784\\u178a\\u17c2\\u1780\"}', 'Cheang Daek', 'ជាងដែក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140304, 1403, '{\"en\":\"Chrey\",\"kh\":\"\\u1787\\u17d2\\u179a\\u17c3\"}', 'Chrey', 'ជ្រៃ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140305, 1403, '{\"en\":\"Kansoam Ak\",\"kh\":\"\\u1780\\u1793\\u17d2\\u179f\\u17c4\\u1798\\u17a2\\u1780\"}', 'Kansoam Ak', 'កន្សោមអក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140306, 1403, '{\"en\":\"Kou Khchak\",\"kh\":\"\\u1782\\u17c4\\u1781\\u17d2\\u1785\\u1780\"}', 'Kou Khchak', 'គោខ្ចក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140307, 1403, '{\"en\":\"Kampong Trabaek\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u178f\\u17d2\\u179a\\u1794\\u17c2\\u1780\"}', 'Kampong Trabaek', 'កំពង់ត្របែក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140308, 1403, '{\"en\":\"Peam Montear\",\"kh\":\"\\u1796\\u17b6\\u1798\\u1798\\u1793\\u17d2\\u1791\\u17b6\\u179a\"}', 'Peam Montear', 'ពាមមន្ទារ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140309, 1403, '{\"en\":\"Prasat\",\"kh\":\"\\u1794\\u17d2\\u179a\\u17b6\\u179f\\u17b6\\u1791\"}', 'Prasat', 'ប្រាសាទ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140310, 1403, '{\"en\":\"Pratheat\",\"kh\":\"\\u1794\\u17d2\\u179a\\u1792\\u17b6\\u178f\\u17bb\"}', 'Pratheat', 'ប្រធាតុ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140311, 1403, '{\"en\":\"Prey Chhor\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1788\\u179a\"}', 'Prey Chhor', 'ព្រៃឈរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140312, 1403, '{\"en\":\"Prey Poun\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1796\\u17c4\\u1793\"}', 'Prey Poun', 'ព្រៃពោន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140313, 1403, '{\"en\":\"Thkov\",\"kh\":\"\\u1790\\u17d2\\u1780\\u17bc\\u179c\"}', 'Thkov', 'ថ្កូវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140401, 1404, '{\"en\":\"Chong Ampil\",\"kh\":\"\\u1785\\u17bb\\u1784\\u17a2\\u17c6\\u1796\\u17b7\\u179b\"}', 'Chong Ampil', 'ចុងអំពិល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140402, 1404, '{\"en\":\"Kanhchriech\",\"kh\":\"\\u1780\\u1789\\u17d2\\u1787\\u17d2\\u179a\\u17c0\\u1785\"}', 'Kanhchriech', 'កញ្ជ្រៀច', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140403, 1404, '{\"en\":\"Kdoeang Reay\",\"kh\":\"\\u1780\\u17d2\\u178a\\u17bf\\u1784\\u179a\\u17b6\\u1799\"}', 'Kdoeang Reay', 'ក្ដឿងរាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140404, 1404, '{\"en\":\"Kouk Kong Kaeut\",\"kh\":\"\\u1782\\u17c4\\u1780\\u1782\\u1784\\u17cb\\u1780\\u17be\\u178f\"}', 'Kouk Kong Kaeut', 'គោកគង់កើត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140405, 1404, '{\"en\":\"Kouk Kong Lech\",\"kh\":\"\\u1782\\u17c4\\u1780\\u1782\\u1784\\u17cb\\u179b\\u17b7\\u1785\"}', 'Kouk Kong Lech', 'គោកគង់លិច', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140406, 1404, '{\"en\":\"Preal\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17b6\\u179b\"}', 'Preal', 'ព្រាល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140407, 1404, '{\"en\":\"Thma Pun\",\"kh\":\"\\u1790\\u17d2\\u1798\\u1796\\u17bc\\u1793\"}', 'Thma Pun', 'ថ្មពូន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140408, 1404, '{\"en\":\"Tnaot\",\"kh\":\"\\u178f\\u17d2\\u1793\\u17c4\\u178f\"}', 'Tnaot', 'ត្នោត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140501, 1405, '{\"en\":\"Angkor Sar\",\"kh\":\"\\u17a2\\u1784\\u17d2\\u1782\\u179a\\u179f\\u179a\"}', 'Angkor Sar', 'អង្គរសរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140502, 1405, '{\"en\":\"Chres\",\"kh\":\"\\u1785\\u17d2\\u179a\\u17c1\\u179f\"}', 'Chres', 'ច្រេស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140503, 1405, '{\"en\":\"Chi Phoch\",\"kh\":\"\\u1787\\u17b8\\u1795\\u17bb\\u1785\"}', 'Chi Phoch', 'ជីផុច', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140504, 1405, '{\"en\":\"Prey Khnes\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1783\\u17d2\\u1793\\u17c1\\u179f\"}', 'Prey Khnes', 'ព្រៃឃ្នេស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140505, 1405, '{\"en\":\"Prey Rumdeng\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u179a\\u17c6\\u178a\\u17c1\\u1784\"}', 'Prey Rumdeng', 'ព្រៃរំដេង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140506, 1405, '{\"en\":\"Prey Totueng\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1791\\u1791\\u17b9\\u1784\"}', 'Prey Totueng', 'ព្រៃទទឹង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140507, 1405, '{\"en\":\"Svay Chrum\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u1787\\u17d2\\u179a\\u17bb\\u17c6\"}', 'Svay Chrum', 'ស្វាយជ្រុំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140508, 1405, '{\"en\":\"Trapeang Srae\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u179f\\u17d2\\u179a\\u17c2\"}', 'Trapeang Srae', 'ត្រពាំងស្រែ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140601, 1406, '{\"en\":\"Angkor Angk\",\"kh\":\"\\u17a2\\u1784\\u17d2\\u1782\\u179a\\u17a2\\u1784\\u17d2\\u1782\"}', 'Angkor Angk', 'អង្គរអង្គ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140602, 1406, '{\"en\":\"Kampong Prasat\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1794\\u17d2\\u179a\\u17b6\\u179f\\u17b6\\u1791\"}', 'Kampong Prasat', 'កំពង់ប្រាសាទ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140603, 1406, '{\"en\":\"Kaoh Chek\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u1785\\u17c1\\u1780\"}', 'Kaoh Chek', 'កោះចេក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140604, 1406, '{\"en\":\"Kaoh Roka\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u179a\\u1780\\u17b6\"}', 'Kaoh Roka', 'កោះរកា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140605, 1406, '{\"en\":\"Kaoh Sampov\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u179f\\u17c6\\u1796\\u17c5\"}', 'Kaoh Sampov', 'កោះសំពៅ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140606, 1406, '{\"en\":\"Krang Ta Yang\",\"kh\":\"\\u1780\\u17d2\\u179a\\u17b6\\u17c6\\u1784\\u178f\\u17b6\\u1799\\u17c9\\u1784\"}', 'Krang Ta Yang', 'ក្រាំងតាយ៉ង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140607, 1406, '{\"en\":\"Preaek Krabau\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1780\\u17d2\\u179a\\u1794\\u17c5\"}', 'Preaek Krabau', 'ព្រែកក្របៅ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140608, 1406, '{\"en\":\"Preaek Sambuor\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u179f\\u17c6\\u1794\\u17bd\\u179a\"}', 'Preaek Sambuor', 'ព្រែកសំបួរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140609, 1406, '{\"en\":\"Ruessei Srok\",\"kh\":\"\\u17ab\\u179f\\u17d2\\u179f\\u17b8\\u179f\\u17d2\\u179a\\u17bb\\u1780\"}', 'Ruessei Srok', 'ឫស្សីស្រុក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140610, 1406, '{\"en\":\"Svay Phluoh\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u1797\\u17d2\\u179b\\u17c4\\u17c7\"}', 'Svay Phluoh', 'ស្វាយភ្លោះ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140701, 1407, '{\"en\":\"Ba Baong\",\"kh\":\"\\u1794\\u17b6\\u1794\\u17c4\\u1784\"}', 'Ba Baong', 'បាបោង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140702, 1407, '{\"en\":\"Banlich Prasat\",\"kh\":\"\\u1794\\u1793\\u17d2\\u179b\\u17b7\\u1785\\u1794\\u17d2\\u179a\\u17b6\\u179f\\u17b6\\u1791\"}', 'Banlich Prasat', 'បន្លិចប្រាសាទ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140703, 1407, '{\"en\":\"Neak Loeang\",\"kh\":\"\\u17a2\\u17d2\\u1793\\u1780\\u179b\\u17bf\\u1784\"}', 'Neak Loeang', 'អ្នកលឿង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140704, 1407, '{\"en\":\"Peam Mean Chey\",\"kh\":\"\\u1796\\u17b6\\u1798\\u1798\\u17b6\\u1793\\u1787\\u17d0\\u1799\"}', 'Peam Mean Chey', 'ពាមមានជ័យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140705, 1407, '{\"en\":\"Peam Ro\",\"kh\":\"\\u1796\\u17b6\\u1798\\u179a\\u1780\\u17cd\"}', 'Peam Ro', 'ពាមរក៍', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140706, 1407, '{\"en\":\"Preaek Khsay Ka\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1781\\u17d2\\u179f\\u17b6\\u1799 \\u1780\"}', 'Preaek Khsay Ka', 'ព្រែកខ្សាយ ក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140707, 1407, '{\"en\":\"Preaek Khsay Kha\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1781\\u17d2\\u179f\\u17b6\\u1799 \\u1781\"}', 'Preaek Khsay Kha', 'ព្រែកខ្សាយ ខ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140708, 1407, '{\"en\":\"Prey Kandieng\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1780\\u178e\\u17d2\\u178a\\u17c0\\u1784\"}', 'Prey Kandieng', 'ព្រៃកណ្ដៀង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140801, 1408, '{\"en\":\"Kampong Popil\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1796\\u1796\\u17b7\\u179b\"}', 'Kampong Popil', 'កំពង់ពពិល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140802, 1408, '{\"en\":\"Kanhcham\",\"kh\":\"\\u1780\\u1789\\u17d2\\u1785\\u17c6\"}', 'Kanhcham', 'កញ្ចំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140803, 1408, '{\"en\":\"Kampong Prang\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1794\\u17d2\\u179a\\u17b6\\u17c6\\u1784\"}', 'Kampong Prang', 'កំពង់ប្រាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140805, 1408, '{\"en\":\"Mesar Prachan\",\"kh\":\"\\u1798\\u17c1\\u179f\\u179a\\u1794\\u17d2\\u179a\\u1785\\u17b6\\u1793\\u17cb\"}', 'Mesar Prachan', 'មេសរប្រចាន់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140807, 1408, '{\"en\":\"Prey Pnov\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1796\\u17d2\\u1793\\u17c5\"}', 'Prey Pnov', 'ព្រៃព្នៅ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140808, 1408, '{\"en\":\"Prey Sniet\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u179f\\u17d2\\u1793\\u17c0\\u178f\"}', 'Prey Sniet', 'ព្រៃស្នៀត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140809, 1408, '{\"en\":\"Prey Sralet\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u179f\\u17d2\\u179a\\u17a1\\u17b7\\u178f\"}', 'Prey Sralet', 'ព្រៃស្រឡិត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140810, 1408, '{\"en\":\"Reab\",\"kh\":\"\\u179a\\u17b6\\u1794\"}', 'Reab', 'រាប', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140811, 1408, '{\"en\":\"Roka\",\"kh\":\"\\u179a\\u1780\\u17b6\"}', 'Roka', 'រកា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140901, 1409, '{\"en\":\"Angkor Reach\",\"kh\":\"\\u17a2\\u1784\\u17d2\\u1782\\u179a\\u179a\\u17b6\\u1787\\u17d2\\u1799\"}', 'Angkor Reach', 'អង្គររាជ្យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140902, 1409, '{\"en\":\"Banteay Chakrei\",\"kh\":\"\\u1794\\u1793\\u17d2\\u1791\\u17b6\\u1799\\u1785\\u1780\\u17d2\\u179a\\u17b8\"}', 'Banteay Chakrei', 'បន្ទាយចក្រី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140903, 1409, '{\"en\":\"Boeng Daol\",\"kh\":\"\\u1794\\u17b9\\u1784\\u178a\\u17c4\\u179b\"}', 'Boeng Daol', 'បឹងដោល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140904, 1409, '{\"en\":\"Chey Kampok\",\"kh\":\"\\u1787\\u17c3\\u1780\\u17c6\\u1796\\u1780\"}', 'Chey Kampok', 'ជៃកំពក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140905, 1409, '{\"en\":\"Kampong Soeng\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u179f\\u17b9\\u1784\"}', 'Kampong Soeng', 'កំពង់សឹង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140906, 1409, '{\"en\":\"Krang Svay\",\"kh\":\"\\u1780\\u17d2\\u179a\\u17b6\\u17c6\\u1784\\u179f\\u17d2\\u179c\\u17b6\\u1799\"}', 'Krang Svay', 'ក្រាំងស្វាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140907, 1409, '{\"en\":\"Lvea\",\"kh\":\"\\u179b\\u17d2\\u179c\\u17b6\"}', 'Lvea', 'ល្វា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140908, 1409, '{\"en\":\"Preah Sdach\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c7\\u179f\\u17d2\\u178a\\u17c1\\u1785\"}', 'Preah Sdach', 'ព្រះស្ដេច', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140909, 1409, '{\"en\":\"Reathor\",\"kh\":\"\\u179a\\u17b6\\u1792\\u179a\"}', 'Reathor', 'រាធរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140910, 1409, '{\"en\":\"Rumchek\",\"kh\":\"\\u179a\\u17c6\\u1785\\u17c1\\u1780\"}', 'Rumchek', 'រំចេក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(140911, 1409, '{\"en\":\"Sena Reach Otdam\",\"kh\":\"\\u179f\\u17c1\\u1793\\u17b6\\u179a\\u17b6\\u1787\\u17a7\\u178f\\u17d2\\u178a\\u1798\"}', 'Sena Reach Otdam', 'សេនារាជឧត្ដម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(141001, 1410, '{\"en\":\"Baray\",\"kh\":\"\\u1794\\u17b6\\u179a\\u17b6\\u1799\\u178e\\u17cd\"}', 'Baray', 'បារាយណ៍', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(141002, 1410, '{\"en\":\"Cheung Tuek\",\"kh\":\"\\u1787\\u17be\\u1784\\u1791\\u17b9\\u1780\"}', 'Cheung Tuek', 'ជើងទឹក', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(141003, 1410, '{\"en\":\"Kampong Leav\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u179b\\u17b6\\u179c\"}', 'Kampong Leav', 'កំពង់លាវ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(141004, 1410, '{\"en\":\"Ta Kao\",\"kh\":\"\\u178f\\u17b6\\u1780\\u17c4\"}', 'Ta Kao', 'តាកោ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(141101, 1411, '{\"en\":\"Pou Rieng\",\"kh\":\"\\u1796\\u17c4\\u1792\\u17b7\\u17cd\\u179a\\u17c0\\u1784\"}', 'Pou Rieng', 'ពោធិ៍រៀង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(141102, 1411, '{\"en\":\"Preaek Anteah\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u17a2\\u1793\\u17d2\\u1791\\u17c7\"}', 'Preaek Anteah', 'ព្រែកអន្ទះ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(141103, 1411, '{\"en\":\"Preaek Chrey\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1787\\u17d2\\u179a\\u17c3\"}', 'Preaek Chrey', 'ព្រែកជ្រៃ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(141104, 1411, '{\"en\":\"Prey Kanlaong\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1780\\u1793\\u17d2\\u179b\\u17c4\\u1784\"}', 'Prey Kanlaong', 'ព្រៃកន្លោង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(141106, 1411, '{\"en\":\"Kampong Ruessei\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u17ab\\u179f\\u17d2\\u179f\\u17b8\"}', 'Kampong Ruessei', 'កំពង់ឫស្សី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(141107, 1411, '{\"en\":\"Preaek Ta Sar\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u178f\\u17b6\\u179f\\u179a\"}', 'Preaek Ta Sar', 'ព្រែកតាសរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(141201, 1412, '{\"en\":\"Ampil Krau\",\"kh\":\"\\u17a2\\u17c6\\u1796\\u17b7\\u179b\\u1780\\u17d2\\u179a\\u17c5\"}', 'Ampil Krau', 'អំពិលក្រៅ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(141202, 1412, '{\"en\":\"Chrey Khmum\",\"kh\":\"\\u1787\\u17d2\\u179a\\u17c3\\u1783\\u17d2\\u1798\\u17bb\\u17c6\"}', 'Chrey Khmum', 'ជ្រៃឃ្មុំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(141203, 1412, '{\"en\":\"Lve\",\"kh\":\"\\u179b\\u17d2\\u179c\\u17c1\"}', 'Lve', 'ល្វេ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(141204, 1412, '{\"en\":\"Pnov Ti Muoy\",\"kh\":\"\\u1796\\u17d2\\u1793\\u17c5\\u1791\\u17b8 \\u17e1\"}', 'Pnov Ti Muoy', 'ព្នៅទី ១', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(141205, 1412, '{\"en\":\"Pnov Ti Pir\",\"kh\":\"\\u1796\\u17d2\\u1793\\u17c5\\u1791\\u17b8 \\u17e2\"}', 'Pnov Ti Pir', 'ព្នៅទី ២', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(141206, 1412, '{\"en\":\"Pou Ti\",\"kh\":\"\\u1796\\u17c4\\u1792\\u17b7\\u17cd\\u1791\\u17b8\"}', 'Pou Ti', 'ពោធិ៍ទី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(141207, 1412, '{\"en\":\"Preaek Changkran\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1785\\u1784\\u17d2\\u1780\\u17d2\\u179a\\u17b6\\u1793\"}', 'Preaek Changkran', 'ព្រែកចង្ក្រាន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(141208, 1412, '{\"en\":\"Prey Daeum Thnoeng\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u178a\\u17be\\u1798\\u1790\\u17d2\\u1793\\u17b9\\u1784\"}', 'Prey Daeum Thnoeng', 'ព្រៃដើមថ្នឹង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(141209, 1412, '{\"en\":\"Prey Tueng\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1791\\u17b9\\u1784\"}', 'Prey Tueng', 'ព្រៃទឹង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(141210, 1412, '{\"en\":\"Rumlech\",\"kh\":\"\\u179a\\u17c6\\u179b\\u17c1\\u1785\"}', 'Rumlech', 'រំលេច', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(141211, 1412, '{\"en\":\"Ruessei Sanh\",\"kh\":\"\\u17ab\\u179f\\u17d2\\u179f\\u17b8\\u179f\\u17b6\\u1789\\u17cb\"}', 'Ruessei Sanh', 'ឫស្សីសាញ់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(141301, 1413, '{\"en\":\"Angkor Tret\",\"kh\":\"\\u17a2\\u1784\\u17d2\\u1782\\u179a\\u1791\\u17d2\\u179a\\u17c1\\u178f\"}', 'Angkor Tret', 'អង្គរទ្រេត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(141302, 1413, '{\"en\":\"Chea Khlang\",\"kh\":\"\\u1787\\u17b6\\u1781\\u17d2\\u179b\\u17b6\\u1784\"}', 'Chea Khlang', 'ជាខ្លាង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(141303, 1413, '{\"en\":\"Chrey\",\"kh\":\"\\u1787\\u17d2\\u179a\\u17c3\"}', 'Chrey', 'ជ្រៃ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(141304, 1413, '{\"en\":\"Damrei Puon\",\"kh\":\"\\u178a\\u17c6\\u179a\\u17b8\\u1796\\u17bd\\u1793\"}', 'Damrei Puon', 'ដំរីពួន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(141305, 1413, '{\"en\":\"Me Bon\",\"kh\":\"\\u1798\\u17c1\\u1794\\u17bb\\u178e\\u17d2\\u1799\"}', 'Me Bon', 'មេបុណ្យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(141306, 1413, '{\"en\":\"Pean Roung\",\"kh\":\"\\u1796\\u17b6\\u1793\\u179a\\u17c4\\u1784\"}', 'Pean Roung', 'ពានរោង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(141307, 1413, '{\"en\":\"Popueus\",\"kh\":\"\\u1796\\u1796\\u17ba\\u179f\"}', 'Popueus', 'ពពឺស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(141308, 1413, '{\"en\":\"Prey Khla\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1781\\u17d2\\u179b\\u17b6\"}', 'Prey Khla', 'ព្រៃខ្លា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(141309, 1413, '{\"en\":\"Samraong\",\"kh\":\"\\u179f\\u17c6\\u179a\\u17c4\\u1784\"}', 'Samraong', 'សំរោង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(141310, 1413, '{\"en\":\"Svay Antor\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u17a2\\u1793\\u17d2\\u1791\\u179a\"}', 'Svay Antor', 'ស្វាយអន្ទរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(141311, 1413, '{\"en\":\"Tuek Thla\",\"kh\":\"\\u1791\\u17b9\\u1780\\u1790\\u17d2\\u179b\\u17b6\"}', 'Tuek Thla', 'ទឹកថ្លា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150101, 1501, '{\"en\":\"Boeng Bat Kandaol\",\"kh\":\"\\u1794\\u17b9\\u1784\\u1794\\u178f\\u17cb\\u1780\\u178e\\u17d2\\u178a\\u17b6\\u179b\"}', 'Boeng Bat Kandaol', 'បឹងបត់កណ្ដាល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150102, 1501, '{\"en\":\"Boeng Khnar\",\"kh\":\"\\u1794\\u17b9\\u1784\\u1781\\u17d2\\u1793\\u17b6\\u179a\"}', 'Boeng Khnar', 'បឹងខ្នារ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150103, 1501, '{\"en\":\"Khnar Totueng\",\"kh\":\"\\u1781\\u17d2\\u1793\\u17b6\\u179a\\u1791\\u1791\\u17b9\\u1784\"}', 'Khnar Totueng', 'ខ្នារទទឹង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150104, 1501, '{\"en\":\"Me Tuek\",\"kh\":\"\\u1798\\u17c1\\u1791\\u17b9\\u1780\"}', 'Me Tuek', 'មេទឹក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150105, 1501, '{\"en\":\"Ou Ta Paong\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u178f\\u17b6\\u1794\\u17c9\\u17c4\\u1784\"}', 'Ou Ta Paong', 'អូរតាប៉ោង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150106, 1501, '{\"en\":\"Rumlech\",\"kh\":\"\\u179a\\u17c6\\u179b\\u17c1\\u1785\"}', 'Rumlech', 'រំលេច', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150107, 1501, '{\"en\":\"Snam Preah\",\"kh\":\"\\u179f\\u17d2\\u1793\\u17b6\\u1798\\u1796\\u17d2\\u179a\\u17c7\"}', 'Snam Preah', 'ស្នាមព្រះ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150108, 1501, '{\"en\":\"Svay Doun Kaev\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u178a\\u17bc\\u1793\\u1780\\u17c2\\u179c\"}', 'Svay Doun Kaev', 'ស្វាយដូនកែវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150110, 1501, '{\"en\":\"Trapeang chorng\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u1787\\u1784\"}', 'Trapeang chorng', 'ត្រពាំងជង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150201, 1502, '{\"en\":\"Anlong Vil\",\"kh\":\"\\u17a2\\u1793\\u17d2\\u179b\\u1784\\u17cb\\u179c\\u17b7\\u179b\"}', 'Anlong Vil', 'អន្លង់វិល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150203, 1502, '{\"en\":\"Kandieng\",\"kh\":\"\\u1780\\u178e\\u17d2\\u178a\\u17c0\\u1784\"}', 'Kandieng', 'កណ្ដៀង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150204, 1502, '{\"en\":\"Kanhchor\",\"kh\":\"\\u1780\\u1789\\u17d2\\u1787\\u179a\"}', 'Kanhchor', 'កញ្ជរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150205, 1502, '{\"en\":\"Reang Til\",\"kh\":\"\\u179a\\u17b6\\u17c6\\u1784\\u1791\\u17b7\\u179b\"}', 'Reang Til', 'រាំងទិល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150206, 1502, '{\"en\":\"Srae Sdok\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17c2\\u179f\\u17d2\\u178a\\u17bb\\u1780\"}', 'Srae Sdok', 'ស្រែស្ដុក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150207, 1502, '{\"en\":\"Svay Luong\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u179b\\u17bd\\u1784\"}', 'Svay Luong', 'ស្វាយលួង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150208, 1502, '{\"en\":\"Sya\",\"kh\":\"\\u179f\\u17d2\\u1799\\u17b6\"}', 'Sya', 'ស្យា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150209, 1502, '{\"en\":\"Veal\",\"kh\":\"\\u179c\\u17b6\\u179b\"}', 'Veal', 'វាល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150210, 1502, '{\"en\":\"Kaoh Chum\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u1787\\u17bb\\u17c6\"}', 'Kaoh Chum', 'កោះជុំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150301, 1503, '{\"en\":\"Anlong Tnaot\",\"kh\":\"\\u17a2\\u1793\\u17d2\\u179b\\u1784\\u17cb\\u178f\\u17d2\\u1793\\u17c4\\u178f\"}', 'Anlong Tnaot', 'អន្លង់ត្នោត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150302, 1503, '{\"en\":\"Ansa Chambak\",\"kh\":\"\\u17a2\\u1793\\u17d2\\u179f\\u17b6\\u1785\\u17c6\\u1794\\u1780\\u17cb\"}', 'Ansa Chambak', 'អន្សាចំបក់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150303, 1503, '{\"en\":\"Boeng Kantuot\",\"kh\":\"\\u1794\\u17b9\\u1784\\u1780\\u1793\\u17d2\\u1791\\u17bd\\u178f\"}', 'Boeng Kantuot', 'បឹងកន្ទួត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150304, 1503, '{\"en\":\"Chheu Tom\",\"kh\":\"\\u1788\\u17be\\u178f\\u17bb\\u17c6\"}', 'Chheu Tom', 'ឈើតុំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150305, 1503, '{\"en\":\"Kampong Luong\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u179b\\u17bd\\u1784\"}', 'Kampong Luong', 'កំពង់លួង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150306, 1503, '{\"en\":\"Kampong Pou\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1796\\u17c4\\u1792\\u17b7\\u17cd\"}', 'Kampong Pou', 'កំពង់ពោធិ៍', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150307, 1503, '{\"en\":\"Kbal Trach\",\"kh\":\"\\u1780\\u17d2\\u1794\\u17b6\\u179b\\u178f\\u17d2\\u179a\\u17b6\\u1785\"}', 'Kbal Trach', 'ក្បាលត្រាច', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150308, 1503, '{\"en\":\"Ou Sandan\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u179f\\u178e\\u17d2\\u178a\\u17b6\\u1793\\u17cb\"}', 'Ou Sandan', 'អូរសណ្ដាន់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150309, 1503, '{\"en\":\"Sna Ansa\",\"kh\":\"\\u179f\\u17d2\\u1793\\u17b6\\u17a2\\u1793\\u17d2\\u179f\\u17b6\"}', 'Sna Ansa', 'ស្នាអន្សា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150310, 1503, '{\"en\":\"Svay Sa\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u179f\"}', 'Svay Sa', 'ស្វាយស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150311, 1503, '{\"en\":\"Tnaot Chum\",\"kh\":\"\\u178f\\u17d2\\u1793\\u17c4\\u178f\\u1787\\u17bb\\u17c6\"}', 'Tnaot Chum', 'ត្នោតជុំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150401, 1504, '{\"en\":\"Bak Chenhchien\",\"kh\":\"\\u1794\\u17b6\\u1780\\u17cb\\u1785\\u17b7\\u1789\\u17d2\\u1785\\u17c0\\u1793\"}', 'Bak Chenhchien', 'បាក់ចិញ្ចៀន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1);
INSERT INTO `tbl_location` (`location_id`, `parent_id`, `title`, `title_en`, `title_kh`, `shortname`, `type`, `prefix`, `image`, `display`, `tag`, `trash`, `ordering`, `ab_id`, `blongto`) VALUES
(150402, 1504, '{\"en\":\"Leach\",\"kh\":\"\\u179b\\u17b6\\u1785\"}', 'Leach', 'លាច', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150404, 1504, '{\"en\":\"Prongil\",\"kh\":\"\\u1796\\u17d2\\u179a\\u1784\\u17b7\\u179b\"}', 'Prongil', 'ព្រងិល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150405, 1504, '{\"en\":\"Rokat\",\"kh\":\"\\u179a\\u1780\\u17b6\\u178f\"}', 'Rokat', 'រកាត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150406, 1504, '{\"en\":\"Santreae\",\"kh\":\"\\u179f\\u1793\\u17d2\\u1791\\u17d2\\u179a\\u17c2\"}', 'Santreae', 'សន្ទ្រែ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150407, 1504, '{\"en\":\"Samraong\",\"kh\":\"\\u179f\\u17c6\\u179a\\u17c4\\u1784\"}', 'Samraong', 'សំរោង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150501, 1505, '{\"en\":\"Chamraeun Phal\",\"kh\":\"\\u1785\\u17c6\\u179a\\u17be\\u1793\\u1795\\u179b\"}', 'Chamraeun Phal', 'ចំរើនផល', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(150503, 1505, '{\"en\":\"Lolok Sa\",\"kh\":\"\\u179b\\u179b\\u1780\\u179f\"}', 'Lolok Sa', 'លលកស', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(150504, 1505, '{\"en\":\"Phteah Prey\",\"kh\":\"\\u1795\\u17d2\\u1791\\u17c7\\u1796\\u17d2\\u179a\\u17c3\"}', 'Phteah Prey', 'ផ្ទះព្រៃ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(150505, 1505, '{\"en\":\"Prey Nhi\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1789\\u17b8\"}', 'Prey Nhi', 'ព្រៃញី', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(150506, 1505, '{\"en\":\"Roleab\",\"kh\":\"\\u179a\\u179b\\u17b6\\u1794\"}', 'Roleab', 'រលាប', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(150507, 1505, '{\"en\":\"Svay At\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u17a2\\u17b6\\u178f\\u17cb\"}', 'Svay At', 'ស្វាយអាត់', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(150508, 1505, '{\"en\":\"Banteay Dei\",\"kh\":\"\\u1794\\u1793\\u17d2\\u1791\\u17b6\\u1799\\u178a\\u17b8\"}', 'Banteay Dei', 'បន្ទាយដី', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(150601, 1506, '{\"en\":\"Ou Saom\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u179f\\u17c4\\u1798\"}', 'Ou Saom', 'អូរសោម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150602, 1506, '{\"en\":\"Krapeu Pir\",\"kh\":\"\\u1780\\u17d2\\u179a\\u1796\\u17be\\u1796\\u17b8\\u179a\"}', 'Krapeu Pir', 'ក្រពើពីរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150603, 1506, '{\"en\":\"Anlong Reab\",\"kh\":\"\\u17a2\\u1793\\u17d2\\u179b\\u1784\\u17cb\\u179a\\u17b6\\u1794\"}', 'Anlong Reab', 'អន្លង់រាប', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150604, 1506, '{\"en\":\"Pramaoy\",\"kh\":\"\\u1794\\u17d2\\u179a\\u1798\\u17c9\\u17c4\\u1799\"}', 'Pramaoy', 'ប្រម៉ោយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150605, 1506, '{\"en\":\"Thma Da\",\"kh\":\"\\u1790\\u17d2\\u1798\\u178a\\u17b6\"}', 'Thma Da', 'ថ្មដា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150701, 1507, '{\"en\":\"Ta Lou\",\"kh\":\"\\u178f\\u17b6\\u179b\\u17c4\"}', 'Ta Lou', 'តាលោ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(150702, 1507, '{\"en\":\"Phteah Rung\",\"kh\":\"\\u1795\\u17d2\\u1791\\u17c7\\u179a\\u17bb\\u1784\"}', 'Phteah Rung', 'ផ្ទះរុង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160101, 1601, '{\"en\":\"Malik\",\"kh\":\"\\u1798\\u17c9\\u17b6\\u179b\\u17b7\\u1780\"}', 'Malik', 'ម៉ាលិក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160103, 1601, '{\"en\":\"Nhang\",\"kh\":\"\\u1789\\u17c9\\u17b6\\u1784\"}', 'Nhang', 'ញ៉ាង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160104, 1601, '{\"en\":\"Ta Lav\",\"kh\":\"\\u178f\\u17b6\\u17a1\\u17b6\\u179c\"}', 'Ta Lav', 'តាឡាវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160201, 1602, '{\"en\":\"Kachanh\",\"kh\":\"\\u1780\\u17b6\\u1785\\u17b6\\u1789\"}', 'Kachanh', 'កាចាញ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(160202, 1602, '{\"en\":\"Labansiek\",\"kh\":\"\\u17a1\\u17b6\\u1794\\u17b6\\u1793\\u179f\\u17c0\\u1780\"}', 'Labansiek', 'ឡាបានសៀក', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(160203, 1602, '{\"en\":\"Yeak Laom\",\"kh\":\"\\u1799\\u1780\\u17d2\\u1781\\u17a1\\u17c4\\u1798\"}', 'Yeak Laom', 'យក្ខឡោម', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(160204, 1602, '{\"en\":\"Boeng Kansaeng\",\"kh\":\"\\u1794\\u17b9\\u1784\\u1780\\u1793\\u17d2\\u179f\\u17c2\\u1784\"}', 'Boeng Kansaeng', 'បឹងកន្សែង', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(160301, 1603, '{\"en\":\"Kak\",\"kh\":\"\\u1780\\u1780\\u17cb\"}', 'Kak', 'កក់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160302, 1603, '{\"en\":\"Keh Chong\",\"kh\":\"\\u1780\\u17b7\\u17c7\\u1785\\u17bb\\u1784\"}', 'Keh Chong', 'កិះចុង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160303, 1603, '{\"en\":\"La Minh\",\"kh\":\"\\u17a1\\u17b6\\u1798\\u17b8\\u1789\"}', 'La Minh', 'ឡាមីញ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160304, 1603, '{\"en\":\"Lung Khung\",\"kh\":\"\\u179b\\u17bb\\u1784\\u1783\\u17bb\\u1784\"}', 'Lung Khung', 'លុងឃុង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160305, 1603, '{\"en\":\"Saeung\",\"kh\":\"\\u179f\\u17ca\\u17be\\u1784\"}', 'Saeung', 'ស៊ើង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160306, 1603, '{\"en\":\"Ting Chak\",\"kh\":\"\\u1791\\u17b8\\u1784\\u1785\\u17b6\\u1780\\u17cb\"}', 'Ting Chak', 'ទីងចាក់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160401, 1604, '{\"en\":\"Serei Mongkol\",\"kh\":\"\\u179f\\u17b7\\u179a\\u17b8\\u1798\\u1784\\u17d2\\u1782\\u179b\"}', 'Serei Mongkol', 'សិរីមង្គល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160402, 1604, '{\"en\":\"Srae Angkrorng\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17c2\\u17a2\\u1784\\u17d2\\u1782\\u17d2\\u179a\\u1784\"}', 'Srae Angkrorng', 'ស្រែអង្គ្រង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160403, 1604, '{\"en\":\"Ta Ang\",\"kh\":\"\\u178f\\u17b6\\u17a2\\u1784\"}', 'Ta Ang', 'តាអង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160404, 1604, '{\"en\":\"Teun\",\"kh\":\"\\u178f\\u17ba\\u1793\"}', 'Teun', 'តឺន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160405, 1604, '{\"en\":\"Trapeang Chres\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u1785\\u17d2\\u179a\\u17c1\\u179f\"}', 'Trapeang Chres', 'ត្រពាំងច្រេស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160406, 1604, '{\"en\":\"Trapeang Kraham\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u1780\\u17d2\\u179a\\u17a0\\u1798\"}', 'Trapeang Kraham', 'ត្រពាំងក្រហម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160501, 1605, '{\"en\":\"Chey Otdam\",\"kh\":\"\\u1787\\u17d0\\u1799\\u17a7\\u178f\\u17d2\\u178a\\u1798\"}', 'Chey Otdam', 'ជ័យឧត្ដម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160502, 1605, '{\"en\":\"Ka Laeng\",\"kh\":\"\\u1780\\u17b6\\u17a1\\u17c2\\u1784\"}', 'Ka Laeng', 'កាឡែង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160503, 1605, '{\"en\":\"Lbang Muoy\",\"kh\":\"\\u179b\\u17d2\\u1794\\u17b6\\u17c6\\u1784\\u17e1\"}', 'Lbang Muoy', 'ល្បាំង១', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160504, 1605, '{\"en\":\"Lbang Pir\",\"kh\":\"\\u179b\\u17d2\\u1794\\u17b6\\u17c6\\u1784\\u17e2\"}', 'Lbang Pir', 'ល្បាំង២', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160505, 1605, '{\"en\":\"Ba Tang\",\"kh\":\"\\u1794\\u17b6\\u178f\\u17b6\\u1784\"}', 'Ba Tang', 'បាតាង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160506, 1605, '{\"en\":\"Seda\",\"kh\":\"\\u179f\\u17c1\\u178a\\u17b6\"}', 'Seda', 'សេដា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160601, 1606, '{\"en\":\"Cha Ung\",\"kh\":\"\\u1785\\u17b6\\u17a2\\u17ca\\u17bb\\u1784\"}', 'Cha Ung', 'ចាអ៊ុង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160602, 1606, '{\"en\":\"Pouy\",\"kh\":\"\\u1794\\u17c9\\u17bc\\u1799\"}', 'Pouy', 'ប៉ូយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160603, 1606, '{\"en\":\"Aekakpheap\",\"kh\":\"\\u17af\\u1780\\u1797\\u17b6\\u1796\"}', 'Aekakpheap', 'ឯកភាព', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160604, 1606, '{\"en\":\"Kalai\",\"kh\":\"\\u1780\\u17b6\\u17a1\\u17c3\"}', 'Kalai', 'កាឡៃ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160605, 1606, '{\"en\":\"Ou Chum\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u1787\\u17bb\\u17c6\"}', 'Ou Chum', 'អូរជុំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160606, 1606, '{\"en\":\"Sameakki\",\"kh\":\"\\u179f\\u17b6\\u1798\\u1782\\u17d2\\u1782\\u17b8\"}', 'Sameakki', 'សាមគ្គី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160607, 1606, '{\"en\":\"L\'ak\",\"kh\":\"\\u179b\\u17d2\\u17a2\\u1780\\u17cb\"}', 'L\'ak', 'ល្អក់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160701, 1607, '{\"en\":\"Bar Kham\",\"kh\":\"\\u1794\\u179a\\u1781\\u17b6\\u17c6\"}', 'Bar Kham', 'បរខាំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160702, 1607, '{\"en\":\"Lum Choar\",\"kh\":\"\\u179b\\u17c6\\u1787\\u17d0\\u179a\"}', 'Lum Choar', 'លំជ័រ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160703, 1607, '{\"en\":\"Pak Nhai\",\"kh\":\"\\u1794\\u17c9\\u1780\\u17cb\\u1789\\u17c9\\u17c3\"}', 'Pak Nhai', 'ប៉ក់ញ៉ៃ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160704, 1607, '{\"en\":\"Pa Te\",\"kh\":\"\\u1794\\u17c9\\u17b6\\u178f\\u17c1\"}', 'Pa Te', 'ប៉ាតេ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160705, 1607, '{\"en\":\"Sesan\",\"kh\":\"\\u179f\\u17c1\\u179f\\u17b6\\u1793\"}', 'Sesan', 'សេសាន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160706, 1607, '{\"en\":\"Saom Thum\",\"kh\":\"\\u179f\\u17c4\\u1798\\u1792\\u17c6\"}', 'Saom Thum', 'សោមធំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160707, 1607, '{\"en\":\"Ya Tung\",\"kh\":\"\\u1799\\u17c9\\u17b6\\u1791\\u17bb\\u1784\"}', 'Ya Tung', 'យ៉ាទុង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160801, 1608, '{\"en\":\"Ta Veaeng Leu\",\"kh\":\"\\u178f\\u17b6\\u179c\\u17c2\\u1784\\u179b\\u17be\"}', 'Ta Veaeng Leu', 'តាវែងលើ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160802, 1608, '{\"en\":\"Ta Veaeng Kraom\",\"kh\":\"\\u178f\\u17b6\\u179c\\u17c2\\u1784\\u1780\\u17d2\\u179a\\u17c4\\u1798\"}', 'Ta Veaeng Kraom', 'តាវែងក្រោម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160901, 1609, '{\"en\":\"Pong\",\"kh\":\"\\u1794\\u17c9\\u17bb\\u1784\"}', 'Pong', 'ប៉ុង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160903, 1609, '{\"en\":\"Hat Pak\",\"kh\":\"\\u17a0\\u17b6\\u178f\\u17cb\\u1794\\u17c9\\u1780\\u17cb\"}', 'Hat Pak', 'ហាត់ប៉ក់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160904, 1609, '{\"en\":\"Ka Choun\",\"kh\":\"\\u1780\\u17b6\\u1785\\u17bc\\u1793\"}', 'Ka Choun', 'កាចូន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160905, 1609, '{\"en\":\"Kaoh Pang\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u1794\\u17c9\\u1784\\u17cb\"}', 'Kaoh Pang', 'កោះប៉ង់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160906, 1609, '{\"en\":\"Kaoh Peak\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u1796\\u17b6\\u1780\\u17d2\\u1799\"}', 'Kaoh Peak', 'កោះពាក្យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160907, 1609, '{\"en\":\"Kok Lak\",\"kh\":\"\\u1780\\u17bb\\u1780\\u17a1\\u17b6\\u1780\\u17cb\"}', 'Kok Lak', 'កុកឡាក់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160908, 1609, '{\"en\":\"Pa Kalan\",\"kh\":\"\\u1794\\u17c9\\u17b6\\u1780\\u17b6\\u17a1\\u17b6\\u1793\\u17cb\"}', 'Pa Kalan', 'ប៉ាកាឡាន់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160909, 1609, '{\"en\":\"Phnum Kok\",\"kh\":\"\\u1797\\u17d2\\u1793\\u17c6\\u1780\\u17bb\\u1780\"}', 'Phnum Kok', 'ភ្នំកុក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(160910, 1609, '{\"en\":\"Veun Sai\",\"kh\":\"\\u179c\\u17be\\u1793\\u179f\\u17c3\"}', 'Veun Sai', 'វើនសៃ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170101, 1701, '{\"en\":\"Char Chhuk\",\"kh\":\"\\u1785\\u17b6\\u179a\\u1788\\u17bc\\u1780\"}', 'Char Chhuk', 'ចារឈូក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170102, 1701, '{\"en\":\"Doun Peng\",\"kh\":\"\\u178a\\u17bc\\u1793\\u1796\\u17c1\\u1784\"}', 'Doun Peng', 'ដូនពេង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170103, 1701, '{\"en\":\"Kouk Doung\",\"kh\":\"\\u1782\\u17c4\\u1780\\u178a\\u17bc\\u1784\"}', 'Kouk Doung', 'គោកដូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170104, 1701, '{\"en\":\"Koul\",\"kh\":\"\\u1782\\u17c4\\u179b\"}', 'Koul', 'គោល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170105, 1701, '{\"en\":\"Nokor Pheas\",\"kh\":\"\\u1793\\u1782\\u179a\\u1797\\u17b6\\u179f\"}', 'Nokor Pheas', 'នគរភាស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170106, 1701, '{\"en\":\"Srae Khvav\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17c2\\u1781\\u17d2\\u179c\\u17b6\\u179c\"}', 'Srae Khvav', 'ស្រែខ្វាវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170107, 1701, '{\"en\":\"Ta Saom\",\"kh\":\"\\u178f\\u17b6\\u179f\\u17c4\\u1798\"}', 'Ta Saom', 'តាសោម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170201, 1702, '{\"en\":\"Chob Ta Trav\",\"kh\":\"\\u1787\\u1794\\u17cb\\u178f\\u17b6\\u178f\\u17d2\\u179a\\u17b6\\u179c\"}', 'Chob Ta Trav', 'ជប់តាត្រាវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170202, 1702, '{\"en\":\"Leang Dai\",\"kh\":\"\\u179b\\u17b6\\u1784\\u178a\\u17c3\"}', 'Leang Dai', 'លាងដៃ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170203, 1702, '{\"en\":\"Peak Snaeng\",\"kh\":\"\\u1796\\u17b6\\u1780\\u17cb\\u179f\\u17d2\\u1793\\u17c2\\u1784\"}', 'Peak Snaeng', 'ពាក់ស្នែង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170204, 1702, '{\"en\":\"Svay Chek\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u1785\\u17c1\\u1780\"}', 'Svay Chek', 'ស្វាយចេក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170301, 1703, '{\"en\":\"Khnar Sanday\",\"kh\":\"\\u1781\\u17d2\\u1793\\u17b6\\u179a\\u179f\\u178e\\u17d2\\u178a\\u17b6\\u1799\"}', 'Khnar Sanday', 'ខ្នារសណ្ដាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170302, 1703, '{\"en\":\"Khun Ream\",\"kh\":\"\\u1783\\u17bb\\u1793\\u179a\\u17b6\\u1798\"}', 'Khun Ream', 'ឃុនរាម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170303, 1703, '{\"en\":\"Preah Dak\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c7\\u178a\\u17b6\\u1780\\u17cb\"}', 'Preah Dak', 'ព្រះដាក់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170304, 1703, '{\"en\":\"Rumchek\",\"kh\":\"\\u179a\\u17c6\\u1785\\u17c1\\u1780\"}', 'Rumchek', 'រំចេក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170305, 1703, '{\"en\":\"Run Ta Aek\",\"kh\":\"\\u179a\\u17bb\\u1793\\u178f\\u17b6\\u17af\\u1780\"}', 'Run Ta Aek', 'រុនតាឯក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170306, 1703, '{\"en\":\"Tbaeng\",\"kh\":\"\\u178f\\u17d2\\u1794\\u17c2\\u1784\"}', 'Tbaeng', 'ត្បែង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170401, 1704, '{\"en\":\"Anlong Samnar\",\"kh\":\"\\u17a2\\u1793\\u17d2\\u179b\\u1784\\u17cb\\u179f\\u17c6\\u178e\\u179a\"}', 'Anlong Samnar', 'អន្លង់សំណរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170402, 1704, '{\"en\":\"Chi Kraeng\",\"kh\":\"\\u1787\\u17b8\\u1780\\u17d2\\u179a\\u17c2\\u1784\"}', 'Chi Kraeng', 'ជីក្រែង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170403, 1704, '{\"en\":\"Kampong Kdei\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1780\\u17d2\\u178a\\u17b8\"}', 'Kampong Kdei', 'កំពង់ក្ដី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170404, 1704, '{\"en\":\"Khvav\",\"kh\":\"\\u1781\\u17d2\\u179c\\u17b6\\u179c\"}', 'Khvav', 'ខ្វាវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170405, 1704, '{\"en\":\"Kouk Thlok Kraom\",\"kh\":\"\\u1782\\u17c4\\u1780\\u1792\\u17d2\\u179b\\u1780\\u1780\\u17d2\\u179a\\u17c4\\u1798\"}', 'Kouk Thlok Kraom', 'គោកធ្លកក្រោម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170406, 1704, '{\"en\":\"Kouk Thlok Leu\",\"kh\":\"\\u1782\\u17c4\\u1780\\u1792\\u17d2\\u179b\\u1780\\u179b\\u17be\"}', 'Kouk Thlok Leu', 'គោកធ្លកលើ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170407, 1704, '{\"en\":\"Lveaeng Ruessei\",\"kh\":\"\\u179b\\u17d2\\u179c\\u17c2\\u1784\\u17ab\\u179f\\u17d2\\u179f\\u17b8\"}', 'Lveaeng Ruessei', 'ល្វែងឫស្សី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170408, 1704, '{\"en\":\"Pongro Kraom\",\"kh\":\"\\u1796\\u1784\\u17d2\\u179a\\u1780\\u17d2\\u179a\\u17c4\\u1798\"}', 'Pongro Kraom', 'ពង្រក្រោម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170409, 1704, '{\"en\":\"Pongro Leu\",\"kh\":\"\\u1796\\u1784\\u17d2\\u179a\\u179b\\u17be\"}', 'Pongro Leu', 'ពង្រលើ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170410, 1704, '{\"en\":\"Ruessei Lok\",\"kh\":\"\\u17ab\\u179f\\u17d2\\u179f\\u17b8\\u179b\\u1780\"}', 'Ruessei Lok', 'ឫស្សីលក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170411, 1704, '{\"en\":\"Sangvaeuy\",\"kh\":\"\\u179f\\u1784\\u17d2\\u179c\\u17be\\u1799\"}', 'Sangvaeuy', 'សង្វើយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170412, 1704, '{\"en\":\"Spean Tnaot\",\"kh\":\"\\u179f\\u17d2\\u1796\\u17b6\\u1793\\u178f\\u17d2\\u1793\\u17c4\\u178f\"}', 'Spean Tnaot', 'ស្ពានត្នោត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170601, 1706, '{\"en\":\"Chanleas Dai\",\"kh\":\"\\u1785\\u1793\\u17d2\\u179b\\u17b6\\u179f\\u178a\\u17c3\"}', 'Chanleas Dai', 'ចន្លាសដៃ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170602, 1706, '{\"en\":\"Kampong Thkov\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1790\\u17d2\\u1780\\u17bc\\u179c\"}', 'Kampong Thkov', 'កំពង់ថ្កូវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170603, 1706, '{\"en\":\"Kralanh\",\"kh\":\"\\u1780\\u17d2\\u179a\\u17a1\\u17b6\\u1789\\u17cb\"}', 'Kralanh', 'ក្រឡាញ់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170604, 1706, '{\"en\":\"Krouch Kor\",\"kh\":\"\\u1780\\u17d2\\u179a\\u17bc\\u1785\\u1782\\u179a\"}', 'Krouch Kor', 'ក្រូចគរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170605, 1706, '{\"en\":\"Roung Kou\",\"kh\":\"\\u179a\\u17c4\\u1784\\u1782\\u17c4\"}', 'Roung Kou', 'រោងគោ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170606, 1706, '{\"en\":\"Sambuor\",\"kh\":\"\\u179f\\u17c6\\u1794\\u17bd\\u179a\"}', 'Sambuor', 'សំបួរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170607, 1706, '{\"en\":\"Saen Sokh\",\"kh\":\"\\u179f\\u17c2\\u1793\\u179f\\u17bb\\u1781\"}', 'Saen Sokh', 'សែនសុខ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170608, 1706, '{\"en\":\"Snuol\",\"kh\":\"\\u179f\\u17d2\\u1793\\u17bd\\u179b\"}', 'Snuol', 'ស្នួល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170609, 1706, '{\"en\":\"Sranal\",\"kh\":\"\\u179f\\u17d2\\u179a\\u178e\\u17b6\\u179b\"}', 'Sranal', 'ស្រណាល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170610, 1706, '{\"en\":\"Ta An\",\"kh\":\"\\u178f\\u17b6\\u17a2\\u17b6\\u1793\"}', 'Ta An', 'តាអាន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170701, 1707, '{\"en\":\"Sasar Sdam\",\"kh\":\"\\u179f\\u179f\\u179a\\u179f\\u17d2\\u178a\\u1798\\u17d2\\u1797\"}', 'Sasar Sdam', 'សសរស្ដម្ភ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170702, 1707, '{\"en\":\"Doun Kaev\",\"kh\":\"\\u178a\\u17bc\\u1793\\u1780\\u17c2\\u179c\"}', 'Doun Kaev', 'ដូនកែវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170703, 1707, '{\"en\":\"Kdei Run\",\"kh\":\"\\u1780\\u17d2\\u178a\\u17b8\\u179a\\u17bb\\u1793\"}', 'Kdei Run', 'ក្ដីរុន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170704, 1707, '{\"en\":\"Kaev Poar\",\"kh\":\"\\u1780\\u17c2\\u179c\\u1796\\u178e\\u17cc\"}', 'Kaev Poar', 'កែវពណ៌', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170705, 1707, '{\"en\":\"Khnat\",\"kh\":\"\\u1781\\u17d2\\u1793\\u17b6\\u178f\"}', 'Khnat', 'ខ្នាត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170707, 1707, '{\"en\":\"Lvea\",\"kh\":\"\\u179b\\u17d2\\u179c\\u17b6\"}', 'Lvea', 'ល្វា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170708, 1707, '{\"en\":\"Mukh Paen\",\"kh\":\"\\u1798\\u17bb\\u1781\\u1794\\u17c9\\u17c2\\u1793\"}', 'Mukh Paen', 'មុខប៉ែន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170709, 1707, '{\"en\":\"Pou Treay\",\"kh\":\"\\u1796\\u17c4\\u1792\\u17b7\\u17cd\\u1791\\u17d2\\u179a\\u17b6\\u1799\"}', 'Pou Treay', 'ពោធិ៍ទ្រាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170710, 1707, '{\"en\":\"Puok\",\"kh\":\"\\u1796\\u17bd\\u1780\"}', 'Puok', 'ពួក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170711, 1707, '{\"en\":\"Prey Chruk\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1787\\u17d2\\u179a\\u17bc\\u1780\"}', 'Prey Chruk', 'ព្រៃជ្រូក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170712, 1707, '{\"en\":\"Reul\",\"kh\":\"\\u179a\\u17be\\u179b\"}', 'Reul', 'រើល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170713, 1707, '{\"en\":\"Samraong Yea\",\"kh\":\"\\u179f\\u17c6\\u179a\\u17c4\\u1784\\u1799\\u17b6\"}', 'Samraong Yea', 'សំរោងយា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170715, 1707, '{\"en\":\"Trei Nhoar\",\"kh\":\"\\u178f\\u17d2\\u179a\\u17b8\\u1789\\u17d0\\u179a\"}', 'Trei Nhoar', 'ត្រីញ័រ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170716, 1707, '{\"en\":\"Yeang\",\"kh\":\"\\u1799\\u17b6\\u1784\"}', 'Yeang', 'យាង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170902, 1709, '{\"en\":\"Bakong\",\"kh\":\"\\u1794\\u17b6\\u1782\\u1784\"}', 'Bakong', 'បាគង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170903, 1709, '{\"en\":\"Ballangk\",\"kh\":\"\\u1794\\u179b\\u17d2\\u179b\\u17d0\\u1784\\u17d2\\u1780\"}', 'Ballangk', 'បល្ល័ង្ក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170904, 1709, '{\"en\":\"Kampong Phluk\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1797\\u17d2\\u179b\\u17bb\\u1780\"}', 'Kampong Phluk', 'កំពង់ភ្លុក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170905, 1709, '{\"en\":\"Kantreang\",\"kh\":\"\\u1780\\u1793\\u17d2\\u1791\\u17d2\\u179a\\u17b6\\u17c6\\u1784\"}', 'Kantreang', 'កន្ទ្រាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170906, 1709, '{\"en\":\"Kandaek\",\"kh\":\"\\u1780\\u178e\\u17d2\\u178a\\u17c2\\u1780\"}', 'Kandaek', 'កណ្ដែក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170907, 1709, '{\"en\":\"Mean Chey\",\"kh\":\"\\u1798\\u17b6\\u1793\\u1787\\u17d0\\u1799\"}', 'Mean Chey', 'មានជ័យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170908, 1709, '{\"en\":\"Roluos\",\"kh\":\"\\u179a\\u179b\\u17bd\\u179f\"}', 'Roluos', 'រលួស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170909, 1709, '{\"en\":\"Trapeang Thum\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u1792\\u17c6\"}', 'Trapeang Thum', 'ត្រពាំងធំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(170910, 1709, '{\"en\":\"Ampil\",\"kh\":\"\\u17a2\\u17c6\\u1796\\u17b7\\u179b\"}', 'Ampil', 'អំពិល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(171001, 1710, '{\"en\":\"Sla Kram\",\"kh\":\"\\u179f\\u17d2\\u179b\\u1780\\u17d2\\u179a\\u17b6\\u1798\"}', 'Sla Kram', 'ស្លក្រាម', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(171002, 1710, '{\"en\":\"Svay Dankum\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u178a\\u1784\\u17d2\\u1782\\u17c6\"}', 'Svay Dankum', 'ស្វាយដង្គំ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(171003, 1710, '{\"en\":\"Kok Chak\",\"kh\":\"\\u1782\\u17c4\\u1780\\u1785\\u1780\"}', 'Kok Chak', 'គោកចក', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(171004, 1710, '{\"en\":\"Sala Kamreuk\",\"kh\":\"\\u179f\\u17b6\\u179b\\u17b6\\u1780\\u17c6\\u179a\\u17be\\u1780\"}', 'Sala Kamreuk', 'សាលាកំរើក', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(171005, 1710, '{\"en\":\"Nokor Thum\",\"kh\":\"\\u1793\\u1782\\u179a\\u1792\\u17c6\"}', 'Nokor Thum', 'នគរធំ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(171006, 1710, '{\"en\":\"Chreav\",\"kh\":\"\\u1787\\u17d2\\u179a\\u17b6\\u179c\"}', 'Chreav', 'ជ្រាវ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(171007, 1710, '{\"en\":\"Chong Khnies\",\"kh\":\"\\u1785\\u17bb\\u1784\\u1783\\u17d2\\u1793\\u17c0\\u179f\"}', 'Chong Khnies', 'ចុងឃ្នៀស', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(171008, 1710, '{\"en\":\"Sngkat Sambuor\",\"kh\":\"\\u179f\\u17c6\\u1794\\u17bd\\u179a\"}', 'Sngkat Sambuor', 'សំបួរ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(171009, 1710, '{\"en\":\"Siem Reab\",\"kh\":\"\\u179f\\u17c0\\u1798\\u179a\\u17b6\\u1794\"}', 'Siem Reab', 'សៀមរាប', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(171010, 1710, '{\"en\":\"Srangae\",\"kh\":\"\\u179f\\u17d2\\u179a\\u1784\\u17c9\\u17c2\"}', 'Srangae', 'ស្រង៉ែ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(171012, 1710, '{\"en\":\"Krabei Riel\",\"kh\":\"\\u1780\\u17d2\\u179a\\u1794\\u17b8\\u179a\\u17c0\\u179b\"}', 'Krabei Riel', 'ក្របីរៀល', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(171013, 1710, '{\"en\":\"Tuek Vil\",\"kh\":\"\\u1791\\u17b9\\u1780\\u179c\\u17b7\\u179b\"}', 'Tuek Vil', 'ទឹកវិល', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(171101, 1711, '{\"en\":\"Chan Sa\",\"kh\":\"\\u1785\\u17b6\\u1793\\u17cb\\u179f\"}', 'Chan Sa', 'ចាន់ស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(171102, 1711, '{\"en\":\"Dam Daek\",\"kh\":\"\\u178a\\u17c6\\u178a\\u17c2\\u1780\"}', 'Dam Daek', 'ដំដែក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(171103, 1711, '{\"en\":\"Dan Run\",\"kh\":\"\\u178a\\u17b6\\u1793\\u179a\\u17bb\\u1793\"}', 'Dan Run', 'ដានរុន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(171104, 1711, '{\"en\":\"Kampong Khleang\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1783\\u17d2\\u179b\\u17b6\\u17c6\\u1784\"}', 'Kampong Khleang', 'កំពង់ឃ្លាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(171105, 1711, '{\"en\":\"Kien Sangkae\",\"kh\":\"\\u1780\\u17c0\\u1793\\u179f\\u1784\\u17d2\\u1780\\u17c2\"}', 'Kien Sangkae', 'កៀនសង្កែ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(171106, 1711, '{\"en\":\"Khchas\",\"kh\":\"\\u1781\\u17d2\\u1785\\u17b6\\u179f\\u17cb\"}', 'Khchas', 'ខ្ចាស់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(171107, 1711, '{\"en\":\"Khnar Pou\",\"kh\":\"\\u1781\\u17d2\\u1793\\u17b6\\u179a\\u1796\\u17c4\\u1792\\u17b7\\u17cd\"}', 'Khnar Pou', 'ខ្នារពោធិ៍', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(171108, 1711, '{\"en\":\"Popel\",\"kh\":\"\\u1796\\u1796\\u17c1\\u179b\"}', 'Popel', 'ពពេល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(171109, 1711, '{\"en\":\"Samraong\",\"kh\":\"\\u179f\\u17c6\\u179a\\u17c4\\u1784\"}', 'Samraong', 'សំរោង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(171110, 1711, '{\"en\":\"Ta Yaek\",\"kh\":\"\\u178f\\u17b6\\u1799\\u17c9\\u17c2\\u1780\"}', 'Ta Yaek', 'តាយ៉ែក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(171201, 1712, '{\"en\":\"Chrouy Neang Nguon\",\"kh\":\"\\u1787\\u17d2\\u179a\\u17c4\\u1799\\u1793\\u17b6\\u1784\\u1784\\u17bd\\u1793\"}', 'Chrouy Neang Nguon', 'ជ្រោយនាងងួន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(171202, 1712, '{\"en\":\"Klang Hay\",\"kh\":\"\\u1780\\u17d2\\u179b\\u17b6\\u17c6\\u1784\\u17a0\\u17b6\\u1799\"}', 'Klang Hay', 'ក្លាំងហាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(171203, 1712, '{\"en\":\"Tram Sasar\",\"kh\":\"\\u178f\\u17d2\\u179a\\u17b6\\u17c6\\u179f\\u179f\\u179a\"}', 'Tram Sasar', 'ត្រាំសសរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(171204, 1712, '{\"en\":\"Moung\",\"kh\":\"\\u1798\\u17c4\\u1784\"}', 'Moung', 'មោង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(171205, 1712, '{\"en\":\"Prei\",\"kh\":\"\\u1794\\u17d2\\u179a\\u17b8\\u1799\\u17cd\"}', 'Prei', 'ប្រីយ៍', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(171206, 1712, '{\"en\":\"Slaeng Spean\",\"kh\":\"\\u179f\\u17d2\\u179b\\u17c2\\u1784\\u179f\\u17d2\\u1796\\u17b6\\u1793\"}', 'Slaeng Spean', 'ស្លែងស្ពាន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(171301, 1713, '{\"en\":\"Boeng Mealea\",\"kh\":\"\\u1794\\u17b9\\u1784\\u1798\\u17b6\\u179b\\u17b6\"}', 'Boeng Mealea', 'បឹងមាលា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(171302, 1713, '{\"en\":\"Kantuot\",\"kh\":\"\\u1780\\u1793\\u17d2\\u1791\\u17bd\\u178f\"}', 'Kantuot', 'កន្ទួត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(171303, 1713, '{\"en\":\"Khnang Phnum\",\"kh\":\"\\u1781\\u17d2\\u1793\\u1784\\u1797\\u17d2\\u1793\\u17c6\"}', 'Khnang Phnum', 'ខ្នងភ្នំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(171304, 1713, '{\"en\":\"Svay Leu\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u179b\\u17be\"}', 'Svay Leu', 'ស្វាយលើ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(171305, 1713, '{\"en\":\"Ta Siem\",\"kh\":\"\\u178f\\u17b6\\u179f\\u17c0\\u1798\"}', 'Ta Siem', 'តាសៀម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(171401, 1714, '{\"en\":\"Prasat\",\"kh\":\"\\u1794\\u17d2\\u179a\\u17b6\\u179f\\u17b6\\u1791\"}', 'Prasat', 'ប្រាសាទ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(171402, 1714, '{\"en\":\"Lvea Krang\",\"kh\":\"\\u179b\\u17d2\\u179c\\u17b6\\u1780\\u17d2\\u179a\\u17b6\\u17c6\\u1784\"}', 'Lvea Krang', 'ល្វាក្រាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(171403, 1714, '{\"en\":\"Srae Nouy\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17c2\\u178e\\u17bc\\u1799\"}', 'Srae Nouy', 'ស្រែណូយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(171404, 1714, '{\"en\":\"Svay Sa\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799 \\u179f\"}', 'Svay Sa', 'ស្វាយ ស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(171405, 1714, '{\"en\":\"Varin\",\"kh\":\"\\u179c\\u17c9\\u17b6\\u179a\\u17b7\\u1793\"}', 'Varin', 'វ៉ារិន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(180101, 1801, '{\"en\":\"lek Muoy\",\"kh\":\"\\u179b\\u17c1\\u1781\\u17e1\"}', 'lek Muoy', 'លេខ១', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(180102, 1801, '{\"en\":\"Pir\",\"kh\":2}', 'Pir', '2', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(180103, 1801, '{\"en\":\"Bei\",\"kh\":3}', 'Bei', '3', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(180104, 1801, '{\"en\":\"Buon\",\"kh\":4}', 'Buon', '4', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(180201, 1802, '{\"en\":\"Andoung Thma\",\"kh\":\"\\u17a2\\u178e\\u17d2\\u178a\\u17bc\\u1784\\u1790\\u17d2\\u1798\"}', 'Andoung Thma', 'អណ្ដូងថ្ម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(180202, 1802, '{\"en\":\"Boeng Ta Prum\",\"kh\":\"\\u1794\\u17b9\\u1784\\u178f\\u17b6\\u1796\\u17d2\\u179a\\u17a0\\u17d2\\u1798\"}', 'Boeng Ta Prum', 'បឹងតាព្រហ្ម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(180203, 1802, '{\"en\":\"Bet Trang\",\"kh\":\"\\u1794\\u17b7\\u178f\\u178f\\u17d2\\u179a\\u17b6\\u1784\"}', 'Bet Trang', 'បិតត្រាង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(180204, 1802, '{\"en\":\"Cheung Kou\",\"kh\":\"\\u1787\\u17be\\u1784\\u1782\\u17c4\"}', 'Cheung Kou', 'ជើងគោ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(180205, 1802, '{\"en\":\"Ou Chrov\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u1787\\u17d2\\u179a\\u17c5\"}', 'Ou Chrov', 'អូរជ្រៅ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(180206, 1802, '{\"en\":\"Ou Oknha Heng\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u17a7\\u1780\\u1789\\u17c9\\u17b6\\u17a0\\u17c1\\u1784\"}', 'Ou Oknha Heng', 'អូរឧកញ៉ាហេង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(180207, 1802, '{\"en\":\"Prey Nob\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1793\\u1794\\u17cb\"}', 'Prey Nob', 'ព្រៃនប់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(180208, 1802, '{\"en\":\"Ream\",\"kh\":\"\\u179a\\u17b6\\u1798\"}', 'Ream', 'រាម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(180209, 1802, '{\"en\":\"Sameakki\",\"kh\":\"\\u179f\\u17b6\\u1798\\u1782\\u17d2\\u1782\\u17b8\"}', 'Sameakki', 'សាមគ្គី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(180210, 1802, '{\"en\":\"Samrong\",\"kh\":\"\\u179f\\u17c6\\u179a\\u17bb\\u1784\"}', 'Samrong', 'សំរុង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(180211, 1802, '{\"en\":\"Tuek L\'ak\",\"kh\":\"\\u1791\\u17b9\\u1780\\u179b\\u17d2\\u17a2\\u1780\\u17cb\"}', 'Tuek L\'ak', 'ទឹកល្អក់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(180212, 1802, '{\"en\":\"Tuek Thla\",\"kh\":\"\\u1791\\u17b9\\u1780\\u1790\\u17d2\\u179b\\u17b6\"}', 'Tuek Thla', 'ទឹកថ្លា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(180213, 1802, '{\"en\":\"Tuol Totueng\",\"kh\":\"\\u1791\\u17bd\\u179b\\u1791\\u1791\\u17b9\\u1784\"}', 'Tuol Totueng', 'ទួលទទឹង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(180214, 1802, '{\"en\":\"Veal Renh\",\"kh\":\"\\u179c\\u17b6\\u179b\\u179a\\u17c1\\u1789\"}', 'Veal Renh', 'វាលរេញ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(180215, 1802, '{\"en\":\"Ta Ney\",\"kh\":\"\\u178f\\u17b6\\u1793\\u17c3\"}', 'Ta Ney', 'តានៃ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(180301, 1803, '{\"en\":\"Kampenh\",\"kh\":\"\\u1780\\u17c6\\u1796\\u17c1\\u1789\"}', 'Kampenh', 'កំពេញ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(180302, 1803, '{\"en\":\"Ou Treh\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u178f\\u17d2\\u179a\\u17c1\\u17c7\"}', 'Ou Treh', 'អូរត្រេះ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(180303, 1803, '{\"en\":\"Tumnob Rolok\",\"kh\":\"\\u1791\\u17c6\\u1793\\u1794\\u17cb\\u179a\\u179b\\u1780\"}', 'Tumnob Rolok', 'ទំនប់រលក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(180304, 1803, '{\"en\":\"Kaev Phos\",\"kh\":\"\\u1780\\u17c2\\u179c\\u1795\\u17bb\\u179f\"}', 'Kaev Phos', 'កែវផុស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(180401, 1804, '{\"en\":\"Chamkar Luong\",\"kh\":\"\\u1785\\u17c6\\u1780\\u17b6\\u179a\\u17a0\\u17d2\\u179b\\u17bd\\u1784\"}', 'Chamkar Luong', 'ចំការហ្លួង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(180402, 1804, '{\"en\":\"Kampong Seila\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u179f\\u17b8\\u179b\\u17b6\"}', 'Kampong Seila', 'កំពង់សីលា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(180403, 1804, '{\"en\":\"Ou Bak Roteh\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u1794\\u17b6\\u1780\\u17cb\\u179a\\u1791\\u17c1\\u17c7\"}', 'Ou Bak Roteh', 'អូរបាក់រទេះ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(180404, 1804, '{\"en\":\"Stueng Chhay\",\"kh\":\"\\u179f\\u17d2\\u1791\\u17b9\\u1784\\u1786\\u17b6\\u1799\"}', 'Stueng Chhay', 'ស្ទឹងឆាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(180501, 1805, '{\"en\":\"Kaoh Rung\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u179a\\u17c9\\u17bb\\u1784\"}', 'Kaoh Rung', 'កោះរ៉ុង', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(180502, 1805, '{\"en\":\"Koah Rung Sonlem\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u179a\\u17c9\\u17bb\\u1784\\u179f\\u1793\\u17d2\\u179b\\u17b9\\u1798\"}', 'Koah Rung Sonlem', 'កោះរ៉ុងសន្លឹម', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(190101, 1901, '{\"en\":\"Kamphun\",\"kh\":\"\\u1780\\u17c6\\u1797\\u17bb\\u1793\"}', 'Kamphun', 'កំភុន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(190102, 1901, '{\"en\":\"Kbal Romeas\",\"kh\":\"\\u1780\\u17d2\\u1794\\u17b6\\u179b\\u179a\\u1798\\u17b6\\u179f\"}', 'Kbal Romeas', 'ក្បាលរមាស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(190103, 1901, '{\"en\":\"Phluk\",\"kh\":\"\\u1797\\u17d2\\u179b\\u17bb\\u1780\"}', 'Phluk', 'ភ្លុក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(190104, 1901, '{\"en\":\"Samkhuoy\",\"kh\":\"\\u179f\\u17b6\\u1798\\u1783\\u17bd\\u1799\"}', 'Samkhuoy', 'សាមឃួយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(190105, 1901, '{\"en\":\"Sdau\",\"kh\":\"\\u179f\\u17d2\\u178a\\u17c5\"}', 'Sdau', 'ស្ដៅ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(190106, 1901, '{\"en\":\"Srae Kor\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17c2\\u1782\\u179a\"}', 'Srae Kor', 'ស្រែគរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(190107, 1901, '{\"en\":\"Ta Lat\",\"kh\":\"\\u178f\\u17b6\\u17a1\\u17b6\\u178f\"}', 'Ta Lat', 'តាឡាត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(190201, 1902, '{\"en\":\"Kaoh Preah\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u1796\\u17d2\\u179a\\u17c7\"}', 'Kaoh Preah', 'កោះព្រះ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(190202, 1902, '{\"en\":\"Kaoh Sampeay\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u179f\\u17c6\\u1796\\u17b6\\u1799\"}', 'Kaoh Sampeay', 'កោះសំពាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(190203, 1902, '{\"en\":\"Kaoh Sralay\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u179f\\u17d2\\u179a\\u17a1\\u17b6\\u1799\"}', 'Kaoh Sralay', 'កោះស្រឡាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(190204, 1902, '{\"en\":\"Ou Mreah\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u1798\\u17d2\\u179a\\u17c7\"}', 'Ou Mreah', 'អូរម្រះ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(190205, 1902, '{\"en\":\"Ou Ruessei Kandal\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u17ab\\u179f\\u17d2\\u179f\\u17b8\\u1780\\u178e\\u17d2\\u178a\\u17b6\\u179b\"}', 'Ou Ruessei Kandal', 'អូរឫស្សីកណ្ដាល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(190206, 1902, '{\"en\":\"Siem Bouk\",\"kh\":\"\\u179f\\u17c0\\u1798\\u1794\\u17bc\\u1780\"}', 'Siem Bouk', 'សៀមបូក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(190207, 1902, '{\"en\":\"Srae Krasang\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17c2\\u1780\\u17d2\\u179a\\u179f\\u17b6\\u17c6\\u1784\"}', 'Srae Krasang', 'ស្រែក្រសាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(190301, 1903, '{\"en\":\"Preaek Meas\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1798\\u17b6\\u179f\"}', 'Preaek Meas', 'ព្រែកមាស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(190302, 1903, '{\"en\":\"Sekong\",\"kh\":\"\\u179f\\u17c1\\u1780\\u17bb\\u1784\"}', 'Sekong', 'សេកុង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(190303, 1903, '{\"en\":\"Santepheap\",\"kh\":\"\\u179f\\u1793\\u17d2\\u178a\\u17b7\\u1797\\u17b6\\u1796\"}', 'Santepheap', 'សន្ដិភាព', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(190304, 1903, '{\"en\":\"Srae Sambour\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17c2\\u179f\\u17c6\\u1794\\u17bc\\u179a\"}', 'Srae Sambour', 'ស្រែសំបូរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(190305, 1903, '{\"en\":\"Tma Kaev\",\"kh\":\"\\u1790\\u17d2\\u1798\\u1780\\u17c2\\u179c\"}', 'Tma Kaev', 'ថ្មកែវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(190401, 1904, '{\"en\":\"Stueng Traeng\",\"kh\":\"\\u179f\\u17d2\\u1791\\u17b9\\u1784\\u178f\\u17d2\\u179a\\u17c2\\u1784\"}', 'Stueng Traeng', 'ស្ទឹងត្រែង', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(190402, 1904, '{\"en\":\"Srah Ruessei\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17c7\\u17ab\\u179f\\u17d2\\u179f\\u17b8\"}', 'Srah Ruessei', 'ស្រះឫស្សី', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(190403, 1904, '{\"en\":\"Preah Bat\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c7\\u1794\\u17b6\\u1791\"}', 'Preah Bat', 'ព្រះបាទ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(190404, 1904, '{\"en\":\"Sameakki\",\"kh\":\"\\u179f\\u17b6\\u1798\\u1782\\u17d2\\u1782\\u17b8\"}', 'Sameakki', 'សាមគ្គី', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(190501, 1905, '{\"en\":\"Anlong Phe\",\"kh\":\"\\u17a2\\u1793\\u17d2\\u179b\\u1784\\u17cb\\u1797\\u17c1\"}', 'Anlong Phe', 'អន្លង់ភេ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(190502, 1905, '{\"en\":\"Chamkar Leu\",\"kh\":\"\\u1785\\u17c6\\u1780\\u17b6\\u179a\\u179b\\u17be\"}', 'Chamkar Leu', 'ចំការលើ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(190503, 1905, '{\"en\":\"Kang Cham\",\"kh\":\"\\u1780\\u17b6\\u17c6\\u1784\\u1785\\u17b6\\u1798\"}', 'Kang Cham', 'កាំងចាម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(190505, 1905, '{\"en\":\"Anlong Chrey\",\"kh\":\"\\u17a2\\u1793\\u17d2\\u179b\\u1784\\u17cb\\u1787\\u17d2\\u179a\\u17c3\"}', 'Anlong Chrey', 'អន្លង់ជ្រៃ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(190506, 1905, '{\"en\":\"Ou Rai\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u179a\\u17c9\\u17c3\"}', 'Ou Rai', 'អូររ៉ៃ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(190509, 1905, '{\"en\":\"Sam Ang\",\"kh\":\"\\u179f\\u17c6\\u17a2\\u17b6\\u1784\"}', 'Sam Ang', 'សំអាង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(190510, 1905, '{\"en\":\"Srae Ruessei\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17c2\\u17ab\\u179f\\u17d2\\u179f\\u17b8\"}', 'Srae Ruessei', 'ស្រែឫស្សី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(190511, 1905, '{\"en\":\"Thala Barivat\",\"kh\":\"\\u1790\\u17b6\\u17a1\\u17b6\\u1794\\u179a\\u17b7\\u179c\\u17c9\\u17b6\\u178f\\u17cb\"}', 'Thala Barivat', 'ថាឡាបរិវ៉ាត់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(190601, 1906, '{\"en\":\"Ou Svay\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u179f\\u17d2\\u179c\\u17b6\\u1799\"}', 'Ou Svay', 'អូរស្វាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(190602, 1906, '{\"en\":\"Kaoh Snaeng\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u179f\\u17d2\\u1793\\u17c2\\u1784\"}', 'Kaoh Snaeng', 'កោះស្នែង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(190603, 1906, '{\"en\":\"Preah Rumkel\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c7\\u179a\\u17c6\\u1780\\u17b7\\u179b\"}', 'Preah Rumkel', 'ព្រះរំកិល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200103, 2001, '{\"en\":\"Chantrea\",\"kh\":\"\\u1785\\u1793\\u17d2\\u1791\\u17d2\\u179a\\u17b6\"}', 'Chantrea', 'ចន្ទ្រា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200104, 2001, '{\"en\":\"Chres\",\"kh\":\"\\u1785\\u17d2\\u179a\\u17c1\\u179f\"}', 'Chres', 'ច្រេស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200105, 2001, '{\"en\":\"Me Sar Thngak\",\"kh\":\"\\u1798\\u17c1 \\u179f\\u179a\\u1790\\u17d2\\u1784\\u1780\"}', 'Me Sar Thngak', 'មេ សរថ្ងក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200108, 2001, '{\"en\":\"Prey Kokir\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1782\\u1782\\u17b8\\u179a\"}', 'Prey Kokir', 'ព្រៃគគីរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200109, 2001, '{\"en\":\"Samraong\",\"kh\":\"\\u179f\\u17c6\\u179a\\u17c4\\u1784\"}', 'Samraong', 'សំរោង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200110, 2001, '{\"en\":\"Tuol Sdei\",\"kh\":\"\\u1791\\u17bd\\u179b\\u179f\\u17d2\\u178a\\u17b8\"}', 'Tuol Sdei', 'ទួលស្ដី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200201, 2002, '{\"en\":\"Banteay Krang\",\"kh\":\"\\u1794\\u1793\\u17d2\\u1791\\u17b6\\u1799\\u1780\\u17d2\\u179a\\u17b6\\u17c6\\u1784\"}', 'Banteay Krang', 'បន្ទាយក្រាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200202, 2002, '{\"en\":\"Nhor\",\"kh\":\"\\u1789\\u179a\"}', 'Nhor', 'ញរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200203, 2002, '{\"en\":\"Khsaetr\",\"kh\":\"\\u1781\\u17d2\\u179f\\u17c2\\u178f\\u17d2\\u179a\"}', 'Khsaetr', 'ខ្សែត្រ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200204, 2002, '{\"en\":\"Preah Ponlea\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c7\\u1796\\u1793\\u17d2\\u179b\\u17b6\"}', 'Preah Ponlea', 'ព្រះពន្លា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200205, 2002, '{\"en\":\"Prey Thum\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1792\\u17c6\"}', 'Prey Thum', 'ព្រៃធំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200206, 2002, '{\"en\":\"Reach Montir\",\"kh\":\"\\u179a\\u17b6\\u1787\\u1798\\u1793\\u17d2\\u1791\\u17b8\\u179a\"}', 'Reach Montir', 'រាជមន្ទីរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200207, 2002, '{\"en\":\"Samlei\",\"kh\":\"\\u179f\\u17c6\\u17a1\\u17b8\"}', 'Samlei', 'សំឡី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200208, 2002, '{\"en\":\"Samyaong\",\"kh\":\"\\u179f\\u17c6\\u1799\\u17c9\\u17c4\\u1784\"}', 'Samyaong', 'សំយ៉ោង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200209, 2002, '{\"en\":\"Svay Ta Yean\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u178f\\u17b6\\u1799\\u17b6\\u1793\"}', 'Svay Ta Yean', 'ស្វាយតាយាន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200211, 2002, '{\"en\":\"Thmei\",\"kh\":\"\\u1790\\u17d2\\u1798\\u17b8\"}', 'Thmei', 'ថ្មី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200212, 2002, '{\"en\":\"Tnaot\",\"kh\":\"\\u178f\\u17d2\\u1793\\u17c4\\u178f\"}', 'Tnaot', 'ត្នោត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200301, 2003, '{\"en\":\"Bos Mon\",\"kh\":\"\\u1794\\u17bb\\u179f\\u1798\\u1793\"}', 'Bos Mon', 'បុសមន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200302, 2003, '{\"en\":\"Thmea\",\"kh\":\"\\u1792\\u17d2\\u1798\\u17b6\"}', 'Thmea', 'ធ្មា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200303, 2003, '{\"en\":\"Kampong Chak\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1785\\u1780\"}', 'Kampong Chak', 'កំពង់ចក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200304, 2003, '{\"en\":\"Chrung Popel\",\"kh\":\"\\u1787\\u17d2\\u179a\\u17bb\\u1784\\u1796\\u1796\\u17c1\\u179b\"}', 'Chrung Popel', 'ជ្រុងពពេល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200305, 2003, '{\"en\":\"Kampong Ampil\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u17a2\\u17c6\\u1796\\u17b7\\u179b\"}', 'Kampong Ampil', 'កំពង់អំពិល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200306, 2003, '{\"en\":\"Meun Chey\",\"kh\":\"\\u1798\\u17c9\\u17ba\\u1793\\u1787\\u17d0\\u1799\"}', 'Meun Chey', 'ម៉ឺនជ័យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200307, 2003, '{\"en\":\"Pong Tuek\",\"kh\":\"\\u1796\\u1784\\u1791\\u17b9\\u1780\"}', 'Pong Tuek', 'ពងទឹក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200308, 2003, '{\"en\":\"Sangkae\",\"kh\":\"\\u179f\\u1784\\u17d2\\u1780\\u17c2\"}', 'Sangkae', 'សង្កែ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200309, 2003, '{\"en\":\"Svay Chek\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u1785\\u17c1\\u1780\"}', 'Svay Chek', 'ស្វាយចេក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200310, 2003, '{\"en\":\"Thna Thnong\",\"kh\":\"\\u1790\\u17d2\\u1793\\u17b6\\u1792\\u17d2\\u1793\\u1784\\u17cb\"}', 'Thna Thnong', 'ថ្នាធ្នង់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200401, 2004, '{\"en\":\"Ampil\",\"kh\":\"\\u17a2\\u17c6\\u1796\\u17b7\\u179b\"}', 'Ampil', 'អំពិល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200402, 2004, '{\"en\":\"Andoung Pou\",\"kh\":\"\\u17a2\\u178e\\u17d2\\u178a\\u17bc\\u1784\\u1796\\u17c4\\u1792\\u17b7\\u17cd\"}', 'Andoung Pou', 'អណ្ដូងពោធិ៍', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200403, 2004, '{\"en\":\"Andoung Trabaek\",\"kh\":\"\\u17a2\\u178e\\u17d2\\u178a\\u17bc\\u1784\\u178f\\u17d2\\u179a\\u1794\\u17c2\\u1780\"}', 'Andoung Trabaek', 'អណ្ដូងត្របែក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200404, 2004, '{\"en\":\"Angk Prasrae\",\"kh\":\"\\u17a2\\u1784\\u17d2\\u1782\\u1794\\u17d2\\u179a\\u179f\\u17d2\\u179a\\u17c2\"}', 'Angk Prasrae', 'អង្គប្រស្រែ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200405, 2004, '{\"en\":\"Chantrei\",\"kh\":\"\\u1785\\u1793\\u17d2\\u178a\\u17d2\\u179a\\u17b8\"}', 'Chantrei', 'ចន្ដ្រី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200406, 2004, '{\"en\":\"Chrey Thum\",\"kh\":\"\\u1787\\u17d2\\u179a\\u17c3\\u1792\\u17c6\"}', 'Chrey Thum', 'ជ្រៃធំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200407, 2004, '{\"en\":\"Doung\",\"kh\":\"\\u178a\\u17bc\\u1784\"}', 'Doung', 'ដូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200408, 2004, '{\"en\":\"Kampong Trach\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u178f\\u17d2\\u179a\\u17b6\\u1785\"}', 'Kampong Trach', 'កំពង់ត្រាច', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200409, 2004, '{\"en\":\"Kokir\",\"kh\":\"\\u1782\\u1782\\u17b8\\u179a\"}', 'Kokir', 'គគីរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200410, 2004, '{\"en\":\"Krasang\",\"kh\":\"\\u1780\\u17d2\\u179a\\u179f\\u17b6\\u17c6\\u1784\"}', 'Krasang', 'ក្រសាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200411, 2004, '{\"en\":\"Mukh Da\",\"kh\":\"\\u1798\\u17bb\\u1781\\u178a\\u17b6\"}', 'Mukh Da', 'មុខដា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200412, 2004, '{\"en\":\"Mream\",\"kh\":\"\\u1798\\u17d2\\u179a\\u17b6\\u1798\"}', 'Mream', 'ម្រាម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200413, 2004, '{\"en\":\"Sambuor\",\"kh\":\"\\u179f\\u17c6\\u1794\\u17bd\\u179a\"}', 'Sambuor', 'សំបួរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200414, 2004, '{\"en\":\"Sambatt Mean Chey\",\"kh\":\"\\u179f\\u1798\\u17d2\\u1794\\u178f\\u17d2\\u178a\\u17b7\\u1798\\u17b6\\u1793\\u1787\\u17d0\\u1799\"}', 'Sambatt Mean Chey', 'សម្បត្ដិមានជ័យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200415, 2004, '{\"en\":\"Trapeang Sdau\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u179f\\u17d2\\u178a\\u17c5\"}', 'Trapeang Sdau', 'ត្រពាំងស្ដៅ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200416, 2004, '{\"en\":\"Tras\",\"kh\":\"\\u178f\\u17d2\\u179a\\u179f\\u17cb\"}', 'Tras', 'ត្រស់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200501, 2005, '{\"en\":\"Angk Ta Sou\",\"kh\":\"\\u17a2\\u1784\\u17d2\\u1782\\u178f\\u17b6\\u179f\\u17bc\"}', 'Angk Ta Sou', 'អង្គតាសូ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200502, 2005, '{\"en\":\"Basak\",\"kh\":\"\\u1794\\u17b6\\u179f\\u17b6\\u1780\\u17cb\"}', 'Basak', 'បាសាក់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200503, 2005, '{\"en\":\"Chambak\",\"kh\":\"\\u1785\\u17c6\\u1794\\u1780\\u17cb\"}', 'Chambak', 'ចំបក់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200504, 2005, '{\"en\":\"Kampong Chamlang\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1785\\u17c6\\u17a1\\u1784\"}', 'Kampong Chamlang', 'កំពង់ចំឡង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200505, 2005, '{\"en\":\"Ta Suos\",\"kh\":\"\\u178f\\u17b6\\u179f\\u17bd\\u179f\"}', 'Ta Suos', 'តាសួស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200507, 2005, '{\"en\":\"Chheu Teal\",\"kh\":\"\\u1788\\u17be\\u1791\\u17b6\\u179b\"}', 'Chheu Teal', 'ឈើទាល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200508, 2005, '{\"en\":\"Doun Sa\",\"kh\":\"\\u178a\\u17bc\\u1793\\u179f\"}', 'Doun Sa', 'ដូនស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200509, 2005, '{\"en\":\"Kouk Pring\",\"kh\":\"\\u1782\\u17c4\\u1780\\u1796\\u17d2\\u179a\\u17b8\\u1784\"}', 'Kouk Pring', 'គោកព្រីង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200510, 2005, '{\"en\":\"Kraol Kou\",\"kh\":\"\\u1780\\u17d2\\u179a\\u17c4\\u179b\\u1782\\u17c4\"}', 'Kraol Kou', 'ក្រោលគោ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200511, 2005, '{\"en\":\"Kruos\",\"kh\":\"\\u1782\\u17d2\\u179a\\u17bd\\u179f\"}', 'Kruos', 'គ្រួស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200512, 2005, '{\"en\":\"Pouthi Reach\",\"kh\":\"\\u1796\\u17c4\\u1792\\u17b7\\u179a\\u17b6\\u1787\"}', 'Pouthi Reach', 'ពោធិរាជ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200513, 2005, '{\"en\":\"Svay Angk\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u17a2\\u1784\\u17d2\\u1782\"}', 'Svay Angk', 'ស្វាយអង្គ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1);
INSERT INTO `tbl_location` (`location_id`, `parent_id`, `title`, `title_en`, `title_kh`, `shortname`, `type`, `prefix`, `image`, `display`, `tag`, `trash`, `ordering`, `ab_id`, `blongto`) VALUES
(200514, 2005, '{\"en\":\"Svay Chrum\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u1787\\u17d2\\u179a\\u17c6\"}', 'Svay Chrum', 'ស្វាយជ្រំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200515, 2005, '{\"en\":\"Svay Thum\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u1792\\u17c6\"}', 'Svay Thum', 'ស្វាយធំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200516, 2005, '{\"en\":\"Svay Yea\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u1799\\u17b6\"}', 'Svay Yea', 'ស្វាយយា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200517, 2005, '{\"en\":\"Thlok\",\"kh\":\"\\u1792\\u17d2\\u179b\\u1780\"}', 'Thlok', 'ធ្លក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200601, 2006, '{\"en\":\"Svay Rieng\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u179a\\u17c0\\u1784\"}', 'Svay Rieng', 'ស្វាយរៀង', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(200602, 2006, '{\"en\":\"Prey Chhlak\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1786\\u17d2\\u179b\\u17b6\\u1780\\u17cb\"}', 'Prey Chhlak', 'ព្រៃឆ្លាក់', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(200603, 2006, '{\"en\":\"Koy Trabaek\",\"kh\":\"\\u1782\\u1799\\u178f\\u17d2\\u179a\\u1794\\u17c2\\u1780\"}', 'Koy Trabaek', 'គយត្របែក', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(200604, 2006, '{\"en\":\"Pou Ta Hao\",\"kh\":\"\\u1796\\u17c4\\u1792\\u17b7\\u17cd\\u178f\\u17b6\\u17a0\\u17c4\"}', 'Pou Ta Hao', 'ពោធិ៍តាហោ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(200605, 2006, '{\"en\":\"Chek\",\"kh\":\"\\u1785\\u17c1\\u1780\"}', 'Chek', 'ចេក', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(200606, 2006, '{\"en\":\"Svay Toea\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u178f\\u17bf\"}', 'Svay Toea', 'ស្វាយតឿ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(200607, 2006, '{\"en\":\"Sangkhoar\",\"kh\":\"\\u179f\\u1784\\u17d2\\u1783\\u179a\\u17d0\"}', 'Sangkhoar', 'សង្ឃរ័', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(200702, 2007, '{\"en\":\"Koki Saom\",\"kh\":\"\\u1782\\u1782\\u17b8\\u179f\\u17c4\\u1798\"}', 'Koki Saom', 'គគីសោម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200703, 2007, '{\"en\":\"Kandieng Reay\",\"kh\":\"\\u1780\\u178e\\u17d2\\u178a\\u17c0\\u1784\\u179a\\u17b6\\u1799\"}', 'Kandieng Reay', 'កណ្ដៀងរាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200704, 2007, '{\"en\":\"Monourom\",\"kh\":\"\\u1798\\u1793\\u17c4\\u179a\\u1798\\u17d2\\u1799\"}', 'Monourom', 'មនោរម្យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200705, 2007, '{\"en\":\"Popeaet\",\"kh\":\"\\u1796\\u1796\\u17c2\\u178f\"}', 'Popeaet', 'ពពែត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200706, 2007, '{\"en\":\"Prey Ta Ei\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u178f\\u17b6\\u17a2\\u17b8\"}', 'Prey Ta Ei', 'ព្រៃតាអី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200707, 2007, '{\"en\":\"Prasoutr\",\"kh\":\"\\u1794\\u17d2\\u179a\\u179f\\u17bc\\u178f\\u17d2\\u179a\"}', 'Prasoutr', 'ប្រសូត្រ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200708, 2007, '{\"en\":\"Romeang Thkaol\",\"kh\":\"\\u179a\\u1798\\u17b6\\u17c6\\u1784\\u1790\\u17d2\\u1780\\u17c4\\u179b\"}', 'Romeang Thkaol', 'រមាំងថ្កោល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200709, 2007, '{\"en\":\"Sambuor\",\"kh\":\"\\u179f\\u17c6\\u1794\\u17bd\\u179a\"}', 'Sambuor', 'សំបួរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200711, 2007, '{\"en\":\"Svay Rumpear\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u179a\\u17c6\\u1796\\u17b6\\u179a\"}', 'Svay Rumpear', 'ស្វាយរំពារ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(200801, 2008, '{\"en\":\"Bati\",\"kh\":\"\\u1794\\u17b6\\u1791\\u17b8\"}', 'Bati', 'បាទី', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(200802, 2008, '{\"en\":\"Bavet\",\"kh\":\"\\u1794\\u17b6\\u179c\\u17b7\\u178f\"}', 'Bavet', 'បាវិត', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(200803, 2008, '{\"en\":\"Chrak Mtes\",\"kh\":\"\\u1785\\u17d2\\u179a\\u1780\\u1798\\u17d2\\u1791\\u17c1\\u179f\"}', 'Chrak Mtes', 'ច្រកម្ទេស', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(200804, 2008, '{\"en\":\"Prasat\",\"kh\":\"\\u1794\\u17d2\\u179a\\u17b6\\u179f\\u17b6\\u1791\"}', 'Prasat', 'ប្រាសាទ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(200805, 2008, '{\"en\":\"Prey Angkunh\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u17a2\\u1784\\u17d2\\u1782\\u17bb\\u1789\"}', 'Prey Angkunh', 'ព្រៃអង្គុញ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(210101, 2101, '{\"en\":\"Angkor Borei\",\"kh\":\"\\u17a2\\u1784\\u17d2\\u1782\\u179a\\u1794\\u17bc\\u179a\\u17b8\"}', 'Angkor Borei', 'អង្គរបូរី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210102, 2101, '{\"en\":\"Ba Srae\",\"kh\":\"\\u1794\\u17b6\\u179f\\u17d2\\u179a\\u17c2\"}', 'Ba Srae', 'បាស្រែ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210103, 2101, '{\"en\":\"Kouk Thlok\",\"kh\":\"\\u1782\\u17c4\\u1780\\u1792\\u17d2\\u179b\\u1780\"}', 'Kouk Thlok', 'គោកធ្លក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210104, 2101, '{\"en\":\"Ponley\",\"kh\":\"\\u1796\\u1793\\u17d2\\u179b\\u17c3\"}', 'Ponley', 'ពន្លៃ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210105, 2101, '{\"en\":\"Preaek Phtoul\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u1795\\u17d2\\u1791\\u17c4\\u179b\"}', 'Preaek Phtoul', 'ព្រែកផ្ទោល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210106, 2101, '{\"en\":\"Prey Phkoam\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1795\\u17d2\\u1782\\u17b6\\u17c6\"}', 'Prey Phkoam', 'ព្រៃផ្គាំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210201, 2102, '{\"en\":\"Chambak\",\"kh\":\"\\u1785\\u17c6\\u1794\\u1780\\u17cb\"}', 'Chambak', 'ចំបក់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210202, 2102, '{\"en\":\"Champei\",\"kh\":\"\\u1785\\u17c6\\u1794\\u17c9\\u17b8\"}', 'Champei', 'ចំប៉ី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210203, 2102, '{\"en\":\"Doung\",\"kh\":\"\\u178a\\u17bc\\u1784\"}', 'Doung', 'ដូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210204, 2102, '{\"en\":\"Kandoeng\",\"kh\":\"\\u1780\\u178e\\u17d2\\u178a\\u17b9\\u1784\"}', 'Kandoeng', 'កណ្ដឹង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210205, 2102, '{\"en\":\"Komar Reachea\",\"kh\":\"\\u1780\\u17bb\\u1798\\u17b6\\u179a\\u179a\\u17b6\\u1787\\u17b6\"}', 'Komar Reachea', 'កុមាររាជា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210206, 2102, '{\"en\":\"Krang Leav\",\"kh\":\"\\u1780\\u17d2\\u179a\\u17b6\\u17c6\\u1784\\u179b\\u17b6\\u179c\"}', 'Krang Leav', 'ក្រាំងលាវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210207, 2102, '{\"en\":\"Krang Thnong\",\"kh\":\"\\u1780\\u17d2\\u179a\\u17b6\\u17c6\\u1784\\u1792\\u17d2\\u1793\\u1784\\u17cb\"}', 'Krang Thnong', 'ក្រាំងធ្នង់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210208, 2102, '{\"en\":\"Lumpong\",\"kh\":\"\\u179b\\u17c6\\u1796\\u1784\\u17cb\"}', 'Lumpong', 'លំពង់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210209, 2102, '{\"en\":\"Pea Ream\",\"kh\":\"\\u1796\\u17b6\\u179a\\u17b6\\u1798\"}', 'Pea Ream', 'ពារាម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210210, 2102, '{\"en\":\"Pot Sar\",\"kh\":\"\\u1796\\u178f\\u17cb\\u179f\\u179a\"}', 'Pot Sar', 'ពត់សរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210211, 2102, '{\"en\":\"Sour Phi\",\"kh\":\"\\u179f\\u17bc\\u179a\\u1797\\u17b8\"}', 'Sour Phi', 'សូរភី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210212, 2102, '{\"en\":\"Tang Doung\",\"kh\":\"\\u178f\\u17b6\\u17c6\\u1784\\u178a\\u17bc\\u1784\"}', 'Tang Doung', 'តាំងដូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210213, 2102, '{\"en\":\"Tnaot\",\"kh\":\"\\u178f\\u17d2\\u1793\\u17c4\\u178f\"}', 'Tnaot', 'ត្នោត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210214, 2102, '{\"en\":\"Trapeang Krasang\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u1780\\u17d2\\u179a\\u179f\\u17b6\\u17c6\\u1784\"}', 'Trapeang Krasang', 'ត្រពាំងក្រសាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210215, 2102, '{\"en\":\"Trapeang Sab\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u179f\\u17b6\\u1794\"}', 'Trapeang Sab', 'ត្រពាំងសាប', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210301, 2103, '{\"en\":\"Borei Cholsar\",\"kh\":\"\\u1794\\u17bc\\u179a\\u17b8\\u1787\\u179b\\u179f\\u17b6\\u179a\"}', 'Borei Cholsar', 'បូរីជលសារ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210302, 2103, '{\"en\":\"Chey Chouk\",\"kh\":\"\\u1787\\u17d0\\u1799\\u1787\\u17c4\\u1782\"}', 'Chey Chouk', 'ជ័យជោគ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210303, 2103, '{\"en\":\"Doung Khpos\",\"kh\":\"\\u178a\\u17bc\\u1784\\u1781\\u17d2\\u1796\\u179f\\u17cb\"}', 'Doung Khpos', 'ដូងខ្ពស់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210304, 2103, '{\"en\":\"Kampong Krasang\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1780\\u17d2\\u179a\\u179f\\u17b6\\u17c6\\u1784\"}', 'Kampong Krasang', 'កំពង់ក្រសាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210305, 2103, '{\"en\":\"Kouk Pou\",\"kh\":\"\\u1782\\u17c4\\u1780\\u1796\\u17c4\\u1792\\u17b7\\u17cd\"}', 'Kouk Pou', 'គោកពោធិ៍', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210401, 2104, '{\"en\":\"Angk Prasat\",\"kh\":\"\\u17a2\\u1784\\u17d2\\u1782\\u1794\\u17d2\\u179a\\u17b6\\u179f\\u17b6\\u1791\"}', 'Angk Prasat', 'អង្គប្រាសាទ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210402, 2104, '{\"en\":\"Preah Bat Choan Chum\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c7\\u1794\\u17b6\\u1791\\u1787\\u17b6\\u1793\\u17cb\\u1787\\u17bb\\u17c6\"}', 'Preah Bat Choan Chum', 'ព្រះបាទជាន់ជុំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210403, 2104, '{\"en\":\"Kamnab\",\"kh\":\"\\u1780\\u17c6\\u178e\\u1794\\u17cb\"}', 'Kamnab', 'កំណប់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210404, 2104, '{\"en\":\"Kampeaeng\",\"kh\":\"\\u1780\\u17c6\\u1796\\u17c2\\u1784\"}', 'Kampeaeng', 'កំពែង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210405, 2104, '{\"en\":\"Kiri Chong Kaoh\",\"kh\":\"\\u1782\\u17b8\\u179a\\u17b8\\u1785\\u17bb\\u1784\\u1780\\u17c4\\u17c7\"}', 'Kiri Chong Kaoh', 'គីរីចុងកោះ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210406, 2104, '{\"en\":\"Kouk Prech\",\"kh\":\"\\u1782\\u17c4\\u1780\\u1796\\u17d2\\u179a\\u17c1\\u1785\"}', 'Kouk Prech', 'គោកព្រេច', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210407, 2104, '{\"en\":\"Phnum Den\",\"kh\":\"\\u1797\\u17d2\\u1793\\u17c6\\u178a\\u17b7\\u1793\"}', 'Phnum Den', 'ភ្នំដិន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210408, 2104, '{\"en\":\"Prey Ampok\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u17a2\\u17c6\\u1796\\u1780\"}', 'Prey Ampok', 'ព្រៃអំពក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210409, 2104, '{\"en\":\"Prey Rumdeng\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u179a\\u17c6\\u178a\\u17c1\\u1784\"}', 'Prey Rumdeng', 'ព្រៃរំដេង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210410, 2104, '{\"en\":\"Ream Andaeuk\",\"kh\":\"\\u179a\\u17b6\\u1798\\u17a2\\u178e\\u17d2\\u178a\\u17be\\u1780\"}', 'Ream Andaeuk', 'រាមអណ្ដើក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210411, 2104, '{\"en\":\"Saom\",\"kh\":\"\\u179f\\u17c4\\u1798\"}', 'Saom', 'សោម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210412, 2104, '{\"en\":\"Ta Ou\",\"kh\":\"\\u178f\\u17b6\\u17a2\\u17bc\\u179a\"}', 'Ta Ou', 'តាអូរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210501, 2105, '{\"en\":\"Krapum Chhuk\",\"kh\":\"\\u1780\\u17d2\\u179a\\u1796\\u17bb\\u17c6\\u1788\\u17bc\\u1780\"}', 'Krapum Chhuk', 'ក្រពុំឈូក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210502, 2105, '{\"en\":\"Pech Sar\",\"kh\":\"\\u1796\\u17c1\\u1787\\u179f\\u17b6\\u179a\"}', 'Pech Sar', 'ពេជសារ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210503, 2105, '{\"en\":\"Prey Khla\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1781\\u17d2\\u179b\\u17b6\"}', 'Prey Khla', 'ព្រៃខ្លា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210504, 2105, '{\"en\":\"Prey Yuthka\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1799\\u17bb\\u1790\\u17d2\\u1780\\u17b6\"}', 'Prey Yuthka', 'ព្រៃយុថ្កា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210505, 2105, '{\"en\":\"Romenh\",\"kh\":\"\\u179a\\u1798\\u17c1\\u1789\"}', 'Romenh', 'រមេញ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210506, 2105, '{\"en\":\"Thlea Prachum\",\"kh\":\"\\u1792\\u17d2\\u179b\\u17b6\\u1794\\u17d2\\u179a\\u1787\\u17bb\\u17c6\"}', 'Thlea Prachum', 'ធ្លាប្រជុំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210601, 2106, '{\"en\":\"Angkanh\",\"kh\":\"\\u17a2\\u1784\\u17d2\\u1780\\u17b6\\u1789\\u17cb\"}', 'Angkanh', 'អង្កាញ់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210602, 2106, '{\"en\":\"Ban Kam\",\"kh\":\"\\u1794\\u17b6\\u1793\\u1780\\u17b6\\u1798\"}', 'Ban Kam', 'បានកាម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210603, 2106, '{\"en\":\"Champa\",\"kh\":\"\\u1785\\u17c6\\u1794\\u17c9\\u17b6\"}', 'Champa', 'ចំប៉ា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210604, 2106, '{\"en\":\"Char\",\"kh\":\"\\u1785\\u17b6\\u179a\"}', 'Char', 'ចារ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210605, 2106, '{\"en\":\"Kampeaeng\",\"kh\":\"\\u1780\\u17c6\\u1796\\u17c2\\u1784\"}', 'Kampeaeng', 'កំពែង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210606, 2106, '{\"en\":\"Kampong Reab\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u179a\\u17b6\\u1794\"}', 'Kampong Reab', 'កំពង់រាប', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210607, 2106, '{\"en\":\"Kdanh\",\"kh\":\"\\u1780\\u17d2\\u178a\\u17b6\\u1789\\u17cb\"}', 'Kdanh', 'ក្ដាញ់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210608, 2106, '{\"en\":\"Pou Rumchak\",\"kh\":\"\\u1796\\u17c4\\u1792\\u17b7\\u17cd\\u179a\\u17c6\\u1785\\u17b6\\u1780\"}', 'Pou Rumchak', 'ពោធិ៍រំចាក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210609, 2106, '{\"en\":\"Prey Kabbas\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1780\\u1794\\u17d2\\u1794\\u17b6\\u179f\"}', 'Prey Kabbas', 'ព្រៃកប្បាស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210610, 2106, '{\"en\":\"Prey Lvea\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u179b\\u17d2\\u179c\\u17b6\"}', 'Prey Lvea', 'ព្រៃល្វា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210611, 2106, '{\"en\":\"Prey Phdau\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1795\\u17d2\\u178a\\u17c5\"}', 'Prey Phdau', 'ព្រៃផ្ដៅ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210612, 2106, '{\"en\":\"Snao\",\"kh\":\"\\u179f\\u17d2\\u1793\\u17c4\"}', 'Snao', 'ស្នោ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210613, 2106, '{\"en\":\"Tang Yab\",\"kh\":\"\\u178f\\u17b6\\u17c6\\u1784\\u1799\\u17c9\\u17b6\\u1794\"}', 'Tang Yab', 'តាំងយ៉ាប', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210701, 2107, '{\"en\":\"Boeng Tranh Khang Cheung\",\"kh\":\"\\u1794\\u17b9\\u1784\\u178f\\u17d2\\u179a\\u17b6\\u1789\\u17cb\\u1781\\u17b6\\u1784\\u1787\\u17be\\u1784\"}', 'Boeng Tranh Khang Cheung', 'បឹងត្រាញ់ខាងជើង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210702, 2107, '{\"en\":\"Boeng Tranh Khang Tboung\",\"kh\":\"\\u1794\\u17b9\\u1784\\u178f\\u17d2\\u179a\\u17b6\\u1789\\u17cb\\u1781\\u17b6\\u1784\\u178f\\u17d2\\u1794\\u17bc\\u1784\"}', 'Boeng Tranh Khang Tboung', 'បឹងត្រាញ់ខាងត្បូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210703, 2107, '{\"en\":\"Cheung Kuon\",\"kh\":\"\\u1787\\u17be\\u1784\\u1782\\u17bd\\u1793\"}', 'Cheung Kuon', 'ជើងគួន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210704, 2107, '{\"en\":\"Chumreah Pen\",\"kh\":\"\\u1787\\u17c6\\u179a\\u17c7\\u1796\\u17c1\\u1793\"}', 'Chumreah Pen', 'ជំរះពេន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210705, 2107, '{\"en\":\"Khvav\",\"kh\":\"\\u1781\\u17d2\\u179c\\u17b6\\u179c\"}', 'Khvav', 'ខ្វាវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210706, 2107, '{\"en\":\"Lumchang\",\"kh\":\"\\u179b\\u17c6\\u1785\\u1784\\u17cb\"}', 'Lumchang', 'លំចង់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210707, 2107, '{\"en\":\"Rovieng\",\"kh\":\"\\u179a\\u179c\\u17c0\\u1784\"}', 'Rovieng', 'រវៀង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210708, 2107, '{\"en\":\"Samraong\",\"kh\":\"\\u179f\\u17c6\\u179a\\u17c4\\u1784\"}', 'Samraong', 'សំរោង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210709, 2107, '{\"en\":\"Soengh\",\"kh\":\"\\u179f\\u17b9\\u1784\\u17d2\\u17a0\"}', 'Soengh', 'សឹង្ហ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210710, 2107, '{\"en\":\"Sla\",\"kh\":\"\\u179f\\u17d2\\u179b\\u17b6\"}', 'Sla', 'ស្លា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210711, 2107, '{\"en\":\"Trea\",\"kh\":\"\\u1791\\u17d2\\u179a\\u17b6\"}', 'Trea', 'ទ្រា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210801, 2108, '{\"en\":\"Baray\",\"kh\":\"\\u1794\\u17b6\\u179a\\u17b6\\u1799\\u178e\\u17cd\"}', 'Baray', 'បារាយណ៍', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(210802, 2108, '{\"en\":\"Roka Knong\",\"kh\":\"\\u179a\\u1780\\u17b6\\u1780\\u17d2\\u1793\\u17bb\\u1784\"}', 'Roka Knong', 'រកាក្នុង', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(210803, 2108, '{\"en\":\"Roka Krau\",\"kh\":\"\\u179a\\u1780\\u17b6\\u1780\\u17d2\\u179a\\u17c5\"}', 'Roka Krau', 'រកាក្រៅ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(210901, 2109, '{\"en\":\"Angk Ta Saom\",\"kh\":\"\\u17a2\\u1784\\u17d2\\u1782\\u178f\\u17b6\\u179f\\u17c4\\u1798\"}', 'Angk Ta Saom', 'អង្គតាសោម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210902, 2109, '{\"en\":\"Cheang Tong\",\"kh\":\"\\u1787\\u17b6\\u1784\\u1791\\u1784\"}', 'Cheang Tong', 'ជាងទង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210903, 2109, '{\"en\":\"Kus\",\"kh\":\"\\u1782\\u17bb\\u179f\"}', 'Kus', 'គុស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210904, 2109, '{\"en\":\"Leay Bour\",\"kh\":\"\\u179b\\u17b6\\u1799\\u1794\\u17bc\\u179a\"}', 'Leay Bour', 'លាយបូរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210905, 2109, '{\"en\":\"Nhaeng Nhang\",\"kh\":\"\\u1789\\u17c9\\u17c2\\u1784\\u1789\\u17c9\\u1784\"}', 'Nhaeng Nhang', 'ញ៉ែងញ៉ង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210906, 2109, '{\"en\":\"Ou Saray\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u179f\\u17b6\\u179a\\u17b6\\u1799\"}', 'Ou Saray', 'អូរសារាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210907, 2109, '{\"en\":\"Trapeang Kranhoung\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u1780\\u17d2\\u179a\\u1789\\u17bc\\u1784\"}', 'Trapeang Kranhoung', 'ត្រពាំងក្រញូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210908, 2109, '{\"en\":\"Otdam Soriya\",\"kh\":\"\\u17a7\\u178f\\u17d2\\u178a\\u1798\\u179f\\u17bb\\u179a\\u17b7\\u1799\\u17b6\"}', 'Otdam Soriya', 'ឧត្ដមសុរិយា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210909, 2109, '{\"en\":\"Popel\",\"kh\":\"\\u1796\\u1796\\u17c1\\u179b\"}', 'Popel', 'ពពេល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210910, 2109, '{\"en\":\"Samraong\",\"kh\":\"\\u179f\\u17c6\\u179a\\u17c4\\u1784\"}', 'Samraong', 'សំរោង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210911, 2109, '{\"en\":\"Srae Ronoung\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17c2\\u179a\\u1793\\u17c4\\u1784\"}', 'Srae Ronoung', 'ស្រែរនោង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210912, 2109, '{\"en\":\"Ta Phem\",\"kh\":\"\\u178f\\u17b6\\u1797\\u17c1\\u1798\"}', 'Ta Phem', 'តាភេម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210913, 2109, '{\"en\":\"Tram Kak\",\"kh\":\"\\u178f\\u17d2\\u179a\\u17b6\\u17c6\\u1780\\u1780\\u17cb\"}', 'Tram Kak', 'ត្រាំកក់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210914, 2109, '{\"en\":\"Trapeang Thum Khang Cheung\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u1792\\u17c6\\u1781\\u17b6\\u1784\\u1787\\u17be\\u1784\"}', 'Trapeang Thum Khang Cheung', 'ត្រពាំងធំខាងជើង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(210915, 2109, '{\"en\":\"Trapeang Thum Khang Tboung\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u1792\\u17c6\\u1781\\u17b6\\u1784\\u178f\\u17d2\\u1794\\u17bc\\u1784\"}', 'Trapeang Thum Khang Tboung', 'ត្រពាំងធំខាងត្បូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(211001, 2110, '{\"en\":\"Angkanh\",\"kh\":\"\\u17a2\\u1784\\u17d2\\u1780\\u17b6\\u1789\\u17cb\"}', 'Angkanh', 'អង្កាញ់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(211002, 2110, '{\"en\":\"Angk Khnor\",\"kh\":\"\\u17a2\\u1784\\u17d2\\u1782\\u1781\\u17d2\\u1793\\u17bb\\u179a\"}', 'Angk Khnor', 'អង្គខ្នុរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(211003, 2110, '{\"en\":\"Chi Khma\",\"kh\":\"\\u1787\\u17b8\\u1781\\u17d2\\u1798\\u17b6\"}', 'Chi Khma', 'ជីខ្មា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(211004, 2110, '{\"en\":\"Khvav\",\"kh\":\"\\u1781\\u17d2\\u179c\\u17b6\\u179c\"}', 'Khvav', 'ខ្វាវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(211005, 2110, '{\"en\":\"Prambei Mum\",\"kh\":\"\\u1794\\u17d2\\u179a\\u17b6\\u17c6\\u1794\\u17b8\\u1798\\u17bb\\u17c6\"}', 'Prambei Mum', 'ប្រាំបីមុំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(211006, 2110, '{\"en\":\"Angk Kaev\",\"kh\":\"\\u17a2\\u1784\\u17d2\\u1782\\u1780\\u17c2\\u179c\"}', 'Angk Kaev', 'អង្គកែវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(211007, 2110, '{\"en\":\"Prey Sloek\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u179f\\u17d2\\u179b\\u17b9\\u1780\"}', 'Prey Sloek', 'ព្រៃស្លឹក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(211008, 2110, '{\"en\":\"Roneam\",\"kh\":\"\\u179a\\u1793\\u17b6\\u1798\"}', 'Roneam', 'រនាម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(211009, 2110, '{\"en\":\"Sambuor\",\"kh\":\"\\u179f\\u17c6\\u1794\\u17bd\\u179a\"}', 'Sambuor', 'សំបួរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(211010, 2110, '{\"en\":\"Sanlung\",\"kh\":\"\\u179f\\u1793\\u17d2\\u179b\\u17bb\\u1784\"}', 'Sanlung', 'សន្លុង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(211011, 2110, '{\"en\":\"Smaong\",\"kh\":\"\\u179f\\u17d2\\u1798\\u17c4\\u1784\"}', 'Smaong', 'ស្មោង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(211012, 2110, '{\"en\":\"Srangae\",\"kh\":\"\\u179f\\u17d2\\u179a\\u1784\\u17c9\\u17c2\"}', 'Srangae', 'ស្រង៉ែ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(211013, 2110, '{\"en\":\"Thlok\",\"kh\":\"\\u1792\\u17d2\\u179b\\u1780\"}', 'Thlok', 'ធ្លក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(211014, 2110, '{\"en\":\"Tralach\",\"kh\":\"\\u178f\\u17d2\\u179a\\u17a1\\u17b6\\u1785\"}', 'Tralach', 'ត្រឡាច', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(220101, 2201, '{\"en\":\"Anlong Veaeng\",\"kh\":\"\\u17a2\\u1793\\u17d2\\u179b\\u1784\\u17cb\\u179c\\u17c2\\u1784\"}', 'Anlong Veaeng', 'អន្លង់វែង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(220103, 2201, '{\"en\":\"Trapeang Tav\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u178f\\u17b6\\u179c\"}', 'Trapeang Tav', 'ត្រពាំងតាវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(220104, 2201, '{\"en\":\"Trapeang Prei\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u1794\\u17d2\\u179a\\u17b8\\u1799\\u17cd\"}', 'Trapeang Prei', 'ត្រពាំងប្រីយ៍', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(220105, 2201, '{\"en\":\"Thlat\",\"kh\":\"\\u1790\\u17d2\\u179b\\u17b6\\u178f\"}', 'Thlat', 'ថ្លាត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(220106, 2201, '{\"en\":\"Lumtong\",\"kh\":\"\\u179b\\u17c6\\u1791\\u1784\"}', 'Lumtong', 'លំទង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(220201, 2202, '{\"en\":\"Ampil\",\"kh\":\"\\u17a2\\u17c6\\u1796\\u17b7\\u179b\"}', 'Ampil', 'អំពិល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(220202, 2202, '{\"en\":\"Beng\",\"kh\":\"\\u1794\\u17c1\\u1784\"}', 'Beng', 'បេង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(220203, 2202, '{\"en\":\"Kouk Khpos\",\"kh\":\"\\u1782\\u17c4\\u1780\\u1781\\u17d2\\u1796\\u179f\\u17cb\"}', 'Kouk Khpos', 'គោកខ្ពស់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(220204, 2202, '{\"en\":\"Kouk Mon\",\"kh\":\"\\u1782\\u17c4\\u1780\\u1798\\u1793\"}', 'Kouk Mon', 'គោកមន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(220301, 2203, '{\"en\":\"Cheung Tien\",\"kh\":\"\\u1787\\u17be\\u1784\\u1791\\u17c0\\u1793\"}', 'Cheung Tien', 'ជើងទៀន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(220302, 2203, '{\"en\":\"Chong Kal\",\"kh\":\"\\u1785\\u17bb\\u1784\\u1780\\u17b6\\u179b\\u17cb\"}', 'Chong Kal', 'ចុងកាល់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(220303, 2203, '{\"en\":\"Krasang\",\"kh\":\"\\u1780\\u17d2\\u179a\\u179f\\u17b6\\u17c6\\u1784\"}', 'Krasang', 'ក្រសាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(220304, 2203, '{\"en\":\"Pongro\",\"kh\":\"\\u1796\\u1784\\u17d2\\u179a\"}', 'Pongro', 'ពង្រ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(220401, 2204, '{\"en\":\"Bansay Reak\",\"kh\":\"\\u1794\\u1793\\u17d2\\u179f\\u17b6\\u1799\\u179a\\u17b6\\u1780\\u17cb\"}', 'Bansay Reak', 'បន្សាយរាក់', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(220402, 2204, '{\"en\":\"Bos Sbov\",\"kh\":\"\\u1794\\u17bb\\u179f\\u17d2\\u1794\\u17bc\\u179c\"}', 'Bos Sbov', 'បុស្បូវ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(220403, 2204, '{\"en\":\"Koun Kriel\",\"kh\":\"\\u1780\\u17bc\\u1793\\u1780\\u17d2\\u179a\\u17c0\\u179b\"}', 'Koun Kriel', 'កូនក្រៀល', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(220404, 2204, '{\"en\":\"Samraong\",\"kh\":\"\\u179f\\u17c6\\u179a\\u17c4\\u1784\"}', 'Samraong', 'សំរោង', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(220405, 2204, '{\"en\":\"Ou Smach\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u179f\\u17d2\\u1798\\u17b6\\u1785\\u17cb\"}', 'Ou Smach', 'អូរស្មាច់', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(220501, 2205, '{\"en\":\"Bak Anloung\",\"kh\":\"\\u1794\\u17b6\\u1780\\u17cb\\u17a2\\u1793\\u17d2\\u179b\\u17bc\\u1784\"}', 'Bak Anloung', 'បាក់អន្លូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(220502, 2205, '{\"en\":\"Ph\'av\",\"kh\":\"\\u1795\\u17d2\\u17a2\\u17b6\\u179c\"}', 'Ph\'av', 'ផ្អាវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(220503, 2205, '{\"en\":\"Ou Svay\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u179f\\u17d2\\u179c\\u17b6\\u1799\"}', 'Ou Svay', 'អូរស្វាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(220504, 2205, '{\"en\":\"Preah Pralay\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c7\\u1794\\u17d2\\u179a\\u17a1\\u17b6\\u1799\"}', 'Preah Pralay', 'ព្រះប្រឡាយ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(220505, 2205, '{\"en\":\"Tumnob Dach\",\"kh\":\"\\u1791\\u17c6\\u1793\\u1794\\u17cb\\u178a\\u17b6\\u1785\\u17cb\"}', 'Tumnob Dach', 'ទំនប់ដាច់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(220506, 2205, '{\"en\":\"Trapeang Prasat\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u1794\\u17d2\\u179a\\u17b6\\u179f\\u17b6\\u1791\"}', 'Trapeang Prasat', 'ត្រពាំងប្រាសាទ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(230101, 2301, '{\"en\":\"Angkaol\",\"kh\":\"\\u17a2\\u1784\\u17d2\\u1780\\u17c4\\u179b\"}', 'Angkaol', 'អង្កោល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(230103, 2301, '{\"en\":\"Pong Tuek\",\"kh\":\"\\u1796\\u1784\\u1791\\u17b9\\u1780\"}', 'Pong Tuek', 'ពងទឹក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(230201, 2302, '{\"en\":\"Kaeb\",\"kh\":\"\\u1780\\u17c2\\u1794\"}', 'Kaeb', 'កែប', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(230202, 2302, '{\"en\":\"Prey Thum\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c3\\u1792\\u17c6\"}', 'Prey Thum', 'ព្រៃធំ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(230203, 2302, '{\"en\":\"Ou Krasar\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u1780\\u17d2\\u179a\\u179f\\u17b6\\u179a\"}', 'Ou Krasar', 'អូរក្រសារ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(240101, 2401, '{\"en\":\"Pailin\",\"kh\":\"\\u1794\\u17c9\\u17c3\\u179b\\u17b7\\u1793\"}', 'Pailin', 'ប៉ៃលិន', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(240102, 2401, '{\"en\":\"Ou Ta Vau\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u178f\\u17b6\\u179c\\u17c9\\u17c5\"}', 'Ou Ta Vau', 'អូរតាវ៉ៅ', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(240103, 2401, '{\"en\":\"Tuol Lvea\",\"kh\":\"\\u1791\\u17bd\\u179b\\u179b\\u17d2\\u179c\\u17b6\"}', 'Tuol Lvea', 'ទួលល្វា', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(240104, 2401, '{\"en\":\"Bar Yakha\",\"kh\":\"\\u1794\\u179a\\u1799\\u17c9\\u17b6\\u1781\\u17b6\"}', 'Bar Yakha', 'បរយ៉ាខា', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(240201, 2402, '{\"en\":\"Sala Krau\",\"kh\":\"\\u179f\\u17b6\\u179b\\u17b6\\u1780\\u17d2\\u179a\\u17c5\"}', 'Sala Krau', 'សាលាក្រៅ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(240202, 2402, '{\"en\":\"Stueng Trang\",\"kh\":\"\\u179f\\u17d2\\u1791\\u17b9\\u1784\\u178f\\u17d2\\u179a\\u1784\\u17cb\"}', 'Stueng Trang', 'ស្ទឹងត្រង់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(240203, 2402, '{\"en\":\"Stueng Kach\",\"kh\":\"\\u179f\\u17d2\\u1791\\u17b9\\u1784\\u1780\\u17b6\\u1785\\u17cb\"}', 'Stueng Kach', 'ស្ទឹងកាច់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(240204, 2402, '{\"en\":\"Ou Andoung\",\"kh\":\"\\u17a2\\u17bc\\u179a\\u17a2\\u178e\\u17d2\\u178a\\u17bc\\u1784\"}', 'Ou Andoung', 'អូរអណ្ដូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250101, 2501, '{\"en\":\"Chong Cheach\",\"kh\":\"\\u1785\\u17bb\\u1784\\u1787\\u17b6\\u1785\"}', 'Chong Cheach', 'ចុងជាច', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250102, 2501, '{\"en\":\"Dambae\",\"kh\":\"\\u178f\\u17c6\\u1794\\u17c2\\u179a\"}', 'Dambae', 'តំបែរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250103, 2501, '{\"en\":\"Kouk Srok\",\"kh\":\"\\u1782\\u17c4\\u1780\\u179f\\u17d2\\u179a\\u17bb\\u1780\"}', 'Kouk Srok', 'គោកស្រុក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250104, 2501, '{\"en\":\"Neang Teut\",\"kh\":\"\\u1793\\u17b6\\u1784\\u1791\\u17be\\u178f\"}', 'Neang Teut', 'នាងទើត', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250105, 2501, '{\"en\":\"Seda\",\"kh\":\"\\u179f\\u17c1\\u178a\\u17b6\"}', 'Seda', 'សេដា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250106, 2501, '{\"en\":\"Trapeang Pring\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u1796\\u17d2\\u179a\\u17b8\\u1784\"}', 'Trapeang Pring', 'ត្រពាំងព្រីង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250107, 2501, '{\"en\":\"Tuek Chrov\",\"kh\":\"\\u1791\\u17b9\\u1780\\u1787\\u17d2\\u179a\\u17c5\"}', 'Tuek Chrov', 'ទឹកជ្រៅ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250201, 2502, '{\"en\":\"Chhuk\",\"kh\":\"\\u1788\\u17bc\\u1780\"}', 'Chhuk', 'ឈូក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250202, 2502, '{\"en\":\"Chumnik\",\"kh\":\"\\u1787\\u17c6\\u1793\\u17b8\\u1780\"}', 'Chumnik', 'ជំនីក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250203, 2502, '{\"en\":\"Kampong Treas\",\"kh\":\"\\u1780\\u17c6\\u1796\\u1784\\u17cb\\u1791\\u17d2\\u179a\\u17b6\\u179f\"}', 'Kampong Treas', 'កំពង់ទ្រាស', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250204, 2502, '{\"en\":\"Kaoh Pir\",\"kh\":\"\\u1780\\u17c4\\u17c7\\u1796\\u17b8\\u179a\"}', 'Kaoh Pir', 'កោះពីរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250205, 2502, '{\"en\":\"Krouch Chhmar\",\"kh\":\"\\u1780\\u17d2\\u179a\\u17bc\\u1785\\u1786\\u17d2\\u1798\\u17b6\\u179a\"}', 'Krouch Chhmar', 'ក្រូចឆ្មារ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250206, 2502, '{\"en\":\"Peus Muoy\",\"kh\":\"\\u1794\\u17c9\\u17ba\\u179f\\u17e1\"}', 'Peus Muoy', 'ប៉ឺស១', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250207, 2502, '{\"en\":\"Peus Pir\",\"kh\":\"\\u1794\\u17c9\\u17ba\\u179f\\u17e2\"}', 'Peus Pir', 'ប៉ឺស២', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250208, 2502, '{\"en\":\"Preaek A chi\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c2\\u1780\\u17a2\\u17b6\\u1787\\u17b8\"}', 'Preaek A chi', 'ព្រែកអាជី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250209, 2502, '{\"en\":\"Roka Khnor\",\"kh\":\"\\u179a\\u1780\\u17b6\\u179a\\u1781\\u17d2\\u1793\\u17bb\\u179a\"}', 'Roka Khnor', 'រការខ្នុរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250210, 2502, '{\"en\":\"Svay Khleang\",\"kh\":\"\\u179f\\u17d2\\u179c\\u17b6\\u1799\\u1783\\u17d2\\u179b\\u17b6\\u17c6\\u1784\"}', 'Svay Khleang', 'ស្វាយឃ្លាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250211, 2502, '{\"en\":\"Trea\",\"kh\":\"\\u1791\\u17d2\\u179a\\u17b6\"}', 'Trea', 'ទ្រា', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250212, 2502, '{\"en\":\"Tuol Snuol\",\"kh\":\"\\u1791\\u17bd\\u179b\\u179f\\u17d2\\u1793\\u17bd\\u179b\"}', 'Tuol Snuol', 'ទួលស្នួល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250301, 2503, '{\"en\":\"Chan Mul\",\"kh\":\"\\u1785\\u17b6\\u1793\\u17cb\\u1798\\u17bc\\u179b\"}', 'Chan Mul', 'ចាន់មូល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250302, 2503, '{\"en\":\"Choam\",\"kh\":\"\\u1787\\u17b6\\u17c6\"}', 'Choam', 'ជាំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250303, 2503, '{\"en\":\"Choam Kravien\",\"kh\":\"\\u1787\\u17b6\\u17c6\\u1780\\u17d2\\u179a\\u179c\\u17c0\\u1793\"}', 'Choam Kravien', 'ជាំក្រវៀន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250304, 2503, '{\"en\":\"Choam Ta Mau\",\"kh\":\"\\u1787\\u17b6\\u17c6\\u178f\\u17b6\\u1798\\u17c9\\u17c5\"}', 'Choam Ta Mau', 'ជាំតាម៉ៅ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250305, 2503, '{\"en\":\"Dar\",\"kh\":\"\\u178a\\u17b6\\u179a\"}', 'Dar', 'ដារ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250306, 2503, '{\"en\":\"Kampoan\",\"kh\":\"\\u1780\\u17c6\\u1796\\u17b6\\u1793\\u17cb\"}', 'Kampoan', 'កំពាន់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250307, 2503, '{\"en\":\"Kokir\",\"kh\":\"\\u1782\\u1782\\u17b8\\u179a\"}', 'Kokir', 'គគីរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250308, 2503, '{\"en\":\"Memong\",\"kh\":\"\\u1798\\u17c1\\u1798\\u1784\"}', 'Memong', 'មេមង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250309, 2503, '{\"en\":\"Memot\",\"kh\":\"\\u1798\\u17c1\\u1798\\u178f\\u17cb\"}', 'Memot', 'មេមត់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250310, 2503, '{\"en\":\"Rumchek\",\"kh\":\"\\u179a\\u17c6\\u1785\\u17c1\\u1780\"}', 'Rumchek', 'រំចេក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250311, 2503, '{\"en\":\"Rung\",\"kh\":\"\\u179a\\u17bc\\u1784\"}', 'Rung', 'រូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250312, 2503, '{\"en\":\"Tonlung\",\"kh\":\"\\u1791\\u1793\\u17d2\\u179b\\u17bc\\u1784\"}', 'Tonlung', 'ទន្លូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250313, 2503, '{\"en\":\"Tramung\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1798\\u17bc\\u1784\"}', 'Tramung', 'ត្រមូង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250314, 2503, '{\"en\":\"Triek\",\"kh\":\"\\u1791\\u17d2\\u179a\\u17c0\\u1780\"}', 'Triek', 'ទ្រៀក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250401, 2504, '{\"en\":\"Ampil Ta Pok\",\"kh\":\"\\u17a2\\u17c6\\u1796\\u17b7\\u179b\\u178f\\u17b6\\u1796\\u1780\"}', 'Ampil Ta Pok', 'អំពិលតាពក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250402, 2504, '{\"en\":\"Chak\",\"kh\":\"\\u1785\\u1780\"}', 'Chak', 'ចក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250403, 2504, '{\"en\":\"Damril\",\"kh\":\"\\u178a\\u17c6\\u179a\\u17b7\\u179b\"}', 'Damril', 'ដំរិល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250404, 2504, '{\"en\":\"Kong Chey\",\"kh\":\"\\u1782\\u1784\\u1787\\u17d0\\u1799\"}', 'Kong Chey', 'គងជ័យ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250405, 2504, '{\"en\":\"Mien\",\"kh\":\"\\u1798\\u17c0\\u1793\"}', 'Mien', 'មៀន', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250406, 2504, '{\"en\":\"Preah Theat\",\"kh\":\"\\u1796\\u17d2\\u179a\\u17c7\\u1792\\u17b6\\u178f\\u17bb\"}', 'Preah Theat', 'ព្រះធាតុ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250407, 2504, '{\"en\":\"Tuol Souphi\",\"kh\":\"\\u1791\\u17bd\\u179b\\u179f\\u17bc\\u1797\\u17b8\"}', 'Tuol Souphi', 'ទួលសូភី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250501, 2505, '{\"en\":\"Dountei\",\"kh\":\"\\u178a\\u17bc\\u1793\\u178f\\u17b8\"}', 'Dountei', 'ដូនតី', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250502, 2505, '{\"en\":\"Kak\",\"kh\":\"\\u1780\\u1780\\u17cb\"}', 'Kak', 'កក់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250503, 2505, '{\"en\":\"Kandaol Chrum\",\"kh\":\"\\u1780\\u178e\\u17d2\\u178a\\u17c4\\u179b\\u1787\\u17d2\\u179a\\u17bb\\u17c6\"}', 'Kandaol Chrum', 'កណ្ដោលជ្រុំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250504, 2505, '{\"en\":\"Kaong Kang\",\"kh\":\"\\u1780\\u17c4\\u1784\\u1780\\u17b6\\u1784\"}', 'Kaong Kang', 'កោងកាង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250505, 2505, '{\"en\":\"Kraek\",\"kh\":\"\\u1780\\u17d2\\u179a\\u17c2\\u1780\"}', 'Kraek', 'ក្រែក', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250506, 2505, '{\"en\":\"Popel\",\"kh\":\"\\u1796\\u1796\\u17c1\\u179b\"}', 'Popel', 'ពពេល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250507, 2505, '{\"en\":\"Trapeang Phlong\",\"kh\":\"\\u178f\\u17d2\\u179a\\u1796\\u17b6\\u17c6\\u1784\\u1795\\u17d2\\u179b\\u17bb\\u1784\"}', 'Trapeang Phlong', 'ត្រពាំងផ្លុង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250508, 2505, '{\"en\":\"Veal Mlu\",\"kh\":\"\\u179c\\u17b6\\u179b\\u1798\\u17d2\\u179b\\u17bc\\u179a\"}', 'Veal Mlu', 'វាលម្លូរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250601, 2506, '{\"en\":\"Suong\",\"kh\":\"\\u179f\\u17bd\\u1784\"}', 'Suong', 'សួង', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(250602, 2506, '{\"en\":\"Vihear Luong\",\"kh\":\"\\u179c\\u17b7\\u17a0\\u17b6\\u179a\\u179b\\u17bd\\u1784\"}', 'Vihear Luong', 'វិហារលួង', '', 'Sangkat', 302, '', 'yes', '', 'no', 0, 0, 1),
(250701, 2507, '{\"en\":\"Anhchaeum\",\"kh\":\"\\u17a2\\u1789\\u17d2\\u1785\\u17be\\u1798\"}', 'Anhchaeum', 'អញ្ចើម', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250702, 2507, '{\"en\":\"Boeng Pruol\",\"kh\":\"\\u1794\\u17b9\\u1784\\u1796\\u17d2\\u179a\\u17bd\\u179b\"}', 'Boeng Pruol', 'បឹងព្រួល', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250703, 2507, '{\"en\":\"Chikor\",\"kh\":\"\\u1787\\u17b8\\u1782\\u179a\"}', 'Chikor', 'ជីគរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250704, 2507, '{\"en\":\"Chirou Ti Muoy\",\"kh\":\"\\u1787\\u17b8\\u179a\\u17c4\\u1791\\u17cd \\u1791\\u17b8\\u17e1\"}', 'Chirou Ti Muoy', 'ជីរោទ៍ ទី១', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250705, 2507, '{\"en\":\"Chirou Ti Pir\",\"kh\":\"\\u1787\\u17b8\\u179a\\u17c4\\u1791\\u17cd \\u1791\\u17b8\\u17e2\"}', 'Chirou Ti Pir', 'ជីរោទ៍ ទី២', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250706, 2507, '{\"en\":\"Chob\",\"kh\":\"\\u1787\\u1794\\u17cb\"}', 'Chob', 'ជប់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250707, 2507, '{\"en\":\"Kor\",\"kh\":\"\\u1782\\u179a\"}', 'Kor', 'គរ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250708, 2507, '{\"en\":\"Lngieng\",\"kh\":\"\\u179b\\u17d2\\u1784\\u17c0\\u1784\"}', 'Lngieng', 'ល្ងៀង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250709, 2507, '{\"en\":\"Mong Riev\",\"kh\":\"\\u1798\\u1784\\u17cb\\u179a\\u17c0\\u179c\"}', 'Mong Riev', 'មង់រៀវ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250710, 2507, '{\"en\":\"Peam Chileang\",\"kh\":\"\\u1796\\u17b6\\u1798\\u1787\\u17b8\\u179b\\u17b6\\u17c6\\u1784\"}', 'Peam Chileang', 'ពាមជីលាំង', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250711, 2507, '{\"en\":\"Roka Po Pram\",\"kh\":\"\\u179a\\u1780\\u17b6\\u1796\\u1794\\u17d2\\u179a\\u17b6\\u17c6\"}', 'Roka Po Pram', 'រកាពប្រាំ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250712, 2507, '{\"en\":\"Sralab\",\"kh\":\"\\u179f\\u17d2\\u179a\\u17a1\\u1794\\u17cb\"}', 'Sralab', 'ស្រឡប់', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250713, 2507, '{\"en\":\"Thma Pech\",\"kh\":\"\\u1790\\u17d2\\u1798\\u1796\\u17c1\\u1787\\u17d2\\u179a\"}', 'Thma Pech', 'ថ្មពេជ្រ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1),
(250714, 2507, '{\"en\":\"Tonle Bet\",\"kh\":\"\\u1791\\u1793\\u17d2\\u179b\\u17c1\\u1794\\u17b7\\u1791\"}', 'Tonle Bet', 'ទន្លេបិទ', '', 'Commune', 301, '', 'yes', '', 'no', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_xlsform`
--

CREATE TABLE `team_xlsform` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `xlsform_id` bigint(20) UNSIGNED NOT NULL,
  `kobo_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'The unique ID of the form on Kobotools. If null, the form has not yet been pushed to Kobo.',
  `kobo_version_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'current or most recently deployed version on Kobotools. If null, the form has not yet been deployed on Kobo.',
  `is_active` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'is the form active on Kobotools?',
  `enketo_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'url to the enketo version - pulled from Kobotools',
  `processing` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Is the form currently being processed by a Kobo Job?',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `team_xlsform`
--

INSERT INTO `team_xlsform` (`id`, `team_id`, `xlsform_id`, `kobo_id`, `kobo_version_id`, `is_active`, `enketo_url`, `processing`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'aNy3WAkzprHfijrvFgyQxU', 'v5XHJFevYW5x2G8ttyvQc8', '1', NULL, 0, '2023-08-24 06:36:05', '2023-08-24 06:36:05'),
(2, 0, 2, 'aQtWZeLeEnwtUUJ5aGMhoj', 'vFcWKgKf2uAS2tuCRXxxr4', '1', NULL, 0, '2023-08-24 06:36:05', '2023-08-24 06:36:05'),
(3, 0, 3, 'a3Geq6ZNTcfUKfZR7DHasQ', 'vF9VxxnvmwWEYjk4dX4KyC', '1', NULL, 0, '2023-08-24 06:36:05', '2023-08-24 06:36:05'),
(4, 0, 4, 'aR4NAeeBB662GwTkZXxCR3', 'vgVwue6UsgrJoDh42CkV7k', '1', NULL, 0, '2023-08-24 06:36:05', '2023-08-24 06:36:05'),
(5, 0, 5, 'aucdmd7CUzAHbXkd92PiAA', 'vA4AHfJNc6fxH4iH8TphHu', '1', NULL, 0, '2023-08-24 06:36:05', '2023-08-24 06:36:05'),
(6, 0, 6, 'apRZRgmGbEDERFm2eAaM5A', 'vmXQ78zsVpbn53Rs5Mwcyo', '1', NULL, 0, '2023-08-24 06:36:05', '2023-08-24 06:36:05');

-- --------------------------------------------------------

--
-- Table structure for table `telegramalert`
--

CREATE TABLE `telegramalert` (
  `id` int(11) NOT NULL,
  `table_name` varchar(222) NOT NULL,
  `json` text NOT NULL,
  `trash` varchar(111) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `telegramalert`
--

INSERT INTO `telegramalert` (`id`, `table_name`, `json`, `trash`) VALUES
(1, 'DPA01', '', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phonenumber` tinytext CHARACTER SET utf8 NOT NULL,
  `fullname` tinytext CHARACTER SET utf8 DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission_id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `province_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `commune_id` int(11) NOT NULL,
  `locations` tinytext CHARACTER SET utf8 DEFAULT NULL,
  `userstatus` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `extra` text CHARACTER SET utf8 DEFAULT NULL,
  `extra_fix` text CHARACTER SET utf8 NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `trash` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `blongto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phonenumber`, `fullname`, `email_verified_at`, `password`, `remember_token`, `api_token`, `permission_id`, `group_id`, `branch_id`, `warehouse_id`, `province_id`, `district_id`, `commune_id`, `locations`, `userstatus`, `extra`, `extra_fix`, `created_at`, `updated_at`, `trash`, `blongto`) VALUES
(1, 'admin', 'admin@gmail.com', '', 'TOP DPA', NULL, '$2y$10$pdOo7K1H7vBVaBnZKwALveDGf6IUzsfe0q6BdM5m3zyUc8SbYQoxu', '', '1|4ddXojpcjWOY1a5jsCqyaP18vB7ABovg4mlo8UOQ', 1, 0, 0, 0, 0, 0, 0, '', '', '', '', '2022-02-07 01:31:14', '2023-06-13 15:06:04', 'no', 0),
(2, 'test1', 'test@gmail.com', '070555215', 'test test test', NULL, '$2y$10$sm9UuOC1Q7X4BHWzwHy0augO7rCvxg3q0ZX4LHcllWJhd3zsQoBUa', NULL, NULL, 1, 0, 0, 0, 0, 0, 0, '', 'yes', '', '', '2022-11-06 04:11:39', '2023-06-02 09:06:14', 'no', 1),
(3, 'datauser1', 'aa@abc.com', '', 'DPA', NULL, '$2y$10$QG9DSY54iVCAZNwS3/ftSOLIuHw83f4HIzurzR3qEuVDIe2JOqYEO', NULL, NULL, 1, 0, 0, 0, 0, 0, 0, '', 'yes', '', '', '2022-11-06 04:11:04', '2023-06-13 15:06:50', 'no', 1),
(4, 'Ratanakkiri', 'example@gmail.com', '012000000', 'test  Ratanak Kiri', NULL, '$2y$10$s0lCC8hS/SYSZYx0K5i2fuCeWU2TmkYKewLByVZztqgmQILoSLxJW', NULL, NULL, 2, 0, 0, 0, 16, 0, 0, '', 'yes', '', '', '2023-05-19 10:05:39', '2023-06-02 09:55:07', 'no', 1),
(5, 'Mondulkiri', 'Mondulkiri@gmail.com', '011000000', 'Mondul Kiri', NULL, '$2y$10$5PzKySnMYSvKeSU1XXIuZul9TgnLhfz9SJcwOMBkJDH9nJ71gk8v6', NULL, NULL, 4, 0, 0, 0, 11, 0, 0, '', 'yes', '', '', '2023-06-02 09:06:11', '2023-06-02 09:06:45', 'no', 1),
(6, 'Preahvihear', 'Preahvihear@gmail.com', '015000000', 'Preah Vihear', NULL, '$2y$10$kr3kJSrLEkcJNH/cD4Zo6ueewKepwzt791b5LEEjGRCg7b3TsLQHi', NULL, NULL, 3, 0, 0, 0, 13, 0, 0, '', 'yes', '', '', '2023-06-02 09:06:12', '2023-06-08 11:46:50', 'no', 1),
(7, 'Sorida', 'Vanndysorida@gmail.com', '093956068', 'Vanndy Sorida', NULL, '$2y$10$5yI6mdQ6wWHNvyf6bBU1B.51Y.YRXxtBnM7RdxeUGgc.EzYBAKmY6', NULL, NULL, 6, 0, 0, 0, 0, 0, 0, '', 'yes', '', '', '2023-06-07 00:06:22', '2023-06-07 00:06:22', 'no', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_permission`
--

CREATE TABLE `users_permission` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `levelsetting` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `level_status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_date` date NOT NULL,
  `trash` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blongto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_permission`
--

INSERT INTO `users_permission` (`id`, `title`, `levelsetting`, `level_status`, `level_type`, `tag`, `add_date`, `trash`, `blongto`) VALUES
(2, 'User Ratanak Kiri', '[\"kobo_1-index\",\"kobo_2-index\",\"kobo_3-index\",\"kobo_4-index\"]', 'yes', '', '', '2023-05-19', 'no', 1),
(3, 'supporter', '[\"koboxlsform-index\",\"koboxlsform-show\",\"koboxlsform-create\",\"koboxlsform-edit\",\"koboxlsform-destroy\",\"koboxlsform-restore\",\"koboxlsform-print\",\"systemprofile-index\",\"systemsetting-index\",\"user-index\",\"user-show\",\"user-create\",\"user-edit\",\"user-destroy\",\"user-restore\",\"userpermission-index\",\"userpermission-show\",\"userpermission-create\",\"userpermission-edit\",\"userpermission-destroy\",\"userpermission-restore\",\"kobo_1-index\",\"kobo_2-index\",\"kobo_3-index\",\"kobo_4-index\"]', 'yes', '', '', '2023-05-19', 'no', 1),
(4, 'User Mondul Kiri', '[\"kobo_1-index\",\"kobo_2-index\",\"kobo_3-index\",\"kobo_4-index\"]', 'yes', '', '', '2023-06-02', 'no', 1),
(5, 'User Preah Vihear', '[\"kobo_1-index\",\"kobo_2-index\",\"kobo_3-index\",\"kobo_4-index\"]', 'yes', '', '', '2023-06-02', 'no', 1),
(6, 'Provincial Manager', '[\"importtable-index\",\"importtable-show\",\"importtable-create\",\"importtable-edit\",\"importtable-destroy\",\"importtable-restore\",\"importtable-print\",\"koboxlsform-index\",\"koboxlsform-show\",\"koboxlsform-create\",\"koboxlsform-edit\",\"koboxlsform-destroy\",\"koboxlsform-restore\",\"koboxlsform-print\",\"mediacenter-index\",\"mediacenter-show\",\"mediacenter-create\",\"mediacenter-edit\",\"mediacenter-delete\",\"mediacenter-destroy\",\"mediacenter-restore\",\"systemprofile-index\",\"systemprofile-show\",\"systemprofile-create\",\"systemprofile-edit\",\"systemprofile-destroy\",\"systemprofile-restore\",\"systemprofile-print\",\"systemsetting-index\",\"systemsetting-show\",\"user-index\",\"user-show\",\"user-create\",\"user-edit\",\"user-delete\",\"user-destroy\",\"user-restore\",\"userpermission-index\",\"userpermission-show\",\"userpermission-create\",\"userpermission-edit\",\"userpermission-destroy\",\"userpermission-restore\",\"kobo_1-index\",\"kobo_2-index\",\"kobo_3-index\",\"kobo_4-index\"]', 'yes', '', '', '2023-06-06', 'no', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xlsforms`
--

CREATE TABLE `xlsforms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `xlsfile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'links to stored files that should be added as media attachments to the ODK form',
  `csv_lookups` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'information to enable mysql tables or views to be converted to csv files and added as additional media attachments to the ODK form',
  `available` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Available to all users? If false, the form is only available to testers or admins.',
  `private_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `xlsforms`
--

INSERT INTO `xlsforms` (`id`, `title`, `xlsfile`, `description`, `media`, `csv_lookups`, `available`, `private_team_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Key Informant Interviews – local authority', NULL, '', NULL, NULL, '1', NULL, '2023-08-24 06:36:05', '2023-08-24 06:36:05', NULL),
(2, 'Individual/HH survey Questionnaire', NULL, '', NULL, NULL, '1', NULL, '2023-08-24 06:36:05', '2023-08-24 06:36:05', NULL),
(3, 'survey1', NULL, '', NULL, NULL, '1', NULL, '2023-08-24 06:36:05', '2023-08-24 06:36:05', NULL),
(4, 'ទម្រង់នៃការអង្កេតវាយតម្លៃផលនេសាទ', NULL, '', NULL, NULL, '1', NULL, '2023-08-24 06:36:05', '2023-08-24 06:36:05', NULL),
(5, 'MaFReDI_Adjusting coverage of the Landing site survey', NULL, '', NULL, NULL, '1', NULL, '2023-08-24 06:36:05', '2023-08-24 06:36:05', NULL),
(6, 'MaFReDI Catch Monitoring', NULL, '', NULL, NULL, '1', NULL, '2023-08-24 06:36:05', '2023-08-24 06:36:05', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cms_filecategory`
--
ALTER TABLE `cms_filecategory`
  ADD PRIMARY KEY (`fc_id`);

--
-- Indexes for table `cms_filemanager`
--
ALTER TABLE `cms_filemanager`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `endpoint`
--
ALTER TABLE `endpoint`
  ADD PRIMARY KEY (`endpoint_id`);

--
-- Indexes for table `importtable`
--
ALTER TABLE `importtable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kobo3_choices`
--
ALTER TABLE `kobo3_choices`
  ADD PRIMARY KEY (`_id`);

--
-- Indexes for table `kobo3_questions`
--
ALTER TABLE `kobo3_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kobo3_survey1`
--
ALTER TABLE `kobo3_survey1`
  ADD PRIMARY KEY (`_id`);

--
-- Indexes for table `kobo3_tbl_agriland_a3geq6zntcfukfzr7dhasq`
--
ALTER TABLE `kobo3_tbl_agriland_a3geq6zntcfukfzr7dhasq`
  ADD PRIMARY KEY (`_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions_info`
--
ALTER TABLE `questions_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `realtimeinsert`
--
ALTER TABLE `realtimeinsert`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_profile`
--
ALTER TABLE `system_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_setting`
--
ALTER TABLE `system_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_02_authority`
--
ALTER TABLE `tbl_02_authority`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_xlsform`
--
ALTER TABLE `team_xlsform`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `telegramalert`
--
ALTER TABLE `telegramalert`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xlsforms`
--
ALTER TABLE `xlsforms`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cms_filemanager`
--
ALTER TABLE `cms_filemanager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kobo3_choices`
--
ALTER TABLE `kobo3_choices`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `kobo3_questions`
--
ALTER TABLE `kobo3_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `kobo3_survey1`
--
ALTER TABLE `kobo3_survey1`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=470810205;

--
-- AUTO_INCREMENT for table `kobo3_tbl_agriland_a3geq6zntcfukfzr7dhasq`
--
ALTER TABLE `kobo3_tbl_agriland_a3geq6zntcfukfzr7dhasq`
  MODIFY `_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `questions_info`
--
ALTER TABLE `questions_info`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `realtimeinsert`
--
ALTER TABLE `realtimeinsert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_02_authority`
--
ALTER TABLE `tbl_02_authority`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `team_xlsform`
--
ALTER TABLE `team_xlsform`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `telegramalert`
--
ALTER TABLE `telegramalert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xlsforms`
--
ALTER TABLE `xlsforms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
