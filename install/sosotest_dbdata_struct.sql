/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : soso_data

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 19/04/2021 17:30:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=451 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb0_error_log
-- ----------------------------
DROP TABLE IF EXISTS `tb0_error_log`;
CREATE TABLE `tb0_error_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `errorLogText` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `logLevel` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb2_dubbo_batch_execute_task
-- ----------------------------
DROP TABLE IF EXISTS `tb2_dubbo_batch_execute_task`;
CREATE TABLE `tb2_dubbo_batch_execute_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `businessLine` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `httpConfKey` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskLevel` int(11) NOT NULL,
  `caseLevel` int(11) NOT NULL,
  `taskIdList` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `isSendEmail` int(11) NOT NULL,
  `isCodeRate` int(11) NOT NULL,
  `isSaveHistory` int(11) NOT NULL,
  `testResult` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executeMsg` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb2_dubbo_interface
-- ----------------------------
DROP TABLE IF EXISTS `tb2_dubbo_interface`;
CREATE TABLE `tb2_dubbo_interface` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interfaceId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `casedesc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `caselevel` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `caseType` int(11) NOT NULL,
  `varsPre` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `dubboSystem` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dubboService` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dubboMethod` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dubboParams` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `encoding` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timeout` int(11) NOT NULL,
  `varsPost` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineId` int(11) NOT NULL,
  `moduleId` int(11) NOT NULL,
  `customUri` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `useCustomUri` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `interfaceId` (`interfaceId`),
  KEY `tb2_dubbo_interface_addBy_4350c7a1_fk_tb_user_loginName` (`addBy`),
  KEY `tb2_dubbo_interface_businessLineId_4a0d1905_fk_tb_busine` (`businessLineId`),
  KEY `tb2_dubbo_interface_moduleId_41ea43c3_fk_tb_modules_id` (`moduleId`),
  CONSTRAINT `tb2_dubbo_interface_addBy_4350c7a1_fk_tb_user_loginName` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`),
  CONSTRAINT `tb2_dubbo_interface_businessLineId_4a0d1905_fk_tb_busine` FOREIGN KEY (`businessLineId`) REFERENCES `tb_business_line` (`id`),
  CONSTRAINT `tb2_dubbo_interface_moduleId_41ea43c3_fk_tb_modules_id` FOREIGN KEY (`moduleId`) REFERENCES `tb_modules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb2_dubbo_interface_debug
-- ----------------------------
DROP TABLE IF EXISTS `tb2_dubbo_interface_debug`;
CREATE TABLE `tb2_dubbo_interface_debug` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interfaceId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `casedesc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `caselevel` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `caseType` int(11) NOT NULL,
  `varsPre` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `dubboSystem` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dubboService` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dubboMethod` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dubboParams` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `encoding` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timeout` int(11) NOT NULL,
  `varsPost` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `execStatus` int(11) NOT NULL,
  `actualResult` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `assertResult` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `testResult` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `beforeExecuteTakeTime` int(11) NOT NULL,
  `afterExecuteTakeTime` int(11) NOT NULL,
  `executeTakeTime` int(11) NOT NULL,
  `totalTakeTime` int(11) NOT NULL,
  `version` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineId` int(11) NOT NULL,
  `httpConfKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `moduleId` int(11) NOT NULL,
  `customUri` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `useCustomUri` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tb2_dubbo_interface_debug_addBy_9a0ae6aa_fk_tb_user_loginName` (`addBy`),
  KEY `tb2_dubbo_interface__businessLineId_fe99cdd8_fk_tb_busine` (`businessLineId`),
  KEY `tb2_dubbo_interface__httpConfKey_ec2ea794_fk_tb_config` (`httpConfKey`),
  KEY `tb2_dubbo_interface_debug_moduleId_8cad7c84_fk_tb_modules_id` (`moduleId`),
  CONSTRAINT `tb2_dubbo_interface__businessLineId_fe99cdd8_fk_tb_busine` FOREIGN KEY (`businessLineId`) REFERENCES `tb_business_line` (`id`),
  CONSTRAINT `tb2_dubbo_interface__httpConfKey_ec2ea794_fk_tb_config` FOREIGN KEY (`httpConfKey`) REFERENCES `tb_config_http` (`httpConfKey`),
  CONSTRAINT `tb2_dubbo_interface_debug_addBy_9a0ae6aa_fk_tb_user_loginName` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`),
  CONSTRAINT `tb2_dubbo_interface_debug_moduleId_8cad7c84_fk_tb_modules_id` FOREIGN KEY (`moduleId`) REFERENCES `tb_modules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb2_dubbo_interface_execute_history
-- ----------------------------
DROP TABLE IF EXISTS `tb2_dubbo_interface_execute_history`;
CREATE TABLE `tb2_dubbo_interface_execute_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interfaceUrl` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requestHost` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalCount` int(11) NOT NULL,
  `passCount` int(11) NOT NULL,
  `failCount` int(11) NOT NULL,
  `errorCount` int(11) NOT NULL,
  `exceptionCount` int(11) NOT NULL,
  `taskId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskdesc` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `protocol` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testReportUrl` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `execBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `httpConfKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskExecuteId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb2_dubbo_interface_exec_interfaceUrl_taskExecute_2089e973_uniq` (`interfaceUrl`,`taskExecuteId`),
  KEY `tb2_dubbo_interface__addBy_3e87b9bd_fk_tb_user_l` (`addBy`),
  KEY `tb2_dubbo_interface__execBy_a49c2e31_fk_tb_user_l` (`execBy`),
  KEY `tb2_dubbo_interface__httpConfKey_91623e8e_fk_tb_config` (`httpConfKey`),
  KEY `tb2_dubbo_interface__taskExecuteId_03180417_fk_tb2_dubbo` (`taskExecuteId`),
  CONSTRAINT `tb2_dubbo_interface__addBy_3e87b9bd_fk_tb_user_l` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`),
  CONSTRAINT `tb2_dubbo_interface__execBy_a49c2e31_fk_tb_user_l` FOREIGN KEY (`execBy`) REFERENCES `tb_user` (`loginName`),
  CONSTRAINT `tb2_dubbo_interface__httpConfKey_91623e8e_fk_tb_config` FOREIGN KEY (`httpConfKey`) REFERENCES `tb_config_http` (`httpConfKey`),
  CONSTRAINT `tb2_dubbo_interface__taskExecuteId_03180417_fk_tb2_dubbo` FOREIGN KEY (`taskExecuteId`) REFERENCES `tb2_dubbo_task_execute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb2_dubbo_quick_debug
-- ----------------------------
DROP TABLE IF EXISTS `tb2_dubbo_quick_debug`;
CREATE TABLE `tb2_dubbo_quick_debug` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `requestAddr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dubboService` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dubboMethod` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dubboParams` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `encoding` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actualResult` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `executeTakeTime` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb2_dubbo_task
-- ----------------------------
DROP TABLE IF EXISTS `tb2_dubbo_task`;
CREATE TABLE `tb2_dubbo_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskdesc` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `protocol` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineGroup` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modulesGroup` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emailList` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskLevel` int(11) NOT NULL,
  `highPriorityVARS` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `interfaceCount` int(11) NOT NULL,
  `taskInterfaces` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `caseCount` int(11) NOT NULL,
  `taskTestcases` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `interfaceNum` int(11) NOT NULL,
  `isCI` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskId` (`taskId`),
  KEY `tb2_dubbo_task_addBy_7d775fbe_fk_tb_user_loginName` (`addBy`),
  CONSTRAINT `tb2_dubbo_task_addBy_7d775fbe_fk_tb_user_loginName` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb2_dubbo_task_execute
-- ----------------------------
DROP TABLE IF EXISTS `tb2_dubbo_task_execute`;
CREATE TABLE `tb2_dubbo_task_execute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskId` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskdesc` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `protocol` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineGroup` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modulesGroup` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskLevel` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `highPriorityVARS` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `interfaceCount` int(11) NOT NULL,
  `taskInterfaces` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `caseCount` int(11) NOT NULL,
  `taskTestcases` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `interfaceNum` int(11) NOT NULL,
  `isCI` int(11) NOT NULL,
  `caseLevel` int(11) NOT NULL,
  `isSendEmail` int(11) NOT NULL,
  `emailList` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isCodeRate` int(11) NOT NULL,
  `isSaveHistory` int(11) NOT NULL,
  `execComments` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `retryCount` int(11) NOT NULL,
  `execType` int(11) NOT NULL,
  `execTime` datetime(6) NOT NULL,
  `execFinishTime` datetime(6) NOT NULL,
  `execTakeTime` int(11) NOT NULL,
  `execStatus` int(11) NOT NULL,
  `execProgressData` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `execPlatform` int(11) NOT NULL,
  `execLevel` int(11) NOT NULL,
  `testResult` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testResultMsg` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `testReportUrl` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskSuiteExecuteId` int(11) NOT NULL,
  `version` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `execBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `httpConfKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tb2_dubbo_task_execute_addBy_0d2ae424_fk_tb_user_loginName` (`addBy`),
  KEY `tb2_dubbo_task_execute_execBy_895030f5_fk_tb_user_loginName` (`execBy`),
  KEY `tb2_dubbo_task_execu_httpConfKey_7ae8eb76_fk_tb_config` (`httpConfKey`),
  CONSTRAINT `tb2_dubbo_task_execu_httpConfKey_7ae8eb76_fk_tb_config` FOREIGN KEY (`httpConfKey`) REFERENCES `tb_config_http` (`httpConfKey`),
  CONSTRAINT `tb2_dubbo_task_execute_addBy_0d2ae424_fk_tb_user_loginName` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`),
  CONSTRAINT `tb2_dubbo_task_execute_execBy_895030f5_fk_tb_user_loginName` FOREIGN KEY (`execBy`) REFERENCES `tb_user` (`loginName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb2_dubbo_task_suite
