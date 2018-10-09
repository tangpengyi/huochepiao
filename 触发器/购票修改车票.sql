
use train_tick
go
create trigger yzbuy_ticket
on ticket 
after insert 
as

begin
declare @hcnumber char(9)
declare @qsize char(10)
declare @hsize char(10)
declare @fctime smalldatetime
declare @sgrade char(10)
declare @xnhc char(9)
declare @count int


select @hcnumber = tnbr from inserted
select @qsize = startsize from inserted
select @hsize = zsize from inserted
select @fctime = fcdata from inserted
select @sgrade = sgrade from inserted

select @xnhc = tnbr from train 
		where fcdate = @fctime and isize = @qsize;

while (@qsize != @hsize)
begin
  update train_size_data
  set cpcount = cpcount - 1
  where tnbr = @xnhc and psize = @qsize and sgrade = @sgrade;
   
  select @qsize = nsize from train_size_data 
			where psize = @qsize and tnbr = @xnhc; 
end
end

  

   
   