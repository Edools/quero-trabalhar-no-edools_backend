import Registration from '../models/Registration';
import School from '../models/School';
import Course from '../models/Course';
import Student from '../models/Student';

class RegistrationController {
  async store(req, res) {
    const { student_id } = req;

    const { school_id, course_id } = req.params;

    const school = await School.findOne({
      where: { id: school_id, active: true },
    });

    if (!school) {
      return res
        .status(400)
        .json({ error: 'School not found or deactivated.' });
    }

    const course = await Course.findOne({
      where: { id: course_id, school_id, active: true },
    });

    if (!course) {
      return res
        .status(400)
        .json({ error: 'Course not found or deactivated. ' });
    }

    const student = await Student.findByPk(student_id);

    if (student.school_id !== Number(school_id)) {
      return res
        .status(401)
        .json({ error: 'Student is not a member of this school.' });
    }

    const registration = await Registration.findOne({
      where: { course_id, student_id },
    });

    if (registration) {
      return res
        .status(400)
        .json({ error: 'Student already registration in this course.' });
    }

    await Registration.create({
      course_id,
      student_id,
    });

    return res.json({
      course: course.title,
      student: student.id,
    });
  }

  async delete(req, res) {
    const { student_id } = req;

    const { school_id, course_id } = req.params;

    const school = await School.findByPk(school_id);

    if (!school) {
      return res.status(400).json({ error: 'School not found.' });
    }

    const course = await Course.findOne({
      where: { id: course_id, school_id },
    });

    if (!course) {
      return res.status(400).json({ error: 'Course not found.' });
    }

    const student = await Student.findByPk(student_id);

    if (!student) {
      return res.status(400).json({ error: 'Student not found.' });
    }

    if (student.school_id !== Number(school_id)) {
      return res
        .status(401)
        .json({ error: 'Student is not a member of this school.' });
    }

    const registration = await Registration.findOne({
      where: { course_id, student_id, active: true },
    });

    if (!registration) {
      return res
        .status(400)
        .json({ error: 'Registration not found or deactivated.' });
    }

    registration.active = false;

    await registration.save();

    return res.json({ message: 'Registration deactivated.' });
  }
}

export default new RegistrationController();
