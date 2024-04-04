INSERT INTO customers (customer_id, customer_name, email) VALUES
(1, 'Иванов А.Б.', 'ivanov@email.com'),
(2, 'Петрова В.Г.', 'petrova@email.com'),
(3, 'Сидоров Ж.З.', 's_idorov@email.com');

INSERT INTO orders (order_id, customer_id, total_price) VALUES
(1000, 1, 100),
(1001, 1, 500),
(1002, 3, 300);
