--
-- ER/Studio Data Architect 9.6 SQL Code Generation
-- Project :      ThanksCorp.DM1
--
-- Date Created : Tuesday, November 04, 2014 21:35:39
-- Target DBMS : MySQL 5.x
--

-- 
-- TABLE: COMMENT 
--

CREATE TABLE COMMENT(
    commentid      VARCHAR(30)    NOT NULL,
    mid            VARCHAR(30)    NOT NULL,
    commentdate    DATETIME       NOT NULL,
    PRIMARY KEY (commentid, mid)
)ENGINE=INNODB
;



-- 
-- TABLE: COMPANY 
--

CREATE TABLE COMPANY(
    cid             VARCHAR(30)    NOT NULL,
    cTitle          VARCHAR(30)    NOT NULL,
    founded_date    DATETIME       NOT NULL,
    PRIMARY KEY (cid)
)ENGINE=INNODB
;



-- 
-- TABLE: COMPANY_VALUE 
--

CREATE TABLE COMPANY_VALUE(
    vid           VARCHAR(30)    NOT NULL,
    value_type    VARCHAR(30)    NOT NULL,
    PRIMARY KEY (vid)
)ENGINE=INNODB
;



-- 
-- TABLE: DEPARTMENT 
--

CREATE TABLE DEPARTMENT(
    did               VARCHAR(30)     NOT NULL,
    depTitle          VARCHAR(30),
    depDescription    VARCHAR(255),
    headid            VARCHAR(30),
    cid               VARCHAR(30)     NOT NULL,
    PRIMARY KEY (did)
)ENGINE=INNODB
;



-- 
-- TABLE: DEPARTMENT_HEAD 
--

CREATE TABLE DEPARTMENT_HEAD(
    headid    VARCHAR(30)    NOT NULL,
    PRIMARY KEY (headid)
)ENGINE=INNODB
;



-- 
-- TABLE: EMPLOYEE 
--

CREATE TABLE EMPLOYEE(
    eid          VARCHAR(30)    NOT NULL,
    name         VARCHAR(30)    NOT NULL,
    job_title    VARCHAR(30)    NOT NULL,
    photo        BLOB,
    nickname     VARCHAR(30),
    started      DATETIME       NOT NULL,
    did          VARCHAR(30),
    PRIMARY KEY (eid)
)ENGINE=INNODB
;



-- 
-- TABLE: EXECUTIVE 
--

CREATE TABLE EXECUTIVE(
    execid    VARCHAR(30)    NOT NULL,
    cid       VARCHAR(30)    NOT NULL,
    PRIMARY KEY (execid)
)ENGINE=INNODB
;



-- 
-- TABLE: LIKE 
--

CREATE TABLE LIKE(
    likeid      VARCHAR(30)    NOT NULL,
    mid         VARCHAR(30)    NOT NULL,
    likedate    DATETIME       NOT NULL,
    PRIMARY KEY (likeid, mid)
)ENGINE=INNODB
;



-- 
-- TABLE: MESSAGE 
--

CREATE TABLE MESSAGE(
    mid             VARCHAR(30)     NOT NULL,
    message_text    VARCHAR(255),
    PRIMARY KEY (mid)
)ENGINE=INNODB
;



-- 
-- TABLE: THANKS 
--

CREATE TABLE THANKS(
    tid           VARCHAR(30)    NOT NULL,
    mid           VARCHAR(30)    NOT NULL,
    to            VARCHAR(30)    NOT NULL,
    from          VARCHAR(30)    NOT NULL,
    vid           VARCHAR(30),
    thanksdate    DATETIME       NOT NULL,
    PRIMARY KEY (tid, mid)
)ENGINE=INNODB
;



-- 
-- INDEX: Ref720 
--

CREATE INDEX Ref720 ON COMMENT(commentid, mid)
;
-- 
-- INDEX: Ref1529 
--

