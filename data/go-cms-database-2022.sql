/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100135
 Source Host           : localhost:3306
 Source Schema         : go_cms

 Target Server Type    : MySQL
 Target Server Version : 100135
 File Encoding         : 65001

 Date: 23/03/2022 21:53:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_admin_log`;
CREATE TABLE `sys_admin_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `route` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `user_id` int NOT NULL DEFAULT 0,
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `created_at` int NOT NULL DEFAULT 0,
  `updated_at` int NOT NULL,
  `deleted_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '后台用户日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `adcode` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `citycode` int NOT NULL,
  `center` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `parent_id` int NOT NULL,
  `is_end` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `adcode`(`adcode`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '地区信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_area
-- ----------------------------

-- ----------------------------
-- Table structure for sys_article
-- ----------------------------
DROP TABLE IF EXISTS `sys_article`;
CREATE TABLE `sys_article`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `category_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '栏目id',
  `post_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'post标题',
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '发表者用户id',
  `post_status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态;1:已发布;0:未发布;',
  `comment_status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '评论状态;1:允许;0:不允许',
  `flag` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '1热门，2首页，3推荐',
  `post_hits` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '查看数',
  `post_favorites` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '收藏数',
  `post_like` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '点赞数',
  `comment_count` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '评论数',
  `post_keywords` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `post_excerpt` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'post摘要',
  `post_source` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '转载文章的来源',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '缩略图',
  `post_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文章内容',
  `created_at` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updated_at` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `created_at`(`created_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_article
-- ----------------------------

