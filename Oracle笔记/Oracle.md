---
typora-root-url: images
---

```
买的笔记，oracle自己没怎么经常用，用的多的是MySQL，买的原因就是为了参考别人如何做笔记，因为自己也正在做笔记！
```

# 一、Oracle简介

## 1.1、历史

​	oracle创始人**拉里·埃里森**。拉里·埃里森和三个朋友合伙于1977年成立了软件开发研究公司，其个人持股60%。之后软件开发研究公司为美国中央情报局开发了名为oracle的数据库，从此名声大噪。软件开发研究公司也因此改名为oracle。**1989年oracle进入中国以甲骨文命名。**

​	oracle以数据存储量大，处理速度快，安全性高，容错性强等出色特征，长期以来占据着全球数据库市场的主导地位。

​								![001](/001.jpg)	

​	[百度百科](https://baike.baidu.com/item/%E6%8B%89%E9%87%8C%C2%B7%E5%9F%83%E9%87%8C%E6%A3%AE/7587412?fr=aladdin)

## 1.2、介绍

​	Oracle数据库系统是美国 ORACLE 公司（甲骨文）提供的以**分布式数据库**为核心的一组软件产品，是目前最流行的客户/服务器(C/S体系结构)的数据库之一。ORACLE 数据库是目前世界上使用最为广泛的数据库管理系统，作为一个通用的数据库系统，它具有完整的数据管理功能；作为一个关系数据库，它是一个完备关系的产品；作为分布式数据库它实现了分布式处理功能。但它的所有知识，只要在一种机型上学习了 ORACLE 知识，便能在各种类型的机器上使用它。

# 二、Oracle安装

## 2.1、安装

- 步骤一

  ​	如果是 win7 或者 win10 系统右键点击 setup.exe 选择兼容性，以 xp 方式，并且以管理员方式运行，以及其他所有用户都按着此规则。如图：

![002](/002.png)

- 步骤二：

  ​	==安装的时候不能含有空格、非法字符，注意不能含有中文，最好关闭防火墙。==

  ​	双击`setup.exe`文件，打开安装界面

  ​	![003](/003.png)

- 步骤三：

  ​	选择安装类型：

  ​	![004](/004.png)

- 步骤四：

  ​	选择安装目录：

  ​	![005](/005.png)

- 步骤五：

  ​	先决条件检查，会有一个警告【检查网络配置需求...】，选中复选框即可：

  ​	![006](/006.png)

- 步骤六：

  ​	创建数据库

  ​	![007](/007.png)

- 步骤七：

  ​	数据库配置。

  ​	![008](/008.png)

- 步骤八：

  ​	指定数据库配置选项：

  ​	![009](/009.png)

- 步骤九：

  ​	![010](/010.png)

- 步骤十：

  ​	![011](/011.png)

- 步骤十一：

  ​	![012](/012.png)

- 步骤十二：

  ​	设置数据库密码：

  ​	![013](/013.png)

- 步骤十三：

  ​	![014](/014.png)

- 步骤十四：CLERK

  ​	安装过程可能会报错，如果没有报错就忽略，如果有错误则点击确定继续即可：

  ​	![015](/015.png)

- 步骤十五：

  ​	![016](/016.png)

- 步骤十六：

  ​	![017](/017.png)

## 2.2、测试是否安装成功

```sql
sqlplus sys/sys as sysdba;
```

​	![018](/018.png)

​	注意：需要进入到【oracle的安装目录下的BIN目录下打开cmd命令行窗口，要么就配置一下环境变量。】

## 2.3、PL/SQL客户端

### 2.3.1、软件说明

​	![019](/019.png)

### 2.3.2、PL/SQL安装

```tex
省略......根据提供的工具进行需要破解
```

### 2.3.3、PL/SQL配置

​	PL/SQL是不能单独使用的，还需要Oracle官方提供的命令行方式客户端搭配使用。

![020](/020.png)

### 2.3.4、PL/SQL连接Oracle数据库

​	![021](/021.png)

​	如果连接不成功，需要检查`控制面板-->服务`中的`Oracle服务监听`有没有开启。

​	![022](/022.png)

### 2.3.5、改进

​	问题：我们每次通过PL/SQL连接数据库都需要指定完整的路径，即`127.0.0.1:1521/orcl` ，挺麻烦的。有没有更简单的方式呢？

- 步骤一

  ​	打开Oracle的安装目录，找到此目录下的此文件

  ​	![023](/023.png)

- 步骤二

  ​	复制此文件到任意目录，我把该文件复制到了`D:\soft\plsql\02_instantclient_12_1` 。

- 步骤三

  ​	配置该文件的环境变量：

  ​	![024](/024.png)

- 步骤四

  ​	测试是否正确。

  ​	![025](/025.png)

# 三、Oracle体系结构

## 3.1、图

![026](/026.jpg)

## 3.2、名词概念

### 3.2.1、数据库

​	Oracle 数据库是数据的物理存储。这就包括（数据文件 ORA 或者 DBF、控制文件、联机日志、参数文件）。其实 Oracle 数据库的概念和其它数据库不一样，这里的数据库是一个操作系统只有一个库。可以看作是 Oracle 就只有一个大数据库，是物理文件的集合。

### 3.2.2、实例

​	一个 Oracle 实例（Oracle Instance）有一系列的后台进程（Backguound Processes)和内存结构（Memory Structures)组成。**一个数据库可以有 n 个实例。**

