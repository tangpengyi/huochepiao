use train_tick
go
create view ticket_and_details
as 
select ticket.cpnumber,tnbr,fcdata,pID,startsize,zsize,
       sgrade,seatcount,cxcount,name
from ticket,ticket_details,customer
where ticket.cpnumber = ticket_details.cpnumber and 
      ID = pID
go


use train_tick
go
create view salesman_smr
as 
select name,smr.ywyid,ckid,cpnumber
from salesman,smr
where salesman.ywyid = smr.ywyid
go






