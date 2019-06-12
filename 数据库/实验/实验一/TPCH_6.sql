CREATE UNIQUE INDEX Idx_part_name ON Part(name);

ALTER TABLE Part ADD name_length AS LEN(name) PERSISTED
CREATE INDEX Idx_part_name_fun ON Part(name_length);

CREATE INDEX Idx_part_mfgr_brand ON Part(mfgr, brand);

CREATE TABLE Part2(
	partkey INT,
	name VARCHAR(550),
	mfgr CHAR(250),
	brand CHAR(100),
	type VARCHAR(250),
	size INT,
	container CHAR(100),
	retailprice REAL,
	comment VARCHAR(230)
);
CREATE CLUSTERED INDEX Idx_part_mfgr ON Part2(mfgr);

ALTER TABLE Part ADD hash_name
AS CAST(HASHBYTES('MD2', name) AS UNIQUEIDENTIFIER) PERSISTED;
CREATE INDEX Idx_part_name_hash ON part(hash_name);

EXEC sp_rename N'dbo.Part.Idx_part_name_hash', N'Idx_name_hash_new', N'INDEX';

EXPLAIN SELECT * FROM Part WHERE name = '零件';

CREATE FUNCTION TestIndex (@p_partname CHAR(55)) RETURNS INT 
AS 
BEGIN
	DECLARE @begintime DATETIME;
	DECLARE @endtime DATETIME;
	DECLARE @durationtime INT;
	DECLARE @TMP INT;
	SET @begintime = CURRENT_TIMESTAMP;
	SELECT @TMP = SUM(partkey)
	FROM Part 
	WHERE name = @p_partname;
	SET @endtime = CURRENT_TIMESTAMP;
	SET @durationtime = DATEDIFF(ms, @begintime, @endtime);
	RETURN @durationtime;
END;

SELECT TPCH.dbo.TestIndex('中科院电子所微波公司');

CREATE INDEX part_name ON Part(name);
SELECT TPCH.dbo.TestIndex('中科院电子所微波公司');