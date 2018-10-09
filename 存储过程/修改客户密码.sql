use train_tick
go
create procedure glkhpwd(@ID char(6),@xpwd varchar(11),@jpwd varchar(11),@account varchar(11))
as
declare 
@lid char(6),
@lpwd varchar(11),
@laccount int;

begin
   select ID into lid from customer where ID = @ID and pwd = @jpwd and account = @account;
   select pwd into lpwd from customer where ID = @ID and pwd = @jpwd and account = @account;
   select account into laccount from customer where ID = @ID and pwd = @jpwd and account = @account;
   
   if @lid = @ID and @lpwd = @jpwd and @laccount = @account
   begin
      update customer 
      set pwd = @xpwd
      where ID = @ID and pwd = @jpwd and account = @account;
      print'ÐÞ¸Ä³É¹¦£¡';
   end; 
end;
go