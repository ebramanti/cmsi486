INSERT INTO COMPANY (cTitle, founded_date) VALUES
("Blitz", "2001-8-31")
;
INSERT INTO COMPANY_VALUE(cid, value_type) VALUES
(1, "Integrity")
;
INSERT INTO DEPARTMENT(depTitle, depDescription, cid) VALUES
("Administration", "The executive branch", 1)
;
INSERT INTO EMPLOYEE(name, job_title, photo, nickname, started, did) VALUES
("William Smith", "CEO", "mountain tops", "Will", "2013-1-1", 1),
("Bill Wender", "CFO", "mountain tops", "Will", "2013-1-1", 1)
;
INSERT INTO MESSAGE(message_text) VALUES
("GREAT JOB!")
;
INSERT INTO THANKS(mid, `to`, `from`, vid, cid) VALUES
(1, 1, 2, 1, 1)
;

SELECT thanksdate
FROM THANKS
;
