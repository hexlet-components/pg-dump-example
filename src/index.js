// @ts-check

import crypto from 'crypto';
import _ from 'lodash';
import knex from 'knex';
import { faker } from '@faker-js/faker';
import fs from 'fs';

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

const buildCourseReview = ({ id, courseMember, course }) => ({
  id,
  course_member_id: courseMember.id,
  course_id: course.id,
  spent_minutes: faker.datatype.number({ min: 1, max: 100 }),
  rating: _.sample([1, 2, 3, 4, 5]),
  created_at: faker.date.recent(),
});

const createSqlForTable = (client) => {
  const result = {
    users: [],
    topics: [],
    courses: [],
    course_members: [],
    course_reviews: [],
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
    const courseMember = buildCourseMember({ id: i, user, course });
    result.course_members.push(courseMember);

    const courseReview = buildCourseReview({ id: i, courseMember, course });
    result.course_reviews.push(courseReview);
  }

  _.forEach(result, (rows, tableName) => {
    const sql = rows.map((row) => client(tableName).insert(row).toString());
    fs.writeFileSync(`${tableName}.sql`, sql.join(';\n'));
  });
};

export default () => {
  const client = knex({ client: 'pg' });
  createSqlForTable(client);
};
