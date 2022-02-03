
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ev_article_cate
-- ----------------------------
DROP TABLE IF EXISTS `ev_article_cate`;
CREATE TABLE `ev_article_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `is_delete` tinyint(1) NOT NULL COMMENT '1删除 0未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ev_article_cate
-- ----------------------------
BEGIN;
INSERT INTO `ev_article_cate` VALUES (5, '科学', 'kexue', 0);
INSERT INTO `ev_article_cate` VALUES (6, 'dd', 'ddsf', 0);
INSERT INTO `ev_article_cate` VALUES (7, 'gffg', 'fgfg', 0);
INSERT INTO `ev_article_cate` VALUES (8, 'fdggdft', 'fghf', 0);
INSERT INTO `ev_article_cate` VALUES (9, 'ewfew', 'ergfre', 0);
INSERT INTO `ev_article_cate` VALUES (10, '高端复古的风格', 'fdgf', 0);
INSERT INTO `ev_article_cate` VALUES (11, 'v第三方v', 'dffd', 0);
INSERT INTO `ev_article_cate` VALUES (12, 'd VS大公司的人', 'ff', 0);
INSERT INTO `ev_article_cate` VALUES (13, '法国人果然符合个人天', 'fffdrgr', 0);
INSERT INTO `ev_article_cate` VALUES (14, '饿得多', 'dfdfgh', 0);
INSERT INTO `ev_article_cate` VALUES (15, '隆隆', 'ddrfr', 0);
INSERT INTO `ev_article_cate` VALUES (16, '测试2', 'fdsafsd', 0);
INSERT INTO `ev_article_cate` VALUES (17, '测试3', 'dsdfsf', 0);
INSERT INTO `ev_article_cate` VALUES (18, '测试4', '444', 0);
COMMIT;

-- ----------------------------
-- Table structure for ev_articles
-- ----------------------------
DROP TABLE IF EXISTS `ev_articles`;
CREATE TABLE `ev_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL COMMENT '文章内容',
  `cover_img` varchar(255) NOT NULL COMMENT '文章封面',
  `pub_date` varchar(255) NOT NULL COMMENT '文章发表日期',
  `state` varchar(255) NOT NULL COMMENT '发布状态',
  `cate_id` int(11) NOT NULL COMMENT '分类ID',
  `author_id` int(11) DEFAULT NULL COMMENT '作者ID',
  `content_view` text NOT NULL COMMENT '展示文章列表时的部分文章内容',
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `cate_id` (`cate_id`),
  CONSTRAINT `cate_id` FOREIGN KEY (`cate_id`) REFERENCES `ev_article_cate` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `ev_articles_ibfk_1` FOREIGN KEY (`cate_id`) REFERENCES `ev_article_cate` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `ev_articles_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `ev_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ev_articles
