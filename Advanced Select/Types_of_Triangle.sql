--@Author='Aditya Narayan'
-- Type of Triangle
	SELECT CASE
    	WHEN A+B>C AND B+C>A AND A+C>B THEN
		CASE
			WHEN A=B AND B=C AND C=A THEN 'Equilateral'
			WHEN A=B OR B=C OR C=A THEN 'Isosceles'
			ELSE 'Scalene'
		END
		ELSE 'Not A Triangle'
	END
	FROM TRIANGLES;
