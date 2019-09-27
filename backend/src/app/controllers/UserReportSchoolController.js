import { fn, col } from 'sequelize';
import School from '../models/School';
import Student from '../models/Student';

class UserReportSchoolController {
  async index(req, res) {
    const students = await Student.findAll({
      where: { active: true },
      attributes: [[fn('count', col('Student.id')), 'active_students']],
      group: ['school.id'],
      include: [
        {
          model: School,
          as: 'school',
          attributes: ['id', 'name'],
        },
      ],
    });

    return res.json(students);
  }
}

export default new UserReportSchoolController();
