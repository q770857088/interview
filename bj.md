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

MySQL为了解决并发问题, 对事物进行了隔离处理.

# 隔离处理是怎么实现的?

用锁来实现的

都有什么锁?作用是什么?

我怎么看这个锁?

还有,阻塞是怎么实现的?

PHP真正运行的时候,和模拟的情况是不是完全一致?

要真正用PHP去处理并发问题?

PHP怎么模拟并发?

PHP要模拟什么样的并发业务?会产生什么问题?

事务隔离级别有四个, 那每个级别下会产生的问题, 都是怎么样产生的?

提高了隔离级别,为什么就能避免这些问题?原理是什么?

唯一索引的问题, MySQL加不加唯一索引, 只是对搜索数据速度有影响

比如, 姓名(unique),如果不加唯一索引,当事务并发的时候, 我用PHP去判断的是否唯一,就没有意义

```php
<?php
  // 比如说要插入名称叫  "张三" 的用户
  $name = "张三";
 //从数据库查找名称是 "张三" 用户
$ret = "select * from user where name=$name";
if($ret){
  $this->error("已存在");
}else{
  // 插入张三
  $sql = " insert into "
}

// 这个数据的唯一性, 就被破坏了
```