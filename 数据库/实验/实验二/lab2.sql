CREATE LOGIN David WITH PASSWORD = '123456', DEFAULT_DATABASE = TPCH
CREATE USER David FOR LOGIN David WITH DEFAULT_SCHEMA = dbo
GRANT CREATE ROLE TO David;

CREATE LOGIN Tom WITH PASSWORD = '123456', DEFAULT_DATABASE = TPCH
CREATE USER Tom FOR LOGIN Tom WITH DEFAULT_SCHEMA = dbo
GRANT CREATE ROLE TO Tom;

CREATE LOGIN Kathy WITH PASSWORD = '123456', DEFAULT_DATABASE = TPCH
CREATE USER Kathy FOR LOGIN Kathy WITH DEFAULT_SCHEMA = dbo
GRANT CREATE ROLE TO Kathy;

CREATE LOGIN Jeffery WITH PASSWORD = '123456', DEFAULT_DATABASE = TPCH
CREATE USER Jeffery FOR LOGIN Jeffery WITH DEFAULT_SCHEMA = dbo;

CREATE LOGIN Jane WITH PASSWORD = '123456', DEFAULT_DATABASE = TPCH
CREATE USER Jane FOR LOGIN Jane WITH DEFAULT_SCHEMA = dbo;

CREATE LOGIN Mike WITH PASSWORD = '123456', DEFAULT_DATABASE = TPCH
CREATE USER Mike FOR LOGIN Mike WITH DEFAULT_SCHEMA = dbo;

CREATE ROLE PurchaseQueryRole;
GRANT SELECT ON Part TO PurchaseQueryRole;
GRANT SELECT ON Supplier TO PurchaseQueryRole;
GRANT SELECT ON Partsupp TO PurchaseQueryRole;
 
CREATE ROLE SaleQueryRole;
GRANT SELECT ON Orders TO SaleQueryRole;
GRANT SELECT ON Lineitem TO SaleQueryRole;
 
CREATE ROLE CustomerQueryRole;
GRANT SELECT ON Customer TO CustomerQueryRole;
GRANT SELECT ON Nation TO CustomerQueryRole;
GRANT SELECT ON Region TO CustomerQueryRole;

CREATE ROLE PurchaseEmployeeRole;
GRANT SELECT,INSERT ON Part TO PurchaseEmployeeRole;
GRANT SELECT,INSERT ON Supplier TO PurchaseEmployeeRole;
GRANT SELECT,INSERT ON PartSupp TO PurchaseEmployeeRole;
 
CREATE ROLE SaleEmployeeRole;
GRANT SELECT,INSERT ON Orders TO SaleEmployeeRole;
GRANT SELECT,INSERT ON Lineitem TO SaleEmployeeRole;
 
CREATE ROLE CustomerEmployeeRole;
GRANT SELECT,INSERT ON Customer TO CustomerEmployeeRole;
GRANT SELECT,INSERT ON Nation TO CustomerEmployeeRole;
GRANT SELECT,INSERT ON Region TO CustomerEmployeeRole;

CREATE ROLE PurchaseManagerRole;
GRANT ALL ON Part TO PurchaseManagerRole;
GRANT ALL ON Supplier TO PurchaseManagerRole;
GRANT ALL ON PartSupp TO PurchaseManagerRole;
exec sp_addrolemember 'SaleQueryRole','PurchaseManagerRole';
exec sp_addrolemember 'CustomerQueryRole','PurchaseManagerRole';
 
CREATE ROLE SaleManagerRole;
GRANT ALL ON Orders TO SaleManagerRole;
GRANT ALL ON Lineitem TO SaleManagerRole;
exec sp_addrolemember 'PurchaseQueryRole','SaleManagerRole';
exec sp_addrolemember 'CustomerQueryRole','SaleManagerRole';
 
CREATE ROLE CustomerManagerRole;
GRANT ALL ON Customer TO CustomerManagerRole;
GRANT ALL ON Nation TO CustomerManagerRole;
GRANT ALL ON Region TO CustomerManagerRole;
exec sp_addrolemember 'PurchaseQueryRole','CustomerManagerRole';
exec sp_addrolemember 'SaleQueryRole','CustomerManagerRole';

exec sp_addrolemember 'PurchaseManagerRole','David';
exec sp_addrolemember 'SaleManagerRole','Tom';
exec sp_addrolemember 'CustomerManagerRole','Kathy';

exec sp_addrolemember 'PurchaseEmployeeRole','Jeffery';
exec sp_addrolemember 'SaleEmployeeRole','Jane';
exec sp_addrolemember 'CustomerEmployeeRole','Mike';


exec sp_droprolemember 'SaleQueryRole','CustomerManagerRole';

exec sp_droprolemember 'CustomerEmployeeRole','Mike';

SELECT * 
FROM Part;
SELECT * 
FROM Orders;

SELECT *
FROM Customer;
SELECT *
FROM Part;