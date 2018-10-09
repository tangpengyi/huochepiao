use train_tick
go
create procedure glzxywy(@ywyid int)
as

begin
   delete
   from salesman
   where ywyid = @ywyid;
   print'×¢Ïú³É¹¦£¡';
   
end;
go