​	换句话说，数据库实例是用户访问数据库的中间层，是使用数据库的手段，它为用户访问数据库提供了必要的*内存空间*和多个工作进程。

### 3.3.3、用户

​	用户是在实例下建立的。不同实例可以建相同名字的用户。

​	**在Oracle中，用户是管理表的基本单位，那么相对的应该是说，某个用户下有多少张表；在MySQL中，数据库是管理表的基本单位，那么相对应的应该是说，某个数据库下有多少张表。**

​	使用MySQL做项目，经常会为这个项目创建对应的数据库；

​	使用Oracle做项目，即是为这个项目创建用户。

### 3.3.4、表空间

​	表空间是 Oracle 对物理数据库上相关数据文件（ORA 或者 DBF 文件）的逻辑映射。一个数据库在逻辑上被划分成一到若干个表空间，每个表空间包含了在逻辑上相关联的一组结构。每个数据库至少有一个表空间(称之为 system 表空间)。

​	每个表空间由同一磁盘上的一个或多个文件组成，这些文件叫数据文件(datafile)。一个数据文件只能属于一个表空间。

​	换句话说：当数据库很大，为了便于管理，会分成一些细小的内容【块】，那么这些【块】的名字就叫表空间。

### 3.3.5、数据文件【dbf，ora】

​	数据文件是数据库的物理存储单位。数据库的数据是存储在表空间中的，真正是在某一个或者多个数据文件中。而一个表空间可以由一个或多个数据文件组成，一个数据文件只能属于一个表空间。一旦数据文件被加入到某个表空间后，就不能删除这个文件，如果要删除某个数据文件，只能删除其所属于的表空间才行。

​	注意：表的数据，是有用户放入某一个表空间的，而这个表空间会随机把这些表数据放到一个或者多个数据文件中。

​	由于 oracle 的数据库不是普通的概念，oracle 是有用户和表空间对数据进行管理和存放的。但是表不是有表空间去查询的，而是由用户去查的。因为不同用户可以在同一个表空间建立同一个名字的表！这里区分就是用户了！

​	![027](/027.jpg)

# 四、表空间

## 4.1、注意

​	要创建表空间，必须使用拥有**==超级管理员权限==**的用户才能创建表空间。即：超级管理员的用户就一个，就是`system` 。

## 4.2、概念

​	表空间是ORACLE 数据库的逻辑单元。一个表空间可以与多个数据文件（物理结构）关联。一个数据库下可以建立多个表空间，一个表空间可以建立多个用户、一个用户下可以建立多个表。

## 4.3、表空间操作

### 4.3.1、创建表空间

```plsql
-- 创建表空间
create tablespace bdqn_table_space
datafile 'D:\soft\oracle\tablespace\bdqn.dbf'
size 50M
autoextend on
next 5M
```

```tex
命令执行完毕之后，会在D:\soft\oracle\tablespace目录下创建bdqn.dbf表空间文件，直接删除是删除不成功的。原因在于这个文件被当前的bdqn这个表空间所使用。要想删除该文件，则必须首先把表空间删除。
```

### 4.3.2、删除表空间

```plsql
-- 删除表空间
drop tablespace bdqn_table_space
```

### 4.3.3、查看所有表空间

```plsql
select name from v$tablespace;
```

### 4.3.4、删除表空间注意点

```plsql
-- 在删除表空间的时候，如果该表空间中有数据，那么需要加上【including contents】选项
-- 如果在删除表空间的同时，还希望把表空间所关联的数据文件给删除，可以加上【including datafiles】选项
drop tablespace BDQN_TABLE_SPACE_2 including contents and datafiles;
```

# 五、用户

## 5.1、创建用户

```plsql
-- 创建用户
create user duankangjia
identified by D123456
default tablespace bdqn_table_space
```

## 5.2、给用户授权

### 5.2.1、Oracle中常用角色

- connect：连接角色，最基本的角色

  ​	ALTER SESSION --修改会话

   	CREATE CLUSTER --建立聚簇
 	
   	CREATE DATABASE LINK --建立数据库链接
 	
   	CREATE SEQUENCE --建立序列
 	
   	CREATE SESSION --建立会话
 	
   	CREATE SYNONYM --建立同义词
 	
   	CREATE VIEW --建立视图

- resource：开发者角色

  ​	CREATE CLUSTER --建立聚簇

   	CREATE PROCEDURE --建立过程
 	
   	CREATE SEQUENCE --建立序列
 	
   	CREATE TABLE --建表
 	
   	CREATE TRIGGER --建立触发器
 	
   	CREATE TYPE --建立类型

- dba：超级管理员角色

  ​	拥有全部特权，是系统最高权限，只有 DBA 才可以创建数据库结构，并且系统权限也需要 DBA 授出，且 DBA 用户可以操作全体用户的任意基表，包括删除。

### 5.2.2、授权

```plsql
-- 给duankangjia授dba角色
grant dba to duankangjia
```

### 5.2.3、使用duankangjia用户登录

- 步骤一：先全部退出

  ![028](/028.png)

  - 步骤二：用duankangjia用户登录

# 六、数据类型

| No   | 数据类型                   | 说明      |
| ---- | ---------------------- | ------- |
| 1    | char、varchar、varchar2  | 字符串     |
| 2    | Number（Integer、Double） | 整数、小数   |
| 3    | DATE                   | 日期类型    |
| 4    | CLOB                   | 大文本内容   |
| 5    | BLOB                   | 大的二进制内容 |

