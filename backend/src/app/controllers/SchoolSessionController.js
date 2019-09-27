import jwt from 'jsonwebtoken';
import * as Yup from 'yup';

import School from '../models/School';
import authConfig from '../../config/auth';

class SchoolSessionController {
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

    const { email, password } = req.body;

    const school = await School.findOne({
      where: { email, active: true },
    });

    if (!school) {
      return res
        .status(400)
        .json({ error: 'School not found or deactivated.' });
    }

    if (!(await school.checkPassword(password))) {
      return res.status(401).json({ error: 'Password does not match.' });
    }

    const { id, name } = school;

    return res.json({
      school: {
        id,
        name,
        email,
      },
      token: jwt.sign({ school_id: id }, authConfig.secret, {
        expiresIn: authConfig.expiresIn,
      }),
    });
  }
}

export default new SchoolSessionController();
