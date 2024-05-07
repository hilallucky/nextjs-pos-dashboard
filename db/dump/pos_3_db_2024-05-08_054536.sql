-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pos_3_db
-- ------------------------------------------------------
-- Server version	8.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acc_bank_deposit_detail`
--

DROP TABLE IF EXISTS `acc_bank_deposit_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acc_bank_deposit_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(20) NOT NULL,
  `bank_deposit_id` int NOT NULL DEFAULT '0',
  `account_code` varchar(100) DEFAULT NULL,
  `description` varchar(30) DEFAULT NULL,
  `amount` decimal(15,4) NOT NULL,
  `company_id` int NOT NULL,
  `inventory_acc_code` varchar(20) DEFAULT '0',
  `customer_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_no` (`invoice_no`,`bank_deposit_id`,`account_code`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acc_bank_deposit_header`
--

DROP TABLE IF EXISTS `acc_bank_deposit_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acc_bank_deposit_header` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(20) NOT NULL,
  `company_id` int NOT NULL,
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_date` date NOT NULL,
  `deposit_to_acc_code` varchar(100) DEFAULT NULL,
  `employee_id` int DEFAULT '0',
  `user_id` int NOT NULL,
  `description` text,
  `total_amount` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`),
  KEY `company_id` (`company_id`),
  KEY `invoice_no` (`invoice_no`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acc_entries`
--

DROP TABLE IF EXISTS `acc_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acc_entries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `invoice_no` varchar(255) NOT NULL,
  `entry_no` int DEFAULT NULL,
  `dr_total` decimal(10,4) DEFAULT '0.0000',
  `cr_total` decimal(10,4) DEFAULT '0.0000',
  `tag_id` int DEFAULT NULL,
  `entry_type` int DEFAULT NULL,
  `number` int DEFAULT NULL,
  `date` date NOT NULL,
  `narration` text,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `invoice_no` (`invoice_no`),
  KEY `entry_no` (`entry_no`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acc_entry_items`
--

DROP TABLE IF EXISTS `acc_entry_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acc_entry_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(255) DEFAULT NULL,
  `account_code` varchar(100) NOT NULL,
  `dueTo_acc_code` varchar(100) NOT NULL,
  `ref_account_id` int DEFAULT '0' COMMENT 'it will be customer, supp or bank id',
  `entry_id` int DEFAULT NULL,
  `entry_no` varchar(50) DEFAULT NULL,
  `reconciliation_date` datetime DEFAULT NULL,
  `debit` double(18,4) NOT NULL,
  `credit` double(18,4) NOT NULL,
  `employee_id` int NOT NULL,
  `date` date NOT NULL,
  `narration` varchar(255) DEFAULT NULL,
  `narration_ur` text NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` int NOT NULL,
  `is_cust` tinyint(1) DEFAULT '0',
  `is_supp` tinyint(1) DEFAULT '0',
  `is_bank` tinyint(1) DEFAULT '0',
  `user_id` int DEFAULT NULL,
  `plaid_trans_id` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_no` (`entry_no`),
  KEY `account_code` (`account_code`),
  KEY `invoice_no` (`invoice_no`),
  KEY `entry_id` (`entry_id`),
  KEY `company_id` (`company_id`),
  KEY `ref_account_code` (`ref_account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=863 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acc_fiscal_years`
--

DROP TABLE IF EXISTS `acc_fiscal_years`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acc_fiscal_years` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fy_start_date` date NOT NULL,
  `fy_end_date` date NOT NULL,
  `fy_year` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `company_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acc_groups`
--

DROP TABLE IF EXISTS `acc_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acc_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_code` int NOT NULL,
  `account_type_id` int NOT NULL,
  `account_code` varchar(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `title_ur` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `title_ar` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `op_balance_dr` decimal(10,2) NOT NULL DEFAULT '0.00',
  `op_balance_cr` decimal(10,2) NOT NULL DEFAULT '0.00',
  `type` varchar(20) NOT NULL,
  `level` decimal(20,0) NOT NULL,
  `company_id` int NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_code` (`account_code`),
  KEY `company_id` (`company_id`),
  KEY `parent_code` (`parent_code`,`account_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=703 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acc_ledgers`
--

DROP TABLE IF EXISTS `acc_ledgers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acc_ledgers` (
  `id` int NOT NULL,
  `group_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `op_dr_balance` decimal(15,2) NOT NULL DEFAULT '0.00',
  `op_cr_balance` decimal(15,2) NOT NULL DEFAULT '0.00',
  `type` int NOT NULL DEFAULT '0',
  `reconciliation` int NOT NULL,
  `company_id` int NOT NULL,
  `affects_gross` int DEFAULT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acc_payments`
--

DROP TABLE IF EXISTS `acc_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acc_payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(100) NOT NULL,
  `payment_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` int NOT NULL,
  `employee_id` int NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `payment_date` date NOT NULL,
  `description` text,
  `name` varchar(100) NOT NULL,
  `amount` double(10,4) NOT NULL,
  `account_code` varchar(100) NOT NULL,
  `tax_id` int NOT NULL DEFAULT '0',
  `tax_rate` decimal(10,3) NOT NULL DEFAULT '0.000',
  `tax_amount` decimal(10,3) NOT NULL DEFAULT '0.000',
  `supplier_invoice_no` varchar(100) DEFAULT NULL,
  `entry_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acc_transfer`
--

DROP TABLE IF EXISTS `acc_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acc_transfer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(255) DEFAULT NULL,
  `account_code` varchar(100) NOT NULL,
  `dueTo_acc_code` varchar(100) NOT NULL,
  `ref_account_id` int DEFAULT '0' COMMENT 'it will be customer, supp or bank id',
  `entry_id` int DEFAULT NULL,
  `entry_no` varchar(50) DEFAULT NULL,
  `reconciliation_date` datetime DEFAULT NULL,
  `debit` double(18,4) NOT NULL,
  `credit` double(18,4) NOT NULL,
  `employee_id` int NOT NULL,
  `date` date NOT NULL,
  `narration` varchar(255) DEFAULT NULL,
  `narration_ur` text NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` int NOT NULL,
  `is_cust` tinyint(1) DEFAULT '0',
  `is_supp` tinyint(1) DEFAULT '0',
  `is_bank` tinyint(1) DEFAULT '0',
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_no` (`entry_no`),
  KEY `account_code` (`account_code`),
  KEY `invoice_no` (`invoice_no`),
  KEY `entry_id` (`entry_id`),
  KEY `company_id` (`company_id`),
  KEY `ref_account_code` (`ref_account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_types`
--

DROP TABLE IF EXISTS `account_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(22) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `calendar_days`
--

DROP TABLE IF EXISTS `calendar_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_days` (
  `id` int NOT NULL,
  `day` date NOT NULL,
  `year` int NOT NULL,
  `month` int NOT NULL,
  `day_of_month` int NOT NULL,
  `day_of_week` int NOT NULL,
  `quarter` int NOT NULL,
  `business_day` tinyint(1) NOT NULL,
  `week_day` tinyint(1) NOT NULL,
  `company_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ci_sessions` (
  `id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `timestamp` int unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `contact_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `date_created` date NOT NULL,
  `fy_start` date NOT NULL,
  `fy_end` date NOT NULL,
  `currency_symbol` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `currency_id` int NOT NULL,
  `cur_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `locked` tinyint(1) NOT NULL,
  `expire` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `time_zone` varchar(244) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_multi_currency` tinyint(1) DEFAULT '0',
  `tax_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `access_token` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `plaid_item_id` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `transactions_limit` int NOT NULL DEFAULT '0',
  `stripe_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `stripe_secret_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `stripe_acct_id` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  KEY `locked` (`locked`,`expire`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dashboard_users`
--

DROP TABLE IF EXISTS `dashboard_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `module` varchar(255) NOT NULL,
  `host_ip` varchar(25) NOT NULL,
  `user` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `user_agent` varchar(100) NOT NULL,
  `message_title` varchar(255) NOT NULL,
  `message_desc` text NOT NULL,
  `company_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1465 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mfg_bom`
--

DROP TABLE IF EXISTS `mfg_bom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mfg_bom` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `component` char(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `workcentre_added` int NOT NULL DEFAULT '0',
  `loc_code` char(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `quantity` double NOT NULL DEFAULT '1',
  `company_id` int NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `component` (`component`),
  KEY `id` (`id`),
  KEY `loc_code` (`loc_code`),
  KEY `item_id` (`item_id`,`loc_code`),
  KEY `workcentre_added` (`workcentre_added`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mfg_wo_costing`
--

DROP TABLE IF EXISTS `mfg_wo_costing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mfg_wo_costing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `workorder_id` int NOT NULL,
  `cost_type` tinyint(1) NOT NULL COMMENT '0=labor-cost, 1=overhead-cost',
  `amount` decimal(20,0) NOT NULL,
  `entry_id` int NOT NULL,
  `date` date DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mfg_wo_manufacture`
--

DROP TABLE IF EXISTS `mfg_wo_manufacture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mfg_wo_manufacture` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reference` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `workorder_id` int NOT NULL DEFAULT '0',
  `quantity` double NOT NULL DEFAULT '0',
  `date_` date NOT NULL,
  `company_id` int NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workorder_id` (`workorder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mfg_wo_requirements`
--

DROP TABLE IF EXISTS `mfg_wo_requirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mfg_wo_requirements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `workorder_id` int NOT NULL DEFAULT '0',
  `item_id` int NOT NULL DEFAULT '0',
  `workcenter_id` int NOT NULL DEFAULT '0',
  `units_req` double NOT NULL DEFAULT '1',
  `unit_cost` double NOT NULL DEFAULT '0',
  `loc_code` char(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `units_issued` double NOT NULL DEFAULT '0',
  `company_id` int NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workorder_id` (`workorder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mfg_workcenters`
--

DROP TABLE IF EXISTS `mfg_workcenters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mfg_workcenters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `name` char(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `description` char(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mfg_workorders`
--

DROP TABLE IF EXISTS `mfg_workorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mfg_workorders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wo_ref` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `loc_code` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `units_reqd` double NOT NULL DEFAULT '1',
  `item_id` int NOT NULL,
  `date` date NOT NULL,
  `type` tinyint NOT NULL DEFAULT '0',
  `required_by` date NOT NULL,
  `released_date` date NOT NULL,
  `units_issued` double NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `released` tinyint(1) NOT NULL DEFAULT '0',
  `additional_costs` double NOT NULL DEFAULT '0',
  `company_id` int NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `wo_ref` (`wo_ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_ur` varchar(50) NOT NULL,
  `title_ar` varchar(100) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `path` varchar(50) NOT NULL,
  `sort` varchar(10) NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `monthly_sales_view`
--

DROP TABLE IF EXISTS `monthly_sales_view`;
/*!50001 DROP VIEW IF EXISTS `monthly_sales_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `monthly_sales_view` AS SELECT 
 1 AS `sales_year`,
 1 AS `sales_month`,
 1 AS `total_sales`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pos_bank_payments`
--

DROP TABLE IF EXISTS `pos_bank_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_bank_payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(100) NOT NULL,
  `bank_id` int NOT NULL,
  `account_code` varchar(100) NOT NULL,
  `dueTo_acc_code` varchar(100) NOT NULL,
  `ref_account_id` int DEFAULT '0' COMMENT 'its bank id',
  `debit` double(15,4) NOT NULL,
  `credit` double(15,4) NOT NULL,
  `narration` text NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date` date NOT NULL,
  `company_id` int NOT NULL,
  `entry_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_no` (`invoice_no`,`bank_id`,`account_code`),
  KEY `company_id` (`company_id`),
  KEY `ref_account_id` (`ref_account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_banking`
--

DROP TABLE IF EXISTS `pos_banking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_banking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bank_acc_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cash_acc_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bank_account_no` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bank_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `acc_holder_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bank_branch` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `creation_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL,
  `company_id` int DEFAULT NULL,
  `op_balance_dr` decimal(10,4) DEFAULT NULL,
  `op_balance_cr` decimal(10,4) DEFAULT NULL,
  `exchange_rate` decimal(10,4) DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `isBank` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_categories`
--

DROP TABLE IF EXISTS `pos_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_desc` varchar(255) NOT NULL,
  `long_desc` text NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `parent_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_colors`
--

DROP TABLE IF EXISTS `pos_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_colors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `name` varchar(32) NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_currencies`
--

DROP TABLE IF EXISTS `pos_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_currencies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(25) DEFAULT NULL,
  `symbol` varchar(25) DEFAULT NULL,
  `thousand_separator` varchar(10) DEFAULT NULL,
  `decimal_separator` varchar(10) DEFAULT NULL,
  `company_id` int NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_customer_payment_history`
--

DROP TABLE IF EXISTS `pos_customer_payment_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_customer_payment_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `invoice_no` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sales_invoice_no` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` decimal(20,4) NOT NULL,
  `company_id` int NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_customer_payments`
--

DROP TABLE IF EXISTS `pos_customer_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_customer_payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(100) NOT NULL,
  `customer_id` int NOT NULL,
  `account_code` varchar(100) NOT NULL,
  `dueTo_acc_code` varchar(100) NOT NULL,
  `ref_account_id` int DEFAULT '0' COMMENT 'its customer id dueTo',
  `debit` double(15,4) NOT NULL,
  `credit` double(15,4) NOT NULL,
  `narration` text,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date` date NOT NULL,
  `exchange_rate` double(10,5) NOT NULL DEFAULT '0.00000',
  `company_id` int NOT NULL,
  `entry_id` int DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_no` (`invoice_no`,`customer_id`,`account_code`),
  KEY `company_id` (`company_id`),
  KEY `ref_account_id` (`ref_account_id`),
  KEY `debit` (`debit`),
  KEY `credit` (`credit`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_customers`
--

DROP TABLE IF EXISTS `pos_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `store_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `title` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `middle_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phone_no` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `fax_no` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `website` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mobile_no` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `posting_type_id` int NOT NULL,
  `currency_id` int DEFAULT '0',
  `op_balance_dr` decimal(10,4) DEFAULT '0.0000',
  `op_balance_cr` decimal(10,4) DEFAULT '0.0000',
  `exchange_rate` decimal(10,4) DEFAULT '0.0000',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `acc_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `isCustomer` tinyint(1) NOT NULL DEFAULT '1',
  `passport_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cnic` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `gender` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `passport_issue_date` date DEFAULT NULL,
  `passport_expiry_date` date DEFAULT NULL,
  `father_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `emp_id` int NOT NULL,
  `vat_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `company_id_2` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_emp_area`
--

DROP TABLE IF EXISTS `pos_emp_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_emp_area` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `company_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_emp_modules`
--

DROP TABLE IF EXISTS `pos_emp_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_emp_modules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_id` int NOT NULL,
  `module_id` int NOT NULL,
  `sub_module` int DEFAULT '0',
  `can_create` tinyint(1) DEFAULT '0',
  `can_update` tinyint(1) DEFAULT '0',
  `can_delete` tinyint(1) DEFAULT '0',
  `createn_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `emp_id` (`emp_id`,`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1845 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_employee_payments`
--

DROP TABLE IF EXISTS `pos_employee_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_employee_payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(100) NOT NULL,
  `employee_id` int NOT NULL,
  `account_code` varchar(100) NOT NULL,
  `dueTo_acc_code` varchar(100) NOT NULL,
  `debit` double(15,4) NOT NULL,
  `credit` double(15,4) NOT NULL,
  `narration` text NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date` date NOT NULL,
  `company_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_no` (`invoice_no`,`employee_id`,`account_code`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_employees`
--

DROP TABLE IF EXISTS `pos_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `salary_acc_code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cash_acc_code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('male','female') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `hire_date` date DEFAULT NULL,
  `job_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cnic` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `picture` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `father_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `area_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `ledger_id` (`salary_acc_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_estimate`
--

DROP TABLE IF EXISTS `pos_estimate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_estimate` (
  `sale_id` int NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(20) NOT NULL,
  `company_id` int NOT NULL,
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_date` date NOT NULL,
  `customer_id` int DEFAULT NULL,
  `employee_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL,
  `comment` text NOT NULL,
  `register_mode` varchar(512) DEFAULT NULL,
  `account` varchar(255) NOT NULL COMMENT 'cash or credit',
  `amount_due` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `description` text,
  `discount_value` decimal(10,4) DEFAULT NULL,
  `total_amount` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `total_tax` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `exchange_rate` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `paid` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `currency_id` int NOT NULL DEFAULT '0',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int DEFAULT '0',
  `is_taxable` tinyint(1) NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `deposit_to_acc_code` varchar(100) DEFAULT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`sale_id`),
  KEY `customer_id` (`customer_id`),
  KEY `employee_id` (`employee_id`),
  KEY `company_id` (`company_id`),
  KEY `invoice_no` (`invoice_no`),
  KEY `supplier_id` (`supplier_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_estimate_items`
--

DROP TABLE IF EXISTS `pos_estimate_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_estimate_items` (
  `sale_item_id` int NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(20) NOT NULL,
  `sale_id` int NOT NULL DEFAULT '0',
  `account_code` varchar(100) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int NOT NULL DEFAULT '0',
  `quantity_sold` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_cost_price` decimal(15,4) NOT NULL,
  `item_unit_price` decimal(15,4) NOT NULL,
  `discount_percent` int NOT NULL DEFAULT '0',
  `unit_id` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `company_id` int NOT NULL,
  `discount_value` decimal(10,4) DEFAULT NULL,
  `tax_id` int NOT NULL DEFAULT '0',
  `tax_rate` int NOT NULL DEFAULT '0',
  `inventory_acc_code` varchar(20) DEFAULT '0',
  PRIMARY KEY (`sale_item_id`),
  KEY `invoice_no` (`invoice_no`,`sale_id`,`account_code`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_eventcalendar`
--

DROP TABLE IF EXISTS `pos_eventcalendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_eventcalendar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `title` varchar(20) NOT NULL,
  `url` varchar(50) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` varchar(20) NOT NULL,
  `event_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_inventory`
--

DROP TABLE IF EXISTS `pos_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_inventory` (
  `trans_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `trans_item` int NOT NULL DEFAULT '0',
  `trans_user` int NOT NULL DEFAULT '0',
  `trans_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trans_comment` text NOT NULL,
  `trans_inventory` int NOT NULL DEFAULT '0',
  `invoice_no` varchar(20) DEFAULT NULL,
  `cost_price` decimal(10,4) DEFAULT '0.0000',
  `unit_price` decimal(10,4) DEFAULT '0.0000',
  PRIMARY KEY (`trans_id`),
  KEY `ospos_inventory_ibfk_1` (`trans_item`),
  KEY `ospos_inventory_ibfk_2` (`trans_user`),
  KEY `company_id` (`company_id`),
  KEY `invoice_no` (`invoice_no`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_invoices`
--

DROP TABLE IF EXISTS `pos_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_invoices` (
  `sale_id` int NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(20) NOT NULL,
  `company_id` int NOT NULL,
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_date` date NOT NULL,
  `deposit_to_acc_code` varchar(100) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `employee_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL,
  `comment` text NOT NULL,
  `register_mode` varchar(512) DEFAULT NULL,
  `account` varchar(255) NOT NULL COMMENT 'cash or credit',
  `amount_due` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `description` text,
  `discount_value` decimal(10,4) DEFAULT NULL,
  `total_amount` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `total_tax` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `exchange_rate` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `paid` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `currency_id` int NOT NULL DEFAULT '0',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int DEFAULT '0',
  `is_taxable` tinyint(1) NOT NULL,
  `due_date` date DEFAULT NULL,
  `business_address` text,
  `tax_rate` decimal(18,2) DEFAULT NULL,
  `tax_id` int NOT NULL,
  `status` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`sale_id`),
  KEY `customer_id` (`customer_id`),
  KEY `employee_id` (`employee_id`),
  KEY `company_id` (`company_id`),
  KEY `invoice_no` (`invoice_no`),
  KEY `supplier_id` (`supplier_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_invoices_items`
--

DROP TABLE IF EXISTS `pos_invoices_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_invoices_items` (
  `sale_item_id` int NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(20) NOT NULL,
  `sale_id` int NOT NULL DEFAULT '0',
  `item_id` int NOT NULL DEFAULT '0',
  `account_code` varchar(100) DEFAULT NULL,
  `description` text,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int NOT NULL DEFAULT '0',
  `quantity_sold` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_cost_price` decimal(15,4) NOT NULL,
  `item_unit_price` decimal(15,4) NOT NULL,
  `discount_percent` int NOT NULL DEFAULT '0',
  `unit_id` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `company_id` int NOT NULL,
  `discount_value` decimal(10,4) DEFAULT NULL,
  `tax_id` int NOT NULL DEFAULT '0',
  `tax_rate` int NOT NULL DEFAULT '0',
  `inventory_acc_code` varchar(20) DEFAULT '0',
  PRIMARY KEY (`sale_item_id`),
  KEY `invoice_no` (`invoice_no`,`sale_id`,`item_id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_items_detail`
--

DROP TABLE IF EXISTS `pos_items_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_items_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `barcode` varchar(256) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `item_code` varchar(20) DEFAULT NULL,
  `item_type` varchar(50) DEFAULT NULL,
  `quantity` double(15,2) NOT NULL,
  `avg_cost` decimal(20,4) NOT NULL,
  `cost_price` decimal(20,4) NOT NULL,
  `unit_price` decimal(20,4) NOT NULL,
  `tax_id` int DEFAULT '0',
  `unit_id` int NOT NULL,
  `location_code` varchar(100) DEFAULT NULL,
  `re_stock_level` double(20,2) DEFAULT NULL,
  `picture` varchar(50) DEFAULT NULL,
  `inventory_acc_code` varchar(20) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `wip_acc_code` varchar(20) NOT NULL,
  `company_id` int NOT NULL,
  `description` text,
  `date_created` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cost_price` (`cost_price`,`unit_price`),
  KEY `avg_cost` (`avg_cost`),
  KEY `item_code` (`item_code`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_locations`
--

DROP TABLE IF EXISTS `pos_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_locations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `company_id` int NOT NULL,
  `code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_plaid_accounts`
--

DROP TABLE IF EXISTS `pos_plaid_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_plaid_accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `company_id` int NOT NULL,
  `plaid_account_id` varchar(255) NOT NULL,
  `name` text NOT NULL,
  `mask` text NOT NULL,
  `official_name` text,
  `current_balance` decimal(28,0) DEFAULT NULL,
  `available_balance` decimal(28,10) DEFAULT NULL,
  `iso_currency_code` text,
  `unofficial_currency_code` text,
  `type` text NOT NULL,
  `subtype` text NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plaid_account_id` (`plaid_account_id`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_plaid_items`
--

DROP TABLE IF EXISTS `pos_plaid_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_plaid_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `plaid_access_token` varchar(255) NOT NULL,
  `plaid_item_id` varchar(255) NOT NULL,
  `plaid_institution_id` varchar(255) NOT NULL,
  `status` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `transactions_cursor` text,
  `institution_name` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `plaid_access_token` (`plaid_access_token`),
  UNIQUE KEY `plaid_item_id` (`plaid_item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_plaid_transactions`
--

DROP TABLE IF EXISTS `pos_plaid_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_plaid_transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_id` varchar(255) NOT NULL,
  `company_id` int NOT NULL,
  `plaid_transaction_id` varchar(255) NOT NULL,
  `plaid_category_id` text,
  `category` text,
  `subcategory` text,
  `type` text NOT NULL,
  `name` text NOT NULL,
  `amount` decimal(28,10) NOT NULL,
  `iso_currency_code` text,
  `unofficial_currency_code` text,
  `date` date NOT NULL,
  `pending` tinyint(1) NOT NULL,
  `account_owner` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `posted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `plaid_transaction_id` (`plaid_transaction_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1204 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_purchase_orders`
--

DROP TABLE IF EXISTS `pos_purchase_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_purchase_orders` (
  `receiving_id` int NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(100) NOT NULL,
  `receiving_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` int NOT NULL,
  `supplier_id` int DEFAULT NULL COMMENT 'ledger_id',
  `supplier_invoice_no` varchar(200) NOT NULL,
  `employee_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL,
  `comment` text NOT NULL,
  `payment_type` varchar(20) DEFAULT NULL,
  `account` varchar(255) NOT NULL,
  `register_mode` varchar(200) NOT NULL,
  `receiving_date` date NOT NULL,
  `amount_due` double(10,4) NOT NULL,
  `description` text,
  `discount_value` double(10,4) DEFAULT NULL,
  `total_amount` decimal(10,4) NOT NULL,
  `paid` decimal(10,4) NOT NULL,
  `exchange_rate` decimal(10,5) NOT NULL,
  `currency_id` int NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_tax` decimal(10,3) NOT NULL,
  PRIMARY KEY (`receiving_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `employee_id` (`employee_id`),
  KEY `company_id` (`company_id`),
  KEY `invoice_no` (`invoice_no`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_purchase_orders_items`
--

DROP TABLE IF EXISTS `pos_purchase_orders_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_purchase_orders_items` (
  `purchase_orders_items_id` int NOT NULL AUTO_INCREMENT,
  `receiving_id` int NOT NULL DEFAULT '0',
  `invoice_no` varchar(100) NOT NULL,
  `item_id` int NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int NOT NULL,
  `quantity_purchased` double(10,2) NOT NULL DEFAULT '0.00',
  `item_cost_price` decimal(15,4) NOT NULL,
  `item_unit_price` double(15,4) NOT NULL,
  `discount_percent` int NOT NULL DEFAULT '0',
  `size_id` int NOT NULL,
  `color_id` int NOT NULL,
  `unit_id` int DEFAULT NULL,
  `company_id` int NOT NULL,
  `tax_id` int DEFAULT '0',
  `tax_rate` decimal(10,0) DEFAULT '0',
  `service` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`purchase_orders_items_id`),
  KEY `receiving_id` (`receiving_id`,`invoice_no`,`item_id`,`size_id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_purchasepostingtypes`
--

DROP TABLE IF EXISTS `pos_purchasepostingtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_purchasepostingtypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `inventory_acc_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cash_acc_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bank_acc_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `purchasereturn_acc_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `purchasedis_acc_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `payable_acc_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `company_id` int NOT NULL,
  `forex_gain_acc_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `forex_loss_acc_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `salestax_acc_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `purchase_acc_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_receiving_inv_payment`
--

DROP TABLE IF EXISTS `pos_receiving_inv_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_receiving_inv_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `supplier_id` int NOT NULL,
  `invoice_no` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `receiving_invoice_no` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` decimal(20,4) NOT NULL,
  `company_id` int NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_receivings`
--

DROP TABLE IF EXISTS `pos_receivings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_receivings` (
  `receiving_id` int NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(100) NOT NULL,
  `receiving_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` int NOT NULL,
  `supplier_id` int DEFAULT NULL COMMENT 'ledger_id',
  `supplier_invoice_no` varchar(200) DEFAULT NULL,
  `employee_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL,
  `payment_acc_code` varchar(100) DEFAULT NULL,
  `comment` text NOT NULL,
  `payment_type` varchar(20) DEFAULT NULL,
  `account` varchar(255) NOT NULL,
  `register_mode` varchar(200) NOT NULL,
  `receiving_date` date NOT NULL,
  `amount_due` double(10,4) NOT NULL,
  `description` text,
  `discount_value` double(10,4) DEFAULT NULL,
  `total_amount` decimal(10,4) NOT NULL,
  `paid` decimal(10,4) NOT NULL,
  `exchange_rate` decimal(10,5) NOT NULL,
  `currency_id` int NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_tax` decimal(10,3) NOT NULL,
  `file` varchar(200) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `business_address` text,
  `tax_id` int DEFAULT NULL,
  `tax_rate` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`receiving_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `employee_id` (`employee_id`),
  KEY `company_id` (`company_id`),
  KEY `invoice_no` (`invoice_no`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_receivings_items`
--

DROP TABLE IF EXISTS `pos_receivings_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_receivings_items` (
  `receivings_items_id` int NOT NULL AUTO_INCREMENT,
  `receiving_id` int NOT NULL DEFAULT '0',
  `invoice_no` varchar(100) NOT NULL,
  `item_id` int NOT NULL DEFAULT '0',
  `account_code` varchar(100) DEFAULT NULL,
  `description` text,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int NOT NULL,
  `quantity_purchased` double(10,2) NOT NULL DEFAULT '0.00',
  `item_cost_price` decimal(15,4) NOT NULL,
  `item_unit_price` double(15,4) NOT NULL,
  `discount_percent` int NOT NULL DEFAULT '0',
  `discount_value` decimal(18,0) DEFAULT NULL,
  `size_id` int NOT NULL,
  `color_id` int NOT NULL,
  `unit_id` int DEFAULT NULL,
  `company_id` int NOT NULL,
  `tax_id` int DEFAULT '0',
  `tax_rate` decimal(10,0) DEFAULT '0',
  `service` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`receivings_items_id`),
  KEY `receiving_id` (`receiving_id`,`invoice_no`,`item_id`,`size_id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_sales`
--

DROP TABLE IF EXISTS `pos_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_sales` (
  `sale_id` int NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(20) NOT NULL,
  `company_id` int NOT NULL,
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_date` date NOT NULL,
  `deposit_to_acc_code` varchar(100) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `employee_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL,
  `comment` text NOT NULL,
  `register_mode` varchar(512) DEFAULT NULL,
  `account` varchar(255) NOT NULL COMMENT 'cash or credit',
  `amount_due` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `description` text,
  `discount_value` decimal(10,4) DEFAULT NULL,
  `total_amount` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `total_tax` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `exchange_rate` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `paid` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `currency_id` int NOT NULL DEFAULT '0',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int DEFAULT '0',
  `is_taxable` tinyint(1) NOT NULL,
  `due_date` date DEFAULT NULL,
  `business_address` text,
  `tax_rate` decimal(18,2) DEFAULT NULL,
  `tax_id` int NOT NULL,
  PRIMARY KEY (`sale_id`),
  KEY `customer_id` (`customer_id`),
  KEY `employee_id` (`employee_id`),
  KEY `company_id` (`company_id`),
  KEY `invoice_no` (`invoice_no`),
  KEY `supplier_id` (`supplier_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_sales_inv_payment`
--

DROP TABLE IF EXISTS `pos_sales_inv_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_sales_inv_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `invoice_no` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sales_invoice_no` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` decimal(20,4) NOT NULL,
  `company_id` int NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_sales_items`
--

DROP TABLE IF EXISTS `pos_sales_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_sales_items` (
  `sale_item_id` int NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(20) NOT NULL,
  `sale_id` int NOT NULL DEFAULT '0',
  `item_id` int NOT NULL DEFAULT '0',
  `account_code` varchar(100) DEFAULT NULL,
  `description` text,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int NOT NULL DEFAULT '0',
  `quantity_sold` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_cost_price` decimal(15,4) NOT NULL,
  `item_unit_price` decimal(15,4) NOT NULL,
  `discount_percent` int NOT NULL DEFAULT '0',
  `unit_id` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `company_id` int NOT NULL,
  `discount_value` decimal(10,4) DEFAULT NULL,
  `tax_id` int NOT NULL DEFAULT '0',
  `tax_rate` int NOT NULL DEFAULT '0',
  `inventory_acc_code` varchar(20) DEFAULT '0',
  PRIMARY KEY (`sale_item_id`),
  KEY `invoice_no` (`invoice_no`,`sale_id`,`item_id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_salespostingtypes`
--

DROP TABLE IF EXISTS `pos_salespostingtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_salespostingtypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `inventory_acc_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sales_acc_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cash_acc_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bank_acc_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `receivable_acc_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cos_acc_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `salesreturn_acc_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `salesdis_acc_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `company_id` int NOT NULL,
  `forex_gain_acc_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `forex_loss_acc_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `salestax_acc_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_sizes`
--

DROP TABLE IF EXISTS `pos_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_sizes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `name` varchar(32) NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_supplier`
--

DROP TABLE IF EXISTS `pos_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_supplier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `posting_type_id` int NOT NULL,
  `currency_id` int DEFAULT '0',
  `op_balance_dr` decimal(10,4) DEFAULT '0.0000',
  `op_balance_cr` decimal(10,4) DEFAULT '0.0000',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `exchange_rate` decimal(10,0) DEFAULT '0',
  `acc_code` int DEFAULT NULL,
  `isSupplier` tinyint(1) NOT NULL DEFAULT '1',
  `also_customer` tinyint(1) NOT NULL DEFAULT '0',
  `sale_posting_type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `acc_code` (`acc_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_supplier_payment_history`
--

DROP TABLE IF EXISTS `pos_supplier_payment_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_supplier_payment_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `supplier_id` int NOT NULL,
  `invoice_no` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `receiving_invoice_no` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` decimal(20,4) NOT NULL,
  `company_id` int NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_supplier_payments`
--

DROP TABLE IF EXISTS `pos_supplier_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_supplier_payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(100) NOT NULL,
  `supplier_id` int NOT NULL,
  `account_code` varchar(100) NOT NULL,
  `dueTo_acc_code` varchar(100) NOT NULL,
  `ref_account_id` int DEFAULT '0' COMMENT 'its supplier id',
  `debit` double(15,4) NOT NULL,
  `credit` double(15,4) NOT NULL,
  `narration` text,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date` date NOT NULL,
  `exchange_rate` decimal(10,5) NOT NULL,
  `company_id` int NOT NULL,
  `entry_id` int DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_no` (`invoice_no`,`supplier_id`,`account_code`),
  KEY `company_id` (`company_id`),
  KEY `ref_account_id` (`ref_account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_taxes`
--

DROP TABLE IF EXISTS `pos_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_taxes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_code` varchar(100) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `rate` varchar(50) DEFAULT NULL,
  `description` text,
  `company_id` int NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_units`
--

DROP TABLE IF EXISTS `pos_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_units` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `name` varchar(32) NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unsubscribe`
--

DROP TABLE IF EXISTS `unsubscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unsubscribe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `business_name` text,
  `customer_name` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_no` varchar(100) DEFAULT NULL,
  `comments` text,
  `date_created` date NOT NULL,
  `email_sent` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `company_id` int NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `role` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `forgot_pass_identity` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `email` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'pos_3_db'
--

--
-- Final view structure for view `monthly_sales_view`
--

/*!50001 DROP VIEW IF EXISTS `monthly_sales_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `monthly_sales_view` AS select year(`pos_invoices`.`sale_date`) AS `sales_year`,month(`pos_invoices`.`sale_date`) AS `sales_month`,sum(`pos_invoices`.`total_amount`) AS `total_sales` from `pos_invoices` group by `sales_year`,`sales_month` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-08  5:46:13
