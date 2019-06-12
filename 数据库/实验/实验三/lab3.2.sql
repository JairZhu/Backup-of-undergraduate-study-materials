CREATE TABLE region(
    regionkey INTEGER PRIMARY KEY,
    name CHAR(250),
    comment VARCHAR(152));

CREATE TABLE nation(
    nationkey INTEGER PRIMARY KEY,
    name CHAR(250),
    regionkey INTEGER REFERENCES region(regionkey),
    comment VARCHAR(152));

CREATE TABLE nation(
    nationkey INTEGER PRIMARY KEY,
    name CHAR(250),
    regionkey INTEGER,
    comment VARCHAR(152),
    CONSTRAINT FK_Nation_regionkey FOREIGN KEY (regionkey) REFERENCES region(regionkey));

 CREATE TABLE nation(
    nationkey INTEGER PRIMARY KEY,
    name CHAR(250),
    regionkey INTEGER,
    comment VARCHAR(152));
ALTER TABLE nation 
ADD CONSTRAINT FK_Nation_regionkey
FOREIGN KEY(regionkey) REFERENCES region(regionkey);

CREATE TABLE PartSupp(
    partkey INTEGER,
    suppkey INTEGER,
    availqty INTEGER,
    supplycost REAL,
    comment VARCHAR(199),
    PRIMARY KEY(partkey, suppkey));

CREATE TABLE Lineitem(
    orderkey INTEGER REFERENCES Orders(orderkey),
    partkey INTEGER,
    suppkey INTEGER,
    linenumber INTEGER,
    quanity REAL,
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
    FOREIGN KEY(partkey, suppkey) REFERENCES PartSupp(partkey, suppkey));

CREATE TABLE nation(
    nationkey INTEGER PRIMARY KEY,
    name CHAR(250),
    regionkey INTEGER,
    comment VARCHAR(152),
    CONSTRAINT FK_nation_regionkey FOREIGN KEY (regionkey) REFERENCES region(regionkey)
    ON DELETE SET NULL ON UPDATE SET NULL);

ALTER TABLE nation DROP CONSTRAINT FK_nation_regionkey;

INSERT INTO nation(nationkey, name, regionkey, comment)
VALUES(1001, 'nation1', 1001, 'comment1');
