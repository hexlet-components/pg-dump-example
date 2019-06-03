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

DROP TABLE IF EXISTS topics;
CREATE TABLE topics (
  id bigint PRIMARY KEY,
  user_id bigint REFERENCES users(id) NOT NULL,
  title varchar(255),
  body text,
  created_at TIMESTAMP NOT NULL
);
