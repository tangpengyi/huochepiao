use train_tick
go
create trigger scsize_tsd
on asize
after update 
as

begin
  declare @size1 char(10)
  declare @size2 char(10)
  declare @tnr char(9)
  
  select @size1 = psize from deleted
  select @size2 = nsize from deleted
  
  delete 
  from train_size_data
  where psize = @size1 and nsize = @size2;
  
end
