--@Author='Aditya Narayan'
-- Weather Observation Station 18
    -- MANHATTAN DISTANCE => The distance between two points measured along axes at right angles. In a plane with p1 at (x1, y1) and p2 at (x2, y2), it is |x1 - x2| + |y1 - y2|.
    WITH CTE AS
    (SELECT MIN(LAT_N) A, MIN(LONG_W) B, MAX(LAT_N) C, MAX(LONG_W) D FROM STATION)
    SELECT FORMAT((ABS(A-C) + ABS(B-D)), 'F4') FROM CTE;

	-- SELECT CAST(ABS(MIN(LAT_N)- MAX(LAT_N)) AS DECIMAL(10,4)) + CAST(ABS(MIN(LONG_W)- MAX(LONG_W)) AS DECIMAL(10,4)) FROM STATION;