import { Op, literal } from 'sequelize';
import School from '../models/School';
import Course from '../models/Course';

class UserSearchController {
  async index(req, res) {
    const { q } = req.query;

    const schools = q
      ? await School.findAll({
          where: {
            [Op.or]: [
              { name: { [Op.iLike]: `%${q}%` } },
              {
                id: {
                  [Op.in]: literal(
                    `(select school_id from courses where title ilike '%${q}%')`
                  ),
                },
              },
            ],
          },
          attributes: ['id', 'name', 'email', 'pitch', 'subdomain', 'active'],
          include: [
            {
              model: Course,
              as: 'courses',
              where: { title: { [Op.iLike]: `%${q}%` } },
              required: false,
              attributes: [
                'id',
                'title',
                'description',
                'content',
                'duration',
                'price',
                'active',
              ],
              order: ['title'],
            },
          ],
          order: ['name'],
        })
      : await School.findAll({
          attributes: ['id', 'name', 'email', 'pitch', 'subdomain', 'active'],
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
                'active',
              ],
              order: ['title'],
            },
          ],
          order: ['name'],
        });
    return res.json(schools);
  }
}

export default new UserSearchController();
