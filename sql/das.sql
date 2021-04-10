/*
 Navicat Premium Data Transfer

 Source Server         : hh
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : das

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 24/03/2021 15:00:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_admin
-- ----------------------------
DROP TABLE IF EXISTS `tbl_admin`;
CREATE TABLE `tbl_admin`  (
  `admin_ID` int(16) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `admin_userName` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '管理员用户名',
  `admin_password` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '管理员密码',
  `admin_name` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '管理员姓名',
  `admin_sex` tinyint(1) NOT NULL COMMENT '管理员性别(男0女1)',
  `admin_tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '管理员电话',
  PRIMARY KEY (`admin_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '管理员表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_admin
-- ----------------------------
INSERT INTO `tbl_admin` VALUES (1, 'admin', '123456', '宿管1', 1, NULL);

-- ----------------------------
-- Table structure for tbl_dormitory
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dormitory`;
CREATE TABLE `tbl_dormitory`  (
  `dor_ID` int(2) NOT NULL AUTO_INCREMENT COMMENT '楼号',
  `dor_address` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '地址',
  `dor_sex` tinyint(1) NOT NULL COMMENT '性别',
  PRIMARY KEY (`dor_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_dormitory
-- ----------------------------
INSERT INTO `tbl_dormitory` VALUES (1, '一号楼', 1);
INSERT INTO `tbl_dormitory` VALUES (2, '二号楼', 1);
INSERT INTO `tbl_dormitory` VALUES (3, '三号楼', 0);
INSERT INTO `tbl_dormitory` VALUES (4, '四号楼', 0);
INSERT INTO `tbl_dormitory` VALUES (5, '五号楼', 0);
INSERT INTO `tbl_dormitory` VALUES (6, '六号楼', 1);
INSERT INTO `tbl_dormitory` VALUES (7, '七号楼', 0);
INSERT INTO `tbl_dormitory` VALUES (8, '八号楼', 0);
INSERT INTO `tbl_dormitory` VALUES (9, '九号楼', 0);
INSERT INTO `tbl_dormitory` VALUES (10, '十号楼', 0);
INSERT INTO `tbl_dormitory` VALUES (11, '十一号楼', 1);
INSERT INTO `tbl_dormitory` VALUES (12, '十二号楼', 0);
INSERT INTO `tbl_dormitory` VALUES (13, '十三号楼', 0);
INSERT INTO `tbl_dormitory` VALUES (14, '十四号楼', 0);
INSERT INTO `tbl_dormitory` VALUES (15, '十五号楼', 0);
INSERT INTO `tbl_dormitory` VALUES (16, '十六号楼', 0);

-- ----------------------------
-- Table structure for tbl_news
-- ----------------------------
DROP TABLE IF EXISTS `tbl_news`;
CREATE TABLE `tbl_news`  (
  `news_ID` int(10) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `news_push_ID` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '发布人ID',
  `news_title` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '公告标题',
  `news_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `news_date` date NOT NULL COMMENT '发布日期',
  PRIMARY KEY (`news_ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_news
-- ----------------------------
INSERT INTO `tbl_news` VALUES (4, '1', '突击检测', '3月2日', '2021-03-04');
INSERT INTO `tbl_news` VALUES (5, '1', '今天大扫除', '14号晚上检测', '2021-03-14');

-- ----------------------------
-- Table structure for tbl_room
-- ----------------------------
DROP TABLE IF EXISTS `tbl_room`;
CREATE TABLE `tbl_room`  (
  `dor_ID` tinyint(2) NOT NULL COMMENT '从属楼号',
  `room_ID` int(3) NOT NULL COMMENT '寝室号',
  `room_num` tinyint(1) NOT NULL COMMENT '居住人数',
  PRIMARY KEY (`dor_ID`, `room_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_room
-- ----------------------------
INSERT INTO `tbl_room` VALUES (1, 262, 6);
INSERT INTO `tbl_room` VALUES (1, 312, 6);
INSERT INTO `tbl_room` VALUES (2, 301, 6);
INSERT INTO `tbl_room` VALUES (6, 322, 6);
INSERT INTO `tbl_room` VALUES (6, 635, 6);

-- ----------------------------
-- Table structure for tbl_score
-- ----------------------------
DROP TABLE IF EXISTS `tbl_score`;
CREATE TABLE `tbl_score`  (
  `sco_stu_ID` int(10) NOT NULL,
  `sco_score` double(2, 1) NOT NULL COMMENT '成绩',
  `sco_tea_ID` char(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sco_dateTime` date NOT NULL,
  INDEX `sco_stu_ID`(`sco_stu_ID`) USING BTREE,
  INDEX `sco_tea_ID`(`sco_tea_ID`) USING BTREE,
  CONSTRAINT `sco_stu_ID` FOREIGN KEY (`sco_stu_ID`) REFERENCES `tbl_student` (`stu_ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `sco_tea_ID` FOREIGN KEY (`sco_tea_ID`) REFERENCES `tbl_teacher` (`tea_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_score
-- ----------------------------
INSERT INTO `tbl_score` VALUES (2020011201, 5.0, 't001', '2021-03-09');

-- ----------------------------
-- Table structure for tbl_stu_dor
-- ----------------------------
DROP TABLE IF EXISTS `tbl_stu_dor`;
CREATE TABLE `tbl_stu_dor`  (
  `stu_ID` int(10) NOT NULL,
  `dor_ID` int(2) NOT NULL,
  `room_ID` int(3) NOT NULL,
  PRIMARY KEY (`stu_ID`) USING BTREE,
  INDEX `stu_ID`(`stu_ID`) USING BTREE,
  INDEX `dor_ID`(`dor_ID`) USING BTREE,
  INDEX `room_ID`(`room_ID`) USING BTREE,
  INDEX `dor_ID_2`(`dor_ID`, `room_ID`) USING BTREE,
  CONSTRAINT `stu_id_dor` FOREIGN KEY (`stu_ID`) REFERENCES `tbl_student` (`stu_ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_stu_dor
-- ----------------------------
INSERT INTO `tbl_stu_dor` VALUES (2020011201, 1, 262);
INSERT INTO `tbl_stu_dor` VALUES (2021032001, 1, 312);

-- ----------------------------
-- Table structure for tbl_student
-- ----------------------------
DROP TABLE IF EXISTS `tbl_student`;
CREATE TABLE `tbl_student`  (
  `stu_ID` int(10) NOT NULL COMMENT '学生学号',
  `stu_userName` char(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `stu_password` char(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密码',
  `stu_sex` tinyint(1) NOT NULL COMMENT '性别(0男1女)',
  `stu_name` char(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '学生姓名',
  `stu_state` tinyint(3) NOT NULL COMMENT '学生状态(0退宿,1在校)',
  `stu_class` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '学生班级',
  PRIMARY KEY (`stu_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_student
-- ----------------------------
INSERT INTO `tbl_student` VALUES (2020011201, '2020011201', '123456', 0, 'cc', 1, '20030501');
INSERT INTO `tbl_student` VALUES (2021032001, '2021032001', '123456', 0, 'aa', 1, '20210320');

-- ----------------------------
-- Table structure for tbl_teacher
-- ----------------------------
DROP TABLE IF EXISTS `tbl_teacher`;
CREATE TABLE `tbl_teacher`  (
  `tea_ID` char(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '教师ID',
  `tea_userName` char(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '教师用户名',
  `tea_password` char(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '教师密码',
  `tea_name` char(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '教师姓名',
  `tea_sex` tinyint(1) NOT NULL COMMENT '教师性别',
  `tea_tel` char(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '教师电话',
  PRIMARY KEY (`tea_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_teacher
-- ----------------------------
INSERT INTO `tbl_teacher` VALUES ('t001', 't001', '123456', '刘老师', 1, '');

-- ----------------------------
-- Table structure for tbl_update
-- ----------------------------
DROP TABLE IF EXISTS `tbl_update`;
CREATE TABLE `tbl_update`  (
  `upd_ID` int(16) NOT NULL AUTO_INCREMENT,
  `upd_type` tinyint(1) NOT NULL COMMENT '0调出，1调入',
  `stu_ID` int(10) NOT NULL,
  `stu_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `dor_ID` int(2) NOT NULL,
  `room_ID` int(3) NOT NULL,
  `upd_dateTime` date NOT NULL,
  PRIMARY KEY (`upd_ID`) USING BTREE,
  INDEX `stu_ID`(`stu_ID`) USING BTREE,
  CONSTRAINT `upd_stu` FOREIGN KEY (`stu_ID`) REFERENCES `tbl_student` (`stu_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_update
-- ----------------------------
INSERT INTO `tbl_update` VALUES (13, 0, 2020011201, 'cc', 1, 262, '2021-03-16');

SET FOREIGN_KEY_CHECKS = 1;
