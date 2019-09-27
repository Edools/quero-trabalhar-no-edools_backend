import Course from '../models/Course';

class SchoolCourseController {
  async update(req, res) {
    const { school_id } = req;
    const { course_id, active } = req.params;

    const course = await Course.findOne({
      where: {
        id: course_id,
        school_id,
      },
    });

    if (!course) {
      return res.status(400).json({ error: 'Course not found.' });
    }

    course.active = Boolean(active);

    await course.save();

    return res.json({ message: 'Course status updated with success.' });
  }
}

export default new SchoolCourseController();
