DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id serial PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  email VARCHAR(355) UNIQUE NOT NULL,
  password_digest VARCHAR(50) NOT NULL,
  first_name VARCHAR(50),
  created_at TIMESTAMP NOT NULL
);
