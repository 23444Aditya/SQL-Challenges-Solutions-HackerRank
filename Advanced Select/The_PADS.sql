--@Author='Aditya Narayan'
-- The PADS
	SELECT NAME+"("+LEFT(OCCUPATION,1)+")" FROM OCCUPATIONS ORDER BY NAME ASC;
	SELECT "There are a total of " + STR(COUNT(OCCUPATION)) + " " +LOWER(OCCUPATION) +"s." 
    FROM OCCUPATIONS 
    GROUP BY OCCUPATION
    ORDER BY COUNT(OCCUPATION),OCCUPATION;