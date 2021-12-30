# 脏读, 幻读, 不可重复?

脏读, 读到了假数据, 读脏

> 初始化数据, insert into user(name, money) values ('张三', 0);

| session1                                                     | session2                                        |
| ------------------------------------------------------------ | ----------------------------------------------- |
| begin;                                                       | begin;                                          |
|                                                              | Update interview.user set money=200 where id=1; |
| select * from user where id=1; -- 拿着money去做了一些事情(业务流程) |                                                 |
| commit;                                                      |                                                 |
|                                                              | rollback; -- 遇到错误,回滚了                    |



幻读, 有或无的问题, 第一次读没有这条数据, 第二读的时候有了这条数据

| session1                                                  | session2                                            |
| --------------------------------------------------------- | --------------------------------------------------- |
| begin;                                                    | Begin;                                              |
| Select * from interview.user where money=123; -- 没有数据 |                                                     |
|                                                           | insert into user(name, money) values ('张四', 123); |
|                                                           | commit;                                             |
| Select * from interview.user where money=123; -- 有数据   |                                                     |
| commit;                                                   |                                                     |

我是不是说产生了幻觉?幻读



不可重复读, 数目上面, 两次读出来的个数不一致

| session1                                 | session2                             |
| ---------------------------------------- | ------------------------------------ |
| begin;                                   | Begin;                               |
| Select * from interview.user where id=1; |                                      |
|                                          | Update interview.user set money=999; |
|                                          | commit;                              |
| Select * from interview.user where id=1; |                                      |
| commit;                                  |                                      |

什么情况下会有这些问题?

并发 + 事务(事务隔离级别)+Innodb

隔离级别???是什么?

有四个隔离级别(从上往下越来越高)

1. 未提交读 read uncommited
2. 提交读 read commited
3. 可重复读 repeatable read , 默认
4. 串行化 serializable

| 隔离级别 | 脏读   | 不可重复读 | 幻读   |
| -------- | ------ | ---------- | ------ |
| 未提交读 | 可能   | 可能       | 可能   |
| 提交读   | 不可能 | 可能       | 可能   |
| 可重复读 | 不可能 | 不可能     | 可能   |
| 串行化   | 不可能 | 不可能     | 不可能 |

