--
-- DATA LOAD for Thanks Corporation
--

CREATE TABLE IF NOT EXISTS COMPANY(
    cid             INT            NOT NULL AUTO_INCREMENT,
    cTitle          VARCHAR(30)    NOT NULL,
    founded_date    DATE           NOT NULL,
    PRIMARY KEY (cid)
)ENGINE=INNODB
;

INSERT INTO COMPANY (cTitle, founded_date) VALUES
("Blitz", "2001-8-31"),
("I Love Thanks", "2005-8-15"),
("Playa Medical", "1930-5-2"),
("First America", "1993-7-17"),
("Lightning Corporation", "2001-9-12")
;


CREATE TABLE IF NOT EXISTS COMPANY_VALUE(
    vid           INT            NOT NULL AUTO_INCREMENT,
    cid           INT            NOT NULL,
    value_type    VARCHAR(30)    NOT NULL,
    PRIMARY KEY (vid, cid)
)ENGINE=INNODB
;

INSERT INTO COMPANY_VALUE(cid, value_type) VALUES
(1, "Integrity"),
(1, "Creativity"),
(1, "Ingenuity"),
(1, "Success"),
(2, "Helpfulness"),
(2, "Thankfulness"),
(2, "Caring"),
(2, "Focused"),
(3, "Helpful"),
(3, "Serving"),
(3, "Invaluable"),
(3, "Medical Star"),
(4, "Hardworking"),
(4, "Encouraging"),
(4, "Strategic"),
(4, "Successful"),
(5, "Fast"),
(5, "Comprehensive"),
(5, "Timely"),
(5, "Innovative")
;

CREATE TABLE IF NOT EXISTS DEPARTMENT(
    did               INT             NOT NULL AUTO_INCREMENT,
    depTitle          VARCHAR(30)     NOT NULL,
    depDescription    VARCHAR(255),
    cid               INT             NOT NULL,
    PRIMARY KEY (did)
)ENGINE=INNODB
;

INSERT INTO DEPARTMENT(depTitle, depDescription, cid) VALUES
("Administration", "The executive branch", 1),
("Technology", "We build the apps for Blitz.", 1),
("Creative", "The brain of the operation", 1),
("Communications", "We communicate well with others.", 1),
--
("Thanks1", "Thanks Department 1", 2),
("Thanks2", "Thanks Department 2", 2),
("Thanks3", "Thanks Department 3", 2),
("Thanks4", "Thanks Department 4", 2),
--
("Board", "Board of the Hospital", 3),
("Outpatient", "Outpatient Team", 3),
("Inpatient", "Inpatient Team", 3),
("ER", "Emergency Room Team", 3),
--
("Car Loan", "Giving people wheels.", 4),
("Home Loan", "Giving people homes.", 4),
("Banking", "Banking section of First America", 4),
("Mutual Funds", "Mutual Funds of First America", 4),
--
("Electricity", "We power this company.", 5),
("Human Relations", "HR Department of Lightning Corporation", 5),
("Power", "We humbly thank Electricity", 5),
("Thunder", "Lightning's Best Friend", 5)
;

-- Starts at 21
INSERT INTO DEPARTMENT(depTitle, cid) VALUES
("Strategy", 1),
("Thanks5", 2),
("Cancer Center", 3),
("Administration", 4),
("Lightning Execs", 5)
;

CREATE TABLE IF NOT EXISTS EMPLOYEE(
    eid          INT            NOT NULL AUTO_INCREMENT,
    name         VARCHAR(30)    NOT NULL,
    job_title    VARCHAR(30)    NOT NULL,
    photo        VARCHAR(30),
    nickname     VARCHAR(30),
    started      DATE           NOT NULL,
    did          INT,
    PRIMARY KEY (eid)
)ENGINE=INNODB
;

INSERT INTO EMPLOYEE(name, job_title, photo, nickname, started, did) VALUES
("William Smith", "CEO", "mountain tops", "Will", "2013-1-1", 1),
("Florence Johnson", "Department Head", "mountain tops", "Flo", "2010-4-6", 5),
("George Williams", "Finance", "mountain tops", "GW", "2008-9-15", 9),
("Thomas Brown", "Finance Manager", "mountain tops", "Tom", "2005-3-10", 13),
("Annie Jones", "Lead Engineer", "mountain tops", "Ann", "2013-1-1", 17)
;

