import Course from '../models/Course';
import Student from '../models/Student';
import Registration from '../models/Registration';

class SchoolStudentController {
  async update(req, res) {
    const { school_id } = req;
    const { course_id, student_id, active } = req.params;

    const course = await Course.findOne({
      where: {
        id: course_id,
        school_id,
      },
    });

    if (!course) {
      return res.status(400).json({ error: 'Course not found.' });
    }

    const student = await Student.findOne({
      where: {
        id: student_id,
        school_id,
      },
    });

    if (!student) {
      return res.status(400).json({ error: 'Student not found.' });
    }

    const registration = await Registration.findOne({
      where: { course_id, student_id },
    });

    if (!registration) {
      return res.status(400).json({ error: 'Registration not found.' });
    }

    registration.active = Boolean(active);

    await registration.save();

    return res.json({ message: 'Registration status updated with success.' });
  }
}

export default new SchoolStudentController();
