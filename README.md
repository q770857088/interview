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

隔离级别越低, 对并发就越友好, 隔离级别越高, 开销就越大,对并发就越不友好.因为要加锁和释放锁, 所以就会有额外的开销, 所以说在不会出现问题的情况下, 尽量用更低的隔离级别才是明智的选择.

隔离级别是怎么实现的?

答: 是通过锁机制来实现的, 还有mvcc(多事务隔离机制), 会有snapshot(快照)产生来保证可重复读 有:

那么锁又是什么呢?

​	按照类型(LOCK_TYPE)来分: 表锁(TABLE), 记录锁(RECORD);

​	按照模式(MODE_TYPE)来分: 排它锁无间隙(X,REC_NOT_GAP), 共享锁无间隙(S,REC_NOT_GAP),排它间隙锁(X,GAP), 共享间隙锁(S,GAP), 意向排它锁(IX), 意向共享锁(IS)

1. 排他锁(又叫行锁) for update,  mysql的修改和添加和删除(cud)操作默认就加这个排他锁, 加上之后别的事务不能对这个数据再加任何多锁
2. 共享锁 select ... lock in share mode, select ... for share mode 共享锁,对行加的锁, 加上锁之后,可以进行读写操作, 别的事务可以再次对同一个行加共享锁, 但是不能加排它锁, 而且只能读数据, 不能修改数据, 想修改数据,必须等到这个行的所有共享锁都释放了才可以获取排它锁,从而执行修改操作
3. 间隙锁, 在一个开区间的范围
3. 临键锁, 在一个闭区间的范围

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

* 实验显示, 确实对所有行都加锁了, 但是没有发现释放锁的情况

没有必要在深入下去了:

怎么看MySQL加了多少锁呢? 怎么看在哪里加了锁?

```
select * from information_schema.INNODB_LOCKS; -- 8.0之前 查看锁
select * from information_schema.INNODB_TRX; -- 8.0 之前查看事务

select * from performance_schema.data_locks; -- 8.0 之后查看锁
select * from information_schema.INNODB_TRX; -- 8.0 之后 查看事务
```



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



# PHP在什么场景下会出现 脏读 可重复度 不可重复读 幻读的问题?, 

真正的业务是怎么样的?肯定是在有必要使用事务的情况, 而且在并发情况下, 这种问题还有可能会产生? 针对我们的业务,我们应该选用那种隔离级别才是最好的?因为毕竟隔离级别越高, 性能就越低?(为什么会这样,需要探究一下)

一般用rr模式就足够了, 在不影响业务的情况下,应该尽可能的使用更低的隔离级别, 隔离级别越低, MySQL的操作就越少, 能够减少开销, 并且对并发也更友好

比如, 可重复读, 如果PHP在取出数据后 用变量来传递记录中的值, 就不需要可重复读了,

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

查看: ` select * from information_schema.innodb_trx`;

做实验验证

```sql
begin; -- 此时在另一个窗口查看innodb_trx, 没有事务在运行
select * from interview.user where id=1; -- 此时才能看到事务开始了
commit; 
start transaction -- 此时在另一个窗口查看innodb_trx, 没有事务在运行
select * from interview.user where id=1; -- 此时才能看到事务开始了
```



可重复读的情况下, 解决了重复读的问题, 也就是开启事务的时候数据是什么样子的, 在事务中就一直是那样, 即使,其他事务修改了这个数据, 并且提交了, 这个事务读取的还是原来的数值,上面说的是针对修改(update)  和 删除(delete) 操作的,  但是对增加(insert), 会和原来的情况不一致(`为什么会这样呢?`),事务里会读到删除和增加的修改

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
>
> 实验验证: 只看到了对所有的行加锁(共享锁), 没看到有锁释放的情况

LOCK_DATA: supremum pseudo-record 这是什么意思?

LOCK_MODE:IX, X 是什么意思?

IX,是意向排它锁, X是排它锁



间隙锁(GAP), 解决并发和幻读的问题

Next-Key, 是临键锁