INSERT INTO EMPLOYEE(name, job_title, photo, started, did) VALUES
("Frederick Martinez", "President", "mountain tops", "2008-9-15", 1),
("Elsie Anderson", "Assistant Director", "mountain tops", "2013-1-1", 5),
("Charles Taylor", "Public Relations", "mountain tops", "2005-3-10", 9),
("Dorothy Thomas", "Finance Associate", "mountain tops", "2013-1-1", 13),
("Albert Hernandez", "Electric Manager", "mountain tops", "1993-7-17", 17),
("Ethel Moore", "Senior Technology Officer", "mountain tops", "2010-2-9", 2),
("Robert Martin", "Department Head", "mountain tops", "2010-2-11", 6),
("Doris Jackson", "Head Nurse", "mountain tops", "2011-3-15", 10),
("Joseph Thompson", "Financial Manager", "mountain tops", "2008-11-15", 14),
("Margaret White", "HR Manager", "mountain tops", "2011-3-15", 18),
("Alfred Lopez", "Creative Director", "mountain tops", "2010-4-6", 3),
("Gladys Lee", "Department Head", "mountain tops", "2008-11-15", 7),
("Henry Gonzales", "Inpatient Manager", "mountain tops", "2013-1-1", 11),
("Sarah Harris", "Funds Manager", "mountain tops", "2008-9-15", 15),
("Ernest Clark", "Power Manager", "mountain tops", "2011-3-15", 19),
("Lillian Lewis", "Communications Manager", "mountain tops", "1993-7-17", 4),
("Harry Robinson", "Department Head", "mountain tops", "2013-1-1", 8),
("Ellen Walker", "MD", "mountain tops", "2008-9-15", 12),
("Harold Perez", "Mutual Fund Manager", "mountain tops", "2013-1-1", 16),
("Hilda Hall", "Thunder Manager", "mountain tops", "2014-5-6", 20),
("Edward Young", "Strategy Consultant", "mountain tops", "2010-4-6", 21),
("Lily Allen", "Department Head", "mountain tops", "2013-1-1", 22),
("Walter Sanchez", "Lead MD", "mountain tops", "1993-7-17", 23),
("Frank Wright", "Chief Financial Officer", "mountain tops", "2013-1-1", 24),
("Violet King", "CEO", "mountain tops", "2008-9-15", 25)
;

INSERT INTO EMPLOYEE(name, job_title, nickname, started, did) VALUES
("Henry Gonzales", "Strategy Consultant", "H", "2010-4-6", 21),
("Herbert Scott", "Thanks Assistant", "Herb", "2011-3-15", 22),
("Ada Green", "Assistant MD", "A", "2011-3-10", 23),
("Richard Baker", "Chief of Operations", "Rich", "2013-1-1", 24),
("Emily Adams", "Lightning Board Member", "Emma", "2005-3-10", 25)
;

INSERT INTO EMPLOYEE(name, job_title, started, did) VALUES
("May Roberts", "HR Manager", "2010-2-11", 1),
("Samuel Carter", "Thanks Associate", "2008-11-15", 5),
("Mabel Phillips", "Company Effectiveness Officer", "2013-1-1", 9),
("David Evans", "Loan Associate", "1993-7-17", 13),
("Ivy Turner", "Electrician", "2011-3-10", 17),
("Sidney Torres", "Senior Developer", "2010-4-6", 2),
("Rose Parker", "Thanks Worker", "2011-3-10", 6),
("Francis Collins", "Outpatient Desk Manager", "2008-9-15", 10),
("Gertrude Edwards", "Home Loan Associate", "2013-1-1", 14),
("Edward Bisiani", "HR Associate", "2014-1-1", 18),
("Stanley Stewart", "Main Strategy Officer", "2010-2-11", 21),
("Jane Flores", "Thanks Associate", "2005-3-10", 22),
("Fred Morris", "Front Desk", "2007-10-10", 23),
-- Query Specific Names
("Julia Crow", "Assistant CEO", "1993-7-17", 24),
("Emma Cross", "Executive Lightning Specialist", "2013-1-1", 25)
;

--
-- TABLE: MESSAGE
--

CREATE TABLE IF NOT EXISTS MESSAGE(
    mid             INT           NOT NULL AUTO_INCREMENT,
    message_text    VARCHAR(255),
    PRIMARY KEY (mid)
)ENGINE=INNODB
;

