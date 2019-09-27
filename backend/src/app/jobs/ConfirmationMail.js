import Mail from '../../lib/Mail';

class ConfirmationMail {
  get key() {
    return 'ConfirmationMail';
  }

  async handle({ data }) {
    const { school_name, school_email, student_name, student_email } = data;

    await Mail.sendMail({
      from: `${school_name} <${school_email}>`,
      to: `${student_name} <${student_email}>`,
      subject: 'Cadastro de usuário',
      template: 'confirmation',
      context: {
        student: student_name,
        email: student_email,
        school: school_name,
      },
    });
  }
}

export default new ConfirmationMail();
