/*
 Navicat Premium Data Transfer

 Source Server         : cc
 Source Server Type    : MySQL
 Source Server Version : 50515
 Source Host           : localhost:3306
 Source Schema         : exam

 Target Server Type    : MySQL
 Target Server Version : 50515
 File Encoding         : 65001

 Date: 24/04/2021 21:32:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for action
-- ----------------------------
DROP TABLE IF EXISTS `action`;
CREATE TABLE `action`  (
  `action_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '前端页面操作表主键id',
  `action_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '前端操作的名字',
  `action_description` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '页面操作的描述',
  `default_check` tinyint(1) NOT NULL DEFAULT 0 COMMENT '当前操作是否需要校验,true为1,0为false',
  PRIMARY KEY (`action_id`) USING BTREE,
  UNIQUE INDEX `action_name`(`action_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '前端操作比如增删改查等的权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of action
-- ----------------------------
INSERT INTO `action` VALUES (1, 'add', '新增', 0);
INSERT INTO `action` VALUES (2, 'query', '查询', 0);
INSERT INTO `action` VALUES (3, 'get', '详情', 0);
INSERT INTO `action` VALUES (4, 'update', '修改', 0);
INSERT INTO `action` VALUES (5, 'delete', '删除', 0);
INSERT INTO `action` VALUES (6, 'import', '导入', 0);
INSERT INTO `action` VALUES (7, 'export', '导出', 0);

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam`  (
  `exam_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '考试表的主键',
  `exam_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '考试名称',
  `exam_avatar` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '考试的预览图',
  `exam_description` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '考试描述',
  `exam_question_ids` varchar(2048) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '当前考试下的题目的id用-连在一起地字符串',
  `exam_question_ids_radio` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '当前考试下的题目单选题的id用-连在一起地字符串',
  `exam_question_ids_check` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '当前考试下的题目多选题的id用-连在一起地字符串',
  `exam_question_ids_judge` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '当前考试下的题目判断题的id用-连在一起地字符串',
  `exam_score` int(11) NOT NULL DEFAULT 0 COMMENT '当前考试的总分数',
  `exam_score_radio` int(11) NOT NULL DEFAULT 0 COMMENT '当前考试每个单选题的分数',
  `exam_score_check` int(11) NOT NULL DEFAULT 0 COMMENT '当前考试每个多选题的分数',
  `exam_score_judge` int(11) NOT NULL DEFAULT 0 COMMENT '当前考试每个判断题的分数',
  `exam_creator_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '考试创建者的用户id',
  `exam_time_limit` int(11) NOT NULL DEFAULT 0 COMMENT '考试的时间限制，单位为分钟',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `exam_start_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '考试有效期开始时间',
  `exam_end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '考试有效期结束时间',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`exam_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '考试的详细信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES ('0c109482001443c7b4463d8b86fab092', '数学题', 'https://i.loli.net/2019/11/02/Pda9TEVIXyeptZo.gif', '数学题', '12e7bc147541499f86e13ca3d4fbb803--', '12e7bc147541499f86e13ca3d4fbb803', '', '', 4, 4, 5, 5, '68042014e23c4ebea7234cb9c77cee5c', 90, '2021-04-13 19:52:17', '2021-04-09 22:02:56', '2021-04-09 22:02:56', '2021-04-09 22:02:56');
INSERT INTO `exam` VALUES ('139883c96ec44c6c9c5c2b4b85a7b54a', 'Angular学习', 'https://i.loli.net/2019/11/02/Pda9TEVIXyeptZo.gif', 'Angular小测验', '', '23491b7dbbdf47dcb09ece779ff44c92-2f8b20630b10471395b6c379a465cca8', '85047be0b2cf4077a5ec66e92ebf442b-9fe1cafeebf44e20a80f504cff60ef3f', '6cabac6ec4ef44068e66cf2547543658-8f3e02d0f2a1402abd3278adc05ffb10', 90, 5, 10, 20, '68042014e23c4ebea7234cb9c77cee5c', 3, '2021-04-03 22:35:09', '2019-06-22 12:24:20', '2019-06-22 12:24:20', '2019-11-02 16:23:36');
INSERT INTO `exam` VALUES ('173fc2b11b2e4e5490df3622530bdde8', 'test11', 'https://i.loli.net/2019/11/02/DvPiSRJrzoH1tkZ.gif', 'tesst10', '2223b2eb8c2942459344c06ce1d3ed1d-85047be0b2cf4077a5ec66e92ebf442b-', '2223b2eb8c2942459344c06ce1d3ed1d', '85047be0b2cf4077a5ec66e92ebf442b', '', 6, 3, 3, 5, '68042014e23c4ebea7234cb9c77cee5c', 3, '2021-04-24 00:44:30', '2021-04-23 23:45:43', '2021-04-23 23:48:43', '2021-04-23 23:44:14');
INSERT INTO `exam` VALUES ('1a97e4c496fe46ac9ac1484bf43a323f', '小测试5', 'https://i.loli.net/2019/11/02/DvPiSRJrzoH1tkZ.gif', 'test13', '2f8b20630b10471395b6c379a465cca8-9fe1cafeebf44e20a80f504cff60ef3f-aa968545e97447c189ec01b97996c69c', '2f8b20630b10471395b6c379a465cca8', '9fe1cafeebf44e20a80f504cff60ef3f', 'aa968545e97447c189ec01b97996c69c', 15, 5, 5, 5, '68042014e23c4ebea7234cb9c77cee5c', 90, '2021-04-24 00:44:29', '2021-04-24 00:13:58', '2021-04-24 01:43:58', '2021-04-24 00:09:23');
INSERT INTO `exam` VALUES ('1ec199f9ab4e44afa9a5f1ccf4509a6a', 'test3', 'https://i.loli.net/2019/11/02/Pda9TEVIXyeptZo.gif', 'test', '334cfcd5ce47468a9babdce5c97def28--', '334cfcd5ce47468a9babdce5c97def28', '', '', 3, 3, 3, 3, '68042014e23c4ebea7234cb9c77cee5c', 90, '2021-04-13 19:52:20', '2021-04-09 20:27:08', '2021-04-09 20:27:08', '2021-04-09 20:27:08');
INSERT INTO `exam` VALUES ('258bf9410e854f34bba9c9a08f4dd313', 'Ant Design Pro，Ant最佳实践', 'https://i.loli.net/2019/11/02/sVrTotyQUXEx6ic.jpg', 'Ant最佳实践', '', '3864178819534aa7862b26e893aa2e62-9199009718ec4685a0a500d23ab814c5', '85047be0b2cf4077a5ec66e92ebf442b-9fe1cafeebf44e20a80f504cff60ef3f', '305f726e7f1f4636b88bf20de0093745-8f3e02d0f2a1402abd3278adc05ffb10', 100, 10, 10, 10, '68042014e23c4ebea7234cb9c77cee5c', 150, '2019-06-22 12:24:20', '2019-06-22 12:24:20', '2019-06-22 12:24:20', '2019-11-02 16:23:58');
INSERT INTO `exam` VALUES ('2b93b281101e43ccb677d918d8ccb25b', 'test8', 'https://i.loli.net/2019/11/02/Pda9TEVIXyeptZo.gif', 'r', '-85047be0b2cf4077a5ec66e92ebf442b-', '', '85047be0b2cf4077a5ec66e92ebf442b', '', 5, 5, 5, 5, '68042014e23c4ebea7234cb9c77cee5c', 90, '2021-04-13 19:52:23', '2021-04-09 20:45:26', '2021-04-09 20:45:26', '2021-04-09 20:45:26');
INSERT INTO `exam` VALUES ('303efbfe2e5f460c909e935345424244', '梁山广创建的考试1', 'https://i.loli.net/2019/11/02/gIqpGQ8J5B4rVYD.gif', '就是測試下', '14cc31707d53433f81841058a97575da-2223b2eb8c2942459344c06ce1d3ed1d-23491b7dbbdf47dcb09ece779ff44c92-2f8b20630b10471395b6c379a465cca8-396b55534851427590e089fb9cc040cc-85047be0b2cf4077a5ec66e92ebf442b-4247752901bd47fba86379a1cd4b87d4-6cabac6ec4ef44068e66cf2547543658-e283ac11c7064ccf976f9c48d68c6a67', '14cc31707d53433f81841058a97575da-2223b2eb8c2942459344c06ce1d3ed1d-23491b7dbbdf47dcb09ece779ff44c92-2f8b20630b10471395b6c379a465cca8', '396b55534851427590e089fb9cc040cc-85047be0b2cf4077a5ec66e92ebf442b', '4247752901bd47fba86379a1cd4b87d4-6cabac6ec4ef44068e66cf2547543658-e283ac11c7064ccf976f9c48d68c6a67', 45, 5, 5, 5, 'a1b661031adf4a8f969f1869d479fe74', 90, '2019-10-19 12:08:53', '2019-10-19 12:08:53', '2019-10-19 12:08:53', '2019-11-02 16:24:00');
INSERT INTO `exam` VALUES ('32c36809e33a4f9b98695aa09ace45b0', 'tewfd', 'https://i.loli.net/2019/11/02/Pda9TEVIXyeptZo.gif', 'weqw', '3864178819534aa7862b26e893aa2e62-53a0b30bb0ab4d4b94eeb2accac936f1-a12eb101321b451bbc54a136e98acfd0-396b55534851427590e089fb9cc040cc-85047be0b2cf4077a5ec66e92ebf442b-4247752901bd47fba86379a1cd4b87d4-8f3e02d0f2a1402abd3278adc05ffb10', '3864178819534aa7862b26e893aa2e62-53a0b30bb0ab4d4b94eeb2accac936f1-a12eb101321b451bbc54a136e98acfd0', '396b55534851427590e089fb9cc040cc-85047be0b2cf4077a5ec66e92ebf442b', '4247752901bd47fba86379a1cd4b87d4-8f3e02d0f2a1402abd3278adc05ffb10', 21, 3, 3, 3, '68042014e23c4ebea7234cb9c77cee5c', 88, '2021-04-13 19:52:29', '2021-03-29 21:45:21', '2021-03-29 21:45:21', '2021-03-29 21:45:21');
INSERT INTO `exam` VALUES ('3cf0b79c367a4448af8eef6737a5d0b3', 'Ant Design，阿里前端框架', 'https://i.loli.net/2019/11/02/gIqpGQ8J5B4rVYD.gif', 'Ant前端学习', '', '31e9ad43e84e484eb8b77b7e7a76de91-334cfcd5ce47468a9babdce5c97def28', '38085807d06948ca8ad6d8eaca522c85-396b55534851427590e089fb9cc040cc', 'e283ac11c7064ccf976f9c48d68c6a67-ecdfbdd2a9f24017b3fe1aa0947ca146', 70, 5, 5, 5, '68042014e23c4ebea7234cb9c77cee5c', 100, '2021-04-23 20:38:52', '2019-06-22 12:24:20', '2019-06-22 12:24:20', '2019-11-02 16:24:07');
INSERT INTO `exam` VALUES ('3d80ca0a69344e859ac12ddc510c9815', 'test5', 'https://i.loli.net/2019/11/02/Pda9TEVIXyeptZo.gif', '4', '--6cabac6ec4ef44068e66cf2547543658-e283ac11c7064ccf976f9c48d68c6a67', '', '', '6cabac6ec4ef44068e66cf2547543658-e283ac11c7064ccf976f9c48d68c6a67', 10, 5, 4, 5, '68042014e23c4ebea7234cb9c77cee5c', 4, '2021-04-13 19:52:33', '2021-04-09 20:28:50', '2021-04-09 20:28:50', '2021-04-09 20:28:50');
INSERT INTO `exam` VALUES ('59a3cb205f3745338c0b7e9d26ce2fe5', 'Angular学习', 'https://i.loli.net/2019/11/02/DvPiSRJrzoH1tkZ.gif', 'Angular小测验', '', '23491b7dbbdf47dcb09ece779ff44c92-2f8b20630b10471395b6c379a465cca8', '85047be0b2cf4077a5ec66e92ebf442b-9fe1cafeebf44e20a80f504cff60ef3f', '6cabac6ec4ef44068e66cf2547543658-8f3e02d0f2a1402abd3278adc05ffb10', 90, 5, 10, 20, 'a1b661031adf4a8f969f1869d479fe74', 90, '2019-06-22 12:24:20', '2019-06-22 12:24:20', '2019-06-22 12:24:20', '2019-11-02 16:24:17');
INSERT INTO `exam` VALUES ('61f6198b88a744aead6f25d04200025e', '阿里考试', 'https://i.loli.net/2019/11/02/iltU4CbvOnsg5G2.gif', '阿里巴巴2019校招', '', '14cc31707d53433f81841058a97575da-2223b2eb8c2942459344c06ce1d3ed1d', '38085807d06948ca8ad6d8eaca522c85-396b55534851427590e089fb9cc040cc', '305f726e7f1f4636b88bf20de0093745-4247752901bd47fba86379a1cd4b87d4', 100, 5, 6, 7, 'a1b661031adf4a8f969f1869d479fe74', 60, '2019-06-22 12:24:20', '2019-06-22 12:24:20', '2019-06-22 12:24:20', '2019-11-02 16:24:19');
INSERT INTO `exam` VALUES ('63c30c3737f44cd0b452b918980afaeb', 'test12', 'https://i.loli.net/2019/11/02/DvPiSRJrzoH1tkZ.gif', 'rr', '--', '', '', '', 0, 5, 5, 5, '68042014e23c4ebea7234cb9c77cee5c', 3, '2021-04-24 00:44:27', '2021-04-23 23:55:04', '2021-04-23 23:58:04', '2021-04-23 23:52:53');
INSERT INTO `exam` VALUES ('6aa101fcea3b40cdbfbf3f49bd0e4cb1', '小测试7', 'https://i.loli.net/2019/11/02/iltU4CbvOnsg5G2.gif', '7', '23491b7dbbdf47dcb09ece779ff44c92--', '23491b7dbbdf47dcb09ece779ff44c92', '', '', 5, 5, 5, 5, '68042014e23c4ebea7234cb9c77cee5c', 9, '2021-04-23 20:37:04', '2021-04-23 01:46:20', '2021-04-23 01:55:20', '2021-04-23 01:46:27');
INSERT INTO `exam` VALUES ('6fa7befdc5a04850a23bd17f9efb02c9', '刘匡迪', 'https://i.loli.net/2019/11/02/Pda9TEVIXyeptZo.gif', 'ef', '2223b2eb8c2942459344c06ce1d3ed1d-38085807d06948ca8ad6d8eaca522c85-305f726e7f1f4636b88bf20de0093745', '2223b2eb8c2942459344c06ce1d3ed1d', '38085807d06948ca8ad6d8eaca522c85', '305f726e7f1f4636b88bf20de0093745', 15, 5, 5, 5, 'a1b661031adf4a8f969f1869d479fe74', 90, '2021-04-13 19:52:43', '2021-03-12 12:29:48', '2021-03-12 12:29:48', '2021-03-12 12:29:48');
INSERT INTO `exam` VALUES ('7037d139cfae4e2ab2cda54fa79e6ce2', 'test02', 'https://i.loli.net/2019/11/02/Pda9TEVIXyeptZo.gif', 'test02', '23491b7dbbdf47dcb09ece779ff44c92-31e9ad43e84e484eb8b77b7e7a76de91-334cfcd5ce47468a9babdce5c97def28-85047be0b2cf4077a5ec66e92ebf442b-6cabac6ec4ef44068e66cf2547543658-aa968545e97447c189ec01b97996c69c-e1ece109449546f59b2b8e24a4cfaae8', '23491b7dbbdf47dcb09ece779ff44c92-31e9ad43e84e484eb8b77b7e7a76de91-334cfcd5ce47468a9babdce5c97def28', '85047be0b2cf4077a5ec66e92ebf442b', '6cabac6ec4ef44068e66cf2547543658-aa968545e97447c189ec01b97996c69c-e1ece109449546f59b2b8e24a4cfaae8', 21, 3, 3, 3, '68042014e23c4ebea7234cb9c77cee5c', 90, '2021-04-23 20:38:17', '2021-04-23 14:03:35', '2021-04-23 15:33:35', '2021-04-23 14:03:58');
INSERT INTO `exam` VALUES ('7b07b85508024521acca94f40c861f2e', '小测试8', 'https://i.loli.net/2019/11/02/iltU4CbvOnsg5G2.gif', '8', '-85047be0b2cf4077a5ec66e92ebf442b-', '', '85047be0b2cf4077a5ec66e92ebf442b', '', 5, 5, 5, 5, '68042014e23c4ebea7234cb9c77cee5c', 90, '2021-04-23 20:37:05', '2021-04-24 02:05:53', '2021-04-24 03:35:53', '2021-04-23 02:06:02');
INSERT INTO `exam` VALUES ('7f36f47a75184adeb3df4fb8c4058a5a', '阿里考试', 'https://i.loli.net/2019/11/02/fDXxsqSg8KtE1Vi.gif', '阿里巴巴2019校招', '', '14cc31707d53433f81841058a97575da-2223b2eb8c2942459344c06ce1d3ed1d', '38085807d06948ca8ad6d8eaca522c85-396b55534851427590e089fb9cc040cc', '305f726e7f1f4636b88bf20de0093745-4247752901bd47fba86379a1cd4b87d4', 100, 5, 6, 7, 'a1b661031adf4a8f969f1869d479fe74', 60, '2019-06-22 12:24:20', '2019-06-22 12:24:20', '2019-06-22 12:24:20', '2019-11-02 16:25:23');
INSERT INTO `exam` VALUES ('829418ef92a445b39240ae3df7397ccd', 'test10', 'https://i.loli.net/2019/11/02/DvPiSRJrzoH1tkZ.gif', 'tesst10', '23491b7dbbdf47dcb09ece779ff44c92-334cfcd5ce47468a9babdce5c97def28-85047be0b2cf4077a5ec66e92ebf442b-9fe1cafeebf44e20a80f504cff60ef3f-aa968545e97447c189ec01b97996c69c', '23491b7dbbdf47dcb09ece779ff44c92-334cfcd5ce47468a9babdce5c97def28', '85047be0b2cf4077a5ec66e92ebf442b-9fe1cafeebf44e20a80f504cff60ef3f', 'aa968545e97447c189ec01b97996c69c', 19, 5, 3, 3, '68042014e23c4ebea7234cb9c77cee5c', 90, '2021-04-24 00:44:31', '2021-04-23 23:41:29', '2021-04-24 01:11:29', '2021-04-23 23:41:41');
INSERT INTO `exam` VALUES ('8a2e373a1b3e4b06b0b343aba742c224', 'BootStrap实践', 'https://i.loli.net/2019/11/02/MWmqZDvOuk6NHKl.gif', '前端鼻祖', '', 'a12eb101321b451bbc54a136e98acfd0-bb22f19338174d1f9333f9aebd6ffeb6', '38085807d06948ca8ad6d8eaca522c85-396b55534851427590e089fb9cc040cc', '4247752901bd47fba86379a1cd4b87d4-e283ac11c7064ccf976f9c48d68c6a67', 120, 15, 5, 10, '79392778a90d4639a297dbd0bae0f779', 120, '2019-06-22 12:24:20', '2019-06-22 12:24:20', '2019-06-22 12:24:20', '2019-11-02 16:25:35');
INSERT INTO `exam` VALUES ('8d810a3aca3d43e5961997d37dfe8f9f', 'BootStrap实践', 'https://i.loli.net/2019/11/02/T3sG41fKWIdL8Db.gif', '前端鼻祖', '', 'a12eb101321b451bbc54a136e98acfd0-bb22f19338174d1f9333f9aebd6ffeb6', '38085807d06948ca8ad6d8eaca522c85-396b55534851427590e089fb9cc040cc', '4247752901bd47fba86379a1cd4b87d4-e283ac11c7064ccf976f9c48d68c6a67', 120, 15, 5, 10, '79392778a90d4639a297dbd0bae0f779', 120, '2019-06-22 12:24:20', '2019-06-22 12:24:20', '2019-06-22 12:24:20', '2019-11-02 16:25:41');
INSERT INTO `exam` VALUES ('8f6134e1ee6f47559f7bc2f7567d1b58', '华为新员工入职测试', 'https://i.loli.net/2019/11/02/fKb2qkH1riUsu6p.gif', '新员工入职必考', '2223b2eb8c2942459344c06ce1d3ed1d-31e9ad43e84e484eb8b77b7e7a76de91-3864178819534aa7862b26e893aa2e62-a12eb101321b451bbc54a136e98acfd0-cff7d16da6ab428e893c748d5c759cb2-396b55534851427590e089fb9cc040cc-85047be0b2cf4077a5ec66e92ebf442b-9fe1cafeebf44e20a80f504cff60ef3f-4247752901bd47fba86379a1cd4b87d4-6cabac6ec4ef44068e66cf2547543658-8f3e02d0f2a1402abd3278adc05ffb10-e283ac11c7064ccf976f9c48d68c6a67-ecdfbdd2a9f24017b3fe1aa0947ca146', '2223b2eb8c2942459344c06ce1d3ed1d-31e9ad43e84e484eb8b77b7e7a76de91-3864178819534aa7862b26e893aa2e62-a12eb101321b451bbc54a136e98acfd0-cff7d16da6ab428e893c748d5c759cb2', '396b55534851427590e089fb9cc040cc-85047be0b2cf4077a5ec66e92ebf442b-9fe1cafeebf44e20a80f504cff60ef3f', '4247752901bd47fba86379a1cd4b87d4-6cabac6ec4ef44068e66cf2547543658-8f3e02d0f2a1402abd3278adc05ffb10-e283ac11c7064ccf976f9c48d68c6a67-ecdfbdd2a9f24017b3fe1aa0947ca146', 52, 3, 4, 5, 'a1b661031adf4a8f969f1869d479fe74', 120, '2019-10-30 07:50:53', '2019-10-30 07:50:53', '2019-10-30 07:50:53', '2019-11-02 16:25:47');
INSERT INTO `exam` VALUES ('99b40bad99dc4b6ab959a13947003a4e', '小测试6', 'https://i.loli.net/2019/11/02/iltU4CbvOnsg5G2.gif', '66', '23491b7dbbdf47dcb09ece779ff44c92--', '23491b7dbbdf47dcb09ece779ff44c92', '', '', 5, 5, 5, 5, '68042014e23c4ebea7234cb9c77cee5c', 90, '2021-04-23 20:37:06', '2021-04-23 01:41:05', '2021-04-23 03:11:05', '2021-04-23 01:41:09');
INSERT INTO `exam` VALUES ('b188e54770a74481a4d3de7862ad1c31', '阿里考试', 'https://i.loli.net/2019/11/02/qv1ubt2roT4FepS.jpg', '阿里巴巴2019校招', '', '14cc31707d53433f81841058a97575da-2223b2eb8c2942459344c06ce1d3ed1d', '38085807d06948ca8ad6d8eaca522c85-396b55534851427590e089fb9cc040cc', '305f726e7f1f4636b88bf20de0093745-4247752901bd47fba86379a1cd4b87d4', 100, 5, 6, 7, 'a1b661031adf4a8f969f1869d479fe74', 60, '2019-06-22 12:24:20', '2019-06-22 12:24:20', '2019-06-22 12:24:20', '2019-11-02 16:36:38');
INSERT INTO `exam` VALUES ('b426162248ff4df8a379e90775521f4c', 'TEST11', 'https://i.loli.net/2019/11/02/iltU4CbvOnsg5G2.gif', '11', '23491b7dbbdf47dcb09ece779ff44c92-85047be0b2cf4077a5ec66e92ebf442b-aa968545e97447c189ec01b97996c69c', '23491b7dbbdf47dcb09ece779ff44c92', '85047be0b2cf4077a5ec66e92ebf442b', 'aa968545e97447c189ec01b97996c69c', 15, 5, 5, 5, '68042014e23c4ebea7234cb9c77cee5c', 90, '2021-04-24 21:06:37', '2021-04-24 11:16:32', '2021-04-24 12:46:32', '2021-04-24 11:16:43');
INSERT INTO `exam` VALUES ('bcd5821847de49c18d89f8ffc7a177cc', '小测试', 'https://i.loli.net/2019/11/02/iltU4CbvOnsg5G2.gif', '7+7=14?', '23491b7dbbdf47dcb09ece779ff44c92-85047be0b2cf4077a5ec66e92ebf442b-aa968545e97447c189ec01b97996c69c', '23491b7dbbdf47dcb09ece779ff44c92', '85047be0b2cf4077a5ec66e92ebf442b', 'aa968545e97447c189ec01b97996c69c', 15, 5, 5, 5, '68042014e23c4ebea7234cb9c77cee5c', 90, '2021-04-24 21:06:40', '2021-04-25 21:05:06', '2021-04-25 22:35:06', '2021-04-24 21:05:22');
INSERT INTO `exam` VALUES ('cdcefc9d3177419da8e0cf82f4c2a58a', 'test', 'https://i.loli.net/2019/11/02/Pda9TEVIXyeptZo.gif', 'test', '12e7bc147541499f86e13ca3d4fbb803-2223b2eb8c2942459344c06ce1d3ed1d-85047be0b2cf4077a5ec66e92ebf442b-9fe1cafeebf44e20a80f504cff60ef3f-6cabac6ec4ef44068e66cf2547543658-e283ac11c7064ccf976f9c48d68c6a67', '12e7bc147541499f86e13ca3d4fbb803-2223b2eb8c2942459344c06ce1d3ed1d', '85047be0b2cf4077a5ec66e92ebf442b-9fe1cafeebf44e20a80f504cff60ef3f', '6cabac6ec4ef44068e66cf2547543658-e283ac11c7064ccf976f9c48d68c6a67', 30, 5, 5, 5, 'a1b661031adf4a8f969f1869d479fe74', 1, '2021-04-13 19:53:00', '2021-03-12 16:13:43', '2021-03-12 16:13:43', '2021-03-12 16:13:43');
INSERT INTO `exam` VALUES ('de5d55138e0e4c3a94943afe98f1fd96', 'Angular学习', 'https://i.loli.net/2019/11/02/WjfdAirGBtRZC7U.jpg', 'Angular小测验', '', '23491b7dbbdf47dcb09ece779ff44c92-2f8b20630b10471395b6c379a465cca8', '85047be0b2cf4077a5ec66e92ebf442b-9fe1cafeebf44e20a80f504cff60ef3f', '6cabac6ec4ef44068e66cf2547543658-8f3e02d0f2a1402abd3278adc05ffb10', 90, 5, 10, 20, 'a1b661031adf4a8f969f1869d479fe74', 90, '2019-06-22 12:24:20', '2019-06-22 12:24:20', '2019-06-22 12:24:20', '2019-11-02 16:36:56');
INSERT INTO `exam` VALUES ('e5c1aac03a5b43a289b8c0caee037615', 'BootStrap实践', 'https://i.loli.net/2019/11/02/U6MwohaEuIVTXA8.jpg', '前端鼻祖', '', 'a12eb101321b451bbc54a136e98acfd0-bb22f19338174d1f9333f9aebd6ffeb6', '38085807d06948ca8ad6d8eaca522c85-396b55534851427590e089fb9cc040cc', '4247752901bd47fba86379a1cd4b87d4-e283ac11c7064ccf976f9c48d68c6a67', 120, 15, 5, 10, '79392778a90d4639a297dbd0bae0f779', 120, '2019-06-22 12:24:20', '2019-06-22 12:24:20', '2019-06-22 12:24:20', '2019-11-02 16:37:02');
INSERT INTO `exam` VALUES ('e690fb704a3847c3aa981f01b9aeed71', 'test12', 'https://i.loli.net/2019/11/02/DvPiSRJrzoH1tkZ.gif', 'rr', '--', '', '', '', 0, 5, 5, 5, '68042014e23c4ebea7234cb9c77cee5c', 3, '2021-04-24 00:44:34', '2021-04-23 23:55:04', '2021-04-23 23:58:04', '2021-04-23 23:52:53');
INSERT INTO `exam` VALUES ('ed220d5688c64c16bc76b6a00302b18b', '小测试13', 'https://i.loli.net/2019/11/02/fDXxsqSg8KtE1Vi.gif', '小测试13', '23491b7dbbdf47dcb09ece779ff44c92-38085807d06948ca8ad6d8eaca522c85-bf5199e39b724344834cb40a53d0e1bf', '23491b7dbbdf47dcb09ece779ff44c92', '38085807d06948ca8ad6d8eaca522c85', 'bf5199e39b724344834cb40a53d0e1bf', 16, 6, 5, 5, '68042014e23c4ebea7234cb9c77cee5c', 3, '2021-04-24 00:44:56', '2021-04-24 00:17:26', '2021-04-24 00:20:26', '2021-04-24 00:15:16');
INSERT INTO `exam` VALUES ('f13e867718ea4899a75982d901e3d9d5', 'TEST10', 'https://i.loli.net/2019/11/02/U6MwohaEuIVTXA8.jpg', 'HH', '334cfcd5ce47468a9babdce5c97def28-3864178819534aa7862b26e893aa2e62-9199009718ec4685a0a500d23ab814c5-85047be0b2cf4077a5ec66e92ebf442b-1a13ae94785445828f9d194d02520345', '334cfcd5ce47468a9babdce5c97def28-3864178819534aa7862b26e893aa2e62-9199009718ec4685a0a500d23ab814c5', '85047be0b2cf4077a5ec66e92ebf442b', '1a13ae94785445828f9d194d02520345', 20, 4, 4, 4, '68042014e23c4ebea7234cb9c77cee5c', 6, '2021-04-24 21:06:42', '2021-04-24 11:12:59', '2021-04-24 11:18:59', '2021-04-24 11:13:25');

-- ----------------------------
-- Table structure for exam_record
-- ----------------------------
DROP TABLE IF EXISTS `exam_record`;
CREATE TABLE `exam_record`  (
  `exam_record_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '考试记录表的主键',
  `exam_joiner_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '考试参与者的用户id',
  `exam_join_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '参加考试的时间',
  `exam_end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '完成考试所用的时间,单位分钟',
  `exam_join_score` int(11) NOT NULL DEFAULT 0 COMMENT '参与考试的实际得分',
  `exam_result_level` int(11) NULL DEFAULT 0 COMMENT '考试结果的等级',
  `answer_option_ids` varchar(4096) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `exam_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `exam_teacher_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `exam_teacher_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `exam_is_end` bit(1) NOT NULL COMMENT '0为结束，1结束',
  PRIMARY KEY (`exam_record_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '考试记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of exam_record
-- ----------------------------
INSERT INTO `exam_record` VALUES ('06a1b5531a5844759d7aadf864c1e2f9', '79392778a90d4639a297dbd0bae0f779', '2021-04-24 00:29:15', '2021-04-24 00:29:15', 0, NULL, '', '63c30c3737f44cd0b452b918980afaeb', '68042014e23c4ebea7234cb9c77cee5c', '暮雪飞扬', b'1');
INSERT INTO `exam_record` VALUES ('12116f4ac72541b1b28508242075c5f9', '79392778a90d4639a297dbd0bae0f779', '2021-04-09 22:27:09', '2021-04-09 22:27:09', 0, NULL, '', 'c8ca3f0a816042d5919d924a96cb1ae8', '68042014e23c4ebea7234cb9c77cee5c', '暮雪飞扬', b'1');
INSERT INTO `exam_record` VALUES ('13de3458ea304b889fae2ce0de19e4ac', '79392778a90d4639a297dbd0bae0f779', '2021-04-09 22:27:03', '2021-04-09 22:27:03', 0, NULL, '', 'c597bd5d65c741ddb5853dad9c8d6327', '68042014e23c4ebea7234cb9c77cee5c', '暮雪飞扬', b'1');
INSERT INTO `exam_record` VALUES ('209d049af90e4bd191bdabe295191019', '79392778a90d4639a297dbd0bae0f779', '2021-03-16 20:23:02', '2021-03-16 20:24:43', 0, NULL, '85047be0b2cf4077a5ec66e92ebf442b@False_61f3d24b130749a88626b5035e9708e9', '139883c96ec44c6c9c5c2b4b85a7b54a', '68042014e23c4ebea7234cb9c77cee5c', '暮雪飞扬', b'1');
INSERT INTO `exam_record` VALUES ('250fd0113b8149ecbef47aa83c71488c', '79392778a90d4639a297dbd0bae0f779', '2021-04-23 01:58:03', '2021-04-23 01:58:03', 0, NULL, '', '6fa7befdc5a04850a23bd17f9efb02c9', 'a1b661031adf4a8f969f1869d479fe74', '西门吹雪', b'1');
INSERT INTO `exam_record` VALUES ('2d0fe350422e44e0ab514af2fd917bca', 'a1b661031adf4a8f969f1869d479fe74', '2021-04-09 23:49:38', '2021-04-09 23:49:38', 0, NULL, '', '2f20e8421c264e458105d9f0bff6e2db', '68042014e23c4ebea7234cb9c77cee5c', '暮雪飞扬', b'1');
INSERT INTO `exam_record` VALUES ('2d7e7c6a1f064de9ab734a7277f6fc0c', '79392778a90d4639a297dbd0bae0f779', '2021-04-12 23:38:32', '2021-04-12 23:38:32', 0, NULL, '', '59a3cb205f3745338c0b7e9d26ce2fe5', 'a1b661031adf4a8f969f1869d479fe74', '西门吹雪', b'1');
INSERT INTO `exam_record` VALUES ('30c79c30d32946228552857400c69f70', '79392778a90d4639a297dbd0bae0f779', '2021-04-03 22:52:40', '2021-04-03 22:52:40', 0, NULL, '', '20d40b3a0324403f9de8a440b0c665ba', '68042014e23c4ebea7234cb9c77cee5c', '暮雪飞扬', b'1');
INSERT INTO `exam_record` VALUES ('31601ea82a664a7194e43776cd491760', '79392778a90d4639a297dbd0bae0f779', '2021-04-09 22:27:14', '2021-04-09 22:27:14', 0, NULL, '', 'ff221a5c379b40bda60677e7c54bce02', '68042014e23c4ebea7234cb9c77cee5c', '暮雪飞扬', b'0');
INSERT INTO `exam_record` VALUES ('3acfbf15c63e4956bdd2cc6dd1cd8a5c', '79392778a90d4639a297dbd0bae0f779', '2021-04-03 22:53:38', '2021-04-03 22:53:38', 0, NULL, '', '258bf9410e854f34bba9c9a08f4dd313', '68042014e23c4ebea7234cb9c77cee5c', '暮雪飞扬', b'1');
INSERT INTO `exam_record` VALUES ('42c409c8571b4b44a685184309f659d1', '79392778a90d4639a297dbd0bae0f779', '2021-04-23 01:32:14', '2021-04-23 01:32:14', 0, NULL, '', '99b40bad99dc4b6ab959a13947003a4e', '68042014e23c4ebea7234cb9c77cee5c', '暮雪飞扬', b'1');
INSERT INTO `exam_record` VALUES ('480087cc8c154732ba008dc2d7605715', '79392778a90d4639a297dbd0bae0f779', '2021-04-23 02:04:07', '2021-04-23 02:04:07', 0, NULL, '', 'b188e54770a74481a4d3de7862ad1c31', 'a1b661031adf4a8f969f1869d479fe74', '西门吹雪', b'1');
INSERT INTO `exam_record` VALUES ('618e6db20fc440bc9dff3f24d09933eb', '79392778a90d4639a297dbd0bae0f779', '2021-04-07 17:53:48', '2021-04-07 17:53:48', 0, NULL, '', '865e4b8dc2ac4e6085558c97e99fe6d9', '68042014e23c4ebea7234cb9c77cee5c', '暮雪飞扬', b'1');
INSERT INTO `exam_record` VALUES ('625a88e48754441bb4d683e4ff61ce5a', '79392778a90d4639a297dbd0bae0f779', '2021-04-07 18:14:47', '2021-04-07 18:15:08', 5, NULL, '38085807d06948ca8ad6d8eaca522c85@False_20ce13d67d544efeba548f7eb9642e8f$334cfcd5ce47468a9babdce5c97def28@True_c4aeda64b2024d9cbaaba88ac1dcdb97$31e9ad43e84e484eb8b77b7e7a76de91@False_4140a14f3f6b4067962eac1c939675c9', '3cf0b79c367a4448af8eef6737a5d0b3', '68042014e23c4ebea7234cb9c77cee5c', '暮雪飞扬', b'1');
INSERT INTO `exam_record` VALUES ('681470a7b4b14eada97035f200bd4aeb', '79392778a90d4639a297dbd0bae0f779', '2021-04-23 01:37:06', '2021-04-23 01:37:06', 0, NULL, '', '2b93b281101e43ccb677d918d8ccb25b', '68042014e23c4ebea7234cb9c77cee5c', '暮雪飞扬', b'1');
INSERT INTO `exam_record` VALUES ('6b404a247c764a2a964ace32652ed805', '79392778a90d4639a297dbd0bae0f779', '2021-04-23 02:06:12', '2021-04-23 02:06:12', 0, NULL, '', '7b07b85508024521acca94f40c861f2e', '68042014e23c4ebea7234cb9c77cee5c', '暮雪飞扬', b'0');
INSERT INTO `exam_record` VALUES ('848f5032d18a4e2088c31f3d2123cca7', 'a1b661031adf4a8f969f1869d479fe74', '2021-04-09 23:49:47', '2021-04-09 23:49:51', 0, NULL, '', '455d5fe4b60c41218cd939085c2c445c', '68042014e23c4ebea7234cb9c77cee5c', '暮雪飞扬', b'1');
INSERT INTO `exam_record` VALUES ('84cd35b9bd22444fae8716060aa1dbe7', '79392778a90d4639a297dbd0bae0f779', '2021-04-23 01:54:06', '2021-04-23 01:54:06', 0, NULL, '', '7f36f47a75184adeb3df4fb8c4058a5a', 'a1b661031adf4a8f969f1869d479fe74', '西门吹雪', b'1');
INSERT INTO `exam_record` VALUES ('88b2d57e9f174c198f842ab04c481877', '79392778a90d4639a297dbd0bae0f779', '2021-04-07 18:08:34', '2021-04-07 18:08:46', 0, NULL, '', '2f20e8421c264e458105d9f0bff6e2db', '68042014e23c4ebea7234cb9c77cee5c', '暮雪飞扬', b'1');
INSERT INTO `exam_record` VALUES ('8f3e47a90fa4457b9443e5d55eba740b', '79392778a90d4639a297dbd0bae0f779', '2021-04-23 01:35:31', '2021-04-23 01:35:31', 0, NULL, '', '3d80ca0a69344e859ac12ddc510c9815', '68042014e23c4ebea7234cb9c77cee5c', '暮雪飞扬', b'1');
INSERT INTO `exam_record` VALUES ('90c78e87e68d4a97bd65e14549da1165', '79392778a90d4639a297dbd0bae0f779', '2021-04-23 01:52:44', '2021-04-23 01:52:44', 0, NULL, '', '61f6198b88a744aead6f25d04200025e', 'a1b661031adf4a8f969f1869d479fe74', '西门吹雪', b'1');
INSERT INTO `exam_record` VALUES ('918b7ecc17d24020bdc0f453754d8991', '79392778a90d4639a297dbd0bae0f779', '2021-04-23 01:50:00', '2021-04-23 01:50:00', 0, NULL, '', '0c109482001443c7b4463d8b86fab092', '68042014e23c4ebea7234cb9c77cee5c', '暮雪飞扬', b'1');
INSERT INTO `exam_record` VALUES ('92e47194fbce4ce182cd2e384f4ffd0a', '79392778a90d4639a297dbd0bae0f779', '2021-04-09 22:31:20', '2021-04-09 22:31:20', 0, NULL, '', '303efbfe2e5f460c909e935345424244', 'a1b661031adf4a8f969f1869d479fe74', '西门吹雪', b'1');
INSERT INTO `exam_record` VALUES ('94ef8893d1814dc89f8117329e3d16d1', '79392778a90d4639a297dbd0bae0f779', '2021-04-23 01:58:57', '2021-04-23 01:58:57', 0, NULL, '', '8d810a3aca3d43e5961997d37dfe8f9f', '79392778a90d4639a297dbd0bae0f779', '红领巾', b'1');
INSERT INTO `exam_record` VALUES ('974df645cda14b3faf1efef085de854b', '79392778a90d4639a297dbd0bae0f779', '2021-04-24 00:16:46', '2021-04-24 00:16:46', 0, NULL, '', 'de5d55138e0e4c3a94943afe98f1fd96', 'a1b661031adf4a8f969f1869d479fe74', '西门吹雪', b'0');
INSERT INTO `exam_record` VALUES ('99dd23fa151e4564bd5c978540a6a149', '79392778a90d4639a297dbd0bae0f779', '2021-04-23 16:15:00', '2021-04-23 17:18:40', 3, NULL, 'aa968545e97447c189ec01b97996c69c@False_a626bfba35ef4ddc8a666beaea1ee17c$6cabac6ec4ef44068e66cf2547543658@False_b8e2e6300ab04016a82481fff15750e0$334cfcd5ce47468a9babdce5c97def28@True_c4aeda64b2024d9cbaaba88ac1dcdb97$31e9ad43e84e484eb8b77b7e7a76de91@False_4140a14f3f6b4067962eac1c939675c9$e1ece109449546f59b2b8e24a4cfaae8@False_1196257bff334d2f9a8afadc3f8b9459$23491b7dbbdf47dcb09ece779ff44c92@False_249c3e3f31ed443e83ab4379b506be24$85047be0b2cf4077a5ec66e92ebf442b@False_61f3d24b130749a88626b5035e9708e9', '7037d139cfae4e2ab2cda54fa79e6ce2', '68042014e23c4ebea7234cb9c77cee5c', '暮雪飞扬', b'1');
INSERT INTO `exam_record` VALUES ('9cf6f925481747f79d0316b585ffc6b4', '79392778a90d4639a297dbd0bae0f779', '2021-04-24 00:35:41', '2021-04-24 00:35:41', 0, NULL, '', 'e690fb704a3847c3aa981f01b9aeed71', '68042014e23c4ebea7234cb9c77cee5c', '暮雪飞扬', b'0');
INSERT INTO `exam_record` VALUES ('9f2232f422f640758bdbf8b55cdaa6ea', '79392778a90d4639a297dbd0bae0f779', '2021-04-09 23:30:21', '2021-04-09 23:30:27', 0, NULL, '67ef646d848b4ea19c541dcf86ddbf6d@False_5cfd778fcaa647e5818e7f4b487a814f', '455d5fe4b60c41218cd939085c2c445c', '68042014e23c4ebea7234cb9c77cee5c', '暮雪飞扬', b'1');
INSERT INTO `exam_record` VALUES ('a010f06e3a1e48c3b3b0d1ce9c265d3b', '79392778a90d4639a297dbd0bae0f779', '2021-04-23 01:55:53', '2021-04-23 01:55:53', 0, NULL, '', '8a2e373a1b3e4b06b0b343aba742c224', '79392778a90d4639a297dbd0bae0f779', '红领巾', b'1');
INSERT INTO `exam_record` VALUES ('a068cf6d119c4ad080db35e121dd2161', '79392778a90d4639a297dbd0bae0f779', '2021-04-23 02:03:50', '2021-04-23 02:03:50', 0, NULL, '', '8f6134e1ee6f47559f7bc2f7567d1b58', 'a1b661031adf4a8f969f1869d479fe74', '西门吹雪', b'1');
INSERT INTO `exam_record` VALUES ('a31a8bc489ba41f98fb4b02b65cc6b77', '79392778a90d4639a297dbd0bae0f779', '2021-04-24 00:20:55', '2021-04-24 00:20:55', 0, NULL, '', '173fc2b11b2e4e5490df3622530bdde8', '68042014e23c4ebea7234cb9c77cee5c', '暮雪飞扬', b'1');
INSERT INTO `exam_record` VALUES ('aca10b905c5a4688958c2412fe0d11b9', '79392778a90d4639a297dbd0bae0f779', '2021-04-10 11:57:29', '2021-04-10 11:57:50', 0, NULL, '', 'e5c1aac03a5b43a289b8c0caee037615', '79392778a90d4639a297dbd0bae0f779', '红领巾', b'1');
INSERT INTO `exam_record` VALUES ('aeb04ca06dab458a880d905fbd2f9148', '79392778a90d4639a297dbd0bae0f779', '2021-04-24 00:42:37', '2021-04-24 00:43:28', 5, NULL, '9fe1cafeebf44e20a80f504cff60ef3f@False_044cf714b7024a1689cbc9def3591f51-287ce730f7804743935f504a18cd8538-88ec4c60df0842c7b603cf82450b12cb$2f8b20630b10471395b6c379a465cca8@False_647fb34e45474ae3b064a836b436a031$aa968545e97447c189ec01b97996c69c@True_f8c9b14856fc4b7c9d86a343f1791470', '1a97e4c496fe46ac9ac1484bf43a323f', '68042014e23c4ebea7234cb9c77cee5c', '暮雪飞扬', b'1');
INSERT INTO `exam_record` VALUES ('b2eb487eff00495dadda8166ccd11091', '79392778a90d4639a297dbd0bae0f779', '2021-04-12 23:38:10', '2021-04-12 23:38:10', 0, NULL, '', '7072a20ceded4ff4a5a1b42da7a28f74', '68042014e23c4ebea7234cb9c77cee5c', '暮雪飞扬', b'0');
INSERT INTO `exam_record` VALUES ('b416e7810cbe4c7d80ce585ff9eb8548', '79392778a90d4639a297dbd0bae0f779', '2021-04-24 11:14:53', '2021-04-24 11:15:14', 4, NULL, '9199009718ec4685a0a500d23ab814c5@False_785ad33574f747fd870dd6eadff303ab$1a13ae94785445828f9d194d02520345@True_607db829792849bc8a45b86e2c7453ad$334cfcd5ce47468a9babdce5c97def28@False_995440729c4f48758920dd0f9c31f44f$3864178819534aa7862b26e893aa2e62@False_9cd1e597ae4144938be500efa21eec9b$85047be0b2cf4077a5ec66e92ebf442b@False_317914052c94400f8e45a814896c9cd9-61f3d24b130749a88626b5035e9708e9', 'f13e867718ea4899a75982d901e3d9d5', '68042014e23c4ebea7234cb9c77cee5c', '暮雪飞扬', b'1');
INSERT INTO `exam_record` VALUES ('cd4380b954394ef78b88cee48657f771', '79392778a90d4639a297dbd0bae0f779', '2021-04-23 01:46:41', '2021-04-23 01:46:41', 0, NULL, '', '6aa101fcea3b40cdbfbf3f49bd0e4cb1', '68042014e23c4ebea7234cb9c77cee5c', '暮雪飞扬', b'1');
INSERT INTO `exam_record` VALUES ('f22c1c12f92f4cb3a88e6bd5ace9b905', '79392778a90d4639a297dbd0bae0f779', '2021-04-07 18:13:05', '2021-04-07 18:13:09', 0, NULL, '', '32c36809e33a4f9b98695aa09ace45b0', '68042014e23c4ebea7234cb9c77cee5c', '暮雪飞扬', b'1');
INSERT INTO `exam_record` VALUES ('f30c7eba603a4020a1c53048b16900dc', '79392778a90d4639a297dbd0bae0f779', '2021-04-07 18:17:02', '2021-04-07 18:17:02', 0, NULL, '', '5034cd3d416a4e85a76db70a8419e6b4', '68042014e23c4ebea7234cb9c77cee5c', '暮雪飞扬', b'0');
INSERT INTO `exam_record` VALUES ('f693fa6edfa845248441a1c414d2c8c0', '79392778a90d4639a297dbd0bae0f779', '2021-04-07 21:37:56', '2021-04-07 21:38:10', 15, NULL, '38085807d06948ca8ad6d8eaca522c85@False_22de7c7537564d7b841ea1b41a298a59-81b7ae4a705f4fc39e576085a55fccc0-bbe3df2c7ba44b13b4b77cbd929a8fb1$396b55534851427590e089fb9cc040cc@False_25e3179bb90f4ef4bc550c2cb7f3562f-85aeb40a28f14735a48505d29d7c05b9-9c511fa9d5a74090967cdb52b29060a2-ccf9a11d724046dd964660b688d9dc28$e283ac11c7064ccf976f9c48d68c6a67@True_b8e2e6300ab04016a82481fff15750e0$334cfcd5ce47468a9babdce5c97def28@True_c4aeda64b2024d9cbaaba88ac1dcdb97$31e9ad43e84e484eb8b77b7e7a76de91@True_5ac788b163b04bc9b159f11d1cb1abba$ecdfbdd2a9f24017b3fe1aa0947ca146@False_d15f9106bb9941eaab1e37356af083b3', '8112f71b21734607b8706648f070b048', '68042014e23c4ebea7234cb9c77cee5c', '暮雪飞扬', b'1');
INSERT INTO `exam_record` VALUES ('f77ea89d87dc4420b0f595c12019da54', '79392778a90d4639a297dbd0bae0f779', '2021-04-23 01:36:39', '2021-04-23 01:36:39', 0, NULL, '', '1ec199f9ab4e44afa9a5f1ccf4509a6a', '68042014e23c4ebea7234cb9c77cee5c', '暮雪飞扬', b'1');

-- ----------------------------
-- Table structure for exam_record_level
-- ----------------------------
DROP TABLE IF EXISTS `exam_record_level`;
CREATE TABLE `exam_record_level`  (
  `exam_record_level_id` int(11) NOT NULL,
  `exam_record_level_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `exam_record_level_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`exam_record_level_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence`  (
  `next_val` bigint(20) NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);

-- ----------------------------
-- Table structure for page
-- ----------------------------
DROP TABLE IF EXISTS `page`;
CREATE TABLE `page`  (
  `page_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '前端页面表主键id',
  `page_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '页面的名称,要唯一',
  `page_description` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '页面的功能性描述',
  `action_ids` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '页面对应的操作权限列表，用-连接action的id',
  PRIMARY KEY (`page_id`) USING BTREE,
  UNIQUE INDEX `page_name`(`page_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '前端页面表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of page
-- ----------------------------
INSERT INTO `page` VALUES (1, 'dashboard', '仪表盘', '1-2-3-4-5');
INSERT INTO `page` VALUES (2, 'exam-card', '考试列表', '1-6-3-4');
INSERT INTO `page` VALUES (3, 'exam-record-list', '考试记录', '1-6-3-4');
INSERT INTO `page` VALUES (4, 'question-admin', '问题管理', '1-6-3-4');
INSERT INTO `page` VALUES (5, 'exam-table-list', '考试管理', '1-6-3-4');
INSERT INTO `page` VALUES (6, 'user', '个人页', '1-6-3-4-5-7');
INSERT INTO `page` VALUES (7, 'student-record-list', '学生管理', '1-6-3-4');
INSERT INTO `page` VALUES (8, 'exam-error-question', '错题本', '1-6-3-4');
INSERT INTO `page` VALUES (9, 'exam-statistics', '考试统计', '1-6-3-4');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `question_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '题目的主键',
  `question_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '题目的名字',
  `question_score` int(11) NOT NULL DEFAULT 0 COMMENT '题目的分数',
  `question_creator_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '题目创建者的用户id',
  `question_level_id` int(11) NOT NULL DEFAULT 0 COMMENT '题目难易度级别',
  `question_type_id` int(11) NOT NULL DEFAULT 0 COMMENT '题目的类型，比如单选、多选、判断等',
  `question_category_id` int(11) NOT NULL DEFAULT 0 COMMENT '题目的类型，比如数学、英语、政治等',
  `question_description` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '题目额外的描述',
  `question_option_ids` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '题目的选项，用选项的id用-连在一起表示答案',
  `question_answer_option_ids` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '题目的答案，用选项的id用-连在一起表示答案',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`question_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '考试题目表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('14cc31707d53433f81841058a97575da', '《红楼梦》的作者是谁？', 3, 'a1b661031adf4a8f969f1869d479fe74', 1, 1, 10, '红楼梦相关', '2df31aa7a344475ea8a0b2897c9754f0-6f0631ce414c49519a162af9062073ca-015147df62774a879388f924e1746f81-4d5c32e598cc41abb003f2f37dab210e', '015147df62774a879388f924e1746f81', '2019-05-25 01:46:47', '2019-10-27 17:24:48');
INSERT INTO `question` VALUES ('1a13ae94785445828f9d194d02520345', '7+7=14?', 5, '68042014e23c4ebea7234cb9c77cee5c', 3, 3, 2, 'SHU', '607db829792849bc8a45b86e2c7453ad-f7d450d816ce47afa05ef5c103c2e0e7', '607db829792849bc8a45b86e2c7453ad', '2021-04-24 11:12:04', '2021-04-24 11:12:04');
INSERT INTO `question` VALUES ('20133fa53749427f8dd88aff7b17b672', '天空是蓝色的吗？', 5, '68042014e23c4ebea7234cb9c77cee5c', 3, 3, 1, '是', 'e5fdae82dbeb43c29a83868e41a203be-7fac39a43d7841979415aa68299547e2', 'e5fdae82dbeb43c29a83868e41a203be', '2021-04-09 20:23:30', '2021-04-09 20:23:30');
INSERT INTO `question` VALUES ('2223b2eb8c2942459344c06ce1d3ed1d', '与他人在正式场合交谈时要严肃认真,还要注意语言的', 5, '68042014e23c4ebea7234cb9c77cee5c', 2, 1, 10, '言谈举止', 'bd8ecfb670364c1b8cee33607423066f-09153c0ac73a4d2ea60ebb8c833d0eef-c517d89483b94ffead440fb408efce11', 'bd8ecfb670364c1b8cee33607423066f', '2019-05-25 01:46:47', '2019-05-25 01:46:47');
INSERT INTO `question` VALUES ('23491b7dbbdf47dcb09ece779ff44c92', '你的名字是什么？', 5, 'a1b661031adf4a8f969f1869d479fe74', 2, 1, 9, '雷锋', 'afbbf97056c64199b1b44f02e8c557f5-249c3e3f31ed443e83ab4379b506be24-57e749d644044a53b48ed12f84bba0b3-83c56af7662249dd968e04bf3afbee23', '83c56af7662249dd968e04bf3afbee23', '2019-06-13 06:19:58', '2019-10-27 17:24:50');
INSERT INTO `question` VALUES ('2f8b20630b10471395b6c379a465cca8', '在参加各种社交宴请宾客中,要注意从座椅的（）侧入座,动作应轻而缓,轻松自然', 5, 'a1b661031adf4a8f969f1869d479fe74', 3, 1, 10, '就餐注意事项', '647fb34e45474ae3b064a836b436a031-77e434759f314ce08413b65b3c36e6a0-ab85c51b6e91402385aeda6551aea608', '77e434759f314ce08413b65b3c36e6a0', '2019-05-25 01:46:47', '2019-05-25 04:06:43');
INSERT INTO `question` VALUES ('305f726e7f1f4636b88bf20de0093745', '地球是圆地吗？', 5, 'a1b661031adf4a8f969f1869d479fe74', 3, 3, 1, '是的', 'd8fd1ca48ed74d0cb51295ad84760dd6-52e0ccb2fc4545028988681db9858f70', 'd8fd1ca48ed74d0cb51295ad84760dd6', '2019-06-13 06:21:16', '2019-10-27 17:24:51');
INSERT INTO `question` VALUES ('31e9ad43e84e484eb8b77b7e7a76de91', '在机场、商厦、地铁等公共场所乘自动扶梯时应靠（）站立,另一侧供有急事赶路的人快行', 3, 'a1b661031adf4a8f969f1869d479fe74', 1, 1, 9, '走电梯常识', '4140a14f3f6b4067962eac1c939675c9-5ac788b163b04bc9b159f11d1cb1abba-d36bd089207f48cfb5d806d9cf882009', '5ac788b163b04bc9b159f11d1cb1abba', '2019-05-25 01:46:47', '2019-05-25 04:06:49');
INSERT INTO `question` VALUES ('334cfcd5ce47468a9babdce5c97def28', '递接文件或名片时应当注意字体的？', 5, 'a1b661031adf4a8f969f1869d479fe74', 2, 1, 10, '生活常识', 'c4aeda64b2024d9cbaaba88ac1dcdb97-995440729c4f48758920dd0f9c31f44f-c317ef23e1de49369900869764991eb0', 'c4aeda64b2024d9cbaaba88ac1dcdb97', '2021-04-09 01:30:07', '2019-05-25 01:46:47');
INSERT INTO `question` VALUES ('38085807d06948ca8ad6d8eaca522c85', '以接待对象为标准划分的接待类型有？', 5, '68042014e23c4ebea7234cb9c77cee5c', 3, 2, 9, '商务接待', 'bed28153b51d410aafa64a6cc9c6fbb9-20ce13d67d544efeba548f7eb9642e8f-bbe3df2c7ba44b13b4b77cbd929a8fb1-22de7c7537564d7b841ea1b41a298a59-81b7ae4a705f4fc39e576085a55fccc0', '20ce13d67d544efeba548f7eb9642e8f-81b7ae4a705f4fc39e576085a55fccc0-bbe3df2c7ba44b13b4b77cbd929a8fb1-bed28153b51d410aafa64a6cc9c6fbb9', '2021-04-09 01:30:11', '2019-05-25 04:07:16');
INSERT INTO `question` VALUES ('3864178819534aa7862b26e893aa2e62', '一般性的拜访多以（）为最佳交往时间', 7, '68042014e23c4ebea7234cb9c77cee5c', 3, 1, 9, '交际', '9cd1e597ae4144938be500efa21eec9b-e4697cfd242c4328b28a084e4ecaaf3c-9b14c29c2d514b10af620655ff13a204', 'e4697cfd242c4328b28a084e4ecaaf3c', '2019-05-25 01:46:47', '2019-05-25 04:07:50');
INSERT INTO `question` VALUES ('4247752901bd47fba86379a1cd4b87d4', '与他人交谈完毕就可以立即转身离开？', 10, '68042014e23c4ebea7234cb9c77cee5c', 2, 3, 10, '社交礼仪', 'b8e2e6300ab04016a82481fff15750e0-d15f9106bb9941eaab1e37356af083b3', 'd15f9106bb9941eaab1e37356af083b3', '2021-04-09 01:30:15', '2019-06-22 04:20:33');
INSERT INTO `question` VALUES ('4c34e38ed64d4e2a868251c8a4374097', '5*5=25?', 5, '68042014e23c4ebea7234cb9c77cee5c', 3, 3, 2, '数学题', '2bb8b61e527f4f0998d016cbf9f85ffb-c193635c9cf34e35b98644e967911d50', '2bb8b61e527f4f0998d016cbf9f85ffb', '2021-04-23 14:05:20', '2021-04-23 14:05:20');
INSERT INTO `question` VALUES ('6cabac6ec4ef44068e66cf2547543658', '行握手礼时,与多人同时握手时,可以交叉握手', 6, 'a1b661031adf4a8f969f1869d479fe74', 1, 3, 10, '礼仪', 'b8e2e6300ab04016a82481fff15750e0-d15f9106bb9941eaab1e37356af083b3', 'd15f9106bb9941eaab1e37356af083b3', '2019-05-25 01:46:47', '2019-06-22 04:20:45');
INSERT INTO `question` VALUES ('85047be0b2cf4077a5ec66e92ebf442b', '名片的作用有', 5, 'a1b661031adf4a8f969f1869d479fe74', 3, 2, 10, '名片', '61f3d24b130749a88626b5035e9708e9-b7926212674b4b71b93dcffca102f578-21eccfb3bc43464b905eb0a8837ce094-317914052c94400f8e45a814896c9cd9', '61f3d24b130749a88626b5035e9708e9-b7926212674b4b71b93dcffca102f578-317914052c94400f8e45a814896c9cd9', '2019-05-25 01:46:47', '2019-05-25 04:08:27');
INSERT INTO `question` VALUES ('8f3e02d0f2a1402abd3278adc05ffb10', '有人问路可以用手指指示方向？', 8, '68042014e23c4ebea7234cb9c77cee5c', 2, 3, 9, '礼仪', 'b8e2e6300ab04016a82481fff15750e0-d15f9106bb9941eaab1e37356af083b3', 'b8e2e6300ab04016a82481fff15750e0-', '2021-04-09 01:30:22', '2019-06-22 04:20:55');
INSERT INTO `question` VALUES ('9199009718ec4685a0a500d23ab814c5', '日常生活中邻里之间应？', 2, 'a1b661031adf4a8f969f1869d479fe74', 1, 1, 9, '生活邻里', '233c13ee72c9456989788201fd108c8e-785ad33574f747fd870dd6eadff303ab-e4142da9d88b457b91249a3090f35d6b', '233c13ee72c9456989788201fd108c8e-', '2021-04-09 01:30:26', '2019-10-27 17:25:03');
INSERT INTO `question` VALUES ('9fe1cafeebf44e20a80f504cff60ef3f', '以目的的不同为标准划分的拜访类型有？', 5, '68042014e23c4ebea7234cb9c77cee5c', 2, 2, 9, '拜访', 'ab96efeec3144ecea3bf955d4e52980f-287ce730f7804743935f504a18cd8538-044cf714b7024a1689cbc9def3591f51-88ec4c60df0842c7b603cf82450b12cb-bc4e6c276e6d4b80871badf7d2a9087c', '044cf714b7024a1689cbc9def3591f51-88ec4c60df0842c7b603cf82450b12cb-ab96efeec3144ecea3bf955d4e52980f-bc4e6c276e6d4b80871badf7d2a9087c', '2021-04-09 01:30:32', '2019-05-25 01:46:47');
INSERT INTO `question` VALUES ('a12eb101321b451bbc54a136e98acfd0', '客人来访时,我们要为客人打开房门。当房门向外开时()进？', 5, '68042014e23c4ebea7234cb9c77cee5c', 1, 1, 9, '礼仪', '8c0f6801448b4185b3446d92b0721c40-251eb27617ce458697f6e966bbf87bed-228f57a595a2416aa6cf7df66095236a', '8c0f6801448b4185b3446d92b0721c40', '2021-04-09 01:30:37', '2019-05-25 01:46:47');
INSERT INTO `question` VALUES ('aa968545e97447c189ec01b97996c69c', '1+1=2？', 5, '68042014e23c4ebea7234cb9c77cee5c', 3, 3, 2, '2', 'f8c9b14856fc4b7c9d86a343f1791470-a626bfba35ef4ddc8a666beaea1ee17c', 'f8c9b14856fc4b7c9d86a343f1791470', '2021-04-09 21:36:26', '2021-04-09 21:36:26');
INSERT INTO `question` VALUES ('adfa58a597ce4cb79a5fee37d945049d', '你来自哪里？', 5, '68042014e23c4ebea7234cb9c77cee5c', 3, 1, 10, '。。', '47a2db0e0cef4c0fa60b7c59a6cde29d-66a0b48ba9a84703a2297ab3318f1ac3-d31d778da668463d8e0a3c14313b0c4b', 'd31d778da668463d8e0a3c14313b0c4b', '2021-04-23 23:09:59', '2021-04-09 20:19:54');
INSERT INTO `question` VALUES ('bb22f19338174d1f9333f9aebd6ffeb6', '做客时入座动作要', 8, '68042014e23c4ebea7234cb9c77cee5c', 1, 1, 9, '礼仪相关', '0c83f68e3d9948e38d65eb22c257bf7f-0dda4965171b4f9680a6acfab9af9625-9da49e7309604e81bacfdc7bb9044bc1', '9da49e7309604e81bacfdc7bb9044bc1', '2019-05-25 01:46:47', '2019-05-25 04:09:19');
INSERT INTO `question` VALUES ('bf5199e39b724344834cb40a53d0e1bf', '6+6=12？', 5, '68042014e23c4ebea7234cb9c77cee5c', 3, 3, 2, '数学题', 'ebc8f4ecdaec45ada68dad6fb5e40f28-f00f502c329f42a4948d8125435f7d69', 'ebc8f4ecdaec45ada68dad6fb5e40f28', '2021-04-23 23:10:31', '2021-04-23 23:10:31');
INSERT INTO `question` VALUES ('cff7d16da6ab428e893c748d5c759cb2', '拜访他人应选择（）,并应提前打招呼', 5, 'a1b661031adf4a8f969f1869d479fe74', 2, 1, 9, '交往礼节', 'ca45b95620ae4d33986cb8067ef2525c-db43d6e8819047539922b510e0a039b7-8c95b512240b4a47b85743a64f65c0ba', '8c95b512240b4a47b85743a64f65c0ba', '2019-05-25 01:46:47', '2019-05-25 04:09:30');
INSERT INTO `question` VALUES ('e1d16aebc4124790bb9435973b89f105', '正式交往场合我们的仪表仪容要给人()的感觉', 5, '68042014e23c4ebea7234cb9c77cee5c', 3, 1, 10, '仪表仪容', 'cbfebe5f94124c0dbd8ad280d63351b0-42eee2c478c043168bd7ed8d7c2dcafe-2eaf5866748148ce901d12897fed9c11', '2eaf5866748148ce901d12897fed9c11-', '2021-04-09 01:29:50', '2019-05-25 01:46:47');
INSERT INTO `question` VALUES ('e1ece109449546f59b2b8e24a4cfaae8', '海水是蓝色的吗？', 5, '68042014e23c4ebea7234cb9c77cee5c', 3, 3, 10, '？？', '0471a9422fcc4d649cc87e39e78dffbe-1196257bff334d2f9a8afadc3f8b9459', '0471a9422fcc4d649cc87e39e78dffbe', '2021-04-09 21:29:27', '2021-04-09 21:29:27');
INSERT INTO `question` VALUES ('e283ac11c7064ccf976f9c48d68c6a67', '与他人交谈时,要盯着他人的双眉到鼻尖的三角区域内', 5, '68042014e23c4ebea7234cb9c77cee5c', 2, 3, 9, '礼仪', 'b8e2e6300ab04016a82481fff15750e0-d15f9106bb9941eaab1e37356af083b3', 'b8e2e6300ab04016a82481fff15750e0', '2019-05-25 01:46:47', '2019-06-22 04:21:07');
INSERT INTO `question` VALUES ('ecdfbdd2a9f24017b3fe1aa0947ca146', '使用手机时,手机不宜握在手里或挂在腰带上', 5, 'a1b661031adf4a8f969f1869d479fe74', 2, 3, 9, '生活细节', 'b8e2e6300ab04016a82481fff15750e0-d15f9106bb9941eaab1e37356af083b3', 'b8e2e6300ab04016a82481fff15750e0', '2019-05-25 01:46:47', '2019-06-22 04:21:15');

-- ----------------------------
-- Table structure for question_category
-- ----------------------------
DROP TABLE IF EXISTS `question_category`;
CREATE TABLE `question_category`  (
  `question_category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '问题类别表的主键',
  `question_category_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '问题类别名称',
  `question_category_description` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '问题类别的描述',
  PRIMARY KEY (`question_category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '题目类别表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of question_category
-- ----------------------------
INSERT INTO `question_category` VALUES (1, '天文', '地球与宇宙的探索');
INSERT INTO `question_category` VALUES (2, '数学', '所有学科的基础');
INSERT INTO `question_category` VALUES (3, '物理', '体会牛顿与麦克斯韦的伟大');
INSERT INTO `question_category` VALUES (4, '生物', '从宏观到微观了解生命');
INSERT INTO `question_category` VALUES (5, '地理', '踏遍大好河山');
INSERT INTO `question_category` VALUES (6, '化学', '分子与原子的碰撞');
INSERT INTO `question_category` VALUES (7, '英语', '出门旅游必备');
INSERT INTO `question_category` VALUES (8, '历史', '体会悠悠岁月');
INSERT INTO `question_category` VALUES (9, '人文', '生活与交际');
INSERT INTO `question_category` VALUES (10, '生活', '人与社会的交互');

-- ----------------------------
-- Table structure for question_level
-- ----------------------------
DROP TABLE IF EXISTS `question_level`;
CREATE TABLE `question_level`  (
  `question_level_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '题目难易度的主键',
  `question_level_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '题目难易度名称',
  `question_level_description` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '题目难易度的描述',
  PRIMARY KEY (`question_level_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '问题的难易度级别' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of question_level
-- ----------------------------
INSERT INTO `question_level` VALUES (1, 'high', '难');
INSERT INTO `question_level` VALUES (2, 'middle', '中');
INSERT INTO `question_level` VALUES (3, 'low', '易');

-- ----------------------------
-- Table structure for question_option
-- ----------------------------
DROP TABLE IF EXISTS `question_option`;
CREATE TABLE `question_option`  (
  `question_option_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '题目选项表的主键',
  `question_option_content` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '选项的内容',
  `question_option_description` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '选项的额外描述，可以用于题目答案解析',
  PRIMARY KEY (`question_option_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '题目的选项' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of question_option
-- ----------------------------
INSERT INTO `question_option` VALUES ('00e91109ee0b4f6cafb9c48c09f83578', 'b', NULL);
INSERT INTO `question_option` VALUES ('015147df62774a879388f924e1746f81', '曹雪芹', '《红楼梦》的作者是谁？');
INSERT INTO `question_option` VALUES ('044cf714b7024a1689cbc9def3591f51', '情感拜访', '以目的的不同为标准划分的拜访类型有');
INSERT INTO `question_option` VALUES ('0471a9422fcc4d649cc87e39e78dffbe', '正确', NULL);
INSERT INTO `question_option` VALUES ('09153c0ac73a4d2ea60ebb8c833d0eef', '慢条斯理', '与他人在正式场合交谈时要严肃认真,还要注意语言的');
INSERT INTO `question_option` VALUES ('09979c82a3d14e58baa2ed58ff4783a6', 'c', NULL);
INSERT INTO `question_option` VALUES ('09f0c886241147aebbb0f5e17828c81d', '正确', NULL);
INSERT INTO `question_option` VALUES ('0c83f68e3d9948e38d65eb22c257bf7f', '快捷', '做客时入座动作要');
INSERT INTO `question_option` VALUES ('0dda4965171b4f9680a6acfab9af9625', '轻稳', '做客时入座动作要');
INSERT INTO `question_option` VALUES ('1196257bff334d2f9a8afadc3f8b9459', '错误', NULL);
INSERT INTO `question_option` VALUES ('18eb683543ee408e8469189f3260af35', '正确', NULL);
INSERT INTO `question_option` VALUES ('1dbfb2963e81436bb80ff8476efce2ae', 'a', NULL);
INSERT INTO `question_option` VALUES ('20ce13d67d544efeba548f7eb9642e8f', '商务接待', '以接待对象为标准划分的接待类型有');
INSERT INTO `question_option` VALUES ('21eccfb3bc43464b905eb0a8837ce094', '代替请柬', '名片的作用有');
INSERT INTO `question_option` VALUES ('228f57a595a2416aa6cf7df66095236a', '同时进门', '客人来访时,我们要为客人打开房门。当房门向外开时()进');
INSERT INTO `question_option` VALUES ('22de7c7537564d7b841ea1b41a298a59', '消费接待', '以接待对象为标准划分的接待类型有');
INSERT INTO `question_option` VALUES ('233c13ee72c9456989788201fd108c8e', '互尊互谅', '日常生活中邻里之间应');
INSERT INTO `question_option` VALUES ('249c3e3f31ed443e83ab4379b506be24', '焦恩俊', NULL);
INSERT INTO `question_option` VALUES ('251eb27617ce458697f6e966bbf87bed', '我们先进', '客人来访时,我们要为客人打开房门。当房门向外开时()进');
INSERT INTO `question_option` VALUES ('25e3179bb90f4ef4bc550c2cb7f3562f', 'A', NULL);
INSERT INTO `question_option` VALUES ('287ce730f7804743935f504a18cd8538', '政治拜访', '以目的的不同为标准划分的拜访类型有');
INSERT INTO `question_option` VALUES ('28949c3ab4c94c98a79bee58eea5705d', '正确', NULL);
INSERT INTO `question_option` VALUES ('2bb8b61e527f4f0998d016cbf9f85ffb', '正确', NULL);
INSERT INTO `question_option` VALUES ('2df31aa7a344475ea8a0b2897c9754f0', '罗贯中', '《红楼梦》的作者是谁？');
INSERT INTO `question_option` VALUES ('2eaf5866748148ce901d12897fed9c11', '端庄、大方、美观', '正式交往场合我们的仪表仪容要给人()的感觉');
INSERT INTO `question_option` VALUES ('317914052c94400f8e45a814896c9cd9', '便于通知', '名片的作用有');
INSERT INTO `question_option` VALUES ('3c1af476b9f640d29e066b8ff07ee9dd', '错误', NULL);
INSERT INTO `question_option` VALUES ('4140a14f3f6b4067962eac1c939675c9', '左侧', '在机场、商厦、地铁等公共场所乘自动扶梯时应靠（）站立,另一侧供有急事赶路的人快行');
INSERT INTO `question_option` VALUES ('42eee2c478c043168bd7ed8d7c2dcafe', '漂亮、美观、时髦', '正式交往场合我们的仪表仪容要给人()的感觉');
INSERT INTO `question_option` VALUES ('43887b1785374ec9a0abbae7f50a346f', '正确', NULL);
INSERT INTO `question_option` VALUES ('47a2db0e0cef4c0fa60b7c59a6cde29d', '北京', NULL);
INSERT INTO `question_option` VALUES ('4d5c32e598cc41abb003f2f37dab210e', '吴承恩', '《红楼梦》的作者是谁？');
INSERT INTO `question_option` VALUES ('50a63e378cb84e0eb0a10b1735ef77e4', 'b', NULL);
INSERT INTO `question_option` VALUES ('515c4ed834454a418781aa8441cff577', '错误', NULL);
INSERT INTO `question_option` VALUES ('52e0ccb2fc4545028988681db9858f70', '错误', NULL);
INSERT INTO `question_option` VALUES ('557afd16b47c4daeab7a4a32ea450a52', 'c', NULL);
INSERT INTO `question_option` VALUES ('57e749d644044a53b48ed12f84bba0b3', '白求恩', NULL);
INSERT INTO `question_option` VALUES ('5ac788b163b04bc9b159f11d1cb1abba', '右侧', '在机场、商厦、地铁等公共场所乘自动扶梯时应靠（）站立,另一侧供有急事赶路的人快行');
INSERT INTO `question_option` VALUES ('5cc04ee4c832407088cd77a0215fed74', 'a', NULL);
INSERT INTO `question_option` VALUES ('5cfd778fcaa647e5818e7f4b487a814f', '错误', NULL);
INSERT INTO `question_option` VALUES ('607db829792849bc8a45b86e2c7453ad', '正确', NULL);
INSERT INTO `question_option` VALUES ('61f3d24b130749a88626b5035e9708e9', '代替通话', '名片的作用有');
INSERT INTO `question_option` VALUES ('647fb34e45474ae3b064a836b436a031', '前侧', '在参加各种社交宴请宾客中,要注意从座椅的（）侧入座,动作应轻而缓,轻松自然。');
INSERT INTO `question_option` VALUES ('66a0b48ba9a84703a2297ab3318f1ac3', '上海', NULL);
INSERT INTO `question_option` VALUES ('6f0631ce414c49519a162af9062073ca', '施耐庵', '《红楼梦》的作者是谁？');
INSERT INTO `question_option` VALUES ('77e434759f314ce08413b65b3c36e6a0', '左侧', '在参加各种社交宴请宾客中,要注意从座椅的（）侧入座,动作应轻而缓,轻松自然');
INSERT INTO `question_option` VALUES ('785ad33574f747fd870dd6eadff303ab', '互不来往', '日常生活中邻里之间应');
INSERT INTO `question_option` VALUES ('7fac39a43d7841979415aa68299547e2', '错误', NULL);
INSERT INTO `question_option` VALUES ('81b7ae4a705f4fc39e576085a55fccc0', '朋友接待', '以接待对象为标准划分的接待类型有');
INSERT INTO `question_option` VALUES ('83c56af7662249dd968e04bf3afbee23', '雷锋', NULL);
INSERT INTO `question_option` VALUES ('85aeb40a28f14735a48505d29d7c05b9', 'B', NULL);
INSERT INTO `question_option` VALUES ('88ec4c60df0842c7b603cf82450b12cb', '礼节性拜访', '以目的的不同为标准划分的拜访类型有');
INSERT INTO `question_option` VALUES ('8ac460a324a8491597ab71c86e970a74', '错误', NULL);
INSERT INTO `question_option` VALUES ('8c0f6801448b4185b3446d92b0721c40', '客人先进', '客人来访时,我们要为客人打开房门。当房门向外开时()进');
INSERT INTO `question_option` VALUES ('8c95b512240b4a47b85743a64f65c0ba', '节假日的下午或平日的晚饭后', '拜访他人应选择（）,并应提前打招呼');
INSERT INTO `question_option` VALUES ('92ed63ab069d4f0bae0bbf630a03d34d', 'E', NULL);
INSERT INTO `question_option` VALUES ('974dc6e02ebb4a19a09a45f549231776', '正确', NULL);
INSERT INTO `question_option` VALUES ('995440729c4f48758920dd0f9c31f44f', '侧面朝向对方', '递接文件或名片时应当注意字体的');
INSERT INTO `question_option` VALUES ('9b14c29c2d514b10af620655ff13a204', '十分钟左右', '一般性的拜访多以（）为最佳交往时间');
INSERT INTO `question_option` VALUES ('9c511fa9d5a74090967cdb52b29060a2', 'D', NULL);
INSERT INTO `question_option` VALUES ('9cd1e597ae4144938be500efa21eec9b', '1小时左右', '一般性的拜访多以（）为最佳交往时间');
INSERT INTO `question_option` VALUES ('9da49e7309604e81bacfdc7bb9044bc1', '缓慢', '做客时入座动作要');
INSERT INTO `question_option` VALUES ('a4fd96787d254b34a1cc2ddf6caa9bff', '错误', NULL);
INSERT INTO `question_option` VALUES ('a626bfba35ef4ddc8a666beaea1ee17c', '错误', NULL);
INSERT INTO `question_option` VALUES ('ab85c51b6e91402385aeda6551aea608', '右侧', '在参加各种社交宴请宾客中,要注意从座椅的（）侧入座,动作应轻而缓,轻松自然');
INSERT INTO `question_option` VALUES ('ab96efeec3144ecea3bf955d4e52980f', '商业拜访', '以目的的不同为标准划分的拜访类型有');
INSERT INTO `question_option` VALUES ('afbbf97056c64199b1b44f02e8c557f5', '董存瑞', NULL);
INSERT INTO `question_option` VALUES ('b5c156fbd01f4361a69efd8466d5efeb', '正确', NULL);
INSERT INTO `question_option` VALUES ('b6d3abe5872e40b5a31dbc2d0afae701', '正确', NULL);
INSERT INTO `question_option` VALUES ('b7926212674b4b71b93dcffca102f578', '代替便函', '名片的作用有');
INSERT INTO `question_option` VALUES ('b8e2e6300ab04016a82481fff15750e0', '正确', '判断题专用选项');
INSERT INTO `question_option` VALUES ('bbe3df2c7ba44b13b4b77cbd929a8fb1', '上访接待', '以接待对象为标准划分的接待类型有');
INSERT INTO `question_option` VALUES ('bc4e6c276e6d4b80871badf7d2a9087c', '公务拜访', '以目的的不同为标准划分的拜访类型有');
INSERT INTO `question_option` VALUES ('bd8ecfb670364c1b8cee33607423066f', '准确规范', '与他人在正式场合交谈时要严肃认真,还要注意语言的');
INSERT INTO `question_option` VALUES ('bed28153b51d410aafa64a6cc9c6fbb9', '公务接待', '以接待对象为标准划分的接待类型有');
INSERT INTO `question_option` VALUES ('c193635c9cf34e35b98644e967911d50', '错误', NULL);
INSERT INTO `question_option` VALUES ('c317ef23e1de49369900869764991eb0', '反面朝向对方', '递接文件或名片时应当注意字体的');
INSERT INTO `question_option` VALUES ('c4aeda64b2024d9cbaaba88ac1dcdb97', '正面朝向对方', '递接文件或名片时应当注意字体的');
INSERT INTO `question_option` VALUES ('c517d89483b94ffead440fb408efce11', '声音洪亮', '与他人在正式场合交谈时要严肃认真,还要注意语言的');
INSERT INTO `question_option` VALUES ('ca45b95620ae4d33986cb8067ef2525c', '清晨', '拜访他人应选择（）,并应提前打招呼');
INSERT INTO `question_option` VALUES ('cbfebe5f94124c0dbd8ad280d63351b0', '随意、整齐、干净', '正式交往场合我们的仪表仪容要给人()的感觉');
INSERT INTO `question_option` VALUES ('ccf9a11d724046dd964660b688d9dc28', 'C', NULL);
INSERT INTO `question_option` VALUES ('d15f9106bb9941eaab1e37356af083b3', '错误', '判断题专用选项');
INSERT INTO `question_option` VALUES ('d31d778da668463d8e0a3c14313b0c4b', '南京', NULL);
INSERT INTO `question_option` VALUES ('d36bd089207f48cfb5d806d9cf882009', '中间', '在机场、商厦、地铁等公共场所乘自动扶梯时应靠（）站立,另一侧供有急事赶路的人快行');
INSERT INTO `question_option` VALUES ('d8fd1ca48ed74d0cb51295ad84760dd6', '正确', NULL);
INSERT INTO `question_option` VALUES ('db43d6e8819047539922b510e0a039b7', '用餐时间 ', '拜访他人应选择（）,并应提前打招呼');
INSERT INTO `question_option` VALUES ('dd2a5b0c5ebc434ea373d8b5426920fe', '错误', NULL);
INSERT INTO `question_option` VALUES ('e4142da9d88b457b91249a3090f35d6b', '不必考虑邻里关系', '日常生活中邻里之间应');
INSERT INTO `question_option` VALUES ('e4697cfd242c4328b28a084e4ecaaf3c', '半小时左右', '一般性的拜访多以（）为最佳交往时间');
INSERT INTO `question_option` VALUES ('e5fdae82dbeb43c29a83868e41a203be', '正确', NULL);
INSERT INTO `question_option` VALUES ('ebc8f4ecdaec45ada68dad6fb5e40f28', '正确', NULL);
INSERT INTO `question_option` VALUES ('f00f502c329f42a4948d8125435f7d69', '错误', NULL);
INSERT INTO `question_option` VALUES ('f7d450d816ce47afa05ef5c103c2e0e7', '错误', NULL);
INSERT INTO `question_option` VALUES ('f8c9b14856fc4b7c9d86a343f1791470', '正确', NULL);
INSERT INTO `question_option` VALUES ('ff007e7fe9b144339b4632bdd3c89f0b', '错误', NULL);

-- ----------------------------
-- Table structure for question_type
-- ----------------------------
DROP TABLE IF EXISTS `question_type`;
CREATE TABLE `question_type`  (
  `question_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '题目类型表的主键',
  `question_type_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '题目类型名称',
  `question_type_description` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '题目类型的描述',
  PRIMARY KEY (`question_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '问题类型' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of question_type
-- ----------------------------
INSERT INTO `question_type` VALUES (1, 'single', '单选题');
INSERT INTO `question_type` VALUES (2, 'multi', '多选题');
INSERT INTO `question_type` VALUES (3, 'judge', '判断题');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色表主键id',
  `role_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `role_description` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '角色的描述',
  `role_detail` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '角色的详细功能阐述',
  `role_page_ids` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '当前角色所能访问的页面的id集合',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (2, 'admin', '管理员', '出题、组试卷、管理学生和试卷', '1-4-5-6-7-9');
INSERT INTO `role` VALUES (3, 'student', '学生', '参与考试，查看分数', '1-2-3-6-8');

-- ----------------------------
-- Table structure for teacher_student
-- ----------------------------
DROP TABLE IF EXISTS `teacher_student`;
CREATE TABLE `teacher_student`  (
  `teacher_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `student_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`teacher_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户id,主键，字符串型',
  `user_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `user_nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户昵称',
  `user_password` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户秘密',
  `user_role_id` int(11) NOT NULL COMMENT '当前用户的角色的id',
  `user_avatar` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户的头像地址',
  `user_description` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户的自我描述',
  `user_email` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户邮箱',
  `user_phone` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户手机号',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `user_username`(`user_username`) USING BTREE,
  UNIQUE INDEX `user_email`(`user_email`) USING BTREE,
  UNIQUE INDEX `user_phone`(`user_phone`) USING BTREE,
  INDEX `user_username_2`(`user_username`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('68042014e23c4ebea7234cb9c77cee5c', 'teacher', '暮雪飞扬', 'YWRtaW4xMjM=', 2, 'https://i.loli.net/2019/11/02/OUfHKhMSwRv1ntX.jpg', '快乐就好', '1648266192@qq.com', '15261897332', '2019-05-06 18:03:27', '2019-11-02 16:37:20');
INSERT INTO `user` VALUES ('79392778a90d4639a297dbd0bae0f779', 'student', '红领巾', 'YWRtaW4xMjM=', 3, 'https://i.loli.net/2019/11/02/rCHKVJd4jTovzW9.jpg', '好好学习，天天向上', 'liangshanguang@huawei.com', '17712345678', '2019-05-06 18:07:14', '2019-11-02 16:37:31');
INSERT INTO `user` VALUES ('9cbeae6c0c66452393735c78e95bb6d1', '13233213123', '13233213123', 'cXExMjMxMjM=', 3, 'http://d.lanrentuku.com/down/png/1904/business_avatar/8_avatar_2754583.png', 'welcome to online exam system', 'teacher@163.com', '13233213123', '2021-04-07 17:48:17', '2021-04-07 17:48:17');
INSERT INTO `user` VALUES ('a1b661031adf4a8f969f1869d479fe74', '123', '西门吹雪', 'YWRtaW4xMjM=', 3, 'https://i.loli.net/2019/11/02/DvPiSRJrzoH1tkZ.gif', '绳锯木断，水滴石穿', 'liangshanguang2@gmail.com', '17601324488', '2021-04-09 23:49:28', '2019-11-02 16:37:37');
INSERT INTO `user` VALUES ('aa788a7400e848e78e13c3b903fd366a', 'user_13223444264', 'user_13223444264', 'YWRtaW4xMjM=', 3, 'http://d.lanrentuku.com/down/png/1904/business_avatar/8_avatar_2754583.png', 'welcome to online exam system', '123@163.com', '13223444264', '2021-03-12 15:25:48', '2021-03-12 15:25:48');
INSERT INTO `user` VALUES ('bf6480b8a3324e3a8c07cb0131d053aa', '13223444262', '13223444262', 'YWRtaW4xMjM=', 3, 'http://d.lanrentuku.com/down/png/1904/business_avatar/8_avatar_2754583.png', 'welcome to online exam system', '12222@163.com', '13223444262', '2021-04-12 22:14:33', '2021-04-12 22:14:33');

SET FOREIGN_KEY_CHECKS = 1;
