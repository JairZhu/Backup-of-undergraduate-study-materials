CREATE TABLE Supplier(
	suppkey INTEGER CONSTRAINT PK_supplier PRIMARY KEY,
	name CHAR(250),
	address VARCHAR(400),
	nationkey INTEGER,
	phone CHAR(150),
	acctbal REAL,
	comment VARCHAR(101)
);

CREATE TABLE Supplier(
	suppkey INTEGER,
	name CHAR(250),
	address VARCHAR(400),
	nationkey INTEGER,
	phone CHAR(150),
	acctbal REAL,
	comment VARCHAR(101),
	 CONSTRAINT PK_supplier PRIMARY KEY(suppkey)
);

CREATE TABLE Supplier(
	suppkey INTEGER NOT NULL,
	name CHAR(250),
	address VARCHAR(400),
	nationkey INTEGER,
	phone CHAR(150),
	acctbal REAL,
	comment VARCHAR(101),
);
ALTER TABLE Supplier
ADD CONSTRAINT PK_supplier PRIMARY KEY(suppkey);

CREATE TABLE PartSupp(
	partkey INTEGER,
	suppkey INTEGER,
	availqty INTEGER,
	supplycost REAL,
	comment VARCHAR(199),
	PRIMARY KEY(partkey, suppkey)
);

CREATE TABLE nation(
	nationkey INTEGER CONSTRAINT PK_nation PRIMARY KEY,
	name CHAR(250) UNIQUE,
	regionkey INTEGER,
	comment VARCHAR(152)
);

ALTER TABLE nation DROP CONSTRAINT PK_nation;

INSERT INTO Supplier(suppkey, name, address, nationkey, phone, acctbal, comment)
VALUES (11, 'test1', 'test1', 101, '12345678', 0.0, 'test1');

INSERT INTO Supplier(suppkey, name, address, nationkey, phone, acctbal, comment)
VALUES (11, 'test2', 'test2', 102, '23456789', 0.0, 'test2');
