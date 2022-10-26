# 创建部门表 
CREATE TABLE dept(  
	id INT PRIMARY KEY AUTO_INCREMENT,  
	NAME VARCHAR(20) 
)
INSERT INTO dept (NAME) VALUES ('开发部'),('市场部'),('财务部'); 
# 创建员工表 
CREATE TABLE emp (  
	id INT PRIMARY KEY AUTO_INCREMENT,  
	NAME VARCHAR(10),  gender CHAR(1), -- 性别  
	salary DOUBLE, -- 工资  
	join_date DATE, -- 入职日期  
	dept_id INT,  FOREIGN KEY (dept_id) REFERENCES dept(id) -- 外键，关联部门表(部门表的主键) 
)

USE db1;
DELETE TABLE dept;
DELETE TABLE emp;

INSERT INTO emp(NAME,gender,salary,join_date,dept_id) VALUES('孙悟空','男',7200,'2013-02-24',1); 
INSERT INTO emp(NAME,gender,salary,join_date,dept_id) VALUES('猪八戒','男',3600,'2010-12-02',2); 
INSERT INTO emp(NAME,gender,salary,join_date,dept_id) VALUES('唐僧','男',9000,'2008-08-08',2); 
INSERT INTO emp(NAME,gender,salary,join_date,dept_id) VALUES('白骨精','女',5000,'2015-10-07',3); 
INSERT INTO emp(NAME,gender,salary,join_date,dept_id) VALUES('蜘蛛精','女',4500,'2011-03-14',1);


-- 笛卡尔积现象

-- 需求：查询所有的员工和所有的部门 
SELECT * FROM emp,dept; 


-- 如何清除笛卡尔积现象的影响？

-- 设置过滤条件 Column 'id' in where clause is ambiguous 
SELECT * FROM emp,dept WHERE id = 5;  
SELECT * FROM emp,dept WHERE emp.dept_id = dept.id;  


-- 查询员工和部门的名字 
SELECT emp.name, dept.name FROM emp,dept WHERE emp.dept_id = dept.id; 



-- 内连接

-- 隐式内连接
SELECT * FROM emp,dept WHERE emp.dept_id = dept.id;

-- 显式内连接

-- 1) 确定查询哪些表
SELECT * FROM emp INNER JOIN dept;

-- 2) 确定表连接条件，员工表.dept_id = 部门表.id 的数据才是有效的
SELECT * FROM emp e INNER JOIN dept d ON e.dept_id = d.id;


-- 3) 确定查询条件，我们查询的是唐僧的信息，员工表.name='唐僧' 
SELECT * FROM emp e INNER JOIN dept d ON e.dept_id = d.id WHERE e.name='唐僧'; 

-- 4) 确定查询字段，查询唐僧的信息，显示员工id，姓名，性别，工资和所在的部门名称
SELECT e.id,e.name,e.gender,e.salary,d.name FROM emp e INNER JOIN dept d ON e.dept_id = d.id WHERE e.`name`='唐僧';

-- 我们发现写表名有点长，可以给表取别名，显示的字段名也使用别名 
SELECT e.id 编号,e.name 姓名,e.gender 性别,e.salary 工资,d.name 部门名字 FROM emp e INNER JOIN dept d ON e.`dept_id` = d.id WHERE e.name='唐僧'; 



-- 外连接


-- 左外连接

-- 在部门表中增加一个销售部 
INSERT INTO dept (NAME) VALUES ('销售部'); 

SELECT * FROM dept;  

-- 使用内连接查询 
SELECT * FROM dept d INNER JOIN emp e ON d.id = e.dept_id;  

-- 使用左外连接查询 
SELECT * FROM dept d LEFT JOIN emp e ON d.id = e.dept_id; 


-- 右外连接

-- 在员工表中增加一个员工 
INSERT INTO emp VALUES (NULL, '沙僧','男',6666,'2013-12-05',NULL); 

SELECT * FROM emp; 

-- 使用内连接查询 
SELECT * FROM dept INNER JOIN emp ON dept.id = emp.dept_id;  

-- 使用右外连接查询 
SELECT * FROM dept RIGHT JOIN emp ON dept.id = emp.dept_id;


-- 子查询

-- 需求：查询开发部中有哪些员工
SELECT * FROM emp;  

-- 通过两条语句查询 
SELECT id FROM dept WHERE NAME='开发部' ; 

SELECT * FROM emp WHERE dept_id = 1; 

