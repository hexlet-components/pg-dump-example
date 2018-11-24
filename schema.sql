DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id serial PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  birthday DATE,
  email VARCHAR(255) UNIQUE NOT NULL,
  password_digest VARCHAR(255) NOT NULL,
  first_name VARCHAR(50),
  created_at TIMESTAMP NOT NULL
);
