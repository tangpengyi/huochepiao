use train_tick
go

create procedure pro_khzc(@ID char(6),@name varchar(20),@phone varchar(11),
                     @account varchar(11),@pwd varchar(11))
as 
declare
@xnID varchar(11), 
@xnname varchar(20);


begin
   select ID into xnID from IDb where ID = @ID and name = @name; 
   if @xnID is null 
   begin
      print'ID ²»ºÏ·¨'
      return
   end else
   begin
   insert into customer values(@ID,@name,@phone,@account,@pwd)
   end;
end;
go
 
   
