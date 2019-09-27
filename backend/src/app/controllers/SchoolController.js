import * as Yup from 'yup';
import { Op } from 'sequelize';
import School from '../models/School';
import Course from '../models/Course';

class SchoolController {
  async index(req, res) {
    const { page = 1 } = req.query;

    const schools = await School.findAll({
      where: { active: true },
      attributes: ['id', 'name', 'pitch', 'subdomain'],
      order: ['name'],
      limit: 20,
      offset: (page - 1) * 20,
      include: [
        {
          model: Course,
          as: 'courses',
          attributes: [
            'id',
            'title',
            'description',
            'content',
            'duration',
            'price',
          ],
          where: { active: true },
          order: ['title'],
        },
      ],
    });

    return res.json(schools);
  }

  async store(req, res) {
    const schema = Yup.object().shape({
      name: Yup.string().required(),
      email: Yup.string()
        .email()
        .required(),
      password: Yup.string()
        .required()
        .min(6),
      pitch: Yup.string().required(),
      subdomain: Yup.string().required(),
      active: Yup.boolean(),
    });

    if (!(await schema.isValid(req.body))) {
      return res.status(400).json({ error: 'Validation fails.' });
    }

    const { subdomain } = req.body;

    if (!School.checkSubdomain(subdomain)) {
      return res.status(400).json({ error: 'Subdomain is invalid.' });
    }

    const subdomainExists = await School.findOne({
      where: { subdomain },
    });

    if (subdomainExists) {
      return res.status(400).json({ error: 'Subdomain already in use.' });
    }

    const schoolExists = await School.findOne({
      where: {
        [Op.or]: [{ email: req.body.email }, { name: req.body.name }],
      },
    });

    if (schoolExists) {
      return res.status(400).json({ error: 'School already exists.' });
    }

    const { id, name, email, pitch } = await School.create(req.body);

    return res.json({
      id,
      name,
      email,
      pitch,
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
      pitch: Yup.string(),
      subdomain: Yup.string(),
      active: Yup.boolean(),
    });

    if (!(await schema.isValid(req.body))) {
      return res.status(400).json({ error: 'Validation fails.' });
    }

    const { email, oldPassword, subdomain } = req.body;

    const school = await School.findByPk(req.school_id);

    if (email && email !== school.email) {
      const emailExists = await School.findOne({ where: { email } });

      if (emailExists) {
        return res.status(400).json({ error: 'Email already in use.' });
      }
    }

    if (subdomain && subdomain !== school.subdomain) {
      if (!School.checkSubdomain(subdomain)) {
        return res.status(400).json({ error: 'Subdomain is invalid.' });
      }

      const subdomainExists = await School.findOne({
        where: { subdomain },
      });

      if (subdomainExists) {
        return res.status(400).json({ error: 'Subdomain already in use.' });
      }
    }

    if (oldPassword && !(await school.checkPassword(oldPassword))) {
      return res.status(401).json({ error: 'Password does not match.' });
    }

    const { id, name, pitch } = await school.update(req.body);

    return res.json({
      id,
      name,
      email,
      pitch,
    });
  }

  async delete(req, res) {
    const school = await School.findByPk(req.school_id);

    school.active = false;

    await school.save();

    return res.json({ message: 'School deactivated.' });
  }
}

export default new SchoolController();