# 七、表管理

## 7.1、创建表

```plsql
-- 创建表
create table t_user(
       id number(10),
       username varchar2(20)
)
```

## 7.2、修改表结构

### 7.2.1、添加一列

```plsql
-- 添加一列
alter table t_user add sex varchar2(5);
```

### 7.2.2、修改列的类型

```plsql
-- 修改列类型
alter table t_user modify sex number(5);
```

### 7.2.3、修改列名称

```plsql
-- 修改列名称
alter table t_user rename column sex to gender;
```

### 7.2.4、删除一列

```plsql
-- 删除一列
alter table t_user drop column gender;
```

## 7.3、表数据增删改查

### 7.3.1、添加记录

```plsql
insert into t_user(id,username) values(1,'彭依凝');
```

### 7.3.2、修改记录

```plsql
update t_user set username = 'HelloWorld' where id = 1;
```

### 7.3.3、删除

#### 7.3.3.1、删除表中全部记录

```plsql
delete from t_user
```

#### 7.3.3.2、删除表结构

```plsql
drop table t_user
```

#### 7.3.3.3、清空表

```plsql
truncate table t_user
```

### 7.3.4、查询表记录

```plsql
select * from t_user
```

### 7.3.5、插入数据有中文如何处理？

- 步骤一：查看服务器端编码
  ​	`select userenv('language') from dual;`

  ​	我实际查到的结果为：AMERICAN_AMERICA.AL32UTF8。

- 步骤二

  ​	执行语句 `select * from V$NLS_PARAMETERS `

  ​	查看第一行中PARAMETER项中为NLS_LANGUAGE 对应的VALUE项中是否和第一步得到的值一样。
  如果不是，需要设置环境变量.否则PLSQL客户端使用的编码和服务器端编码不一致,插入中文时就会出现乱码.

- 步骤三

  ​	计算机->属性->高级系统设置->环境变量->新建
  设置变量名:NLS_LANG，变量值：第1步查到的值， 我的是	AMERICAN_AMERICA.AL32UTF8。

- 步骤四

  ​	重新启动PLSQL，插入数据正常。

## 7.4、序列的使用

### 7.4.1、说明

​	在很多数据库中都存在一个自动增长的列，如果现在要想在 oracle 中完成自动增长的功能，只能依靠序列完成,所有的自动增长操作，需要用户手工完成处理。

​	作用：默认从1开始，依次递增，主要用来给主键赋值使用。

​	**==序列不属于任何一张表，但是可以和表做绑定。==**

### 7.4.2、创建序列

```plsql
-- 创建序列
create sequence s_t_user;
```

### 7.4.3、执行序列

```plsql
select s_t_user.nextval from dual;
```

### 7.4.3、查询当前序列的值

```plsql
select s_t_user.currval from dual;
```

### 7.4.4、在插入数据时使用序列实现主键自增

```plsql
insert into t_user(id, username) values(s_t_user.nextval,'周安康');
```

### 7.4.5、小总结

​	在实际项目中每一张表会配一个序列，但是表和序列是没有必然的联系的，一个序列被哪一张表使用都可以，**==但是我们一般都是一张表用一个序列==**。

# 八、特殊用户之scott

## 8.1、说明

​	Oracle为我们提供了一个特殊的用户，叫scott，在该用户下有很多的表，可以方便我们对这些表进行操作。其中：用户名叫`scott` ，密码叫`tiger` 。

​	**注意：在使用scott用户之前必须要解锁。**

## 8.2、解锁scott用户

```plsql
-- 解锁scott用户[默认情况下，scott用户是锁住的，使用之前必须使用sys超级管理员才能解锁]
alter user scott account unlock;

-- 解锁scott用户的密码【此命令也可以用来重置密码】
alter user scott identified by tiger
```

## 8.3、切换scott用户

​	查看该用户的所有表及含义

​				![029](/029.jpg)

- 部门表【DEPT】

  ​	![030](/030.png)

- 员工表【EMP】

  ​	![031](/031.png)

- 工资等级表【salgrade】

  ​	![032](/032.png)

# 九、查询

## 9.1、函数

### 9.1.1、单行函数

#### 9.1.1.1、说明

​	作用于一行，返回一个值。

#### 9.1.1.2、字符函数

```plsql
-- 把小写的字符转换成大写的字符
select upper('HelloWorld') from dual;

-- 把大写的字符转换成小写的字符
select lower('TOMCat') from dual;

-- （首字符大写）
select initcap('tOMCat') from dual;

-- 字符串链接【只能连接两个，如果多个的话，可以使用多个concat函数实现】
select concat('HelloWorld','TOMCAT') from dual;

```

#### 9.1.1.3、数值函数

```plsql
-- 四舍五入函数
select round(13.34,1) from dual;

-- 直接截取
select trunc(78.78,1) from dual;

--  取余
select mod(10,3) from dual;
```

#### 9.1.1.4、日期函数

