--@Author='Aditya Narayan'
-- Occupations
    SELECT [DOCTOR], [PROFESSOR], [SINGER], [ACTOR] FROM
        (SELECT ROW_NUMBER() OVER (PARTITION BY OCCUPATION ORDER BY NAME) ROW_NUM, [NAME], [OCCUPATION] FROM OCCUPATIONS) AS SOURCE 
    PIVOT
        ( MIN([NAME]) FOR [OCCUPATION] IN ([DOCTOR],[PROFESSOR],[SINGER],[ACTOR]) ) AS PVT
    ORDER BY ROW_NUM;