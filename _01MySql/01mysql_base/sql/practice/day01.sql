-- day01

-- 操作数据库

-- 查询数据库

-- 查询所有数据库名称
SHOW DATABASES;

-- 查询创建MySQL数据库的语法（查询某个数据库的字符集，查询某个数据库的创建语句）
SHOW CREATE DATABASE mysql;

ALTER DATABASE mysql CHARACTER SET utf8;


-- 创建数据库

-- 创建数据库db1
CREATE DATABASE db1;

-- 如果数据库db1不存在则创建
CREATE DATABASE IF NOT EXISTS db1;

-- 创建数据库db3并且指定字符集
CREATE DATABASE db3 CHARACTER SET gbk;

-- 如果数据库db1不存在则创建，并且指定字符集
CREATE DATABASE IF NOT EXISTS db4 CHARACTER SET gbk;

-- 修改数据库

-- 修改数据库的字符集
ALTER DATABASE db3 CHARACTER SET utf8;

-- 删除数据库库

-- 删除数据库db3
DROP DATABASE db3;

-- 如果db3数据库存在，则删除数据库
DROP IF EXISTS DATABASE db3;

-- 查询当前正在使用的数据库
SELECT DATABASE();

-- 使用数据库db1;
USE db1;



-- 操作表

-- 创建表

-- 创建学生表

CREATE TABLE student(
	id INT,
	NAME VARCHAR(50),
	age INT ,
	score DOUBLE(4,1),
	birthday DATE,
	insert_time TIMESTAMP
);
DELETE TABLE student;
DELETE TABLE stu;
SHOW TABLES;

-- 查询表

-- 查询当前数据库下所有的表名称
SHOW TABLES;

-- 查询表结构
DESC student ;

-- 修改表


-- 修改表名
ALTER TABLE student RENAME TO stu;

-- 修改表的字符集
ALTER TABLE stu CHARACTER SET utf8;

-- 添加一列
ALTER TABLE stu ADD gender VARCHAR(10);

-- 修改列名 类型
ALTER TABLE stu CHANGE gender sex VARCHAR(20);
ALTER TABLE stu MODIFY sex VARCHAR(10);

-- 删除列
ALTER TABLE stu DROP sex;


-- DML

-- 增删改表中数据

-- 添加数据

INSERT INTO stu(id,NAME,age) VALUES(1,'张无忌',18);
SELECT * FROM stu;

-- 如果表名后，不定义列名，则默认给所有列添加值
INSERT INTO stu VALUES(2,'赵敏',17,99.9,NULL,NULL);
INSERT INTO stu VALUES(2,'赵敏',17,99.9,NULL,NULL);
INSERT INTO stu VALUES(3,'张三丰',17,99.9,"1893-11-11",NULL);


-- 删除表数据
DELETE FROM stu WHERE id=1;
DELETE FROM stu;
TRUNCATE TABLE stu; -- 删除表然后再创建一个一模一样的空表


-- 修改表数据
UPDATE stu SET age = 117 WHERE  id = 3;
UPDATE stu SET age = 18,score = 100 WHERE  id = 2;

UPDATE stu SET age = 20;


-- 查询表数据
CREATE TABLE student3 (  
	id INT, -- 编号  
	NAME VARCHAR(20), -- 姓名  
	age INT, -- 年龄  
	sex VARCHAR(5), -- 性别  
	address VARCHAR(100), -- 地址  
	math INT, -- 数学  
	english INT -- 英语
);  
	
INSERT INTO student3(id,NAME,age,sex,address,math,english) 
VALUES (1,'马云',55,'男','杭州',66,78),
(2,'马化腾',45,'女','深圳',98,87),
(3,'马景涛',55,'男','香港',56,77),
(4,'柳岩',20,'女','湖南',76,65),
(5,'柳青',20,'男','湖南',86,NULL),
(6,'刘德华',57,'男','香港',99,99),
(7,'马德',22,'女','香港',99,99),
(8,'德玛西亚',18,'男','南京',56,65); 

SELECT * FROM student3;

-- 查询 姓名 和 年龄
SELECT NAME,age FROM student3;
 
 -- 查询所有数据
 SELECT * FROM student3;
 
 -- 查询居住地址
 SELECT address FROM student;
 
 -- 去除重复的结果集
 SELECT DISTINCT address FROM student3;
 SELECT DISTINCT NAME,address FROM student3;
 
 -- 计算 math 和 english 分数之和
 SELECT NAME,math,english,math + english FROM student3;
 
 -- 如果有NULL参与计算计算结果都为NULL，如下解决！
 SELECT NAME,math,english,math + IFNULL(english,0) FROM student3;
 
-- 起别名 

 SELECT NAME,math,english,math + IFNULL(english,0) AS 总分 FROM student3;
 
 SELECT NAME 名字,math 数学,english 英语,math + IFNULL(english,0) 总分 FROM student3;
 
 
 -- 条件查询
 SELECT * FROM student3;
 
-- 查询年龄大于20岁
SELECT * FROM student3 WHERE age > 20;

				
-- 查询年龄等于20岁
SELECT * FROM student3 WHERE age = 20;
			
-- 查询年龄不等于20岁
SELECT * FROM student3 WHERE age != 20;
SELECT * FROM student3 WHERE age <> 20;
			
-- 查询年龄大于等于20 小于等于30
SELECT * FROM student3 WHERE age >= 20 &&  age <=30;
SELECT * FROM student3 WHERE age >= 20 AND  age <=30;
SELECT * FROM student3 WHERE age BETWEEN 20 AND 30;
			
-- 查询年龄22岁，18岁，25岁的信息
SELECT * FROM student3 WHERE age = 22 OR age = 18 OR age = 25
SELECT * FROM student3 WHERE age IN (22,18,25);
			
-- 查询英语成绩为null
SELECT * FROM student3 WHERE english = NULL; -- 不对的。null值不能使用 = （!=） 判断
			
SELECT * FROM student3 WHERE english IS NULL;
			
-- 查询英语成绩不为null
SELECT * FROM student3 WHERE english  IS NOT NULL;


-- 模糊查询

-- 查询姓马的有哪些？ like
SELECT * FROM student WHERE NAME LIKE '马%';

-- 查询姓名第二个字是化的人
SELECT * FROM student WHERE NAME LIKE "_化%";
			
-- 查询姓名是3个字的人
SELECT * FROM student WHERE NAME LIKE '___';

-- 查询姓名中包含德的人
SELECT * FROM student WHERE NAME LIKE '%德%';
 