```plsql
-- 查询emp表中所有员工入职距离今天有多少天
select sysdate - emp.hiredate from emp;

-- 查询emp表中所有员工入职距离今天有几个月了
select months_between(sysdate,emp.hiredate) from emp;

-- 查询emp表中所有员工入职距离今天有几年了
select months_between(sysdate,emp.hiredate) / 12 from emp;

-- 查询emp表中所有员工入职距离今天有几周了
select (sysdate - emp.hiredate) / 7 from emp;


-- 转换函数【日期-->字符串】
--  结果：2020-01-10 12:44:49
select to_char(sysdate,'yyyy-mm-dd hh:mi:ss') from dual;

-- 转换函数【日期-->字符串】
--  结果：不够两位，自动补0，不想有0，可以加一个参数
select to_char(sysdate,'fm yyyy-mm-dd hh:mi:ss') from dual;

-- 转换函数【日期-->字符串】
--  结果：以24小时显示 2020-01-10 00:46:42
select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') from dual;

-- 转换函数【字符串--> 日期】
select to_date('2020-01-10 12:12:23','yyyy-mm-dd hh24:mi:ss') from dual;
```

#### 9.1.1.5、空值处理 nvl函数

```plsql
-- 计算每个员工的年薪
select emp.ename , emp.sal * 12 from emp

-- 计算每个员工的年薪【包括奖金】
select emp.ename,emp.sal * 12 + emp.comm from emp
-- 结果是:
1	SMITH	
2	ALLEN	19500
3	WARD	15500
4	JONES	
--- 分析结果：因为奖金里面有null值，即null值和任意的数值做运算，结果都会为空值。
```

```plsql
-- 解决办法
-- 计算每个员工的年薪【包括奖金】
select emp.ename,emp.sal * 12 + nvl(emp.comm,0) from emp
```

#### 9.1.1.6、条件表达式

```plsql
-- 计算emp表中的每个员工起中文名字
select 
   emp.ename,
   case emp.ename
     when 'SMITH' then '段康家'
     when 'ALLEN' then '彭依凝'
     when 'WARD' then  '崔灿'
     else '张子森'
     end    
from 
   emp
```

```plsql
--判断emp表中员工工资，如果高于3000显示高收入，如果高于1500低于3000显示中等收入，其余显示低收入
select 
   emp.ename,
   emp.sal,
   case 
     when emp.sal > 3000 then '高收入'
     when emp.sal > 1500 then '中等收入'
     else '低收入'
     end    
from 
   emp 
```

#### 9.1.1.7、decode函数

```plsql
-- 计算emp表中的每个员工起中文名字
select 
   emp.ename,
    decode(emp.ename,
      'SMITH',  '段康家',
      'ALLEN',  '彭依凝',
      'WARD',   '崔灿',
      '张子森') 
from 
   emp
--做法：
-- 把case...when...then关键字全部去掉,然后通过decode函数给包起来，并且用,号分隔即可。
```

```plsql
--判断emp表中员工工资，如果高于3000显示高收入，如果高于1500低于3000显示中等收入，其余显示低收入
select 
   emp.ename,
   emp.sal,
   decode(
      sign(emp.sal - 3000), 
           1, '高收入' , 
           0, '高收入',
           -1, decode(sign(emp.sal - 1500),
                             1, '中等收入',
                             0, '中等收入',
                             -1,'低收入')
   )
         
from 
   emp 
```

### 9.1.2、多行函数/聚合函数

#### 9.1.2.1、说明

​	作用于多行，返回一个值。

#### 9.1.2.2、count函数

```plsql
-- 查询总数量，求有多少个员工
select count(1) from emp
```

#### 9.1.2.3、sum函数

```plsql
-- 查询全部员工的薪资的总额
select sum(emp.sal) from emp
```

#### 9.1.2.4、max函数

```plsql
-- 查询最高的员工的工资
select max(emp.sal) from emp
```

#### 9.1.2.5、min函数

```plsql
-- 查询最低的员工的工资
select min(emp.sal) from emp
```

#### 9.1.2.5、avg函数

```plsql
-- 查询平均工资
select avg(emp.sal) from emp
```

## 9.2、分组查询

### 9.2.1、group by

```plsql
-- 查询每个部门的平均工资
select
   emp.deptno , avg(emp.sal)
from 
   emp
group by 
   emp.deptno
```

```plsql
-- 查询每个部门的平均工资【会报错的】
select
   emp.deptno , avg(emp.sal) ,emp.ename
from 
   emp
group by 
   emp.deptno
-- 原因：分组查询中，出现在group by后面的原始列，才能出现在select后面,
--		没有出现在group by后面的列，想在select后面，必须加上聚合函数。
```

```plsql
---查询出平均工资高于2000的部门信息
select
   emp.deptno , avg(emp.sal)
from 
   emp
group by 
   emp.deptno
having
   avg(emp.sal) > 2000 
```

```plsql
---查询出每个部门工资高于800的员工的平均工资
select
  emp.deptno,
  avg(emp.sal)
from
  emp
where
  emp.sal > 800
group by
  emp.deptno
```

```plsql
---查询出每个部门工资高于800的员工的平均工资,然后再查询出平均工资高于2000的部门
select
  emp.deptno,
  avg(emp.sal)
from
  emp
where
  emp.sal > 800
group by
  emp.deptno
having
  avg(emp.sal) > 2000
```

## 9.3、多表查询

### 9.3.1、等值连接/自然连接

```plsql
-- 等值连接
select
   *
from
   emp,dept
where
   emp.deptno = dept.deptno
```

### 9.3.2、内连接

```plsql
-- 内连接
select 
   *
from 
   emp 
inner join 
      dept 
on 
      emp.deptno = dept.deptno
```

### 9.3.3、左连接