那间隙锁又是什么呢?

间隙锁就是锁住一个区间, 不允许其他事务进行insert操作

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

```mysql
create index user_money_index
   on user (money);
```

| 事务1                                         | 事务2                                                   |
| --------------------------------------------- | ------------------------------------------------------- |
| begin;                                        | begin;                                                  |
| select * from user                            |                                                         |
| update user set name='间隙锁' where money=10; |                                                         |
|                                               | insert into user(name,money) values('新插入的数据',20); |
| select * from user where money=10             | wait...这里会被阻塞掉                                   |
| commit;                                       | 事务1提交之后才能提交                                   |
|                                               | commit;                                                 |

![image-20220105075848409](/Users/wangdi/Library/Application Support/typora-user-images/image-20220105075848409.png)

![image-20220105075715333](/Users/wangdi/Library/Application Support/typora-user-images/image-20220105075715333.png)

插入记录>30就不会被阻塞, 为啥???

因为已有记录是10, 30 , 那么操作10 就对10 的间隙加锁, 10的左边是 <10, 10 的右边是(10,30), 所以大于30的就不属于10 左右两边的间隙了, 所以也就不会加锁了

我感觉这个会有问题

实验验证没有问题,啪啪打脸, 神奇, 这是为什么呢?为什么大于30的就不会锁呢?

| 事务1                                         | 事务2                                                   |
| --------------------------------------------- | ------------------------------------------------------- |
| begin;                                        | begin;                                                  |
| select * from user                            |                                                         |
| update user set name='间隙锁' where money=10; |                                                         |
|                                               | insert into user(name,money) values('新插入的数据',35); |
| select * from user where money=10             | wait...这里会被阻塞掉                                   |
| commit;                                       | 事务1提交之后才能提交                                   |
|                                               | commit;                                                 |

在可重复读的隔离级别下, 间隙锁对于大于现有,记录的部分不会加间隙锁, 这是为什么呢? 小于的加锁了, 中间的也加锁了, 就大于的不加锁,明天我们来一起解决这个问题!!!

