use train_tick
go
create trigger crsize_tsd
on asize
after insert 
as

begin
  declare @size1 char(10)
  declare @size2 char(10)
  declare @tnr char(9)
  declare @mcs int
  declare @sj smalldatetime
  declare @a int  --分钟
  declare @b int  --小时
  declare @c int  --天数
  declare @d int  --中间量
  declare @sj1 smalldatetime
  
  select @size1 = psize from inserted
  select @size2 = nsize from inserted
  select @tnr = tnr from inserted
  select @mcs = mileage from inserted
  select @sj = fctime from inserted
  set @a = @mcs / 2
  set @a = @a % 60
  set @d = @a / 60
  set @b = @b % 60 
  set @c = @d / 60
  set @sj1 =  dateadd(day,@c,@sj1)
  set @sj1 = DATEADD(HOUR,@b,@sj1)
  set @sj1 = DATEADD(MINUTE,@a,@sj1)
  
  insert into train_size_data values(@tnr,@size1,@size2,@sj,'硬座',118)
  update asize
  set dztime = @sj1
  where tnr = @tnr and fctime = @sj
end