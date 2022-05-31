USE cinema;

DROP TABLE IF EXISTS user;

CREATE TABLE user (
    id          VARCHAR(36) PRIMARY KEY     /* GUID */
,   name        VARCHAR(255) NOT NULL
,   password    VARCHAR(98) NOT NULL
,   email       VARCHAR(255) DEFAULT NULL
,   registered  BOOLEAN DEFAULT false
);

CREATE TABLE ticket (
    userID
);

CREATE TABLE transaction (

);

CREATE TABLE show (

);

CREATE TABLE movie (

);

CREATE TABLE comment (

);

CREATE TABLE goods (

);

CREATE TABLE purchase (

);