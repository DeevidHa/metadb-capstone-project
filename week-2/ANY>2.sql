USE `LittleLemonDM`;
SELECT CuisineType 
FROM Menu 
WHERE 
MenuID = ANY (SELECT MenuID FROM Orders WHERE Quantity > 2); 