-- ----------------------------
BEGIN;
INSERT INTO `ev_articles` VALUES (33, '标题2', '携带的查询参数、动态参数、托管静态资源、模块化路由、中间件、全局生效、局部生效、中间件的分类、自定义中间件、cors中间件解决跨域问题、cors响应头部、JSONP接口、session认证、jwt认证Express创建服务器、监听GET、POST请求、把内容响应给客户端、获取URL中携带的查询参数、动态参数、托管静态资源、模块化路由、中间件、全局生效、局部生效、中间件的分类、自定义中间件、cors中间件解决跨域问题、cors响应头部、JSONP接口、session认证、jwt认证', '/uploads/2e6b9bf310618edd10c053c50261bd0d.jpg', '2022-01-30 20:49:59.766', '已发布', 5, 2, '携带的查询参数、动态参数、托管静态资源、模块化路由、中间件、全局生效、局部生效、中间件的分类、自定义...');
INSERT INTO `ev_articles` VALUES (34, '标题100', '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃佛啊家哦放假和奥哦安放哦啊额外加购i阿娥我就', '/uploads/1cfc9b5a0f90d04cd5ae197f28d4c75e.png', '2022-01-30 21:14:00.781', '草稿', 5, 16, '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃...');
INSERT INTO `ev_articles` VALUES (35, '标题100', '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃佛啊家哦放假和奥哦安放哦啊额外加购i阿娥我就', '/uploads/7a648ae21f782905bd1f30e7355e76d4.png', '2022-01-31 12:27:57.762', '草稿', 5, 16, '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃...');
INSERT INTO `ev_articles` VALUES (36, '标题100345523', '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃佛啊家哦放假和奥哦安放哦啊额外加购i阿娥我就', '/uploads/66497908db07b40cd9a992fb3a79b9b5.png', '2022-01-31 12:28:07.319', '草稿', 5, 16, '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃...');
INSERT INTO `ev_articles` VALUES (37, '标题100345523534', '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃佛啊家哦放假和奥哦安放哦啊额外加购i阿娥我就', '/uploads/90d28a531371bf33ebcf94d2751c3719.png', '2022-01-31 12:28:09.741', '草稿', 5, 16, '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃...');
INSERT INTO `ev_articles` VALUES (38, '标题100345523534', '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃佛啊家哦放假和奥哦安放哦啊额外加购i阿娥我就', '/uploads/791951d5f86adbee75bd5363745ecd2d.png', '2022-01-31 12:28:12.323', '草稿', 5, 16, '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃...');
INSERT INTO `ev_articles` VALUES (39, '标题100345523534', '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃佛啊家哦放假和奥哦安放哦啊额外加购i阿娥我就', '/uploads/fc300c99f80e59bf9eb01e81fc73f37d.png', '2022-01-31 12:28:12.901', '草稿', 5, 16, '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃...');
INSERT INTO `ev_articles` VALUES (40, '标题100345523534', '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃佛啊家哦放假和奥哦安放哦啊额外加购i阿娥我就', '/uploads/419bea30207e303c5098809934350915.png', '2022-01-31 12:28:13.300', '草稿', 5, 16, '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃...');
INSERT INTO `ev_articles` VALUES (41, '标题100345523534', '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃佛啊家哦放假和奥哦安放哦啊额外加购i阿娥我就', '/uploads/c9150ea6d4dd672c398be91c1e66b463.png', '2022-01-31 12:28:14.398', '草稿', 5, 16, '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃...');
INSERT INTO `ev_articles` VALUES (42, '标题100345523534', '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃佛啊家哦放假和奥哦安放哦啊额外加购i阿娥我就', '/uploads/043f2fc1bda072677d135dde63a3b069.png', '2022-01-31 12:28:15.011', '草稿', 5, 16, '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃...');
INSERT INTO `ev_articles` VALUES (43, '标题100323534', '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃佛啊家哦放假和奥哦安放哦啊额外加购i阿娥我就', '/uploads/3aa0a2f7e533bd83455b1f3708a727c3.png', '2022-01-31 12:28:25.784', '草稿', 5, 16, '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃...');
INSERT INTO `ev_articles` VALUES (44, '标题100323', '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃佛啊家哦放假和奥哦安放哦啊额外加购i阿娥我就', '/uploads/26bc80ca1d0d7cdf68a6cab299d10815.png', '2022-01-31 12:28:28.345', '草稿', 5, 16, '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃...');
INSERT INTO `ev_articles` VALUES (45, '标题1003', '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃佛啊家哦放假和奥哦安放哦啊额外加购i阿娥我就', '/uploads/91ef327aa785a07ed54569957a4a33f4.png', '2022-01-31 12:28:30.486', '草稿', 5, 16, '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃...');
INSERT INTO `ev_articles` VALUES (46, '标题10', '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃佛啊家哦放假和奥哦安放哦啊额外加购i阿娥我就', '/uploads/f32d2dce51a8f1ddd7574f97d0eba444.png', '2022-01-31 12:28:32.801', '草稿', 5, 16, '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃...');
INSERT INTO `ev_articles` VALUES (47, '453', '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃佛啊家哦放假和奥哦安放哦啊额外加购i阿娥我就', '/uploads/daa26993d8e3b82787140237fdf6626f.png', '2022-01-31 12:28:37.566', '草稿', 5, 16, '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃...');
INSERT INTO `ev_articles` VALUES (48, '453554', '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃佛啊家哦放假和奥哦安放哦啊额外加购i阿娥我就', '/uploads/f96eaf1829e6c21b49c1becad72b83d0.png', '2022-01-31 12:28:40.740', '草稿', 5, 16, '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃...');
INSERT INTO `ev_articles` VALUES (49, '4535', '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃佛啊家哦放假和奥哦安放哦啊额外加购i阿娥我就', '/uploads/27a41b97dfc19e673f16b0de5b73b48f.png', '2022-01-31 12:28:43.950', '草稿', 5, 16, '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃...');
INSERT INTO `ev_articles` VALUES (50, '45355455', '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃佛啊家哦放假和奥哦安放哦啊额外加购i阿娥我就', '/uploads/90dfbe67e4bc384cb9f566acd1e80e33.png', '2022-01-31 12:28:47.505', '草稿', 5, 16, '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃...');
INSERT INTO `ev_articles` VALUES (51, '45355', '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃佛啊家哦放假和奥哦安放哦啊额外加购i阿娥我就', '/uploads/50b31899d2d8fe091c51429be743bb1b.png', '2022-01-31 12:28:50.579', '草稿', 5, 16, '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃...');
INSERT INTO `ev_articles` VALUES (52, '453554534554', '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃佛啊家哦放假和奥哦安放哦啊额外加购i阿娥我就', '/uploads/af0251cda0b48d4523aba37e6d6a3ecd.png', '2022-01-31 12:28:53.884', '草稿', 5, 16, '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃...');
INSERT INTO `ev_articles` VALUES (53, '45534554', '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃佛啊家哦放假和奥哦安放哦啊额外加购i阿娥我就', '/uploads/b1854a3b82a1c39ce9f6083778ba8541.png', '2022-01-31 12:28:58.756', '草稿', 5, 16, '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃...');
INSERT INTO `ev_articles` VALUES (54, '45534', '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃佛啊家哦放假和奥哦安放哦啊额外加购i阿娥我就', '/uploads/4c313a30870fb6b49c43dc6deb16f672.png', '2022-01-31 12:29:02.494', '草稿', 5, 16, '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃...');
INSERT INTO `ev_articles` VALUES (55, '45534', '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃佛啊家哦放假和奥哦安放哦啊额外加购i阿娥我就', '/uploads/a8c318ece125fad1f833f5d8cdf37d1c.png', '2022-01-31 12:29:15.926', '草稿', 5, 16, '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃...');
INSERT INTO `ev_articles` VALUES (56, '45534', '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃佛啊家哦放假和奥哦安放哦啊额外加购i阿娥我就', '/uploads/28a8b9f23c3deb13704286c1831d45f1.png', '2022-01-31 12:29:16.784', '草稿', 5, 16, '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃...');
INSERT INTO `ev_articles` VALUES (57, '45534', '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃佛啊家哦放假和奥哦安放哦啊额外加购i阿娥我就', '/uploads/2952fae785f3c786d0815f098d5cc4f3.png', '2022-01-31 12:29:17.438', '草稿', 5, 16, '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃...');
INSERT INTO `ev_articles` VALUES (58, '45534', '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃佛啊家哦放假和奥哦安放哦啊额外加购i阿娥我就', '/uploads/954db0961b3166eeed112e39c2b3ddb9.png', '2022-01-31 12:29:17.974', '草稿', 5, 16, '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃...');
INSERT INTO `ev_articles` VALUES (59, '45534', '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃佛啊家哦放假和奥哦安放哦啊额外加购i阿娥我就', '/uploads/c98e8b61a6832cbda5e002203e95c306.png', '2022-01-31 12:29:19.162', '草稿', 5, 16, '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃...');
INSERT INTO `ev_articles` VALUES (60, '45534', '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃佛啊家哦放假和奥哦安放哦啊额外加购i阿娥我就', '/uploads/e2f8e265a557d11ac14d11e08cfe00ad.png', '2022-01-31 12:29:19.596', '草稿', 5, 16, '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃...');
INSERT INTO `ev_articles` VALUES (61, '45786738534', '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃佛啊家哦放假和奥哦安放哦啊额外加购i阿娥我就', '/uploads/90af7f8cc1bfd378e979d3ab4a3bae26.png', '2022-01-31 12:29:23.830', '草稿', 5, 16, '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃...');
INSERT INTO `ev_articles` VALUES (62, '45786738534同一条鱼 ', '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃佛啊家哦放假和奥哦安放哦啊额外加购i阿娥我就', '/uploads/30b673e070335c60c6c5b977de272f75.png', '2022-01-31 12:29:35.408', '草稿', 5, 16, '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃...');
INSERT INTO `ev_articles` VALUES (63, '45786738534同一条鱼 同仁堂天', '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃佛啊家哦放假和奥哦安放哦啊额外加购i阿娥我就', '/uploads/4d99424a4c53d90098995e7ce7b20149.png', '2022-01-31 12:29:38.549', '草稿', 5, 16, '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃...');
INSERT INTO `ev_articles` VALUES (64, ' 同一    条鱼 同仁堂天', '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃佛啊家哦放假和奥哦安放哦啊额外加购i阿娥我就', '/uploads/e63da8e9136dd2a007ea822cf6419e0a.png', '2022-01-31 12:29:43.536', '草稿', 5, 16, '都开始发货啦说的话就发了；阿萨德就好了放假啊都是老骥伏枥；阿萨德就发啦睡觉哦放假啊饿死；离开家；厄埃...');
INSERT INTO `ev_articles` VALUES (65, 'fdsfsda', 'fsadfdsafasdfasdfasd', '', '2022-02-02 15:05:00.326', '已发布', 5, 52, 'fsadfdsafasdfasdfasd...');
INSERT INTO `ev_articles` VALUES (66, '标题', '内容。换基地哦哈佛的撒谎就佛哦后i后悔 回家哦i', '', '2022-02-02 19:04:15.454', '已发布', 5, 52, '内容。换基地哦哈佛的撒谎就佛哦后i后悔 回家哦i...');
INSERT INTO `ev_articles` VALUES (67, '事件', 'dddfesrfgrregerwtgerthurtuyjhrtyuj', '', '2022-02-02', '已发布', 18, 48, 'dddfesrfgrregerwtgerthurtuyjhrtyuj...');
INSERT INTO `ev_articles` VALUES (68, '时间', '是大锅饭的水果对身体好点让他飞黄腾达然后到天涯海角天 ', '', '2022-02-02 20:19', '已发布', 13, 48, '是大锅饭的水果对身体好点让他飞黄腾达然后到天涯海角天 ...');
INSERT INTO `ev_articles` VALUES (69, '份额里', 'gssgrewgerthgerthterhterh', '', '2022-02-02 22:58', '已发布', 18, 48, 'gssgrewgerthgerthterhterh...');
INSERT INTO `ev_articles` VALUES (71, '龙的fghdfghjndtf', 'dssgfewsgrwergwer', '', '2022-02-02 23:51', '已发布', 13, 53, 'dssgfewsgrwergwer...');
INSERT INTO `ev_articles` VALUES (72, 'rhrtdhtrh', 'ftygnfghdfbfgdbftg', '', '2022-02-03 16:33', '已发布', 5, 52, 'ftygnfghdfbfgdbftg...');
INSERT INTO `ev_articles` VALUES (73, 'dsergbrtdhbdrth', 'dfghndfthnbdrtfhndtr', '', '2022-02-03 16:34', '已发布', 18, 52, 'dfghndfthnbdrtfhndtr...');
INSERT INTO `ev_articles` VALUES (74, 'sdvawegverwagf', 'vaerdsgverwgvrewgre', '', '2022-02-03 16:35', '已发布', 5, 52, 'vaerdsgverwgvrewgre...');
COMMIT;

