show variables like '%isolation%';

# 脏读
begin;
select * from interview.user where id=1;
-- 做了一些事情 脏读
commit;
select * from interview.user where id=1;
# /脏读

# 幻读
begin;
select * from interview.user where money=123; -- 没有
-- 中间做了业务流程
select * from interview.user where money=123; -- 有了, 是不是幻觉?哪个是幻觉?
commit;
# /幻读

# 不可重复读
begin;
select * from interview.user where id=1; -- money=0
-- 中间去做了一些事情
select * from interview.user where id=1; -- money=999, 不可重复读了
commit;

# /不可重复读

select @@tx_isolation;

select @@transaction_isolation;

# set transaction isolation level read uncommitted;
set session transaction isolation level read uncommitted ;
set session transaction isolation level read committed ;
show variables like '%isolation%';
set session transaction isolation level serializable ;
show variables like '%isolation%';

#php级别的错误
# money增加
begin;
select * from interview.user where id=1;
# 原有的钱 999
# 增加的钱 1000
# 1999
# update interview.user set money=1999 where id=1; -- 错误做法
update interview.user set money=money+1000 where id=1;
commit;