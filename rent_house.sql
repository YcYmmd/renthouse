/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50641
Source Host           : localhost:3306
Source Database       : rent_house

Target Server Type    : MYSQL
Target Server Version : 50641
File Encoding         : 65001

Date: 2020-12-18 10:55:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_name` varchar(100) DEFAULT NULL COMMENT '用户姓名',
  `user_password` varchar(100) DEFAULT NULL COMMENT '用户密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'ycy123', 'ycyadmin');

-- ----------------------------
-- Table structure for t_collection
-- ----------------------------
DROP TABLE IF EXISTS `t_collection`;
CREATE TABLE `t_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) DEFAULT NULL COMMENT '收藏的用户的id',
  `house_id` int(11) DEFAULT NULL COMMENT '收藏的房子的id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_collection
-- ----------------------------
INSERT INTO `t_collection` VALUES ('2', '2', '10');
INSERT INTO `t_collection` VALUES ('3', '2', '11');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `comment_content` varchar(500) DEFAULT NULL COMMENT '评论内容',
  `user_id` int(11) DEFAULT NULL COMMENT '发送评论的用户的id',
  `house_id` int(11) DEFAULT NULL COMMENT '被评论的房屋的id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('3', '哈哈哈，评论', '2', '9');
INSERT INTO `t_comment` VALUES ('5', 'hahaha', '3', '9');
INSERT INTO `t_comment` VALUES ('6', '你好啊', '2', '10');

