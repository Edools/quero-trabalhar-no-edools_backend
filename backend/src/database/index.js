import Sequelize from 'sequelize';

import User from '../app/models/User';
import School from '../app/models/School';
import Course from '../app/models/Course';
import Student from '../app/models/Student';
import Registration from '../app/models/Registration';

import databaseConfig from '../config/database';

const models = [User, School, Course, Student, Registration];

class Database {
  constructor() {
    this.init();
  }

  init() {
    this.connection = new Sequelize(databaseConfig);

    models.map(model => model.init(this.connection));
    models.map(
      model => model.associate && model.associate(this.connection.models)
    );
  }
}

export default new Database();
