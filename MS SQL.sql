CREATE TABLE Products
(
    Id INT PRIMARY KEY IDENTITY(1, 1),
    Product NVARCHAR(20)
);

CREATE TABLE Category
(
    Id INT PRIMARY KEY IDENTITY(1, 1),
    Category NVARCHAR(20)
);

CREATE TABLE ProductCategory
(
    Id INT PRIMARY KEY IDENTITY(1, 1),
  	ProductId INT,
    CategoryId INT
);

ALTER TABLE ProductCategory
ADD FOREIGN KEY(ProductId) REFERENCES Products(Id);

ALTER TABLE ProductCategory
ADD FOREIGN KEY(CategoryId) REFERENCES Category(Id);

insert INTO Products(product) VALUES ('Cookies');
insert INTO Products(product) VALUES ('Limonad');
insert INTO Products(product) VALUES ('Water');
insert INTO Products(product) VALUES ('Pen');

insert INTO Category(category) VALUES ('Stationery');
insert INTO Category(category) VALUES ('Candy');
insert INTO Category(category) VALUES ('Drinks');

insert INTO ProductCategory(ProductId, CategoryId) VALUES (1, 2);
insert INTO ProductCategory(ProductId, CategoryId) VALUES (2, 2);
insert INTO ProductCategory(ProductId, CategoryId) VALUES (2, 3);
insert INTO ProductCategory(ProductId, CategoryId) VALUES (4, 1);

SELECT p.Product, c.Category From Products p
LEFT JOIN ProductCategory pc ON pc.ProductId = p.Id
LEFT JOIN Category c ON pc.CategoryId = c.Id;