create procedure pro_cxcps(@tnbr char(9),@time date,@qsize char(10),@hsize char(10))
as
declare   
   @xnsize char(10), --����վ��
   @xnsize2 char(10),
   @xnsize3 char(10), 
   @xnsize1 char(10), 
   @number int,  --վ����
   @xnci char(9),  --����
   @lcs1 int,  --�����1
   @lcs2 int,
   @xncount1 int,  --��Ʊ��
   @xncount2 int,
   @checi char(9),
   @xntime date;  --���⳵��1
   set @number = -1;
   set @lcs1 = 0;
   set @lcs2 = 0;

begin
     /*create table b1       --��¼վ���������,��Ʊ�� 
                  (tnbr char(9),     --���α��
                   psize char(10),   --ǰվ
                   nsize char(10),   --��վ
                   fcdate date,   --����ʱ��
                   sgrade char(10),     --��λ����
                   cpcount int,       --��Ʊ��
                   mileage int,      --�����
                   sizenumber smallint);  --�м�վ��
          */
     delete 
     from b1;         
     select @lcs1 = mileage from lc_tsd   --lcs1�����  lc_tsd��Ʊ��������Ľ�ϱ�
					where @qsize = psize and @tnbr = tnbr;               
     
     --Ӳ��
     select @xncount1 = cpcount from lc_tsd 
					where @qsize = psize and @tnbr = tnbr and sgrade = 'Ӳ��'; 
     set @xnsize1 = @qsize;
     while @xnsize1 != @hsize
     begin
        select @xnsize = nsize from lc_tsd --xnsize ��վ
					where @xnsize1 = psize and @tnbr = tnbr;               
    
        select @xncount2 = cpcount from lc_tsd 
			where @xnsize1 = psize and @xnci = tnbr and sgrade = 'Ӳ��'; 
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
           select @lcs2 = mileage from lc_tsd   --lcs1�����  lc_tsd��Ʊ��������Ľ�ϱ�
					where @xnsize = psize and @tnbr = tnbr;               
        end
     
        set @number = @number + 1;
        set @lcs1 = @lcs1 + @lcs2;
        set @xnsize1 = @xnsize;
        
      end 
      insert b1 values(@tnbr,@qsize,@hsize,@xntime,'Ӳ��',@xncount1,@lcs1,@number);
end;



exec cxcps '1001','2018-2-23','��ɳ','����';

select *
from b1;

select *
from lc_tsd;