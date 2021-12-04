use BookShop;

--generation of random string
go
create view vRand(vR) as select rand();

go
select * from vRand;

go
create function RandomString(
@min_length int,
@max_length int,
@charPool nvarchar(50)
)
returns nvarchar(12)
as
begin
	declare @Length int,@PoolLength int, @LoopCount int, @RandomString nvarchar(12)
	set @Length = floor((select vR from vRand) * (@max_length - @min_length) + @min_length); --FLOOR(RAND()*(b-a)+a) - Случайный целочисленный диапазон

	set @PoolLength = LEN(@charPool);

	set @LoopCount = 0;
	set @RandomString = '';

	while(@LoopCount < @Length)
		begin
			select @RandomString = @RandomString + SUBSTRING(@charPool, CONVERT(int, floor((select vR from vRand) * @PoolLength)),1)
			select @LoopCount = @LoopCount +1
		end

	return @RandomString;
end;

--Insert into Author
go
create procedure InsertAuthor
as
begin
	declare @LoopCounter int, @firstName nvarchar(50), @lastName nvarchar(50);
	set @LoopCounter = 1;
	while @LoopCounter <= 100000
		begin
			set @firstName = dbo.RandomString(6, 12, 'qwertyuioplkjhgfdsazxcvbnm');
			set @lastName = dbo.RandomString(6, 12, 'qwertyuioplkjhgfdsazxcvbnm');
			insert into Author(firstName, lastName) values 
				(@firstName, @lastName);
			set @LoopCounter = @LoopCounter + 1;
		end;
end;

exec InsertAuthor;
exec GetAllFromAuthor;

drop procedure InsertAuthor;
delete from Author;

drop function dbo.RandomString;
drop view vRand;