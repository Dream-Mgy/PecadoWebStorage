SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Records of file_status
-- ----------------------------

-- ----------------------------
-- Table structure for `local_file`
-- ----------------------------
DROP TABLE IF EXISTS `local_file`;
CREATE TABLE `local_file` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `file_size` varchar(300) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

