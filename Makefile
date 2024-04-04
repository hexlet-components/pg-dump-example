all: db-create schema-load data-load

schema-load:
	psql hexlet < schema.sql

data-load:
	psql hexlet < data/users.sql
	psql hexlet < data/topics.sql
	psql hexlet < data/courses.sql
	psql hexlet < data/course_members.sql
	psql hexlet < data/course_reviews.sql

	psql hexlet < data/authors.sql
	psql hexlet < data/books.sql
	psql hexlet < data/departments.sql
	psql hexlet < data/drivers_passengers_rides.sql
	psql hexlet < data/employees.sql
	psql hexlet < data/materials_and_colors.sql
	psql hexlet < data/orders_and_customers.sql

generate:
	node ./bin/load.js

db-reset:
	dropdb hexlet || true
	createdb hexlet

db-create:
	createdb hexlet || echo 'skip'

connect:
	psql -d hexlet

dev-setup: db-reset schema-load data-load

dev-docker-setup: dev-docker-build dev-docker-init

dev-docker-build:
	docker build . -t pg-dump-example

dev-docker-init:
	docker stop pg-dump-example || true
	docker rm pg-dump-example || true
	docker run -e POSTGRES_PASSWORD=password --name pg-dump-example -v `pwd`:/pg-dump-example pg-dump-example

dev-docker-attach:
	docker exec -it -w /pg-dump-example -u postgres pg-dump-example bash

install:
	npm install

lint:
	npx eslint .
