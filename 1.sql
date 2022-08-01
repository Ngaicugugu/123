-- Tao stored procedure sp_tong co 2 tham so dau vào
-- drop proc sp_Tong1
CREATE PROCEDURE sp_Tong1 @So1 int, @So2 int
AS
BEGIN
	Declare @tong int;
	set @tong = @So1 + @So2;
	print @tong;
END

exec sp_Tong1 5,6;

exec sp_Tong1 4,3;

sp_helptext sp_Tong1
------------------------------------------------------------------
-- Tao stored procedure sp_tong2 co 2 tham so dau vào 1 ra
-- drop proc sp_Tong2
create procedure sp_Tong2 @So1 int, @So2 int, @Tong int out
as
Begin	
	set @Tong = @So1 + @So2;	
End	

declare @sum int
exec  sp_Tong2 3,4, @sum out

select @sum

-- pro có return ----------------
-- drop proc DemNv2
CREATE PROCEDURE DemNv2 @cityvar nvarchar(30)
AS
BEGIN
	DECLARE @num int;
	SELECT @num = count(*) FROM NHANVIEN
	WHERE DCHI like + '%'+@cityvar;

	RETURN @num;
END

-- goi thu tuc ----
DECLARE @tongso int
exec @tongso=DemNv2 N'Vũng Tàu'
SELECT @tongso

CREATE PROCEDURE Tennvcty @year int
AS
BEGIN
	select TENNV from NHANVIEN
	where year(NGSINH)=@year
END;

exec Tennvcty 1967;
select *from NHANVIEN


create proc demthannhan @manv nvarchar(9)
as
begin
	select MA_NVIEN,count(*) from THANNHAN
	where MA_NVIEN=@manv
	group by MA_NVIEN
end 

exec demthannhan '005'

select *from PHONGBAN

CREATE PROCEDURE sp_ThemPhongBan1 @TenPHG nvarchar(15),
	@MaPHG int, @TRPHG nvarchar(9), @NG_NHANCHUC date
AS
BEGIN
	IF EXISTS(SELECT * FROM PHONGBAN WHERE MAPHG = @MaPHG)
		print N'insert thất bại'
	ELSE
		INSERT INTO PHONGBAN
		VALUES(@TenPHG, @MaPHG,@TRPHG,@NG_NHANCHUC)
END

exec sp_ThemPhongBan1 'Hanh chinh',3,'004','2020-10-05'

create proc songuyen2 @n int
as
begin
	declare @tong int=0, @i int=2,@dem int=0
	while(@i<=@n)
	begin
		if(@i%2=0)
		begin
			set @tong=@tong+@i
			set @dem=@dem+1
		end
		set @i=@i+1
	end
	select @tong,@dem
end

exec songuyen2 10
