# interview

# 面试总结

## Redis的淘汰机制有哪些?

## Redis频繁的get,set操作,如何解决网络开销的问题?

## Redis的数据结构都有哪些?有什么应用场景?什么叫原子性？

## memcache 和 Redis有什么区别?

## 雪崩, 击穿, 穿透 是怎么回事

## 什么叫回表?

## innodb的事务特性有哪些?

## 什么叫 脏读, 幻读...?

## 第三方对接的时候, 我方的接口逻辑比较复杂, 好几个类好几个方法, 如何快速定为代码问题?

## 500 ，502，504有什么区别？什么情况下会产生这个状态码，如何定位问题？遇到问题怎么修复？思路是什么？



## Linux 统计接口出现200的情况做个排序，每个接口在哪个时间段访问过多少次，做个排序



## 接口除了问题，怎么解决？有一部分功能不好使，有一部分功能好使，怎么解决？



## 500 ，502，504有什么区别？什么情况下会产生这个状态码，如何定位问题？遇到问题怎么修复？思路是什么？

## Linux 统计接口出现200的情况做个排序，每个接口在哪个时间段访问过多少次，做个排序

## 接口除了问题，怎么解决？有一部分功能不好使，有一部分功能好使，怎么解决？

## 什么叫索引覆盖？用索引覆盖为什么会快？

## 索引的结构是怎么样的？

## innodb索引的结构是什么样的？

## 索引的原理是什么？

## 联合索引是什么？用的时候要注意什么？
abc上加了索引，ac，bc，ab会用到索引吗？

## 怎么分析sql？explain怎么用？

## mysql优化都有哪些？
## 联表查询怎么优化？

## PHP程序员用到的专业名词有哪些？作为一个专业的程序员要得到面试官的亲来，要多用专业名词

## 设计表要遵循怎么原则，要注意什么？

## 为什么text字段不能和其他的字段一起在一个表？放在一个表会产生什么样的结果？原理是什么？

## 怎么保证和第三方接口的幂等性呢？

## define定义常量和const定义常量有什么区别？

真题：

## 有四个人, a向b借了10元, b向c借了20, c向d借了30,d向a借了40,四人在场, 最少需要动用几元将所有欠款一次付清?



##  有一个存字符的数组， 实现算法， 判断数组里的字符正序和反序是否一样， 空格作为无效字符应该过滤。

>  要求：算法的时间复杂度最低，不能使用编程语言本身的函数库

1. 时间复杂度是什么呢？
2. PHP有没有这样的函数呢？如果有的话，那么PHP函数内部是怎么实现的这个东西呢？
3. 空格怎么处理呢？
4. 怎么计算自己写的算法的时间复杂度呢？

## 三只蚂蚁从正三角形的三个顶点沿着边移动, 速度相同,他们碰头的概率是多少?



## 匹配手机号的正则?

## 匹配邮箱的正则?

## 只用加减乘除， 求正数a的平方根

1. PHP内部是不是就是只用加减乘除这么实现的？
2. 有没有语言的函数使用了这种方法去实现了平方根求解呢？

## PHP的环境变量有哪些? 有什么应用场景?

## URL从输入到浏览器到展现页面经历的步骤?

## 对字符串表示的算术表达式求值

1. 运算符的优先级怎么处理?
2. 遇到括号怎么办?

## PHP的session扩展默认把session数据存储在什么地方?

## 编写一个静态方法, 用最小代价实现将字符串反转. 比如: abcd,转成dcba

> 要求: 不使用PHP内置函数

## 写函数创建长度为50的数组, 数组中的元素为递增的奇数,首元素为7

## 实现按行读取一个文件内容, 并将非空行以数组形式存储

## 设计一个生产者消费模型的缓存数据结构 和算法, 缓存满的时候按时间最久优先淘汰, 缓存容量大小1000条目.

> 要求: 算法时间复杂度 和空间复杂度 都要良好

