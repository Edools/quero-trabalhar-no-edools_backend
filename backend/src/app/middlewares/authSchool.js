import jwt from 'jsonwebtoken';
import { promisify } from 'util';

import School from '../models/School';

import authConfig from '../../config/auth';

export default async (req, res, next) => {
  const authHeader = req.headers.authorization;

  if (!authHeader) {
    return res.status(401).json({ error: 'Token not provided' });
  }

  const [, token] = authHeader.split(' ');

  try {
    const decoded = await promisify(jwt.verify)(token, authConfig.secret);

    req.school_id = decoded.school_id;

    const school = await School.findOne({
      where: { id: req.school_id, active: true },
    });

    if (!school) {
      return res
        .status(400)
        .json({ error: 'School not found or deactivated.' });
    }

    return next();
  } catch (err) {
    return res.status(401).json({ error: 'Token invalid' });
  }
};
