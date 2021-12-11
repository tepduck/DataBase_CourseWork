use BookShop;

---AUTHOR
go
create procedure InsertIntoAuthor @firstName nvarchar(50), @lastName nvarchar(50)
as
begin
	insert into Author(firstName, lastName) values
		(@firstName, @lastName);
end;

go
create procedure DeleteAuthor @id int
as
begin
	if((select COUNT(*) from Author where id = @id) != 0)
		begin
			delete from Author where id = @id;
		end;
	else print 'incorect id';
end;

exec InsertIntoAuthor @firstName='test', @lastName='test';
select * from Author where firstName = 'test';
exec DeleteAuthor @id = 1;
drop procedure InsertIntoAuthor;
drop procedure DeleteAuthor;

---PRODUCT
go
create procedure InsertIntoProduct @productName nvarchar(50), @idAuthor int, @category nvarchar(50)
as
begin
	if((select COUNT(*) from Author where idAuthor = @idAuthor) != 0 and 
	    (select COUNT(*) from Category where categoryName = @category) != 0)
		begin
			insert into Product(productName, author, category) values
				(@productName, @idAuthor, @category);
		end;
	else print 'Incorrect idAuthor or category';
end;

go
create procedure DeleteProduct @productName nvarchar(50)
as
begin
	if((select COUNT(*) from Product where productName = @productName) != 0)
		begin
			delete from Product where productName = @productName;
		end;
	else print 'incorect productName';
end;

exec InsertIntoProduct @productName = 'test3', @idAuthor = 234, @category = ' нига';
select * from Product where productName = 'test3';
exec DeleteProduct @productName = 'test3';
drop procedure InsertIntoProduct;
drop procedure DeleteProduct;

---ORDER ITEM
go
create procedure InsertOrderItem @idProduct int, @quantity int, @idUser int
as
begin
	if((select COUNT(*) from Product where idProduct = @idProduct) != 0
	or (select COUNT(*) from BookshopUser where idUser = @idUser) != 0)
		begin
			insert into OrderItem(idProduct, quantity, iduser) values
				(@idProduct, @quantity, @idUser);
		end;
	else print 'incorrect idProduct or idUser';
end;

go
create procedure UpdateStatus @idUser int, @idProduct int
as
begin
	if((select count(*) from BookshopUser where idUser = @idUser) != 0
	or (select COUNT(*) from Product where idProduct = @idProduct) != 0)
		begin
			update OrderItem set status = 'заказ подтвержден' where idProduct = @idProduct and iduser = @idUser; 
		end;
end;

exec InsertOrderItem @idProduct = 2, @quantity = 3;
select * from OrderItem where idProduct = 2;
delete from OrderItem where idProduct = 2;
drop procedure InsertOrderItem;

---USER
go
create procedure InsertUser @username nvarchar(50), @password nvarchar(50)
as
begin
	declare @Role nvarchar(50);
	set @Role = (Select * from Role where roleName = 'user');
	insert into BookshopUser(username, password, role)
				values(@username, @password, @Role);
end;

go
create procedure DeleteUser @username nvarchar(50)
as
begin
	if((select count(*) from BookshopUser where username = @username) != 0)
		begin
			delete from BookshopUser where username = @username;
		end;
	else print 'incorrect username'; 
end;

go
create procedure UpdateUserRole @username nvarchar(50)
as
begin
	if((select count(*) from BookshopUser where username = @username) != 0)
		begin
			declare @Role nvarchar(50);
			set @Role = (Select * from Role where roleName = 'admin');
			update BookshopUser set role = @Role where username = @username;
		end;
	else print 'incorrect username'; 
end;

exec InsertUser @username = 'test', @password = 'test';
select * from BookshopUser;
exec UpdateUserRole 'test';
exec DeleteUser @username = 'test';
drop procedure InsertUser;
drop procedure DeleteUser;

