/*
 Navicat Premium Data Transfer

 Source Server         : ihatemylife
 Source Server Type    : MySQL
 Source Server Version : 80044
 Source Host           : localhost:3306
 Source Schema         : sdaudb

 Target Server Type    : MySQL
 Target Server Version : 80044
 File Encoding         : 65001

 Date: 11/06/2026 18:46:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `Cno` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Cname` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Cpno` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Ccredit` smallint(0) DEFAULT NULL,
  `Tno` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`Cno`) USING BTREE,
  INDEX `Cpno`(`Cpno`) USING BTREE,
  INDEX `Tno`(`Tno`) USING BTREE,
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`Cpno`) REFERENCES `course` (`Cno`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`Tno`) REFERENCES `teacher` (`Tno`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('C001', '高等数学', NULL, 4, 'T001');
INSERT INTO `course` VALUES ('C002', '离散数学', 'C001', 3, 'T001');
INSERT INTO `course` VALUES ('C003', '数据结构', 'C001', 4, 'T002');
INSERT INTO `course` VALUES ('C004', '数据库系统概论', 'C003', 5, 'T004');
INSERT INTO `course` VALUES ('C006', 'Python网络爬虫', 'C002', 3, 'T004');
INSERT INTO `course` VALUES ('C007', '大学英语', NULL, 2, 'T003');
INSERT INTO `course` VALUES ('C008', 'Python网络爬虫', 'C002', 3, 'T020');
INSERT INTO `course` VALUES ('C009', '人工智能导论', NULL, 3, 'T010');

-- ----------------------------
-- Table structure for dept_age
-- ----------------------------
DROP TABLE IF EXISTS `dept_age`;
CREATE TABLE `dept_age`  (
  `Sdept` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Avg_age` smallint(0) DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dept_age
-- ----------------------------
INSERT INTO `dept_age` VALUES ('计算机系', 21);
INSERT INTO `dept_age` VALUES ('IS', 22);

-- ----------------------------
-- Table structure for sc
-- ----------------------------
DROP TABLE IF EXISTS `sc`;
CREATE TABLE `sc`  (
  `Sno` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Cno` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Grade` smallint(0) DEFAULT NULL,
  PRIMARY KEY (`Sno`, `Cno`) USING BTREE,
  INDEX `idx_sc_cno`(`Cno`) USING BTREE,
  CONSTRAINT `sc_ibfk_1` FOREIGN KEY (`Sno`) REFERENCES `student` (`Sno`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `sc_ibfk_2` FOREIGN KEY (`Cno`) REFERENCES `course` (`Cno`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sc
-- ----------------------------
INSERT INTO `sc` VALUES ('2022123401', 'C001', 85);
INSERT INTO `sc` VALUES ('2022123401', 'C004', 97);
INSERT INTO `sc` VALUES ('2022123401', 'C009', 88);
INSERT INTO `sc` VALUES ('2022123402', 'C003', 78);
INSERT INTO `sc` VALUES ('2022123402', 'C007', 88);
INSERT INTO `sc` VALUES ('2022123403', 'C006', 95);
INSERT INTO `sc` VALUES ('2022151201', 'C009', 89);
INSERT INTO `sc` VALUES ('2022151205', 'C004', 60);
INSERT INTO `sc` VALUES ('2022151206', 'C009', 94);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `Sno` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Sname` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Ssex` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Sage` smallint(0) DEFAULT NULL,
  `Sdept` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Class` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Semail` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Tno` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`Sno`) USING BTREE,
  UNIQUE INDEX `Semail`(`Semail`) USING BTREE,
  UNIQUE INDEX `Sname`(`Sname`) USING BTREE,
  INDEX `fk_stu_tea`(`Tno`) USING BTREE,
  INDEX `idx_stu_sname`(`Sname`) USING BTREE,
  CONSTRAINT `fk_stu_tea` FOREIGN KEY (`Tno`) REFERENCES `teacher` (`Tno`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('2019123001', '毕业生1', '男', 24, '计算机系', 'CS2019', 'graduate1@example.com', NULL);
INSERT INTO `student` VALUES ('2022123401', '张一凡', '男', 21, '计算机系', '计算机1班', 'zhangyf@example.com', 'T001');
INSERT INTO `student` VALUES ('2022123402', '李芳', '女', 20, '计算机系', '计算机2班', 'lifang@example.com', 'T002');
INSERT INTO `student` VALUES ('2022123403', '王磊', '男', 22, '计算机系', '计算机1班', 'wanglei@example.com', 'T004');
INSERT INTO `student` VALUES ('2022151201', '李思彤', '女', 21, '计算机系', '软件工程1班', 'lisitong@example.com', 'T001');
INSERT INTO `student` VALUES ('2022151202', '王语萱', '女', 22, '计算机系', '软件工程1班', 'wangyuxuan@example.com', 'T002');
INSERT INTO `student` VALUES ('2022151203', '张明', '男', 20, 'IS', 'IS2001', 'zhangming@example.com', 'T003');
INSERT INTO `student` VALUES ('2022151204', '赵雷', '男', 21, '计算机系', 'CS2003', 'zhaolei@example.com', 'T001');
INSERT INTO `student` VALUES ('2022151205', '韩梅梅', '女', 20, '计算机系', 'CS2003', 'hanmeimei@example.com', NULL);
INSERT INTO `student` VALUES ('2022151206', '王小明', '男', 23, 'IS', 'IS2001', 'wangxiaoming@example.com', 'T003');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `Tno` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Tname` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Tsex` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Tbirth` date DEFAULT NULL,
  `Prof` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Sdept` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`Tno`) USING BTREE,
  UNIQUE INDEX `Tname`(`Tname`) USING BTREE,
  UNIQUE INDEX `idx_tea_tname`(`Tname`) USING BTREE,
  INDEX `idx_tea_tbirth`(`Tbirth`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('T001', '刘伟', '男', '1980-03-15', '教授', '计算机系');
INSERT INTO `teacher` VALUES ('T002', '李明', '男', '1975-08-22', '副教授', '计算机系');
INSERT INTO `teacher` VALUES ('T003', '王瑞雪', '女', '1985-11-20', '讲师', 'IS');
INSERT INTO `teacher` VALUES ('T004', '岳训', '男', '1970-01-10', '教授', '计算机系');
INSERT INTO `teacher` VALUES ('T005', '陈向群', '女', '1968-07-19', '教授', '计算机系');
INSERT INTO `teacher` VALUES ('T010', '周华', '男', '1975-06-01', '教授', '计算机系');
INSERT INTO `teacher` VALUES ('T011', '吴静', '女', '1980-09-12', '副教授', '计算机系');
INSERT INTO `teacher` VALUES ('T020', '刘丽', '女', '1990-07-25', '讲师', 'CS');

-- ----------------------------
-- View structure for v_cs_students
-- ----------------------------
DROP VIEW IF EXISTS `v_cs_students`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_cs_students` AS select `student`.`Sno` AS `Sno`,`student`.`Sname` AS `Sname`,`student`.`Ssex` AS `Ssex`,`student`.`Class` AS `Class` from `student` where (`student`.`Sdept` = '计算机系')  WITH CASCADED CHECK OPTION;

-- ----------------------------
-- View structure for v_dept_teacher_count
-- ----------------------------
DROP VIEW IF EXISTS `v_dept_teacher_count`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_dept_teacher_count` AS select `teacher`.`Sdept` AS `Sdept`,count(0) AS `TeacherCount` from `teacher` group by `teacher`.`Sdept` order by `TeacherCount` desc;

-- ----------------------------
-- View structure for v_enrollment
-- ----------------------------
DROP VIEW IF EXISTS `v_enrollment`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_enrollment` AS select `st`.`Sno` AS `Sno`,`st`.`Sname` AS `Sname`,`co`.`Cname` AS `Cname`,`co`.`Tno` AS `Tno`,`sc`.`Grade` AS `Grade` from ((`student` `st` join `sc` on((`st`.`Sno` = `sc`.`Sno`))) join `course` `co` on((`sc`.`Cno` = `co`.`Cno`)));

-- ----------------------------
-- View structure for v_scorereport
-- ----------------------------
DROP VIEW IF EXISTS `v_scorereport`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_scorereport` AS select `st`.`Sno` AS `Sno`,`st`.`Sname` AS `Sname`,`co`.`Cname` AS `Cname`,`sc`.`Grade` AS `Grade` from ((`student` `st` join `sc` on((`st`.`Sno` = `sc`.`Sno`))) join `course` `co` on((`sc`.`Cno` = `co`.`Cno`)));

-- ----------------------------
-- View structure for v_student_gpa
-- ----------------------------
DROP VIEW IF EXISTS `v_student_gpa`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `v_student_gpa` AS select `st`.`Sno` AS `Sno`,`st`.`Sname` AS `Sname`,count(0) AS `TotalCourses`,avg(`sc`.`Grade`) AS `AvgGrade` from (`student` `st` join `sc` on((`st`.`Sno` = `sc`.`Sno`))) group by `st`.`Sno`,`st`.`Sname`;

SET FOREIGN_KEY_CHECKS = 1;