```plsql
-- 查询所有员工信息，以及员工所属部门
select 
   *
from 
   emp 
left join 
      dept 
on 
      emp.deptno = dept.deptno
```

### 9.3.4、右连接

```plsql
-- 查询所有部门信息以及部门下的所有员工信息
select 
   *
from 
   emp 
right join 
      dept 
on 
      emp.deptno = dept.deptno
```

### 9.3.5、oracle中专用连接

```plsql
-- 查询所有部门信息以及部门下的所有员工信息
select
   *
from
   emp,dept
where
   emp.deptno(+) = dept.deptno
```

## 9.4、自连接

```plsql
---查询出员工姓名，员工领导姓名
select
  e1.ename,e2.ename
from 
  emp e1,emp e2
where
  e1.mgr = e2.empno
```

```plsql
---查询出员工姓名，员工部门名称，员工领导姓名，员工领导部门名称
select
  e1.ename,d1.dname,e2.ename,d2.dname
from
  emp e1,emp e2,dept d1,dept d2
where
  e1.mgr = e2.empno
and e1.deptno = d1.deptno
and e2.deptno = d2.deptno
```

## 9.5、子查询

### 9.5.1、子查询返回一个值

```plsql
-- 查询出工资和SCOTT一样的员工信息
-- 第一步：首先查询出SCOTT的工资
select sal from emp where emp.ename = 'SCOTT';
-- 第二步：再根据第一步查询到的工资查询员工表中的员工等于这个工资的所有员工信息
select 
   *
from
   emp
where
   emp.sal = (select sal from emp where emp.ename = 'SCOTT');
```

### 9.5.2、子查询返回一个集合

```plsql
select 
   *
from
   emp
where
   emp.sal in (select sal from emp where deptno = 10)
```

### 9.5.3、子查询返回一张表

```plsql
-- 查询出每个部门最低工资，和最低工资员工姓名，和该员工所在部门名称
-- 第一步：首先查询出每个部门的最低工资
select 
    emp.deptno,min(emp.sal) min_sal
from
    emp
group by
    emp.deptno
    
-- 第二步：再去根据最低的工资和部门编号查询员工姓名和部门名称
select
    temp.deptno,temp.min_sal,emp.ename,dept.dname
from
    (select 
            emp.deptno,min(emp.sal) min_sal
        from
            emp
        group by
            emp.deptno
    ) temp , emp , dept
where
    temp.deptno = emp.deptno and temp.min_sal = emp.sal
and temp.deptno = dept.deptno;
```

## 9.6、分页查询

### 9.6.1、需求

```tex
将emp表工资倒序排序，每页五条记录，查询第二页。
```

### 9.6.2、rownum

​	rownum行号：==**当我们做select操作的时候，每查询出一行记录，就会在该行上加上一个行号，行号从1开始，依次递增，不能跳着走。**==

### 9.6.3、rownum案例

```plsql
-- 查询emp员工表，并且将序号打印出来
--     结果：是没有问题的
select rownum,emp.* from emp;

-- 查询emp员工表按照工资降序排序，并且将序号打印出来
--	   结果：排序操作会影响rownum的顺序【即，先执行的是select,再执行的是order by】
--	   rownum:是对结果集加的一个伪列，即先查到结果集之后再加上去的一个列 (强调：先要有结果集)
--	   通俗理解：ROWNUM是一个序列，是oracle数据库从数据文件中读取数据的顺序。它取得第一条记录则
--				rownum值为1，第二条为2.
select rownum,emp.* from emp order by emp.sal desc;

-- 查询emp员工表按照工资降序排序，并且将序号打印出来【解决办法】
--     方案：如果涉及到排序，但是还要使用rownum的话，我们可以再次嵌套查询。
select rownum,temp.* 
from(
       select rownum,emp.* from emp order by emp.sal desc
	) temp
```

### 9.6.4、借助rownum实现分页

```plsql
-- 再原有的基础之上直接添加where rownum < 11 and rownum > 5发现虽然不会报错，但是会查询不出来数据
-- 因为rownum不能必须从1开始，不能跳
select rownum,temp.* from(
       select rownum,emp.* from emp order by emp.sal desc) temp
where rownum < 11 and rownum > 5 
```

```plsql
-- 想当然的解决办法
-- 可以这样：再来一次嵌套，然后条件是where rownum > 5
-- 结果：不会报错，但是没有任何数据，因为我们说rownum必须从1开始
select 
   *
from (
         select 
              rownum,temp.* 
         from
              (select emp.* from emp order by emp.sal desc) temp
         where 
              rownum < 11
      )
where
      rownum > 5 
```

```plsql
-- 最终解决方案
-- 		思路：最终的rownum > 5应该使用的是from内部嵌套的rownum,所以可以给rownum起个别名
select 
   *
from (
         select 
              rownum rn,temp.* 
         from
              (select emp.* from emp order by emp.sal desc) temp
         where 
              rownum < 11
      )
where
      rn > 5  
```

# 十、视图

### 10.1、作用

- 可以屏蔽表的敏感字段，提高安全性。

### 10.2、语法

```plsql
create view v_emp as select empname from emp
```

# 十一、索引

## 11.1、概念

​	索引就是在表的列上构建一个二叉树，类似于一本书的目录。

## 11.2、作用

​	大幅度提高查询效率的目的。

## 11.3、语法

```plsql
create index idx_ename on emp(ename);
```