1. 什么交空间复杂度?
2. 什么叫良好?
3. 生产者消费模型是什么?
4. 缓存数据结构怎么设计?
5. 算法怎么设计?

# Linux 系统查看文件置顶关键词出现次数

## ['a'=>100,'b'=>200,'c'=>100], 写一个自定义排序函数, 按值降序, 如果值一样, 按键排序

## 程序开发中, 如何提高程序运行效率?

## 设置CT任务, 每小时执行一次ct.php脚本

## $this,self,parent分别代表什么?在什么场景下使用?

## 能够使用HTML和PHP分离开使用的模板有哪些?





# 更新丢失(Lost Update),脏读(Dirty Reads),幻读(Phantom Reads),不可重复读(Non-Repeatable Reads)的问题

什么叫脏读?幻读?还有不可重复读? 

脏读,  读到了假数据(脏数据),读脏

幻读,在同一个事务中, 有或无的问题, 第一次读的时候有, 第二次读的时候无

不可重复读, 在同一个事务中, 两次读的结果不一样

> 什么情况下回发生这种问题?
>
> 并发+事务隔离级别

SQL级别的问题演示,模拟并发

>  脏读

| session1                              | session2                                    |
| ------------------------------------- | ------------------------------------------- |
| begin;                                | begin;                                      |
|                                       | update user set money=money+100 where id=1; |
| Select * from user where id=1;        |                                             |
| # 拿着查出来的值去做了一些事情(money) |                                             |
| commit;                               |                                             |
|                                       | rollback;                                   |

>  幻读

| session1                                       | session2                                                |
| ---------------------------------------------- | ------------------------------------------------------- |
| begin;                                         | begin'                                                  |
| select * from interview.user where money=1234; |                                                         |
|                                                | insert interview.user(name,money) value ('张三', 1234); |
|                                                | commit;                                                 |
| select * from user where money=1234;           |                                                         |
| commit;                                        |                                                         |



>  不可重复读

| session1                                                     | session2                                        |
| ------------------------------------------------------------ | ----------------------------------------------- |
| begin;                                                       | begin;                                          |
| select * from intervew.user where id=1;                      |                                                 |
|                                                              | update interview.user set money=111 where id=1; |
|                                                              | commit;                                         |
| select * from interview.user where id=1; -- 这里出来的结果和以前就不一样了 |                                                 |
| commit;                                                      |                                                 |







## 继续思考

隔离级别都有哪些? 

| 隔离级别                  | 脏读   | 不可重复度 | 幻读   |
| ------------------------- | ------ | ---------- | ------ |
| 未提交读(READ UNCOMMITED) | 可能   | 可能       | 可能   |
| 提交读(READ COMMITED)     | 不可能 | 可能       | 可能   |
| 可重复读(REPEATABLE READ) | 不可能 | 不可能     | 可能   |
| 串行化 (SERIALIZABLE)     | 不可能 | 不可能     | 不可能 |

MySQL默认的隔离级别是什么?

默认隔离级别是`可重复读`

如何查看MySQL的隔离级别?

```MySQL
-- 事务隔离级别
-- select @@transaction_isolation;
-- select @@tx_isolation;
show variables like '%isolation%'; -- 这个语句执行了之后, 不同的MySQL版本会有不同的结果
-- 因为, 从5.7.20版本开始, transaction_isolation作为tx_isolation的别名被引入, 在8.0版本后tx_isolation被废弃
-- 也就是说:
-- <5.7.20, 只有tx_isolaiton
-- 5.7.20~8.0 之间 tx_isolation 和 transaction_isolation 都是存在的
-- >=8.0 只有 transaction_isolation
```



在这些隔离级别会有什么问题?

上面有说过了,表格里面

在PHP层面应该注意什么?

这些隔离级别存在的意义什么? 既然有问题可能出现,为什么还存在这些隔离级别? 为什么不直接用串行话, 不用其他的?

隔离级别是怎么实现的?

答: 是通过锁机制来实现的, 有:

那么锁又是什么呢?

