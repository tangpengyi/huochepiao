use train_tick
go
create procedure ywy_tui_ticket(@cpnumber char(9),
					@pID char(6),@ywyid int)
as
declare
   @qsize char(10),
   @hsize char(10),
   @hcnbr char(9),
   @sgrade char(10),
   @guoqi char(4);


begin
   
   select @qsize = startsize from ticket 
					where cpnumber = @cpnumber;
   select @hsize = zsize from ticket 
					where cpnumber = @cpnumber;
   select @hcnbr = tnbr from ticket 
					where cpnumber = @cpnumber;
   select @sgrade = sgrade from ticket 
					where cpnumber = @cpnumber;
   select @guoqi = guoqi from ticket 
					where cpnumber = @cpnumber;
   if @guoqi = 'n'
   begin
      print'本车票无效,无法退票' 
   end	
   else
   begin
     while (@qsize != @hsize)
     begin
        update train_size_data
        set cpcount = cpcount + 1
        where tnbr = @hcnbr and psize = @qsize and sgrade = @sgrade;
   
        select @qsize = nsize from train_size_data 
			  where psize = @qsize and tnbr = @hcnbr; 
      end
      
      insert into smr(ywyid,ID,cpnumber,stcp)
      values(@ywyid,@pID,@cpnumber,'退');
      
      update ticket
      set guoqi = 'n'
    end   
   
end