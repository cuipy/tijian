/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.21 : Database - wshbj
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_comment` */

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_detail` */

/*Table structure for table `act_hi_identitylink` */

DROP TABLE IF EXISTS `act_hi_identitylink`;

CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_identitylink` */

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_procinst` */

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_taskinst` */

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_varinst` */

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_group` */

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_info` */

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_membership` */

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_user` */

/*Table structure for table `act_procdef_info` */

DROP TABLE IF EXISTS `act_procdef_info`;

CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_procdef_info` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_identitylink` */

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_variable` */

/*Table structure for table `bj_examination_category` */

DROP TABLE IF EXISTS `bj_examination_category`;

CREATE TABLE `bj_examination_category` (
  `id` varchar(64) NOT NULL,
  `code` varchar(45) NOT NULL COMMENT '编号',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `reference_flag` char(1) NOT NULL DEFAULT '0' COMMENT '参考标识：0-否，1-是',
  `owner` varchar(64) DEFAULT NULL COMMENT '所属体检中心',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='检查类别';

/*Data for the table `bj_examination_category` */

insert  into `bj_examination_category`(`id`,`code`,`name`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`reference_flag`,`owner`) values ('04022523d45b4fc0b41a52209fa2d1d2','001','健康证','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-17 16:01:25','dbd1c02859f8434aad548bbd09cd74b5','2018-03-17 16:01:25','','0','f2d694c5e8544169a129a5354c8d4a7a'),('3b10263991fb411da75cdd1d49a3eaa5','003','健康证','1','dbd1c02859f8434aad548bbd09cd74b5','2018-03-10 20:46:15','dbd1c02859f8434aad548bbd09cd74b5','2018-03-10 20:46:38','','0','f2d694c5e8544169a129a5354c8d4a7a'),('408f8563e4a642a89b55f233a65a27d7','EC20180005','普通健康证','0','1','2018-04-16 11:06:28','1','2018-04-16 11:06:28','','0','22cdf43b3cf64706923b2bdc7bdd32ba'),('53c68dc2d6a742fba86bd2ab8842da9b','1001-JCLB2018002','饲养证','0','1','2018-04-23 00:49:05','1','2018-04-23 00:49:05','','0','f2d694c5e8544169a129a5354c8d4a7a'),('621e0a0035bc4850b6a6babf768802fe','001','健康证','1','dbd1c02859f8434aad548bbd09cd74b5','2018-03-10 20:43:42','dbd1c02859f8434aad548bbd09cd74b5','2018-03-10 20:43:42','','0','f2d694c5e8544169a129a5354c8d4a7a'),('7563bac861d54299884f12437ff456cf','344','344','1','dbd1c02859f8434aad548bbd09cd74b5','2018-03-10 14:02:52','dbd1c02859f8434aad548bbd09cd74b5','2018-03-10 14:03:12','33344','0','f2d694c5e8544169a129a5354c8d4a7a'),('7b9ee47219e3414e8f8568dd718f0927','001','医疗证','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-15 11:55:01','1','2018-04-23 00:42:39','','0','f2d694c5e8544169a129a5354c8d4a7a'),('9be445e91645416488228a4e28f9bc04','2','2','1','dbd1c02859f8434aad548bbd09cd74b5','2018-03-10 13:56:33','dbd1c02859f8434aad548bbd09cd74b5','2018-03-10 13:56:33','22','0','f2d694c5e8544169a129a5354c8d4a7a'),('b2609b1bc8be4edda437d70d7c5fd475','001','健康证','0','92e9531b7c5d4fa2b13997b98d601000','2018-03-07 17:33:13','92e9531b7c5d4fa2b13997b98d601000','2018-03-07 17:33:13','','1',NULL),('c49ca445948741b4a367659b79cc218d','1','健康证检查','1','dbd1c02859f8434aad548bbd09cd74b5','2018-03-10 13:38:24','dbd1c02859f8434aad548bbd09cd74b5','2018-03-10 13:38:24','1233','0','f2d694c5e8544169a129a5354c8d4a7a'),('cb88c21043c54f6b8ed522a4be836709','001','健康证','1','dbd1c02859f8434aad548bbd09cd74b5','2018-03-10 20:43:31','dbd1c02859f8434aad548bbd09cd74b5','2018-03-10 20:43:31','','0','f2d694c5e8544169a129a5354c8d4a7a');

/*Table structure for table `bj_examination_dept` */

DROP TABLE IF EXISTS `bj_examination_dept`;

CREATE TABLE `bj_examination_dept` (
  `id` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `reference_flag` char(1) NOT NULL DEFAULT '0' COMMENT '参考标识：0-否，1-是',
  `owner` varchar(64) DEFAULT NULL COMMENT '所属体检中心',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='检查部门';

/*Data for the table `bj_examination_dept` */

insert  into `bj_examination_dept`(`id`,`name`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`reference_flag`,`owner`) values ('1312dd4d7b4b4713a694e43dfa615073','眼科','0','92e9531b7c5d4fa2b13997b98d601000','2018-03-11 16:12:14','92e9531b7c5d4fa2b13997b98d601000','2018-03-11 16:12:27','yanke','1',NULL),('3c80c31993bb40a697eb0d625f1af319','内科','0','92e9531b7c5d4fa2b13997b98d601000','2018-03-11 16:12:46','92e9531b7c5d4fa2b13997b98d601000','2018-03-11 16:12:46','neike','1',NULL),('4d20d8a6c8364976a2c751f9ff40e819','内科','0','1','2018-04-16 11:03:34','1','2018-04-16 11:03:34','','0','22cdf43b3cf64706923b2bdc7bdd32ba'),('5f5b12990a64439f8b4581a057ba5f85','眼科','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-11 16:32:35','dbd1c02859f8434aad548bbd09cd74b5','2018-03-11 16:32:35','yanke','0','f2d694c5e8544169a129a5354c8d4a7a'),('73fceece37114701a3bb1715a75f4bf1','内科','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-11 16:32:35','dbd1c02859f8434aad548bbd09cd74b5','2018-03-11 16:32:35','neike','0','f2d694c5e8544169a129a5354c8d4a7a'),('88ba6755ac1a470ba5e15e59c330480c','眼科','0','1','2018-04-16 11:03:29','1','2018-04-16 11:03:29','','0','22cdf43b3cf64706923b2bdc7bdd32ba'),('b2634f264e7145cda725913180a754a2','前台','0','1','2018-04-16 11:03:23','1','2018-04-16 11:03:23','','0','22cdf43b3cf64706923b2bdc7bdd32ba');

/*Table structure for table `bj_examination_form` */

DROP TABLE IF EXISTS `bj_examination_form`;

CREATE TABLE `bj_examination_form` (
  `id` varchar(64) NOT NULL,
  `code` varchar(45) NOT NULL COMMENT '编号',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `reference_flag` char(1) DEFAULT '0' COMMENT '参考标识：0-否，1-是',
  `owner` varchar(64) DEFAULT NULL COMMENT '所属体检中心',
  `template_path` varchar(64) DEFAULT NULL COMMENT '模板路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='体检流程表模板';

/*Data for the table `bj_examination_form` */

/*Table structure for table `bj_examination_item` */

DROP TABLE IF EXISTS `bj_examination_item`;

CREATE TABLE `bj_examination_item` (
  `id` varchar(64) NOT NULL,
  `code` varchar(45) NOT NULL COMMENT '编号',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `reference_flag` char(1) NOT NULL DEFAULT '0' COMMENT '参考标识：0-否，1-是',
  `owner` varchar(64) DEFAULT NULL COMMENT '所属体检中心',
  `type_id` varchar(64) DEFAULT NULL COMMENT '检查项目类型',
  `unit` varchar(64) DEFAULT NULL COMMENT '单位',
  `price` varchar(45) DEFAULT NULL COMMENT '价格',
  `range_max` varchar(45) DEFAULT NULL COMMENT '参考范围最大值',
  `range_min` varchar(45) DEFAULT NULL COMMENT '参考范围最小值',
  `specimen_id` varchar(64) DEFAULT NULL COMMENT '所需标本',
  `permission` varchar(100) DEFAULT NULL,
  `need_samples` char(1) DEFAULT '0' COMMENT '是否需要样本：0-否，1-是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='检查项目';

/*Data for the table `bj_examination_item` */

insert  into `bj_examination_item`(`id`,`code`,`name`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`reference_flag`,`owner`,`type_id`,`unit`,`price`,`range_max`,`range_min`,`specimen_id`,`permission`,`need_samples`) values ('08546954a8b34cbf9ad4e40662717505','2','验尿','0','92e9531b7c5d4fa2b13997b98d601000','2018-03-12 11:06:57','92e9531b7c5d4fa2b13997b98d601000','2018-03-12 11:06:57','验尿验尿验尿验尿','1',NULL,NULL,'dw','12','2','1',NULL,NULL,'0'),('0b5daa300eb94075854248d162a4d03e','2','验尿','1','dbd1c02859f8434aad548bbd09cd74b5','2018-03-19 23:25:24','dbd1c02859f8434aad548bbd09cd74b5','2018-03-19 23:25:24','验尿验尿验尿验尿','0','f2d694c5e8544169a129a5354c8d4a7a',NULL,'dw','12','2','1',NULL,NULL,'0'),('1f8d8b21a4d844b986c969a935325d4f','1','验血','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-22 09:16:41','dbd1c02859f8434aad548bbd09cd74b5','2018-03-22 18:23:56','ddd','0','f2d694c5e8544169a129a5354c8d4a7a','','dw','100','2','1','','002001ITEM_12','1'),('2b1cfdc1c64943c4b930c2d2ddc05379','1001-JCXM20180002','手指甲检查','0','1','2018-04-23 01:00:36','1','2018-04-23 01:00:48','','0','f2d694c5e8544169a129a5354c8d4a7a','6599c832a9f74fb78cbe15c8f7c65172','个','21','100','0','','14','0'),('2b4ee8c8b27d4c12b470c71bb2837335','1002','查身高','0','1','2018-04-16 11:08:17','1','2018-04-16 11:08:17','','0','22cdf43b3cf64706923b2bdc7bdd32ba','8d64431dc112421087cb26639898501c','cm','12','250','50','','1','0'),('67dca0fe012a4585ad6a1a8ab09cd4d8','2','验尿','1','dbd1c02859f8434aad548bbd09cd74b5','2018-03-20 15:26:37','dbd1c02859f8434aad548bbd09cd74b5','2018-03-20 15:26:37','验尿验尿验尿验尿','0','f2d694c5e8544169a129a5354c8d4a7a',NULL,'dw','12','2','1',NULL,'002001ITEM_10','0'),('78ef90f806704fb09f520e7334da16fe','1','验血','0','92e9531b7c5d4fa2b13997b98d601000','2018-03-12 11:05:43','92e9531b7c5d4fa2b13997b98d601000','2018-03-12 11:05:43','ddd','1',NULL,NULL,'dw','100','2','1',NULL,NULL,'0'),('7b1888a504e5443ca63d0fe241bd7d5b','2','验尿','1','dbd1c02859f8434aad548bbd09cd74b5','2018-03-19 23:36:13','dbd1c02859f8434aad548bbd09cd74b5','2018-03-19 23:36:13','验尿验尿验尿验尿','0','f2d694c5e8544169a129a5354c8d4a7a',NULL,'dw','12','2','1',NULL,NULL,'0'),('a9d1bf7589f8478b86d87ec819378bb8','2','验尿','1','dbd1c02859f8434aad548bbd09cd74b5','2018-03-19 23:37:36','dbd1c02859f8434aad548bbd09cd74b5','2018-03-19 23:37:36','验尿验尿验尿验尿','0','f2d694c5e8544169a129a5354c8d4a7a',NULL,'dw','12','2','1',NULL,NULL,'0'),('aed3ac61c6fd494496cd338bc8fc1615','1003','肺活量','0','1','2018-04-16 11:10:52','1','2018-04-16 11:10:52','','0','22cdf43b3cf64706923b2bdc7bdd32ba','e3367d0e2cd44f328597871bf2db25e7','C','24','5000','1000','','2','0'),('b208c9940562423381e7d1cebdd84918','2','验尿','1','dbd1c02859f8434aad548bbd09cd74b5','2018-03-19 23:44:39','dbd1c02859f8434aad548bbd09cd74b5','2018-03-19 23:44:39','验尿验尿验尿验尿','0','f2d694c5e8544169a129a5354c8d4a7a',NULL,'dw','12','2','1',NULL,'9','0'),('bbae2685f42f46668b3bf44df07fb12f','2','验尿','1','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 11:16:15','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 11:27:07','验尿验尿验尿验尿','0','f2d694c5e8544169a129a5354c8d4a7a','d25fe3e680514624b82ab5b6daf69965','dw','12','2','1','442e8fa28245437b9fab38bccb7c6a32',NULL,'0'),('c5dd70a837be419498b8f1f59ea284d1','2','验尿','1','dbd1c02859f8434aad548bbd09cd74b5','2018-03-19 23:42:22','dbd1c02859f8434aad548bbd09cd74b5','2018-03-19 23:42:22','验尿验尿验尿验尿','0','f2d694c5e8544169a129a5354c8d4a7a',NULL,'dw','12','2','1',NULL,NULL,'0'),('e0835a627f7c4880ac02fbf6c982f8bd','12345','血压','0','dbd1c02859f8434aad548bbd09cd74b5','2018-04-01 18:37:18','dbd1c02859f8434aad548bbd09cd74b5','2018-04-01 18:37:18','wewe','0','f2d694c5e8544169a129a5354c8d4a7a','d3b4d6e92c414f6e9ef315a2b9c5172f','23232','34','qw','we','','13','0'),('e7fe5024cf7d48a9bfff89e0c053bd9e','1','验血','1','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 11:16:15','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 11:32:05','ddd','0','f2d694c5e8544169a129a5354c8d4a7a','','dw','100','2','1','',NULL,'0'),('ef0d0138fce440a8950a28744f5f7dc3','2','验尿','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-22 09:16:41','dbd1c02859f8434aad548bbd09cd74b5','2018-03-22 18:24:03','验尿验尿验尿验尿','0','f2d694c5e8544169a129a5354c8d4a7a','','dw','12','2','1','','002001ITEM_11','1'),('ffd448e722fd4d65a674fd390ec76003','2','验尿','1','dbd1c02859f8434aad548bbd09cd74b5','2018-03-19 23:35:11','dbd1c02859f8434aad548bbd09cd74b5','2018-03-19 23:35:11','验尿验尿验尿验尿','0','f2d694c5e8544169a129a5354c8d4a7a',NULL,'dw','12','2','1',NULL,NULL,'0');

/*Table structure for table `bj_examination_item_category` */

DROP TABLE IF EXISTS `bj_examination_item_category`;

CREATE TABLE `bj_examination_item_category` (
  `id` varchar(64) NOT NULL,
  `code` varchar(45) NOT NULL COMMENT '编号',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `reference_flag` char(1) NOT NULL DEFAULT '0' COMMENT '参考标识：0-否，1-是',
  `owner` varchar(64) DEFAULT NULL COMMENT '所属体检中心',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='检查项目分类';

/*Data for the table `bj_examination_item_category` */

insert  into `bj_examination_item_category`(`id`,`code`,`name`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`reference_flag`,`owner`) values ('071ca7e1ad3541ab928b111010005cda','1','抽血及其他检验项目','0','92e9531b7c5d4fa2b13997b98d601000','2018-03-15 12:26:28','92e9531b7c5d4fa2b13997b98d601000','2018-03-15 12:26:28','','1',NULL),('22281c7bed4640be9a638195d0277590','123','112','1','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 09:37:19','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 09:37:19','1112','0','f2d694c5e8544169a129a5354c8d4a7a'),('269f2c9365094aa18baf8dbcd893b9ca','1001-XMFL002','腿脚检查','0','1','2018-04-23 00:49:18','1','2018-04-23 00:49:18','','0','f2d694c5e8544169a129a5354c8d4a7a'),('64f63dcc59454b84a4da7db3aaa29714','123','112','1','92e9531b7c5d4fa2b13997b98d601000','2018-03-11 00:54:11','92e9531b7c5d4fa2b13997b98d601000','2018-03-11 14:12:03','1112','1',NULL),('7f16f7d356f544efa2d62ea9e39ffaf0','1001-null','常规检查','1','1','2018-04-23 00:44:17','1','2018-04-23 00:44:17','','0','f2d694c5e8544169a129a5354c8d4a7a'),('a378d0c832474bcba967471e28925dc2','1','抽血及其他检验项目','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-15 12:33:38','dbd1c02859f8434aad548bbd09cd74b5','2018-03-15 12:33:38','','0','f2d694c5e8544169a129a5354c8d4a7a'),('b3534866bbab4863b95761c3f5a94df6','12','112','1','dbd1c02859f8434aad548bbd09cd74b5','2018-03-11 13:16:39','dbd1c02859f8434aad548bbd09cd74b5','2018-03-11 13:16:39','1112','0','f2d694c5e8544169a129a5354c8d4a7a'),('cbb626195c7649c78ccd8ea9968c3ce4','123','112','1','dbd1c02859f8434aad548bbd09cd74b5','2018-03-15 12:23:12','dbd1c02859f8434aad548bbd09cd74b5','2018-03-15 12:23:12','1112','0','f2d694c5e8544169a129a5354c8d4a7a'),('e6f717638b044e59b9d322850c9e0b77','1','抽血及其他检验项目','1','dbd1c02859f8434aad548bbd09cd74b5','2018-03-15 12:33:20','dbd1c02859f8434aad548bbd09cd74b5','2018-03-15 12:33:20','','0','f2d694c5e8544169a129a5354c8d4a7a');

/*Table structure for table `bj_examination_item_type` */

DROP TABLE IF EXISTS `bj_examination_item_type`;

CREATE TABLE `bj_examination_item_type` (
  `id` varchar(64) NOT NULL,
  `code` varchar(45) NOT NULL COMMENT '编号',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `reference_flag` char(1) NOT NULL DEFAULT '0' COMMENT '参考标识：0-否，1-是',
  `owner` varchar(64) DEFAULT NULL COMMENT '所属体检中心',
  `item_category_id` varchar(64) DEFAULT NULL COMMENT '检查项目分类',
  `examination_dept_id` varchar(64) DEFAULT NULL COMMENT '检查部门',
  `tips` varchar(100) DEFAULT NULL COMMENT '提示信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='检查项目类型';

/*Data for the table `bj_examination_item_type` */

insert  into `bj_examination_item_type`(`id`,`code`,`name`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`reference_flag`,`owner`,`item_category_id`,`examination_dept_id`,`tips`) values ('16242556fd2b4ff1aa10ec6cd4af0f2b','11','验血1','0','92e9531b7c5d4fa2b13997b98d601000','2018-03-11 16:22:30','92e9531b7c5d4fa2b13997b98d601000','2018-03-11 16:24:32','wss1','1',NULL,NULL,NULL,'空腹1'),('205de5a603de4f3a8f78a16067e92386','3','333','1','dbd1c02859f8434aad548bbd09cd74b5','2018-03-11 17:03:49','dbd1c02859f8434aad548bbd09cd74b5','2018-03-11 17:03:49','333','0','f2d694c5e8544169a129a5354c8d4a7a','b3534866bbab4863b95761c3f5a94df6','5f5b12990a64439f8b4581a057ba5f85','aaa'),('57ca98796201450aab60da92f63a25ef','2','验尿','1','dbd1c02859f8434aad548bbd09cd74b5','2018-03-11 16:47:07','dbd1c02859f8434aad548bbd09cd74b5','2018-03-11 16:51:42','yn','0','f2d694c5e8544169a129a5354c8d4a7a','b3534866bbab4863b95761c3f5a94df6','73fceece37114701a3bb1715a75f4bf1',''),('6599c832a9f74fb78cbe15c8f7c65172','1001-XMLX2018002','腿脚检查','0','1','2018-04-23 00:47:47','1','2018-04-23 00:47:47','','0','f2d694c5e8544169a129a5354c8d4a7a','a378d0c832474bcba967471e28925dc2','5f5b12990a64439f8b4581a057ba5f85',''),('8d64431dc112421087cb26639898501c','1001','外科','0','1','2018-04-16 11:07:11','1','2018-04-16 11:07:11','','0','22cdf43b3cf64706923b2bdc7bdd32ba','','b2634f264e7145cda725913180a754a2',''),('b840dd0f0387463abdc0be0a7868139e','2','验尿','0','92e9531b7c5d4fa2b13997b98d601000','2018-03-11 16:38:32','92e9531b7c5d4fa2b13997b98d601000','2018-03-11 16:38:32','yn','1',NULL,NULL,NULL,'空腹哦'),('d25fe3e680514624b82ab5b6daf69965','11','脾肺脏','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-11 16:47:07','1','2018-04-23 00:47:23','wss1','0','f2d694c5e8544169a129a5354c8d4a7a','a378d0c832474bcba967471e28925dc2','73fceece37114701a3bb1715a75f4bf1',''),('d3b4d6e92c414f6e9ef315a2b9c5172f','11','五官检查','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-17 13:11:38','1','2018-04-23 00:46:44','阿斯蒂芬','0','f2d694c5e8544169a129a5354c8d4a7a','a378d0c832474bcba967471e28925dc2','5f5b12990a64439f8b4581a057ba5f85',''),('d7138446a1e444db94dc601041c3c7ba','2','验尿','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 09:35:34','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 09:35:34','yn','0','f2d694c5e8544169a129a5354c8d4a7a',NULL,NULL,NULL),('e3367d0e2cd44f328597871bf2db25e7','1002','心肺功能','0','1','2018-04-16 11:09:46','1','2018-04-16 11:09:46','','0','22cdf43b3cf64706923b2bdc7bdd32ba','','4d20d8a6c8364976a2c751f9ff40e819','');

/*Table structure for table `bj_examination_package` */

DROP TABLE IF EXISTS `bj_examination_package`;

CREATE TABLE `bj_examination_package` (
  `id` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `price` varchar(100) DEFAULT NULL COMMENT '价格',
  `category_id` varchar(64) NOT NULL COMMENT '检查类别',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `reference_flag` char(1) DEFAULT '0' COMMENT '参考标识：0-否，1-是',
  `owner` varchar(64) DEFAULT NULL COMMENT '所属体检中心',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='体检套餐';

/*Data for the table `bj_examination_package` */

insert  into `bj_examination_package`(`id`,`name`,`price`,`category_id`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`reference_flag`,`owner`) values ('43f2d25809e64265ab4f6f079e713adc','111','2','c49ca445948741b4a367659b79cc218d','1','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 16:32:39','dbd1c02859f8434aad548bbd09cd74b5','2018-03-13 10:53:26','344','',''),('a33e22f7d5a74b488852ae379ca2ea12','医生健康证','30','53c68dc2d6a742fba86bd2ab8842da9b','0','1','2018-04-18 17:03:07','1','2018-04-23 02:37:48','',NULL,NULL),('c0f1d0e745a84c7c872b261eff1d6593','企业健康证体检','100','04022523d45b4fc0b41a52209fa2d1d2','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-15 16:19:44','1','2018-04-23 02:37:33','',NULL,NULL);

/*Table structure for table `bj_examination_record` */

DROP TABLE IF EXISTS `bj_examination_record`;

CREATE TABLE `bj_examination_record` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL COMMENT '体检用户',
  `code` varchar(50) DEFAULT NULL COMMENT '编号',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `phone_number` varchar(45) NOT NULL COMMENT '联系电话',
  `sex` varchar(64) NOT NULL COMMENT '性别',
  `industry_id` varchar(64) DEFAULT NULL COMMENT '行业',
  `post_id` varchar(64) DEFAULT NULL COMMENT '岗位',
  `birthday` varchar(10) NOT NULL COMMENT '出生日期',
  `organ_id` varchar(64) DEFAULT NULL COMMENT '单位',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `owner` varchar(64) DEFAULT NULL COMMENT '所属体检中心',
  `package_id` varchar(64) DEFAULT NULL COMMENT '体检套餐',
  `package_price` varchar(64) DEFAULT NULL COMMENT '套餐价格',
  `id_number` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `status` varchar(64) DEFAULT NULL COMMENT '体检状态，对应examination_record_status字典',
  `item_type` char(1) DEFAULT '1' COMMENT '体检项目方式:1-体检套餐，2-自由选择',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='体检记录';

/*Data for the table `bj_examination_record` */

insert  into `bj_examination_record`(`id`,`user_id`,`code`,`name`,`phone_number`,`sex`,`industry_id`,`post_id`,`birthday`,`organ_id`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`owner`,`package_id`,`package_price`,`id_number`,`status`,`item_type`) values ('053aba3d5ff745ac807e9b0a45cb4af2','47dedc506cca4e138eb6f12cfedbbc00','1001-10201804220008','李小璐','458455','2','c8b6f329cc024c48abc3548a9bb741de','a77e3b4e4c5d44cca1e317f24c5785e7','1988-05-06','f647e35a8ea440e7813372ae4e932a77','0','1','2018-04-22 17:41:01','1','2018-04-22 23:07:36','阿斯蒂芬','f2d694c5e8544169a129a5354c8d4a7a','c0f1d0e745a84c7c872b261eff1d6593','132','138215198805061584','0','2'),('0c266f42e1fc4b0caf65e4466e91a0f3','dda5c4367edd404c86ba858b7577f35d','1001-10201804210003','张强','23841458','1','c8b6f329cc024c48abc3548a9bb741de','a77e3b4e4c5d44cca1e317f24c5785e7','1968-11-02','bdb1267f643b48848c801efb35520f9e','0','1','2018-04-21 21:05:07','1','2018-04-22 23:10:30','sdaf阿斯蒂芬','f2d694c5e8544169a129a5354c8d4a7a','c0f1d0e745a84c7c872b261eff1d6593','100','158458196811023541','0','1'),('121292ab28b94a7c80d6480b5fbb252d','7b83d5d0d78241aa9519909d957e2af6','1001-null','张武强','1382873828','1','5e24382898c340cfa16417ea5eb3298d','d3fe276675cf4f50a295acf87ea72e63','2018-04-16','f647e35a8ea440e7813372ae4e932a77','1','1','2018-04-19 17:18:49','1','2018-04-19 17:18:49','撒旦净空法师\r\n卡上的肌肤是登记','f2d694c5e8544169a129a5354c8d4a7a','a33e22f7d5a74b488852ae379ca2ea12','46','13982873828','0','2'),('198ab83718cf4dd893c1f96608951a48','12850e0792ed4f34801588d1483b20ce','1001101804180003','张2','111','1','8c5f1d7ee3c040b3b4743e5e45324612','a77e3b4e4c5d44cca1e317f24c5785e7','1976-03-13','508b1b81505b46e1be929413242cf016','0','1','2018-04-18 16:43:48','1','2018-04-18 18:26:30','','f2d694c5e8544169a129a5354c8d4a7a','c0f1d0e745a84c7c872b261eff1d6593','46','123456','0','2'),('255c8972fae64d60a07954811eee93b3','7b83d5d0d78241aa9519909d957e2af6','1001-10201804190002','张武强','1382873828','1','5e24382898c340cfa16417ea5eb3298d','d3fe276675cf4f50a295acf87ea72e63','2018-04-16','f647e35a8ea440e7813372ae4e932a77','0','1','2018-04-19 18:18:49','1','2018-04-22 19:31:00','撒旦发生的','f2d694c5e8544169a129a5354c8d4a7a','a33e22f7d5a74b488852ae379ca2ea12','120','13982873828','10','1'),('2a4e4779542049ba91b54f699f9c0667','7b83d5d0d78241aa9519909d957e2af6','1001-null','张武强','1382873828','1','5e24382898c340cfa16417ea5eb3298d','d3fe276675cf4f50a295acf87ea72e63','2018-04-16','f647e35a8ea440e7813372ae4e932a77','1','1','2018-04-19 17:47:27','1','2018-04-19 17:47:27','','f2d694c5e8544169a129a5354c8d4a7a','a33e22f7d5a74b488852ae379ca2ea12','120','13982873828','0','1'),('2c1e48f8b4414503a72de328f0317093','12850e0792ed4f34801588d1483b20ce','1001-10201804210002','张2','111','1','8c5f1d7ee3c040b3b4743e5e45324612','a77e3b4e4c5d44cca1e317f24c5785e7','1976-03-13','508b1b81505b46e1be929413242cf016','0','1','2018-04-21 11:25:59','1','2018-04-22 11:41:10','sdf阿萨德','f2d694c5e8544169a129a5354c8d4a7a','a33e22f7d5a74b488852ae379ca2ea12','120','123456','10','1'),('3da2bb209c744d7cb3884dff2d532730','7b83d5d0d78241aa9519909d957e2af6','1001-null','张武强','1382873828','1','5e24382898c340cfa16417ea5eb3298d','d3fe276675cf4f50a295acf87ea72e63','2018-04-16','f647e35a8ea440e7813372ae4e932a77','1','1','2018-04-19 17:45:28','1','2018-04-19 17:45:28','是大是大非asd\r\nsadf asdf s阿斯蒂芬s发撒地方\r\n\r\n阿斯蒂芬撒旦法的方式','f2d694c5e8544169a129a5354c8d4a7a','a33e22f7d5a74b488852ae379ca2ea12','120','13982873828','0','1'),('4696ebde8a974ca79a96e26e635b9f35','7b83d5d0d78241aa9519909d957e2af6','1001-null','张武强','1382873828','1','5e24382898c340cfa16417ea5eb3298d','d3fe276675cf4f50a295acf87ea72e63','2018-04-16','f647e35a8ea440e7813372ae4e932a77','1','1','2018-04-19 17:47:38','1','2018-04-19 17:47:38','','f2d694c5e8544169a129a5354c8d4a7a','a33e22f7d5a74b488852ae379ca2ea12','120','13982873828','0','1'),('5e39af2f7ed84bc18b0fb5778d16b9b9','12850e0792ed4f34801588d1483b20ce','1001101804180002','张2','111','1','8c5f1d7ee3c040b3b4743e5e45324612','a77e3b4e4c5d44cca1e317f24c5785e7','2018-03-13','508b1b81505b46e1be929413242cf016','0','1','2018-04-18 16:43:38','1','2018-04-18 20:10:28','阿三的A士大夫撒旦法','f2d694c5e8544169a129a5354c8d4a7a','a33e22f7d5a74b488852ae379ca2ea12','140','123456','40','1'),('69582ada572f4393ba3d704509926b96','a044d543fd674ce298c01c78d4bef859','1001-10201804220009','张翠山','84885484','1','5e24382898c340cfa16417ea5eb3298d','a77e3b4e4c5d44cca1e317f24c5785e7','1989-12-03','508b1b81505b46e1be929413242cf016','0','1','2018-04-22 23:18:56','1','2018-04-23 13:42:38','','f2d694c5e8544169a129a5354c8d4a7a',NULL,'33','158548198912031585','0','2'),('6d55570e38914d5391032d70d39ce6ed','a044d543fd674ce298c01c78d4bef859','1001-10201804220011','张翠山','84885484','1','5e24382898c340cfa16417ea5eb3298d','a77e3b4e4c5d44cca1e317f24c5785e7','1989-12-03','508b1b81505b46e1be929413242cf016','0','1','2018-04-22 23:21:58','1','2018-04-23 13:01:30','阿斯顿发生','f2d694c5e8544169a129a5354c8d4a7a',NULL,'55','158548198912031585','0','2'),('7b0552b6c20e4a8eb17620078ed0fba5','7b83d5d0d78241aa9519909d957e2af6','1001-null','张武强','1382873828','1','5e24382898c340cfa16417ea5eb3298d','d3fe276675cf4f50a295acf87ea72e63','2018-04-16','f647e35a8ea440e7813372ae4e932a77','1','1','2018-04-19 17:45:58','1','2018-04-19 17:45:58','阿斯蒂芬','f2d694c5e8544169a129a5354c8d4a7a','a33e22f7d5a74b488852ae379ca2ea12','120','13982873828','0','1'),('9f8d6f41a3814970a8454e485946a7ea','47dedc506cca4e138eb6f12cfedbbc00','0020011800000252','vvv','455','1','c8b6f329cc024c48abc3548a9bb741de','a77e3b4e4c5d44cca1e317f24c5785e7','2018-03-16','f647e35a8ea440e7813372ae4e932a77','0','dbd1c02859f8434aad548bbd09cd74b5','2018-04-14 18:32:28','dbd1c02859f8434aad548bbd09cd74b5','2018-04-14 18:32:28','','f2d694c5e8544169a129a5354c8d4a7a','c0f1d0e745a84c7c872b261eff1d6593','33','234','20','1'),('aa67620119d240739049a89eaddb32f4','ac19c8d4932c427db0ef8d339f5fc2ab','1001-10201804220010','周杰伦','1584544545','1','c8b6f329cc024c48abc3548a9bb741de','d3fe276675cf4f50a295acf87ea72e63','1975-05-11','f647e35a8ea440e7813372ae4e932a77','0','1','2018-04-22 23:21:27','1','2018-04-22 23:21:27','是打发斯蒂芬','f2d694c5e8544169a129a5354c8d4a7a','a33e22f7d5a74b488852ae379ca2ea12','120','138542197505111254','0','1'),('b5d93cd57e714673a301f1d2508abf8e','7b83d5d0d78241aa9519909d957e2af6','1001-null','张武强','1382873828','1','5e24382898c340cfa16417ea5eb3298d','d3fe276675cf4f50a295acf87ea72e63','2018-04-16','f647e35a8ea440e7813372ae4e932a77','1','1','2018-04-19 17:48:59','1','2018-04-19 17:48:59','','f2d694c5e8544169a129a5354c8d4a7a','a33e22f7d5a74b488852ae379ca2ea12','120','13982873828','0','1'),('b853cf7b67494ab1ad1ec42fa8f322af','7b83d5d0d78241aa9519909d957e2af6','1001-null','张武强','1382873828','1','5e24382898c340cfa16417ea5eb3298d','d3fe276675cf4f50a295acf87ea72e63','2018-04-16','f647e35a8ea440e7813372ae4e932a77','1','1','2018-04-19 17:45:24','1','2018-04-19 17:45:24','是大是大非asd\r\nsadf asdf s阿斯蒂芬s发撒地方\r\n\r\n阿斯蒂芬撒旦法的方式','f2d694c5e8544169a129a5354c8d4a7a','a33e22f7d5a74b488852ae379ca2ea12','120','13982873828','0','1');

/*Table structure for table `bj_examination_record_item` */

DROP TABLE IF EXISTS `bj_examination_record_item`;

CREATE TABLE `bj_examination_record_item` (
  `id` varchar(64) NOT NULL,
  `record_id` varchar(64) NOT NULL COMMENT '检查记录',
  `item_id` varchar(64) NOT NULL COMMENT '检查项目',
  `item_name` varchar(50) DEFAULT NULL,
  `need_samples` char(1) DEFAULT NULL COMMENT '是否需要样本：0-否，1-是',
  `specimen_id` varchar(64) DEFAULT NULL COMMENT '样本类型id',
  `sample_code` varchar(50) DEFAULT NULL COMMENT '样本编号',
  `result_dict_id` varchar(64) DEFAULT NULL COMMENT '体检结果',
  `result_dict_name` varchar(255) DEFAULT NULL COMMENT '体检结果',
  `result_flag` varchar(1) DEFAULT NULL COMMENT '检合格标识：0-否，1-是',
  `result_remarks` varchar(255) DEFAULT NULL COMMENT '结果备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `last_flag` varchar(1) DEFAULT '1' COMMENT '本次检查记录中同项目最后一次检查标识：0-否，1-是',
  `examination_flag` varchar(1) DEFAULT '1' COMMENT '1-初检，2-复检',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='检查记录项目';

/*Data for the table `bj_examination_record_item` */

insert  into `bj_examination_record_item`(`id`,`record_id`,`item_id`,`item_name`,`need_samples`,`specimen_id`,`sample_code`,`result_dict_id`,`result_dict_name`,`result_flag`,`result_remarks`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`last_flag`,`examination_flag`) values ('043f62b7344c40c3a143a845224db759','69582ada572f4393ba3d704509926b96','ef0d0138fce440a8950a28744f5f7dc3','验尿','1','',NULL,NULL,NULL,NULL,NULL,'0','1','2018-04-23 13:01:56','1','2018-04-23 13:01:56',NULL,'1','1'),('0f86a260f05a454c926d54cd689a86cb','5e39af2f7ed84bc18b0fb5778d16b9b9','e0835a627f7c4880ac02fbf6c982f8bd','血压','0','243768a6a74142809e631f69aea14bc2',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-18 18:27:06','1','2018-04-18 18:27:06',NULL,'1','1'),('189a4af3f6ed4faba4767bbcd972217b','3da2bb209c744d7cb3884dff2d532730','e0835a627f7c4880ac02fbf6c982f8bd','血压','0','243768a6a74142809e631f69aea14bc2',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-19 17:45:28','1','2018-04-19 17:45:28',NULL,'1','1'),('191ad1f695bf44a0852e1b1fffe838e6','aa67620119d240739049a89eaddb32f4','1f8d8b21a4d844b986c969a935325d4f','验血','1','',NULL,NULL,NULL,NULL,NULL,'0','1','2018-04-22 23:21:27','1','2018-04-22 23:21:27',NULL,'1','1'),('1cd709f92bfe4aaab7b7d589836afbb6','0c266f42e1fc4b0caf65e4466e91a0f3','e0835a627f7c4880ac02fbf6c982f8bd','血压','0','',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-21 21:05:07','1','2018-04-21 21:05:07',NULL,'1','1'),('1fbf60013a6a434d9c83b153a326b865','b5d93cd57e714673a301f1d2508abf8e','e0835a627f7c4880ac02fbf6c982f8bd','血压','0','243768a6a74142809e631f69aea14bc2',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-19 17:48:59','1','2018-04-19 17:48:59',NULL,'1','1'),('243c57abc92643b5b5245048571a75fd','2a4e4779542049ba91b54f699f9c0667','ef0d0138fce440a8950a28744f5f7dc3','验尿','1','243768a6a74142809e631f69aea14bc2',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-19 17:47:27','1','2018-04-19 17:47:27',NULL,'1','1'),('2f9a1b35d0f141a08562712f94827e38','053aba3d5ff745ac807e9b0a45cb4af2','e0835a627f7c4880ac02fbf6c982f8bd','血压','0','',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-22 17:41:01','1','2018-04-22 17:41:01',NULL,'1','1'),('305f568f3cf0417fb94e9d9abced0c93','b853cf7b67494ab1ad1ec42fa8f322af','e0835a627f7c4880ac02fbf6c982f8bd','血压','0','243768a6a74142809e631f69aea14bc2',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-19 17:45:24','1','2018-04-19 17:45:24',NULL,'1','1'),('368164460706420eb0bcd3323ecf9f5d','198ab83718cf4dd893c1f96608951a48','e0835a627f7c4880ac02fbf6c982f8bd','血压','0','243768a6a74142809e631f69aea14bc2',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-18 16:43:48','1','2018-04-18 16:43:48',NULL,'1','1'),('3a90e7c7c8ef4da0a3662376a12bb7cf','5e39af2f7ed84bc18b0fb5778d16b9b9','e0835a627f7c4880ac02fbf6c982f8bd','血压','0','243768a6a74142809e631f69aea14bc2',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-18 16:43:38','1','2018-04-18 16:43:38',NULL,'1','1'),('3ed56b149dbd4cceb98fc8b7c0e639dc','121292ab28b94a7c80d6480b5fbb252d','ef0d0138fce440a8950a28744f5f7dc3','验尿','1','243768a6a74142809e631f69aea14bc2',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-19 17:18:49','1','2018-04-19 17:18:49',NULL,'1','1'),('414fd2e96897428b91c8ef92688b426b','053aba3d5ff745ac807e9b0a45cb4af2','1f8d8b21a4d844b986c969a935325d4f','验血','1','',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-22 17:41:01','1','2018-04-22 17:41:01',NULL,'1','1'),('42e8fba4cc6544ba8beac5dd5f41f557','2a4e4779542049ba91b54f699f9c0667','1f8d8b21a4d844b986c969a935325d4f','验血','1','442e8fa28245437b9fab38bccb7c6a32',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-19 17:47:27','1','2018-04-19 17:47:27',NULL,'1','1'),('46f482435e2c4f82af73c87619dbd2cd','5e39af2f7ed84bc18b0fb5778d16b9b9','1f8d8b21a4d844b986c969a935325d4f','验血','1','442e8fa28245437b9fab38bccb7c6a32',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-18 18:27:06','1','2018-04-18 18:27:06',NULL,'1','1'),('478a50f266ba4957a7e8bd3b143af91e','121292ab28b94a7c80d6480b5fbb252d','1f8d8b21a4d844b986c969a935325d4f','验血','1','442e8fa28245437b9fab38bccb7c6a32',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-19 17:18:49','1','2018-04-19 17:18:49',NULL,'1','1'),('52b9c369246d4e35946b572e9749e517','6d55570e38914d5391032d70d39ce6ed','e0835a627f7c4880ac02fbf6c982f8bd','血压','0','',NULL,NULL,NULL,NULL,NULL,'0','1','2018-04-23 13:01:33','1','2018-04-23 13:01:33',NULL,'1','1'),('5d2cc4f141684aa2986b3869577298d5','3da2bb209c744d7cb3884dff2d532730','1f8d8b21a4d844b986c969a935325d4f','验血','1','442e8fa28245437b9fab38bccb7c6a32',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-19 17:45:28','1','2018-04-19 17:45:28',NULL,'1','1'),('5d9fc3ade1fd40a7a811937ea022f4ab','053aba3d5ff745ac807e9b0a45cb4af2','1f8d8b21a4d844b986c969a935325d4f','验血','1','',NULL,NULL,NULL,NULL,NULL,'0','1','2018-04-22 23:07:36','1','2018-04-22 23:07:36',NULL,'1','1'),('5db74562d6ee47f69725a3a18773a11a','5e39af2f7ed84bc18b0fb5778d16b9b9','ef0d0138fce440a8950a28744f5f7dc3','验尿','1','243768a6a74142809e631f69aea14bc2',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-18 16:43:38','1','2018-04-18 16:43:38',NULL,'1','1'),('5f122d87a65f48588ef395dc726f3e10','aa67620119d240739049a89eaddb32f4','ef0d0138fce440a8950a28744f5f7dc3','验尿','1','',NULL,NULL,NULL,NULL,NULL,'0','1','2018-04-22 23:21:27','1','2018-04-22 23:21:27',NULL,'1','1'),('62807210af764b82850ae01079c5c674','255c8972fae64d60a07954811eee93b3','ef0d0138fce440a8950a28744f5f7dc3','验尿','1','243768a6a74142809e631f69aea14bc2',NULL,NULL,NULL,NULL,NULL,'0','1','2018-04-19 18:18:50','1','2018-04-22 19:31:00',NULL,'1','1'),('63d9519da16d4d6aabf9f124b3cb265f','2a4e4779542049ba91b54f699f9c0667','e0835a627f7c4880ac02fbf6c982f8bd','血压','0','243768a6a74142809e631f69aea14bc2',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-19 17:47:27','1','2018-04-19 17:47:27',NULL,'1','1'),('64ad1f173b4b4002a5cf7fc8b8fe01ce','198ab83718cf4dd893c1f96608951a48','1f8d8b21a4d844b986c969a935325d4f','验血','1','442e8fa28245437b9fab38bccb7c6a32',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-18 16:43:48','1','2018-04-18 16:43:48',NULL,'1','1'),('650e2dc154e144f08fb611816d24250f','053aba3d5ff745ac807e9b0a45cb4af2','ef0d0138fce440a8950a28744f5f7dc3','验尿','1','',NULL,NULL,NULL,NULL,NULL,'0','1','2018-04-22 23:07:36','1','2018-04-22 23:07:36',NULL,'1','1'),('6b4f858c9ff84552a576ba55440e1afd','5e39af2f7ed84bc18b0fb5778d16b9b9','1f8d8b21a4d844b986c969a935325d4f','验血','1','442e8fa28245437b9fab38bccb7c6a32',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-18 16:43:38','1','2018-04-18 16:43:38',NULL,'1','1'),('6b63f13d4b904aaba8a348af9431ec2e','b5d93cd57e714673a301f1d2508abf8e','ef0d0138fce440a8950a28744f5f7dc3','验尿','1','243768a6a74142809e631f69aea14bc2',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-19 17:48:59','1','2018-04-19 17:48:59',NULL,'1','1'),('6c6d4cb122d146428fb230e5c0fa6097','9f8d6f41a3814970a8454e485946a7ea','e0835a627f7c4880ac02fbf6c982f8bd','血压','0','243768a6a74142809e631f69aea14bc2',NULL,'2f5287c537da4f5f9bb691c1833d9e9a','合格','1','血压正常','1','dbd1c02859f8434aad548bbd09cd74b5','2018-04-14 18:32:28','dbd1c02859f8434aad548bbd09cd74b5','2018-04-14 18:32:28',NULL,'1','1'),('6e05ee76474149f08e133954c5249518','198ab83718cf4dd893c1f96608951a48','ef0d0138fce440a8950a28744f5f7dc3','验尿','1','243768a6a74142809e631f69aea14bc2',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-18 16:43:48','1','2018-04-18 16:43:48',NULL,'1','1'),('6e69d34204f54a65adea6205b551f14c','5e39af2f7ed84bc18b0fb5778d16b9b9','e0835a627f7c4880ac02fbf6c982f8bd','血压','0','243768a6a74142809e631f69aea14bc2',NULL,'2f5287c537da4f5f9bb691c1833d9e9a','合格','1','血压正常','0','1','2018-04-18 20:10:29','1','2018-04-18 20:10:29',NULL,'1','1'),('701a71f3a3fe4417aecb7ab52d50164b','7b0552b6c20e4a8eb17620078ed0fba5','e0835a627f7c4880ac02fbf6c982f8bd','血压','0','243768a6a74142809e631f69aea14bc2',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-19 17:45:58','1','2018-04-19 17:45:58',NULL,'1','1'),('70e65ef2a8b14860960440ee192e85c4','0c266f42e1fc4b0caf65e4466e91a0f3','e0835a627f7c4880ac02fbf6c982f8bd','血压','0','',NULL,NULL,NULL,NULL,NULL,'0','1','2018-04-22 23:10:30','1','2018-04-22 23:10:30',NULL,'1','1'),('7120aa7a79b348fb8320db8ae5b8a632','0c266f42e1fc4b0caf65e4466e91a0f3','1f8d8b21a4d844b986c969a935325d4f','验血','1','',NULL,NULL,NULL,NULL,NULL,'0','1','2018-04-22 23:10:30','1','2018-04-22 23:10:30',NULL,'1','1'),('71b8a02e271646fabb2433927dc35c13','255c8972fae64d60a07954811eee93b3','e0835a627f7c4880ac02fbf6c982f8bd','血压','0','243768a6a74142809e631f69aea14bc2',NULL,NULL,NULL,NULL,NULL,'0','1','2018-04-19 18:18:49','1','2018-04-22 19:31:00',NULL,'1','1'),('769571891a2041d191ed3c8efa60046d','2c1e48f8b4414503a72de328f0317093','ef0d0138fce440a8950a28744f5f7dc3','验尿','1','442e8fa28245437b9fab38bccb7c6a32',NULL,NULL,NULL,NULL,NULL,'0','1','2018-04-21 11:25:59','1','2018-04-22 11:41:10',NULL,'1','1'),('78b70218bbd54863ac0b6a82ff66450b','69582ada572f4393ba3d704509926b96','e0835a627f7c4880ac02fbf6c982f8bd','血压','0','',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-23 13:01:56','1','2018-04-23 13:01:56',NULL,'1','1'),('8174e762f5834e93a5fed4b4a40bda8d','7b0552b6c20e4a8eb17620078ed0fba5','ef0d0138fce440a8950a28744f5f7dc3','验尿','1','243768a6a74142809e631f69aea14bc2',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-19 17:45:58','1','2018-04-19 17:45:58',NULL,'1','1'),('8c1cac3ace3d4d9a889844e422db342a','053aba3d5ff745ac807e9b0a45cb4af2','ef0d0138fce440a8950a28744f5f7dc3','验尿','1','',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-22 17:41:01','1','2018-04-22 17:41:01',NULL,'1','1'),('8c262ca3ef3c4b799ee9cb36f5771823','198ab83718cf4dd893c1f96608951a48','1f8d8b21a4d844b986c969a935325d4f','验血','1','442e8fa28245437b9fab38bccb7c6a32',NULL,NULL,NULL,NULL,NULL,'0','1','2018-04-18 18:26:30','1','2018-04-18 18:26:30',NULL,'1','1'),('9034adec9e164e93be6908e1708425ef','5e39af2f7ed84bc18b0fb5778d16b9b9','ef0d0138fce440a8950a28744f5f7dc3','验尿','1','243768a6a74142809e631f69aea14bc2',NULL,'916a3eb9494440dcb120ac9b260e5760','合格','1','合格合格','0','1','2018-04-18 20:10:29','1','2018-04-18 20:10:29',NULL,'1','1'),('9458d5e51d934c44a8bbfb52f49d8f8f','3da2bb209c744d7cb3884dff2d532730','ef0d0138fce440a8950a28744f5f7dc3','验尿','1','243768a6a74142809e631f69aea14bc2',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-19 17:45:28','1','2018-04-19 17:45:28',NULL,'1','1'),('94639084367b49a684ca05f4921568eb','5e39af2f7ed84bc18b0fb5778d16b9b9','ef0d0138fce440a8950a28744f5f7dc3','验尿','1','243768a6a74142809e631f69aea14bc2',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-18 18:27:07','1','2018-04-18 18:27:07',NULL,'1','1'),('9779325bc109401b83e35662d0d37c6b','4696ebde8a974ca79a96e26e635b9f35','1f8d8b21a4d844b986c969a935325d4f','验血','1','442e8fa28245437b9fab38bccb7c6a32',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-19 17:47:38','1','2018-04-19 17:47:38',NULL,'1','1'),('97ef624aacd74f06bdd3bcb0bd4af513','6d55570e38914d5391032d70d39ce6ed','2b1cfdc1c64943c4b930c2d2ddc05379','手指甲检查','0','',NULL,NULL,NULL,NULL,NULL,'0','1','2018-04-23 13:01:33','1','2018-04-23 13:01:33',NULL,'1','1'),('9bcfc393f26047b38ab13d996a6dc45e','b5d93cd57e714673a301f1d2508abf8e','1f8d8b21a4d844b986c969a935325d4f','验血','1','442e8fa28245437b9fab38bccb7c6a32',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-19 17:48:59','1','2018-04-19 17:48:59',NULL,'1','1'),('a45ff751723447a197dbf031c0c901e2','2c1e48f8b4414503a72de328f0317093','e0835a627f7c4880ac02fbf6c982f8bd','血压','0','',NULL,NULL,NULL,NULL,NULL,'0','1','2018-04-21 11:25:59','1','2018-04-22 11:41:10',NULL,'1','1'),('a9d1860cc1d14785a676865ea5c9edc5','aa67620119d240739049a89eaddb32f4','e0835a627f7c4880ac02fbf6c982f8bd','血压','0','',NULL,NULL,NULL,NULL,NULL,'0','1','2018-04-22 23:21:27','1','2018-04-22 23:21:27',NULL,'1','1'),('ac704f57a13a44d9a9fa75a360188e37','5e39af2f7ed84bc18b0fb5778d16b9b9','1f8d8b21a4d844b986c969a935325d4f','验血','1','442e8fa28245437b9fab38bccb7c6a32',NULL,'e00853ba3cfa4c1b9af147000579a6f6','合格','1','问问','0','1','2018-04-18 20:10:28','1','2018-04-18 20:10:28',NULL,'1','1'),('b4905f5048c849978b922581b998ced7','0c266f42e1fc4b0caf65e4466e91a0f3','ef0d0138fce440a8950a28744f5f7dc3','验尿','1','',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-21 21:05:07','1','2018-04-21 21:05:07',NULL,'1','1'),('be9fd5b72a0b43a79f181577b4638bb0','9f8d6f41a3814970a8454e485946a7ea','ef0d0138fce440a8950a28744f5f7dc3','验尿','1','243768a6a74142809e631f69aea14bc2','123','660c0f8f68ec416e8134e335acb9038a','不合格','0','1234','1','dbd1c02859f8434aad548bbd09cd74b5','2018-04-14 18:32:28','dbd1c02859f8434aad548bbd09cd74b5','2018-04-14 18:32:28',NULL,'1','1'),('c7e076791f2f4a33a7042bb1b4da4c93','4696ebde8a974ca79a96e26e635b9f35','e0835a627f7c4880ac02fbf6c982f8bd','血压','0','243768a6a74142809e631f69aea14bc2',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-19 17:47:38','1','2018-04-19 17:47:38',NULL,'1','1'),('cb172d5d3beb40b5af658abd5f422315','0c266f42e1fc4b0caf65e4466e91a0f3','1f8d8b21a4d844b986c969a935325d4f','验血','1','',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-21 21:05:07','1','2018-04-21 21:05:07',NULL,'1','1'),('d4a7b41d86af48b4a5313e4ef7b460d1','198ab83718cf4dd893c1f96608951a48','ef0d0138fce440a8950a28744f5f7dc3','验尿','1','243768a6a74142809e631f69aea14bc2',NULL,NULL,NULL,NULL,NULL,'0','1','2018-04-18 18:26:30','1','2018-04-18 18:26:30',NULL,'1','1'),('dcfdb11a78d1404e8624f4fdc39e83bb','b853cf7b67494ab1ad1ec42fa8f322af','ef0d0138fce440a8950a28744f5f7dc3','验尿','1','243768a6a74142809e631f69aea14bc2',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-19 17:45:24','1','2018-04-19 17:45:24',NULL,'1','1'),('dd8167be0939405280409b911c4534a0','121292ab28b94a7c80d6480b5fbb252d','e0835a627f7c4880ac02fbf6c982f8bd','血压','0','243768a6a74142809e631f69aea14bc2',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-19 17:18:49','1','2018-04-19 17:18:49',NULL,'1','1'),('e3b70cce3a8d4ce5aeca2a1d6b9919e3','9f8d6f41a3814970a8454e485946a7ea','1f8d8b21a4d844b986c969a935325d4f','验血','1','442e8fa28245437b9fab38bccb7c6a32','1234','e00853ba3cfa4c1b9af147000579a6f6','合格','1','问问','1','dbd1c02859f8434aad548bbd09cd74b5','2018-04-14 18:32:28','dbd1c02859f8434aad548bbd09cd74b5','2018-04-14 18:32:28',NULL,'1','1'),('e77728632c2a4510bb3e0140f5b28853','198ab83718cf4dd893c1f96608951a48','e0835a627f7c4880ac02fbf6c982f8bd','血压','0','243768a6a74142809e631f69aea14bc2',NULL,NULL,NULL,NULL,NULL,'0','1','2018-04-18 18:26:30','1','2018-04-18 18:26:30',NULL,'1','1'),('eb0565e575d44e57abe9a7e3bd72357e','255c8972fae64d60a07954811eee93b3','1f8d8b21a4d844b986c969a935325d4f','验血','1','442e8fa28245437b9fab38bccb7c6a32',NULL,NULL,NULL,NULL,NULL,'0','1','2018-04-19 18:18:49','1','2018-04-22 19:31:00',NULL,'1','1'),('ed24f49258db47ea8337f9086161aba0','7b0552b6c20e4a8eb17620078ed0fba5','1f8d8b21a4d844b986c969a935325d4f','验血','1','442e8fa28245437b9fab38bccb7c6a32',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-19 17:45:58','1','2018-04-19 17:45:58',NULL,'1','1'),('ef5704f3a0524b74902cbc9a04ccbaf3','0c266f42e1fc4b0caf65e4466e91a0f3','ef0d0138fce440a8950a28744f5f7dc3','验尿','1','',NULL,NULL,NULL,NULL,NULL,'0','1','2018-04-22 23:10:30','1','2018-04-22 23:10:30',NULL,'1','1'),('f3543d5fda4d49649967c7649c2a52b2','4696ebde8a974ca79a96e26e635b9f35','ef0d0138fce440a8950a28744f5f7dc3','验尿','1','243768a6a74142809e631f69aea14bc2',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-19 17:47:39','1','2018-04-19 17:47:39',NULL,'1','1'),('f6688030ef3b4acfb58e63c9c2f5377c','b853cf7b67494ab1ad1ec42fa8f322af','1f8d8b21a4d844b986c969a935325d4f','验血','1','442e8fa28245437b9fab38bccb7c6a32',NULL,NULL,NULL,NULL,NULL,'1','1','2018-04-19 17:45:24','1','2018-04-19 17:45:24',NULL,'1','1'),('fb58bc8db5cf4e428ec03b7a12824a8c','69582ada572f4393ba3d704509926b96','2b1cfdc1c64943c4b930c2d2ddc05379','手指甲检查','0','',NULL,NULL,NULL,NULL,NULL,'0','1','2018-04-23 13:42:38','1','2018-04-23 13:42:38',NULL,'1','1'),('fbbe570ddda1431c85312ff0d7a43efb','053aba3d5ff745ac807e9b0a45cb4af2','e0835a627f7c4880ac02fbf6c982f8bd','血压','0','',NULL,NULL,NULL,NULL,NULL,'0','1','2018-04-22 23:07:36','1','2018-04-22 23:07:36',NULL,'1','1'),('fcbef6857e9249118343541957162577','2c1e48f8b4414503a72de328f0317093','1f8d8b21a4d844b986c969a935325d4f','验血','1','442e8fa28245437b9fab38bccb7c6a32',NULL,NULL,NULL,NULL,NULL,'0','1','2018-04-21 11:25:59','1','2018-04-22 11:41:10',NULL,'1','1');

/*Table structure for table `bj_examination_result` */

DROP TABLE IF EXISTS `bj_examination_result`;

CREATE TABLE `bj_examination_result` (
  `id` varchar(64) NOT NULL,
  `examination_code` varchar(50) DEFAULT NULL COMMENT '体检编号',
  `sample_code` varchar(50) DEFAULT NULL COMMENT '样本编号',
  `item_name` varchar(100) NOT NULL COMMENT '项目',
  `item_id` varchar(64) NOT NULL COMMENT '项目id',
  `user_id` varchar(64) NOT NULL COMMENT '体检用户',
  `result_flag` varchar(1) NOT NULL COMMENT '检合格标识：0-否，1-是',
  `result_dict_id` varchar(64) NOT NULL COMMENT '体检结果',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `owner` varchar(64) DEFAULT NULL COMMENT '所属体检中心',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='体检项目结果';

/*Data for the table `bj_examination_result` */

/*Table structure for table `bj_examination_result_dict` */

DROP TABLE IF EXISTS `bj_examination_result_dict`;

CREATE TABLE `bj_examination_result_dict` (
  `id` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `item_id` varchar(64) NOT NULL COMMENT '检查项目',
  `default_flag` char(1) NOT NULL DEFAULT '0' COMMENT '是否默认：0-否，1-是',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '具体描述',
  `flag` varchar(1) DEFAULT NULL COMMENT '是否合格：0-否，1-是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='体检结果字典';

/*Data for the table `bj_examination_result_dict` */

insert  into `bj_examination_result_dict`(`id`,`name`,`item_id`,`default_flag`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`flag`) values ('2f5287c537da4f5f9bb691c1833d9e9a','合格','e0835a627f7c4880ac02fbf6c982f8bd','1','0','dbd1c02859f8434aad548bbd09cd74b5','2018-04-01 18:39:09','dbd1c02859f8434aad548bbd09cd74b5','2018-04-12 10:17:44','血压正常','1'),('660c0f8f68ec416e8134e335acb9038a','不合格','ef0d0138fce440a8950a28744f5f7dc3','0','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-17 14:45:53','dbd1c02859f8434aad548bbd09cd74b5','2018-04-12 10:18:00','1234','0'),('916a3eb9494440dcb120ac9b260e5760','合格','ef0d0138fce440a8950a28744f5f7dc3','1','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 11:41:34','dbd1c02859f8434aad548bbd09cd74b5','2018-04-12 10:18:05','合格合格','1'),('a6b8e7a8a456469c929fa5a7aba2c798','不合格','1f8d8b21a4d844b986c969a935325d4f','0','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-17 14:46:13','dbd1c02859f8434aad548bbd09cd74b5','2018-04-12 10:17:52','ggg','0'),('d341285769ba4abda4906f273ccc3022','不合格','e0835a627f7c4880ac02fbf6c982f8bd','0','0','dbd1c02859f8434aad548bbd09cd74b5','2018-04-01 18:39:47','dbd1c02859f8434aad548bbd09cd74b5','2018-04-12 10:16:37','血压不合格','0'),('e00853ba3cfa4c1b9af147000579a6f6','合格','1f8d8b21a4d844b986c969a935325d4f','1','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-17 14:46:02','dbd1c02859f8434aad548bbd09cd74b5','2018-04-12 10:17:56','问问','1');

/*Table structure for table `bj_examination_samples` */

DROP TABLE IF EXISTS `bj_examination_samples`;

CREATE TABLE `bj_examination_samples` (
  `id` varchar(64) NOT NULL,
  `record_id` varchar(64) NOT NULL COMMENT '检查记录',
  `record_item_id` varchar(64) NOT NULL COMMENT '检查记录项目id',
  `examination_code` varchar(50) DEFAULT NULL COMMENT '体检编号',
  `code` varchar(50) DEFAULT NULL COMMENT '编号',
  `item_id` varchar(64) NOT NULL COMMENT '项目id',
  `result_dict_id` varchar(64) DEFAULT NULL COMMENT '体检结果',
  `result_flag` varchar(1) DEFAULT NULL COMMENT '检合格标识：0-否，1-是',
  `result_remarks` varchar(255) DEFAULT NULL COMMENT '结果备注',
  `user_id` varchar(64) NOT NULL COMMENT '体检用户',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `owner` varchar(64) DEFAULT NULL COMMENT '所属体检中心',
  `examination_flag` varchar(1) DEFAULT '1' COMMENT '1-初检，2-复检',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='体检样本';

/*Data for the table `bj_examination_samples` */

insert  into `bj_examination_samples`(`id`,`record_id`,`record_item_id`,`examination_code`,`code`,`item_id`,`result_dict_id`,`result_flag`,`result_remarks`,`user_id`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`owner`,`examination_flag`) values ('1925f90230874c0b87f635777077a350','255c8972fae64d60a07954811eee93b3','62807210af764b82850ae01079c5c674','1001-10201804190002','','ef0d0138fce440a8950a28744f5f7dc3',NULL,NULL,NULL,'7b83d5d0d78241aa9519909d957e2af6','0','1','2018-04-21 14:51:50','1','2018-04-21 14:51:50','','f2d694c5e8544169a129a5354c8d4a7a','1'),('1e9c2f5ed3554fdc931903beae9b121c','9f8d6f41a3814970a8454e485946a7ea','e3b70cce3a8d4ce5aeca2a1d6b9919e3','0020011800000252','1234','1f8d8b21a4d844b986c969a935325d4f','e00853ba3cfa4c1b9af147000579a6f6','1','问问','47dedc506cca4e138eb6f12cfedbbc00','0','dbd1c02859f8434aad548bbd09cd74b5','2018-04-14 21:20:15','dbd1c02859f8434aad548bbd09cd74b5','2018-04-14 21:20:15','','f2d694c5e8544169a129a5354c8d4a7a','1'),('917167e686bf455fac25b6cecd0f7dfd','255c8972fae64d60a07954811eee93b3','eb0565e575d44e57abe9a7e3bd72357e','1001-10201804190002','1001-XY201804200122','1f8d8b21a4d844b986c969a935325d4f',NULL,NULL,NULL,'7b83d5d0d78241aa9519909d957e2af6','0','1','2018-04-21 11:46:11','1','2018-04-21 11:46:11','','f2d694c5e8544169a129a5354c8d4a7a','1'),('c5e0e06173f7440db89869ad83787d0f','9f8d6f41a3814970a8454e485946a7ea','be9fd5b72a0b43a79f181577b4638bb0','0020011800000252','123','ef0d0138fce440a8950a28744f5f7dc3','660c0f8f68ec416e8134e335acb9038a','0','1234','47dedc506cca4e138eb6f12cfedbbc00','0','dbd1c02859f8434aad548bbd09cd74b5','2018-04-14 18:32:36','dbd1c02859f8434aad548bbd09cd74b5','2018-04-14 18:32:36','','f2d694c5e8544169a129a5354c8d4a7a','1');

/*Table structure for table `bj_examination_user` */

DROP TABLE IF EXISTS `bj_examination_user`;

CREATE TABLE `bj_examination_user` (
  `id` varchar(64) NOT NULL,
  `code` varchar(50) DEFAULT NULL COMMENT '编号',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `head_img_path` varchar(128) DEFAULT NULL COMMENT '真实照片图片',
  `phone_number` varchar(45) NOT NULL COMMENT '联系电话',
  `id_number` varchar(20) NOT NULL COMMENT '身份证号',
  `sex` varchar(64) NOT NULL COMMENT '性别',
  `industry_id` varchar(64) DEFAULT NULL COMMENT '行业',
  `post_id` varchar(64) DEFAULT NULL COMMENT '岗位',
  `birthday` varchar(10) NOT NULL COMMENT '出生日期',
  `organ_id` varchar(64) DEFAULT NULL COMMENT '单位',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `owner` varchar(64) DEFAULT NULL COMMENT '所属体检中心',
  `default_record` char(1) NOT NULL DEFAULT '0' COMMENT '默认记录，不允许删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='体检用户';

/*Data for the table `bj_examination_user` */

insert  into `bj_examination_user`(`id`,`code`,`name`,`head_img_path`,`phone_number`,`id_number`,`sex`,`industry_id`,`post_id`,`birthday`,`organ_id`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`owner`,`default_record`) values ('12850e0792ed4f34801588d1483b20ce','1001-EU1804220003','张三丰','','13854855484','138325198505081548','1','8c5f1d7ee3c040b3b4743e5e45324612','a77e3b4e4c5d44cca1e317f24c5785e7','1985-05-08','508b1b81505b46e1be929413242cf016','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-13 09:13:41','1','2018-04-22 22:19:32','发反反复复','f2d694c5e8544169a129a5354c8d4a7a','0'),('47dedc506cca4e138eb6f12cfedbbc00','1001-EU1804220006','李小璐','/wshbj/userfiles/1/images/2018/04/23/1139107z7e.jpg/','458455','138215198805061584','2','c8b6f329cc024c48abc3548a9bb741de','a77e3b4e4c5d44cca1e317f24c5785e7','1988-05-06','f647e35a8ea440e7813372ae4e932a77','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-16 13:14:26','1','2018-04-23 11:39:14','','f2d694c5e8544169a129a5354c8d4a7a','0'),('7b83d5d0d78241aa9519909d957e2af6','1001-EU1804220008','张武强','/wshbj/userfiles/1/images/2018/04/23/142655gx8y.jpg/','1382873828','192158197212031543','1','5e24382898c340cfa16417ea5eb3298d','d3fe276675cf4f50a295acf87ea72e63','1972-12-03','f647e35a8ea440e7813372ae4e932a77','0','1','2018-04-16 11:00:41','1','2018-04-23 14:26:58','','f2d694c5e8544169a129a5354c8d4a7a','0'),('a044d543fd674ce298c01c78d4bef859','1001-EU1804220004','张翠山','/wshbj/userfiles/1/images/2018/04/23/142629ejtv.jpg/','84885484','158548198912031585','1','5e24382898c340cfa16417ea5eb3298d','a77e3b4e4c5d44cca1e317f24c5785e7','1989-12-03','508b1b81505b46e1be929413242cf016','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 12:51:51','1','2018-04-23 14:26:33','2232','f2d694c5e8544169a129a5354c8d4a7a','0'),('ac19c8d4932c427db0ef8d339f5fc2ab','1001-EU1804220002','周杰伦','/wshbj/userfiles/1/images/2018/04/22/183208k8db.jpg/','1584544545','138542197505111254','1','c8b6f329cc024c48abc3548a9bb741de','d3fe276675cf4f50a295acf87ea72e63','1975-05-11','f647e35a8ea440e7813372ae4e932a77','0','1','2018-04-22 18:25:35','1','2018-04-22 23:20:59','打发斯蒂芬','f2d694c5e8544169a129a5354c8d4a7a','0'),('dda5c4367edd404c86ba858b7577f35d','1001-EU1804220002','张强','/wshbj/userfiles/1/images/2018/04/23/1138336gz1.jpg/','23841458','158458196811023541','1','c8b6f329cc024c48abc3548a9bb741de','a77e3b4e4c5d44cca1e317f24c5785e7','1968-11-02','bdb1267f643b48848c801efb35520f9e','0','1','2018-04-20 09:53:19','1','2018-04-23 11:38:39','','f2d694c5e8544169a129a5354c8d4a7a','0'),('e2f56e09c9df4eefa296e3261dd1a7dd','1001-EU1804220007','李宗盛','/wshbj/userfiles/1/images/2018/04/23/142708807r.jpg/','12585111','185454196506071548','1','5e24382898c340cfa16417ea5eb3298d','d3fe276675cf4f50a295acf87ea72e63','1965-06-07','f647e35a8ea440e7813372ae4e932a77','0','1','2018-04-22 17:57:03','1','2018-04-23 14:27:11','阿士大夫撒反对','f2d694c5e8544169a129a5354c8d4a7a','0'),('fef7399cc45049e8aeed5e8b124b3857','1001-EU1804220005','黄继光','','19754884','584865194905081548','1','c8b6f329cc024c48abc3548a9bb741de','a77e3b4e4c5d44cca1e317f24c5785e7','1949-05-08','f647e35a8ea440e7813372ae4e932a77','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-16 13:17:20','1','2018-04-22 22:20:55','','f2d694c5e8544169a129a5354c8d4a7a','0');

/*Table structure for table `bj_industry` */

DROP TABLE IF EXISTS `bj_industry`;

CREATE TABLE `bj_industry` (
  `id` varchar(64) NOT NULL,
  `code` varchar(45) NOT NULL COMMENT '编号',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `reference_flag` char(1) DEFAULT '0' COMMENT '参考标识：0-否，1-是',
  `owner` varchar(64) DEFAULT NULL COMMENT '所属体检中心',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行业数据';

/*Data for the table `bj_industry` */

insert  into `bj_industry`(`id`,`code`,`name`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`reference_flag`,`owner`) values ('0281f1fc66b6411abca99fc1d4afc093','1001','餐饮业','0','1','2018-04-16 11:02:25','1','2018-04-16 11:02:25','','0','22cdf43b3cf64706923b2bdc7bdd32ba'),('07b7419fa0b2437ca4d6013579e168b4','1','食品','0','1','2018-03-06 13:42:19','1','2018-03-06 13:42:19',NULL,'0',NULL),('417543aceaad49b5954b4177bfd242ab','1','医疗','0','92e9531b7c5d4fa2b13997b98d601000','2018-03-12 09:59:42','92e9531b7c5d4fa2b13997b98d601000','2018-03-12 09:59:42','医疗医疗','1',NULL),('4d4b4de85e974ef6932d43acc9d9c3a1','1','医疗','1','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 10:00:41','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 10:00:41','医疗医疗','0','f2d694c5e8544169a129a5354c8d4a7a'),('5e24382898c340cfa16417ea5eb3298d','2','互联网','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 10:00:41','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 10:00:41','互联网互联网互联网','0','f2d694c5e8544169a129a5354c8d4a7a'),('8c5f1d7ee3c040b3b4743e5e45324612','100','医疗','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 10:02:22','1','2018-04-22 22:56:38','医疗医疗','0','f2d694c5e8544169a129a5354c8d4a7a'),('963b434d1dff4e80ba91bdf32c68dd29','2','互联网','0','92e9531b7c5d4fa2b13997b98d601000','2018-03-12 09:59:58','92e9531b7c5d4fa2b13997b98d601000','2018-03-12 10:00:19','互联网互联网互联网','1',NULL),('b281ca30aa3a40a4b5c9ded0b5a3f53a','1001-HY2018002','农牧业','0','1','2018-04-23 01:19:43','1','2018-04-23 01:19:43','','0','f2d694c5e8544169a129a5354c8d4a7a'),('b737a42579cb453ab3ea42d23fe8c03d','1002','武装部','0','1','2018-04-16 11:02:39','1','2018-04-16 11:02:39','','0','22cdf43b3cf64706923b2bdc7bdd32ba'),('c8b6f329cc024c48abc3548a9bb741de','1','食品','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 09:58:44','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 09:58:44','食品食品食品','0','f2d694c5e8544169a129a5354c8d4a7a');

/*Table structure for table `bj_package_item` */

DROP TABLE IF EXISTS `bj_package_item`;

CREATE TABLE `bj_package_item` (
  `id` varchar(64) NOT NULL,
  `package_id` varchar(64) NOT NULL COMMENT '检查套餐',
  `item_id` varchar(64) NOT NULL COMMENT '检查项目',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='套餐包含检查项目';

/*Data for the table `bj_package_item` */

insert  into `bj_package_item`(`id`,`package_id`,`item_id`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`) values ('07bfa37183b64efcb260b158e6e56e11','c0f1d0e745a84c7c872b261eff1d6593','1f8d8b21a4d844b986c969a935325d4f','0','1','2018-04-23 02:37:33','1','2018-04-23 02:37:33',NULL),('14c16f1086cb4967869ad117bd48dfbc','a33e22f7d5a74b488852ae379ca2ea12','ef0d0138fce440a8950a28744f5f7dc3','0','1','2018-04-23 02:37:48','1','2018-04-23 02:37:48',NULL),('1db4b856a2f843a9882df19c54e23e05','43f2d25809e64265ab4f6f079e713adc','e7fe5024cf7d48a9bfff89e0c053bd9e','1','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 16:43:07','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 16:43:07','333'),('429dff1c0cc746c0b0b754856b610ccb','a33e22f7d5a74b488852ae379ca2ea12','2b1cfdc1c64943c4b930c2d2ddc05379','0','1','2018-04-23 02:37:48','1','2018-04-23 02:37:48',NULL),('d5b2f09570134fc6b7256a58d1292953','43f2d25809e64265ab4f6f079e713adc','e7fe5024cf7d48a9bfff89e0c053bd9e','1','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 16:32:39','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 16:32:39','111'),('d794275d3b62424f84fdac781eba19f5','43f2d25809e64265ab4f6f079e713adc','bbae2685f42f46668b3bf44df07fb12f','1','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 16:32:39','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 16:32:39','2222'),('e9dd893d67c1483da86f6744d4340a70','c0f1d0e745a84c7c872b261eff1d6593','e0835a627f7c4880ac02fbf6c982f8bd','0','1','2018-04-23 02:37:33','1','2018-04-23 02:37:33',NULL);

