create procedure add_size(@tnr char(9),
						@psize char(10),@hsize char(10),@qzm int,
						@zhm int,@zsize char(10),@fctime date)
as
declare 
   @qsize char(10),
   @zjtime smalldatetime,
   @jsj int,
   @jsj1 int;

begin
  delete 
  from asize
  where psize = @psize and nsize = @hsize;
  
  
  insert into asize values(@psize,@zsize,@qzm);
  insert into asize values(@zsize,@hsize,@zhm);
  
  delete 
  from train_size_data
  where psize = @psize and nsize = @hsize;
  
  
  insert into train_size_data values(@tnr,@psize,@zsize,@fctime,null,null);
  insert into train_size_data values(@tnr,@zsize,@hsize,null,null,null);
  
end


exec add_size '1001','永州','广东','115','115','香港','2018-2-23'

select *
from asize
where tnr = '1001';