-- ----------------------------
-- Table structure for sys_category
-- ----------------------------
DROP TABLE IF EXISTS `sys_category`;
CREATE TABLE `sys_category`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `type` tinyint NOT NULL DEFAULT 1 COMMENT '栏目类型',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '栏目名称',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '别名',
  `flag` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '0,1火,2首页,3推荐',
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '外链',
  `is_nav` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否是导航',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `created_at` int NOT NULL COMMENT '创建时间',
  `updated_at` int NOT NULL COMMENT '更新时间',
  `deleted_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '删除时间',
  `weigh` int NOT NULL DEFAULT 0 COMMENT '权重',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态',
  `tpl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'list' COMMENT '模板文件',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `weigh`(`weigh`, `id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_category
-- ----------------------------

-- ----------------------------
-- Table structure for sys_configs
-- ----------------------------
DROP TABLE IF EXISTS `sys_configs`;
CREATE TABLE `sys_configs`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` tinyint(1) NULL DEFAULT 1 COMMENT '系统内置（1是 2否）',
  `created_by` int NULL DEFAULT NULL COMMENT '创建者',
  `updated_by` int NULL DEFAULT NULL COMMENT '更新着',
  `created_at` int NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` int NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp(0) NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_configs
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` int NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `created_at` int NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `updated_at` int NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, 0, '总公司', '开发部', 0, NULL, NULL, NULL, '0', '0', '', NULL, '', NULL, '');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` int NOT NULL COMMENT 'ID',
  `id` int NOT NULL AUTO_INCREMENT,
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `created_at` int NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `updated_at` int NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `dict_id` int NOT NULL COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `created_at` int NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `updated_at` int NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` int NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `menu_type` tinyint NULL DEFAULT NULL COMMENT '菜单类型（1,目录 2,菜单 3,按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` int NULL DEFAULT NULL COMMENT '创建者',
  `created_at` int NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` int NULL DEFAULT NULL COMMENT '更新者',
  `updated_at` int NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 165 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (0, '测试', 0, 0, '#', 1, '1', '', '#', 0, NULL, 0, NULL, '');
INSERT INTO `sys_menu` VALUES (1, '首页', 0, 1, 'index', 1, '0', NULL, '#', 0, NULL, 0, NULL, '');
INSERT INTO `sys_menu` VALUES (2, '登录', 0, 2, 'login', 1, '0', '[\'system:user:remove\']', '#', 0, NULL, 0, NULL, '');
INSERT INTO `sys_menu` VALUES (4, '测试4', 1, 3, 'management/config', 1, '0', '[\'system:user:remove\']', '#', 0, NULL, 0, NULL, '');
INSERT INTO `sys_menu` VALUES (5, '组件首页', 0, 0, 'demo/components/index', 1, '0', NULL, '#', 0, NULL, 0, NULL, '');
INSERT INTO `sys_menu` VALUES (6, 'demo-playground', 0, 0, '/demo/playground', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (7, 'demo-playground-index', 6, 0, '/demo/playground/index', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (8, 'demo-playground-store-page', 6, 0, '/demo/playground/store/page', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (9, 'demo-frame', 0, 0, '/demo/frame', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (10, 'demo-d2-crud', 0, 0, '/demo/d2-crud', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11, 'demo-plugins', 0, 0, '/demo/plugins', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (12, 'demo-charts', 0, 0, '/demo/charts', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (13, 'demo-components', 0, 0, '/demo/components', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (14, 'demo-business', 0, 0, '/demo/business', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (15, 'demo-playground-store-menu', 6, 0, '/demo/playground/store/menu', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (16, 'demo-playground-store-size', 6, 0, '/demo/playground/store/size', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (17, 'demo-playground-store-ua', 6, 0, '/demo/playground/store/ua', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (18, 'demo-playground-store-gray', 6, 0, '/demo/playground/store/gray', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (19, 'demo-playground-store-fullscreen', 6, 0, '/demo/playground/store/fullscreen', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (20, 'demo-playground-store-theme', 6, 0, '/demo/playground/store/theme', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (21, 'demo-playground-store-transition', 6, 0, '/demo/playground/store/transition', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (22, 'demo-playground-page-cache-on', 6, 0, '/demo/playground/page-cache/on', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (23, 'demo-playground-page-cache-off', 6, 0, '/demo/playground/page-cache/off', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (24, 'demo-playground-page-cache-params', 6, 0, '/demo/playground/page-cache/params/:id', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (25, 'demo-playground-page-argu-send', 6, 0, '/demo/playground/page-argu/send', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (26, 'demo-playground-page-argu-get', 6, 0, '/demo/playground/page-argu/get/:username', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (27, 'demo-playground-db-all', 6, 0, '/demo/playground/db/all', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (28, 'demo-playground-db-public', 6, 0, '/demo/playground/db/public', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (29, 'demo-playground-db-user', 6, 0, '/demo/playground/db/user', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (30, 'demo-playground-db-page-public', 6, 0, '/demo/playground/db/page-public', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (31, 'demo-playground-db-page-user', 6, 0, '/demo/playground/db/page-user', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (32, 'demo-playground-db-page-snapshot-public', 6, 0, '/demo/playground/db/page-snapshot-public', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (33, 'demo-playground-db-page-snapshot-user', 6, 0, '/demo/playground/db/page-snapshot-user', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (34, 'demo-playground-log-ajax', 6, 0, '/demo/playground/log/ajax', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (35, 'demo-playground-log-console', 6, 0, '/demo/playground/log/console', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (36, 'demo-playground-log-error', 6, 0, '/demo/playground/log/error', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (37, 'demo-playground-log-log', 6, 0, '/demo/playground/log/log', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (38, 'demo-playground-add-routes-routes', 6, 0, '/demo/playground/add-routes/routes', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (39, 'demo-playground-env', 6, 0, '/demo/playground/env', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (40, 'demo-playground-locales', 6, 0, '/demo/playground/locales', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (41, 'demo-frame-index', 9, 0, '/demo/frame/index', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (42, 'demo-frame-html', 9, 0, '/demo/frame/html', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (43, 'demo-frame-d2-doc', 9, 0, '/demo/frame/d2-doc', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (44, 'demo-d2-crud-index', 10, 0, '/demo/d2-crud/index', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (45, 'demo-d2-crud-demo1', 10, 0, '/demo/d2-crud/demo1', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (46, 'demo-d2-crud-demo2', 10, 0, '/demo/d2-crud/demo2', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (47, 'demo-d2-crud-demo3', 10, 0, '/demo/d2-crud/demo3', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (48, 'demo-d2-crud-demo4', 10, 0, '/demo/d2-crud/demo4', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (49, 'demo-d2-crud-demo5', 10, 0, '/demo/d2-crud/demo5', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (50, 'demo-d2-crud-demo6', 10, 0, '/demo/d2-crud/demo6', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (51, 'demo-d2-crud-demo7', 10, 0, '/demo/d2-crud/demo7', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (52, 'demo-d2-crud-demo8', 10, 0, '/demo/d2-crud/demo8', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (53, 'demo-d2-crud-demo9', 10, 0, '/demo/d2-crud/demo9', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (54, 'demo-d2-crud-demo10', 10, 0, '/demo/d2-crud/demo10', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (55, 'demo-d2-crud-demo11', 10, 0, '/demo/d2-crud/demo11', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (56, 'demo-d2-crud-demo12', 10, 0, '/demo/d2-crud/demo12', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (57, 'demo-d2-crud-demo13', 10, 0, '/demo/d2-crud/demo13', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (58, 'demo-d2-crud-demo14', 10, 0, '/demo/d2-crud/demo14', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (59, 'demo-d2-crud-demo15', 10, 0, '/demo/d2-crud/demo15', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (60, 'demo-d2-crud-demo16', 10, 0, '/demo/d2-crud/demo16', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (61, 'demo-d2-crud-demo17', 10, 0, '/demo/d2-crud/demo17', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (62, 'demo-d2-crud-demo18', 10, 0, '/demo/d2-crud/demo18', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (63, 'demo-d2-crud-demo19', 10, 0, '/demo/d2-crud/demo19', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (64, 'demo-d2-crud-demo20', 10, 0, '/demo/d2-crud/demo20', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (65, 'demo-d2-crud-demo21', 10, 0, '/demo/d2-crud/demo21', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (66, 'demo-d2-crud-demo22', 10, 0, '/demo/d2-crud/demo22', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (67, 'demo-d2-crud-demo23', 10, 0, '/demo/d2-crud/demo23', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (68, 'demo-d2-crud-demo24', 10, 0, '/demo/d2-crud/demo24', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (69, 'demo-d2-crud-demo25', 10, 0, '/demo/d2-crud/demo25', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (70, 'demo-d2-crud-demo26', 10, 0, '/demo/d2-crud/demo26', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (71, 'demo-d2-crud-demo27', 10, 0, '/demo/d2-crud/demo27', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (72, 'demo-d2-crud-demo28', 10, 0, '/demo/d2-crud/demo28', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (73, 'demo-d2-crud-demo29', 10, 0, '/demo/d2-crud/demo29', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (74, 'demo-d2-crud-demo30', 10, 0, '/demo/d2-crud/demo30', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (75, 'demo-d2-crud-demo31', 10, 0, '/demo/d2-crud/demo31', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (76, 'demo-plugins-better-scroll-base', 11, 0, '/demo/plugins/better-scroll/base', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (77, 'demo-plugins-better-scroll-to', 11, 0, '/demo/plugins/better-scroll/to', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (78, 'demo-plugins-clipboard-polyfill', 11, 0, '/demo/plugins/clipboard-polyfill', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (79, 'demo-plugins-day', 11, 0, '/demo/plugins/day', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (80, 'demo-plugins-export-table', 11, 0, '/demo/plugins/export/table', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (81, 'demo-plugins-export-txt', 11, 0, '/demo/plugins/export/txt', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (82, 'demo-plugins-import-csv', 11, 0, '/demo/plugins/import/csv', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (83, 'demo-plugins-import-xlsx', 11, 0, '/demo/plugins/import/xlsx', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (84, 'demo-plugins-index', 11, 0, '/demo/plugins/index', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (85, 'demo-plugins-js-cookie', 11, 0, '/demo/plugins/js-cookie', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (86, 'demo-plugins-mock-ajax', 11, 0, '/demo/plugins/mock/ajax', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (87, 'demo-plugins-mock-dpd', 11, 0, '/demo/plugins/mock/dpd', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (88, 'demo-plugins-mock-dtd', 11, 0, '/demo/plugins/mock/dtd', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (89, 'demo-charts-index', 12, 0, '/demo/charts/index', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (90, 'demo-charts-list-line-demo1', 12, 0, '/demo/charts/list/line/demo1', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (91, 'demo-charts-list-line-demo2', 12, 0, '/demo/charts/list/line/demo2', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (92, 'demo-charts-list-line-demo3', 12, 0, '/demo/charts/list/line/demo3', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (93, 'demo-charts-list-line-demo4', 12, 0, '/demo/charts/list/line/demo4', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (94, 'demo-charts-list-line-demo5', 12, 0, '/demo/charts/list/line/demo5', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (95, 'demo-charts-list-histogram-demo1', 12, 0, '/demo/charts/list/histogram/demo1', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (96, 'demo-charts-list-histogram-demo2', 12, 0, '/demo/charts/list/histogram/demo2', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (97, 'demo-charts-list-histogram-demo3', 12, 0, '/demo/charts/list/histogram/demo3', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (98, 'demo-charts-list-histogram-demo4', 12, 0, '/demo/charts/list/histogram/demo4', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (99, 'demo-charts-list-histogram-demo5', 12, 0, '/demo/charts/list/histogram/demo5', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (100, 'demo-charts-list-histogram-demo6', 12, 0, '/demo/charts/list/histogram/demo6', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (101, 'demo-charts-list-bar-demo1', 12, 0, '/demo/charts/list/bar/demo1', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (102, 'demo-charts-list-bar-demo2', 12, 0, '/demo/charts/list/bar/demo2', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (103, 'demo-charts-list-bar-demo3', 12, 0, '/demo/charts/list/bar/demo3', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (104, 'demo-charts-list-bar-demo4', 12, 0, '/demo/charts/list/bar/demo4', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (105, 'demo-charts-list-bar-demo5', 12, 0, '/demo/charts/list/bar/demo5', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (106, 'demo-charts-list-pie-demo1', 12, 0, '/demo/charts/list/pie/demo1', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (107, 'demo-charts-list-pie-demo2', 12, 0, '/demo/charts/list/pie/demo2', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (108, 'demo-charts-list-pie-demo3', 12, 0, '/demo/charts/list/pie/demo3', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (109, 'demo-charts-list-pie-demo4', 12, 0, '/demo/charts/list/pie/demo4', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (110, 'demo-charts-list-pie-demo5', 12, 0, '/demo/charts/list/pie/demo5', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (111, 'demo-charts-list-pie-demo6', 12, 0, '/demo/charts/list/pie/demo6', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (112, 'demo-charts-list-ring-demo1', 12, 0, '/demo/charts/list/ring/demo1', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (113, 'demo-charts-list-ring-demo2', 12, 0, '/demo/charts/list/ring/demo2', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (114, 'demo-charts-list-ring-demo3', 12, 0, '/demo/charts/list/ring/demo3', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (115, 'demo-charts-list-ring-demo4', 12, 0, '/demo/charts/list/ring/demo4', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (116, 'demo-charts-list-ring-demo5', 12, 0, '/demo/charts/list/ring/demo5', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (117, 'demo-charts-list-waterfall-demo1', 12, 0, '/demo/charts/list/waterfall/demo1', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (118, 'demo-charts-list-funnel-demo1', 12, 0, '/demo/charts/list/funnel/demo1', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (119, 'demo-charts-list-funnel-demo2', 12, 0, '/demo/charts/list/funnel/demo2', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (120, 'demo-charts-list-radar-demo1', 12, 0, '/demo/charts/list/radar/demo1', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (121, 'demo-charts-list-map-demo1', 12, 0, '/demo/charts/list/map/demo1', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (122, 'demo-charts-list-map-demo2', 12, 0, '/demo/charts/list/map/demo2', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (123, 'demo-charts-list-map-demo3', 12, 0, '/demo/charts/list/map/demo3', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (124, 'demo-charts-list-sankey-demo1', 12, 0, '/demo/charts/list/sankey/demo1', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (125, 'demo-charts-list-heatmap-demo1', 12, 0, '/demo/charts/list/heatmap/demo1', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (126, 'demo-charts-list-heatmap-demo2', 12, 0, '/demo/charts/list/heatmap/demo2', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (127, 'demo-charts-list-scatter-demo1', 12, 0, '/demo/charts/list/scatter/demo1', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (128, 'demo-charts-list-scatter-demo2', 12, 0, '/demo/charts/list/scatter/demo2', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (129, 'demo-charts-list-candle-demo1', 12, 0, '/demo/charts/list/candle/demo1', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (130, 'demo-charts-list-candle-demo2', 12, 0, '/demo/charts/list/candle/demo2', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (131, 'demo-charts-list-candle-demo3', 12, 0, '/demo/charts/list/candle/demo3', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (132, 'demo-charts-list-gauge-demo1', 12, 0, '/demo/charts/list/gauge/demo1', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (133, 'demo-charts-list-tree-demo1', 12, 0, '/demo/charts/list/tree/demo1', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (134, 'demo-components-container-full', 13, 0, '/demo/components/container/full', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (135, 'demo-components-container-full-slot', 13, 0, '/demo/components/container/full-slot', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (136, 'demo-components-container-full-bs', 13, 0, '/demo/components/container/full-bs', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (137, 'demo-components-container-ghost', 13, 0, '/demo/components/container/ghost', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (138, 'demo-components-container-ghost-slot', 13, 0, '/demo/components/container/ghost-slot', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (139, 'demo-components-container-ghost-bs', 13, 0, '/demo/components/container/ghost-bs', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (140, 'demo-components-container-card', 13, 0, '/demo/components/container/card', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (141, 'demo-components-container-card-slot', 13, 0, '/demo/components/container/card-slot', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (142, 'demo-components-container-card-bs', 13, 0, '/demo/components/container/card-bs', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (143, 'demo-components-container-api', 13, 0, '/demo/components/container/api', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (144, 'demo-components-countup', 13, 0, '/demo/components/countup', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (145, 'demo-components-editor-ueditor', 13, 0, '/demo/components/editor-ueditor', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (146, 'demo-components-editor-quill', 13, 0, '/demo/components/editor-quill', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (147, 'demo-components-editor-simpleMDE', 13, 0, '/demo/components/editor-simpleMDE', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (148, 'demo-components-highlight', 13, 0, '/demo/components/highlight', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (149, 'demo-components-icon-icon', 13, 0, '/demo/components/icon/icon', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (150, 'demo-components-icon-icon-svg', 13, 0, '/demo/components/icon/icon-svg', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (151, 'demo-components-icon-select', 13, 0, '/demo/components/icon/select', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (152, 'demo-components-icon-select-svg', 13, 0, '/demo/components/icon/select-svg', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (153, 'demo-components-icon-list', 13, 0, '/demo/components/icon/list', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (154, 'demo-components-index', 13, 0, '/demo/components/index', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (155, 'demo-components-json-tree', 13, 0, '/demo/components/json-tree', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (156, 'demo-components-layout-grid', 13, 0, '/demo/components/layout/grid', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (157, 'demo-components-layout-splitpane', 13, 0, '/demo/components/layout/splitpane', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (158, 'demo-components-markdown-source', 13, 0, '/demo/components/markdown/source', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (159, 'demo-components-markdown-url', 13, 0, '/demo/components/markdown/url', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (160, 'demo-business-index', 14, 0, '/demo/business/index', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (161, 'demo-business-table-1', 14, 0, '/demo/business/table/1', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (162, 'demo-business-issues-142', 14, 0, '/demo/business/issues/142', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (163, 'demo-business-issues-142-edit\'', 14, 0, '/demo/business/issues/142/edit/:id', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (164, 'demo-business-issues-142-edit-cache-db\'', 14, 0, '/demo/business/issues/142/edit-cache-db/:id', 1, '1', NULL, '#', NULL, NULL, NULL, NULL, '');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `created_at` int NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `updated_at` int NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_post
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `created_at` int NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `updated_at` int NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', '94b3cca6416e9b6fcac7b4463c0a19c6', 0, '1', '', '0', '', NULL, '', NULL, NULL);
INSERT INTO `sys_role` VALUES (2, '管理员', 'c17c3e60054316f15afad0f035e5b865', 1, '1', '', '0', '', NULL, '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` int NOT NULL COMMENT '角色ID',
  `dept_id` int NOT NULL COMMENT '部门ID',
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (1, 1, 1);
INSERT INTO `sys_role_dept` VALUES (2, 1, 2);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` int NOT NULL COMMENT '角色ID',
  `menu_id` int NOT NULL COMMENT '菜单ID',
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 165 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 2, 2);
INSERT INTO `sys_role_menu` VALUES (1, 3, 3);
INSERT INTO `sys_role_menu` VALUES (1, 4, 4);
INSERT INTO `sys_role_menu` VALUES (1, 5, 5);
INSERT INTO `sys_role_menu` VALUES (1, 6, 6);
INSERT INTO `sys_role_menu` VALUES (1, 7, 7);
INSERT INTO `sys_role_menu` VALUES (1, 8, 8);
INSERT INTO `sys_role_menu` VALUES (1, 9, 9);
INSERT INTO `sys_role_menu` VALUES (1, 10, 10);
INSERT INTO `sys_role_menu` VALUES (1, 11, 11);
INSERT INTO `sys_role_menu` VALUES (1, 12, 12);
INSERT INTO `sys_role_menu` VALUES (1, 13, 13);
INSERT INTO `sys_role_menu` VALUES (1, 14, 14);
INSERT INTO `sys_role_menu` VALUES (1, 15, 15);
INSERT INTO `sys_role_menu` VALUES (1, 16, 16);
INSERT INTO `sys_role_menu` VALUES (1, 17, 17);
INSERT INTO `sys_role_menu` VALUES (1, 18, 18);
INSERT INTO `sys_role_menu` VALUES (1, 19, 19);
INSERT INTO `sys_role_menu` VALUES (1, 20, 20);
INSERT INTO `sys_role_menu` VALUES (1, 21, 21);
INSERT INTO `sys_role_menu` VALUES (1, 22, 22);
INSERT INTO `sys_role_menu` VALUES (1, 23, 23);
INSERT INTO `sys_role_menu` VALUES (1, 24, 24);
INSERT INTO `sys_role_menu` VALUES (1, 25, 25);
INSERT INTO `sys_role_menu` VALUES (1, 26, 26);
INSERT INTO `sys_role_menu` VALUES (1, 27, 27);
INSERT INTO `sys_role_menu` VALUES (1, 28, 28);
INSERT INTO `sys_role_menu` VALUES (1, 29, 29);
INSERT INTO `sys_role_menu` VALUES (1, 30, 30);
INSERT INTO `sys_role_menu` VALUES (1, 31, 31);
INSERT INTO `sys_role_menu` VALUES (1, 32, 32);
INSERT INTO `sys_role_menu` VALUES (1, 33, 33);
INSERT INTO `sys_role_menu` VALUES (1, 34, 34);
INSERT INTO `sys_role_menu` VALUES (1, 35, 35);
INSERT INTO `sys_role_menu` VALUES (1, 36, 36);
INSERT INTO `sys_role_menu` VALUES (1, 37, 37);
INSERT INTO `sys_role_menu` VALUES (1, 38, 38);
INSERT INTO `sys_role_menu` VALUES (1, 39, 39);
INSERT INTO `sys_role_menu` VALUES (1, 40, 40);
INSERT INTO `sys_role_menu` VALUES (1, 41, 41);
INSERT INTO `sys_role_menu` VALUES (1, 42, 42);
INSERT INTO `sys_role_menu` VALUES (1, 43, 43);
INSERT INTO `sys_role_menu` VALUES (1, 44, 44);
INSERT INTO `sys_role_menu` VALUES (1, 45, 45);
INSERT INTO `sys_role_menu` VALUES (1, 46, 46);
INSERT INTO `sys_role_menu` VALUES (1, 47, 47);
INSERT INTO `sys_role_menu` VALUES (1, 48, 48);
INSERT INTO `sys_role_menu` VALUES (1, 49, 49);
INSERT INTO `sys_role_menu` VALUES (1, 50, 50);
INSERT INTO `sys_role_menu` VALUES (1, 51, 51);
INSERT INTO `sys_role_menu` VALUES (1, 52, 52);
INSERT INTO `sys_role_menu` VALUES (1, 53, 53);
INSERT INTO `sys_role_menu` VALUES (1, 54, 54);
INSERT INTO `sys_role_menu` VALUES (1, 55, 55);
INSERT INTO `sys_role_menu` VALUES (1, 56, 56);
INSERT INTO `sys_role_menu` VALUES (1, 57, 57);
INSERT INTO `sys_role_menu` VALUES (1, 58, 58);
INSERT INTO `sys_role_menu` VALUES (1, 59, 59);
INSERT INTO `sys_role_menu` VALUES (1, 60, 60);
INSERT INTO `sys_role_menu` VALUES (1, 61, 61);
INSERT INTO `sys_role_menu` VALUES (1, 62, 62);
INSERT INTO `sys_role_menu` VALUES (1, 63, 63);
INSERT INTO `sys_role_menu` VALUES (1, 64, 64);
INSERT INTO `sys_role_menu` VALUES (1, 65, 65);
INSERT INTO `sys_role_menu` VALUES (1, 66, 66);
INSERT INTO `sys_role_menu` VALUES (1, 67, 67);
INSERT INTO `sys_role_menu` VALUES (1, 68, 68);
INSERT INTO `sys_role_menu` VALUES (1, 69, 69);
INSERT INTO `sys_role_menu` VALUES (1, 70, 70);
INSERT INTO `sys_role_menu` VALUES (1, 71, 71);
INSERT INTO `sys_role_menu` VALUES (1, 72, 72);
INSERT INTO `sys_role_menu` VALUES (1, 73, 73);
INSERT INTO `sys_role_menu` VALUES (1, 74, 74);
INSERT INTO `sys_role_menu` VALUES (1, 75, 75);
INSERT INTO `sys_role_menu` VALUES (1, 76, 76);
INSERT INTO `sys_role_menu` VALUES (1, 77, 77);
INSERT INTO `sys_role_menu` VALUES (1, 78, 78);
INSERT INTO `sys_role_menu` VALUES (1, 79, 79);
INSERT INTO `sys_role_menu` VALUES (1, 80, 80);
INSERT INTO `sys_role_menu` VALUES (1, 81, 81);
INSERT INTO `sys_role_menu` VALUES (1, 82, 82);
INSERT INTO `sys_role_menu` VALUES (1, 83, 83);
INSERT INTO `sys_role_menu` VALUES (1, 84, 84);
INSERT INTO `sys_role_menu` VALUES (1, 85, 85);
INSERT INTO `sys_role_menu` VALUES (1, 86, 86);
INSERT INTO `sys_role_menu` VALUES (1, 87, 87);
INSERT INTO `sys_role_menu` VALUES (1, 88, 88);
INSERT INTO `sys_role_menu` VALUES (1, 89, 89);
INSERT INTO `sys_role_menu` VALUES (1, 90, 90);
INSERT INTO `sys_role_menu` VALUES (1, 91, 91);
INSERT INTO `sys_role_menu` VALUES (1, 92, 92);
INSERT INTO `sys_role_menu` VALUES (1, 93, 93);
INSERT INTO `sys_role_menu` VALUES (1, 94, 94);
INSERT INTO `sys_role_menu` VALUES (1, 95, 95);
INSERT INTO `sys_role_menu` VALUES (1, 96, 96);
INSERT INTO `sys_role_menu` VALUES (1, 97, 97);
INSERT INTO `sys_role_menu` VALUES (1, 98, 98);
INSERT INTO `sys_role_menu` VALUES (1, 99, 99);
INSERT INTO `sys_role_menu` VALUES (1, 100, 100);
INSERT INTO `sys_role_menu` VALUES (1, 101, 101);
INSERT INTO `sys_role_menu` VALUES (1, 102, 102);
INSERT INTO `sys_role_menu` VALUES (1, 103, 103);
INSERT INTO `sys_role_menu` VALUES (1, 104, 104);
INSERT INTO `sys_role_menu` VALUES (1, 105, 105);
INSERT INTO `sys_role_menu` VALUES (1, 106, 106);
INSERT INTO `sys_role_menu` VALUES (1, 107, 107);
INSERT INTO `sys_role_menu` VALUES (1, 108, 108);
INSERT INTO `sys_role_menu` VALUES (1, 109, 109);
INSERT INTO `sys_role_menu` VALUES (1, 110, 110);
INSERT INTO `sys_role_menu` VALUES (1, 111, 111);
INSERT INTO `sys_role_menu` VALUES (1, 112, 112);
INSERT INTO `sys_role_menu` VALUES (1, 113, 113);
INSERT INTO `sys_role_menu` VALUES (1, 114, 114);
INSERT INTO `sys_role_menu` VALUES (1, 115, 115);
INSERT INTO `sys_role_menu` VALUES (1, 116, 116);
INSERT INTO `sys_role_menu` VALUES (1, 117, 117);
INSERT INTO `sys_role_menu` VALUES (1, 118, 118);
INSERT INTO `sys_role_menu` VALUES (1, 119, 119);
INSERT INTO `sys_role_menu` VALUES (1, 120, 120);
INSERT INTO `sys_role_menu` VALUES (1, 121, 121);
INSERT INTO `sys_role_menu` VALUES (1, 122, 122);
INSERT INTO `sys_role_menu` VALUES (1, 123, 123);
INSERT INTO `sys_role_menu` VALUES (1, 124, 124);
INSERT INTO `sys_role_menu` VALUES (1, 125, 125);
INSERT INTO `sys_role_menu` VALUES (1, 126, 126);
INSERT INTO `sys_role_menu` VALUES (1, 127, 127);
INSERT INTO `sys_role_menu` VALUES (1, 128, 128);
INSERT INTO `sys_role_menu` VALUES (1, 129, 129);
INSERT INTO `sys_role_menu` VALUES (1, 130, 130);
INSERT INTO `sys_role_menu` VALUES (1, 131, 131);
INSERT INTO `sys_role_menu` VALUES (1, 132, 132);
INSERT INTO `sys_role_menu` VALUES (1, 133, 133);
INSERT INTO `sys_role_menu` VALUES (1, 134, 134);
INSERT INTO `sys_role_menu` VALUES (1, 135, 135);
INSERT INTO `sys_role_menu` VALUES (1, 136, 136);
INSERT INTO `sys_role_menu` VALUES (1, 137, 137);
INSERT INTO `sys_role_menu` VALUES (1, 138, 138);
INSERT INTO `sys_role_menu` VALUES (1, 139, 139);
INSERT INTO `sys_role_menu` VALUES (1, 140, 140);
INSERT INTO `sys_role_menu` VALUES (1, 141, 141);
INSERT INTO `sys_role_menu` VALUES (1, 142, 142);
INSERT INTO `sys_role_menu` VALUES (1, 143, 143);
INSERT INTO `sys_role_menu` VALUES (1, 144, 144);
INSERT INTO `sys_role_menu` VALUES (1, 145, 145);
INSERT INTO `sys_role_menu` VALUES (1, 146, 146);
INSERT INTO `sys_role_menu` VALUES (1, 147, 147);
INSERT INTO `sys_role_menu` VALUES (1, 148, 148);
INSERT INTO `sys_role_menu` VALUES (1, 149, 149);
INSERT INTO `sys_role_menu` VALUES (1, 150, 150);
INSERT INTO `sys_role_menu` VALUES (1, 151, 151);
INSERT INTO `sys_role_menu` VALUES (1, 152, 152);
INSERT INTO `sys_role_menu` VALUES (1, 153, 153);
INSERT INTO `sys_role_menu` VALUES (1, 154, 154);
INSERT INTO `sys_role_menu` VALUES (1, 155, 155);
INSERT INTO `sys_role_menu` VALUES (1, 156, 156);
INSERT INTO `sys_role_menu` VALUES (1, 157, 157);
INSERT INTO `sys_role_menu` VALUES (1, 158, 158);
INSERT INTO `sys_role_menu` VALUES (1, 159, 159);
INSERT INTO `sys_role_menu` VALUES (1, 160, 160);
INSERT INTO `sys_role_menu` VALUES (1, 161, 161);
INSERT INTO `sys_role_menu` VALUES (1, 162, 162);
INSERT INTO `sys_role_menu` VALUES (1, 163, 163);
INSERT INTO `sys_role_menu` VALUES (1, 164, 164);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` tinyint NULL DEFAULT 1 COMMENT '用户类型（1系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phone` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '别名',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` tinyint(1) NULL DEFAULT 1 COMMENT '用户性别（1男 2女 3未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '帐号状态（1正常 2禁用）',
  `del_flag` tinyint NULL DEFAULT 1 COMMENT '删除标志（1代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_date` int NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `created_at` int NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `updated_at` int NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp(0) NULL DEFAULT NULL COMMENT '删除时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_name`(`user_name`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'admin', 1, '', NULL, '', '', 1, '', '578f1666877813a17c12111b50b1d14f', '12345678', 1, 1, '127.0.0.1', 2022, '', NULL, '', 2022, NULL, '');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` int NOT NULL COMMENT '用户ID',
  `post_id` int NOT NULL COMMENT '岗位ID',
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` int NOT NULL COMMENT '用户ID',
  `role_id` int NOT NULL COMMENT '角色ID',
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1, 1);
INSERT INTO `sys_user_role` VALUES (1, 2, 2);

SET FOREIGN_KEY_CHECKS = 1;
