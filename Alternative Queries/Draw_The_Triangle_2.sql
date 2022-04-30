--@Author='Aditya Narayan'
-- Draw The Triangle 2
    DECLARE @i INT = 1
    WHILE(@i <= 20)
    BEGIN
    PRINT REPLICATE('* ', @i);
    SET @i = @i +1 ;
    END