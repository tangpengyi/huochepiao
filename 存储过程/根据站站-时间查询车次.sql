create procedure tz_cx(@time date,@qsize char(10),@hsize char(10))
as
declare
   @xnci1 char(9),
   @xnci char(9),
   @xnci2 char(9),
   @xnsize1 char(10);
   
declare
   mycursor cursor for
     select tnbr from train_size_data where psize = @qsize and @time = fcdate;
declare
   mycursor1 cursor for
     select tnbr from train_size_data where nsize = @hsize and @time = fcdate;

begin
   open mycursor;
   fetch next from mycursor into @xnci;
   
   open mycursor1;
   fetch next from mycursor1 into @xnci1;
     
   
   while @xnci != @xnci1
   begin
	 fetch next from mycursor1 into @xnci1;
   end  
   if @xnci = @xnci1
      insert into lstrainb values(@xnci);
      
   fetch next from mycursor into @xnci;
   while @xnci != @xnci1
   begin
	 fetch next from mycursor1 into @xnci1;
   end  
   if @xnci = @xnci1
      insert into lstrainb values(@xnci);
   
   fetch next from mycursor into @xnci; 
   while @xnci != @xnci1
   begin
	 fetch next from mycursor1 into @xnci1;
   end  
   if @xnci = @xnci1
      insert into lstrainb values(@xnci);
     
     
      
   
   --select tnbr from lstrainb;
   print'在表lstrainb中';
   
   close mycursor1;
   close mycursor;
   deallocate mycursor;
   deallocate mycursor1;
end;


exec tz_cx '2018-2-23','长沙','深圳';


select distinct tbnr
from lstrainb;

delete 
from lstrainb;