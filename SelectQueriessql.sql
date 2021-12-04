use BookShop;

-----ROLES
--getting all from roles
go
create procedure GetAllFromRoles
as
begin
	select * from Role;
end;

exec GetAllFromRoles;
drop procedure GetAllFromRoles;

--getting role by name
go
create procedure GetRoleByName @name nvarchar(50)
as
begin
	select * from Role where roleName = @name;
end;

exec GetRoleByName @name = 'user';
drop procedure GetRoleByName;


---CATEGORY
--getting all from categories
go
create procedure GetAllFromCategory
as
begin
	Select * from Category;
end;

exec GetAllFromCategory;
drop procedure GetAllFromCategory;

--get category by name
go
create procedure GetCategoryByName @name nvarchar(50)
as
begin
	select * from Category where categoryName = @name;
end;

exec GetCategoryByName @name='книга';
drop procedure GetCategoryByName;


---AUTHOR
--get all from Author
go
create procedure GetAllFromAuthor
as
begin
	select * from Author;
end;

exec  GetAllFromAuthor;
drop procedure GetAllFromAuthor;