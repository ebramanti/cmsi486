-- List the names of all employees in the company ``I Love Thanks".
SELECT e.name
FROM company as c
INNER JOIN department as d
ON c.cid = d.cid
INNER JOIN employee as e
ON d.did = e.did
WHERE c.cTitle = "I Love Thanks"
;

-- Show all department names in the corporation "Blitz".
SELECT d.depTitle
FROM company AS c
INNER JOIN department as d
ON c.cid = d.cid
WHERE c.cTitle = "Blitz"
;

-- Return a list of all employees in the database who have nicknames.
SELECT e.name, e.nickname
FROM employee AS e
WHERE EXISTS (
    SELECT e.nickname
    FROM employee
)
;

-- Show names of employees who do not have photos in the ``I Love Thanks" company.
SELECT e.name
FROM company as c
INNER JOIN department as d
ON c.cid = d.cid
INNER JOIN employee as e
ON d.did = e.did
WHERE c.photo IS NULL
AND c.cTitle = "I Love Thanks"
;


-- Show all department heads in "Insomniac Corporation".
SELECT dh
FROM company as c
INNER JOIN department as d
ON c.cid = d.cid
INNER JOIN department_head as dh
ON d.headid = dh.headid
WHERE c.cTitle = "Insomniac Corporation"
;

-- Show all of the Thanks that Julia Crow from "Playa Medical" gave.
SELECT t
FROM company as c
INNER JOIN department as d
ON c.cid = d.cid
INNER JOIN employee as e
ON d.did = e.did
INNER JOIN thanks as t
ON t.from = e.eid
WHERE c.cTitle = "Playa Medical"
AND e.name = "Julia Crow"
;

-- Show all of the Thanks that Emma Cross from "Boeing" received.
SELECT t
FROM company as c
INNER JOIN department as d
ON c.cid = d.cid
INNER JOIN employee as e
ON d.did = e.did
INNER JOIN thanks as t
ON t.from = e.eid
WHERE c.cTitle = "Boeing"
AND e.name = "Julia Crow"
;

-- Show all thanks that have been given in the corporation "First America".
SELECT t
FROM company as c
INNER JOIN department as d
ON c.cid = d.cid
INNER JOIN employee as e
ON d.did = e.did
INNER JOIN thanks as t
ON t.to = e.eid
WHERE c.cTitle = "First America"
;

-- Who is the newest employee to have joined the company "Lightning Corporation"?
SELECT e.name
FROM company as c
INNER JOIN department as d
ON c.cid = d.cid
INNER JOIN employee as e
ON d.did = e.did
WHERE c.cTitle = "Lightning Corporation"
AND e.started = (
    SELECT MAX(e.started)
    FROM company as c
    INNER JOIN department as d
    ON c.cid = d.cid
    INNER JOIN employee as e
    ON d.did = e.eid
    WHERE c.cTitle = "Lightning Corporation"
)
;


-- List all thanks posted in the database in October.
SELECT t
FROM thanks as t
WHERE MONTHNAME(t.thanksdate) = "October"
;



-- List the executives' info in the company ``I Love Thanks".
SELECT e
FROM company as c
INNER JOIN executive as e
ON c.cid = e.cid
WHERE c.cTitle = "I Love Thanks"
;