CREATE INDEX Ref1529 ON DEPARTMENT(headid)
;
-- 
-- INDEX: Ref332 
--

CREATE INDEX Ref332 ON DEPARTMENT(cid)
;
-- 
-- INDEX: Ref148 
--

CREATE INDEX Ref148 ON DEPARTMENT_HEAD(headid)
;
-- 
-- INDEX: Ref430 
--

CREATE INDEX Ref430 ON EMPLOYEE(did)
;
-- 
-- INDEX: Ref147 
--

CREATE INDEX Ref147 ON EXECUTIVE(execid)
;
-- 
-- INDEX: Ref328 
--

CREATE INDEX Ref328 ON EXECUTIVE(cid)
;
-- 
-- INDEX: Ref719 
--

CREATE INDEX Ref719 ON LIKE(likeid, mid)
;
-- 
-- INDEX: Ref617 
--

CREATE INDEX Ref617 ON THANKS(vid)
;
-- 
-- INDEX: Ref1422 
--

CREATE INDEX Ref1422 ON THANKS(to)
;
-- 
-- INDEX: Ref1424 
--

CREATE INDEX Ref1424 ON THANKS(from)
;
-- 
-- INDEX: Ref531 
--

CREATE INDEX Ref531 ON THANKS(mid)
;
-- 
-- TABLE: COMMENT 
--

ALTER TABLE COMMENT ADD CONSTRAINT RefTHANKS20 
    FOREIGN KEY (commentid, mid)
    REFERENCES THANKS(tid, mid)
;


-- 
-- TABLE: DEPARTMENT 
--

ALTER TABLE DEPARTMENT ADD CONSTRAINT RefDEPARTMENT_HEAD29 
    FOREIGN KEY (headid)
    REFERENCES DEPARTMENT_HEAD(headid)
;

ALTER TABLE DEPARTMENT ADD CONSTRAINT RefCOMPANY32 
    FOREIGN KEY (cid)
    REFERENCES COMPANY(cid)
;


-- 
-- TABLE: DEPARTMENT_HEAD 
--

ALTER TABLE DEPARTMENT_HEAD ADD CONSTRAINT RefEMPLOYEE8 
    FOREIGN KEY (headid)
    REFERENCES EMPLOYEE(eid)
;


-- 
-- TABLE: EMPLOYEE 
--

ALTER TABLE EMPLOYEE ADD CONSTRAINT RefDEPARTMENT30 
    FOREIGN KEY (did)
    REFERENCES DEPARTMENT(did)
;


-- 
-- TABLE: EXECUTIVE 
--

ALTER TABLE EXECUTIVE ADD CONSTRAINT RefEMPLOYEE7 
    FOREIGN KEY (execid)
    REFERENCES EMPLOYEE(eid)
;

ALTER TABLE EXECUTIVE ADD CONSTRAINT RefCOMPANY28 
    FOREIGN KEY (cid)
    REFERENCES COMPANY(cid)
;


-- 
-- TABLE: LIKE 
--

ALTER TABLE LIKE ADD CONSTRAINT RefTHANKS19 
    FOREIGN KEY (likeid, mid)
    REFERENCES THANKS(tid, mid)
;


-- 
-- TABLE: THANKS 
--

ALTER TABLE THANKS ADD CONSTRAINT RefCOMPANY_VALUE17 
    FOREIGN KEY (vid)
    REFERENCES COMPANY_VALUE(vid)
;

ALTER TABLE THANKS ADD CONSTRAINT RefEMPLOYEE22 
    FOREIGN KEY (to)
    REFERENCES EMPLOYEE(eid)
;

ALTER TABLE THANKS ADD CONSTRAINT RefEMPLOYEE24 
    FOREIGN KEY (from)
    REFERENCES EMPLOYEE(eid)
;

ALTER TABLE THANKS ADD CONSTRAINT RefMESSAGE31 
    FOREIGN KEY (mid)
    REFERENCES MESSAGE(mid)
;


