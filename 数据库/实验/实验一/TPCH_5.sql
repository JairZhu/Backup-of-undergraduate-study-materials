CREATE VIEW V_DLMU_PARTSUPP1 AS
SELECT P.partkey, P.name, PS.availqty, P.retaiprice, PS.supplycost, P.comment
FROM Part P, PartSupp PS, Supplier S
WHERE P.partkey = PS.partkey AND S.suppkey = PS.suppkey AND S.name = '上海三剑投资咨询有限公司';

CREATE VIEW V_CustAvgOrder(custkey, cname, avgprice, avgquantity) AS
SELECT C.custkey, MAX(C.name), AVG(O.totalprice), AVG(L.quantity)
FROM Customer C, Orders O, Lineitem L
WHERE C.custkey = O.custkey AND L.orderkey = O.orderkey
GROUP BY C.custkey;

CREATE VIEW V_DLMU_PartSupp2 AS
SELECT partkey, suppkey, availqty, supplycost
FROM PartSupp
WHERE suppkey = (SELECT suppkey
	FROM Supplier
	WHERE name = '上海三剑投资咨询有限公司')
WITH CHECK OPTION;

INSERT INTO V_DLMU_PartSupp2
VALUES(58889, 5048, 704, 77760);

UPDATE V_DLMU_PartSupp2
SET supplycost = 122
WHERE suppkey = 6;

DELETE FROM V_DLMU_PartSupp2
WHERE suppkey = 6;

CREATE VIEW V_DLMU_PartSupp3 AS
SELECT partkey, suppkey, availqty, supplycost
FROM PartSupp
WHERE suppkey = (SELECT suppkey
	FROM Supplier
	WHERE name = '上海三剑投资咨询有限公司');

INSERT INTO V_DLMU_PartSupp3
VALUES(63428, 29334, 704, 77760);

UPDATE V_DLMU_PartSupp3
SET supplycost = 12
WHERE suppkey = 6;

DELETE FROM V_DLMU_PartSupp3
WHERE suppkey = 6;

INSERT INTO V_CustAvgOrder
VALUES(100000, NULL, 20, 2000);

CREATE VIEW V_CustOrd(custkey, cname, qty, extprice) AS
SELECT C.custkey, C.name, L.quantity, L.extendedprice
FROM Customer C, Orders O, Lineitem L
WHERE C.custkey = O.custkey AND O.orderkey = L.orderkey;

CREATE VIEW V_CustAvgOrder(custkey, cname, avgqty, avgprice) AS
SELECT custkey, MAX(cname), AVG(qty), AVG(extprice)
FROM V_CustOrd
GROUP BY custkey;

DROP VIEW V_CustOrd RESTRICT;
DROP VIEW V_CustOrd CASCADE;