# 十二、plsql编程

## 12.1、说明

- pl/sql编程语言是对sql语言的扩展，使得sql语言具有过程化编程的特性，是面向过程的编程语言。
- pl/sql编程语言比一般的过程化编程语言，更加灵活高效。
- pl/sql编程语言主要用来编写存储过程和存储函数等。

## 12.2、变量的使用

### 12.2.1、定义数值变量

```plsql
declare
  -- 声明变量
  i number(2) := 20;
begin
  -- 输出i变量的值
  dbms_output.put_line(i);
end;
```

### 12.2.2、定义字符串变量

```plsql
declare
  -- 声明变量
  username varchar2(20) := '彭依凝';
begin
  -- 输出username变量的值
  dbms_output.put_line(username);
end;
```

### 12.2.3、通过查询表的某个字段值给一个变量赋值

```plsql
declare
  -- 定义username变量，该变量的类型引用自emp表中的ename的类型。该变量叫引用型变量
  username emp.ename%type; 
begin
  -- 赋值
  select emp.ename into username from emp where emp.empno = 7788;
  -- 输出
  dbms_output.put_line(username);
end;
```

### 12.2.4、通过查询表的某条记录给一个变量赋值

```plsql
declare
  -- 定义username变量，该变量的类型引用自emp表中的一行记录。该变量叫记录型变量
  emprecord emp%rowtype; 
begin
  -- 赋值
  select * into emprecord from emp where emp.empno = 7788;
  -- 输出
  dbms_output.put_line(emprecord.ename || emprecord.job || emprecord.mgr);
end;
```

### 12.2.5、小总结

```tex
赋值操作可以使用:=也可以使用into查询语句赋值
```

## 12.3、if选择结构

### 12.3.1、需求

```tex
---输入小于18的数字，输出未成年
---输入大于18小于40的数字，输出中年人
---输入大于40的数字，输出老年人
```

### 12.3.2、语法

```plsql
declare
  -- 定义变量,说明:【&】表示接受用户的输入
  age number(2) := &age;
begin
  if age < 18 then
    dbms_output.put_line('young');
  elsif age <40 then
    dbms_output.put_line('middle young');
  else
    dbms_output.put_line('old');                             
  end if;
end;
```

## 12.4、循环结构

### 12.4.1、需求

​	输出1到10是个数字

### 12.4.2、方式1：while循环

```plsql
declare
  i number(2) := 1;
begin
  while i <= 10 loop
     dbms_output.put_line(i);
     i := i + 1;
  end loop;
end;
```

### 12.4.3、方式2：exit循环

```plsql
declare
  i number(2) := 1;
begin
  loop
    exit when i > 10;
    dbms_output.put_line(i);
    i := i + 1;
  end loop;
end;
```

### 12.4.4、方式3：for循环

```plsql
declare
  i number;
begin
  for i in 1..10 loop
     dbms_output.put_line(i);
  end loop;
end;
```

## 12.5、游标

### 12.5.1、概念

​	可以存放多个对象，多行记录。类似于一个指针一样。

### 12.5.2、案例1

```plsql
-- 输出emp表中所有员工的姓名
declare
   -- 1、声明一个游标
   cursor pointer is select * from emp;
   emprecord emp%rowtype;
begin
   -- 2、打开游标
   open pointer;
        loop 
          -- 3、获取游标
          fetch pointer into emprecord;
          exit when pointer%notfound;
          dbms_output.put_line(emprecord.ename);
        end loop;
   -- 4、关闭游标
   close pointer;
end;
```

### 12.5.3、案例2

```plsql
-- 给指定部门员工涨工资，加1000块钱【键盘输入】
declare
   -- 1、声明一个游标
   cursor pointer is select * from emp where emp.deptno = &deptno;
   emprecord emp%rowtype;
begin
   -- 2、打开游标
   open pointer;
        loop 
          -- 4、获取游标
          fetch pointer into emprecord;
          exit when pointer%notfound;
          update emp set sal = sal + 100 where empno = emprecord.empno;
          commit;
        end loop;
   -- 3、关闭游标
   close pointer;
end;
```

```plsql
-- 给指定部门员工涨工资，加1000块钱【带参数的游标】
declare
   -- 1、声明一个游标
   cursor pointer(input_deptno emp.deptno%type) 
   			is select * from emp where emp.deptno = input_deptno;
   emprecord emp%rowtype;
begin
   -- 2、打开游标
   open pointer(10);
        loop 
          -- 4、获取游标
          fetch pointer into emprecord;
          exit when pointer%notfound;
          update emp set sal = sal + 10000 where empno = emprecord.empno;
          commit;
        end loop;
   -- 3、关闭游标
   close pointer;
end;
```

## 12.6、存储过程

### 12.6.1、概念

​	存储过程（Stored Procedure）是在大型数据库系统中，一组为了完成特定功能的 SQL 语句集，经

编译后存储在数据库中，用户通过指定存储过程的名字并给出参数（如果该存储过程带有参数）来

执行它。存储过程是数据库中的一个重要对象，任何一个设计良好的数据库应用程序都应该用到存

储过程。

​	简单来说：**存储过程就是提前已经编译好的一段pl/sql语言，放置在数据库端，可以直接被调用。这一段pl/sql一般都是固定步骤的业务。**

### 12.6.2、语法

**说明：对于参数的使用，如果明确的指定in/out，则默认是in。**

