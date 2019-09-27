import jwt from 'jsonwebtoken';
import { promisify } from 'util';

import Student from '../models/Student';

import authConfig from '../../config/auth';

export default async (req, res, next) => {
  const authHeader = req.headers.authorization;

  if (!authHeader) {
    return res.status(401).json({ error: 'Token not provided' });
  }

  const [, token] = authHeader.split(' ');

  try {
    const decoded = await promisify(jwt.verify)(token, authConfig.secret);

    req.student_id = decoded.student_id;

    const student = await Student.findOne({
      where: { id: req.student_id, active: true },
    });

    if (!student) {
      return res
        .status(400)
        .json({ error: 'Student not found or deactivated.' });
    }

    return next();
  } catch (err) {
    return res.status(401).json({ error: 'Token invalid' });
  }
};
