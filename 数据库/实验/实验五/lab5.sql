CREATE TABLE author(
    author_name CHAR(25) PRIMARY KEY,
    address CHAR(40),
    URL CHAR(200)
);

CREATE TABLE publisher(
    publisher_name CHAR(30) PRIMARY KEY,
    address CHAR(40),
    phone CHAR(30),
    URL CHAR(200)
);

CREATE TABLE book(
    ISBN CHAR(10) PRIMARY KEY,
    title CHAR(50),
    year INT,
    price REAL,
    author_name CHAR(25) REFERENCES author(author_name),
    publisher_name CHAR(30) REFERENCES publisher(publisher_name)
);

CREATE TABLE shopping_basket(
    basket_id INT PRIMARY KEY,
    ISBN CHAR(10) REFERENCES book(ISBN),
    number INT
);

CREATE TABLE customer(
    email CHAR(100) PRIMARY KEY,
    name CHAR(25),
    address CHAR(40),
    phone CHAR(30),
    basket_id INT REFERENCES shopping_basket(basket_id)
);

CREATE TABLE warehouse(
    code INT PRIMARY KEY,
    address CHAR(40),
    phone CHAR(30),
    ISBN CHAR(10) REFERENCES book(ISBN),
    number INT
);