1. 排他锁(又叫行锁) for update,  mysql的修改和添加和删除(cud)操作默认就加这个排他锁, 加上之后别的事务不能对这个数据再加任何多锁
2. 共享锁 lock in share mode 共享锁,对行加的锁, 加上锁之后,可以进行读写操作, 别的事务可以再次对统一个行加共享锁, 但是不能加排它锁, 而且只能读数据, 不能修改数据, 想修改数据,必须等到这个行的所有共享锁都释放了才可以修改
3. 间隙锁,

通过锁来实现的

# Mysql的REPEATABLE-READ的幻读问题

> 好像是解决了幻读问题,但是并没有完全解决





# 那我们怎么看到锁呢?

和锁相关的表

 `performance_schema.data_locks`

```sql
CREATE TABLE `data_locks` (
  `ENGINE` varchar(32) NOT NULL,
  `ENGINE_LOCK_ID` varchar(128) NOT NULL,
  `ENGINE_TRANSACTION_ID` bigint unsigned DEFAULT NULL,
  `THREAD_ID` bigint unsigned DEFAULT NULL,
  `EVENT_ID` bigint unsigned DEFAULT NULL,
  `OBJECT_SCHEMA` varchar(64) DEFAULT NULL,
  `OBJECT_NAME` varchar(64) DEFAULT NULL,
  `PARTITION_NAME` varchar(64) DEFAULT NULL,
  `SUBPARTITION_NAME` varchar(64) DEFAULT NULL,
  `INDEX_NAME` varchar(64) DEFAULT NULL,
  `OBJECT_INSTANCE_BEGIN` bigint unsigned NOT NULL,
  `LOCK_TYPE` varchar(32) NOT NULL,
  `LOCK_MODE` varchar(32) NOT NULL,
  `LOCK_STATUS` varchar(32) NOT NULL,
  `LOCK_DATA` varchar(8192) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`ENGINE_LOCK_ID`,`ENGINE`),
  KEY `ENGINE_TRANSACTION_ID` (`ENGINE_TRANSACTION_ID`,`ENGINE`),
  KEY `THREAD_ID` (`THREAD_ID`,`EVENT_ID`),
  KEY `OBJECT_SCHEMA` (`OBJECT_SCHEMA`,`OBJECT_NAME`,`PARTITION_NAME`,`SUBPARTITION_NAME`)
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
```

>  这些字段都是什么意思呢?

  `ENGINE`  引擎, 使用的存储引擎
  `ENGINE_LOCK_ID`  加锁记录的id
  `ENGINE_TRANSACTION_ID`  引擎的事务id
  `THREAD_ID`  线程id
  `EVENT_ID`  事件id
  `OBJECT_SCHEMA`  对象模式
  `OBJECT_NAME`  对象名称
  `PARTITION_NAME`  分区名称
  `SUBPARTITION_NAME`  下分区名称
  `INDEX_NAME`  索引名称
  `OBJECT_INSTANCE_BEGIN`  对象实例开始
  `LOCK_TYPE`  锁类型
  `LOCK_MODE` 锁模式
  `LOCK_STATUS` 锁状态
  `LOCK_DATA` 锁数据



`data_lock_waits` 表

