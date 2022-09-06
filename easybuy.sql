

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car`  (
  `car_id` int(0) NOT NULL AUTO_INCREMENT,
  `car_pfilename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `car_pname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `car_quantity` int(0) NULL DEFAULT NULL,
  `car_pstock` int(0) NULL DEFAULT NULL,
  `car_pid` int(0) NULL DEFAULT NULL,
  `car_uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `car_valid` int(0) NULL DEFAULT NULL,
  `car_pprice` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`car_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES (28, 'images/product/0.jpg', '耳机', 4, 97, 1, '43', 1, 99.00);
INSERT INTO `car` VALUES (29, 'images/product/8.jpg', '饭盒aa', 2, 4, 2, '43', 1, 200.00);

-- ----------------------------
-- Table structure for easybuy_comment
-- ----------------------------
DROP TABLE IF EXISTS `easybuy_comment`;
CREATE TABLE `easybuy_comment`  (
  `EC_ID` int(0) NOT NULL AUTO_INCREMENT,
  `EC_REPLY` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EC_CONTENT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EC_CREATE_TIME` datetime(0) NOT NULL,
  `EC_REPLY_TIME` datetime(0) NULL DEFAULT NULL,
  `EC_NICK_ID` int(0) NOT NULL,
  `EC_NICK_NAME` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EC_PRODUCT_ID` int(0) NOT NULL,
  PRIMARY KEY (`EC_ID`) USING BTREE,
  INDEX `FK_USERID`(`EC_NICK_ID`) USING BTREE,
  INDEX `FK_PROID`(`EC_PRODUCT_ID`) USING BTREE,
  CONSTRAINT `FK_PROID` FOREIGN KEY (`EC_PRODUCT_ID`) REFERENCES `easybuy_product` (`EP_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_USERID` FOREIGN KEY (`EC_NICK_ID`) REFERENCES `easybuy_user` (`EU_USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 681 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of easybuy_comment
-- ----------------------------
INSERT INTO `easybuy_comment` VALUES (655, '货已发出，请注意收货时开箱检查货物是否有问题', '刚订了台IPod，很是期待啊', '2012-12-30 12:12:12', '2012-12-30 16:12:12', 14, '小白', 591);
INSERT INTO `easybuy_comment` VALUES (680, '一般在订单确认后的第3天发货', '佳能D50现在可以多长时间发货呢', '2013-06-02 14:05:32', '2013-06-02 20:05:32', 27, '小黑', 592);
INSERT INTO `easybuy_comment` VALUES (681, '谢谢留言', '商品收到，很满意。留言内容', '2015-12-08 08:49:44', '2015-12-08 08:52:01', 28, '小红', 592);

