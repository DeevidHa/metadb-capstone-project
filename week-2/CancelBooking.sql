USE `LittleLemonDM`;
DROP PROCEDURE IF EXISTS CancelBooking;
DELIMITER $$
CREATE PROCEDURE CancelBooking(IN BookingID INT)
BEGIN
DELETE FROM Bookings WHERE BookingID = BookINGID;
SELECT CONCAT("Booking ", BookID, " cancelled") AS "Confirmation"; 
END//

DELIMITER ;

#----
CALL CancelBooking(10100);