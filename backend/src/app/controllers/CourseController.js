import * as Yup from 'yup';
import Course from '../models/Course';

class CourseController {
  async index(req, res) {
    const { school_id } = req;

    const courses = await Course.findAll({
      where: { school_id },
      attributes: ['id', 'title', 'description', 'duration', 'price', 'active'],
      order: ['title'],
    });

    return res.json(courses);
  }

  async store(req, res) {
    const schema = Yup.object().shape({
      title: Yup.string().required(),
      description: Yup.string().required(),
      content: Yup.string().required(),
      duration: Yup.number()
        .positive()
        .required()
        .integer(),
      price: Yup.number()
        .positive()
        .required()
        .round(),
      active: Yup.boolean(),
    });

    if (!(await schema.isValid(req.body))) {
      return res.status(400).json({ error: 'Validation fails.' });
    }

    const { title } = req.body;

    const { school_id } = req;

    const courseExists = await Course.findOne({
      where: { school_id, title },
    });

    if (courseExists) {
      return res.status(400).json({ error: 'This course already exists.' });
    }

    const { id, duration, price } = await Course.create({
      school_id,
      ...req.body,
    });

    return res.json({
      id,
      title,
      duration,
      price,
    });
  }

  async update(req, res) {
    const schema = Yup.object().shape({
      title: Yup.string(),
      description: Yup.string(),
      content: Yup.string(),
      duration: Yup.number()
        .positive()
        .integer(),
      price: Yup.number()
        .positive()
        .round(),
      active: Yup.boolean(),
    });

    if (!(await schema.isValid(req.body))) {
      return res.status(400).json({ error: 'Validation fails.' });
    }

    const { title } = req.body;

    const { school_id } = req;

    const course = await Course.findByPk(req.params.id);

    if (!course) {
      return res.status(400).json({ error: 'Course not found.' });
    }

    if (course.school_id !== Number(school_id)) {
      return res
        .status(401)
        .json({ error: 'You don`t have permission to update this course.' });
    }

    if (title && title !== course.title) {
      const courseExists = await Course.findOne({
        where: { school_id, title },
      });

      if (courseExists) {
        return res.status(400).json({ error: 'This course already exists.' });
      }
    }

    const { id, duration, price } = await course.update(req.body);

    return res.json({
      id,
      title,
      duration,
      price,
    });
  }

  async delete(req, res) {
    const { school_id } = req;

    const course = await Course.findOne({
      where: { school_id, id: req.params.id, active: true },
    });

    if (!course) {
      return res
        .status(400)
        .json({ error: 'Course not found or deactivated.' });
    }

    course.active = false;

    await course.save();

    return res.json({ message: 'Course deactivated.' });
  }
}

export default new CourseController();