-- ----------------------------
DROP TABLE IF EXISTS `tb2_dubbo_task_suite`;
CREATE TABLE `tb2_dubbo_task_suite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskSuiteId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskSuiteDesc` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `protocol` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emailList` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `taskCount` int(11) NOT NULL,
  `taskList` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `isCI` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskSuiteId` (`taskSuiteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb2_dubbo_task_suite_execute
-- ----------------------------
DROP TABLE IF EXISTS `tb2_dubbo_task_suite_execute`;
CREATE TABLE `tb2_dubbo_task_suite_execute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskSuiteId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskSuiteDesc` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `protocol` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `taskCount` int(11) NOT NULL,
  `taskList` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isCI` int(11) NOT NULL,
  `httpConfKeyList` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `httpConfKeyAliasList` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caseLevel` int(11) NOT NULL,
  `isSendEmail` int(11) NOT NULL,
  `emailList` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isCodeRate` int(11) NOT NULL,
  `isSaveHistory` int(11) NOT NULL,
  `execComments` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `retryCount` int(11) NOT NULL,
  `execType` int(11) NOT NULL,
  `execTime` datetime(6) NOT NULL,
  `execFinishTime` datetime(6) NOT NULL,
  `execTakeTime` int(11) NOT NULL,
  `execBy` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `execStatus` int(11) NOT NULL,
  `execProgressData` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `execPlatform` int(11) NOT NULL,
  `execLevel` int(11) NOT NULL,
  `testResult` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testResultMsg` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `testReportUrl` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskExecuteIdList` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb2_dubbo_testcase
-- ----------------------------
DROP TABLE IF EXISTS `tb2_dubbo_testcase`;
CREATE TABLE `tb2_dubbo_testcase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caseId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `casedesc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `caselevel` int(11) NOT NULL,
  `stepCount` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `caseType` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineId` int(11) NOT NULL,
  `moduleId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `caseId` (`caseId`),
  KEY `tb2_dubbo_testcase_addBy_a3261d1b_fk_tb_user_loginName` (`addBy`),
  KEY `tb2_dubbo_testcase_businessLineId_963e529e_fk_tb_busine` (`businessLineId`),
  KEY `tb2_dubbo_testcase_moduleId_9167ec16_fk_tb_modules_id` (`moduleId`),
  CONSTRAINT `tb2_dubbo_testcase_addBy_a3261d1b_fk_tb_user_loginName` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`),
  CONSTRAINT `tb2_dubbo_testcase_businessLineId_963e529e_fk_tb_busine` FOREIGN KEY (`businessLineId`) REFERENCES `tb_business_line` (`id`),
  CONSTRAINT `tb2_dubbo_testcase_moduleId_9167ec16_fk_tb_modules_id` FOREIGN KEY (`moduleId`) REFERENCES `tb_modules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb2_dubbo_testcase_debug
-- ----------------------------
DROP TABLE IF EXISTS `tb2_dubbo_testcase_debug`;
CREATE TABLE `tb2_dubbo_testcase_debug` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caseId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `casedesc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `caselevel` int(11) NOT NULL,
  `stepCount` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `caseType` int(11) NOT NULL,
  `execStatus` int(11) NOT NULL,
  `assertResult` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `testResult` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `beforeExecuteTakeTime` int(11) NOT NULL,
  `afterExecuteTakeTime` int(11) NOT NULL,
  `executeTakeTime` int(11) NOT NULL,
  `totalTakeTime` int(11) NOT NULL,
  `version` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineId` int(11) NOT NULL,
  `httpConfKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `moduleId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tb2_dubbo_testcase_debug_addBy_f4bfb016_fk_tb_user_loginName` (`addBy`),
  KEY `tb2_dubbo_testcase_d_businessLineId_b1b2f54c_fk_tb_busine` (`businessLineId`),
  KEY `tb2_dubbo_testcase_d_httpConfKey_bcd1c151_fk_tb_config` (`httpConfKey`),
  KEY `tb2_dubbo_testcase_debug_moduleId_19291e9c_fk_tb_modules_id` (`moduleId`),
  CONSTRAINT `tb2_dubbo_testcase_d_businessLineId_b1b2f54c_fk_tb_busine` FOREIGN KEY (`businessLineId`) REFERENCES `tb_business_line` (`id`),
  CONSTRAINT `tb2_dubbo_testcase_d_httpConfKey_bcd1c151_fk_tb_config` FOREIGN KEY (`httpConfKey`) REFERENCES `tb_config_http` (`httpConfKey`),
  CONSTRAINT `tb2_dubbo_testcase_debug_addBy_f4bfb016_fk_tb_user_loginName` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`),
  CONSTRAINT `tb2_dubbo_testcase_debug_moduleId_19291e9c_fk_tb_modules_id` FOREIGN KEY (`moduleId`) REFERENCES `tb_modules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb2_dubbo_testcase_step
-- ----------------------------
DROP TABLE IF EXISTS `tb2_dubbo_testcase_step`;
CREATE TABLE `tb2_dubbo_testcase_step` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stepNum` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stepDesc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `caseType` int(11) NOT NULL,
  `fromInterfaceId` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isSync` int(11) NOT NULL,
  `varsPre` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `dubboSystem` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dubboService` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dubboMethod` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dubboParams` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `encoding` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timeout` int(11) NOT NULL,
  `varsPost` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineId` int(11) NOT NULL,
  `caseId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `moduleId` int(11) NOT NULL,
  `customUri` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `useCustomUri` int(11) NOT NULL,
  `stepSwitch` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb2_dubbo_testcase_step_caseId_stepNum_83dd8c41_uniq` (`caseId`,`stepNum`),
  KEY `tb2_dubbo_testcase_step_addBy_e6c8f09d_fk_tb_user_loginName` (`addBy`),
  KEY `tb2_dubbo_testcase_s_businessLineId_f1e4b811_fk_tb_busine` (`businessLineId`),
  KEY `tb2_dubbo_testcase_step_moduleId_0e5dc9c6_fk_tb_modules_id` (`moduleId`),
  CONSTRAINT `tb2_dubbo_testcase_s_businessLineId_f1e4b811_fk_tb_busine` FOREIGN KEY (`businessLineId`) REFERENCES `tb_business_line` (`id`),
  CONSTRAINT `tb2_dubbo_testcase_s_caseId_6f2a291a_fk_tb2_dubbo` FOREIGN KEY (`caseId`) REFERENCES `tb2_dubbo_testcase` (`caseId`),
  CONSTRAINT `tb2_dubbo_testcase_step_addBy_e6c8f09d_fk_tb_user_loginName` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`),
  CONSTRAINT `tb2_dubbo_testcase_step_moduleId_0e5dc9c6_fk_tb_modules_id` FOREIGN KEY (`moduleId`) REFERENCES `tb_modules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb2_dubbo_testcase_step_debug
