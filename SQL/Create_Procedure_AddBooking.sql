DROP PROCEDURE IF EXISTS capstone_module4.AddBooking;

CREATE PROCEDURE capstone_module4.AddBooking()
BEGIN
    -- Insert ingredients if they don’t exist
    INSERT INTO capstone_module4.starters (name) 
    SELECT 'chips' 
    WHERE NOT EXISTS (
        SELECT 1 FROM capstone_module4.starters WHERE name = 'chips'
    );

    INSERT INTO capstone_module4.desert (name) 
    SELECT 'éclaire au chocolat' 
    WHERE NOT EXISTS (
        SELECT 1 FROM capstone_module4.desert WHERE name = 'éclaire au chocolat'
    );

    INSERT INTO capstone_module4.drinks (name) 
    SELECT 'orangina' 
    WHERE NOT EXISTS (
        SELECT 1 FROM capstone_module4.drinks WHERE name = 'orangina'
    );

    INSERT INTO capstone_module4.sides (name) 
    SELECT 'olives' 
    WHERE NOT EXISTS (
        SELECT 1 FROM capstone_module4.sides WHERE name = 'olives'
    );


    -- Insert into `dish`
     INSERT INTO capstone_module4.dish (order_id, starter_id, desert_id, drink_id, side_id)
    SELECT 
        '54-366-6869',
        (SELECT id FROM capstone_module4.starters WHERE name = 'chips'),
        (SELECT id FROM capstone_module4.desert WHERE name = 'éclaire au chocolat'),
        (SELECT id FROM capstone_module4.drinks WHERE name = 'orangina'),
        (SELECT id FROM capstone_module4.sides WHERE name = 'olives')
	WHERE NOT EXISTS (
        SELECT 1 FROM capstone_module4.dish WHERE order_id = '54-366-6861'
    );



    -- Insert into `orders`
    INSERT INTO capstone_module4.orders 
    (order_id, order_date, delivery_date, costs, sales, quantity, discount, delivery_cost, dish_id, customer_id)
    VALUES ('54-366-6861', '2020-06-15 00:00:00', '2020-03-26 00:00:00', 
            '125', '187', '2', '20', '60', 
            (select id from capstone_module4.dish where order_id='54-366-6869')
            , '72');
END;
