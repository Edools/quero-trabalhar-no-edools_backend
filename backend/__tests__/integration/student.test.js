import request from 'supertest';
import bcrypt from 'bcryptjs';
import app from '../../src/app';

import factory from '../factories';
import truncate from '../util/truncate';

describe('Student', () => {
  beforeEach(async () => {
    await truncate();
  });

  it('Should be able to register a student', async () => {
    const school = await factory.attrs('School');

    const responseSchool = await request(app)
      .post('/schools')
      .send(school);

    const student = await factory.attrs('Student');

    const response = await request(app)
      .post(`/students/${responseSchool.body.id}`)
      .send(student);

    expect(response.body).toHaveProperty('id');
  });

  it('Should not be able to register a student by invalid parameters', async () => {
    const school = await factory.attrs('School');

    const responseSchool = await request(app)
      .post('/schools')
      .send(school);

    const student = await factory.attrs('Student', {
      password: '1234',
    });

    const response = await request(app)
      .post(`/students/${responseSchool.body.id}`)
      .send(student);

    expect(response.status).toBe(400);
  });

  it('Should not be able to register a student with a invalid school', async () => {
    const student = await factory.attrs('Student');

    const response = await request(app)
      .post('/students/2')
      .send(student);

    expect(response.status).toBe(400);
  });

  it('Should not be able to register a student twice in same school', async () => {
    const school = await factory.attrs('School');

    const responseSchool = await request(app)
      .post('/schools')
      .send(school);

    const student = await factory.attrs('Student');

    await request(app)
      .post(`/students/${responseSchool.body.id}`)
      .send(student);

    const response = await request(app)
      .post(`/students/${responseSchool.body.id}`)
      .send(student);

    expect(response.status).toBe(400);
  });

  it('Should be able to authenticate a student', async () => {
    const school = await factory.attrs('School');

    const responseSchool = await request(app)
      .post('/schools')
      .send(school);

    const student = await factory.attrs('Student');

    await request(app)
      .post(`/students/${responseSchool.body.id}`)
      .send(student);

    const response = await request(app)
      .post(`/students/${responseSchool.body.id}/sessions`)
      .send(student);

    expect(response.body).toHaveProperty('token');
  });

  it('Should not be able to authenticate a student by invalid parameters', async () => {
    const school = await factory.attrs('School');

    const responseSchool = await request(app)
      .post('/schools')
      .send(school);

    const student = await factory.attrs('Student');

    await request(app)
      .post(`/students/${responseSchool.body.id}`)
      .send(student);

    const response = await request(app)
      .post(`/students/${responseSchool.body.id}/sessions`)
      .send({
        email: student.email,
        password: '1234',
      });

    expect(response.status).toBe(400);
  });

  it('Should not be able to authenticate a student by wrong password', async () => {
    const school = await factory.attrs('School');

    const responseSchool = await request(app)
      .post('/schools')
      .send(school);

    const student = await factory.attrs('Student', {
      password: '123456',
    });

    await request(app)
      .post(`/students/${responseSchool.body.id}`)
      .send(student);

    const response = await request(app)
      .post(`/students/${responseSchool.body.id}/sessions`)
      .send({
        email: student.email,
        password: '654321',
      });

    expect(response.status).toBe(401);
  });

  it('Should be able to update a student', async () => {
    const school = await factory.attrs('School');

    const responseSchool = await request(app)
      .post('/schools')
      .send(school);

    const student = await factory.attrs('Student');

    await request(app)
      .post(`/students/${responseSchool.body.id}`)
      .send(student);

    const responseSession = await request(app)
      .post(`/students/${responseSchool.body.id}/sessions`)
      .send(student);

    const response = await request(app)
      .put(`/students/${responseSchool.body.id}`)
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send({
        oldPassword: student.password,
        password: '123457',
        confirmPassword: '123457',
      });

    expect(response.body).toHaveProperty('id');
  });

  it('Should not be able to update a student by invalid parameters', async () => {
    const school = await factory.attrs('School');

    const responseSchool = await request(app)
      .post('/schools')
      .send(school);

    const student = await factory.attrs('Student');

    await request(app)
      .post(`/students/${responseSchool.body.id}`)
      .send(student);

    const responseSession = await request(app)
      .post(`/students/${responseSchool.body.id}/sessions`)
      .send(student);

    const response = await request(app)
      .put(`/students/${responseSchool.body.id}`)
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send({
        oldPassword: student.password,
        password: '1234',
        confirmPassword: '1234',
      });

    expect(response.status).toBe(400);
  });

  it('Should not be able to update a student from a different school', async () => {
    const school = await factory.attrs('School');

    const responseSchool = await request(app)
      .post('/schools')
      .send(school);

    const student = await factory.attrs('Student');

    await request(app)
      .post(`/students/${responseSchool.body.id}`)
      .send(student);

    const responseSession = await request(app)
      .post(`/students/${responseSchool.body.id}/sessions`)
      .send(student);

    const response = await request(app)
      .put(`/students/0`)
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send({
        oldPassword: student.password,
        password: '123456',
        confirmPassword: '123456',
      });

    expect(response.status).toBe(400);
  });

  it('Should not be able to update a student with an existing email', async () => {
    const school = await factory.attrs('School');

    const responseSchool = await request(app)
      .post('/schools')
      .send(school);

    const student = await factory.attrs('Student');

    await request(app)
      .post(`/students/${responseSchool.body.id}`)
      .send(student);

    const newStudent = {
      name: 'Aluno Teste',
      email: 'teste@teste.com',
      password: '123456',
    };

    await request(app)
      .post(`/students/${responseSchool.body.id}`)
      .send(newStudent);

    const responseSession = await request(app)
      .post(`/students/${responseSchool.body.id}/sessions`)
      .send(student);

    const response = await request(app)
      .put(`/students/${responseSchool.body.id}`)
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send({
        email: newStudent.email,
      });

    expect(response.status).toBe(400);
  });

  it('Should not be able to update a student with an wrong password', async () => {
    const school = await factory.attrs('School');

    const responseSchool = await request(app)
      .post('/schools')
      .send(school);

    const student = await factory.attrs('Student');

    await request(app)
      .post(`/students/${responseSchool.body.id}`)
      .send(student);

    const responseSession = await request(app)
      .post(`/students/${responseSchool.body.id}/sessions`)
      .send(student);

    const response = await request(app)
      .put(`/students/${responseSchool.body.id}`)
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send({
        oldPassword: '000000',
        password: '123456',
        confirmPassword: '123456',
      });

    expect(response.status).toBe(401);
  });

  it('Should be able to delete a student', async () => {
    const school = await factory.attrs('School');

    const responseSchool = await request(app)
      .post('/schools')
      .send(school);

    const student = await factory.attrs('Student');

    await request(app)
      .post(`/students/${responseSchool.body.id}`)
      .send(student);

    const responseSession = await request(app)
      .post(`/students/${responseSchool.body.id}/sessions`)
      .send(student);

    const response = await request(app)
      .delete(`/students/${responseSchool.body.id}`)
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send();

    expect(response.status).toBe(200);
  });

  it('Should not be able to delete a student from a different school', async () => {
    const school = await factory.attrs('School');

    const responseSchool = await request(app)
      .post('/schools')
      .send(school);

    const student = await factory.attrs('Student');

    await request(app)
      .post(`/students/${responseSchool.body.id}`)
      .send(student);

    const responseSession = await request(app)
      .post(`/students/${responseSchool.body.id}/sessions`)
      .send(student);

    const response = await request(app)
      .delete(`/students/0`)
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send();

    expect(response.status).toBe(400);
  });

  it('Should be able to register a student in a course', async () => {
    const school = await factory.attrs('School');

    const responseSchool = await request(app)
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

    const student = await factory.attrs('Student');

    await request(app)
      .post(`/students/${responseSchool.body.id}`)
      .send(student);

    const responseSessionStudent = await request(app)
      .post(`/students/${responseSchool.body.id}/sessions`)
      .send(student);

    const response = await request(app)
      .post(`/registration/${responseSchool.body.id}/${responseCourse.body.id}`)
      .set('Authorization', `bearer ${responseSessionStudent.body.token}`)
      .send();

    expect(response.status).toBe(200);
  });

  it('Should not be able to register a student in a course that not exists', async () => {
    const school = await factory.attrs('School');

    const responseSchool = await request(app)
      .post('/schools')
      .send(school);

    const student = await factory.attrs('Student');

    await request(app)
      .post(`/students/${responseSchool.body.id}`)
      .send(student);

    const responseSessionStudent = await request(app)
      .post(`/students/${responseSchool.body.id}/sessions`)
      .send(student);

    const response = await request(app)
      .post(`/registration/${responseSchool.body.id}/1`)
      .set('Authorization', `bearer ${responseSessionStudent.body.token}`)
      .send();

    expect(response.status).toBe(400);
  });

  it('Should not be able to register a student in a course fom a different school', async () => {
    const school = await factory.attrs('School');

    const responseSchool = await request(app)
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

    const newSchool = {
      name: 'Teste',
      email: 'teste@teste.com',
      password: '123456',
      pitch: 'Breve descrição da escola',
      subdomain: 'teste',
    };

    const responseNewSchool = await request(app)
      .post('/schools')
      .send(newSchool);

    const student = await factory.attrs('Student');

    await request(app)
      .post(`/students/${responseNewSchool.body.id}`)
      .send(student);

    const responseSessionStudent = await request(app)
      .post(`/students/${responseNewSchool.body.id}/sessions`)
      .send(student);

    const response = await request(app)
      .post(`/registration/${responseSchool.body.id}/${responseCourse.body.id}`)
      .set('Authorization', `bearer ${responseSessionStudent.body.token}`)
      .send();

    expect(response.status).toBe(401);
  });

  it('Should not be able to register a student in a course twice', async () => {
    const school = await factory.attrs('School');

    const responseSchool = await request(app)
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

    const student = await factory.attrs('Student');

    await request(app)
      .post(`/students/${responseSchool.body.id}`)
      .send(student);

    const responseSessionStudent = await request(app)
      .post(`/students/${responseSchool.body.id}/sessions`)
      .send(student);

    await request(app)
      .post(`/registration/${responseSchool.body.id}/${responseCourse.body.id}`)
      .set('Authorization', `bearer ${responseSessionStudent.body.token}`)
      .send();

    const response = await request(app)
      .post(`/registration/${responseSchool.body.id}/${responseCourse.body.id}`)
      .set('Authorization', `bearer ${responseSessionStudent.body.token}`)
      .send();

    expect(response.status).toBe(400);
  });

  it('Should be able to deactivate a student from a course', async () => {
    const school = await factory.attrs('School');

    const responseSchool = await request(app)
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

    const student = await factory.attrs('Student');

    await request(app)
      .post(`/students/${responseSchool.body.id}`)
      .send(student);

    const responseSessionStudent = await request(app)
      .post(`/students/${responseSchool.body.id}/sessions`)
      .send(student);

    await request(app)
      .post(`/registration/${responseSchool.body.id}/${responseCourse.body.id}`)
      .set('Authorization', `bearer ${responseSessionStudent.body.token}`)
      .send();

    const response = await request(app)
      .delete(
        `/registration/${responseSchool.body.id}/${responseCourse.body.id}`
      )
      .set('Authorization', `bearer ${responseSessionStudent.body.token}`)
      .send();

    expect(response.status).toBe(200);
  });

  it('Should not be able to deactivate a student from a course twice', async () => {
    const school = await factory.attrs('School');

    const responseSchool = await request(app)
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

    const student = await factory.attrs('Student');

    await request(app)
      .post(`/students/${responseSchool.body.id}`)
      .send(student);

    const responseSessionStudent = await request(app)
      .post(`/students/${responseSchool.body.id}/sessions`)
      .send(student);

    await request(app)
      .post(`/registration/${responseSchool.body.id}/${responseCourse.body.id}`)
      .set('Authorization', `bearer ${responseSessionStudent.body.token}`)
      .send();

    await request(app)
      .delete(
        `/registration/${responseSchool.body.id}/${responseCourse.body.id}`
      )
      .set('Authorization', `bearer ${responseSessionStudent.body.token}`)
      .send();

    const response = await request(app)
      .delete(
        `/registration/${responseSchool.body.id}/${responseCourse.body.id}`
      )
      .set('Authorization', `bearer ${responseSessionStudent.body.token}`)
      .send();

    expect(response.status).toBe(400);
  });

  it('Should not be able to deactivate a student from a different school', async () => {
    const school = await factory.attrs('School');

    const responseSchool = await request(app)
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

    const responseNewSchool = await request(app)
      .post('/schools')
      .send(newSchool);

    const course = await factory.attrs('Course');

    const responseCourse = await request(app)
      .post('/courses')
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send(course);

    const student = await factory.attrs('Student');

    await request(app)
      .post(`/students/${responseSchool.body.id}`)
      .send(student);

    const responseSessionStudent = await request(app)
      .post(`/students/${responseSchool.body.id}/sessions`)
      .send(student);

    await request(app)
      .post(`/registration/${responseSchool.body.id}/${responseCourse.body.id}`)
      .set('Authorization', `bearer ${responseSessionStudent.body.token}`)
      .send();

    const response = await request(app)
      .delete(
        `/registration/${responseNewSchool.body.id}/${responseCourse.body.id}`
      )
      .set('Authorization', `bearer ${responseSessionStudent.body.token}`)
      .send();

    expect(response.status).toBe(400);
  });

  it('Should not be able to deactivate a student from a school not exists', async () => {
    const school = await factory.attrs('School');

    const responseSchool = await request(app)
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

    const student = await factory.attrs('Student');

    await request(app)
      .post(`/students/${responseSchool.body.id}`)
      .send(student);

    const responseSessionStudent = await request(app)
      .post(`/students/${responseSchool.body.id}/sessions`)
      .send(student);

    await request(app)
      .post(`/registration/${responseSchool.body.id}/${responseCourse.body.id}`)
      .set('Authorization', `bearer ${responseSessionStudent.body.token}`)
      .send();

    const response = await request(app)
      .delete(`/registration/5/${responseCourse.body.id}`)
      .set('Authorization', `bearer ${responseSessionStudent.body.token}`)
      .send();

    expect(response.status).toBe(400);
  });

  it('Should be able to activate/deactivate a student', async () => {
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

    const student = await factory.attrs('Student');

    await request(app)
      .post(`/students/${responseSession.body.school.id}`)
      .send(student);

    const responseSessionStudent = await request(app)
      .post(`/students/${responseSession.body.school.id}/sessions`)
      .send(student);

    await request(app)
      .post(
        `/registration/${responseSession.body.school.id}/${responseCourse.body.id}`
      )
      .set('Authorization', `bearer ${responseSessionStudent.body.token}`)
      .send();

    const response = await request(app)
      .put(
        `/schools/${responseCourse.body.id}/${responseSessionStudent.body.student.id}/false`
      )
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send();

    expect(response.status).toBe(200);
  });

  it('Should not be able to activate/deactivate a student from a different course', async () => {
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

    const student = await factory.attrs('Student');

    await request(app)
      .post(`/students/${responseSession.body.school.id}`)
      .send(student);

    const responseSessionStudent = await request(app)
      .post(`/students/${responseSession.body.school.id}/sessions`)
      .send(student);

    await request(app)
      .post(
        `/registration/${responseSession.body.school.id}/${responseCourse.body.id}`
      )
      .set('Authorization', `bearer ${responseSessionStudent.body.token}`)
      .send();

    const response = await request(app)
      .put(
        `/schools/${responseNewCourse.body.id}/${responseSessionStudent.body.student.id}/false`
      )
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send();

    expect(response.status).toBe(400);
  });

  it('Should not be able to activate/deactivate a student from a non-existing course', async () => {
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

    const student = await factory.attrs('Student');

    await request(app)
      .post(`/students/${responseSession.body.school.id}`)
      .send(student);

    const responseSessionStudent = await request(app)
      .post(`/students/${responseSession.body.school.id}/sessions`)
      .send(student);

    await request(app)
      .post(
        `/registration/${responseSession.body.school.id}/${responseCourse.body.id}`
      )
      .set('Authorization', `bearer ${responseSessionStudent.body.token}`)
      .send();

    const response = await request(app)
      .put(`/schools/5/${responseSessionStudent.body.student.id}/false`)
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send();

    expect(response.status).toBe(400);
  });

  it('Should not be able to activate/deactivate a student that non-existing', async () => {
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

    const student = await factory.attrs('Student');

    await request(app)
      .post(`/students/${responseSession.body.school.id}`)
      .send(student);

    const responseSessionStudent = await request(app)
      .post(`/students/${responseSession.body.school.id}/sessions`)
      .send(student);

    await request(app)
      .post(
        `/registration/${responseSession.body.school.id}/${responseCourse.body.id}`
      )
      .set('Authorization', `bearer ${responseSessionStudent.body.token}`)
      .send();

    const response = await request(app)
      .put(`/schools/${responseCourse.body.id}/5/false`)
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send();

    expect(response.status).toBe(400);
  });
});