-- ----------------------------
-- Table structure for ev_users
-- ----------------------------
DROP TABLE IF EXISTS `ev_users`;
CREATE TABLE `ev_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_pic` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ev_users
-- ----------------------------
BEGIN;
INSERT INTO `ev_users` VALUES (2, 'zzl', 'sdfsdfsdf', '', NULL, NULL);
INSERT INTO `ev_users` VALUES (16, 'wxl', '$2a$10$uz4obBROKTxA1c1NRjy8ku6dVgKeCi7RUQ7TBPUQzja/w82QlfUXa', '', NULL, NULL);
INSERT INTO `ev_users` VALUES (17, 'fgbfghdg', '$2a$10$r/nzwjZ0XWPmbCfhXTNYd.GiVnCdyy6B.MNTvWebFIeH5PysPwdfS', '', NULL, NULL);
INSERT INTO `ev_users` VALUES (18, 'ddddd', '$2a$10$ozG44hwSyQ5PVSfEHHVdL.ApLMR.m74L6OIHb15jMuG9UuuUxKd52', '', NULL, NULL);
INSERT INTO `ev_users` VALUES (19, 'fdvdf', '$2a$10$/b2TheFZ1GuD0hrrW0wr5eAmkld.F9RbgefYY.WUACD8GhABaGXIa', '', NULL, NULL);
INSERT INTO `ev_users` VALUES (20, 'ddsdsf', '$2a$10$swo56WEjxMhsWKjyW4LTiuGLH9v9clOjHSErX4Irb/42rc0pHMWMa', '', NULL, NULL);
INSERT INTO `ev_users` VALUES (21, 'fdfdd', '$2a$10$ztKkukhw5motZ0m4SoJLjeIwrHdtSPPKgBGLXhId5vdUtQOmxsN32', '', NULL, NULL);
INSERT INTO `ev_users` VALUES (22, 'dsfdsaf', '$2a$10$u/gXOhXtO7aVDpRkq15XQuGx8UH7X4QCJnB1zCEVvctFvqh.JWA/e', '', NULL, NULL);
INSERT INTO `ev_users` VALUES (23, 'fsdf', '$2a$10$ysW7uYxygqrwTp0Op6QomeExvvwtUCzSSqaRwK5l5ZweFUpLsDvie', '', NULL, NULL);
INSERT INTO `ev_users` VALUES (24, 'hdgfh', '$2a$10$lG3RBwJFnLzQFf.xlp9r2.37Epx/h2e9YkjY5NHvLsJ7SbJXJHXLC', '', NULL, NULL);
INSERT INTO `ev_users` VALUES (25, 'fhdf', '$2a$10$ustlkSvpOaBYP8fyoPHKgu6jCSWVjIE/8KXurfL.aNeASn9CvOeN.', '', NULL, NULL);
INSERT INTO `ev_users` VALUES (26, 'sdfsaf', '$2a$10$v/w8f0sHVrjAfCPjtYDYjeuU4Zdd1eeNGNyx0RhIXuD0c1n.QZ0RW', '', NULL, NULL);
INSERT INTO `ev_users` VALUES (27, 'dfgfds', '$2a$10$myL.gqckj1uTHTz/mfks2eQs3pxIPPBiT13zJB214mwN3r2NpQmVu', '', NULL, NULL);
INSERT INTO `ev_users` VALUES (28, 'sdsa', '$2a$10$dMRBHWpNRZPxW.Y1qwQ1geMprChOTdyWRGi9or.D54b.EvpnA6ADe', '', NULL, NULL);
INSERT INTO `ev_users` VALUES (29, 'fghfd', '$2a$10$SPJQktU0z9xPALc1iy.N7O2yueN3GZONS8bISUNl4D85WLsfwucNW', '', NULL, NULL);
INSERT INTO `ev_users` VALUES (30, 'sdsd', '$2a$10$gdrmcc4viokyYHvEegZPle.w8L.XQwiIkphcLyQqCwTTjQbwX/xvW', '', NULL, NULL);
INSERT INTO `ev_users` VALUES (31, 'sxsx', '$2a$10$39Dxp0ZEp3HRR5RBfGHmFu3p6WhcyREhBnC4aKIVyOAWR1P874Qka', '', NULL, NULL);
INSERT INTO `ev_users` VALUES (32, 'dcdc', '$2a$10$YlCIciWdigeAB588/FqNHeOvWvXHKC76PdJmncK3FdepImN9h.VIa', '', NULL, NULL);
INSERT INTO `ev_users` VALUES (33, 'sxsxs', '$2a$10$d8FKijUH3K1wiBi1SL8p2.JzYZiijedu.bhXuoqr5dz0onxlJtA/O', '', NULL, NULL);
INSERT INTO `ev_users` VALUES (34, 'asas', '$2a$10$Pwhi2idQJmFVJ.We.ISBx.7WbtX0PlVhWewjBcZEnYTrrHwGfPYBO', '', NULL, NULL);
INSERT INTO `ev_users` VALUES (35, 'aass', '$2a$10$4MVfG9HmHdQk40VI.TGOyO4eE3jiSbsacwflqM2uJDRgdgbp.U9A.', '', NULL, NULL);
INSERT INTO `ev_users` VALUES (36, 'sasa', '$2a$10$E7o7OM7DsRS9i.wCppY0HukjtLS1ELaddi9ACpjL9GIt8WUvPUySG', '', NULL, NULL);
INSERT INTO `ev_users` VALUES (37, 'ccc', '$2a$10$GA0kifmNUqXEqTuHuQ6MFuwcV9Yemi8mBmNrdtRIdEvnJUAxDbxhu', 'ddd', '464dd64@qq.com', NULL);
INSERT INTO `ev_users` VALUES (38, 'ddd', '$2a$10$Ja9iW0f9XLR92ji3ivx9lu5s6wblUeMKT8.COJrtM6i7uQzrEFNIS', '', NULL, NULL);
INSERT INTO `ev_users` VALUES (39, 'dfgdfg', '$2a$10$0f5VZpNY69HNeTbX6Zw.gePNB8RcP.jhTIYiV.9Ad4UYiojzDAUnq', 'greer', 'ee@qq.com', NULL);
INSERT INTO `ev_users` VALUES (40, 'cccsss', '$2a$10$5cUCN7DKZfIQCQ.wJf6lH.pSK.nvbG4URDStCcX21WqrYyEk/XloW', '', NULL, NULL);
INSERT INTO `ev_users` VALUES (41, 'asd', '$2a$10$5Y8QaHreqk6/vPo/mklIp.3fNQoCBpRSn/cKdz5E24fyMoROR/RJ.', '', NULL, NULL);
INSERT INTO `ev_users` VALUES (42, 'szsz', '$2a$10$gLYbmoj7CkbvVfWYTYjXJufvNFbASLw2NZkK5GSxLo4Xu9./TM7Am', 'szss', 'aa@qq.com', NULL);
INSERT INTO `ev_users` VALUES (43, 'dfdf', '$2a$10$NsvlVB0JJeKAHrlXIZAqIOWCb2xi9t7Fu2WYRSaNR5H55nGspGAgO', 'dfff', 'sd@qq.com', NULL);
INSERT INTO `ev_users` VALUES (44, 'asws', '$2a$10$t6GxAqr/hpGWio8BbBLEPuc1wWhTaGUxsI26OLj742DsQXs8M69fm', 'aswss', 'sss@qq.com', NULL);
INSERT INTO `ev_users` VALUES (45, 'lll', '$2a$10$39p.9t3/FmDmerPM49YzzOaai0qC3YEIy/NaXxTli8Y.nsp5SzAEe', 'asdds', 'd@qq.com', NULL);
INSERT INTO `ev_users` VALUES (46, 'dfdfd', '$2a$10$IBeU/jo3c2O08toydVn2M.O/92rpuFAUcEglxMwYM/qm.HDJHcvzu', '', NULL, NULL);
INSERT INTO `ev_users` VALUES (47, 'fvfv', '$2a$10$iN6vD/Fna5AQe1BgqeFyoOV.86OUuCn01wkP9qtUrbdvVHSqmk6uW', '', NULL, NULL);
INSERT INTO `ev_users` VALUES (48, 'hhh', '$2a$10$g53OoL/V4.JmwmYnHEqfH.22CCjZulbKsMkux7wBBLHuTQf8IYnfS', '', NULL, NULL);
INSERT INTO `ev_users` VALUES (49, 'ggg', '$2a$10$1lrrK3fYzPGgGR3bW1lew.KMhfW1yzllP68hh5esH84NCytOE.zpW', '', NULL, NULL);
INSERT INTO `ev_users` VALUES (50, 'rewq', '$2a$10$AqnJqpPnYw4K/f.JDW.wVOiIWesLo4Nwj04BsQKcwHFoB2B2TGtly', 'rewqq', '2@qq.com', NULL);
INSERT INTO `ev_users` VALUES (51, 'cfcfc', '$2a$10$/2.6qf/0mocdfuF7R28VG.KCe73y8WcqW9p.Xy6Gg.jj7IJ6HciMC', '', NULL, NULL);
INSERT INTO `ev_users` VALUES (52, 'azaz', '$2a$10$yW1b2/csEMgkQtnNWHOA2eVUWpfVI73Ngk2UdIhU7nIItq0jWdZWK', '', NULL, NULL);
INSERT INTO `ev_users` VALUES (53, 'wwwxxxlll', '$2a$10$aP2L4hgfmqsn9aWLStn0CO0/CoBnl14ca.SVgdLj9DCbIdySBpTAW', '', NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
