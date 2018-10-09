--相邻站点
insert into asize values(
         '长沙','衡阳','100');
insert into asize values(
         '衡阳','永州','150');
insert into asize values(
         '永州','广东','230');   
insert into asize values(
         '广东','深圳','330');   

insert into asize values(
         '长沙','北京','100');
insert into asize values(
         '北京','上海','150');
insert into asize values(
         '上海','云南','230');   
insert into asize values(
         '云南','深圳','330');   


select *
from asize;

delete 
from asize
where tnr = '1001';

select CONVERT(varchar(12) , fctime, 108 ) --108输出时间，111输出日期
from asize
where tnr = 1;


--车次信息
insert into train values('1001','2018-2-23','长沙','深圳','普通');
insert into train values('1002','2018-2-23','长沙','深圳','普通');


--日期-站点-车次信息
insert into train_size_data values(
         '1001','长沙','衡阳','2018-2-23','硬座','34');
insert into train_size_data values(
         '1001','衡阳','永州','2018-2-23','硬座','87');
insert into train_size_data values(
         '1001','永州','广东','2018-2-23','硬座','100');   
insert into train_size_data values(
         '1001','广东','深圳','2018-2-23','硬座','56');   

insert into train_size_data values(
         '1002','长沙','北京','2018-2-23','硬座','45');
insert into train_size_data values(
         '1002','北京','上海','2018-2-23','硬座','75');
insert into train_size_data values(
         '1002','上海','云南','2018-2-23','硬座','34');   
insert into train_size_data values(
         '1002','云南','深圳','2018-2-23','硬座','25');   

select *
from train_size_data 
where tnbr = 1;


--插入客户信息
insert into customer values('1001','一号','111111','111111111','111111111');
insert into customer values('1002','二号','222222','222222222','222222222');

select *
from customer 
where ID = 1001 or ID = 1002;


--插入车票信息




--插入业务员信息
insert into salesman values('2001','200101','一号','111111','200120011');

--插入业务员业绩



--输入合法客户
insert into IDb values('1003','三号');
insert into IDb values('1004','四号');


--输入合法业务员
insert into yID values('2001','员工一');
insert into yID values('2002','员工二');

