--@Author='Aditya Narayan'
-- Draw The Triangle 1
    DECLARE @i INT = 20
    WHILE(@i>0)
    BEGIN
    PRINT REPLICATE('* ', @i);
    SET @i = @i - 1;
    END