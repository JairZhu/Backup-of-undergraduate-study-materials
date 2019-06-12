SELECT name, address, phone
FROM Supplier;

SELECT *
FROM Orders
WHERE DATEDIFF(d, CONVERT(date, GETDATE()), orderdate) < 7 AND totalprice > 1000;

SELECT C.custkey, SUM(O.totalprice)
FROM Customer C, Orders O
WHERE C.custkey = O.custkey
GROUP BY C.custkey;

SELECT C.custkey, MAX(C.name)
FROM Customer C, Orders O
WHERE C.custkey = O.custkey
GROUP BY C.custkey
HAVING AVG(O.totalprice) > 1000;

SELECT F.suppkey, F.name, F.address
FROM Supplier F, Supplier S
WHERE F.nationkey = S.nationkey AND S.name = '光明耗材公司';

SELECT P.name, P.mfgr, P.retaiprice, PS.supplycost
FROM Part P, PartSupp PS
WHERE P.retaiprice > PS.supplycost;

SELECT P.name, P.mfgr, P.retaiprice, PS.supplycost
FROM Part P, PartSupp PS
WHERE P.partkey = PS.partkey AND P.retaiprice > PS.supplycost

SELECT O.orderkey, O.totalprice, L.partkey, L.quantity, L.extendedprice
FROM Customer C, Orders O, Lineitem L
WHERE C.custkey = O.custkey AND O.orderkey = L.orderkey AND C.name = '宁攸华';