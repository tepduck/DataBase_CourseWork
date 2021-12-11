use BookShop;

--Export

go
create procedure ExportXmlProduct
as
begin
	select productName, author, category
	from Product
	for xml path('Product'), root('Products');

	--Sql server config to export stored procedures to xml file 
	EXEC master.dbo.sp_configure 'show advanced options', 1
	RECONFIGURE
	EXEC master.dbo.sp_configure 'xp_cmdshell', 1
	RECONFIGURE

	declare @fileName nvarchar(100)
	declare @sqlStr varchar(1000)
	declare @sqlCmd varchar(1000)

	set @fileName = 'C:\Users\us\Desktop\курсовой\DataBase_CourseWork\product.xml';
	set @sqlStr = 'use Bookshop; 
	select productName, author, category from Product for xml path(''Product''), root(''Products'') ';
	set @sqlCmd = 'bcp "' + @sqlStr + '" queryout ' + @fileName + ' -w -T';
	exec xp_cmdshell @sqlCmd;
end;

exec ExportXmlProduct;
drop procedure ExportXmlProduct;

-- import
go
create procedure ImportXmlProduct
as
begin
	insert into Product(productName, author, category)
	select
		MY_XML.Product.query('productName').value('.', 'nvarchar(50)'),
		MY_XML.Product.query('author').value('.', 'int'),
		MY_XML.Product.query('category').value('.', 'nvarchar(50)')
	from (select cast(MY_XML as xml)
				from openrowset(bulk 'C:\Users\us\Desktop\курсовой\DataBase_CourseWork\product.xml',
				single_blob) as T(MY_XML)) as T(MY_XML)
				cross apply MY_XML.nodes('Products/Product') as MY_XML (Product);
end;

exec GetAllFromProduct;
exec ImportXmlProduct;
drop procedure ImportXmlProduct;