create table train  --车次
(tnbr char(9) primary key,  --车次编号
 fcdate smalldatetime,   --发车时间
 isize char(10),   --最初起点站
 fsize char(10),   --最终站点
 ttype char(10) NOT NULL,  --火车类型
);

create table asize  --相邻站点
(psize char(10),    --前站
 nsize char(10),   --后站
 mileage int check(mileage > 0),  --里程数
 primary key(psize,nsize)  
);

create table train_size_data  --日期-前站-后站
(tnbr char(9) not null,    --火车编号
 psize char(10) not null,   --起点
 nsize char(10) not null,   --终点
 fcdate date,     --发车日期
 sgrade char(10) not null,    --座位档次
 cpcount int,     --车票数
 
 check(sgrade='硬座' and cpcount between 1 and 118),
 

 primary key(tnbr,psize,nsize,fcdate),
 
 foreign key(tnbr)references train(tnbr)
 on delete cascade
 on update cascade,
 
 foreign key(psize,nsize)references asize(psize,nsize)
 on delete cascade
 on update cascade
);

create table IDb  --合法客户ID
(
  ID char(6) primary key,
  name varchar(20)
);


create table customer   --客户
(ID char(6) primary key check(ID like '______'),   
 name varchar(20) not null,
 phone varchar(10) unique not null check(len(phone)=6),
 account varchar(11) not null check(len(account)between 9 and 11),
         --账号
 pwd varchar(11) unique not null check(len(pwd)between 9 and 11),
         --密码
 foreign key(ID)references IDb(ID)
 );


create table ticket  --车票
(cpnumber char(9) primary key, --车票编号
 tnbr char(9),  --车次编号
 fcdata smalldatetime,   --发车日期
 pID char(6),  --乘客ID
 startsize char(10),   --起点站
 zsize char(10),   --终点站
 sgrade char(10) not null,    --座位档次
 seatcount int not null,     --座位号
 cxcount smallint not null check(cxcount between 1 and 20),
          --车厢号
 guoqi char(4) check(gouqi in ('有效','无效')),  --是否有效
 price int,    --价格
   
 foreign key(tnbr)references train(tnbr),
 foreign key(pID)references customer(ID)
);



create table khbycp  --客户网上购退票
(ID char(6),
 cpnumber char(9),
 stcp varchar(2),
 foreign key(ID)references customer(ID),
 foreign key(cpnumber)references ticket(cpnumber)
);


create table yID  --合法业务员ID
(
  ID char(6) primary key,
  name char(20)
); 

create table salesman  --业务员
(ywyid int primary key, --工号
 ID char(6),
 name char(20) not null,  --姓名
 phone char(11) unique not null check(len(phone)=6),
 pwd  varchar(11) not null check(len(pwd) between 9 and 11),
      --密码
 foreign key(ID)references yID(ID)     
 );

create table smr  --业务员业绩
(
 ywyid int primary key, --工号
 ID char(6),  --乘客ID
 cpnumber char(9) not null,    --车票编号
 stcp varchar(2), --车票售或退
 
 foreign key(ywyid)references salesman(ywyid),
 foreign key(ID)references customer(ID),
 foreign key(cpnumber)references ticket(cpnumber)
);
 

 