// @ts-check

const crypto = require('crypto');
const _ = require('lodash');
const knex = require('knex');
const { faker } = require('@faker-js/faker');
const fs = require('fs');

const buildUser = ({ id }) => ({
  id,
  username: faker.internet.userName(),
  birthday: faker.date.past(),
  email: faker.internet.email(),
  gender: _.sample(['male', 'female']),
  first_name: faker.name.firstName(),
  last_name: faker.name.lastName(),
  password_digest: crypto.createHash('sha256').digest('hex'),
  created_at: faker.date.recent(),
});

const buildTopic = ({ id, user }) => ({
  id,
  user_id: user.id,
  title: faker.lorem.words(),
  body: faker.lorem.text(),
  created_at: faker.date.recent(),
});

const buildCourse = ({ id }) => ({
  id,
  name: faker.lorem.words(),
  body: faker.lorem.text(),
  created_at: faker.date.recent(),
});

const buildCourseMember = ({ id, user, course }) => ({
  id,
  user_id: user.id,
  course_id: course.id,
  created_at: faker.date.recent(),
});

const createSqlForTable = (client) => {
  const result = {
    users: [],
    topics: [],
    courses: [],
    course_members: [],
  };

  for (let i = 1; i < 100; i += 1) {
    const user = buildUser({ id: i });
    result.users.push(user);
  }

  for (let i = 1; i < 50; i += 1) {
    const user = _.sample(result.users);
    const topic = buildTopic({ user, id: i });
    result.topics.push(topic);
  }

  for (let i = 1; i < 100; i += 1) {
    const course = buildCourse({ id: i });
    result.courses.push(course);
  }

  for (let i = 1; i < 50; i += 1) {
    const user = _.sample(result.users);
    const course = _.sample(result.courses);
    const item = buildCourseMember({ id: i, user, course });
    result.course_members.push(item);
  }

  _.forEach(result, (rows, tableName) => {
    const sql = rows.map((row) => client(tableName).insert(row).toString());
    fs.writeFileSync(`${tableName}.sql`, sql.join(';\n'));
  });
};

module.exports = () => {
  const client = knex({ client: 'pg' });
  createSqlForTable(client);
};
