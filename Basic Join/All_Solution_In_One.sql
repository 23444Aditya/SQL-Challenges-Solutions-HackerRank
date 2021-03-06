--@Author='Aditya Narayan'
-- Population Census
	SELECT SUM(C.POPULATION) FROM CITY C INNER JOIN COUNTRY CO ON C.COUNTRYCODE = CO.CODE
	WHERE CO.CONTINENT = 'Asia';

-- African Cities
    SELECT C.NAME FROM CITY C INNER JOIN COUNTRY CO ON C.COUNTRYCODE = CO.CODE
    WHERE CO.CONTINENT = 'Africa';

-- Average Population of Each Continent
    SELECT CO.CONTINENT, ROUND(AVG(C.POPULATION), 0) FROM CITY C INNER JOIN COUNTRY CO ON C.COUNTRYCODE = CO.CODE
    GROUP BY CO.CONTINENT;

-- The Report
	-- Example of equi join 
    SELECT IIF(GRADE < 8, NULL, NAME), GRADE, MARKS FROM STUDENTS JOIN GRADES ON (MARKS >= MIN_MARK AND MARKS <= MAX_MARK)
	ORDER BY GRADE DESC, NAME;
	
-- Top Competitors
	SELECT H.HACKER_ID, H.NAME FROM SUBMISSIONS S 
								INNER JOIN CHALLENGES C ON S.CHALLENGE_ID = C.CHALLENGE_ID
								INNER JOIN DIFFICULTY D ON C.DIFFICULTY_LEVEL = D.DIFFICULTY_LEVEL
								INNER JOIN HACKERS H ON S.HACKER_ID = H.HACKER_ID
	WHERE S.SCORE = D.SCORE AND C.DIFFICULTY_LEVEL = D.DIFFICULTY_LEVEL
	GROUP BY H.HACKER_ID, H.NAME
	HAVING COUNT(S.HACKER_ID) > 1
	ORDER BY COUNT(S.HACKER_ID) DESC, H.HACKER_ID ASC;

-- Ollivander's Inventory
	SELECT W.ID, WP.AGE, W.COINS_NEEDED, W.POWER FROM WANDS AS W JOIN WANDS_PROPERTY AS WP ON (W.CODE = WP.CODE)
	WHERE WP.IS_EVIL = 0 AND W.COINS_NEEDED =
			(
				SELECT MIN(COINS_NEEDED) FROM WANDS AS W1 JOIN WANDS_PROPERTY AS WP1 ON (W1.CODE = WP1.CODE)
				WHERE W1.POWER = W.POWER AND WP1.AGE = WP.AGE
			)
	ORDER BY W.POWER DESC, WP.AGE DESC;

-- Contest Leaderboard
	SELECT H.*, SUM(INNERSCORE) AS TOTAL FROM 
		(  
			SELECT HACKER_ID, CHALLENGE_ID, MAX(SCORE) AS INNERSCORE FROM SUBMISSIONS
			GROUP BY HACKER_ID, CHALLENGE_ID
		)S
		INNER JOIN HACKERS H ON S.HACKER_ID = H.HACKER_ID
	GROUP BY H.HACKER_ID, H.NAME
	HAVING SUM(INNERSCORE) > 0
	ORDER BY SUM(INNERSCORE) DESC, H.HACKER_ID;