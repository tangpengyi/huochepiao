create procedure diff_size(@tnr char(9),
						@size char(10))
as
declare 
   @qsize char(10),
   @hsize char(10),
   @jsj int,
   @jsj1 int,
   @tm1 date;

begin
   select @qsize = psize from asize 
				where nsize = @size;
   select @qsize;
   
   select @hsize = nsize from asize 
				where psize = @size;
   select @hsize;
   
   select @jsj = mileage from asize 
				where psize = @size;
   
   select @jsj1 = mileage from asize 
				where nsize = @size;
   
   set @jsj = @jsj + @jsj1;
   select @jsj1;
   
   delete
   from asize 
   where nsize = @size;
   delete
   from asize 
   where psize = @size;
   
   insert into asize values(@qsize,@hsize,@jsj)
   
   
   delete
   from train_size_data
   where psize = @qsize and nsize = @hsize;
   
   insert into train_size_data values(@tnr,@qsize,@hsize,null,null,null);
 end
 

select *
from asize;

 exec diff_size '1001','œ„∏€';
 
 select *
 from asize
 where tnr = '1001';