这个和现有,还是不现有没有关系, 就是操作记录两边的间隙, 30已经不挨着了

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
select * from interview.user lock in share mode  -- lock in share mode 加的就是共享锁, S锁, 根据记录的情况会有不同的加锁策略
```

死锁?死锁?

两个查看状况的命令是什么意思呢?

> show full processlist 查看所有进程
>
> show engine innodb status 查看当前的锁情况和其他状态信息, 如果开启了lock monitor 还会显示更加详细的锁信息



# MySQL 的锁

锁是为了解决并发问题而诞生的, 不仅在MySQL中有应用,在其他的地方应用也很广泛, 这里我们只讨论MySQL中的锁, 锁的操作是消耗资源的, 锁的操作有 加锁(获得锁), 释放锁, 检查锁释放以解除

共享锁(读锁): 别的事务可以读, 不能写

排它锁(写锁): 别的事务, 不能读,也不能写

## 锁的粒度(TYPE)

表级锁(TABLE): 开销小, 加锁快, 不会出现死锁, 但是加锁的面积大, 发生冲突的概率大, 并发效率低

	* 表级锁, 适合以查询为主, 并发量少的数据

行级锁(RECORD): 开销大, 加锁慢, 会出现死锁,  只锁当前行, 发生冲突的概率小, 并发效率高

	* 行级锁, 适合大量并发查, 加上 大量并发按条件修改的情况

页面锁: 开销,加锁速度,粒度 中等, 会出现死锁, 支持并发, 并发效率中

锁的类型

GAP, 间隙锁, 间隙锁的存在意义就是防止幻读, 因为这种间隙锁的存在, 就要求我们, 修改数据的时候, 尽量使用等于条件, 避免使用范围条件, 来访问, 防止出现间隙锁 

> 但是, 用等于也会出现间隙锁啊! 比如 money=10 的条件, 有记录10 和 30 的时候, 小于10 和10到30之间都加了间隙锁

`S, X, IS, IX, S_GAP, X_GAP, IS_GAP, IX_GAP, or AUTO_INC for shared, exclusive, intention shared, intention exclusive row locks, shared and exclusive gap locks, intention shared and intention exclusive gap locks, and auto-increment table level lock, respectively.`

| 名字                             | 英文含义                        | 翻译           | 理解                                          |
| -------------------------------- | ------------------------------- | -------------- | --------------------------------------------- |
| S                                | shared                          | 共享锁         | 是间隙锁                                      |
| X                                | Exclusive                       | 排它锁         | 是间隙锁                                      |
| IS                               | Intention shared                | 意向共享锁     | 是表锁                                        |
| IX                               | Intention exclusive row locks   | 意向排它锁     | 是表锁                                        |
| S,GAP                            | shared gap locks                | 共享间隙锁     | 指的是 所有小于的间隙                         |
| X,GAP                            | exclusive gap locks             | 排他间隙锁     | 指的是 所有小于的间隙                         |
| IS_GAP(没见过)                   | intention shared gap locks      | 意向共享间隙锁 |                                               |
| IX_GAP(没见过)                   | intention exclusive gap locks   | 意向排他间隙锁 |                                               |
| AUTO_INC(没见过)                 | auto-increment table level lock | 自动增加锁     |                                               |
| II(只有在锁等待的时候才能观察到) | insert intention exclusive lock | 插入意向间隙锁 | 只用于并发插入操作,在插入被阻塞的时候可以看到 |

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
| replace?无键冲突                                             |                 |               | X,REC_NOT_GAP  |           |
| replace?键冲突                                               |                 |               |                |           |
| select * from ... for update 相等                            |                 |               |                |           |
| select * from ... for update 范围                            |                 |               |                |           |
| select * from... in share mode 相等                          |                 |               |                |           |
| select * from.. in share mode 范围                           |                 |               |                |           |
| insert into ...,select...(指源表锁) innodb_lock_unsafe_for_binlog=on |                 |               |                |           |
| insert into ...,select...(指源表锁) innodb_lock_unsafe_for_binlog=off |                 |               |                |           |
| create table...., select..(指源表锁) innodb_lock_unsafe_for_binlog=on |                 |               |                |           |
| create table...., select..(指源表锁) innodb_lock_unsafe_for_binlog=off |                 |               |                |           |

这种穷举方式不合理, 加锁和条件有关系 和 现有记录也有关系,情况的非常多,比如update 条件是相等, 记录存在和不存在的效果也是不一样的



replace是什么?

REPLACE是MySQL的内置函数

replace into 插入语句, 如果主键冲突, 会执行delete, 然后再insert, 这样会造成主键变大

指源表锁是什么?

死锁情况模拟

| 事务A                                              | 事务B                                                        |
| -------------------------------------------------- | ------------------------------------------------------------ |
| begin;                                             | begin;                                                       |
| update interview.user set name='死锁' where id=1;  |                                                              |
|                                                    | update interview.user set name='死锁2' where id=2;           |
| update interview.user set name='死锁3' where id=2; |                                                              |
|                                                    | update interview.user set name='死锁4' where id=1;-- \[40001\]\[1213\] Deadlock found when trying to get lock; try restarting transaction |
|                                                    | 事务2死锁,被回滚终止                                         |

start transaction with consistent snapshot 是什么操作????

实在开启事务的时候,就创建快照, 如果在rr模式下, 之后的select 都在这个快照下读取

能够创建一个, 快照读的事务, 读不用加锁, 能够保证读的一致性, 但是, 不能保证读取的是最新的数据



做实验,验证不加索引的时候更新语句, 会加很多锁, 所以, 对于没有走索引条件的更新语句, 要注意,要慎用



> 名词解释
>
> MVCC, MultiVersion Concurrency Control, 简称MVCC 或 MCC, 中文叫做, 多版本数据库或者叫做 数据多版本并发控制

快照(snapshot), 

快照读(snapshot read): 读取的是快照的版本, 不加锁

当前读(current read): 读取的是最新版本数据, 加锁

> 对串行化的理解, 串行化,就是一串的意思, 一个一个的来, 属于顺序执行, 就没有什么并发的问题了

> 条件的字段加了索引, 也不一定就是行锁, 即便在条件中使用了索引, 如果MySQL认为 全表扫描比使用索引的效率要高 的情况下, MySQL就会~~使用表锁, 而不是行锁~~ 把所有行都加锁,相当于表锁了

# InnoDB Monitors 是个什么东西?

monitor是监视器, 可以监视锁, 有

Standard Monitor: 监视活动事务的, 表锁, 行锁, 锁等待,  线程信号量等待, io文件请求, buffer pool统计信息, innodb 主线程purge 和 change buffer merge 活动

Lock Monitor: 提供额外的锁信息

还有 table space monitor 和 table monitor, 这两个在5.6以后已经被移除了, 这里就不讨论了

> MySQL默认是关闭监视器的, 因为监视也需要开销, 即使开启了, 在重启MySQL之后还是会关闭, 需要的话要再次手动开启

开启监视器的方式:

开启standard monitor:  set GLOBAL  innodb_status_output=ON/OFF

开启lock monitor: set GLOBAL innodb_status_output_locks=ON/OFF

开启之后, 会每15秒输出一次, 到错误日志, 而不是每次访问MySQL生成,开启或关闭innodb_status_output监视器,只是开启或关闭它写到错误日志, 即使关闭了innodb_status_output,在控制台也可以通过 show engine innodb status; 来了查看monitor的信息, 而lock monitor开启则会显示更多详细的信息



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

不叫预测锁, 是谓词锁, 官方文档上面的(Predicate Locks for Spatial Indexes) 是谓词锁的意思, 不是预测锁

但是, 这个具体作用我还不是很明白, 这里就不讨论了



# 各种锁的触发

## 行共享锁触发

select * from interveiw.user where id=1 for share;

## 行排它锁触发

select * from interveiw.user  where id=1 for update;

## 共享间隙锁触发

select * from interveiw.user  where id>1 for share;

## 排他间隙锁触发

select * from interveiw.user  where id>1 for update;

## 意向共享锁触发

只要在行上加共享锁, 就要先在表上加意向共享锁

select * from interveiw.user where id=1 for share;

select * from interveiw.user  where id=1 lock in share mode;

## 意向排它锁触发

只要在行上加排他锁, 就要先在表上加意向排他锁

select * from interveiw.user  where id=1 for update;

## 意向共享间隙锁触发

没找到方法

## 意向排他间隙锁触发

没找到方法

> 注意: 如果在ru和rc级别下, 即使使用 select...in share mode 或 select ... for update, 也不能防止`幻读`, 因为这两个隔离级别, 只有行锁, 不会有间隙锁, 所以, 不能避免幻读

幻读, 实际上就是间隙锁出了问题 . 



关于inclock的好几种方式, 和日志和数据恢复有关 , 看的我晕, 不知道说的是啥,感觉说了和没说一样, 好像还和主从复制有关系

> 涉及到MySQL主从复制的问题, 又是一个大坑啊

一般为了解决并发问题, 我们都会加缓存, 可以把并发的写缓存在Redis里,然后在进行串行的写入MySQL, 那么什么情况下可以使用缓存写到MySQL, 什么情况下又必须使用MySQL的并发写呢?



MVCC是为了保证读写并发才产生的, 之前是用的lock based(这个玩意没法读写并发, 必须等待占用锁的释放才能继续),大大的提高了数据库的性能



# X 和 (X,REC_NOT_GAP) 有什么区别?(没有解决这个问题)

X应该是记录之前的间隙

数据情况

![image-20220105085659419](file:///Users/wangdi/Library/Application%20Support/typora-user-images/image-20220105085659419.png?lastModify=1641344207)

执行的SQL `select * from user where money between 11 and 15 for update ;`

money是普通索引的锁情况

![image-20220105085623250](/Users/wangdi/Library/Application Support/typora-user-images/image-20220105085623250.png)

money是唯一索引的锁情况`create unique index user_money_uindex on user (money);`

![image-20220105090252713](/Users/wangdi/Library/Application Support/typora-user-images/image-20220105090252713.png)



# MySQL在update情况下会加(X,GAP), 为什么MySQL会在update 有索引 条件是等于 的时候加间隙排它锁,  是为了防止什么情况发生呢? 是防止幻读吗?防止幻读加行锁就行了, 为什么还要加间隙锁呢?这么做有什么意义呢?

来描述一下问题:

MySQL版本:8.0.27

事务隔离级别 `show variables like '%isolation%';`

```sql
set session transaction isolation level repeatable read ;
show variables like '%isolation%';
```

transaction_isolation,REPEATABLE-READ

索引的情况

```sql
# 表
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `money` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_money_index` (`money`) -- 只加普通索引
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
```

