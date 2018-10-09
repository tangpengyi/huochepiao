create procedure pro_cxcps(@tnbr char(9),@time date,@qsize char(10),@hsize char(10))
as
declare   
   @xnsize char(10), --虚拟站点
   @xnsize2 char(10),
   @xnsize3 char(10), 
   @xnsize1 char(10), 
   @number int,  --站点数
   @xnci char(9),  --车次
   @lcs1 int,  --里程数1
   @lcs2 int,
   @xncount1 int,  --车票数
   @xncount2 int,
   @checi char(9),
   @xntime date;  --虚拟车次1
   set @number = -1;
   set @lcs1 = 0;
   set @lcs2 = 0;

begin
     /*create table b1       --记录站点间的里程数,车票数 
                  (tnbr char(9),     --车次编号
                   psize char(10),   --前站
                   nsize char(10),   --后站
                   fcdate date,   --发车时间
                   sgrade char(10),     --座位档次
                   cpcount int,       --车票数
                   mileage int,      --里程数
                   sizenumber smallint);  --中间站数
          */
     delete 
     from b1;         
     select @lcs1 = mileage from lc_tsd   --lcs1里程数  lc_tsd火车票，里程数的结合表
					where @qsize = psize and @tnbr = tnbr;               
     
     --硬座
     select @xncount1 = cpcount from lc_tsd 
					where @qsize = psize and @tnbr = tnbr and sgrade = '硬座'; 
     set @xnsize1 = @qsize;
     while @xnsize1 != @hsize
     begin
        select @xnsize = nsize from lc_tsd --xnsize 后站
					where @xnsize1 = psize and @tnbr = tnbr;               
    
        select @xncount2 = cpcount from lc_tsd 
			where @xnsize1 = psize and @xnci = tnbr and sgrade = '硬座'; 
        if @xncount1  > @xncount2
           begin
		     set @xncount1 = @xncount2;
           end
        if @xncount1  < @xncount2
           begin
		     set @xncount1 = @xncount2;
           end
           
        if @xnsize1 !=  @xnsize
        begin
           select @lcs2 = mileage from lc_tsd   --lcs1里程数  lc_tsd火车票，里程数的结合表
					where @xnsize = psize and @tnbr = tnbr;               
        end
     
        set @number = @number + 1;
        set @lcs1 = @lcs1 + @lcs2;
        set @xnsize1 = @xnsize;
        
      end 
      insert b1 values(@tnbr,@qsize,@hsize,@xntime,'硬座',@xncount1,@lcs1,@number);
end;



exec cxcps '1001','2018-2-23','长沙','永州';

select *
from b1;

select *
from lc_tsd;