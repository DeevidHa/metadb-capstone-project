USE `LittleLemonDM`;

SELECT 
    c.CustomerID, 
    c.Name AS FullName, 
    o.OrderID, 
    o.TotalCost, 
    m.Starter, 
    m.CuisineType
FROM 
    Customers AS c 
    INNER JOIN Orders AS o ON c.CustomerID = o.CustomerID
    INNER JOIN Menu AS m ON o.MenuID = m.MenuID
-- WHERE 
--     o.TotalCost > 150
-- ORDER BY 
--     o.TotalCost ASC;
