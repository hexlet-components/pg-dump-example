INSERT INTO drivers (driver_id, driver_name, phone) VALUES
(1, 'Иванов А.Б.', '+71112223344'),
(2, 'Петрова В.Г.', '+71113334455');

INSERT INTO passengers (passenger_id, passenger_name, phone) VALUES
(101, 'Орлов Д.Е.', '+72229998877'),
(102, 'Соколова Ж.З.', '+72228889900'),
(103, 'Ястребов И.К.', '+73339995566');

INSERT INTO rides (ride_id, driver_id, passenger_id, price) VALUES
(1001, 1, 101, 567),
(1002, 1, 102, 234),
(1003, 2, 103, 1234),
(1004, 2, 103, 765);
