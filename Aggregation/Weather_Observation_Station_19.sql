--@Author='Aditya Narayan'
-- Weather Observation Station 19
    -- EUCLIDIAN DISTANCE => In the Euclidean plane, let point p have Cartesian coordinates (p1,p2) and let point q have coordinates (q1,q2). Then the distance between p and q is given by: SQRT( (q1 - p1)^2 + (q2 - p2)^2 )
    -- p1==A , p2==C , q1==B , q2==D
    WITH CTE AS (SELECT MIN(LAT_N) A, MAX(LAT_N) B, MIN(LONG_W) C, MAX(LONG_W) D FROM STATION)
    SELECT FORMAT(SQRT( POWER((B-A),2) + POWER((D-C),2) ), 'F4') FROM CTE;
	
	-- SELECT CAST(SQRT(SQUARE(MAX(LAT_N)- MIN(LAT_N)) + SQUARE(MAX(LONG_W)- MIN(LONG_W))) AS DECIMAL(10,4)) FROM STATION;