const crypto = require('crypto');
const _ = require('lodash');
const knex = require('knex');
const faker = require('faker');
const fs = require('fs');

const buildUser = () => ({
  username: faker.internet.userName(),
  birthday: faker.date.past(),
  email: faker.internet.email(),
  gender: _.sample(['male', 'female']),
  first_name: faker.name.firstName(),
  password_digest: crypto.createHash('sha256').digest('hex'),
  created_at: faker.date.recent(),
});

const createSqlForTable = (client, name, generate) => {
  const result = [];
  for (let i = 1; i < 100; i += 1) {
    const user = client(name).insert(generate()).toString();
    result.push(user);
  }
  fs.writeFileSync(`${name}.sql`, result.join(';\n'));
};

module.exports = () => {
  const client = knex({ client: 'pg' });
  createSqlForTable(client, 'users', buildUser);
};
