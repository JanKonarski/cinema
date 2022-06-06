USE cinema;

DROP TABLE IF EXISTS user;

CREATE TABLE user (
    id          VARCHAR(36) NOT NULL     /* GUID */
,   name        VARCHAR(255) NOT NULL
,   password    VARCHAR(98) NOT NULL
,   email       VARCHAR(255) DEFAULT NULL
,   registered  BOOLEAN DEFAULT false
,   PRIMARY KEY (id)
);

CREATE TABLE transaction (
    id          VARCHAR(36) NOT NULL
,   timestamp   DATETIME NOT NULL
,   confirmed   BOOLEAN NOT NULL DEFAULT false
,   cardNumber  NUMBER(16) NOT NULL
,   PRIMARY KEY (id)
);

CREATE TABLE ticket (
    id              VARCHAR(36) NOT NULL
,   userID          VARCHAR(36) NOT NULL
,   transactionID   VARCHAR(36) NOT NULL
,   showID          VARCHAR(36) NOT NULL
,   timestamp       DATETIME NOT NULL
,   seat            VARCHAR(6) NOT NULL
,
,   PRIMARY KEY (id)
,   FOREIGN KEY (userID)        REFERENCES user(id)
,   FOREIGN KEY (transactionID) REFERENCES transaction(id)
);

CREATE TABLE show (
    id          VARCHAR(36) NOT NULL
,   date        DATE NOT NULL
,   timeStart   TIME NOT NULL
,   timeEnd     TIME NOT NULL
,   room        TINYINT NOT NULL
,   movieID     VARCHAR(36) NOT NULL
,
,   PRIMARY KEY (id)
,   FOREIGN KEY (movieID) REFERENCES movie(id)
);

CREATE TABLE movie (
    id          VARCHAR(36) PRIMARY KEY
,   name        VARCHAR(255) NOT NULL
,   category    ENUM(
        'action'
    ,   'comedy'
    ,   'drama'
    ,   'fantasy'
    ,   'horror'
    ,   'mystery'
    ,   'romance'
    ,   'thriller'
    ,   'western'
    )   NOT NULL
,   description VARCHAR(1024) NOT NULL
,
);

CREATE TABLE comment (
    id          VARCHAR(36) NOT NULL
,   userID      VARCHAR(36) NOT NULL
,   movieID     VARCHAR(36) NOT NULL
,   text        VARCHAR(2048) DEFAULT NULL
,   rate        SMALLINT NOT NULL
,   PRIMARY KEY (id)
,   FOREIGN KEY (userID) REFERENCES user(id)
,   FOREIGN KEY (movieID) REFERENCES movie(id)
);

CREATE TABLE goods (

);

CREATE TABLE purchase (

);