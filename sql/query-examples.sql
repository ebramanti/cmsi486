-- List the names of all employees in the company "I Love Thanks".
SELECT name
FROM   EMPLOYEES_IN_COMPANY
WHERE  cTitle = "I Love Thanks"
;

-- Show all department names in the corporation "Blitz".
SELECT d.depTitle
FROM COMPANY AS c
    INNER JOIN DEPARTMENT AS d ON c.cid = d.cid
WHERE c.cTitle = "Blitz"
;

-- Return a list of all employees in the database who have nicknames.
SELECT e.nickname
     , e.name
FROM EMPLOYEE AS e
WHERE e.nickname IS NOT NULL
;

-- Show names of employees who do not have photos in the "I Love Thanks" company.
SELECT e.name
FROM COMPANY AS c
    INNER JOIN DEPARTMENT AS d ON c.cid = d.cid
    INNER JOIN EMPLOYEE   AS e ON d.did = e.did
WHERE e.photo IS NULL
    AND c.cTitle = "I Love Thanks"
;

-- Show all comments on Julia Crow's Thanks to Richard Baker on January 2, 2011.
SELECT commentdate
     , comment_data
FROM COMMENT
WHERE tid = (
    SELECT t.tid
    FROM THANKS_IN_COMPANY AS t
    WHERE t.to = (
        SELECT eid
        FROM   EMPLOYEES_IN_COMPANY
        WHERE  name = "Richard Baker"
    )
    AND t.from = (
        SELECT eid
        FROM   EMPLOYEES_IN_COMPANY
        WHERE  name = "Julia Crow"
    )
    AND t.thanksdate = "2011-1-2"
)
;

-- Show all of the Thanks that Julia Crow from "First America" gave.
SELECT thanks.`from`
     , addressed_to.name as `to`
     , thanks.message
     , thanks.thanksdate
     , thanks.value
FROM (
    SELECT e.name AS `from`
         , t.`to`
         , m.message_text AS message
         , t.thanksdate
         , cv.value_type AS value
    FROM COMPANY AS c
        INNER JOIN DEPARTMENT    AS d  ON c.cid    = d.cid
        INNER JOIN EMPLOYEE      AS e  ON d.did    = e.did
        INNER JOIN THANKS        AS t  ON t.`from` = e.eid
        INNER JOIN MESSAGE       AS m  ON t.mid    = m.mid
        INNER JOIN COMPANY_VALUE AS cv ON t.vid    = cv.vid
    WHERE c.cTitle = "First America"
        AND e.name = "Julia Crow"
) AS thanks
, EMPLOYEE AS addressed_to
WHERE addressed_to.eid = thanks.`to`
;

-- Show all of the Thanks that Emma Cross from "Lightning Corporation" received.
SELECT thanks.`to`
     , addressed_to.name AS `from`
     , thanks.message
     , thanks.thanksdate
     , thanks.value
FROM (
    SELECT e.name as `to`
         , t.`from`
         , m.message_text AS message
         , t.thanksdate
         , cv.value_type AS value
    FROM COMPANY AS c
        INNER JOIN DEPARTMENT    AS d  ON c.cid  = d.cid
        INNER JOIN EMPLOYEE      AS e  ON d.did  = e.did
        INNER JOIN THANKS        AS t  ON t.`to` = e.eid
        INNER JOIN MESSAGE       AS m  ON t.mid  = m.mid
        INNER JOIN COMPANY_VALUE AS cv ON t.vid  = cv.vid
    WHERE c.cTitle = "Lightning Corporation"
        AND e.name = "Emma Cross"
) AS thanks
, EMPLOYEE as addressed_to
WHERE addressed_to.eid = thanks.`from`
;

-- Show all thanks that have been given in the corporation "First America" before 2013.
SELECT t.to
     , t.from
     , m.message_text
     , t.thanksdate
     , cv.value_type
FROM COMPANY AS c
    INNER JOIN DEPARTMENT    AS d  ON c.cid  = d.cid
    INNER JOIN EMPLOYEE      AS e  ON d.did  = e.did
    INNER JOIN THANKS        AS t  ON t.`to` = e.eid
    INNER JOIN COMPANY_VALUE AS cv ON t.vid  = cv.vid
    INNER JOIN MESSAGE       AS m  ON t.mid  = m.mid
