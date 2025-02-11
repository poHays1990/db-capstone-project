


INSERT INTO capstone_module4.city ( `city_name`, `country_name`, `postal_code`, `country_code`)
SELECT 
`City`,
`Country`,
`Postal Code`,
`Country Code`
FROM capstone_module4.data;

INSERT INTO capstone_module4.customer (`customer_old_id`, `customer_name`, `city_id`)
SELECT 
    d.`Customer ID`, 
    d.`Customer Name`, 
    c.`id`  -- Récupère l'ID de la ville
FROM capstone_module4.data d
JOIN capstone_module4.city c 
    ON d.`City` = c.`city_name` 
    AND d.`Country` = c.`country_name`;  -- S'assure que la correspondance est correcte



INSERT INTO capstone_module4.starters (`name`)
SELECT DISTINCT `Starter Name`
FROM capstone_module4.data;

INSERT INTO capstone_module4.desert (`name`)
SELECT DISTINCT `Desert Name`
FROM capstone_module4.data;

INSERT INTO capstone_module4.drinks (`name`)
SELECT DISTINCT `Drink`
FROM capstone_module4.data;

INSERT INTO capstone_module4.sides (`name`)
SELECT DISTINCT `Sides`
FROM capstone_module4.data;





INSERT INTO capstone_module4.dish (`order_id`, `starter_id`, `desert_id`, `drink_id`, `side_id`)
SELECT 
    dt.`Order ID` AS order_id,
    s.id AS starter_id,
    d.id AS desert_id,
    dr.id AS drink_id,
    si.id AS side_id
FROM capstone_module4.data dt
LEFT JOIN capstone_module4.starters s ON dt.`Starter Name` = s.name
LEFT JOIN capstone_module4.desert d ON dt.`Desert Name` = d.name
LEFT JOIN capstone_module4.drinks dr ON dt.`Drink` = dr.name
LEFT JOIN capstone_module4.sides si ON dt.`Sides` = si.name;



INSERT INTO capstone_module4.orders ( `order_id`, `order_date`, `delivery_date`, `costs`, `sales`, `quantity`, `discount`,
`delivery_cost`, `dish_id`, `customer_id`)
SELECT 
d.`Order ID`, 
STR_TO_DATE(d.`Order Date`, '%d/%m/%Y'),  
STR_TO_DATE(d.`Delivery Date`, '%d/%m/%Y'),  
CAST(REPLACE(d.` Cost`, '.', ',') AS DECIMAL(10,2)), 
CAST(REPLACE(d.`Sales`, '.', ',') AS DECIMAL(10,2)), 
d.`Quantity`,
CAST(REPLACE(d.`Discount`, '.', ',') AS DECIMAL(5,2)), 
CAST(REPLACE(d.`Delivery Cost`, '.', ',') AS DECIMAL(10,2)),
dish.id,
c.`id`
FROM capstone_module4.data d
JOIN capstone_module4.customer c
ON d.`Customer ID` = c.customer_old_id
JOIN capstone_module4.dish
ON d.`Order ID` = dish.order_id;
