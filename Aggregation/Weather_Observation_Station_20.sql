--@Author='Aditya Narayan'
-- Weather Observation Station 20
	SELECT CAST(
	(
		(SELECT MAX(LAT_N) FROM (SELECT TOP 50 PERCENT LAT_N FROM STATION ORDER BY LAT_N) AS BottomHalf)
		+
		(SELECT MIN(LAT_N) FROM (SELECT TOP 50 PERCENT LAT_N FROM STATION ORDER BY LAT_N DESC) AS TopHalf)
	) / 2 AS DECIMAL(10,4))
	AS Median