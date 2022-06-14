all: schema-load data-load

schema-load:
	psql hexlet < schema.sql

data-load:
	psql hexlet < users.sql
	psql hexlet < topics.sql
	psql hexlet < courses.sql
	psql hexlet < course_members.sql

generate:
	node ./bin/load.js

db-reset:
	dropdb hexlet || true
	createdb hexlet

db-create:
	createdb hexlet

dev-setup: db-reset schema-load data-load

dev-docker-build:
	docker build . -t pg-dump-example

dev-docker-init:
	docker rm pg-dump-example || true
	docker run -e POSTGRES_PASSWORD=password --name pg-dump-example -v `pwd`:/pg-dump-example pg-dump-example

dev-docker-attach:
	docker exec -it -w /pg-dump-example -u postgres pg-dump-example bash

install:
	npm install

lint:
	npx eslint .