/*Table structure for table `bj_r_category_item` */

DROP TABLE IF EXISTS `bj_r_category_item`;

CREATE TABLE `bj_r_category_item` (
  `category_id` varchar(64) NOT NULL COMMENT '检查类别',
  `item_id` varchar(64) NOT NULL COMMENT '检查项目'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='检查类别项目';

/*Data for the table `bj_r_category_item` */

/*Table structure for table `bj_role_item` */

DROP TABLE IF EXISTS `bj_role_item`;

CREATE TABLE `bj_role_item` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `item_id` varchar(64) NOT NULL COMMENT '体检项目ID',
  PRIMARY KEY (`role_id`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-项目';

/*Data for the table `bj_role_item` */

insert  into `bj_role_item`(`role_id`,`item_id`) values ('7cb57c34857a4b79a632bcb986af9c43','1f8d8b21a4d844b986c969a935325d4f'),('f624ff7878b34fbe8645afdaf9cb8133','1f8d8b21a4d844b986c969a935325d4f'),('f624ff7878b34fbe8645afdaf9cb8133','e0835a627f7c4880ac02fbf6c982f8bd'),('f624ff7878b34fbe8645afdaf9cb8133','ef0d0138fce440a8950a28744f5f7dc3');

/*Table structure for table `bj_specimen` */

DROP TABLE IF EXISTS `bj_specimen`;

CREATE TABLE `bj_specimen` (
  `id` varchar(64) NOT NULL,
  `code` varchar(45) NOT NULL COMMENT '编号',
  `prefix` varchar(16) NOT NULL COMMENT '编号前缀',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `reference_flag` char(1) NOT NULL DEFAULT '0' COMMENT '参考标识：0-否，1-是',
  `owner` varchar(64) DEFAULT NULL COMMENT '所属体检中心',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='检查标本类型';

/*Data for the table `bj_specimen` */

insert  into `bj_specimen`(`id`,`code`,`prefix`,`name`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`reference_flag`,`owner`) values ('243768a6a74142809e631f69aea14bc2','2','NY','尿液','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 09:29:46','1','2018-04-22 23:04:47','尿液尿液尿液','0','f2d694c5e8544169a129a5354c8d4a7a'),('442e8fa28245437b9fab38bccb7c6a32','1','XY','血液','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 09:31:38','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 09:31:38','血液血液血液血液','0','f2d694c5e8544169a129a5354c8d4a7a'),('4cedc11a34d54ad4a5618f037589c6a1','1002','NY','尿样','0','1','2018-04-16 11:08:46','1','2018-04-16 11:08:46','','0','22cdf43b3cf64706923b2bdc7bdd32ba'),('a3ffddb162514467b91a2092f1c3eb4c','1','XY','血液','0','92e9531b7c5d4fa2b13997b98d601000','2018-03-12 09:11:00','92e9531b7c5d4fa2b13997b98d601000','2018-03-12 09:11:21','血液血液血液血液','1',NULL),('ca5b8181f0b745679101438f8443dd85','1001-BBLX2018002','TY','唾液','0','1','2018-04-23 01:20:43','1','2018-04-23 01:20:43','','0','f2d694c5e8544169a129a5354c8d4a7a'),('d7789de4fabf41588a119d2cb8d049c9','1001','XY','血样','0','1','2018-04-16 11:08:37','1','2018-04-16 11:08:37','','0','22cdf43b3cf64706923b2bdc7bdd32ba');

/*Table structure for table `cms_article` */

DROP TABLE IF EXISTS `cms_article`;

CREATE TABLE `cms_article` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `category_id` varchar(64) NOT NULL COMMENT '栏目编号',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `link` varchar(255) DEFAULT NULL COMMENT '文章链接',
  `color` varchar(50) DEFAULT NULL COMMENT '标题颜色',
  `image` varchar(255) DEFAULT NULL COMMENT '文章图片',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述、摘要',
  `weight` int(11) DEFAULT '0' COMMENT '权重，越大越靠前',
  `weight_date` datetime DEFAULT NULL COMMENT '权重期限',
  `hits` int(11) DEFAULT '0' COMMENT '点击数',
  `posid` varchar(10) DEFAULT NULL COMMENT '推荐位，多选',
  `custom_content_view` varchar(255) DEFAULT NULL COMMENT '自定义内容视图',
  `view_config` text COMMENT '视图配置',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_article_create_by` (`create_by`),
  KEY `cms_article_title` (`title`),
  KEY `cms_article_keywords` (`keywords`),
  KEY `cms_article_del_flag` (`del_flag`),
  KEY `cms_article_weight` (`weight`),
  KEY `cms_article_update_date` (`update_date`),
  KEY `cms_article_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章表';

/*Data for the table `cms_article` */

insert  into `cms_article`(`id`,`category_id`,`title`,`link`,`color`,`image`,`keywords`,`description`,`weight`,`weight_date`,`hits`,`posid`,`custom_content_view`,`view_config`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','3','标题啥意思？','','blue','','关键字1,关键字2','',0,NULL,2,',null,','','','1','2013-05-27 08:00:00','1','2018-03-03 01:59:24',NULL,'0'),('10','4','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','5','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','5','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','5','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','7','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','7','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,1,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','7','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','7','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','8','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','8','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','3','文章标题标题标题标题',NULL,'red',NULL,'关键字1,关键字2',NULL,0,NULL,1,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','8','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','8','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('24','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('26','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('27','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('28','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('29','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','3','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('30','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('31','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('32','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('33','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('34','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('35','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('36','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('37','13','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('38','13','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('39','13','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','3','文章标题标题标题标题',NULL,'green',NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('40','13','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('41','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('42','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('43','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('44','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('45','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('46','15','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('47','15','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('48','15','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('49','16','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','3','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('50','17','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('51','17','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('52','26','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('53','26','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','3','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('7','4','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('8','4','文章标题标题标题标题',NULL,'blue',NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('9','4','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `cms_article_data` */

DROP TABLE IF EXISTS `cms_article_data`;

CREATE TABLE `cms_article_data` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `content` text COMMENT '文章内容',
  `copyfrom` varchar(255) DEFAULT NULL COMMENT '文章来源',
  `relation` varchar(255) DEFAULT NULL COMMENT '相关文章',
  `allow_comment` char(1) DEFAULT NULL COMMENT '是否允许评论',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章详表';

/*Data for the table `cms_article_data` */

insert  into `cms_article_data`(`id`,`content`,`copyfrom`,`relation`,`allow_comment`) values ('1','<p style=\"margin: 0px 0px 16px; padding: 0px; box-sizing: border-box; font-size: 16px; color: rgb(79, 79, 79); line-height: 26px; text-align: justify; word-break: normal; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun; white-space: normal;\">\r\n	Swagger 是一系列对 RESTful 接口进行规范描述和页面展示的工具. 通过 springfox-swagger 将 Swagger 与 Spring-MVC 整合, 可从代码中的注解获取信息, 并生成相应的文档. 效果如下所示.</p>\r\n<p style=\"margin: 0px 0px 16px; padding: 0px; box-sizing: border-box; font-size: 16px; color: rgb(79, 79, 79); line-height: 26px; text-align: justify; word-break: normal; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun; white-space: normal;\">\r\n	<img alt=\"这里写图片描述\" src=\"http://img.blog.csdn.net/20160929165251897\" style=\"border-width: initial; border-style: none; box-sizing: border-box; margin: 24px 0px; max-width: 602px; max-height: 100%;\" title=\"\" />&nbsp;<br style=\"box-sizing: border-box;\" />\r\n	目前 Swagger 的 api 版本规范已经更新到 2.0 版本, 中文网络上基本上都是 1.0 的 api 版本规范的教程. 捣鼓了一天终于搞定了, 这两者区别还是有的.</p>\r\n<p style=\"margin: 0px 0px 16px; padding: 0px; box-sizing: border-box; font-size: 16px; color: rgb(79, 79, 79); line-height: 26px; text-align: justify; word-break: normal; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun; white-space: normal;\">\r\n	<span style=\"box-sizing: border-box; font-weight: 700;\">注: 本文的代码见&nbsp;<a href=\"https://github.com/Frank-Hust/SpringAndStagger\" style=\"box-sizing: border-box; color: rgb(12, 137, 207);\" target=\"_blank\">https://github.com/Frank-Hust/SpringAndStagger</a>, 直接 gitclone 下来或者下载在 IDEA 中就能运行了.</span></p>\r\n<h2 id=\"先添加依赖\" style=\"margin: 8px 0px 16px; padding: 0px; box-sizing: border-box; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun; line-height: 32px; color: rgb(79, 79, 79); font-size: 24px; white-space: normal;\">\r\n	<a name=\"t0\" style=\"box-sizing: border-box; color: rgb(12, 137, 207);\" target=\"_blank\"></a>先添加依赖</h2>','来源','2,3,','1'),('10','文章内容内容内容内容','来源','1,2,3','1'),('11','文章内容内容内容内容','来源','1,2,3','1'),('12','文章内容内容内容内容','来源','1,2,3','1'),('13','文章内容内容内容内容','来源','1,2,3','1'),('14','文章内容内容内容内容','来源','1,2,3','1'),('15','文章内容内容内容内容','来源','1,2,3','1'),('16','文章内容内容内容内容','来源','1,2,3','1'),('17','文章内容内容内容内容','来源','1,2,3','1'),('18','文章内容内容内容内容','来源','1,2,3','1'),('19','文章内容内容内容内容','来源','1,2,3','1'),('2','文章内容内容内容内容','来源','1,2,3','1'),('20','文章内容内容内容内容','来源','1,2,3','1'),('21','文章内容内容内容内容','来源','1,2,3','1'),('22','文章内容内容内容内容','来源','1,2,3','1'),('23','文章内容内容内容内容','来源','1,2,3','1'),('24','文章内容内容内容内容','来源','1,2,3','1'),('25','文章内容内容内容内容','来源','1,2,3','1'),('26','文章内容内容内容内容','来源','1,2,3','1'),('27','文章内容内容内容内容','来源','1,2,3','1'),('28','文章内容内容内容内容','来源','1,2,3','1'),('29','文章内容内容内容内容','来源','1,2,3','1'),('3','文章内容内容内容内容','来源','1,2,3','1'),('30','文章内容内容内容内容','来源','1,2,3','1'),('31','文章内容内容内容内容','来源','1,2,3','1'),('32','文章内容内容内容内容','来源','1,2,3','1'),('33','文章内容内容内容内容','来源','1,2,3','1'),('34','文章内容内容内容内容','来源','1,2,3','1'),('35','文章内容内容内容内容','来源','1,2,3','1'),('36','文章内容内容内容内容','来源','1,2,3','1'),('37','文章内容内容内容内容','来源','1,2,3','1'),('38','文章内容内容内容内容','来源','1,2,3','1'),('39','文章内容内容内容内容','来源','1,2,3','1'),('4','文章内容内容内容内容','来源','1,2,3','1'),('40','文章内容内容内容内容','来源','1,2,3','1'),('41','文章内容内容内容内容','来源','1,2,3','1'),('42','文章内容内容内容内容','来源','1,2,3','1'),('43','文章内容内容内容内容','来源','1,2,3','1'),('44','文章内容内容内容内容','来源','1,2,3','1'),('45','文章内容内容内容内容','来源','1,2,3','1'),('46','文章内容内容内容内容','来源','1,2,3','1'),('47','文章内容内容内容内容','来源','1,2,3','1'),('48','文章内容内容内容内容','来源','1,2,3','1'),('49','文章内容内容内容内容','来源','1,2,3','1'),('5','文章内容内容内容内容','来源','1,2,3','1'),('50','文章内容内容内容内容','来源','1,2,3','1'),('51','文章内容内容内容内容','来源','1,2,3','1'),('52','文章内容内容内容内容','来源','1,2,3','1'),('53','文章内容内容内容内容','来源','1,2,3','1'),('6','文章内容内容内容内容','来源','1,2,3','1'),('7','文章内容内容内容内容','来源','1,2,3','1'),('8','文章内容内容内容内容','来源','1,2,3','1'),('9','文章内容内容内容内容','来源','1,2,3','1');

/*Table structure for table `cms_link` */

DROP TABLE IF EXISTS `cms_link`;

CREATE TABLE `cms_link` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `category_id` varchar(64) NOT NULL COMMENT '栏目编号',
  `title` varchar(255) NOT NULL COMMENT '链接名称',
  `color` varchar(50) DEFAULT NULL COMMENT '标题颜色',
  `image` varchar(255) DEFAULT NULL COMMENT '链接图片',
  `href` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `weight` int(11) DEFAULT '0' COMMENT '权重，越大越靠前',
  `weight_date` datetime DEFAULT NULL COMMENT '权重期限',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_link_category_id` (`category_id`),
  KEY `cms_link_title` (`title`),
  KEY `cms_link_del_flag` (`del_flag`),
  KEY `cms_link_weight` (`weight`),
  KEY `cms_link_create_by` (`create_by`),
  KEY `cms_link_update_date` (`update_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='友情链接';

/*Data for the table `cms_link` */

insert  into `cms_link`(`id`,`category_id`,`title`,`color`,`image`,`href`,`weight`,`weight_date`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','19','JeeSite',NULL,NULL,'http://thinkgem.github.com/jeesite',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','22','58同城',NULL,NULL,'http://www.58.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','23','视频大全',NULL,NULL,'http://v.360.cn/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','23','凤凰网',NULL,NULL,'http://www.ifeng.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','19','ThinkGem',NULL,NULL,'http://thinkgem.iteye.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','19','百度一下',NULL,NULL,'http://www.baidu.com',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','19','谷歌搜索',NULL,NULL,'http://www.google.com',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','20','新浪网',NULL,NULL,'http://www.sina.com.cn',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','20','腾讯网',NULL,NULL,'http://www.qq.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('7','21','淘宝网',NULL,NULL,'http://www.taobao.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('8','21','新华网',NULL,NULL,'http://www.xinhuanet.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('9','22','赶集网',NULL,NULL,'http://www.ganji.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `cms_site` */

DROP TABLE IF EXISTS `cms_site`;

CREATE TABLE `cms_site` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(100) NOT NULL COMMENT '站点名称',
  `title` varchar(100) NOT NULL COMMENT '站点标题',
  `logo` varchar(255) DEFAULT NULL COMMENT '站点Logo',
  `domain` varchar(255) DEFAULT NULL COMMENT '站点域名',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `theme` varchar(255) DEFAULT 'default' COMMENT '主题',
  `copyright` text COMMENT '版权信息',
  `custom_index_view` varchar(255) DEFAULT NULL COMMENT '自定义站点首页视图',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_site_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站点表';

/*Data for the table `cms_site` */

insert  into `cms_site`(`id`,`name`,`title`,`logo`,`domain`,`description`,`keywords`,`theme`,`copyright`,`custom_index_view`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','默认站点','JeeSite Web',NULL,NULL,'JeeSite','JeeSite','basic','Copyright &copy; 2012-2013 <a href=\'http://thinkgem.iteye.com\' target=\'_blank\'>ThinkGem</a> - Powered By <a href=\'https://github.com/thinkgem/jeesite\' target=\'_blank\'>JeeSite</a> V1.0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','子站点测试','JeeSite Subsite',NULL,NULL,'JeeSite subsite','JeeSite subsite','basic','Copyright &copy; 2012-2013 <a href=\'http://thinkgem.iteye.com\' target=\'_blank\'>ThinkGem</a> - Powered By <a href=\'https://github.com/thinkgem/jeesite\' target=\'_blank\'>JeeSite</a> V1.0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `oa_notify` */

DROP TABLE IF EXISTS `oa_notify`;

CREATE TABLE `oa_notify` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT NULL COMMENT '类型',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `content` varchar(2000) DEFAULT NULL COMMENT '内容',
  `files` varchar(2000) DEFAULT NULL COMMENT '附件',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `oa_notify_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知通告';

/*Data for the table `oa_notify` */

insert  into `oa_notify`(`id`,`type`,`title`,`content`,`files`,`status`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('d953377b907b4caeb956509b6b23278c','2','好吧','速度快建安费\r\n卡三等奖发\r\n卡三等奖','','1','1','2018-03-03 11:19:28','1','2018-03-03 11:19:48',NULL,'0'),('f468177e62144f2989cace097aa63a5c','1','今天要开会','迷你改天必须来。\r\n快点结束吧。','','1','1','2018-03-03 09:56:00','1','2018-03-03 09:56:00',NULL,'0');

/*Table structure for table `oa_notify_record` */

DROP TABLE IF EXISTS `oa_notify_record`;

CREATE TABLE `oa_notify_record` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `oa_notify_id` varchar(64) DEFAULT NULL COMMENT '通知通告ID',
  `user_id` varchar(64) DEFAULT NULL COMMENT '接受人',
  `read_flag` char(1) DEFAULT '0' COMMENT '阅读标记',
  `read_date` date DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`),
  KEY `oa_notify_record_notify_id` (`oa_notify_id`),
  KEY `oa_notify_record_user_id` (`user_id`),
  KEY `oa_notify_record_read_flag` (`read_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知通告发送记录';

/*Data for the table `oa_notify_record` */

insert  into `oa_notify_record`(`id`,`oa_notify_id`,`user_id`,`read_flag`,`read_date`) values ('059f4b68c5ee4902b1c739ca4ac9a0b6','f468177e62144f2989cace097aa63a5c','9','0',NULL),('06aace7c3783456e8561700f3ed6e4eb','f468177e62144f2989cace097aa63a5c','10','0',NULL),('0fc08b2f69b744c1ad9415b371eb1922','d953377b907b4caeb956509b6b23278c','6','0',NULL),('10c5d97cfc624ffbba0ec399353be1c3','f468177e62144f2989cace097aa63a5c','11','0',NULL),('2e7c30554d8b47379147507a17d1b3d5','d953377b907b4caeb956509b6b23278c','13','0',NULL),('2eef72896f4c40b3b52c5204975c3112','f468177e62144f2989cace097aa63a5c','13','0',NULL),('56fc50cd25a04ed5a74660e3283cd5cf','d953377b907b4caeb956509b6b23278c','5','0',NULL),('6c33207612bf4ada92801369b6c07dbb','d953377b907b4caeb956509b6b23278c','9','0',NULL),('77008f0dbdf042c98b6c1d038dbe6f3a','f468177e62144f2989cace097aa63a5c','4','0',NULL),('78c5a481afca4d979933cd0fbda374f8','f468177e62144f2989cace097aa63a5c','2','0',NULL),('79848b62312d488fba1872005bfff8a8','f468177e62144f2989cace097aa63a5c','3','0',NULL),('7c9a8152e8c141aa8ba305a9a64458e6','d953377b907b4caeb956509b6b23278c','10','0',NULL),('80741bf482a2493e95e2dfc5994512ed','f468177e62144f2989cace097aa63a5c','12','0',NULL),('89294e0dbb204f7284bcb8c2c71ef7b4','d953377b907b4caeb956509b6b23278c','12','0',NULL),('8edd88336e54420cbe95c94b5fa43920','f468177e62144f2989cace097aa63a5c','6','0',NULL),('94a1378fd70c4055a1acbfa1e4a3aa0f','d953377b907b4caeb956509b6b23278c','1','1','2018-03-03'),('acd7af1cbfef4971a1855d89b310b3d4','f468177e62144f2989cace097aa63a5c','8','0',NULL),('b2b70d0eefbe4ed9b4346a15e47794a6','f468177e62144f2989cace097aa63a5c','5','0',NULL),('b3d90fa81a1e49fea79a0e2dfc7c5a51','f468177e62144f2989cace097aa63a5c','7','0',NULL),('b6c4975eee014d0eada97cf4020a2357','d953377b907b4caeb956509b6b23278c','4','0',NULL),('b7e682e8174b43939f0a48be7f27511f','d953377b907b4caeb956509b6b23278c','8','0',NULL),('bd7946bf2ec84e0a93b85518827e1fca','d953377b907b4caeb956509b6b23278c','2','0',NULL),('c21a9dcd327746e780b5628c1c29a11d','d953377b907b4caeb956509b6b23278c','3','0',NULL),('db3b8fde7bd449e5ae097417da901581','f468177e62144f2989cace097aa63a5c','1','1','2018-03-03'),('e135ff9dfbf64a66985cc2cfab091b93','d953377b907b4caeb956509b6b23278c','7','0',NULL),('e40846456ed74480831d1e0448b1284a','d953377b907b4caeb956509b6b23278c','11','0',NULL);

/*Table structure for table `oa_test_audit` */

DROP TABLE IF EXISTS `oa_test_audit`;

CREATE TABLE `oa_test_audit` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `PROC_INS_ID` varchar(64) DEFAULT NULL COMMENT '流程实例ID',
  `USER_ID` varchar(64) DEFAULT NULL COMMENT '变动用户',
  `OFFICE_ID` varchar(64) DEFAULT NULL COMMENT '归属部门',
  `POST` varchar(255) DEFAULT NULL COMMENT '岗位',
  `AGE` char(1) DEFAULT NULL COMMENT '性别',
  `EDU` varchar(255) DEFAULT NULL COMMENT '学历',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '调整原因',
  `OLDA` varchar(255) DEFAULT NULL COMMENT '现行标准 薪酬档级',
  `OLDB` varchar(255) DEFAULT NULL COMMENT '现行标准 月工资额',
  `OLDC` varchar(255) DEFAULT NULL COMMENT '现行标准 年薪总额',
  `NEWA` varchar(255) DEFAULT NULL COMMENT '调整后标准 薪酬档级',
  `NEWB` varchar(255) DEFAULT NULL COMMENT '调整后标准 月工资额',
  `NEWC` varchar(255) DEFAULT NULL COMMENT '调整后标准 年薪总额',
  `ADD_NUM` varchar(255) DEFAULT NULL COMMENT '月增资',
  `EXE_DATE` varchar(255) DEFAULT NULL COMMENT '执行时间',
  `HR_TEXT` varchar(255) DEFAULT NULL COMMENT '人力资源部门意见',
  `LEAD_TEXT` varchar(255) DEFAULT NULL COMMENT '分管领导意见',
  `MAIN_LEAD_TEXT` varchar(255) DEFAULT NULL COMMENT '集团主要领导意见',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `OA_TEST_AUDIT_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='审批流程测试表';

/*Data for the table `oa_test_audit` */

/*Table structure for table `sequence_define` */

DROP TABLE IF EXISTS `sequence_define`;

CREATE TABLE `sequence_define` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `class_name` varchar(64) NOT NULL COMMENT '类名',
  `method_name` varchar(64) NOT NULL COMMENT '方法名',
  `ann_express` varchar(64) NOT NULL COMMENT '注解上默认的表达式，只读',
  `custom_express` varchar(64) NOT NULL COMMENT '自定义的表达式',
  `ann_describe` varchar(64) NOT NULL COMMENT '编号描述，只读',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sequence_define_class_method` (`class_name`,`method_name`),
  UNIQUE KEY `sequence_define_ann_express` (`ann_express`),
  UNIQUE KEY `sequence_define_custom_express` (`custom_express`),
  KEY `sequence_define_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='序列表';

/*Data for the table `sequence_define` */

/*Table structure for table `sys_dict` */

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `default_record` char(1) NOT NULL DEFAULT '0' COMMENT '系统记录，不可删除，值不可修改',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `sys_dict` */

insert  into `sys_dict`(`id`,`value`,`label`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`,`default_record`) values ('1','0','正常','del_flag','删除标记','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('10','yellow','黄色','color','颜色值','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('100','java.util.Date','Date','gen_java_type','Java类型\0\0','50','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('101','com.thinkgem.jeesite.modules.sys.entity.User','User','gen_java_type','Java类型\0\0','60','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('102','com.thinkgem.jeesite.modules.sys.entity.Office','Office','gen_java_type','Java类型\0\0','70','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('103','com.thinkgem.jeesite.modules.sys.entity.Area','Area','gen_java_type','Java类型\0\0','80','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('104','Custom','Custom','gen_java_type','Java类型\0\0','90','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('105','1','会议通告\0\0\0\0','oa_notify_type','通知通告类型','10','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0','1'),('106','2','奖惩通告\0\0\0\0','oa_notify_type','通知通告类型','20','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0','1'),('107','3','活动通告\0\0\0\0','oa_notify_type','通知通告类型','30','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0','1'),('108','0','草稿','oa_notify_status','通知通告状态','10','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0','1'),('109','1','发布','oa_notify_status','通知通告状态','20','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0','1'),('11','orange','橙色','color','颜色值','50','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('110','0','未读','oa_notify_read','通知通告状态','10','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0','1'),('110eda8532bd44c1b1c55e380134eb41','40','初检合格可制证','examination_record_status','初检合格可制证','5','0','1','2018-04-14 17:59:27','1','2018-04-20 12:47:09','','0','1'),('111','1','已读','oa_notify_read','通知通告状态','20','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0','1'),('12','default','默认主题','theme','主题方案','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('13','cerulean','天蓝主题','theme','主题方案','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('14','readable','橙色主题','theme','主题方案','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('15','united','红色主题','theme','主题方案','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('16','flat','Flat主题','theme','主题方案','60','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('17','1','国家','sys_area_type','区域类型','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('18','2','省份、直辖市','sys_area_type','区域类型','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('19','3','地市','sys_area_type','区域类型','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('1f1bb10d0c484586804905fe6e5df940','30','复检不合格','examination_record_status','复检不合格','4','0','1','2018-04-14 17:59:03','1','2018-04-20 12:49:55','','0','1'),('2','1','删除','del_flag','删除标记','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('20','4','区县','sys_area_type','区域类型','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('21','1','公司','sys_office_type','机构类型','60','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('22','2','部门','sys_office_type','机构类型','70','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('23','3','小组','sys_office_type','机构类型','80','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('24','4','其它','sys_office_type','机构类型','90','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('25','1','综合部','sys_office_common','快捷通用部门','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('26','2','开发部','sys_office_common','快捷通用部门','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('27','3','人力部','sys_office_common','快捷通用部门','50','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('28','1','一级','sys_office_grade','机构等级','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('29','2','二级','sys_office_grade','机构等级','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('3','1','显示','show_hide','显示/隐藏','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('30','3','三级','sys_office_grade','机构等级','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('31','4','四级','sys_office_grade','机构等级','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('32','1','所有数据','sys_data_scope','数据范围','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('33','2','所在公司及以下数据','sys_data_scope','数据范围','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('34','3','所在公司数据','sys_data_scope','数据范围','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('35','4','所在部门及以下数据','sys_data_scope','数据范围','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('36','5','所在部门数据','sys_data_scope','数据范围','50','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('37','8','仅本人数据','sys_data_scope','数据范围','90','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('38','9','按明细设置','sys_data_scope','数据范围','100','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('39','1','系统管理','sys_user_type','用户类型','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('4','0','隐藏','show_hide','显示/隐藏','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('40','2','部门经理','sys_user_type','用户类型','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('41','3','普通用户','sys_user_type','用户类型','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('42','basic','基础主题','cms_theme','站点主题','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('43','blue','蓝色主题','cms_theme','站点主题','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1','1'),('44','red','红色主题','cms_theme','站点主题','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1','1'),('45','article','文章模型','cms_module','栏目模型','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('46','picture','图片模型','cms_module','栏目模型','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1','1'),('47','download','下载模型','cms_module','栏目模型','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1','1'),('48','link','链接模型','cms_module','栏目模型','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('49','special','专题模型','cms_module','栏目模型','50','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1','1'),('5','1','是','yes_no','是/否','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('50','0','默认展现方式','cms_show_modes','展现方式','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('5048f50a293e4218b1988e953d7e4aa7','20','初检不合格','examination_record_status','体检状态','3','0','1','2018-03-13 11:24:35','1','2018-04-20 12:45:47','','0','1'),('51','1','首栏目内容列表','cms_show_modes','展现方式','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('52','2','栏目第一条内容','cms_show_modes','展现方式','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('53','0','发布','cms_del_flag','内容状态','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('54','1','删除','cms_del_flag','内容状态','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('55','2','审核','cms_del_flag','内容状态','15','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('56','1','首页焦点图','cms_posid','推荐位','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('57','2','栏目页文章推荐','cms_posid','推荐位','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('57849b0370ee4d4589dc3b34da97de15','50','已制证','examination_record_status','已制证','10','0','1','2018-04-14 17:59:43','1','2018-04-14 17:59:43','','0','1'),('58','1','咨询','cms_guestbook','留言板分类','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('59','2','建议','cms_guestbook','留言板分类','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('6','0','否','yes_no','是/否','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('60','3','投诉','cms_guestbook','留言板分类','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('61','4','其它','cms_guestbook','留言板分类','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('62','1','公休','oa_leave_type','请假类型','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('63','2','病假','oa_leave_type','请假类型','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('64','3','事假','oa_leave_type','请假类型','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('65','4','调休','oa_leave_type','请假类型','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('66','5','婚假','oa_leave_type','请假类型','60','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('67','1','接入日志','sys_log_type','日志类型','30','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0','1'),('68','2','异常日志','sys_log_type','日志类型','40','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0','1'),('69','leave','请假流程','act_type','流程类型','10','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0','1'),('6e7995624b0c49f584c29f23afe9e9db','10','未体检完','examination_record_status','体检状态','2','0','1','2018-03-13 11:24:17','1','2018-04-14 17:58:14','','0','1'),('7','red','红色','color','颜色值','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('70','test_audit','审批测试流程','act_type','流程类型','20','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0','1'),('71','1','分类1','act_category','流程分类','10','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0','1'),('71e164665d834b40a7b53c8ca3be7ac3','45','复检合格可制卡','examination_record_status','复检合格可制证','6','0','1','2018-04-20 12:46:44','1','2018-04-20 12:47:22','','0','1'),('72','2','分类2','act_category','流程分类','20','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0','1'),('73','crud','增删改查','gen_category','代码生成分类','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('74','crud_many','增删改查（包含从表）','gen_category','代码生成分类','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('75','tree','树结构','gen_category','代码生成分类','30','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('76','=','=','gen_query_type','查询方式','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('77','!=','!=','gen_query_type','查询方式','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('78','&gt;','&gt;','gen_query_type','查询方式','30','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('79','&lt;','&lt;','gen_query_type','查询方式','40','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('8','green','绿色','color','颜色值','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('80','between','Between','gen_query_type','查询方式','50','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('81','like','Like','gen_query_type','查询方式','60','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('82','left_like','Left Like','gen_query_type','查询方式','70','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('83','right_like','Right Like','gen_query_type','查询方式','80','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('84','input','文本框','gen_show_type','字段生成方案','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('85','textarea','文本域','gen_show_type','字段生成方案','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('86','select','下拉框','gen_show_type','字段生成方案','30','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('87','checkbox','复选框','gen_show_type','字段生成方案','40','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('88','radiobox','单选框','gen_show_type','字段生成方案','50','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('89','dateselect','日期选择','gen_show_type','字段生成方案','60','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('9','blue','蓝色','color','颜色值','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('90','userselect','人员选择\0','gen_show_type','字段生成方案','70','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('91','officeselect','部门选择','gen_show_type','字段生成方案','80','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('92','areaselect','区域选择','gen_show_type','字段生成方案','90','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('93','String','String','gen_java_type','Java类型','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('94','Long','Long','gen_java_type','Java类型','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('95','dao','仅持久层','gen_category','代码生成分类\0\0\0\0\0\0','40','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('96','1','男','sex','性别','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'0','1'),('97','2','女','sex','性别','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'0','1'),('98','Integer','Integer','gen_java_type','Java类型\0\0','30','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('99','Double','Double','gen_java_type','Java类型\0\0','40','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('f24ac6e8515f42b3855bfcb463956b49','0','未体检','examination_record_status','体检状态','1','0','1','2018-04-18 20:09:11','1','2018-04-18 20:09:39','','0','1'),('f92ccb9da1a24f70ad77f95364a1252d','0','未体检','examination_record_status','体检状态','1','0','1','2018-03-13 11:23:48','1','2018-04-14 17:57:19','','1','1');

/*Table structure for table `sys_mdict` */

DROP TABLE IF EXISTS `sys_mdict`;

CREATE TABLE `sys_mdict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_mdict_parent_id` (`parent_id`),
  KEY `sys_mdict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='多级字典表';

/*Data for the table `sys_mdict` */

/*Table structure for table `sys_office` */

DROP TABLE IF EXISTS `sys_office`;

CREATE TABLE `sys_office` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `area_id` varchar(64) NOT NULL COMMENT '归属区域',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) NOT NULL COMMENT '机构类型',
  `grade` char(1) NOT NULL COMMENT '机构等级',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) DEFAULT NULL COMMENT '传真',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `USEABLE` varchar(64) DEFAULT NULL COMMENT '是否启用',
  `PRIMARY_PERSON` varchar(64) DEFAULT NULL COMMENT '主负责人',
  `DEPUTY_PERSON` varchar(64) DEFAULT NULL COMMENT '副负责人',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `default_record` char(1) NOT NULL DEFAULT '0' COMMENT '是否缺省记录',
  PRIMARY KEY (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_del_flag` (`del_flag`),
  KEY `sys_office_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构表';

/*Data for the table `sys_office` */

insert  into `sys_office`(`id`,`parent_id`,`parent_ids`,`name`,`sort`,`area_id`,`code`,`type`,`grade`,`address`,`zip_code`,`master`,`phone`,`fax`,`email`,`USEABLE`,`PRIMARY_PERSON`,`DEPUTY_PERSON`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`,`default_record`) values ('22cdf43b3cf64706923b2bdc7bdd32ba','2fc3fe35040548bfa17281fe0e504fe7','0,2fc3fe35040548bfa17281fe0e504fe7,','体检中心','30','ff194b1d2f404810a45001f836a6348d','002','1','2','','','','','','','1','','','1','2018-03-07 17:12:07','1','2018-03-07 17:15:20','','0','1'),('2fc3fe35040548bfa17281fe0e504fe7','0','0,','卫生保健管理系统','30','8cc21c3cd6564faca50bafb92424926b','','1','1','','','','','','','1','','','1','2018-03-07 17:09:51','1','2018-03-07 17:13:56','','0','1'),('3df93034ae954ec8b0df054c33a1c561','f2d694c5e8544169a129a5354c8d4a7a','0,2fc3fe35040548bfa17281fe0e504fe7,22cdf43b3cf64706923b2bdc7bdd32ba,f2d694c5e8544169a129a5354c8d4a7a,','体检部','30','ff194b1d2f404810a45001f836a6348d','002001001','2','2','','','','','','','1','','','1','2018-03-07 17:20:09','1','2018-03-07 17:20:09','','0','0'),('f2d694c5e8544169a129a5354c8d4a7a','22cdf43b3cf64706923b2bdc7bdd32ba','0,2fc3fe35040548bfa17281fe0e504fe7,22cdf43b3cf64706923b2bdc7bdd32ba,','长城体检中心','30','ff194b1d2f404810a45001f836a6348d','002001','1','3','','','','','','','1','','','1','2018-03-07 17:13:02','1','2018-03-07 17:13:02','','0','0');

/*Table structure for table `sys_role_office` */

DROP TABLE IF EXISTS `sys_role_office`;

CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `office_id` varchar(64) NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-机构';

/*Data for the table `sys_role_office` */

insert  into `sys_role_office`(`role_id`,`office_id`) values ('7','10'),('7','11'),('7','12'),('7','13'),('7','14'),('7','15'),('7','16'),('7','17'),('7','18'),('7','19'),('7','20'),('7','21'),('7','22'),('7','23'),('7','24'),('7','25'),('7','26'),('7','7'),('7','8'),('7','9');

/*Table structure for table `test_data_child` */

DROP TABLE IF EXISTS `test_data_child`;

CREATE TABLE `test_data_child` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `test_data_main_id` varchar(64) DEFAULT NULL COMMENT '业务主表ID',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_child_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务数据子表';

/*Data for the table `test_data_child` */

insert  into `test_data_child`(`id`,`test_data_main_id`,`name`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('8bfc4d20bdd04c0ba1f7acff89de2d65','ddd601f39f004a2e8b6bb672bc6af17b','222','1','2018-03-12 14:17:33','1','2018-03-12 14:17:33','222','0'),('d99738b79c7e4f98ac7dbafefd368b0c','ddd601f39f004a2e8b6bb672bc6af17b','11','1','2018-03-12 14:17:33','1','2018-03-12 14:17:33','111','0');

/*Table structure for table `test_data_main` */

DROP TABLE IF EXISTS `test_data_main`;

CREATE TABLE `test_data_main` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `user_id` varchar(64) DEFAULT NULL COMMENT '归属用户',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属部门',
  `area_id` varchar(64) DEFAULT NULL COMMENT '归属区域',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `sex` char(1) DEFAULT NULL COMMENT '性别',
  `in_date` date DEFAULT NULL COMMENT '加入日期',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_main_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务数据表';

/*Data for the table `test_data_main` */

insert  into `test_data_main`(`id`,`user_id`,`office_id`,`area_id`,`name`,`sex`,`in_date`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('ddd601f39f004a2e8b6bb672bc6af17b','','','','test','',NULL,'1','2018-03-12 14:17:32','1','2018-03-12 14:17:32','','0');

/* Function  structure for function  `gen_seq_number` */

/*!50003 DROP FUNCTION IF EXISTS `gen_seq_number` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`cuipy`@`%` FUNCTION `gen_seq_number`(keyCode varchar(32),addCount int) RETURNS int(11)
BEGIN
  declare val int;
  declare rowCount int;
  
  
  if keyCode is null or length(keyCode)>32 then
    SIGNAL SQLSTATE 'HY611' SET MESSAGE_TEXT = 'keyCode不能为空，且最大为32位字符串';
  end if;
  
  select count(*) into rowCount from gen_seq_number where key_code=keyCode;
  
  if rowCount=0 then
    insert into gen_seq_number (noid,key_code,curr_val)
    values(replace(uuid(),'-',''),keyCode,0);
  end if;
  
  if addCount>0 then
	update gen_seq_number set curr_val=curr_val+addCount where key_code=keyCode ;
  end if;
  
  select curr_val into val from gen_seq_number where key_code=keyCode limit 1;
  
  return val;

end */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
