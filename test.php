<?php

// 增加的钱
$addMoney = $this->request->param('money'); //50 //70
start_transaction();
$model = new User();
$user = $model->where('id',1)->find(); //100 100
$money = $user['money'];
$afterMoney = $money+$addMoney; //150 170
$model->where('id',1)->update(['money'=>money+$afterMoney]);
// todo 做一写其他的流程
commit();