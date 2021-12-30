show variables like '%isolation%';
set session transaction isolation level serializable;
# 脏读
begin;
select * from interview.user where id=1;
update interview.user set money=200 where id=1;
select * from interview.user where id=1;
rollback;
# /脏读

# 幻读
begin ;
insert into interview.user (name,money) value ('张四',123);
commit;
# /幻读

# 不可重复读
begin;
update interview.user set money=999 where id=1;
commit;
# /不可重复读

#php级别的错误
# money增加
begin;
select * from interview.user where id=1;
# 原有的钱 999
# 增加的钱 2000
# update interview.user set money=2999 where id=1; -- 错误做法
update interview.user set money=money+2000 where id=1;
commit ;
select * from interview.user where id=1;