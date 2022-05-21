USE cinema;

DROP TABLE IF EXISTS user;

CREATE TABLE user (
    id          VARCHAR(36) PRIMARY KEY     /* GUID */
,   name        VARCHAR(20) NOT NULL
,   password    VARCHAR(20) NOT NULL
);