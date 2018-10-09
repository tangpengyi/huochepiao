use train_tick
go
create procedure ywy_buy_ticket(@tnbr char(9),@isize char(10),
		@fsize char(10),@fcdate date,@sgrade char(10),
		@pID char(6),@ywyid int)
as
declare
   @cp_count int,
   @cpnumber int,
   @cxh smallint,
   @zwh int,
   @sql varchar(1000),
   @xnsize1 char(10),
   @xnsize2 char(10),
   @xnsize3 char(10),
   @a int; 
    

begin

   --Ӳ��
   select @cp_count = COUNT(*) from ticket
						where sgrade = 'Ӳ��';
    
   if @cp_count is null
   begin
     set @cp_count = 1;
   end
   
   if @sgrade = 'Ӳ��'
   begin
     set @cxh = @cp_count / 118;
     set @cxh = @cxh + 1;
     set @zwh = @cp_count % 118;
     set @cpnumber = @cp_count;
     if @cp_count = 0
     begin
		set @cxh = 1;
		set @zwh = 1;
		set @cpnumber = @zwh+ @cxh*118;
     end
     
     insert into ticket values(@cpnumber,@tnbr,@fcdate,
						@pID,@isize,@fsize,'Ӳ��',
						@zwh,@cxh,'y',50);
	 insert into khbycp values(@pID,@cpnumber,'��');					
	 insert into smr values(@ywyid,@pID,@cpnumber,'��');				
	
   end
   set @xnsize1 = @isize;
   set @xnsize2 = @fsize;
   while @xnsize1 != @xnsize2
   begin
      update  train_size_data
      set cpcount = cpcount - 1 
      where tnbr = @tnbr and psize = @xnsize1;
      
      select @xnsize1 = nsize from train_size_data
      where tnbr = @tnbr and psize = @xnsize1;
   end
  
   
end;


exec buy_ticket('1001','��ɳ','����','2018-2-23','Ӳ��','1001','');