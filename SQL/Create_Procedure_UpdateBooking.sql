DROP PROCEDURE IF EXISTS capstone_module4.UpdateBooking;

CREATE PROCEDURE capstone_module4.UpdateBooking()
BEGIN
    UPDATE capstone_module4.orders
    SET delivery_date = '2020-06-18 00:00:00'
    WHERE order_id = '54-366-6861';
END;
