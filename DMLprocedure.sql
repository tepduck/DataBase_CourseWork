use BookShop;

---AUTHOR
go
create procedure InsertIntoAuthor @firstName nvarchar(50), @lastName nvarchar(50)
as
begin
	insert into Author(firstName, lastName) values
		(@firstName, @lastName);
end;

exec InsertIntoAuthor @firstName='test', @lastName='test';
select * from Author where firstName = 'test';
delete from Author where firstName = 'test';
drop procedure InsertIntoAuthor;

---PRODUCT
go
create procedure InsertIntoProduct @productName nvarchar(50), @idAuthor int, @idCategory int
as
begin
	if((select COUNT(*) from Author where idAuthor = @idAuthor) != 0 and 
	    (select COUNT(*) from Category where idCategory = @idCategory) != 0)
		begin
			insert into Product(productName, author, category) values
				(@productName, @idAuthor, @idCategory);
		end;
	else print 'Incorrect idAuthor or idCategory';
end;

exec InsertIntoProduct @productName = 'test2', @idAuthor = 1, @idCategory = 2;
select * from Product where productName = 'test2';
delete from Product where productName = 'test2';
drop procedure InsertIntoProduct;

---CARD
go
create procedure InsertIntoCard @idOrder int
as
begin
	if((select COUNT(*) from BookOrder where idOrder = @idOrder) != 0)
		begin
			insert into Card(idOrder) values (@idOrder);
		end;
	else print 'incorrect idOrder';
end;

exec InsertIntoCard @idOrder = 1;
select * from Card where idOrder = 1;
delete from Card where idOrder = 1;
drop procedure InsertIntoCard;
