/*
 Navicat Premium Data Transfer

 Source Server         : dev
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : oa

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 20/12/2020 11:53:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adm_department
-- ----------------------------
DROP TABLE IF EXISTS `adm_department`;
CREATE TABLE `adm_department`  (
  `department_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '部门编号',
  `department_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部门名称',
  PRIMARY KEY (`department_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of adm_department
-- ----------------------------
INSERT INTO `adm_department` VALUES (1, '总裁办');
INSERT INTO `adm_department` VALUES (2, '研发部');
INSERT INTO `adm_department` VALUES (3, '市场部');

-- ----------------------------
-- Table structure for adm_employee
-- ----------------------------
DROP TABLE IF EXISTS `adm_employee`;
CREATE TABLE `adm_employee`  (
  `employee_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '员工姓名',
  `department_id` bigint(0) NOT NULL COMMENT '部门编号',
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '职位',
  `level` int(0) NOT NULL COMMENT '行政级别',
  PRIMARY KEY (`employee_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of adm_employee
-- ----------------------------
INSERT INTO `adm_employee` VALUES (1, '张晓涛', 1, '总经理', 8);
INSERT INTO `adm_employee` VALUES (2, '齐紫陌', 2, '部门经理', 7);
INSERT INTO `adm_employee` VALUES (3, '王美美', 2, '高级研发工程师', 6);
INSERT INTO `adm_employee` VALUES (4, '宋彩妮', 2, '研发工程师', 5);
INSERT INTO `adm_employee` VALUES (5, '欧阳峰', 2, '初级研发工程师', 4);
INSERT INTO `adm_employee` VALUES (6, '张世豪', 3, '部门经理', 7);
INSERT INTO `adm_employee` VALUES (7, '王子豪', 3, '大客户经理', 6);
INSERT INTO `adm_employee` VALUES (8, '段峰', 3, '客户经理', 5);
INSERT INTO `adm_employee` VALUES (9, '章雪峰', 3, '客户经理', 4);
INSERT INTO `adm_employee` VALUES (10, '李莉', 3, '见习客户经理', 3);

-- ----------------------------
-- Table structure for adm_leave_form
-- ----------------------------
DROP TABLE IF EXISTS `adm_leave_form`;
CREATE TABLE `adm_leave_form`  (
  `form_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '请假单编号',
  `employee_id` bigint(0) NOT NULL COMMENT '员工编号',
  `form_type` int(0) NOT NULL COMMENT '请假类型 1-事假 2-病假 3-工伤假 4-婚假 5-产假 6-丧假',
  `start_time` datetime(0) NOT NULL COMMENT '请假起始时间',
  `end_time` datetime(0) NOT NULL COMMENT '请假结束时间',
  `reason` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请假事由',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `state` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'processing-正在审批 approved-审批已通过 refused-审批被驳回',
  PRIMARY KEY (`form_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of adm_leave_form
-- ----------------------------
INSERT INTO `adm_leave_form` VALUES (31, 4, 3, '2020-03-29 00:00:00', '2020-04-04 00:00:00', '事故,小腿骨折,明天做手术', '2020-03-28 11:49:09', 'approved');
INSERT INTO `adm_leave_form` VALUES (32, 3, 1, '2020-03-29 00:00:00', '2020-04-04 00:00:00', '没啥原因,单纯想休息几天', '2020-03-28 11:50:35', 'refused');
INSERT INTO `adm_leave_form` VALUES (33, 6, 1, '2020-03-30 00:00:00', '2020-03-31 00:00:00', '带孩子去看牙', '2020-03-28 11:51:49', 'approved');
INSERT INTO `adm_leave_form` VALUES (40, 4, 2, '2020-10-01 00:00:00', '2020-10-10 00:00:00', '去医院看病', '2020-10-22 20:28:06', 'approved');
INSERT INTO `adm_leave_form` VALUES (41, 3, 4, '2020-10-01 00:00:00', '2020-10-31 00:00:00', '回家乡结婚', '2020-10-22 21:08:28', 'approved');
INSERT INTO `adm_leave_form` VALUES (42, 4, 6, '2020-10-18 00:00:00', '2020-10-31 00:00:00', '回家奔丧', '2020-10-23 08:40:15', 'approved');
INSERT INTO `adm_leave_form` VALUES (43, 5, 1, '2020-10-23 00:00:00', '2020-10-30 00:00:00', '回家探亲', '2020-10-23 08:45:37', 'approved');
INSERT INTO `adm_leave_form` VALUES (44, 3, 1, '2020-10-18 00:00:00', '2020-10-24 00:00:00', '回家', '2020-10-23 08:55:41', 'approved');
INSERT INTO `adm_leave_form` VALUES (45, 5, 4, '2020-10-11 00:00:00', '2020-10-24 00:00:00', '回家结婚', '2020-10-30 21:13:25', 'approved');

-- ----------------------------
-- Table structure for adm_process_flow
-- ----------------------------
DROP TABLE IF EXISTS `adm_process_flow`;
CREATE TABLE `adm_process_flow`  (
  `process_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '处理任务编号',
  `form_id` bigint(0) NOT NULL COMMENT '表单编号',
  `operator_id` bigint(0) NOT NULL COMMENT '经办人编号',
  `action` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'apply-申请  audit-审批',
  `result` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'approved-同意 refused-驳回',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审批意见',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `audit_time` datetime(0) NULL DEFAULT NULL COMMENT '审批时间',
  `order_no` int(0) NOT NULL COMMENT '任务序号',
  `state` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ready-准备 process-正在处理 complete-处理完成 cancel-取消',
  `is_last` int(0) NOT NULL COMMENT '是否最后节点,0-否 1-是',
  PRIMARY KEY (`process_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of adm_process_flow
-- ----------------------------
INSERT INTO `adm_process_flow` VALUES (74, 31, 4, 'apply', NULL, NULL, '2020-03-28 11:49:09', NULL, 1, 'complete', 0);
INSERT INTO `adm_process_flow` VALUES (75, 31, 2, 'audit', 'approved', '安心养伤', '2020-03-28 11:49:09', '2020-10-22 19:22:39', 2, 'complete', 0);
INSERT INTO `adm_process_flow` VALUES (76, 31, 1, 'audit', 'approved', '祝早日康复', '2020-03-28 11:49:09', '2020-10-22 19:24:15', 3, 'complete', 1);
INSERT INTO `adm_process_flow` VALUES (77, 32, 3, 'apply', NULL, NULL, '2020-03-28 11:50:35', NULL, 1, 'complete', 0);
INSERT INTO `adm_process_flow` VALUES (78, 32, 2, 'audit', 'refused', '工作进度怎么办', '2020-03-28 11:50:35', '2020-10-22 19:23:21', 2, 'complete', 0);
INSERT INTO `adm_process_flow` VALUES (79, 32, 1, 'audit', NULL, NULL, '2020-03-28 11:50:36', NULL, 3, 'cancel', 1);
INSERT INTO `adm_process_flow` VALUES (80, 33, 6, 'apply', NULL, NULL, '2020-03-28 11:51:49', NULL, 1, 'complete', 0);
INSERT INTO `adm_process_flow` VALUES (81, 33, 1, 'audit', 'approved', '同意', '2020-03-28 11:51:49', '2020-10-22 19:24:39', 2, 'complete', 1);
INSERT INTO `adm_process_flow` VALUES (97, 40, 4, 'apply', NULL, NULL, '2020-10-22 20:28:06', NULL, 1, 'complete', 0);
INSERT INTO `adm_process_flow` VALUES (98, 40, 2, 'audit', 'approved', '同意', '2020-10-22 20:28:06', '2020-10-22 20:29:25', 2, 'complete', 0);
INSERT INTO `adm_process_flow` VALUES (99, 40, 1, 'audit', 'approved', '同意', '2020-10-22 20:28:06', '2020-10-22 20:30:44', 3, 'complete', 1);
INSERT INTO `adm_process_flow` VALUES (100, 41, 3, 'apply', NULL, NULL, '2020-10-22 21:08:28', NULL, 1, 'complete', 0);
INSERT INTO `adm_process_flow` VALUES (101, 41, 2, 'audit', 'approved', '同意', '2020-10-22 21:08:28', '2020-10-22 21:09:10', 2, 'complete', 0);
INSERT INTO `adm_process_flow` VALUES (102, 41, 1, 'audit', 'approved', '同意', '2020-10-22 21:08:28', '2020-10-22 21:09:53', 3, 'complete', 1);
INSERT INTO `adm_process_flow` VALUES (103, 42, 4, 'apply', NULL, NULL, '2020-10-23 08:40:15', NULL, 1, 'complete', 0);
INSERT INTO `adm_process_flow` VALUES (104, 42, 2, 'audit', 'approved', '不要过于伤心', '2020-10-23 08:40:15', '2020-10-23 08:41:45', 2, 'complete', 0);
INSERT INTO `adm_process_flow` VALUES (105, 42, 1, 'audit', 'approved', '同意', '2020-10-23 08:40:15', '2020-10-23 08:43:01', 3, 'complete', 1);
INSERT INTO `adm_process_flow` VALUES (106, 43, 5, 'apply', NULL, NULL, '2020-10-23 08:45:37', NULL, 1, 'complete', 0);
INSERT INTO `adm_process_flow` VALUES (107, 43, 2, 'audit', 'approved', '同意', '2020-10-23 08:45:37', '2020-10-23 08:46:14', 2, 'complete', 0);
INSERT INTO `adm_process_flow` VALUES (108, 43, 1, 'audit', 'approved', '同意', '2020-10-23 08:45:37', '2020-10-23 08:50:52', 3, 'complete', 1);
INSERT INTO `adm_process_flow` VALUES (109, 44, 3, 'apply', NULL, NULL, '2020-10-23 08:55:41', NULL, 1, 'complete', 0);
INSERT INTO `adm_process_flow` VALUES (110, 44, 2, 'audit', 'approved', '同意', '2020-10-23 08:55:41', '2020-10-23 08:56:36', 2, 'complete', 0);
INSERT INTO `adm_process_flow` VALUES (111, 44, 1, 'audit', 'approved', '同意', '2020-10-23 08:55:41', '2020-10-23 08:57:45', 3, 'complete', 1);
INSERT INTO `adm_process_flow` VALUES (112, 45, 5, 'apply', NULL, NULL, '2020-10-30 21:13:25', NULL, 1, 'complete', 0);
INSERT INTO `adm_process_flow` VALUES (113, 45, 2, 'audit', 'approved', '新婚快乐', '2020-10-30 21:13:25', '2020-10-30 21:14:58', 2, 'complete', 0);
INSERT INTO `adm_process_flow` VALUES (114, 45, 1, 'audit', 'approved', '新婚快乐', '2020-10-30 21:13:25', '2020-10-30 21:15:48', 3, 'complete', 1);

-- ----------------------------
-- Table structure for sys_node
-- ----------------------------
DROP TABLE IF EXISTS `sys_node`;
CREATE TABLE `sys_node`  (
  `node_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '节点编号',
  `node_type` int(0) NOT NULL COMMENT '节点类型 1-模块 2-功能',
  `node_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '节点名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '功能地址',
  `node_code` int(0) NOT NULL COMMENT '节点编码,用于排序',
  `parent_id` bigint(0) NULL DEFAULT NULL COMMENT '上级节点编号',
  PRIMARY KEY (`node_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_node
-- ----------------------------
INSERT INTO `sys_node` VALUES (1, 1, '行政审批', NULL, 1000000, NULL);
INSERT INTO `sys_node` VALUES (2, 2, '通知公告', '/forward/notice', 1000001, 1);
INSERT INTO `sys_node` VALUES (3, 2, '请假申请', '/forward/form', 1000002, 1);
INSERT INTO `sys_node` VALUES (4, 2, '请假审批', '/forward/audit', 1000003, 1);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` bigint(0) NOT NULL AUTO_INCREMENT,
  `receiver_id` bigint(0) NOT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (19, 4, '你的请假申请[2020-10-01-00时-2020-10-10-00时]已提交，请等待上级审批。', '2020-10-22 20:28:06');
INSERT INTO `sys_notice` VALUES (20, 2, '研发工程师-宋彩妮提起请假申请[2020-10-01-00时-2020-10-10-00时],请尽快审批', '2020-10-22 20:28:06');
INSERT INTO `sys_notice` VALUES (21, 4, '你的请假申请[2020-10-01-00时-2020-10-10-00时]部门经理齐紫陌已批准,审批意见：同意,审批已结束。', '2020-10-22 20:29:25');
INSERT INTO `sys_notice` VALUES (22, 1, '研发工程师-宋彩妮提起请假申请[2020-10-01-00时-2020-10-10-00时]，请尽快审批。', '2020-10-22 20:29:25');
INSERT INTO `sys_notice` VALUES (23, 2, '研发工程师-宋彩妮提起请假申请[2020-10-01-00时-2020-10-10-00时],审批意见：同意,审批已结束。', '2020-10-22 20:29:25');
INSERT INTO `sys_notice` VALUES (24, 4, '你的请假申请[2020-10-01-00时-2020-10-10-00时]总经理张晓涛已批准,审批意见：同意,审批已结束。', '2020-10-22 20:30:44');
INSERT INTO `sys_notice` VALUES (25, 1, '研发工程师-宋彩妮提起请假申请[2020-10-01-00时-2020-10-10-00时]你已批准,审批意见：同意,审批已结束。', '2020-10-22 20:30:44');
INSERT INTO `sys_notice` VALUES (26, 3, '你的请假申请[2020-10-01-00时-2020-10-31-00时]已提交，请等待上级审批。', '2020-10-22 21:08:28');
INSERT INTO `sys_notice` VALUES (27, 2, '高级研发工程师-王美美提起请假申请[2020-10-01-00时-2020-10-31-00时],请尽快审批', '2020-10-22 21:08:28');
INSERT INTO `sys_notice` VALUES (28, 3, '你的请假申请[2020-10-01-00时-2020-10-31-00时]部门经理齐紫陌已批准,审批意见：同意,审批已结束。', '2020-10-22 21:09:10');
INSERT INTO `sys_notice` VALUES (29, 1, '高级研发工程师-王美美提起请假申请[2020-10-01-00时-2020-10-31-00时]，请尽快审批。', '2020-10-22 21:09:10');
INSERT INTO `sys_notice` VALUES (30, 2, '高级研发工程师-王美美提起请假申请[2020-10-01-00时-2020-10-31-00时]你已批准,审批意见：同意,审批已结束。', '2020-10-22 21:09:10');
INSERT INTO `sys_notice` VALUES (31, 3, '你的请假申请[2020-10-01-00时-2020-10-31-00时]总经理张晓涛已批准,审批意见：同意,审批已结束。', '2020-10-22 21:09:53');
INSERT INTO `sys_notice` VALUES (32, 1, '高级研发工程师-王美美提起请假申请[2020-10-01-00时-2020-10-31-00时]你已批准,审批意见：同意,审批已结束。', '2020-10-22 21:09:53');
INSERT INTO `sys_notice` VALUES (33, 4, '你的请假申请[2020-10-18-00时-2020-10-31-00时]已提交，请等待上级审批。', '2020-10-23 08:40:15');
INSERT INTO `sys_notice` VALUES (34, 2, '研发工程师-宋彩妮提起请假申请[2020-10-18-00时-2020-10-31-00时],请尽快审批', '2020-10-23 08:40:15');
INSERT INTO `sys_notice` VALUES (35, 4, '你的请假申请[2020-10-18-00时-2020-10-31-00时]部门经理齐紫陌已批准,审批意见：不要过于伤心,请继续等待上级审批。', '2020-10-23 08:41:45');
INSERT INTO `sys_notice` VALUES (36, 1, '研发工程师-宋彩妮提起请假申请[2020-10-18-00时-2020-10-31-00时]，请尽快审批。', '2020-10-23 08:41:45');
INSERT INTO `sys_notice` VALUES (37, 2, '研发工程师-宋彩妮提起请假申请[2020-10-18-00时-2020-10-31-00时]你已批准,审批意见：不要过于伤心,请等待上级批准。', '2020-10-23 08:41:45');
INSERT INTO `sys_notice` VALUES (38, 4, '你的请假申请[2020-10-18-00时-2020-10-31-00时]总经理张晓涛已批准,审批意见：同意,审批已结束。', '2020-10-23 08:43:01');
INSERT INTO `sys_notice` VALUES (39, 1, '研发工程师-宋彩妮提起请假申请[2020-10-18-00时-2020-10-31-00时]你已批准,审批意见：同意,审批已结束。', '2020-10-23 08:43:01');
INSERT INTO `sys_notice` VALUES (40, 5, '你的请假申请[2020-10-23-00时-2020-10-30-00时]已提交，请等待上级审批。', '2020-10-23 08:45:37');
INSERT INTO `sys_notice` VALUES (41, 2, '初级研发工程师-欧阳峰提起请假申请[2020-10-23-00时-2020-10-30-00时],请尽快审批', '2020-10-23 08:45:37');
INSERT INTO `sys_notice` VALUES (42, 5, '你的请假申请[2020-10-23-00时-2020-10-30-00时]部门经理齐紫陌已批准,审批意见：同意,请继续等待上级审批。', '2020-10-23 08:46:14');
INSERT INTO `sys_notice` VALUES (43, 1, '初级研发工程师-欧阳峰提起请假申请[2020-10-23-00时-2020-10-30-00时]，请尽快审批。', '2020-10-23 08:46:14');
INSERT INTO `sys_notice` VALUES (44, 2, '初级研发工程师-欧阳峰提起请假申请[2020-10-23-00时-2020-10-30-00时]你已批准,审批意见：同意,请等待上级批准。', '2020-10-23 08:46:14');
INSERT INTO `sys_notice` VALUES (45, 5, '你的请假申请[2020-10-23-00时-2020-10-30-00时]总经理张晓涛已批准,审批意见：同意,审批已结束。', '2020-10-23 08:50:52');
INSERT INTO `sys_notice` VALUES (46, 1, '初级研发工程师-欧阳峰提起请假申请[2020-10-23-00时-2020-10-30-00时]你已批准,审批意见：同意,审批已结束。', '2020-10-23 08:50:52');
INSERT INTO `sys_notice` VALUES (47, 3, '你的请假申请[2020-10-18-00时-2020-10-24-00时]已提交，请你等待上级审批。', '2020-10-23 08:55:41');
INSERT INTO `sys_notice` VALUES (48, 2, '高级研发工程师-王美美提起请假申请[2020-10-18-00时-2020-10-24-00时],请尽快审批', '2020-10-23 08:55:41');
INSERT INTO `sys_notice` VALUES (49, 3, '你的请假申请[2020-10-18-00时-2020-10-24-00时]部门经理齐紫陌已批准,审批意见：同意,请继续等待上级审批。', '2020-10-23 08:56:36');
INSERT INTO `sys_notice` VALUES (50, 1, '高级研发工程师-王美美提起请假申请[2020-10-18-00时-2020-10-24-00时]，请尽快审批。', '2020-10-23 08:56:36');
INSERT INTO `sys_notice` VALUES (51, 2, '高级研发工程师-王美美提起请假申请[2020-10-18-00时-2020-10-24-00时]你已批准,审批意见：同意,审批已结束。', '2020-10-23 08:56:36');
INSERT INTO `sys_notice` VALUES (52, 3, '你的请假申请[2020-10-18-00时-2020-10-24-00时]总经理张晓涛已批准,审批意见：同意,审批已结束。', '2020-10-23 08:57:45');
INSERT INTO `sys_notice` VALUES (53, 1, '高级研发工程师-王美美提起请假申请[2020-10-18-00时-2020-10-24-00时]你已批准,审批意见：同意,审批已结束。', '2020-10-23 08:57:45');
INSERT INTO `sys_notice` VALUES (54, 5, '你的请假申请[2020-10-11-00时-2020-10-24-00时]已提交，请你等待上级审批。', '2020-10-30 21:13:25');
INSERT INTO `sys_notice` VALUES (55, 2, '初级研发工程师-欧阳峰提起请假申请[2020-10-11-00时-2020-10-24-00时],请尽快审批', '2020-10-30 21:13:25');
INSERT INTO `sys_notice` VALUES (56, 5, '你的请假申请[2020-10-11-00时-2020-10-24-00时]部门经理齐紫陌已批准,审批意见：新婚快乐,请继续等待上级审批。', '2020-10-30 21:14:58');
INSERT INTO `sys_notice` VALUES (57, 1, '初级研发工程师-欧阳峰提起请假申请[2020-10-11-00时-2020-10-24-00时]，请尽快审批。', '2020-10-30 21:14:58');
INSERT INTO `sys_notice` VALUES (58, 2, '初级研发工程师-欧阳峰提起请假申请[2020-10-11-00时-2020-10-24-00时]你已批准,审批意见：新婚快乐,审批已结束。', '2020-10-30 21:14:58');
INSERT INTO `sys_notice` VALUES (59, 5, '你的请假申请[2020-10-11-00时-2020-10-24-00时]总经理张晓涛已批准,审批意见：新婚快乐,审批已结束。', '2020-10-30 21:15:48');
INSERT INTO `sys_notice` VALUES (60, 1, '初级研发工程师-欧阳峰提起请假申请[2020-10-11-00时-2020-10-24-00时]你已批准,审批意见：新婚快乐,审批已结束。', '2020-10-30 21:15:48');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `role_description` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色描述',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '业务岗角色');
INSERT INTO `sys_role` VALUES (2, '管理岗角色');

-- ----------------------------
-- Table structure for sys_role_node
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_node`;
CREATE TABLE `sys_role_node`  (
  `rn_id` bigint(0) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(0) NOT NULL,
  `node_id` bigint(0) NOT NULL,
  PRIMARY KEY (`rn_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_node
-- ----------------------------
INSERT INTO `sys_role_node` VALUES (1, 1, 1);
INSERT INTO `sys_role_node` VALUES (2, 1, 2);
INSERT INTO `sys_role_node` VALUES (3, 1, 3);
INSERT INTO `sys_role_node` VALUES (4, 2, 1);
INSERT INTO `sys_role_node` VALUES (5, 2, 2);
INSERT INTO `sys_role_node` VALUES (6, 2, 3);
INSERT INTO `sys_role_node` VALUES (7, 2, 4);

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user`  (
  `ru_id` bigint(0) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(0) NOT NULL,
  `user_id` int(0) NOT NULL,
  PRIMARY KEY (`ru_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES (1, 2, 1);
INSERT INTO `sys_role_user` VALUES (2, 2, 2);
INSERT INTO `sys_role_user` VALUES (3, 1, 3);
INSERT INTO `sys_role_user` VALUES (4, 1, 4);
INSERT INTO `sys_role_user` VALUES (5, 1, 5);
INSERT INTO `sys_role_user` VALUES (6, 2, 6);
INSERT INTO `sys_role_user` VALUES (7, 1, 7);
INSERT INTO `sys_role_user` VALUES (8, 1, 8);
INSERT INTO `sys_role_user` VALUES (9, 1, 9);
INSERT INTO `sys_role_user` VALUES (10, 1, 10);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `employee_id` bigint(0) NOT NULL COMMENT '员工编号',
  `salt` int(0) NOT NULL COMMENT '盐值',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'm8', 'f57e762e3fb7e1e3ec8ec4db6a1248e1', 1, 188);
INSERT INTO `sys_user` VALUES (2, 't7', 'dcfa022748271dccf5532c834e98ad08', 2, 189);
INSERT INTO `sys_user` VALUES (3, 't6', '76ce11f8b004e8bdc8b0976b177c620d', 3, 190);
INSERT INTO `sys_user` VALUES (4, 't5', '11f04f04054772bc1a8fdc41e70c7977', 4, 191);
INSERT INTO `sys_user` VALUES (5, 't4', '8d7713848189a8d5c224f94f65d18b06', 5, 192);
INSERT INTO `sys_user` VALUES (6, 's7', '044214e86e07d96c97de79a2222188cd', 6, 193);
INSERT INTO `sys_user` VALUES (7, 's6', 'ecbd2f592ee65838328236d06ce35252', 7, 194);
INSERT INTO `sys_user` VALUES (8, 's5', '846ecc83bba8fe420adc38b39f897201', 8, 195);
INSERT INTO `sys_user` VALUES (9, 's4', 'c1e523cd2daa02f6cf4b98b2f26585fd', 9, 196);
INSERT INTO `sys_user` VALUES (10, 's3', '89e89f369e07634fbb2286efffb9492b', 10, 197);

SET FOREIGN_KEY_CHECKS = 1;
