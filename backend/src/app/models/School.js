import Sequelize, { Model } from 'sequelize';
import bcrypt from 'bcryptjs';

class School extends Model {
  static init(sequelize) {
    super.init(
      {
        name: Sequelize.STRING,
        email: Sequelize.STRING,
        password: Sequelize.VIRTUAL,
        password_hash: Sequelize.STRING,
        pitch: Sequelize.STRING,
        subdomain: Sequelize.STRING,
        active: Sequelize.BOOLEAN,
      },
      {
        sequelize,
      }
    );

    this.addHook('beforeSave', async school => {
      if (school.password) {
        school.password_hash = await bcrypt.hash(school.password, 8);
      }
    });

    return this;
  }

  static associate(models) {
    this.hasMany(models.Course, { foreignKey: 'school_id', as: 'courses' });
    this.hasMany(models.Student, { foreignKey: 'school_id', as: 'students' });
  }

  checkPassword(password) {
    return bcrypt.compare(password, this.password_hash);
  }

  static checkSubdomain(subdomain) {
    return /^[a-zA-Z0-9-_]+$/.test(subdomain);
  }
}

export default School;