```plsql
create [or replace] PROCEDURE 过程名[(参数名 in/out 数据类型)] 
is
	定义变量
begin
 	PLSQL 子程序体；
End;
```

```plsql
create [or replace] PROCEDURE 过程名[(参数名 in/out 数据类型)] 
AS 
	定义变量
begin
 PLSQL 子程序体；
End;
```

### 12.6.3、案例1：无参数的存储过程

```plsql
-- 需求：创建一个输出 helloword 的存储过程

-- 创建存储过程
create or replace procedure p1
is
begin
  dbms_output.put_line('HelloWorld');
end;

-- 调用p1存储过程
declare

begin
  p1();
end;
```

### 12.6.4、案例2：带输入参数的存储过程

```plsql
-- 需求：给指定的员工涨 100 工资
create or replace procedure p2(input_empno emp.empno%type)
is
begin
  update emp set emp.sal = emp.sal + 10000 where emp.empno = input_empno;
  commit;
end;

-- 创建存储过程
declare

begin
  p2(7788);
end;
```

## 12.7、存储函数

### 12.7.1、语法

```plsql
create or replace function 函数名(Name in type, Name in type, ...) return 数据类型 is
 	结果变量 数据类型;
begin
	语句体
 	return(结果变量);
end;
```

### 12.7.1、案例1

```plsql
-- 查询指定员工的年薪
create or replace function fn1(input_empno emp.empno%type) return number
is
  result number(10);
begin
  select emp.sal * 12 + nvl(emp.comm,0)  into result from emp where emp.empno = input_empno;
  return result;
end;

-- 调用存储函数
declare
 result number(10);
begin
  result := fn1(7788);
  dbms_output.put_line(result);
end;
```

### 12.7.2、小总结

```tex
1、存储过程和存储函数的参数都不能带长度
2、存储函数的返回值类型不能带长度
3、存储函数在调用的时候，返回值需要接收
```

## 12.8、out类型输出参数

```plsql
-- 使用存储过程实现查询指定员工的年薪并返回
create or replace procedure p2(input_empno in emp.empno%type,result out number)
is
   psal number(20);
   pcomm number(20);
begin
   select emp.sal * 12,nvl(emp.comm,0) into psal,pcomm from emp where emp.empno = input_empno;
   result := psal + pcomm;
end;

-- 调用存储过程
declare
  result number(20);
begin
  p2(7788,result);
  dbms_output.put_line(result);
end;
```

**==凡是涉及到into查询语句赋值或者:=赋值操作的参数，都必须使用out来修饰。==**

## 12.9、存储过程和存储函数的区别

### 12.9.1、说明

- 语法上的区别

  ​	存储过程使用：procedure

  ​	存储函数使用：function

- 本质区别

  ​	存储函数比存储过程多了两个return。但是从本质上来说：**存储函数有返回值，而存储过程没有返回值。**

  如果存储过程想实现有返回值的业务，我们就必须使用out类型的参数，但是即便是存储过程使用了out类型的参数，其本质也不是真的有了返回值，而是在存储过程内部给out类型参数赋值，在执行完毕后，我们直接拿到输出类型参数的值。

- 可以使用存储函数有返回值的特性，来自定义函数；而存储过程不能用来自定义函数。

### 12.9.2、案例

需求：查询出员工姓名，员工所在部门名称。

```plsql
-- sql语句应该这么写
select
  emp.ename,dept.dname
from
  emp,dept
where
  emp.deptno = dept.deptno
```

```plsql
-- 使用自定义函数实现

-- 第一步：编写自定义函数，即：根据部门编号查询部门名称
create or replace function queryDeptNameByNo(input_deptno in dept.deptno%type) return dept.dname%type
is
  resultDeptName dept.dname%type;
begin
  select dept.dname into resultDeptName from dept where dept.deptno = input_deptno;
  return resultDeptName;
end;

-- 第二步：使用自定义函数
select
  emp.ename,queryDeptNameByNo(emp.deptno)
from
  emp
```

# 十三、触发器

## 13.1、概念

​	触发器是一个与表相关联的、存储的 PL/SQL 程序。每当一个特定的数据操作语(Insert,update,delete)在指定的表上发出时，Oracle 自动地执行触发器中定义的语句序列。

​	换句话说：触发器，就是制定一个规则，在我们做**增删改**操作的时候，只要满足该规则，自动触发，无需调用，**触发器是作用于表上的。**

## 13.2、分类

- 语句级触发器

  ​	在指定的操作语句操作之前或之后执行一次，不管这条语句影响了多少行。不包含有for each row的触发器就是语句级触发器。 

- 行级触发器（FOR EACH ROW） 

  ​	包含有for each row的就是行级触发器，在行级触发器中使用 old 和 new 伪记录变量, 识别值的状态。

  ​	在触发器中触发语句与伪记录变量的值：

  | 触发语句   | ：old          | :new          |
  | ------ | ------------- | ------------- |
  | insert | 所有字段都是空(null) | 将要插入的数据       |
  | update | 更新以前该行的值      | 更新后的值         |
  | delete | 删除以前该行的值      | 所有字段都是空(null) |

## 13.3、语句级触发器案例

```plsql
-- 插入员工后打印一句话“一个新员工插入成功”
create or replace trigger t1
after insert
on t_user
declare

begin
  dbms_output.put_line('a new emp add');
end;

-- 测试触发操作
insert into t_user(id,username) values(8,'HelloWorld');
commit; -- 提交事务
```