```SQL
CREATE TABLE `data_lock_waits` (
  
  `ENGINE` varchar(32) NOT NULL, 
  -- 引擎
  
  `REQUESTING_ENGINE_LOCK_ID` varchar(128) NOT NULL, 
  -- 请求锁id
  
  `REQUESTING_ENGINE_TRANSACTION_ID` bigint unsigned DEFAULT NULL, 
  -- 请求引擎事务id
  
  `REQUESTING_THREAD_ID` bigint unsigned DEFAULT NULL,
  -- 请求程id
  
  `REQUESTING_EVENT_ID` bigint unsigned DEFAULT NULL, 
  -- 请求事务id
  
  `REQUESTING_OBJECT_INSTANCE_BEGIN` bigint unsigned NOT NULL, 
  -- 请求对象实例开始
  
  `BLOCKING_ENGINE_LOCK_ID` varchar(128) NOT NULL,
  -- b锁引擎锁id
  
  `BLOCKING_ENGINE_TRANSACTION_ID` bigint unsigned DEFAULT NULL,
  -- b锁引擎事务锁id
  
  `BLOCKING_THREAD_ID` bigint unsigned DEFAULT NULL,
  -- b锁线程id
  
  `BLOCKING_EVENT_ID` bigint unsigned DEFAULT NULL,
  -- b锁事件id
  
  `BLOCKING_OBJECT_INSTANCE_BEGIN` bigint unsigned NOT NULL,
  KEY `REQUESTING_ENGINE_LOCK_ID` (`REQUESTING_ENGINE_LOCK_ID`,`ENGINE`),
  KEY `BLOCKING_ENGINE_LOCK_ID` (`BLOCKING_ENGINE_LOCK_ID`,`ENGINE`),
  KEY `REQUESTING_ENGINE_TRANSACTION_ID` (`REQUESTING_ENGINE_TRANSACTION_ID`,`ENGINE`),
  KEY `BLOCKING_ENGINE_TRANSACTION_ID` (`BLOCKING_ENGINE_TRANSACTION_ID`,`ENGINE`),
  KEY `REQUESTING_THREAD_ID` (`REQUESTING_THREAD_ID`,`REQUESTING_EVENT_ID`),
  KEY `BLOCKING_THREAD_ID` (`BLOCKING_THREAD_ID`,`BLOCKING_EVENT_ID`)
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
```



事务的四个特性(ACID)

1. 原子性atomicity,  要么一起成功,要么一起失败.
2. 一致性consistency,  事务中的前后改变要统一
3. 隔离性isolation, 事务在没有提交之前, 事务之外是看不到的
4. 持久性durability, 事务一旦提交, 就写到文件里了,就持久化了

PHP级别的问题

订单积分问题



索引和加行锁的问题会影响并发, 如果修改的条件没有加索引, MySQL会对所有行加锁(有待验证),
然后再释放不满足条件的锁, 这样加锁再释放,就大大降低了并发的性能

没有必要在深入下去了:

怎么看MySQL加了多少锁呢? 怎么看在哪里加了锁?



# MySQL中观察事务隔离需要用到的SQL

```sql
-- 当前运行的事务
select * from information_schema.innodb_trx;

-- 当前出现的锁 <8.0
select * from infomation_schema.innnodb_locks;

-- 锁等待对应关系
select * from infomation_schema.innodb_lock_waits

-- autocommit的值
select @@autocommit;

-- 查看隔离级别
select @@tx_isolation; -- <8.0
select @@transcation_isolation; -- >=8.0
show variables like '%isolation%'; -- 都可以
-- 从5.7.20版本开始, transaction_isolation作为 tx_isolation的别名被引入, 在8.0版本后tx_isolation被废弃

-- 查看当前数据库的线程情况
show full processlist;

# kill 进程
kill 1825

# 查看表的更新时间
select * from information_schema.tables where table_schema= '数据库名称' AND table_name='表';mp

# 整个数据库备份
mysqldump -uroot -p --databases wxss > 文件地址/名称.sql
```



# PHP在什么场景下会出现 脏读 可重复度 不可重复读 幻读的问题?

真正的业务是怎么样的?肯定是在有必要使用事务的情况, 而且在并发情况下, 这种问题还有可能会产生? 针对我们的业务,我们应该选用那种隔离级别才是最好的?因为毕竟隔离级别越高, 性能就越低?(为什么会这样,需要探究一下)

可重复读, 不可重复读,对应的是(update操作)

幻读, 针对的是insert



# 修改隔离级别

set [作用域] transaction isolation level [事务隔离级别]

作用域: session 当前会话, global 全局

隔离级别: read uncommitted , read committed, repeatable read, serializable

做实验

