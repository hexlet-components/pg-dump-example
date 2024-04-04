DROP TABLE IF EXISTS topics;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id bigint PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  birthday DATE,
  email_confirmed BOOLEAN,
  email VARCHAR(255) UNIQUE NOT NULL,
  gender VARCHAR(255) NOT NULL,
  password_digest VARCHAR(255) NOT NULL,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  created_at TIMESTAMP NOT NULL
);

CREATE TABLE topics (
  id bigint PRIMARY KEY,
  user_id bigint REFERENCES users(id) NOT NULL,
  title varchar(255),
  body text,
  created_at TIMESTAMP NOT NULL
);

CREATE TABLE courses (
  id bigint PRIMARY KEY,
  name varchar(255),
  body text,
  created_at timestamp
);

CREATE TABLE course_members (
  id bigint PRIMARY KEY,
  user_id bigint REFERENCES users(id) NOT NULL,
  course_id bigint REFERENCES courses(id) NOT NULL,
  created_at timestamp
);

CREATE TABLE course_reviews (
  id bigint PRIMARY KEY,
  course_member_id bigint REFERENCES course_members(id) NOT NULL,
  course_id bigint REFERENCES courses(id) NOT NULL,
  user_id bigint REFERENCES users(id) NOT NULL,
  spent_minutes int NOT NULL,
  rating int,
  body text,
  created_at timestamp
);

CREATE TABLE colors (
    color_id INT PRIMARY KEY,
    color_name VARCHAR(50)
);

CREATE TABLE materials (
    material_id INT PRIMARY KEY,
    material_name VARCHAR(50)
);

CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(50),
    origin VARCHAR(50)
);

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    author_id INT,
    title VARCHAR(100),
    language VARCHAR(50),
    genre VARCHAR(50),
    age_rating VARCHAR(5),
    users_score DECIMAL(3, 1)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    name VARCHAR(50)
);


CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    department_id INT,
    name VARCHAR(50),
    salary DECIMAL(10, 2),
    position VARCHAR,
    manager_id int
);

CREATE TABLE drivers (
    driver_id INT PRIMARY KEY,
    driver_name VARCHAR(50),
    phone VARCHAR(15)
);

CREATE TABLE passengers (
    passenger_id INT PRIMARY KEY,
    passenger_name VARCHAR(50),
    phone VARCHAR(15)
);

CREATE TABLE rides (
    ride_id INT PRIMARY KEY,
    driver_id INT,
    passenger_id INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id),
    FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    total_price DECIMAL(10, 2)
);

CREATE TABLE order_items_1nf (
    id bigint PRIMARY KEY,
    first_name varchar(255),
    last_name varchar(255),
    address varchar(255),
    item varchar(255),
    price numeric
);

CREATE TABLE users_2nf (
    id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255)
);

CREATE TABLE goods_2nf (
    id	INT PRIMARY KEY,
    name	VARCHAR(255)
);

CREATE TABLE order_items_2nf (
    id	INT PRIMARY KEY,
    user_id	INT,
    address	VARCHAR(255),
    good_id	INT,
    price	NUMERIC
);

CREATE TABLE users_3nf (
    id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255)
);

CREATE TABLE goods_3nf (
    id	INT PRIMARY KEY,
    name	VARCHAR(255),
    price	NUMERIC
);

CREATE TABLE order_items_3nf (
    id	INT PRIMARY KEY,
    user_id	INT,
    address	VARCHAR(255),
    good_id	INT
);
