USE `LittleLemonDM`;
DROP PROCEDURE IF EXISTS AddValidBooking;
DELIMITER $$ 

CREATE PROCEDURE AddValidBooking(IN BookDate DATE, IN TableNum INT, IN CustomID INT)
BEGIN
    DECLARE bookingCount INT DEFAULT 0;
    
    -- Check for existing bookings for the given date and table number before starting the transaction
    SELECT COUNT(*) INTO bookingCount
    FROM Bookings
    WHERE `BookDate` = BookDate AND `TableNumber` = TableNum;

    -- Start the transaction after the check
    START TRANSACTION;

    IF bookingCount = 0 THEN
        -- If no existing booking is found, proceed to insert the new booking
        INSERT INTO Bookings (`Date`, `TableNumber`, `CustomerID`)
        VALUES (BookDate, TableNum, CustomID);
        
        -- Commit the transaction to save the new booking
        COMMIT;
        SELECT 'Booking successful.' AS Message;
    ELSE
        -- If an existing booking is found, rollback any changes made during the transaction (if any)
        ROLLBACK;
        SELECT CONCAT("Table ", TableNum, " is already booked - booking cancelled") AS "Booking Status";
    END IF;
END$$

DELIMITER ; 


CALL AddValidBooking('2024-02-01 20:00:00', 5, 15001);
#Output:
# Booking Status
#'Table 5 is already booked - booking cancelled'
