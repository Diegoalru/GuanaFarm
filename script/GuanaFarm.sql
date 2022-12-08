USE mysql;

CREATE DATABASE IF NOT EXISTS guanafarm;

CREATE USER IF NOT EXISTS 'guanafarm'@'%' IDENTIFIED BY 'guanafarm';
GRANT ALL PRIVILEGES ON guanafarm.* TO 'guanafarm'@'%';
FLUSH PRIVILEGES;

USE guanafarm;

CREATE TABLE IF NOT EXISTS `users`
(
    `id`       int(11)      NOT NULL AUTO_INCREMENT,
    `username` varchar(255) NOT NULL,
    `password` varchar(255) NOT NULL,
    `email`    varchar(255) NOT NULL,
    CONSTRAINT PK_USER_ID PRIMARY KEY (`id`),
    CONSTRAINT NN_USER_USERNAME CHECK ( `username` IS NOT NULL ),
    CONSTRAINT NN_USER_PASSWORD CHECK ( `password` IS NOT NULL ),
    CONSTRAINT NN_USER_EMAIL CHECK ( `email` IS NOT NULL ),
    CONSTRAINT UQ_USER_USERNAME UNIQUE (`username`),
    CONSTRAINT UQ_USER_EMAIL UNIQUE (`email`),
    CONSTRAINT UQ_USER_USERNAME_EMAIL UNIQUE (`username`, `email`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


CREATE TABLE IF NOT EXISTS `products`
(
    `id`          int(11)      NOT NULL AUTO_INCREMENT,
    `name`        varchar(255) NOT NULL,
    `description` varchar(255) NOT NULL,
    `price`       double(10, 2) NOT NULL,
    `image`       varchar(255) NOT NULL,
    CONSTRAINT PK_PRODUCT_ID PRIMARY KEY (`id`),
    CONSTRAINT NN_PRODUCT_NAME CHECK ( `name` IS NOT NULL ),
    CONSTRAINT NN_PRODUCT_DESCRIPTION CHECK ( `description` IS NOT NULL ),
    CONSTRAINT NN_PRODUCT_PRICE CHECK ( `price` IS NOT NULL ),
    CONSTRAINT NN_PRODUCT_IMAGE CHECK ( `image` IS NOT NULL ),
    CONSTRAINT UQ_PRODUCT_NAME UNIQUE (`name`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

INSERT INTO
    users
        (username, password, email)
    VALUES
        ('admin', 'admin', 'admin@mail.com'),
        ('user', 'user', 'user@mail.com');

INSERT INTO
    products
        (name, description, price, image)
    VALUES
        ('product1', 'product1', 1000.00, ''),
        ('product2', 'product2', 2000.00, ''),
        ('product3', 'product3', 3000.00, ''),
        ('product4', 'product4', 4000.00, ''),
        ('product5', 'product5', 5000.00, ''),
        ('product6', 'product6', 6000.00, ''),
        ('product7', 'product7', 7000.00, ''),
        ('product8', 'product8', 8000.00, ''),
        ('product9', 'product9', 9000.00, ''),
        ('product10', 'product10', 10000.00, '');


SELECT id, name, description, price, image FROM products;

UPDATE products
    SET image = CONCAT('https://cloudfront-us-east-1.images.arcpublishing.com/gruponacion/7JKZROQFXBCCBD2AESV4GFNMO4.jpg');
