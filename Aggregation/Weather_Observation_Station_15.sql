--@Author='Aditya Narayan'
-- Weather Observation Station 15
    SELECT FORMAT(LONG_W, '#.0000') FROM STATION WHERE LAT_N = (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345);