## 13.4、行级触发器案例1(触发器中不能使用commit)

```plsql
-- 需求：当部门编号修改的时候，还需要修改员工表中该部门的编号为修改后的编号

create or replace trigger t2
after update
on dept	-- 触发器作用于dept表上。
for each row
declare

begin
  update emp set deptno = :new.deptno where deptno = :old.deptno;
end;

-- 测试触发
update dept set deptno = 99 where deptno = 90;
commit;
```

## 13.5、行级触发器案例2

```plsql
-- 需求：给员工涨薪不能低于300块钱,否则就抛出一个异常

create or replace trigger t3
before update
on emp
for each row
declare

begin
  if :new.sal - :old.sal < 300 then
    raise_application_error(-20001,'工资涨的也太少了');
  end if;
end;

-- 测试触发

update emp set sal = 26300 where empno = 7788;
commit;
```

## 13.6、行级触发器案例3

```plsql
-- 触发器实现主键自增。
-- 分析：在用户做插入操作的之前，拿到即将插入的数据，给该数据中的主键列赋值。

create or replace trigger t4
before insert
on t_user
for each row
declare

begin
   -- 查询一个序列值,并且该值就是以后要插入的主键id的值
   select s_t_user.nextval into :new.id from dual;  
end;

-- 测试触发
insert into t_user(username) values('oracle');
commit;
```

# 十四、Java语言调用

## 14.1、环境准备

```xml
<dependencies>
        <dependency>
            <groupId>com.oracle</groupId>
            <artifactId>ojdbc14</artifactId>
            <version>10.2.0.4.0</version>
        </dependency>

        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.12</version>
            <scope>test</scope>
        </dependency>
</dependencies>
```

==**注意：**==

- 针对不同的oracle数据库版本，所对应的jdbc驱动包也是不一样的。

  ​	oracle10g-------->    ojdbc14.jar
  ​	oracle11g-------->    ojdbc6.jar

- maven是不支持oracle驱动包的，主要原因在于Oracle这种公司是不屑与maven为伍的，于是maven3开始，oracle就没再授权了，所以苦逼的我们就只能手动添加到本地仓库了。

  ```tex
  mvn install:install-file -DgroupId=com.oracle -DartifactId=ojdbc14 -Dversion=10.2.0.4.0 -Dpackaging=jar -Dfile=ojdbc14.jar
  ```

## 14.2、案例1：根据员工编号查询员工详情

```java
@Test
public void testQueryByEmpNo() throws Exception{

        // 加载驱动
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // 创建数据库连接
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl","pengyining","P123456");

        // 编写sql
        String sql = "select * from emp where empno = ?";

        // 发送SQL
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1,7369);

        // 查询
        ResultSet rs = ps.executeQuery();
        if (rs.next()){
            Integer empNo = rs.getInt("empno");
            String ename = rs.getString("ename");

            System.out.println(empNo + "---" + ename);
        }
        rs.close();
        ps.close();
        conn.close();
}
```

## 14.3、案例2：根据员工编号计算该员工的年薪[使用存储过程]

```plsql
-- 存储过程
create or replace procedure p2(input_empno in emp.empno%type,result out number)
is
   psal number(20);
   pcomm number(20);
begin
   select emp.sal * 12,nvl(emp.comm,0) into psal,pcomm from emp where emp.empno = input_empno;
   result := psal + pcomm;
end;

-- 调用存储过程
declare
  result number(20);
begin
  p2(7788,result);
  dbms_output.put_line(result);
end;
```

```java
@Test
public void testCalcSalaryByEmpNo() throws Exception{

        // 加载驱动
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // 创建数据库连接
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl","pengyining","P123456");

        // 调用存储过程
        // 第一个？号表示输入参数
        // 第二个？号表示输出参数
        CallableStatement cs = conn.prepareCall("{call P2(?,?)} ");

        // 给参数赋值
        cs.setInt(1,7788);
        cs.registerOutParameter(2, OracleTypes.NUMBER);

        // 执行查询
        cs.execute();

        // 输出结果【其实就是把第二个参数给输出出来】
        Integer salary = cs.getInt(2);
        System.out.println(salary);

        cs.close();
        conn.close();
}
```

## 14.4、案例3：根据员工编号计算该员工的年薪[使用函数]

```plsql
-- 存储函数
create or replace function fn1(input_empno emp.empno%type) return number
is
  result number(10);
begin
  select emp.sal * 12 + nvl(emp.comm,0) + 1 into result from emp where emp.empno = input_empno;
  return result;
end;

-- 调用存储函数
declare
 result number(10);
begin
  result := fn1(7788);
  dbms_output.put_line(result);
end;
```

```java
@Test
public void testCalcSalaryByEmpNo() throws Exception{

        // 加载驱动
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // 创建数据库连接
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl","pengyining","P123456");

        // 调用存储过程
        // 第一个？号表示输入参数
        // 第二个？号表示输出参数
        CallableStatement cs = conn.prepareCall("{? = call FN1(?)} ");

        // 给参数赋值
        cs.setInt(2,7788);
        cs.registerOutParameter(1, OracleTypes.NUMBER);

        // 执行查询
        cs.execute();

        // 输出结果【其实就是把第二个参数给输出出来】
        Integer salary = cs.getInt(1);
        System.out.println(salary);

        cs.close();
        conn.close();
}
```