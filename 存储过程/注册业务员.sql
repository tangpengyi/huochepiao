use train_tick
go

create procedure zcywy(@ID char(6),@name char(20),@phone char(11),@pwd  varchar(11))
as 
declare
@xnID char(6),
@xnname char(20),
@xngh int;


begin
   select @xnID = ID   from yID where ID = @ID and name = @name; 
   if @xnID is null 
   
   begin
      print'没有注册权限'
      return
   end else
   begin
   select @xngh = ywyID  from salesman where ywyid = 
                               (select MAX(ywyid) from salesman);
   if @xngh is null
     begin 
     insert into salesman values(0001,@ID,@name,@phone,@pwd);
     end 
   else
     begin
     set @xngh = @xngh + 1001;
     insert into salesman values(@xngh,@ID,@name,@phone,@pwd);
     end
   end
   select @xngh '工号';
end;



exec zcywy '000010','小丽','110110','000000011'

select *
from salesman;


delete 
from salesman 
where ID = 0000010;