-- ----------------------------
DROP TABLE IF EXISTS `tb2_dubbo_testcase_step_debug`;
CREATE TABLE `tb2_dubbo_testcase_step_debug` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caseId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stepNum` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stepDesc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `caseType` int(11) NOT NULL,
  `fromInterfaceId` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isSync` int(11) NOT NULL,
  `varsPre` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `dubboSystem` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dubboService` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dubboMethod` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dubboParams` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `encoding` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timeout` int(11) NOT NULL,
  `varsPost` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `execStatus` int(11) NOT NULL,
  `actualResult` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `assertResult` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `testResult` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `beforeExecuteTakeTime` int(11) NOT NULL,
  `afterExecuteTakeTime` int(11) NOT NULL,
  `executeTakeTime` int(11) NOT NULL,
  `totalTakeTime` int(11) NOT NULL,
  `version` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineId` int(11) NOT NULL,
  `httpConfKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `moduleId` int(11) NOT NULL,
  `customUri` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `useCustomUri` int(11) NOT NULL,
  `stepSwitch` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tb2_dubbo_testcase_s_addBy_a6be5b8a_fk_tb_user_l` (`addBy`),
  KEY `tb2_dubbo_testcase_s_businessLineId_01eb303d_fk_tb_busine` (`businessLineId`),
  KEY `tb2_dubbo_testcase_s_httpConfKey_1efa97b1_fk_tb_config` (`httpConfKey`),
  KEY `tb2_dubbo_testcase_step_debug_moduleId_15edadcb_fk_tb_modules_id` (`moduleId`),
  CONSTRAINT `tb2_dubbo_testcase_s_addBy_a6be5b8a_fk_tb_user_l` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`),
  CONSTRAINT `tb2_dubbo_testcase_s_businessLineId_01eb303d_fk_tb_busine` FOREIGN KEY (`businessLineId`) REFERENCES `tb_business_line` (`id`),
  CONSTRAINT `tb2_dubbo_testcase_s_httpConfKey_1efa97b1_fk_tb_config` FOREIGN KEY (`httpConfKey`) REFERENCES `tb_config_http` (`httpConfKey`),
  CONSTRAINT `tb2_dubbo_testcase_step_debug_moduleId_15edadcb_fk_tb_modules_id` FOREIGN KEY (`moduleId`) REFERENCES `tb_modules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb3_ui_global_text
-- ----------------------------
DROP TABLE IF EXISTS `tb3_ui_global_text`;
CREATE TABLE `tb3_ui_global_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `textDesc` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `textKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `textValue` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `textKey` (`textKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb3_ui_global_vars
-- ----------------------------
DROP TABLE IF EXISTS `tb3_ui_global_vars`;
CREATE TABLE `tb3_ui_global_vars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `varDesc` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `varKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `varValue` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `varKey` (`varKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb3_ui_page_element
-- ----------------------------
DROP TABLE IF EXISTS `tb3_ui_page_element`;
CREATE TABLE `tb3_ui_page_element` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `elementTitle` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `elementDesc` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `elementKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `elementType` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `elementValue` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb3_ui_page_element_poKey_elementKey_1025b4bb_uniq` (`poKey`,`elementKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb3_ui_page_object
-- ----------------------------
DROP TABLE IF EXISTS `tb3_ui_page_object`;
CREATE TABLE `tb3_ui_page_object` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poTitle` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poDesc` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `poKey` (`poKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb4_data_keyword
-- ----------------------------
DROP TABLE IF EXISTS `tb4_data_keyword`;
CREATE TABLE `tb4_data_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descText` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywordKey` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywordCode` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `keywordKey` (`keywordKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb4_mock_follower
-- ----------------------------
DROP TABLE IF EXISTS `tb4_mock_follower`;
CREATE TABLE `tb4_mock_follower` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mockId` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `follower` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `followTime` datetime(6) DEFAULT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb4_mock_http
-- ----------------------------
DROP TABLE IF EXISTS `tb4_mock_http`;
CREATE TABLE `tb4_mock_http` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mockId` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineId` int(11) NOT NULL,
  `moduleId` int(11) NOT NULL,
  `uriKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tagKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reqMethod` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reqUrl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reqParam` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reqHeader` varchar(3000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reqBody` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `respStatusCode` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `respStatusReason` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `respContentType` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `respBody` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `respCookie` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `respHeader` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `respCharset` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mockMode` int(11) NOT NULL,
  `advancedPythonCode` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `interfaceIds` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `describe` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mockId` (`mockId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb4_mock_http_invoke_history
-- ----------------------------
DROP TABLE IF EXISTS `tb4_mock_http_invoke_history`;
CREATE TABLE `tb4_mock_http_invoke_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mockId` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineId` int(11) NOT NULL,
  `moduleId` int(11) NOT NULL,
  `uriKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tagKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reqMethod` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reqUrl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reqParam` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reqHeader` varchar(3000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reqBody` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `respStatusCode` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `respStatusReason` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `respContentType` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `respBody` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `respCookie` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `respHeader` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `respCharset` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mockMode` int(11) NOT NULL,
  `advancedPythonCode` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fromHostIp` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `httpConfKey` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actualReqUrl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actualReqParam` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actualReqHeader` varchar(3000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actualReqBody` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `actualRespStatusCode` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actualRespStatusReason` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actualRespContentType` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actualRespBody` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `actualRespCookie` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actualRespCharset` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb4_mock_tag
-- ----------------------------
DROP TABLE IF EXISTS `tb4_mock_tag`;
CREATE TABLE `tb4_mock_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tagAlias` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tagKey` (`tagKey`),
  UNIQUE KEY `tagAlias` (`tagAlias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb4_statistic_task
-- ----------------------------
DROP TABLE IF EXISTS `tb4_statistic_task`;
CREATE TABLE `tb4_statistic_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `businessLineId` int(11) NOT NULL,
  `moduleId` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descText` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb4_statistic_task_execute_info
-- ----------------------------
DROP TABLE IF EXISTS `tb4_statistic_task_execute_info`;
CREATE TABLE `tb4_statistic_task_execute_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statisticTaskId` int(11) NOT NULL,
  `businessLineId` int(11) NOT NULL,
  `moduleId` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descText` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executeDetailText` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `testResult` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codeCoverage` double NOT NULL,
  `executeStartTime` datetime(6) NOT NULL,
  `executeTaketime` int(11) NOT NULL,
  `httpConfKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executeType` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executeBy` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` varchar(4000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` varchar(4000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_admin_interface_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin_interface_permission_relation`;
CREATE TABLE `tb_admin_interface_permission_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissionKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isDefault` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissionKey` (`permissionKey`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_admin_manage_permission
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin_manage_permission`;
CREATE TABLE `tb_admin_manage_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissionKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissionValue` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isDefaultPermission` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissionKey` (`permissionKey`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_admin_manage_user_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin_manage_user_permission_relation`;
CREATE TABLE `tb_admin_manage_user_permission_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginName` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissionKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_admin_platform_permission
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin_platform_permission`;
CREATE TABLE `tb_admin_platform_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissionKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissionKey` (`permissionKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_admin_platform_permission_user_relation
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin_platform_permission_user_relation`;
CREATE TABLE `tb_admin_platform_permission_user_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissionKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin_role`;
CREATE TABLE `tb_admin_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roleKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roleKey` (`roleKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_admin_role_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin_role_permission_relation`;
CREATE TABLE `tb_admin_role_permission_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissionKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roleKey` (`roleKey`),
  UNIQUE KEY `permissionKey` (`permissionKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_admin_team
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin_team`;
CREATE TABLE `tb_admin_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teamName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teamKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teamDesc` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `teamKey` (`teamKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_admin_team_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin_team_permission_relation`;
CREATE TABLE `tb_admin_team_permission_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teamKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissionKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin_user`;
CREATE TABLE `tb_admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `passWord` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `superManager` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `loginName` (`loginName`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_admin_user_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin_user_permission_relation`;
CREATE TABLE `tb_admin_user_permission_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginName` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissionKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_admin_user_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin_user_role_relation`;
CREATE TABLE `tb_admin_user_role_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loginName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teamKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_admin_user_team_relation
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin_user_team_relation`;
CREATE TABLE `tb_admin_user_team_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teamKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_batch_execute_task
-- ----------------------------
DROP TABLE IF EXISTS `tb_batch_execute_task`;
CREATE TABLE `tb_batch_execute_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `businessLine` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `httpConfKey` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskLevel` int(11) NOT NULL,
  `caseLevel` int(11) NOT NULL,
  `taskIdList` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `isSendEmail` int(11) NOT NULL,
  `isCodeRate` int(11) NOT NULL,
  `isSaveHistory` int(11) NOT NULL,
  `testResult` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executeMsg` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_businessLine_module_relation
-- ----------------------------
DROP TABLE IF EXISTS `tb_businessLine_module_relation`;
CREATE TABLE `tb_businessLine_module_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL,
  `businessLineId` int(11) NOT NULL,
  `moduleId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_businessLine_module_r_businessLineId_moduleId_814209c2_uniq` (`businessLineId`,`moduleId`),
  KEY `tb_businessLine_modu_moduleId_9dd837b9_fk_tb_module` (`moduleId`),
  CONSTRAINT `tb_businessLine_modu_businessLineId_3d1a4ad2_fk_tb_busine` FOREIGN KEY (`businessLineId`) REFERENCES `tb_business_line` (`id`),
  CONSTRAINT `tb_businessLine_modu_moduleId_9dd837b9_fk_tb_module` FOREIGN KEY (`moduleId`) REFERENCES `tb_modules` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_business_line
-- ----------------------------
DROP TABLE IF EXISTS `tb_business_line`;
CREATE TABLE `tb_business_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bussinessLineName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bussinessLineDesc` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bussinessLineName` (`bussinessLineName`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_config_http
-- ----------------------------
DROP TABLE IF EXISTS `tb_config_http`;
CREATE TABLE `tb_config_http` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `httpConfKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `httpConfDesc` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apiRunState` int(11) NOT NULL,
  `uiRunState` int(11) NOT NULL,
  `dubboRunState` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `serviceConfKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `httpConfKey` (`httpConfKey`),
  UNIQUE KEY `alias` (`alias`),
  KEY `tb_config_http_serviceConfKey_00872e31_fk_tb_config` (`serviceConfKey`),
  CONSTRAINT `tb_config_http_serviceConfKey_00872e31_fk_tb_config` FOREIGN KEY (`serviceConfKey`) REFERENCES `tb_config_service` (`serviceConfKey`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_config_service
-- ----------------------------
DROP TABLE IF EXISTS `tb_config_service`;
CREATE TABLE `tb_config_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serviceConfKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serviceConfDesc` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serviceConf` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serviceConfKey` (`serviceConfKey`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_config_uri
-- ----------------------------
DROP TABLE IF EXISTS `tb_config_uri`;
CREATE TABLE `tb_config_uri` (
  `id` int(11) NOT NULL,
  `uriKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uriDesc` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` int(11) NOT NULL,
  `protocol` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`uriKey`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_env_uri_conf
-- ----------------------------
DROP TABLE IF EXISTS `tb_env_uri_conf`;
CREATE TABLE `tb_env_uri_conf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `httpConfKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uriKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requestAddr` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_env_uri_conf_httpConfKey_uriKey_9bf254b5_uniq` (`httpConfKey`,`uriKey`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_exec_python_attrs
-- ----------------------------
DROP TABLE IF EXISTS `tb_exec_python_attrs`;
CREATE TABLE `tb_exec_python_attrs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `execPythonAttr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `execPythonDesc` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `execPythonValue` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `execPythonAttr` (`execPythonAttr`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_global_text
-- ----------------------------
DROP TABLE IF EXISTS `tb_global_text`;
CREATE TABLE `tb_global_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `textDesc` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `textKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `textValue` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `textKey` (`textKey`),
  KEY `tb_global_text_addBy_1e2e8da7_fk_tb_user_loginName` (`addBy`),
  CONSTRAINT `tb_global_text_addBy_1e2e8da7_fk_tb_user_loginName` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_global_vars
-- ----------------------------
DROP TABLE IF EXISTS `tb_global_vars`;
CREATE TABLE `tb_global_vars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `varDesc` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `varKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `varValue` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `varKey` (`varKey`),
  KEY `tb_global_vars_addBy_d3f3ff01_fk_tb_user_loginName` (`addBy`),
  CONSTRAINT `tb_global_vars_addBy_d3f3ff01_fk_tb_user_loginName` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_http_interface
-- ----------------------------
DROP TABLE IF EXISTS `tb_http_interface`;
CREATE TABLE `tb_http_interface` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interfaceId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `casedesc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `caselevel` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `caseType` int(11) NOT NULL,
  `varsPre` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `bodyType` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bodyContent` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `timeout` int(11) NOT NULL,
  `varsPost` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `performanceTime` double NOT NULL,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineId` int(11) NOT NULL,
  `moduleId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `customUri` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `useCustomUri` int(11) NOT NULL,
  `urlRedirect` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `interfaceId` (`interfaceId`),
  KEY `tb_http_interface_addBy_5bc2c23e_fk_tb_user_loginName` (`addBy`),
  KEY `tb_http_interface_businessLineId_7ec2e6d1_fk_tb_business_line_id` (`businessLineId`),
  KEY `tb_http_interface_moduleId_3ad062be_fk_tb_modules_id` (`moduleId`),
  KEY `tb_http_interface_sourceId_8d049614_fk_tb_source_id` (`sourceId`),
  CONSTRAINT `tb_http_interface_addBy_5bc2c23e_fk_tb_user_loginName` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`),
  CONSTRAINT `tb_http_interface_businessLineId_7ec2e6d1_fk_tb_business_line_id` FOREIGN KEY (`businessLineId`) REFERENCES `tb_business_line` (`id`),
  CONSTRAINT `tb_http_interface_moduleId_3ad062be_fk_tb_modules_id` FOREIGN KEY (`moduleId`) REFERENCES `tb_modules` (`id`),
  CONSTRAINT `tb_http_interface_sourceId_8d049614_fk_tb_source_id` FOREIGN KEY (`sourceId`) REFERENCES `tb_source` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_http_interface_debug
-- ----------------------------
DROP TABLE IF EXISTS `tb_http_interface_debug`;
CREATE TABLE `tb_http_interface_debug` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interfaceId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `casedesc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `caselevel` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `caseType` int(11) NOT NULL,
  `varsPre` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `bodyType` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bodyContent` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `timeout` int(11) NOT NULL,
  `varsPost` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `performanceTime` double NOT NULL,
  `execStatus` int(11) NOT NULL,
  `actualResult` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `assertResult` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `testResult` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `beforeExecuteTakeTime` int(11) NOT NULL,
  `afterExecuteTakeTime` int(11) NOT NULL,
  `executeTakeTime` int(11) NOT NULL,
  `totalTakeTime` int(11) NOT NULL,
  `version` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineId` int(11) NOT NULL,
  `httpConfKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `moduleId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_http_interface_debug_addBy_47eec10a_fk_tb_user_loginName` (`addBy`),
  KEY `tb_http_interface_de_businessLineId_04e1a133_fk_tb_busine` (`businessLineId`),
  KEY `tb_http_interface_de_httpConfKey_41966b67_fk_tb_config` (`httpConfKey`),
  KEY `tb_http_interface_debug_moduleId_12f8bedc_fk_tb_modules_id` (`moduleId`),
  KEY `tb_http_interface_debug_sourceId_631c2496_fk_tb_source_id` (`sourceId`),
  CONSTRAINT `tb_http_interface_de_businessLineId_04e1a133_fk_tb_busine` FOREIGN KEY (`businessLineId`) REFERENCES `tb_business_line` (`id`),
  CONSTRAINT `tb_http_interface_de_httpConfKey_41966b67_fk_tb_config` FOREIGN KEY (`httpConfKey`) REFERENCES `tb_config_http` (`httpConfKey`),
  CONSTRAINT `tb_http_interface_debug_addBy_47eec10a_fk_tb_user_loginName` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`),
  CONSTRAINT `tb_http_interface_debug_moduleId_12f8bedc_fk_tb_modules_id` FOREIGN KEY (`moduleId`) REFERENCES `tb_modules` (`id`),
  CONSTRAINT `tb_http_interface_debug_sourceId_631c2496_fk_tb_source_id` FOREIGN KEY (`sourceId`) REFERENCES `tb_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_http_interface_tag
-- ----------------------------
DROP TABLE IF EXISTS `tb_http_interface_tag`;
CREATE TABLE `tb_http_interface_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interfaceId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tagId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_http_interface_tag_interfaceId_tagId_53e5a2a3_uniq` (`interfaceId`,`tagId`),
  KEY `tb_http_interface_tag_addBy_ca20eafb_fk_tb_user_loginName` (`addBy`),
  KEY `tb_http_interface_tag_tagId_229ce722_fk_tb_tag_id` (`tagId`),
  CONSTRAINT `tb_http_interface_ta_interfaceId_992f5b60_fk_tb_http_i` FOREIGN KEY (`interfaceId`) REFERENCES `tb_http_interface` (`interfaceId`),
  CONSTRAINT `tb_http_interface_tag_addBy_ca20eafb_fk_tb_user_loginName` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`),
  CONSTRAINT `tb_http_interface_tag_tagId_229ce722_fk_tb_tag_id` FOREIGN KEY (`tagId`) REFERENCES `tb_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_http_testcase
-- ----------------------------
DROP TABLE IF EXISTS `tb_http_testcase`;
CREATE TABLE `tb_http_testcase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caseId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `casedesc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `caselevel` int(11) NOT NULL,
  `stepCount` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `caseType` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineId` int(11) NOT NULL,
  `moduleId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `caseId` (`caseId`),
  KEY `tb_http_testcase_addBy_97ac819b_fk_tb_user_loginName` (`addBy`),
  KEY `tb_http_testcase_businessLineId_017037e3_fk_tb_business_line_id` (`businessLineId`),
  KEY `tb_http_testcase_moduleId_c5daae6e_fk_tb_modules_id` (`moduleId`),
  KEY `tb_http_testcase_sourceId_3350a006_fk_tb_source_id` (`sourceId`),
  CONSTRAINT `tb_http_testcase_addBy_97ac819b_fk_tb_user_loginName` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`),
  CONSTRAINT `tb_http_testcase_businessLineId_017037e3_fk_tb_business_line_id` FOREIGN KEY (`businessLineId`) REFERENCES `tb_business_line` (`id`),
  CONSTRAINT `tb_http_testcase_moduleId_c5daae6e_fk_tb_modules_id` FOREIGN KEY (`moduleId`) REFERENCES `tb_modules` (`id`),
  CONSTRAINT `tb_http_testcase_sourceId_3350a006_fk_tb_source_id` FOREIGN KEY (`sourceId`) REFERENCES `tb_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_http_testcase_debug
-- ----------------------------
DROP TABLE IF EXISTS `tb_http_testcase_debug`;
CREATE TABLE `tb_http_testcase_debug` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caseId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `casedesc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `caselevel` int(11) NOT NULL,
  `stepCount` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `caseType` int(11) NOT NULL,
  `execStatus` int(11) NOT NULL,
  `assertResult` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `testResult` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `beforeExecuteTakeTime` int(11) NOT NULL,
  `afterExecuteTakeTime` int(11) NOT NULL,
  `executeTakeTime` int(11) NOT NULL,
  `totalTakeTime` int(11) NOT NULL,
  `version` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineId` int(11) NOT NULL,
  `httpConfKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `moduleId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_http_testcase_debug_addBy_89908624_fk_tb_user_loginName` (`addBy`),
  KEY `tb_http_testcase_deb_businessLineId_04ec992f_fk_tb_busine` (`businessLineId`),
  KEY `tb_http_testcase_deb_httpConfKey_b1249007_fk_tb_config` (`httpConfKey`),
  KEY `tb_http_testcase_debug_moduleId_16fffff0_fk_tb_modules_id` (`moduleId`),
  KEY `tb_http_testcase_debug_sourceId_a85a5796_fk_tb_source_id` (`sourceId`),
  CONSTRAINT `tb_http_testcase_deb_businessLineId_04ec992f_fk_tb_busine` FOREIGN KEY (`businessLineId`) REFERENCES `tb_business_line` (`id`),
  CONSTRAINT `tb_http_testcase_deb_httpConfKey_b1249007_fk_tb_config` FOREIGN KEY (`httpConfKey`) REFERENCES `tb_config_http` (`httpConfKey`),
  CONSTRAINT `tb_http_testcase_debug_addBy_89908624_fk_tb_user_loginName` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`),
  CONSTRAINT `tb_http_testcase_debug_moduleId_16fffff0_fk_tb_modules_id` FOREIGN KEY (`moduleId`) REFERENCES `tb_modules` (`id`),
  CONSTRAINT `tb_http_testcase_debug_sourceId_a85a5796_fk_tb_source_id` FOREIGN KEY (`sourceId`) REFERENCES `tb_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_http_testcase_step
-- ----------------------------
DROP TABLE IF EXISTS `tb_http_testcase_step`;
CREATE TABLE `tb_http_testcase_step` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stepNum` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stepDesc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `caseType` int(11) NOT NULL,
  `fromInterfaceId` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isSync` int(11) NOT NULL,
  `varsPre` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `bodyType` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bodyContent` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `timeout` int(11) NOT NULL,
  `varsPost` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `performanceTime` double NOT NULL,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineId` int(11) NOT NULL,
  `caseId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `moduleId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `customUri` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stepSwitch` int(11) NOT NULL,
  `useCustomUri` int(11) NOT NULL,
  `urlRedirect` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_http_testcase_step_caseId_stepNum_d76c58a2_uniq` (`caseId`,`stepNum`),
  KEY `tb_http_testcase_step_addBy_3b69e768_fk_tb_user_loginName` (`addBy`),
  KEY `tb_http_testcase_ste_businessLineId_c8cc59ab_fk_tb_busine` (`businessLineId`),
  KEY `tb_http_testcase_step_moduleId_fe1bfcc8_fk_tb_modules_id` (`moduleId`),
  KEY `tb_http_testcase_step_sourceId_929006e9_fk_tb_source_id` (`sourceId`),
  CONSTRAINT `tb_http_testcase_ste_businessLineId_c8cc59ab_fk_tb_busine` FOREIGN KEY (`businessLineId`) REFERENCES `tb_business_line` (`id`),
  CONSTRAINT `tb_http_testcase_step_addBy_3b69e768_fk_tb_user_loginName` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`),
  CONSTRAINT `tb_http_testcase_step_caseId_f0cddcd9_fk_tb_http_testcase_caseId` FOREIGN KEY (`caseId`) REFERENCES `tb_http_testcase` (`caseId`),
  CONSTRAINT `tb_http_testcase_step_moduleId_fe1bfcc8_fk_tb_modules_id` FOREIGN KEY (`moduleId`) REFERENCES `tb_modules` (`id`),
  CONSTRAINT `tb_http_testcase_step_sourceId_929006e9_fk_tb_source_id` FOREIGN KEY (`sourceId`) REFERENCES `tb_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_http_testcase_step_debug
-- ----------------------------
DROP TABLE IF EXISTS `tb_http_testcase_step_debug`;
CREATE TABLE `tb_http_testcase_step_debug` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caseId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stepNum` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stepDesc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `caseType` int(11) NOT NULL,
  `fromInterfaceId` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isSync` int(11) NOT NULL,
  `varsPre` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `bodyType` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bodyContent` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `timeout` int(11) NOT NULL,
  `varsPost` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `performanceTime` double NOT NULL,
  `execStatus` int(11) NOT NULL,
  `actualResult` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `assertResult` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `testResult` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `beforeExecuteTakeTime` int(11) NOT NULL,
  `afterExecuteTakeTime` int(11) NOT NULL,
  `executeTakeTime` int(11) NOT NULL,
  `totalTakeTime` int(11) NOT NULL,
  `version` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineId` int(11) NOT NULL,
  `httpConfKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `moduleId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_http_testcase_step_debug_addBy_0ca9cb2c_fk_tb_user_loginName` (`addBy`),
  KEY `tb_http_testcase_ste_businessLineId_8dcda4c7_fk_tb_busine` (`businessLineId`),
  KEY `tb_http_testcase_ste_httpConfKey_31877246_fk_tb_config` (`httpConfKey`),
  KEY `tb_http_testcase_step_debug_moduleId_d24af98e_fk_tb_modules_id` (`moduleId`),
  KEY `tb_http_testcase_step_debug_sourceId_4f127ef5_fk_tb_source_id` (`sourceId`),
  CONSTRAINT `tb_http_testcase_ste_businessLineId_8dcda4c7_fk_tb_busine` FOREIGN KEY (`businessLineId`) REFERENCES `tb_business_line` (`id`),
  CONSTRAINT `tb_http_testcase_ste_httpConfKey_31877246_fk_tb_config` FOREIGN KEY (`httpConfKey`) REFERENCES `tb_config_http` (`httpConfKey`),
  CONSTRAINT `tb_http_testcase_step_debug_addBy_0ca9cb2c_fk_tb_user_loginName` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`),
  CONSTRAINT `tb_http_testcase_step_debug_moduleId_d24af98e_fk_tb_modules_id` FOREIGN KEY (`moduleId`) REFERENCES `tb_modules` (`id`),
  CONSTRAINT `tb_http_testcase_step_debug_sourceId_4f127ef5_fk_tb_source_id` FOREIGN KEY (`sourceId`) REFERENCES `tb_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_http_testcase_tag
-- ----------------------------
DROP TABLE IF EXISTS `tb_http_testcase_tag`;
CREATE TABLE `tb_http_testcase_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caseId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tagId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_http_testcase_tag_caseId_tagId_c3973803_uniq` (`caseId`,`tagId`),
  KEY `tb_http_testcase_tag_addBy_caa9ae79_fk_tb_user_loginName` (`addBy`),
  KEY `tb_http_testcase_tag_tagId_8c1f29d0_fk_tb_tag_id` (`tagId`),
  CONSTRAINT `tb_http_testcase_tag_addBy_caa9ae79_fk_tb_user_loginName` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`),
  CONSTRAINT `tb_http_testcase_tag_caseId_94115f06_fk_tb_http_testcase_caseId` FOREIGN KEY (`caseId`) REFERENCES `tb_http_testcase` (`caseId`),
  CONSTRAINT `tb_http_testcase_tag_tagId_8c1f29d0_fk_tb_tag_id` FOREIGN KEY (`tagId`) REFERENCES `tb_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_interface_execute_history
-- ----------------------------
DROP TABLE IF EXISTS `tb_interface_execute_history`;
CREATE TABLE `tb_interface_execute_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interfaceUrl` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requestHost` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalCount` int(11) NOT NULL,
  `passCount` int(11) NOT NULL,
  `failCount` int(11) NOT NULL,
  `errorCount` int(11) NOT NULL,
  `exceptionCount` int(11) NOT NULL,
  `taskId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskdesc` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `protocol` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testReportUrl` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `execBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `httpConfKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskExecuteId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_interface_execute_history_addBy_3f733841_fk_tb_user_loginName` (`addBy`),
  KEY `tb_interface_execute_execBy_fe430bc6_fk_tb_user_l` (`execBy`),
  KEY `tb_interface_execute_httpConfKey_1851a356_fk_tb_config` (`httpConfKey`),
  KEY `tb_interface_execute_taskExecuteId_abb6688c_fk_tb_task_e` (`taskExecuteId`),
  CONSTRAINT `tb_interface_execute_execBy_fe430bc6_fk_tb_user_l` FOREIGN KEY (`execBy`) REFERENCES `tb_user` (`loginName`),
  CONSTRAINT `tb_interface_execute_history_addBy_3f733841_fk_tb_user_loginName` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`),
  CONSTRAINT `tb_interface_execute_httpConfKey_1851a356_fk_tb_config` FOREIGN KEY (`httpConfKey`) REFERENCES `tb_config_http` (`httpConfKey`),
  CONSTRAINT `tb_interface_execute_taskExecuteId_abb6688c_fk_tb_task_e` FOREIGN KEY (`taskExecuteId`) REFERENCES `tb_task_execute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_modules
-- ----------------------------
DROP TABLE IF EXISTS `tb_modules`;
CREATE TABLE `tb_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moduleName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `moduleDesc` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `moduleName` (`moduleName`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_permissions
-- ----------------------------
DROP TABLE IF EXISTS `tb_permissions`;
CREATE TABLE `tb_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissionName` (`permissionName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_run_server_conf
-- ----------------------------
DROP TABLE IF EXISTS `tb_run_server_conf`;
CREATE TABLE `tb_run_server_conf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serviceName` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serviceIp` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `servicePort` int(11) NOT NULL,
  `maxTaskProgressNum` int(11) NOT NULL,
  `maxCaseProgressNum` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_source
-- ----------------------------
DROP TABLE IF EXISTS `tb_source`;
CREATE TABLE `tb_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sourceDesc` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sourceName` (`sourceName`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_standard_interface
-- ----------------------------
DROP TABLE IF EXISTS `tb_standard_interface`;
CREATE TABLE `tb_standard_interface` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(3000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interfaceUrl` varchar(9999) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interfaceCreateBy` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interfaceCreateTime` datetime(6) NOT NULL,
  `interfaceUpdateBy` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interfaceUpdateTime` datetime(6) NOT NULL,
  `authorEmail` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apiStatus` int(11) NOT NULL,
  `serviceName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineId` int(11) NOT NULL,
  `moduleId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_standard_interface_addBy_06752a07_fk_tb_user_loginName` (`addBy`),
  KEY `tb_standard_interfac_businessLineId_61866c4e_fk_tb_busine` (`businessLineId`),
  KEY `tb_standard_interface_moduleId_ee52f8b5_fk_tb_modules_id` (`moduleId`),
  CONSTRAINT `tb_standard_interfac_businessLineId_61866c4e_fk_tb_busine` FOREIGN KEY (`businessLineId`) REFERENCES `tb_business_line` (`id`),
  CONSTRAINT `tb_standard_interface_addBy_06752a07_fk_tb_user_loginName` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`),
  CONSTRAINT `tb_standard_interface_moduleId_ee52f8b5_fk_tb_modules_id` FOREIGN KEY (`moduleId`) REFERENCES `tb_modules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_tag
-- ----------------------------
DROP TABLE IF EXISTS `tb_tag`;
CREATE TABLE `tb_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usecount` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag` (`tag`),
  KEY `tb_tag_addBy_7289bef6_fk_tb_user_loginName` (`addBy`),
  CONSTRAINT `tb_tag_addBy_7289bef6_fk_tb_user_loginName` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_task
-- ----------------------------
DROP TABLE IF EXISTS `tb_task`;
CREATE TABLE `tb_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskdesc` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `protocol` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineGroup` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modulesGroup` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sourceGroup` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emailList` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskLevel` int(11) NOT NULL,
  `highPriorityVARS` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `interfaceCount` int(11) NOT NULL,
  `taskInterfaces` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `caseCount` int(11) NOT NULL,
  `taskTestcases` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `interfaceNum` int(11) NOT NULL,
  `isCI` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addByName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modByName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskId` (`taskId`),
  KEY `tb_task_addBy_55ca0c91_fk_tb_user_loginName` (`addBy`),
  CONSTRAINT `tb_task_addBy_55ca0c91_fk_tb_user_loginName` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_task_execute
-- ----------------------------
DROP TABLE IF EXISTS `tb_task_execute`;
CREATE TABLE `tb_task_execute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskId` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskdesc` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `protocol` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineGroup` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modulesGroup` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sourceGroup` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskLevel` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `highPriorityVARS` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `interfaceCount` int(11) NOT NULL,
  `taskInterfaces` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `caseCount` int(11) NOT NULL,
  `taskTestcases` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `interfaceNum` int(11) NOT NULL,
  `isCI` int(11) NOT NULL,
  `caseLevel` int(11) NOT NULL,
  `isSendEmail` int(11) NOT NULL,
  `emailList` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isCodeRate` int(11) NOT NULL,
  `isSaveHistory` int(11) NOT NULL,
  `execComments` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `retryCount` int(11) NOT NULL,
  `execType` int(11) NOT NULL,
  `execTime` datetime(6) NOT NULL,
  `execFinishTime` datetime(6) NOT NULL,
  `execTakeTime` int(11) NOT NULL,
  `execStatus` int(11) NOT NULL,
  `execProgressData` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `execPlatform` int(11) NOT NULL,
  `execLevel` int(11) NOT NULL,
  `testResult` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testResultMsg` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `testReportUrl` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `performanceResult` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskSuiteExecuteId` int(11) NOT NULL,
  `version` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addByName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modByName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `execByName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `httpConfKeyAlias` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `execBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `httpConfKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_task_execute_addBy_000105aa_fk_tb_user_loginName` (`addBy`),
  KEY `tb_task_execute_execBy_812117be_fk_tb_user_loginName` (`execBy`),
  KEY `tb_task_execute_httpConfKey_0af469a0_fk_tb_config` (`httpConfKey`),
  CONSTRAINT `tb_task_execute_addBy_000105aa_fk_tb_user_loginName` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`),
  CONSTRAINT `tb_task_execute_execBy_812117be_fk_tb_user_loginName` FOREIGN KEY (`execBy`) REFERENCES `tb_user` (`loginName`),
  CONSTRAINT `tb_task_execute_httpConfKey_0af469a0_fk_tb_config` FOREIGN KEY (`httpConfKey`) REFERENCES `tb_config_http` (`httpConfKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_task_suite
-- ----------------------------
DROP TABLE IF EXISTS `tb_task_suite`;
CREATE TABLE `tb_task_suite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskSuiteId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskSuiteDesc` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `protocol` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emailList` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `taskCount` int(11) NOT NULL,
  `taskList` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `isCI` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskSuiteId` (`taskSuiteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_task_suite_execute
-- ----------------------------
DROP TABLE IF EXISTS `tb_task_suite_execute`;
CREATE TABLE `tb_task_suite_execute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskSuiteId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskSuiteDesc` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `protocol` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `taskCount` int(11) NOT NULL,
  `taskList` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `isCI` int(11) NOT NULL,
  `httpConfKeyList` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `httpConfKeyAliasList` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caseLevel` int(11) NOT NULL,
  `isSendEmail` int(11) NOT NULL,
  `emailList` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isCodeRate` int(11) NOT NULL,
  `isSaveHistory` int(11) NOT NULL,
  `execComments` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `execType` int(11) NOT NULL,
  `execTime` datetime(6) NOT NULL,
  `execFinishTime` datetime(6) NOT NULL,
  `execTakeTime` int(11) NOT NULL,
  `execBy` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `execStatus` int(11) NOT NULL,
  `execProgressData` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `execPlatform` int(11) NOT NULL,
  `execLevel` int(11) NOT NULL,
  `testResult` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testResultMsg` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `testReportUrl` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskExecuteIdList` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `retryCount` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_team
-- ----------------------------
DROP TABLE IF EXISTS `tb_team`;
CREATE TABLE `tb_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teamName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teamDesc` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `teamName` (`teamName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_team_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `tb_team_permission_relation`;
CREATE TABLE `tb_team_permission_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teamName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissionName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_ui_auto_upload_package
-- ----------------------------
DROP TABLE IF EXISTS `tb_ui_auto_upload_package`;
CREATE TABLE `tb_ui_auto_upload_package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appType` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uploadResult` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_ui_functions
-- ----------------------------
DROP TABLE IF EXISTS `tb_ui_functions`;
CREATE TABLE `tb_ui_functions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commonFuncKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commonFuncTitle` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commonFuncDesc` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_ui_functions_commonFuncKey_d4dd1796_uniq` (`commonFuncKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_ui_functions_testcase
-- ----------------------------
DROP TABLE IF EXISTS `tb_ui_functions_testcase`;
CREATE TABLE `tb_ui_functions_testcase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commonFuncKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `functionName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `casedesc` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineId` int(11) NOT NULL,
  `moduleId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `caseLevel` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_ui_functions_testcase_commonFuncKey_functionNa_c64970ef_uniq` (`commonFuncKey`,`functionName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_ui_functions_testcase_step
-- ----------------------------
DROP TABLE IF EXISTS `tb_ui_functions_testcase_step`;
CREATE TABLE `tb_ui_functions_testcase_step` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commonFuncKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `functionName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stepNum` int(11) NOT NULL,
  `stepTitle` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stepDesc` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `specialTag` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operate` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_ui_global_text
-- ----------------------------
DROP TABLE IF EXISTS `tb_ui_global_text`;
CREATE TABLE `tb_ui_global_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `textDesc` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `textKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `textValue` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `textKey` (`textKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_ui_global_vars
-- ----------------------------
DROP TABLE IF EXISTS `tb_ui_global_vars`;
CREATE TABLE `tb_ui_global_vars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `varDesc` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `varKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `varValue` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `varKey` (`varKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_ui_mobile_server
-- ----------------------------
DROP TABLE IF EXISTS `tb_ui_mobile_server`;
CREATE TABLE `tb_ui_mobile_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serverName` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serverDesc` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serverType` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `executeTaskId` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serverIp` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serverPort` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `udid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deviceName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wdaLocalPort` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serverName` (`serverName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_ui_mobile_server_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_ui_mobile_server_log`;
CREATE TABLE `tb_ui_mobile_server_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serviceName` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executeTaskId` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executeBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `startTime` datetime(6) NOT NULL,
  `endTime` datetime(6) NOT NULL,
  `state` int(11) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_ui_package
-- ----------------------------
DROP TABLE IF EXISTS `tb_ui_package`;
CREATE TABLE `tb_ui_package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `packageId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `packageDesc` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `packageType` int(11) NOT NULL,
  `appFileName` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `appPackage` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `appActivity` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bundleId` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `packageId` (`packageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_ui_page_object
-- ----------------------------
DROP TABLE IF EXISTS `tb_ui_page_object`;
CREATE TABLE `tb_ui_page_object` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poTitle` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poDesc` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `poKey` (`poKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_ui_page_object_elements
-- ----------------------------
DROP TABLE IF EXISTS `tb_ui_page_object_elements`;
CREATE TABLE `tb_ui_page_object_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poTitle` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poDesc` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `elementKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `elementType` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `elementValue` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_ui_page_object_elements_poKey_elementKey_ca7f43fb_uniq` (`poKey`,`elementKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_ui_task
-- ----------------------------
DROP TABLE IF EXISTS `tb_ui_task`;
CREATE TABLE `tb_ui_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskdesc` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineGroup` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modulesGroup` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sourceGroup` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tasklevel` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `caseCount` int(11) NOT NULL,
  `taskTestcases` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskId` (`taskId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_ui_task_execute
-- ----------------------------
DROP TABLE IF EXISTS `tb_ui_task_execute`;
CREATE TABLE `tb_ui_task_execute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskdesc` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineGroup` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modulesGroup` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sourceGroup` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tasklevel` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `caseCount` int(11) NOT NULL,
  `taskTestcases` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskExcelFileName` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskExcelFileGenerateTime` datetime(6) NOT NULL,
  `httpConfKey` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reportDir` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `packageId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `execStatus` int(11) NOT NULL,
  `execCommand` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `execStartTime` datetime(6) NOT NULL,
  `execEndTime` datetime(6) NOT NULL,
  `execTakeTime` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `execProgressString` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `execComments` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isSendEmail` int(11) NOT NULL,
  `emailList` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testResult` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testResultMessage` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskId` (`taskId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_ui_task_simple
-- ----------------------------
DROP TABLE IF EXISTS `tb_ui_task_simple`;
CREATE TABLE `tb_ui_task_simple` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskdesc` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineId` int(11) NOT NULL,
  `moduleId` int(11) NOT NULL,
  `sourceGroup` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tasklevel` int(11) NOT NULL,
  `emailList` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `fileName` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sheetName` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fileAddBy` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskId` (`taskId`),
  KEY `tb_ui_task_simple_addBy_9bec6dba_fk_tb_user_loginName` (`addBy`),
  CONSTRAINT `tb_ui_task_simple_addBy_9bec6dba_fk_tb_user_loginName` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_ui_test_excel
-- ----------------------------
DROP TABLE IF EXISTS `tb_ui_test_excel`;
CREATE TABLE `tb_ui_test_excel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sheetNames` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_ui_test_excel_fileName_addBy_b260fd3b_uniq` (`fileName`,`addBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_ui_test_execute
-- ----------------------------
DROP TABLE IF EXISTS `tb_ui_test_execute`;
CREATE TABLE `tb_ui_test_execute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskdesc` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineId` int(11) NOT NULL,
  `moduleId` int(11) NOT NULL,
  `sourceGroup` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tasklevel` int(11) NOT NULL,
  `fileName` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sheetName` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fileAddBy` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `httpConfKey` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reportDir` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `packageId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serverId` int(11) NOT NULL,
  `execStatus` int(11) NOT NULL,
  `execCommand` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `execStartTime` datetime(6) NOT NULL,
  `execEndTime` datetime(6) NOT NULL,
  `execTakeTime` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `execProgressString` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `execComments` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isSendEmail` int(11) NOT NULL,
  `emailList` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testResult` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testResultMessage` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_ui_testcase
-- ----------------------------
DROP TABLE IF EXISTS `tb_ui_testcase`;
CREATE TABLE `tb_ui_testcase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caseId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `casedesc` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineId` int(11) NOT NULL,
  `moduleId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `caseLevel` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `caseId` (`caseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_ui_testcase_step
-- ----------------------------
DROP TABLE IF EXISTS `tb_ui_testcase_step`;
CREATE TABLE `tb_ui_testcase_step` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caseId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stepNum` int(11) NOT NULL,
  `stepTitle` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stepDesc` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `specialTag` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operate` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_ui_version_functions
-- ----------------------------
DROP TABLE IF EXISTS `tb_ui_version_functions`;
CREATE TABLE `tb_ui_version_functions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `versionName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commonFuncKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commonFuncTitle` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commonFuncDesc` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_ui_version_functions_versionName_commonFuncKey_99da78ab_uniq` (`versionName`,`commonFuncKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_ui_version_functions_testcase
-- ----------------------------
DROP TABLE IF EXISTS `tb_ui_version_functions_testcase`;
CREATE TABLE `tb_ui_version_functions_testcase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `versionName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commonFuncKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `functionName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `casedesc` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineId` int(11) NOT NULL,
  `moduleId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `caseLevel` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_ui_version_functions__versionName_commonFuncKe_562b1187_uniq` (`versionName`,`commonFuncKey`,`functionName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_ui_version_functions_testcase_step
-- ----------------------------
DROP TABLE IF EXISTS `tb_ui_version_functions_testcase_step`;
CREATE TABLE `tb_ui_version_functions_testcase_step` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `versionName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commonFuncKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `functionName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stepNum` int(11) NOT NULL,
  `stepTitle` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stepDesc` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `specialTag` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operate` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_ui_version_global_text
-- ----------------------------
DROP TABLE IF EXISTS `tb_ui_version_global_text`;
CREATE TABLE `tb_ui_version_global_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `versionName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `textDesc` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `textKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `textValue` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_ui_version_global_text_versionName_textKey_16ccf804_uniq` (`versionName`,`textKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_ui_version_global_vars
-- ----------------------------
DROP TABLE IF EXISTS `tb_ui_version_global_vars`;
CREATE TABLE `tb_ui_version_global_vars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `versionName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `varDesc` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `varKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `varValue` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_ui_version_global_vars_versionName_varKey_0fce428c_uniq` (`versionName`,`varKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_ui_version_page_object
-- ----------------------------
DROP TABLE IF EXISTS `tb_ui_version_page_object`;
CREATE TABLE `tb_ui_version_page_object` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `versionName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poTitle` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poDesc` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_ui_version_page_object_versionName_poKey_2fe40eeb_uniq` (`versionName`,`poKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_ui_version_page_object_elements
-- ----------------------------
DROP TABLE IF EXISTS `tb_ui_version_page_object_elements`;
CREATE TABLE `tb_ui_version_page_object_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `versionName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poTitle` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poDesc` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `elementKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `elementType` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `elementValue` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_ui_version_page_objec_versionName_poKey_elemen_2c105d78_uniq` (`versionName`,`poKey`,`elementKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_ui_version_task
-- ----------------------------
DROP TABLE IF EXISTS `tb_ui_version_task`;
CREATE TABLE `tb_ui_version_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `versionName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskdesc` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineGroup` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modulesGroup` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sourceGroup` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tasklevel` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `caseCount` int(11) NOT NULL,
  `taskTestcases` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_ui_version_task_versionName_taskId_1eec3bea_uniq` (`versionName`,`taskId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_ui_version_testcase
-- ----------------------------
DROP TABLE IF EXISTS `tb_ui_version_testcase`;
CREATE TABLE `tb_ui_version_testcase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `versionName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caseId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `casedesc` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineId` int(11) NOT NULL,
  `moduleId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `caseLevel` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_ui_version_testcase_step
-- ----------------------------
DROP TABLE IF EXISTS `tb_ui_version_testcase_step`;
CREATE TABLE `tb_ui_version_testcase_step` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `versionName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caseId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stepNum` int(11) NOT NULL,
  `stepTitle` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stepDesc` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `specialTag` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operate` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginName` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userName` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pwd` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) NOT NULL,
  `audit` int(11) NOT NULL,
  `defaultPermission` int(11) NOT NULL,
  `language` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `loginName` (`loginName`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_user_change_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_change_log`;
CREATE TABLE `tb_user_change_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginName` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otherLoginName` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `beforeChangeData` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `afterChangeData` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `dataId` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `changeDataId` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testStepId` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `version` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_user_deployment_tool
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_deployment_tool`;
CREATE TABLE `tb_user_deployment_tool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `redisKey` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opsList` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `strongCheckSuccessList` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weakCheckSuccessList` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `strongCheckFailedList` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weakCheckFailedList` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opsDeploySuccessList` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serviceDeployList` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serviceDeploySuccessList` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serviceDeployFailedList` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `report` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `autoFlag` int(11) NOT NULL,
  `execResult` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_user_httpconf
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_httpconf`;
CREATE TABLE `tb_user_httpconf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conflevel` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `httpConfKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loginName` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_user_httpconf_loginName_httpConfKey_7d700ea3_uniq` (`loginName`,`httpConfKey`),
  KEY `tb_user_httpconf_addBy_fe6f1843_fk_tb_user_loginName` (`addBy`),
  KEY `tb_user_httpconf_httpConfKey_4b48d315_fk_tb_config` (`httpConfKey`),
  CONSTRAINT `tb_user_httpconf_addBy_fe6f1843_fk_tb_user_loginName` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`),
  CONSTRAINT `tb_user_httpconf_httpConfKey_4b48d315_fk_tb_config` FOREIGN KEY (`httpConfKey`) REFERENCES `tb_config_http` (`httpConfKey`),
  CONSTRAINT `tb_user_httpconf_loginName_3e3a7d21_fk_tb_user_loginName` FOREIGN KEY (`loginName`) REFERENCES `tb_user` (`loginName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_user_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_log`;
CREATE TABLE `tb_user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginName` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userName` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operationUrl` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operationDesc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `operationResult` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fromHostIp` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_user_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_permission_relation`;
CREATE TABLE `tb_user_permission_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissionKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_user_team_relation
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_team_relation`;
CREATE TABLE `tb_user_team_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teamName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_user_uri
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_uri`;
CREATE TABLE `tb_user_uri` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conflevel` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `loginName` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uriKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_user_uri_loginName_uriKey_96a5c848_uniq` (`loginName`,`uriKey`),
  KEY `tb_user_uri_uriKey_0a8e5c3a_fk_tb_config_uri_uriKey` (`uriKey`),
  CONSTRAINT `tb_user_uri_loginName_e33b827e_fk_tb_user_loginName` FOREIGN KEY (`loginName`) REFERENCES `tb_user` (`loginName`),
  CONSTRAINT `tb_user_uri_uriKey_0a8e5c3a_fk_tb_config_uri_uriKey` FOREIGN KEY (`uriKey`) REFERENCES `tb_config_uri` (`uriKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_version
-- ----------------------------
DROP TABLE IF EXISTS `tb_version`;
CREATE TABLE `tb_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `versionName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `versionDesc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `closeTime` datetime(6) NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `versionName` (`versionName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_version_global_text
-- ----------------------------
DROP TABLE IF EXISTS `tb_version_global_text`;
CREATE TABLE `tb_version_global_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `textDesc` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `textKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `textValue` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `versionName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_version_global_text_versionName_textKey_b3e4012f_uniq` (`versionName`,`textKey`),
  KEY `tb_version_global_text_addBy_83941e83_fk_tb_user_loginName` (`addBy`),
  CONSTRAINT `tb_version_global_te_versionName_ac78fbc8_fk_tb_versio` FOREIGN KEY (`versionName`) REFERENCES `tb_version` (`versionName`),
  CONSTRAINT `tb_version_global_text_addBy_83941e83_fk_tb_user_loginName` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_version_global_vars
-- ----------------------------
DROP TABLE IF EXISTS `tb_version_global_vars`;
CREATE TABLE `tb_version_global_vars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `varDesc` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `varKey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `varValue` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `versionName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_version_global_vars_versionName_varKey_fde7b6d7_uniq` (`versionName`,`varKey`),
  KEY `tb_version_global_vars_addBy_d6dc22cb_fk_tb_user_loginName` (`addBy`),
  CONSTRAINT `tb_version_global_va_versionName_b03cb6fa_fk_tb_versio` FOREIGN KEY (`versionName`) REFERENCES `tb_version` (`versionName`),
  CONSTRAINT `tb_version_global_vars_addBy_d6dc22cb_fk_tb_user_loginName` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_version_http_interface
-- ----------------------------
DROP TABLE IF EXISTS `tb_version_http_interface`;
CREATE TABLE `tb_version_http_interface` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interfaceId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `casedesc` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caselevel` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `caseType` int(11) NOT NULL,
  `varsPre` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `bodyType` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bodyContent` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `timeout` int(11) NOT NULL,
  `varsPost` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `performanceTime` double NOT NULL,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineId` int(11) NOT NULL,
  `moduleId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `versionName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_version_http_interface_versionName_interfaceId_e1882e96_uniq` (`versionName`,`interfaceId`),
  KEY `tb_version_http_interface_addBy_688e188b_fk_tb_user_loginName` (`addBy`),
  KEY `tb_version_http_inte_businessLineId_c82f2147_fk_tb_busine` (`businessLineId`),
  KEY `tb_version_http_interface_moduleId_361a0118_fk_tb_modules_id` (`moduleId`),
  KEY `tb_version_http_interface_sourceId_3c6d8610_fk_tb_source_id` (`sourceId`),
  CONSTRAINT `tb_version_http_inte_businessLineId_c82f2147_fk_tb_busine` FOREIGN KEY (`businessLineId`) REFERENCES `tb_business_line` (`id`),
  CONSTRAINT `tb_version_http_inte_versionName_50b30c56_fk_tb_versio` FOREIGN KEY (`versionName`) REFERENCES `tb_version` (`versionName`),
  CONSTRAINT `tb_version_http_interface_addBy_688e188b_fk_tb_user_loginName` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`),
  CONSTRAINT `tb_version_http_interface_moduleId_361a0118_fk_tb_modules_id` FOREIGN KEY (`moduleId`) REFERENCES `tb_modules` (`id`),
  CONSTRAINT `tb_version_http_interface_sourceId_3c6d8610_fk_tb_source_id` FOREIGN KEY (`sourceId`) REFERENCES `tb_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_version_http_testcase
-- ----------------------------
DROP TABLE IF EXISTS `tb_version_http_testcase`;
CREATE TABLE `tb_version_http_testcase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caseId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `casedesc` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caselevel` int(11) NOT NULL,
  `stepCount` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `caseType` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineId` int(11) NOT NULL,
  `moduleId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `versionName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_version_http_testcase_versionName_caseId_e90d73bb_uniq` (`versionName`,`caseId`),
  KEY `tb_version_http_testcase_addBy_69933650_fk_tb_user_loginName` (`addBy`),
  KEY `tb_version_http_test_businessLineId_0dfb16e1_fk_tb_busine` (`businessLineId`),
  KEY `tb_version_http_testcase_moduleId_90e14153_fk_tb_modules_id` (`moduleId`),
  KEY `tb_version_http_testcase_sourceId_15f567fa_fk_tb_source_id` (`sourceId`),
  CONSTRAINT `tb_version_http_test_businessLineId_0dfb16e1_fk_tb_busine` FOREIGN KEY (`businessLineId`) REFERENCES `tb_business_line` (`id`),
  CONSTRAINT `tb_version_http_test_versionName_cc045625_fk_tb_versio` FOREIGN KEY (`versionName`) REFERENCES `tb_version` (`versionName`),
  CONSTRAINT `tb_version_http_testcase_addBy_69933650_fk_tb_user_loginName` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`),
  CONSTRAINT `tb_version_http_testcase_moduleId_90e14153_fk_tb_modules_id` FOREIGN KEY (`moduleId`) REFERENCES `tb_modules` (`id`),
  CONSTRAINT `tb_version_http_testcase_sourceId_15f567fa_fk_tb_source_id` FOREIGN KEY (`sourceId`) REFERENCES `tb_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_version_http_testcase_step
-- ----------------------------
DROP TABLE IF EXISTS `tb_version_http_testcase_step`;
CREATE TABLE `tb_version_http_testcase_step` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caseId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stepNum` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stepDesc` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caseType` int(11) NOT NULL,
  `fromInterfaceId` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isSync` int(11) NOT NULL,
  `varsPre` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `bodyType` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bodyContent` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `timeout` int(11) NOT NULL,
  `varsPost` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `performanceTime` double NOT NULL,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineId` int(11) NOT NULL,
  `moduleId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `versionName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_version_http_testcase_versionName_caseId_stepN_2be2c025_uniq` (`versionName`,`caseId`,`stepNum`),
  KEY `tb_version_http_test_addBy_4e4d0664_fk_tb_user_l` (`addBy`),
  KEY `tb_version_http_test_businessLineId_9b2a2064_fk_tb_busine` (`businessLineId`),
  KEY `tb_version_http_testcase_step_moduleId_dfa76ebc_fk_tb_modules_id` (`moduleId`),
  KEY `tb_version_http_testcase_step_sourceId_d95c9cd8_fk_tb_source_id` (`sourceId`),
  CONSTRAINT `tb_version_http_test_addBy_4e4d0664_fk_tb_user_l` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`),
  CONSTRAINT `tb_version_http_test_businessLineId_9b2a2064_fk_tb_busine` FOREIGN KEY (`businessLineId`) REFERENCES `tb_business_line` (`id`),
  CONSTRAINT `tb_version_http_test_versionName_c4304bfd_fk_tb_versio` FOREIGN KEY (`versionName`) REFERENCES `tb_version` (`versionName`),
  CONSTRAINT `tb_version_http_testcase_step_moduleId_dfa76ebc_fk_tb_modules_id` FOREIGN KEY (`moduleId`) REFERENCES `tb_modules` (`id`),
  CONSTRAINT `tb_version_http_testcase_step_sourceId_d95c9cd8_fk_tb_source_id` FOREIGN KEY (`sourceId`) REFERENCES `tb_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_version_standard_interface
-- ----------------------------
DROP TABLE IF EXISTS `tb_version_standard_interface`;
CREATE TABLE `tb_version_standard_interface` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(3000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interfaceUrl` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interfaceCreateBy` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interfaceCreateTime` datetime(6) NOT NULL,
  `interfaceUpdateBy` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interfaceUpdateTime` datetime(6) NOT NULL,
  `authorEmail` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apiStatus` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineId` int(11) NOT NULL,
  `moduleId` int(11) NOT NULL,
  `versionName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_version_standard__addBy_9e799cbe_fk_tb_user_l` (`addBy`),
  KEY `tb_version_standard__businessLineId_0d323ed4_fk_tb_busine` (`businessLineId`),
  KEY `tb_version_standard_interface_moduleId_fc241381_fk_tb_modules_id` (`moduleId`),
  KEY `tb_version_standard__versionName_8a9edfb8_fk_tb_versio` (`versionName`),
  CONSTRAINT `tb_version_standard__addBy_9e799cbe_fk_tb_user_l` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`),
  CONSTRAINT `tb_version_standard__businessLineId_0d323ed4_fk_tb_busine` FOREIGN KEY (`businessLineId`) REFERENCES `tb_business_line` (`id`),
  CONSTRAINT `tb_version_standard__versionName_8a9edfb8_fk_tb_versio` FOREIGN KEY (`versionName`) REFERENCES `tb_version` (`versionName`),
  CONSTRAINT `tb_version_standard_interface_moduleId_fc241381_fk_tb_modules_id` FOREIGN KEY (`moduleId`) REFERENCES `tb_modules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_version_task
-- ----------------------------
DROP TABLE IF EXISTS `tb_version_task`;
CREATE TABLE `tb_version_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskdesc` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `protocol` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineGroup` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modulesGroup` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sourceGroup` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emailList` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskLevel` int(11) NOT NULL,
  `highPriorityVARS` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `interfaceCount` int(11) NOT NULL,
  `taskInterfaces` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `caseCount` int(11) NOT NULL,
  `taskTestcases` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `interfaceNum` int(11) NOT NULL,
  `isCI` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `addBy` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `versionName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_version_task_versionName_taskId_294a9be4_uniq` (`versionName`,`taskId`),
  KEY `tb_version_task_addBy_5ea16ef3_fk_tb_user_loginName` (`addBy`),
  CONSTRAINT `tb_version_task_addBy_5ea16ef3_fk_tb_user_loginName` FOREIGN KEY (`addBy`) REFERENCES `tb_user` (`loginName`),
  CONSTRAINT `tb_version_task_versionName_01458246_fk_tb_version_versionName` FOREIGN KEY (`versionName`) REFERENCES `tb_version` (`versionName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_version_task_suite
-- ----------------------------
DROP TABLE IF EXISTS `tb_version_task_suite`;
CREATE TABLE `tb_version_task_suite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskSuiteId` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskSuiteDesc` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `protocol` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emailList` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `taskCount` int(11) NOT NULL,
  `taskList` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `isCI` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `versionName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskSuiteId` (`taskSuiteId`),
  KEY `tb_version_task_suit_versionName_3862b1de_fk_tb_versio` (`versionName`),
  CONSTRAINT `tb_version_task_suit_versionName_3862b1de_fk_tb_versio` FOREIGN KEY (`versionName`) REFERENCES `tb_version` (`versionName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_webPortal_RMI_general_situation
-- ----------------------------
DROP TABLE IF EXISTS `tb_webPortal_RMI_general_situation`;
CREATE TABLE `tb_webPortal_RMI_general_situation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coverage` int(11) NOT NULL,
  `methodTotal` int(11) NOT NULL,
  `totalTest` int(11) NOT NULL,
  `failedNum` int(11) NOT NULL,
  `passedNum` int(11) NOT NULL,
  `skippedNum` int(11) NOT NULL,
  `summaryAt` datetime(6) NOT NULL,
  `state` int(11) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_webPortal_RMI_interface_test
-- ----------------------------
DROP TABLE IF EXISTS `tb_webPortal_RMI_interface_test`;
CREATE TABLE `tb_webPortal_RMI_interface_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interfaceDetail` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `statisticalTime` datetime(6) NOT NULL,
  `state` int(11) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_webPortal_RMI_service_test
-- ----------------------------
DROP TABLE IF EXISTS `tb_webPortal_RMI_service_test`;
CREATE TABLE `tb_webPortal_RMI_service_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classNum` int(11) NOT NULL,
  `classCoverage` int(11) NOT NULL,
  `methodNum` int(11) NOT NULL,
  `methodCoverage` int(11) NOT NULL,
  `coveredRate` double NOT NULL,
  `testNum` int(11) NOT NULL,
  `service` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statisticalTime` datetime(6) NOT NULL,
  `state` int(11) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_webPortal_RMI_standard_service
-- ----------------------------
DROP TABLE IF EXISTS `tb_webPortal_RMI_standard_service`;
CREATE TABLE `tb_webPortal_RMI_standard_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serviceName` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_webPortal_action_interface_general_situation
-- ----------------------------
DROP TABLE IF EXISTS `tb_webPortal_action_interface_general_situation`;
CREATE TABLE `tb_webPortal_action_interface_general_situation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statisticalDetail` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `statisticalTime` datetime(6) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_webPortal_action_interface_test
-- ----------------------------
DROP TABLE IF EXISTS `tb_webPortal_action_interface_test`;
CREATE TABLE `tb_webPortal_action_interface_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `businessLine` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `envTestDetail` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `statisticalTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_webPortal_all_passRate
-- ----------------------------
DROP TABLE IF EXISTS `tb_webPortal_all_passRate`;
CREATE TABLE `tb_webPortal_all_passRate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testResultMsg` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `execTakeTime` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_webPortal_business_line
-- ----------------------------
DROP TABLE IF EXISTS `tb_webPortal_business_line`;
CREATE TABLE `tb_webPortal_business_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bussinessLine` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bussinessLineDesc` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isShow` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `addBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modBy` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bussinessLine` (`bussinessLine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_webPortal_business_line_action_passrate
-- ----------------------------
DROP TABLE IF EXISTS `tb_webPortal_business_line_action_passrate`;
CREATE TABLE `tb_webPortal_business_line_action_passrate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testResultMsg` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `execTakeTime` int(11) NOT NULL,
  `businessLine` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_webPortal_jira_business_line
-- ----------------------------
DROP TABLE IF EXISTS `tb_webPortal_jira_business_line`;
CREATE TABLE `tb_webPortal_jira_business_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `businessLineName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineDesc` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `businessLineName` (`businessLineName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_webPortal_jira_business_line_platform_relation
-- ----------------------------
DROP TABLE IF EXISTS `tb_webPortal_jira_business_line_platform_relation`;
CREATE TABLE `tb_webPortal_jira_business_line_platform_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `jiraBusinessLineId` int(11) NOT NULL,
  `platformBusinessLineId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_webPortal_jira_busine_jiraBusinessLineId_platf_c58fdcfc_uniq` (`jiraBusinessLineId`,`platformBusinessLineId`),
  KEY `tb_webPortal_jira_bu_platformBusinessLine_7f7b8738_fk_tb_busine` (`platformBusinessLineId`),
  CONSTRAINT `tb_webPortal_jira_bu_jiraBusinessLineId_25b3e3f7_fk_tb_webPor` FOREIGN KEY (`jiraBusinessLineId`) REFERENCES `tb_webPortal_jira_business_line` (`id`),
  CONSTRAINT `tb_webPortal_jira_bu_platformBusinessLine_7f7b8738_fk_tb_busine` FOREIGN KEY (`platformBusinessLineId`) REFERENCES `tb_business_line` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_webPortal_jira_module
-- ----------------------------
DROP TABLE IF EXISTS `tb_webPortal_jira_module`;
CREATE TABLE `tb_webPortal_jira_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moduleName` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `moduleDesc` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `moduleName` (`moduleName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_webPortal_jira_module_platform_relation
-- ----------------------------
DROP TABLE IF EXISTS `tb_webPortal_jira_module_platform_relation`;
CREATE TABLE `tb_webPortal_jira_module_platform_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `jiraModuleId` int(11) NOT NULL,
  `platformModuleId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_webPortal_jira_module_jiraModuleId_platformMod_7d104fd1_uniq` (`jiraModuleId`,`platformModuleId`),
  KEY `tb_webPortal_jira_mo_platformModuleId_f4f13e18_fk_tb_module` (`platformModuleId`),
  CONSTRAINT `tb_webPortal_jira_mo_jiraModuleId_14f91f7d_fk_tb_webPor` FOREIGN KEY (`jiraModuleId`) REFERENCES `tb_webPortal_jira_module` (`id`),
  CONSTRAINT `tb_webPortal_jira_mo_platformModuleId_f4f13e18_fk_tb_module` FOREIGN KEY (`platformModuleId`) REFERENCES `tb_modules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_webPortal_openApi_bl_test
-- ----------------------------
DROP TABLE IF EXISTS `tb_webPortal_openApi_bl_test`;
CREATE TABLE `tb_webPortal_openApi_bl_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interfaceSum` int(11) NOT NULL,
  `covered` int(11) NOT NULL,
  `coveredRate` double NOT NULL,
  `total` int(11) NOT NULL,
  `executedRate` int(11) NOT NULL,
  `profile` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLine` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testBeginTime` datetime(6) NOT NULL,
  `testEnfTime` datetime(6) NOT NULL,
  `statisticalTime` datetime(6) NOT NULL,
  `state` int(11) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_webPortal_openApi_businessLine
-- ----------------------------
DROP TABLE IF EXISTS `tb_webPortal_openApi_businessLine`;
CREATE TABLE `tb_webPortal_openApi_businessLine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `businessLineName` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLineDesc` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_webPortal_openApi_general_situation
-- ----------------------------
DROP TABLE IF EXISTS `tb_webPortal_openApi_general_situation`;
CREATE TABLE `tb_webPortal_openApi_general_situation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interfaceSum` int(11) NOT NULL,
  `covered` int(11) NOT NULL,
  `coveredRate` double NOT NULL,
  `total` int(11) NOT NULL,
  `executedRate` int(11) NOT NULL,
  `profile` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `averageInterfaceNum` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testBeginTime` datetime(6) NOT NULL,
  `testEnfTime` datetime(6) NOT NULL,
  `statisticalTime` datetime(6) NOT NULL,
  `state` int(11) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_webPortal_openApi_interface_test
-- ----------------------------
DROP TABLE IF EXISTS `tb_webPortal_openApi_interface_test`;
CREATE TABLE `tb_webPortal_openApi_interface_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `businessLine` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interfaceDetail` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `statisticalTime` datetime(6) NOT NULL,
  `state` int(11) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_webPortal_openApi_uri
-- ----------------------------
DROP TABLE IF EXISTS `tb_webPortal_openApi_uri`;
CREATE TABLE `tb_webPortal_openApi_uri` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `summaryUri` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summaryUrl` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interfaceTestUri` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interfaceTestUrl` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_webPortal_passingRate_Env
-- ----------------------------
DROP TABLE IF EXISTS `tb_webPortal_passingRate_Env`;
CREATE TABLE `tb_webPortal_passingRate_Env` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `httpConfKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `openApiKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rmiKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `statisticalTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `httpConfKey` (`httpConfKey`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_webPortal_platform_interface_covered
-- ----------------------------
DROP TABLE IF EXISTS `tb_webPortal_platform_interface_covered`;
CREATE TABLE `tb_webPortal_platform_interface_covered` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `businessLine` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `standardInterfaceNum` int(11) NOT NULL,
  `coveredInterfaceNum` int(11) NOT NULL,
  `coverage` double NOT NULL,
  `executeInterfaceNum` int(11) NOT NULL,
  `executeInterfaceCoverage` double NOT NULL,
  `interfaceNum` int(11) NOT NULL,
  `executeInterfaceSum` int(11) NOT NULL,
  `testCaseSum` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `statisticalTime` datetime(6) NOT NULL,
  `version` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_webPortal_service_interface_covered
-- ----------------------------
DROP TABLE IF EXISTS `tb_webPortal_service_interface_covered`;
CREATE TABLE `tb_webPortal_service_interface_covered` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serviceName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `standardInterfaceNum` int(11) NOT NULL,
  `coveredInterfaceNum` int(11) NOT NULL,
  `coverage` double NOT NULL,
  `serviceTestDetail` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `statisticalTime` datetime(6) NOT NULL,
  `state` int(11) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serviceName` (`serviceName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_webPortal_standard_Env
-- ----------------------------
DROP TABLE IF EXISTS `tb_webPortal_standard_Env`;
CREATE TABLE `tb_webPortal_standard_Env` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `httpConfKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `openApiKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rmiKey` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actionIsShow` int(11) NOT NULL,
  `rmiIsShow` int(11) NOT NULL,
  `openapiIsShow` int(11) NOT NULL,
  `uiIsShow` int(11) NOT NULL,
  `alias` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lineSort` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `httpConfKey` (`httpConfKey`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_webPortal_standard_task
-- ----------------------------
DROP TABLE IF EXISTS `tb_webPortal_standard_task`;
CREATE TABLE `tb_webPortal_standard_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessLine` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `head` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `task` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_webPortal_task
-- ----------------------------
DROP TABLE IF EXISTS `tb_webPortal_task`;
CREATE TABLE `tb_webPortal_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `businessLine` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `head` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `task` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_webPortal_ui_covered
-- ----------------------------
DROP TABLE IF EXISTS `tb_webPortal_ui_covered`;
CREATE TABLE `tb_webPortal_ui_covered` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coverDetail` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `statisticalTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_webPortal_ui_general_situation
-- ----------------------------
DROP TABLE IF EXISTS `tb_webPortal_ui_general_situation`;
CREATE TABLE `tb_webPortal_ui_general_situation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `generalSituationDetail` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `statisticalTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_webPortal_ui_test
-- ----------------------------
DROP TABLE IF EXISTS `tb_webPortal_ui_test`;
CREATE TABLE `tb_webPortal_ui_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testDetail` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  `statisticalTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_webPortal_ui_test_general_situation
-- ----------------------------
DROP TABLE IF EXISTS `tb_webPortal_ui_test_general_situation`;
CREATE TABLE `tb_webPortal_ui_test_general_situation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testCaseNum` int(11) NOT NULL,
  `autoTestCoveredNum` int(11) NOT NULL,
  `autoTestRate` double NOT NULL,
  `coveredDetail` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `statisticalTime` datetime(6) NOT NULL,
  `state` int(11) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_webPortal_unit_test_general_situation
-- ----------------------------
DROP TABLE IF EXISTS `tb_webPortal_unit_test_general_situation`;
CREATE TABLE `tb_webPortal_unit_test_general_situation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codeNum` int(11) NOT NULL,
  `coverage` int(11) NOT NULL,
  `coverageRate` double NOT NULL,
  `unitTestDetail` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `statisticalTime` datetime(6) NOT NULL,
  `state` int(11) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for tb_webPortal_unit_test_service
-- ----------------------------
DROP TABLE IF EXISTS `tb_webPortal_unit_test_service`;
CREATE TABLE `tb_webPortal_unit_test_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serviceName` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serviceDesc` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isShow` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `addTime` datetime(6) NOT NULL,
  `modTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;
