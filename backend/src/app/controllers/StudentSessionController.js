import jwt from 'jsonwebtoken';
import * as Yup from 'yup';

import Student from '../models/Student';
import School from '../models/School';
import authConfig from '../../config/auth';

class StudentSessionController {
  async store(req, res) {
    const schema = Yup.object().shape({
      email: Yup.string()
        .email()
        .required(),
      password: Yup.string()
        .required()
        .min(6),
    });

    if (!(await schema.isValid(req.body))) {
      return res.status(400).json({ error: 'Validation fails.' });
    }

    const { school_id } = req.params;

    const school = await School.findOne({
      where: { id: school_id, active: true },
    });

    if (!school) {
      return res
        .status(400)
        .json({ error: 'School not found or deactivated.' });
    }

    const { email, password } = req.body;

    const student = await Student.findOne({
      where: { school_id, email, active: true },
    });

    if (!student) {
      return res
        .status(401)
        .json({ error: 'Student not found or deactivated.' });
    }

    if (!(await student.checkPassword(password))) {
      return res.status(401).json({ error: 'Password does not match.' });
    }

    const { id, name } = student;

    return res.json({
      student: {
        id,
        name,
        email,
      },
      token: jwt.sign({ student_id: id }, authConfig.secret, {
        expiresIn: authConfig.expiresIn,
      }),
    });
  }
}

export default new StudentSessionController();
