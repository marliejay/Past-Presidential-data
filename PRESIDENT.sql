SELECT *
FROM president;

-- TRIMMING VICE PRESIDENT NAMES
UPDATE president
SET vice= trim(vice);

-- DELETING COLUMN
ALTER TABLE president
DROP COLUMN MyUnknownColumn; 

-- ADJUSTING NAMES FOR UNIFORMITY
UPDATE president
SET president=ucase(president);

-- TRIMMING PRESIDENT NAMES
UPDATE president
SET vice = REGEXP_REPLACE(TRIM(vice), ' +', ' ');

SELECT date_updated,
COALESCE(
	STR_TO_DATE(date_updated, '%W,%M %d, %Y'),
	STR_TO_DATE(date_updated, '%m/%d/%Y')) new_date
FROM president;


SELECT date_updated,
    COALESCE(
  STR_TO_DATE(date_updated, '%m/%d/%Y') ,
  STR_TO_DATE(date_updated, '%W,%M %e,%Y') ) datee
  FROM president;

UPDATE president
SET date_updated = STR_TO_DATE(date_updated, '%W,%M %e,%Y');

UPDATE president
SET 
    date_updated = COALESCE(
        STR_TO_DATE(date_updated, '%m/%d/%Y'),
        STR_TO_DATE(date_updated, '%W, %M %e, %Y')
    );

UPDATE president
SET 
    date_updated = CASE
        WHEN date_updated LIKE '%/%' THEN STR_TO_DATE(date_updated, '%m/%d/%Y')
        WHEN date_updated LIKE '%,%' THEN STR_TO_DATE(date_updated, '%W, %M %e, %Y')
        ELSE date_updated
    END;

-- SETTING APPROPRIATE DATE VALUES
UPDATE president
SET 
    date_created = CASE
        WHEN date_created LIKE '%/%' THEN STR_TO_DATE(date_created, '%m/%d/%Y')
        WHEN date_created LIKE '%,%' THEN STR_TO_DATE(date_created, '%W, %M %e, %Y')
        ELSE date_created
    END;

ALTER TABLE president
DROP COLUMN datee; 

SELECT DISTINCT party
FROM president; 

-- FIXING WRONG NAMING CONVENTIONS
UPDATE president
set party= 'Whig'
where party= 'Whig   April 4, 1841  â€“  September 13, 1841';

UPDATE president
set party= 'Democratic'
where party= 'Demorcatic';

UPDATE president
set party= 'Republican'
where party= 'Republicans';

UPDATE president
set party= 'Non-partisan'
where party= 'Nonpartisan';

UPDATE president
set prior= ' to'
where party= 'â€“';









   