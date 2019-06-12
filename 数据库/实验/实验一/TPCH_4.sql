INSERT INTO Customer
VALUES(3799831, '张三', '北京市', 40, '010-51001199', 0.00, 'Northeast', 'VIP Customer');

INSERT INTO Lineitem(orderkey, linenumber, partkey, suppkey, quantity, shipdate)
VALUES(862, ROUND(RAND() * 100, 0), 7531, 10911, 10, '2012-3-6');

CREATE TABLE NewCustomer AS SELECT * FROM Customer WITH NO DATA;
INSERT INTO NewCustomer
SELECT C.*
FROM Customer C, Nation N
WHERE C.nationkey = N.nationkey AND N.name = '中国');

CREATE TABLE ShoppingStat
(custkey INT,
	quantity REAL,
	totalprice REAL);
INSERT INTO ShoppingStat
SELECT C.custkey, SUM(L.quantity), SUM(O.totalprice)
FROM Customer C, Orders O, Lineitem L
WHERE C.custkey = O.custkey AND O.orderkey = L.orderkey
GROUP BY C.custkey;

INSERT INTO Part
SELECT partkey + (SELECT COUNT(*) FROM Part) + 7, name, mfgr, brand, type, size, container, retaiprice, comment
FROM Part;

UPDATE PartSupp
SET supplycost = supplycost * 0.9
WHERE suppkey = (SELECT suppkey
	FROM Supplier
	WHERE name = '上海三剑投资咨询有限公司');

UPDATE Lineitem
SET extendedprice = Part.retaiprice * Lineitem.quantity
FROM Part
WHERE Part.partkey = Lineitem.partkey;

DELETE FROM Lineitem
WHERE orderkey IN (SELECT orderkey
	FROM Orders O, Customer C
	WHERE O.custkey = C.custkey AND C.name = '宁攸华');
DELETE FROM Orders
WHERE custkey = (SELECT custkey
	FROM Customer
	WHERE name = '宁攸华');