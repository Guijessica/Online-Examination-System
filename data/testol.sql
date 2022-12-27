-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: testol
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `approval`
--

DROP TABLE IF EXISTS `approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `approval` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `student_id` int(11) NOT NULL COMMENT '申请人id',
  `teacher_id` int(11) NOT NULL COMMENT '教师id',
  `classes_id` int(11) NOT NULL COMMENT '班级id',
  `apply_date` datetime DEFAULT NULL COMMENT '申请时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态0：审批中，1：同意，2：拒绝',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval`
--

LOCK TABLES `approval` WRITE;
/*!40000 ALTER TABLE `approval` DISABLE KEYS */;
INSERT INTO `approval` VALUES (9,3,1,1,'2022-12-25 16:50:20',1);
/*!40000 ALTER TABLE `approval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `classes_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '班级id',
  `classes_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `introduction` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '班级简介',
  `people_num` int(11) DEFAULT NULL COMMENT '班级人数',
  `creator_id` int(11) NOT NULL COMMENT '创建者id',
  `joinWay` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'all' COMMENT '班级加入方式  no:不允许加入 all:允许任何人加入  apply:需要管理员同意',
  PRIMARY KEY (`classes_id`) USING BTREE,
  KEY `FK` (`creator_id`) USING BTREE,
  CONSTRAINT `FK` FOREIGN KEY (`creator_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'软件工程2001班','2022-12-23 00:00:00','2022-12-23 00:00:00','无',3,1,'apply'),(2,'软件工程2004班','2022-12-25 13:21:43','2022-12-25 13:21:43','',-2,3,'all');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam` (
  `exam_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '试卷id',
  `exam_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '试卷名称',
  `creator_id` int(10) unsigned NOT NULL COMMENT '创建者id',
  `time` int(10) unsigned DEFAULT NULL COMMENT '答题时间(分钟)',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `subject_id` int(10) unsigned DEFAULT NULL COMMENT '科目类型id',
  `subject_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '科目类型名称',
  `topic_num` int(10) unsigned DEFAULT '0' COMMENT '题目数量',
  `total_score` float unsigned DEFAULT '0' COMMENT '总分',
  `pass_mark` float unsigned DEFAULT '0' COMMENT '及格分数',
  `permit_copy` int(10) unsigned DEFAULT '1' COMMENT '是否允许复制  0:不允许  1:允许(默认)',
  `switch_page` int(11) DEFAULT '-1' COMMENT '允许页面切换次数  -1: 允许多次切换  5: 默认',
  `disrupt_order` int(10) unsigned DEFAULT '0' COMMENT '是否打乱题目顺序 0:不打乱(默认) 1:打乱顺序',
  `repeat_test` int(10) unsigned DEFAULT '1' COMMENT '允许考生考试次数 默认1',
  `auto_mack` int(10) unsigned DEFAULT '1' COMMENT '是否自动评分 0:否   1:是(默认)',
  PRIMARY KEY (`exam_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES (1,'软件质量保证与测试',1,60,'2022-12-23 14:06:34','2022-12-23 14:06:34',NULL,NULL,2,20,10,1,3,1,1,1),(2,'小学五年级语文期末测试卷',3,60,'2022-12-25 13:23:50','2022-12-25 13:23:50',NULL,NULL,1,10,10,0,-1,0,1,0),(3,'点击编辑试卷名称',1,60,'2022-12-25 17:30:38','2022-12-25 17:30:38',NULL,NULL,2,20,0,0,-1,0,1,0);
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_classes`
--

DROP TABLE IF EXISTS `exam_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `exam_id` int(11) NOT NULL COMMENT '考试id',
  `classes_id` int(11) NOT NULL COMMENT '班级id',
  `release_time` datetime NOT NULL COMMENT '发布时间',
  `start_date` datetime NOT NULL COMMENT '开始时间',
  `deadline` datetime NOT NULL COMMENT '结束时间',
  `publish_answer` int(10) unsigned zerofill DEFAULT '0000000000' COMMENT '是否公布答案   0:不公布   1:公布答案',
  `publish_score` int(10) unsigned zerofill DEFAULT '0000000000' COMMENT '是否公布分数   0:不公布   1:公布',
  `status` int(11) DEFAULT '0' COMMENT '状态 0:待批改 1:批改完成',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_classes`
--

LOCK TABLES `exam_classes` WRITE;
/*!40000 ALTER TABLE `exam_classes` DISABLE KEYS */;
INSERT INTO `exam_classes` VALUES (1,1,1,'2022-12-23 14:07:34','2022-12-24 00:00:00','2023-01-31 00:00:00',0000000001,0000000001,0),(2,2,2,'2022-12-25 13:25:53','2022-12-16 00:00:00','2023-01-31 00:00:00',0000000001,0000000001,0),(3,3,1,'2022-12-25 17:40:30','2022-12-15 00:00:00','2023-01-30 00:00:00',0000000000,0000000000,0);
/*!40000 ALTER TABLE `exam_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_topic`
--

DROP TABLE IF EXISTS `exam_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `exam_id` int(11) NOT NULL COMMENT '考试id',
  `topic_id` int(11) NOT NULL COMMENT '题目id',
  `topic_type` int(11) NOT NULL COMMENT '题目类型  0:单选题 1:多选题 2:判断题 3:填空题 4:简答题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_topic`
--

LOCK TABLES `exam_topic` WRITE;
/*!40000 ALTER TABLE `exam_topic` DISABLE KEYS */;
INSERT INTO `exam_topic` VALUES (1,1,1,0),(2,1,2,0),(3,2,3,0),(4,3,4,0),(5,3,5,1);
/*!40000 ALTER TABLE `exam_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `subjects_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '科目id',
  `subjects_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '科目名称',
  `create_id` int(11) DEFAULT NULL COMMENT '创建者id',
  `create_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建者名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`subjects_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '题目id',
  `creator_id` int(11) NOT NULL COMMENT '创建者id',
  `subject_id` int(11) DEFAULT NULL COMMENT '科目类型id',
  `subject_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '科目类型名称',
  `question` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '题目',
  `choice` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '选项',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片',
  `topic_type` int(11) NOT NULL COMMENT '题目类型  0:单选题 1:多选题 2:判断题 3:填空题 4:简答题',
  `correct_answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '正确答案',
  `score` float DEFAULT '0' COMMENT '分数',
  `difficulty` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '中等' COMMENT '难度  简单,中等(默认),困难',
  `analysis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '答案分析',
  `required` int(11) DEFAULT '0' COMMENT '非必填:0   必填:1',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`topic_id`) USING BTREE,
  KEY `suoyin2` (`creator_id`) USING BTREE,
  CONSTRAINT `FK11` FOREIGN KEY (`creator_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,1,NULL,NULL,'单选1','选项1\n选项2\n选项3\n选项4',NULL,0,'选项1',10,'中等','这是答案分析',1,'2022-12-23 14:06:35','2022-12-23 14:06:35'),(2,1,NULL,NULL,'单选2','选项1\n选项2\n选项3\n选项4',NULL,0,'选项3',10,'中等','这是答案分析',1,'2022-12-23 14:06:35','2022-12-23 14:06:35'),(3,3,NULL,NULL,'《红楼梦》的作者是','贺桂金\n曹雪芹\n张三\n李四',NULL,0,'曹雪芹',10,'中等','这是答案分析',1,'2022-12-25 13:23:50','2022-12-25 13:23:50'),(4,1,NULL,NULL,'这是我新建的题目','选项1\n选项2\n选项3\n选项4',NULL,0,'',10,'中等','这是答案分析',1,'2022-12-25 17:30:38','2022-12-25 17:30:38'),(5,1,NULL,NULL,'这是我新建的题目','选项1\n选项2\n选项3\n选项4',NULL,1,'',10,'中等','这是答案分析',1,'2022-12-25 17:30:38','2022-12-25 17:30:38');
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '男' COMMENT '性别',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号码',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电子邮箱',
  `role` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'student' COMMENT '身份 student:学生  teacher:是教师身份',
  `work` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '工作职位',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像图片',
  `photo_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片名称',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `souyin1` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','女','130','1@qq.com','teacher','教师','2022-12-23 14:56:37','2022-12-23 00:00:00',NULL,NULL),(2,'testuser','女','186','2@qq.com','student','学生','2022-12-22 00:00:00','2022-12-22 00:00:00',NULL,NULL),(3,'贺桂金',NULL,'','3@qq.com','teacher',NULL,'2022-12-25 16:08:46','2022-12-23 14:34:41',NULL,NULL),(4,'刘杰宜',NULL,'','4@qq.com','student',NULL,'2022-12-25 13:20:28','2022-12-25 13:20:28',NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_classes`
--

DROP TABLE IF EXISTS `user_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `classes_id` int(11) NOT NULL COMMENT '班级id',
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '身份   creator:创建者  student:学生  admin:管理员',
  `enter_date` datetime DEFAULT NULL COMMENT '加入时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_classes`
--

LOCK TABLES `user_classes` WRITE;
/*!40000 ALTER TABLE `user_classes` DISABLE KEYS */;
INSERT INTO `user_classes` VALUES (1,1,1,'admin','2022-12-23 00:00:00'),(2,2,1,'student','2022-12-22 00:00:00'),(5,3,1,'student','2022-12-25 17:04:44');
/*!40000 ALTER TABLE `user_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_grade`
--

DROP TABLE IF EXISTS `user_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `classes_id` int(11) NOT NULL COMMENT '班级id',
  `exam_id` int(11) NOT NULL COMMENT '考试id',
  `grade` double DEFAULT '0' COMMENT '得分',
  `grade_auto` double DEFAULT '0' COMMENT '得分(自动评分)',
  `answer_date` datetime DEFAULT NULL COMMENT '答题日期',
  `answer_time` int(11) DEFAULT NULL COMMENT '答题时长',
  `mark_status` int(11) DEFAULT '0' COMMENT '批改状态 0:待批改 1:批改完成',
  `exam_status` int(11) DEFAULT '0' COMMENT '试卷状态 0:未完成  1:已完成',
  `mark_date` datetime DEFAULT NULL COMMENT '批改日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_grade`
--

LOCK TABLES `user_grade` WRITE;
/*!40000 ALTER TABLE `user_grade` DISABLE KEYS */;
INSERT INTO `user_grade` VALUES (1,3,1,1,20,20,'2022-12-25 13:27:59',17,0,1,NULL);
/*!40000 ALTER TABLE `user_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_password`
--

DROP TABLE IF EXISTS `user_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_password` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户登录密码',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_password`
--

LOCK TABLES `user_password` WRITE;
/*!40000 ALTER TABLE `user_password` DISABLE KEYS */;
INSERT INTO `user_password` VALUES (1,'admin'),(2,'123456'),(3,'123456'),(4,'123456');
/*!40000 ALTER TABLE `user_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_topic`
--

DROP TABLE IF EXISTS `user_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `classes_id` int(11) DEFAULT NULL COMMENT '班级id',
  `exam_id` int(11) DEFAULT NULL COMMENT '试卷id',
  `topic_id` int(11) DEFAULT NULL COMMENT '题目id',
  `user_answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户答案',
  `user_score` double DEFAULT NULL COMMENT '用户得分',
  `topic_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '0:待批改 1:批改完成',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_topic`
--

LOCK TABLES `user_topic` WRITE;
/*!40000 ALTER TABLE `user_topic` DISABLE KEYS */;
INSERT INTO `user_topic` VALUES (1,3,1,1,1,'选项1',10,'0'),(2,3,1,1,2,'选项3',10,'0');
/*!40000 ALTER TABLE `user_topic` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-25 20:22:05