在PHPstorm里, 使用global修改, 对于已经打开的窗口, 隔离级别不会被改变, 新开的窗口会根据global设置的级别改变

session设置的隔离级别, 只会在当前的窗口生效, 对于新开的窗口 和 已经打开的窗口都不会有影响

# MySQL事务

开启: start transaction 或者 begin

> 注意: begin/start transcation 命令不是事务的开始, 命令之后的第一条命令才是事务的开始

回滚: rollback

提交: commit

查看: ` select * from information_schema.innodb_trx;

做实验验证

```sql
begin; -- 此时在另一个窗口查看innodb_trx, 没有事务在运行
select * from interview.user where id=1; -- 此时才能看到事务开始了
commit; 
start transaction -- 此时在另一个窗口查看innodb_trx, 没有事务在运行
select * from interview.user where id=1; -- 此时才能看到事务开始了
```



可重复度的情况下, 解决了重复读的问题, 也就是开启事务的时候数据是什么样子的, 在事务中就一直是那样, 即使,其他事务修改了这个数据, 并且提交了, 这个事务读取的还是原来的数值,上面说的是针对修改(update)  和 删除(delete) 操作的,  但是对增加(insert), 会和原来的情况不一致(`为什么会这样呢?`),事务里会读到删除和增加的修改

做实验:

| 事务1                                                    | 事务2                                                      |
| -------------------------------------------------------- | ---------------------------------------------------------- |
| begin;                                                   | begin;                                                     |
| select * from interview.user where id=1;                 |                                                            |
|                                                          | delete from interview.user where id=1;                     |
| select * from interview.user where id=1; -- 此时数据还在 | select * from interview.user where id=1; -- 数据已经没有了 |
|                                                          | commit;                                                    |
| select * from interview.user where id=1;-- 此时数据还在  | select * from interview.user where id=1; -- 数据已经没有了 |
| commit;                                                  |                                                            |
| 对于删除保证了, 可重复读                                 |                                                            |



# 事务隔离中的阻塞问题(并发性能)

> 阻塞毫无疑问会影响并发的性能, 因为发生了阻塞,就意味着, 被阻塞事务需要等待其他事务执行完毕

## 可重复读(repeatable read)中的幻读问题

可重复读没有解决幻读的问题, 那么幻读问题在什么情况下会发生呢?

`select * from performance_schema.data_locks;` 查出来的结果, 是什么意思?

> 怀疑,这是真的吗?: 如果修改的时候, where条件字段没有索引,对于没有加索引的字段, MySQL因为无法定为数据,所以会对所有记录加锁, 然后过滤一遍, 不满足情况的就释放锁, 加锁, 又释放锁, 这样操作就极大的影响了性能,.

LOCK_DATA: supremum pseudo-record

LOCK_MODE:IX, X



间隙锁(Next-Key), 解决并发和幻读的问题

那间隙锁又是什么呢?

准备数据

```SQL
truncate table interview.user;
insert into interview.user(name, money) value ('间隙锁10',10);
insert into interview.user(name, money) value ('间隙锁30',30);
```

where money=10 的情况

| <10(间隙锁) | 10(行锁) | 10,30(间隙锁) | 30(行锁) | >30(间隙锁) |
| ----------- | -------- | ------------- | -------- | ----------- |
| 这里会锁    | 会锁     | 会锁          |          | 这里没锁??? |
|             |          |               |          |             |



## 间隙锁的实验

等于10的记录会被阻塞

实验验证没有问题

| 事务1                                         | 事务2                                                   |
| --------------------------------------------- | ------------------------------------------------------- |
| begin;                                        | begin;                                                  |
| select * from user                            |                                                         |
| update user set name='间隙锁' where money=10; |                                                         |
|                                               | insert into user(name,money) values('新插入的数据',10); |
| select * from user where money=10             | wait...这里会被阻塞掉                                   |
| commit;                                       | 事务1提交之后才能提交                                   |
|                                               | commit;                                                 |

插入的记录小于10(等于9)也会阻塞, 被间隙锁阻塞

实验验证没有问题

| 事务1                                         | 事务2                                                  |
| --------------------------------------------- | ------------------------------------------------------ |
| begin;                                        | begin;                                                 |
| select * from user                            |                                                        |
| update user set name='间隙锁' where money=10; |                                                        |
|                                               | insert into user(name,money) values('新插入的数据',9); |
| select * from user where money=10             | wait...这里会被阻塞掉                                  |
| commit;                                       | 事务1提交之后才能提交                                  |
|                                               | commit;                                                |

插入的记录在10,30之间也会被阻塞

实验验证没有问题

| 事务1                                         | 事务2                                                   |
| --------------------------------------------- | ------------------------------------------------------- |
| begin;                                        | begin;                                                  |
| select * from user                            |                                                         |
| update user set name='间隙锁' where money=10; |                                                         |
|                                               | insert into user(name,money) values('新插入的数据',20); |
| select * from user where money=10             | wait...这里会被阻塞掉                                   |
| commit;                                       | 事务1提交之后才能提交                                   |
|                                               | commit;                                                 |

插入记录>30就不会被阻塞, 为啥???

我感觉这个会有问题

实验验证没有问题,啪啪打脸, 神奇, 这是为什么呢?

| 事务1                                         | 事务2                                                   |
| --------------------------------------------- | ------------------------------------------------------- |
| begin;                                        | begin;                                                  |
| select * from user                            |                                                         |
| update user set name='间隙锁' where money=10; |                                                         |
|                                               | insert into user(name,money) values('新插入的数据',35); |
| select * from user where money=10             | wait...这里会被阻塞掉                                   |
| commit;                                       | 事务1提交之后才能提交                                   |
|                                               | commit;                                                 |

在可重复读的隔离级别下, 间隙锁对于大于现有记录的部分不会加间隙锁, 这是为什么呢? 小于的加锁了, 中间的也加锁了, 就大于的不加锁,明天我们来一起解决这个问题!!!

我要是把索引删除了, 大于30的情况, 会不会就会锁上呢?

实验验证, 确实吧索引删除了, 大于30 的情况也会锁, 锁表了

再把索引加上, 看一下锁的情况

经过实验验证, 如果加了索引, 就不会锁表了,确实没有锁表了, 而且里面还多了个锁的类型, 明天我也会一起探究一下是什么东西,这里先做个预告吧, 东西太多了,确实进度有点慢, 不过不着急,慢慢来

B+树是什么东西?

B+树是有序的

当前读和快照读:  

​	快照读,读取的是快照, 不加锁, 普通的读操作

​	当前读,读取的是最新记录, 要加锁, 特殊的读操作, 修改,删除, 添加操作, 保证其他事务不能修改加锁的记录

可以在SQL语句中主动加锁, 例如

```sql
select * from interview.user for update; -- for update 加的就是X锁,排他锁
select * from interview.user lock in share mode  -- lock in share mode 加的就是共享锁, S锁
```

死锁?死锁?

两个查看状况的命令是什么意思呢?

> show full processlist
>
> show engine innodb status



# MySQL 的锁

锁是为了解决并发问题而诞生的, 不仅在MySQL中有应用,在其他的地方应用也很广泛, 这里我们只讨论MySQL中的锁, 锁的操作是消耗资源的, 锁的操作有 加锁(获得锁), 释放锁, 检查锁释放以解除

共享锁(读锁): 别的事务可以读, 不能写

排它锁(写锁): 别的事务, 不能读,也不能写

## 锁的粒度

表级锁: 开销小, 加锁快, 不会出现死锁, 但是加锁的面积大, 发生冲突的概率大, 并发效率低

	* 表级锁, 适合以查询为主, 并发量少的数据

行级锁: 开销大, 加锁慢, 会出现死锁,  只锁当前行, 发生冲突的概率小, 并发效率高

	* 行级锁, 适合大量并发查, 加上 大量并发按条件修改的情况

页面锁: 开销,加锁速度,粒度 中等, 会出现死锁, 支持并发, 并发效率中

锁的类型

GAP, 间隙锁, 间隙锁的存在意义就是防止幻读, 因为这种间隙锁的存在, 就要求我们, 修改数据的时候, 尽量使用等于条件, 避免使用范围条件, 来访问, 防止出现间隙锁 

> 但是, 用等于也会出现间隙锁啊! 比如 money=10 的条件, 有记录10 和 30 的时候, 小于10 和10到30之间都加了间隙锁

`S, X, IS, IX, S_GAP, X_GAP, IS_GAP, IX_GAP, or AUTO_INC for shared, exclusive, intention shared, intention exclusive row locks, shared and exclusive gap locks, intention shared and intention exclusive gap locks, and auto-increment table level lock, respectively.`

| 名字     | 英文含义                        | 翻译           | 理解               |
| -------- | ------------------------------- | -------------- | ------------------ |
| S        | shared                          | 共享锁         |                    |
| X        | Exclusive                       | 排它锁         |                    |
| IS       | Intention shared                | 意向共享锁     |                    |
| IX       | Intention exclusive row locks   | 意向排它锁     |                    |
| S_GAP    | shared gap locks                | 共享间隙锁     |                    |
| X_GAP    | exclusive gap locks             | 排他间隙锁     |                    |
| IS_GAP   | intention shared gap locks      | 意向共享间隙锁 |                    |
| IX_GAP   | intention exclusive gap locks   | 意向排他间隙锁 |                    |
| AUTO_INC | auto-increment table level lock | 自动增加锁     |                    |
| IIX      | insert intention exclusive lock | 插入意向间隙锁 | 只用于并发插入操作 |

innodb在不同隔离级别情况下的加锁方式(8.0)

| sql\隔离级别                                                 | read uncommited | read commited | reaptable read | serialize |
| ------------------------------------------------------------ | --------------- | ------------- | -------------- | --------- |
| select 相等                                                  |                 |               |                |           |
| select 范围                                                  |                 |               |                |           |
| update 相等                                                  |                 |               |                |           |
| update 范围                                                  |                 |               |                |           |
| delete 相等                                                  |                 |               |                |           |
| delete 范围                                                  |                 |               |                |           |
| insert                                                       |                 |               |                |           |
| replace?无键冲突                                             |                 |               |                |           |
| replace?键冲突                                               |                 |               |                |           |
| select * from ... for update 相等                            |                 |               |                |           |
| select * from ... for update 范围                            |                 |               |                |           |
| select * from... in share mode 相等                          |                 |               |                |           |
| select * from.. in share mode 范围                           |                 |               |                |           |
| insert into ...,select...(指源表锁) innodb_lock_unsafe_for_binlog=on |                 |               |                |           |
| insert into ...,select...(指源表锁) innodb_lock_unsafe_for_binlog=off |                 |               |                |           |
| create table...., select..(指源表锁) innodb_lock_unsafe_for_binlog=on |                 |               |                |           |
| create table...., select..(指源表锁) innodb_lock_unsafe_for_binlog=off |                 |               |                |           |





replace是什么?

指源表锁是什么?

死锁情况模拟

start transaction with consistent snapshot 是什么操作????

能够创建一个, 快照读的事务, 读不用加锁, 能够保证读的一致性, 但是, 不能保证读取的是最新的数据



做实验,验证不加索引的时候更新语句, 会加很多锁, 所以, 对于没有走索引条件的更新语句, 要注意,要慎用



> 名词解释
>
> MVCC, MultiVersion Concurrency Control, 简称MVCC 或 MCC, 中文叫做, 多版本数据库或者叫做 数据多版本并发控制

快照(snapshot), 

快照读(snapshot read): 读取的是快照的版本, 不加锁

当前读(current read): 读取的是最新版本数据, 加锁

> 对串行化的理解, 串行化,就是一串的意思, 一个一个的来, 属于顺序执行, 就没有什么并发的问题了

> 条件的字段加了索引, 也不一定就是行锁, 即便在条件中使用了索引, 如果MySQL认为 全表扫描比使用索引的效率要高 的情况下, MySQL就会使用表锁, 而不是行锁

# InnoDB Monitors 是个什么东西?



Next-Key Lock (临键锁): 是记录所和间隙锁的结合, 锁定一个范围,防止出现幻读, 我理解就是间隙太多了, 就给合并到一起了, 都上锁了, 就叫临键锁了吧???

>  理解的有问题

假如有1,3,5,7 四条记录, 如果在记录5上加 临键锁, 那么会这么加锁(3,5], 会把`小于` 5 的间隙也加上锁, 所以说, 临键锁相当于 间隙锁 + 记录锁

> 注意, 这里是小于
>
> 为什么, 是小于不是大于呢? 根据这个规律, 我们应该注意哪些问题呢?

Record Lock(记录锁): 当行记录上锁, 也就是我们日常所说的行锁

# 锁的分类

三种行锁 `算法`: 记录锁, 间隙锁, 临键锁

按共享策略分: 共享锁, 排它锁, 意向共享锁, 意向排他锁

按加锁策略分: 悲观锁, 乐观锁(悲观锁先加锁再操作, 乐观锁 直接操作再看有没有问题)

> 意向锁,简写I, 英文intention, 存在的意义就是快速判断当前表是不是没有锁(指的是 排它锁或共享锁), 意思就是在加 行锁(排它锁 或 共享锁)之前, 先会对记录所在表加 `意向` 锁, 这样的话, 如果当前表中没有任何锁, 那么MySQL就能快速的判断出来可以加锁, 省的再去一行一行的遍历查看有没有加锁
>
> 
>
> 比如, 有个事务想加排它锁, 那他就看那个表有没有意向排它锁, 如果没有,就说明,当前表的所有记录上肯定就都没有排它锁, 那么他想加的记录肯定也没有排它锁, 那就放心加就好啦,  如果有意向排它锁, 那么就去看一看那条他要加的记录是否符合加锁的条件, 符合在加锁, 主要就是在没有锁的时候效率比较高
>
> 还有就是, 要锁表的时候, 如果表里面已经有行锁了, 那么表锁就会和行锁冲突, 加上意向锁就能避免这个问题了

锁的冲突

|                | 排它锁(X) | 共享锁(S) | 意向排它锁(IX) | 意向共享锁(IS) |
| -------------- | --------- | --------- | -------------- | -------------- |
| 排它锁(X)      | 冲突      | 冲突      | 冲突           | 冲突           |
| 共享锁(S)      | 冲突      | 兼容      | 冲突           | 兼容           |
| 意向排它锁(IX) | 冲突      | 冲突      | 兼容           | 兼容           |
| 意向共享锁(IS) | 冲突      | 兼容      | 兼容           | 兼容           |
|                |           |           |                |                |

**预测锁**?????



# 各种锁的触发

## 行共享锁触发

## 行排它锁触发

## 共享间隙锁触发

## 排他间隙锁触发

## 意向行共享锁触发

## 意向行排它锁触发

## 意向共享间隙锁触发

## 意向排他间隙锁触发

> 注意: 如果在ru和rc级别下, 即使使用 select...in share mode 或 select ... for update, 也不能防止`幻读`, 因为这两个隔离级别, 只有行锁, 不会有间隙锁, 所以, 不能避免幻读

幻读, 实际上就是间隙锁出了问题 . 



关于inclock的好几种方式, 和日志和数据恢复有关 , 看的我晕, 不知道说的是啥,感觉说了和没说一样, 好像还和主从复制有关系

> 涉及到MySQL主从复制的问题, 又是一个大坑啊

一般为了解决并发问题, 我们都会加缓存, 可以把并发的写缓存在Redis里,然后在进行串行的写入MySQL, 那么什么情况下可以使用缓存写到MySQL, 什么情况下又必须使用MySQL的并发写呢?





