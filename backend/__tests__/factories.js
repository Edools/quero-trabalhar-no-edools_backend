import faker from 'faker';
import { factory } from 'factory-girl';

import User from '../src/app/models/User';
import School from '../src/app/models/School';
import Course from '../src/app/models/Course';
import Student from '../src/app/models/Student';

factory.define('User', User, {
  name: faker.name.findName(),
  email: faker.internet.email(),
  password: faker.internet.password(),
});

factory.define('School', School, {
  name: faker.company.companyName(),
  email: faker.internet.email(),
  password: faker.internet.password(),
  pitch: faker.lorem.sentence(),
  subdomain: faker.internet.domainSuffix(),
});

factory.define('Course', Course, {
  title: faker.lorem.sentence(),
  description: faker.lorem.sentence(),
  content: faker.lorem.sentence(),
  duration: faker.random.number({
    min: 20,
    max: 500,
  }),
  price: faker.finance.amount(),
});

factory.define('Student', Student, {
  name: faker.name.findName(),
  email: faker.internet.email(),
  password: faker.internet.password(),
});

export default factory;
