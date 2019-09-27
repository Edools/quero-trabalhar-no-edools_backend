import * as Yup from 'yup';
import School from '../models/School';
import Student from '../models/Student';

import ConfirmationMail from '../jobs/ConfirmationMail';
import Queue from '../../lib/Queue';

class StudentController {
  async store(req, res) {
    const schema = Yup.object().shape({
      name: Yup.string().required(),
      email: Yup.string()
        .email()
        .required(),
      password: Yup.string()
        .required()
        .min(6),
      active: Yup.boolean(),
    });

    if (!(await schema.isValid(req.body))) {
      return res.status(400).json({ error: 'Validation fails.' });
    }

    const { email } = req.body;

    const { school_id } = req.params;

    const school = await School.findOne({
      where: { id: school_id, active: true },
    });

    if (!school) {
      return res
        .status(400)
        .json({ error: 'School not found or deactivated.' });
    }

    const studentExists = await Student.findOne({
      where: { school_id, email },
    });

    if (studentExists) {
      return res.status(400).json({ error: 'Student already exists.' });
    }

    const { id, name } = await Student.create({
      school_id,
      ...req.body,
    });

    if (process.env.NODE_ENV !== 'test') {
      await Queue.add(ConfirmationMail.key, {
        school_name: school.name,
        school_email: school.email,
        student_name: name,
        student_email: email,
      });
    }

    return res.json({
      id,
      name,
    });
  }

  async update(req, res) {
    const schema = Yup.object().shape({
      name: Yup.string(),
      email: Yup.string().email(),
      oldPassword: Yup.string().min(6),
      password: Yup.string()
        .min(6)
        .when('oldPassword', (oldPassword, field) =>
          oldPassword ? field.required() : field
        ),
      confirmPassword: Yup.string().when('password', (password, field) =>
        password ? field.required().oneOf([Yup.ref('password')]) : field
      ),
      active: Yup.boolean(),
    });

    if (!(await schema.isValid(req.body))) {
      return res.status(400).json({ error: 'Validation fails.' });
    }

    const student = await Student.findByPk(req.student_id);

    const { school_id } = req.params;

    if (student.school_id !== Number(school_id)) {
      return res
        .status(400)
        .json({ error: 'Student is not a member of this school.' });
    }

    const { email, oldPassword } = req.body;

    if (email && email !== student.email) {
      const emailExists = await Student.findOne({
        where: { school_id: student.school_id, email },
      });

      if (emailExists) {
        return res.status(400).json({ error: 'Email already in use.' });
      }
    }

    if (oldPassword && !(await student.checkPassword(oldPassword))) {
      return res.status(401).json({ error: 'Password does not match.' });
    }

    await student.update(req.body);

    const { name } = student;

    return res.json({
      id: req.student_id,
      name,
      email,
    });
  }

  async delete(req, res) {
    const student = await Student.findByPk(req.student_id);

    const { school_id } = req.params;

    if (student.school_id !== Number(school_id)) {
      return res
        .status(400)
        .json({ error: 'Student is not a member of this school.' });
    }

    student.active = false;

    await student.save();

    return res.json({ message: 'Student deactivated.' });
  }
}

export default new StudentController();
