/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : localhost:3306
 Source Schema         : news

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 10/06/2022 11:23:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `adminid` int(20) NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `adminname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `adminpwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名密码',
  PRIMARY KEY (`adminid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '123');

-- ----------------------------
-- Table structure for newsdetail
-- ----------------------------
DROP TABLE IF EXISTS `newsdetail`;
CREATE TABLE `newsdetail`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '新闻记录编号',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '新闻标题',
  `content` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '新闻内容',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者信息',
  `time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '新闻时间',
  `type` int(4) NOT NULL COMMENT '新闻类别',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of newsdetail
-- ----------------------------
INSERT INTO `newsdetail` VALUES (6, '凡人修仙传', '顿出红尘。。。。', 'hz', '2022-06-09', 1);
INSERT INTO `newsdetail` VALUES (8, '斗罗大陆', '撒花。。', 'hz', '2022-06-09', 1);
INSERT INTO `newsdetail` VALUES (12, 'java入门到转行', '哈哈哈哈哈哈哈', 'coder', '2022-06-09', 0);
INSERT INTO `newsdetail` VALUES (13, '广科考研喜报', '924niua\r\n', 'hz', '2022-06-09', 2);
INSERT INTO `newsdetail` VALUES (14, 'java入门到躺平', 'hahahhah', 'hz', '2022-06-09', 0);

SET FOREIGN_KEY_CHECKS = 1;
