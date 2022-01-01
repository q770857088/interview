begin;
update interview.user set money=100 where id=1;
commit;

show variables like '%isolation%';
set session transaction isolation level serializable;
select * from information_schema.INNODB_TRX;

set session transaction isolation level repeatable read ;
begin;
update interview.user set money=money+100 where id=1;
delete from interview.user where id=1;
insert into interview.user(name,money) value ('赵7', 2);
select * from interview.user where name='赵';
commit ;
select * from interview.user where id=1;
select * from information_schema.INNODB_TRX; -- 281479413042304
begin ;
select * from interview.user;


begin;
insert into user(name,money) values('新插入的数据',10); -- 这里确实被阻塞了
commit;

begin;
insert into user(name,money) values('新插入的数据',20); -- 这里确实也被阻塞了
commit;

-- 插入的记录等于9也会阻塞, 被间隙锁阻塞
begin;
insert into user(name,money) values('新插入的数据',9); -- 这里确实也被阻塞了
commit;

-- 插入记录>30就不会被阻塞
begin;
insert into user(name,money) values('新插入的数据',40); -- 我草,还真没有被阻塞,为啥???
-- 锁了,我草锁了, 去掉了索引, 就把所有的地方都锁了, 应该是锁表了, 查一下
commit;
# 忘了重置数据

