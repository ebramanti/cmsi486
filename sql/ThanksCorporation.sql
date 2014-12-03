--
-- ER/Studio Data Architect 9.6 SQL Code Generation
-- Project :      ThanksCorp.DM1
--
-- Date Created : Tuesday, November 25, 2014 23:37:27
-- Target DBMS : MySQL 5.x
--

--
-- TABLE: COMMENT
--

CREATE TABLE COMMENT(
    commentid      INT            NOT NULL AUTO_INCREMENT,
    mid            INT            NOT NULL,
    commentdate    DATETIME       NOT NULL,
    PRIMARY KEY (commentid, mid)
)ENGINE=INNODB
;



--
-- TABLE: COMPANY
--

CREATE TABLE COMPANY(
    cid             INT            NOT NULL AUTO_INCREMENT,
    cTitle          VARCHAR(30)    NOT NULL,
    founded_date    DATETIME       NOT NULL,
    PRIMARY KEY (cid)
)ENGINE=INNODB
;



--
-- TABLE: COMPANY_VALUE
--

CREATE TABLE COMPANY_VALUE(
    vid           INT            NOT NULL AUTO_INCREMENT,
    cid           INT            NOT NULL,
    value_type    VARCHAR(30)    NOT NULL,
    PRIMARY KEY (vid, cid)
)ENGINE=INNODB
;



--
-- TABLE: DEPARTMENT
--

CREATE TABLE DEPARTMENT(
    did               INT             NOT NULL AUTO_INCREMENT,
    depTitle          VARCHAR(30),
    depDescription    VARCHAR(255),
    cid               INT             NOT NULL,
    PRIMARY KEY (did)
)ENGINE=INNODB
;



--
-- TABLE: EMPLOYEE
--
-- note: photo changed from BLOB to VARCHAR for ease of demo

CREATE TABLE EMPLOYEE(
    eid          INT            NOT NULL AUTO_INCREMENT,
    name         VARCHAR(30)    NOT NULL,
    job_title    VARCHAR(30)    NOT NULL,
    photo        VARCHAR(30),
    nickname     VARCHAR(30),
    started      DATETIME       NOT NULL,
    did          INT,
    PRIMARY KEY (eid)
)ENGINE=INNODB
;



--
-- TABLE: LIKE
--

CREATE TABLE `LIKE`(
    likeid      INT            NOT NULL AUTO_INCREMENT,
    mid         INT            NOT NULL,
    likedate    DATETIME       NOT NULL,
    PRIMARY KEY (likeid, mid)
)ENGINE=INNODB
;



--
-- TABLE: MESSAGE
--

CREATE TABLE MESSAGE(
    mid             INT           NOT NULL AUTO_INCREMENT,
    message_text    VARCHAR(255),
    PRIMARY KEY (mid)
)ENGINE=INNODB
;



--
-- TABLE: THANKS
--

CREATE TABLE THANKS(
    tid           INT            NOT NULL AUTO_INCREMENT,
    mid           INT            NOT NULL,
    `to`          INT            NOT NULL,
    `from`        INT            NOT NULL,
    vid           INT,
    thanksdate    DATETIME       NOT NULL,
    cid           INT,
    PRIMARY KEY (tid, mid)
)ENGINE=INNODB
;

--
-- VIEW: EMPLOYEES_IN_COMPANY
--

CREATE VIEW EMPLOYEES_IN_COMPANY AS (
    SELECT e.eid
             , c.cid
             , e.name
             , c.cTitle
             , e.job_title
             , e.photo
             , e.nickname
             , e.started
    FROM COMPANY as c
            INNER JOIN DEPARTMENT AS d ON c.cid = d.cid
            INNER JOIN EMPLOYEE AS e ON e.did = d.did
)
;

--
-- VIEW: THANKS_IN_COMPANY
--

CREATE VIEW THANKS_IN_COMPANY AS (
    SELECT t.tid
         , m.message_text
         , t.`to`
         , t.`from`
         , cv.value_type
    FROM COMPANY as c
        INNER JOIN DEPARTMENT AS d ON c.cid = d.cid
        INNER JOIN EMPLOYEE AS e ON e.did = d.did
        INNER JOIN THANKS AS t ON t.to = e.eid
        INNER JOIN MESSAGE AS m ON t.mid = m.mid
        INNER JOIN COMPANY_VALUE as cv ON t.vid = cv.vid
)
;

--
-- TABLE: COMMENT
--

ALTER TABLE COMMENT ADD CONSTRAINT RefTHANKS20
    FOREIGN KEY (commentid, mid)
    REFERENCES THANKS(tid, mid)
;


--
-- TABLE: COMPANY_VALUE
--

ALTER TABLE COMPANY_VALUE ADD CONSTRAINT RefCOMPANY33
    FOREIGN KEY (cid)
    REFERENCES COMPANY(cid)
;


--
-- TABLE: DEPARTMENT
--

ALTER TABLE DEPARTMENT ADD CONSTRAINT RefCOMPANY32
    FOREIGN KEY (cid)
    REFERENCES COMPANY(cid)
;


--
-- TABLE: EMPLOYEE
--

ALTER TABLE EMPLOYEE ADD CONSTRAINT RefDEPARTMENT30
    FOREIGN KEY (did)
    REFERENCES DEPARTMENT(did)
;


--
-- TABLE: LIKE
--

ALTER TABLE `LIKE` ADD CONSTRAINT RefTHANKS19
    FOREIGN KEY (likeid, mid)
    REFERENCES THANKS(tid, mid)
;


--
-- TABLE: THANKS
--

ALTER TABLE THANKS ADD CONSTRAINT RefCOMPANY_VALUE17
    FOREIGN KEY (vid, cid)
    REFERENCES COMPANY_VALUE(vid, cid)
;

ALTER TABLE THANKS ADD CONSTRAINT RefEMPLOYEE22
    FOREIGN KEY (`to`)
    REFERENCES EMPLOYEE(eid)
;

ALTER TABLE THANKS ADD CONSTRAINT RefEMPLOYEE24
    FOREIGN KEY (`from`)
    REFERENCES EMPLOYEE(eid)
;

ALTER TABLE THANKS ADD CONSTRAINT RefMESSAGE31
    FOREIGN KEY (mid)
    REFERENCES MESSAGE(mid)
;


