create schema interview collate utf8mb4_0900_ai_ci;

-- auto-generated definition
create table `order`
(
    id        int auto_increment
        primary key,
    order_num varchar(200) null,
    money     int          null,
    user_id   int          null,
    shop_id   int          null
);


-- auto-generated definition
create table shop
(
    id    int auto_increment
        primary key,
    name  varchar(200) null,
    money int          null
);

-- auto-generated definition
create table user
(
    id    int auto_increment
        primary key,
    name  varchar(200) null,
    money int          null
);

create index user_money_index
    on user (money);





-- 事务隔离级别
-- select @@transaction_isolation;
-- select @@tx_isolation;
show variables like '%isolation%'; -- 这个语句执行了之后, 不同的MySQL版本会有不同的结果
-- 因为, 从5.7.20版本开始, transaction_isolation作为tx_isolation的别名被引入, 在8.0版本后tx_isolation被废弃
-- 也就是说:
-- <5.7.20, 只有tx_isolaiton
-- 5.7.20~8.0 之间 tx_isolation 和 transaction_isolation 都是存在的
-- >=8.0 只有 transaction_isolation

-- 所以说, 如果不知道MySQL版本, 或者忘记了上面的就用 `show variable like '%isolation%'`, 就可以找出当前的`事务隔离级别`

-- 修改事务隔离级别成`未提交读`
set session transaction isolation level read committed ;


-- 问题: 事务隔离级别都有哪些?

-- 为什么'未提交读'会产生脏读,还要有这种事务类型呢? 什么时候会用到'未提交读'?
-- 那其他的事务隔离级别会有什么问题? 什么时候会用到呢?
-- 默认的事务隔离级别是什么?

-- 事务的四个特性: 原子性, 一致性, 隔离性,持久性(ACID)

-- 唯一索引, 幻读, 程序来控制唯一?并发幻读了就凉凉了

-- 索引和加行锁的问题会影响并发, 如果修改的条件没有加索引, MySQL会对所有行加锁(有待验证),
-- 然后再释放不满足条件的锁, 这样加锁再释放,就大大降低了并发的性能

-- 怎么看MySQL加了多少锁呢? 怎么看在哪里加了锁?

SHOW STATUS LIKE '%Table_locks%';
select * from information_schema.INNODB_TRX;