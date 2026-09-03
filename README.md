# pg-dump-example

[![github action status](https://github.com/hexlet-components/pg-dump-example/workflows/Node%20CI/badge.svg)](https://github.com/hexlet-components/pg-dump-example/actions)

## Зачем это нужно

База с реальными данными для курсов по SQL: пользователи, курсы, заказы, сотрудники, а также схемы под разбор нормализации (1NF, 2NF, 3NF).

Нужна, чтобы писать запросы к чему-то осмысленному, а не к таблице из трёх строк. Разворачивается одной командой локально или в докере.

## Requirements

- Installed PostgreSQL and Git
- Created database with name `hexlet`
- Created role with name of your system user ([roles and grant permissions in PostgreSQL](https://www.digitalocean.com/community/tutorials/how-to-use-roles-and-manage-grant-permissions-in-postgresql-on-a-vps-2))

## Install

```bash
git clone https://github.com/hexlet-components/pg-dump-example.git
cd pg-dump-example
# load schema and insert data
make # see Makefile for details
```

[![Hexlet Ltd. logo](https://raw.githubusercontent.com/Hexlet/assets/master/images/hexlet_logo128.png)](https://hexlet.io?utm_source=github&utm_medium=link&utm_campaign=pg-dump-example)

This repository is created and maintained by the team and the community of Hexlet, an educational project. [Read more about Hexlet](https://hexlet.io?utm_source=github&utm_medium=link&utm_campaign=pg-dump-example).

See most active contributors on [hexlet-friends](https://friends.hexlet.io/).
