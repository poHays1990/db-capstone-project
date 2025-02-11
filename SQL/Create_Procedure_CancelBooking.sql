DROP PROCEDURE IF EXISTS capstone_module4.CancelBooking;

CREATE PROCEDURE capstone_module4.CancelBooking()
BEGIN
    DELETE FROM capstone_module4.orders WHERE id = 2048;
END;