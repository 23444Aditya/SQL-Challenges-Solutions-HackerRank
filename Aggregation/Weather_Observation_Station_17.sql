--@Author='Aditya Narayan'
-- Weather Observation Station 17
    SELECT FORMAT(LONG_W, 'F4') FROM STATION WHERE LAT_N = (SELECT MIN(LAT_N) FROM STATION WHERE LAT_N > 38.7880);