create view lc_tsd
as 
select a.tnbr,a.psize,a.nsize,a.fcdate,a.sgrade,a.cpcount,b.mileage
from train_size_data a,asize b
where a.nsize = b.nsize and a.psize = b.psize;

select *
from lc_tsd;