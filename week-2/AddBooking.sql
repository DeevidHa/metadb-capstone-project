USE `LittleLemonDM`;

DROP PROCEDURE IF EXISTS AddBooking;
DELIMITER $$

CREATE PROCEDURE AddBooking(IN BookingID INT, IN CustomerID INT, IN BookDate DATETIME, IN StaffID INT, IN TableNumber INT)
BEGIN
    INSERT INTO Bookings (BookingID, CustomerID, BookDate, StaffID, TableNumber)
    VALUES (BookingID, CustomID, BookDate, StaffID, TableNumber);
    SELECT CONCAT("New Booking Added: ", BookingID) AS Confirmation;
END$$

DELIMITER ;
CALL AddBooking(10101, 15101, '2024-02-25 20:00:00', 15, 3);
