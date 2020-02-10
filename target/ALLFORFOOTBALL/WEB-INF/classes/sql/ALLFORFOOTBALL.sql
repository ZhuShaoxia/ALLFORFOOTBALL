/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Version : 50717
 Source Host           : localhost
 Source Database       : ALLFORFOOTBALL

 Target Server Version : 50717
 File Encoding         : utf-8

 Date: 05/27/2018 23:29:03 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `tb_article`
-- ----------------------------
DROP TABLE IF EXISTS `tb_article`;
CREATE TABLE `tb_article` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `userId` int(20) DEFAULT NULL,
  `imgUrl` varchar(255) DEFAULT NULL,
  `articleTypeId` int(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `editorValue` mediumtext,
  `gmt_create` varchar(255) DEFAULT NULL,
  `gmt_modified` varchar(255) DEFAULT NULL,
  `isCarousel` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tb_article_type`
-- ----------------------------
DROP TABLE IF EXISTS `tb_article_type`;
CREATE TABLE `tb_article_type` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `gmt_create` varchar(255) DEFAULT NULL,
  `gmt_modified` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tb_club`
-- ----------------------------
DROP TABLE IF EXISTS `tb_club`;
CREATE TABLE `tb_club` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `otherName` varchar(255) DEFAULT NULL,
  `imgUrl` varchar(255) DEFAULT NULL,
  `established` varchar(255) DEFAULT NULL,
  `countryId` int(11) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `homeField` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gmt_create` varchar(255) DEFAULT NULL,
  `gmt_modified` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tb_comment`
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `articleId` int(20) DEFAULT NULL,
  `userId` int(20) DEFAULT NULL,
  `floor` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `replyFloor` int(11) DEFAULT NULL,
  `gmt_create` varchar(255) DEFAULT NULL,
  `gmt_modified` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tb_country`
-- ----------------------------
DROP TABLE IF EXISTS `tb_country`;
CREATE TABLE `tb_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `otherName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `imgUrl` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `established` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(11) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `homeField` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `gmt_create` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `gmt_modified` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `tb_honer`
-- ----------------------------
DROP TABLE IF EXISTS `tb_honer`;
CREATE TABLE `tb_honer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `countryId` int(11) DEFAULT NULL,
  `clubId` int(11) DEFAULT NULL,
  `playerId` int(11) DEFAULT NULL,
  `honerName` varchar(255) DEFAULT NULL,
  `honerTime` varchar(255) DEFAULT NULL,
  `honerType` int(11) DEFAULT NULL,
  `gmt_create` varchar(255) DEFAULT NULL,
  `gmt_modified` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tb_match_event`
-- ----------------------------
DROP TABLE IF EXISTS `tb_match_event`;
CREATE TABLE `tb_match_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(255) DEFAULT NULL,
  `imgUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tb_match_highlignts`
-- ----------------------------
DROP TABLE IF EXISTS `tb_match_highlignts`;
CREATE TABLE `tb_match_highlignts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matchInfoId` int(11) DEFAULT NULL,
  `editorValue` mediumtext,
  `gmt_create` varchar(255) DEFAULT NULL,
  `gmt_modified` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tb_match_info`
-- ----------------------------
DROP TABLE IF EXISTS `tb_match_info`;
CREATE TABLE `tb_match_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `homeClubId` int(11) DEFAULT NULL,
  `awayClubId` int(11) DEFAULT NULL,
  `matchDate` varchar(255) DEFAULT NULL,
  `matchTime` varchar(255) DEFAULT NULL,
  `matchTypeId` int(11) DEFAULT NULL,
  `matchTimes` int(11) DEFAULT NULL,
  `matchStateId` int(11) DEFAULT NULL,
  `matchResult` int(11) DEFAULT NULL,
  `matchScore` varchar(255) DEFAULT NULL,
  `isFocus` int(11) DEFAULT '0',
  `gmt_create` varchar(255) DEFAULT NULL,
  `gmt_modified` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tb_match_lineup`
-- ----------------------------
DROP TABLE IF EXISTS `tb_match_lineup`;
CREATE TABLE `tb_match_lineup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matchInfoId` int(11) DEFAULT NULL,
  `clubId` int(11) DEFAULT NULL,
  `playerType` int(11) DEFAULT NULL,
  `players` varchar(255) DEFAULT NULL,
  `gmt_create` varchar(255) DEFAULT NULL,
  `gmt_modified` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tb_match_process`
-- ----------------------------
DROP TABLE IF EXISTS `tb_match_process`;
CREATE TABLE `tb_match_process` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matchInfoId` int(11) DEFAULT NULL,
  `clubId` int(11) DEFAULT NULL,
  `playerId` int(11) DEFAULT NULL,
  `matchEventId` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `gmt_create` varchar(255) DEFAULT NULL,
  `gmt_modified` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tb_match_state`
-- ----------------------------
DROP TABLE IF EXISTS `tb_match_state`;
CREATE TABLE `tb_match_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tb_match_technical_statistics`
-- ----------------------------
DROP TABLE IF EXISTS `tb_match_technical_statistics`;
CREATE TABLE `tb_match_technical_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matchInfoId` int(11) DEFAULT NULL,
  `ballControlRate` int(11) DEFAULT NULL,
  `shooting` int(11) DEFAULT NULL,
  `shootZ` int(11) DEFAULT NULL,
  `plugging` int(11) DEFAULT NULL,
  `freeKick` int(11) DEFAULT NULL,
  `cornerKick` int(11) DEFAULT NULL,
  `offside` int(11) DEFAULT NULL,
  `substitution` int(11) DEFAULT NULL,
  `foul` int(11) DEFAULT NULL,
  `matchPlace` int(11) DEFAULT NULL,
  `gmt_create` varchar(255) DEFAULT NULL,
  `gmt_modified` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tb_match_type`
-- ----------------------------
DROP TABLE IF EXISTS `tb_match_type`;
CREATE TABLE `tb_match_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `matchNum` int(11) DEFAULT NULL,
  `clubNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tb_player`
-- ----------------------------
DROP TABLE IF EXISTS `tb_player`;
CREATE TABLE `tb_player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `otherName` varchar(255) DEFAULT NULL,
  `imgUrl` varchar(255) DEFAULT NULL,
  `clubId` int(11) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `positionId` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `usualFoot` int(11) DEFAULT '1',
  `power` int(11) DEFAULT NULL,
  `speed` int(11) DEFAULT NULL,
  `shooting` int(11) DEFAULT NULL,
  `pass` int(11) DEFAULT NULL,
  `dribbling` int(11) DEFAULT NULL,
  `defensive` int(11) DEFAULT NULL,
  `gmt_create` varchar(255) DEFAULT NULL,
  `gmt_modified` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tb_player_position`
-- ----------------------------
DROP TABLE IF EXISTS `tb_player_position`;
CREATE TABLE `tb_player_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tb_ranking`
-- ----------------------------
DROP TABLE IF EXISTS `tb_ranking`;
CREATE TABLE `tb_ranking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matchTypeId` int(11) DEFAULT NULL,
  `clubId` int(11) DEFAULT NULL,
  `matchTimes` int(11) DEFAULT NULL,
  `victory` int(11) DEFAULT '0',
  `draw` int(11) DEFAULT '0',
  `negative` int(11) DEFAULT '0',
  `goals` int(11) DEFAULT '0',
  `conceded` int(11) DEFAULT '0',
  `goalDifference` int(11) DEFAULT '0',
  `score` int(11) DEFAULT NULL,
  `season` int(11) DEFAULT NULL,
  `gmt_create` varchar(255) DEFAULT NULL,
  `gmt_modified` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(24) DEFAULT NULL,
  `role` int(1) DEFAULT '1',
  `imgUrl` varchar(255) DEFAULT '/img/head-img-icon.png',
  `sex` int(1) DEFAULT '1',
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `clubId` int(255) DEFAULT NULL,
  `otherClubName` varchar(255) DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `gmt_create` varchar(255) DEFAULT NULL,
  `gmt_modified` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
