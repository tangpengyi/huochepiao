use train_tick
go
create procedure xgywypwd(@ID char(6),@xpwd varchar(11),@jpwd varchar(11),@ywyid int)
as
declare 
@lid char(6),
@lpwd varchar(11),
@lywyid int;

begin
   select ID into lid from salesman where ID = @ID and pwd = @jpwd and ywyid = @ywyid;
   select pwd into lpwd from salesman where ID = @ID and pwd = @jpwd and ywyid = @ywyid;
   select ywyid into lywyid from salesman where ID = @ID and pwd = @jpwd and ywyid = @ywyid;
   
   if @lid = @ID and @lpwd = @jpwd and @lywyid = @ywyid
   begin
      update salesman 
      set pwd = @xpwd
      where ID = @ID and pwd = @jpwd and ywyid = @ywyid;
      print'ÐÞ¸Ä³É¹¦£¡';
   end; 
end;
go
