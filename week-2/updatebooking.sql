USE `LittleLemonDM`;

DROP PROCEDURE IF EXISTS UpdateBooking;
DELIMITER $$

CREATE PROCEDURE UpdateBooking(IN BookingID INT, IN BookDate DATE) 
BEGIN
	UPDATE Bookings SET BookDate = BookDate WHERE BookingID = BookingID; 
	SELECT CONCAT("Booking ", BookingID, " updated") AS "Confirmation"; 
END$$
 
DELIMITER ; 

Call UpdateBooking(10100, '2024-02-25 21:00:00');