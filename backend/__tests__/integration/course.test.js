import request from 'supertest';
import app from '../../src/app';

import factory from '../factories';
import truncate from '../util/truncate';

describe('Course', () => {
  beforeEach(async () => {
    await truncate();
  });

  it('Should be able to register a course', async () => {
    const school = await factory.attrs('School');

    await request(app)
      .post('/schools')
      .send(school);

    const responseSession = await request(app)
      .post('/schools/sessions')
      .send(school);

    const course = await factory.attrs('Course');

    const response = await request(app)
      .post('/courses')
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send(course);

    expect(response.body).toHaveProperty('id');
  });

  it('Should not be able to register a course by invalid parameters', async () => {
    const school = await factory.attrs('School');

    await request(app)
      .post('/schools')
      .send(school);

    const responseSession = await request(app)
      .post('/schools/sessions')
      .send(school);

    const course = await factory.attrs('Course', {
      duration: 'aaa',
    });

    const response = await request(app)
      .post('/courses')
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send(course);

    expect(response.status).toBe(400);
  });

  it('Should not be able to register a course that already exists', async () => {
    const school = await factory.attrs('School');

    await request(app)
      .post('/schools')
      .send(school);

    const responseSession = await request(app)
      .post('/schools/sessions')
      .send(school);

    const course = await factory.attrs('Course');

    await request(app)
      .post('/courses')
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send(course);

    const response = await request(app)
      .post('/courses')
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send(course);

    expect(response.status).toBe(400);
  });

  it('Should be able to update a course', async () => {
    const school = await factory.attrs('School');

    await request(app)
      .post('/schools')
      .send(school);

    const responseSession = await request(app)
      .post('/schools/sessions')
      .send(school);

    const course = await factory.attrs('Course');

    const responseCourse = await request(app)
      .post('/courses')
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send(course);

    const response = await request(app)
      .put(`/courses/${responseCourse.body.id}`)
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send({
        duration: 30,
        price: 270.0,
      });

    expect(response.status).toBe(200);
  });

  it('Should not be able to update a course with invalid parameters', async () => {
    const school = await factory.attrs('School');

    await request(app)
      .post('/schools')
      .send(school);

    const responseSession = await request(app)
      .post('/schools/sessions')
      .send(school);

    const course = await factory.attrs('Course');

    const responseCourse = await request(app)
      .post('/courses')
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send(course);

    course.price = 'aaaa';

    const response = await request(app)
      .put(`/courses/${responseCourse.body.id}`)
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send(course);

    expect(response.status).toBe(400);
  });

  it('Should not be able to update a course with invalid id', async () => {
    const school = await factory.attrs('School');

    await request(app)
      .post('/schools')
      .send(school);

    const responseSession = await request(app)
      .post('/schools/sessions')
      .send(school);

    const course = await factory.attrs('Course');

    await request(app)
      .post('/courses')
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send(course);

    const response = await request(app)
      .put(`/courses/85`)
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send(course);

    expect(response.status).toBe(400);
  });

  it('Should not be able to update a course from a different school', async () => {
    const school = await factory.attrs('School');

    const newSchool = {
      name: 'Escola Teste',
      email: 'teste@teste.com',
      password: '123456',
      pitch: 'Aperiam aut saepe eos ab.',
      subdomain: 'teste',
    };

    await request(app)
      .post('/schools')
      .send(school);

    await request(app)
      .post('/schools')
      .send(newSchool);

    const responseSession = await request(app)
      .post('/schools/sessions')
      .send(school);

    const course = await factory.attrs('Course');

    const responseCourse = await request(app)
      .post('/courses')
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send(course);

    const responseSessionSchool2 = await request(app)
      .post('/schools/sessions')
      .send(newSchool);

    const response = await request(app)
      .put(`/courses/${responseCourse.body.id}`)
      .set('Authorization', `bearer ${responseSessionSchool2.body.token}`)
      .send({
        duration: 30,
        price: 270.0,
      });

    expect(response.status).toBe(401);
  });

  it('Should not be able to update a course with same name of other course', async () => {
    const school = await factory.attrs('School');

    await request(app)
      .post('/schools')
      .send(school);

    const responseSession = await request(app)
      .post('/schools/sessions')
      .send(school);

    const course = await factory.attrs('Course');

    await request(app)
      .post('/courses')
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send(course);

    const newCourse = {
      title: 'Título Curso 2',
      description: 'Descrição do curso',
      content: 'Conteúdo do curso',
      duration: 60,
      price: 740.0,
    };

    const responseNewCourse = await request(app)
      .post('/courses')
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send(newCourse);

    newCourse.title = course.title;

    const response = await request(app)
      .put(`/courses/${responseNewCourse.body.id}`)
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send(newCourse);

    expect(response.status).toBe(400);
  });

  it('Should be able to deactivate a course', async () => {
    const school = await factory.attrs('School');

    await request(app)
      .post('/schools')
      .send(school);

    const responseSession = await request(app)
      .post('/schools/sessions')
      .send(school);

    const course = await factory.attrs('Course');

    const responseCourse = await request(app)
      .post('/courses')
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send(course);

    const response = await request(app)
      .delete(`/courses/${responseCourse.body.id}`)
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send();

    expect(response.status).toBe(200);
  });

  it('Should not be able to deactivate a course twice', async () => {
    const school = await factory.attrs('School');

    await request(app)
      .post('/schools')
      .send(school);

    const responseSession = await request(app)
      .post('/schools/sessions')
      .send(school);

    const course = await factory.attrs('Course');

    const responseCourse = await request(app)
      .post('/courses')
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send(course);

    await request(app)
      .delete(`/courses/${responseCourse.body.id}`)
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send();

    const response = await request(app)
      .delete(`/courses/${responseCourse.body.id}`)
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send();

    expect(response.status).toBe(400);
  });

  it('Should be able to show the courses', async () => {
    const school = await factory.attrs('School');

    await request(app)
      .post('/schools')
      .send(school);

    const responseSession = await request(app)
      .post('/schools/sessions')
      .send(school);

    const courses = await factory.attrsMany('Course', 10);

    await courses.forEach(async course => {
      await request(app)
        .post('/courses')
        .set('Authorization', `bearer ${responseSession.body.token}`)
        .send(course);
    });

    const response = await request(app)
      .get('/courses')
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send();

    expect(response.status).toBe(200);
  });

  it('Should be able to activate/deactive a course', async () => {
    const school = await factory.attrs('School');

    await request(app)
      .post('/schools')
      .send(school);

    const responseSession = await request(app)
      .post('/schools/sessions')
      .send(school);

    const course = await factory.attrs('Course');

    const responseCourse = await request(app)
      .post('/courses')
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send(course);

    const response = await request(app)
      .put(`/schools/${responseCourse.body.id}/false`)
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send();

    expect(response.status).toBe(200);
  });

  it('Should not be able to deactivate a course from different school', async () => {
    const school = await factory.attrs('School');

    await request(app)
      .post('/schools')
      .send(school);

    const responseSession = await request(app)
      .post('/schools/sessions')
      .send(school);

    const newSchool = {
      name: 'Teste',
      email: 'teste@teste.com',
      password: '123456',
      pitch: 'Breve descrição da escola',
      subdomain: 'teste',
    };

    await request(app)
      .post('/schools')
      .send(newSchool);

    const responseSessionNewSchool = await request(app)
      .post('/schools/sessions')
      .send(newSchool);

    const course = await factory.attrs('Course');

    const responseCourse = await request(app)
      .post('/courses')
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send(course);

    const response = await request(app)
      .put(`/schools/${responseCourse.body.id}/false`)
      .set('Authorization', `bearer ${responseSessionNewSchool.body.token}`)
      .send();

    expect(response.status).toBe(400);
  });
});
