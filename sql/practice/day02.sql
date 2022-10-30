
-- 排序

-- 升序排序（默认的排序方式）
SELECT *FROM student3 ORDER BY math

-- 降序排序
SELECT * FROM student3 ORDER BY math DESC 

-- 按照数学成绩排名，如果数学成绩一样，则按照英语成绩排名
SELECT * FROM student3 ORDER BY math ASC,english ASC;


-- 聚合函数的计算

SELECT COUNT(english) FROM student3;

SELECT COUNT(IFNULL(english,0)) FROM student3;

SELECT COUNT(*) FROM student3;


SELECT MAX(*) FROM student3;

SELECT MIN(*) FROM student3;

SELECT AVG(*) FROM student3;


-- 分组查询

SELECT * FROM student3;

-- 按照性别分组，分别查询男、女同学的平均分
SELECT sex,AVG(math) FROM student3 GROUP BY sex;

-- 按照性别分组，分别查询男、女同学的平均分,人数
SELECT sex,AVG(math),COUNT(id) FROM student3 GROUP BY sex;

-- 按照性别分组，分别查询男、女同学的平均分,人数 要求：分数低于70分的人，不参与分组
SELECT sex,AVG(math),COUNT(id) FROM student3 WHERE math > 70 GROUP BY sex;

-- 按照性别分组，分别查询男、女同学的平均分,人数 要求：分数低于70分的人，不参与分组,分组后，人数要大于2个人
SELECT sex,AVG(math),COUNT(id) FROM student3 WHERE math > 70 GROUP BY sex HAVING COUNT(id) > 2;

SELECT sex,AVG(math),COUNT(id) 人数 FROM student3 WHERE math > 70 GROUP BY sex HAVING 人数 > 2;


-- 分页查询


-- 每页显示3条记录 
SELECT * FROM student LIMIT 0,3; -- 第1页		
SELECT * FROM student LIMIT 3,3; -- 第2页		
SELECT * FROM student LIMIT 6,3; -- 第3页



-- 约束


-- 非空约束(NOT NULL)

-- 创建表时添加非空约束
CREATE TABLE stu1(
	id INT,
	NAME VARCHAR(20) NOT NULL -- name添加非空约束
);

-- 删除name的非空约束
ALTER TABLE stu MODIFY NAME VARCHAR(20);

-- 创建表后，添加非空约束
ALTER TABLE stu1 MODIFY NAME VARCHAR(20) NOT NULL;

SELECT * FROM stu1;


-- 唯一约束（UNIQUE)

-- 创建表时添加唯一约束
CREATE TABLE stu2(
	id INT,
	phone_number VARCHAR(20) UNIQUE -- 手机号添加唯一约束
);

-- 删除name的唯一约束
ALTER TABLE stu2 MODIFY phone_number VARCHAR(20);

ALTER TABLE stu2 DROP INDEX phone_number;

-- 创建表后，添加唯一约束
ALTER TABLE stu2 MODIFY phone_number VARCHAR(20) UNIQUE;

SELECT * FROM stu2;


-- 主键约束（PRIMARY KEY)

-- 创建表时添加主键约束
CREATE TABLE stu3(
	id INT PRIMARY KEY,-- 给id添加主键约束
	NAME VARCHAR(20)
);

-- 删除id的主键约束
-- 错误 alter table stu3 modify id int ;
ALTER TABLE stu3 DROP PRIMARY KEY;

-- 创建表后，添加主键约束
ALTER TABLE stu3 MODIFY id INT PRIMARY KEY;

SELECT * FROM stu3;


-- 自动增长（AUTO_INCREMENT）


-- 在创建表时，添加主键约束，并且完成主键自增长
CREATE TABLE stu4(
	id INT PRIMARY KEY AUTO_INCREMENT,-- 给id添加主键约束
	NAME VARCHAR(20)
);


-- 删除自动增长
ALTER TABLE stu4 MODIFY id INT;

-- 添加自动增长
ALTER TABLE stu4 MODIFY id INT AUTO_INCREMENT;







-- 外键约束

CREATE TABLE emp (  
	id INT PRIMARY KEY AUTO_INCREMENT,  
	NAME VARCHAR(30),  
	age INT,  dep_name VARCHAR(30),  
	dep_location VARCHAR(30) 
);  