INSERT INTO MESSAGE(message_text) VALUES
("GREAT JOB!"),
("Keep up the good work!"),
("You really followed instructions well"),
("I'm very impressed with your work"),
("Keep it up!"),
("You have done a service for the company"),
("Keep working hard!"),
("Nice work"),
("You really helped me out"),
("Thanks for working with my team!"),
("You are really creative"),
("Good work"),
("Good work, keep it up!"),
("Nice work!"),
("Quickly finished this project"),
("Great job on the project!"),
("You collaborate well!"),
("You're a good employee and friend."),
("Thank you so much!"),
("You did awesome work on that project"),
("You're the MVP of this company"),
("Good at keeping pace and a pleasure to work with"),
("Thank you so much for your continuous hard work!"),
("Thanks again for the effort!"),
("Thoroughly impressed with your work.")
;

--
-- TABLE: THANKS
--

CREATE TABLE IF NOT EXISTS THANKS(
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

INSERT INTO THANKS(mid, `to`, `from`, vid, thanksdate, cid) VALUES
-- Emma Cross
(1, 50, 25, 17, "2010-1-2", 5),
(2, 50, 10, 17, "2010-5-6", 5),
(3, 50, 45, 18, "2010-11-1", 5),
-- Julia Crow
(4, 34, 49, 14, "2011-1-2", 4), -- Comment query
(5, 24, 49, 15, "2012-1-1", 4),
-- First America < 2011
(6, 39, 19, 16, "2012-2-4", 4),
(7, 4, 9, 13, "2012-12-31", 4),
-- I Love Thanks -> October 2011
(8, 2, 12, 5, "2011-10-1", 2),
(9, 12, 2, 6, "2011-10-2", 2),
-- Blitz most awarded company value
(10, 1, 6, 1, "2013-2-4", 1),
(11, 1, 36, 1, "2014-1-1", 1),
(12, 1, 41, 1, "2012-2-2", 1),
(13, 41, 36, 1, "2014-2-3", 1),
(14, 6, 1, 1, "2010-1-2", 1),
-- Employee who received most Thanks in Blitz
(15, 11, 1, 2, "2010-2-10", 1),
(16, 11, 16, 3, "2009-1-3", 1),
(17, 11, 21, 4, "2008-5-19", 1),
(18, 11, 11, 2, "2010-12-31", 1),
-- 2011 Thanks Average Likes Blitz
(19, 6, 16, 2, "2011-1-1", 1),
(20, 16, 6, 3, "2011-1-2", 1),
(21, 36, 41, 4, "2011-1-3", 1),
(22, 16, 11, 2, "2011-1-4", 1),
-- Random Thanks in Playa Medical
(23, 38, 22, 9, "2011-1-5", 3),
(24, 18, 38, 10, "2011-1-6", 3),
(25, 8, 18, 11, "2010-2-2", 3)
;

--
-- TABLE: LIKE
--

CREATE TABLE IF NOT EXISTS `LIKE`(
    likeid      INT            NOT NULL AUTO_INCREMENT,
    tid         INT            NOT NULL,
    likedate    DATETIME       NOT NULL,
    PRIMARY KEY (likeid, tid)
)ENGINE=INNODB
;

INSERT INTO `LIKE`(tid, likedate) VALUES
-- 2011 Average Likes Blitz
(19, "2011-2-4"),
(19, "2011-2-10"),
(19, "2011-2-23"),
(19, "2011-3-1"),
(20, "2011-6-21"),
(20, "2011-8-21"),
(21, "2011-9-1"),
(21, "2011-9-11"),
(21, "2011-11-2"),
-- Random Likes
(1, "2013-1-2"),
(5, "2014-5-6"),
(7, "2013-2-3"),
(8, "2014-8-9"),
(8, "2011-10-1"),
(10, "2013-2-4")
;

--
-- TABLE: COMMENT
--

CREATE TABLE IF NOT EXISTS COMMENT(
    commentid       INT            NOT NULL AUTO_INCREMENT,
    tid             INT            NOT NULL,
    commentdate     DATE           NOT NULL,
    comment_data    VARCHAR(255)   NOT NULL,
    PRIMARY KEY (commentid, tid)
)ENGINE=INNODB
;

INSERT INTO COMMENT(tid, commentdate, comment_data) VALUES
-- Comments on Julia Crow's Thanks to Richard Baker.
(4, "2011-1-2", "I totally agree!"),
(4, "2011-1-2", "Such kind words"),
(4, "2011-1-3", "Yeah! You go!"),
-- Random Comments
(10, "2013-5-6", "This was a thoughtful thing to say."),
(10, "2013-5-7", "I second this, keep it up"),
(14, "2010-1-2", "You're so nice!"),
(15, "2010-2-10", "Keep it up"),
(16, "2009-1-3", "So much encouragement!"),
(17, "2008-5-19", "Nice!")
;

