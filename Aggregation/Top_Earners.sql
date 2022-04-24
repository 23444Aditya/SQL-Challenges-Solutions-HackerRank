--@Author='Aditya Narayan'
-- Top Earners
    SELECT TOP 1 (SALARY * MONTHS) AS "Total Earning", COUNT(*)
    FROM EMPLOYEE
    GROUP BY SALARY * MONTHS
    ORDER BY "Total Earning" DESC;