准备数据

```sql
truncate table interview.user;
insert into interview.user(name, money) value ('间隙锁10',10);
insert into interview.user(name, money) value ('间隙锁30',30);
```

(<10的间隙)10,(10到30的间隙),30(>30的间隙)

触发锁的方式

| 事务a                                                     | 事务b                                                        | 查看锁                                                       |
| --------------------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| set session transaction isolation level repeatable read ; | set session transaction isolation level repeatable read ;    |                                                              |
| begin;                                                    | begin;                                                       |                                                              |
| update interview.user set name='修改后' where money=10;   |                                                              |                                                              |
|                                                           |                                                              |                                                              |
|                                                           |                                                              | select * from performance_schema.data_locks;-- 此时查看锁情况,结果是 图1 |
|                                                           | select * from interview.user where money=1 for share; -- 尝试加共享锁 加锁成功 没有被阻塞 |                                                              |
|                                                           | select * from interview.user where money=1 for update -- 尝试加排它锁 加锁成功 没有被阻塞; |                                                              |
|                                                           | 显示的 在(10,30)的间隙加共享锁和排它锁 成功 没有被阻塞       |                                                              |
|                                                           | 显示的 在(>30)的间隙加共享锁和排它锁 成功 没有被阻塞         |                                                              |
|                                                           | insert into interview.user(name,money) value ('添加新',1); -- 尝试(<10的间隙)加入一条记录 被阻塞了 | 查看锁的情况(图2)                                            |
|                                                           | insert into interview.user(name, money) value ('间隙锁13',13); -- 尝试(10到30的间隙)加入一条记录 被阻塞了 | 查看锁情况(图3)                                              |
|                                                           | insert into interview.user(name, money) value ('间隙锁30',30); -- 尝试加入一条记录 成功了 没有被阻塞 | 查看锁的情况,多了个意向排它锁(图4)                           |
|                                                           | insert into interview.user(name, money) value ('间隙锁13',13); -- 尝试(>30的间隙)加入一条记录 成功了 没有被阻塞 | 查看锁的情况多了个意向排它锁(图4)                            |
|                                                           | select * from interview.user where money=10 for update; -- 被阻塞<br /><br /> select * from interview.user where money=10 for share ; -- 被阻塞 <br /><br />select * from interview.user where money=30 for share ; -- 不会阻塞<br /><br />select * from interview.user where money=30 for update ;-- 不会阻塞 |                                                              |
|                                                           |                                                              |                                                              |

