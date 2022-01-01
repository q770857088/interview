select * from information_schema.innodb_trx;
select * from information_schema.INNODB_LOCKS; -- 8.0之前
SELECT * FROM performance_schema.data_lock_waits; -- 8.0 之后
select * from performance_schema.data_locks;

show databases ;
select * from interview.user;
use interview;

show create table performance_schema.data_locks;
show create table performance_schema.data_lock_waits;
use performance_schema;
show tables;

select @@autocommit;

show full processlist;

show variables like '%isolation%';
set global transaction isolation level repeatable read;
set session transaction isolation level read uncommitted;
start transaction ;
select * from interview.user where id=1;
commit ;
begin ;
commit;
set session transaction isolation level repeatable read ;
select * from interview.user where id=1;
select * from interview.user where name='赵';
select count(*) from interview.user where name='赵';
select * from interview.user where id=3;
commit ;
select * from interview.user where id=3;
select * from information_schema.INNODB_TRX; -- 281479413042304
begin;
select * from interview.user;
update interview.user set name='修改2' where money=1;
update interview.user set name='修改2' where name='修改';
select * from performance_schema.data_locks;

# 重置一下数据
truncate table interview.user;
insert into interview.user(name, money) value ('间隙锁10',10);
insert into interview.user(name, money) value ('间隙锁30',30);


begin;
use interview;
select * from user;
update user set name='间隙锁' where money=10;
select * from user where money=10; -- 这里已经发现了数据已经改变了
commit;

-- 插入的记录在10,30之间也会被阻塞
begin;
select * from user;
update user set name='间隙锁' where money=10;
select * from user where money=10;
commit;


-- 插入的记录等于9也会阻塞, 被间隙锁阻塞
begin;
# 看, 这里如果不加索引确实会锁表
select * from user;
update user set name='间隙锁' where money=10;
select * from user where money=10;
commit;


# 这个查看锁的我明天也会一起讲, 还有事务的,就是为了研究这个隔离级别是怎么实现的
select * from performance_schema.data_locks;
-- 提交之后锁就没了
# 如果加了索引, 就不会锁表了,确实没有锁表了