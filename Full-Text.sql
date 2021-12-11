use BookShop;

create fulltext catalog fullTextCatalog;

create fulltext index on Product
(
	productName language 1049        --1033
)
key index index_Product_name on fullTextCatalog;

select productName from Product where contains(productName, 'Отец');
select * from Product;

drop fulltext index on Product;
drop fulltext catalog fullTextCatalog;