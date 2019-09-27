import request from 'supertest';
import bcrypt from 'bcryptjs';
import app from '../../src/app';

import factory from '../factories';
import truncate from '../util/truncate';

describe('School', () => {
  beforeEach(async () => {
    await truncate();
  });

  it('should encrypt school password when new school created', async () => {
    const school = await factory.create('School', {
      password: '123456',
    });

    const comparehash = await bcrypt.compare('123456', school.password_hash);

    expect(comparehash).toBe(true);
  });

  it('Should be able to register a school', async () => {
    const school = await factory.attrs('School');

    const response = await request(app)
      .post('/schools')
      .send(school);

    expect(response.body).toHaveProperty('id');
  });

  it('Should not be able to register a school by invalid parameters', async () => {
    const school = await factory.attrs('School', {
      password: '1234',
    });

    const response = await request(app)
      .post('/schools')
      .send(school);

    expect(response.status).toBe(400);
  });

  it('Should not be able to register a school by invalid subdomain', async () => {
    const school = await factory.attrs('School', {
      subdomain: 'teste teste',
    });

    const response = await request(app)
      .post('/schools')
      .send(school);

    expect(response.status).toBe(400);
  });

  it('Should not be able to register a school for an existing subdomain', async () => {
    const school = await factory.attrs('School', {
      subdomain: 'teste-teste',
    });

    await request(app)
      .post('/schools')
      .send(school);

    const newSchool = await factory.attrs('School', {
      subdomain: 'teste-teste',
    });

    const response = await request(app)
      .post('/schools')
      .send(newSchool);

    expect(response.status).toBe(400);
  });

  it('Should not be able to register a school twice', async () => {
    const school = await factory.attrs('School');

    await request(app)
      .post('/schools')
      .send(school);

    school.subdomain = 'novo';

    const response = await request(app)
      .post('/schools')
      .send(school);

    expect(response.status).toBe(400);
  });

  it('Should be able to authenticate the school', async () => {
    const school = await factory.attrs('School');

    await request(app)
      .post('/schools')
      .send(school);

    const response = await request(app)
      .post('/schools/sessions')
      .send(school);

    expect(response.body).toHaveProperty('token');
  });

  it('Should not be able to authenticate the school by invalid parameters', async () => {
    const school = await factory.attrs('School');

    await request(app)
      .post('/schools')
      .send(school);

    const response = await request(app)
      .post('/schools/sessions')
      .send({
        email: school.email,
        password: '1234',
      });

    expect(response.status).toBe(400);
  });

  it('Should not be able to authenticate the school by non-existent school', async () => {
    const school = await factory.attrs('School');

    await request(app)
      .post('/schools')
      .send(school);

    const response = await request(app)
      .post('/schools/sessions')
      .send({
        email: 'nonexistent@email.com',
        password: '000000',
      });

    expect(response.status).toBe(400);
  });

  it('Should not be able to authenticate the school by wrong password', async () => {
    const school = await factory.attrs('School', {
      password: '123456',
    });

    await request(app)
      .post('/schools')
      .send(school);

    const response = await request(app)
      .post('/schools/sessions')
      .send({
        email: school.email,
        password: '654321',
      });

    expect(response.status).toBe(401);
  });

  it('Should be able change datas from school', async () => {
    const school = await factory.attrs('School');

    await request(app)
      .post('/schools')
      .send(school);

    const responseSession = await request(app)
      .post('/schools/sessions')
      .send(school);

    const response = await request(app)
      .put('/schools')
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send({
        oldPassword: school.password,
        password: '123457',
        confirmPassword: '123457',
      });

    expect(response.body).toHaveProperty('id');
  });

  it('Should not be able change datas from school by not be authenticated', async () => {
    const school = await factory.attrs('School');

    await request(app)
      .post('/schools')
      .send(school);

    const response = await request(app)
      .put('/schools')
      .send({
        oldPassword: school.password,
        password: '123457',
        confirmPassword: '123457',
      });

    expect(response.status).toBe(401);
  });

  it('Should not be able change datas from school by invalid parameters', async () => {
    const school = await factory.attrs('School');

    await request(app)
      .post('/schools')
      .send(school);

    const responseSession = await request(app)
      .post('/schools/sessions')
      .send(school);

    const response = await request(app)
      .put('/schools')
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send({
        oldPassword: school.password,
        password: '1234',
        confirmPassword: '1234',
      });

    expect(response.status).toBe(400);
  });

  it('Should not be able change datas from school with wrong password', async () => {
    const school = await factory.attrs('School');

    await request(app)
      .post('/schools')
      .send(school);

    const responseSession = await request(app)
      .post('/schools/sessions')
      .send(school);

    const response = await request(app)
      .put('/schools')
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send({
        oldPassword: '000000',
        password: '123456',
        confirmPassword: '123456',
      });

    expect(response.status).toBe(401);
  });

  it('Should not be able change datas from school with an already used email', async () => {
    const school = await factory.attrs('School');

    await request(app)
      .post('/schools')
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

    const responseSession = await request(app)
      .post('/schools/sessions')
      .send(school);

    const response = await request(app)
      .put('/schools')
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send({
        email: newSchool.email,
      });

    expect(response.status).toBe(400);
  });

  it('Should not be able change datas from school with an already used subdomain', async () => {
    const school = await factory.attrs('School');

    await request(app)
      .post('/schools')
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

    const responseSession = await request(app)
      .post('/schools/sessions')
      .send(school);

    const response = await request(app)
      .put('/schools')
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send({
        subdomain: newSchool.subdomain,
      });

    expect(response.status).toBe(400);
  });

  it('Should not be able change datas from school by an invalid subdomain', async () => {
    const school = await factory.attrs('School');

    await request(app)
      .post('/schools')
      .send(school);

    const responseSession = await request(app)
      .post('/schools/sessions')
      .send(school);

    const response = await request(app)
      .put('/schools')
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send({
        subdomain: 'teste teste',
      });

    expect(response.status).toBe(400);
  });

  it('Should not be able change datas from school by wrong token', async () => {
    const school = await factory.attrs('School', {
      email: 'teste@teste.com',
      password: '123456',
    });

    await request(app)
      .post('/schools')
      .send(school);

    const response = await request(app)
      .put('/schools')
      .set('Authorization', `bearer 000000000000000000000`)
      .send({
        oldPassword: '123456',
        password: '123457',
        confirmPassword: '123457',
      });

    expect(response.status).toBe(401);
  });

  it('Should be able delete a school', async () => {
    const school = await factory.attrs('School');

    await request(app)
      .post('/schools')
      .send(school);

    const responseSession = await request(app)
      .post('/schools/sessions')
      .send(school);

    const response = await request(app)
      .delete('/schools')
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send();

    expect(response.status).toBe(200);
  });

  it('Should be able show a of schools', async () => {
    const schools = await factory.attrsMany('School', 5);
    /*
    await schools.forEach(async school => {
      await request(app)
        .post('/schools')
        .send(school);
    });
    */
    await Promise.all(
      schools.map(school =>
        request(app)
          .post('/schools')
          .send(school)
      )
    );

    const response = await request(app)
      .get('/schools')
      .send();

    expect(response.status).toBe(200);
  });
});