-- 使用子查询 

SELECT * FROM emp WHERE dept_id = (SELECT id FROM dept WHERE NAME='市场部');

-- 子查询单行单列

-- 案例：查询工资最高的员工是谁？ 

-- 1) 查询最高工资是多少 
SELECT MAX(salary) FROM emp; 

-- 2) 根据最高工资到员工表查询到对应的员工信息 
SELECT * FROM emp WHERE salary = (SELECT MAX(salary) FROM emp);

-- 查询工资小于平均工资的员工有哪些？

-- 1) 查询平均工资是多少 
SELECT AVG(salary) FROM emp; 

-- 2) 到员工表查询小于平均的员工信息 
SELECT * FROM emp WHERE salary < (SELECT AVG(salary) FROM emp); 


-- 子查询多行单列

-- 案例：查询工资大于5000的员工，来自于哪些部门的名字 

-- 先查询大于5000的员工所在的部门id 
SELECT dept_id FROM emp WHERE salary > 5000; 

-- 再查询在这些部门id中部门的名字 Subquery returns more than 1 row 
SELECT NAME FROM dept WHERE id = (SELECT dept_id FROM emp WHERE salary > 5000);  

SELECT NAME FROM dept WHERE id IN (SELECT dept_id FROM emp WHERE salary > 5000);

--  案例：查询开发部与财务部所有的员工信息 

-- 先查询开发部与财务部的id 
SELECT id FROM dept WHERE NAME IN('开发部','财务部'); 

-- 再查询在这些部门id中有哪些员工 
SELECT * FROM emp WHERE dept_id IN (SELECT id FROM dept WHERE NAME IN('开发部','财务部')); 


-- 案例：查询出2011年以后入职的员工信息，包括部门名称

-- 在员工表中查询2011-1-1以后入职的员工 
SELECT * FROM emp WHERE join_date >='2011-1-1'; 

-- 查询所有的部门信息，与上面的虚拟表中的信息组合，找出所有部门id等于的dept_id 
SELECT * FROM dept d, (SELECT * FROM emp WHERE join_date >='2011-1-1') e WHERE d.id= e.dept_id ; 



-- 也可以使用表连接：
SELECT * FROM emp INNER JOIN dept ON emp.dept_id = dept.id WHERE join_date >='2011-1-1'; 

SELECT * FROM emp INNER JOIN dept ON emp.dept_id = dept.id AND join_date >='2011-1-1'; 




-- 事务

-- 转账的操作

CREATE DATABASE db3;
USE db3;

-- 创建数据表 
CREATE TABLE account (  
id INT PRIMARY KEY AUTO_INCREMENT,  
NAME VARCHAR(10),  
balance DOUBLE 
);  

-- 添加数据 
INSERT INTO account (NAME, balance) VALUES ('张三', 1000), ('李四', 1000);

-- 张三账号-500 
UPDATE account SET balance = balance - 500 WHERE NAME='张三'; 

-- 李四账号+500 
UPDATE account SET balance = balance + 500 WHERE NAME='李四';



-- 用户

-- 1. 切换到mysql数据库
USE mysql;

-- 2. 查询user表
SELECT * FROM USER;

-- 创建用户

CREATE USER '用户名'@'主机名’ IDENTIFIED BY '密码';

CREATE USER 'zhangsan'@'localhost' IDENTIFIED BY '123';
create user 'lisi'@'%' identified by '123';


-- 删除用户

drop user '用户名'@'主机名';
drop user 'zhangsan'@'localhost';


-- 修改用户密码

-- 修改lisi用户密码为 abc

update user set password = password('新密码') where user = '用户名';
update user set password = PASSWORD('abc') where user = 'lisi';

set password for '用户名'@'主机名' = password('新密码');
set password for 'root'@'localhost' = password('root');



-- 权限管理

-- 查询权限

show grants for '用户名'@'主机名';
show grants for 'lisi'@'%';

show grants for 'root'@'%';


-- 授予权限
grant 权限列表 on 数据库名称.表名 to '用户名'@'主机名';

grant select,delete,update on db3.account to 'lisi'@'%';

-- 给张三用户授予所有权限，在任意数据库任意表上
grant all on *.* to 'zhangsan'@'localhost';


-- 撤销权限
revoke 权限列表 on 数据库名称.表名 from '用户名'@'主机名';
revoke update on db3.account from 'lisi'@'%';