-- ----------------------------
-- Table structure for easybuy_news
-- ----------------------------
DROP TABLE IF EXISTS `easybuy_news`;
CREATE TABLE `easybuy_news`  (
  `EN_ID` int(0) NOT NULL AUTO_INCREMENT,
  `EN_TITLE` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EN_CONTENT` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EN_CREATE_TIME` datetime(0) NOT NULL,
  PRIMARY KEY (`EN_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 656 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of easybuy_news
-- ----------------------------
INSERT INTO `easybuy_news` VALUES (1, '最新酷睿笔记本', 'IBME系列全场促销中，最新酷睿双核处理器，保证CPU更高效的运转。', '2020-07-06 14:05:32');
INSERT INTO `easybuy_news` VALUES (2, '团购无忧', '团购无忧aaaaaaaaaaaa', '2013-08-02 14:05:32');
INSERT INTO `easybuy_news` VALUES (3, '会员特惠月开始了', '会员特惠月开始了adfsadfasd', '2013-10-02 14:05:32');
INSERT INTO `easybuy_news` VALUES (4, '迎双旦促销大酬宾', '迎双旦促销大酬宾bsdfghdsfhdsf', '2013-10-11 14:05:32');
INSERT INTO `easybuy_news` VALUES (5, '加入会员，赢千万大礼包', '加入会员，赢千万大礼包sdtreyjhgjkgh', '2013-10-12 14:05:32');
INSERT INTO `easybuy_news` VALUES (6, '新年不夜天，通宵也是开张了', '新年不夜天，通宵也是开张了uyitfdsg', '2013-10-15 14:05:32');
INSERT INTO `easybuy_news` VALUES (7, '团购阿迪1折起', '团购阿迪1折起gggdd', '2013-11-08 14:05:32');
INSERT INTO `easybuy_news` VALUES (529, '最新酷睿笔记本', 'IBME系列全场促销中，最新酷睿双核处理器，保证CPU更高效的运转。', '2013-06-02 14:05:32');
INSERT INTO `easybuy_news` VALUES (530, '团购无忧', '团购无忧aaaaaaaaaaaa', '2013-08-02 14:05:32');
INSERT INTO `easybuy_news` VALUES (531, '会员特惠月开始了', '会员特惠月开始了adfsadfasd', '2013-10-02 14:05:32');
INSERT INTO `easybuy_news` VALUES (597, '迎双旦促销大酬宾', '迎双旦促销大酬宾bsdfghdsfhdsf', '2013-10-11 14:05:32');
INSERT INTO `easybuy_news` VALUES (649, '加入会员，赢千万大礼包', '加入会员，赢千万大礼包sdtreyjhgjkgh', '2013-10-12 14:05:32');
INSERT INTO `easybuy_news` VALUES (650, '新年不夜天，通宵也是开张了', '新年不夜天，通宵也是开张了uyitfdsg', '2013-10-15 14:05:32');
INSERT INTO `easybuy_news` VALUES (653, '团购阿迪1折起', '团购阿迪1折起gggdd', '2013-11-08 14:05:32');

-- ----------------------------
-- Table structure for easybuy_order
-- ----------------------------
DROP TABLE IF EXISTS `easybuy_order`;
CREATE TABLE `easybuy_order`  (
  `EO_ID` int(0) NOT NULL AUTO_INCREMENT,
  `EO_USER_ID` int(0) NOT NULL,
  `EO_USER_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EO_USER_ADDRESS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EO_CREATE_TIME` datetime(0) NOT NULL,
  `EO_COST` double(10, 2) NOT NULL,
  `EO_STATUS` int(0) NOT NULL,
  `EO_TYPE` int(0) NOT NULL,
  PRIMARY KEY (`EO_ID`) USING BTREE,
  INDEX `FK_easybuy_order`(`EO_USER_ID`) USING BTREE,
  CONSTRAINT `FK_easybuy_order` FOREIGN KEY (`EO_USER_ID`) REFERENCES `easybuy_user` (`EU_USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 759 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of easybuy_order
-- ----------------------------
INSERT INTO `easybuy_order` VALUES (747, 7, '小乖', '北京海淀区中关村大厦202', '2013-06-12 10:28:56', 700.00, 1, 1);
INSERT INTO `easybuy_order` VALUES (748, 7, '普通用户', '吉林省吉林市深圳街', '2016-09-19 16:20:38', 7400.00, 1, 1);
INSERT INTO `easybuy_order` VALUES (749, 8, '管理员', '北京市海淀区成府路207号', '2016-09-26 14:29:45', 6100.00, 1, 1);

-- ----------------------------
-- Table structure for easybuy_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `easybuy_order_detail`;
CREATE TABLE `easybuy_order_detail`  (
  `EOD_ID` int(0) NOT NULL AUTO_INCREMENT,
  `EO_ID` int(0) NOT NULL,
  `EP_ID` int(0) NOT NULL,
  `EOD_QUANTITY` int(0) NOT NULL,
  `EOD_COST` double(10, 2) NOT NULL,
  `EOD_Subtotal` double(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`EOD_ID`) USING BTREE,
  INDEX `FK_easybuy_order_detail`(`EO_ID`) USING BTREE,
  INDEX `FK_easybuy_order_detail1`(`EP_ID`) USING BTREE,
  CONSTRAINT `FK_easybuy_order_detail` FOREIGN KEY (`EO_ID`) REFERENCES `easybuy_order` (`EO_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_easybuy_order_detail1` FOREIGN KEY (`EP_ID`) REFERENCES `easybuy_product` (`EP_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of easybuy_order_detail
-- ----------------------------
INSERT INTO `easybuy_order_detail` VALUES (1, 747, 592, 3, 200.00, 600.00);
INSERT INTO `easybuy_order_detail` VALUES (2, 747, 601, 5, 20.00, 100.00);
INSERT INTO `easybuy_order_detail` VALUES (3, 748, 592, 12, 200.00, 2400.00);
INSERT INTO `easybuy_order_detail` VALUES (4, 748, 645, 100, 50.00, 5000.00);
INSERT INTO `easybuy_order_detail` VALUES (5, 749, 593, 18, 300.00, 5400.00);
INSERT INTO `easybuy_order_detail` VALUES (6, 749, 591, 7, 100.00, 700.00);

-- ----------------------------
-- Table structure for easybuy_product
-- ----------------------------
DROP TABLE IF EXISTS `easybuy_product`;
CREATE TABLE `easybuy_product`  (
  `EP_ID` int(0) NOT NULL AUTO_INCREMENT,
  `EP_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EP_DESCRIPTION` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EP_PRICE` double(10, 2) NOT NULL,
  `EP_STOCK` int(0) NOT NULL,
  `EPC_ID` int(0) NOT NULL,
  `EPC_CHILD_ID` int(0) NOT NULL,
  `EP_FILE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`EP_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 667 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of easybuy_product
-- ----------------------------
INSERT INTO `easybuy_product` VALUES (1, '耳机', '铁三角 Audio-Technica ATH-EQ300M-SV 银色 挂耳式耳机', 99.00, 97, 545, 548, 'images/product/0.jpg');
INSERT INTO `easybuy_product` VALUES (2, '饭盒aa', '韩国风格a', 200.00, 4, 545, 548, 'images/product/8.jpg');
INSERT INTO `easybuy_product` VALUES (3, '护肤王aa', '女士专用aa', 300.00, 29980, 545, 548, 'images/product/3.jpg');
INSERT INTO `easybuy_product` VALUES (4, '奶粉aa', '三元aa', 20.00, 191, 545, 548, 'images/product/10.jpg');
INSERT INTO `easybuy_product` VALUES (5, '旅行包aa', '旅行包aa', 214.00, 18, 545, 548, 'images/product/7.jpg');
INSERT INTO `easybuy_product` VALUES (6, '项链aa', '饰品aa', 300.00, 2994, 545, 548, 'images/product/6.jpg');
INSERT INTO `easybuy_product` VALUES (7, '丝袜aa', '女士aa', 50.00, 398, 545, 548, 'images/product/5.jpg');
INSERT INTO `easybuy_product` VALUES (8, '显示器aa', '三星aa', 20.00, 1996, 545, 548, 'images/product/9.jpg');
INSERT INTO `easybuy_product` VALUES (9, '果酱aa', '果果aa', 23.00, 1876, 545, 548, 'images/product/2.jpg');
INSERT INTO `easybuy_product` VALUES (10, '画册aa', '画册aa', 100.00, 9992, 545, 548, 'images/product/1.jpg');
INSERT INTO `easybuy_product` VALUES (591, '画册', '画册', 100.00, 9992, 545, 548, 'images/product/1.jpg');
INSERT INTO `easybuy_product` VALUES (592, '饭盒', '韩国风格', 200.00, 9, 545, 548, 'images/product/8.jpg');
INSERT INTO `easybuy_product` VALUES (593, '护肤王', '女士专用', 300.00, 29980, 545, 548, 'images/product/3.jpg');
INSERT INTO `easybuy_product` VALUES (601, '奶粉', '三元', 20.00, 199, 545, 548, 'images/product/10.jpg');
INSERT INTO `easybuy_product` VALUES (639, '旅行包', '旅行包', 214.00, 0, 545, 548, 'images/product/7.jpg');
INSERT INTO `easybuy_product` VALUES (643, '项链', '饰品', 300.00, 2996, 545, 548, 'images/product/6.jpg');
INSERT INTO `easybuy_product` VALUES (645, '丝袜', '女士', 50.00, 400, 545, 548, 'images/product/5.jpg');
INSERT INTO `easybuy_product` VALUES (660, '显示器', '三星', 20.00, 2000, 545, 548, 'images/product/9.jpg');
INSERT INTO `easybuy_product` VALUES (661, '果酱', '果果', 23.00, 1876, 545, 548, 'images/product/2.jpg');
INSERT INTO `easybuy_product` VALUES (662, '电脑', 'aaaaaaaaa', 99.99, 100, 545, 633, 'upload/images/e106b55665e34811b17095c5df381905_3.jpg');
INSERT INTO `easybuy_product` VALUES (663, '电脑3', 'ccccccc', 99.99, 100, 545, 633, 'upload/images/1955319a393b4d029e4b4f101420da96_5.jpeg');
INSERT INTO `easybuy_product` VALUES (664, '电脑7777', '66666', 999.00, 999, 545, 633, 'upload/images/3c69c30db6e94ee59f13ef763f9ed455_1.jpg');

-- ----------------------------
-- Table structure for easybuy_product_category
-- ----------------------------
DROP TABLE IF EXISTS `easybuy_product_category`;
CREATE TABLE `easybuy_product_category`  (
  `EPC_ID` int(0) NOT NULL AUTO_INCREMENT,
  `EPC_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EPC_PARENT_ID` int(0) NOT NULL,
  PRIMARY KEY (`EPC_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 640 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of easybuy_product_category
-- ----------------------------
INSERT INTO `easybuy_product_category` VALUES (1, '父分类', 0);
INSERT INTO `easybuy_product_category` VALUES (542, '图书音像', 0);
INSERT INTO `easybuy_product_category` VALUES (545, '生活用品', 0);
INSERT INTO `easybuy_product_category` VALUES (546, '少儿图书', 542);
INSERT INTO `easybuy_product_category` VALUES (548, '化妆品', 545);
INSERT INTO `easybuy_product_category` VALUES (626, '厨房用品', 545);
INSERT INTO `easybuy_product_category` VALUES (628, '家用电器', 545);
INSERT INTO `easybuy_product_category` VALUES (629, '音乐', 542);
INSERT INTO `easybuy_product_category` VALUES (630, '图书', 542);
INSERT INTO `easybuy_product_category` VALUES (631, '家居首饰', 545);
INSERT INTO `easybuy_product_category` VALUES (632, '鞋包', 545);
INSERT INTO `easybuy_product_category` VALUES (633, '电脑办公', 545);
INSERT INTO `easybuy_product_category` VALUES (634, '文具玩具', 545);
INSERT INTO `easybuy_product_category` VALUES (635, '汽车用品', 545);
INSERT INTO `easybuy_product_category` VALUES (636, '家电', 545);

-- ----------------------------
-- Table structure for easybuy_user
-- ----------------------------
DROP TABLE IF EXISTS `easybuy_user`;
CREATE TABLE `easybuy_user`  (
  `EU_USER_ID` int(0) NOT NULL AUTO_INCREMENT,
  `EU_USER_LOGINID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `EU_USER_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EU_PASSWORD` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `EU_SEX` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EU_BIRTHDAY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EU_IDENTITY_CODE` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EU_EMAIL` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EU_MOBILE` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EU_ADDRESS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EU_STATUS` int(0) NOT NULL DEFAULT 1,
  `EU_FILEPATH` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`EU_USER_ID`) USING BTREE,
  UNIQUE INDEX `loginId`(`EU_USER_LOGINID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of easybuy_user
-- ----------------------------
INSERT INTO `easybuy_user` VALUES (2, 'b', '小白', 'ss', '男', '1990-12-12', '11111', '', '', '开玩笑能告诉你么', 2, NULL);
INSERT INTO `easybuy_user` VALUES (7, 'ss', '小 明', 'ss', '男', NULL, NULL, NULL, '13243546576', '\r\n\r\n', -1, NULL);
INSERT INTO `easybuy_user` VALUES (8, 'admin', '小管', 'admin', '女', NULL, NULL, NULL, NULL, '北京市海淀区成府路207号', 0, 'images/user.jpg');
INSERT INTO `easybuy_user` VALUES (12, '小龙龙', '小龙', '123', '男', '2019-4-1', NULL, NULL, '123456', '中国山东', 1, 'upload/images/e2d062b0ec504c48929156e5043f1daf_3.jpg');
INSERT INTO `easybuy_user` VALUES (14, 'bai', '小白', '123', '女', '2020-1-2', NULL, NULL, '15688982221', '吉林省吉林市', 1, 'images/user.jpg');
INSERT INTO `easybuy_user` VALUES (27, 'hei', '小黑', 'ss', '男', '', '1', '', '', '不是一般的烂啊', 1, 'images/user.jpg');
INSERT INTO `easybuy_user` VALUES (28, 'hong', '小红', 'ss', '男', '', '', '', '', 'zdsad', 1, 'images/user.jpg');

SET FOREIGN_KEY_CHECKS = 1;