-- ----------------------------
-- Table structure for t_house
-- ----------------------------
DROP TABLE IF EXISTS `t_house`;
CREATE TABLE `t_house` (
  `h_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `house_desc` varchar(500) DEFAULT NULL COMMENT '房屋描述',
  `house_model` varchar(200) DEFAULT NULL COMMENT '几室几厅',
  `house_area` varchar(100) DEFAULT NULL COMMENT '房屋面积',
  `house_floor` varchar(100) DEFAULT NULL COMMENT '楼层',
  `house_type` varchar(100) DEFAULT NULL COMMENT '房屋类型',
  `house_address` varchar(200) DEFAULT NULL COMMENT '地址',
  `house_image` varchar(500) DEFAULT NULL COMMENT '图片介绍',
  `community_name` varchar(100) DEFAULT NULL COMMENT '小区名',
  `house_linkman` varchar(100) DEFAULT NULL COMMENT '联系人',
  `house_oriented` varchar(100) DEFAULT NULL COMMENT '房屋朝向',
  `house_details_img` varchar(500) DEFAULT NULL COMMENT '房屋详细图片',
  `publisher` varchar(100) DEFAULT NULL COMMENT '发布人',
  `publish_time` varchar(200) DEFAULT NULL COMMENT '发布时间',
  `house_price` int(20) NOT NULL COMMENT '房子的价格',
  `house_examine` int(11) DEFAULT '0' COMMENT '房屋是否审核通过',
  PRIMARY KEY (`h_id`,`house_price`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_house
-- ----------------------------
INSERT INTO `t_house` VALUES ('9', 'testTitle', '三室一厅', '100', '5楼', '合租', '江苏省南京市', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/07/439298546d1d41a0b011d22621234697IMG_20170618_141628.jpg', 'aaa小区', '111', '南北', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/04/126a7a2d8b45402c9a15e73f0572aca7IMG_20170618_151105.jpg:-:https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/04/f91cbdd5c9a74d4da8c1411053258a12IMG_20170618_151020.jpg:-:', '111', '2020-12-04 10:44:00', '1000', '1');
INSERT INTO `t_house` VALUES ('10', 'testPage1', '三室一厅', '100', '高层26楼', '合租', 'testPageAddress', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/08/fb3e1b1d5e9c4a9e80fefa6f73221dc1IMG_20171202_111442.jpg', 'aaa', 'bbb', '东西', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/08/7e622a602f10422d87c4dd91bb876a3aIMG_20170907_183412.jpg:-:', 'bbb', '2020-12-08 08:46:59', '1000', '1');
INSERT INTO `t_house` VALUES ('11', 'testPage2', '三室一厅', '100', '10楼', '整租', '江苏省南京市', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/08/fb3e1b1d5e9c4a9e80fefa6f73221dc1IMG_20171202_111442.jpg', 'aaa', 'bbb', '南北', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/08/7e622a602f10422d87c4dd91bb876a3aIMG_20170907_183412.jpg:-:', 'bbb', '2020-12-08 08:46:59', '1000', '1');
INSERT INTO `t_house` VALUES ('12', 'testPage2', '两室一厅', '100', '10楼', '整租', 'testAAA', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/07/439298546d1d41a0b011d22621234697IMG_20170618_141628.jpg', 'aaa小区', 'bbb', '南北', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/08/7e622a602f10422d87c4dd91bb876a3aIMG_20170907_183412.jpg:-:', 'bbb', '2020-12-08 08:46:59', '1000', '1');
INSERT INTO `t_house` VALUES ('13', 'testPage3', '两室一厅', '100', '10楼', '整租', 'testAAA', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/07/439298546d1d41a0b011d22621234697IMG_20170618_141628.jpg', 'aaa小区', 'bbb', '南北', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/08/7e622a602f10422d87c4dd91bb876a3aIMG_20170907_183412.jpg:-:', 'bbb', '2020-12-08 08:46:59', '1000', '1');
INSERT INTO `t_house` VALUES ('14', 'testPage4', '两室一厅', '100', '10楼', '整租', 'testAAA', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/07/439298546d1d41a0b011d22621234697IMG_20170618_141628.jpg', 'aaa小区', 'bbb', '南北', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/08/7e622a602f10422d87c4dd91bb876a3aIMG_20170907_183412.jpg:-:', 'bbb', '2020-12-08 08:46:59', '1000', '1');
INSERT INTO `t_house` VALUES ('15', 'testPage5', '两室一厅', '100', '10楼', '整租', 'testAAA', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/07/439298546d1d41a0b011d22621234697IMG_20170618_141628.jpg', 'aaa小区', 'bbb', '南北', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/08/7e622a602f10422d87c4dd91bb876a3aIMG_20170907_183412.jpg:-:', 'bbb', '2020-12-08 08:46:59', '1000', '1');
INSERT INTO `t_house` VALUES ('16', 'testPage6', '两室一厅', '100', '10楼', '整租', 'testAAA', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/07/439298546d1d41a0b011d22621234697IMG_20170618_141628.jpg', 'aaa小区', 'bbb', '南北', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/08/7e622a602f10422d87c4dd91bb876a3aIMG_20170907_183412.jpg:-:', 'bbb', '2020-12-08 08:46:59', '1000', '1');
INSERT INTO `t_house` VALUES ('17', 'testPage7', '两室一厅', '100', '10楼', '整租', 'testAAA', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/07/439298546d1d41a0b011d22621234697IMG_20170618_141628.jpg', 'aaa小区', 'bbb', '南北', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/08/7e622a602f10422d87c4dd91bb876a3aIMG_20170907_183412.jpg:-:', 'bbb', '2020-12-08 08:46:59', '1000', '1');
INSERT INTO `t_house` VALUES ('18', 'testPage8', '两室一厅', '100', '10楼', '整租', 'testAAA', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/07/439298546d1d41a0b011d22621234697IMG_20170618_141628.jpg', 'aaa小区', 'bbb', '南北', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/08/7e622a602f10422d87c4dd91bb876a3aIMG_20170907_183412.jpg:-:', 'bbb', '2020-12-08 08:46:59', '1000', '1');
INSERT INTO `t_house` VALUES ('19', 'testPage9', '两室一厅', '100', '10楼', '整租', 'testAAA', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/07/439298546d1d41a0b011d22621234697IMG_20170618_141628.jpg', 'aaa小区', 'bbb', '南北', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/08/7e622a602f10422d87c4dd91bb876a3aIMG_20170907_183412.jpg:-:', 'bbb', '2020-12-08 08:46:59', '1000', '1');
INSERT INTO `t_house` VALUES ('20', 'testPage10', '两室一厅', '100', '10楼', '整租', 'testAAA', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/07/439298546d1d41a0b011d22621234697IMG_20170618_141628.jpg', 'aaa小区', 'bbb', '南北', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/08/7e622a602f10422d87c4dd91bb876a3aIMG_20170907_183412.jpg:-:', 'bbb', '2020-12-08 08:46:59', '1000', '0');
INSERT INTO `t_house` VALUES ('21', 'testPage11', '两室一厅', '100', '10楼', '整租', 'testAAA', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/07/439298546d1d41a0b011d22621234697IMG_20170618_141628.jpg', 'aaa小区', 'bbb', '南北', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/08/7e622a602f10422d87c4dd91bb876a3aIMG_20170907_183412.jpg:-:', 'bbb', '2020-12-08 08:46:59', '1000', '0');

-- ----------------------------
-- Table structure for t_news
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) DEFAULT NULL COMMENT '新闻内容',
  `img` varchar(500) DEFAULT 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/10/timg.jfif' COMMENT '图片地址',
  `admin_id` int(11) DEFAULT NULL COMMENT '发帖管理员的id',
  `title` varchar(100) DEFAULT NULL COMMENT '新闻标题',
  `detail_imgs` varchar(500) DEFAULT '' COMMENT '详细图片',
  PRIMARY KEY (`n_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_news
-- ----------------------------
INSERT INTO `t_news` VALUES ('1', 'testNewsContent update two', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/f2fe8da2e02e4466aceb3958b33f1ee5d2c4280107e176d02a66e1a5ebe1a5a7c9637f36.jpg', '1', 'testNewsTitle', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/f2fe8da2e02e4466aceb3958b33f1ee5d2c4280107e176d02a66e1a5ebe1a5a7c9637f36.jpg');
INSERT INTO `t_news` VALUES ('2', '“人类探索太空的步伐永无止境。”\r\n\r\n习近平在祝贺探月工程嫦娥五号任务取得圆满成功的贺电中的这句话，豪情满怀，催人奋进！\r\n\r\n习近平在贺电中指出，嫦娥五号任务作为我国复杂度最高、技术跨度最大的航天系统工程，首次实现了我国地外天体采样返回。这是发挥新型举国体制优势攻坚克难取得的又一重大成就，标志着中国航天向前迈出的一大步，将为深化人类对月球成因和太阳系演化历史的科学认知作出贡献。\r\n\r\n2020年12月17日1时59分，嫦娥五号载“土”归来，返回器携带月球样品在内蒙古四子王旗预定区域安全着陆，探月工程嫦娥五号任务取得圆满成功。\r\n\r\n很多人问：为什么一定要坚持探月？\r\n\r\n答案是：因为梦想！\r\n\r\n', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/9ffad758d8bf416fa59a5c8a6d6ce5d63cbb65cc0c8987f0e390d87df273deba7fc1a489.jpg', '1', 'testTitle1', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/6b8f4080ddba4e3a9a1712dd52f010484ee8254fef8f963ce4e294122df0e5d47eb01fc6.jpg:-:https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/c32058c2c7324dcb8df7bdcdab214a0d3cbb65cc0c8987f0e390d87df273deba7fc1a489.jpg:-:');
INSERT INTO `t_news` VALUES ('3', 'content1', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/f2fe8da2e02e4466aceb3958b33f1ee5d2c4280107e176d02a66e1a5ebe1a5a7c9637f36.jpg', '1', 'title1', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/6b8f4080ddba4e3a9a1712dd52f010484ee8254fef8f963ce4e294122df0e5d47eb01fc6.jpg:-:https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/c32058c2c7324dcb8df7bdcdab214a0d3cbb65cc0c8987f0e390d87df273deba7fc1a489.jpg:-::');
INSERT INTO `t_news` VALUES ('4', 'content2', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/f2fe8da2e02e4466aceb3958b33f1ee5d2c4280107e176d02a66e1a5ebe1a5a7c9637f36.jpg', '1', 'title2', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/6b8f4080ddba4e3a9a1712dd52f010484ee8254fef8f963ce4e294122df0e5d47eb01fc6.jpg:-:https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/c32058c2c7324dcb8df7bdcdab214a0d3cbb65cc0c8987f0e390d87df273deba7fc1a489.jpg:-:');
INSERT INTO `t_news` VALUES ('5', 'content3', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/f2fe8da2e02e4466aceb3958b33f1ee5d2c4280107e176d02a66e1a5ebe1a5a7c9637f36.jpg', '1', 'title3', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/6b8f4080ddba4e3a9a1712dd52f010484ee8254fef8f963ce4e294122df0e5d47eb01fc6.jpg:-:https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/c32058c2c7324dcb8df7bdcdab214a0d3cbb65cc0c8987f0e390d87df273deba7fc1a489.jpg:-:');
INSERT INTO `t_news` VALUES ('6', 'content4', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/f2fe8da2e02e4466aceb3958b33f1ee5d2c4280107e176d02a66e1a5ebe1a5a7c9637f36.jpg', '1', 'title4', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/6b8f4080ddba4e3a9a1712dd52f010484ee8254fef8f963ce4e294122df0e5d47eb01fc6.jpg:-:https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/c32058c2c7324dcb8df7bdcdab214a0d3cbb65cc0c8987f0e390d87df273deba7fc1a489.jpg:-:');
INSERT INTO `t_news` VALUES ('7', 'content5', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/f2fe8da2e02e4466aceb3958b33f1ee5d2c4280107e176d02a66e1a5ebe1a5a7c9637f36.jpg', '1', 'title5', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/6b8f4080ddba4e3a9a1712dd52f010484ee8254fef8f963ce4e294122df0e5d47eb01fc6.jpg:-:https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/c32058c2c7324dcb8df7bdcdab214a0d3cbb65cc0c8987f0e390d87df273deba7fc1a489.jpg:-:');
INSERT INTO `t_news` VALUES ('8', 'content6', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/f2fe8da2e02e4466aceb3958b33f1ee5d2c4280107e176d02a66e1a5ebe1a5a7c9637f36.jpg', '1', 'title6', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/6b8f4080ddba4e3a9a1712dd52f010484ee8254fef8f963ce4e294122df0e5d47eb01fc6.jpg:-:https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/c32058c2c7324dcb8df7bdcdab214a0d3cbb65cc0c8987f0e390d87df273deba7fc1a489.jpg:-:');
INSERT INTO `t_news` VALUES ('9', 'content7', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/f2fe8da2e02e4466aceb3958b33f1ee5d2c4280107e176d02a66e1a5ebe1a5a7c9637f36.jpg', '1', 'title7', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/6b8f4080ddba4e3a9a1712dd52f010484ee8254fef8f963ce4e294122df0e5d47eb01fc6.jpg:-:https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/c32058c2c7324dcb8df7bdcdab214a0d3cbb65cc0c8987f0e390d87df273deba7fc1a489.jpg:-:');
INSERT INTO `t_news` VALUES ('10', 'content8', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/f2fe8da2e02e4466aceb3958b33f1ee5d2c4280107e176d02a66e1a5ebe1a5a7c9637f36.jpg', '1', 'title8', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/6b8f4080ddba4e3a9a1712dd52f010484ee8254fef8f963ce4e294122df0e5d47eb01fc6.jpg:-:https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/c32058c2c7324dcb8df7bdcdab214a0d3cbb65cc0c8987f0e390d87df273deba7fc1a489.jpg:-::');
INSERT INTO `t_news` VALUES ('11', 'content9', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/f2fe8da2e02e4466aceb3958b33f1ee5d2c4280107e176d02a66e1a5ebe1a5a7c9637f36.jpg', '1', 'title9', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/6b8f4080ddba4e3a9a1712dd52f010484ee8254fef8f963ce4e294122df0e5d47eb01fc6.jpg:-:https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/c32058c2c7324dcb8df7bdcdab214a0d3cbb65cc0c8987f0e390d87df273deba7fc1a489.jpg:-:');
INSERT INTO `t_news` VALUES ('12', 'content10', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/f2fe8da2e02e4466aceb3958b33f1ee5d2c4280107e176d02a66e1a5ebe1a5a7c9637f36.jpg', '1', 'title10', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/6b8f4080ddba4e3a9a1712dd52f010484ee8254fef8f963ce4e294122df0e5d47eb01fc6.jpg:-:https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/17/c32058c2c7324dcb8df7bdcdab214a0d3cbb65cc0c8987f0e390d87df273deba7fc1a489.jpg:-:');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `h_id` int(11) DEFAULT NULL COMMENT '房子的id',
  `u_id` int(11) DEFAULT NULL COMMENT '用户id',
  `order_time` varchar(200) DEFAULT NULL COMMENT '订单创建时间',
  `order_user` varchar(100) DEFAULT NULL COMMENT '创建人的名字',
  PRIMARY KEY (`o_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1', '3', '1', '2020-12-03 10:26:07', '15195959128');
INSERT INTO `t_order` VALUES ('5', '9', '2', '2020-12-11 09:31:05', '111');
INSERT INTO `t_order` VALUES ('6', '10', '2', '2020-12-11 09:34:22', '111');

-- ----------------------------
-- Table structure for t_users
-- ----------------------------
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `u_name` varchar(100) DEFAULT NULL COMMENT '用户名',
  `u_password` varchar(200) DEFAULT NULL COMMENT '用户密码',
  `u_nickname` varchar(100) DEFAULT NULL COMMENT '用户昵称',
  `u_phone_number` varchar(200) DEFAULT NULL COMMENT '用户电话号码',
  `u_avatar` varchar(500) DEFAULT 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/03/7974d093bcd94e28b3ca9f5bd467d87cIMG_20170617_201454.jpg' COMMENT '用户头像',
  `u_status` int(11) DEFAULT NULL COMMENT '是否被封号',
  `is_admin` int(11) DEFAULT '0' COMMENT '是否是管理员使用的前台页面',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_users
-- ----------------------------
INSERT INTO `t_users` VALUES ('1', 'bbb', 'ycy123', 'bbb', '15195959128', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/06/15025a8feea1488fad97135df745074dIMG_20170611_160113.jpg', '0', '0');
INSERT INTO `t_users` VALUES ('2', 'YcYMMD', 'ycyadmin', '111', '15195959128', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/10/4686eb08c982407aa83f54617f91d4d3IMG_20170907_183412.jpg', '0', '1');
INSERT INTO `t_users` VALUES ('3', 'test1', 'ycy123', 'test1', '15195959128', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/03/7974d093bcd94e28b3ca9f5bd467d87cIMG_20170617_201454.jpg', '0', '0');
INSERT INTO `t_users` VALUES ('4', 'test2', 'ycy123', 'test2', '15195959128', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/03/7974d093bcd94e28b3ca9f5bd467d87cIMG_20170617_201454.jpg', '0', '0');
INSERT INTO `t_users` VALUES ('5', 'test3', 'ycy123', 'test3', '15195959128', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/03/7974d093bcd94e28b3ca9f5bd467d87cIMG_20170617_201454.jpg', '1', '0');
INSERT INTO `t_users` VALUES ('6', 'test4', 'ycy123', 'test4', '15195959128', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/03/7974d093bcd94e28b3ca9f5bd467d87cIMG_20170617_201454.jpg', '0', '0');
INSERT INTO `t_users` VALUES ('7', 'test5', 'ycy123', 'test5', '15195959128', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/03/7974d093bcd94e28b3ca9f5bd467d87cIMG_20170617_201454.jpg', '0', '0');
INSERT INTO `t_users` VALUES ('8', 'test6', 'ycy123', 'test6', '15195959128', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/03/7974d093bcd94e28b3ca9f5bd467d87cIMG_20170617_201454.jpg', '0', '0');
INSERT INTO `t_users` VALUES ('9', 'test7', 'ycy123', 'test7', '15195959128', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/03/7974d093bcd94e28b3ca9f5bd467d87cIMG_20170617_201454.jpg', '0', '0');
INSERT INTO `t_users` VALUES ('10', 'test8', 'ycy123', 'test8', '15195959128', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/03/7974d093bcd94e28b3ca9f5bd467d87cIMG_20170617_201454.jpg', '0', '0');
INSERT INTO `t_users` VALUES ('11', 'test9', 'ycy123', 'test9', '15195959128', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/03/7974d093bcd94e28b3ca9f5bd467d87cIMG_20170617_201454.jpg', '0', '0');
INSERT INTO `t_users` VALUES ('12', 'test10', 'ycy123', 'test10', '15195959128', 'https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/03/7974d093bcd94e28b3ca9f5bd467d87cIMG_20170617_201454.jpg', '0', '0');