>  图1:
>
> ![image-20220105210909339](/Users/wangdi/Library/Application Support/typora-user-images/image-20220105210909339.png)



> 图2
>
> ![image-20220105212952778](/Users/wangdi/Library/Application Support/typora-user-images/image-20220105212952778.png)
>
> insert_intention 这个锁类型只有在等待状态的时候才能看到



> 图3
>
> ![image-20220106081704203](/Users/wangdi/Library/Application Support/typora-user-images/image-20220106081704203.png)



> 图4
>
> ![image-20220106082651915](/Users/wangdi/Library/Application Support/typora-user-images/image-20220106082651915.png)



> ```sql
> select * from interview.user where money=10 for update;
> ```
>
> 此时会被阻塞, 并且会多一个等待的锁  和一个IX
>
> ![image-20220106164903561](/Users/wangdi/Library/Application Support/typora-user-images/image-20220106164903561.png)

> select * from interview.user where money=10 for share;
>
> 此时会被阻塞, 并且会多一个等待的锁 和一个IS
>
> ![image-20220106165136463](/Users/wangdi/Library/Application Support/typora-user-images/image-20220106165136463.png)

查看锁的方式 `select * from performance_schema.data_locks;`

被阻塞的语句

问题: 修改操作 加记录排它锁可以理解, 防止其他事务操作, 那加[(X,GAP)--30,2]就是`图1`的第四个锁 的意义何在?

