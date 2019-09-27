import request from 'supertest';
import bcrypt from 'bcryptjs';
import app from '../../src/app';

import factory from '../factories';
import truncate from '../util/truncate';

describe('User', () => {
  beforeEach(async () => {
    await truncate();
  });

  it('should encrypt user password when new user created', async () => {
    const user = await factory.create('User', {
      password: '123456',
    });

    const comparehash = await bcrypt.compare('123456', user.password_hash);

    expect(comparehash).toBe(true);
  });

  it('Should be able to register an user', async () => {
    const user = await factory.attrs('User');

    const response = await request(app)
      .post('/users')
      .send(user);

    expect(response.body).toHaveProperty('id');
  });

  it('Should not be able to register an user by invalid parameters', async () => {
    const user = await factory.attrs('User', {
      password: '1234',
    });

    const response = await request(app)
      .post('/users')
      .send(user);

    expect(response.status).toBe(400);
  });

  it('Should not be able to register more users', async () => {
    const user = await factory.attrs('User');

    await request(app)
      .post('/users')
      .send(user);

    const response = await request(app)
      .post('/users')
      .send(user);

    expect(response.status).toBe(400);
  });

  it('Should be able to authenticate the user', async () => {
    const user = await factory.attrs('User');

    await request(app)
      .post('/users')
      .send(user);

    const response = await request(app)
      .post('/users/sessions')
      .send({
        email: user.email,
        password: user.password,
      });

    expect(response.body).toHaveProperty('token');
  });

  it('Should not be able to authenticate the user by invalid parameters', async () => {
    const user = await factory.attrs('User', {
      password: '123456',
    });

    await request(app)
      .post('/users')
      .send(user);

    const response = await request(app)
      .post('/users/sessions')
      .send({
        email: user.email,
        password: '1234',
      });

    expect(response.status).toBe(400);
  });

  it('Should not be able to authenticate the user by non-existent user', async () => {
    const user = await factory.attrs('User', {
      password: '123456',
    });

    await request(app)
      .post('/users')
      .send(user);

    const response = await request(app)
      .post('/users/sessions')
      .send({
        email: 'nonexistent@email.com',
        password: '123456',
      });

    expect(response.status).toBe(401);
  });

  it('Should not be able to authenticate the user by wrong password', async () => {
    const user = await factory.attrs('User', {
      password: '123456',
    });

    await request(app)
      .post('/users')
      .send(user);

    const response = await request(app)
      .post('/users/sessions')
      .send({
        email: user.email,
        password: '654321',
      });

    expect(response.status).toBe(401);
  });

  it('Should be able change datas from user', async () => {
    const user = await factory.attrs('User', {
      email: 'teste@teste.com',
      password: '123456',
    });

    await request(app)
      .post('/users')
      .send(user);

    const responseSession = await request(app)
      .post('/users/sessions')
      .send({
        email: user.email,
        password: user.password,
      });

    const response = await request(app)
      .put('/users')
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send({
        oldPassword: '123456',
        password: '123457',
        confirmPassword: '123457',
      });

    expect(response.body).toHaveProperty('id');
  });

  it('Should not be able change datas from user by not be authenticated', async () => {
    const user = await factory.attrs('User');

    await request(app)
      .post('/users')
      .send(user);

    const response = await request(app)
      .put('/users')
      .send({
        oldPassword: user.password,
        password: '123457',
        confirmPassword: '123457',
      });

    expect(response.status).toBe(401);
  });

  it('Should not be able change datas from user by invalid parameters', async () => {
    const user = await factory.attrs('User');

    await request(app)
      .post('/users')
      .send(user);

    const responseSession = await request(app)
      .post('/users/sessions')
      .send(user);

    const response = await request(app)
      .put('/users')
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send({
        oldPassword: user.password,
        password: '1234',
        confirmPassword: '1234',
      });

    expect(response.status).toBe(400);
  });

  it('Should not be able change datas from user with wrong password', async () => {
    const user = await factory.attrs('User');

    await request(app)
      .post('/users')
      .send(user);

    const responseSession = await request(app)
      .post('/users/sessions')
      .send(user);

    const response = await request(app)
      .put('/users')
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send({
        oldPassword: '000000',
        password: '123456',
        confirmPassword: '123456',
      });

    expect(response.status).toBe(401);
  });

  it('Should not be able change datas from user by wrong token', async () => {
    const user = await factory.attrs('User', {
      email: 'teste@teste.com',
      password: '123456',
    });

    await request(app)
      .post('/users')
      .send(user);

    const response = await request(app)
      .put('/users')
      .set('Authorization', `bearer 000000000000000000000`)
      .send({
        oldPassword: '123456',
        password: '123457',
        confirmPassword: '123457',
      });

    expect(response.status).toBe(401);
  });

  it('Should be able to search of schools and courses', async () => {
    const user = await factory.attrs('User');

    await request(app)
      .post('/users')
      .send(user);

    const responseSession = await request(app)
      .post('/users/sessions')
      .send(user);

    const response = await request(app)
      .get('/users/search')
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send();

    expect(response.status).toBe(200);
  });

  /*

  -- Only works with Postgres --

  it('Should be able to search of schools and courses with parameter', async () => {
    const user = await factory.attrs('User');

    await request(app)
      .post('/users')
      .send(user);

    const responseSession = await request(app)
      .post('/users/sessions')
      .send(user);

    const response = await request(app)
      .get('/users/search')
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .query({ q: 'teste' })
      .send();

    expect(response.status).toBe(200);
  });
  */

  it('Should be able to report the active students of schools', async () => {
    const user = await factory.attrs('User');

    await request(app)
      .post('/users')
      .send(user);

    const responseSession = await request(app)
      .post('/users/sessions')
      .send(user);

    const response = await request(app)
      .get('/users/schools/report')
      .set('Authorization', `bearer ${responseSession.body.token}`)
      .send();

    expect(response.status).toBe(200);
  });
});
