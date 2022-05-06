/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MariaDB
 Source Server Version : 100420
 Source Host           : localhost:3306
 Source Schema         : pmcbasic

 Target Server Type    : MariaDB
 Target Server Version : 100420
 File Encoding         : 65001

 Date: 05/05/2022 08:53:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for alias_url
-- ----------------------------
DROP TABLE IF EXISTS `alias_url`;
CREATE TABLE `alias_url`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `controller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_enabled` tinyint(11) NULL DEFAULT 1,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ref_obj` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `alias`(`alias`) USING BTREE,
  INDEX `alias_2`(`alias`) USING BTREE,
  INDEX `is_enabled`(`is_enabled`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11136 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment`  (
  `item_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`item_name`, `user_id`) USING BTREE,
  INDEX `auth_assignment_user_id_idx`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item`  (
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `rule_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `scope` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data` blob NULL DEFAULT NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  INDEX `rule_name`(`rule_name`) USING BTREE,
  INDEX `idx-auth_item-type`(`type`) USING BTREE,
  INDEX `scope`(`scope`) USING BTREE,
  INDEX `description`(`description`(768)) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child`  (
  `parent` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `child` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`, `child`) USING BTREE,
  INDEX `child`(`child`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule`  (
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` blob NULL DEFAULT NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blue_stripe_locations
-- ----------------------------
DROP TABLE IF EXISTS `blue_stripe_locations`;
CREATE TABLE `blue_stripe_locations`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Nome della location',
  `lat` double NOT NULL COMMENT 'latitudine',
  `lng` double NOT NULL COMMENT 'longitudine',
  `is_published` tinyint(11) NOT NULL DEFAULT 1,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `is_published`(`is_published`) USING BTREE,
  FULLTEXT INDEX `keysearch`(`name`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blue_zones
-- ----------------------------
DROP TABLE IF EXISTS `blue_zones`;
CREATE TABLE `blue_zones`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid_pmc` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ref_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `border_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_published` tinyint(4) NULL DEFAULT NULL,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fk_location` int(11) UNSIGNED NULL DEFAULT NULL,
  `fk_user` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blue_zones_fares
-- ----------------------------
DROP TABLE IF EXISTS `blue_zones_fares`;
CREATE TABLE `blue_zones_fares`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `start_dttm` datetime(0) NULL DEFAULT NULL,
  `end_dttm` datetime(0) NULL DEFAULT NULL,
  `min_price` decimal(10, 2) NULL DEFAULT NULL,
  `max_price` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Importo massimo applicabile',
  `grace_period` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Entro un certo limite temporale la sosta non viene conteggiata',
  `is_default` tinyint(4) NULL DEFAULT 0,
  `is_enabled` tinyint(4) NULL DEFAULT 1,
  `is_unique_fare` tinyint(4) NULL DEFAULT NULL COMMENT 'Se spuntata viene applicata la tariffazione unica senza orario',
  `is_for_working_days` tinyint(4) NULL DEFAULT NULL COMMENT 'Viene applicata nei giorni feriali',
  `is_for_holidays` tinyint(4) NULL DEFAULT NULL COMMENT 'Viene applicata nei giorni festivi',
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fk_zone` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blue_zones_fares_intervals
-- ----------------------------
DROP TABLE IF EXISTS `blue_zones_fares_intervals`;
CREATE TABLE `blue_zones_fares_intervals`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `start_tm` time(0) NOT NULL,
  `end_tm` time(0) NOT NULL,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_complete` tinyint(4) UNSIGNED NULL DEFAULT 0,
  `fk_fare` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 963 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blue_zones_grace_periods
-- ----------------------------
DROP TABLE IF EXISTS `blue_zones_grace_periods`;
CREATE TABLE `blue_zones_grace_periods`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `start_dttm` datetime(0) NULL DEFAULT NULL,
  `end_dttm` datetime(0) NULL DEFAULT NULL,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_enabled` tinyint(4) NULL DEFAULT 1,
  `fk_zone` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blue_zones_parking_meters
-- ----------------------------
DROP TABLE IF EXISTS `blue_zones_parking_meters`;
CREATE TABLE `blue_zones_parking_meters`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `lat` double NULL DEFAULT NULL,
  `lng` double NULL DEFAULT NULL,
  `is_enabled` tinyint(4) NULL DEFAULT NULL,
  `fk_blue_zone` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blue_zones_polygons
-- ----------------------------
DROP TABLE IF EXISTS `blue_zones_polygons`;
CREATE TABLE `blue_zones_polygons`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lat` double NULL DEFAULT NULL,
  `lng` double NULL DEFAULT NULL,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fk_zone` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for booking_coupon
-- ----------------------------
DROP TABLE IF EXISTS `booking_coupon`;
CREATE TABLE `booking_coupon`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` decimal(10, 2) NOT NULL,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fk_booking` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 266 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for booking_infos
-- ----------------------------
DROP TABLE IF EXISTS `booking_infos`;
CREATE TABLE `booking_infos`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cust_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cust_mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cust_surname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cust_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `car_plate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `car_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `car_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `car_seats` int(11) NOT NULL,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fk_booking` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_booking`(`fk_booking`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42289 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for booking_payments
-- ----------------------------
DROP TABLE IF EXISTS `booking_payments`;
CREATE TABLE `booking_payments`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `paypal_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `paypal_sale_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `stripe_session` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `stripe_intent` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `refunded` tinyint(11) NULL DEFAULT 0,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fk_booking` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_booking`(`fk_booking`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42289 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for booking_prices
-- ----------------------------
DROP TABLE IF EXISTS `booking_prices`;
CREATE TABLE `booking_prices`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(10, 2) NOT NULL,
  `infos` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fk_booking` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_booking`(`fk_booking`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 86583 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for booking_reports
-- ----------------------------
DROP TABLE IF EXISTS `booking_reports`;
CREATE TABLE `booking_reports`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashtag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fk_booking` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_booking`(`fk_booking`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37833 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for booking_to_parking_report
-- ----------------------------
DROP TABLE IF EXISTS `booking_to_parking_report`;
CREATE TABLE `booking_to_parking_report`  (
  `fk_booking` int(11) NOT NULL,
  `fk_parking_report` int(11) NOT NULL,
  PRIMARY KEY (`fk_booking`, `fk_parking_report`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bookings
-- ----------------------------
DROP TABLE IF EXISTS `bookings`;
CREATE TABLE `bookings`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `booking_start` datetime(0) NULL DEFAULT NULL,
  `booking_end` datetime(0) NULL DEFAULT NULL,
  `booking_days` int(11) NULL DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `parking_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `payment_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `final_price` decimal(10, 2) NULL DEFAULT NULL,
  `profit_parking` decimal(10, 2) NULL DEFAULT NULL,
  `profit_pmc` decimal(10, 2) NULL DEFAULT NULL,
  `payed_price` decimal(10, 2) NULL DEFAULT NULL,
  `mail_sended` tinyint(11) NULL DEFAULT 0,
  `mail_inner_worker` tinyint(11) NULL DEFAULT 0 COMMENT 'Indica se è stata aggiunta la mail al worker',
  `mail_inner` tinyint(11) NULL DEFAULT 0 COMMENT 'Indica se è stata mandata la mail per la recensione interna',
  `mail_trustpilot_worker` tinyint(11) NULL DEFAULT 0 COMMENT 'Indica se è stata aggiunta la mail al worker per trustpilot',
  `mail_trustpilot` tinyint(11) NULL DEFAULT 0 COMMENT 'Indica se è stata mandata la mail per trustpilot ',
  `is_from_app` tinyint(11) NULL DEFAULT NULL,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `delete_dttm` datetime(0) NULL DEFAULT NULL,
  `fk_user` int(11) NULL DEFAULT NULL,
  `fk_parking_model` int(11) NULL DEFAULT NULL,
  `fk_parking` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_user`(`fk_user`) USING BTREE,
  INDEX `fk_parking_model`(`fk_parking_model`) USING BTREE,
  INDEX `fk_parking`(`fk_parking`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47570 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cache
-- ----------------------------
DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache`  (
  `id` char(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire` int(11) NULL DEFAULT NULL,
  `data` blob NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for city_of_italy
-- ----------------------------
DROP TABLE IF EXISTS `city_of_italy`;
CREATE TABLE `city_of_italy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `province` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fk_province` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8093 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_dttm` datetime(0) NULL DEFAULT NULL,
  `update_dttm` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for coupons
-- ----------------------------
DROP TABLE IF EXISTS `coupons`;
CREATE TABLE `coupons`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_dttm` datetime(0) NOT NULL,
  `end_dttm` datetime(0) NOT NULL,
  `discount` int(11) NOT NULL,
  `is_enabled` tinyint(4) NULL DEFAULT 1,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `code`(`code`) USING BTREE,
  INDEX `is_enabled`(`is_enabled`) USING BTREE,
  INDEX `title`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 149 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for discounts
-- ----------------------------
DROP TABLE IF EXISTS `discounts`;
CREATE TABLE `discounts`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_dttm` datetime(0) NOT NULL,
  `end_dttm` datetime(0) NOT NULL,
  `discount` int(11) NOT NULL,
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'administrator o manager',
  `is_enabled` tinyint(4) NULL DEFAULT 1,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fk_parking` int(11) NULL DEFAULT NULL,
  `fk_parking_model` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_parking`(`fk_parking`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fake_discounts
-- ----------------------------
DROP TABLE IF EXISTS `fake_discounts`;
CREATE TABLE `fake_discounts`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_dttm` datetime(0) NOT NULL,
  `end_dttm` datetime(0) NOT NULL,
  `discount` int(11) NOT NULL,
  `apply_percent` int(11) NOT NULL,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_enabled` tinyint(4) NULL DEFAULT 1,
  `fk_parking` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_parking`(`fk_parking`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for faq_on_page
-- ----------------------------
DROP TABLE IF EXISTS `faq_on_page`;
CREATE TABLE `faq_on_page`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fk_obj` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `action` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `type` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fk_obj` int(11) NULL DEFAULT NULL,
  `fk_user` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for location_descriptions
-- ----------------------------
DROP TABLE IF EXISTS `location_descriptions`;
CREATE TABLE `location_descriptions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `priority` int(255) NULL DEFAULT NULL,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fk_location` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_location`(`fk_location`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 874 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for locations
-- ----------------------------
DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Nome della location',
  `short_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Nome corto della location',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Titolo mostrato nella pagina della location',
  `subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Sottotitolo mostrato nella pagina della location',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` double NOT NULL COMMENT 'latitudine',
  `lng` double NOT NULL COMMENT 'longitudine',
  `title_list` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'titolo dell''elenco bordato',
  `cover_description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_published` tinyint(11) NOT NULL DEFAULT 1,
  `is_on_menu` tinyint(4) NULL DEFAULT 0,
  `is_on_footer` tinyint(4) NULL DEFAULT 0,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fk_media` int(11) NULL DEFAULT NULL COMMENT 'Immagine di copertina della location',
  `fk_alias` int(11) NULL DEFAULT NULL,
  `fk_metakeys` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `url_alias`(`fk_alias`) USING BTREE,
  INDEX `fk_media`(`fk_media`) USING BTREE,
  INDEX `fk_metakeys`(`fk_metakeys`) USING BTREE,
  INDEX `is_published`(`is_published`) USING BTREE,
  FULLTEXT INDEX `keysearch`(`name`, `type`)
) ENGINE = InnoDB AUTO_INCREMENT = 2089 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `prefix` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `fk_user` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_log_level`(`level`) USING BTREE,
  INDEX `idx_log_category`(`category`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 126 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mail_queue
-- ----------------------------
DROP TABLE IF EXISTS `mail_queue`;
CREATE TABLE `mail_queue`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NOT NULL,
  `attempts` int(11) NULL DEFAULT NULL,
  `last_attempt_time` datetime(0) NULL DEFAULT NULL,
  `sent_time` datetime(0) NULL DEFAULT NULL,
  `time_to_send` datetime(0) NOT NULL,
  `swift_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IX_time_to_send`(`time_to_send`) USING BTREE,
  INDEX `IX_sent_time`(`sent_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for medias
-- ----------------------------
DROP TABLE IF EXISTS `medias`;
CREATE TABLE `medias`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NULL DEFAULT NULL,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `mime_type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fk_insert_by` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_insert_by`(`fk_insert_by`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3264 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for meta_keys
-- ----------------------------
DROP TABLE IF EXISTS `meta_keys`;
CREATE TABLE `meta_keys`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `canonical` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ref_obj` int(11) NULL DEFAULT NULL,
  `ref_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1630 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration`  (
  `version` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `apply_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth2_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth2_clients`;
CREATE TABLE `oauth2_clients`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_enabled` tinyint(11) NOT NULL DEFAULT 1,
  `fk_user` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth2_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth2_token`;
CREATE TABLE `oauth2_token`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `jti` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_dttm` int(11) NULL DEFAULT current_timestamp,
  `update_dttm` int(11) NULL DEFAULT NULL,
  `expire_dttm` int(11) NOT NULL,
  `is_enabled` tinyint(4) NOT NULL DEFAULT 1,
  `fk_client` int(11) NULL DEFAULT NULL,
  `fk_user` int(11) NULL DEFAULT NULL,
  `fk_token` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'The base table for oauth2_token entities.' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for parking_closures
-- ----------------------------
DROP TABLE IF EXISTS `parking_closures`;
CREATE TABLE `parking_closures`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `start_dttm` datetime(0) NOT NULL,
  `end_dttm` datetime(0) NOT NULL,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_enabled` tinyint(4) NULL DEFAULT 1,
  `fk_parking` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_parking_model`(`fk_parking`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 380 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for parking_daily_closures
-- ----------------------------
DROP TABLE IF EXISTS `parking_daily_closures`;
CREATE TABLE `parking_daily_closures`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `monday` tinyint(4) NULL DEFAULT 0,
  `tuesday` tinyint(4) NULL DEFAULT 0,
  `wednesday` tinyint(4) NULL DEFAULT 0,
  `thursday` tinyint(4) NULL DEFAULT 0,
  `friday` tinyint(4) NULL DEFAULT 0,
  `saturday` tinyint(4) NULL DEFAULT 0,
  `sunday` tinyint(4) NULL DEFAULT 0,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fk_parking` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1548 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for parking_has_media
-- ----------------------------
DROP TABLE IF EXISTS `parking_has_media`;
CREATE TABLE `parking_has_media`  (
  `fk_parking` int(11) NOT NULL,
  `fk_media` int(11) NOT NULL,
  PRIMARY KEY (`fk_parking`, `fk_media`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for parking_model_abeona_info
-- ----------------------------
DROP TABLE IF EXISTS `parking_model_abeona_info`;
CREATE TABLE `parking_model_abeona_info`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fk_parking_model` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for parking_model_closing_intervals
-- ----------------------------
DROP TABLE IF EXISTS `parking_model_closing_intervals`;
CREATE TABLE `parking_model_closing_intervals`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `start_tm` time(0) NOT NULL,
  `end_tm` time(0) NOT NULL,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fk_parking_model` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1885 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for parking_model_descriptions
-- ----------------------------
DROP TABLE IF EXISTS `parking_model_descriptions`;
CREATE TABLE `parking_model_descriptions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `terms_and_conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `carvalet_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `additional_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fk_parking_model` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4112 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for parking_model_increases
-- ----------------------------
DROP TABLE IF EXISTS `parking_model_increases`;
CREATE TABLE `parking_model_increases`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `price` decimal(10, 2) NOT NULL,
  `start_tm` time(0) NOT NULL,
  `end_tm` time(0) NOT NULL,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fk_parking_model` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 411 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for parking_models
-- ----------------------------
DROP TABLE IF EXISTS `parking_models`;
CREATE TABLE `parking_models`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'standard',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `delivery_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `onsite_parking_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `onsite_additional_price` decimal(10, 2) NULL DEFAULT NULL,
  `carvalet_parking_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `booking_time_limit` int(11) NULL DEFAULT NULL,
  `is_covered` tinyint(11) NULL DEFAULT 0,
  `is_temporaly_closed` tinyint(11) NULL DEFAULT 0,
  `is_published` tinyint(11) NULL DEFAULT 1,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fk_parking` int(11) NOT NULL,
  `fk_alias` int(11) NULL DEFAULT NULL,
  `fk_metakeys` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_parking`(`fk_parking`) USING BTREE,
  INDEX `fk_alias`(`fk_alias`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `is_published`(`is_published`) USING BTREE,
  INDEX `fk_metakeys`(`fk_metakeys`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for parking_report
-- ----------------------------
DROP TABLE IF EXISTS `parking_report`;
CREATE TABLE `parking_report`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `year` int(4) NULL DEFAULT NULL,
  `month` int(4) NULL DEFAULT NULL,
  `payment_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `hashtag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fk_parking` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 124 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for parking_services
-- ----------------------------
DROP TABLE IF EXISTS `parking_services`;
CREATE TABLE `parking_services`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NOT NULL,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fk_parking` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_parking`(`fk_parking`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1047 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for parkings
-- ----------------------------
DROP TABLE IF EXISTS `parkings`;
CREATE TABLE `parkings`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` double NOT NULL COMMENT 'latitudine',
  `lng` double NOT NULL COMMENT 'longitudine',
  `contact_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_telephone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `booking_time_limit` int(11) NULL DEFAULT NULL,
  `commission` int(11) NOT NULL,
  `is_secure` tinyint(11) NULL DEFAULT 0,
  `is_cost_hourly` tinyint(11) NULL DEFAULT 0,
  `is_pay_advance` tinyint(11) NULL DEFAULT 0,
  `is_pay_parking` tinyint(11) NULL DEFAULT 0,
  `is_pay_online` tinyint(11) NULL DEFAULT 0,
  `is_sponsored` tinyint(11) NULL DEFAULT 0,
  `is_official` tinyint(4) NULL DEFAULT 0,
  `has_shuttle` tinyint(11) NULL DEFAULT 0,
  `has_covered` tinyint(11) NULL DEFAULT 0,
  `has_outdoor` tinyint(11) NULL DEFAULT 0,
  `covered_spaces` int(11) NULL DEFAULT 0,
  `outdoor_spaces` int(11) NULL DEFAULT 0,
  `shuttle_frequency` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `location_time_distance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `location_distance` int(10) NULL DEFAULT NULL,
  `official_ref` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `is_published` tinyint(4) NULL DEFAULT 1,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fk_media` int(11) NULL DEFAULT NULL,
  `fk_parking_manager` int(11) NOT NULL,
  `fk_official_parking` int(11) NULL DEFAULT NULL,
  `fk_location` int(11) NOT NULL,
  `fk_alias` int(11) NULL DEFAULT NULL,
  `fk_metakeys` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_parking_manager`(`fk_parking_manager`) USING BTREE,
  INDEX `fk_official_parking`(`fk_official_parking`) USING BTREE,
  INDEX `fk_location`(`fk_location`) USING BTREE,
  INDEX `url_alias`(`fk_alias`) USING BTREE,
  INDEX `fk_media`(`fk_media`) USING BTREE,
  INDEX `is_enabled`(`is_published`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for province_of_italy
-- ----------------------------
DROP TABLE IF EXISTS `province_of_italy`;
CREATE TABLE `province_of_italy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tag` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rate_slots
-- ----------------------------
DROP TABLE IF EXISTS `rate_slots`;
CREATE TABLE `rate_slots`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `day` int(11) NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fk_rate` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_rate`(`fk_rate`) USING BTREE,
  CONSTRAINT `fkrate` FOREIGN KEY (`fk_rate`) REFERENCES `rates` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 47055 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rates
-- ----------------------------
DROP TABLE IF EXISTS `rates`;
CREATE TABLE `rates`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `car_valet_price` decimal(10, 2) NULL DEFAULT NULL,
  `start_dttm` datetime(0) NULL DEFAULT NULL,
  `end_dttm` datetime(0) NULL DEFAULT NULL,
  `is_default` tinyint(11) NULL DEFAULT 0,
  `is_enabled` tinyint(11) NULL DEFAULT 1,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fk_parking` int(11) NULL DEFAULT NULL,
  `fk_parking_model` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_parking`(`fk_parking`) USING BTREE,
  INDEX `fk_parking_model`(`fk_parking_model`) USING BTREE,
  INDEX `is_enabled`(`is_enabled`) USING BTREE,
  INDEX `is_default`(`is_default`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1450 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for redirects
-- ----------------------------
DROP TABLE IF EXISTS `redirects`;
CREATE TABLE `redirects`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `to_domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `from_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `to_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status_code` int(3) NOT NULL,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for reviews
-- ----------------------------
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `vote` tinyint(11) NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `pmc_answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `manager_answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_enabled` tinyint(11) NULL DEFAULT 0,
  `is_published` tinyint(11) NULL DEFAULT 0,
  `is_anonymous` tinyint(11) NULL DEFAULT 0,
  `is_left` int(11) NULL DEFAULT 0,
  `fk_user` int(11) NOT NULL,
  `fk_parking` int(11) NOT NULL,
  `fk_booking` int(11) NOT NULL,
  `fk_parking_model` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_user`(`fk_user`) USING BTREE,
  INDEX `fk_parking`(`fk_parking`) USING BTREE,
  INDEX `fk_booking`(`fk_booking`) USING BTREE,
  INDEX `fk_parking_model`(`fk_parking_model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31422 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for session
-- ----------------------------
DROP TABLE IF EXISTS `session`;
CREATE TABLE `session`  (
  `id` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire` int(11) NULL DEFAULT NULL,
  `data` blob NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `data`(`data`(3072)) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for template_email
-- ----------------------------
DROP TABLE IF EXISTS `template_email`;
CREATE TABLE `template_email`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fk_insert_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_insert_by`(`fk_insert_by`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_mangopay_info
-- ----------------------------
DROP TABLE IF EXISTS `user_mangopay_info`;
CREATE TABLE `user_mangopay_info`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `credit_card_id` int(11) NULL DEFAULT NULL,
  `wallet_id` int(11) NULL DEFAULT NULL,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fk_user` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `last_ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `newsletter_enabled` tinyint(4) NOT NULL DEFAULT 0,
  `privacy_policy_enabled` tinyint(4) NOT NULL DEFAULT 0,
  `password_reset_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `auth_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_enabled` int(11) NULL DEFAULT 1,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `delete_dttm` datetime(0) NULL DEFAULT NULL,
  `last_login_dttm` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username_UNIQUE`(`username`) USING BTREE,
  INDEX `is_enabled`(`is_enabled`) USING BTREE,
  INDEX `email`(`email`) USING BTREE,
  FULLTEXT INDEX `keysearch`(`username`, `first_name`, `last_name`, `email`)
) ENGINE = InnoDB AUTO_INCREMENT = 35868 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vehicles
-- ----------------------------
DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `plate` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `seats` int(11) NOT NULL,
  `is_enabled` tinyint(11) NOT NULL DEFAULT 1,
  `is_favourite` tinyint(11) NULL DEFAULT 0,
  `create_dttm` datetime(0) NULL DEFAULT current_timestamp,
  `update_dttm` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fk_user` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_user`(`fk_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 215922 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Function structure for getPhpSerializedArrayValueByKey
-- ----------------------------
DROP FUNCTION IF EXISTS `getPhpSerializedArrayValueByKey`;
delimiter ;;
CREATE FUNCTION `getPhpSerializedArrayValueByKey`(_input_string TEXT, _key TEXT)
 RETURNS text CHARSET utf8 COLLATE utf8_polish_ci
  DETERMINISTIC
  COMMENT 'Function returns last value from serialized array by specific string key.'
BEGIN
	/*
		Function returns last value from serialized array by specific string key.

		@author Adam Wnęk (http://kredyty-chwilowki.pl/)
		@licence MIT
		@version 1.2
	*/
	-- required variables
	DECLARE __output_part,__output,__extra_byte_counter,__extra_byte_number,__value_type,__array_part_temp TEXT;
	DECLARE __value_length,__char_ord,__start,__char_counter,__non_multibyte_length,__array_close_bracket_counter,__array_open_bracket_counter INT SIGNED;
	SET __output := NULL;

	-- check if key exists in input
	IF LOCATE(CONCAT('s:',LENGTH(_key),':"',_key,'";'), _input_string) != 0 THEN

		-- cut from right to key
		SET __output_part := SUBSTRING_INDEX(_input_string,CONCAT('s:',LENGTH(_key),':"',_key,'";'),-1);

		-- get type of value [s,a,b,O,i,d]
		SET __value_type := SUBSTRING(SUBSTRING(__output_part, 1, CHAR_LENGTH(SUBSTRING_INDEX(__output_part,';',1))), 1, 1);

		-- custom cut depends of value type
		CASE
		WHEN __value_type = 'a' THEN
			-- we get proper array by counting open and close brackets
			SET __array_open_bracket_counter := 1;
			SET __array_close_bracket_counter := 0;
			-- without first open { so counter is 1
			SET __array_part_temp := SUBSTRING(__output_part FROM LOCATE('{',__output_part)+1);

			-- we start from first { and counting open and closet brackets until we find last closing one
			WHILE (__array_open_bracket_counter > 0 OR LENGTH(__array_part_temp) = 0) DO
				-- next { exists and its before closest }
				IF LOCATE('{',__array_part_temp) > 0 AND (LOCATE('{',__array_part_temp) < LOCATE('}',__array_part_temp)) THEN
					-- cut from found { + 1, to the end
					SET __array_open_bracket_counter := __array_open_bracket_counter + 1;
					SET __array_part_temp := SUBSTRING(__array_part_temp FROM LOCATE('{',__array_part_temp) + 1);
				ELSE
					-- cut from found } + 1, to the end
					SET __array_open_bracket_counter := __array_open_bracket_counter - 1;
					SET __array_close_bracket_counter := __array_close_bracket_counter + 1;
					SET __array_part_temp := SUBSTRING(__array_part_temp FROM LOCATE('}',__array_part_temp) + 1);
				END IF;
			END WHILE;
			-- final array is from beginning to [__array_close_bracket_counter] count of closing }
			SET __output := CONCAT(SUBSTRING_INDEX(__output_part,'}',__array_close_bracket_counter),'}');

		WHEN __value_type = 'd' OR __value_type = 'i' OR __value_type = 'b' THEN

			-- from left to first appearance of }, from right to first :
			SET __output := SUBSTRING_INDEX(SUBSTRING_INDEX(__output_part,';',1),':',-1);

		WHEN __value_type = 'O' THEN

			-- from left to first appearance of ;} but without it so we add it back
			SET __output := CONCAT(SUBSTRING_INDEX(__output_part,';}',1),';}');

		WHEN __value_type = 'N' THEN
            -- when we have null return empty string
            SET __output := NULL;
		ELSE

			-- get serialized length
			SET __value_length := SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(__output_part, ':', 2),':',-1),';',1);

			-- s:10:" -> 7 because we start after "
			-- we cut from the begin of our value to the end
			-- begin of our string is after: s[1] + :[1] + n[length of number] + :[1] + "[1] + [1](begin after ") = 5+n
			SET __output_part := SUBSTRING(__output_part, 5+LENGTH(__value_length));

			SET __char_counter := 1;

			-- real length to cut
			SET __non_multibyte_length := 0;

			SET __start := 0;
			-- check every char until [__value_length]
			WHILE __start < __value_length DO

				SET __char_ord := ORD(SUBSTR(__output_part,__char_counter,1));

				SET __extra_byte_number := 0;
				SET __extra_byte_counter := FLOOR(__char_ord / 256);

				-- we detect multibytechars and count them as one to substring correctly
				-- when we now how many chars make multibytechar we can use it to count what is non multibyte length of our value
				WHILE __extra_byte_counter > 0 DO
					SET __extra_byte_counter := FLOOR(__extra_byte_counter / 256);
					SET __extra_byte_number := __extra_byte_number+1;
				END WHILE;

				-- to every char i add extra multibyte number (for non multibyte char its 0)
				SET __start := __start + 1 + __extra_byte_number;
				SET __char_counter := __char_counter + 1;
				SET __non_multibyte_length := __non_multibyte_length +1;

			END WHILE;

			SET __output :=  SUBSTRING(__output_part,1,__non_multibyte_length);

		END CASE;
	END IF;
	RETURN __output;
	END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
