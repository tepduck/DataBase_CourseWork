use BookShop;

--Author
create unique nonclustered index index_Author_id on Author(idAuthor);
create nonclustered index index_Author_firstName on Author(firstNAme); 
drop index index_Author_id on Author;
drop index Index_Author_firstName on Author;

--User
create unique nonclustered index index_User_id on BookshopUser(idUser);
create nonclustered index index_User_username on BookshopUser(username); 
create nonclustered index index_Username_password on BookshopUser(password); 
create nonclustered index index_User_role on BookshopUser(role); 
drop index index_User_id on BookshopUser;
drop index index_User_username on BookshopUser;
drop index index_Username_password on BookshopUser;
drop index index_User_role on BookshopUser;

--Orders
create unique nonclustered index index_Order_id on OrderItem(idOrder);
create nonclustered index index_Order_Product on OrderItem(idProduct);
create nonclustered index index_Order_status on OrderItem(status);
create nonclustered index index_Order_user on OrderItem(iduser);
drop index index_Order_id on OrderItem;
drop index index_Order_Product on OrderItem;
drop index index_Order_status on OrderItem;
drop index index_Order_user on OrderItem;

--Product
create unique nonclustered index index_Product_id on Product(idProduct);
create unique nonclustered index index_Product_name on Product(productName);
create nonclustered index index_Product_author on Product(author);
create nonclustered index index_Product_category on Product(category);
drop index index_Product_id on Product;
drop index index_Product_name on Product;
drop index index_Product_author on Product;
drop index index_Product_category on Product;


