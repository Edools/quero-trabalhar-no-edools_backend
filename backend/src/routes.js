import { Router } from 'express';

import UserController from './app/controllers/UserController';
import UserSessionController from './app/controllers/UserSessionController';
import UserSearchController from './app/controllers/UserSearchController';
import UserReportSchoolControllers from './app/controllers/UserReportSchoolController';

import SchoolController from './app/controllers/SchoolController';
import SchoolSessionController from './app/controllers/SchoolSessionController';
import SchoolCourseController from './app/controllers/SchoolCourseController';
import SchoolStudentController from './app/controllers/SchoolStudentController';

import CourseController from './app/controllers/CourseController';

import StudentController from './app/controllers/StudentController';
import StudentSessionController from './app/controllers/StudentSessionController';

import RegistrationController from './app/controllers/RegistrationController';

import authUserMiddleware from './app/middlewares/authUser';
import authSchoolMiddleware from './app/middlewares/authSchool';
import authStudentMiddleware from './app/middlewares/authStudent';

const routes = new Router();

routes.post('/users', UserController.store);
routes.post('/users/sessions', UserSessionController.store);

routes.put('/users', authUserMiddleware, UserController.update);
routes.get('/users/search', authUserMiddleware, UserSearchController.index);

routes.get('/schools', SchoolController.index);
routes.post('/schools', SchoolController.store);
routes.post('/schools/sessions', SchoolSessionController.store);

routes.get(
  '/users/schools/report',
  authUserMiddleware,
  UserReportSchoolControllers.index
);

routes.put('/schools', authSchoolMiddleware, SchoolController.update);
routes.delete('/schools', authSchoolMiddleware, SchoolController.delete);

routes.put(
  '/schools/:course_id/:active',
  authSchoolMiddleware,
  SchoolCourseController.update
);
routes.put(
  '/schools/:course_id/:student_id/:active',
  authSchoolMiddleware,
  SchoolStudentController.update
);

routes.get('/courses', authSchoolMiddleware, CourseController.index);
routes.post('/courses', authSchoolMiddleware, CourseController.store);
routes.put('/courses/:id', authSchoolMiddleware, CourseController.update);
routes.delete('/courses/:id', authSchoolMiddleware, CourseController.delete);

routes.post('/students/:school_id', StudentController.store);
routes.post('/students/:school_id/sessions', StudentSessionController.store);

routes.put(
  '/students/:school_id',
  authStudentMiddleware,
  StudentController.update
);
routes.delete(
  '/students/:school_id',
  authStudentMiddleware,
  StudentController.delete
);

routes.post(
  '/registration/:school_id/:course_id',
  authStudentMiddleware,
  RegistrationController.store
);
routes.delete(
  '/registration/:school_id/:course_id',
  authStudentMiddleware,
  RegistrationController.delete
);

export default routes;
