/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 27/05/2019 18:29:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `sys_category_id` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `summary` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `publish_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `is_top` bit(1) NULL DEFAULT b'0',
  `is_delete` bit(1) NULL DEFAULT b'0',
  `count` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_artical`(`user_id`) USING BTREE,
  INDEX `fk_scategory`(`sys_category_id`) USING BTREE,
  INDEX `fc_category`(`category_id`) USING BTREE,
  CONSTRAINT `fc_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_artical` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_scategory` FOREIGN KEY (`sys_category_id`) REFERENCES `sys_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, '第一篇文章', 1, 1, 1, '这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用', '这是第一篇文章。。。XXX', '2013-10-23 15:57:07', b'0', b'0', 38);
INSERT INTO `article` VALUES (2, '第一篇文章', 2, 7, 12, '这是第一篇文章的内容，测试使用', '这是第1篇文章。。。这是第1篇文章。。。这是第1篇文章。。。这是第1篇文章。。。这是第1篇文章。。。这是第1篇文章。。。这是第1篇文章。。。这是第1篇文章。。。这是第1篇文章。。。', '2013-10-23 15:57:34', b'0', b'0', 7);
INSERT INTO `article` VALUES (3, '第一篇文章', 2, 1, 1, '这是第一篇文章的内容，测试使用', '这是第2篇文章。。。这是第2篇文章。。。这是第2篇文章。。。这是第2篇文章。。。这是第2篇文章。。。这是第2篇文章。。。这是第2篇文章。。。这是第2篇文章。。。这是第2篇文章。。。这是第2篇文章。。。这是第2篇文章。。。', '2013-10-23 15:57:47', b'0', b'0', 3);
INSERT INTO `article` VALUES (4, '第一篇文章', 2, 1, 1, '这是第一篇文章的内容，测试使用', '这是第3篇文章。。。', '2013-10-23 15:57:48', b'0', b'0', 1);
INSERT INTO `article` VALUES (5, '第一篇文章', 2, 1, 1, '这是第一篇文章的内容，测试使用', '这是第4篇文章。。。', '2013-10-23 15:57:49', b'0', b'0', 4);
INSERT INTO `article` VALUES (10, '2013年10月27日早', 2, 7, 12, '2013年10月27日早 - 继续写Jsp blogasdfasdfasd', '2013年10月27日早asdfasdfa', '2013-10-28 20:00:04', b'0', b'1', 1);
INSERT INTO `article` VALUES (11, '2013年10月27日早 - 2', 2, 1, 5, '2013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 2', '2013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 22013年10月27日早 - 2', '2013-10-27 12:45:41', b'0', b'1', 24);
INSERT INTO `article` VALUES (12, '2013年10月27日早 - 20', 1, 1, 2, '2013年10月27日早 - 32013年10月27日早 - 32013年10月27日早 - 32013年10月27日早 - 32013年10月27日早 - 32013年10月27日早 - 32013年10月27日早 - 32013年10月27日早 - 3', '2013年10月27日早 - 32013年10月27日早 - 3', '2013-10-28 15:21:19', b'0', b'1', 28);
INSERT INTO `article` VALUES (13, 'ra叔', 2, 1, 4, 'ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔', 'ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔ra叔', '2013-10-28 09:28:37', b'0', b'1', 4);
INSERT INTO `article` VALUES (14, '管理写的好烦', 1, 1, 3, '管理写的好烦管理写的好烦', '管理写的好烦管理写的好烦', '2013-10-28 16:03:17', b'0', b'1', 10);
INSERT INTO `article` VALUES (15, '23', 2, 2, 12, '段落1\r\n段落2\r\n  段落3\r\n段落4', '123', '2013-10-28 21:00:09', b'0', b'1', 9);
INSERT INTO `article` VALUES (16, '博客做的差不多了，还有几个功能点需要实现', 2, 2, 12, '今天29号了，还有几天就走了。项目也快做好了，又要工作了。SB学校不解释，WC', '今天29号了，还有几天就走了。项目也快做好了，又要工作了。', '2013-10-29 15:10:52', b'0', b'1', 5);
INSERT INTO `article` VALUES (17, '这是chuan的文章', 5, 2, 14, '这是chuan的文章的摘要内容', '这是chuan的文章的摘要', '2013-10-30 12:20:16', b'0', b'1', 1);
INSERT INTO `article` VALUES (18, '嵌入式实时OS', 1, 1, 8, '实时线程操作系统内部采用面向对象的方式设计，内建内核对象管理系统，能够访问/管理所有内核对象。内核对象包含了内核中绝大部分设施，而这些内核对象可 以是静态分配的静态对象，也可以是从系统内存堆中分配的动态对象。通过内核对象系统，RT-Thread可以做到不依赖于具体的内存分配方式，伸缩性得到 极大的加强。', '实时线程操作系统内部采用面向对象的方式设计，内建内核对象管理系统，能够访问/管理所有内核对象。内核对象包含了内核中绝大部分设施，而这些内核对象可 以是静态分配的静态对象，也可以是从系统内存堆中分配的动态对象。', '2013-11-02 14:57:35', b'0', b'0', 3);
INSERT INTO `article` VALUES (19, 'Openresty', 9, 4, 16, '昨天学习了Yichun Zhang的Openresty，很nice的华人工程师。很优秀的开源项目\r\nOpenresty is a fast web server', '昨天学习了Yichun Zhang的Openresty，很nice的华人工程师。很优秀的开源项目', '2013-11-06 14:53:59', b'0', b'0', 2);
INSERT INTO `article` VALUES (20, 'Spring第一讲', 1, 2, 8, '测试Spring技术', '测试Spring技术', '2014-05-17 15:21:05', b'0', b'1', 8);
INSERT INTO `article` VALUES (21, 'Spring第2讲', 1, 4, 10, '测试第二讲', '测试第二讲', '2014-05-17 15:21:39', b'0', b'0', 7);
INSERT INTO `article` VALUES (22, 'Spring第2讲', 1, 4, 10, '测试第二讲,再次测试', '测试第二讲', '2014-05-17 15:28:39', b'0', b'1', 6);
INSERT INTO `article` VALUES (23, '第一篇文章', 1, 1, 3, '这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用，++++', '这是第一篇文章。。。', '2014-05-18 21:38:05', b'0', b'1', 5);
INSERT INTO `article` VALUES (24, '第一篇文章', 1, 1, 3, '这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用这是第一篇文章的内容，测试使用，nonoo', '这是第一篇文章。。。', '2014-05-20 14:55:59', b'0', b'0', 4);
INSERT INTO `article` VALUES (25, 'Spring第3讲', 1, 4, 21, '是否是舒服舒服是否是发输电佛挡杀佛随碟附送的发生的发三点', '今天测试一下如何', '2014-09-15 22:23:42', b'0', b'0', 16);
INSERT INTO `article` VALUES (26, '是否是 ', 1, 4, 21, '随碟附送', '豕分蛇断发', '2014-05-21 19:55:04', b'0', b'0', 8);
INSERT INTO `article` VALUES (27, 'ssh2测试', 1, 1, 2, '123456', '测试', '2014-09-20 22:00:50', b'0', b'0', 0);
INSERT INTO `article` VALUES (28, 'xxxx1', 1, 2, 3, 'xxx1', 'xxx1', '2014-09-20 22:06:29', b'0', b'0', 1);
INSERT INTO `article` VALUES (29, 'xxxx', 1, 6, 26, 'xxxxxxxxxxxxxxxxxxxxxxxx', 'xxxx', '2015-11-16 11:26:32', b'0', b'0', 7);
INSERT INTO `article` VALUES (30, 'ssm框架的使用', 2, 2, 5, '<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\r\n<!DOCTYPE mapper PUBLIC \"-//mybatis.org//DTD Mapper 3.0//EN\" \"http://mybatis.org/dtd/mybatis-3-mapper.dtd\" >\r\n<mapper namespace=\"cap.mapper.AdminMapper\" >\r\n  <resultMap id=\"BaseResultMap\" type=\"cap.model.Admin\" >\r\n    <!--\r\n      WARNING - @mbggenerated\r\n      This element is automatically generated by MyBatis Generator, do not modify.\r\n    -->\r\n    <id column=\"id\" property=\"id\" jdbcType=\"INTEGER\" />\r\n    <result column=\"username\" property=\"username\" jdbcType=\"VARCHAR\" />\r\n    <result column=\"password\" property=\"password\" jdbcType=\"VARCHAR\" />\r\n  </resultMap>\r\n  <sql id=\"Base_Column_List\" >\r\n    <!--\r\n      WARNING - @mbggenerated\r\n      This element is automatically generated by MyBatis Generator, do not modify.\r\n    -->\r\n    id, username, password\r\n  </sql>\r\n  <select id=\"selectByPrimaryKey\" resultMap=\"BaseResultMap\" parameterType=\"java.lang.Integer\" >\r\n    <!--\r\n      WARNING - @mbggenerated\r\n      This element is automatically generated by MyBatis Generator, do not modify.\r\n    -->\r\n    select \r\n    <include refid=\"Base_Column_List\" />\r\n    from admin\r\n    where id = #{id,jdbcType=INTEGER}\r\n  </select>\r\n\r\n  <select id=\"selectBySelective\" resultMap=\"BaseResultMap\">\r\n    SELECT\r\n    <include refid=\"Base_Column_List\"/>\r\n    from admin\r\n    <where>\r\n      <if test=\"id != null\">\r\n        id = #{id}\r\n      </if>\r\n      <if test=\"username != null\">\r\n        and username = #{username}\r\n      </if>\r\n      <if test=\"password != null\">\r\n        and password = #{password}\r\n      </if>\r\n\r\n    </where>\r\n  </select>\r\n\r\n  <delete id=\"deleteByPrimaryKey\" parameterType=\"java.lang.Integer\" >\r\n    <!--\r\n      WARNING - @mbggenerated\r\n      This element is automatically generated by MyBatis Generator, do not modify.\r\n    -->\r\n    delete from admin\r\n    where id = #{id,jdbcType=INTEGER}\r\n  </delete>\r\n  <insert id=\"insert\" parameterType=\"cap.model.Admin\" >\r\n    <!--\r\n      WARNING - @mbggenerated\r\n      This element is automatically generated by MyBatis Generator, do not modify.\r\n    -->\r\n    insert into admin (id, username, password\r\n      )\r\n    values (#{id,jdbcType=INTEGER}, #{username,jdbcType=VARCHAR}, #{password,jdbcType=VARCHAR}\r\n      )\r\n  </insert>\r\n  <insert id=\"insertSelective\" parameterType=\"cap.model.Admin\" >\r\n    <!--\r\n      WARNING - @mbggenerated\r\n      This element is automatically generated by MyBatis Generator, do not modify.\r\n    -->\r\n    insert into admin\r\n    <trim prefix=\"(\" suffix=\")\" suffixOverrides=\",\" >\r\n      <if test=\"id != null\" >\r\n        id,\r\n      </if>\r\n      <if test=\"username != null\" >\r\n        username,\r\n      </if>\r\n      <if test=\"password != null\" >\r\n        password,\r\n      </if>\r\n    </trim>\r\n    <trim prefix=\"values (\" suffix=\")\" suffixOverrides=\",\" >\r\n      <if test=\"id != null\" >\r\n        #{id,jdbcType=INTEGER},\r\n      </if>\r\n      <if test=\"username != null\" >\r\n        #{username,jdbcType=VARCHAR},\r\n      </if>\r\n      <if test=\"password != null\" >\r\n        #{password,jdbcType=VARCHAR},\r\n      </if>\r\n    </trim>\r\n  </insert>\r\n  <update id=\"updateByPrimaryKeySelective\" parameterType=\"cap.model.Admin\" >\r\n    <!--\r\n      WARNING - @mbggenerated\r\n      This element is automatically generated by MyBatis Generator, do not modify.\r\n    -->\r\n    update admin\r\n    <set >\r\n      <if test=\"username != null\" >\r\n        username = #{username,jdbcType=VARCHAR},\r\n      </if>\r\n      <if test=\"password != null\" >\r\n        password = #{password,jdbcType=VARCHAR},\r\n      </if>\r\n    </set>\r\n    where id = #{id,jdbcType=INTEGER}\r\n  </update>\r\n  <update id=\"updateByPrimaryKey\" parameterType=\"cap.model.Admin\" >\r\n    <!--\r\n      WARNING - @mbggenerated\r\n      This element is automatically generated by MyBatis Generator, do not modify.\r\n    -->\r\n    update admin\r\n    set username = #{username,jdbcType=VARCHAR},\r\n      password = #{password,jdbcType=VARCHAR}\r\n    where id = #{id,jdbcType=INTEGER}\r\n  </update>\r\n</mapper>', '<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\r\n<!DOCTYPE mapper PUBLIC \"-//mybatis.org//DTD Mapper 3.0//EN\" \"http://mybatis.org/dtd/mybatis-3-mapper.dtd\" >\r\n<mapper namespace=\"cap.mapper.AdminMapper\" >\r\n  <resultMap id=\"BaseResultMap\" type=\"cap.model.Admin\" >\r\n    <!--\r\n      WARNING - @mbggenerated\r\n      This element is automatically generated by MyBatis Generator, do not modify.\r\n    -->\r\n    <id column=\"id\" property=\"id\" jdbcType=\"INTEGER\" />\r\n    <result column=\"username\" property=\"username\" jdbcType=\"VARCHAR\" />\r\n    <result column=\"password\" property=\"password\" jdbcType=\"VARCHAR\" />\r\n  </resultMap>\r\n  <sql id=\"Base_Column_List\" >\r\n    <!--\r\n      WARNING - @mbggenerated\r\n      This element is automatically generated by MyBatis Generator, do not modify.\r\n    -->\r\n    id, username, password\r\n  </sql>\r\n  <select id=\"selectByPrimaryKey\" resultMap=\"BaseResultMap\" parameterType=\"java.lang.Integer\" >\r\n    <!--\r\n      WARNING - @mbggenerated\r\n      This element is automatically generated by MyBatis Generator, do not modify.\r\n    -->\r\n    select \r\n    <include refid=\"Base_Column_List\" />\r\n    from admin\r\n    where id = #{id,jdbcType=INTEGER}\r\n  </select>\r\n\r\n  <select id=\"selectBySelective\" resultMap=\"BaseResultMap\">\r\n    SELECT\r\n    <include refid=\"Base_Column_List\"/>\r\n    from admin\r\n    <where>\r\n      <if test=\"id != null\">\r\n        id = #{id}\r\n      </if>\r\n      <if test=\"username != null\">\r\n        and username = #{username}\r\n      </if>\r\n      <if test=\"password != null\">\r\n        and password = #{password}\r\n      </if>\r\n\r\n    </where>\r\n  </select>\r\n\r\n  <delete id=\"deleteByPrimaryKey\" parameterType=\"java.lang.Integer\" >\r\n    <!--\r\n      WARNING - @mbggenerated\r\n      This element is automatically generated by MyBatis Generator, do not modify.\r\n    -->\r\n    delete from admin\r\n    where id = #{id,jdbcType=INTEGER}\r\n  </delete>\r\n  <insert id=\"insert\" parameterType=\"cap.model.Admin\" >\r\n    <!--\r\n      WARNING - @mbggenerated\r\n      This element is automatically generated by MyBatis Generator, do not modify.\r\n    -->\r\n    insert into admin (id, username, password\r\n      )\r\n    values (#{id,jdbcType=INTEGER}, #{username,jdbcType=VARCHAR}, #{password,jdbcType=VARCHAR}\r\n      )\r\n  </insert>\r\n  <insert id=\"insertSelective\" parameterType=\"cap.model.Admin\" >\r\n    <!--\r\n      WARNING - @mbggenerated\r\n      This element is automatically generated by MyBatis Generator, do not modify.\r\n    -->\r\n    insert into admin\r\n    <trim prefix=\"(\" suffix=\")\" suffixOverrides=\",\" >\r\n      <if test=\"id != null\" >\r\n        id,\r\n      </if>\r\n      <if test=\"username != null\" >\r\n        username,\r\n      </if>\r\n      <if test=\"password != null\" >\r\n        password,\r\n      </if>\r\n    </trim>\r\n    <trim prefix=\"values (\" suffix=\")\" suffixOverrides=\",\" >\r\n      <if test=\"id != null\" >\r\n        #{id,jdbcType=INTEGER},\r\n      </if>\r\n      <if test=\"username != null\" >\r\n        #{username,jdbcType=VARCHAR},\r\n      </if>\r\n      <if test=\"password != null\" >\r\n        #{password,jdbcType=VARCHAR},\r\n      </if>\r\n    </trim>\r\n  </insert>\r\n  <update id=\"updateByPrimaryKeySelective\" parameterType=\"cap.model.Admin\" >\r\n    <!--\r\n      WARNING - @mbggenerated\r\n      This element is automatically generated by MyBatis Generator, do not modify.\r\n    -->\r\n    update admin\r\n    <set >\r\n      <if test=\"username != null\" >\r\n        username = #{username,jdbcType=VARCHAR},\r\n      </if>\r\n      <if test=\"password != null\" >\r\n        password = #{password,jdbcType=VARCHAR},\r\n      </if>\r\n    </set>\r\n    where id = #{id,jdbcType=INTEGER}\r\n  </update>\r\n  <update id=\"updateByPrimaryKey\" parameterType=\"cap.model.Admin\" >\r\n    <!--\r\n      WARNING - @mbggenerated\r\n      This element is automatically generated by MyBatis Generator, do not modify.\r\n    -->\r\n    update admin\r\n    set username = #{username,jdbcType=VARCHAR},\r\n      password = #{password,jdbcType=VARCHAR}\r\n    where id = #{id,jdbcType=INTEGER}\r\n  </update>\r\n</mapper>', '2017-09-25 01:43:02', b'0', b'0', 4);
INSERT INTO `article` VALUES (31, 'ssm框架的使用', 2, 2, 9, '九月 22, 2017 10:43:48 上午 org.apache.catalina.core.ApplicationContext log\r\n严重: StandardWrapper.Throwable\r\norg.springframework.beans.factory.BeanCreationException: Error creating bean with name \'org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping#0\': Invocation of init method failed; nested exception is java.lang.IllegalStateException: Ambiguous mapping found. Cannot map \'userController\' bean method \r\npublic java.lang.String cap.controller.UserController.register(cap.model.User,javax.servlet.http.HttpSession)\r\nto {[//register],methods=[GET],params=[],headers=[],consumes=[],produces=[],custom=[]}: There is already \'indexController\' bean method\r\npublic java.lang.String cap.controller.IndexController.register() mapped.\r\n	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.initializeBean(AbstractAutowireCapableBeanFactory.java:1568)\r\n	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:540)\r\n	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBean(AbstractAutowireCapableBeanFactory.java:476)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory$1.getObject(AbstractBeanFactory.java:302)\r\n	at org.springframework.beans.factory.support.DefaultSingletonBeanRegistry.getSingleton(DefaultSingletonBeanRegistry.java:229)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:298)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:193)\r\n	at org.springframework.beans.factory.support.DefaultListableBeanFactory.preInstantiateSingletons(DefaultListableBeanFactory.java:725)\r\n	at org.springframework.context.support.AbstractApplicationContext.finishBeanFactoryInitialization(AbstractApplicationContext.java:757)\r\n	at org.springframework.context.support.AbstractApplicationContext.refresh(AbstractApplicationContext.java:480)\r\n	at org.springframework.web.servlet.FrameworkServlet.configureAndRefreshWebApplicationContext(FrameworkServlet.java:663)\r\n	at org.springframework.web.servlet.FrameworkServlet.createWebApplicationContext(FrameworkServlet.java:629)\r\n	at org.springframework.web.servlet.FrameworkServlet.createWebApplicationContext(FrameworkServlet.java:677)\r\n	at org.springframework.web.servlet.FrameworkServlet.initWebApplicationContext(FrameworkServlet.java:548)\r\n	at org.springframework.web.servlet.FrameworkServlet.initServletBean(FrameworkServlet.java:489)\r\n	at org.springframework.web.servlet.HttpServletBean.init(HttpServletBean.java:136)\r\n	at javax.servlet.GenericServlet.init(GenericServlet.java:158)\r\n	at org.apache.catalina.core.StandardWrapper.initServlet(StandardWrapper.java:1183)\r\n	at org.apache.catalina.core.StandardWrapper.loadServlet(StandardWrapper.java:1099)\r\n	at org.apache.catalina.core.StandardWrapper.allocate(StandardWrapper.java:779)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:133)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\r\n	at org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:650)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:868)\r\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1457)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(Unknown Source)\r\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(Unknown Source)\r\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Unknown Source)\r\nCaused by: java.lang.IllegalStateException: Ambiguous mapping found. Cannot map \'userController\' bean method \r\npublic java.lang.String cap.controller.UserController.register(cap.model.User,javax.servlet.http.HttpSession)\r\nto {[//register],methods=[GET],params=[],headers=[],consumes=[],produces=[],custom=[]}: There is already \'indexController\' bean method\r\npublic java.lang.String cap.controller.IndexController.register() mapped.\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.registerHandlerMethod(AbstractHandlerMethodMapping.java:215)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.detectHandlerMethods(AbstractHandlerMethodMapping.java:187)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.initHandlerMethods(AbstractHandlerMethodMapping.java:147)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.afterPropertiesSet(AbstractHandlerMethodMapping.java:126)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping.afterPropertiesSet(RequestMappingHandlerMapping.java:126)\r\n	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.invokeInitMethods(AbstractAutowireCapableBeanFactory.java:1627)\r\n	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.initializeBean(AbstractAutowireCapableBeanFactory.java:1564)\r\n	... 36 more\r\n\r\n九月 22, 2017 10:43:48 上午 org.apache.catalina.core.StandardWrapperValve invoke\r\n严重: Allocate exception for servlet [dispatcher]\r\njava.lang.IllegalStateException: Ambiguous mapping found. Cannot map \'userController\' bean method \r\npublic java.lang.String cap.controller.UserController.register(cap.model.User,javax.servlet.http.HttpSession)\r\nto {[//register],methods=[GET],params=[],headers=[],consumes=[],produces=[],custom=[]}: There is already \'indexController\' bean method\r\npublic java.lang.String cap.controller.IndexController.register() mapped.\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.registerHandlerMethod(AbstractHandlerMethodMapping.java:215)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.detectHandlerMethods(AbstractHandlerMethodMapping.java:187)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.initHandlerMethods(AbstractHandlerMethodMapping.java:147)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.afterPropertiesSet(AbstractHandlerMethodMapping.java:126)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping.afterPropertiesSet(RequestMappingHandlerMapping.java:126)\r\n	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.invokeInitMethods(AbstractAutowireCapableBeanFactory.java:1627)\r\n	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.initializeBean(AbstractAutowireCapableBeanFactory.java:1564)\r\n	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:540)\r\n	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBean(AbstractAutowireCapableBeanFactory.java:476)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory$1.getObject(AbstractBeanFactory.java:302)\r\n	at org.springframework.beans.factory.support.DefaultSingletonBeanRegistry.getSingleton(DefaultSingletonBeanRegistry.java:229)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:298)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:193)\r\n	at org.springframework.beans.factory.support.DefaultListableBeanFactory.preInstantiateSingletons(DefaultListableBeanFactory.java:725)\r\n	at org.springframework.context.support.AbstractApplicationContext.finishBeanFactoryInitialization(AbstractApplicationContext.java:757)\r\n	at org.springframework.context.support.AbstractApplicationContext.refresh(AbstractApplicationContext.java:480)\r\n	at org.springframework.web.servlet.FrameworkServlet.configureAndRefreshWebApplicationContext(FrameworkServlet.java:663)\r\n	at org.springframework.web.servlet.FrameworkServlet.createWebApplicationContext(FrameworkServlet.java:629)\r\n	at org.springframework.web.servlet.FrameworkServlet.createWebApplicationContext(FrameworkServlet.java:677)\r\n	at org.springframework.web.servlet.FrameworkServlet.initWebApplicationContext(FrameworkServlet.java:548)\r\n	at org.springframework.web.servlet.FrameworkServlet.initServletBean(FrameworkServlet.java:489)\r\n	at org.springframework.web.servlet.HttpServletBean.init(HttpServletBean.java:136)\r\n	at javax.servlet.GenericServlet.init(GenericServlet.java:158)\r\n	at org.apache.catalina.core.StandardWrapper.initServlet(StandardWrapper.java:1183)\r\n	at org.apache.catalina.core.StandardWrapper.loadServlet(StandardWrapper.java:1099)\r\n	at org.apache.catalina.core.StandardWrapper.allocate(StandardWrapper.java:779)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:133)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\r\n	at org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:650)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:868)\r\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1457)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(Unknown Source)\r\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(Unknown Source)\r\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Unknown Source)\r\n\r\n', '九月 22, 2017 10:43:48 上午 org.apache.catalina.core.ApplicationContext log\r\n严重: StandardWrapper.Throwable\r\norg.springframework.beans.factory.BeanCreationException: Error creating bean with name \'org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping#0\': Invocation of init method failed; nested exception is java.lang.IllegalStateException: Ambiguous mapping found. Cannot map \'userController\' bean method \r\npublic java.lang.String cap.controller.UserController.register(cap.model.User,javax.servlet.http.HttpSession)\r\nto {[//register],methods=[GET],params=[],headers=[],consumes=[],produces=[],custom=[]}: There is already \'indexController\' bean method\r\npublic java.lang.String cap.controller.IndexController.register() mapped.\r\n	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.initializeBean(AbstractAutowireCapableBeanFactory.java:1568)\r\n	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:540)\r\n	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBean(AbstractAutowireCapableBeanFactory.java:476)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory$1.getObject(AbstractBeanFactory.java:302)\r\n	at org.springframework.beans.factory.support.DefaultSingletonBeanRegistry.getSingleton(DefaultSingletonBeanRegistry.java:229)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:298)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:193)\r\n	at org.springframework.beans.factory.support.DefaultListableBeanFactory.preInstantiateSingletons(DefaultListableBeanFactory.java:725)\r\n	at org.springframework.context.support.AbstractApplicationContext.finishBeanFactoryInitialization(AbstractApplicationContext.java:757)\r\n	at org.springframework.context.support.AbstractApplicationContext.refresh(AbstractApplicationContext.java:480)\r\n	at org.springframework.web.servlet.FrameworkServlet.configureAndRefreshWebApplicationContext(FrameworkServlet.java:663)\r\n	at org.springframework.web.servlet.FrameworkServlet.createWebApplicationContext(FrameworkServlet.java:629)\r\n	at org.springframework.web.servlet.FrameworkServlet.createWebApplicationContext(FrameworkServlet.java:677)\r\n	at org.springframework.web.servlet.FrameworkServlet.initWebApplicationContext(FrameworkServlet.java:548)\r\n	at org.springframework.web.servlet.FrameworkServlet.initServletBean(FrameworkServlet.java:489)\r\n	at org.springframework.web.servlet.HttpServletBean.init(HttpServletBean.java:136)\r\n	at javax.servlet.GenericServlet.init(GenericServlet.java:158)\r\n	at org.apache.catalina.core.StandardWrapper.initServlet(StandardWrapper.java:1183)\r\n	at org.apache.catalina.core.StandardWrapper.loadServlet(StandardWrapper.java:1099)\r\n	at org.apache.catalina.core.StandardWrapper.allocate(StandardWrapper.java:779)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:133)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\r\n	at org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:650)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:868)\r\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1457)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(Unknown Source)\r\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(Unknown Source)\r\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Unknown Source)\r\nCaused by: java.lang.IllegalStateException: Ambiguous mapping found. Cannot map \'userController\' bean method \r\npublic java.lang.String cap.controller.UserController.register(cap.model.User,javax.servlet.http.HttpSession)\r\nto {[//register],methods=[GET],params=[],headers=[],consumes=[],produces=[],custom=[]}: There is already \'indexController\' bean method\r\npublic java.lang.String cap.controller.IndexController.register() mapped.\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.registerHandlerMethod(AbstractHandlerMethodMapping.java:215)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.detectHandlerMethods(AbstractHandlerMethodMapping.java:187)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.initHandlerMethods(AbstractHandlerMethodMapping.java:147)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.afterPropertiesSet(AbstractHandlerMethodMapping.java:126)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping.afterPropertiesSet(RequestMappingHandlerMapping.java:126)\r\n	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.invokeInitMethods(AbstractAutowireCapableBeanFactory.java:1627)\r\n	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.initializeBean(AbstractAutowireCapableBeanFactory.java:1564)\r\n	... 36 more\r\n\r\n九月 22, 2017 10:43:48 上午 org.apache.catalina.core.StandardWrapperValve invoke\r\n严重: Allocate exception for servlet [dispatcher]\r\njava.lang.IllegalStateException: Ambiguous mapping found. Cannot map \'userController\' bean method \r\npublic java.lang.String cap.controller.UserController.register(cap.model.User,javax.servlet.http.HttpSession)\r\nto {[//register],methods=[GET],params=[],headers=[],consumes=[],produces=[],custom=[]}: There is already \'indexController\' bean method\r\npublic java.lang.String cap.controller.IndexController.register() mapped.\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.registerHandlerMethod(AbstractHandlerMethodMapping.java:215)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.detectHandlerMethods(AbstractHandlerMethodMapping.java:187)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.initHandlerMethods(AbstractHandlerMethodMapping.java:147)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.afterPropertiesSet(AbstractHandlerMethodMapping.java:126)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping.afterPropertiesSet(RequestMappingHandlerMapping.java:126)\r\n	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.invokeInitMethods(AbstractAutowireCapableBeanFactory.java:1627)\r\n	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.initializeBean(AbstractAutowireCapableBeanFactory.java:1564)\r\n	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:540)\r\n	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBean(AbstractAutowireCapableBeanFactory.java:476)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory$1.getObject(AbstractBeanFactory.java:302)\r\n	at org.springframework.beans.factory.support.DefaultSingletonBeanRegistry.getSingleton(DefaultSingletonBeanRegistry.java:229)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:298)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:193)\r\n	at org.springframework.beans.factory.support.DefaultListableBeanFactory.preInstantiateSingletons(DefaultListableBeanFactory.java:725)\r\n	at org.springframework.context.support.AbstractApplicationContext.finishBeanFactoryInitialization(AbstractApplicationContext.java:757)\r\n	at org.springframework.context.support.AbstractApplicationContext.refresh(AbstractApplicationContext.java:480)\r\n	at org.springframework.web.servlet.FrameworkServlet.configureAndRefreshWebApplicationContext(FrameworkServlet.java:663)\r\n	at org.springframework.web.servlet.FrameworkServlet.createWebApplicationContext(FrameworkServlet.java:629)\r\n	at org.springframework.web.servlet.FrameworkServlet.createWebApplicationContext(FrameworkServlet.java:677)\r\n	at org.springframework.web.servlet.FrameworkServlet.initWebApplicationContext(FrameworkServlet.java:548)\r\n	at org.springframework.web.servlet.FrameworkServlet.initServletBean(FrameworkServlet.java:489)\r\n	at org.springframework.web.servlet.HttpServletBean.init(HttpServletBean.java:136)\r\n	at javax.servlet.GenericServlet.init(GenericServlet.java:158)\r\n	at org.apache.catalina.core.StandardWrapper.initServlet(StandardWrapper.java:1183)\r\n	at org.apache.catalina.core.StandardWrapper.loadServlet(StandardWrapper.java:1099)\r\n	at org.apache.catalina.core.StandardWrapper.allocate(StandardWrapper.java:779)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:133)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:478)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:80)\r\n	at org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:650)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:799)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:868)\r\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1457)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(Unknown Source)\r\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(Unknown Source)\r\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Unknown Source)\r\n\r\n', '2017-09-25 01:46:17', b'0', b'0', 0);
INSERT INTO `article` VALUES (32, 'qrwe', 2, 7, 12, 'asdfasd', 'dfasd', NULL, NULL, NULL, NULL);
INSERT INTO `article` VALUES (33, 'qre', 2, 7, 12, 'qwerqwe', 'qwerqwe', NULL, NULL, NULL, NULL);
INSERT INTO `article` VALUES (34, 'wqerq', 2, 7, 12, 'qwreqwe', 'qwerqwe', NULL, NULL, NULL, NULL);
INSERT INTO `article` VALUES (35, 'dfasd', 2, 7, 12, 'asdfads', 'asdfasd', NULL, NULL, NULL, NULL);
INSERT INTO `article` VALUES (36, 'dfasd', 2, 7, 12, 'asdfads', 'asdfasd', NULL, NULL, NULL, NULL);
INSERT INTO `article` VALUES (37, 'fadsasdf', 2, 7, 12, 'asdfasd', 'asdfasdf', NULL, NULL, NULL, NULL);
INSERT INTO `article` VALUES (38, 'afasd', 2, 7, 12, 'asdfsd', 'asdfasd', NULL, NULL, NULL, NULL);
INSERT INTO `article` VALUES (39, 'user', 2, 7, 12, 'user', 'user', NULL, NULL, NULL, NULL);
INSERT INTO `article` VALUES (40, 'sdfasd', 2, 7, 12, 'java', 'dfasd', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for blog_info
-- ----------------------------
DROP TABLE IF EXISTS `blog_info`;
CREATE TABLE `blog_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `blog_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `annoucement` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_bloginfo`(`user_id`) USING BTREE,
  CONSTRAINT `fk_bloginfo` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_info
-- ----------------------------
INSERT INTO `blog_info` VALUES (7, 1, '博客名称', '博客描述', '这是我的个人技术博客。欢迎光临！xxx');
INSERT INTO `blog_info` VALUES (8, 2, '宦传建', '这是我的个人技术博客', '这是我的个人技术博客');
INSERT INTO `blog_info` VALUES (9, 3, '云风的Blog', '—— 思绪来的快，走的也快。偶尔在这里停留', '近期由于事务繁忙，博客不能及时更新。希望各位读者不要见谅哈');
INSERT INTO `blog_info` VALUES (12, 4, '专注于Linux x86_64平台的高性能web服务器', '—— 思绪来的快，走的也快。偶尔在这里停留', '专注于Linux x86_64平台的高性能web服务器');
INSERT INTO `blog_info` VALUES (13, 5, 'chuan的个人博客', '这是我的技术博客', '最近要休假了');
INSERT INTO `blog_info` VALUES (14, 9, 'test的博客', 'test的博客描述', 'test今天注册了该博客');
INSERT INTO `blog_info` VALUES (15, 10, 'starlee2008', 'Servlet技术博客', '欢迎来到我的博客，请多多捧场');
INSERT INTO `blog_info` VALUES (16, 11, 'starlee2008', 'JSP技术博客', '欢迎大家光临');
INSERT INTO `blog_info` VALUES (17, 15, '博客名称', '博客描述', '这是我的个人技术博客。欢迎光临！xxx');
INSERT INTO `blog_info` VALUES (18, 15, '博客名称', '博客描述', '这是我的个人技术博客。欢迎光临！xxx');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `category_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `articals` int(11) NOT NULL DEFAULT 0,
  `is_delete` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_category`(`user_id`) USING BTREE,
  CONSTRAINT `fk_category` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 1, '网络', 123, b'1');
INSERT INTO `category` VALUES (2, 1, '嵌入式技术', 123, b'1');
INSERT INTO `category` VALUES (3, 1, 'Nodejs', 213, b'0');
INSERT INTO `category` VALUES (4, 2, '数据库原理', 213, b'1');
INSERT INTO `category` VALUES (5, 2, '大数据', 213, b'1');
INSERT INTO `category` VALUES (6, 2, '微内核', 213, b'1');
INSERT INTO `category` VALUES (8, 1, '数据库技术', 0, b'0');
INSERT INTO `category` VALUES (9, 2, '嵌入式', 0, b'0');
INSERT INTO `category` VALUES (10, 1, 'web socket', 0, b'1');
INSERT INTO `category` VALUES (11, 2, 'Nginx', 0, b'0');
INSERT INTO `category` VALUES (12, 2, 'MySQL', 0, b'0');
INSERT INTO `category` VALUES (13, 5, '无分类', 0, b'0');
INSERT INTO `category` VALUES (14, 5, 'Nodejs', 0, b'0');
INSERT INTO `category` VALUES (15, 5, '网络', 0, b'0');
INSERT INTO `category` VALUES (16, 9, '无分类', 0, b'0');
INSERT INTO `category` VALUES (17, 10, '无分类', 0, b'0');
INSERT INTO `category` VALUES (18, 10, 'JSP博客', 0, b'0');
INSERT INTO `category` VALUES (19, 1, 'JSPServlet技术+', 0, b'0');
INSERT INTO `category` VALUES (20, 1, 'Springmvc技术', 0, b'1');
INSERT INTO `category` VALUES (21, 1, 'nodejs技术', 0, b'0');
INSERT INTO `category` VALUES (22, 1, 'test', 0, b'1');
INSERT INTO `category` VALUES (23, 11, '无分类', 0, b'0');
INSERT INTO `category` VALUES (24, 1, 'test', 0, b'0');
INSERT INTO `category` VALUES (26, 1, '网络技术2', 0, b'0');
INSERT INTO `category` VALUES (27, 15, '无分类', 1, b'0');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `artical_id` int(11) NOT NULL DEFAULT 0,
  `content` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `is_delete` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_comment1`(`user_id`) USING BTREE,
  INDEX `fk_comment2`(`artical_id`) USING BTREE,
  CONSTRAINT `fk_comment1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_comment2` FOREIGN KEY (`artical_id`) REFERENCES `article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 2, 2, '自己评论自己', '2013-10-25 16:19:51', b'0');
INSERT INTO `comment` VALUES (2, 2, 3, '我又自己评论自己', '2013-10-25 16:25:22', b'0');
INSERT INTO `comment` VALUES (3, 1, 1, '我是谁', '2013-10-25 16:27:44', b'1');
INSERT INTO `comment` VALUES (4, 1, 1, '再评论一次', '2013-10-25 16:28:34', b'1');
INSERT INTO `comment` VALUES (5, 1, 1, '评论来了，test', '2013-10-25 21:36:32', b'0');
INSERT INTO `comment` VALUES (6, 1, 1, '继续评论之', '2013-10-25 21:44:26', b'0');
INSERT INTO `comment` VALUES (7, 1, 1, '继续评论之', '2013-10-25 21:44:30', b'0');
INSERT INTO `comment` VALUES (8, 2, 4, 'comment test', '2013-10-25 21:50:27', b'1');
INSERT INTO `comment` VALUES (12, 2, 1, '我和青哥打LOL', '2013-10-26 15:58:16', b'0');
INSERT INTO `comment` VALUES (14, 2, 11, '评论一发', '2013-10-27 11:05:45', b'1');
INSERT INTO `comment` VALUES (15, 2, 10, '10月28日评论', '2013-10-28 09:30:14', b'1');
INSERT INTO `comment` VALUES (16, 1, 12, '歪子来了', '2013-10-28 15:21:04', b'1');
INSERT INTO `comment` VALUES (17, 2, 10, 'comment  test', '2013-10-28 19:45:19', b'1');
INSERT INTO `comment` VALUES (18, 1, 10, '评论一发', '2013-10-28 20:46:47', b'0');
INSERT INTO `comment` VALUES (19, 1, 14, 'etst', '2013-10-29 19:24:29', b'1');
INSERT INTO `comment` VALUES (20, 5, 17, '司副队长', '2013-10-30 12:25:13', b'1');
INSERT INTO `comment` VALUES (23, 1, 18, '测试一下', '2014-05-15 11:52:15', b'1');
INSERT INTO `comment` VALUES (25, 1, 19, '测试一下', '2014-05-18 21:28:22', b'0');
INSERT INTO `comment` VALUES (26, 1, 18, '测试', '2014-05-21 19:50:55', b'0');
INSERT INTO `comment` VALUES (27, 1, 26, '测试', '2014-05-21 20:14:25', b'0');
INSERT INTO `comment` VALUES (28, 1, 25, '测试', '2014-09-16 00:24:00', b'0');
INSERT INTO `comment` VALUES (29, 1, 29, 'xxxhhhh', '2015-11-17 09:57:25', b'0');
INSERT INTO `comment` VALUES (30, 1, 1, 'asdfasdfa dfas d', '2017-09-15 09:02:04', b'0');
INSERT INTO `comment` VALUES (31, 1, 1, '爱的发送到打打地方人体第三方地方地方第三方阿斯蒂芬阿斯蒂芬', '2017-09-15 09:02:16', b'0');
INSERT INTO `comment` VALUES (32, 1, 1, 'dfsgdf', '2017-09-19 09:20:55', b'0');

-- ----------------------------
-- Table structure for counter
-- ----------------------------
DROP TABLE IF EXISTS `counter`;
CREATE TABLE `counter`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of counter
-- ----------------------------
INSERT INTO `counter` VALUES (1, 111);

-- ----------------------------
-- Table structure for fileinfo
-- ----------------------------
DROP TABLE IF EXISTS `fileinfo`;
CREATE TABLE `fileinfo`  (
  `id` int(2) NOT NULL,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `filepath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `anthor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_delete` int(2) NOT NULL,
  `upload_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `first_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `last_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `gender` bit(1) NOT NULL DEFAULT b'0',
  `telephone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_profile`(`id`) USING BTREE,
  INDEX `fk_profile`(`user_id`) USING BTREE,
  CONSTRAINT `fk_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES (8, 1, '王', '123', b'0', '18551702658', NULL);
INSERT INTO `profile` VALUES (9, 2, '吴', '成', b'0', '12345678', NULL);
INSERT INTO `profile` VALUES (10, 3, '王', '成', b'1', '12345678', NULL);
INSERT INTO `profile` VALUES (11, 9, 'test_name', 'test_last_name', b'1', '12345', NULL);

-- ----------------------------
-- Table structure for sys_admin
-- ----------------------------
DROP TABLE IF EXISTS `sys_admin`;
CREATE TABLE `sys_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_admin
-- ----------------------------
INSERT INTO `sys_admin` VALUES (1, 'admin', 'admin');
INSERT INTO `sys_admin` VALUES (2, '010210', 'jackie0123');

-- ----------------------------
-- Table structure for sys_category
-- ----------------------------
DROP TABLE IF EXISTS `sys_category`;
CREATE TABLE `sys_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `articals` int(11) NULL DEFAULT 0,
  `is_delete` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_category
-- ----------------------------
INSERT INTO `sys_category` VALUES (1, 'struts2', 120, b'0');
INSERT INTO `sys_category` VALUES (2, 'Spring', 345, b'0');
INSERT INTO `sys_category` VALUES (3, 'linux', 0, b'0');
INSERT INTO `sys_category` VALUES (4, 'bootstrap', 0, b'0');
INSERT INTO `sys_category` VALUES (5, 'hibernate', 1, b'0');
INSERT INTO `sys_category` VALUES (6, 'jquery', 1, b'0');
INSERT INTO `sys_category` VALUES (7, 'java', 0, b'0');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` bigint(20) NOT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  `res_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `res_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permission` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL,
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `full_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_applied` bit(1) NULL DEFAULT b'0',
  `is_delete` bit(1) NULL DEFAULT b'0',
  `column_8` int(11) NULL DEFAULT NULL,
  `is_profile` bit(1) NULL DEFAULT b'0',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `is_applied` bit(1) NOT NULL DEFAULT b'0',
  `is_delete` bit(1) NOT NULL DEFAULT b'0',
  `is_profile` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin', '1303996779@qq.com', b'1', b'0', b'1');
INSERT INTO `user` VALUES (2, 'user', 'user', 'admin@chinadota2.com', b'1', b'0', b'1');
INSERT INTO `user` VALUES (3, 'huanchuanjian', '123', 'chuanjian.huan@wbkit.com', b'1', b'0', b'1');
INSERT INTO `user` VALUES (4, 'huan', '123', 'xunhua.zhang@wbkit.com', b'1', b'0', b'0');
INSERT INTO `user` VALUES (5, 'chuan', '123', 'chuan@chuan.com', b'1', b'0', b'0');
INSERT INTO `user` VALUES (6, 'liulu', '123', 'liulu@qq.com', b'0', b'0', b'0');
INSERT INTO `user` VALUES (7, 'hello', '123', 'hello@qq.com', b'0', b'0', b'0');
INSERT INTO `user` VALUES (8, 'world', '123', 'world1@qq.com', b'0', b'0', b'0');
INSERT INTO `user` VALUES (9, 'test', 'test', 'test@test.com', b'1', b'0', b'1');
INSERT INTO `user` VALUES (10, 'starlee2008', 'starlee', 'starlee2008@163.com', b'1', b'0', b'0');
INSERT INTO `user` VALUES (11, 'starlee1999', 'l12345678', 'starlee2008@126.com', b'1', b'1', b'0');
INSERT INTO `user` VALUES (15, 'admin2008', '123456', 'starlee2008@yeah.com', b'1', b'0', b'0');
INSERT INTO `user` VALUES (16, 'hellossssss', 'l12345678', 'world@qq.com', b'0', b'0', b'0');
INSERT INTO `user` VALUES (17, 'asdfgh', '123456', 'asdfasdfasdfa', b'0', b'0', b'0');
INSERT INTO `user` VALUES (18, '12345', '123456', '12345@qq.com', b'0', b'0', b'0');
INSERT INTO `user` VALUES (19, 'users', 'users', '0esdfsd@qq.com', b'0', b'0', b'0');
INSERT INTO `user` VALUES (20, 'u', 'u', 'u', b'0', b'1', b'0');
INSERT INTO `user` VALUES (21, 'test1', 'test', 'test22222@qq.com', b'0', b'0', b'0');
INSERT INTO `user` VALUES (22, 'aaa', 'aaa', 'aaaa@aa.com', b'0', b'0', b'0');
INSERT INTO `user` VALUES (23, 'dddd', 'dd', 'sss@ss.com', b'0', b'0', b'0');

-- ----------------------------
-- View structure for artical_data_view
-- ----------------------------
DROP VIEW IF EXISTS `artical_data_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `artical_data_view` AS select `c`.`id` AS `cid`,`c`.`user_id` AS `cuid`,`c`.`artical_id` AS `artical_id`,`c`.`content` AS `ccontent`,`c`.`time` AS `ctime`,`c`.`is_delete` AS `cdelete`,`u`.`id` AS `uid`,`u`.`username` AS `username`,`u`.`password` AS `password`,`u`.`email` AS `email`,`u`.`is_applied` AS `is_applied`,`u`.`is_delete` AS `udelete`,`u`.`is_profile` AS `is_profile`,`a`.`id` AS `aid`,`a`.`title` AS `title`,`a`.`user_id` AS `user_id`,`a`.`sys_category_id` AS `sys_category_id`,`a`.`category_id` AS `category_id`,`a`.`content` AS `acontent`,`a`.`summary` AS `summary`,`a`.`publish_time` AS `atime`,`a`.`is_top` AS `is_top`,`a`.`is_delete` AS `is_delete` from ((`comment` `c` join `user` `u`) join `article` `a`) where ((`c`.`is_delete` = 0) and (`u`.`id` = `c`.`user_id`) and (`a`.`id` = `c`.`artical_id`));

SET FOREIGN_KEY_CHECKS = 1;
