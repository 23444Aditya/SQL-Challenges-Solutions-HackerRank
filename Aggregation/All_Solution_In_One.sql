--@Author='Aditya Narayan'
-- Revising Aggregations - The Count Function
    SELECT COUNT(NAME) FROM CITY WHERE POPULATION > 100000;
	
-- Revising Aggregations - The Sum Function
    SELECT SUM(POPULATION) FROM CITY WHERE DISTRICT = 'California';
	
-- Revising Aggregations - Averages
    SELECT AVG(POPULATION) FROM CITY WHERE DISTRICT = 'California';
	
-- Average Population
    SELECT CAST(AVG(POPULATION) AS INTEGER) FROM CITY;

-- Japan Population
    SELECT SUM(POPULATION) FROM CITY WHERE COUNTRYCODE = 'JPN';
	
-- Population Density Difference
    SELECT MAX(POPULATION) - MIN(POPULATION) FROM CITY;
	--SELECT (MAX(POPULATION)-MIN(POPULATION)) AS DIFFERENCE FROM CITY;

-- The Blunder
    SELECT CAST(CEILING(AVG(CAST(SALARY AS FLOAT)) - AVG(CAST(REPLACE(SALARY, 0, '') AS FLOAT))) AS INT) FROM EMPLOYEES;

-- Top Earners
    SELECT TOP 1 (SALARY * MONTHS) AS "Total Earning", COUNT(*)
    FROM EMPLOYEE
    GROUP BY SALARY * MONTHS
    ORDER BY "Total Earning" DESC;
	
-- Weather Observation Station 2
	SELECT FORMAT(ROUND(SUM(LAT_N),2),'F2') lat,
		   FORMAT(ROUND(SUM(LONG_W),2),'#.00') lon
	FROM STATION;
	
	--SELECT CAST(SUM(LAT_N) AS DECIMAL(10,2)) AS lat, CAST(SUM(LONG_W) AS DECIMAL(10,2)) AS lon FROM STATION;
	--select round(sum(lat_n),2) as lat, round(sum(long_w),2) as lon from station;

-- Weather Observation Station 13
    SELECT FORMAT(SUM(LAT_N), 'F4') FROM STATION WHERE LAT_N BETWEEN 38.7880 AND 137.2345;
	-- SELECT CAST(SUM(LAT_N) AS DECIMAL(9, 4)) FROM STATION WHERE LAT_N > 38.7880 AND LAT_N < 137.2345;
	
-- Weather Observation Station 14
    SELECT FORMAT(MAX(LAT_N), '#.0000') FROM STATION WHERE LAT_N < 137.2345;
	-- SELECT CAST(MAX(LAT_N) AS DECIMAL(9,4)) FROM STATION WHERE LAT_N < 137.2345;
	
-- Weather Observation Station 15
    SELECT FORMAT(LONG_W, '#.0000') FROM STATION WHERE LAT_N = (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345);

-- Weather Observation Station 16
    SELECT FORMAT(MIN(LAT_N), '#.0000') FROM STATION WHERE LAT_N > 38.7880;
	
-- Weather Observation Station 17
    SELECT FORMAT(LONG_W, 'F4') FROM STATION WHERE LAT_N = (SELECT MIN(LAT_N) FROM STATION WHERE LAT_N > 38.7880);
	
-- Weather Observation Station 18
    -- MANHATTAN DISTANCE => The distance between two points measured along axes at right angles. In a plane with p1 at (x1, y1) and p2 at (x2, y2), it is |x1 - x2| + |y1 - y2|.
    WITH CTE AS
    (SELECT MIN(LAT_N) A, MIN(LONG_W) B, MAX(LAT_N) C, MAX(LONG_W) D FROM STATION)
    SELECT FORMAT((ABS(A-C) + ABS(B-D)), 'F4') FROM CTE;

	-- SELECT CAST(ABS(MIN(LAT_N)- MAX(LAT_N)) AS DECIMAL(10,4)) + CAST(ABS(MIN(LONG_W)- MAX(LONG_W)) AS DECIMAL(10,4)) FROM STATION;

-- Weather Observation Station 19
    -- EUCLIDIAN DISTANCE => In the Euclidean plane, let point p have Cartesian coordinates (p1,p2) and let point q have coordinates (q1,q2). Then the distance between p and q is given by: SQRT( (q1 - p1)^2 + (q2 - p2)^2 )
    -- p1==A , p2==C , q1==B , q2==D
    WITH CTE AS (SELECT MIN(LAT_N) A, MAX(LAT_N) B, MIN(LONG_W) C, MAX(LONG_W) D FROM STATION)
    SELECT FORMAT(SQRT( POWER((B-A),2) + POWER((D-C),2) ), 'F4') FROM CTE;
	
	-- SELECT CAST(SQRT(SQUARE(MAX(LAT_N)- MIN(LAT_N)) + SQUARE(MAX(LONG_W)- MIN(LONG_W))) AS DECIMAL(10,4)) FROM STATION;

-- Weather Observation Station 20
	SELECT CAST(
	(
		(SELECT MAX(LAT_N) FROM (SELECT TOP 50 PERCENT LAT_N FROM STATION ORDER BY LAT_N) AS BottomHalf)
		+
		(SELECT MIN(LAT_N) FROM (SELECT TOP 50 PERCENT LAT_N FROM STATION ORDER BY LAT_N DESC) AS TopHalf)
	) / 2 AS DECIMAL(10,4))
	AS Median
