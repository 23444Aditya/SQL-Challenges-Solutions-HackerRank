--@Author='Aditya Narayan'
-- Weather Observation Station 2
	SELECT FORMAT(ROUND(SUM(LAT_N),2),'F2') lat,
		   FORMAT(ROUND(SUM(LONG_W),2),'#.00') lon
	FROM STATION;
	
	--SELECT CAST(SUM(LAT_N) AS DECIMAL(10,2)) AS lat, CAST(SUM(LONG_W) AS DECIMAL(10,2)) AS lon FROM STATION;
	--select round(sum(lat_n),2) as lat, round(sum(long_w),2) as lon from station;