--����վ��
insert into asize values(
         '��ɳ','����','100');
insert into asize values(
         '����','����','150');
insert into asize values(
         '����','�㶫','230');   
insert into asize values(
         '�㶫','����','330');   

insert into asize values(
         '��ɳ','����','100');
insert into asize values(
         '����','�Ϻ�','150');
insert into asize values(
         '�Ϻ�','����','230');   
insert into asize values(
         '����','����','330');   


select *
from asize;

delete 
from asize
where tnr = '1001';

select CONVERT(varchar(12) , fctime, 108 ) --108���ʱ�䣬111�������
from asize
where tnr = 1;


--������Ϣ
insert into train values('1001','2018-2-23','��ɳ','����','��ͨ');
insert into train values('1002','2018-2-23','��ɳ','����','��ͨ');


--����-վ��-������Ϣ
insert into train_size_data values(
         '1001','��ɳ','����','2018-2-23','Ӳ��','34');
insert into train_size_data values(
         '1001','����','����','2018-2-23','Ӳ��','87');
insert into train_size_data values(
         '1001','����','�㶫','2018-2-23','Ӳ��','100');   
insert into train_size_data values(
         '1001','�㶫','����','2018-2-23','Ӳ��','56');   

insert into train_size_data values(
         '1002','��ɳ','����','2018-2-23','Ӳ��','45');
insert into train_size_data values(
         '1002','����','�Ϻ�','2018-2-23','Ӳ��','75');
insert into train_size_data values(
         '1002','�Ϻ�','����','2018-2-23','Ӳ��','34');   
insert into train_size_data values(
         '1002','����','����','2018-2-23','Ӳ��','25');   

select *
from train_size_data 
where tnbr = 1;


--����ͻ���Ϣ
insert into customer values('1001','һ��','111111','111111111','111111111');
insert into customer values('1002','����','222222','222222222','222222222');

select *
from customer 
where ID = 1001 or ID = 1002;


--���복Ʊ��Ϣ




--����ҵ��Ա��Ϣ
insert into salesman values('2001','200101','һ��','111111','200120011');

--����ҵ��Աҵ��



--����Ϸ��ͻ�
insert into IDb values('1003','����');
insert into IDb values('1004','�ĺ�');


--����Ϸ�ҵ��Ա
insert into yID values('2001','Ա��һ');
insert into yID values('2002','Ա����');