INSERT INTO emp (NAME, age, dep_name, dep_location) VALUES ('张三', 20, '研发部', '广州'); 
INSERT INTO emp (NAME, age, dep_name, dep_location) VALUES ('李四', 21, '研发部', '广州'); 
INSERT INTO emp (NAME, age, dep_name, dep_location) VALUES ('王五', 20, '研发部', '广州');  
INSERT INTO emp (NAME, age, dep_name, dep_location) VALUES ('老王', 20, '销售部', '深圳'); 
INSERT INTO emp (NAME, age, dep_name, dep_location) VALUES ('大王', 22, '销售部', '深圳'); 
INSERT INTO emp (NAME, age, dep_name, dep_location) VALUES ('小王', 18, '销售部', '深圳');


-- 上述单个数据表特点：

-- 1）数据冗余
-- 2) 后期还会出现增删改的问题 




-- 解决方案：分成2张表 


-- 创建部门表(id,dep_name,dep_location) 
-- 一方，主表 
CREATE TABLE department(  
	id INT PRIMARY KEY AUTO_INCREMENT,  
	dep_name VARCHAR(20),  
	dep_location VARCHAR(20) 
	);  



	
-- 创建员工表(id,name,age,dep_id) 
-- 多方，从表 
CREATE TABLE employee(  
	id INT PRIMARY KEY AUTO_INCREMENT,  
	NAME VARCHAR(20),  
	age INT,  
	dep_id INT -- 外键对应主表的主键

)  

-- 添加2个部门 
INSERT INTO department VALUES(NULL, '研发部','广州'),(NULL, '销售部', '深圳'); 

SELECT * FROM department;  

-- 添加员工,dep_id表示员工所在的部门 
INSERT INTO employee (NAME, age, dep_id) VALUES ('张三', 20, 1);
INSERT INTO employee (NAME, age, dep_id) VALUES ('李四', 21, 1); 
INSERT INTO employee (NAME, age, dep_id) VALUES ('王五', 20, 1);  
INSERT INTO employee (NAME, age, dep_id) VALUES ('老王', 20, 2); 
INSERT INTO employee (NAME, age, dep_id) VALUES ('大王', 22, 2); 
INSERT INTO employee (NAME, age, dep_id) VALUES ('小王', 18, 2);  

SELECT * FROM employee;

-- 1) 删除副表/从表 
employee DROP TABLE employee;

-- 2) 创建从表 employee 并添加外键约束emp_depid_fk 

-- 多方，从表 
CREATE TABLE employee(  
	id INT PRIMARY KEY AUTO_INCREMENT,  
	NAME VARCHAR(20),  
	age INT,  
	dep_id INT, -- 外键对应主表的主键  
	CONSTRAINT emp_depid_fk FOREIGN KEY (dep_id) REFERENCES department(id) -- 创建外键约束 
)  
	
-- 3) 正常添加数据 
	INSERT INTO employee (NAME, age, dep_id) VALUES ('张三', 20, 1); 
	INSERT INTO employee (NAME, age, dep_id) VALUES ('李四', 21, 1); 
	INSERT INTO employee (NAME, age, dep_id) VALUES ('王五', 20, 1);  
	INSERT INTO employee (NAME, age, dep_id) VALUES ('老王', 20, 2); 
	INSERT INTO employee (NAME, age, dep_id) VALUES ('大王', 22, 2); 
	INSERT INTO employee (NAME, age, dep_id) VALUES ('小王', 18, 2);  
	SELECT * FROM employee; 
	
-- 4) 部门错误的数据添加失败 

-- 插入不存在的部门 
-- Cannot add or update a child row: a foreign key constraint fails 
INSERT INTO employee (NAME, age, dep_id) VALUES ('老张', 18, 6); 


-- 删除外键

-- 删除employee表的emp_depid_fk外键 
ALTER TABLE employee DROP FOREIGN KEY emp_depid_fk;  

-- 在employee表情存在的情况下添加外键 
ALTER TABLE employee ADD CONSTRAINT emp_depid_fk  FOREIGN KEY (dep_id) REFERENCES department(id); 








-- 外键的级联

SELECT * FROM employee; 

