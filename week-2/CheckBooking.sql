USE `LittleLemonDM`;
DROP PROCEDURE IF EXISTS CheckBooking;

DELIMITER $$ 

CREATE PROCEDURE CheckBooking(IN BookDate DATE, IN TableNum INT)
BEGIN
    DECLARE bookingCount INT DEFAULT 0;
    SELECT COUNT(*) INTO bookingCount
    FROM Bookings
    WHERE `Date` = BookDate AND `TableNumber` = TableNum;

    IF bookingCount > 0 THEN
        SELECT CONCAT('Table ', TableNum, ' is already booked') AS 'Booking Status'; 
    ELSE
        SELECT CONCAT('Table ', TableNum, ' is available') AS 'Booking Status'; 
    END IF;
END$$

DELIMITER ;
