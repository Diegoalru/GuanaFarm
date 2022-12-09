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
        ('Lisan Analges', 'Solucion Bebible 25 MG / 10 ML', 1050.00, 'lisan_analges.jpg'),
        ('Vidatox', 'Gotas 30 ML', 83900.24, 'vidatox.jpg'),
        ('Dolo-Medox', 'Tabletas via Oral', 470.00, 'dolo.jpg'),
        ('Eucerin', 'Ultra Light Serum', 32411.79, 'eucerin.jpg'),
        ('Sensilis', 'Black Peel 50 ML', 27660.14, 'sensilis.jpg'),
        ('Silimar', 'Tabletas via oral', 243.72, 'silimar.jpg'),
        ('La Roche', 'Hyalu B5 Serum 30 ML', 40860.80, 'roche.jpg'),
        ('Rupatadina', 'Calox Solucion Oral 1 MG', 10590.00, 'rupatadina.jpg'),
        ('Microdacyn', 'Solucion Bucal 120 ML', 9595.00, 'microdacyn.png'),
        ('Enfagrow', 'Formula Infantil Premium 3 Natural', 16914.47, 'enfagrow.jpg');
