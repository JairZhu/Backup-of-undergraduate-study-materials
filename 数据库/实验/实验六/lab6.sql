--CREATE PROCEDURE Proc_CalTotalPrice
--AS
--    UPDATE Orders SET totalprice = (
--        SELECT SUM(extendedprice * (1 - discount) * (1 + tax))
--        FROM Lineitem
--        WHERE Orders.orderkey = Lineitem.orderkey
--    );

--EXEC Proc_CalTotalPrice;

--CREATE PROCEDURE Proc_CalTotalPrice4Order(@okey INT)
--AS
	--UPDATE Orders SET totalprice = (
	--	SELECT SUM(extendedprice * (1 - discount) * (1 + TAX))
	--	FROM Lineitem
	--	WHERE Orders.orderkey = Lineitem.orderkey AND
	--		Lineitem.orderkey = @okey);
 
--EXEC Proc_CalTotalPrice4Order 5365

--CREATE PROCEDURE Proc_CalTotalPrice4Customer(@p_custname CHAR(25))
--AS
--	DECLARE @LL_custkey INT;
--	SELECT @LL_custkey = custkey
--	FROM Customer
--	WHERE name = LTRIM(@p_custname);
--	UPDATE Orders SET totalprice = (
--		SELECT SUM(extendedprice * (1 - discount) * (1 + tax)) 
--		FROM Lineitem
--		WHERE Orders.orderkey = Lineitem.orderkey AND
--			Orders.custkey = @LL_custkey);

--EXEC Proc_CalTotalPrice4Customer '°¢²¨ÂÞ'

--SELECT *
--FROM Orders
--WHERE custkey = (
--	SELECT custkey
--	FROM Customer
--	WHERE name = '°¢²¨ÂÞ');

--CREATE PROCEDURE Proc_CalTotalPrice4Customer2(@p_custname CHAR(25), @p_totalprice REAL OUT)
--AS
--	DECLARE @L_custkey INT;
--	SELECT @L_custkey = custkey
--	FROM Customer
--	WHERE name = LTRIM(@p_custname);
--	PRINT N'custkey is ';
--	PRINT @L_custkey;
--	UPDATE Orders SET totalprice = (
--		SELECT SUM(extendedprice * (1 - discount) * (1 + tax))
--		FROM Lineitem
--		WHERE Orders.orderkey = Lineitem.orderkey AND
--			Orders.custkey = @L_custkey);
--	SELECT @p_totalprice = SUM(totalprice)
--	FROM Orders
--	WHERE custkey = @L_custkey;

--EXEC Proc_CalTotalPrice4Customer2 '²Ü²Ù', NULL;

--SELECT SUM(totalprice)
--FROM Orders
--WHERE custkey = (
--	SELECT custkey
--	FROM Customer
--	WHERE name = '²Ü²Ù');

--EXEC sp_rename 'Proc_CalTotalPrice4Order', 'CalTotalPrice4Order'

--EXEC sp_recompile N'CalTotalPrice4Order';

--DROP PROCEDURE CalTotalPrice4Order;