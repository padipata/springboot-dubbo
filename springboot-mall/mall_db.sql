/*
 Navicat Premium Data Transfer

 Source Server         : mysql_yp
 Source Server Type    : MySQL
 Source Server Version : 50556
 Source Host           : 39.104.92.85:3306
 Source Schema         : mall_db

 Target Server Type    : MySQL
 Target Server Version : 50556
 File Encoding         : 65001

 Date: 10/04/2019 09:38:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for TB_EXPRESS_COMPANY
-- ----------------------------
DROP TABLE IF EXISTS `TB_EXPRESS_COMPANY`;
CREATE TABLE `TB_EXPRESS_COMPANY` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EXPRESS_CORP_ID` varchar(32) NOT NULL,
  `EXPRESS_CORP_NAME` varchar(64) NOT NULL COMMENT '快递公司名称',
  `STATUS` tinyint(4) NOT NULL COMMENT '0 可用 1 不可用',
  `LOGO_URL` varchar(32) DEFAULT NULL COMMENT '快递公司logo',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `EXPRESS_CORP_ID_UNIQUE` (`EXPRESS_CORP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='物流公司表';

-- ----------------------------
-- Records of TB_EXPRESS_COMPANY
-- ----------------------------
BEGIN;
INSERT INTO `TB_EXPRESS_COMPANY` VALUES (1, 'yunda', '韵达快运', 1, NULL);
INSERT INTO `TB_EXPRESS_COMPANY` VALUES (2, 'zhongtong', '中通速递', 1, NULL);
INSERT INTO `TB_EXPRESS_COMPANY` VALUES (3, 'tiantian', '天天快递', 1, NULL);
INSERT INTO `TB_EXPRESS_COMPANY` VALUES (4, 'shunfeng', '顺丰快递', 1, NULL);
INSERT INTO `TB_EXPRESS_COMPANY` VALUES (5, 'yuantong', '圆通快递', 1, NULL);
INSERT INTO `TB_EXPRESS_COMPANY` VALUES (6, 'shentong', '申通快递', 1, NULL);
INSERT INTO `TB_EXPRESS_COMPANY` VALUES (7, 'ems', 'EMS', 1, NULL);
INSERT INTO `TB_EXPRESS_COMPANY` VALUES (8, 'huitongkuaidi', '百世快递', 1, NULL);
INSERT INTO `TB_EXPRESS_COMPANY` VALUES (9, 'youshuwuliu', '优速物流', 1, NULL);
INSERT INTO `TB_EXPRESS_COMPANY` VALUES (10, 'zhongzhouyuntong', '中州运通', 1, NULL);
INSERT INTO `TB_EXPRESS_COMPANY` VALUES (11, 'annengwuliu', '安能物流', 1, NULL);
INSERT INTO `TB_EXPRESS_COMPANY` VALUES (12, 'huitong', '汇通物流', 1, NULL);
INSERT INTO `TB_EXPRESS_COMPANY` VALUES (14, 'banma', '斑马物流', 1, NULL);
INSERT INTO `TB_EXPRESS_COMPANY` VALUES (15, 'jiuyescm', '九曳供应链', 1, NULL);
INSERT INTO `TB_EXPRESS_COMPANY` VALUES (16, 'Checkout2China', 'Checkout2China', 1, NULL);
INSERT INTO `TB_EXPRESS_COMPANY` VALUES (17, 'zhaijisong', '宅急送', 1, NULL);
INSERT INTO `TB_EXPRESS_COMPANY` VALUES (18, 'kuaijiesudi', '快捷速递', 1, NULL);
INSERT INTO `TB_EXPRESS_COMPANY` VALUES (19, 'fittime_shala', '减脂餐配送', 1, NULL);
INSERT INTO `TB_EXPRESS_COMPANY` VALUES (20, 'wanxiangwuliu', '万象物流', 1, NULL);
INSERT INTO `TB_EXPRESS_COMPANY` VALUES (21, 'zhimakaimen', '芝麻开门', 1, NULL);
INSERT INTO `TB_EXPRESS_COMPANY` VALUES (22, 'dsukuaidi', 'D速物流', 1, NULL);
INSERT INTO `TB_EXPRESS_COMPANY` VALUES (23, 'nanjingshengbang', '晟邦物流', 1, NULL);
INSERT INTO `TB_EXPRESS_COMPANY` VALUES (24, 'yuanyangtongcheng', '远扬同城', 1, NULL);
INSERT INTO `TB_EXPRESS_COMPANY` VALUES (25, 'youzhengxiaobao', '邮政小包', 1, NULL);
INSERT INTO `TB_EXPRESS_COMPANY` VALUES (26, 'tejisong', '特急送物流', 1, NULL);
INSERT INTO `TB_EXPRESS_COMPANY` VALUES (27, 'debang', '德邦物流', 1, NULL);
INSERT INTO `TB_EXPRESS_COMPANY` VALUES (28, 'jingdongwuliu', '京东物流', 1, NULL);
INSERT INTO `TB_EXPRESS_COMPANY` VALUES (29, 'UPS', 'UPS', 1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for TB_EXPRESS_INFO
-- ----------------------------
DROP TABLE IF EXISTS `TB_EXPRESS_INFO`;
CREATE TABLE `TB_EXPRESS_INFO` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ORDER_ID` int(10) unsigned DEFAULT NULL,
  `EXPRESS_CORP_ID` varchar(32) DEFAULT NULL COMMENT '物流公司编码',
  `EXPRESS_NO` varchar(32) DEFAULT NULL COMMENT '运单号',
  `EXPRESS_STATUS` tinyint(4) DEFAULT NULL COMMENT '运单状态0.初始化 1.已发货 2 已签收',
  `EXPRESS_DETAIL` mediumtext COMMENT '物流详情',
  `UPDATE_TIME` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDX_EXPRESS_INFO_ORDER_ID` (`ORDER_ID`),
  KEY `IDX_EXPRESS_INFO_UPDATETIME` (`UPDATE_TIME`)
) ENGINE=InnoDB AUTO_INCREMENT=111132 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='物流信息表';

-- ----------------------------
-- Records of TB_EXPRESS_INFO
-- ----------------------------
BEGIN;
INSERT INTO `TB_EXPRESS_INFO` VALUES (111131, 61, 'zhongzhouyuntong', '161026037', 0, '[{\"ftime\":\"2019-03-18 18:02:00\",\"context\":\"订单支付成功，已提交至仓库\",\"time\":\"2019-03-18 18:02:00\",\"source\":\"system\"}]', '2019-03-18 18:06:27');
COMMIT;

-- ----------------------------
-- Table structure for cms_help
-- ----------------------------
DROP TABLE IF EXISTS `cms_help`;
CREATE TABLE `cms_help` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `read_count` int(1) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='帮助表';

-- ----------------------------
-- Table structure for cms_help_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_help_category`;
CREATE TABLE `cms_help_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL COMMENT '分类图标',
  `help_count` int(11) DEFAULT NULL COMMENT '专题数量',
  `show_status` int(2) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='帮助分类表';

-- ----------------------------
-- Table structure for cms_member_report
-- ----------------------------
DROP TABLE IF EXISTS `cms_member_report`;
CREATE TABLE `cms_member_report` (
  `id` bigint(20) DEFAULT NULL,
  `report_type` int(1) DEFAULT NULL COMMENT '举报类型：0->商品评价；1->话题内容；2->用户评论',
  `report_member_name` varchar(100) DEFAULT NULL COMMENT '举报人',
  `create_time` datetime DEFAULT NULL,
  `report_object` varchar(100) DEFAULT NULL,
  `report_status` int(1) DEFAULT NULL COMMENT '举报状态：0->未处理；1->已处理',
  `handle_status` int(1) DEFAULT NULL COMMENT '处理结果：0->无效；1->有效；2->恶意',
  `note` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户举报表';

-- ----------------------------
-- Table structure for cms_prefrence_area
-- ----------------------------
DROP TABLE IF EXISTS `cms_prefrence_area`;
CREATE TABLE `cms_prefrence_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sub_title` varchar(255) DEFAULT NULL,
  `pic` varbinary(500) DEFAULT NULL COMMENT '展示图片',
  `sort` int(11) DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='优选专区';

-- ----------------------------
-- Records of cms_prefrence_area
-- ----------------------------
BEGIN;
INSERT INTO `cms_prefrence_area` VALUES (1, '让音质更出众', '音质不打折 完美现场感', NULL, NULL, 1);
INSERT INTO `cms_prefrence_area` VALUES (2, '让音质更出众22', '让音质更出众22', NULL, NULL, NULL);
INSERT INTO `cms_prefrence_area` VALUES (3, '让音质更出众33', NULL, NULL, NULL, NULL);
INSERT INTO `cms_prefrence_area` VALUES (4, '让音质更出众44', NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for cms_prefrence_area_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `cms_prefrence_area_product_relation`;
CREATE TABLE `cms_prefrence_area_product_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prefrence_area_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='优选专区和产品关系表';

-- ----------------------------
-- Records of cms_prefrence_area_product_relation
-- ----------------------------
BEGIN;
INSERT INTO `cms_prefrence_area_product_relation` VALUES (1, 1, 12);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (2, 1, 13);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (3, 1, 14);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (4, 1, 18);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (5, 1, 7);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (6, 2, 7);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (7, 1, 22);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (24, 1, 23);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (28, 1, 37);
COMMIT;

-- ----------------------------
-- Table structure for cms_subject
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject`;
CREATE TABLE `cms_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `pic` varchar(500) DEFAULT NULL COMMENT '专题主图',
  `product_count` int(11) DEFAULT NULL COMMENT '关联产品数量',
  `recommend_status` int(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `collect_count` int(11) DEFAULT NULL,
  `read_count` int(11) DEFAULT NULL,
  `comment_count` int(11) DEFAULT NULL,
  `album_pics` varchar(1000) DEFAULT NULL COMMENT '画册图片用逗号分割',
  `description` varchar(1000) DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
  `content` text,
  `forward_count` int(11) DEFAULT NULL COMMENT '转发数',
  `category_name` varchar(200) DEFAULT NULL COMMENT '专题分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='专题表';

-- ----------------------------
-- Records of cms_subject
-- ----------------------------
BEGIN;
INSERT INTO `cms_subject` VALUES (1, 1, '轮廓分明，双摄手机映现细腻美照', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t26434/217/1381240043/254214/290f9d5b/5bc6c11cN54567a27.jpg!q70.jpg', NULL, 1, '2018-11-11 13:26:55', 100, 1000, 100, NULL, '手机对于拍照党来说，已经不仅仅是通讯工具那么简单了。因为有时TA还充当着“单反”的角色，来不断地带给那些喜欢拍照的人惊喜。所以，在这里准备一波高颜值的双摄手机来给大家。让TA们灵敏捕捉影像的能力，为你展现出轮廓更加分明、且画质更加细腻的美照。', 1, NULL, NULL, '精选专题');
INSERT INTO `cms_subject` VALUES (2, 1, '交通拥挤有妙招，电动车小巧穿行无障碍', 'https://img11.360buyimg.com/mobilecms/s1500x600_jfs/t14224/229/529700229/74868/a1cc7364/5a314f85N5bfd22c7.jpg!q70.jpg', NULL, 1, '2018-11-12 13:27:00', 100, 1000, 100, NULL, '随着人们消费水平的提高，公路上的小车是越来越多了，导致每到上下班高峰期的时候，大路的车辆堵了一环又一环，而且你根本不知道它到底会塞多久，所以我们需要变通一下，不妨骑上电动车来个绿色出行，它够小巧玲珑，即使交通再怎么拥挤，也总有它可以通过的地方。', 1, NULL, NULL, '精选专题');
INSERT INTO `cms_subject` VALUES (3, 1, '无酒不成席，甘香白酒开怀助兴', 'https://img12.360buyimg.com/mobilecms/s1500x600_jfs/t1/881/4/12265/114011/5bd1446fEc71114bf/68925bfb4a2adc44.jpg!q70.jpg', NULL, 1, '2018-11-13 13:27:05', 100, 1000, 100, NULL, '白酒是由各种优质的高粱，小麦，大米等谷物为原料，经过传统工艺的长时间酿造，酒液在这样的环境中慢慢发酵，最终变成清香浓郁的白酒，被摆上人们的餐桌，供人畅饮，是一种受到大众喜爱的绝佳饮品。', 1, NULL, NULL, '精选专题');
INSERT INTO `cms_subject` VALUES (4, 2, '真规划不盲扫，全域清洁净无尘', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t15205/35/2539924281/429185/72fa7857/5aab2c4bN6a32a6c5.png', NULL, 1, '2018-11-01 13:27:09', 100, 1000, 100, NULL, '科技时代，聪明女人会选择用智慧来减负，和繁琐的家务挥手再见，才能腾出更多休闲时间。规划式扫地机器人设计个性化，它能够跟据房间布置呈现清扫路线，实现规划式覆盖性清洁，少遗漏不盲扫，从而大幅度降低损耗，侦测技术遇到家具及时避让，杜绝猛烈撞击，任它灵巧穿梭于低矮空间，坐享居家净无尘。', 1, NULL, NULL, '家电专题');
INSERT INTO `cms_subject` VALUES (5, 2, '抑菌更纯净，直饮净水保家人健康', 'https://img11.360buyimg.com/mobilecms/s1500x600_jfs/t11428/340/1504074828/20474/1e8cab1e/5a0305d3Nb1e7a762.jpg!q70.jpg', NULL, 1, '2018-11-06 13:27:18', 100, 1000, 100, NULL, '在城里居住，首先要担心的是饮水问题。桶装水太贵不够经济，还不一定是干净的。自己去干净的水源地取水也不切实际。此时只有选择在家里安装一台净水器才实在。装上一台直饮式的净水器，方便安全，关键是水质过滤得比较纯净，很大限度地处理了大部分的废弃物，留下健康的矿物质水。好生活，从一口干净的纯净水开始。', 1, NULL, NULL, '家电专题');
INSERT INTO `cms_subject` VALUES (6, 2, '储鲜冷冻灵活变，多门无霜更贴心', 'https://img12.360buyimg.com/mobilecms/s1500x600_jfs/t13015/356/2397552584/605232/46c88e6e/5a5321bcN6a8866f0.png', NULL, 1, '2018-11-07 13:27:21', 100, 1000, 100, NULL, '春节临近，每个家庭都要储备不少食材，但各种食材的保鲜方式与温度不尽相同，而多门风冷冰箱能轻松满足您。它们容积大占地小，拥有多个可以独立调节温度的温区，满足对不同类食材的存放需求，同时省去除霜烦恼，还可以通过温度调节满足您对大冷藏及大冷冻的需求变化，从而带来更好的保鲜冷冻体验，为新年宴请保驾护航。', 1, NULL, NULL, '家电专题');
INSERT INTO `cms_subject` VALUES (7, 2, '想喝健康水，就用304不锈钢热水壶', 'https://img13.360buyimg.com/mobilecms/s1500x600_jfs/t12541/90/443985343/33603/65d6e884/5a0bb77aNff08550a.jpg!q70.jpg', NULL, 1, '2019-01-29 11:21:55', 100, 1000, 100, NULL, '大冬天的喝一口热水，不仅能够暧身还可以给身体补充足够的水份，但是对于热水壶的购买却是需要慎之又慎，材质不好的热水壶在烧水的过程当中极容易产生对身体不利的有害物，极大影响人们的身体健康。304不锈钢热水壶选用食品级不不锈钢，确保水质安全，烧水健康好水，为您的饮水健康保驾护航。', 1, NULL, NULL, '家电专题');
INSERT INTO `cms_subject` VALUES (8, 2, '你尽情赖床！早餐“煲”在它身上', 'https://img14.360buyimg.com/mobilecms/s1500x600_jfs/t15949/363/1450937723/89513/7d8c1219/5a531d28N2aaec2a6.jpg!q70.jpg', NULL, 1, '2019-01-29 13:07:13', 100, 1000, 100, NULL, '赖床不想起，饿了的时候想吃饭又要现做等待简直饥肠辘辘让人心烦，所以一款带有预约功能的电饭煲简直不要太贴心，你睡懒觉的时候它已经给你做好了香滑软糯的粥，起床就能享美味是不是很贴心呐。', 1, NULL, NULL, '家电专题');
INSERT INTO `cms_subject` VALUES (9, 2, '小白变大厨，微波炉为实力加持', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t1/8774/21/11460/38908/5c2cbfcfEdab1ef03/d5800f0f7cf05b38.jpg!q70.jpg', NULL, 1, '2019-01-29 13:08:18', 100, 1000, 100, NULL, '对于厨艺小白而言，没有什么能比掌握好火候更来得困难的了！毕竟烹饪出食物的味道好坏，很大程度上还是对火候的掌控，想要轻松掌握火候，当然少不了一款微波炉的撑场，内设多功能，满足不同的烹饪需求，简单方便易操作，让厨艺小白秒变大师！', 1, NULL, NULL, '家电专题');
INSERT INTO `cms_subject` VALUES (10, 2, '十秒鲜榨，冬日把爱浓缩成杯果汁', 'https://img11.360buyimg.com/mobilecms/s1500x600_jfs/t13708/126/308291722/542847/26ee6edd/5a07dc72N3252a9e0.png', NULL, 1, '2019-01-29 13:10:02', 100, 1000, 100, NULL, '寒瑟冬日女友不喜欢吃水果，用便携迷你果汁机，撩妹又养胃。一按一转，碾压切割，简单快速制作，压榨出纯原味果汁。一键启动，十秒出汁，保留食物营养，轻轻松松粉碎食物，营养在手，说走就走。', 1, NULL, NULL, '家电专题');
INSERT INTO `cms_subject` VALUES (11, 3, '饭点未到肚已空？美味饼干先充饥', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t13240/79/443357432/38567/94792c4c/5a0ba054N89388654.jpg!q70.jpg', NULL, 1, '2019-01-29 13:10:45', 100, 1000, 100, NULL, '一上午都把精力集中在工作中，刚闲下来就发现自己已是饥肠辘辘了，可饭点却还没到，怎么办呢？不妨让这些美味饼干先帮你充充饥吧！酥香松脆有营养，每一口都让人回味无穷，既能满足你挑剔的味蕾又能起到果腹效果，快快为自己备上吧！', 1, NULL, NULL, '美食专题');
INSERT INTO `cms_subject` VALUES (12, 3, '赖床无罪，香酥面包营养又便捷', 'https://img11.360buyimg.com/mobilecms/s1500x600_jfs/t9775/33/1197239610/38547/34899011/59ddbd01N0bd693bb.jpg!q70.jpg', NULL, 1, '2019-01-29 13:11:41', 100, 1000, 100, NULL, '赖床是很多年轻人的通病，特别是秋冬季节，都会恋恋不舍温暖的被窝。对于苦逼的上班族来说，就算再多睡几分钟，还是要起床的，甚至来不及吃早餐。面包营养丰富，能快速饱腹，且携带方便，再搭配一盒牛奶，一顿简单而不失营养的早餐能提供一天的能量，让赖床族多睡几分钟也无妨。', 1, NULL, NULL, '美食专题');
INSERT INTO `cms_subject` VALUES (13, 3, '夹心饼干，予多重滋味交织舌尖', 'https://img12.360buyimg.com/mobilecms/s1500x600_jfs/t18877/139/652452758/27262/36e6ed6e/5a9d5b6dN327150e8.jpg!q70.jpg', NULL, 1, '2019-01-29 13:12:38', 100, 1000, 100, NULL, '饼干味道香脆可口，深受不少人的青睐。饼干的种类多样，而夹心饼干就是其中一种，相比普通饼干而言，夹心饼干有着更丰富的口感，当肚子空空如也的时候，来一些美味的夹心饼干，既能解馋，又能扛饿。下面就为大家推荐一组好吃的夹心饼干，作为办公室小零食非常不错。', 1, NULL, NULL, '美食专题');
INSERT INTO `cms_subject` VALUES (14, 4, '户外Party，便携音箱烘气氛', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t17125/265/644948348/42066/6f2dc610/5a9c9da1N9a95ee2c.jpg!q70.jpg', NULL, 1, '2019-01-29 13:13:53', 100, 1000, 100, NULL, '初春的季节，除了户外的各种踏青旅行，在户外开异常Party也是很惬意。户外派对，气氛的烘托肯定不能离开音箱的衬托，选择一款户外的便携音箱，无线蓝牙连接，免去有线的束缚，携带使用更方便。', 1, NULL, NULL, '数码专题');
INSERT INTO `cms_subject` VALUES (15, 5, '今冬潮包look，凹出绚丽女王范', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t8365/191/1901440450/575969/c71560c9/59c3144dNe6d8dd2f.png', NULL, 1, '2019-01-29 13:15:12', 100, 1000, 100, NULL, '潮流时尚的美包，搭配潮服，会让你魅力一直在线。因为潮包一直是女性出游扮美的秘籍，它不仅能够帮你收纳日常小物件，还能让你解放双手，这里推荐的时尚美包，随意搭配一件服饰，都可以让你潮范十足，凹出绚丽女王范。', 1, NULL, NULL, '服饰专题');
COMMIT;

-- ----------------------------
-- Table structure for cms_subject_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_category`;
CREATE TABLE `cms_subject_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL COMMENT '分类图标',
  `subject_count` int(11) DEFAULT NULL COMMENT '专题数量',
  `show_status` int(2) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='专题分类表';

-- ----------------------------
-- Records of cms_subject_category
-- ----------------------------
BEGIN;
INSERT INTO `cms_subject_category` VALUES (1, '精选专题', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/subject_cate_jingxuan.png', 3, 1, 100);
INSERT INTO `cms_subject_category` VALUES (2, '家电专题', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/subject_cate_jiadian.png', 7, 1, 0);
INSERT INTO `cms_subject_category` VALUES (3, '美食专题', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/subject_cate_meishi.png', 3, 1, 0);
INSERT INTO `cms_subject_category` VALUES (4, '数码专题', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_shouji.png', 1, 1, 0);
INSERT INTO `cms_subject_category` VALUES (5, '服饰专题', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_waitao.png', 1, 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for cms_subject_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_comment`;
CREATE TABLE `cms_subject_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) DEFAULT NULL,
  `member_nick_name` varchar(255) DEFAULT NULL,
  `member_icon` varchar(255) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专题评论表';

-- ----------------------------
-- Table structure for cms_subject_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_product_relation`;
CREATE TABLE `cms_subject_product_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='专题商品关系表';

-- ----------------------------
-- Records of cms_subject_product_relation
-- ----------------------------
BEGIN;
INSERT INTO `cms_subject_product_relation` VALUES (2, 1, 27);
INSERT INTO `cms_subject_product_relation` VALUES (3, 1, 28);
INSERT INTO `cms_subject_product_relation` VALUES (4, 1, 29);
INSERT INTO `cms_subject_product_relation` VALUES (5, 2, 30);
INSERT INTO `cms_subject_product_relation` VALUES (6, 2, 31);
INSERT INTO `cms_subject_product_relation` VALUES (7, 2, 35);
INSERT INTO `cms_subject_product_relation` VALUES (29, 2, 36);
INSERT INTO `cms_subject_product_relation` VALUES (30, 2, 32);
INSERT INTO `cms_subject_product_relation` VALUES (31, 3, 33);
INSERT INTO `cms_subject_product_relation` VALUES (38, 3, 34);
INSERT INTO `cms_subject_product_relation` VALUES (50, 1, 37);
INSERT INTO `cms_subject_product_relation` VALUES (51, 2, 37);
INSERT INTO `cms_subject_product_relation` VALUES (54, 1, 26);
COMMIT;

-- ----------------------------
-- Table structure for cms_topic
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic`;
CREATE TABLE `cms_topic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `attend_count` int(11) DEFAULT NULL COMMENT '参与人数',
  `attention_count` int(11) DEFAULT NULL COMMENT '关注人数',
  `read_count` int(11) DEFAULT NULL,
  `award_name` varchar(100) DEFAULT NULL COMMENT '奖品名称',
  `attend_type` varchar(100) DEFAULT NULL COMMENT '参与方式',
  `content` text COMMENT '话题内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='话题表';

-- ----------------------------
-- Table structure for cms_topic_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic_category`;
CREATE TABLE `cms_topic_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL COMMENT '分类图标',
  `subject_count` int(11) DEFAULT NULL COMMENT '专题数量',
  `show_status` int(2) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='话题分类表';

-- ----------------------------
-- Table structure for cms_topic_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic_comment`;
CREATE TABLE `cms_topic_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_nick_name` varchar(255) DEFAULT NULL,
  `topic_id` bigint(20) DEFAULT NULL,
  `member_icon` varchar(255) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专题评论表';

-- ----------------------------
-- Table structure for oms_cart_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_cart_item`;
CREATE TABLE `oms_cart_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `product_sku_id` bigint(20) DEFAULT NULL,
  `member_id` bigint(20) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL COMMENT '购买数量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '添加到购物车的价格',
  `sp1` varchar(200) DEFAULT NULL COMMENT '销售属性1',
  `sp2` varchar(200) DEFAULT NULL COMMENT '销售属性2',
  `sp3` varchar(200) DEFAULT NULL COMMENT '销售属性3',
  `product_pic` varchar(1000) DEFAULT NULL COMMENT '商品主图',
  `product_name` varchar(500) DEFAULT NULL COMMENT '商品名称',
  `product_sub_title` varchar(500) DEFAULT NULL COMMENT '商品副标题（卖点）',
  `product_sku_code` varchar(200) DEFAULT NULL COMMENT '商品sku条码',
  `member_nickname` varchar(500) DEFAULT NULL COMMENT '会员昵称',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime DEFAULT NULL COMMENT '修改时间',
  `delete_status` int(1) DEFAULT '0' COMMENT '是否删除',
  `product_category_id` bigint(20) DEFAULT NULL COMMENT '商品分类',
  `product_brand` varchar(200) DEFAULT NULL,
  `product_sn` varchar(200) DEFAULT NULL,
  `product_attr` varchar(500) DEFAULT NULL COMMENT '商品销售属性:[{"key":"颜色","value":"颜色"},{"key":"容量","value":"4G"}]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8 COMMENT='购物车表';

-- ----------------------------
-- Records of oms_cart_item
-- ----------------------------
BEGIN;
INSERT INTO `oms_cart_item` VALUES (12, 26, 146, 1, 1, 3788.00, '金色', '16G', NULL, NULL, '华为 HUAWEI P20', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2018-08-27 16:53:44', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (13, 27, 98, 1, 3, 2699.00, '黑色', '32G', NULL, NULL, '小米8', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2018-08-27 17:11:53', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (14, 28, 102, 1, 1, 649.00, '金色', '16G', NULL, NULL, '红米5A', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2018-08-27 17:18:02', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (15, 28, 103, 1, 1, 699.00, '金色', '32G', NULL, NULL, '红米5A', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2018-08-28 10:22:45', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (16, 29, 106, 1, 1, 5499.00, '金色', '32G', NULL, NULL, 'Apple iPhone 8 Plus', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029001', 'windir', '2018-08-28 10:50:50', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (18, 29, 109, 10, 3, 6299.00, '银色', '64G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029004', '沈专', '2019-02-16 17:56:55', NULL, 1, 19, '苹果', '7437799', NULL);
INSERT INTO `oms_cart_item` VALUES (19, 26, 139, 10, 6, 33.00, '银色', '128G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201902140026006', '沈专', '2019-02-16 20:11:04', NULL, 1, 19, '华为', '6946605', NULL);
INSERT INTO `oms_cart_item` VALUES (20, 26, 138, 10, 5, 33.00, '银色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201902140026005', '沈专', '2019-02-16 20:14:34', NULL, 1, 19, '华为', '6946605', NULL);
INSERT INTO `oms_cart_item` VALUES (21, 26, 135, 10, 1, 33.00, '金色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201902140026002', '沈专', '2019-02-16 20:21:24', NULL, 0, 19, '华为', '6946605', NULL);
INSERT INTO `oms_cart_item` VALUES (22, 27, 101, 10, 8, 2999.00, '蓝色', '64G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027004', '沈专', '2019-02-16 20:25:29', NULL, 0, 19, '小米', '7437788', NULL);
INSERT INTO `oms_cart_item` VALUES (23, 27, 99, 10, 1, 2999.00, '黑色', '64G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027002', '沈专', '2019-02-16 20:26:15', NULL, 0, 19, '小米', '7437788', NULL);
INSERT INTO `oms_cart_item` VALUES (24, 27, 100, 10, 2, 2699.00, '蓝色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027003', '沈专', '2019-02-16 20:34:51', NULL, 1, 19, '小米', '7437788', NULL);
INSERT INTO `oms_cart_item` VALUES (25, 28, 105, 10, 3, 699.00, '银色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028004', '沈专', '2019-02-16 20:39:38', NULL, 0, 19, '小米', '7437789', NULL);
INSERT INTO `oms_cart_item` VALUES (26, 29, 108, 10, 2, 5499.00, '银色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029003', '沈专', '2019-02-16 21:03:59', NULL, 0, 19, '苹果', '7437799', NULL);
INSERT INTO `oms_cart_item` VALUES (27, 26, 137, 10, 1, 33.00, '银色', '16G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201902140026004', '沈专', '2019-02-16 21:40:39', NULL, 0, 19, '华为', '6946605', NULL);
INSERT INTO `oms_cart_item` VALUES (28, 26, 136, 10, 1, 33.00, '金色', '128G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201902140026003', '沈专', '2019-02-16 21:43:41', NULL, 0, 19, '华为', '6946605', NULL);
INSERT INTO `oms_cart_item` VALUES (29, 28, 104, 10, 1, 649.00, '银色', '16G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028003', '沈专', '2019-02-16 21:48:03', NULL, 0, 19, '小米', '7437789', NULL);
INSERT INTO `oms_cart_item` VALUES (30, 29, 106, 10, 1, 5499.00, '金色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029001', '沈专', '2019-02-17 00:17:19', NULL, 1, 19, '苹果', '7437799', NULL);
INSERT INTO `oms_cart_item` VALUES (31, 27, 98, 10, 1, 2699.00, '黑色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', '沈专', '2019-02-17 00:19:04', NULL, 1, 19, '小米', '7437788', NULL);
INSERT INTO `oms_cart_item` VALUES (44, 27, 101, 5, 4, 2999.00, '蓝色', '64G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027004', 'lisi', '2019-02-22 18:25:40', NULL, 1, 19, '小米', '7437788', NULL);
INSERT INTO `oms_cart_item` VALUES (45, 26, 150, 5, 22, 33.00, '银色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201902140026005', 'lisi', '2019-02-22 18:52:32', NULL, 0, 19, '华为', '6946605', NULL);
INSERT INTO `oms_cart_item` VALUES (46, 29, 106, 5, 1, 5499.00, '金色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029001', 'lisi', '2019-02-22 19:03:37', NULL, 0, 19, '苹果', '7437799', NULL);
INSERT INTO `oms_cart_item` VALUES (47, 29, 109, 5, 5, 6299.00, '银色', '64G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029004', 'lisi', '2019-02-22 19:03:50', NULL, 0, 19, '苹果', '7437799', NULL);
INSERT INTO `oms_cart_item` VALUES (48, 27, 101, 5, 1, 2999.00, '蓝色', '64G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027004', 'lisi', '2019-02-23 08:16:56', NULL, 1, 19, '小米', '7437788', NULL);
INSERT INTO `oms_cart_item` VALUES (49, 7, 1, 5, 1, 100.00, 'string', 'string', 'string', 'string', '女式超柔软拉毛运动开衫', '匠心剪裁，垂感质地', 'string', 'lisi', '2019-02-23 08:27:42', NULL, 0, 7, '万和', 'No86577', NULL);
INSERT INTO `oms_cart_item` VALUES (50, 27, 101, 5, 1, 2999.00, '蓝色', '64G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027004', 'lisi', '2019-02-23 08:29:05', NULL, 1, 19, '小米', '7437788', NULL);
INSERT INTO `oms_cart_item` VALUES (51, 26, 146, 5, 1, 22.00, '金色', '16G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '222', 'lisi', '2019-02-23 08:29:38', NULL, 1, 19, '华为', '6946605', NULL);
INSERT INTO `oms_cart_item` VALUES (52, 26, 146, 5, 1, 22.00, '金色', '16G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '222', 'lisi', '2019-02-23 08:41:57', NULL, 1, 19, '华为', '6946605', NULL);
INSERT INTO `oms_cart_item` VALUES (53, 26, 146, 5, 1, 22.00, '金色', '16G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '222', 'lisi', '2019-02-23 08:44:47', NULL, 1, 19, '华为', '6946605', NULL);
INSERT INTO `oms_cart_item` VALUES (54, 26, 151, 5, 1, 33.00, '银色', '128G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201902140026006', 'lisi', '2019-02-23 08:46:43', NULL, 1, 19, '华为', '6946605', NULL);
INSERT INTO `oms_cart_item` VALUES (55, 27, 101, 5, 1, 2999.00, '蓝色', '64G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027004', 'lisi', '2019-02-23 08:47:52', NULL, 1, 19, '小米', '7437788', NULL);
INSERT INTO `oms_cart_item` VALUES (65, 26, 151, 5, 11, 33.00, '银色', '128G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201902140026006', 'lisi', '2019-02-23 16:19:54', NULL, 1, 19, '华为', '6946605', '规格:银色,128G');
INSERT INTO `oms_cart_item` VALUES (66, 27, 101, 5, 1, 2999.00, '蓝色', '64G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027004', 'lisi', '2019-02-23 16:35:07', NULL, 0, 19, '小米', '7437788', '规格:蓝色,64G');
INSERT INTO `oms_cart_item` VALUES (67, 27, 100, 5, 1, 2699.00, '蓝色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027003', 'lisi', '2019-02-23 16:39:10', NULL, 1, 19, '小米', '7437788', '规格:蓝色,32G');
INSERT INTO `oms_cart_item` VALUES (79, 27, 100, 5, 1, 2699.00, '蓝色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027003', 'lisi', '2019-02-27 15:06:08', NULL, 1, 19, '小米', '7437788', '规格:蓝色,32G');
INSERT INTO `oms_cart_item` VALUES (80, 27, 98, 5, 2, 2699.00, '黑色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'lisi', '2019-02-27 15:07:39', NULL, 0, 19, '小米', '7437788', '规格:黑色,32G');
INSERT INTO `oms_cart_item` VALUES (81, 27, 99, 5, 12, 2999.00, '黑色', '64G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027002', 'lisi', '2019-03-01 09:52:50', NULL, 1, 19, '小米', '7437788', '规格:黑色,64G');
INSERT INTO `oms_cart_item` VALUES (82, 26, 146, 5, 1, 22.00, '金色', '16G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '222', 'lisi', '2019-03-01 09:53:56', NULL, 0, 19, '华为', '6946605', '规格:金色,16G');
INSERT INTO `oms_cart_item` VALUES (84, 27, 100, 5, 1, 2699.00, '蓝色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027003', 'lisi', '2019-03-14 15:58:10', NULL, 1, 19, '小米', '7437788', '规格:蓝色,32G');
INSERT INTO `oms_cart_item` VALUES (85, 9, 3, 17, 2, 100.00, 'string', 'string', 'string', 'string', '女式超柔软拉毛运动开衫1', '匠心剪裁，垂感质地', 'string', '沈专', '2019-03-14 18:15:47', NULL, 0, 7, '万和', 'No86577', '规格:string,string,string');
INSERT INTO `oms_cart_item` VALUES (86, 7, 10, 17, 2, 0.00, 'string', 'string', 'sp3', 'string', '女式超柔软拉毛运动开衫', '匠心剪裁，垂感质地', 'string', '沈专', '2019-03-14 18:19:09', NULL, 0, 7, '万和', 'No86577', '规格:string,string,sp3');
INSERT INTO `oms_cart_item` VALUES (87, 7, 11, 17, 3, 0.00, 'string', 'string', 'sp33', 'string', '女式超柔软拉毛运动开衫', '匠心剪裁，垂感质地', 'string', '沈专', '2019-03-14 18:19:27', NULL, 0, 7, '万和', 'No86577', '规格:string,string,sp33');
INSERT INTO `oms_cart_item` VALUES (88, 26, 147, 17, 1, 33.00, '金色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201902140026002', '沈专', '2019-03-14 19:05:21', NULL, 0, 19, '华为', '6946605', '规格:金色,32G');
INSERT INTO `oms_cart_item` VALUES (89, 26, 149, 17, 1, 33.00, '银色', '16G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201902140026004', '沈专', '2019-03-14 19:16:17', NULL, 1, 19, '华为', '6946605', '规格:银色,16G');
INSERT INTO `oms_cart_item` VALUES (90, 27, 99, 17, 1, 2999.00, '黑色', '64G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027002', '沈专', '2019-03-14 19:16:59', NULL, 1, 19, '小米', '7437788', '规格:黑色,64G');
INSERT INTO `oms_cart_item` VALUES (91, 26, 149, 17, 2, 33.00, '银色', '16G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201902140026004', '沈专', '2019-03-14 19:25:14', NULL, 1, 19, '华为', '6946605', '规格:银色,16G');
INSERT INTO `oms_cart_item` VALUES (92, 27, 100, 18, 1, 2699.00, '蓝色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027003', NULL, '2019-03-15 18:56:30', NULL, 0, 19, '小米', '7437788', '规格:蓝色,32G');
INSERT INTO `oms_cart_item` VALUES (93, 26, 149, 18, 1, 33.00, '银色', '16G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201902140026004', NULL, '2019-03-15 19:08:55', NULL, 0, 19, '华为', '6946605', '规格:银色,16G');
INSERT INTO `oms_cart_item` VALUES (94, 26, 149, 5, 41, 33.00, '银色', '16G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201902140026004', 'lisi', '2019-03-16 11:05:37', NULL, 1, 19, '华为', '6946605', '规格:银色,16G');
INSERT INTO `oms_cart_item` VALUES (95, 26, 149, 17, 1, 33.00, '银色', '16G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201902140026004', '沈专', '2019-03-18 18:13:30', NULL, 1, 19, '华为', '6946605', '规格:银色,16G');
INSERT INTO `oms_cart_item` VALUES (96, 26, 148, 1, 76, 33.00, '金色', '128G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201902140026003', 'lisi', '2019-03-19 10:27:03', NULL, 1, 19, '华为', '6946605', '规格:金色,128G');
INSERT INTO `oms_cart_item` VALUES (97, 12, 6, 1, 9, 100.00, 'string', 'string', 'string', 'string', '女式超柔软拉毛运动开衫2', '匠心剪裁，垂感质地', 'string', 'lisi', '2019-03-19 15:23:18', NULL, 1, 7, '万和', 'No86577', '规格:string,string,string');
INSERT INTO `oms_cart_item` VALUES (98, 26, 148, 1, 20, 33.00, '金色', '128G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201902140026003', 'lisi', '2019-03-19 15:24:24', NULL, 1, 19, '华为', '6946605', '规格:金色,128G');
INSERT INTO `oms_cart_item` VALUES (99, 12, 6, 1, 7, 100.00, 'string', 'string', 'string', 'string', '女式超柔软拉毛运动开衫2', '匠心剪裁，垂感质地', 'string', 'windir', '2019-03-29 10:20:57', NULL, 1, 7, '万和', 'No86577', '规格:string,string,string');
INSERT INTO `oms_cart_item` VALUES (100, 7, 1, 1, 2, 100.00, 'string', 'string', 'string', 'string', '女式超柔软拉毛运动开衫', '匠心剪裁，垂感质地', 'string', 'windir', '2019-03-29 10:49:29', NULL, 1, 7, '万和', 'No86577', '规格:string,string,string');
INSERT INTO `oms_cart_item` VALUES (101, 7, 1, 1, 3, 100.00, 'string', 'string', 'string', 'string', '女式超柔软拉毛运动开衫', '匠心剪裁，垂感质地', 'string', 'windir', '2019-04-02 10:17:03', NULL, 1, 7, '万和', 'No86577', '规格:string,string,string');
INSERT INTO `oms_cart_item` VALUES (102, 13, 7, 1, 1, 100.00, 'string', 'string', 'string', 'string', '女式超柔软拉毛运动开衫3', '匠心剪裁，垂感质地', 'string', 'windir', '2019-04-02 10:31:20', NULL, 1, 7, '万和', 'No86577', '规格:string,string,string');
INSERT INTO `oms_cart_item` VALUES (103, 27, 98, 1, 9, 2699.00, '黑色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2019-04-02 11:29:46', NULL, 1, 19, '小米', '7437788', '规格:黑色,32G');
INSERT INTO `oms_cart_item` VALUES (104, 26, 146, 1, 4, 22.00, '金色', '16G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '222', 'windir', '2019-04-02 11:30:44', NULL, 1, 19, '华为', '6946605', '规格:金色,16G');
INSERT INTO `oms_cart_item` VALUES (105, 28, 104, 1, 5, 649.00, '银色', '16G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028003', 'windir', '2019-04-02 11:32:22', NULL, 1, 19, '小米', '7437789', '规格:银色,16G');
INSERT INTO `oms_cart_item` VALUES (106, 27, 98, 1, 2, 2699.00, '黑色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2019-04-02 23:46:02', NULL, 1, 19, '小米', '7437788', '规格:黑色,32G');
INSERT INTO `oms_cart_item` VALUES (107, 28, 102, 1, 3, 649.00, '金色', '16G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2019-04-02 23:46:31', NULL, 1, 19, '小米', '7437789', '规格:金色,16G');
INSERT INTO `oms_cart_item` VALUES (108, 29, 106, 1, 3, 5499.00, '金色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029001', 'windir', '2019-04-03 09:27:15', NULL, 1, 19, '苹果', '7437799', '规格:金色,32G');
INSERT INTO `oms_cart_item` VALUES (109, 28, 102, 1, 1, 649.00, '金色', '16G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2019-04-03 09:27:27', NULL, 1, 19, '小米', '7437789', '规格:金色,16G');
INSERT INTO `oms_cart_item` VALUES (110, 27, 98, 1, 1, 2699.00, '黑色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2019-04-03 10:02:20', NULL, 1, 19, '小米', '7437788', '规格:黑色,32G');
INSERT INTO `oms_cart_item` VALUES (111, 29, 106, 1, 1, 5499.00, '金色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029001', 'windir', '2019-04-03 10:06:46', NULL, 1, 19, '苹果', '7437799', '规格:金色,32G');
INSERT INTO `oms_cart_item` VALUES (112, 28, 102, 1, 1, 649.00, '金色', '16G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2019-04-03 10:06:57', NULL, 1, 19, '小米', '7437789', '规格:金色,16G');
INSERT INTO `oms_cart_item` VALUES (113, 27, 98, 1, 1, 2699.00, '黑色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2019-04-03 10:12:50', NULL, 1, 19, '小米', '7437788', '规格:黑色,32G');
INSERT INTO `oms_cart_item` VALUES (114, 27, 98, 1, 7, 2699.00, '黑色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2019-04-03 11:05:20', NULL, 1, 19, '小米', '7437788', '规格:黑色,32G');
INSERT INTO `oms_cart_item` VALUES (115, 28, 102, 1, 1, 649.00, '金色', '16G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2019-04-03 11:05:30', NULL, 1, 19, '小米', '7437789', '规格:金色,16G');
INSERT INTO `oms_cart_item` VALUES (116, 26, 146, 1, 1, 22.00, '金色', '16G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '222', 'windir', '2019-04-03 11:05:42', NULL, 1, 19, '华为', '6946605', '规格:金色,16G');
INSERT INTO `oms_cart_item` VALUES (117, 29, 106, 1, 1, 5499.00, '金色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029001', 'windir', '2019-04-03 11:07:05', NULL, 1, 19, '苹果', '7437799', '规格:金色,32G');
INSERT INTO `oms_cart_item` VALUES (118, 29, 106, 1, 1, 5499.00, '金色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029001', 'windir', '2019-04-03 13:54:44', NULL, 1, 19, '苹果', '7437799', '规格:金色,32G');
INSERT INTO `oms_cart_item` VALUES (119, 27, 101, 1, 4, 2999.00, '蓝色', '64G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027004', 'windir', '2019-04-03 15:55:24', NULL, 1, 19, '小米', '7437788', '规格:蓝色,64G');
INSERT INTO `oms_cart_item` VALUES (120, 26, 151, 1, 5, 33.00, '银色', '128G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201902140026006', 'windir', '2019-04-03 15:55:54', NULL, 1, 19, '华为', '6946605', '规格:银色,128G');
INSERT INTO `oms_cart_item` VALUES (121, 26, 147, 1, 1, 33.00, '金色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201902140026002', 'windir', '2019-04-03 16:12:30', NULL, 1, 19, '华为', '6946605', '规格:金色,32G');
INSERT INTO `oms_cart_item` VALUES (122, 26, 150, 1, 2, 33.00, '银色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201902140026005', 'windir', '2019-04-03 17:13:16', NULL, 1, 19, '华为', '6946605', '规格:银色,32G');
INSERT INTO `oms_cart_item` VALUES (123, 26, 149, 1, 2, 33.00, '银色', '16G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201902140026004', 'windir', '2019-04-03 17:45:49', NULL, 1, 19, '华为', '6946605', '规格:银色,16G');
INSERT INTO `oms_cart_item` VALUES (124, 27, 98, 1, 4, 2699.00, '黑色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2019-04-03 17:56:52', NULL, 1, 19, '小米', '7437788', '规格:黑色,32G');
INSERT INTO `oms_cart_item` VALUES (125, 27, 99, 1, 1, 2999.00, '黑色', '64G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027002', 'windir', '2019-04-03 17:57:24', NULL, 1, 19, '小米', '7437788', '规格:黑色,64G');
INSERT INTO `oms_cart_item` VALUES (126, 29, 106, 1, 1, 5499.00, '金色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029001', 'windir', '2019-04-04 09:02:10', NULL, 1, 19, '苹果', '7437799', '规格:金色,32G');
INSERT INTO `oms_cart_item` VALUES (127, 27, 101, 1, 6, 2999.00, '蓝色', '64G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027004', 'windir', '2019-04-04 09:04:11', NULL, 1, 19, '小米', '7437788', '规格:蓝色,64G');
INSERT INTO `oms_cart_item` VALUES (128, 27, 100, 1, 26, 2699.00, '蓝色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027003', 'windir', '2019-04-04 09:04:19', NULL, 1, 19, '小米', '7437788', '规格:蓝色,32G');
INSERT INTO `oms_cart_item` VALUES (129, 28, 102, 1, 1, 649.00, '金色', '16G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2019-04-04 09:05:37', NULL, 1, 19, '小米', '7437789', '规格:金色,16G');
INSERT INTO `oms_cart_item` VALUES (130, 28, 102, 1, 1, 649.00, '金色', '16G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2019-04-04 09:06:35', NULL, 1, 19, '小米', '7437789', '规格:金色,16G');
INSERT INTO `oms_cart_item` VALUES (131, 28, 102, 1, 1, 649.00, '金色', '16G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2019-04-04 09:16:37', NULL, 1, 19, '小米', '7437789', '规格:金色,16G');
INSERT INTO `oms_cart_item` VALUES (132, 28, 104, 1, 1, 649.00, '银色', '16G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028003', 'windir', '2019-04-04 09:16:44', NULL, 1, 19, '小米', '7437789', '规格:银色,16G');
INSERT INTO `oms_cart_item` VALUES (133, 26, 151, 1, 1, 33.00, '银色', '128G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201902140026006', 'windir', '2019-04-08 09:02:01', NULL, 1, 19, '华为', '6946605', '规格:银色,128G');
INSERT INTO `oms_cart_item` VALUES (134, 26, 148, 1, 1, 33.00, '金色', '128G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201902140026003', 'windir', '2019-04-08 09:02:29', NULL, 1, 19, '华为', '6946605', '规格:金色,128G');
INSERT INTO `oms_cart_item` VALUES (135, 28, 102, 1, 1, 649.00, '金色', '16G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2019-04-08 09:09:11', NULL, 1, 19, '小米', '7437789', '规格:金色,16G');
INSERT INTO `oms_cart_item` VALUES (136, 28, 104, 1, 1, 649.00, '银色', '16G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028003', 'windir', '2019-04-08 09:09:19', NULL, 1, 19, '小米', '7437789', '规格:银色,16G');
INSERT INTO `oms_cart_item` VALUES (137, 28, 105, 1, 1, 699.00, '银色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028004', 'windir', '2019-04-08 09:09:27', NULL, 1, 19, '小米', '7437789', '规格:银色,32G');
INSERT INTO `oms_cart_item` VALUES (138, 26, 151, 1, 1, 33.00, '银色', '128G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201902140026006', 'windir', '2019-04-08 10:37:36', NULL, 1, 19, '华为', '6946605', '规格:银色,128G');
INSERT INTO `oms_cart_item` VALUES (139, 26, 149, 1, 5, 33.00, '银色', '16G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201902140026004', 'windir', '2019-04-08 10:37:46', NULL, 1, 19, '华为', '6946605', '规格:银色,16G');
INSERT INTO `oms_cart_item` VALUES (140, 29, 108, 1, 7, 5499.00, '银色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029003', 'windir', '2019-04-08 10:38:17', NULL, 1, 19, '苹果', '7437799', '规格:银色,32G');
INSERT INTO `oms_cart_item` VALUES (141, 28, 102, 1, 6, 649.00, '金色', '16G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2019-04-08 11:26:38', NULL, 1, 19, '小米', '7437789', '规格:金色,16G');
INSERT INTO `oms_cart_item` VALUES (142, 28, 105, 1, 3, 699.00, '银色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028004', 'windir', '2019-04-08 11:26:49', NULL, 1, 19, '小米', '7437789', '规格:银色,32G');
INSERT INTO `oms_cart_item` VALUES (143, 29, 107, 1, 1, 6299.00, '金色', '64G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029002', 'windir', '2019-04-08 11:27:01', NULL, 1, 19, '苹果', '7437799', '规格:金色,64G');
INSERT INTO `oms_cart_item` VALUES (144, 26, 151, 1, 89, 33.00, '银色', '128G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201902140026006', 'windir', '2019-04-08 17:08:19', NULL, 1, 19, '华为', '6946605', '规格:银色,128G');
INSERT INTO `oms_cart_item` VALUES (145, 29, 107, 1, 4, 6299.00, '金色', '64G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029002', 'windir', '2019-04-08 17:09:13', NULL, 1, 19, '苹果', '7437799', '规格:金色,64G');
INSERT INTO `oms_cart_item` VALUES (146, 29, 106, 1, 4, 5499.00, '金色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029001', 'windir', '2019-04-08 17:11:26', NULL, 1, 19, '苹果', '7437799', '规格:金色,32G');
INSERT INTO `oms_cart_item` VALUES (147, 29, 107, 1, 4, 6299.00, '金色', '64G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029002', 'windir', '2019-04-08 17:11:33', NULL, 1, 19, '苹果', '7437799', '规格:金色,64G');
INSERT INTO `oms_cart_item` VALUES (148, 29, 108, 1, 4, 5499.00, '银色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029003', 'windir', '2019-04-08 17:11:41', NULL, 1, 19, '苹果', '7437799', '规格:银色,32G');
INSERT INTO `oms_cart_item` VALUES (149, 28, 102, 1, 1, 649.00, '金色', '16G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2019-04-08 17:11:53', NULL, 1, 19, '小米', '7437789', '规格:金色,16G');
INSERT INTO `oms_cart_item` VALUES (150, 28, 103, 1, 4, 699.00, '金色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028002', 'windir', '2019-04-08 17:12:06', NULL, 1, 19, '小米', '7437789', '规格:金色,32G');
INSERT INTO `oms_cart_item` VALUES (151, 27, 98, 1, 1, 2699.00, '黑色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2019-04-09 15:01:30', NULL, 1, 19, '小米', '7437788', '规格:黑色,32G');
INSERT INTO `oms_cart_item` VALUES (152, 27, 98, 1, 1, 2699.00, '黑色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2019-04-09 16:46:19', NULL, 1, 19, '小米', '7437788', '规格:黑色,32G');
INSERT INTO `oms_cart_item` VALUES (153, 27, 99, 1, 1, 2999.00, '黑色', '64G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027002', 'windir', '2019-04-09 16:46:26', NULL, 0, 19, '小米', '7437788', '规格:黑色,64G');
INSERT INTO `oms_cart_item` VALUES (154, 27, 100, 1, 1, 2699.00, '蓝色', '32G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027003', 'windir', '2019-04-09 16:46:34', NULL, 0, 19, '小米', '7437788', '规格:蓝色,32G');
COMMIT;

-- ----------------------------
-- Table structure for oms_company_address
-- ----------------------------
DROP TABLE IF EXISTS `oms_company_address`;
CREATE TABLE `oms_company_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address_name` varchar(200) DEFAULT NULL COMMENT '地址名称',
  `send_status` int(1) DEFAULT NULL COMMENT '默认发货地址：0->否；1->是',
  `receive_status` int(1) DEFAULT NULL COMMENT '是否默认收货地址：0->否；1->是',
  `name` varchar(64) DEFAULT NULL COMMENT '收发货人姓名',
  `phone` varchar(64) DEFAULT NULL COMMENT '收货人电话',
  `province` varchar(64) DEFAULT NULL COMMENT '省/直辖市',
  `city` varchar(64) DEFAULT NULL COMMENT '市',
  `region` varchar(64) DEFAULT NULL COMMENT '区',
  `detail_address` varchar(200) DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='公司收发货地址表';

-- ----------------------------
-- Records of oms_company_address
-- ----------------------------
BEGIN;
INSERT INTO `oms_company_address` VALUES (1, '深圳发货点', 1, 1, '大梨', '18000000000', '广东省', '深圳市', '南山区', '科兴科学园');
INSERT INTO `oms_company_address` VALUES (2, '北京发货点', 0, 0, '大梨', '18000000000', '北京市', NULL, '南山区', '科兴科学园');
INSERT INTO `oms_company_address` VALUES (3, '南京发货点', 0, 0, '大梨', '18000000000', '江苏省', '南京市', '南山区', '科兴科学园');
COMMIT;

-- ----------------------------
-- Table structure for oms_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_order`;
CREATE TABLE `oms_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `member_id` bigint(20) NOT NULL,
  `coupon_id` bigint(20) DEFAULT NULL,
  `order_sn` varchar(64) DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10,2) DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10,2) DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10,2) DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10,2) DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10,2) DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10,2) DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10,2) DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(1) DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(1) DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(1) DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(1) DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(11) DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(11) DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(11) DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(1) DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(1) DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(1) NOT NULL DEFAULT '0' COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(11) DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `prepay_id` varchar(255) DEFAULT NULL,
  `supply_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of oms_order
-- ----------------------------
BEGIN;
INSERT INTO `oms_order` VALUES (60, 1, NULL, '201902240102000001', '2019-02-24 10:32:04', 'wxapplettmcyus5qz354', 33.00, 0.00, 0.00, 33.00, 0.00, 0.00, 0.00, 2, 1, 3, 0, NULL, NULL, NULL, 3788, 3788, '单品促销', NULL, NULL, NULL, NULL, NULL, '张三', '020-81167888', '510000', NULL, NULL, NULL, '新港中路397号', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (61, 1, NULL, '201902270102000001', '2019-02-27 14:38:50', 'wxapplettmcyus5qz354', 649.00, 599.00, 0.00, 50.00, 0.00, 0.00, 0.00, 2, 1, 4, 0, NULL, '71614073902515', NULL, 649, 649, '满减优惠：满500.00元，减50.00元', NULL, NULL, NULL, NULL, NULL, '张三', '020-81167888', '510000', NULL, NULL, NULL, '新港中路397号', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (62, 1, NULL, '201902270102000002', '2019-02-27 15:06:23', 'lisi', 2699.00, 2699.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 3, 0, '顺丰快递', '71614073902515', NULL, 2699, 2699, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2019-02-27 15:06:50', '2019-04-01 10:41:13', NULL, NULL, '2019-02-27 15:06:50', NULL, NULL);
INSERT INTO `oms_order` VALUES (63, 1, NULL, '201903140102000001', '2019-03-14 15:58:12', 'lisi', 2699.00, 2699.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 2, 0, '顺丰快递', '71614073902515', NULL, 2699, 2699, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2019-03-14 15:58:22', '2019-04-09 09:18:07', NULL, NULL, '2019-03-14 15:58:22', NULL, NULL);
INSERT INTO `oms_order` VALUES (64, 1, NULL, '201903140102000002', '2019-03-14 19:16:19', 'wxapplettmcyus5qz354', 33.00, 0.00, 0.00, 33.00, 0.00, 0.00, 0.00, 2, 1, 3, 0, NULL, NULL, NULL, 3788, 3788, '单品促销', NULL, NULL, NULL, NULL, NULL, '张三', '020-81167888', '510000', NULL, NULL, NULL, '新港中路397号', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (65, 1, NULL, '201903140102000003', '2019-03-14 19:17:01', 'wxapplettmcyus5qz354', 2999.00, 2999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 4, 0, NULL, NULL, NULL, 2699, 2699, '无优惠', NULL, NULL, NULL, NULL, NULL, '张三', '020-81167888', '510000', NULL, NULL, NULL, '新港中路397号', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (66, 1, NULL, '201903140102000004', '2019-03-14 19:27:50', 'wxapplettmcyus5qz354', 66.00, 0.00, 0.00, 66.00, 0.00, 0.00, 0.00, 2, 1, 4, 0, NULL, NULL, NULL, 7576, 7576, '单品促销', NULL, NULL, NULL, NULL, NULL, '张三', '020-81167888', '510000', NULL, NULL, NULL, '新港中路397号', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (67, 1, NULL, '201903180102000001', '2019-03-18 18:13:32', 'wxapplettmcyus5qz354', 33.00, 0.00, 0.00, 33.00, 0.00, 0.00, 0.00, 2, 1, 4, 0, NULL, '71614073902515', NULL, 3788, 3788, '单品促销', NULL, NULL, NULL, NULL, NULL, '张三', '020-81167888', '510000', NULL, NULL, NULL, '新港中路397号', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (68, 1, NULL, '201903190102000001', '2019-03-19 14:56:03', 'lisi', 2508.00, 0.00, 0.00, 2508.00, 0.00, 0.00, 0.00, 2, 1, 3, 0, NULL, NULL, NULL, 287888, 287888, '单品促销', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (69, 1, NULL, '201903190102000002', '2019-03-19 15:11:29', 'lisi', 1353.00, 0.00, 0.00, 1353.00, 0.00, 0.00, 0.00, 2, 1, 4, 0, NULL, NULL, NULL, 155308, 155308, '单品促销', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (70, 1, NULL, '201903190102000003', '2019-03-19 15:24:58', 'lisi', 35988.00, 26991.00, 0.00, 8997.00, 0.00, 0.00, 0.00, 2, 1, 4, 0, NULL, NULL, NULL, 32388, 32388, '打折优惠：满3件，打7.50折', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (71, 1, NULL, '201903190102000004', '2019-03-19 15:34:15', 'lisi', 35988.00, 26991.00, 0.00, 8997.00, 0.00, 0.00, 0.00, 2, 1, 4, 0, NULL, NULL, NULL, 32388, 32388, '打折优惠：满3件，打7.50折', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (72, 1, NULL, '201903190102000005', '2019-03-19 15:35:02', 'lisi', 35988.00, 26991.00, 0.00, 8997.00, 0.00, 0.00, 0.00, 2, 1, 4, 0, NULL, NULL, NULL, 32388, 32388, '打折优惠：满3件，打7.50折', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (73, 1, NULL, '201903190102000006', '2019-03-19 15:35:39', 'lisi', 35988.00, 26991.00, 0.00, 8997.00, 0.00, 0.00, 0.00, 2, 1, 4, 0, NULL, NULL, NULL, 32388, 32388, '打折优惠：满3件，打7.50折', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (74, 1, NULL, '201903190102000007', '2019-03-19 15:37:04', 'lisi', 35988.00, 26991.00, 0.00, 8997.00, 0.00, 0.00, 0.00, 2, 1, 4, 0, NULL, NULL, NULL, 32388, 32388, '打折优惠：满3件，打7.50折', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (75, 1, NULL, '201903190102000008', '2019-03-19 16:50:37', 'lisi', 363.00, 0.00, 0.00, 363.00, 0.00, 0.00, 0.00, 2, 1, 4, 0, NULL, NULL, NULL, 41668, 41668, '单品促销', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (76, 1, NULL, '2019040101null000001', '2019-04-01 19:57:21', 'test', 660.00, 0.00, 0.00, 660.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, NULL, 75760, 75760, '单品促销', NULL, NULL, NULL, NULL, NULL, '大梨', '18033000000', '', '辽宁省', '阜新市', '', '清水河街道', NULL, 0, 0, NULL, '2019-04-01 20:04:57', NULL, NULL, NULL, '2019-04-01 20:04:57', NULL, NULL);
INSERT INTO `oms_order` VALUES (94, 1, NULL, '201904020102000019', '2019-04-02 22:45:33', 'test', 3788.00, 3766.00, 0.00, 22.00, 0.00, 0.00, 0.00, 2, 1, 4, 0, NULL, NULL, NULL, 3788, 3788, '单品促销', NULL, NULL, NULL, NULL, NULL, '大梨', '18033000000', '', '辽宁省', '阜新市', '', '清水河街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (95, 1, NULL, '2019040301null000001', '2019-04-03 09:24:08', 'test', 1947.00, 1828.20, 0.00, 118.80, 0.00, 0.00, 0.00, NULL, 1, 4, 0, NULL, NULL, NULL, 1947, 1947, '满减优惠：满1000.00元，减120.00元', NULL, NULL, NULL, NULL, NULL, '大梨', '18033000000', '', '辽宁省', '阜新市', '', '清水河街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (96, 1, NULL, '2019040301null000002', '2019-04-03 09:27:42', 'test', 649.00, 599.00, 0.00, 50.00, 0.00, 0.00, 0.00, NULL, 1, 4, 0, NULL, NULL, NULL, 649, 649, '满减优惠：满500.00元，减50.00元', NULL, NULL, NULL, NULL, NULL, '大梨', '18033000000', '', '辽宁省', '阜新市', '', '清水河街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (97, 1, NULL, '2019040301null000003', '2019-04-03 09:31:33', 'test', 5398.00, 4318.40, 0.00, 1079.60, 0.00, 0.00, 0.00, NULL, 1, 4, 0, NULL, NULL, NULL, 5398, 5398, '打折优惠：满2件，打8.00折', NULL, NULL, NULL, NULL, NULL, '大梨', '18033000000', '', '辽宁省', '阜新市', '', '清水河街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (98, 1, NULL, '2019040301null000004', '2019-04-03 10:02:59', 'test', 2699.00, 2699.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, NULL, 2699, 2699, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033000000', '', '辽宁省', '阜新市', '', '清水河街道', NULL, 0, 0, NULL, '2019-04-03 10:04:13', NULL, NULL, NULL, '2019-04-03 10:04:13', NULL, NULL);
INSERT INTO `oms_order` VALUES (99, 1, NULL, '2019040301null000005', '2019-04-03 10:05:22', 'test', 16497.00, 16497.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, NULL, 16497, 16497, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033000000', '', '辽宁省', '阜新市', '', '清水河街道', NULL, 0, 0, NULL, '2019-04-03 10:05:28', NULL, NULL, NULL, '2019-04-03 10:05:28', NULL, NULL);
INSERT INTO `oms_order` VALUES (100, 1, NULL, '2019040301null000006', '2019-04-03 10:07:08', 'test', 649.00, 599.00, 0.00, 50.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, NULL, 649, 649, '满减优惠：满500.00元，减50.00元', NULL, NULL, NULL, NULL, NULL, '大梨', '18033000000', '', '辽宁省', '阜新市', '', '清水河街道', NULL, 0, 0, NULL, '2019-04-03 10:07:14', NULL, NULL, NULL, '2019-04-03 10:07:14', NULL, NULL);
INSERT INTO `oms_order` VALUES (101, 1, NULL, '2019040301null000007', '2019-04-03 10:12:24', 'test', 5499.00, 5499.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 1, 0, NULL, NULL, NULL, 5499, 5499, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033000000', '', '辽宁省', '阜新市', '', '清水河街道', NULL, 0, 0, NULL, '2019-04-03 10:12:31', NULL, NULL, NULL, '2019-04-03 10:12:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (102, 1, NULL, '201904030102000008', '2019-04-03 10:58:31', 'test', 2699.00, 2699.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 4, 0, NULL, NULL, NULL, 2699, 2699, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033000000', '', '辽宁省', '阜新市', '', '清水河街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (103, 1, NULL, '201904030102000009', '2019-04-03 11:42:26', 'test', 5499.00, 5499.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, 1, 4, 0, NULL, NULL, NULL, 5499, 5499, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033000000', '', '辽宁省', '阜新市', '', '清水河街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (104, 1, NULL, '201904030101000010', '2019-04-03 15:25:09', 'test', 18893.00, 14169.75, 0.00, 4723.25, 0.00, 0.00, 0.00, 1, 1, 4, 0, NULL, NULL, NULL, 18893, 18893, '打折优惠：满3件，打7.50折', NULL, NULL, NULL, NULL, NULL, '大梨', '18033000000', '', '辽宁省', '阜新市', '', '清水河街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (105, 1, NULL, '201904030101000011', '2019-04-03 17:57:45', 'test', 2999.00, 2999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 4, 0, NULL, NULL, NULL, 2699, 2699, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (106, 1, NULL, '201904040101000001', '2019-04-04 09:02:22', 'test', 5499.00, 5499.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 4, 0, NULL, NULL, NULL, 5499, 5499, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (107, 1, NULL, '201904080101000001', '2019-04-08 09:02:08', 'test', 33.00, 0.00, 0.00, 33.00, 0.00, 0.00, 0.00, 1, 1, 4, 0, NULL, NULL, NULL, 3788, 3788, '单品促销', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (108, 1, NULL, '201904080101000002', '2019-04-08 09:02:14', 'test', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 4, 0, NULL, NULL, NULL, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (109, 1, NULL, '201904080101000003', '2019-04-08 09:02:37', 'test', 33.00, 0.00, 0.00, 33.00, 0.00, 0.00, 0.00, 1, 1, 4, 0, NULL, NULL, NULL, 3788, 3788, '单品促销', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (110, 1, NULL, '201904080101000004', '2019-04-08 11:02:32', 'test', 38658.00, 38493.00, 0.00, 165.00, 0.00, 0.00, 0.00, 1, 1, 4, 0, NULL, NULL, NULL, 57433, 57433, '单品促销,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (111, 1, NULL, '201904080101000005', '2019-04-08 11:24:33', 'test', 649.00, 599.00, 0.00, 50.00, 0.00, 0.00, 0.00, 1, 1, 4, 0, NULL, NULL, NULL, 649, 649, '满减优惠：满500.00元，减50.00元', NULL, NULL, NULL, NULL, NULL, '梁云凤', '13000000000', '', '广东省', '深圳市', '', '龙岗区龙翔大道2188号', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (112, 1, NULL, '201904080102000006', '2019-04-08 17:10:39', 'test', 35992.00, 33293.00, 0.00, 2699.00, 0.00, 0.00, 0.00, 2, 1, 4, 0, NULL, NULL, NULL, 32792, 32792, '打折优惠：满3件，打7.50折,无优惠', NULL, NULL, NULL, NULL, NULL, '梁云凤', '13000000000', '', '广东省', '深圳市', '', '龙岗区龙翔大道2188号', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (113, 1, NULL, '201904090101000001', '2019-04-09 14:40:18', 'test', 2796.00, 2676.00, 0.00, 120.00, 0.00, 0.00, 0.00, 1, 1, 4, 0, NULL, NULL, NULL, 2596, 2596, '满减优惠：满1000.00元，减120.00元', NULL, NULL, NULL, NULL, NULL, '梁云凤', '13000000000', '', '广东省', '深圳市', '', '龙岗区龙翔大道2188号', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (114, 1, NULL, '201904090101000002', '2019-04-09 15:01:44', 'test', 2699.00, 2699.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 4, 0, NULL, NULL, NULL, 2699, 2699, '无优惠', NULL, NULL, NULL, NULL, NULL, '梁云凤', '13000000000', '', '广东省', '深圳市', '', '龙岗区龙翔大道2188号', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (115, 1, NULL, '201904090101000003', '2019-04-09 15:44:52', 'test', 47192.00, 47192.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 4, 0, NULL, NULL, NULL, 43992, 43992, '无优惠,无优惠', NULL, NULL, NULL, NULL, NULL, '梁云凤', '13000000000', '', '广东省', '深圳市', '', '龙岗区龙翔大道2188号', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (116, 1, NULL, '201904090101000004', '2019-04-09 16:46:48', 'test', 2699.00, 2699.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 4, 0, NULL, NULL, NULL, 2699, 2699, '无优惠', NULL, NULL, NULL, NULL, NULL, '梁云凤', '13000000000', '', '广东省', '深圳市', '', '龙岗区龙翔大道2188号', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for oms_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item`;
CREATE TABLE `oms_order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(20) DEFAULT NULL,
  `product_pic` varchar(500) DEFAULT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `product_brand` varchar(200) DEFAULT NULL,
  `product_sn` varchar(64) DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(11) DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(20) DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(20) DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) DEFAULT NULL,
  `sp3` varchar(100) DEFAULT NULL,
  `promotion_name` varchar(200) DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10,2) DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10,2) DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10,2) DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10,2) DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(11) DEFAULT '0',
  `gift_growth` int(11) DEFAULT '0',
  `product_attr` varchar(500) DEFAULT NULL COMMENT '商品销售属性:[{"key":"颜色","value":"颜色"},{"key":"容量","value":"4G"}]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COMMENT='订单中所包含的商品';

-- ----------------------------
-- Records of oms_order_item
-- ----------------------------
BEGIN;
INSERT INTO `oms_order_item` VALUES (74, 60, '201902240102000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 33.00, 1, 149, '201902140026004', 19, NULL, NULL, NULL, '单品促销', 33.00, 0.00, 0.00, 0.00, 0, 0, '规格:银色,16G');
INSERT INTO `oms_order_item` VALUES (75, 61, '201902270102000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '小米', '7437789', 649.00, 1, 104, '201808270028003', 19, NULL, NULL, NULL, '满减优惠：满500.00元，减50.00元', 50.00, 0.00, 0.00, 599.00, 0, 0, '规格:银色,16G');
INSERT INTO `oms_order_item` VALUES (76, 62, '201902270102000002', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 1, 100, '201808270027003', 19, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 2699.00, 0, 0, '规格:蓝色,32G');
INSERT INTO `oms_order_item` VALUES (77, 63, '201903140102000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 1, 100, '201808270027003', 19, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 2699.00, 0, 0, '规格:蓝色,32G');
INSERT INTO `oms_order_item` VALUES (78, 64, '201903140102000002', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 33.00, 1, 149, '201902140026004', 19, NULL, NULL, NULL, '单品促销', 33.00, 0.00, 0.00, 0.00, 0, 0, '规格:银色,16G');
INSERT INTO `oms_order_item` VALUES (79, 65, '201903140102000003', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2999.00, 1, 99, '201808270027002', 19, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 2999.00, 0, 0, '规格:黑色,64G');
INSERT INTO `oms_order_item` VALUES (80, 66, '201903140102000004', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 33.00, 2, 149, '201902140026004', 19, NULL, NULL, NULL, '单品促销', 33.00, 0.00, 0.00, 0.00, 0, 0, '规格:银色,16G');
INSERT INTO `oms_order_item` VALUES (81, 67, '201903180102000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 33.00, 1, 149, '201902140026004', 19, NULL, NULL, NULL, '单品促销', 33.00, 0.00, 0.00, 0.00, 0, 0, '规格:银色,16G');
INSERT INTO `oms_order_item` VALUES (82, 68, '201903190102000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 33.00, 76, 148, '201902140026003', 19, NULL, NULL, NULL, '单品促销', 33.00, 0.00, 0.00, 0.00, 0, 0, '规格:金色,128G');
INSERT INTO `oms_order_item` VALUES (83, 69, '201903190102000002', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 33.00, 41, 149, '201902140026004', 19, NULL, NULL, NULL, '单品促销', 33.00, 0.00, 0.00, 0.00, 0, 0, '规格:银色,16G');
INSERT INTO `oms_order_item` VALUES (84, 70, '201903190102000003', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2999.00, 12, 99, '201808270027002', 19, NULL, NULL, NULL, '打折优惠：满3件，打7.50折', 749.75, 0.00, 0.00, 2249.25, 0, 0, '规格:黑色,64G');
INSERT INTO `oms_order_item` VALUES (85, 71, '201903190102000004', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2999.00, 12, 99, '201808270027002', 19, NULL, NULL, NULL, '打折优惠：满3件，打7.50折', 749.75, 0.00, 0.00, 2249.25, 0, 0, '规格:黑色,64G');
INSERT INTO `oms_order_item` VALUES (86, 72, '201903190102000005', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2999.00, 12, 99, '201808270027002', 19, NULL, NULL, NULL, '打折优惠：满3件，打7.50折', 749.75, 0.00, 0.00, 2249.25, 0, 0, '规格:黑色,64G');
INSERT INTO `oms_order_item` VALUES (87, 73, '201903190102000006', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2999.00, 12, 99, '201808270027002', 19, NULL, NULL, NULL, '打折优惠：满3件，打7.50折', 749.75, 0.00, 0.00, 2249.25, 0, 0, '规格:黑色,64G');
INSERT INTO `oms_order_item` VALUES (88, 74, '201903190102000007', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2999.00, 12, 99, '201808270027002', 19, NULL, NULL, NULL, '打折优惠：满3件，打7.50折', 749.75, 0.00, 0.00, 2249.25, 0, 0, '规格:黑色,64G');
INSERT INTO `oms_order_item` VALUES (89, 75, '201903190102000008', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 33.00, 11, 151, '201902140026006', 19, NULL, NULL, NULL, '单品促销', 33.00, 0.00, 0.00, 0.00, 0, 0, '规格:银色,128G');
INSERT INTO `oms_order_item` VALUES (90, 76, '2019040101null000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 33.00, 20, 148, '201902140026003', 19, NULL, NULL, NULL, '单品促销', 33.00, 0.00, 0.00, 0.00, 0, 0, '规格:金色,128G');
INSERT INTO `oms_order_item` VALUES (91, 94, '201904020102000019', 26, NULL, '华为 HUAWEI P20', NULL, NULL, 3788.00, 1, 146, '201806070026001', 19, NULL, NULL, NULL, '单品促销', 22.00, 0.00, 0.00, 3766.00, 0, 0, NULL);
INSERT INTO `oms_order_item` VALUES (92, 95, '2019040301null000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '小米', '7437789', 649.00, 3, 102, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 39.60, 0.00, 0.00, 609.40, 0, 0, '规格:金色,16G');
INSERT INTO `oms_order_item` VALUES (93, 96, '2019040301null000002', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满500.00元，减50.00元', 50.00, 0.00, 0.00, 599.00, 0, 0, '规格:金色,16G');
INSERT INTO `oms_order_item` VALUES (94, 97, '2019040301null000003', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 2, 98, '201808270027001', 19, NULL, NULL, NULL, '打折优惠：满2件，打8.00折', 539.80, 0.00, 0.00, 2159.20, 0, 0, '规格:黑色,32G');
INSERT INTO `oms_order_item` VALUES (95, 98, '2019040301null000004', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 1, 98, '201808270027001', 19, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 2699.00, 0, 0, '规格:黑色,32G');
INSERT INTO `oms_order_item` VALUES (96, 99, '2019040301null000005', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '苹果', '7437799', 5499.00, 3, 106, '201808270029001', 19, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 5499.00, 0, 0, '规格:金色,32G');
INSERT INTO `oms_order_item` VALUES (97, 100, '2019040301null000006', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满500.00元，减50.00元', 50.00, 0.00, 0.00, 599.00, 0, 0, '规格:金色,16G');
INSERT INTO `oms_order_item` VALUES (98, 101, '2019040301null000007', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 5499.00, 0, 0, '规格:金色,32G');
INSERT INTO `oms_order_item` VALUES (99, 102, '201904030102000008', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 1, 98, '201808270027001', 19, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 2699.00, 0, 0, '规格:黑色,32G');
INSERT INTO `oms_order_item` VALUES (100, 103, '201904030102000009', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 5499.00, 0, 0, '规格:金色,32G');
INSERT INTO `oms_order_item` VALUES (101, 104, '201904030101000010', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 7, 98, '201808270027001', 19, NULL, NULL, NULL, '打折优惠：满3件，打7.50折', 674.75, 0.00, 0.00, 2024.25, 0, 0, '规格:黑色,32G');
INSERT INTO `oms_order_item` VALUES (102, 105, '201904030101000011', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2999.00, 1, 99, '201808270027002', 19, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 2999.00, 0, 0, '规格:黑色,64G');
INSERT INTO `oms_order_item` VALUES (103, 106, '201904040101000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 5499.00, 0, 0, '规格:金色,32G');
INSERT INTO `oms_order_item` VALUES (104, 107, '201904080101000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 33.00, 1, 151, '201902140026006', 19, NULL, NULL, NULL, '单品促销', 33.00, 0.00, 0.00, 0.00, 0, 0, '规格:银色,128G');
INSERT INTO `oms_order_item` VALUES (105, 109, '201904080101000003', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 33.00, 1, 148, '201902140026003', 19, NULL, NULL, NULL, '单品促销', 33.00, 0.00, 0.00, 0.00, 0, 0, '规格:金色,128G');
INSERT INTO `oms_order_item` VALUES (106, 110, '201904080101000004', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '6946605', 33.00, 5, 149, '201902140026004', 19, NULL, NULL, NULL, '单品促销', 33.00, 0.00, 0.00, 0.00, 0, 0, '规格:银色,16G');
INSERT INTO `oms_order_item` VALUES (107, 110, '201904080101000004', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '苹果', '7437799', 5499.00, 7, 108, '201808270029003', 19, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 5499.00, 0, 0, '规格:银色,32G');
INSERT INTO `oms_order_item` VALUES (108, 111, '201904080101000005', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满500.00元，减50.00元', 50.00, 0.00, 0.00, 599.00, 0, 0, '规格:金色,16G');
INSERT INTO `oms_order_item` VALUES (109, 112, '201904080102000006', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 4, 98, '201808270027001', 19, NULL, NULL, NULL, '打折优惠：满3件，打7.50折', 674.75, 0.00, 0.00, 2024.25, 0, 0, '规格:黑色,32G');
INSERT INTO `oms_order_item` VALUES (110, 112, '201904080102000006', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '苹果', '7437799', 6299.00, 4, 107, '201808270029002', 19, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 6299.00, 0, 0, '规格:金色,64G');
INSERT INTO `oms_order_item` VALUES (111, 113, '201904090101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '小米', '7437789', 699.00, 4, 103, '201808270028002', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 30.00, 0.00, 0.00, 669.00, 0, 0, '规格:金色,32G');
INSERT INTO `oms_order_item` VALUES (112, 114, '201904090101000002', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 1, 98, '201808270027001', 19, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 2699.00, 0, 0, '规格:黑色,32G');
INSERT INTO `oms_order_item` VALUES (113, 115, '201904090101000003', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '苹果', '7437799', 5499.00, 4, 106, '201808270029001', 19, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 5499.00, 0, 0, '规格:金色,32G');
INSERT INTO `oms_order_item` VALUES (114, 115, '201904090101000003', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '苹果', '7437799', 6299.00, 4, 107, '201808270029002', 19, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 6299.00, 0, 0, '规格:金色,64G');
INSERT INTO `oms_order_item` VALUES (115, 116, '201904090101000004', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '小米', '7437788', 2699.00, 1, 98, '201808270027001', 19, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 2699.00, 0, 0, '规格:黑色,32G');
COMMIT;

-- ----------------------------
-- Table structure for oms_order_operate_history
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_operate_history`;
CREATE TABLE `oms_order_operate_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `operate_man` varchar(100) DEFAULT NULL COMMENT '操作人：用户；系统；后台管理员',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  `order_status` int(1) DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `note` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='订单操作历史记录';

-- ----------------------------
-- Records of oms_order_operate_history
-- ----------------------------
BEGIN;
INSERT INTO `oms_order_operate_history` VALUES (5, 12, '后台管理员', '2018-10-12 14:01:29', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (6, 13, '后台管理员', '2018-10-12 14:01:29', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (7, 12, '后台管理员', '2018-10-12 14:13:10', 4, '订单关闭:买家退货');
INSERT INTO `oms_order_operate_history` VALUES (8, 13, '后台管理员', '2018-10-12 14:13:10', 4, '订单关闭:买家退货');
INSERT INTO `oms_order_operate_history` VALUES (9, 22, '后台管理员', '2018-10-15 16:31:48', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (10, 22, '后台管理员', '2018-10-15 16:35:08', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (11, 22, '后台管理员', '2018-10-15 16:35:59', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (12, 17, '后台管理员', '2018-10-15 16:43:40', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (13, 25, '后台管理员', '2018-10-15 16:52:14', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (14, 26, '后台管理员', '2018-10-15 16:52:14', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (15, 23, '后台管理员', '2018-10-16 14:41:28', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (16, 13, '后台管理员', '2018-10-16 14:42:17', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (17, 18, '后台管理员', '2018-10-16 14:42:17', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (18, 26, '后台管理员', '2018-10-30 14:37:44', 4, '订单关闭:关闭订单');
INSERT INTO `oms_order_operate_history` VALUES (19, 25, '后台管理员', '2018-10-30 15:07:01', 0, '修改收货人信息');
INSERT INTO `oms_order_operate_history` VALUES (20, 25, '后台管理员', '2018-10-30 15:08:13', 0, '修改费用信息');
INSERT INTO `oms_order_operate_history` VALUES (21, 25, '后台管理员', '2018-10-30 15:08:31', 0, '修改备注信息：xxx');
INSERT INTO `oms_order_operate_history` VALUES (22, 25, '后台管理员', '2018-10-30 15:08:39', 4, '订单关闭:2222');
INSERT INTO `oms_order_operate_history` VALUES (23, 62, '后台管理员', '2019-04-01 10:41:13', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (24, 63, '后台管理员', '2019-04-09 09:18:07', 2, '完成发货');
COMMIT;

-- ----------------------------
-- Table structure for oms_order_return_apply
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_apply`;
CREATE TABLE `oms_order_return_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `company_address_id` bigint(20) DEFAULT NULL COMMENT '收货地址表id',
  `product_id` bigint(20) DEFAULT NULL COMMENT '退货商品id',
  `order_sn` varchar(64) DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime DEFAULT NULL COMMENT '申请时间',
  `member_username` varchar(64) DEFAULT NULL COMMENT '会员用户名',
  `return_amount` decimal(10,2) DEFAULT NULL COMMENT '退款金额',
  `return_name` varchar(100) DEFAULT NULL COMMENT '退货人姓名',
  `return_phone` varchar(100) DEFAULT NULL COMMENT '退货人电话',
  `status` int(1) DEFAULT NULL COMMENT '申请状态：0->待处理；1->退货中；2->已完成；3->已拒绝',
  `handle_time` datetime DEFAULT NULL COMMENT '处理时间',
  `product_pic` varchar(500) DEFAULT NULL COMMENT '商品图片',
  `product_name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `product_brand` varchar(200) DEFAULT NULL COMMENT '商品品牌',
  `product_attr` varchar(500) DEFAULT NULL COMMENT '商品销售属性：颜色：红色；尺码：xl;',
  `product_count` int(11) DEFAULT NULL COMMENT '退货数量',
  `product_price` decimal(10,2) DEFAULT NULL COMMENT '商品单价',
  `product_real_price` decimal(10,2) DEFAULT NULL COMMENT '商品实际支付单价',
  `reason` varchar(200) DEFAULT NULL COMMENT '原因',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `proof_pics` varchar(1000) DEFAULT NULL COMMENT '凭证图片，以逗号隔开',
  `handle_note` varchar(500) DEFAULT NULL COMMENT '处理备注',
  `handle_man` varchar(100) DEFAULT NULL COMMENT '处理人员',
  `receive_man` varchar(100) DEFAULT NULL COMMENT '收货人',
  `receive_time` datetime DEFAULT NULL COMMENT '收货时间',
  `receive_note` varchar(500) DEFAULT NULL COMMENT '收货备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='订单退货申请';

-- ----------------------------
-- Records of oms_order_return_apply
-- ----------------------------
BEGIN;
INSERT INTO `oms_order_return_apply` VALUES (3, 12, NULL, 26, '201809150101000001', '2018-10-17 14:34:57', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (4, 12, 2, 27, '201809150101000001', '2018-10-17 14:40:21', 'test', 3585.98, '大梨', '18000000000', 1, '2018-10-18 13:54:10', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', '已经处理了', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (5, 12, 3, 28, '201809150101000001', '2018-10-17 14:44:18', 'test', 3585.98, '大梨', '18000000000', 2, '2018-10-18 13:55:28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', '已经处理了', 'admin', 'admin', '2018-10-18 13:55:58', '已经处理了');
INSERT INTO `oms_order_return_apply` VALUES (8, 13, NULL, 28, '201809150102000002', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 3, '2018-10-18 13:57:12', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', '理由不够充分', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (9, 14, 2, 26, '201809130101000001', '2018-10-17 14:34:57', 'test', 3500.00, '大梨', '18000000000', 2, '2018-10-24 15:44:56', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', '呵呵', 'admin', 'admin', '2018-10-24 15:46:35', '收货了');
INSERT INTO `oms_order_return_apply` VALUES (10, 14, NULL, 27, '201809130101000001', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 3, '2018-10-24 15:46:57', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', '就是不退', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (11, 14, 2, 28, '201809130101000001', '2018-10-17 14:44:18', 'test', 591.05, '大梨', '18000000000', 1, '2018-10-24 17:09:04', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', '可以退款', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (12, 15, 3, 26, '201809130102000002', '2018-10-17 14:34:57', 'test', 3500.00, '大梨', '18000000000', 2, '2018-10-24 17:22:54', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', '退货了', 'admin', 'admin', '2018-10-24 17:23:06', '收货了');
INSERT INTO `oms_order_return_apply` VALUES (13, 15, NULL, 27, '201809130102000002', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 3, '2018-10-24 17:23:30', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', '无法退货', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (15, 16, NULL, 26, '201809140101000001', '2018-10-17 14:34:57', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (16, 16, NULL, 27, '201809140101000001', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (17, 16, NULL, 28, '201809140101000001', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (18, 17, NULL, 26, '201809150101000003', '2018-10-17 14:34:57', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (19, 17, NULL, 27, '201809150101000003', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (20, 17, NULL, 28, '201809150101000003', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (21, 18, NULL, 26, '201809150102000004', '2018-10-17 14:34:57', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (22, 18, NULL, 27, '201809150102000004', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (23, 18, NULL, 28, '201809150102000004', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (24, 19, NULL, 26, '201809130101000003', '2018-10-17 14:34:57', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (25, 19, NULL, 27, '201809130101000003', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (26, 19, NULL, 28, '201809130101000003', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (27, 64, NULL, 26, '201903140102000002', '2019-04-08 16:04:47', 'wxapplettmcyus5qz354', NULL, '张三', '020-81167888', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '规格:银色,16G', 1, 33.00, 0.00, '7天无理由退货', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (28, 60, NULL, 26, '201902240102000001', '2019-04-08 16:06:02', 'wxapplettmcyus5qz354', NULL, '张三', '020-81167888', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '规格:银色,16G', 1, 33.00, 0.00, '价格问题', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (29, 60, NULL, 26, '201902240102000001', '2019-04-08 16:16:06', 'wxapplettmcyus5qz354', NULL, '张三', '020-81167888', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '规格:银色,16G', 1, 33.00, 0.00, '颜色不喜欢', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (30, 60, NULL, 26, '201902240102000001', '2019-04-08 16:38:16', 'wxapplettmcyus5qz354', NULL, '张三', '020-81167888', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '规格:银色,16G', 1, 33.00, 0.00, '尺码太大', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (31, 60, NULL, 74, '201902240102000001', '2019-04-09 16:45:18', 'wxapplettmcyus5qz354', NULL, '', '', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', '华为', '规格:银色,16G', 1, 33.00, NULL, '尺码太大', '太大', '', NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for oms_order_return_reason
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_reason`;
CREATE TABLE `oms_order_return_reason` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '退货类型',
  `sort` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL COMMENT '状态：0->不启用；1->启用',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='退货原因表';

-- ----------------------------
-- Records of oms_order_return_reason
-- ----------------------------
BEGIN;
INSERT INTO `oms_order_return_reason` VALUES (1, '质量问题', 1, 0, '2018-10-17 10:00:45');
INSERT INTO `oms_order_return_reason` VALUES (2, '尺码太大', 1, 1, '2018-10-17 10:01:03');
INSERT INTO `oms_order_return_reason` VALUES (3, '颜色不喜欢', 1, 1, '2018-10-17 10:01:13');
INSERT INTO `oms_order_return_reason` VALUES (4, '7天无理由退货', 1, 1, '2018-10-17 10:01:47');
INSERT INTO `oms_order_return_reason` VALUES (5, '价格问题', 1, 0, '2018-10-17 10:01:57');
INSERT INTO `oms_order_return_reason` VALUES (12, '发票问题', 0, 1, '2018-10-19 16:28:36');
INSERT INTO `oms_order_return_reason` VALUES (13, '其他问题', 0, 1, '2018-10-19 16:28:51');
INSERT INTO `oms_order_return_reason` VALUES (14, '物流问题', 0, 1, '2018-10-19 16:29:01');
INSERT INTO `oms_order_return_reason` VALUES (15, '售后问题', 0, 1, '2018-10-19 16:29:11');
COMMIT;

-- ----------------------------
-- Table structure for oms_order_setting
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_setting`;
CREATE TABLE `oms_order_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `flash_order_overtime` int(11) DEFAULT NULL COMMENT '秒杀订单超时关闭时间(分)',
  `normal_order_overtime` int(11) DEFAULT NULL COMMENT '正常订单超时时间(分)',
  `confirm_overtime` int(11) DEFAULT NULL COMMENT '发货后自动确认收货时间（天）',
  `finish_overtime` int(11) DEFAULT NULL COMMENT '自动完成交易时间，不能申请售后（天）',
  `comment_overtime` int(11) DEFAULT NULL COMMENT '订单完成后自动好评时间（天）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='订单设置表';

-- ----------------------------
-- Records of oms_order_setting
-- ----------------------------
BEGIN;
INSERT INTO `oms_order_setting` VALUES (1, 60, 120, 15, 7, 7);
COMMIT;

-- ----------------------------
-- Table structure for pms_album
-- ----------------------------
DROP TABLE IF EXISTS `pms_album`;
CREATE TABLE `pms_album` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `cover_pic` varchar(1000) DEFAULT NULL,
  `pic_count` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='相册表';

-- ----------------------------
-- Table structure for pms_album_pic
-- ----------------------------
DROP TABLE IF EXISTS `pms_album_pic`;
CREATE TABLE `pms_album_pic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) DEFAULT NULL,
  `pic` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='画册图片表';

-- ----------------------------
-- Table structure for pms_brand
-- ----------------------------
DROP TABLE IF EXISTS `pms_brand`;
CREATE TABLE `pms_brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `first_letter` varchar(8) DEFAULT NULL COMMENT '首字母',
  `sort` int(11) DEFAULT NULL,
  `factory_status` int(1) DEFAULT NULL COMMENT '是否为品牌制造商：0->不是；1->是',
  `show_status` int(1) DEFAULT NULL,
  `product_count` int(11) DEFAULT NULL COMMENT '产品数量',
  `product_comment_count` int(11) DEFAULT NULL COMMENT '产品评论数量',
  `logo` varchar(255) DEFAULT NULL COMMENT '品牌logo',
  `big_pic` varchar(255) DEFAULT NULL COMMENT '专区大图',
  `brand_story` text COMMENT '品牌故事',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='品牌表';

-- ----------------------------
-- Records of pms_brand
-- ----------------------------
BEGIN;
INSERT INTO `pms_brand` VALUES (1, '万和', 'W', 0, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg(5).jpg', '', 'Victoria\'s Secret的故事');
INSERT INTO `pms_brand` VALUES (2, '三星', 'S', 100, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (1).jpg', NULL, '三星的故事');
INSERT INTO `pms_brand` VALUES (3, '华为', 'H', 100, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/17f2dd9756d9d333bee8e60ce8c03e4c_222_222.jpg', NULL, 'Victoria\'s Secret的故事');
INSERT INTO `pms_brand` VALUES (4, '格力', 'G', 30, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/dc794e7e74121272bbe3ce9bc41ec8c3_222_222.jpg', NULL, 'Victoria\'s Secret的故事');
INSERT INTO `pms_brand` VALUES (5, '方太', 'F', 20, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (4).jpg', NULL, 'Victoria\'s Secret的故事');
INSERT INTO `pms_brand` VALUES (6, '小米', 'M', 500, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/1e34aef2a409119018a4c6258e39ecfb_222_222.png', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180518/5afd7778Nf7800b75.jpg', '小米手机的故事');
INSERT INTO `pms_brand` VALUES (21, 'OPPO', 'O', 0, 1, 1, 88, 500, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg(6).jpg', '', 'string');
INSERT INTO `pms_brand` VALUES (49, '七匹狼', 'S', 200, 1, 1, 77, 400, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/18d8bc3eb13533fab466d702a0d3fd1f40345bcd.jpg', NULL, 'BOOB的故事');
INSERT INTO `pms_brand` VALUES (50, '海澜之家', 'H', 200, 1, 1, 66, 300, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/99d3279f1029d32b929343b09d3c72de_222_222.jpg', '', '海澜之家的故事');
INSERT INTO `pms_brand` VALUES (51, '苹果', 'A', 200, 1, 1, 55, 200, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg.jpg', NULL, '苹果的故事');
INSERT INTO `pms_brand` VALUES (58, 'NIKE', 'N', 0, 1, 1, 33, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/timg (51).jpg', '', 'NIKE的故事');
COMMIT;

-- ----------------------------
-- Table structure for pms_comment
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment`;
CREATE TABLE `pms_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `member_nick_name` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `star` int(3) DEFAULT NULL COMMENT '评价星数：0->5',
  `member_ip` varchar(64) DEFAULT NULL COMMENT '评价的ip',
  `create_time` datetime DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL,
  `product_attribute` varchar(255) DEFAULT NULL COMMENT '购买时的商品属性',
  `collect_couont` int(11) DEFAULT NULL,
  `read_count` int(11) DEFAULT NULL,
  `content` text,
  `pics` varchar(1000) DEFAULT NULL COMMENT '上传图片地址，以逗号隔开',
  `member_icon` varchar(255) DEFAULT NULL COMMENT '评论用户头像',
  `replay_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品评价表';

-- ----------------------------
-- Table structure for pms_comment_replay
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment_replay`;
CREATE TABLE `pms_comment_replay` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) DEFAULT NULL,
  `member_nick_name` varchar(255) DEFAULT NULL,
  `member_icon` varchar(255) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `type` int(1) DEFAULT NULL COMMENT '评论人员类型；0->会员；1->管理员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品评价回复表';

-- ----------------------------
-- Table structure for pms_feight_template
-- ----------------------------
DROP TABLE IF EXISTS `pms_feight_template`;
CREATE TABLE `pms_feight_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `charge_type` int(1) DEFAULT NULL COMMENT '计费类型:0->按重量；1->按件数',
  `first_weight` decimal(10,2) DEFAULT NULL COMMENT '首重kg',
  `first_fee` decimal(10,2) DEFAULT NULL COMMENT '首费（元）',
  `continue_weight` decimal(10,2) DEFAULT NULL,
  `continme_fee` decimal(10,2) DEFAULT NULL,
  `dest` varchar(255) DEFAULT NULL COMMENT '目的地（省、市）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运费模版';

-- ----------------------------
-- Table structure for pms_member_price
-- ----------------------------
DROP TABLE IF EXISTS `pms_member_price`;
CREATE TABLE `pms_member_price` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `member_level_id` bigint(20) DEFAULT NULL,
  `member_price` decimal(10,2) DEFAULT NULL COMMENT '会员价格',
  `member_level_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8 COMMENT='商品会员价格表';

-- ----------------------------
-- Records of pms_member_price
-- ----------------------------
BEGIN;
INSERT INTO `pms_member_price` VALUES (26, 7, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (27, 8, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (28, 9, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (29, 10, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (30, 11, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (31, 12, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (32, 13, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (33, 14, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (37, 18, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (44, 7, 2, 480.00, NULL);
INSERT INTO `pms_member_price` VALUES (45, 7, 3, 450.00, NULL);
INSERT INTO `pms_member_price` VALUES (52, 22, 1, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (53, 22, 2, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (54, 22, 3, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (58, 24, 1, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (59, 24, 2, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (60, 24, 3, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (112, 23, 1, 88.00, '黄金会员');
INSERT INTO `pms_member_price` VALUES (113, 23, 2, 88.00, '白金会员');
INSERT INTO `pms_member_price` VALUES (114, 23, 3, 66.00, '钻石会员');
INSERT INTO `pms_member_price` VALUES (142, 31, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (143, 31, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (144, 31, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (148, 32, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (149, 32, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (150, 32, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (154, 33, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (155, 33, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (156, 33, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (169, 36, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (170, 36, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (171, 36, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (172, 35, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (173, 35, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (174, 35, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (175, 34, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (176, 34, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (177, 34, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (178, 30, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (179, 30, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (180, 30, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (192, 27, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (193, 27, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (194, 27, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (195, 28, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (196, 28, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (197, 28, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (198, 29, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (199, 29, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (200, 29, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (219, 37, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (220, 37, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (221, 37, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (228, 26, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (229, 26, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (230, 26, 3, NULL, '钻石会员');
COMMIT;

-- ----------------------------
-- Table structure for pms_product
-- ----------------------------
DROP TABLE IF EXISTS `pms_product`;
CREATE TABLE `pms_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) DEFAULT NULL,
  `product_category_id` bigint(20) DEFAULT NULL,
  `feight_template_id` bigint(20) DEFAULT NULL,
  `product_attribute_category_id` bigint(20) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `product_sn` varchar(64) NOT NULL COMMENT '货号',
  `delete_status` int(1) DEFAULT NULL COMMENT '删除状态：0->未删除；1->已删除',
  `publish_status` int(1) DEFAULT NULL COMMENT '上架状态：0->下架；1->上架',
  `new_status` int(1) DEFAULT NULL COMMENT '新品状态:0->不是新品；1->新品',
  `recommand_status` int(1) DEFAULT NULL COMMENT '推荐状态；0->不推荐；1->推荐',
  `verify_status` int(1) DEFAULT NULL COMMENT '审核状态：0->未审核；1->审核通过',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `sale` int(11) DEFAULT NULL COMMENT '销量',
  `price` decimal(10,2) DEFAULT NULL,
  `promotion_price` decimal(10,2) DEFAULT NULL COMMENT '促销价格',
  `gift_growth` int(11) DEFAULT '0' COMMENT '赠送的成长值',
  `gift_point` int(11) DEFAULT '0' COMMENT '赠送的积分',
  `use_point_limit` int(11) DEFAULT NULL COMMENT '限制使用的积分数',
  `sub_title` varchar(255) DEFAULT NULL COMMENT '副标题',
  `description` text COMMENT '商品描述',
  `original_price` decimal(10,2) DEFAULT NULL COMMENT '市场价',
  `stock` int(11) DEFAULT NULL COMMENT '库存',
  `low_stock` int(11) DEFAULT NULL COMMENT '库存预警值',
  `unit` varchar(16) DEFAULT NULL COMMENT '单位',
  `weight` decimal(10,2) DEFAULT NULL COMMENT '商品重量，默认为克',
  `preview_status` int(1) DEFAULT NULL COMMENT '是否为预告商品：0->不是；1->是',
  `service_ids` varchar(64) DEFAULT NULL COMMENT '以逗号分割的产品服务：1->无忧退货；2->快速退款；3->免费包邮',
  `keywords` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `album_pics` varchar(255) DEFAULT NULL COMMENT '画册图片，连产品图片限制为5张，以逗号分割',
  `detail_title` varchar(255) DEFAULT NULL,
  `detail_desc` text,
  `detail_html` text COMMENT '产品详情网页内容',
  `detail_mobile_html` text COMMENT '移动端网页详情',
  `promotion_start_time` datetime DEFAULT NULL COMMENT '促销开始时间',
  `promotion_end_time` datetime DEFAULT NULL COMMENT '促销结束时间',
  `promotion_per_limit` int(11) DEFAULT NULL COMMENT '活动限购数量',
  `promotion_type` int(1) DEFAULT NULL COMMENT '促销类型：0->没有促销使用原价;1->使用促销价；2->使用会员价；3->使用阶梯价格；4->使用满减价格；5->限时购',
  `brand_name` varchar(255) DEFAULT NULL COMMENT '品牌名称',
  `product_category_name` varchar(255) DEFAULT NULL COMMENT '商品分类名称',
  `supply_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='商品信息';

-- ----------------------------
-- Records of pms_product
-- ----------------------------
BEGIN;
INSERT INTO `pms_product` VALUES (1, 49, 7, 0, 0, '银色星芒刺绣网纱底裤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 1, 1, 1, 100, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '七匹狼', '外套', NULL);
INSERT INTO `pms_product` VALUES (2, 49, 7, 0, 0, '银色星芒刺绣网纱底裤2', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86578', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤2', '银色星芒刺绣网纱底裤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '<p>银色星芒刺绣网纱底裤</p>', '<p>银色星芒刺绣网纱底裤</p>', NULL, NULL, NULL, 0, '七匹狼', '外套', NULL);
INSERT INTO `pms_product` VALUES (3, 1, 7, 0, 0, '银色星芒刺绣网纱底裤3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86579', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤3', '银色星芒刺绣网纱底裤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和', '外套', NULL);
INSERT INTO `pms_product` VALUES (4, 1, 7, 0, 0, '银色星芒刺绣网纱底裤4', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86580', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤4', '银色星芒刺绣网纱底裤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和', '外套', NULL);
INSERT INTO `pms_product` VALUES (5, 1, 7, 0, 0, '银色星芒刺绣网纱底裤5', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86581', 1, 0, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤5', '银色星芒刺绣网纱底裤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和', '外套', NULL);
INSERT INTO `pms_product` VALUES (6, 1, 7, 0, 0, '银色星芒刺绣网纱底裤6', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86582', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤6', '银色星芒刺绣网纱底裤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和', '外套', NULL);
INSERT INTO `pms_product` VALUES (7, 1, 7, 0, 1, '女式超柔软拉毛运动开衫', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 0, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套', NULL);
INSERT INTO `pms_product` VALUES (8, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套', NULL);
INSERT INTO `pms_product` VALUES (9, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 0, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套', NULL);
INSERT INTO `pms_product` VALUES (10, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套', NULL);
INSERT INTO `pms_product` VALUES (11, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套', NULL);
INSERT INTO `pms_product` VALUES (12, 1, 7, 0, 1, '女式超柔软拉毛运动开衫2', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 0, 1, 1, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套', NULL);
INSERT INTO `pms_product` VALUES (13, 1, 7, 0, 1, '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套', NULL);
INSERT INTO `pms_product` VALUES (14, 1, 7, 0, 1, '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 0, 0, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套', NULL);
INSERT INTO `pms_product` VALUES (18, 1, 7, 0, 1, '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套', NULL);
INSERT INTO `pms_product` VALUES (22, 6, 7, 0, 1, 'test', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', '', 1, 1, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, 'test', '', 0.00, 100, 0, '', 0.00, 1, '1,2', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', '', '', '', '', NULL, NULL, 0, 0, '小米', '外套', NULL);
INSERT INTO `pms_product` VALUES (23, 6, 19, 0, 1, '毛衫测试', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', 'NO.1098', 0, 1, 1, 1, 0, 0, 0, 99.00, NULL, 99, 99, 1000, '毛衫测试11', 'xxx', 109.00, 100, 0, '件', 1000.00, 1, '1,2,3', '毛衫测试', '毛衫测试', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', '毛衫测试', '毛衫测试', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/155x54.bmp\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/APP登录bg1080.jpg\" width=\"500\" height=\"500\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/APP登录界面.jpg\" width=\"500\" height=\"500\" /></p>', '', NULL, NULL, 0, 2, '小米', '手机通讯', NULL);
INSERT INTO `pms_product` VALUES (24, 6, 7, 0, NULL, 'xxx', '', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, 'xxx', '', 0.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '小米', '外套', NULL);
INSERT INTO `pms_product` VALUES (26, 3, 19, 0, 3, '华为 HUAWEI P20 ', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '6946605', 0, 1, 1, 1, 0, 100, 0, 3788.00, NULL, 3788, 3788, 0, 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '', 4288.00, 1000, 0, '件', 0.00, 1, '2,3,1', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ab46a3cN616bdc41.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf5fN2522b9dc.jpg', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44f1cNf51f3bb0.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa8Nfcf71c10.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa9N40e78ee0.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f4N1c94bdda.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f5Nd30de41d.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5b10fb0eN0eb053fb.jpg\" /></p>', '', NULL, NULL, 0, 1, '华为', '手机通讯', NULL);
INSERT INTO `pms_product` VALUES (27, 6, 19, 0, 3, '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '7437788', 0, 1, 1, 1, 0, 0, 0, 2699.00, NULL, 2699, 2699, 0, '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', 2699.00, 100, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b2254e8N414e6d3a.jpg\" width=\"500\" /></p>', '', NULL, NULL, 0, 3, '小米', '手机通讯', NULL);
INSERT INTO `pms_product` VALUES (28, 6, 19, 0, 3, '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '7437789', 0, 1, 1, 1, 0, 0, 0, 649.00, NULL, 649, 649, 0, '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '', 649.00, 100, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '', '', '', '', NULL, NULL, 0, 4, '小米', '手机通讯', NULL);
INSERT INTO `pms_product` VALUES (29, 51, 19, 0, 3, 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', '7437799', 0, 1, 1, 0, 0, 0, 0, 5499.00, NULL, 5499, 5499, 0, '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '', 5499.00, 100, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', '', '', '', '', NULL, NULL, 0, 0, '苹果', '手机通讯', NULL);
INSERT INTO `pms_product` VALUES (30, 50, 8, 0, 1, 'HLA海澜之家简约动物印花短袖T恤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ad83a4fN6ff67ecd.jpg!cc_350x449.jpg', 'HNTBJ2E042A', 0, 1, 1, 1, 0, 0, 0, 98.00, NULL, 0, 0, 0, '2018夏季新品微弹舒适新款短T男生 6月6日-6月20日，满300减30，参与互动赢百元礼券，立即分享赢大奖', '', 98.00, 100, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ad83a4fN6ff67ecd.jpg!cc_350x449.jpg', '', '', '', '', NULL, NULL, 0, 0, '海澜之家', 'T恤', NULL);
INSERT INTO `pms_product` VALUES (31, 50, 8, 0, 1, 'HLA海澜之家蓝灰花纹圆领针织布短袖T恤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ac98b64N70acd82f.jpg!cc_350x449.jpg', 'HNTBJ2E080A', 0, 1, 0, 0, 0, 0, 0, 98.00, NULL, 0, 0, 0, '2018夏季新品短袖T恤男HNTBJ2E080A 蓝灰花纹80 175/92A/L80A 蓝灰花纹80 175/92A/L', '', 98.00, 100, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ac98b64N70acd82f.jpg!cc_350x449.jpg', '', '', '', '', NULL, NULL, 0, 0, '海澜之家', 'T恤', NULL);
INSERT INTO `pms_product` VALUES (32, 50, 8, 0, NULL, 'HLA海澜之家短袖T恤男基础款', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a51eb88Na4797877.jpg', 'HNTBJ2E153A', 0, 1, 0, 0, 0, 0, 0, 68.00, NULL, 0, 0, 0, 'HLA海澜之家短袖T恤男基础款简约圆领HNTBJ2E153A藏青(F3)175/92A(50)', '', 68.00, 100, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a51eb88Na4797877.jpg', '', '', '', '', NULL, NULL, 0, 0, '海澜之家', 'T恤', NULL);
INSERT INTO `pms_product` VALUES (33, 6, 35, 0, NULL, '小米（MI）小米电视4A ', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b02804dN66004d73.jpg', '4609652', 0, 1, 0, 0, 0, 0, 0, 2499.00, NULL, 0, 0, 0, '小米（MI）小米电视4A 55英寸 L55M5-AZ/L55M5-AD 2GB+8GB HDR 4K超高清 人工智能网络液晶平板电视', '', 2499.00, 100, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b02804dN66004d73.jpg', '', '', '', '', NULL, NULL, 0, 0, '小米', '手机数码', NULL);
INSERT INTO `pms_product` VALUES (34, 6, 35, 0, NULL, '小米（MI）小米电视4A 65英寸', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b028530N51eee7d4.jpg', '4609660', 0, 1, 0, 0, 0, 0, 0, 3999.00, NULL, 0, 0, 0, ' L65M5-AZ/L65M5-AD 2GB+8GB HDR 4K超高清 人工智能网络液晶平板电视', '', 3999.00, 100, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b028530N51eee7d4.jpg', '', '', '', '', NULL, NULL, 0, 0, '小米', '手机数码', NULL);
INSERT INTO `pms_product` VALUES (35, 58, 29, 0, NULL, '耐克NIKE 男子 休闲鞋 ROSHE RUN 运动鞋 511881-010黑色41码', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b235bb9Nf606460b.jpg', '6799342', 0, 1, 0, 0, 0, 0, 0, 369.00, NULL, 0, 0, 0, '耐克NIKE 男子 休闲鞋 ROSHE RUN 运动鞋 511881-010黑色41码', '', 369.00, 100, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b235bb9Nf606460b.jpg', '', '', '', '', NULL, NULL, 0, 0, 'NIKE', '男鞋', NULL);
INSERT INTO `pms_product` VALUES (36, 58, 29, 0, NULL, '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '6799345', 0, 1, 1, 1, 0, 0, 0, 499.00, NULL, 0, 0, 0, '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '', 499.00, 100, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '', '', '', '', NULL, NULL, 0, 0, 'NIKE', '男鞋', NULL);
INSERT INTO `pms_product` VALUES (37, 5, 7, 0, 1, '测试衣服', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b235bb9Nf606460b.jpg', '1234', 0, 1, 1, 1, 0, 1, 0, 11.00, 44.00, 2, 2, 22, '测试衣服', '测试衣服', 12.00, 222, 0, '剑', 12.00, 0, '3', '缺钱', '缺钱', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b235bb9Nf606460b.jpg', '测试商品详细', '缺钱', '<p>11111</p>', '', '2019-02-15 00:00:00', '2019-02-28 00:00:00', 0, 1, '方太', '外套', NULL);
INSERT INTO `pms_product` VALUES (38, 3, 19, 0, 3, '华为notneed0 ', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '6946605', 0, 1, 1, 1, 0, 100, 0, 3788.00, NULL, 3788, 3788, 0, 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '', 4288.00, 1000, 0, '件', 0.00, 1, '2,3,1', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ab46a3cN616bdc41.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf5fN2522b9dc.jpg', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44f1cNf51f3bb0.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa8Nfcf71c10.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa9N40e78ee0.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f4N1c94bdda.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f5Nd30de41d.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5b10fb0eN0eb053fb.jpg\" /></p>', '', NULL, NULL, 0, 1, '华为', '手机通讯', NULL);
INSERT INTO `pms_product` VALUES (39, 6, 19, 0, 3, '小米8 全面notneed0 ', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '7437788', 0, 1, 1, 1, 0, 0, 0, 2699.00, NULL, 2699, 2699, 0, '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '小米8notneed', 2699.00, 100, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b2254e8N414e6d3a.jpg\" width=\"500\" /></p>', '', NULL, NULL, 0, 3, '小米', '手机通讯', NULL);
INSERT INTO `pms_product` VALUES (40, 6, 19, 0, 3, '小米 notneed', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '7437789', 0, 1, 1, 1, 0, 0, 0, 649.00, NULL, 649, 649, 0, '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '', 649.00, 100, 0, '', 0.00, 0, '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '', '', '', '', NULL, NULL, 0, 4, '小米', '手机通讯', NULL);
COMMIT;

-- ----------------------------
-- Table structure for pms_product_attribute
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute`;
CREATE TABLE `pms_product_attribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_attribute_category_id` bigint(20) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `select_type` int(1) DEFAULT NULL COMMENT '属性选择类型：0->唯一；1->单选；2->多选',
  `input_type` int(1) DEFAULT NULL COMMENT '属性录入方式：0->手工录入；1->从列表中选取',
  `input_list` varchar(255) DEFAULT NULL COMMENT '可选值列表，以逗号隔开',
  `sort` int(11) DEFAULT NULL COMMENT '排序字段：最高的可以单独上传图片',
  `filter_type` int(1) DEFAULT NULL COMMENT '分类筛选样式：1->普通；1->颜色',
  `search_type` int(1) DEFAULT NULL COMMENT '检索类型；0->不需要进行检索；1->关键字检索；2->范围检索',
  `related_status` int(1) DEFAULT NULL COMMENT '相同属性产品是否关联；0->不关联；1->关联',
  `hand_add_status` int(1) DEFAULT NULL COMMENT '是否支持手动新增；0->不支持；1->支持',
  `type` int(1) DEFAULT NULL COMMENT '属性的类型；0->规格；1->参数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='商品属性参数表';

-- ----------------------------
-- Records of pms_product_attribute
-- ----------------------------
BEGIN;
INSERT INTO `pms_product_attribute` VALUES (1, 1, '尺寸', 2, 1, 'M,X,XL,2XL,3XL,4XL', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (7, 1, '颜色', 2, 1, '黑色,红色,白色,粉色', 100, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (13, 0, '上市年份', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (14, 0, '上市年份1', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (15, 0, '上市年份2', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (16, 0, '上市年份3', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (17, 0, '上市年份4', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (18, 0, '上市年份5', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (19, 0, '适用对象', 1, 1, '青年女性,中年女性', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (20, 0, '适用对象1', 2, 1, '青年女性,中年女性', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (21, 0, '适用对象3', 2, 1, '青年女性,中年女性', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (24, 1, '商品编号', 1, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (25, 1, '适用季节', 1, 1, '春季,夏季,秋季,冬季', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (32, 2, '适用人群', 0, 1, '老年,青年,中年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (33, 2, '风格', 0, 1, '嘻哈风格,基础大众,商务正装', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (35, 2, '颜色', 0, 0, '', 100, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (37, 1, '适用人群', 1, 1, '儿童,青年,中年,老年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (38, 1, '上市时间', 1, 1, '2017年秋,2017年冬,2018年春,2018年夏', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (39, 1, '袖长', 1, 1, '短袖,长袖,中袖', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (40, 2, '尺码', 0, 1, '29,30,31,32,33,34', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (41, 2, '适用场景', 0, 1, '居家,运动,正装', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (42, 2, '上市时间', 0, 1, '2018年春,2018年夏', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (43, 3, '颜色', 0, 0, '', 100, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (44, 3, '容量', 0, 1, '16G,32G,64G,128G', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (45, 3, '屏幕尺寸', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (46, 3, '网络', 0, 1, '3G,4G', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (47, 3, '系统', 0, 1, 'Android,IOS', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (48, 3, '电池容量', 0, 0, '', 0, 0, 0, 0, 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for pms_product_attribute_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute_category`;
CREATE TABLE `pms_product_attribute_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `attribute_count` int(11) DEFAULT '0' COMMENT '属性数量',
  `param_count` int(11) DEFAULT '0' COMMENT '参数数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='产品属性分类表';

-- ----------------------------
-- Records of pms_product_attribute_category
-- ----------------------------
BEGIN;
INSERT INTO `pms_product_attribute_category` VALUES (1, '服装-T恤', 2, 5);
INSERT INTO `pms_product_attribute_category` VALUES (2, '服装-裤装', 2, 4);
INSERT INTO `pms_product_attribute_category` VALUES (3, '手机数码-手机通讯', 2, 4);
INSERT INTO `pms_product_attribute_category` VALUES (4, '配件', 0, 0);
INSERT INTO `pms_product_attribute_category` VALUES (5, '居家', 0, 0);
INSERT INTO `pms_product_attribute_category` VALUES (6, '洗护', 0, 0);
INSERT INTO `pms_product_attribute_category` VALUES (10, '测试分类', 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for pms_product_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute_value`;
CREATE TABLE `pms_product_attribute_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `product_attribute_id` bigint(20) DEFAULT NULL,
  `value` varchar(64) DEFAULT NULL COMMENT '手动添加规格或参数的值，参数单值，规格有多个时以逗号隔开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=282 DEFAULT CHARSET=utf8 COMMENT='存储产品参数信息的表';

-- ----------------------------
-- Records of pms_product_attribute_value
-- ----------------------------
BEGIN;
INSERT INTO `pms_product_attribute_value` VALUES (1, 9, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (2, 10, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (3, 11, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (4, 12, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (5, 13, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (6, 14, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (7, 18, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (8, 7, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (9, 7, 1, 'XL');
INSERT INTO `pms_product_attribute_value` VALUES (10, 7, 1, 'XXL');
INSERT INTO `pms_product_attribute_value` VALUES (11, 22, 7, 'x,xx');
INSERT INTO `pms_product_attribute_value` VALUES (12, 22, 24, 'no110');
INSERT INTO `pms_product_attribute_value` VALUES (13, 22, 25, '春季');
INSERT INTO `pms_product_attribute_value` VALUES (14, 22, 37, '青年');
INSERT INTO `pms_product_attribute_value` VALUES (15, 22, 38, '2018年春');
INSERT INTO `pms_product_attribute_value` VALUES (16, 22, 39, '长袖');
INSERT INTO `pms_product_attribute_value` VALUES (124, 23, 7, '米白色,浅黄色');
INSERT INTO `pms_product_attribute_value` VALUES (125, 23, 24, 'no1098');
INSERT INTO `pms_product_attribute_value` VALUES (126, 23, 25, '春季');
INSERT INTO `pms_product_attribute_value` VALUES (127, 23, 37, '青年');
INSERT INTO `pms_product_attribute_value` VALUES (128, 23, 38, '2018年春');
INSERT INTO `pms_product_attribute_value` VALUES (129, 23, 39, '长袖');
INSERT INTO `pms_product_attribute_value` VALUES (130, 1, 13, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (131, 1, 14, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (132, 1, 15, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (133, 1, 16, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (134, 1, 17, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (135, 1, 18, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (136, 1, 19, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (137, 1, 20, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (138, 1, 21, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (139, 2, 13, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (140, 2, 14, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (141, 2, 15, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (142, 2, 16, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (143, 2, 17, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (144, 2, 18, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (145, 2, 19, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (146, 2, 20, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (147, 2, 21, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (183, 31, 24, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (184, 31, 25, '夏季');
INSERT INTO `pms_product_attribute_value` VALUES (185, 31, 37, '青年');
INSERT INTO `pms_product_attribute_value` VALUES (186, 31, 38, '2018年夏');
INSERT INTO `pms_product_attribute_value` VALUES (187, 31, 39, '短袖');
INSERT INTO `pms_product_attribute_value` VALUES (198, 30, 24, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (199, 30, 25, '夏季');
INSERT INTO `pms_product_attribute_value` VALUES (200, 30, 37, '青年');
INSERT INTO `pms_product_attribute_value` VALUES (201, 30, 38, '2018年夏');
INSERT INTO `pms_product_attribute_value` VALUES (202, 30, 39, '短袖');
INSERT INTO `pms_product_attribute_value` VALUES (213, 27, 43, '黑色,蓝色');
INSERT INTO `pms_product_attribute_value` VALUES (214, 27, 45, '5.8');
INSERT INTO `pms_product_attribute_value` VALUES (215, 27, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (216, 27, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (217, 27, 48, '3000ml');
INSERT INTO `pms_product_attribute_value` VALUES (218, 28, 43, '金色,银色');
INSERT INTO `pms_product_attribute_value` VALUES (219, 28, 45, '5.0');
INSERT INTO `pms_product_attribute_value` VALUES (220, 28, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (221, 28, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (222, 28, 48, '2800ml');
INSERT INTO `pms_product_attribute_value` VALUES (223, 29, 43, '金色,银色');
INSERT INTO `pms_product_attribute_value` VALUES (224, 29, 45, '4.7');
INSERT INTO `pms_product_attribute_value` VALUES (225, 29, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (226, 29, 47, 'IOS');
INSERT INTO `pms_product_attribute_value` VALUES (227, 29, 48, '1960ml');
INSERT INTO `pms_product_attribute_value` VALUES (261, 37, 7, '红色,蓝色');
INSERT INTO `pms_product_attribute_value` VALUES (262, 37, 24, '123');
INSERT INTO `pms_product_attribute_value` VALUES (263, 37, 25, '春季');
INSERT INTO `pms_product_attribute_value` VALUES (264, 37, 37, '儿童');
INSERT INTO `pms_product_attribute_value` VALUES (265, 37, 38, '2017年秋');
INSERT INTO `pms_product_attribute_value` VALUES (266, 37, 39, '短袖');
INSERT INTO `pms_product_attribute_value` VALUES (277, 26, 43, '金色,银色');
INSERT INTO `pms_product_attribute_value` VALUES (278, 26, 45, '5.0');
INSERT INTO `pms_product_attribute_value` VALUES (279, 26, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (280, 26, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (281, 26, 48, '3000');
COMMIT;

-- ----------------------------
-- Table structure for pms_product_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_category`;
CREATE TABLE `pms_product_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上机分类的编号：0表示一级分类',
  `name` varchar(64) DEFAULT NULL,
  `level` int(1) DEFAULT NULL COMMENT '分类级别：0->1级；1->2级',
  `product_count` int(11) DEFAULT NULL,
  `product_unit` varchar(64) DEFAULT NULL,
  `nav_status` int(1) DEFAULT NULL COMMENT '是否显示在导航栏：0->不显示；1->显示',
  `show_status` int(1) DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
  `sort` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `keywords` varchar(255) DEFAULT NULL,
  `description` text COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='产品分类';

-- ----------------------------
-- Records of pms_product_category
-- ----------------------------
BEGIN;
INSERT INTO `pms_product_category` VALUES (1, 0, '服装', 0, 100, '件', 1, 1, 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_waitao.png', '服装', '服装分类');
INSERT INTO `pms_product_category` VALUES (2, 0, '手机数码', 0, 100, '件', 1, 1, 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_peijian.png', '手机数码', '手机数码');
INSERT INTO `pms_product_category` VALUES (3, 0, '家用电器', 0, 100, '件', 1, 1, 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/subject_cate_jiadian.png', '家用电器', '家用电器');
INSERT INTO `pms_product_category` VALUES (4, 0, '家具家装', 0, 100, '件', 1, 1, 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_peijian.png', '家具家装', '家具家装');
INSERT INTO `pms_product_category` VALUES (5, 0, '汽车用品', 0, 100, '件', 1, 1, 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_peijian.png', '汽车用品', '汽车用品');
INSERT INTO `pms_product_category` VALUES (7, 1, '外套', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_waitao.png', '外套', '外套');
INSERT INTO `pms_product_category` VALUES (8, 1, 'T恤', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_tshirt.png', 'T恤', 'T恤');
INSERT INTO `pms_product_category` VALUES (9, 1, '休闲裤', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_xiuxianku.png', '休闲裤', '休闲裤');
INSERT INTO `pms_product_category` VALUES (10, 1, '牛仔裤', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_niuzaiku.png', '牛仔裤', '牛仔裤');
INSERT INTO `pms_product_category` VALUES (11, 1, '衬衫', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_chenshan.png', '衬衫', '衬衫分类');
INSERT INTO `pms_product_category` VALUES (13, 12, '家电子分类1', 1, 1, 'string', 0, 1, 0, 'string', 'string', 'string');
INSERT INTO `pms_product_category` VALUES (14, 12, '家电子分类2', 1, 1, 'string', 0, 1, 0, 'string', 'string', 'string');
INSERT INTO `pms_product_category` VALUES (19, 2, '手机通讯', 1, 0, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_shouji.png', '手机通讯', '手机通讯');
INSERT INTO `pms_product_category` VALUES (29, 1, '男鞋', 1, 0, '', 0, 0, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_xie.png', '', '');
INSERT INTO `pms_product_category` VALUES (30, 2, '手机配件', 1, 0, '', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_peijian.png', '手机配件', '手机配件');
INSERT INTO `pms_product_category` VALUES (31, 2, '摄影摄像', 1, 0, '', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_sheying.png', '', '');
INSERT INTO `pms_product_category` VALUES (32, 2, '影音娱乐', 1, 0, '', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_yule.png', '', '');
INSERT INTO `pms_product_category` VALUES (33, 2, '数码配件', 1, 0, '', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_yule.png', '', '');
INSERT INTO `pms_product_category` VALUES (34, 2, '智能设备', 1, 0, '', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_zhineng.png', '', '');
INSERT INTO `pms_product_category` VALUES (35, 3, '电视', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (36, 3, '空调', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (37, 3, '洗衣机', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (38, 3, '冰箱', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (39, 3, '厨卫大电', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (40, 3, '厨房小电', 1, 0, '', 0, 0, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (41, 3, '生活电器', 1, 0, '', 0, 0, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (42, 3, '个护健康', 1, 0, '', 0, 0, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (43, 4, '厨房卫浴', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (44, 4, '灯饰照明', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (45, 4, '五金工具', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (46, 4, '卧室家具', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (47, 4, '客厅家具', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (48, 5, '全新整车', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (49, 5, '车载电器', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (50, 5, '维修保养', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (51, 5, '汽车装饰', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (52, 0, '测试分类', 0, 0, '11', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_peijian.png', '', '');
COMMIT;

-- ----------------------------
-- Table structure for pms_product_category_attribute_relation
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_category_attribute_relation`;
CREATE TABLE `pms_product_category_attribute_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_category_id` bigint(20) DEFAULT NULL,
  `product_attribute_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='产品的分类和属性的关系表，用于设置分类筛选条件（只支持一级分类）';

-- ----------------------------
-- Records of pms_product_category_attribute_relation
-- ----------------------------
BEGIN;
INSERT INTO `pms_product_category_attribute_relation` VALUES (1, 24, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (5, 26, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (7, 28, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (9, 25, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (10, 25, 25);
INSERT INTO `pms_product_category_attribute_relation` VALUES (11, 52, 24);
COMMIT;

-- ----------------------------
-- Table structure for pms_product_consult
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_consult`;
CREATE TABLE `pms_product_consult` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '咨询编号',
  `goods_id` bigint(11) unsigned DEFAULT '0' COMMENT '商品编号',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `member_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '咨询发布者会员编号(0：游客)',
  `member_name` varchar(100) DEFAULT NULL COMMENT '会员名称',
  `store_id` bigint(11) unsigned DEFAULT '0' COMMENT '店铺编号',
  `email` varchar(255) DEFAULT NULL COMMENT '咨询发布者邮箱',
  `consult_content` varchar(255) DEFAULT NULL COMMENT '咨询内容',
  `consult_addtime` datetime DEFAULT NULL COMMENT '咨询添加时间',
  `consult_reply` varchar(255) DEFAULT NULL COMMENT '咨询回复内容',
  `consult_reply_time` datetime DEFAULT NULL COMMENT '咨询回复时间',
  `isanonymous` tinyint(1) DEFAULT '0' COMMENT '0表示不匿名 1表示匿名',
  `is_del` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `seller_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='产品咨询表';

-- ----------------------------
-- Records of pms_product_consult
-- ----------------------------
BEGIN;
INSERT INTO `pms_product_consult` VALUES (1, 26, '11', 1, '11', 1, NULL, '1111', '2019-02-23 13:00:10', '2222', '2019-02-23 13:00:14', 0, 0);
INSERT INTO `pms_product_consult` VALUES (2, 26, '22', 2, '22', 2, NULL, '22', '2019-02-23 13:00:33', '333', '2019-02-23 13:00:38', 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for pms_product_full_reduction
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_full_reduction`;
CREATE TABLE `pms_product_full_reduction` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `full_price` decimal(10,2) DEFAULT NULL,
  `reduce_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='产品满减表(只针对同商品)';

-- ----------------------------
-- Records of pms_product_full_reduction
-- ----------------------------
BEGIN;
INSERT INTO `pms_product_full_reduction` VALUES (1, 7, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (2, 8, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (3, 9, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (4, 10, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (5, 11, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (6, 12, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (7, 13, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (8, 14, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (9, 18, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (10, 7, 200.00, 50.00);
INSERT INTO `pms_product_full_reduction` VALUES (11, 7, 300.00, 100.00);
INSERT INTO `pms_product_full_reduction` VALUES (14, 22, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (16, 24, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (34, 23, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (44, 31, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (46, 32, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (48, 33, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (53, 36, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (54, 35, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (55, 34, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (56, 30, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (59, 27, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (60, 28, 500.00, 50.00);
INSERT INTO `pms_product_full_reduction` VALUES (61, 28, 1000.00, 120.00);
INSERT INTO `pms_product_full_reduction` VALUES (62, 29, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (69, 37, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (72, 26, 0.00, 0.00);
COMMIT;

-- ----------------------------
-- Table structure for pms_product_ladder
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_ladder`;
CREATE TABLE `pms_product_ladder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `count` int(11) DEFAULT NULL COMMENT '满足的商品数量',
  `discount` decimal(10,2) DEFAULT NULL COMMENT '折扣',
  `price` decimal(10,2) DEFAULT NULL COMMENT '折后价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COMMENT='产品阶梯价格表(只针对同商品)';

-- ----------------------------
-- Records of pms_product_ladder
-- ----------------------------
BEGIN;
INSERT INTO `pms_product_ladder` VALUES (1, 7, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (2, 8, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (3, 9, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (4, 10, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (5, 11, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (6, 12, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (7, 13, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (8, 14, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (12, 18, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (14, 7, 4, 0.60, 0.00);
INSERT INTO `pms_product_ladder` VALUES (15, 7, 5, 0.50, 0.00);
INSERT INTO `pms_product_ladder` VALUES (18, 22, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (20, 24, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (38, 23, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (48, 31, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (50, 32, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (52, 33, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (57, 36, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (58, 35, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (59, 34, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (60, 30, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (64, 27, 2, 0.80, 0.00);
INSERT INTO `pms_product_ladder` VALUES (65, 27, 3, 0.75, 0.00);
INSERT INTO `pms_product_ladder` VALUES (66, 28, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (67, 29, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (74, 37, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (77, 26, 0, 0.00, 0.00);
COMMIT;

-- ----------------------------
-- Table structure for pms_product_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_operate_log`;
CREATE TABLE `pms_product_operate_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `price_old` decimal(10,2) DEFAULT NULL,
  `price_new` decimal(10,2) DEFAULT NULL,
  `sale_price_old` decimal(10,2) DEFAULT NULL,
  `sale_price_new` decimal(10,2) DEFAULT NULL,
  `gift_point_old` int(11) DEFAULT NULL COMMENT '赠送的积分',
  `gift_point_new` int(11) DEFAULT NULL,
  `use_point_limit_old` int(11) DEFAULT NULL,
  `use_point_limit_new` int(11) DEFAULT NULL,
  `operate_man` varchar(64) DEFAULT NULL COMMENT '操作人',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pms_product_vertify_record
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_vertify_record`;
CREATE TABLE `pms_product_vertify_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `vertify_man` varchar(64) DEFAULT NULL COMMENT '审核人',
  `status` int(1) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL COMMENT '反馈详情',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='商品审核记录';

-- ----------------------------
-- Records of pms_product_vertify_record
-- ----------------------------
BEGIN;
INSERT INTO `pms_product_vertify_record` VALUES (1, 1, '2018-04-27 16:36:41', 'test', 1, '验证通过');
INSERT INTO `pms_product_vertify_record` VALUES (2, 2, '2018-04-27 16:36:41', 'test', 1, '验证通过');
COMMIT;

-- ----------------------------
-- Table structure for pms_sku_stock
-- ----------------------------
DROP TABLE IF EXISTS `pms_sku_stock`;
CREATE TABLE `pms_sku_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `sku_code` varchar(64) NOT NULL COMMENT 'sku编码',
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT '0' COMMENT '库存',
  `low_stock` int(11) DEFAULT '0' COMMENT '预警库存',
  `sp1` varchar(64) DEFAULT NULL COMMENT '销售属性1',
  `sp2` varchar(64) DEFAULT NULL,
  `sp3` varchar(64) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL COMMENT '展示图片',
  `sale` int(11) DEFAULT NULL COMMENT '销量',
  `promotion_price` decimal(10,2) DEFAULT NULL COMMENT '单品促销价格',
  `lock_stock` int(11) DEFAULT '0' COMMENT '锁定库存',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8 COMMENT='sku的库存';

-- ----------------------------
-- Records of pms_sku_stock
-- ----------------------------
BEGIN;
INSERT INTO `pms_sku_stock` VALUES (1, 7, 'string', 100.00, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (2, 8, 'string', 100.00, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (3, 9, 'string', 100.00, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (4, 10, 'string', 100.00, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (5, 11, 'string', 100.00, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (6, 12, 'string', 100.00, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (7, 13, 'string', 100.00, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (8, 14, 'string', 100.00, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (9, 18, 'string', 100.00, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (10, 7, 'string', 0.00, 0, 0, 'string', 'string', 'sp3', 'string', 0, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (11, 7, 'string', 0.00, 0, 0, 'string', 'string', 'sp33', 'string', 0, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (12, 22, '111', 99.00, 0, NULL, 'x', 'M', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (13, 22, '112', 99.00, 0, NULL, 'xx', 'M', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/2018032614134591_20180326141345650 (4).png', NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (78, 23, '201806070023001', 99.00, 0, NULL, '米白色', 'M', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (79, 23, '201806070023002', 99.00, 0, NULL, '米白色', 'X', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (80, 23, '201806070023003', 99.00, 0, NULL, '浅黄色', 'M', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/2017091716493787_20170917164937650 (1).png', NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (81, 23, '201806070023004', 99.00, 0, NULL, '浅黄色', 'X', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/2017091716493787_20170917164937650 (1).png', NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (98, 27, '201808270027001', 2699.00, 96, 0, '黑色', '32G', NULL, NULL, NULL, 0.00, -24);
INSERT INTO `pms_sku_stock` VALUES (99, 27, '201808270027002', 2999.00, 100, 0, '黑色', '64G', NULL, NULL, NULL, 0.00, -84);
INSERT INTO `pms_sku_stock` VALUES (100, 27, '201808270027003', 2699.00, 97, NULL, '蓝色', '32G', NULL, NULL, NULL, 0.00, 0);
INSERT INTO `pms_sku_stock` VALUES (101, 27, '201808270027004', 2999.00, 88, NULL, '蓝色', '64G', NULL, NULL, NULL, 0.00, -7);
INSERT INTO `pms_sku_stock` VALUES (102, 28, '201808270028001', 649.00, 98, 0, '金色', '16G', NULL, NULL, NULL, 0.00, -8);
INSERT INTO `pms_sku_stock` VALUES (103, 28, '201808270028002', 699.00, 99, 0, '金色', '32G', NULL, NULL, NULL, 0.00, -8);
INSERT INTO `pms_sku_stock` VALUES (104, 28, '201808270028003', 649.00, 100, NULL, '银色', '16G', NULL, NULL, NULL, 0.00, 0);
INSERT INTO `pms_sku_stock` VALUES (105, 28, '201808270028004', 699.00, 100, NULL, '银色', '32G', NULL, NULL, NULL, 0.00, 0);
INSERT INTO `pms_sku_stock` VALUES (106, 29, '201808270029001', 5499.00, 95, 0, '金色', '32G', NULL, NULL, NULL, 0.00, -8);
INSERT INTO `pms_sku_stock` VALUES (107, 29, '201808270029002', 6299.00, 100, 0, '金色', '64G', NULL, NULL, NULL, 0.00, 0);
INSERT INTO `pms_sku_stock` VALUES (108, 29, '201808270029003', 5499.00, 100, 0, '银色', '32G', NULL, NULL, NULL, 0.00, 0);
INSERT INTO `pms_sku_stock` VALUES (109, 29, '201808270029004', 6299.00, 100, NULL, '银色', '64G', NULL, NULL, NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (130, 37, 'rm', 22.00, 44, 33, '红色', 'M', NULL, NULL, NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (131, 37, 'rx', 23.00, 44, 33, '红色', 'X', NULL, NULL, NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (132, 37, 'bm', 24.00, 44, 33, '蓝色', 'M', NULL, NULL, NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (133, 37, 'bx', 25.00, 44, 33, '蓝色', 'X', NULL, NULL, NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (146, 26, '222', 22.00, 22, 22, '金色', '16G', NULL, NULL, NULL, 0.00, 0);
INSERT INTO `pms_sku_stock` VALUES (147, 26, '201902140026002', 33.00, 33, NULL, '金色', '32G', NULL, NULL, NULL, NULL, 0);
INSERT INTO `pms_sku_stock` VALUES (148, 26, '201902140026003', 33.00, 13, 0, '金色', '128G', NULL, NULL, NULL, 0.00, 1);
INSERT INTO `pms_sku_stock` VALUES (149, 26, '201902140026004', 33.00, 33, 0, '银色', '16G', NULL, NULL, NULL, 0.00, -42);
INSERT INTO `pms_sku_stock` VALUES (150, 26, '201902140026005', 33.00, 33, NULL, '银色', '32G', NULL, NULL, NULL, 0.00, 1);
INSERT INTO `pms_sku_stock` VALUES (151, 26, '201902140026006', 33.00, 33, 0, '银色', '128G', NULL, NULL, NULL, 0.00, -11);
COMMIT;

-- ----------------------------
-- Table structure for sms_coupon
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon`;
CREATE TABLE `sms_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(1) DEFAULT NULL COMMENT '优惠卷类型；0->全场赠券；1->会员赠券；2->购物赠券；3->注册赠券',
  `name` varchar(100) DEFAULT NULL,
  `platform` int(1) DEFAULT NULL COMMENT '使用平台：0->全部；1->移动；2->PC',
  `count` int(11) DEFAULT NULL COMMENT '数量',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `per_limit` int(11) DEFAULT NULL COMMENT '每人限领张数',
  `min_point` decimal(10,2) DEFAULT NULL COMMENT '使用门槛；0表示无门槛',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `use_type` int(1) DEFAULT NULL COMMENT '使用类型：0->全场通用；1->指定分类；2->指定商品',
  `note` varchar(200) DEFAULT NULL COMMENT '备注',
  `publish_count` int(11) DEFAULT NULL COMMENT '发行数量',
  `use_count` int(11) DEFAULT NULL COMMENT '已使用数量',
  `receive_count` int(11) DEFAULT NULL COMMENT '领取数量',
  `enable_time` datetime DEFAULT NULL COMMENT '可以领取的日期',
  `code` varchar(64) DEFAULT NULL COMMENT '优惠码',
  `member_level` int(1) DEFAULT NULL COMMENT '可领取的会员类型：0->无限时',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='优惠卷表';

-- ----------------------------
-- Records of sms_coupon
-- ----------------------------
BEGIN;
INSERT INTO `sms_coupon` VALUES (2, 0, '全品类通用券', 0, 91, 10.00, 1, 100.00, '2018-08-27 16:40:47', '2019-11-23 16:40:47', 0, '满100减10', 100, 0, 9, '2018-08-27 16:40:47', NULL, NULL);
INSERT INTO `sms_coupon` VALUES (3, 0, '小米手机专用券', 0, 92, 50.00, 1, 1000.00, '2018-08-27 16:40:47', '2019-11-16 16:40:47', 2, '小米手机专用优惠券', 100, 0, 8, '2018-08-27 16:40:47', NULL, NULL);
INSERT INTO `sms_coupon` VALUES (4, 0, '手机品类专用券', 0, 92, 300.00, 1, 2000.00, '2018-08-27 16:40:47', '2019-09-15 16:40:47', 1, '手机分类专用优惠券', 100, 0, 8, '2018-08-27 16:40:47', NULL, NULL);
INSERT INTO `sms_coupon` VALUES (7, 0, 'T恤分类专用优惠券', 0, 93, 50.00, 1, 500.00, '2018-08-27 16:40:47', '2019-08-15 16:40:47', 1, '满500减50', 100, 0, 7, '2018-08-27 16:40:47', NULL, NULL);
INSERT INTO `sms_coupon` VALUES (8, 0, '新优惠券', 0, 100, 100.00, 1, 1000.00, '2018-11-08 00:00:00', '2019-11-27 00:00:00', 0, '测试', 100, 0, 1, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (9, 0, '全品类通用券', 0, 100, 5.00, 1, 100.00, '2018-11-08 00:00:00', '2019-11-10 00:00:00', 0, NULL, 100, 0, 1, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (10, 0, '全品类通用券', 0, 100, 15.00, 1, 200.00, '2018-11-08 00:00:00', '2019-11-10 00:00:00', 0, NULL, 100, 0, 1, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (11, 0, '全品类通用券', 0, 1000, 50.00, 1, 1000.00, '2018-11-08 00:00:00', '2019-11-10 00:00:00', 0, NULL, 1000, 0, 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (12, 0, '移动端全品类通用券', 1, 1, 10.00, 1, 100.00, '2018-11-08 00:00:00', '2019-11-10 00:00:00', 0, NULL, 100, 0, 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (19, 0, '手机分类专用', 0, 100, 100.00, 1, 1000.00, '2018-11-09 00:00:00', '2019-11-17 00:00:00', 1, '手机分类专用', 100, 0, 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (20, 0, '小米手机专用', 0, 100, 200.00, 1, 1000.00, '2018-11-09 00:00:00', '2019-11-24 00:00:00', 2, '小米手机专用', 100, 0, 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (21, 0, 'xxx', 0, 100, 10.00, 1, 100.00, '2018-11-09 00:00:00', '2019-11-30 00:00:00', 2, NULL, 100, 0, 0, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sms_coupon_history
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_history`;
CREATE TABLE `sms_coupon_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `member_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(64) DEFAULT NULL,
  `member_nickname` varchar(64) DEFAULT NULL COMMENT '领取人昵称',
  `get_type` int(1) DEFAULT NULL COMMENT '获取类型：0->后台赠送；1->主动获取',
  `create_time` datetime DEFAULT NULL,
  `use_status` int(1) DEFAULT NULL COMMENT '使用状态：0->未使用；1->已使用；2->已过期',
  `use_time` datetime DEFAULT NULL COMMENT '使用时间',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单编号',
  `order_sn` varchar(100) DEFAULT NULL COMMENT '订单号码',
  PRIMARY KEY (`id`),
  KEY `idx_member_id` (`member_id`) USING BTREE,
  KEY `idx_coupon_id` (`coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='优惠券使用、领取历史表';

-- ----------------------------
-- Records of sms_coupon_history
-- ----------------------------
BEGIN;
INSERT INTO `sms_coupon_history` VALUES (2, 2, 1, '4931048380330002', 'windir', 1, '2018-08-29 14:04:12', 1, '2018-11-12 14:38:47', 12, '201809150101000001');
INSERT INTO `sms_coupon_history` VALUES (3, 3, 1, '4931048380330003', 'windir', 1, '2018-08-29 14:04:29', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (4, 4, 1, '4931048380330004', 'windir', 1, '2018-08-29 14:04:32', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (11, 7, 1, '4931048380330001', 'windir', 1, '2018-09-04 16:21:50', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (12, 2, 4, '0340981248320004', 'zhensan', 1, '2018-11-12 14:16:50', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (13, 3, 4, '0342977234360004', 'zhensan', 1, '2018-11-12 14:17:10', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (14, 4, 4, '0343342928830004', 'zhensan', 1, '2018-11-12 14:17:13', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (15, 2, 5, '0351883832180005', 'lisi', 1, '2018-11-12 14:18:39', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (16, 3, 5, '0352201672680005', 'lisi', 1, '2018-11-12 14:18:42', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (17, 4, 5, '0352505810180005', 'lisi', 1, '2018-11-12 14:18:45', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (18, 2, 6, '0356114588380006', 'wangwu', 1, '2018-11-12 14:19:21', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (19, 3, 6, '0356382856920006', 'wangwu', 1, '2018-11-12 14:19:24', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (20, 4, 6, '0356656798470006', 'wangwu', 1, '2018-11-12 14:19:27', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (21, 2, 3, '0363644984620003', 'windy', 1, '2018-11-12 14:20:36', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (22, 3, 3, '0363932820300003', 'windy', 1, '2018-11-12 14:20:39', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (23, 4, 3, '0364238275840003', 'windy', 1, '2018-11-12 14:20:42', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (24, 2, 7, '0385034833070007', 'lion', 1, '2018-11-12 14:24:10', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (25, 3, 7, '0385350208650007', 'lion', 1, '2018-11-12 14:24:13', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (26, 4, 7, '0385632733900007', 'lion', 1, '2018-11-12 14:24:16', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (27, 2, 8, '0388779132990008', 'shari', 1, '2018-11-12 14:24:48', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (28, 3, 8, '0388943658810008', 'shari', 1, '2018-11-12 14:24:49', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (29, 4, 8, '0389069398320008', 'shari', 1, '2018-11-12 14:24:51', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (30, 2, 9, '0390753935250009', 'aewen', 1, '2018-11-12 14:25:08', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (31, 3, 9, '0390882954470009', 'aewen', 1, '2018-11-12 14:25:09', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (32, 4, 9, '0391025542810009', 'aewen', 1, '2018-11-12 14:25:10', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (33, 2, 17, '9150485335640017', '沈专', 1, '2019-02-25 18:45:05', 0, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sms_coupon_product_category_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_product_category_relation`;
CREATE TABLE `sms_coupon_product_category_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `product_category_id` bigint(20) DEFAULT NULL,
  `product_category_name` varchar(200) DEFAULT NULL COMMENT '产品分类名称',
  `parent_category_name` varchar(200) DEFAULT NULL COMMENT '父分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='优惠券和产品分类关系表';

-- ----------------------------
-- Records of sms_coupon_product_category_relation
-- ----------------------------
BEGIN;
INSERT INTO `sms_coupon_product_category_relation` VALUES (4, 19, 30, '手机配件', '手机数码');
COMMIT;

-- ----------------------------
-- Table structure for sms_coupon_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_product_relation`;
CREATE TABLE `sms_coupon_product_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(500) DEFAULT NULL COMMENT '商品名称',
  `product_sn` varchar(200) DEFAULT NULL COMMENT '商品编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='优惠券和产品的关系表';

-- ----------------------------
-- Records of sms_coupon_product_relation
-- ----------------------------
BEGIN;
INSERT INTO `sms_coupon_product_relation` VALUES (9, 21, 33, '小米（MI）小米电视4A ', '4609652');
COMMIT;

-- ----------------------------
-- Table structure for sms_flash_promotion
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion`;
CREATE TABLE `sms_flash_promotion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `start_date` date DEFAULT NULL COMMENT '开始日期',
  `end_date` date DEFAULT NULL COMMENT '结束日期',
  `status` int(1) DEFAULT NULL COMMENT '上下线状态',
  `create_time` datetime DEFAULT NULL COMMENT '秒杀时间段名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='限时购表';

-- ----------------------------
-- Records of sms_flash_promotion
-- ----------------------------
BEGIN;
INSERT INTO `sms_flash_promotion` VALUES (2, '春季家电家具疯狂秒杀1', '2019-01-28', '2019-01-15', 0, '2018-11-16 11:12:13');
INSERT INTO `sms_flash_promotion` VALUES (3, '前端测试专用活动', '2018-11-03', '2019-02-28', 1, '2018-11-16 11:11:31');
INSERT INTO `sms_flash_promotion` VALUES (4, '春季家电家具疯狂秒杀3', '2018-11-24', '2018-11-25', 0, '2018-11-16 11:12:19');
INSERT INTO `sms_flash_promotion` VALUES (5, '春季家电家具疯狂秒杀4', '2018-11-16', '2018-11-16', 0, '2018-11-16 11:12:24');
INSERT INTO `sms_flash_promotion` VALUES (6, '春季家电家具疯狂秒杀5', '2018-11-16', '2018-11-16', 0, '2018-11-16 11:12:31');
INSERT INTO `sms_flash_promotion` VALUES (7, '春季家电家具疯狂秒杀6', '2018-11-16', '2018-11-16', 0, '2018-11-16 11:12:35');
INSERT INTO `sms_flash_promotion` VALUES (8, '春季家电家具疯狂秒杀7', '2018-11-16', '2018-11-16', 0, '2018-11-16 11:12:39');
INSERT INTO `sms_flash_promotion` VALUES (9, '春季家电家具疯狂秒杀8', '2018-11-16', '2018-11-16', 0, '2018-11-16 11:12:42');
INSERT INTO `sms_flash_promotion` VALUES (13, '测试', '2018-11-01', '2018-11-30', 0, '2018-11-19 10:34:24');
COMMIT;

-- ----------------------------
-- Table structure for sms_flash_promotion_log
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_log`;
CREATE TABLE `sms_flash_promotion_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `member_phone` varchar(64) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `subscribe_time` datetime DEFAULT NULL COMMENT '会员订阅时间',
  `send_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='限时购通知记录';

-- ----------------------------
-- Table structure for sms_flash_promotion_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_product_relation`;
CREATE TABLE `sms_flash_promotion_product_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `flash_promotion_id` bigint(20) DEFAULT NULL,
  `flash_promotion_session_id` bigint(20) DEFAULT NULL COMMENT '编号',
  `product_id` bigint(20) DEFAULT NULL,
  `flash_promotion_price` decimal(10,2) DEFAULT NULL COMMENT '限时购价格',
  `flash_promotion_count` int(11) DEFAULT NULL COMMENT '限时购数量',
  `flash_promotion_limit` int(11) DEFAULT NULL COMMENT '每人限购数量',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='商品限时购与商品关系表';

-- ----------------------------
-- Records of sms_flash_promotion_product_relation
-- ----------------------------
BEGIN;
INSERT INTO `sms_flash_promotion_product_relation` VALUES (1, 2, 1, 26, 3000.00, 10, 1, 0);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (2, 2, 1, 27, 2000.00, 10, 1, 20);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (3, 2, 1, 28, 599.00, 19, 1, 0);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (4, 2, 1, 29, 4999.00, 10, 1, 100);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (9, 2, 2, 26, 2999.00, 100, 1, 0);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (10, 2, 2, 27, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (11, 2, 2, 28, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (12, 2, 2, 29, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (13, 2, 2, 30, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (14, 2, 3, 31, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (15, 2, 3, 32, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (16, 2, 4, 33, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (17, 2, 4, 34, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (18, 2, 5, 36, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (19, 2, 6, 33, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (20, 2, 6, 34, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (21, 3, 1, 26, 3000.00, 100, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (22, 3, 1, 27, 1999.00, 10, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (23, 3, 1, 28, 599.00, 10, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (24, 3, 1, 29, 4999.00, 10, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (25, 3, 2, 31, 90.00, 10, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (26, 3, 2, 32, 60.00, 10, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (27, 3, 2, 33, 2299.00, 10, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (28, 3, 2, 34, 3888.00, 10, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (29, 3, 3, 36, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (30, 3, 3, 35, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (31, 3, 3, 31, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (32, 3, 3, 32, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (33, 3, 4, 26, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (34, 3, 4, 27, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (35, 3, 4, 28, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (36, 3, 4, 29, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (37, 3, 5, 26, 3688.00, 100, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (38, 3, 5, 27, 2599.00, 10, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (39, 3, 5, 28, 599.00, 10, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (40, 3, 5, 29, 4999.00, 10, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (41, 3, 6, 26, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (42, 3, 6, 27, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (43, 3, 6, 28, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (44, 3, 6, 29, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sms_flash_promotion_session
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_session`;
CREATE TABLE `sms_flash_promotion_session` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '场次名称',
  `start_time` time DEFAULT NULL COMMENT '每日开始时间',
  `end_time` time DEFAULT NULL COMMENT '每日结束时间',
  `status` int(1) DEFAULT NULL COMMENT '启用状态：0->不启用；1->启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='限时购场次表';

-- ----------------------------
-- Records of sms_flash_promotion_session
-- ----------------------------
BEGIN;
INSERT INTO `sms_flash_promotion_session` VALUES (1, '8:00', '08:00:00', '10:00:33', 1, '2018-11-16 13:22:17');
INSERT INTO `sms_flash_promotion_session` VALUES (2, '10:00', '10:00:00', '12:00:00', 1, '2018-11-16 13:22:34');
INSERT INTO `sms_flash_promotion_session` VALUES (3, '12:00', '12:00:00', '14:00:00', 1, '2018-11-16 13:22:37');
INSERT INTO `sms_flash_promotion_session` VALUES (4, '14:00', '14:00:00', '16:00:00', 1, '2018-11-16 13:22:41');
INSERT INTO `sms_flash_promotion_session` VALUES (5, '16:00', '16:00:00', '18:00:00', 1, '2018-11-16 13:22:45');
INSERT INTO `sms_flash_promotion_session` VALUES (6, '18:00', '18:00:00', '20:00:00', 1, '2018-11-16 13:21:34');
INSERT INTO `sms_flash_promotion_session` VALUES (7, '20:00', '20:00:33', '21:00:33', 0, '2018-11-16 13:22:55');
COMMIT;

-- ----------------------------
-- Table structure for sms_home_advertise
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_advertise`;
CREATE TABLE `sms_home_advertise` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `type` int(1) DEFAULT NULL COMMENT '轮播位置：0->PC首页轮播；1->app首页轮播',
  `pic` varchar(500) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL COMMENT '上下线状态：0->下线；1->上线',
  `click_count` int(11) DEFAULT NULL COMMENT '点击数',
  `order_count` int(11) DEFAULT NULL COMMENT '下单数',
  `url` varchar(500) DEFAULT NULL COMMENT '链接地址',
  `note` varchar(500) DEFAULT NULL COMMENT '备注',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='首页轮播广告表';

-- ----------------------------
-- Records of sms_home_advertise
-- ----------------------------
BEGIN;
INSERT INTO `sms_home_advertise` VALUES (2, '夏季大热促销', 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '2018-11-01 14:01:37', '2018-11-15 14:01:37', 0, 0, 0, NULL, '夏季大热促销', 0);
INSERT INTO `sms_home_advertise` VALUES (3, '夏季大热促销1', 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '2018-11-13 14:01:37', '2018-11-13 14:01:37', 0, 0, 0, NULL, '夏季大热促销1', 0);
INSERT INTO `sms_home_advertise` VALUES (4, '夏季大热促销2', 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '2018-11-13 14:01:37', '2018-11-13 14:01:37', 1, 0, 0, NULL, '夏季大热促销2', 0);
INSERT INTO `sms_home_advertise` VALUES (9, '电影推荐广告', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/movie_ad.jpg', '2018-11-01 00:00:00', '2018-11-24 00:00:00', 1, 0, 0, 'www.baidu.com', '电影推荐广告', 100);
INSERT INTO `sms_home_advertise` VALUES (10, '汽车促销广告', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/car_ad.jpg', '2018-11-13 00:00:00', '2018-11-24 00:00:00', 1, 0, 0, 'xxx', NULL, 99);
INSERT INTO `sms_home_advertise` VALUES (11, '汽车推荐广告', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/car_ad2.jpg', '2018-11-13 00:00:00', '2018-11-30 00:00:00', 1, 0, 0, 'xxx', NULL, 98);
INSERT INTO `sms_home_advertise` VALUES (12, '电影推荐广告', 2, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/movie_ad.jpg', '2018-11-01 00:00:00', '2018-11-24 00:00:00', 1, 0, 0, 'www.baidu.com', '电影推荐广告', 100);
INSERT INTO `sms_home_advertise` VALUES (13, '汽车促销广告', 2, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/car_ad.jpg', '2018-11-13 00:00:00', '2018-11-24 00:00:00', 1, 0, 0, 'xxx', NULL, 99);
INSERT INTO `sms_home_advertise` VALUES (14, '汽车推荐广告', 2, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/car_ad2.jpg', '2018-11-13 00:00:00', '2018-11-30 00:00:00', 1, 0, 0, 'xxx', NULL, 98);
COMMIT;

-- ----------------------------
-- Table structure for sms_home_brand
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_brand`;
CREATE TABLE `sms_home_brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) DEFAULT NULL,
  `brand_name` varchar(64) DEFAULT NULL,
  `recommend_status` int(1) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='首页推荐品牌表';

-- ----------------------------
-- Records of sms_home_brand
-- ----------------------------
BEGIN;
INSERT INTO `sms_home_brand` VALUES (1, 1, '万和', 1, 200);
INSERT INTO `sms_home_brand` VALUES (2, 2, '三星', 1, 0);
INSERT INTO `sms_home_brand` VALUES (6, 6, '小米', 1, 300);
INSERT INTO `sms_home_brand` VALUES (8, 5, '方太', 1, 100);
INSERT INTO `sms_home_brand` VALUES (32, 50, '海澜之家', 1, 0);
INSERT INTO `sms_home_brand` VALUES (33, 51, '苹果', 1, 0);
INSERT INTO `sms_home_brand` VALUES (35, 3, '华为', 1, 0);
INSERT INTO `sms_home_brand` VALUES (36, 4, '格力', 1, 0);
INSERT INTO `sms_home_brand` VALUES (37, 5, '方太', 1, 0);
INSERT INTO `sms_home_brand` VALUES (38, 1, '万和', 1, 0);
INSERT INTO `sms_home_brand` VALUES (39, 21, 'OPPO', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for sms_home_new_product
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_new_product`;
CREATE TABLE `sms_home_new_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(64) DEFAULT NULL,
  `recommend_status` int(1) DEFAULT NULL,
  `sort` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='新鲜好物表';

-- ----------------------------
-- Records of sms_home_new_product
-- ----------------------------
BEGIN;
INSERT INTO `sms_home_new_product` VALUES (2, 27, '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', 1, 200);
INSERT INTO `sms_home_new_product` VALUES (8, 26, '华为 HUAWEI P20 ', 1, 0);
INSERT INTO `sms_home_new_product` VALUES (9, 27, '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', 1, 0);
INSERT INTO `sms_home_new_product` VALUES (10, 28, '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', 1, 0);
INSERT INTO `sms_home_new_product` VALUES (11, 29, 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', 1, 0);
INSERT INTO `sms_home_new_product` VALUES (12, 30, 'HLA海澜之家简约动物印花短袖T恤', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for sms_home_recommend_product
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_recommend_product`;
CREATE TABLE `sms_home_recommend_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(64) DEFAULT NULL,
  `recommend_status` int(1) DEFAULT NULL,
  `sort` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='人气推荐商品表';

-- ----------------------------
-- Records of sms_home_recommend_product
-- ----------------------------
BEGIN;
INSERT INTO `sms_home_recommend_product` VALUES (3, 26, '华为 HUAWEI P20 ', 1, 0);
INSERT INTO `sms_home_recommend_product` VALUES (4, 27, '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', 1, 0);
INSERT INTO `sms_home_recommend_product` VALUES (5, 28, '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', 1, 0);
INSERT INTO `sms_home_recommend_product` VALUES (6, 29, 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', 1, 0);
INSERT INTO `sms_home_recommend_product` VALUES (7, 30, 'HLA海澜之家简约动物印花短袖T恤', 1, 100);
COMMIT;

-- ----------------------------
-- Table structure for sms_home_recommend_subject
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_recommend_subject`;
CREATE TABLE `sms_home_recommend_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) DEFAULT NULL,
  `subject_name` varchar(64) DEFAULT NULL,
  `recommend_status` int(1) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='首页推荐专题表';

-- ----------------------------
-- Records of sms_home_recommend_subject
-- ----------------------------
BEGIN;
INSERT INTO `sms_home_recommend_subject` VALUES (14, 1, 'polo衬衫的也时尚', 1, 0);
INSERT INTO `sms_home_recommend_subject` VALUES (15, 2, '大牌手机低价秒', 1, 0);
INSERT INTO `sms_home_recommend_subject` VALUES (16, 3, '晓龙845新品上市', 1, 0);
INSERT INTO `sms_home_recommend_subject` VALUES (17, 4, '夏天应该穿什么', 1, 0);
INSERT INTO `sms_home_recommend_subject` VALUES (18, 5, '夏季精选', 1, 100);
INSERT INTO `sms_home_recommend_subject` VALUES (19, 6, '品牌手机降价', 1, 0);
INSERT INTO `sms_home_recommend_subject` VALUES (20, 1, '轮廓分明，双摄手机映现细腻美照', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for tb_health_push_task
-- ----------------------------
DROP TABLE IF EXISTS `tb_health_push_task`;
CREATE TABLE `tb_health_push_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '小程序模版ID',
  `task_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '模版名称',
  `task_topic` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动主题',
  `task_caption` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动说明',
  `task_tips` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '温馨提示',
  `task_type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '任务类型',
  `status` int(1) DEFAULT NULL COMMENT '任务是否已经发送 1 未发送[默认] 2 已发送',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `goods_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品标题',
  `goods_online_status` int(2) DEFAULT NULL COMMENT '商品前台状态 1 上架 0 下架',
  `price` decimal(10,2) DEFAULT NULL COMMENT '商品金额（需要的海贝数）',
  `is_upload` int(1) DEFAULT NULL,
  `file_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for tb_health_push_task_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_health_push_task_user`;
CREATE TABLE `tb_health_push_task_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL COMMENT '推送ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `form_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '小程序推送formId',
  `status` int(2) DEFAULT NULL COMMENT '推送状态 1 已推送 2 未推送',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41877 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for tb_panel
-- ----------------------------
DROP TABLE IF EXISTS `tb_panel`;
CREATE TABLE `tb_panel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  `name` varchar(50) DEFAULT NULL COMMENT '板块名称',
  `type` int(1) DEFAULT NULL COMMENT '类型 0轮播图 1板块种类一 2板块种类二 3板块种类三 ',
  `sort_order` int(4) DEFAULT NULL COMMENT '排列序号',
  `position` int(1) DEFAULT NULL COMMENT '所属位置 0首页 1商品推荐 2我要捐赠',
  `limit_num` int(4) DEFAULT NULL COMMENT '板块限制商品数量',
  `status` int(1) DEFAULT '1' COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`status`) USING BTREE,
  KEY `sort_order` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='内容分类';

-- ----------------------------
-- Records of tb_panel
-- ----------------------------
BEGIN;
INSERT INTO `tb_panel` VALUES (1, '热门商品', 2, 2, 0, 3, 1, '', '2018-04-18 23:49:13', '2018-04-15 19:05:16');
INSERT INTO `tb_panel` VALUES (2, '官方精选', 3, 3, 0, 8, 1, '', NULL, '2018-04-19 11:20:59');
INSERT INTO `tb_panel` VALUES (3, '品牌精选', 3, 5, 0, 7, 1, '', '2018-04-18 23:49:19', '2018-04-17 18:54:15');
INSERT INTO `tb_panel` VALUES (4, '我要捐赠', 2, 3, 2, 2, 1, '', '2017-09-23 15:20:31', '2017-11-06 13:17:04');
INSERT INTO `tb_panel` VALUES (6, '为您推荐', 2, 6, 1, 2, 1, '', '2017-11-06 13:17:41', '2017-11-06 13:17:41');
INSERT INTO `tb_panel` VALUES (7, '轮播图', 0, 0, 0, 5, 1, '', '2018-04-15 12:33:07', '2018-04-15 12:33:07');
INSERT INTO `tb_panel` VALUES (8, '活动版块', 1, 1, 0, 4, 1, '', '2018-04-15 19:05:00', '2018-04-15 19:05:00');
INSERT INTO `tb_panel` VALUES (9, '活动版块2', 1, 7, 0, 4, 1, '', NULL, '2018-04-19 11:57:47');
INSERT INTO `tb_panel` VALUES (10, '品牌周边', 3, 4, 0, 7, 1, NULL, '2018-04-18 23:50:32', '2018-04-18 23:50:35');
COMMIT;

-- ----------------------------
-- Table structure for tb_panel_content
-- ----------------------------
DROP TABLE IF EXISTS `tb_panel_content`;
CREATE TABLE `tb_panel_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `panel_id` int(11) NOT NULL COMMENT '所属板块id',
  `type` int(1) DEFAULT NULL COMMENT '类型 0关联商品 1其他链接',
  `product_id` bigint(20) DEFAULT NULL COMMENT '关联商品id',
  `sort_order` int(4) DEFAULT NULL,
  `full_url` varchar(500) DEFAULT NULL COMMENT '其他链接',
  `pic_url` varchar(500) DEFAULT NULL,
  `pic_url2` varchar(500) DEFAULT NULL COMMENT '3d轮播图备用',
  `pic_url3` varchar(500) DEFAULT NULL COMMENT '3d轮播图备用',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`panel_id`),
  KEY `updated` (`updated`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_panel_content
-- ----------------------------
BEGIN;
INSERT INTO `tb_panel_content` VALUES (2, 3, 0, 150642571432851, 1, '', 'https://resource.smartisan.com/resource/7ac3af5a92ad791c2b38bfe1e38ee334.jpg', NULL, NULL, '2017-09-23 00:03:02', '2018-04-20 00:23:40');
INSERT INTO `tb_panel_content` VALUES (7, 3, 0, 816448, 2, '', 'https://resource.smartisan.com/resource/41cb562a47d4831e199ed7e2057f3b61.jpg', NULL, NULL, '2017-09-23 22:58:11', '2018-04-20 00:14:29');
INSERT INTO `tb_panel_content` VALUES (8, 2, 0, 150642571432837, 1, '', 'https://resource.smartisan.com/resource/3a7522290397a9444d7355298248f197.jpg', NULL, NULL, '2017-09-25 17:03:48', '2018-04-19 23:23:26');
INSERT INTO `tb_panel_content` VALUES (9, 2, 0, 150642571432838, 2, '', 'https://resource.smartisan.com/resource/63ea40e5c64db1c6b1d480c48fe01272.jpg', NULL, NULL, '2017-09-25 17:04:35', '2018-04-20 10:48:17');
INSERT INTO `tb_panel_content` VALUES (14, 2, 0, 150642571432839, 3, '', 'https://resource.smartisan.com/resource/5e4b1feddb13639550849f12f6b2e202.jpg', NULL, NULL, '2017-10-22 22:14:01', '2018-04-20 10:48:29');
INSERT INTO `tb_panel_content` VALUES (15, 2, 0, 150642571432840, 4, '', 'https://resource.smartisan.com/resource/10525c4b21f039fc8ccb42cd1586f5cd.jpg', NULL, NULL, '2017-10-22 22:14:52', '2018-04-20 10:48:43');
INSERT INTO `tb_panel_content` VALUES (16, 2, 0, 150642571432841, 5, '', 'https://resource.smartisan.com/resource/b899d9b82c4bc2710492a26af021d484.jpg', NULL, NULL, '2017-10-22 22:15:51', '2018-04-20 10:49:02');
INSERT INTO `tb_panel_content` VALUES (17, 2, 0, 150642571432842, 6, '', 'https://resource.smartisan.com/resource/abb6986430536cd9365352b434f3c568.jpg', NULL, NULL, '2017-10-22 22:17:01', '2018-04-20 10:49:17');
INSERT INTO `tb_panel_content` VALUES (18, 3, 0, 847276, 3, NULL, 'https://resource.smartisan.com/resource/99c548bfc9848a8c95f4e4f7f2bc1095.png', NULL, NULL, '2017-10-22 22:22:52', '2017-10-22 22:22:52');
INSERT INTO `tb_panel_content` VALUES (19, 3, 0, 150642571432844, 4, '', 'https://resource.smartisan.com/resource/71432ad30288fb860a4389881069b874.png', NULL, NULL, '2017-10-22 22:23:35', '2018-04-20 11:25:38');
INSERT INTO `tb_panel_content` VALUES (20, 3, 0, 847276, 5, '', 'https://resource.smartisan.com/resource/804b82e4c05516e822667a23ee311f7c.jpg', NULL, NULL, '2017-10-22 22:24:54', '2018-04-20 00:15:03');
INSERT INTO `tb_panel_content` VALUES (21, 3, 0, 150642571432852, 6, '', 'https://resource.smartisan.com/resource/367d93db1d58f9f3505bc0ec18efaa44.jpg', NULL, NULL, '2017-10-22 22:25:28', '2018-04-20 00:24:11');
INSERT INTO `tb_panel_content` VALUES (22, 1, 0, 150635087972564, 1, NULL, 'http://ow2h3ee9w.bkt.clouddn.com/FjvP4gBFeYGQoEtEX7dL3kbwJTDW', NULL, NULL, '2017-10-22 22:26:31', '2017-10-22 22:26:31');
INSERT INTO `tb_panel_content` VALUES (23, 1, 0, 150642571432835, 2, '', 'http://ow2h3ee9w.bkt.clouddn.com/FgwHSk1Rnd-8FKqNJhFSSdcq2QVB', NULL, NULL, '2017-10-22 22:26:40', '2018-04-17 20:59:35');
INSERT INTO `tb_panel_content` VALUES (25, 8, 0, 150642571432835, 1, 'https://www.smartisan.com/jianguo3-accessories', 'https://resource.smartisan.com/resource/6/610400xinpinpeijian.jpg', NULL, NULL, '2018-04-15 19:07:43', '2018-04-19 23:20:34');
INSERT INTO `tb_panel_content` VALUES (26, 8, 0, 150635087972564, 2, 'https://www.smartisan.com/service/#/tradein', 'https://resource.smartisan.com/resource/6/610400yijiuhuanxin.jpg', NULL, NULL, '2018-04-15 19:08:00', '2018-04-19 23:20:48');
INSERT INTO `tb_panel_content` VALUES (27, 8, 0, 150642571432835, 3, 'https://www.smartisan.com/category?id=69', 'https://resource.smartisan.com/resource/4/489673079577637073.png', NULL, NULL, '2018-04-15 19:08:24', '2018-04-19 23:21:01');
INSERT INTO `tb_panel_content` VALUES (28, 8, 0, 150635087972564, 4, 'https://www.smartisan.com/', 'https://resource.smartisan.com/resource/fe6ab43348a43152b4001b4454d206ac.jpg', NULL, NULL, '2018-04-15 19:08:58', '2018-04-19 23:21:13');
INSERT INTO `tb_panel_content` VALUES (29, 2, 2, 150642571432843, 0, '', 'https://resource.smartisan.com/resource/1/1220858shoujilouceng.jpg', NULL, NULL, '2018-04-15 20:14:35', '2018-04-20 11:41:27');
INSERT INTO `tb_panel_content` VALUES (30, 3, 2, 150642571432850, 0, '', 'https://resource.smartisan.com/resource/a/acillouceng1220856.jpg', NULL, NULL, '2018-04-15 20:15:18', '2018-04-20 11:18:03');
INSERT INTO `tb_panel_content` VALUES (32, 7, 0, 150635087972564, 1, '', 'http://static.smartisanos.cn/index/img/store/home/banner-3d-item-1-box-1_61bdc2f4f9.png', 'http://static.smartisanos.cn/index/img/store/home/banner-3d-item-1-box-3_8fa7866d59.png', 'http://ow2h3ee9w.bkt.clouddn.com/banner-3d-item-1-box-33.png', '2018-04-17 20:41:02', '2018-04-17 20:58:41');
INSERT INTO `tb_panel_content` VALUES (33, 7, 0, 150642571432835, 2, '', 'http://oweupqzdv.bkt.clouddn.com/bg_left.png', 'http://ow2h3ee9w.bkt.clouddn.com/phone_left2.png', 'http://oweupqzdv.bkt.clouddn.com/erji_left.png', '2018-04-17 21:08:22', '2018-04-20 10:47:19');
INSERT INTO `tb_panel_content` VALUES (34, 7, 0, 150635087972564, 3, NULL, 'https://s1.ax1x.com/2018/05/19/Ccdiid.png', '', '', '2018-04-17 21:08:30', '2018-04-17 21:08:32');
INSERT INTO `tb_panel_content` VALUES (35, 7, 0, 150642571432843, 4, '', 'http://ow2h3ee9w.bkt.clouddn.com/24401108web1.png', NULL, NULL, '2018-04-18 23:44:48', '2018-04-20 11:41:46');
INSERT INTO `tb_panel_content` VALUES (36, 9, 0, 150635087972564, 1, 'https://www.smartisan.com/pr/#/video/conference-jianguopro2', 'https://resource.smartisan.com/resource/88684d7ed5eee77e34f044fa32a9121b.png', NULL, NULL, '2018-04-18 23:51:45', '2018-04-20 12:03:05');
INSERT INTO `tb_panel_content` VALUES (37, 9, 0, 150642571432835, 2, 'https://www.smartisan.com/os/#/4-x', 'https://resource.smartisan.com/resource/6/610400dibu.jpg', NULL, NULL, '2018-04-18 23:51:51', '2018-04-20 12:03:19');
INSERT INTO `tb_panel_content` VALUES (38, 9, 0, 150635087972564, 3, 'https://www.smartisan.com/pr/#/video/changhuxi-jinghuaqi', 'https://resource.smartisan.com/resource/c245ada282824a4a15e68bec80502ad4.jpg', NULL, NULL, '2018-04-18 23:51:58', '2018-04-20 12:03:31');
INSERT INTO `tb_panel_content` VALUES (39, 9, 0, 150642571432835, 4, 'https://www.smartisan.com/pr/#/video/onestep-introduction', 'https://resource.smartisan.com/resource/m/minibanner_03.jpg', NULL, NULL, '2018-04-18 23:52:02', '2018-04-20 12:03:41');
INSERT INTO `tb_panel_content` VALUES (40, 10, 3, NULL, 0, 'http://xmall.exrick.cn/#/goods?cid=1184', 'https://resource.smartisan.com/resource/z/zhoubianshangpin1220858web.jpg', NULL, NULL, '2018-04-19 00:02:53', '2018-04-20 11:15:59');
INSERT INTO `tb_panel_content` VALUES (41, 10, 0, 150642571432845, 1, '', 'https://resource.smartisan.com/resource/2f9a0f5f3dedf0ed813622003f1b287b.jpg', NULL, NULL, '2018-04-19 00:02:56', '2018-04-20 00:24:36');
INSERT INTO `tb_panel_content` VALUES (42, 10, 0, 150642571432836, 2, '', 'https://resource.smartisan.com/resource/2b05dbca9f5a4d0c1270123f42fb834c.jpg', NULL, NULL, '2018-04-19 00:03:00', '2018-04-20 00:25:01');
INSERT INTO `tb_panel_content` VALUES (43, 10, 0, 150642571432846, 3, '', 'https://resource.smartisan.com/resource/804edf579887b3e1fae4e20a379be5b5.png', NULL, NULL, '2018-04-19 00:03:04', '2018-04-20 00:25:17');
INSERT INTO `tb_panel_content` VALUES (44, 10, 0, 150642571432848, 4, '', 'https://resource.smartisan.com/resource/a1c53b5f12dd7ef790cadec0eaeaf466.jpg', NULL, NULL, '2018-04-19 00:03:10', '2018-04-20 10:55:52');
INSERT INTO `tb_panel_content` VALUES (45, 10, 0, 150642571432847, 5, '', 'https://resource.smartisan.com/resource/daa975651d6d700c0f886718c520ee19.jpg', NULL, NULL, '2018-04-19 00:03:15', '2018-04-20 10:54:56');
INSERT INTO `tb_panel_content` VALUES (46, 10, 0, 150642571432849, 6, '', 'https://resource.smartisan.com/resource/3973d009d182d8023bea6250b9a3959e.jpg', NULL, NULL, '2018-04-19 00:03:20', '2018-04-20 10:55:03');
INSERT INTO `tb_panel_content` VALUES (47, 6, 0, 150635087972564, 1, '', 'http://ow2h3ee9w.bkt.clouddn.com/FjvP4gBFeYGQoEtEX7dL3kbwJTDW', NULL, NULL, '2018-04-19 11:15:35', '2018-04-19 11:15:35');
INSERT INTO `tb_panel_content` VALUES (48, 6, 0, 150642571432835, 2, NULL, 'http://ow2h3ee9w.bkt.clouddn.com/FgwHSk1Rnd-8FKqNJhFSSdcq2QVB', NULL, NULL, '2018-04-19 11:18:16', '2018-04-19 11:18:18');
INSERT INTO `tb_panel_content` VALUES (49, 4, 0, 150635087972564, 1, NULL, 'http://ow2h3ee9w.bkt.clouddn.com/FjvP4gBFeYGQoEtEX7dL3kbwJTDW', NULL, NULL, '2018-04-19 11:20:15', '2018-04-19 11:20:17');
INSERT INTO `tb_panel_content` VALUES (50, 4, 0, 150642571432835, 2, NULL, 'http://ow2h3ee9w.bkt.clouddn.com/FgwHSk1Rnd-8FKqNJhFSSdcq2QVB', NULL, NULL, '2018-04-19 11:20:19', '2018-04-19 11:20:21');
INSERT INTO `tb_panel_content` VALUES (51, 7, 0, 150635087972564, 5, '', 'http://ow2h3ee9w.bkt.clouddn.com/417pcchunrihaolishouji.png', NULL, NULL, '2018-04-19 15:09:40', '2018-04-19 21:16:04');
INSERT INTO `tb_panel_content` VALUES (55, 0, 1, NULL, 1, 'http://xmall.exrick.cn/#/goods?cid=1184', '品牌周边', NULL, NULL, '2018-07-27 20:48:21', '2018-07-27 22:32:51');
INSERT INTO `tb_panel_content` VALUES (58, 0, 1, NULL, 2, 'http://xmall.exrick.cn/#/thanks', '捐赠名单', NULL, NULL, '2018-07-27 20:50:07', '2018-07-27 22:25:18');
INSERT INTO `tb_panel_content` VALUES (59, 0, 0, NULL, 3, 'http://xmadmin.exrick.cn', '后台管理系统', NULL, NULL, '2018-07-27 22:25:44', '2018-07-27 22:26:54');
INSERT INTO `tb_panel_content` VALUES (60, 0, 0, NULL, 4, 'http://xpay.exrick.cn', 'XPay支付系统', NULL, NULL, '2018-07-27 22:26:03', '2018-07-27 22:26:50');
INSERT INTO `tb_panel_content` VALUES (61, 0, 0, NULL, 5, 'https://github.com/Exrick/x-boot', 'XBoot框架', NULL, NULL, '2018-07-27 22:26:21', '2018-07-27 22:26:47');
INSERT INTO `tb_panel_content` VALUES (62, 0, 0, NULL, 6, 'https://www.bilibili.com/video/av23121122/', '宣传视频', NULL, NULL, '2018-07-27 22:26:44', '2018-07-27 22:26:44');
INSERT INTO `tb_panel_content` VALUES (63, 0, 0, NULL, 7, 'https://github.com/Exrick/xmall', 'Github', NULL, NULL, '2018-07-27 22:27:22', '2018-07-27 22:27:26');
COMMIT;

-- ----------------------------
-- Table structure for tb_user_from_id
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_from_id`;
CREATE TABLE `tb_user_from_id` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) DEFAULT NULL COMMENT '用户id',
  `form_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '小程序推送formId',
  `source` smallint(2) DEFAULT NULL COMMENT '来源 source 1，步数兑换海贝按钮；2，首页邀请按钮；3，步数拦截弹窗邀请按钮；4，兑换商品按钮；\\n\\n5，海贝不够邀请按钮；6，引导关注蒙层按钮；7，健康体验领取按钮 8，首页弹窗“马上领取”按钮',
  `status` smallint(2) DEFAULT NULL COMMENT '使用状态 1 未使用[默认] 2 已使用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `_idx_form_id_` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=753 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_user_from_id
-- ----------------------------
BEGIN;
INSERT INTO `tb_user_from_id` VALUES (746, 17, 'the formId is a mock one', 1, 1, '2019-03-14 18:20:34', '2019-03-14 18:20:34');
INSERT INTO `tb_user_from_id` VALUES (747, 17, '716054bc662f40a29a0635dba1431f7e', 1, 1, '2019-03-14 18:20:48', '2019-03-14 18:20:48');
INSERT INTO `tb_user_from_id` VALUES (748, 17, '8b034295431848adbdf6ced22730264c', 2, 1, '2019-03-14 18:21:07', '2019-03-14 18:21:07');
INSERT INTO `tb_user_from_id` VALUES (749, 17, 'af9d46215e634126aa87d31e70c47353', 2, 1, '2019-03-14 19:05:21', '2019-03-14 19:05:21');
INSERT INTO `tb_user_from_id` VALUES (750, 17, '6b7b698ea3054dca959d930938189ec3', 2, 1, '2019-03-14 19:16:58', '2019-03-14 19:16:58');
INSERT INTO `tb_user_from_id` VALUES (751, 17, '99153ac6241e4a04bd01424783f94072', 2, 1, '2019-03-14 19:25:13', '2019-03-14 19:25:13');
INSERT INTO `tb_user_from_id` VALUES (752, 17, '4912a64fe6ce487da0832dbcd40db699', 2, 1, '2019-03-14 19:27:48', '2019-03-14 19:27:48');
COMMIT;

-- ----------------------------
-- Table structure for ums_admin
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin`;
CREATE TABLE `ums_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL COMMENT '头像',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `nick_name` varchar(200) DEFAULT NULL COMMENT '昵称',
  `note` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` int(1) DEFAULT '1' COMMENT '帐号启用状态：0->禁用；1->启用',
  `supply_id` bigint(20) DEFAULT NULL COMMENT '供应商',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='后台用户表';

-- ----------------------------
-- Records of ums_admin
-- ----------------------------
BEGIN;
INSERT INTO `ums_admin` VALUES (1, 'test', 'e10adc3949ba59abbe56e057f20f883e', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg.jpg', NULL, '测试账号', NULL, '2018-09-29 13:55:30', '2018-09-29 13:55:39', 1, NULL);
INSERT INTO `ums_admin` VALUES (3, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/170157_yIl3_1767531.jpg', 'admin@163.com', '系统管理员', '系统管理员', '2018-10-08 13:32:47', '2019-04-09 16:49:04', 1, NULL);
INSERT INTO `ums_admin` VALUES (4, 'root', 'e10adc3949ba59abbe56e057f20f883e', NULL, '1144', '12344', '12344', '2019-02-28 16:07:58', NULL, 1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for ums_admin_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_login_log`;
CREATE TABLE `ums_admin_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `user_agent` varchar(100) DEFAULT NULL COMMENT '浏览器登录类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='后台用户登录日志表';

-- ----------------------------
-- Records of ums_admin_login_log
-- ----------------------------
BEGIN;
INSERT INTO `ums_admin_login_log` VALUES (5, 3, '2018-12-06 13:59:12', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (6, 3, '2018-12-17 13:23:20', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (7, 3, '2018-12-18 13:51:42', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (8, 3, '2018-12-18 13:51:51', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (9, 3, '2019-01-28 16:20:41', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (10, 3, '2019-01-29 09:16:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (11, 3, '2019-01-29 10:10:51', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (12, 3, '2019-02-13 17:11:56', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (13, 3, '2019-02-14 11:12:32', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (14, 3, '2019-02-14 21:01:05', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (15, 3, '2019-02-14 21:01:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (16, 3, '2019-02-14 21:01:54', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (17, 3, '2019-02-14 21:03:04', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (18, 3, '2019-02-14 21:04:02', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (19, 3, '2019-02-14 21:07:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (20, 3, '2019-02-15 14:15:04', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (21, 3, '2019-02-16 12:20:07', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (22, 3, '2019-02-16 13:36:13', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (23, 3, '2019-02-17 10:42:36', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (24, 3, '2019-02-17 10:49:56', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (25, 3, '2019-02-26 13:23:05', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (26, 3, '2019-02-26 13:26:18', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (27, 3, '2019-02-26 13:32:42', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (28, 3, '2019-02-26 13:38:20', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (29, 3, '2019-02-26 14:01:00', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (30, 3, '2019-02-26 16:00:15', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (31, 3, '2019-02-26 18:21:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (32, 3, '2019-02-26 18:28:54', '0:0:0:0:0:0:0:1', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for ums_admin_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_permission_relation`;
CREATE TABLE `ums_admin_permission_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) DEFAULT NULL,
  `permission_id` bigint(20) DEFAULT NULL,
  `type` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台用户和权限关系表(除角色中定义的权限以外的加减权限)';

-- ----------------------------
-- Table structure for ums_admin_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_role_relation`;
CREATE TABLE `ums_admin_role_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='后台用户和角色关系表';

-- ----------------------------
-- Records of ums_admin_role_relation
-- ----------------------------
BEGIN;
INSERT INTO `ums_admin_role_relation` VALUES (13, 3, 1);
INSERT INTO `ums_admin_role_relation` VALUES (15, 3, 2);
INSERT INTO `ums_admin_role_relation` VALUES (16, 3, 4);
INSERT INTO `ums_admin_role_relation` VALUES (17, 3, 3);
INSERT INTO `ums_admin_role_relation` VALUES (18, 1, 1);
INSERT INTO `ums_admin_role_relation` VALUES (19, 1, 2);
INSERT INTO `ums_admin_role_relation` VALUES (20, 1, 3);
INSERT INTO `ums_admin_role_relation` VALUES (21, 1, 4);
COMMIT;

-- ----------------------------
-- Table structure for ums_growth_change_history
-- ----------------------------
DROP TABLE IF EXISTS `ums_growth_change_history`;
CREATE TABLE `ums_growth_change_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `change_type` int(1) DEFAULT NULL COMMENT '改变类型：0->增加；1->减少',
  `change_count` int(11) DEFAULT NULL COMMENT '积分改变数量',
  `operate_man` varchar(100) DEFAULT NULL COMMENT '操作人员',
  `operate_note` varchar(200) DEFAULT NULL COMMENT '操作备注',
  `source_type` int(1) DEFAULT NULL COMMENT '积分来源：0->购物；1->管理员修改',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='成长值变化历史记录表';

-- ----------------------------
-- Records of ums_growth_change_history
-- ----------------------------
BEGIN;
INSERT INTO `ums_growth_change_history` VALUES (1, 1, '2018-08-29 17:16:35', 0, 1000, 'test', '测试使用', 1);
COMMIT;

-- ----------------------------
-- Table structure for ums_integration_change_history
-- ----------------------------
DROP TABLE IF EXISTS `ums_integration_change_history`;
CREATE TABLE `ums_integration_change_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `change_type` int(1) DEFAULT NULL COMMENT '改变类型：0->增加；1->减少',
  `change_count` int(11) DEFAULT NULL COMMENT '积分改变数量',
  `operate_man` varchar(100) DEFAULT NULL COMMENT '操作人员',
  `operate_note` varchar(200) DEFAULT NULL COMMENT '操作备注',
  `source_type` int(1) DEFAULT NULL COMMENT '积分来源：0->购物；1->管理员修改',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分变化历史记录表';

-- ----------------------------
-- Table structure for ums_integration_consume_setting
-- ----------------------------
DROP TABLE IF EXISTS `ums_integration_consume_setting`;
CREATE TABLE `ums_integration_consume_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deduction_per_amount` int(11) DEFAULT NULL COMMENT '每一元需要抵扣的积分数量',
  `max_percent_per_order` int(11) DEFAULT NULL COMMENT '每笔订单最高抵用百分比',
  `use_unit` int(11) DEFAULT NULL COMMENT '每次使用积分最小单位100',
  `coupon_status` int(1) DEFAULT NULL COMMENT '是否可以和优惠券同用；0->不可以；1->可以',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='积分消费设置';

-- ----------------------------
-- Records of ums_integration_consume_setting
-- ----------------------------
BEGIN;
INSERT INTO `ums_integration_consume_setting` VALUES (1, 100, 50, 100, 1);
COMMIT;

-- ----------------------------
-- Table structure for ums_member
-- ----------------------------
DROP TABLE IF EXISTS `ums_member`;
CREATE TABLE `ums_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_level_id` bigint(20) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `nickname` varchar(64) DEFAULT NULL COMMENT '昵称',
  `phone` varchar(64) DEFAULT NULL COMMENT '手机号码',
  `status` int(1) DEFAULT NULL COMMENT '帐号启用状态:0->禁用；1->启用',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  `icon` varchar(500) DEFAULT NULL COMMENT '头像',
  `gender` int(1) DEFAULT NULL COMMENT '性别：0->未知；1->男；2->女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `city` varchar(64) DEFAULT NULL COMMENT '所做城市',
  `job` varchar(100) DEFAULT NULL COMMENT '职业',
  `personalized_signature` varchar(200) DEFAULT NULL COMMENT '个性签名',
  `source_type` int(1) DEFAULT NULL COMMENT '用户来源 1 小程序 2 公众号 3 页面',
  `integration` int(11) DEFAULT NULL COMMENT '积分',
  `growth` int(11) DEFAULT NULL COMMENT '成长值',
  `luckey_count` int(11) DEFAULT NULL COMMENT '剩余抽奖次数',
  `history_integration` int(11) DEFAULT NULL COMMENT '历史积分数量',
  `avatar` varchar(255) DEFAULT NULL,
  `weixin_openid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`),
  UNIQUE KEY `idx_phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of ums_member
-- ----------------------------
BEGIN;
INSERT INTO `ums_member` VALUES (1, 4, 'test', 'e10adc3949ba59abbe56e057f20f883e', 'windir', '18061581849', 1, '2018-08-02 10:35:44', 'https://wx.qlogo.cn/mmopen/vi_32/iaGr8vffqgqiaE3ibNzh9NN8ASiasYCxl4yA2dU7iaMdVjXJREBKCDR5Pr2IdN4lB9PvFlfLasib5rVxLxzHlhbAytDw/132', 1, '2009-06-01', '上海', '学生', 'test', NULL, 5000, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (3, 4, 'windy', 'e10adc3949ba59abbe56e057f20f883e', 'windy', '18061581848', 1, '2018-08-03 16:46:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (4, 4, 'zhengsan', 'e10adc3949ba59abbe56e057f20f883e', 'zhengsan', '18061581847', 1, '2018-11-12 14:12:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (5, 4, 'lisi', 'e10adc3949ba59abbe56e057f20f883e', 'lisi', '18061581841', 1, '2018-11-12 14:12:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (6, 4, 'wangwu', 'e10adc3949ba59abbe56e057f20f883e', 'wangwu', '18061581842', 1, '2018-11-12 14:13:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (7, 4, 'lion', 'e10adc3949ba59abbe56e057f20f883e', 'lion', '18061581845', 1, '2018-11-12 14:21:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (8, 4, 'shari', 'e10adc3949ba59abbe56e057f20f883e', 'shari', '18061581844', 1, '2018-11-12 14:22:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (9, 4, 'aewen', 'e10adc3949ba59abbe56e057f20f883e', 'aewen', '18061581843', 1, '2018-11-12 14:22:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (17, 4, 'wxapplettmcyus5qz354', 'e10adc3949ba59abbe56e057f20f883e', '沈专', NULL, 1, '2019-02-17 11:16:58', 'https://wx.qlogo.cn/mmopen/vi_32/iaGr8vffqgqiaE3ibNzh9NN8ASiasYCxl4yA2dU7iaMdVjXJREBKCDR5Pr2IdN4lB9PvFlfLasib5rVxLxzHlhbAytDw/132', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'oDIzz0M1TJ77dw46jXsawJqId84g');
INSERT INTO `ums_member` VALUES (18, 4, '123', '202cb962ac59075b964b07152d234b70', NULL, NULL, 1, '2019-03-15 17:53:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for ums_member_level
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_level`;
CREATE TABLE `ums_member_level` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `growth_point` int(11) DEFAULT NULL,
  `default_status` int(1) DEFAULT NULL COMMENT '是否为默认等级：0->不是；1->是',
  `free_freight_point` decimal(10,2) DEFAULT NULL COMMENT '免运费标准',
  `comment_growth_point` int(11) DEFAULT NULL COMMENT '每次评价获取的成长值',
  `priviledge_free_freight` int(1) DEFAULT NULL COMMENT '是否有免邮特权',
  `priviledge_sign_in` int(1) DEFAULT NULL COMMENT '是否有签到特权',
  `priviledge_comment` int(1) DEFAULT NULL COMMENT '是否有评论获奖励特权',
  `priviledge_promotion` int(1) DEFAULT NULL COMMENT '是否有专享活动特权',
  `priviledge_member_price` int(1) DEFAULT NULL COMMENT '是否有会员价格特权',
  `priviledge_birthday` int(1) DEFAULT NULL COMMENT '是否有生日特权',
  `note` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='会员等级表';

-- ----------------------------
-- Records of ums_member_level
-- ----------------------------
BEGIN;
INSERT INTO `ums_member_level` VALUES (1, '黄金会员', 1000, 0, 199.00, 5, 1, 1, 1, 1, 1, 1, NULL);
INSERT INTO `ums_member_level` VALUES (2, '白金会员', 5000, 0, 99.00, 10, 1, 1, 1, 1, 1, 1, NULL);
INSERT INTO `ums_member_level` VALUES (3, '钻石会员', 15000, 0, 69.00, 15, 1, 1, 1, 1, 1, 1, NULL);
INSERT INTO `ums_member_level` VALUES (4, '普通会员', 1, 1, 199.00, 20, 1, 1, 1, 1, 0, 0, NULL);
COMMIT;

-- ----------------------------
-- Table structure for ums_member_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_login_log`;
CREATE TABLE `ums_member_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `login_type` int(1) DEFAULT NULL COMMENT '登录类型：0->PC；1->android;2->ios;3->小程序',
  `province` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员登录记录';

-- ----------------------------
-- Table structure for ums_member_member_tag_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_member_tag_relation`;
CREATE TABLE `ums_member_member_tag_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `tag_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和标签关系表';

-- ----------------------------
-- Table structure for ums_member_product_category_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_product_category_relation`;
CREATE TABLE `ums_member_product_category_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `product_category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员与产品分类关系表（用户喜欢的分类）';

-- ----------------------------
-- Table structure for ums_member_receive_address
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_receive_address`;
CREATE TABLE `ums_member_receive_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT '收货人名称',
  `phone_number` varchar(64) DEFAULT NULL,
  `default_status` int(1) DEFAULT NULL COMMENT '是否为默认',
  `post_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `province` varchar(100) DEFAULT NULL COMMENT '省份/直辖市',
  `city` varchar(100) DEFAULT NULL COMMENT '城市',
  `region` varchar(100) DEFAULT NULL COMMENT '区',
  `detail_address` varchar(128) DEFAULT NULL COMMENT '详细地址(街道)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='会员收货地址表';

-- ----------------------------
-- Records of ums_member_receive_address
-- ----------------------------
BEGIN;
INSERT INTO `ums_member_receive_address` VALUES (1, 1, '大梨', '18033441849', 0, '', '广东省', '深圳市', '南山区', '科兴科学园');
INSERT INTO `ums_member_receive_address` VALUES (4, 5, '大梨', '18033441849', 1, '518000', '广东省', '深圳市', '福田区', '东晓街道');
INSERT INTO `ums_member_receive_address` VALUES (6, 5, '123', '13146587766', 1, NULL, '', '', '', '3333');
INSERT INTO `ums_member_receive_address` VALUES (7, 5, '张三', '020-81167888', 0, '510000', NULL, NULL, NULL, '新港中路397号');
INSERT INTO `ums_member_receive_address` VALUES (8, 17, '张三', '020-81167888', 1, '510000', NULL, NULL, NULL, '新港中路397号');
INSERT INTO `ums_member_receive_address` VALUES (10, 17, '123', '13146587799', 0, NULL, '', '', '', '11111');
INSERT INTO `ums_member_receive_address` VALUES (11, 1, '梁云凤', '13000000000', 1, '', '广东省', '深圳市', '', '龙岗区龙翔大道2188号');
COMMIT;

-- ----------------------------
-- Table structure for ums_member_rule_setting
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_rule_setting`;
CREATE TABLE `ums_member_rule_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `continue_sign_day` int(11) DEFAULT NULL COMMENT '连续签到天数',
  `continue_sign_point` int(11) DEFAULT NULL COMMENT '连续签到赠送数量',
  `consume_per_point` decimal(10,2) DEFAULT NULL COMMENT '每消费多少元获取1个点',
  `low_order_amount` decimal(10,2) DEFAULT NULL COMMENT '最低获取点数的订单金额',
  `max_point_per_order` int(11) DEFAULT NULL COMMENT '每笔订单最高获取点数',
  `type` int(1) DEFAULT NULL COMMENT '类型：0->积分规则；1->成长值规则',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员积分成长规则表';

-- ----------------------------
-- Table structure for ums_member_statistics_info
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_statistics_info`;
CREATE TABLE `ums_member_statistics_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `consume_amount` decimal(10,2) DEFAULT NULL COMMENT '累计消费金额',
  `order_count` int(11) DEFAULT NULL COMMENT '订单数量',
  `coupon_count` int(11) DEFAULT NULL COMMENT '优惠券数量',
  `comment_count` int(11) DEFAULT NULL COMMENT '评价数',
  `return_order_count` int(11) DEFAULT NULL COMMENT '退货数量',
  `login_count` int(11) DEFAULT NULL COMMENT '登录次数',
  `attend_count` int(11) DEFAULT NULL COMMENT '关注数量',
  `fans_count` int(11) DEFAULT NULL COMMENT '粉丝数量',
  `collect_product_count` int(11) DEFAULT NULL,
  `collect_subject_count` int(11) DEFAULT NULL,
  `collect_topic_count` int(11) DEFAULT NULL,
  `collect_comment_count` int(11) DEFAULT NULL,
  `invite_friend_count` int(11) DEFAULT NULL,
  `recent_order_time` datetime DEFAULT NULL COMMENT '最后一次下订单时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员统计信息';

-- ----------------------------
-- Table structure for ums_member_tag
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_tag`;
CREATE TABLE `ums_member_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `finish_order_count` int(11) DEFAULT NULL COMMENT '自动打标签完成订单数量',
  `finish_order_amount` decimal(10,2) DEFAULT NULL COMMENT '自动打标签完成订单金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户标签表';

-- ----------------------------
-- Table structure for ums_member_task
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_task`;
CREATE TABLE `ums_member_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `growth` int(11) DEFAULT NULL COMMENT '赠送成长值',
  `intergration` int(11) DEFAULT NULL COMMENT '赠送积分',
  `type` int(1) DEFAULT NULL COMMENT '任务类型：0->新手任务；1->日常任务',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员任务表';

-- ----------------------------
-- Table structure for ums_permission
-- ----------------------------
DROP TABLE IF EXISTS `ums_permission`;
CREATE TABLE `ums_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) DEFAULT NULL COMMENT '父级权限id',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `value` varchar(200) DEFAULT NULL COMMENT '权限值',
  `icon` varchar(500) DEFAULT NULL COMMENT '图标',
  `type` int(1) DEFAULT NULL COMMENT '权限类型：0->目录；1->菜单；2->按钮（接口绑定权限）',
  `uri` varchar(200) DEFAULT NULL COMMENT '前端资源路径',
  `status` int(1) DEFAULT NULL COMMENT '启用状态；0->禁用；1->启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='后台用户权限表';

-- ----------------------------
-- Records of ums_permission
-- ----------------------------
BEGIN;
INSERT INTO `ums_permission` VALUES (1, 0, '商品', NULL, NULL, 0, NULL, 1, '2018-09-29 16:15:14', 0);
INSERT INTO `ums_permission` VALUES (2, 1, '商品列表', 'pms:product:read', NULL, 1, '/pms/product/index', 1, '2018-09-29 16:17:01', 0);
INSERT INTO `ums_permission` VALUES (3, 0, '添加商品', 'pms:product:create', NULL, 1, '/pms/product/add', 1, '2018-09-29 16:18:51', 0);
INSERT INTO `ums_permission` VALUES (4, 0, '商品分类', 'pms:productCategory:read', NULL, 1, '/pms/productCate/index', 1, '2018-09-29 16:23:07', 0);
INSERT INTO `ums_permission` VALUES (5, 0, '商品类型', 'pms:productAttribute:read', NULL, 1, '/pms/productAttr/index', 1, '2018-09-29 16:24:43', 0);
INSERT INTO `ums_permission` VALUES (6, 0, '品牌管理', 'pms:brand:read', NULL, 1, '/pms/brand/index', 1, '2018-09-29 16:25:45', 0);
INSERT INTO `ums_permission` VALUES (7, 0, '编辑商品', 'pms:product:update', NULL, 2, '/pms/product/updateProduct', 1, '2018-09-29 16:34:23', 0);
INSERT INTO `ums_permission` VALUES (8, 0, '删除商品', 'pms:product:delete', NULL, 2, '/pms/product/delete', 1, '2018-09-29 16:38:33', 0);
INSERT INTO `ums_permission` VALUES (9, 0, '添加商品分类', 'pms:productCategory:create', NULL, 2, '/pms/productCate/create', 1, '2018-09-29 16:43:23', 0);
INSERT INTO `ums_permission` VALUES (10, 0, '修改商品分类', 'pms:productCategory:update', NULL, 2, '/pms/productCate/update', 1, '2018-09-29 16:43:55', 0);
INSERT INTO `ums_permission` VALUES (11, 0, '删除商品分类', 'pms:productCategory:delete', NULL, 2, '/pms/productAttr/delete', 1, '2018-09-29 16:44:38', 0);
INSERT INTO `ums_permission` VALUES (12, 0, '添加商品类型', 'pms:productAttribute:create', NULL, 2, '/pms/productAttr/create', 1, '2018-09-29 16:45:25', 0);
INSERT INTO `ums_permission` VALUES (13, 0, '修改商品类型', 'pms:productAttribute:update', NULL, 2, '/pms/productAttr/update', 1, '2018-09-29 16:48:08', 0);
INSERT INTO `ums_permission` VALUES (14, 0, '删除商品类型', 'pms:productAttribute:delete', NULL, 2, '/pms/productAttr/delete', 1, '2018-09-29 16:48:44', 0);
INSERT INTO `ums_permission` VALUES (15, 0, '添加品牌', 'pms:brand:create', NULL, 2, '/pms/brand/add', 1, '2018-09-29 16:49:34', 0);
INSERT INTO `ums_permission` VALUES (16, 0, '修改品牌', 'pms:brand:update', NULL, 2, '/pms/brand/update', 1, '2018-09-29 16:50:55', 0);
INSERT INTO `ums_permission` VALUES (17, 0, '删除品牌', 'pms:brand:delete', NULL, 2, '/pms/brand/delete', 1, '2018-09-29 16:50:59', 0);
INSERT INTO `ums_permission` VALUES (18, 0, '首页', NULL, NULL, 0, NULL, 1, '2018-09-29 16:51:57', 0);
COMMIT;

-- ----------------------------
-- Table structure for ums_role
-- ----------------------------
DROP TABLE IF EXISTS `ums_role`;
CREATE TABLE `ums_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `admin_count` int(11) DEFAULT NULL COMMENT '后台用户数量',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int(1) DEFAULT '1' COMMENT '启用状态：0->禁用；1->启用',
  `sort` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='后台用户角色表';

-- ----------------------------
-- Records of ums_role
-- ----------------------------
BEGIN;
INSERT INTO `ums_role` VALUES (1, '商品管理员', '商品管理员', 0, '2018-09-30 15:46:11', 1, 0);
INSERT INTO `ums_role` VALUES (2, '商品分类管理员', '商品分类管理员', 0, '2018-09-30 15:53:45', 1, 0);
INSERT INTO `ums_role` VALUES (3, '商品类型管理员', '商品类型管理员', 0, '2018-09-30 15:53:56', 1, 0);
INSERT INTO `ums_role` VALUES (4, '品牌管理员', '品牌管理员', 0, '2018-09-30 15:54:12', 1, 0);
INSERT INTO `ums_role` VALUES (5, '管理猿', '管理所有权限', 0, '2019-02-28 16:23:51', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for ums_role_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_permission_relation`;
CREATE TABLE `ums_role_permission_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL,
  `permission_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='后台用户角色和权限关系表';

-- ----------------------------
-- Records of ums_role_permission_relation
-- ----------------------------
BEGIN;
INSERT INTO `ums_role_permission_relation` VALUES (1, 1, 1);
INSERT INTO `ums_role_permission_relation` VALUES (2, 1, 2);
INSERT INTO `ums_role_permission_relation` VALUES (3, 1, 3);
INSERT INTO `ums_role_permission_relation` VALUES (4, 1, 7);
INSERT INTO `ums_role_permission_relation` VALUES (5, 1, 8);
INSERT INTO `ums_role_permission_relation` VALUES (6, 2, 4);
INSERT INTO `ums_role_permission_relation` VALUES (7, 2, 9);
INSERT INTO `ums_role_permission_relation` VALUES (8, 2, 10);
INSERT INTO `ums_role_permission_relation` VALUES (9, 2, 11);
INSERT INTO `ums_role_permission_relation` VALUES (10, 3, 5);
INSERT INTO `ums_role_permission_relation` VALUES (11, 3, 12);
INSERT INTO `ums_role_permission_relation` VALUES (12, 3, 13);
INSERT INTO `ums_role_permission_relation` VALUES (13, 3, 14);
INSERT INTO `ums_role_permission_relation` VALUES (14, 4, 6);
INSERT INTO `ums_role_permission_relation` VALUES (15, 4, 15);
INSERT INTO `ums_role_permission_relation` VALUES (16, 4, 16);
INSERT INTO `ums_role_permission_relation` VALUES (17, 4, 17);
COMMIT;

-- ----------------------------
-- Table structure for xn_activity
-- ----------------------------
DROP TABLE IF EXISTS `xn_activity`;
CREATE TABLE `xn_activity` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT NULL COMMENT '标题',
  `image` varchar(512) DEFAULT NULL COMMENT '封面',
  `content` text COMMENT '内容',
  `is_notice` int(2) DEFAULT NULL COMMENT '是否已通知 1 是 2 否',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xn_activity
-- ----------------------------
BEGIN;
INSERT INTO `xn_activity` VALUES (6, '先人一步的科技享受', '../upload_file/19/03/30/1553947047660__Xiaoxi-huodonggonggao-xiangqing.png', '<p><img src=\"http://111.231.223.236:8095/CarAccompany/upload_file/editor/jsp/upload/20190330/50261553946995503.png\"/></p>', 1, '2019-03-29 14:00:16', '2019-04-01 11:19:22');
COMMIT;

-- ----------------------------
-- Table structure for xn_admin
-- ----------------------------
DROP TABLE IF EXISTS `xn_admin`;
CREATE TABLE `xn_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(32) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `admin_type` int(2) DEFAULT '2',
  `jurisdiction` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xn_admin
-- ----------------------------
BEGIN;
INSERT INTO `xn_admin` VALUES (3, '邓烨斌', '123', '123', '2018-01-08 00:37:42', 1, NULL);
INSERT INTO `xn_admin` VALUES (17, '赵孟', '13319545555', 'zhaomeng2001', '2018-08-31 13:55:51', 1, NULL);
INSERT INTO `xn_admin` VALUES (25, '邓烨斌', '15625218801', '1239885', '2018-10-18 22:02:09', 2, '[1001,1005]');
INSERT INTO `xn_admin` VALUES (26, '135658', '15602901970', '123456', '2018-10-19 13:41:15', 2, '[1001,1004,1005]');
INSERT INTO `xn_admin` VALUES (27, '德国烨斌', '15678088987', '123456', '2018-10-19 16:03:48', 2, '[1001,1005]');
COMMIT;

-- ----------------------------
-- Table structure for xn_car_beauty
-- ----------------------------
DROP TABLE IF EXISTS `xn_car_beauty`;
CREATE TABLE `xn_car_beauty` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `type` int(4) DEFAULT NULL,
  `beauty_title` varchar(128) DEFAULT NULL,
  `beauty_desc` varchar(128) DEFAULT NULL,
  `image_url` varchar(512) DEFAULT NULL COMMENT '图片路径',
  `product_id` int(16) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xn_car_beauty
-- ----------------------------
BEGIN;
INSERT INTO `xn_car_beauty` VALUES (3, 3, '水晶打蜡', '全国通用 持久光亮', '../upload_file/19/03/30/1553945286521__C675a4d1eaafdce1b78711a63d491356.png', 3, '2019-03-26 16:33:30', '2019-03-30 19:28:08');
INSERT INTO `xn_car_beauty` VALUES (4, 4, '安心喷漆套餐', '低至598元起', '../upload_file/19/03/30/1553945483962__C675a4d1eaafdce1b78711a63d491356.png', 4, '2019-03-26 16:33:32', '2019-03-30 19:31:47');
INSERT INTO `xn_car_beauty` VALUES (5, 1, '300元优惠洗车', '全国通用 即买即用', '../upload_file/19/03/30/1553945192190__Zu1.png', 12, '2019-03-27 10:42:00', '2019-03-30 19:26:34');
INSERT INTO `xn_car_beauty` VALUES (6, 1, '199元套餐', '全国通用 （除广东）', '../upload_file/19/03/30/1553945181956__Zu1.png', 13, '2019-03-27 10:45:16', '2019-03-30 19:26:23');
INSERT INTO `xn_car_beauty` VALUES (7, 1, '299元套餐', '广东一类城市', '../upload_file/19/03/30/1553945169799__Zu1.png', 14, '2019-03-27 10:50:49', '2019-03-30 19:26:11');
INSERT INTO `xn_car_beauty` VALUES (8, 2, '空调清洗除菌', '祛病菌 除异味', '../upload_file/19/03/30/1553945234723__Tuceng3.png', 15, '2019-03-27 10:54:28', '2019-03-30 19:27:16');
INSERT INTO `xn_car_beauty` VALUES (9, 2, '前挡玻璃磨泥', '恢复玻璃光洁透亮', '../upload_file/19/03/30/1553945222972__Tuceng2.png', 16, '2019-03-27 10:55:35', '2019-03-30 19:27:04');
INSERT INTO `xn_car_beauty` VALUES (10, 2, '前挡玻璃镀膜', '提升玻璃泼水性', '../upload_file/19/03/30/1553945206003__Tuceng1.png', 16, '2019-03-27 10:56:44', '2019-03-30 19:26:47');
INSERT INTO `xn_car_beauty` VALUES (11, 3, '水晶打蜡', '低至130元', '../upload_file/19/03/30/1553945313678__C675a4d1eaafdce1b78711a63d491356.png', 21, '2019-03-30 19:28:51', '2019-03-30 19:28:51');
INSERT INTO `xn_car_beauty` VALUES (12, 4, '安心喷漆', '低至215元起', '../upload_file/19/03/30/1553945472806__C675a4d1eaafdce1b78711a63d491356.png', 57, '2019-03-30 19:31:03', '2019-03-30 19:31:14');
COMMIT;

-- ----------------------------
-- Table structure for xn_car_data
-- ----------------------------
DROP TABLE IF EXISTS `xn_car_data`;
CREATE TABLE `xn_car_data` (
  `data` longtext,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xn_car_data
-- ----------------------------
BEGIN;
INSERT INTO `xn_car_data` VALUES ('{\"error_code\":0,\"reason\":\"Success\",\"result\":[{\"I\":117,\"N\":\"AC Schnitzer\",\"L\":\"A\",\"List\":[{\"I\":305,\"N\":\"AC Schnitzer\",\"List\":[{\"I\":3895,\"N\":\"AC Schnitzer M3\"},{\"I\":2097,\"N\":\"AC Schnitzer X5(停售)\"}]}]},{\"I\":276,\"N\":\"ALPINA\",\"L\":\"A\",\"List\":[{\"I\":460,\"N\":\"ALPINA\",\"List\":[{\"I\":4212,\"N\":\"ALPINA B4\"}]}]},{\"I\":34,\"N\":\"阿尔法·罗密欧\",\"L\":\"A\",\"List\":[{\"I\":86,\"N\":\"阿尔法·罗密欧\",\"List\":[{\"I\":3825,\"N\":\"Giulia\"},{\"I\":4196,\"N\":\"Stelvio\"},{\"I\":179,\"N\":\"ALFA 156(停售)\"},{\"I\":401,\"N\":\"ALFA GT(停售)\"}]}]},{\"I\":35,\"N\":\"阿斯顿·马丁\",\"L\":\"A\",\"List\":[{\"I\":108,\"N\":\"阿斯顿·马丁\",\"List\":[{\"I\":923,\"N\":\"Rapide\"},{\"I\":822,\"N\":\"V12 Vantage\"},{\"I\":385,\"N\":\"V8 Vantage\"},{\"I\":386,\"N\":\"Vanquish\"},{\"I\":2275,\"N\":\"Virage\"},{\"I\":3891,\"N\":\"阿斯顿·马丁DB11\"},{\"I\":266,\"N\":\"阿斯顿·马丁DB9\"},{\"I\":582,\"N\":\"阿斯顿·马丁DBS\"},{\"I\":2846,\"N\":\"V12 Zagato(停售)\"},{\"I\":884,\"N\":\"拉共达Taraf(停售)\"}]}]},{\"I\":221,\"N\":\"安凯客车\",\"L\":\"A\",\"List\":[{\"I\":401,\"N\":\"安凯客车\",\"List\":[{\"I\":2745,\"N\":\"宝斯通(停售)\"}]}]},{\"I\":33,\"N\":\"奥迪\",\"L\":\"A\",\"List\":[{\"I\":9,\"N\":\"一汽-大众奥迪\",\"List\":[{\"I\":3170,\"N\":\"奥迪A3\"},{\"I\":692,\"N\":\"奥迪A4L\"},{\"I\":18,\"N\":\"奥迪A6L\"},{\"I\":4526,\"N\":\"奥迪A6L新能源\"},{\"I\":4871,\"N\":\"奥迪Q2L\"},{\"I\":2951,\"N\":\"奥迪Q3\"},{\"I\":812,\"N\":\"奥迪Q5\"},{\"I\":4851,\"N\":\"奥迪Q5L\"},{\"I\":19,\"N\":\"奥迪A4(停售)\"},{\"I\":509,\"N\":\"奥迪A6(停售)\"}]},{\"I\":346,\"N\":\"Audi Sport\",\"List\":[{\"I\":511,\"N\":\"奥迪R8\"},{\"I\":2731,\"N\":\"奥迪RS 3\"},{\"I\":2733,\"N\":\"奥迪RS 4\"},{\"I\":2735,\"N\":\"奥迪RS 5\"},{\"I\":2737,\"N\":\"奥迪RS 6\"},{\"I\":2994,\"N\":\"奥迪RS 7\"},{\"I\":2741,\"N\":\"奥迪TT RS\"}]},{\"I\":79,\"N\":\"奥迪(进口)\",\"List\":[{\"I\":650,\"N\":\"奥迪A1\"},{\"I\":370,\"N\":\"奥迪A3(进口)\"},{\"I\":4325,\"N\":\"奥迪A3新能源(进口)\"},{\"I\":471,\"N\":\"奥迪A4(进口)\"},{\"I\":538,\"N\":\"奥迪A5\"},{\"I\":472,\"N\":\"奥迪A6(进口)\"},{\"I\":740,\"N\":\"奥迪A7\"},{\"I\":146,\"N\":\"奥迪A8\"},{\"I\":2264,\"N\":\"奥迪Q3(进口)\"},{\"I\":593,\"N\":\"奥迪Q5(进口)\"},{\"I\":412,\"N\":\"奥迪Q7\"},{\"I\":4460,\"N\":\"奥迪Q7新能源\"},{\"I\":2730,\"N\":\"奥迪S3\"},{\"I\":2732,\"N\":\"奥迪S4\"},{\"I\":2734,\"N\":\"奥迪S5\"},{\"I\":2736,\"N\":\"奥迪S6\"},{\"I\":2738,\"N\":\"奥迪S7\"},{\"I\":2739,\"N\":\"奥迪S8\"},{\"I\":2841,\"N\":\"奥迪SQ5\"},{\"I\":148,\"N\":\"奥迪TT\"},{\"I\":2740,\"N\":\"奥迪TTS\"}]}]},{\"I\":140,\"N\":\"巴博斯\",\"L\":\"B\",\"List\":[{\"I\":326,\"N\":\"巴博斯\",\"List\":[{\"I\":2447,\"N\":\"巴博斯 CLS级\"},{\"I\":2575,\"N\":\"巴博斯 M级\"},{\"I\":2446,\"N\":\"巴博斯 SLK级\"},{\"I\":4261,\"N\":\"巴博斯 smart forfour\"},{\"I\":2683,\"N\":\"巴博斯 smart fortwo\"},{\"I\":2444,\"N\":\"巴博斯 S级\"}]}]},{\"I\":120,\"N\":\"宝骏\",\"L\":\"B\",\"List\":[{\"I\":59,\"N\":\"上汽通用五菱\",\"List\":[{\"I\":4908,\"N\":\"宝骏RS-5\"},{\"I\":4077,\"N\":\"宝骏310\"},{\"I\":4392,\"N\":\"宝骏310W\"},{\"I\":4606,\"N\":\"宝骏360\"},{\"I\":4166,\"N\":\"宝骏510\"},{\"I\":4587,\"N\":\"宝骏530\"},{\"I\":3677,\"N\":\"宝骏560\"},{\"I\":3412,\"N\":\"宝骏730\"},{\"I\":3993,\"N\":\"宝骏E100\"},{\"I\":4890,\"N\":\"宝骏E200\"},{\"I\":3774,\"N\":\"宝骏330(停售)\"},{\"I\":3343,\"N\":\"宝骏610(停售)\"},{\"I\":2236,\"N\":\"宝骏630(停售)\"},{\"I\":155,\"N\":\"乐驰(停售)\"}]}]},{\"I\":15,\"N\":\"宝马\",\"L\":\"B\",\"List\":[{\"I\":29,\"N\":\"华晨宝马\",\"List\":[{\"I\":4171,\"N\":\"宝马1系\"},{\"I\":3941,\"N\":\"宝马2系旅行车\"},{\"I\":66,\"N\":\"宝马3系\"},{\"I\":65,\"N\":\"宝马5系\"},{\"I\":4350,\"N\":\"宝马5系新能源\"},{\"I\":2561,\"N\":\"宝马X1\"},{\"I\":4356,\"N\":\"宝马X1新能源\"},{\"I\":4658,\"N\":\"宝马X3\"}]},{\"I\":80,\"N\":\"宝马(进口)\",\"List\":[{\"I\":373,\"N\":\"宝马1系(进口)\"},{\"I\":3230,\"N\":\"宝马2系\"},{\"I\":3726,\"N\":\"宝马2系多功能旅行车\"},{\"I\":3302,\"N\":\"宝马2系旅行车(进口)\"},{\"I\":317,\"N\":\"宝马3系(进口)\"},{\"I\":2963,\"N\":\"宝马3系GT\"},{\"I\":2968,\"N\":\"宝马4系\"},{\"I\":202,\"N\":\"宝马5系(进口)\"},{\"I\":270,\"N\":\"宝马6系\"},{\"I\":4472,\"N\":\"宝马6系GT\"},{\"I\":153,\"N\":\"宝马7系\"},{\"I\":4345,\"N\":\"宝马7系新能源\"},{\"I\":2388,\"N\":\"宝马i3\"},{\"I\":2387,\"N\":\"宝马i8\"},{\"I\":675,\"N\":\"宝马X1(进口)\"},{\"I\":3386,\"N\":\"宝马X2\"},{\"I\":271,\"N\":\"宝马X3(进口)\"},{\"I\":3053,\"N\":\"宝马X4\"},{\"I\":159,\"N\":\"宝马X5\"},{\"I\":4348,\"N\":\"宝马X5新能源\"},{\"I\":587,\"N\":\"宝马X6\"},{\"I\":161,\"N\":\"宝马Z4\"},{\"I\":2847,\"N\":\"宝马5系GT(停售)\"}]},{\"I\":345,\"N\":\"宝马M\",\"List\":[{\"I\":3357,\"N\":\"宝马M2\"},{\"I\":2196,\"N\":\"宝马M3\"},{\"I\":3189,\"N\":\"宝马M4\"},{\"I\":2726,\"N\":\"宝马M5\"},{\"I\":2727,\"N\":\"宝马M6\"},{\"I\":2728,\"N\":\"宝马X5 M\"},{\"I\":2729,\"N\":\"宝马X6 M\"},{\"I\":2725,\"N\":\"宝马1系M(停售)\"}]}]},{\"I\":351,\"N\":\"宝骐汽车\",\"L\":\"B\",\"List\":[{\"I\":526,\"N\":\"宝骐汽车\",\"List\":[{\"I\":5036,\"N\":\"帅骐\"}]}]},{\"I\":231,\"N\":\"宝沃\",\"L\":\"B\",\"List\":[{\"I\":415,\"N\":\"宝沃汽车\",\"List\":[{\"I\":4046,\"N\":\"宝沃BX5\"},{\"I\":4520,\"N\":\"宝沃BX6\"},{\"I\":3913,\"N\":\"宝沃BX7\"},{\"I\":4403,\"N\":\"宝沃BXi7\"}]}]},{\"I\":40,\"N\":\"保时捷\",\"L\":\"B\",\"List\":[{\"I\":81,\"N\":\"保时捷\",\"List\":[{\"I\":172,\"N\":\"Cayenne\"},{\"I\":4324,\"N\":\"Cayenne新能源\"},{\"I\":2838,\"N\":\"Macan\"},{\"I\":703,\"N\":\"Panamera\"},{\"I\":4322,\"N\":\"Panamera新能源\"},{\"I\":4175,\"N\":\"保时捷718\"},{\"I\":162,\"N\":\"保时捷911\"},{\"I\":2073,\"N\":\"918 Spyder(停售)\"},{\"I\":168,\"N\":\"Boxster(停售)\"},{\"I\":415,\"N\":\"Cayman(停售)\"}]}]},{\"I\":27,\"N\":\"北京\",\"L\":\"B\",\"List\":[{\"I\":312,\"N\":\"北京汽车\",\"List\":[{\"I\":3800,\"N\":\"北京(BJ)20\"},{\"I\":623,\"N\":\"北京BJ40\"},{\"I\":2852,\"N\":\"北京BJ80\"},{\"I\":2252,\"N\":\"北京汽车E系列(停售)\"}]}]},{\"I\":333,\"N\":\"北京清行\",\"L\":\"B\",\"List\":[{\"I\":507,\"N\":\"北京清行\",\"List\":[{\"I\":4861,\"N\":\"清行400\"}]}]},{\"I\":79,\"N\":\"北汽昌河\",\"L\":\"B\",\"List\":[{\"I\":177,\"N\":\"北汽昌河\",\"List\":[{\"I\":4488,\"N\":\"北斗星X5E\"},{\"I\":4506,\"N\":\"北汽昌河A6\"},{\"I\":3640,\"N\":\"北汽昌河M50\"},{\"I\":4208,\"N\":\"北汽昌河M70\"},{\"I\":3922,\"N\":\"北汽昌河Q25\"},{\"I\":3980,\"N\":\"北汽昌河Q35\"},{\"I\":4599,\"N\":\"北汽昌河Q7\"},{\"I\":4689,\"N\":\"昌河北斗星\"},{\"I\":4141,\"N\":\"福瑞达K21\"},{\"I\":4142,\"N\":\"福瑞达K22\"},{\"I\":76,\"N\":\"爱迪尔(停售)\"},{\"I\":2478,\"N\":\"福瑞达(停售)\"},{\"I\":3058,\"N\":\"福运(停售)\"}]}]},{\"I\":301,\"N\":\"北汽道达\",\"L\":\"B\",\"List\":[{\"I\":482,\"N\":\"北汽瑞丽\",\"List\":[{\"I\":4511,\"N\":\"道达V8\"}]}]},{\"I\":203,\"N\":\"北汽幻速\",\"L\":\"B\",\"List\":[{\"I\":383,\"N\":\"北汽银翔\",\"List\":[{\"I\":3661,\"N\":\"北汽幻速H2\"},{\"I\":4137,\"N\":\"北汽幻速H2V\"},{\"I\":3874,\"N\":\"北汽幻速H3\"},{\"I\":4310,\"N\":\"北汽幻速H5\"},{\"I\":3714,\"N\":\"北汽幻速H6\"},{\"I\":3284,\"N\":\"北汽幻速S2\"},{\"I\":3361,\"N\":\"北汽幻速S3\"},{\"I\":4276,\"N\":\"北汽幻速S5\"},{\"I\":3426,\"N\":\"北汽幻速S6\"},{\"I\":4502,\"N\":\"北汽幻速S7\"}]}]},{\"I\":173,\"N\":\"北汽绅宝\",\"L\":\"B\",\"List\":[{\"I\":312,\"N\":\"北京汽车\",\"List\":[{\"I\":2791,\"N\":\"绅宝D50\"},{\"I\":2787,\"N\":\"绅宝D70\"},{\"I\":3839,\"N\":\"绅宝X25\"},{\"I\":3928,\"N\":\"绅宝X35\"},{\"I\":3795,\"N\":\"绅宝X55\"},{\"I\":3417,\"N\":\"绅宝X65\"},{\"I\":4987,\"N\":\"绅宝智道\"},{\"I\":4923,\"N\":\"绅宝智行\"},{\"I\":3794,\"N\":\"绅宝CC(停售)\"},{\"I\":3557,\"N\":\"绅宝D20(停售)\"},{\"I\":3427,\"N\":\"绅宝D60(停售)\"},{\"I\":3673,\"N\":\"绅宝D80(停售)\"}]}]},{\"I\":143,\"N\":\"北汽威旺\",\"L\":\"B\",\"List\":[{\"I\":312,\"N\":\"北京汽车\",\"List\":[{\"I\":2482,\"N\":\"北汽威旺306\"},{\"I\":3231,\"N\":\"北汽威旺307\"},{\"I\":3191,\"N\":\"北汽威旺M20\"},{\"I\":3916,\"N\":\"北汽威旺M30\"},{\"I\":4154,\"N\":\"北汽威旺M50F\"},{\"I\":4553,\"N\":\"北汽威旺M60\"},{\"I\":4009,\"N\":\"北汽威旺S50\"},{\"I\":2943,\"N\":\"北汽威旺205(停售)\"},{\"I\":4061,\"N\":\"北汽威旺M35(停售)\"},{\"I\":3428,\"N\":\"北汽威旺T205-D(停售)\"}]},{\"I\":185,\"N\":\"北京汽车制造厂\",\"List\":[{\"I\":3712,\"N\":\"北汽007(停售)\"}]},{\"I\":390,\"N\":\"北汽新能源\",\"List\":[{\"I\":4812,\"N\":\"北汽威旺407EV\"}]}]},{\"I\":208,\"N\":\"北汽新能源\",\"L\":\"B\",\"List\":[{\"I\":390,\"N\":\"北汽新能源\",\"List\":[{\"I\":4264,\"N\":\"EC系列\"},{\"I\":3884,\"N\":\"EU系列\"},{\"I\":4015,\"N\":\"EX系列\"},{\"I\":5059,\"N\":\"北汽新能源EC3\"},{\"I\":5058,\"N\":\"北汽新能源EU5\"},{\"I\":5022,\"N\":\"北汽新能源EX5\"},{\"I\":4104,\"N\":\"EH系列(停售)\"},{\"I\":3533,\"N\":\"EV系列(停售)\"},{\"I\":3537,\"N\":\"北汽新能源ES210(停售)\"}]}]},{\"I\":154,\"N\":\"北汽制造\",\"L\":\"B\",\"List\":[{\"I\":185,\"N\":\"北京汽车制造厂\",\"List\":[{\"I\":3035,\"N\":\"BJ 212\"},{\"I\":2126,\"N\":\"北京BW007\"},{\"I\":966,\"N\":\"陆霸\"},{\"I\":2915,\"N\":\"锐铃\"},{\"I\":622,\"N\":\"勇士\"},{\"I\":4586,\"N\":\"勇士皮卡\"},{\"I\":2960,\"N\":\"越铃\"},{\"I\":965,\"N\":\"战旗\"},{\"I\":3221,\"N\":\"战旗皮卡\"},{\"I\":2959,\"N\":\"陆铃(停售)\"},{\"I\":852,\"N\":\"骑士S12(停售)\"}]}]},{\"I\":36,\"N\":\"奔驰\",\"L\":\"B\",\"List\":[{\"I\":152,\"N\":\"北京奔驰\",\"List\":[{\"I\":4764,\"N\":\"奔驰A级\"},{\"I\":588,\"N\":\"奔驰C级\"},{\"I\":197,\"N\":\"奔驰E级\"},{\"I\":3248,\"N\":\"奔驰GLA\"},{\"I\":3862,\"N\":\"奔驰GLC\"},{\"I\":4349,\"N\":\"奔驰C级新能源(停售)\"},{\"I\":2562,\"N\":\"奔驰GLK级(停售)\"}]},{\"I\":301,\"N\":\"福建奔驰\",\"List\":[{\"I\":3823,\"N\":\"奔驰V级\"},{\"I\":2564,\"N\":\"凌特\"},{\"I\":2084,\"N\":\"威霆\"},{\"I\":2034,\"N\":\"唯雅诺(停售)\"}]},{\"I\":47,\"N\":\"奔驰(进口)\",\"List\":[{\"I\":2005,\"N\":\"Sprinter\"},{\"I\":52,\"N\":\"奔驰A级(进口)\"},{\"I\":398,\"N\":\"奔驰B级\"},{\"I\":2966,\"N\":\"奔驰CLA级\"},{\"I\":365,\"N\":\"奔驰CLS级\"},{\"I\":56,\"N\":\"奔驰C级(进口)\"},{\"I\":450,\"N\":\"奔驰E级(进口)\"},{\"I\":3079,\"N\":\"奔驰GLA(进口)\"},{\"I\":3339,\"N\":\"奔驰GLC(进口)\"},{\"I\":3683,\"N\":\"奔驰GLE\"},{\"I\":4346,\"N\":\"奔驰GLE新能源\"},{\"I\":3688,\"N\":\"奔驰GLS\"},{\"I\":60,\"N\":\"奔驰G级\"},{\"I\":469,\"N\":\"奔驰R级\"},{\"I\":3278,\"N\":\"奔驰SLC级\"},{\"I\":237,\"N\":\"奔驰SL级\"},{\"I\":59,\"N\":\"奔驰S级\"},{\"I\":4344,\"N\":\"奔驰S级新能源\"},{\"I\":192,\"N\":\"威霆(进口)\"},{\"I\":235,\"N\":\"奔驰CLK级(停售)\"},{\"I\":683,\"N\":\"奔驰CL级(停售)\"},{\"I\":595,\"N\":\"奔驰GLK级(进口)(停售)\"},{\"I\":467,\"N\":\"奔驰GL级(停售)\"},{\"I\":57,\"N\":\"奔驰M级(停售)\"},{\"I\":267,\"N\":\"奔驰SLK级(停售)\"},{\"I\":300,\"N\":\"唯雅诺(进口)(停售)\"}]},{\"I\":344,\"N\":\"梅赛德斯-AMG\",\"List\":[{\"I\":3451,\"N\":\"AMG GT\"},{\"I\":2842,\"N\":\"奔驰A级AMG\"},{\"I\":2967,\"N\":\"奔驰CLA级AMG\"},{\"I\":2719,\"N\":\"奔驰CLS级AMG\"},{\"I\":2717,\"N\":\"奔驰C级AMG\"},{\"I\":2718,\"N\":\"奔驰E级AMG\"},{\"I\":3264,\"N\":\"奔驰GLA AMG\"},{\"I\":4074,\"N\":\"奔驰GLC AMG\"},{\"I\":3704,\"N\":\"奔驰GLE AMG\"},{\"I\":3901,\"N\":\"奔驰GLS AMG\"},{\"I\":2723,\"N\":\"奔驰G级AMG\"},{\"I\":2721,\"N\":\"奔驰SLK级AMG\"},{\"I\":2720,\"N\":\"奔驰SL级AMG\"},{\"I\":2197,\"N\":\"奔驰S级AMG\"},{\"I\":2833,\"N\":\"奔驰GL级AMG(停售)\"},{\"I\":2722,\"N\":\"奔驰M级AMG(停售)\"},{\"I\":914,\"N\":\"奔驰SLS级AMG(停售)\"}]},{\"I\":407,\"N\":\"梅赛德斯-迈巴赫\",\"List\":[{\"I\":3665,\"N\":\"迈巴赫S级\"}]}]},{\"I\":95,\"N\":\"奔腾\",\"L\":\"B\",\"List\":[{\"I\":10,\"N\":\"一汽奔腾\",\"List\":[{\"I\":3695,\"N\":\"奔腾B30\"},{\"I\":4584,\"N\":\"奔腾B30EV\"},{\"I\":632,\"N\":\"奔腾B50\"},{\"I\":466,\"N\":\"奔腾B70\"},{\"I\":2310,\"N\":\"奔腾B90\"},{\"I\":4800,\"N\":\"奔腾T77\"},{\"I\":4069,\"N\":\"奔腾X40\"},{\"I\":4950,\"N\":\"奔腾X40新能源\"},{\"I\":3000,\"N\":\"奔腾X80\"}]}]},{\"I\":14,\"N\":\"本田\",\"L\":\"B\",\"List\":[{\"I\":151,\"N\":\"东风本田\",\"List\":[{\"I\":4809,\"N\":\"INSPIRE\"},{\"I\":2565,\"N\":\"艾力绅\"},{\"I\":314,\"N\":\"本田CR-V\"},{\"I\":4304,\"N\":\"本田UR-V\"},{\"I\":3582,\"N\":\"本田XR-V\"},{\"I\":3859,\"N\":\"哥瑞\"},{\"I\":3104,\"N\":\"杰德\"},{\"I\":4179,\"N\":\"竞瑞\"},{\"I\":859,\"N\":\"思铂睿\"},{\"I\":135,\"N\":\"思域\"}]},{\"I\":32,\"N\":\"广汽本田\",\"List\":[{\"I\":880,\"N\":\"奥德赛\"},{\"I\":3460,\"N\":\"缤智\"},{\"I\":81,\"N\":\"飞度\"},{\"I\":3876,\"N\":\"锋范\"},{\"I\":4102,\"N\":\"冠道\"},{\"I\":3085,\"N\":\"凌派\"},{\"I\":78,\"N\":\"雅阁\"},{\"I\":694,\"N\":\"锋范经典(停售)\"},{\"I\":2168,\"N\":\"歌诗图(停售)\"},{\"I\":449,\"N\":\"思迪(停售)\"}]},{\"I\":75,\"N\":\"本田(进口)\",\"List\":[{\"I\":723,\"N\":\"INSIGHT\"},{\"I\":897,\"N\":\"本田CR-Z\"},{\"I\":900,\"N\":\"飞度(进口)\"},{\"I\":231,\"N\":\"里程\"},{\"I\":233,\"N\":\"时韵(停售)\"}]}]},{\"I\":271,\"N\":\"比速汽车\",\"L\":\"B\",\"List\":[{\"I\":456,\"N\":\"比速汽车\",\"List\":[{\"I\":4173,\"N\":\"比速M3\"},{\"I\":4164,\"N\":\"比速T3\"},{\"I\":4298,\"N\":\"比速T5\"}]}]},{\"I\":75,\"N\":\"比亚迪\",\"L\":\"B\",\"List\":[{\"I\":146,\"N\":\"比亚迪\",\"List\":[{\"I\":4073,\"N\":\"比亚迪e5\"},{\"I\":831,\"N\":\"比亚迪e6\"},{\"I\":579,\"N\":\"比亚迪F0\"},{\"I\":407,\"N\":\"比亚迪F3\"},{\"I\":3283,\"N\":\"比亚迪G5\"},{\"I\":798,\"N\":\"比亚迪M6\"},{\"I\":3059,\"N\":\"比亚迪S7\"},{\"I\":2761,\"N\":\"秦\"},{\"I\":4900,\"N\":\"秦Pro\"},{\"I\":4972,\"N\":\"秦Pro新能源\"},{\"I\":3780,\"N\":\"宋\"},{\"I\":4279,\"N\":\"宋MAX\"},{\"I\":4394,\"N\":\"宋新能源\"},{\"I\":2806,\"N\":\"速锐\"},{\"I\":4802,\"N\":\"唐\"},{\"I\":3430,\"N\":\"唐新能源\"},{\"I\":3781,\"N\":\"元\"},{\"I\":4353,\"N\":\"元新能源\"},{\"I\":940,\"N\":\"比亚迪F3R(停售)\"},{\"I\":4333,\"N\":\"比亚迪F3新能源(停售)\"},{\"I\":540,\"N\":\"比亚迪F6(停售)\"},{\"I\":927,\"N\":\"比亚迪G3(停售)\"},{\"I\":997,\"N\":\"比亚迪G3R(停售)\"},{\"I\":2091,\"N\":\"比亚迪G6(停售)\"},{\"I\":2085,\"N\":\"比亚迪L3(停售)\"},{\"I\":2088,\"N\":\"比亚迪S6(停售)\"},{\"I\":489,\"N\":\"比亚迪S8(停售)\"},{\"I\":417,\"N\":\"福莱尔(停售)\"},{\"I\":2944,\"N\":\"思锐(停售)\"}]}]},{\"I\":13,\"N\":\"标致\",\"L\":\"B\",\"List\":[{\"I\":38,\"N\":\"东风标致\",\"List\":[{\"I\":3234,\"N\":\"标致2008\"},{\"I\":2619,\"N\":\"标致3008\"},{\"I\":3068,\"N\":\"标致301\"},{\"I\":877,\"N\":\"标致308\"},{\"I\":4167,\"N\":\"标致4008\"},{\"I\":987,\"N\":\"标致408\"},{\"I\":4271,\"N\":\"标致5008\"},{\"I\":2299,\"N\":\"标致508\"},{\"I\":437,\"N\":\"标致206(停售)\"},{\"I\":688,\"N\":\"标致207(停售)\"},{\"I\":99,\"N\":\"标致307(停售)\"},{\"I\":3632,\"N\":\"标致308S(停售)\"}]},{\"I\":88,\"N\":\"标致(进口)\",\"List\":[{\"I\":724,\"N\":\"标致3008(进口)\"},{\"I\":689,\"N\":\"标致308(进口)\"},{\"I\":2047,\"N\":\"标致RCZ\"},{\"I\":184,\"N\":\"标致206(进口)(停售)\"},{\"I\":640,\"N\":\"标致207(进口)(停售)\"},{\"I\":277,\"N\":\"标致307(进口)(停售)\"},{\"I\":2472,\"N\":\"标致4008(进口)(停售)\"},{\"I\":185,\"N\":\"标致407(停售)\"},{\"I\":186,\"N\":\"标致607(停售)\"}]}]},{\"I\":38,\"N\":\"别克\",\"L\":\"B\",\"List\":[{\"I\":93,\"N\":\"上汽通用别克\",\"List\":[{\"I\":4239,\"N\":\"VELITE 5\"},{\"I\":2896,\"N\":\"昂科拉\"},{\"I\":3554,\"N\":\"昂科威\"},{\"I\":4487,\"N\":\"别克GL6\"},{\"I\":166,\"N\":\"别克GL8\"},{\"I\":164,\"N\":\"君威\"},{\"I\":834,\"N\":\"君越\"},{\"I\":875,\"N\":\"凯越\"},{\"I\":3751,\"N\":\"威朗\"},{\"I\":982,\"N\":\"英朗\"},{\"I\":4552,\"N\":\"阅朗\"},{\"I\":525,\"N\":\"林荫大道(停售)\"},{\"I\":344,\"N\":\"荣御(停售)\"}]},{\"I\":182,\"N\":\"别克(进口)\",\"List\":[{\"I\":592,\"N\":\"昂科雷\"}]}]},{\"I\":39,\"N\":\"宾利\",\"L\":\"B\",\"List\":[{\"I\":120,\"N\":\"宾利\",\"List\":[{\"I\":3014,\"N\":\"飞驰\"},{\"I\":901,\"N\":\"慕尚\"},{\"I\":305,\"N\":\"欧陆\"},{\"I\":2685,\"N\":\"添越\"},{\"I\":306,\"N\":\"雅致(停售)\"}]}]},{\"I\":37,\"N\":\"布加迪\",\"L\":\"B\",\"List\":[{\"I\":145,\"N\":\"布加迪\",\"List\":[{\"I\":390,\"N\":\"威航\"}]}]},{\"I\":76,\"N\":\"长安\",\"L\":\"C\",\"List\":[{\"I\":160,\"N\":\"长安汽车\",\"List\":[{\"I\":3217,\"N\":\"奔奔\"},{\"I\":4380,\"N\":\"奔奔EV\"},{\"I\":3924,\"N\":\"长安CS15\"},{\"I\":4445,\"N\":\"长安CS15EV\"},{\"I\":2778,\"N\":\"长安CS35\"},{\"I\":4976,\"N\":\"长安CS35 PLUS\"},{\"I\":4269,\"N\":\"长安CS55\"},{\"I\":3204,\"N\":\"长安CS75\"},{\"I\":4741,\"N\":\"长安CS75 PHEV\"},{\"I\":4885,\"N\":\"长安CS85 COUPE\"},{\"I\":3121,\"N\":\"长安CS95\"},{\"I\":4242,\"N\":\"凌轩\"},{\"I\":2785,\"N\":\"睿骋\"},{\"I\":3811,\"N\":\"睿骋CC\"},{\"I\":2429,\"N\":\"逸动\"},{\"I\":4588,\"N\":\"逸动DT\"},{\"I\":4913,\"N\":\"逸动XT\"},{\"I\":4343,\"N\":\"逸动新能源\"},{\"I\":705,\"N\":\"悦翔\"},{\"I\":2567,\"N\":\"悦翔V3\"},{\"I\":484,\"N\":\"奔奔i(停售)\"},{\"I\":2046,\"N\":\"奔奔LOVE(停售)\"},{\"I\":2045,\"N\":\"奔奔MINI(停售)\"},{\"I\":2119,\"N\":\"长安CX20(停售)\"},{\"I\":1008,\"N\":\"长安CX30(停售)\"},{\"I\":520,\"N\":\"杰勋(停售)\"},{\"I\":2788,\"N\":\"悦翔V5(停售)\"},{\"I\":3422,\"N\":\"悦翔V7(停售)\"},{\"I\":590,\"N\":\"志翔(停售)\"}]}]},{\"I\":299,\"N\":\"长安跨越\",\"L\":\"C\",\"List\":[{\"I\":373,\"N\":\"长安跨越\",\"List\":[{\"I\":4181,\"N\":\"长安V3\"},{\"I\":3311,\"N\":\"长安V5\"},{\"I\":4319,\"N\":\"跨越王\"},{\"I\":4182,\"N\":\"新豹MINI\"}]}]},{\"I\":163,\"N\":\"长安欧尚\",\"L\":\"C\",\"List\":[{\"I\":160,\"N\":\"长安汽车\",\"List\":[{\"I\":4480,\"N\":\"奔奔mini-e\"},{\"I\":3155,\"N\":\"长安星卡\"},{\"I\":4918,\"N\":\"长安星卡新能源\"},{\"I\":3526,\"N\":\"长安之星3\"},{\"I\":3685,\"N\":\"长安之星9\"},{\"I\":4917,\"N\":\"长安之星9新能源\"},{\"I\":5002,\"N\":\"尼欧Ⅱ\"},{\"I\":4499,\"N\":\"欧力威EV\"},{\"I\":2566,\"N\":\"欧诺\"},{\"I\":4919,\"N\":\"欧诺新能源\"},{\"I\":3783,\"N\":\"欧尚A600\"},{\"I\":4376,\"N\":\"欧尚A800\"},{\"I\":3893,\"N\":\"欧尚CX70\"},{\"I\":4698,\"N\":\"欧尚EV\"},{\"I\":4517,\"N\":\"欧尚X70A\"},{\"I\":4978,\"N\":\"欧尚长行\"},{\"I\":2504,\"N\":\"长安星光(停售)\"},{\"I\":2600,\"N\":\"长安之星(停售)\"},{\"I\":2605,\"N\":\"长安之星2(停售)\"},{\"I\":3514,\"N\":\"长安之星7(停售)\"},{\"I\":2604,\"N\":\"长安之星S460(停售)\"},{\"I\":2505,\"N\":\"金牛星(停售)\"},{\"I\":2954,\"N\":\"欧力威(停售)\"}]}]},{\"I\":294,\"N\":\"长安轻型车\",\"L\":\"C\",\"List\":[{\"I\":397,\"N\":\"长安轻型车\",\"List\":[{\"I\":4892,\"N\":\"睿行EM80\"},{\"I\":4372,\"N\":\"睿行M70\"},{\"I\":3227,\"N\":\"睿行M80\"},{\"I\":4011,\"N\":\"睿行M90\"},{\"I\":4132,\"N\":\"睿行S50\"},{\"I\":4292,\"N\":\"睿行S50T\"},{\"I\":4012,\"N\":\"神骐F30\"},{\"I\":5074,\"N\":\"神骐T10\"},{\"I\":2923,\"N\":\"神骐T20\"},{\"I\":2606,\"N\":\"长安星光4500(停售)\"},{\"I\":4013,\"N\":\"神骐F50(停售)\"},{\"I\":3091,\"N\":\"尊行(停售)\"}]}]},{\"I\":77,\"N\":\"长城\",\"L\":\"C\",\"List\":[{\"I\":4,\"N\":\"长城汽车\",\"List\":[{\"I\":4341,\"N\":\"长城C30新能源\"},{\"I\":2462,\"N\":\"风骏5\"},{\"I\":3101,\"N\":\"风骏6\"},{\"I\":4889,\"N\":\"风骏7\"},{\"I\":2122,\"N\":\"长城C20R(停售)\"},{\"I\":2090,\"N\":\"长城C30(停售)\"},{\"I\":2120,\"N\":\"长城C50(停售)\"},{\"I\":535,\"N\":\"长城M1(停售)\"},{\"I\":2001,\"N\":\"长城M2(停售)\"},{\"I\":2304,\"N\":\"长城M4(停售)\"},{\"I\":2200,\"N\":\"长城V80(停售)\"},{\"I\":491,\"N\":\"长城精灵(停售)\"},{\"I\":536,\"N\":\"嘉誉(停售)\"},{\"I\":2653,\"N\":\"金迪尔(停售)\"},{\"I\":493,\"N\":\"酷熊(停售)\"},{\"I\":624,\"N\":\"凌傲(停售)\"},{\"I\":6,\"N\":\"赛弗(停售)\"},{\"I\":552,\"N\":\"赛影(停售)\"},{\"I\":492,\"N\":\"炫丽(停售)\"}]}]},{\"I\":366,\"N\":\"车驰汽车\",\"L\":\"C\",\"List\":[{\"I\":541,\"N\":\"车驰汽车\",\"List\":[{\"I\":5177,\"N\":\"宾法V-Class\"}]}]},{\"I\":196,\"N\":\"成功汽车\",\"L\":\"C\",\"List\":[{\"I\":377,\"N\":\"成功汽车\",\"List\":[{\"I\":5181,\"N\":\"成功BEV6\"},{\"I\":3506,\"N\":\"成功K1\"},{\"I\":3507,\"N\":\"成功K2\"},{\"I\":3504,\"N\":\"成功V1\"},{\"I\":3505,\"N\":\"成功V2\"},{\"I\":4533,\"N\":\"成功V2E\"},{\"I\":3508,\"N\":\"成功X1\"}]}]},{\"I\":169,\"N\":\"DS\",\"L\":\"D\",\"List\":[{\"I\":357,\"N\":\"长安标致雪铁龙\",\"List\":[{\"I\":3963,\"N\":\"DS 4S\"},{\"I\":2952,\"N\":\"DS 5\"},{\"I\":3309,\"N\":\"DS 5LS\"},{\"I\":3324,\"N\":\"DS 6\"},{\"I\":4610,\"N\":\"DS 7\"}]},{\"I\":82,\"N\":\"雪铁龙(进口)\",\"List\":[{\"I\":898,\"N\":\"DS 3经典\"},{\"I\":2078,\"N\":\"DS 4\"},{\"I\":2314,\"N\":\"DS 5(进口)\"}]}]},{\"I\":341,\"N\":\"大乘汽车\",\"L\":\"D\",\"List\":[{\"I\":515,\"N\":\"大乘汽车\",\"List\":[{\"I\":4944,\"N\":\"大乘E20\"},{\"I\":5069,\"N\":\"大乘G60\"},{\"I\":4938,\"N\":\"大乘G70s\"}]}]},{\"I\":92,\"N\":\"大发\",\"L\":\"D\",\"List\":[{\"I\":166,\"N\":\"一汽吉林\",\"List\":[{\"I\":545,\"N\":\"森雅(停售)\"}]}]},{\"I\":1,\"N\":\"大众\",\"L\":\"D\",\"List\":[{\"I\":58,\"N\":\"上汽大众\",\"List\":[{\"I\":145,\"N\":\"Polo\"},{\"I\":4045,\"N\":\"辉昂\"},{\"I\":3197,\"N\":\"朗境\"},{\"I\":3103,\"N\":\"朗行\"},{\"I\":614,\"N\":\"朗逸\"},{\"I\":3457,\"N\":\"凌渡\"},{\"I\":528,\"N\":\"帕萨特\"},{\"I\":4904,\"N\":\"帕萨特新能源\"},{\"I\":2922,\"N\":\"桑塔纳\"},{\"I\":333,\"N\":\"途安\"},{\"I\":4232,\"N\":\"途昂\"},{\"I\":874,\"N\":\"途观\"},{\"I\":4274,\"N\":\"途观L\"},{\"I\":4746,\"N\":\"途观L新能源\"},{\"I\":4745,\"N\":\"途岳\"},{\"I\":826,\"N\":\"Passat领驭(停售)\"},{\"I\":144,\"N\":\"高尔(停售)\"},{\"I\":149,\"N\":\"桑塔纳经典(停售)\"},{\"I\":207,\"N\":\"桑塔纳志俊(停售)\"}]},{\"I\":8,\"N\":\"一汽-大众\",\"List\":[{\"I\":4204,\"N\":\"C-TREK蔚领\"},{\"I\":4674,\"N\":\"T-ROC探歌\"},{\"I\":633,\"N\":\"宝来\"},{\"I\":871,\"N\":\"高尔夫\"},{\"I\":3964,\"N\":\"高尔夫·嘉旅\"},{\"I\":16,\"N\":\"捷达\"},{\"I\":496,\"N\":\"迈腾\"},{\"I\":442,\"N\":\"速腾\"},{\"I\":4744,\"N\":\"探岳\"},{\"I\":905,\"N\":\"一汽-大众CC\"},{\"I\":15,\"N\":\"宝来/宝来经典(停售)\"},{\"I\":360,\"N\":\"开迪(停售)\"}]},{\"I\":50,\"N\":\"大众(进口)\",\"List\":[{\"I\":557,\"N\":\"Tiguan\"},{\"I\":368,\"N\":\"Passat\"},{\"I\":700,\"N\":\"大众CC\"},{\"I\":430,\"N\":\"大众Eos\"},{\"I\":780,\"N\":\"大众up!\"},{\"I\":372,\"N\":\"高尔夫(进口)\"},{\"I\":4355,\"N\":\"高尔夫新能源(进口)\"},{\"I\":210,\"N\":\"甲壳虫\"},{\"I\":3416,\"N\":\"凯路威\"},{\"I\":631,\"N\":\"迈特威\"},{\"I\":82,\"N\":\"途锐\"},{\"I\":3999,\"N\":\"蔚揽\"},{\"I\":5029,\"N\":\"蔚揽新能源\"},{\"I\":86,\"N\":\"夏朗\"},{\"I\":4330,\"N\":\"大众e-up!(停售)\"},{\"I\":224,\"N\":\"辉腾(停售)\"},{\"I\":539,\"N\":\"迈腾(进口)(停售)\"},{\"I\":669,\"N\":\"尚酷(停售)\"}]}]},{\"I\":41,\"N\":\"道奇\",\"L\":\"D\",\"List\":[{\"I\":51,\"N\":\"东南汽车\",\"List\":[{\"I\":574,\"N\":\"凯领(停售)\"}]},{\"I\":175,\"N\":\"道奇(进口)\",\"List\":[{\"I\":2198,\"N\":\"道奇Ram\"},{\"I\":576,\"N\":\"锋哲\"},{\"I\":602,\"N\":\"酷威\"},{\"I\":575,\"N\":\"酷搏(停售)\"}]}]},{\"I\":280,\"N\":\"电咖\",\"L\":\"D\",\"List\":[{\"I\":488,\"N\":\"电咖汽车\",\"List\":[{\"I\":4238,\"N\":\"电咖·EV10\"}]}]},{\"I\":32,\"N\":\"东风\",\"L\":\"D\",\"List\":[{\"I\":172,\"N\":\"东风汽车\",\"List\":[{\"I\":3716,\"N\":\"东风皮卡\"},{\"I\":5001,\"N\":\"富康ES500\"},{\"I\":3166,\"N\":\"虎视\"},{\"I\":4740,\"N\":\"俊风E11K\"},{\"I\":4953,\"N\":\"俊风E17\"},{\"I\":4858,\"N\":\"俊风ER30\"},{\"I\":560,\"N\":\"猛士\"},{\"I\":2839,\"N\":\"御风\"},{\"I\":4278,\"N\":\"御风EV\"},{\"I\":4486,\"N\":\"御风P16\"},{\"I\":4560,\"N\":\"御风S16\"},{\"I\":2901,\"N\":\"俊风CV03(停售)\"}]},{\"I\":173,\"N\":\"郑州日产\",\"List\":[{\"I\":3279,\"N\":\"俊风\"},{\"I\":4888,\"N\":\"锐骐6\"},{\"I\":2512,\"N\":\"锐骐多功能车\"},{\"I\":2510,\"N\":\"锐骐皮卡\"},{\"I\":951,\"N\":\"帅客\"},{\"I\":4801,\"N\":\"帅客新能源\"},{\"I\":561,\"N\":\"奥丁(停售)\"},{\"I\":562,\"N\":\"御轩(停售)\"}]}]},{\"I\":326,\"N\":\"东风·瑞泰特\",\"L\":\"D\",\"List\":[{\"I\":501,\"N\":\"西安新青年\",\"List\":[{\"I\":4915,\"N\":\"东风·瑞泰特EM10\"},{\"I\":4755,\"N\":\"东风·瑞泰特EM30\"}]}]},{\"I\":187,\"N\":\"东风风度\",\"L\":\"D\",\"List\":[{\"I\":173,\"N\":\"郑州日产\",\"List\":[{\"I\":3637,\"N\":\"东风风度MX6\"},{\"I\":3984,\"N\":\"东风风度MX5(停售)\"}]}]},{\"I\":259,\"N\":\"东风风光\",\"L\":\"D\",\"List\":[{\"I\":327,\"N\":\"东风小康\",\"List\":[{\"I\":3829,\"N\":\"东风风光330\"},{\"I\":3925,\"N\":\"东风风光370\"},{\"I\":4023,\"N\":\"东风风光580\"},{\"I\":4799,\"N\":\"东风风光580新能源\"},{\"I\":4759,\"N\":\"东风风光ix5\"},{\"I\":4468,\"N\":\"东风风光S560\"},{\"I\":3086,\"N\":\"东风风光(停售)\"},{\"I\":3830,\"N\":\"东风风光350(停售)\"},{\"I\":3828,\"N\":\"东风风光360(停售)\"}]}]},{\"I\":113,\"N\":\"东风风神\",\"L\":\"D\",\"List\":[{\"I\":210,\"N\":\"东风乘用车\",\"List\":[{\"I\":3463,\"N\":\"东风A9\"},{\"I\":3493,\"N\":\"东风风神A30\"},{\"I\":2556,\"N\":\"东风风神A60\"},{\"I\":3786,\"N\":\"东风风神AX3\"},{\"I\":4383,\"N\":\"东风风神AX4\"},{\"I\":4097,\"N\":\"东风风神AX5\"},{\"I\":3341,\"N\":\"东风风神AX7\"},{\"I\":4421,\"N\":\"东风风神E70\"},{\"I\":3461,\"N\":\"东风风神L60\"},{\"I\":3119,\"N\":\"东风风神E30(停售)\"},{\"I\":1006,\"N\":\"东风风神H30(停售)\"},{\"I\":790,\"N\":\"东风风神S30(停售)\"}]}]},{\"I\":165,\"N\":\"东风风行\",\"L\":\"D\",\"List\":[{\"I\":164,\"N\":\"东风风行\",\"List\":[{\"I\":2990,\"N\":\"风行CM7\"},{\"I\":3792,\"N\":\"风行F600\"},{\"I\":4808,\"N\":\"风行M6\"},{\"I\":4805,\"N\":\"风行M7\"},{\"I\":3789,\"N\":\"风行S500\"},{\"I\":4614,\"N\":\"风行S50EV\"},{\"I\":3970,\"N\":\"风行SX6\"},{\"I\":4767,\"N\":\"风行T5\"},{\"I\":3301,\"N\":\"景逸S50\"},{\"I\":3414,\"N\":\"景逸X3\"},{\"I\":3128,\"N\":\"景逸X5\"},{\"I\":4423,\"N\":\"景逸X6\"},{\"I\":2540,\"N\":\"菱智\"},{\"I\":4418,\"N\":\"菱智M5EV\"},{\"I\":554,\"N\":\"景逸(停售)\"},{\"I\":2742,\"N\":\"景逸SUV(停售)\"},{\"I\":3785,\"N\":\"景逸XV(停售)\"}]}]},{\"I\":142,\"N\":\"东风小康\",\"L\":\"D\",\"List\":[{\"I\":327,\"N\":\"东风小康\",\"List\":[{\"I\":3698,\"N\":\"东风小康C31\"},{\"I\":3699,\"N\":\"东风小康C32\"},{\"I\":3502,\"N\":\"东风小康C36\"},{\"I\":2865,\"N\":\"东风小康C37\"},{\"I\":5034,\"N\":\"东风小康D51\"},{\"I\":5067,\"N\":\"东风小康D52\"},{\"I\":4461,\"N\":\"东风小康EC36\"},{\"I\":2452,\"N\":\"东风小康K01\"},{\"I\":2497,\"N\":\"东风小康K02\"},{\"I\":4299,\"N\":\"东风小康K05S\"},{\"I\":3697,\"N\":\"东风小康K07S\"},{\"I\":3036,\"N\":\"东风小康C35(停售)\"},{\"I\":2498,\"N\":\"东风小康K06(停售)\"},{\"I\":2500,\"N\":\"东风小康K07(停售)\"},{\"I\":2501,\"N\":\"东风小康K07II(停售)\"},{\"I\":2499,\"N\":\"东风小康K17(停售)\"},{\"I\":2490,\"N\":\"东风小康V07S(停售)\"},{\"I\":2491,\"N\":\"东风小康V21(停售)\"},{\"I\":2494,\"N\":\"东风小康V22(停售)\"},{\"I\":2495,\"N\":\"东风小康V27(停售)\"},{\"I\":2744,\"N\":\"东风小康V29(停售)\"}]}]},{\"I\":81,\"N\":\"东南\",\"L\":\"D\",\"List\":[{\"I\":51,\"N\":\"东南汽车\",\"List\":[{\"I\":606,\"N\":\"V3菱悦\"},{\"I\":2769,\"N\":\"V5菱致\"},{\"I\":4901,\"N\":\"东南A5翼舞\"},{\"I\":4086,\"N\":\"东南DX3\"},{\"I\":4632,\"N\":\"东南DX3新能源\"},{\"I\":3634,\"N\":\"东南DX7\"},{\"I\":2776,\"N\":\"V6菱仕(停售)\"},{\"I\":2530,\"N\":\"得利卡(停售)\"},{\"I\":126,\"N\":\"菱帅(停售)\"},{\"I\":2477,\"N\":\"希旺(停售)\"}]}]},{\"I\":42,\"N\":\"法拉利\",\"L\":\"F\",\"List\":[{\"I\":78,\"N\":\"法拉利\",\"List\":[{\"I\":4314,\"N\":\"812 Superfast\"},{\"I\":676,\"N\":\"California T\"},{\"I\":2682,\"N\":\"F12berlinetta\"},{\"I\":4027,\"N\":\"GTC4Lusso\"},{\"I\":4524,\"N\":\"Portofino\"},{\"I\":3720,\"N\":\"法拉利488\"},{\"I\":3016,\"N\":\"LaFerrari(停售)\"},{\"I\":361,\"N\":\"法拉利360(停售)\"},{\"I\":889,\"N\":\"法拉利458(停售)\"},{\"I\":308,\"N\":\"法拉利575M(停售)\"},{\"I\":459,\"N\":\"法拉利599(停售)\"},{\"I\":367,\"N\":\"法拉利612(停售)\"},{\"I\":359,\"N\":\"法拉利F430(停售)\"},{\"I\":2261,\"N\":\"法拉利FF(停售)\"}]}]},{\"I\":11,\"N\":\"菲亚特\",\"L\":\"F\",\"List\":[{\"I\":427,\"N\":\"广汽菲克菲亚特\",\"List\":[{\"I\":2767,\"N\":\"菲翔\"},{\"I\":3267,\"N\":\"致悦\"}]},{\"I\":34,\"N\":\"南京菲亚特\",\"List\":[{\"I\":465,\"N\":\"派朗(停售)\"},{\"I\":89,\"N\":\"派力奥(停售)\"},{\"I\":90,\"N\":\"西耶那(停售)\"},{\"I\":91,\"N\":\"周末风(停售)\"}]},{\"I\":165,\"N\":\"菲亚特(进口)\",\"List\":[{\"I\":542,\"N\":\"博悦\"},{\"I\":601,\"N\":\"菲亚特500\"},{\"I\":2262,\"N\":\"菲跃\"},{\"I\":544,\"N\":\"领雅\"},{\"I\":543,\"N\":\"朋多\"}]}]},{\"I\":3,\"N\":\"丰田\",\"L\":\"F\",\"List\":[{\"I\":155,\"N\":\"广汽丰田\",\"List\":[{\"I\":4259,\"N\":\"YARiS L 致享\"},{\"I\":3126,\"N\":\"YARiS L 致炫\"},{\"I\":4645,\"N\":\"丰田C-HR\"},{\"I\":771,\"N\":\"汉兰达\"},{\"I\":110,\"N\":\"凯美瑞\"},{\"I\":3462,\"N\":\"雷凌\"},{\"I\":4837,\"N\":\"雷凌双擎E+\"},{\"I\":505,\"N\":\"雅力士(停售)\"},{\"I\":2237,\"N\":\"逸致(停售)\"}]},{\"I\":40,\"N\":\"一汽丰田\",\"List\":[{\"I\":4962,\"N\":\"亚洲龙\"},{\"I\":770,\"N\":\"RAV4荣放\"},{\"I\":882,\"N\":\"皇冠\"},{\"I\":526,\"N\":\"卡罗拉\"},{\"I\":4832,\"N\":\"卡罗拉双擎E+\"},{\"I\":2527,\"N\":\"柯斯达\"},{\"I\":46,\"N\":\"普拉多\"},{\"I\":111,\"N\":\"威驰\"},{\"I\":4260,\"N\":\"威驰FS\"},{\"I\":4646,\"N\":\"奕泽IZOA\"},{\"I\":109,\"N\":\"花冠(停售)\"},{\"I\":45,\"N\":\"兰德酷路泽(停售)\"},{\"I\":371,\"N\":\"普锐斯(停售)\"},{\"I\":375,\"N\":\"锐志(停售)\"},{\"I\":170,\"N\":\"特锐(停售)\"}]},{\"I\":63,\"N\":\"丰田(进口)\",\"List\":[{\"I\":513,\"N\":\"FJ 酷路泽\"},{\"I\":3851,\"N\":\"Fortuner\"},{\"I\":2607,\"N\":\"HIACE\"},{\"I\":983,\"N\":\"Sienna\"},{\"I\":2107,\"N\":\"埃尔法\"},{\"I\":2574,\"N\":\"丰田86\"},{\"I\":206,\"N\":\"丰田RAV4(进口)\"},{\"I\":549,\"N\":\"汉兰达(进口)\"},{\"I\":964,\"N\":\"红杉\"},{\"I\":963,\"N\":\"凯美瑞(海外)\"},{\"I\":550,\"N\":\"兰德酷路泽(进口)\"},{\"I\":334,\"N\":\"普拉多(进口)\"},{\"I\":107,\"N\":\"普瑞维亚\"},{\"I\":2354,\"N\":\"坦途\"},{\"I\":2244,\"N\":\"杰路驰(停售)\"},{\"I\":762,\"N\":\"威飒(停售)\"}]}]},{\"I\":141,\"N\":\"福迪\",\"L\":\"F\",\"List\":[{\"I\":328,\"N\":\"福迪汽车\",\"List\":[{\"I\":2454,\"N\":\"探索者Ⅱ\"},{\"I\":3633,\"N\":\"揽福\"},{\"I\":2895,\"N\":\"雄师F16\"},{\"I\":3754,\"N\":\"雄师F22\"},{\"I\":2455,\"N\":\"探索者Ⅲ(停售)\"},{\"I\":2453,\"N\":\"探索者6(停售)\"},{\"I\":2475,\"N\":\"小超人(停售)\"},{\"I\":2894,\"N\":\"雄狮(停售)\"}]}]},{\"I\":197,\"N\":\"福汽启腾\",\"L\":\"F\",\"List\":[{\"I\":378,\"N\":\"福汽新龙马\",\"List\":[{\"I\":3877,\"N\":\"启腾EX80\"},{\"I\":3346,\"N\":\"启腾M70\"},{\"I\":4530,\"N\":\"启腾M70EV\"},{\"I\":3992,\"N\":\"启腾V60\"}]}]},{\"I\":8,\"N\":\"福特\",\"L\":\"F\",\"List\":[{\"I\":43,\"N\":\"长安福特\",\"List\":[{\"I\":364,\"N\":\"福克斯\"},{\"I\":3347,\"N\":\"福睿斯\"},{\"I\":3693,\"N\":\"金牛座\"},{\"I\":117,\"N\":\"蒙迪欧\"},{\"I\":4386,\"N\":\"蒙迪欧新能源\"},{\"I\":3615,\"N\":\"锐界\"},{\"I\":2871,\"N\":\"翼搏\"},{\"I\":2863,\"N\":\"翼虎\"},{\"I\":659,\"N\":\"嘉年华(停售)\"},{\"I\":498,\"N\":\"麦柯斯(停售)\"},{\"I\":577,\"N\":\"蒙迪欧-致胜(停售)\"},{\"I\":3175,\"N\":\"致胜(停售)\"}]},{\"I\":447,\"N\":\"江铃福特\",\"List\":[{\"I\":3518,\"N\":\"撼路者\"},{\"I\":4899,\"N\":\"领界\"},{\"I\":4192,\"N\":\"全顺\"},{\"I\":3814,\"N\":\"途睿欧\"},{\"I\":2524,\"N\":\"新世代全顺\"},{\"I\":2523,\"N\":\"经典全顺(停售)\"}]},{\"I\":61,\"N\":\"福特(进口)\",\"List\":[{\"I\":2025,\"N\":\"征服者\"},{\"I\":97,\"N\":\"Kuga\"},{\"I\":102,\"N\":\"Mustang\"},{\"I\":2707,\"N\":\"Ranger\"},{\"I\":704,\"N\":\"福克斯(进口)\"},{\"I\":2302,\"N\":\"福特E350\"},{\"I\":2353,\"N\":\"福特F-150\"},{\"I\":378,\"N\":\"福特GT\"},{\"I\":713,\"N\":\"嘉年华(进口)\"},{\"I\":684,\"N\":\"锐界(进口)\"},{\"I\":2024,\"N\":\"探险者\"}]}]},{\"I\":96,\"N\":\"福田\",\"L\":\"F\",\"List\":[{\"I\":188,\"N\":\"福田汽车\",\"List\":[{\"I\":3440,\"N\":\"风景G7\"},{\"I\":4035,\"N\":\"风景G9\"},{\"I\":3676,\"N\":\"风景V3\"},{\"I\":3821,\"N\":\"风景V5\"},{\"I\":5156,\"N\":\"风景V5新能源\"},{\"I\":2535,\"N\":\"福田风景\"},{\"I\":2542,\"N\":\"蒙派克E\"},{\"I\":3089,\"N\":\"蒙派克S\"},{\"I\":2579,\"N\":\"萨普\"},{\"I\":3735,\"N\":\"图雅诺\"},{\"I\":4612,\"N\":\"图雅诺EV\"},{\"I\":2577,\"N\":\"拓陆者\"},{\"I\":4893,\"N\":\"祥菱M\"},{\"I\":5018,\"N\":\"祥菱S\"},{\"I\":4165,\"N\":\"祥菱V\"},{\"I\":661,\"N\":\"迷迪(停售)\"}]}]},{\"I\":282,\"N\":\"福田乘用车\",\"L\":\"F\",\"List\":[{\"I\":188,\"N\":\"福田汽车\",\"List\":[{\"I\":4760,\"N\":\"伽途GT\"},{\"I\":4227,\"N\":\"伽途im6\"},{\"I\":4228,\"N\":\"伽途im8\"},{\"I\":3991,\"N\":\"伽途ix5\"},{\"I\":3990,\"N\":\"伽途ix7\"},{\"I\":3307,\"N\":\"萨瓦纳\"}]}]},{\"I\":112,\"N\":\"GMC\",\"L\":\"G\",\"List\":[{\"I\":207,\"N\":\"GMC\",\"List\":[{\"I\":980,\"N\":\"SAVANA\"},{\"I\":2355,\"N\":\"SIERRA\"},{\"I\":955,\"N\":\"TERRAIN\"},{\"I\":947,\"N\":\"YUKON\"}]}]},{\"I\":152,\"N\":\"观致\",\"L\":\"G\",\"List\":[{\"I\":336,\"N\":\"观致汽车\",\"List\":[{\"I\":2974,\"N\":\"观致3\"},{\"I\":3662,\"N\":\"观致5\"}]}]},{\"I\":116,\"N\":\"光冈\",\"L\":\"G\",\"List\":[{\"I\":304,\"N\":\"光冈自动车\",\"List\":[{\"I\":2094,\"N\":\"女王\"},{\"I\":2093,\"N\":\"大蛇(停售)\"},{\"I\":2095,\"N\":\"嘉路(停售)\"}]}]},{\"I\":82,\"N\":\"广汽传祺\",\"L\":\"G\",\"List\":[{\"I\":186,\"N\":\"广汽乘用车\",\"List\":[{\"I\":4630,\"N\":\"传祺GA4\"},{\"I\":3349,\"N\":\"传祺GA6\"},{\"I\":3782,\"N\":\"传祺GA8\"},{\"I\":4662,\"N\":\"传祺GM6\"},{\"I\":4174,\"N\":\"传祺GM8\"},{\"I\":3495,\"N\":\"传祺GS3\"},{\"I\":3691,\"N\":\"传祺GS4\"},{\"I\":2560,\"N\":\"传祺GS5\"},{\"I\":4230,\"N\":\"传祺GS7\"},{\"I\":4094,\"N\":\"传祺GS8\"},{\"I\":3069,\"N\":\"传祺GA3(停售)\"},{\"I\":3524,\"N\":\"传祺GA3S视界(停售)\"},{\"I\":2141,\"N\":\"传祺GA5(停售)\"},{\"I\":4340,\"N\":\"传祺GA5新能源(停售)\"},{\"I\":3574,\"N\":\"传祺GS5 Super(停售)\"}]}]},{\"I\":108,\"N\":\"广汽吉奥\",\"L\":\"G\",\"List\":[{\"I\":203,\"N\":\"广汽吉奥\",\"List\":[{\"I\":967,\"N\":\"帅驰\"},{\"I\":968,\"N\":\"帅威\"},{\"I\":2599,\"N\":\"财运100\"},{\"I\":2571,\"N\":\"财运300\"},{\"I\":2568,\"N\":\"财运500\"},{\"I\":3480,\"N\":\"广汽吉奥GP150\"},{\"I\":2488,\"N\":\"星旺\"},{\"I\":2885,\"N\":\"星旺CL\"},{\"I\":3159,\"N\":\"星旺L\"},{\"I\":3139,\"N\":\"星旺M1\"},{\"I\":3140,\"N\":\"星旺M2\"},{\"I\":3272,\"N\":\"E美(停售)\"},{\"I\":2114,\"N\":\"奥轩G3(停售)\"},{\"I\":2306,\"N\":\"奥轩G5(停售)\"},{\"I\":2774,\"N\":\"奥轩GX5(停售)\"},{\"I\":3477,\"N\":\"广汽吉奥GX6(停售)\"},{\"I\":969,\"N\":\"吉奥凯旋(停售)\"},{\"I\":865,\"N\":\"凯睿(停售)\"},{\"I\":1015,\"N\":\"帅豹(停售)\"},{\"I\":864,\"N\":\"帅舰(停售)\"},{\"I\":3134,\"N\":\"星朗(停售)\"}]}]},{\"I\":329,\"N\":\"广汽集团\",\"L\":\"G\",\"List\":[{\"I\":32,\"N\":\"广汽本田\",\"List\":[{\"I\":4985,\"N\":\"世锐PHEV\"}]},{\"I\":155,\"N\":\"广汽丰田\",\"List\":[{\"I\":4793,\"N\":\"广汽ix4\"}]},{\"I\":355,\"N\":\"广汽三菱\",\"List\":[{\"I\":4932,\"N\":\"祺智EV\"},{\"I\":4431,\"N\":\"祺智PHEV\"}]}]},{\"I\":313,\"N\":\"广汽新能源\",\"L\":\"G\",\"List\":[{\"I\":492,\"N\":\"广汽新能源\",\"List\":[{\"I\":5026,\"N\":\"Aion S\"},{\"I\":4255,\"N\":\"传祺GA3S PHEV\"},{\"I\":4291,\"N\":\"传祺GE3\"},{\"I\":4256,\"N\":\"传祺GS4新能源\"}]}]},{\"I\":304,\"N\":\"国金汽车\",\"L\":\"G\",\"List\":[{\"I\":490,\"N\":\"陕西通家\",\"List\":[{\"I\":4556,\"N\":\"国金GM3\"}]}]},{\"I\":24,\"N\":\"哈飞\",\"L\":\"H\",\"List\":[{\"I\":30,\"N\":\"哈飞汽车\",\"List\":[{\"I\":2487,\"N\":\"哈飞小霸王(停售)\"},{\"I\":2485,\"N\":\"骏意(停售)\"},{\"I\":67,\"N\":\"路宝(停售)\"},{\"I\":2536,\"N\":\"路尊大霸王(停售)\"},{\"I\":2486,\"N\":\"民意(停售)\"},{\"I\":3840,\"N\":\"民意微卡(停售)\"},{\"I\":392,\"N\":\"赛豹III(停售)\"},{\"I\":481,\"N\":\"赛豹V(停售)\"},{\"I\":68,\"N\":\"赛马(停售)\"},{\"I\":3038,\"N\":\"中意V5(停售)\"}]}]},{\"I\":181,\"N\":\"哈弗\",\"L\":\"H\",\"List\":[{\"I\":4,\"N\":\"长城汽车\",\"List\":[{\"I\":4792,\"N\":\"哈弗F5\"},{\"I\":4898,\"N\":\"哈弗F7\"},{\"I\":3454,\"N\":\"哈弗H1\"},{\"I\":2615,\"N\":\"哈弗H2\"},{\"I\":4168,\"N\":\"哈弗H2s\"},{\"I\":4608,\"N\":\"哈弗H4\"},{\"I\":2027,\"N\":\"哈弗H5\"},{\"I\":2123,\"N\":\"哈弗H6\"},{\"I\":3481,\"N\":\"哈弗H6 Coupe\"},{\"I\":3074,\"N\":\"哈弗H7\"},{\"I\":2124,\"N\":\"哈弗H8\"},{\"I\":3298,\"N\":\"哈弗H9\"},{\"I\":4485,\"N\":\"哈弗M6\"},{\"I\":395,\"N\":\"哈弗H3(停售)\"}]}]},{\"I\":150,\"N\":\"海格\",\"L\":\"H\",\"List\":[{\"I\":334,\"N\":\"苏州金龙\",\"List\":[{\"I\":4131,\"N\":\"海格H4E\"},{\"I\":2572,\"N\":\"海格H5C\"},{\"I\":3243,\"N\":\"海格H5V\"},{\"I\":3636,\"N\":\"海格H6C\"},{\"I\":3638,\"N\":\"海格H6V\"},{\"I\":3235,\"N\":\"海格H7V\"},{\"I\":3149,\"N\":\"龙威\"},{\"I\":2673,\"N\":\"御骏\"}]}]},{\"I\":86,\"N\":\"海马\",\"L\":\"H\",\"List\":[{\"I\":341,\"N\":\"海马汽车\",\"List\":[{\"I\":3163,\"N\":\"福仕达福卡\"},{\"I\":3162,\"N\":\"福仕达腾达\"},{\"I\":4156,\"N\":\"海马E3\"},{\"I\":2941,\"N\":\"海马M3\"},{\"I\":3006,\"N\":\"海马M6\"},{\"I\":3214,\"N\":\"海马S5\"},{\"I\":4169,\"N\":\"海马S5青春版\"},{\"I\":4459,\"N\":\"海马爱尚EV\"},{\"I\":3160,\"N\":\"福仕达鸿达(停售)\"},{\"I\":2481,\"N\":\"福仕达荣达(停售)\"},{\"I\":2318,\"N\":\"海马爱尚(停售)\"},{\"I\":855,\"N\":\"海马王子(停售)\"}]},{\"I\":26,\"N\":\"一汽海马\",\"List\":[{\"I\":3994,\"N\":\"海马V70\"},{\"I\":470,\"N\":\"福美来\"},{\"I\":4774,\"N\":\"福美来F5\"},{\"I\":4525,\"N\":\"福美来F7\"},{\"I\":4205,\"N\":\"福美来MPV\"},{\"I\":2766,\"N\":\"海马M8\"},{\"I\":3075,\"N\":\"海马S7\"},{\"I\":4339,\"N\":\"普力马EV\"},{\"I\":47,\"N\":\"海福星(停售)\"},{\"I\":527,\"N\":\"海马3(停售)\"},{\"I\":823,\"N\":\"海马骑士(停售)\"},{\"I\":696,\"N\":\"欢动(停售)\"},{\"I\":844,\"N\":\"普力马(停售)\"},{\"I\":824,\"N\":\"丘比特(停售)\"}]}]},{\"I\":267,\"N\":\"汉腾汽车\",\"L\":\"H\",\"List\":[{\"I\":453,\"N\":\"汉腾汽车\",\"List\":[{\"I\":4416,\"N\":\"幸福e+\"},{\"I\":4226,\"N\":\"汉腾X5\"},{\"I\":4419,\"N\":\"汉腾X5新能源\"},{\"I\":4130,\"N\":\"汉腾X7\"},{\"I\":4613,\"N\":\"汉腾X7新能源\"}]}]},{\"I\":43,\"N\":\"悍马\",\"L\":\"H\",\"List\":[{\"I\":42,\"N\":\"悍马\",\"List\":[{\"I\":38,\"N\":\"悍马H2(停售)\"},{\"I\":379,\"N\":\"悍马H3(停售)\"}]}]},{\"I\":164,\"N\":\"恒天\",\"L\":\"H\",\"List\":[{\"I\":349,\"N\":\"恒天汽车\",\"List\":[{\"I\":5007,\"N\":\"恒好EV1\"},{\"I\":5006,\"N\":\"恒好EV7\"},{\"I\":2754,\"N\":\"途腾T1\"},{\"I\":2755,\"N\":\"途腾T2\"},{\"I\":2973,\"N\":\"途腾T3\"}]}]},{\"I\":91,\"N\":\"红旗\",\"L\":\"H\",\"List\":[{\"I\":190,\"N\":\"一汽红旗\",\"List\":[{\"I\":3108,\"N\":\"红旗L5\"},{\"I\":4410,\"N\":\"红旗H5\"},{\"I\":2771,\"N\":\"红旗H7\"},{\"I\":428,\"N\":\"红旗盛世(停售)\"},{\"I\":556,\"N\":\"新明仕(停售)\"}]}]},{\"I\":336,\"N\":\"红星汽车\",\"L\":\"H\",\"List\":[{\"I\":509,\"N\":\"红星汽车\",\"List\":[{\"I\":4877,\"N\":\"闪闪X2\"}]}]},{\"I\":245,\"N\":\"华凯\",\"L\":\"H\",\"List\":[{\"I\":431,\"N\":\"明君汽车\",\"List\":[{\"I\":3911,\"N\":\"华凯皮卡\"}]}]},{\"I\":237,\"N\":\"华利\",\"L\":\"H\",\"List\":[{\"I\":422,\"N\":\"天津汽车\",\"List\":[{\"I\":3844,\"N\":\"天津大发TJ110(停售)\"}]}]},{\"I\":85,\"N\":\"华普\",\"L\":\"H\",\"List\":[{\"I\":90,\"N\":\"华普汽车\",\"List\":[{\"I\":570,\"N\":\"海锋(停售)\"},{\"I\":461,\"N\":\"海尚(停售)\"},{\"I\":507,\"N\":\"海炫(停售)\"},{\"I\":194,\"N\":\"海迅(停售)\"},{\"I\":460,\"N\":\"海域(停售)\"},{\"I\":856,\"N\":\"海悦(停售)\"},{\"I\":862,\"N\":\"华普海景(停售)\"}]}]},{\"I\":184,\"N\":\"华骐\",\"L\":\"H\",\"List\":[{\"I\":57,\"N\":\"东风悦达起亚\",\"List\":[{\"I\":4170,\"N\":\"华骐300E\"}]}]},{\"I\":220,\"N\":\"华颂\",\"L\":\"H\",\"List\":[{\"I\":400,\"N\":\"华晨华颂\",\"List\":[{\"I\":3607,\"N\":\"华颂7\"}]}]},{\"I\":87,\"N\":\"华泰\",\"L\":\"H\",\"List\":[{\"I\":117,\"N\":\"华泰汽车\",\"List\":[{\"I\":2144,\"N\":\"宝利格\"},{\"I\":3803,\"N\":\"路盛E80\"},{\"I\":3896,\"N\":\"圣达菲\"},{\"I\":4518,\"N\":\"圣达菲5\"},{\"I\":4483,\"N\":\"圣达菲7\"},{\"I\":2108,\"N\":\"华泰B11(停售)\"},{\"I\":2133,\"N\":\"路盛E70(停售)\"},{\"I\":477,\"N\":\"圣达菲经典(停售)\"},{\"I\":290,\"N\":\"特拉卡(停售)\"}]}]},{\"I\":260,\"N\":\"华泰新能源\",\"L\":\"H\",\"List\":[{\"I\":445,\"N\":\"华泰新能源\",\"List\":[{\"I\":4318,\"N\":\"华泰EV160B\"},{\"I\":4495,\"N\":\"华泰EV160R\"},{\"I\":4065,\"N\":\"华泰iEV230\"},{\"I\":4066,\"N\":\"华泰XEV260\"},{\"I\":4836,\"N\":\"路盛S1\"}]}]},{\"I\":97,\"N\":\"黄海\",\"L\":\"H\",\"List\":[{\"I\":191,\"N\":\"曙光汽车\",\"List\":[{\"I\":2517,\"N\":\"傲骏\"},{\"I\":2515,\"N\":\"大柴神\"},{\"I\":3455,\"N\":\"黄海N1\"},{\"I\":3846,\"N\":\"黄海N2\"},{\"I\":4436,\"N\":\"黄海N3\"},{\"I\":2160,\"N\":\"旗胜V3\"},{\"I\":4162,\"N\":\"瑞途\"},{\"I\":2516,\"N\":\"小柴神\"},{\"I\":2212,\"N\":\"翱龙CUV(停售)\"},{\"I\":673,\"N\":\"旗胜F1(停售)\"},{\"I\":2211,\"N\":\"挑战者SUV(停售)\"}]}]},{\"I\":188,\"N\":\"Icona\",\"L\":\"I\",\"List\":[{\"I\":366,\"N\":\"Icona\",\"List\":[{\"I\":3122,\"N\":\"Vulcano\"}]}]},{\"I\":46,\"N\":\"Jeep\",\"L\":\"J\",\"List\":[{\"I\":12,\"N\":\"北京吉普\",\"List\":[{\"I\":291,\"N\":\"北京JEEP(停售)\"},{\"I\":23,\"N\":\"大切诺基(停售)\"}]},{\"I\":319,\"N\":\"广汽菲克Jeep\",\"List\":[{\"I\":4673,\"N\":\"大指挥官\"},{\"I\":4891,\"N\":\"指挥官\"},{\"I\":3845,\"N\":\"指南者\"},{\"I\":3872,\"N\":\"自由光\"},{\"I\":4072,\"N\":\"自由侠\"}]},{\"I\":71,\"N\":\"Jeep(进口)\",\"List\":[{\"I\":521,\"N\":\"大切诺基(进口)\"},{\"I\":121,\"N\":\"牧马人\"},{\"I\":504,\"N\":\"指南者(进口)\"},{\"I\":3062,\"N\":\"自由光(进口)\"},{\"I\":263,\"N\":\"自由人\"},{\"I\":503,\"N\":\"指挥官经典(停售)\"},{\"I\":777,\"N\":\"自由客(停售)\"}]},{\"I\":363,\"N\":\"SRT\",\"List\":[{\"I\":3048,\"N\":\"大切诺基 SRT\"}]}]},{\"I\":25,\"N\":\"吉利汽车\",\"L\":\"J\",\"List\":[{\"I\":54,\"N\":\"吉利汽车\",\"List\":[{\"I\":4702,\"N\":\"缤瑞\"},{\"I\":4701,\"N\":\"缤越\"},{\"I\":3589,\"N\":\"博瑞\"},{\"I\":4762,\"N\":\"博瑞GE\"},{\"I\":4756,\"N\":\"博瑞GE新能源\"},{\"I\":3788,\"N\":\"博越\"},{\"I\":3556,\"N\":\"帝豪\"},{\"I\":4139,\"N\":\"帝豪GL\"},{\"I\":3465,\"N\":\"帝豪GS\"},{\"I\":4852,\"N\":\"帝豪GSe\"},{\"I\":4342,\"N\":\"帝豪新能源\"},{\"I\":4396,\"N\":\"嘉际\"},{\"I\":5055,\"N\":\"嘉际新能源\"},{\"I\":447,\"N\":\"金刚\"},{\"I\":474,\"N\":\"远景\"},{\"I\":4491,\"N\":\"远景S1\"},{\"I\":4133,\"N\":\"远景SUV\"},{\"I\":4293,\"N\":\"远景X1\"},{\"I\":4481,\"N\":\"远景X3\"},{\"I\":2051,\"N\":\"海景(停售)\"},{\"I\":133,\"N\":\"豪情(停售)\"},{\"I\":3467,\"N\":\"豪情SUV(停售)\"},{\"I\":801,\"N\":\"吉利EC8(停售)\"},{\"I\":2155,\"N\":\"吉利GC7(停售)\"},{\"I\":2192,\"N\":\"吉利GX2(停售)\"},{\"I\":989,\"N\":\"吉利GX7(停售)\"},{\"I\":2840,\"N\":\"吉利SC3(停售)\"},{\"I\":2111,\"N\":\"吉利SC5-RV(停售)\"},{\"I\":2964,\"N\":\"吉利SX7(停售)\"},{\"I\":2156,\"N\":\"金刚财富(停售)\"},{\"I\":609,\"N\":\"金鹰(停售)\"},{\"I\":799,\"N\":\"经典帝豪(停售)\"},{\"I\":138,\"N\":\"美人豹(停售)\"},{\"I\":608,\"N\":\"熊猫(停售)\"},{\"I\":132,\"N\":\"英伦C5(停售)\"},{\"I\":841,\"N\":\"英伦TX4(停售)\"},{\"I\":421,\"N\":\"优利欧(停售)\"},{\"I\":611,\"N\":\"中国龙(停售)\"},{\"I\":409,\"N\":\"自由舰(停售)\"}]}]},{\"I\":84,\"N\":\"江淮\",\"L\":\"J\",\"List\":[{\"I\":170,\"N\":\"江淮汽车\",\"List\":[{\"I\":3395,\"N\":\"江淮iEV\"},{\"I\":4088,\"N\":\"江淮iEV6E\"},{\"I\":3961,\"N\":\"江淮iEV6S\"},{\"I\":4444,\"N\":\"江淮iEV7S\"},{\"I\":4628,\"N\":\"江淮iEVA50\"},{\"I\":4710,\"N\":\"江淮V7\"},{\"I\":3490,\"N\":\"凌铃\"},{\"I\":2541,\"N\":\"瑞风\"},{\"I\":3363,\"N\":\"瑞风A60\"},{\"I\":3351,\"N\":\"瑞风M3\"},{\"I\":4090,\"N\":\"瑞风M4\"},{\"I\":2543,\"N\":\"瑞风M5\"},{\"I\":3061,\"N\":\"瑞风M6\"},{\"I\":4619,\"N\":\"瑞风R3\"},{\"I\":3545,\"N\":\"瑞风S2\"},{\"I\":3080,\"N\":\"瑞风S3\"},{\"I\":4934,\"N\":\"瑞风S4\"},{\"I\":2752,\"N\":\"瑞风S5\"},{\"I\":4234,\"N\":\"瑞风S7\"},{\"I\":3546,\"N\":\"帅铃T6\"},{\"I\":4847,\"N\":\"帅铃T8\"},{\"I\":2569,\"N\":\"星锐\"},{\"I\":567,\"N\":\"宾悦(停售)\"},{\"I\":616,\"N\":\"和悦(停售)\"},{\"I\":3407,\"N\":\"和悦A13(停售)\"},{\"I\":3408,\"N\":\"和悦A13RS(停售)\"},{\"I\":2956,\"N\":\"和悦A30(停售)\"},{\"I\":3443,\"N\":\"江淮K3(停售)\"},{\"I\":3444,\"N\":\"江淮K5(停售)\"},{\"I\":816,\"N\":\"瑞风M2(停售)\"},{\"I\":4087,\"N\":\"瑞风S2mini(停售)\"},{\"I\":2581,\"N\":\"瑞铃(停售)\"},{\"I\":572,\"N\":\"瑞鹰(停售)\"},{\"I\":660,\"N\":\"同悦(停售)\"},{\"I\":617,\"N\":\"同悦RS(停售)\"},{\"I\":828,\"N\":\"悦悦(停售)\"},{\"I\":3456,\"N\":\"征途(停售)\"}]}]},{\"I\":119,\"N\":\"江铃\",\"L\":\"J\",\"List\":[{\"I\":307,\"N\":\"江铃汽车\",\"List\":[{\"I\":2674,\"N\":\"宝威\"},{\"I\":4995,\"N\":\"域虎新能源\"},{\"I\":2514,\"N\":\"宝典\"},{\"I\":4209,\"N\":\"特顺\"},{\"I\":4930,\"N\":\"域虎3\"},{\"I\":4931,\"N\":\"域虎5\"},{\"I\":2860,\"N\":\"域虎7\"}]}]},{\"I\":210,\"N\":\"江铃集团轻汽\",\"L\":\"J\",\"List\":[{\"I\":386,\"N\":\"江铃集团轻汽\",\"List\":[{\"I\":4493,\"N\":\"骐铃T100\"},{\"I\":3466,\"N\":\"骐铃T5\"},{\"I\":3639,\"N\":\"骐铃T7\"},{\"I\":3981,\"N\":\"骐铃T3(停售)\"}]}]},{\"I\":270,\"N\":\"江铃集团新能源\",\"L\":\"J\",\"List\":[{\"I\":455,\"N\":\"江铃集团新能源\",\"List\":[{\"I\":4949,\"N\":\"易至EV3\"},{\"I\":3681,\"N\":\"江铃E100B\"},{\"I\":4375,\"N\":\"江铃E160\"},{\"I\":4149,\"N\":\"江铃E200L\"},{\"I\":4388,\"N\":\"江铃E200N\"},{\"I\":4765,\"N\":\"江铃E400\"}]}]},{\"I\":44,\"N\":\"捷豹\",\"L\":\"J\",\"List\":[{\"I\":376,\"N\":\"奇瑞捷豹路虎\",\"List\":[{\"I\":4663,\"N\":\"捷豹E-PACE\"},{\"I\":4462,\"N\":\"捷豹XEL\"},{\"I\":4083,\"N\":\"捷豹XFL\"}]},{\"I\":85,\"N\":\"捷豹\",\"List\":[{\"I\":3209,\"N\":\"捷豹F-PACE\"},{\"I\":2903,\"N\":\"捷豹F-TYPE\"},{\"I\":4251,\"N\":\"捷豹I-PACE\"},{\"I\":3312,\"N\":\"捷豹XE\"},{\"I\":589,\"N\":\"捷豹XF\"},{\"I\":178,\"N\":\"捷豹XJ\"},{\"I\":456,\"N\":\"捷豹XK\"},{\"I\":258,\"N\":\"捷豹S-Type(停售)\"},{\"I\":328,\"N\":\"捷豹X-Type(停售)\"}]}]},{\"I\":319,\"N\":\"捷途\",\"L\":\"J\",\"List\":[{\"I\":33,\"N\":\"奇瑞汽车\",\"List\":[{\"I\":4683,\"N\":\"捷途X70\"},{\"I\":5052,\"N\":\"捷途X70S\"},{\"I\":4797,\"N\":\"捷途X90\"}]}]},{\"I\":83,\"N\":\"金杯\",\"L\":\"J\",\"List\":[{\"I\":169,\"N\":\"华晨雷诺\",\"List\":[{\"I\":4992,\"N\":\"观境\"},{\"I\":2537,\"N\":\"阁瑞斯\"},{\"I\":4294,\"N\":\"金杯F50\"},{\"I\":2545,\"N\":\"金杯大海狮\"},{\"I\":2810,\"N\":\"金杯海狮\"},{\"I\":4237,\"N\":\"金杯快运\"},{\"I\":2402,\"N\":\"金杯S50(停售)\"}]},{\"I\":409,\"N\":\"华晨鑫源\",\"List\":[{\"I\":4964,\"N\":\"海狮S\"},{\"I\":3955,\"N\":\"海狮X30L\"},{\"I\":2712,\"N\":\"海星T20\"},{\"I\":2837,\"N\":\"海星T22\"},{\"I\":3763,\"N\":\"华晨金杯750\"},{\"I\":3721,\"N\":\"金杯T30\"},{\"I\":3722,\"N\":\"金杯T32\"},{\"I\":4311,\"N\":\"金杯T50\"},{\"I\":4312,\"N\":\"金杯T52\"},{\"I\":3136,\"N\":\"小海狮X30\"},{\"I\":2601,\"N\":\"海星A7(停售)\"},{\"I\":2711,\"N\":\"海星A9(停售)\"}]},{\"I\":417,\"N\":\"绵阳金杯\",\"List\":[{\"I\":2659,\"N\":\"大力神\"},{\"I\":4076,\"N\":\"大力神K5\"},{\"I\":3515,\"N\":\"金杯S70\"},{\"I\":2660,\"N\":\"金典\"},{\"I\":3853,\"N\":\"西部牛仔\"},{\"I\":3868,\"N\":\"小金牛\"},{\"I\":3898,\"N\":\"智尚S35\"},{\"I\":2665,\"N\":\"雷龙(停售)\"},{\"I\":2325,\"N\":\"智尚S30(停售)\"}]}]},{\"I\":145,\"N\":\"金龙\",\"L\":\"J\",\"List\":[{\"I\":330,\"N\":\"厦门金龙\",\"List\":[{\"I\":2986,\"N\":\"金威\"},{\"I\":2985,\"N\":\"凯歌\"},{\"I\":4850,\"N\":\"凯锐浩克\"},{\"I\":3549,\"N\":\"凯特\"}]}]},{\"I\":175,\"N\":\"金旅\",\"L\":\"J\",\"List\":[{\"I\":359,\"N\":\"厦门金旅\",\"List\":[{\"I\":5126,\"N\":\"海狮Z系列\"},{\"I\":3886,\"N\":\"金旅大海狮\"},{\"I\":3885,\"N\":\"金旅大海狮新能源\"},{\"I\":2976,\"N\":\"金旅海狮\"},{\"I\":4601,\"N\":\"金旅海狮新能源\"},{\"I\":5079,\"N\":\"新时代海狮\"}]}]},{\"I\":151,\"N\":\"九龙\",\"L\":\"J\",\"List\":[{\"I\":335,\"N\":\"九龙汽车\",\"List\":[{\"I\":4777,\"N\":\"艾菲新能源\"},{\"I\":3320,\"N\":\"艾菲\"},{\"I\":3628,\"N\":\"九龙A4\"},{\"I\":2573,\"N\":\"九龙A5\"},{\"I\":2576,\"N\":\"九龙A6\"},{\"I\":4860,\"N\":\"九龙C6\"},{\"I\":3194,\"N\":\"考斯特\"},{\"I\":2582,\"N\":\"大MPV(停售)\"}]}]},{\"I\":297,\"N\":\"君马汽车\",\"L\":\"J\",\"List\":[{\"I\":480,\"N\":\"君马汽车\",\"List\":[{\"I\":4555,\"N\":\"君马MEET 3(美图3)\"},{\"I\":4519,\"N\":\"君马S70\"},{\"I\":4696,\"N\":\"君马SEEK 5(赛克5)\"}]}]},{\"I\":356,\"N\":\"钧天\",\"L\":\"J\",\"List\":[{\"I\":532,\"N\":\"钧天机械\",\"List\":[{\"I\":5099,\"N\":\"勇猛者\"}]}]},{\"I\":109,\"N\":\"KTM\",\"L\":\"K\",\"List\":[{\"I\":204,\"N\":\"KTM\",\"List\":[{\"I\":911,\"N\":\"X-BOW(停售)\"}]}]},{\"I\":156,\"N\":\"卡尔森\",\"L\":\"K\",\"List\":[{\"I\":339,\"N\":\"卡尔森\",\"List\":[{\"I\":4912,\"N\":\"卡尔森 CCA22\"},{\"I\":2611,\"N\":\"卡尔森 S级\"},{\"I\":2610,\"N\":\"卡尔森 GL级(停售)\"}]}]},{\"I\":224,\"N\":\"卡升\",\"L\":\"K\",\"List\":[{\"I\":406,\"N\":\"浙江卡尔森\",\"List\":[{\"I\":3656,\"N\":\"卡升C10\"},{\"I\":4447,\"N\":\"卡升T6\"},{\"I\":4448,\"N\":\"卡升V-Class\"},{\"I\":3655,\"N\":\"卡升威霆\"}]}]},{\"I\":199,\"N\":\"卡威\",\"L\":\"K\",\"List\":[{\"I\":380,\"N\":\"卡威汽车\",\"List\":[{\"I\":3360,\"N\":\"卡威K1\"},{\"I\":4557,\"N\":\"卡威K150GT\"},{\"I\":4482,\"N\":\"卡威W1新能源\"},{\"I\":4563,\"N\":\"路易斯\"},{\"I\":4172,\"N\":\"卡威K150(停售)\"},{\"I\":3511,\"N\":\"卡威W1(停售)\"}]}]},{\"I\":101,\"N\":\"开瑞\",\"L\":\"K\",\"List\":[{\"I\":208,\"N\":\"开瑞汽车\",\"List\":[{\"I\":3384,\"N\":\"开瑞K50\"},{\"I\":4478,\"N\":\"开瑞K50EV\"},{\"I\":4039,\"N\":\"开瑞K60\"},{\"I\":4897,\"N\":\"开瑞K60EV\"},{\"I\":2496,\"N\":\"优劲\"},{\"I\":4854,\"N\":\"优劲EV\"},{\"I\":2476,\"N\":\"优优\"},{\"I\":3017,\"N\":\"优优2代\"},{\"I\":4477,\"N\":\"优优EV\"},{\"I\":3854,\"N\":\"杰虎(停售)\"},{\"I\":2489,\"N\":\"优派(停售)\"},{\"I\":2492,\"N\":\"优胜(停售)\"},{\"I\":2493,\"N\":\"优胜2代(停售)\"},{\"I\":2484,\"N\":\"优雅(停售)\"},{\"I\":3156,\"N\":\"优雅2代(停售)\"},{\"I\":517,\"N\":\"优翼(停售)\"}]}]},{\"I\":47,\"N\":\"凯迪拉克\",\"L\":\"K\",\"List\":[{\"I\":122,\"N\":\"上汽通用凯迪拉克\",\"List\":[{\"I\":3207,\"N\":\"凯迪拉克ATS-L\"},{\"I\":3802,\"N\":\"凯迪拉克CT6\"},{\"I\":4334,\"N\":\"凯迪拉克CT6 PLUG-IN\"},{\"I\":4856,\"N\":\"凯迪拉克XT4\"},{\"I\":3989,\"N\":\"凯迪拉克XT5\"},{\"I\":2949,\"N\":\"凯迪拉克XTS\"},{\"I\":488,\"N\":\"SLS赛威(停售)\"},{\"I\":970,\"N\":\"凯迪拉克CTS(停售)\"}]},{\"I\":44,\"N\":\"凯迪拉克(进口)\",\"List\":[{\"I\":2629,\"N\":\"凯迪拉克ATS(进口)\"},{\"I\":311,\"N\":\"凯迪拉克CTS(进口)\"},{\"I\":462,\"N\":\"凯雷德ESCALADE\"},{\"I\":49,\"N\":\"凯迪拉克SRX(停售)\"},{\"I\":426,\"N\":\"凯迪拉克XLR(停售)\"}]}]},{\"I\":214,\"N\":\"凯翼\",\"L\":\"K\",\"List\":[{\"I\":398,\"N\":\"凯翼汽车\",\"List\":[{\"I\":4474,\"N\":\"凯翼E3\"},{\"I\":3971,\"N\":\"凯翼V3\"},{\"I\":3983,\"N\":\"凯翼X3\"},{\"I\":4095,\"N\":\"凯翼X5\"},{\"I\":3586,\"N\":\"凯翼C3(停售)\"},{\"I\":3581,\"N\":\"凯翼C3R(停售)\"}]}]},{\"I\":100,\"N\":\"科尼赛克\",\"L\":\"K\",\"List\":[{\"I\":196,\"N\":\"科尼赛克\",\"List\":[{\"I\":2068,\"N\":\"Agera\"},{\"I\":731,\"N\":\"科尼赛克CCX(停售)\"},{\"I\":732,\"N\":\"科尼赛克CCXR(停售)\"}]}]},{\"I\":9,\"N\":\"克莱斯勒\",\"L\":\"K\",\"List\":[{\"I\":180,\"N\":\"北京克莱斯勒\",\"List\":[{\"I\":566,\"N\":\"铂锐(停售)\"},{\"I\":487,\"N\":\"克莱斯勒300C(停售)\"}]},{\"I\":51,\"N\":\"东南汽车\",\"List\":[{\"I\":227,\"N\":\"大捷龙(停售)\"}]},{\"I\":69,\"N\":\"克莱斯勒(进口)\",\"List\":[{\"I\":2207,\"N\":\"大捷龙(进口)\"},{\"I\":4604,\"N\":\"大捷龙PHEV(进口)\"},{\"I\":342,\"N\":\"克莱斯勒300C(进口)\"},{\"I\":380,\"N\":\"PT 漫步者(停售)\"},{\"I\":222,\"N\":\"交叉火力(停售)\"}]}]},{\"I\":335,\"N\":\"LITE\",\"L\":\"L\",\"List\":[{\"I\":390,\"N\":\"北汽新能源\",\"List\":[{\"I\":4522,\"N\":\"LITE\"}]}]},{\"I\":241,\"N\":\"LOCAL MOTORS\",\"L\":\"L\",\"List\":[{\"I\":426,\"N\":\"LOCAL MOTORS\",\"List\":[{\"I\":3864,\"N\":\"RALLY FIGHTER(停售)\"}]}]},{\"I\":118,\"N\":\"Lorinser\",\"L\":\"L\",\"List\":[{\"I\":306,\"N\":\"Lorinser\",\"List\":[{\"I\":2103,\"N\":\"Lorinser M级(停售)\"},{\"I\":2102,\"N\":\"Lorinser S级(停售)\"}]},{\"I\":472,\"N\":\"罗伦士\",\"List\":[{\"I\":4600,\"N\":\"Lorinser GS500\"},{\"I\":4916,\"N\":\"Lorinser MAYBACH S650\"},{\"I\":4865,\"N\":\"Lorinser MS500L\"},{\"I\":4464,\"N\":\"Lorinser VS系列\"},{\"I\":4379,\"N\":\"Metris MS500\"},{\"I\":4378,\"N\":\"Sprinter LS500\"}]}]},{\"I\":48,\"N\":\"兰博基尼\",\"L\":\"L\",\"List\":[{\"I\":83,\"N\":\"兰博基尼\",\"List\":[{\"I\":2277,\"N\":\"Aventador\"},{\"I\":3277,\"N\":\"Huracán\"},{\"I\":2775,\"N\":\"Urus\"},{\"I\":354,\"N\":\"Gallardo(停售)\"},{\"I\":174,\"N\":\"Murcielago(停售)\"},{\"I\":727,\"N\":\"Reventon(停售)\"}]}]},{\"I\":54,\"N\":\"劳斯莱斯\",\"L\":\"L\",\"List\":[{\"I\":107,\"N\":\"劳斯莱斯\",\"List\":[{\"I\":3778,\"N\":\"库里南\"},{\"I\":836,\"N\":\"古思特\"},{\"I\":265,\"N\":\"幻影\"},{\"I\":3015,\"N\":\"魅影\"},{\"I\":3838,\"N\":\"曜影\"}]}]},{\"I\":52,\"N\":\"雷克萨斯\",\"L\":\"L\",\"List\":[{\"I\":65,\"N\":\"雷克萨斯\",\"List\":[{\"I\":2063,\"N\":\"雷克萨斯CT\"},{\"I\":403,\"N\":\"雷克萨斯ES\"},{\"I\":261,\"N\":\"雷克萨斯GS\"},{\"I\":201,\"N\":\"雷克萨斯IS\"},{\"I\":2623,\"N\":\"雷克萨斯LC\"},{\"I\":341,\"N\":\"雷克萨斯LS\"},{\"I\":352,\"N\":\"雷克萨斯LX\"},{\"I\":3442,\"N\":\"雷克萨斯NX\"},{\"I\":3758,\"N\":\"雷克萨斯RC\"},{\"I\":3934,\"N\":\"雷克萨斯RX\"},{\"I\":4197,\"N\":\"雷克萨斯UX\"},{\"I\":112,\"N\":\"雷克萨斯GX(停售)\"},{\"I\":351,\"N\":\"雷克萨斯RX经典(停售)\"},{\"I\":332,\"N\":\"雷克萨斯SC(停售)\"}]},{\"I\":414,\"N\":\"雷克萨斯F\",\"List\":[{\"I\":3238,\"N\":\"雷克萨斯RC F\"},{\"I\":697,\"N\":\"雷克萨斯LFA(停售)\"}]}]},{\"I\":10,\"N\":\"雷诺\",\"L\":\"L\",\"List\":[{\"I\":375,\"N\":\"东风雷诺\",\"List\":[{\"I\":4098,\"N\":\"科雷傲\"},{\"I\":3870,\"N\":\"科雷嘉\"}]},{\"I\":89,\"N\":\"雷诺(进口)\",\"List\":[{\"I\":2029,\"N\":\"Espace\"},{\"I\":199,\"N\":\"风景\"},{\"I\":2268,\"N\":\"卡缤\"},{\"I\":686,\"N\":\"科雷傲(进口)\"},{\"I\":196,\"N\":\"梅甘娜\"},{\"I\":2765,\"N\":\"塔利斯曼\"},{\"I\":908,\"N\":\"风朗(停售)\"},{\"I\":188,\"N\":\"拉古那(停售)\"},{\"I\":257,\"N\":\"威赛帝(停售)\"},{\"I\":2184,\"N\":\"纬度(停售)\"}]}]},{\"I\":124,\"N\":\"理念\",\"L\":\"L\",\"List\":[{\"I\":32,\"N\":\"广汽本田\",\"List\":[{\"I\":5027,\"N\":\"理念VE-1\"},{\"I\":2248,\"N\":\"理念S1(停售)\"}]}]},{\"I\":80,\"N\":\"力帆汽车\",\"L\":\"L\",\"List\":[{\"I\":154,\"N\":\"力帆汽车\",\"List\":[{\"I\":2503,\"N\":\"丰顺\"},{\"I\":2800,\"N\":\"福顺\"},{\"I\":3631,\"N\":\"乐途\"},{\"I\":4773,\"N\":\"力帆650EV\"},{\"I\":3326,\"N\":\"力帆820\"},{\"I\":4977,\"N\":\"力帆820EV\"},{\"I\":3228,\"N\":\"力帆T11\"},{\"I\":3229,\"N\":\"力帆T21\"},{\"I\":3220,\"N\":\"力帆X50\"},{\"I\":2134,\"N\":\"力帆X60\"},{\"I\":3759,\"N\":\"力帆X80\"},{\"I\":3987,\"N\":\"迈威\"},{\"I\":4873,\"N\":\"迈威新能源\"},{\"I\":2502,\"N\":\"兴顺\"},{\"I\":4194,\"N\":\"轩朗\"},{\"I\":597,\"N\":\"力帆320(停售)\"},{\"I\":3082,\"N\":\"力帆330(停售)\"},{\"I\":4332,\"N\":\"力帆330EV(停售)\"},{\"I\":443,\"N\":\"力帆520(停售)\"},{\"I\":2957,\"N\":\"力帆530(停售)\"},{\"I\":596,\"N\":\"力帆620(停售)\"},{\"I\":4329,\"N\":\"力帆620EV(停售)\"},{\"I\":3083,\"N\":\"力帆630(停售)\"},{\"I\":2312,\"N\":\"力帆720(停售)\"}]}]},{\"I\":89,\"N\":\"莲花汽车\",\"L\":\"L\",\"List\":[{\"I\":179,\"N\":\"莲花汽车\",\"List\":[{\"I\":583,\"N\":\"竞速(停售)\"},{\"I\":691,\"N\":\"竞悦(停售)\"},{\"I\":928,\"N\":\"莲花L3(停售)\"},{\"I\":2125,\"N\":\"莲花L5(停售)\"}]}]},{\"I\":78,\"N\":\"猎豹汽车\",\"L\":\"L\",\"List\":[{\"I\":141,\"N\":\"猎豹汽车\",\"List\":[{\"I\":4682,\"N\":\"Mattu\"},{\"I\":3472,\"N\":\"猎豹CS10\"},{\"I\":4111,\"N\":\"猎豹CS9\"},{\"I\":4428,\"N\":\"猎豹CS9新能源\"},{\"I\":4126,\"N\":\"猎豹CT7\"},{\"I\":3150,\"N\":\"猎豹Q6\"},{\"I\":2520,\"N\":\"飞铃(停售)\"},{\"I\":706,\"N\":\"飞腾(停售)\"},{\"I\":3124,\"N\":\"飞腾C5(停售)\"},{\"I\":2521,\"N\":\"飞扬(停售)\"},{\"I\":961,\"N\":\"黑金刚(停售)\"},{\"I\":962,\"N\":\"猎豹6481(停售)\"},{\"I\":4112,\"N\":\"猎豹C5EV(停售)\"},{\"I\":569,\"N\":\"猎豹CS6(停售)\"},{\"I\":815,\"N\":\"猎豹CS7(停售)\"},{\"I\":3034,\"N\":\"猎豹CT5(停售)\"},{\"I\":568,\"N\":\"骐菱(停售)\"}]}]},{\"I\":51,\"N\":\"林肯\",\"L\":\"L\",\"List\":[{\"I\":56,\"N\":\"林肯\",\"List\":[{\"I\":4635,\"N\":\"航海家\"},{\"I\":2991,\"N\":\"林肯MKC\"},{\"I\":794,\"N\":\"林肯MKT\"},{\"I\":758,\"N\":\"林肯MKX\"},{\"I\":793,\"N\":\"林肯MKZ\"},{\"I\":3731,\"N\":\"林肯大陆\"},{\"I\":95,\"N\":\"领航员\"},{\"I\":103,\"N\":\"城市(停售)\"},{\"I\":869,\"N\":\"林肯MKS(停售)\"}]}]},{\"I\":53,\"N\":\"铃木\",\"L\":\"L\",\"List\":[{\"I\":31,\"N\":\"昌河铃木\",\"List\":[{\"I\":75,\"N\":\"北斗星\"},{\"I\":3216,\"N\":\"北斗星X5\"},{\"I\":3112,\"N\":\"利亚纳A6\"},{\"I\":2534,\"N\":\"浪迪(停售)\"},{\"I\":432,\"N\":\"利亚纳(停售)\"},{\"I\":2049,\"N\":\"派喜(停售)\"}]},{\"I\":35,\"N\":\"长安铃木\",\"List\":[{\"I\":872,\"N\":\"奥拓\"},{\"I\":3528,\"N\":\"启悦\"},{\"I\":529,\"N\":\"天语 SX4\"},{\"I\":3858,\"N\":\"维特拉\"},{\"I\":4435,\"N\":\"骁途\"},{\"I\":362,\"N\":\"雨燕\"},{\"I\":3185,\"N\":\"锋驭(停售)\"},{\"I\":94,\"N\":\"羚羊(停售)\"},{\"I\":2242,\"N\":\"天语 尚悦(停售)\"}]},{\"I\":161,\"N\":\"铃木(进口)\",\"List\":[{\"I\":500,\"N\":\"超级维特拉\"},{\"I\":508,\"N\":\"吉姆尼(进口)\"},{\"I\":2176,\"N\":\"速翼特\"},{\"I\":3926,\"N\":\"英格尼斯\"},{\"I\":892,\"N\":\"凯泽西(停售)\"}]}]},{\"I\":318,\"N\":\"零跑汽车\",\"L\":\"L\",\"List\":[{\"I\":496,\"N\":\"零跑汽车\",\"List\":[{\"I\":4677,\"N\":\"零跑S01\"}]}]},{\"I\":279,\"N\":\"领克\",\"L\":\"L\",\"List\":[{\"I\":463,\"N\":\"领克\",\"List\":[{\"I\":4221,\"N\":\"领克01\"},{\"I\":4840,\"N\":\"领克01新能源\"},{\"I\":4616,\"N\":\"领克02\"},{\"I\":4402,\"N\":\"领克03\"}]}]},{\"I\":343,\"N\":\"领途汽车\",\"L\":\"L\",\"List\":[{\"I\":518,\"N\":\"领途汽车\",\"List\":[{\"I\":4589,\"N\":\"领途E行\"},{\"I\":4955,\"N\":\"领途K-ONE\"}]}]},{\"I\":204,\"N\":\"陆地方舟\",\"L\":\"L\",\"List\":[{\"I\":385,\"N\":\"陆地方舟\",\"List\":[{\"I\":4509,\"N\":\"威途X35\"},{\"I\":3436,\"N\":\"艾威(停售)\"},{\"I\":3438,\"N\":\"陆地方舟V5(停售)\"},{\"I\":3439,\"N\":\"陆地方舟风尚(停售)\"}]}]},{\"I\":88,\"N\":\"陆风\",\"L\":\"L\",\"List\":[{\"I\":158,\"N\":\"陆风汽车\",\"List\":[{\"I\":4302,\"N\":\"陆风X2\"},{\"I\":2883,\"N\":\"陆风X5\"},{\"I\":3413,\"N\":\"陆风X7\"},{\"I\":833,\"N\":\"陆风X8\"},{\"I\":4233,\"N\":\"陆风逍遥\"},{\"I\":571,\"N\":\"风华(停售)\"},{\"I\":468,\"N\":\"风尚(停售)\"},{\"I\":501,\"N\":\"陆风X6(停售)\"},{\"I\":635,\"N\":\"陆风X9(停售)\"}]}]},{\"I\":49,\"N\":\"路虎\",\"L\":\"L\",\"List\":[{\"I\":376,\"N\":\"奇瑞捷豹路虎\",\"List\":[{\"I\":3871,\"N\":\"发现神行\"},{\"I\":3521,\"N\":\"揽胜极光\"}]},{\"I\":49,\"N\":\"路虎(进口)\",\"List\":[{\"I\":802,\"N\":\"发现\"},{\"I\":3565,\"N\":\"发现神行(进口)\"},{\"I\":69,\"N\":\"揽胜\"},{\"I\":754,\"N\":\"揽胜极光(进口)\"},{\"I\":4579,\"N\":\"揽胜新能源\"},{\"I\":4316,\"N\":\"揽胜星脉\"},{\"I\":850,\"N\":\"揽胜运动版\"},{\"I\":4569,\"N\":\"揽胜运动版新能源\"},{\"I\":256,\"N\":\"卫士\"},{\"I\":3177,\"N\":\"神行者(停售)\"},{\"I\":77,\"N\":\"神行者2(停售)\"}]}]},{\"I\":50,\"N\":\"路特斯\",\"L\":\"L\",\"List\":[{\"I\":110,\"N\":\"路特斯\",\"List\":[{\"I\":272,\"N\":\"Elise\"},{\"I\":681,\"N\":\"Evora\"},{\"I\":891,\"N\":\"Exige\"}]}]},{\"I\":346,\"N\":\"罗夫哈特\",\"L\":\"L\",\"List\":[{\"I\":520,\"N\":\"罗夫哈特\",\"List\":[{\"I\":4988,\"N\":\"罗夫哈特GR500\"}]}]},{\"I\":56,\"N\":\"MINI\",\"L\":\"M\",\"List\":[{\"I\":143,\"N\":\"MINI\",\"List\":[{\"I\":209,\"N\":\"MINI\"},{\"I\":749,\"N\":\"MINI CLUBMAN\"},{\"I\":750,\"N\":\"MINI COUNTRYMAN\"},{\"I\":904,\"N\":\"MINI COUPE(停售)\"},{\"I\":2241,\"N\":\"MINI PACEMAN(停售)\"},{\"I\":930,\"N\":\"MINI ROADSTER(停售)\"}]},{\"I\":369,\"N\":\"MINI JCW\",\"List\":[{\"I\":3178,\"N\":\"MINI JCW\"},{\"I\":3179,\"N\":\"MINI JCW CLUBMAN\"},{\"I\":3181,\"N\":\"MINI JCW COUNTRYMAN\"},{\"I\":3180,\"N\":\"MINI JCW COUPE(停售)\"},{\"I\":3182,\"N\":\"MINI JCW PACEMAN(停售)\"}]}]},{\"I\":58,\"N\":\"马自达\",\"L\":\"M\",\"List\":[{\"I\":176,\"N\":\"长安马自达\",\"List\":[{\"I\":3294,\"N\":\"马自达3 Axela昂克赛拉\"},{\"I\":2987,\"N\":\"马自达CX-5\"},{\"I\":4870,\"N\":\"马自达CX-8\"},{\"I\":433,\"N\":\"马自达2(停售)\"},{\"I\":641,\"N\":\"马自达2劲翔(停售)\"},{\"I\":363,\"N\":\"马自达3(停售)\"},{\"I\":2418,\"N\":\"马自达3星骋(停售)\"}]},{\"I\":11,\"N\":\"一汽马自达\",\"List\":[{\"I\":3154,\"N\":\"阿特兹\"},{\"I\":3968,\"N\":\"马自达CX-4\"},{\"I\":22,\"N\":\"马自达6(停售)\"},{\"I\":2118,\"N\":\"马自达8(停售)\"},{\"I\":3066,\"N\":\"马自达CX-7(停售)\"},{\"I\":655,\"N\":\"睿翼(停售)\"}]},{\"I\":119,\"N\":\"马自达(进口)\",\"List\":[{\"I\":3096,\"N\":\"ATENZA\"},{\"I\":584,\"N\":\"马自达3(进口)\"},{\"I\":3538,\"N\":\"马自达CX-3\"},{\"I\":2391,\"N\":\"马自达CX-5(进口)\"},{\"I\":1005,\"N\":\"马自达CX-9\"},{\"I\":672,\"N\":\"马自达MX-5\"},{\"I\":578,\"N\":\"马自达5(停售)\"},{\"I\":304,\"N\":\"马自达8(进口)(停售)\"},{\"I\":658,\"N\":\"马自达CX-7(进口)(停售)\"},{\"I\":295,\"N\":\"马自达RX-8(停售)\"}]}]},{\"I\":57,\"N\":\"玛莎拉蒂\",\"L\":\"M\",\"List\":[{\"I\":3,\"N\":\"玛莎拉蒂\",\"List\":[{\"I\":322,\"N\":\"Coupe\"},{\"I\":3060,\"N\":\"Ghibli\"},{\"I\":903,\"N\":\"GranCabrio\"},{\"I\":551,\"N\":\"GranTurismo\"},{\"I\":2428,\"N\":\"Levante\"},{\"I\":289,\"N\":\"总裁\"},{\"I\":191,\"N\":\"玛莎拉蒂Spyder(停售)\"}]}]},{\"I\":55,\"N\":\"迈巴赫\",\"L\":\"M\",\"List\":[{\"I\":144,\"N\":\"迈巴赫\",\"List\":[{\"I\":389,\"N\":\"迈巴赫(停售)\"}]}]},{\"I\":129,\"N\":\"迈凯伦\",\"L\":\"M\",\"List\":[{\"I\":314,\"N\":\"迈凯伦\",\"List\":[{\"I\":3809,\"N\":\"迈凯伦540C\"},{\"I\":3767,\"N\":\"迈凯伦570\"},{\"I\":4880,\"N\":\"迈凯伦600LT\"},{\"I\":3382,\"N\":\"迈凯伦650S\"},{\"I\":3733,\"N\":\"迈凯伦675LT\"},{\"I\":4366,\"N\":\"迈凯伦720S\"},{\"I\":2902,\"N\":\"迈凯伦P1\"},{\"I\":2293,\"N\":\"迈凯伦12C(停售)\"},{\"I\":3620,\"N\":\"迈凯伦625C(停售)\"}]}]},{\"I\":20,\"N\":\"名爵\",\"L\":\"M\",\"List\":[{\"I\":159,\"N\":\"上汽集团\",\"List\":[{\"I\":4948,\"N\":\"名爵EZS纯电动\"},{\"I\":2147,\"N\":\"名爵3\"},{\"I\":555,\"N\":\"名爵3SW\"},{\"I\":835,\"N\":\"名爵6\"},{\"I\":4605,\"N\":\"名爵6新能源\"},{\"I\":4868,\"N\":\"名爵HS\"},{\"I\":4247,\"N\":\"名爵ZS\"},{\"I\":3065,\"N\":\"锐腾\"},{\"I\":3547,\"N\":\"锐行\"},{\"I\":532,\"N\":\"名爵5(停售)\"},{\"I\":531,\"N\":\"名爵7(停售)\"},{\"I\":533,\"N\":\"名爵TF(停售)\"}]}]},{\"I\":168,\"N\":\"摩根\",\"L\":\"M\",\"List\":[{\"I\":351,\"N\":\"摩根\",\"List\":[{\"I\":3491,\"N\":\"3 Wheeler\"},{\"I\":3153,\"N\":\"摩根4-4\"},{\"I\":2835,\"N\":\"摩根Aero\"},{\"I\":3736,\"N\":\"摩根Aero 8\"},{\"I\":3152,\"N\":\"摩根Plus 4\"},{\"I\":2836,\"N\":\"摩根Plus 8\"},{\"I\":3151,\"N\":\"摩根Roadster\"}]}]},{\"I\":295,\"N\":\"NEVS国能汽车\",\"L\":\"N\",\"List\":[{\"I\":478,\"N\":\"NEVS国能汽车\",\"List\":[{\"I\":4470,\"N\":\"NEVS 93\"}]}]},{\"I\":334,\"N\":\"哪吒汽车\",\"L\":\"N\",\"List\":[{\"I\":489,\"N\":\"合众新能源\",\"List\":[{\"I\":4879,\"N\":\"哪吒N01\"}]}]},{\"I\":130,\"N\":\"纳智捷\",\"L\":\"N\",\"List\":[{\"I\":315,\"N\":\"东风裕隆\",\"List\":[{\"I\":4497,\"N\":\"U5 SUV\"},{\"I\":3040,\"N\":\"大7 MPV\"},{\"I\":2988,\"N\":\"纳5\"},{\"I\":3939,\"N\":\"锐3\"},{\"I\":3293,\"N\":\"优6 SUV\"},{\"I\":2296,\"N\":\"MASTER CEO(停售)\"},{\"I\":2295,\"N\":\"大7 SUV(停售)\"}]}]},{\"I\":213,\"N\":\"南京金龙\",\"L\":\"N\",\"List\":[{\"I\":384,\"N\":\"南京金龙\",\"List\":[{\"I\":4639,\"N\":\"开沃D07\"},{\"I\":4640,\"N\":\"开沃D08\"},{\"I\":4641,\"N\":\"开沃D09\"},{\"I\":4642,\"N\":\"开沃D10\"},{\"I\":3432,\"N\":\"开沃D11\"}]}]},{\"I\":60,\"N\":\"讴歌\",\"L\":\"O\",\"List\":[{\"I\":450,\"N\":\"广汽讴歌\",\"List\":[{\"I\":4096,\"N\":\"讴歌CDX\"},{\"I\":4820,\"N\":\"讴歌RDX\"},{\"I\":4381,\"N\":\"讴歌TLX-L\"}]},{\"I\":157,\"N\":\"讴歌(进口)\",\"List\":[{\"I\":2642,\"N\":\"讴歌ILX\"},{\"I\":524,\"N\":\"讴歌MDX\"},{\"I\":2641,\"N\":\"讴歌NSX\"},{\"I\":888,\"N\":\"讴歌RDX(进口)\"},{\"I\":2748,\"N\":\"讴歌RLX\"},{\"I\":3328,\"N\":\"讴歌TLX\"},{\"I\":806,\"N\":\"讴歌ZDX\"},{\"I\":464,\"N\":\"讴歌RL(停售)\"},{\"I\":479,\"N\":\"讴歌TL(停售)\"}]}]},{\"I\":59,\"N\":\"欧宝\",\"L\":\"O\",\"List\":[{\"I\":87,\"N\":\"欧宝\",\"List\":[{\"I\":2021,\"N\":\"麦瑞纳\"},{\"I\":381,\"N\":\"赛飞利\"},{\"I\":348,\"N\":\"雅特\"},{\"I\":653,\"N\":\"英速亚\"},{\"I\":670,\"N\":\"安德拉(停售)\"},{\"I\":182,\"N\":\"威达(停售)\"}]}]},{\"I\":331,\"N\":\"欧拉\",\"L\":\"O\",\"List\":[{\"I\":4,\"N\":\"长城汽车\",\"List\":[{\"I\":4678,\"N\":\"欧拉iQ\"},{\"I\":4826,\"N\":\"欧拉R1\"}]}]},{\"I\":146,\"N\":\"欧朗\",\"L\":\"O\",\"List\":[{\"I\":332,\"N\":\"一汽欧朗\",\"List\":[{\"I\":2563,\"N\":\"欧朗(停售)\"}]}]},{\"I\":332,\"N\":\"欧尚汽车\",\"L\":\"O\",\"List\":[{\"I\":160,\"N\":\"长安汽车\",\"List\":[{\"I\":4660,\"N\":\"欧尚COS1°(科赛)\"},{\"I\":4886,\"N\":\"欧尚COSMOS(科尚)\"}]}]},{\"I\":308,\"N\":\"Polestar\",\"L\":\"P\",\"List\":[{\"I\":487,\"N\":\"Polestar\",\"List\":[{\"I\":4581,\"N\":\"Polestar 1\"}]}]},{\"I\":61,\"N\":\"帕加尼\",\"L\":\"P\",\"List\":[{\"I\":140,\"N\":\"帕加尼\",\"List\":[{\"I\":2263,\"N\":\"Huayra\"}]}]},{\"I\":26,\"N\":\"奇瑞\",\"L\":\"Q\",\"List\":[{\"I\":33,\"N\":\"奇瑞汽车\",\"List\":[{\"I\":3405,\"N\":\"艾瑞泽5\"},{\"I\":2980,\"N\":\"艾瑞泽7\"},{\"I\":4787,\"N\":\"艾瑞泽GX\"},{\"I\":2989,\"N\":\"奇瑞QQ\"},{\"I\":3397,\"N\":\"瑞虎3\"},{\"I\":4099,\"N\":\"瑞虎3x\"},{\"I\":3195,\"N\":\"瑞虎5\"},{\"I\":4531,\"N\":\"瑞虎5x\"},{\"I\":3766,\"N\":\"瑞虎7\"},{\"I\":4693,\"N\":\"瑞虎8\"},{\"I\":3157,\"N\":\"艾瑞泽3(停售)\"},{\"I\":4223,\"N\":\"艾瑞泽7e(停售)\"},{\"I\":3300,\"N\":\"艾瑞泽M7(停售)\"},{\"I\":2914,\"N\":\"爱卡(停售)\"},{\"I\":83,\"N\":\"东方之子(停售)\"},{\"I\":451,\"N\":\"东方之子Cross(停售)\"},{\"I\":84,\"N\":\"风云(停售)\"},{\"I\":837,\"N\":\"风云2(停售)\"},{\"I\":518,\"N\":\"奇瑞A1(停售)\"},{\"I\":530,\"N\":\"奇瑞A3(停售)\"},{\"I\":434,\"N\":\"奇瑞A5(停售)\"},{\"I\":2953,\"N\":\"奇瑞E3(停售)\"},{\"I\":2324,\"N\":\"奇瑞E5(停售)\"},{\"I\":87,\"N\":\"奇瑞QQ3(停售)\"},{\"I\":478,\"N\":\"奇瑞QQ6(停售)\"},{\"I\":612,\"N\":\"奇瑞QQme(停售)\"},{\"I\":854,\"N\":\"奇瑞X1(停售)\"},{\"I\":85,\"N\":\"旗云(停售)\"},{\"I\":996,\"N\":\"旗云1(停售)\"},{\"I\":2178,\"N\":\"旗云2(停售)\"},{\"I\":2180,\"N\":\"旗云3(停售)\"},{\"I\":2331,\"N\":\"旗云5(停售)\"},{\"I\":396,\"N\":\"瑞虎(停售)\"}]},{\"I\":405,\"N\":\"奇瑞新能源\",\"List\":[{\"I\":4262,\"N\":\"艾瑞泽5e\"},{\"I\":4218,\"N\":\"奇瑞eQ1\"},{\"I\":4624,\"N\":\"瑞虎3xe\"},{\"I\":3648,\"N\":\"奇瑞eQ(停售)\"},{\"I\":3920,\"N\":\"奇瑞QQ3EV(停售)\"}]}]},{\"I\":122,\"N\":\"启辰\",\"L\":\"Q\",\"List\":[{\"I\":467,\"N\":\"东风启辰\",\"List\":[{\"I\":4490,\"N\":\"启辰D60\"},{\"I\":4315,\"N\":\"启辰M50V\"},{\"I\":4887,\"N\":\"启辰T60\"},{\"I\":3618,\"N\":\"启辰T70\"},{\"I\":4115,\"N\":\"启辰T90\"},{\"I\":2955,\"N\":\"晨风(停售)\"},{\"I\":2341,\"N\":\"启辰D50(停售)\"},{\"I\":3475,\"N\":\"启辰R30(停售)\"},{\"I\":2867,\"N\":\"启辰R50(停售)\"},{\"I\":3226,\"N\":\"启辰R50X(停售)\"},{\"I\":3904,\"N\":\"启辰T70X(停售)\"}]}]},{\"I\":62,\"N\":\"起亚\",\"L\":\"Q\",\"List\":[{\"I\":57,\"N\":\"东风悦达起亚\",\"List\":[{\"I\":4505,\"N\":\"KX CROSS\"},{\"I\":813,\"N\":\"福瑞迪\"},{\"I\":4387,\"N\":\"焕驰\"},{\"I\":4523,\"N\":\"凯绅\"},{\"I\":2319,\"N\":\"起亚K2\"},{\"I\":2886,\"N\":\"起亚K3\"},{\"I\":2246,\"N\":\"起亚K5\"},{\"I\":4834,\"N\":\"起亚K5新能源\"},{\"I\":3664,\"N\":\"起亚KX3\"},{\"I\":4973,\"N\":\"起亚KX3新能源\"},{\"I\":3954,\"N\":\"起亚KX5\"},{\"I\":4200,\"N\":\"起亚KX7\"},{\"I\":4824,\"N\":\"奕跑\"},{\"I\":2137,\"N\":\"智跑\"},{\"I\":284,\"N\":\"嘉华(停售)\"},{\"I\":3385,\"N\":\"起亚K3S(停售)\"},{\"I\":3286,\"N\":\"起亚K4(停售)\"},{\"I\":142,\"N\":\"千里马(停售)\"},{\"I\":454,\"N\":\"锐欧(停售)\"},{\"I\":413,\"N\":\"赛拉图(停售)\"},{\"I\":565,\"N\":\"狮跑(停售)\"},{\"I\":876,\"N\":\"秀尔(停售)\"},{\"I\":298,\"N\":\"远舰(停售)\"}]},{\"I\":111,\"N\":\"起亚(进口)\",\"List\":[{\"I\":452,\"N\":\"SPORTAGE\"},{\"I\":591,\"N\":\"霸锐\"},{\"I\":3198,\"N\":\"极睿\"},{\"I\":3448,\"N\":\"嘉华(进口)\"},{\"I\":1010,\"N\":\"凯尊\"},{\"I\":890,\"N\":\"起亚K5(进口)\"},{\"I\":2681,\"N\":\"起亚K9\"},{\"I\":2420,\"N\":\"斯汀格\"},{\"I\":281,\"N\":\"索兰托\"},{\"I\":453,\"N\":\"佳乐(停售)\"},{\"I\":275,\"N\":\"欧菲莱斯(停售)\"},{\"I\":502,\"N\":\"起亚VQ(停售)\"},{\"I\":1016,\"N\":\"速迈(停售)\"}]}]},{\"I\":235,\"N\":\"前途\",\"L\":\"Q\",\"List\":[{\"I\":420,\"N\":\"前途汽车\",\"List\":[{\"I\":3820,\"N\":\"前途K50\"}]}]},{\"I\":222,\"N\":\"乔治·巴顿\",\"L\":\"Q\",\"List\":[{\"I\":403,\"N\":\"乔治·巴顿\",\"List\":[{\"I\":3621,\"N\":\"战车\"},{\"I\":3967,\"N\":\"战剑\"}]}]},{\"I\":312,\"N\":\"庆铃汽车\",\"L\":\"Q\",\"List\":[{\"I\":350,\"N\":\"庆铃汽车\",\"List\":[{\"I\":4656,\"N\":\"庆铃TAGA\"}]}]},{\"I\":219,\"N\":\"全球鹰\",\"L\":\"Q\",\"List\":[{\"I\":399,\"N\":\"康迪电动汽车集团\",\"List\":[{\"I\":4748,\"N\":\"全球鹰EX3\"},{\"I\":3835,\"N\":\"全球鹰K10\"},{\"I\":3836,\"N\":\"全球鹰K11\"},{\"I\":4161,\"N\":\"全球鹰K12\"},{\"I\":4160,\"N\":\"全球鹰K17\"},{\"I\":4994,\"N\":\"全球鹰K27\"}]}]},{\"I\":63,\"N\":\"日产\",\"L\":\"R\",\"List\":[{\"I\":92,\"N\":\"东风日产\",\"List\":[{\"I\":3817,\"N\":\"LANNIA 蓝鸟\"},{\"I\":4305,\"N\":\"劲客\"},{\"I\":522,\"N\":\"骊威\"},{\"I\":2381,\"N\":\"楼兰\"},{\"I\":2086,\"N\":\"玛驰\"},{\"I\":656,\"N\":\"奇骏\"},{\"I\":425,\"N\":\"骐达\"},{\"I\":634,\"N\":\"天籁\"},{\"I\":3957,\"N\":\"西玛\"},{\"I\":564,\"N\":\"逍客\"},{\"I\":448,\"N\":\"轩逸\"},{\"I\":4766,\"N\":\"轩逸·纯电\"},{\"I\":64,\"N\":\"阳光\"},{\"I\":475,\"N\":\"骏逸(停售)\"},{\"I\":63,\"N\":\"蓝鸟(停售)\"},{\"I\":355,\"N\":\"颐达(停售)\"}]},{\"I\":173,\"N\":\"郑州日产\",\"List\":[{\"I\":4307,\"N\":\"纳瓦拉\"},{\"I\":2466,\"N\":\"日产D22\"},{\"I\":2113,\"N\":\"日产NV200\"},{\"I\":2853,\"N\":\"日产ZN厢式车\"},{\"I\":4691,\"N\":\"途达\"},{\"I\":53,\"N\":\"帕拉丁(停售)\"}]},{\"I\":73,\"N\":\"日产(进口)\",\"List\":[{\"I\":2578,\"N\":\"碧莲\"},{\"I\":438,\"N\":\"贵士\"},{\"I\":958,\"N\":\"楼兰(海外)\"},{\"I\":208,\"N\":\"奇骏(进口)\"},{\"I\":702,\"N\":\"日产370Z\"},{\"I\":436,\"N\":\"日产GT-R\"},{\"I\":264,\"N\":\"途乐\"},{\"I\":204,\"N\":\"CIMA(停售)\"},{\"I\":205,\"N\":\"风度(停售)\"},{\"I\":376,\"N\":\"风雅(停售)\"},{\"I\":316,\"N\":\"日产350Z(停售)\"}]}]},{\"I\":19,\"N\":\"荣威\",\"L\":\"R\",\"List\":[{\"I\":159,\"N\":\"上汽集团\",\"List\":[{\"I\":3857,\"N\":\"荣威360\"},{\"I\":2743,\"N\":\"荣威950\"},{\"I\":3977,\"N\":\"荣威e950\"},{\"I\":4554,\"N\":\"荣威Ei5\"},{\"I\":4263,\"N\":\"荣威ei6\"},{\"I\":4869,\"N\":\"荣威i5\"},{\"I\":4246,\"N\":\"荣威i6\"},{\"I\":4653,\"N\":\"荣威MARVEL X\"},{\"I\":4473,\"N\":\"荣威RX3\"},{\"I\":4080,\"N\":\"荣威RX5\"},{\"I\":4240,\"N\":\"荣威RX5新能源\"},{\"I\":4665,\"N\":\"荣威RX8\"},{\"I\":2062,\"N\":\"荣威350(停售)\"},{\"I\":537,\"N\":\"荣威550(停售)\"},{\"I\":482,\"N\":\"荣威750(停售)\"},{\"I\":2779,\"N\":\"荣威e50(停售)\"},{\"I\":3978,\"N\":\"荣威e550(停售)\"},{\"I\":2297,\"N\":\"荣威W5(停售)\"}]}]},{\"I\":337,\"N\":\"容大智造\",\"L\":\"R\",\"List\":[{\"I\":510,\"N\":\"恒源电动汽车\",\"List\":[{\"I\":4878,\"N\":\"迈图\"}]}]},{\"I\":174,\"N\":\"如虎\",\"L\":\"R\",\"List\":[{\"I\":358,\"N\":\"如虎\",\"List\":[{\"I\":2970,\"N\":\"如虎 CTR 3\"},{\"I\":2972,\"N\":\"如虎 XL\"}]}]},{\"I\":296,\"N\":\"瑞驰新能源\",\"L\":\"R\",\"List\":[{\"I\":479,\"N\":\"瑞驰新能源\",\"List\":[{\"I\":5004,\"N\":\"瑞驰新能源EC31\"},{\"I\":4479,\"N\":\"瑞驰新能源EC35\"},{\"I\":4602,\"N\":\"瑞驰新能源EK05\"}]}]},{\"I\":103,\"N\":\"瑞麒\",\"L\":\"R\",\"List\":[{\"I\":33,\"N\":\"奇瑞汽车\",\"List\":[{\"I\":2109,\"N\":\"瑞麒G3(停售)\"},{\"I\":797,\"N\":\"瑞麒G5(停售)\"},{\"I\":791,\"N\":\"瑞麒G6(停售)\"},{\"I\":804,\"N\":\"瑞麒M1(停售)\"},{\"I\":853,\"N\":\"瑞麒M5(停售)\"}]}]},{\"I\":45,\"N\":\"smart\",\"L\":\"S\",\"List\":[{\"I\":187,\"N\":\"smart\",\"List\":[{\"I\":1004,\"N\":\"smart forfour\"},{\"I\":2958,\"N\":\"smart forjeremy\"},{\"I\":620,\"N\":\"smart fortwo\"},{\"I\":4326,\"N\":\"smart fortwo新能源\"}]}]},{\"I\":306,\"N\":\"SRM鑫源\",\"L\":\"S\",\"List\":[{\"I\":409,\"N\":\"华晨鑫源\",\"List\":[{\"I\":4566,\"N\":\"好运1号\"},{\"I\":4568,\"N\":\"鑫源T20EV\"},{\"I\":5107,\"N\":\"鑫源T20S\"},{\"I\":5185,\"N\":\"鑫源T22S\"},{\"I\":5108,\"N\":\"鑫源T30S\"},{\"I\":5186,\"N\":\"鑫源T32S\"},{\"I\":4758,\"N\":\"鑫源X30L\"},{\"I\":4567,\"N\":\"鑫源X30LEV\"}]}]},{\"I\":269,\"N\":\"SWM斯威汽车\",\"L\":\"S\",\"List\":[{\"I\":466,\"N\":\"SWM斯威汽车\",\"List\":[{\"I\":4684,\"N\":\"SWM斯威G01\"},{\"I\":4336,\"N\":\"SWM斯威X3\"},{\"I\":4151,\"N\":\"SWM斯威X7\"}]}]},{\"I\":64,\"N\":\"萨博\",\"L\":\"S\",\"List\":[{\"I\":97,\"N\":\"萨博\",\"List\":[{\"I\":343,\"N\":\"Saab 9-3\"},{\"I\":211,\"N\":\"Saab 9-5(停售)\"}]}]},{\"I\":205,\"N\":\"赛麟\",\"L\":\"S\",\"List\":[{\"I\":387,\"N\":\"威蒙积泰\",\"List\":[{\"I\":3487,\"N\":\"赛麟科迈罗\"},{\"I\":3486,\"N\":\"赛麟Mustang(停售)\"}]}]},{\"I\":68,\"N\":\"三菱\",\"L\":\"S\",\"List\":[{\"I\":12,\"N\":\"北京吉普\",\"List\":[{\"I\":25,\"N\":\"欧蓝德经典(停售)\"},{\"I\":24,\"N\":\"帕杰罗速跑(停售)\"}]},{\"I\":51,\"N\":\"东南汽车\",\"List\":[{\"I\":3131,\"N\":\"风迪思(停售)\"},{\"I\":668,\"N\":\"君阁(停售)\"},{\"I\":458,\"N\":\"蓝瑟(停售)\"},{\"I\":128,\"N\":\"菱绅(停售)\"},{\"I\":483,\"N\":\"三菱戈蓝(停售)\"},{\"I\":873,\"N\":\"翼神(停售)\"}]},{\"I\":355,\"N\":\"广汽三菱\",\"List\":[{\"I\":2768,\"N\":\"劲炫ASX\"},{\"I\":4147,\"N\":\"欧蓝德\"},{\"I\":3008,\"N\":\"帕杰罗·劲畅\"},{\"I\":4807,\"N\":\"奕歌\"},{\"I\":377,\"N\":\"帕杰罗(停售)\"}]},{\"I\":128,\"N\":\"三菱(进口)\",\"List\":[{\"I\":1018,\"N\":\"ASX劲炫(进口)\"},{\"I\":369,\"N\":\"LANCER\"},{\"I\":486,\"N\":\"欧蓝德(进口)\"},{\"I\":580,\"N\":\"帕杰罗(进口)\"},{\"I\":2332,\"N\":\"帕杰罗·劲畅(进口)\"},{\"I\":325,\"N\":\"格蓝迪(停售)\"},{\"I\":651,\"N\":\"伊柯丽斯(停售)\"}]}]},{\"I\":149,\"N\":\"陕汽通家\",\"L\":\"S\",\"List\":[{\"I\":333,\"N\":\"陕汽通家\",\"List\":[{\"I\":2570,\"N\":\"福家\"},{\"I\":3244,\"N\":\"龙锐\"}]}]},{\"I\":155,\"N\":\"上汽大通\",\"L\":\"S\",\"List\":[{\"I\":356,\"N\":\"上汽大通\",\"List\":[{\"I\":4120,\"N\":\"上汽大通D90\"},{\"I\":4338,\"N\":\"上汽大通EG10\"},{\"I\":5077,\"N\":\"上汽大通EV30\"},{\"I\":3064,\"N\":\"上汽大通G10\"},{\"I\":4686,\"N\":\"上汽大通G50\"},{\"I\":4241,\"N\":\"上汽大通T60\"},{\"I\":2608,\"N\":\"上汽大通V80\"},{\"I\":3192,\"N\":\"伊思坦纳(停售)\"}]}]},{\"I\":66,\"N\":\"世爵\",\"L\":\"S\",\"List\":[{\"I\":184,\"N\":\"世爵\",\"List\":[{\"I\":599,\"N\":\"世爵C8\"}]}]},{\"I\":90,\"N\":\"双环\",\"L\":\"S\",\"List\":[{\"I\":7,\"N\":\"双环汽车\",\"List\":[{\"I\":13,\"N\":\"来宝SRV(停售)\"},{\"I\":345,\"N\":\"双环SCEO(停售)\"},{\"I\":506,\"N\":\"小贵族(停售)\"}]}]},{\"I\":69,\"N\":\"双龙\",\"L\":\"S\",\"List\":[{\"I\":76,\"N\":\"双龙汽车\",\"List\":[{\"I\":455,\"N\":\"爱腾\"},{\"I\":3406,\"N\":\"蒂维拉\"},{\"I\":2214,\"N\":\"柯兰多\"},{\"I\":139,\"N\":\"雷斯特\"},{\"I\":516,\"N\":\"路帝\"},{\"I\":3372,\"N\":\"途凌\"},{\"I\":3132,\"N\":\"雷斯特W(停售)\"},{\"I\":485,\"N\":\"享御(停售)\"},{\"I\":141,\"N\":\"主席(停售)\"}]}]},{\"I\":162,\"N\":\"思铭\",\"L\":\"S\",\"List\":[{\"I\":151,\"N\":\"东风本田\",\"List\":[{\"I\":2751,\"N\":\"思铭(停售)\"}]}]},{\"I\":65,\"N\":\"斯巴鲁\",\"L\":\"S\",\"List\":[{\"I\":116,\"N\":\"斯巴鲁\",\"List\":[{\"I\":286,\"N\":\"傲虎\"},{\"I\":287,\"N\":\"力狮\"},{\"I\":285,\"N\":\"森林人\"},{\"I\":2557,\"N\":\"斯巴鲁BRZ\"},{\"I\":2417,\"N\":\"斯巴鲁XV\"},{\"I\":283,\"N\":\"翼豹\"},{\"I\":414,\"N\":\"驰鹏(停售)\"}]}]},{\"I\":238,\"N\":\"斯达泰克\",\"L\":\"S\",\"List\":[{\"I\":423,\"N\":\"斯达泰克\",\"List\":[{\"I\":3849,\"N\":\"斯达泰克-卫士\"},{\"I\":3847,\"N\":\"斯达泰克-揽胜(停售)\"},{\"I\":3848,\"N\":\"斯达泰克-揽胜运动版(停售)\"}]}]},{\"I\":67,\"N\":\"斯柯达\",\"L\":\"S\",\"List\":[{\"I\":162,\"N\":\"上汽斯柯达\",\"List\":[{\"I\":382,\"N\":\"晶锐\"},{\"I\":4217,\"N\":\"柯迪亚克\"},{\"I\":4986,\"N\":\"柯迪亚克GT\"},{\"I\":4453,\"N\":\"柯珞克\"},{\"I\":4690,\"N\":\"柯米克\"},{\"I\":519,\"N\":\"明锐\"},{\"I\":3171,\"N\":\"速派\"},{\"I\":3290,\"N\":\"昕动\"},{\"I\":2962,\"N\":\"昕锐\"},{\"I\":3013,\"N\":\"Yeti(停售)\"},{\"I\":772,\"N\":\"昊锐(停售)\"}]},{\"I\":138,\"N\":\"斯柯达(进口)\",\"List\":[{\"I\":357,\"N\":\"速派(进口)\"},{\"I\":858,\"N\":\"Yeti(进口)\"},{\"I\":356,\"N\":\"明锐(进口)\"},{\"I\":3269,\"N\":\"速尊\"}]}]},{\"I\":202,\"N\":\"泰卡特\",\"L\":\"T\",\"List\":[{\"I\":382,\"N\":\"泰卡特\",\"List\":[{\"I\":3393,\"N\":\"泰卡特 T9\"},{\"I\":3389,\"N\":\"泰卡特 T1(停售)\"},{\"I\":3390,\"N\":\"泰卡特 T2(停售)\"},{\"I\":3391,\"N\":\"泰卡特 T3(停售)\"},{\"I\":3392,\"N\":\"泰卡特 T7(停售)\"}]}]},{\"I\":133,\"N\":\"特斯拉\",\"L\":\"T\",\"List\":[{\"I\":318,\"N\":\"特斯拉\",\"List\":[{\"I\":4078,\"N\":\"Model 3\"},{\"I\":2357,\"N\":\"Model S\"},{\"I\":2664,\"N\":\"Model X\"}]}]},{\"I\":161,\"N\":\"腾势\",\"L\":\"T\",\"List\":[{\"I\":347,\"N\":\"腾势汽车\",\"List\":[{\"I\":2805,\"N\":\"腾势\"}]}]},{\"I\":283,\"N\":\"WEY\",\"L\":\"W\",\"List\":[{\"I\":4,\"N\":\"长城汽车\",\"List\":[{\"I\":4441,\"N\":\"WEY P8\"},{\"I\":4253,\"N\":\"WEY VV5\"},{\"I\":4631,\"N\":\"WEY VV6\"},{\"I\":4252,\"N\":\"WEY VV7\"}]}]},{\"I\":102,\"N\":\"威麟\",\"L\":\"W\",\"List\":[{\"I\":33,\"N\":\"奇瑞汽车\",\"List\":[{\"I\":909,\"N\":\"威麟V5(停售)\"},{\"I\":613,\"N\":\"威麟X5(停售)\"}]},{\"I\":502,\"N\":\"奇瑞万达客车\",\"List\":[{\"I\":2539,\"N\":\"威麟H5\"},{\"I\":4796,\"N\":\"威麟H6\"},{\"I\":2538,\"N\":\"威麟H3(停售)\"}]}]},{\"I\":291,\"N\":\"威马汽车\",\"L\":\"W\",\"List\":[{\"I\":475,\"N\":\"威马汽车\",\"List\":[{\"I\":4652,\"N\":\"威马EX5\"}]}]},{\"I\":99,\"N\":\"威兹曼\",\"L\":\"W\",\"List\":[{\"I\":195,\"N\":\"威兹曼\",\"List\":[{\"I\":725,\"N\":\"威兹曼GT\"},{\"I\":959,\"N\":\"威兹曼Roadster(停售)\"}]}]},{\"I\":192,\"N\":\"潍柴英致\",\"L\":\"W\",\"List\":[{\"I\":372,\"N\":\"潍柴汽车\",\"List\":[{\"I\":3969,\"N\":\"英致727\"},{\"I\":3653,\"N\":\"英致737\"},{\"I\":4963,\"N\":\"英致737EV\"},{\"I\":4657,\"N\":\"英致EX1\"},{\"I\":3306,\"N\":\"英致G3\"},{\"I\":3882,\"N\":\"英致G5\"}]}]},{\"I\":284,\"N\":\"蔚来\",\"L\":\"W\",\"List\":[{\"I\":464,\"N\":\"蔚来\",\"List\":[{\"I\":4265,\"N\":\"蔚来EP9\"},{\"I\":4881,\"N\":\"蔚来ES6\"},{\"I\":4427,\"N\":\"蔚来ES8\"}]}]},{\"I\":70,\"N\":\"沃尔沃\",\"L\":\"W\",\"List\":[{\"I\":181,\"N\":\"长安沃尔沃\",\"List\":[{\"I\":463,\"N\":\"沃尔沃S40(停售)\"},{\"I\":693,\"N\":\"沃尔沃S80L(停售)\"}]},{\"I\":367,\"N\":\"沃尔沃亚太\",\"List\":[{\"I\":3158,\"N\":\"沃尔沃S60L\"},{\"I\":4335,\"N\":\"沃尔沃S60L新能源\"},{\"I\":4206,\"N\":\"沃尔沃S90\"},{\"I\":4864,\"N\":\"沃尔沃S90新能源\"},{\"I\":3411,\"N\":\"沃尔沃XC60\"},{\"I\":4609,\"N\":\"沃尔沃XC60新能源\"},{\"I\":3420,\"N\":\"XC Classic(停售)\"}]},{\"I\":84,\"N\":\"沃尔沃(进口)\",\"List\":[{\"I\":404,\"N\":\"沃尔沃S60\"},{\"I\":175,\"N\":\"沃尔沃S80\"},{\"I\":3861,\"N\":\"沃尔沃S90(进口)\"},{\"I\":2678,\"N\":\"沃尔沃V40\"},{\"I\":2190,\"N\":\"沃尔沃V60\"},{\"I\":4029,\"N\":\"沃尔沃V90\"},{\"I\":3689,\"N\":\"沃尔沃XC40\"},{\"I\":585,\"N\":\"沃尔沃XC60(进口)\"},{\"I\":177,\"N\":\"沃尔沃XC90\"},{\"I\":4337,\"N\":\"沃尔沃XC90新能源\"},{\"I\":494,\"N\":\"沃尔沃C30(停售)\"},{\"I\":406,\"N\":\"沃尔沃C70(停售)\"},{\"I\":981,\"N\":\"沃尔沃S40(进口)(停售)\"}]}]},{\"I\":114,\"N\":\"五菱汽车\",\"L\":\"W\",\"List\":[{\"I\":59,\"N\":\"上汽通用五菱\",\"List\":[{\"I\":2506,\"N\":\"PN货车\"},{\"I\":2139,\"N\":\"五菱宏光\"},{\"I\":4408,\"N\":\"五菱宏光S3\"},{\"I\":5174,\"N\":\"五菱宏光V\"},{\"I\":2451,\"N\":\"五菱荣光\"},{\"I\":3657,\"N\":\"五菱荣光V\"},{\"I\":2855,\"N\":\"五菱荣光小卡\"},{\"I\":4884,\"N\":\"五菱荣光新卡\"},{\"I\":2456,\"N\":\"五菱之光\"},{\"I\":4270,\"N\":\"五菱之光V\"},{\"I\":3946,\"N\":\"五菱之光小卡\"},{\"I\":3570,\"N\":\"五菱征程(停售)\"}]}]},{\"I\":167,\"N\":\"五十铃\",\"L\":\"W\",\"List\":[{\"I\":394,\"N\":\"江西五十铃\",\"List\":[{\"I\":3562,\"N\":\"D-MAX\"},{\"I\":3576,\"N\":\"mu-X牧游侠\"},{\"I\":4775,\"N\":\"铃拓\"},{\"I\":3935,\"N\":\"瑞迈\"}]},{\"I\":350,\"N\":\"庆铃汽车\",\"List\":[{\"I\":2834,\"N\":\"五十铃皮卡\"},{\"I\":4198,\"N\":\"竞技者(停售)\"}]}]},{\"I\":98,\"N\":\"西雅特\",\"L\":\"X\",\"List\":[{\"I\":194,\"N\":\"西雅特\",\"List\":[{\"I\":718,\"N\":\"LEON\"},{\"I\":2105,\"N\":\"欧悦搏\"},{\"I\":714,\"N\":\"伊比飒\"}]}]},{\"I\":12,\"N\":\"现代\",\"L\":\"X\",\"List\":[{\"I\":27,\"N\":\"北京现代\",\"List\":[{\"I\":4615,\"N\":\"ENCINO 昂希诺\"},{\"I\":3292,\"N\":\"北京现代ix25\"},{\"I\":1007,\"N\":\"北京现代ix35\"},{\"I\":4817,\"N\":\"菲斯塔\"},{\"I\":2764,\"N\":\"朗动\"},{\"I\":3959,\"N\":\"领动\"},{\"I\":3073,\"N\":\"名图\"},{\"I\":2115,\"N\":\"瑞纳\"},{\"I\":3415,\"N\":\"瑞奕\"},{\"I\":2927,\"N\":\"胜达\"},{\"I\":4654,\"N\":\"索纳塔插电混动\"},{\"I\":3672,\"N\":\"索纳塔九\"},{\"I\":358,\"N\":\"途胜\"},{\"I\":4496,\"N\":\"伊兰特EV\"},{\"I\":4833,\"N\":\"逸行\"},{\"I\":586,\"N\":\"悦动\"},{\"I\":4107,\"N\":\"悦纳\"},{\"I\":4222,\"N\":\"悦纳RV\"},{\"I\":814,\"N\":\"北京现代i30(停售)\"},{\"I\":690,\"N\":\"领翔(停售)\"},{\"I\":866,\"N\":\"名驭(停售)\"},{\"I\":2649,\"N\":\"索纳塔(停售)\"},{\"I\":50,\"N\":\"索纳塔八(停售)\"},{\"I\":431,\"N\":\"雅绅特(停售)\"},{\"I\":51,\"N\":\"伊兰特(停售)\"},{\"I\":429,\"N\":\"御翔(停售)\"}]},{\"I\":402,\"N\":\"四川现代\",\"List\":[{\"I\":3613,\"N\":\"康恩迪\"}]},{\"I\":74,\"N\":\"现代(进口)\",\"List\":[{\"I\":2117,\"N\":\"H-1辉翼\"},{\"I\":2256,\"N\":\"Veloster飞思\"},{\"I\":3164,\"N\":\"格越\"},{\"I\":3453,\"N\":\"捷恩斯\"},{\"I\":2984,\"N\":\"胜达(进口)\"},{\"I\":1017,\"N\":\"索纳塔(进口)\"},{\"I\":975,\"N\":\"途胜(进口)\"},{\"I\":255,\"N\":\"雅科仕\"},{\"I\":446,\"N\":\"雅尊\"},{\"I\":131,\"N\":\"君爵(停售)\"},{\"I\":252,\"N\":\"酷派(停售)\"},{\"I\":594,\"N\":\"劳恩斯(停售)\"},{\"I\":756,\"N\":\"劳恩斯-酷派(停售)\"},{\"I\":457,\"N\":\"美佳(停售)\"},{\"I\":127,\"N\":\"胜达经典(停售)\"},{\"I\":510,\"N\":\"维拉克斯(停售)\"}]}]},{\"I\":275,\"N\":\"小鹏汽车\",\"L\":\"X\",\"List\":[{\"I\":459,\"N\":\"小鹏汽车\",\"List\":[{\"I\":4489,\"N\":\"小鹏汽车G3\"}]}]},{\"I\":185,\"N\":\"新凯\",\"L\":\"X\",\"List\":[{\"I\":364,\"N\":\"新凯汽车\",\"List\":[{\"I\":3703,\"N\":\"新凯凌特\"},{\"I\":3702,\"N\":\"新凯威霆\"},{\"I\":4351,\"N\":\"新凯V-Class\"},{\"I\":3090,\"N\":\"凯胜(停售)\"}]}]},{\"I\":324,\"N\":\"新特汽车\",\"L\":\"X\",\"List\":[{\"I\":499,\"N\":\"新特汽车\",\"List\":[{\"I\":4781,\"N\":\"SITECH DEV 1\"}]}]},{\"I\":71,\"N\":\"雪佛兰\",\"L\":\"X\",\"List\":[{\"I\":139,\"N\":\"上汽通用雪佛兰\",\"List\":[{\"I\":5008,\"N\":\"科鲁泽\"},{\"I\":3335,\"N\":\"创酷\"},{\"I\":657,\"N\":\"科鲁兹\"},{\"I\":2583,\"N\":\"科帕奇\"},{\"I\":4105,\"N\":\"科沃兹\"},{\"I\":3923,\"N\":\"乐风RV\"},{\"I\":2313,\"N\":\"迈锐宝\"},{\"I\":4031,\"N\":\"迈锐宝XL\"},{\"I\":163,\"N\":\"赛欧\"},{\"I\":4235,\"N\":\"探界者\"},{\"I\":4882,\"N\":\"沃兰多\"},{\"I\":2348,\"N\":\"爱唯欧(停售)\"},{\"I\":397,\"N\":\"景程(停售)\"},{\"I\":420,\"N\":\"乐骋(停售)\"},{\"I\":439,\"N\":\"乐风(停售)\"}]},{\"I\":142,\"N\":\"雪佛兰(进口)\",\"List\":[{\"I\":678,\"N\":\"科迈罗\"},{\"I\":546,\"N\":\"科帕奇(进口)\"},{\"I\":2362,\"N\":\"库罗德\"},{\"I\":808,\"N\":\"斯帕可\"},{\"I\":2405,\"N\":\"索罗德\"},{\"I\":682,\"N\":\"沃蓝达\"}]}]},{\"I\":72,\"N\":\"雪铁龙\",\"L\":\"X\",\"List\":[{\"I\":37,\"N\":\"东风雪铁龙\",\"List\":[{\"I\":3873,\"N\":\"C4世嘉\"},{\"I\":98,\"N\":\"爱丽舍\"},{\"I\":4370,\"N\":\"天逸 C5 AIRCROSS\"},{\"I\":3429,\"N\":\"雪铁龙C3-XR\"},{\"I\":2945,\"N\":\"雪铁龙C4L\"},{\"I\":792,\"N\":\"雪铁龙C5\"},{\"I\":4043,\"N\":\"雪铁龙C6\"},{\"I\":4685,\"N\":\"云逸 C4 AIRCROSS\"},{\"I\":232,\"N\":\"毕加索(停售)\"},{\"I\":293,\"N\":\"富康(停售)\"},{\"I\":388,\"N\":\"凯旋(停售)\"},{\"I\":230,\"N\":\"赛纳(停售)\"},{\"I\":639,\"N\":\"世嘉(停售)\"},{\"I\":476,\"N\":\"雪铁龙C2(停售)\"}]},{\"I\":82,\"N\":\"雪铁龙(进口)\",\"List\":[{\"I\":473,\"N\":\"C4 PICASSO\"},{\"I\":329,\"N\":\"雪铁龙C3\"},{\"I\":480,\"N\":\"雪铁龙C4\"},{\"I\":212,\"N\":\"雪铁龙C5(进口)\"},{\"I\":2473,\"N\":\"雪铁龙C4 Aircross(进口)(停售)\"},{\"I\":440,\"N\":\"雪铁龙C6(进口)(停售)\"}]}]},{\"I\":111,\"N\":\"野马汽车\",\"L\":\"Y\",\"List\":[{\"I\":206,\"N\":\"野马汽车\",\"List\":[{\"I\":2440,\"N\":\"野马F16\"},{\"I\":4434,\"N\":\"博骏\"},{\"I\":4425,\"N\":\"斯派卡\"},{\"I\":4510,\"N\":\"野马EC30\"},{\"I\":4633,\"N\":\"野马EC60\"},{\"I\":3906,\"N\":\"野马EC70\"},{\"I\":2888,\"N\":\"野马T70\"},{\"I\":3765,\"N\":\"野马T80\"},{\"I\":2378,\"N\":\"野马F10(停售)\"},{\"I\":2445,\"N\":\"野马F12(停售)\"},{\"I\":939,\"N\":\"野马F99(停售)\"}]}]},{\"I\":110,\"N\":\"一汽\",\"L\":\"Y\",\"List\":[{\"I\":39,\"N\":\"天津一汽\",\"List\":[{\"I\":4404,\"N\":\"骏派A50\"},{\"I\":3979,\"N\":\"骏派A70\"},{\"I\":4415,\"N\":\"骏派A70E\"},{\"I\":4405,\"N\":\"骏派CX65\"},{\"I\":3081,\"N\":\"骏派D60\"},{\"I\":4680,\"N\":\"骏派D80\"},{\"I\":2716,\"N\":\"威志V5\"},{\"I\":878,\"N\":\"夏利N5\"},{\"I\":2781,\"N\":\"夏利N7\"},{\"I\":106,\"N\":\"威乐(停售)\"},{\"I\":444,\"N\":\"威志(停售)\"},{\"I\":879,\"N\":\"威志V2(停售)\"},{\"I\":104,\"N\":\"威姿(停售)\"},{\"I\":101,\"N\":\"夏利(停售)\"}]},{\"I\":506,\"N\":\"一汽红塔\",\"List\":[{\"I\":4855,\"N\":\"蓝舰T340\"}]},{\"I\":166,\"N\":\"一汽吉林\",\"List\":[{\"I\":2526,\"N\":\"佳宝T50\"},{\"I\":2525,\"N\":\"佳宝T51\"},{\"I\":2465,\"N\":\"佳宝T57\"},{\"I\":2469,\"N\":\"佳宝V52\"},{\"I\":2468,\"N\":\"佳宝V55\"},{\"I\":3775,\"N\":\"佳宝V75\"},{\"I\":3776,\"N\":\"佳宝V77\"},{\"I\":3052,\"N\":\"佳宝V80\"},{\"I\":5051,\"N\":\"佳宝V80新能源\"},{\"I\":3459,\"N\":\"解放T80\"},{\"I\":5042,\"N\":\"解放T90\"},{\"I\":3824,\"N\":\"森雅R7\"},{\"I\":4945,\"N\":\"森雅R7新能源\"},{\"I\":4754,\"N\":\"森雅R9\"},{\"I\":2870,\"N\":\"佳宝V70 II代(停售)\"},{\"I\":2464,\"N\":\"佳宝V70(停售)\"},{\"I\":913,\"N\":\"森雅M80(停售)\"},{\"I\":2131,\"N\":\"森雅S80(停售)\"}]},{\"I\":338,\"N\":\"一汽通用\",\"List\":[{\"I\":2603,\"N\":\"坤程\"}]}]},{\"I\":144,\"N\":\"依维柯\",\"L\":\"Y\",\"List\":[{\"I\":329,\"N\":\"南京依维柯\",\"List\":[{\"I\":4580,\"N\":\"依维柯Daily(欧胜)\"},{\"I\":4266,\"N\":\"依维柯Ouba\"},{\"I\":4267,\"N\":\"依维柯Venice\"},{\"I\":2533,\"N\":\"依维柯褒迪Power Daily\"},{\"I\":5057,\"N\":\"依维柯褒迪新能源\"},{\"I\":2532,\"N\":\"依维柯得意\"},{\"I\":2531,\"N\":\"都灵(停售)\"}]}]},{\"I\":73,\"N\":\"英菲尼迪\",\"L\":\"Y\",\"List\":[{\"I\":392,\"N\":\"东风英菲尼迪\",\"List\":[{\"I\":3553,\"N\":\"英菲尼迪Q50L\"},{\"I\":3591,\"N\":\"英菲尼迪QX50\"}]},{\"I\":72,\"N\":\"英菲尼迪(进口)\",\"List\":[{\"I\":605,\"N\":\"英菲尼迪EX\"},{\"I\":3535,\"N\":\"英菲尼迪ESQ\"},{\"I\":2992,\"N\":\"英菲尼迪Q50\"},{\"I\":3201,\"N\":\"英菲尼迪Q60\"},{\"I\":3097,\"N\":\"英菲尼迪Q70\"},{\"I\":3652,\"N\":\"英菲尼迪QX30\"},{\"I\":3098,\"N\":\"英菲尼迪QX50(进口)\"},{\"I\":3043,\"N\":\"英菲尼迪QX60\"},{\"I\":3099,\"N\":\"英菲尼迪QX70\"},{\"I\":3100,\"N\":\"英菲尼迪QX80\"},{\"I\":122,\"N\":\"英菲尼迪FX(停售)\"},{\"I\":383,\"N\":\"英菲尼迪G系(停售)\"},{\"I\":2400,\"N\":\"英菲尼迪JX(停售)\"},{\"I\":581,\"N\":\"英菲尼迪M系(停售)\"},{\"I\":3202,\"N\":\"英菲尼迪Q60S(停售)\"},{\"I\":416,\"N\":\"英菲尼迪QX(停售)\"}]}]},{\"I\":93,\"N\":\"永源\",\"L\":\"Y\",\"List\":[{\"I\":150,\"N\":\"永源汽车\",\"List\":[{\"I\":2828,\"N\":\"永源五星\"},{\"I\":3087,\"N\":\"猎鹰(停售)\"},{\"I\":424,\"N\":\"永源A380(停售)\"}]}]},{\"I\":298,\"N\":\"宇通客车\",\"L\":\"Y\",\"List\":[{\"I\":481,\"N\":\"宇通客车\",\"List\":[{\"I\":4909,\"N\":\"宇通CL6\"},{\"I\":4484,\"N\":\"宇通T7\"}]}]},{\"I\":263,\"N\":\"驭胜\",\"L\":\"Y\",\"List\":[{\"I\":307,\"N\":\"江铃汽车\",\"List\":[{\"I\":2228,\"N\":\"驭胜S350\"},{\"I\":3777,\"N\":\"驭胜S330(停售)\"}]}]},{\"I\":232,\"N\":\"御捷\",\"L\":\"Y\",\"List\":[{\"I\":416,\"N\":\"御捷新能源\",\"List\":[{\"I\":4508,\"N\":\"御捷E驰(停售)\"}]}]},{\"I\":307,\"N\":\"裕路\",\"L\":\"Y\",\"List\":[{\"I\":486,\"N\":\"裕路汽车\",\"List\":[{\"I\":4574,\"N\":\"裕路EV2\"}]}]},{\"I\":286,\"N\":\"云度\",\"L\":\"Y\",\"List\":[{\"I\":469,\"N\":\"云度新能源\",\"List\":[{\"I\":4320,\"N\":\"云度π1\"},{\"I\":4321,\"N\":\"云度π3\"}]}]},{\"I\":317,\"N\":\"云雀汽车\",\"L\":\"Y\",\"List\":[{\"I\":495,\"N\":\"云雀汽车\",\"List\":[{\"I\":4670,\"N\":\"全界Q1\"}]}]},{\"I\":182,\"N\":\"之诺\",\"L\":\"Z\",\"List\":[{\"I\":29,\"N\":\"华晨宝马\",\"List\":[{\"I\":4146,\"N\":\"之诺60H\"}]}]},{\"I\":206,\"N\":\"知豆\",\"L\":\"Z\",\"List\":[{\"I\":388,\"N\":\"知豆电动车\",\"List\":[{\"I\":3827,\"N\":\"知豆D2\"},{\"I\":4597,\"N\":\"知豆D3\"},{\"I\":3497,\"N\":\"知豆(停售)\"},{\"I\":3706,\"N\":\"知豆D1(停售)\"}]}]},{\"I\":22,\"N\":\"中华\",\"L\":\"Z\",\"List\":[{\"I\":53,\"N\":\"华晨中华\",\"List\":[{\"I\":4309,\"N\":\"中华H230EV\"},{\"I\":3878,\"N\":\"中华H3\"},{\"I\":2323,\"N\":\"中华H530\"},{\"I\":3530,\"N\":\"中华V3\"},{\"I\":2294,\"N\":\"中华V5\"},{\"I\":4498,\"N\":\"中华V6\"},{\"I\":4503,\"N\":\"中华V7\"},{\"I\":2999,\"N\":\"中华H220(停售)\"},{\"I\":2770,\"N\":\"中华H230(停售)\"},{\"I\":2857,\"N\":\"中华H320(停售)\"},{\"I\":2998,\"N\":\"中华H330(停售)\"},{\"I\":411,\"N\":\"中华骏捷(停售)\"},{\"I\":860,\"N\":\"中华骏捷Cross(停售)\"},{\"I\":523,\"N\":\"中华骏捷FRV(停售)\"},{\"I\":825,\"N\":\"中华骏捷FSV(停售)\"},{\"I\":490,\"N\":\"中华酷宝(停售)\"},{\"I\":3289,\"N\":\"中华豚(停售)\"},{\"I\":130,\"N\":\"中华尊驰(停售)\"}]}]},{\"I\":74,\"N\":\"中兴\",\"L\":\"Z\",\"List\":[{\"I\":433,\"N\":\"广汽中兴\",\"List\":[{\"I\":2658,\"N\":\"中兴C3(停售)\"},{\"I\":3644,\"N\":\"中兴GX3(停售)\"}]},{\"I\":189,\"N\":\"中兴汽车\",\"List\":[{\"I\":2850,\"N\":\"无限\"},{\"I\":627,\"N\":\"无限V3\"},{\"I\":2143,\"N\":\"无限V7\"},{\"I\":4178,\"N\":\"领主\"},{\"I\":2519,\"N\":\"威虎\"},{\"I\":3881,\"N\":\"小老虎\"},{\"I\":2522,\"N\":\"昌铃(停售)\"},{\"I\":2613,\"N\":\"旗舰A9(停售)\"},{\"I\":3215,\"N\":\"威虎G3(停售)\"},{\"I\":2081,\"N\":\"无限V5(停售)\"}]}]},{\"I\":94,\"N\":\"众泰\",\"L\":\"Z\",\"List\":[{\"I\":171,\"N\":\"众泰汽车\",\"List\":[{\"I\":3793,\"N\":\"大迈X5\"},{\"I\":4092,\"N\":\"大迈X7\"},{\"I\":3575,\"N\":\"云100\"},{\"I\":3779,\"N\":\"芝麻\"},{\"I\":3529,\"N\":\"众泰E200\"},{\"I\":3899,\"N\":\"众泰SR7\"},{\"I\":4070,\"N\":\"众泰SR9\"},{\"I\":2333,\"N\":\"众泰T300\"},{\"I\":4757,\"N\":\"众泰T300新能源\"},{\"I\":4417,\"N\":\"众泰T500\"},{\"I\":2334,\"N\":\"众泰T600\"},{\"I\":4385,\"N\":\"众泰T600 Coupe\"},{\"I\":3852,\"N\":\"众泰T700\"},{\"I\":4737,\"N\":\"众泰T800\"},{\"I\":2480,\"N\":\"众泰V10\"},{\"I\":4371,\"N\":\"众泰Z360\"},{\"I\":4327,\"N\":\"众泰Z500EV\"},{\"I\":4317,\"N\":\"众泰Z560\"},{\"I\":3627,\"N\":\"众泰Z700\"},{\"I\":4038,\"N\":\"江南T11(停售)\"},{\"I\":2230,\"N\":\"江南TT(停售)\"},{\"I\":558,\"N\":\"众泰2008(停售)\"},{\"I\":663,\"N\":\"众泰5008(停售)\"},{\"I\":708,\"N\":\"众泰M300(停售)\"},{\"I\":2336,\"N\":\"众泰T200(停售)\"},{\"I\":3002,\"N\":\"众泰Z100(停售)\"},{\"I\":2161,\"N\":\"众泰Z200(停售)\"},{\"I\":2171,\"N\":\"众泰Z200HB(停售)\"},{\"I\":2337,\"N\":\"众泰Z300(停售)\"},{\"I\":3425,\"N\":\"众泰Z500(停售)\"}]}]}]}', '2019-03-26 17:40:34', '2019-03-27 14:01:43');
COMMIT;

-- ----------------------------
-- Table structure for xn_car_feedback
-- ----------------------------
DROP TABLE IF EXISTS `xn_car_feedback`;
CREATE TABLE `xn_car_feedback` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `by_userid` int(16) DEFAULT NULL COMMENT '用户id',
  `car_frame_number` varchar(64) DEFAULT NULL COMMENT '车架号',
  `car_brand_name` varchar(64) DEFAULT NULL COMMENT '品牌名称',
  `child_car_brand_name` varchar(64) DEFAULT NULL COMMENT '子品牌',
  `car_system_name` varchar(64) DEFAULT NULL COMMENT '车系名称',
  `car_year` varchar(64) DEFAULT NULL COMMENT '年款',
  `car_type_name` varchar(64) DEFAULT NULL COMMENT '车型名称',
  `car_displacement` double(16,0) DEFAULT NULL COMMENT '汽车排量',
  `time` timestamp NULL DEFAULT NULL COMMENT '时间',
  `is_read` int(2) DEFAULT NULL COMMENT '是否已读 1 未读 2 已读',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xn_car_feedback
-- ----------------------------
BEGIN;
INSERT INTO `xn_car_feedback` VALUES (3, 5, '23434', '24234', '2342', '4234', '234234', '234', 23, '2019-03-28 14:59:36', 2);
COMMIT;

-- ----------------------------
-- Table structure for xn_car_year_check
-- ----------------------------
DROP TABLE IF EXISTS `xn_car_year_check`;
CREATE TABLE `xn_car_year_check` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `value` text COMMENT '年检说明',
  `time` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xn_car_year_check
-- ----------------------------
BEGIN;
INSERT INTO `xn_car_year_check` VALUES (1, '<p>新车六年免检介绍</p><p>&nbsp; &nbsp;1.足不出户办理六年免检车辆检验合格标志申领服务</p><p>&nbsp; &nbsp;2.支持全国地市</p><p>&nbsp; &nbsp;3.智能分析年检类型和车检倒计时</p><p>&nbsp; &nbsp;4.免预约、免排队、免邮费</p><p><br/></p><p>办理须知</p><p>&nbsp; &nbsp;1.车辆注册时间在2015-01-02~至今之间的车辆;</p><p>&nbsp; &nbsp;2.车辆无未处理的道路交通安全违法行为和交通事故;</p><p>&nbsp; &nbsp;3.7座以下（不含7座）的非营运蓝牌或新能源轿车；</p><p>&nbsp; &nbsp;<span style=\"color: rgb(14, 23, 38); font-family: &quot;PingFang SC&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Source Han Sans&quot;, &quot;Noto Sans CJK Sc&quot;, &quot;Microsoft YaHei&quot;, &quot;Microsoft Jhenghei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(244, 247, 253);\">4.有效期的交强险，已缴纳本年度车船税或提供免税凭证；</span></p><p><span style=\"color: rgb(14, 23, 38); font-family: &quot;PingFang SC&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Source Han Sans&quot;, &quot;Noto Sans CJK Sc&quot;, &quot;Microsoft YaHei&quot;, &quot;Microsoft Jhenghei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(244, 247, 253);\">&nbsp; &nbsp;&nbsp;<span style=\"color: rgb(14, 23, 38); font-family: &quot;PingFang SC&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Source Han Sans&quot;, &quot;Noto Sans CJK Sc&quot;, &quot;Microsoft YaHei&quot;, &quot;Microsoft Jhenghei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(244, 247, 253);\">5.车辆检验有效期在90天内；</span></span></p><p><span style=\"color: rgb(14, 23, 38); font-family: &quot;PingFang SC&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Source Han Sans&quot;, &quot;Noto Sans CJK Sc&quot;, &quot;Microsoft YaHei&quot;, &quot;Microsoft Jhenghei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(244, 247, 253);\"><span style=\"color: rgb(14, 23, 38); font-family: &quot;PingFang SC&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Source Han Sans&quot;, &quot;Noto Sans CJK Sc&quot;, &quot;Microsoft YaHei&quot;, &quot;Microsoft Jhenghei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(244, 247, 253);\">&nbsp; &nbsp; 6.车辆未发生过造成人员伤亡的交通事故。</span></span></p><p><span style=\"color: rgb(14, 23, 38); font-family: &quot;PingFang SC&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Source Han Sans&quot;, &quot;Noto Sans CJK Sc&quot;, &quot;Microsoft YaHei&quot;, &quot;Microsoft Jhenghei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(244, 247, 253);\"><span style=\"color: rgb(14, 23, 38); font-family: &quot;PingFang SC&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Source Han Sans&quot;, &quot;Noto Sans CJK Sc&quot;, &quot;Microsoft YaHei&quot;, &quot;Microsoft Jhenghei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(244, 247, 253);\">&nbsp; &nbsp;&nbsp;<span style=\"color: rgb(14, 23, 38); font-family: &quot;PingFang SC&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Source Han Sans&quot;, &quot;Noto Sans CJK Sc&quot;, &quot;Microsoft YaHei&quot;, &quot;Microsoft Jhenghei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(244, 247, 253);\">注：车辆办理年检期间请勿上路，若发生违章或车辆异常\n导致办理失败，恕不做退款。</span></span></span></p><p><span style=\"color: rgb(14, 23, 38); font-family: &quot;PingFang SC&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Source Han Sans&quot;, &quot;Noto Sans CJK Sc&quot;, &quot;Microsoft YaHei&quot;, &quot;Microsoft Jhenghei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(244, 247, 253);\"><span style=\"color: rgb(14, 23, 38); font-family: &quot;PingFang SC&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Source Han Sans&quot;, &quot;Noto Sans CJK Sc&quot;, &quot;Microsoft YaHei&quot;, &quot;Microsoft Jhenghei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(244, 247, 253);\"><span style=\"color: rgb(14, 23, 38); font-family: &quot;PingFang SC&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Hiragino Sans GB&quot;, &quot;Source Han Sans&quot;, &quot;Noto Sans CJK Sc&quot;, &quot;Microsoft YaHei&quot;, &quot;Microsoft Jhenghei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(244, 247, 253);\"><br/></span></span></span></p><p>常见问题</p><p>&nbsp; &nbsp;逾期未办理车辆免检有什么后果？</p><p>&nbsp; &nbsp;逾期未年检的车辆上路，安交规将处以扣3分，罚200元及扣车</p><p>&nbsp; &nbsp;的车费；如遇交通意外，保险公司可以不予理赔；超过三个年</p><p>&nbsp; &nbsp;检周期未年检的，车辆将强制报废。</p><p><br/></p><p>&nbsp; &nbsp;可以提前办理年检吗？逾期能补办理吗？</p><p>&nbsp; &nbsp;年检到期前3个月可办理年检（含到期当日），逾期一年内可办</p><p>&nbsp; &nbsp;理。</p><p><br/></p><p>&nbsp; &nbsp;办理年检需要多久？</p><p>&nbsp; &nbsp;资料审核无误后10个工作日内办结，如果车辆有违章、资料有</p><p>&nbsp; &nbsp;误、或其他车辆问题会影响到办理进度。</p><p>&nbsp;&nbsp;</p>', '2019-03-30 19:46:24');
COMMIT;

-- ----------------------------
-- Table structure for xn_common_problem
-- ----------------------------
DROP TABLE IF EXISTS `xn_common_problem`;
CREATE TABLE `xn_common_problem` (
  `id` int(16) NOT NULL AUTO_INCREMENT COMMENT '1 常见问题 2 油卡充值',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `value` text COMMENT '内容',
  `time` timestamp NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xn_common_problem
-- ----------------------------
BEGIN;
INSERT INTO `xn_common_problem` VALUES (1, NULL, '<p>Q：你们的商品是正品么？<br/></p><p>A：电商移动端所售的商品都是正品，和专卖店销售的一样的，请您放心～</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p>Q：你们的商品是正品么？<br/></p><p>A：电商移动端所售的商品都是正品，和专卖店销售的一样的，请您放心～</p><p><br/></p><p>Q：你们的商品是正品么？<br/></p><p>A：电商移动端所售的商品都是正品，和专卖店销售的一样的，请您放心～</p><p><br/></p><p>Q：你们的商品是正品么？<br/></p><p>A：电商移动端所售的商品都是正品，和专卖店销售的一样的，请您放心～</p><p><br/></p><p>Q：你们的商品是正品么？<br/></p><p>A：电商移动端所售的商品都是正品，和专卖店销售的一样的，请您放心～</p><p><br/></p>', '2019-03-30 17:58:30');
INSERT INTO `xn_common_problem` VALUES (2, '注意事项', '<p>1、不支持副卡、不记名卡、过期卡、中石油司机卡、BP卡；</p><p>2、充值完成后，请在加油前到加油站进行圈存；</p><p>3、不支持副卡、不记名卡、过期卡、中石油司机卡、BP卡；</p><p>4、充值完成后，请在加油前到加油站进行圈存；</p>', '2019-03-28 21:43:16');
INSERT INTO `xn_common_problem` VALUES (3, NULL, '<p style=\"white-space: normal;\">在开启震动功能前请您仔细阅读并理解本声明。您可以</p><p style=\"white-space: normal;\">取消使用本功能，但是如果您使用振动监控功能，您的</p><p style=\"white-space: normal;\">使用行为将被视为对本声明的全部认可。</p><p style=\"white-space: normal;\">1、震动监控功能是由智能盒提供的对智能盒硬件震动</p><p style=\"white-space: normal;\">的监控功能，在监测到硬件震动的情况下对使用该硬件</p><p style=\"white-space: normal;\">的用户提供软件提醒和短信告知的功能。</p><p style=\"white-space: normal;\">2、受限于各种客观原因，智能盒的监控功能都可能受</p><p style=\"white-space: normal;\">到影响，包括但不限于：</p><p style=\"white-space: normal;\">1、环境因素影响。包括天气、温度等。</p><p style=\"white-space: normal;\">2、车辆状况影响。包括车辆结构稳定性，智能盒安</p><p style=\"white-space: normal;\">装位置平整度等。</p><p style=\"white-space: normal;\">3、信号影响。隧道、大桥、地下停车场等信号弱的</p><p style=\"white-space: normal;\">地方。</p><p style=\"white-space: normal;\">4、意外损坏或拔出。由于碰撞或者其他第三方原因</p><p style=\"white-space: normal;\">导致的智能盒损坏或拔出等。</p><p style=\"white-space: normal;\">3、由于实际情况的不确定性，任何情况下，智能盒都</p><p style=\"white-space: normal;\">不能保证监测到硬件所有的异常震动，因此也不接受任</p><p style=\"white-space: normal;\">何因为没有监测到异常震动而产生的用户索赔、要求或</p><p style=\"white-space: normal;\">损失补偿。</p><p><br/></p>', '2019-04-08 17:59:49');
COMMIT;

-- ----------------------------
-- Table structure for xn_driver_license
-- ----------------------------
DROP TABLE IF EXISTS `xn_driver_license`;
CREATE TABLE `xn_driver_license` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `user_id` int(16) DEFAULT NULL,
  `driver_name` varchar(128) DEFAULT NULL,
  `driver_license_number` varchar(255) DEFAULT NULL,
  `file_number` varchar(255) DEFAULT NULL,
  `first_receipt_time` timestamp NULL DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xn_driver_license
-- ----------------------------
BEGIN;
INSERT INTO `xn_driver_license` VALUES (2, 5, 'qsd122', '2wd2e', '112dd', '2019-03-29 00:00:00', '2019-03-29 19:16:45');
INSERT INTO `xn_driver_license` VALUES (3, 5, '123', '123', '1231', '2017-01-28 00:00:00', '2019-03-29 19:39:14');
INSERT INTO `xn_driver_license` VALUES (4, 8, '廖', 'rti467744', 'eue56833778', NULL, '2019-04-01 00:56:33');
INSERT INTO `xn_driver_license` VALUES (5, 9, '廖道俊', '440882199810206993', '440801066691', NULL, '2019-04-01 01:04:18');
INSERT INTO `xn_driver_license` VALUES (6, 9, '廖道俊', '440882199810206993', '440801066691', NULL, '2019-04-01 01:04:18');
INSERT INTO `xn_driver_license` VALUES (26, 9, '廖道俊', '440882199810206993', '440801066691', '2018-01-01 00:00:00', '2019-04-03 17:04:38');
INSERT INTO `xn_driver_license` VALUES (27, 9, '廖道俊', '440882199810206993', '440801066691', '2018-01-01 00:00:00', '2019-04-03 17:04:38');
INSERT INTO `xn_driver_license` VALUES (28, 9, '廖道俊', '440882199810206993', '440801066691', '2018-01-01 00:00:00', '2019-04-03 17:04:38');
INSERT INTO `xn_driver_license` VALUES (29, 9, '廖道俊', '440882199810206993', '440801066691', '2018-01-01 00:00:00', '2019-04-03 17:04:38');
INSERT INTO `xn_driver_license` VALUES (30, 9, '廖道俊', '440882199810206993', '440801066691', '2018-01-01 00:00:00', '2019-04-03 17:04:38');
INSERT INTO `xn_driver_license` VALUES (31, 9, '廖道俊', '440882199810206993', '440801066691', '2018-01-01 00:00:00', '2019-04-03 17:04:38');
COMMIT;

-- ----------------------------
-- Table structure for xn_emergency_rescue
-- ----------------------------
DROP TABLE IF EXISTS `xn_emergency_rescue`;
CREATE TABLE `xn_emergency_rescue` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) DEFAULT NULL COMMENT '紧急救援顶部图片',
  `service_desc` text COMMENT '服务说明',
  `rescue_service_desc` text COMMENT '救援服务说明',
  `time` timestamp NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xn_emergency_rescue
-- ----------------------------
BEGIN;
INSERT INTO `xn_emergency_rescue` VALUES (1, '../upload_file/19/03/30/1553945955362__Juxing5.png', '<p>1、救援服务首次开通后需要通过48小时审核后才能正式生</p><p>效，在审核中不提供救援服务。</p><p>2、救援服务开通时需要填写相关车辆信息，救援服务也仅</p><p>对此车辆生效，如果后续修改了车辆信息，则会再次进入</p><p>48小时审核，审核过程中同样不提供救援服务。</p><p><br/></p>', '<p>一、接电服务：车辆因电力不足无法启动时，救援中心帮助接电启动。</p><p>二、紧急加水：车辆在道路行驶过程中如水箱缺水，救援中心可负责免费加水。</p><p>三、更换轮胎：车辆在道路行驶过程中，如因爆胎而无法行驶，救援中心可帮助更换车胎，但完好的备用车胎需由申请人提供。</p><p>四、现场抢险：车辆在道路行驶中发生故障，如属于不需专门检修条件、工具，仅需简单更换配件的故障，救援中心负责现场抢险，但更换配件所产生的购置费用需由申请人承担。</p><p>五、拖车牵引：车辆因故障无法行驶的，救援中心帮助将车辆拖救至申请人指定维修地点。拖车起点不能为车辆维修单位，拖车终点只能为维修企业，免费拖车不超过100KM，超出100KM后所产生的救援费用需由申请人承担。</p><p>六、吊装救援：车辆因故障无法行驶的，救援中心帮助将车辆吊装至专业运输工具，运至申请人指定维修地点，拖车起点不能为车辆维修单位，拖车终点只能为维修企业，免费拖车不超过100KM，超出100KM后所产生的救援费用需由申请人承担。</p><p><br/></p>', '2019-03-30 19:39:43');
COMMIT;

-- ----------------------------
-- Table structure for xn_feedback
-- ----------------------------
DROP TABLE IF EXISTS `xn_feedback`;
CREATE TABLE `xn_feedback` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `by_userid` int(16) DEFAULT NULL COMMENT '用户id ',
  `content` varchar(1024) DEFAULT NULL COMMENT '反馈内容 ',
  `contact_information` varchar(64) DEFAULT NULL COMMENT '联系方式（电话 / 邮箱）',
  `time` timestamp NULL DEFAULT NULL COMMENT '时间 ',
  `is_read` int(2) DEFAULT NULL COMMENT '是否已读 1 未读 2 已读 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xn_feedback
-- ----------------------------
BEGIN;
INSERT INTO `xn_feedback` VALUES (1, 3, '111121312312222222222222222222222222222222222222222222223444444444444444444444444444444444442222222222222222222222222222225555555555555555555553333333333333333333333333333366666666666666666666666666644444444444444444444444', '123123123', '2019-04-09 09:37:28', 2);
INSERT INTO `xn_feedback` VALUES (3, 5, '11222144vcgbhvbbjddfDFXDDFDfdfdfxxzz00ds0000fhjkdshf16', '232342999', '2019-03-26 14:01:52', 1);
INSERT INTO `xn_feedback` VALUES (4, 5, '12223dfsfsddf2345fsdfsfsdfsssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss00160016001600160016001600160016001600160016001600160016001600160016001600160016001600160016001600160016001600160016001600160016001600160', '3', '2019-03-26 14:18:39', 2);
INSERT INTO `xn_feedback` VALUES (5, 5, '6576', '5675', '2019-03-28 15:00:00', 1);
INSERT INTO `xn_feedback` VALUES (6, 9, '测试反馈', '1372888888888', '2019-03-28 21:40:49', 1);
INSERT INTO `xn_feedback` VALUES (7, 9, '测试反馈3、39', '1234567890', '2019-03-29 14:27:13', 1);
INSERT INTO `xn_feedback` VALUES (8, 9, '测试反馈3、39', '1234567890', '2019-03-30 17:57:51', 2);
INSERT INTO `xn_feedback` VALUES (9, 5, '扫二维码', '138965', '2019-04-01 09:37:41', 1);
INSERT INTO `xn_feedback` VALUES (10, 10, 'ttt', '15602901970', '2019-04-02 19:43:07', 1);
INSERT INTO `xn_feedback` VALUES (11, 9, '电饭锅', 'etyu', '2019-04-09 09:39:53', 2);
COMMIT;

-- ----------------------------
-- Table structure for xn_home_carousel_map
-- ----------------------------
DROP TABLE IF EXISTS `xn_home_carousel_map`;
CREATE TABLE `xn_home_carousel_map` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `image` varchar(1024) DEFAULT NULL COMMENT '图片',
  `order_by` int(8) DEFAULT NULL COMMENT '排序',
  `state` int(4) DEFAULT NULL COMMENT '1 不跳转  2 跳转到商品详情 ',
  `product_id` int(16) DEFAULT NULL COMMENT '要跳转商品id   ，当state=2时候有值， ',
  `time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xn_home_carousel_map
-- ----------------------------
BEGIN;
INSERT INTO `xn_home_carousel_map` VALUES (6, '../upload_file/19/03/30/1553945612184__590aaf76361fd.png', 1, 1, 56, '2019-03-30 19:33:55');
COMMIT;

-- ----------------------------
-- Table structure for xn_notice
-- ----------------------------
DROP TABLE IF EXISTS `xn_notice`;
CREATE TABLE `xn_notice` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `user_id` int(16) DEFAULT NULL,
  `type` int(16) DEFAULT NULL,
  `is_read` int(2) DEFAULT NULL,
  `content` text,
  `is_del` int(2) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xn_notice
-- ----------------------------
BEGIN;
INSERT INTO `xn_notice` VALUES (172, 5, 5, 1, '您好，您的车辆到了保险时间', 1, '2019-03-29 14:38:36', '2019-03-29 14:38:36');
INSERT INTO `xn_notice` VALUES (173, 1, 1, 0, '6', 0, '2019-03-29 14:38:36', '2019-03-29 14:38:36');
INSERT INTO `xn_notice` VALUES (174, 1, 1, 0, '6', 0, '2019-03-29 14:38:36', '2019-03-29 14:38:36');
INSERT INTO `xn_notice` VALUES (175, 1, 1, 0, '6', 0, '2019-03-29 14:38:36', '2019-03-29 14:38:36');
INSERT INTO `xn_notice` VALUES (176, 1, 1, 0, '6', 0, '2019-03-29 14:38:36', '2019-03-29 14:38:36');
INSERT INTO `xn_notice` VALUES (177, 1, 1, 0, '6', 0, '2019-03-29 14:38:36', '2019-03-29 14:38:36');
INSERT INTO `xn_notice` VALUES (178, 1, 1, 0, '6', 0, '2019-03-29 14:38:36', '2019-03-29 14:38:36');
INSERT INTO `xn_notice` VALUES (179, 1, 1, 0, '6', 0, '2019-03-29 14:38:36', '2019-03-29 14:38:36');
INSERT INTO `xn_notice` VALUES (180, 2, 1, 0, '5', 0, '2019-03-29 14:38:36', '2019-03-29 14:38:36');
INSERT INTO `xn_notice` VALUES (181, 2, 1, 0, '5', 0, '2019-03-29 14:38:36', '2019-03-29 14:38:36');
INSERT INTO `xn_notice` VALUES (182, 2, 1, 0, '5', 0, '2019-03-29 14:38:36', '2019-03-29 14:38:36');
INSERT INTO `xn_notice` VALUES (183, 2, 1, 0, '5', 0, '2019-03-29 14:38:36', '2019-03-29 14:38:36');
INSERT INTO `xn_notice` VALUES (184, 2, 1, 0, '5', 0, '2019-03-29 14:38:36', '2019-03-29 14:38:36');
INSERT INTO `xn_notice` VALUES (185, 2, 1, 0, '5', 0, '2019-03-29 14:38:36', '2019-03-29 14:38:36');
INSERT INTO `xn_notice` VALUES (186, 2, 1, 0, '5', 0, '2019-03-29 14:38:36', '2019-03-29 14:38:36');
INSERT INTO `xn_notice` VALUES (187, 3, 1, 0, '3', 0, '2019-03-29 14:38:36', '2019-03-29 14:38:36');
INSERT INTO `xn_notice` VALUES (188, 3, 1, 0, '3', 0, '2019-03-29 14:38:36', '2019-03-29 14:38:36');
INSERT INTO `xn_notice` VALUES (189, 3, 1, 0, '3', 0, '2019-03-29 14:38:36', '2019-03-29 14:38:36');
INSERT INTO `xn_notice` VALUES (190, 3, 1, 0, '3', 0, '2019-03-29 14:38:36', '2019-03-29 14:38:36');
INSERT INTO `xn_notice` VALUES (191, 3, 1, 0, '3', 0, '2019-03-29 14:38:36', '2019-03-29 14:38:36');
INSERT INTO `xn_notice` VALUES (192, 3, 1, 0, '3', 0, '2019-03-29 14:38:36', '2019-03-29 14:38:36');
INSERT INTO `xn_notice` VALUES (193, 3, 1, 0, '3', 0, '2019-03-29 14:38:36', '2019-03-29 14:38:36');
INSERT INTO `xn_notice` VALUES (194, 5, 1, 1, '4', 0, '2019-03-29 14:38:36', '2019-03-29 14:38:36');
INSERT INTO `xn_notice` VALUES (195, 5, 1, 1, '4', 0, '2019-03-29 14:38:36', '2019-03-29 14:38:36');
INSERT INTO `xn_notice` VALUES (196, 5, 1, 1, '4', 0, '2019-03-29 14:38:36', '2019-03-29 14:38:36');
INSERT INTO `xn_notice` VALUES (197, 5, 1, 1, '4', 0, '2019-03-29 14:38:36', '2019-03-29 14:38:36');
INSERT INTO `xn_notice` VALUES (198, 5, 1, 1, '4', 0, '2019-03-29 14:38:36', '2019-03-29 14:38:36');
INSERT INTO `xn_notice` VALUES (199, 5, 1, 1, '4', 0, '2019-03-29 14:38:36', '2019-03-29 14:38:36');
INSERT INTO `xn_notice` VALUES (200, 5, 1, 1, '4', 0, '2019-03-29 14:38:36', '2019-03-29 14:38:36');
INSERT INTO `xn_notice` VALUES (201, 1, 1, 0, '7', 0, '2019-03-29 14:43:36', '2019-03-29 14:43:36');
INSERT INTO `xn_notice` VALUES (202, 1, 1, 0, '7', 0, '2019-03-29 14:43:36', '2019-03-29 14:43:36');
INSERT INTO `xn_notice` VALUES (203, 1, 1, 0, '7', 0, '2019-03-29 14:43:36', '2019-03-29 14:43:36');
INSERT INTO `xn_notice` VALUES (204, 1, 1, 0, '7', 0, '2019-03-29 14:43:36', '2019-03-29 14:43:36');
INSERT INTO `xn_notice` VALUES (205, 1, 1, 0, '7', 0, '2019-03-29 14:43:36', '2019-03-29 14:43:36');
INSERT INTO `xn_notice` VALUES (206, 1, 1, 0, '7', 0, '2019-03-29 14:43:36', '2019-03-29 14:43:36');
INSERT INTO `xn_notice` VALUES (207, 10, 1, 1, '7', 0, '2019-03-29 14:43:36', '2019-03-29 14:43:36');
INSERT INTO `xn_notice` VALUES (208, 5, 5, 1, '您好，您的车辆到了保险时间', 1, '2019-03-29 15:17:33', '2019-03-29 15:17:33');
INSERT INTO `xn_notice` VALUES (209, 5, 5, 1, '您好，您的车辆到了保险时间', 1, '2019-03-29 15:20:18', '2019-03-29 15:20:18');
INSERT INTO `xn_notice` VALUES (210, 5, 5, 1, '您好，您的车辆到了保险时间', 1, '2019-03-29 15:24:11', '2019-03-29 15:24:11');
INSERT INTO `xn_notice` VALUES (211, 5, 5, 1, '您好，您的车辆到了保险时间', 1, '2019-03-29 16:48:03', '2019-03-29 16:48:03');
INSERT INTO `xn_notice` VALUES (212, 5, 5, 1, '您好，您的车辆到了保险时间', 1, '2019-03-29 17:01:01', '2019-03-29 17:01:01');
INSERT INTO `xn_notice` VALUES (213, 5, 5, 1, '您好，您的车辆到了保险时间', 1, '2019-03-29 19:20:06', '2019-03-29 19:20:06');
INSERT INTO `xn_notice` VALUES (214, 5, 5, 1, '您好，您的车辆到了保险时间', 1, '2019-03-29 19:24:09', '2019-03-29 19:24:09');
INSERT INTO `xn_notice` VALUES (215, 5, 5, 1, '您好，您的车辆到了保险时间', 1, '2019-03-29 20:10:11', '2019-03-29 20:10:11');
INSERT INTO `xn_notice` VALUES (216, 10, 5, 1, '您好，您的车辆到了保险时间', 0, '2019-03-29 21:06:44', '2019-03-29 21:06:44');
INSERT INTO `xn_notice` VALUES (217, 10, 1, 1, '7', 0, '2019-03-29 14:43:36', '2019-03-29 14:43:36');
INSERT INTO `xn_notice` VALUES (218, 10, 2, 1, '212', 1, '2019-03-29 15:17:33', '2019-03-29 15:17:33');
INSERT INTO `xn_notice` VALUES (219, 10, 5, 1, '您好，您的车辆到了保险时间', 0, '2019-03-29 15:20:18', '2019-03-29 15:20:18');
INSERT INTO `xn_notice` VALUES (220, 10, 5, 1, '您好，您的车辆到了保险时间', 0, '2019-03-29 15:24:11', '2019-03-29 15:24:11');
INSERT INTO `xn_notice` VALUES (221, 5, 5, 1, '您好，您的车辆到了保险时间', 1, '2019-03-29 21:30:03', '2019-03-29 21:30:03');
INSERT INTO `xn_notice` VALUES (222, 1, 1, 0, '7', 0, '2019-03-29 21:35:03', '2019-03-29 21:35:03');
INSERT INTO `xn_notice` VALUES (223, 1, 1, 0, '7', 0, '2019-03-29 21:35:03', '2019-03-29 21:35:03');
INSERT INTO `xn_notice` VALUES (224, 1, 1, 0, '7', 0, '2019-03-29 21:35:03', '2019-03-29 21:35:03');
INSERT INTO `xn_notice` VALUES (225, 1, 1, 0, '7', 0, '2019-03-29 21:35:03', '2019-03-29 21:35:03');
INSERT INTO `xn_notice` VALUES (226, 1, 1, 0, '7', 0, '2019-03-29 21:35:03', '2019-03-29 21:35:03');
INSERT INTO `xn_notice` VALUES (227, 1, 1, 0, '7', 0, '2019-03-29 21:35:03', '2019-03-29 21:35:03');
INSERT INTO `xn_notice` VALUES (228, 1, 1, 0, '7', 0, '2019-03-29 21:35:03', '2019-03-29 21:35:03');
INSERT INTO `xn_notice` VALUES (229, 2, 1, 0, '6', 0, '2019-03-29 21:35:03', '2019-03-29 21:35:03');
INSERT INTO `xn_notice` VALUES (230, 2, 1, 0, '6', 0, '2019-03-29 21:35:03', '2019-03-29 21:35:03');
INSERT INTO `xn_notice` VALUES (231, 2, 1, 0, '6', 0, '2019-03-29 21:35:03', '2019-03-29 21:35:03');
INSERT INTO `xn_notice` VALUES (232, 2, 1, 0, '6', 0, '2019-03-29 21:35:03', '2019-03-29 21:35:03');
INSERT INTO `xn_notice` VALUES (233, 2, 1, 0, '6', 0, '2019-03-29 21:35:03', '2019-03-29 21:35:03');
INSERT INTO `xn_notice` VALUES (234, 2, 1, 0, '6', 0, '2019-03-29 21:35:03', '2019-03-29 21:35:03');
INSERT INTO `xn_notice` VALUES (235, 2, 1, 0, '6', 0, '2019-03-29 21:35:03', '2019-03-29 21:35:03');
INSERT INTO `xn_notice` VALUES (236, 3, 1, 0, '5', 0, '2019-03-29 21:35:03', '2019-03-29 21:35:03');
INSERT INTO `xn_notice` VALUES (237, 3, 1, 0, '5', 0, '2019-03-29 21:35:03', '2019-03-29 21:35:03');
INSERT INTO `xn_notice` VALUES (238, 3, 1, 0, '5', 0, '2019-03-29 21:35:03', '2019-03-29 21:35:03');
INSERT INTO `xn_notice` VALUES (239, 3, 1, 0, '5', 0, '2019-03-29 21:35:03', '2019-03-29 21:35:03');
INSERT INTO `xn_notice` VALUES (240, 3, 1, 0, '5', 0, '2019-03-29 21:35:03', '2019-03-29 21:35:03');
INSERT INTO `xn_notice` VALUES (241, 3, 1, 0, '5', 0, '2019-03-29 21:35:03', '2019-03-29 21:35:03');
INSERT INTO `xn_notice` VALUES (242, 3, 1, 0, '5', 0, '2019-03-29 21:35:03', '2019-03-29 21:35:03');
INSERT INTO `xn_notice` VALUES (243, 5, 1, 1, '4', 0, '2019-03-29 21:35:03', '2019-03-29 21:35:03');
INSERT INTO `xn_notice` VALUES (244, 5, 1, 1, '4', 0, '2019-03-29 21:35:03', '2019-03-29 21:35:03');
INSERT INTO `xn_notice` VALUES (245, 5, 1, 1, '4', 0, '2019-03-29 21:35:03', '2019-03-29 21:35:03');
INSERT INTO `xn_notice` VALUES (246, 5, 1, 1, '4', 0, '2019-03-29 21:35:03', '2019-03-29 21:35:03');
INSERT INTO `xn_notice` VALUES (247, 5, 1, 1, '4', 0, '2019-03-29 21:35:03', '2019-03-29 21:35:03');
INSERT INTO `xn_notice` VALUES (248, 5, 1, 1, '4', 0, '2019-03-29 21:35:03', '2019-03-29 21:35:03');
INSERT INTO `xn_notice` VALUES (249, 5, 1, 1, '4', 0, '2019-03-29 21:35:03', '2019-03-29 21:35:03');
INSERT INTO `xn_notice` VALUES (250, 5, 5, 1, '您好，您的车辆到了保险时间', 1, '2019-03-29 21:37:24', '2019-03-29 21:37:24');
INSERT INTO `xn_notice` VALUES (251, 1, 1, 0, '3', 0, '2019-03-29 21:42:24', '2019-03-29 21:42:24');
INSERT INTO `xn_notice` VALUES (252, 1, 1, 0, '3', 0, '2019-03-29 21:42:24', '2019-03-29 21:42:24');
INSERT INTO `xn_notice` VALUES (253, 1, 1, 0, '3', 0, '2019-03-29 21:42:24', '2019-03-29 21:42:24');
INSERT INTO `xn_notice` VALUES (254, 1, 1, 0, '3', 0, '2019-03-29 21:42:24', '2019-03-29 21:42:24');
INSERT INTO `xn_notice` VALUES (255, 1, 1, 0, '3', 0, '2019-03-29 21:42:24', '2019-03-29 21:42:24');
INSERT INTO `xn_notice` VALUES (256, 1, 1, 0, '3', 0, '2019-03-29 21:42:24', '2019-03-29 21:42:24');
INSERT INTO `xn_notice` VALUES (257, 1, 1, 0, '3', 0, '2019-03-29 21:42:24', '2019-03-29 21:42:24');
INSERT INTO `xn_notice` VALUES (258, 5, 5, 1, '您好，您的车辆到了保险时间', 1, '2019-03-29 21:44:17', '2019-03-29 21:44:17');
INSERT INTO `xn_notice` VALUES (259, 5, 5, 1, '您好，您的车辆到了保险时间', 1, '2019-03-29 21:44:48', '2019-03-29 21:44:48');
INSERT INTO `xn_notice` VALUES (260, 1, 1, 0, '7', 0, '2019-03-29 21:44:48', '2019-03-29 21:44:48');
INSERT INTO `xn_notice` VALUES (261, 2, 1, 0, '7', 0, '2019-03-29 21:44:48', '2019-03-29 21:44:48');
INSERT INTO `xn_notice` VALUES (262, 3, 1, 0, '7', 0, '2019-03-29 21:44:48', '2019-03-29 21:44:48');
INSERT INTO `xn_notice` VALUES (263, 5, 1, 1, '7', 0, '2019-03-29 21:44:48', '2019-03-29 21:44:48');
INSERT INTO `xn_notice` VALUES (264, 8, 1, 1, '7', 0, '2019-03-29 21:44:48', '2019-03-29 21:44:48');
INSERT INTO `xn_notice` VALUES (265, 9, 1, 0, '7', 0, '2019-03-29 21:44:48', '2019-03-29 21:44:48');
INSERT INTO `xn_notice` VALUES (266, 10, 1, 1, '7', 0, '2019-03-29 21:44:48', '2019-03-29 21:44:48');
INSERT INTO `xn_notice` VALUES (267, 5, 5, 1, '您好，您的车辆到了保险时间', 1, '2019-03-30 15:18:52', '2019-03-30 15:18:52');
INSERT INTO `xn_notice` VALUES (268, 5, 5, 1, '您好，您的车辆到了保险时间', 1, '2019-03-30 15:52:08', '2019-03-30 15:52:08');
INSERT INTO `xn_notice` VALUES (269, 5, 5, 1, '您好，您的车辆到了保险时间', 1, '2019-03-30 15:53:33', '2019-03-30 15:53:33');
INSERT INTO `xn_notice` VALUES (270, 5, 5, 1, '您好，您的车辆到了保险时间', 1, '2019-03-30 15:55:42', '2019-03-30 15:55:42');
INSERT INTO `xn_notice` VALUES (271, 5, 5, 1, '您好，您的车辆到了保险时间', 1, '2019-03-30 16:13:48', '2019-03-30 16:13:48');
INSERT INTO `xn_notice` VALUES (272, 5, 5, 1, '您好，您的车辆到了保险时间', 1, '2019-03-30 16:24:08', '2019-03-30 16:24:08');
INSERT INTO `xn_notice` VALUES (273, 5, 5, 1, '您好，您的车辆到了保险时间', 1, '2019-03-30 16:44:19', '2019-03-30 16:44:19');
INSERT INTO `xn_notice` VALUES (274, 5, 5, 1, '您好，您的车辆到了保险时间', 1, '2019-03-30 17:27:32', '2019-03-30 17:27:32');
INSERT INTO `xn_notice` VALUES (275, 5, 5, 1, '您好，您的车辆到了保险时间', 1, '2019-03-30 17:48:13', '2019-03-30 17:48:13');
INSERT INTO `xn_notice` VALUES (276, 5, 5, 1, '您好，您的车辆到了保险时间', 1, '2019-03-30 18:15:49', '2019-03-30 18:15:49');
INSERT INTO `xn_notice` VALUES (277, 5, 5, 1, '您好，您的车辆到了保险时间', 1, '2019-03-30 18:19:43', '2019-03-30 18:19:43');
INSERT INTO `xn_notice` VALUES (278, 5, 5, 1, '您好，您的车辆到了保险时间', 1, '2019-03-30 19:02:29', '2019-03-30 19:02:29');
INSERT INTO `xn_notice` VALUES (279, 5, 5, 1, '您好，您的车辆到了保险时间', 1, '2019-03-30 19:59:32', '2019-03-30 19:59:32');
INSERT INTO `xn_notice` VALUES (280, 5, 5, 1, '您好，您的车辆到了保险时间', 1, '2019-03-30 21:54:17', '2019-03-30 21:54:17');
INSERT INTO `xn_notice` VALUES (281, 9, 5, 0, '您好，您的车辆到了保险时间', 0, '2019-04-03 13:53:41', '2019-04-03 13:53:41');
INSERT INTO `xn_notice` VALUES (282, 9, 5, 0, '您好，您的车辆到了保险时间', 0, '2019-04-03 14:20:57', '2019-04-03 14:20:57');
INSERT INTO `xn_notice` VALUES (283, 9, 5, 0, '您好，您的车辆到了保险时间', 0, '2019-04-03 14:24:12', '2019-04-03 14:24:12');
INSERT INTO `xn_notice` VALUES (284, 9, 5, 0, '您好，您的车辆到了保险时间', 0, '2019-04-03 15:14:56', '2019-04-03 15:14:56');
INSERT INTO `xn_notice` VALUES (285, 9, 5, 0, '您好，您的车辆到了保险时间', 0, '2019-04-03 15:34:58', '2019-04-03 15:34:58');
INSERT INTO `xn_notice` VALUES (286, 9, 5, 0, '您好，您的车辆到了保险时间', 0, '2019-04-03 16:20:04', '2019-04-03 16:20:04');
INSERT INTO `xn_notice` VALUES (287, 9, 5, 0, '您好，您的车辆到了保险时间', 0, '2019-04-03 17:01:23', '2019-04-03 17:01:23');
INSERT INTO `xn_notice` VALUES (288, 9, 5, 0, '您好，您的车辆到了保险时间', 0, '2019-04-03 17:55:13', '2019-04-03 17:55:13');
INSERT INTO `xn_notice` VALUES (289, 9, 5, 0, '您好，您的车辆到了保险时间', 0, '2019-04-04 17:55:13', '2019-04-04 17:55:13');
INSERT INTO `xn_notice` VALUES (290, 9, 5, 0, '您好，您的车辆到了保险时间', 0, '2019-04-05 17:55:13', '2019-04-05 17:55:13');
INSERT INTO `xn_notice` VALUES (291, 9, 5, 0, '您好，您的车辆到了保险时间', 0, '2019-04-06 17:55:13', '2019-04-06 17:55:13');
INSERT INTO `xn_notice` VALUES (292, 9, 5, 0, '您好，您的车辆到了保险时间', 0, '2019-04-07 17:55:14', '2019-04-07 17:55:14');
INSERT INTO `xn_notice` VALUES (293, 9, 5, 0, '您好，您的车辆到了保险时间', 0, '2019-04-08 16:36:56', '2019-04-08 16:36:56');
INSERT INTO `xn_notice` VALUES (294, 9, 5, 0, '您好，您的车辆到了保险时间', 0, '2019-04-08 16:39:41', '2019-04-08 16:39:41');
INSERT INTO `xn_notice` VALUES (295, 9, 5, 0, '您好，您的车辆到了保险时间', 0, '2019-04-08 17:12:58', '2019-04-08 17:12:58');
INSERT INTO `xn_notice` VALUES (296, 9, 5, 0, '您好，您的车辆到了保险时间', 0, '2019-04-08 17:16:21', '2019-04-08 17:16:21');
INSERT INTO `xn_notice` VALUES (297, 9, 5, 0, '您好，您的车辆到了保险时间', 0, '2019-04-08 17:43:05', '2019-04-08 17:43:05');
INSERT INTO `xn_notice` VALUES (298, 9, 5, 0, '您好，您的车辆到了保险时间', 0, '2019-04-08 18:10:30', '2019-04-08 18:10:30');
INSERT INTO `xn_notice` VALUES (299, 9, 5, 0, '您好，您的车辆到了保险时间', 0, '2019-04-09 09:30:43', '2019-04-09 09:30:43');
INSERT INTO `xn_notice` VALUES (300, 9, 5, 0, '您好，您的车辆到了保险时间', 0, '2019-04-09 18:10:30', '2019-04-09 18:10:30');
INSERT INTO `xn_notice` VALUES (301, 9, 5, 0, '您好，您的车辆到了保险时间', 0, '2019-04-09 18:59:59', '2019-04-09 18:59:59');
COMMIT;

-- ----------------------------
-- Table structure for xn_oil_card
-- ----------------------------
DROP TABLE IF EXISTS `xn_oil_card`;
CREATE TABLE `xn_oil_card` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `user_id` int(16) DEFAULT NULL,
  `oil_card_type` varchar(64) DEFAULT NULL,
  `oil_card_number` varchar(64) DEFAULT NULL,
  `card_user_name` varchar(64) DEFAULT NULL,
  `card_user_phone` varchar(64) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xn_oil_card
-- ----------------------------
BEGIN;
INSERT INTO `xn_oil_card` VALUES (1, 8, '2', '322343242354', '实打实', '12132130000', '2019-03-28 13:56:06');
INSERT INTO `xn_oil_card` VALUES (2, 10, '1', '11222333', '我', '15602901970', '2019-03-28 20:15:06');
INSERT INTO `xn_oil_card` VALUES (4, 5, '2', '54645123321', 'lemon', '13100231220', '2019-03-29 10:00:21');
INSERT INTO `xn_oil_card` VALUES (5, 9, '1', 'poipoi', 'etuif', '却tuioytrrtym', '2019-04-02 11:35:13');
COMMIT;

-- ----------------------------
-- Table structure for xn_oil_card_record
-- ----------------------------
DROP TABLE IF EXISTS `xn_oil_card_record`;
CREATE TABLE `xn_oil_card_record` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `user_id` int(16) DEFAULT NULL,
  `oil_card_id` int(64) DEFAULT NULL,
  `record_status` int(4) DEFAULT NULL,
  `recharge_price` int(16) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `review_time` timestamp NULL DEFAULT NULL,
  `fail_reason` varchar(512) DEFAULT NULL,
  `is_delete` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xn_oil_card_record
-- ----------------------------
BEGIN;
INSERT INTO `xn_oil_card_record` VALUES (1, 8, 1, 3, 2323, '2019-03-28 14:01:59', '2019-03-28 16:12:36', '测试', 1);
INSERT INTO `xn_oil_card_record` VALUES (2, 10, 2, 1, 101, '2019-03-28 21:51:31', NULL, NULL, 1);
INSERT INTO `xn_oil_card_record` VALUES (3, 10, 2, 1, 101, '2019-03-28 21:54:07', NULL, NULL, 1);
INSERT INTO `xn_oil_card_record` VALUES (4, 5, 4, 3, 100, '2019-03-29 11:06:41', '2019-03-30 17:57:22', '测试', 1);
INSERT INTO `xn_oil_card_record` VALUES (5, 5, 4, 2, 100, '2019-03-29 11:06:54', '2019-04-09 09:36:32', NULL, 1);
INSERT INTO `xn_oil_card_record` VALUES (6, 9, 4, 2, 199, '2019-03-29 11:08:08', '2019-03-30 17:57:11', NULL, 1);
INSERT INTO `xn_oil_card_record` VALUES (7, 9, 4, 2, 345, '2019-03-30 16:55:24', '2019-03-30 17:57:04', NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for xn_oil_card_setting
-- ----------------------------
DROP TABLE IF EXISTS `xn_oil_card_setting`;
CREATE TABLE `xn_oil_card_setting` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xn_oil_card_setting
-- ----------------------------
BEGIN;
INSERT INTO `xn_oil_card_setting` VALUES (1, '1', '100,500,1000', '2019-03-28 10:31:34');
INSERT INTO `xn_oil_card_setting` VALUES (2, '2', '100,500,1000', '2019-03-28 10:32:56');
COMMIT;

-- ----------------------------
-- Table structure for xn_smart_box
-- ----------------------------
DROP TABLE IF EXISTS `xn_smart_box`;
CREATE TABLE `xn_smart_box` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `user_id` int(16) DEFAULT NULL COMMENT '用户id',
  `activation_code` varchar(512) DEFAULT NULL COMMENT '激活码',
  `password` varchar(512) DEFAULT NULL COMMENT '密码',
  `time` timestamp NULL DEFAULT NULL COMMENT '时间',
  `is_del` int(2) DEFAULT NULL COMMENT '解绑 1 未解绑 2已解绑 3已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xn_smart_box
-- ----------------------------
BEGIN;
INSERT INTO `xn_smart_box` VALUES (11, 8, '33333333', '9D3A14C5B161350CD549CBEAD1353F9D', '2019-04-08 17:39:56', 2);
INSERT INTO `xn_smart_box` VALUES (12, 9, '456456456', NULL, '2019-04-08 16:40:00', 1);
INSERT INTO `xn_smart_box` VALUES (14, 8, '567567', NULL, '2019-04-08 18:11:39', 2);
INSERT INTO `xn_smart_box` VALUES (15, 8, '111666', NULL, '2019-04-08 18:11:59', 1);
COMMIT;

-- ----------------------------
-- Table structure for xn_store
-- ----------------------------
DROP TABLE IF EXISTS `xn_store`;
CREATE TABLE `xn_store` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `store_name` varchar(64) DEFAULT NULL COMMENT '门店名称',
  `store_image` text COMMENT '门店图片',
  `store_phone` varchar(64) DEFAULT NULL COMMENT '门店电话',
  `score` int(4) DEFAULT NULL COMMENT '评分  1~5  对应  1~5星',
  `store_address` varchar(255) DEFAULT NULL COMMENT '门店地址',
  `longitude` double(18,6) DEFAULT NULL COMMENT '经度',
  `latitude` double(18,6) DEFAULT NULL COMMENT '纬度',
  `time` datetime DEFAULT NULL COMMENT '创建时间 ',
  `store_type_id` int(16) DEFAULT NULL COMMENT '门店类型id',
  `business_hours` varchar(128) DEFAULT NULL COMMENT '营业时间',
  `completion_time` varchar(128) DEFAULT NULL COMMENT '结业时间',
  `description` text COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xn_store
-- ----------------------------
BEGIN;
INSERT INTO `xn_store` VALUES (3, '班尼路', '../upload_file/19/03/30/1553946488483__2858ca037462643348cc57f83b63caf89f68b6b314106-46PkZR_fw658.png,../upload_file/19/04/01/1554105960199__1553946733887__Tuceng3.png', '13200000000', 2, '广东省深圳市龙华新区龙华街道龙华大厦4A座  3303                         ', 114.405924, 23.076352, '2019-04-01 16:06:06', 1, '08:30', '18:30', '<p>1.使用服务券时，请向商家说明消费项目<br/></p><p>2.服务完成后，点击门店列表上方-【我的服务券】-选择对</p><p>&nbsp; &nbsp;应服务券</p><p>3.使用服务券时，请向商家说明消费项目</p><p>4.服务完成后，点击门店列表上方-【我的服务券】-选择对</p><p>&nbsp; &nbsp;应服务券</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p></p>');
INSERT INTO `xn_store` VALUES (4, '班尼路深圳龙华清湖天虹店', '../upload_file/19/03/30/1553946488483__2858ca037462643348cc57f83b63caf89f68b6b314106-46PkZR_fw658.png,../upload_file/19/04/01/1554105960199__1553946733887__Tuceng3.png', '13200000000', 5, '广东省深圳市龙华新区龙华街道龙华大厦4A座  3303                         ', 114.405924, 23.076352, '2019-04-01 16:06:06', 1, '08:30', '18:30', '<p>1.使用服务券时，请向商家说明消费项目<br/></p><p>2.服务完成后，点击门店列表上方-【我的服务券】-选择对</p><p>&nbsp; &nbsp;应服务券</p><p>3.使用服务券时，请向商家说明消费项目</p><p>4.服务完成后，点击门店列表上方-【我的服务券】-选择对</p><p>&nbsp; &nbsp;应服务券</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p></p>');
INSERT INTO `xn_store` VALUES (5, '班尼路深圳龙华清湖天虹店', '../upload_file/19/03/30/1553946488483__2858ca037462643348cc57f83b63caf89f68b6b314106-46PkZR_fw658.png,../upload_file/19/04/01/1554105960199__1553946733887__Tuceng3.png', '13200000000', 5, '广东省深圳市龙华新区龙华街道龙华大厦4A座  3303                         ', 114.405924, 23.076352, '2019-04-01 16:06:06', 1, '08:30', '18:30', '<p>1.使用服务券时，请向商家说明消费项目<br/></p><p>2.服务完成后，点击门店列表上方-【我的服务券】-选择对</p><p>&nbsp; &nbsp;应服务券</p><p>3.使用服务券时，请向商家说明消费项目</p><p>4.服务完成后，点击门店列表上方-【我的服务券】-选择对</p><p>&nbsp; &nbsp;应服务券</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p></p>');
INSERT INTO `xn_store` VALUES (6, '班尼路深圳龙华清湖天虹店', '../upload_file/19/03/30/1553946488483__2858ca037462643348cc57f83b63caf89f68b6b314106-46PkZR_fw658.png,../upload_file/19/04/01/1554105960199__1553946733887__Tuceng3.png', '13200000000', 5, '广东省深圳市龙华新区龙华街道龙华大厦4A座  3303                         ', 114.405924, 23.076352, '2019-04-01 16:06:06', 1, '08:30', '18:30', '<p>1.使用服务券时，请向商家说明消费项目<br/></p><p>2.服务完成后，点击门店列表上方-【我的服务券】-选择对</p><p>&nbsp; &nbsp;应服务券</p><p>3.使用服务券时，请向商家说明消费项目</p><p>4.服务完成后，点击门店列表上方-【我的服务券】-选择对</p><p>&nbsp; &nbsp;应服务券</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p></p>');
INSERT INTO `xn_store` VALUES (7, '班尼路深圳龙华清湖天虹店', '../upload_file/19/03/30/1553946488483__2858ca037462643348cc57f83b63caf89f68b6b314106-46PkZR_fw658.png,../upload_file/19/04/01/1554105960199__1553946733887__Tuceng3.png', '13200000000', 5, '广东省深圳市龙华新区龙华街道龙华大厦4A座  3303                         ', 114.405924, 23.076352, '2019-04-01 16:06:06', 1, '08:30', '18:30', '<p>1.使用服务券时，请向商家说明消费项目<br/></p><p>2.服务完成后，点击门店列表上方-【我的服务券】-选择对</p><p>&nbsp; &nbsp;应服务券</p><p>3.使用服务券时，请向商家说明消费项目</p><p>4.服务完成后，点击门店列表上方-【我的服务券】-选择对</p><p>&nbsp; &nbsp;应服务券</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p></p>');
INSERT INTO `xn_store` VALUES (9, '班尼路深圳龙华清湖天虹店', '../upload_file/19/03/30/1553946488483__2858ca037462643348cc57f83b63caf89f68b6b314106-46PkZR_fw658.png,../upload_file/19/04/01/1554105960199__1553946733887__Tuceng3.png', '13200000000', 5, '广东省深圳市龙华新区龙华街道龙华大厦4A座  3303                         ', 114.405924, 23.076352, '2019-04-01 16:06:06', 1, '08:30', '18:30', '<p>1.使用服务券时，请向商家说明消费项目<br/></p><p>2.服务完成后，点击门店列表上方-【我的服务券】-选择对</p><p>&nbsp; &nbsp;应服务券</p><p>3.使用服务券时，请向商家说明消费项目</p><p>4.服务完成后，点击门店列表上方-【我的服务券】-选择对</p><p>&nbsp; &nbsp;应服务券</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p></p>');
INSERT INTO `xn_store` VALUES (10, '班尼路深圳龙华清湖天虹店', '../upload_file/19/03/30/1553946488483__2858ca037462643348cc57f83b63caf89f68b6b314106-46PkZR_fw658.png,../upload_file/19/04/01/1554105960199__1553946733887__Tuceng3.png', '13200000000', 5, '广东省深圳市龙华新区龙华街道龙华大厦4A座  3303                         ', 114.405924, 23.076352, '2019-04-01 16:06:06', 1, '08:30', '18:30', '<p>1.使用服务券时，请向商家说明消费项目<br/></p><p>2.服务完成后，点击门店列表上方-【我的服务券】-选择对</p><p>&nbsp; &nbsp;应服务券</p><p>3.使用服务券时，请向商家说明消费项目</p><p>4.服务完成后，点击门店列表上方-【我的服务券】-选择对</p><p>&nbsp; &nbsp;应服务券</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p></p>');
COMMIT;

-- ----------------------------
-- Table structure for xn_store_service
-- ----------------------------
DROP TABLE IF EXISTS `xn_store_service`;
CREATE TABLE `xn_store_service` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `store_id` int(16) DEFAULT NULL,
  `price` decimal(18,2) DEFAULT NULL,
  `image_url` varchar(512) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `sales` int(8) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xn_store_service
-- ----------------------------
BEGIN;
INSERT INTO `xn_store_service` VALUES (3, 3, 299.00, '../upload_file/19/03/30/1553946733887__Tuceng3.png', '优惠洗车299元/12次', 399, '2019-03-26 15:30:01', '2019-03-30 19:52:54');
INSERT INTO `xn_store_service` VALUES (5, 3, 599.00, '../upload_file/19/04/01/1554100378212__1553946733887__Tuceng3.png', '特价保养599/12次', 234, '2019-04-01 14:33:09', '2019-04-01 14:33:09');
COMMIT;

-- ----------------------------
-- Table structure for xn_store_type
-- ----------------------------
DROP TABLE IF EXISTS `xn_store_type`;
CREATE TABLE `xn_store_type` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xn_store_type
-- ----------------------------
BEGIN;
INSERT INTO `xn_store_type` VALUES (1, '洗车', '2019-03-25 14:23:04', '2019-03-30 19:50:46');
INSERT INTO `xn_store_type` VALUES (2, '打蜡', '2019-03-25 14:23:04', '2019-03-30 19:50:52');
INSERT INTO `xn_store_type` VALUES (5, '喷漆', '2019-03-30 19:50:57', '2019-03-30 19:50:57');
INSERT INTO `xn_store_type` VALUES (6, '美容', '2019-03-30 19:51:03', '2019-03-30 19:51:03');
INSERT INTO `xn_store_type` VALUES (7, '优惠买单', '2019-03-30 19:51:10', '2019-03-30 19:51:10');
COMMIT;

-- ----------------------------
-- Table structure for xn_system_setting
-- ----------------------------
DROP TABLE IF EXISTS `xn_system_setting`;
CREATE TABLE `xn_system_setting` (
  `id` int(16) NOT NULL,
  `value` text,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xn_system_setting
-- ----------------------------
BEGIN;
INSERT INTO `xn_system_setting` VALUES (1, '10', '2019-03-29 20:33:34');
COMMIT;

-- ----------------------------
-- Table structure for xn_traffic_application
-- ----------------------------
DROP TABLE IF EXISTS `xn_traffic_application`;
CREATE TABLE `xn_traffic_application` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `user_id` int(16) DEFAULT NULL,
  `code` varchar(128) DEFAULT NULL,
  `is_read` int(2) DEFAULT NULL,
  `price` double(16,2) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_delete` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xn_traffic_application
-- ----------------------------
BEGIN;
INSERT INTO `xn_traffic_application` VALUES (1, 8, '13242423', 1, 20.00, '2019-03-28 21:29:13', '2019-04-01 09:34:13', 1);
INSERT INTO `xn_traffic_application` VALUES (2, 9, '123456', 0, NULL, '2019-04-02 12:09:39', '2019-04-02 12:09:39', 0);
COMMIT;

-- ----------------------------
-- Table structure for xn_traffic_setting
-- ----------------------------
DROP TABLE IF EXISTS `xn_traffic_setting`;
CREATE TABLE `xn_traffic_setting` (
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `price` decimal(18,2) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xn_traffic_setting
-- ----------------------------
BEGIN;
INSERT INTO `xn_traffic_setting` VALUES ('申请说明', '<p>1.本次开放区域：北京市、上海市、广东省、天津市、</p><p>山东省、河南省、江苏省，其他区域住不开放中。</p><p>2.本次开放区域：北京市、上海市、广东省、天津市、</p><p>山东省、河南省、江苏省，其他区域住不开放中。</p><p>3.本次开放区域：北京市、上海市、广东省、天津市、</p><p>山东省、河南省、江苏省，其他区域住不开放中。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p><br/></p>', 15.00, '2019-03-29 10:16:39');
COMMIT;

-- ----------------------------
-- Table structure for xn_user
-- ----------------------------
DROP TABLE IF EXISTS `xn_user`;
CREATE TABLE `xn_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `phone` varchar(64) DEFAULT NULL COMMENT '用户手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '用户密码',
  `avatar_url` varchar(1024) DEFAULT NULL COMMENT '用户头像',
  `nickname` varchar(64) DEFAULT NULL COMMENT '用户昵称',
  `gender` int(2) DEFAULT NULL COMMENT '性别：0->未知；1->男；2->女',
  `birthday` date DEFAULT NULL COMMENT ' 生日',
  `time` timestamp NULL DEFAULT NULL COMMENT ' 注册时间',
  `oil_point` int(16) DEFAULT NULL COMMENT '油点',
  `token` varchar(128) DEFAULT NULL COMMENT '唯一标识',
  `is_finish_info` int(2) DEFAULT NULL COMMENT '是否已完善信息 1 未完善 2已完善（完善后加油点）',
  `member_level_id` bigint(20) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL COMMENT '商城唯一标识',
  `status` int(1) DEFAULT NULL COMMENT '帐号启用状态:0->禁用；1->启用',
  `city` varchar(64) DEFAULT NULL COMMENT '所做城市',
  `job` varchar(100) DEFAULT NULL COMMENT '职业',
  `personalized_signature` varchar(200) DEFAULT NULL COMMENT '个性签名',
  `source_type` int(1) DEFAULT NULL COMMENT '用户来源 1 小程序 2 公众号 3 页面',
  `integration` int(11) DEFAULT NULL COMMENT '积分',
  `growth` int(11) DEFAULT NULL COMMENT '成长值',
  `luckey_count` int(11) DEFAULT NULL COMMENT '剩余抽奖次数',
  `history_integration` int(11) DEFAULT NULL COMMENT '历史积分数量',
  `avatar` varchar(255) DEFAULT NULL,
  `weixin_openid` int(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT ' 注册时间',
  `icon` varchar(500) DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xn_user
-- ----------------------------
BEGIN;
INSERT INTO `xn_user` VALUES (5, '13049407497', '6013B7105B613D0D3EEF14F76D4CB9EA', '../upload_file/19/03/27/1553675944357__20190327_163900.jpeg', '扣塔不要', 2, '2002-03-27', '2019-03-26 11:53:38', 0, '4f56c42470e24390a6782478bd45c2c6', 2, 0, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL);
INSERT INTO `xn_user` VALUES (8, '13692316030', 'CCFA6ADACEF2A692C2F48D0D9C54E27A', '../upload_file/19/03/30/1553926671027__20190330141750.jpg', '用户_1553579855226', 1, '2019-08-11', '2019-03-26 13:57:35', 50, '714f8b81d86743eea9cf86cb21138159', 2, 0, 'B743C49C5F384A754CE1E6466CCA815B', 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL);
INSERT INTO `xn_user` VALUES (9, '13726935663', 'EA59E61D3A53A8D4C98138535586E78E', '../upload_file/19/03/28/1553760497702__20190328160817.jpg', 'liao', 1, '1996-05-01', '2019-03-27 11:08:11', 12, 'dbab98f3a30443208870fd8b12bf119f', 2, 0, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL);
INSERT INTO `xn_user` VALUES (10, '15602901970', 'B84D7F8D4FA7713E702AB0D9D2632D75', '../upload_file/19/04/02/1554187989507__20190402145308.jpg', '用户_1553743606861', 1, '1990-01-01', '2019-03-28 11:26:47', 10, 'a45fbbdb901b45debcba0fd20d5260cd', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for xn_vehicle
-- ----------------------------
DROP TABLE IF EXISTS `xn_vehicle`;
CREATE TABLE `xn_vehicle` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `user_id` int(16) DEFAULT NULL,
  `car_no` varchar(64) DEFAULT NULL,
  `car_type` varchar(64) DEFAULT NULL,
  `frame_number` varchar(64) DEFAULT NULL,
  `mileage` varchar(64) DEFAULT NULL,
  `engine_number` varchar(64) DEFAULT NULL,
  `brand_type` varchar(64) DEFAULT NULL,
  `insurance_purchase` datetime DEFAULT NULL,
  `vehicle_tax` datetime DEFAULT NULL,
  `annual_ticket` datetime DEFAULT NULL,
  `annual_review` datetime DEFAULT NULL,
  `maintain` varchar(128) DEFAULT NULL,
  `oils` varchar(64) DEFAULT NULL,
  `insurance_company` varchar(64) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `brand_and_type` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xn_vehicle
-- ----------------------------
BEGIN;
INSERT INTO `xn_vehicle` VALUES (1, 5, '晋C679494', '新能源汽车专用号牌', '222222', '2269', '122', '挂车号牌', '2016-03-30 00:00:00', '2019-03-01 00:00:00', '2019-04-04 00:00:00', '2017-04-01 00:00:00', '4000', '97#', '太平洋保险CPIC', '2019-03-28 11:51:07', '2019-04-03 11:42:16', '200TSI 手动两驱时尚型(大众)');
INSERT INTO `xn_vehicle` VALUES (2, 10, '粤Bytdytdtyddt', '新能源汽车专用号牌', '二胎头一回', '33331111111', '653646556¥//～（v', '境外汽车', '2018-01-09 00:00:00', '1982-01-01 00:00:00', '2017-02-07 00:00:00', '2019-03-29 00:00:00', '4000', '95#', '太平洋保险CPIC', '1970-01-01 08:00:01', '2019-03-29 20:39:07', 'Audi Sport-奥迪RS 4-RS 4 2.9T Avant');
INSERT INTO `xn_vehicle` VALUES (3, 8, '浙F111', '小型蓝牌车', '115796r r', '111333', '465434', NULL, '1970-01-01 00:00:00', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2019-01-02 00:00:00', NULL, NULL, '人保车险', '2019-03-28 15:09:48', '2019-04-09 15:04:32', '阿尔法·罗密欧-ALFA 156(停售)-2.0 AT');
INSERT INTO `xn_vehicle` VALUES (12, 9, '粤G21E51', '小型蓝牌车', '115796', '2345', '465434', NULL, '2018-11-07 00:00:00', '1973-01-01 00:00:00', '2019-04-03 00:00:00', '2003-01-01 00:00:00', '5000', '90#', '人保车险', '1970-01-01 08:00:00', '2019-04-08 16:13:11', '一汽丰田-皇冠-2.0T 时尚版');
COMMIT;

-- ----------------------------
-- Table structure for xn_violation_payment
-- ----------------------------
DROP TABLE IF EXISTS `xn_violation_payment`;
CREATE TABLE `xn_violation_payment` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `user_id` int(16) DEFAULT NULL,
  `wz_time` datetime DEFAULT NULL,
  `wz_address` varchar(255) DEFAULT NULL,
  `wz_content` varchar(255) DEFAULT NULL,
  `wz_price` double(16,2) DEFAULT NULL,
  `wz_deduction` int(2) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `review_time` datetime DEFAULT NULL,
  `is_del` int(2) DEFAULT NULL,
  `record_id` int(16) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xn_violation_payment
-- ----------------------------
BEGIN;
INSERT INTO `xn_violation_payment` VALUES (1, 8, '2019-03-29 19:12:43', '12', '12', 12.00, 12, 3, '2019-03-29 19:12:50', '2019-04-02 16:58:13', 1, 1);
INSERT INTO `xn_violation_payment` VALUES (2, 9, '2019-03-29 19:12:43', '12', '12', 12.00, 5, 1, '2019-04-03 17:32:42', NULL, 1, 7);
INSERT INTO `xn_violation_payment` VALUES (3, 9, '2019-03-29 19:12:43', '12', '12', 12.00, 5, 1, '2019-04-03 17:40:43', NULL, 1, 8);
COMMIT;

-- ----------------------------
-- Table structure for xn_violation_record
-- ----------------------------
DROP TABLE IF EXISTS `xn_violation_record`;
CREATE TABLE `xn_violation_record` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `user_id` int(16) DEFAULT NULL,
  `wz_time` datetime DEFAULT NULL,
  `wz_address` varchar(255) DEFAULT NULL,
  `wz_content` varchar(255) DEFAULT NULL,
  `wz_price` double(16,2) DEFAULT NULL,
  `wz_deduction` int(2) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `review_time` datetime DEFAULT NULL,
  `is_del` int(2) DEFAULT NULL,
  `car_no` varchar(64) DEFAULT NULL,
  `engine_number` varchar(64) DEFAULT NULL,
  `frame_number` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xn_violation_record
-- ----------------------------
BEGIN;
INSERT INTO `xn_violation_record` VALUES (1, 8, '2019-03-29 19:12:43', '12', '12', 12.00, 12, 4, '2019-03-29 19:12:50', '2019-04-02 16:58:14', 1, '12313', '123123', '123123');
INSERT INTO `xn_violation_record` VALUES (2, 9, '2019-03-29 19:12:43', '12', '12', 12.00, 5, 2, '2019-03-29 19:12:50', '2019-04-03 16:26:18', 1, '京A2356', '346789', '34578');
INSERT INTO `xn_violation_record` VALUES (3, 9, '2019-03-29 19:12:43', '12', '12', 12.00, 4, 2, '2019-03-29 19:12:50', '2019-04-03 16:28:38', 1, '京A2356', '346789', '34578');
INSERT INTO `xn_violation_record` VALUES (4, 9, '2019-03-29 19:12:43', '12', '12', 12.00, 3, 3, '2019-03-29 19:12:50', '2019-04-02 16:56:22', 1, '京A2356', '346789', '34578');
INSERT INTO `xn_violation_record` VALUES (5, 9, '2019-04-02 17:02:46', '12', '12', 12.00, 3243, 2, '2019-04-02 17:02:56', '2019-04-03 16:40:22', 1, '213', '12312', '12312321');
INSERT INTO `xn_violation_record` VALUES (6, 9, '2019-03-29 19:12:43', '12', '12', 12.00, 5, 2, '2019-03-29 19:12:50', '2019-04-03 16:41:56', 1, '京A2356', '346789', '34578');
INSERT INTO `xn_violation_record` VALUES (7, 9, '2019-03-29 19:12:43', '12', '12', 12.00, 5, 2, '2019-03-29 19:12:50', '2019-04-03 17:32:43', 1, '京A2356', '346789', '34578');
INSERT INTO `xn_violation_record` VALUES (8, 9, '2019-03-29 19:12:43', '12', '12', 12.00, 5, 2, '2019-03-29 19:12:50', '2019-04-03 17:40:43', 1, '京A2356', '346789', '34578');
INSERT INTO `xn_violation_record` VALUES (9, 9, '2019-03-29 19:12:43', '12', '12', 12.00, 5, 1, '2019-03-29 19:12:50', '2019-04-03 16:20:55', 1, '京A2356', '346789', '34578');
INSERT INTO `xn_violation_record` VALUES (10, 9, '2019-03-29 19:12:43', '12', '12', 12.00, 5, 1, '2019-03-29 19:12:50', '2019-04-03 16:20:55', 1, '京A2356', '346789', '34578');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
