USE cinema;

CREATE TABLE user (
    id          VARCHAR(36) NOT NULL           /* GUID */
,   name        VARCHAR(255) NOT NULL
,   password    VARCHAR(98) NOT NULL
,   email       VARCHAR(255) DEFAULT NULL
,   role        ENUM(
            'admin'
        ,   'client'
        )   NOT NULL
,   registered  BOOLEAN DEFAULT false
,   PRIMARY KEY (id)
);

CREATE TABLE transaction (
    id          VARCHAR(36) NOT NULL            /* GUID */
,   timestamp   DATETIME NOT NULL
,   confirmed   BOOLEAN NOT NULL DEFAULT false
,   cardNumber  VARCHAR(16) NOT NULL
,   price       FLOAT NOT NULL
,   PRIMARY KEY (id)
);

CREATE TABLE movie (
    id          VARCHAR(36) NOT NULL            /* GUID */
,   name        VARCHAR(255) NOT NULL
,   category    ENUM(
            'action'
        ,   'animation'
        ,   'comedy'
        ,   'drama'
        ,   'fantasy'
        ,   'horror'
        ,   'mystery'
        ,   'romance'
        ,   'thriller'
        ,   'western'
        ,   'crime'
        )   NOT NULL
,   description VARCHAR(1024) NOT NULL
,   PRIMARY KEY (id)
);

CREATE TABLE seance (
    id          VARCHAR(36) NOT NULL            /* GUID */
,   movieID     VARCHAR(36) NOT NULL            /* GUID */
,   seanceDate  DATE NOT NULL
,   startTime   TIME NOT NULL
,   endTime     TIME NOT NULL
,   roomNumber  TINYINT NOT NULL
,   PRIMARY KEY (id)
,   FOREIGN KEY (movieID) REFERENCES movie(id)
);

CREATE TABLE ticket (
    id              VARCHAR(36) NOT NULL        /* GUID */
,   userID          VARCHAR(36) NOT NULL        /* GUID */
,   transactionID   VARCHAR(36) NOT NULL        /* GUID */
,   seanceID        VARCHAR(36) NOT NULL        /* GUID */
,   timestamp       DATETIME NOT NULL
,   seat            VARCHAR(6) NOT NULL
,   price           FLOAT NOT NULL
,   PRIMARY KEY (id)
,   FOREIGN KEY (userID)        REFERENCES user(id)
,   FOREIGN KEY (transactionID) REFERENCES transaction(id)
,   FOREIGN KEY (seanceID)      REFERENCES seance(id)
);

CREATE TABLE comment (
    id          VARCHAR(36) NOT NULL            /* GUID */
,   userID      VARCHAR(36) NOT NULL            /* GUID */
,   movieID     VARCHAR(36) NOT NULL            /* GUID */
,   text        VARCHAR(2048) DEFAULT NULL
,   rate        SMALLINT NOT NULL
,   PRIMARY KEY (id)
,   FOREIGN KEY (userID)    REFERENCES user(id)
,   FOREIGN KEY (movieID)   REFERENCES movie(id)
);

CREATE TABLE goods (
    id      VARCHAR(36) NOT NULL                /* GUID */
,   name    VARCHAR(255) NOT NULL
,   price   FLOAT NOT NULL
,   PRIMARY KEY (id)
);

CREATE TABLE purchase (
    id              VARCHAR(36) NOT NULL        /* GUID */
,   userID          VARCHAR(36) NOT NULL        /* GUID */
,   transactionID   VARCHAR(36) NOT NULL        /* GUID */
,   PRIMARY KEY (id)
,   FOREIGN KEY (userID)        REFERENCES user(id)
,   FOREIGN KEY (transactionID) REFERENCES transaction(id)
);

CREATE TABLE cart (
    purchaseID  VARCHAR(36) NOT NULL            /* GUID */
,   goodID      VARCHAR(36) NOT NULL            /* GUID */
,   count       INTEGER NOT NULL
,   FOREIGN KEY (purchaseID)    REFERENCES purchase(id)
,   FOREIGN KEY (goodID)        REFERENCES goods(id)
)