答: 首先, 不是所有的锁都在performance_schema.data_lock表里面能看到,  至于update为什么加间隙锁, 可能是因为, 在非唯一索引上, 没有办法加行锁, 所以就只能加间隙锁了, 而(X,GAP)是配合X锁,表示小于记录的所有间隙. 比如, 上面的例子中 修改了money=10 这条记录, MySQL就在10上加锁, 加锁的方式是根据索引的情况加的, 此时的索引是普通索引, 并不能保证money=10的唯一, 所以只能在money=10的这条记录上加一个X锁, 而不是(X,REC_NOT_GAP)锁, 而X的效果是带间隙的,money=10的左右间隙是(<10的间隙) 和 (>10的间隙) , 但是光靠money=10的这个X锁没法精确锁定到(10,30) 这个范围, 所以(X,GAP)money=30 这个锁,就限定了锁的区间是<30的所有间隙, 也就是(10,30)的间隙和(<10)的间隙,当然这个(<10的间隙)是不需要money=30X,GAP这个锁的, 所以 money=30X,GAP这个锁的意义就是`限定>10的区间到30结束`, 当然了, 这是我的理解,不一定完全正确,但是已经说的过去了 

(X,REC_NOT_GAP) 是指就只锁定当前记录

X, 那就不只是锁定当前记录了, 和这条索引一样的, 就都给锁了, 别的事务就不能获取排它锁了,

>  在MySQL版本5.7.33中, 使用for update 显示的加锁, 用`select * from information_schema.INNODB_LOCKS;` 查看锁也是看不到的, 但是不是说这个锁就没有, 是有的, 只不过看不见而已, 只有在等待的时候才能看到锁.

那看一下,money是唯一索引的情况

```sql
drop index user_money_index on user;

create unique index user_money_uindex
	on user (money);
```

还是用上面的表格来看

> ```sql
> begin;
> update interview.user set name='修改后' where money=10;
> ```
>
> 执行语句后的锁情况
>
> ![image-20220106165753016](/Users/wangdi/Library/Application Support/typora-user-images/image-20220106165753016.png)
>
> 可以看到, 这里的锁类型是 X,REC_NOT_GAP 也就是说唯一索引的时候, MySQL可以精确的锁定一条记录, 所以就不需要间隙锁 或者 临建锁了, 那么后面的情况可想而知了, 也就不需要做实验验证了

总结: 根据实验,我们可以看出, 如果不是唯一索引, 那么MySQL就会加间隙锁, 所以在更新数据的时候, 一定要注意避免使用非唯一索引来更新数据, 最好使用主键来更新数据,这样能够提高并发的性能, 比如,如果我们想更新表中的 money=10的行, 我们可以先查出money=10的行,然后获取到id之后再来做更新操作, 或者直接在业务层面,用id来作为参数,这样的效果会更好,因为就少了一次查询的操作,也能减少开销

快照读（SnapShot Read）: rr和rc模式下,查询语句, 不显示的加锁, 就是快照读,在rr模式下, 在事务开始之后的第一条select语句开始会创建快照, 来保证可重复读, 而在rc模式下,每次select都会创建一个快照

> 官方文档原文
>
> With READ COMMITTED isolation level, each consistent read within a transaction sets and reads its own fresh snapshot.
>
> 使用 READ COMMITTED 隔离级别，事务中的每个一致读取都会设置和读取自己的新快照。