WHERE c.cTitle = "First America"
    AND t.thanksdate < '2013-1-1'
;

-- List the company values of "Blitz".
SELECT cv.value_type
FROM   COMPANY AS c
    INNER JOIN COMPANY_VALUE as cv on c.cid = cv.cid
WHERE  c.cTitle = "Blitz"
;

-- Who is the newest employee to have joined the company "Lightning Corporation"?
SELECT e.name
FROM COMPANY AS c
    INNER JOIN DEPARTMENT AS d ON c.cid = d.cid
    INNER JOIN EMPLOYEE   AS e ON d.did = e.did
WHERE c.cTitle = "Lightning Corporation"
    AND e.started = (
        SELECT MAX(e.started)
        FROM COMPANY AS c
            INNER JOIN DEPARTMENT AS d ON c.cid = d.cid
            INNER JOIN EMPLOYEE   AS e ON d.did = e.did
        WHERE c.cTitle = "Lightning Corporation"
    )
;

-- List all Thanks "I Love Thanks" employees gave in October 2011.
SELECT t.to
     , t.from
     , m.message_text
     , t.thanksdate
     , cv.value_type
FROM COMPANY AS c
    INNER JOIN DEPARTMENT    AS d  ON c.cid  = d.cid
    INNER JOIN EMPLOYEE      AS e  ON d.did  = e.did
    INNER JOIN THANKS        AS t  ON t.`to` = e.eid
    INNER JOIN COMPANY_VALUE AS cv ON t.vid  = cv.vid
    INNER JOIN MESSAGE       AS m  ON t.mid  = m.mid
WHERE MONTHNAME(t.thanksdate) = "October"
    AND YEAR(t.thanksdate) = 2011
;

-- Find the name of the employee who received the most Thanks in "Blitz".
SELECT e.name
FROM COMPANY AS c
    INNER JOIN DEPARTMENT AS d ON c.cid = d.cid
    INNER JOIN EMPLOYEE   AS e ON d.did = e.did
    INNER JOIN THANKS     AS t ON t.to  = e.eid
WHERE c.cTitle = "Blitz"
    AND t.to = (
        SELECT `to` FROM (
            SELECT `to`, count(`to`) AS counted
            FROM COMPANY AS c
                INNER JOIN DEPARTMENT AS d ON c.cid = d.cid
                INNER JOIN EMPLOYEE   AS e ON d.did = e.did
                INNER JOIN THANKS     AS t ON t.to  = e.eid
            WHERE c.cTitle = "Blitz"
            GROUP BY `to`
            ORDER BY counted DESC
            LIMIT 1
        ) as received_most_thanks
    )
    GROUP BY `to`
;

-- Find the average number of likes each Thanks in the corporation "Blitz" received in 2011.
SELECT AVG(avg.counter) as average
FROM (
    SELECT l.tid, count(l.likeid) as counter
    FROM COMPANY AS c
        INNER JOIN DEPARTMENT AS d ON c.cid = d.cid
        INNER JOIN EMPLOYEE   AS e ON d.did = e.did
        INNER JOIN THANKS     AS t ON t.to  = e.eid
        INNER JOIN `LIKE`     AS l ON t.tid = l.tid
    WHERE c.cTitle = "Blitz"
    AND   YEAR(t.thanksdate) = 2011
    GROUP BY l.tid
) AS avg
;

-- Find the most awarded company value in "Blitz".
SELECT cv.value_type
FROM COMPANY AS c
    INNER JOIN DEPARTMENT    AS d  ON c.cid = d.cid
    INNER JOIN EMPLOYEE      AS e  ON d.did = e.did
    INNER JOIN THANKS        AS t  ON e.eid = t.to
    INNER JOIN COMPANY_VALUE AS cv ON t.vid = cv.vid
WHERE c.cTitle = "Blitz"
GROUP BY value_type
ORDER BY COUNT(VALUE_TYPE) DESC
LIMIT 1
;

