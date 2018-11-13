all: load-schema load-data

load-schema:
	psql hexlet < schema.sql

load-data:
	psql hexlet < data.sql
