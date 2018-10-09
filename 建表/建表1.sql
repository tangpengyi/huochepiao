create table train  --����
(tnbr char(9) primary key,  --���α��
 fcdate smalldatetime,   --����ʱ��
 isize char(10),   --������վ
 fsize char(10),   --����վ��
 ttype char(10) NOT NULL,  --������
);

create table asize  --����վ��
(psize char(10),    --ǰվ
 nsize char(10),   --��վ
 mileage int check(mileage > 0),  --�����
 primary key(psize,nsize)  
);

create table train_size_data  --����-ǰվ-��վ
(tnbr char(9) not null,    --�𳵱��
 psize char(10) not null,   --���
 nsize char(10) not null,   --�յ�
 fcdate date,     --��������
 sgrade char(10) not null,    --��λ����
 cpcount int,     --��Ʊ��
 
 check(sgrade='Ӳ��' and cpcount between 1 and 118),
 

 primary key(tnbr,psize,nsize,fcdate),
 
 foreign key(tnbr)references train(tnbr)
 on delete cascade
 on update cascade,
 
 foreign key(psize,nsize)references asize(psize,nsize)
 on delete cascade
 on update cascade
);

create table IDb  --�Ϸ��ͻ�ID
(
  ID char(6) primary key,
  name varchar(20)
);


create table customer   --�ͻ�
(ID char(6) primary key check(ID like '______'),   
 name varchar(20) not null,
 phone varchar(10) unique not null check(len(phone)=6),
 account varchar(11) not null check(len(account)between 9 and 11),
         --�˺�
 pwd varchar(11) unique not null check(len(pwd)between 9 and 11),
         --����
 foreign key(ID)references IDb(ID)
 );


create table ticket  --��Ʊ
(cpnumber char(9) primary key, --��Ʊ���
 tnbr char(9),  --���α��
 fcdata smalldatetime,   --��������
 pID char(6),  --�˿�ID
 startsize char(10),   --���վ
 zsize char(10),   --�յ�վ
 sgrade char(10) not null,    --��λ����
 seatcount int not null,     --��λ��
 cxcount smallint not null check(cxcount between 1 and 20),
          --�����
 guoqi char(4) check(gouqi in ('��Ч','��Ч')),  --�Ƿ���Ч
 price int,    --�۸�
   
 foreign key(tnbr)references train(tnbr),
 foreign key(pID)references customer(ID)
);



create table khbycp  --�ͻ����Ϲ���Ʊ
(ID char(6),
 cpnumber char(9),
 stcp varchar(2),
 foreign key(ID)references customer(ID),
 foreign key(cpnumber)references ticket(cpnumber)
);


create table yID  --�Ϸ�ҵ��ԱID
(
  ID char(6) primary key,
  name char(20)
); 

create table salesman  --ҵ��Ա
(ywyid int primary key, --����
 ID char(6),
 name char(20) not null,  --����
 phone char(11) unique not null check(len(phone)=6),
 pwd  varchar(11) not null check(len(pwd) between 9 and 11),
      --����
 foreign key(ID)references yID(ID)     
 );

create table smr  --ҵ��Աҵ��
(
 ywyid int primary key, --����
 ID char(6),  --�˿�ID
 cpnumber char(9) not null,    --��Ʊ���
 stcp varchar(2), --��Ʊ�ۻ���
 
 foreign key(ywyid)references salesman(ywyid),
 foreign key(ID)references customer(ID),
 foreign key(cpnumber)references ticket(cpnumber)
);
 

 