INSERT INTO users_2nf (id, first_name, last_name) VALUES (2, 'Сергей', 'Иванов');
INSERT INTO users_2nf (id, first_name, last_name) VALUES (3, 'Иван', 'Петров');
INSERT INTO users_2nf (id, first_name, last_name) VALUES (5, 'Виктор', 'Сидоров');

INSERT INTO goods_2nf (id, name) VALUES (50, 'утюг');
INSERT INTO goods_2nf (id, name) VALUES (30, 'кофеварка');
INSERT INTO goods_2nf (id, name) VALUES (20, 'телевизор');
INSERT INTO goods_2nf (id, name) VALUES (33, 'ноутбук');

INSERT INTO order_items_2nf (id, user_id, address, good_id, price) VALUES
(8, 2, 'Москва, ул. Промышленная', 50, '1000.00'),
(2, 3, 'Самара, ул. Энгельса', 30, '5000.00'),
(7, 5, 'Омск, ул. Дворцовая', 50, '1000.00'),
(4, 5, 'Омск, ул. Дворцовая', 20, '6500.00'),
(9, 2, 'Москва, ул. Матросова', 33, '20000.00'),
(6, 2, 'Москва, ул. Матросова', 33, '20000.00');
