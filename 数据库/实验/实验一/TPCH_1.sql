--CREATE DATABASE TPCH;
--CREATE SCHEMA Sales;

----SET SEARCH_PATH TO Sales, public;
CREATE TABLE Region (
	regionkey INT PRIMARY KEY,
	name CHAR(250),
	comment VARCHAR(152)
);

CREATE TABLE Nation (
	nationkey INT PRIMARY KEY,
	name CHAR(250),
	regionkey INT REFERENCES Region(regionkey),
	comment VARCHAR(152)
);

CREATE TABLE Supplier (
	suppkey INT PRIMARY KEY,
	name CHAR(250),
	address VARCHAR(400),
	nationkey INT REFERENCES Nation(nationkey),
	phone CHAR(150),
	acctbal REAL,
	comment VARCHAR(101)
);

CREATE TABLE Part (
	partkey INT PRIMARY KEY,
	name VARCHAR(550),
	mfgr CHAR(250),
	brand CHAR(100),
	type VARCHAR(250),
	size INT,
	container CHAR(100),
	retaiprice real,
	comment VARCHAR(230)
);

CREATE TABLE PartSupp (
	partkey INT REFERENCES Part(partkey),
	suppkey INT REFERENCES Supplier(suppkey),
	availqty INT,
	supplycost REAL,
	comment VARCHAR(199),
	PRIMARY KEY(partkey, suppkey)
);

CREATE TABLE Customer (
	custkey INT PRIMARY KEY,
	name VARCHAR(250),
	address VARCHAR(400),
	nationkey INT REFERENCES Nation(nationkey),
	phone CHAR(150),
	acctbal REAL,
	mktsegment CHAR(100),
	comment VARCHAR(117)
);

CREATE TABLE Orders (
	orderkey INT PRIMARY KEY,
	custkey INT REFERENCES Customer(custkey),
	ordorstatus CHAR(1),
	totalprice REAL,
	orderdate DATE,
	orderpriority CHAR(150),
	cler CHAR(150),
	shippriority INT,
	comment VARCHAR(790)
);

CREATE TABLE Lineitem (
	orderkey INT REFERENCES Orders(orderkey),
	partkey INT REFERENCES Part(partkey),
	suppkey INT REFERENCES Supplier(suppkey),
	linenumber INT,
	quantity REAL,
	extendedprice REAL,
	discount REAL,
	tax REAL,
	returnflag CHAR(1),
	linestatus CHAR(1),
	shipdate DATE,
	commitdate DATE,
	receiptdate DATE,
	shipinstruct CHAR(250),
	shipmode CHAR(100),
	comment VARCHAR(440),
	PRIMARY KEY(orderkey, linenumber),
	FOREIGN KEY(partkey, suppkey) REFERENCES PartSupp(partkey, suppkey)
);