-- 出现新的问题
 SELECT * FROM department;  
 
 -- 要把部门表中的id值2，改成5，能不能直接更新呢？  
 -- Cannot delete or update a parent row: a foreign key constraint fails  
 
 UPDATE department SET id=5 WHERE id=2;   
 
 -- 要删除部门id等于1的部门, 能不能直接删除呢？  
 -- Cannot delete or update a parent row: a foreign key constraint fails  
 
 DELETE FROM department WHERE id=1; 
 
 
 
 -- 删除employee表，重新创建employee表，添加级联更新和级联删除  
 DROP TABLE employee;   
 
 CREATE TABLE employee(  
 id INT PRIMARY KEY AUTO_INCREMENT,  
 NAME VARCHAR(20),  
 age INT,  
 dep_id INT, -- 外键对应主表的主键  
 -- 创建外键约束  
 CONSTRAINT emp_depid_fk FOREIGN KEY (dep_id) REFERENCES  department(id) ON UPDATE CASCADE ON DELETE CASCADE 
 )  
 
 -- 再次添加数据到员工表和部门表 
 INSERT INTO employee (NAME, age, dep_id) VALUES ('张三', 20, 1); 
 INSERT INTO employee (NAME, age, dep_id) VALUES ('李四', 21, 1); 
 INSERT INTO employee (NAME, age, dep_id) VALUES ('王五', 20, 1);  
 INSERT INTO employee (NAME, age, dep_id) VALUES ('老王', 20, 2); 
 INSERT INTO employee (NAME, age, dep_id) VALUES ('大王', 22, 2); 
 INSERT INTO employee (NAME, age, dep_id) VALUES ('小王', 18, 2); 
 
 -- 删除部门表？能不能直接删除？ 
 DROP TABLE department;  
 
 -- 把部门表中id等于1的部门改成id等于10 
 UPDATE department SET id=10 WHERE id=1;  
 
 SELECT * FROM employee;  
 
 SELECT * FROM department;  
 
 -- 删除部门号是2的部门 
 
 DELETE FROM department WHERE id=2; 
 
 
 
 
 
 
-- 多表关系案例 
 
 -- 创建旅游线路分类表tab_category 
 -- cid旅游线路分类主键，自动增长 
 -- cname旅游线路分类名称非空，唯一，字符串100 
 CREATE TABLE tab_category (  
 cid INT PRIMARY KEY AUTO_INCREMENT,  
 cname VARCHAR(100) NOT NULL UNIQUE )  
 -- 添加旅游线路分类数据： 
 INSERT INTO tab_category (cname) VALUES ('周边游'), ('出境游'), ('国内游'), ('港澳游');  
 SELECT * FROM tab_category;  
 -- 创建旅游线路表tab_route 
 /* rid旅游线路主键，自动增长 
 rname旅游线路名称非空，唯一，字符串100 
 price价格 
 rdate 上架时间，日期类型 
 cid 外键，所属分类 
 */ 
 
 CREATE TABLE tab_route(  
 rid INT PRIMARY KEY AUTO_INCREMENT,  
 rname VARCHAR(100) NOT NULL UNIQUE,  
 price DOUBLE,  
 rdate DATE,  c
 id INT,  
 FOREIGN KEY (cid) REFERENCES tab_category(cid) )  
 -- 添加旅游线路数据 
 INSERT INTO tab_route VALUES 
 (NULL, '【厦门+鼓浪屿+南普陀寺+曾厝垵 高铁3天 惠贵团】尝味友鸭面线 住1晚鼓浪屿', 1499, '2018-01-27', 1), 
 (NULL, '【浪漫桂林 阳朔西街高铁3天纯玩 高级团】城徽象鼻山 兴坪漓江 西山公园', 699, '2018-02-22', 3), 
 (NULL, '【爆款￥1699秒杀】泰国 曼谷 芭堤雅 金沙岛 杜拉拉水上市场 双飞六天【含送签费 泰风情 广州往返 特价团】', 
 1699, '2018-01-27', 2),
 (NULL, '【经典•狮航 ￥2399秒杀】巴厘岛双飞五天 抵玩【广州往返 特价团】', 2399, '2017-12-23', 2), 
 (NULL, '香港迪士尼乐园自由行2天【永东跨境巴士广东至迪士尼去程交通+迪士尼一日门票+香港如心海景酒店暨会议中心标准房1晚住宿】', 
 799, '2018-04-10', 4);  
 
 SELECT * FROM tab_route;