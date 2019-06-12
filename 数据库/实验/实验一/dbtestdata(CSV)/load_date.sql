BULK INSERT Region
FROM 'C:\Users\73974\OneDrive\���ݿ�\ʵ��\dbtestdata(CSV)\region.csv'
WITH(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

BULK INSERT Nation
FROM 'C:\Users\73974\OneDrive\���ݿ�\ʵ��\dbtestdata(CSV)\nation.csv'
WITH(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

BULK INSERT Supplier
FROM 'C:\Users\73974\OneDrive\���ݿ�\ʵ��\dbtestdata(CSV)\supplier.csv'
WITH(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

BULK INSERT Part
FROM 'C:\Users\73974\OneDrive\���ݿ�\ʵ��\dbtestdata(CSV)\part.csv'
WITH(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

BULK INSERT PartSupp
FROM 'C:\Users\73974\OneDrive\���ݿ�\ʵ��\dbtestdata(CSV)\partsupp.csv'
WITH(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

BULK INSERT Customer
FROM 'C:\Users\73974\OneDrive\���ݿ�\ʵ��\dbtestdata(CSV)\customer.csv'
WITH(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

BULK INSERT Orders
FROM 'C:\Users\73974\OneDrive\���ݿ�\ʵ��\dbtestdata(CSV)\orders.csv'
WITH(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

BULK INSERT Lineitem
FROM 'C:\Users\73974\OneDrive\���ݿ�\ʵ��\dbtestdata(CSV)\lineitem.csv'
WITH(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

update Lineitem
set extendedprice = quantity * Part.retaiprice
from Part
where Part.partkey = Lineitem.partkey;

select *
from Lineitem;

update Orders
set totalprice = (
	select case 
		when SUM(Lineitem.extendedprice * (1 - Lineitem.discount) * (1 + Lineitem.tax)) is not null then SUM(Lineitem.extendedprice * (1 - Lineitem.discount) * (1 + Lineitem.tax))
		else 0
		end
	from Lineitem
	where Orders.orderkey = Lineitem.orderkey);

select *
from Orders;