每次select都创建一个快照有什么意义?

因为, 要保证读到可提交的数据(read Commited), 所以, 就必须每次都创建新的快照, 那直接读取最新记录不就好了? 正式因为又不想上锁, 所以就创建了快照,这样做为了保证并发(保证读的时候不影响其他事务操作数据)

> 如何查看生成的快照呢?目前没有在MySQL里面没有发现能够直观的看到快照的方法, 看了许多文章, 快照是用undo log来实现的, 这个问题在以后遇到的时候可以再继续深入, 这里就不再讨论了

当前读: 在rr模式下显示的加锁(for update/share), MySQL就会读取最新的数据, 同时对数据加锁

start transaction with consistent snapshot 的作用

在开启事务的时候, 开启快照, 那么是不是 在ru和rc下使用这个开启事务, 就能保证可重复读了呢? 答案是否定的, 因为, 在ru模式下没有什么快照, 而在rc模式下每次select都会有一个快照, 所以这个语句根本就没有作用, 那这条语句有什么用呢?

他是在rr模式下使用的,  因为rr模式下开启事务的时候, 不会生成快照, 而是在第一条select语句执行的时候才开始有快照, 但是如果使用start transaction with consistent snapshot ; 的话, 就会在开启事务的同时, 创建一个快照, 之后在使用select就会每次都是用开启事务的时候的快照了. 这个具体在什么样的业务场景下会用到呢?具体用处还是要根据具体的业务, 目前我还没有遇到这类业务, 也没有想到什么地方能用到.



### 间隙锁

数据

```sql
# 表
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `money` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_money_uindex` (`money`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

# 数据
truncate table interview.user;
insert into interview.user(name, money) value ('间隙锁10',10);
insert into interview.user(name, money) value ('间隙锁30',30);
```

| 事务1                                                     | 事务2                                                        |
| --------------------------------------------------------- | ------------------------------------------------------------ |
| set session transaction isolation level repeatable read ; | set session transaction isolation level repeatable read ;    |
| begin;                                                    | begin;                                                       |
| select * from user where money>20 for share ;             |                                                              |
|                                                           | insert into interview.user(name, money) value ('间隙锁13',10); |
| commit;                                                   |                                                              |
|                                                           | commit;                                                      |

事务2会被阻塞, 因为

> select * from user where money>20 for share ;
>
> ![image-20220106202927097](/Users/wangdi/Library/Application Support/typora-user-images/image-20220106202927097.png)
>
> ```sql
> # 说明[10,30]的间隙被阻塞了
> 
> # 应该是 3号锁锁的间隙[10,30)
> insert into interview.user(name, money) value ('间隙锁10',10); -- 阻塞
> insert into interview.user(name, money) value ('间隙锁20',20); -- 阻塞
> 
> # 应该是 4号锁锁的
> insert into interview.user(name, money) value ('间隙锁30',30); -- 阻塞
> 
> # 应该是 2号锁锁的间隙(30,++)
> insert into interview.user(name, money) value ('间隙锁32',33); -- 阻塞
> 
> ```

​                    

> select * from user where money>20 and money<30 for share ;
>
> 加锁情况
>
> ![image-20220106194943707](/Users/wangdi/Library/Application Support/typora-user-images/image-20220106194943707.png)

什么情况下可以观察到(IX,GAP) (IS,GAP), AUTO_INC, UNKNOWN?

> 官网上的原话: Lock modes other than `AUTO_INC` and `UNKNOWN` indicate gap locks, if present. (https://dev.mysql.com/doc/refman/8.0/en/performance-schema-data-locks-table.html)
>
> 翻译过来就是, 除AUTO_INC和UNKNOWN之外的锁模式表示间隙锁(如果存在)。
>
> 所以说, X,S这些锁都是间隙锁

既然除了AUTO_INC 和UNKNOWN 以外都是间隙锁, 那么什么情况下IX,和IS的表级锁会存在间隙呢?这个间隙指的又是什么呢?



