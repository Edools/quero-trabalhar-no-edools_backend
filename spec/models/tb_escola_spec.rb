require 'rails_helper'

describe TbEscola do
  it "é válido quando contém o primeiro nome, email do dono e subdominio" do
    escola = TbEscola.new(nome: 'Teste',
                          email_dono: 'email@email.com',
                          subdominio: 'subdomin')
    expect(escola).to be_valid
  end

  describe "validations" do
    subject {
      described_class.new attributes_for(:tb_escola)
    }

    it "não é válido..." do
      subject.nome = nil
      expect(subject).to_not be_valid
      subject.email_dono = nil
      expect(subject).to_not be_valid
      subject.subdominio = nil
      expect(subject).to_not be_valid
    end
  end

  it "é inválido caso já exista um e-mail igual" do
    TbEscola.create(nome: 'Teste',
                    email_dono: 'email@email.com',
                    subdominio: 'subdomin')
    escola = TbEscola.new(nome: 'Teste',
                          email_dono: 'email@email.com',
                          subdominio: 'subdomin')
    escola.valid?
    expect(escola.errors[:email_dono]).not_to include('já está em uso')
  end

  it "é inválido caso já exista um subdomínio igual" do
    TbEscola.create(nome: 'Teste',
                    email_dono: 'email@email.com',
                    subdominio: 'subdomin')
    escola = TbEscola.new(nome: 'Teste',
                          email_dono: 'email12@email.com',
                          subdominio: 'subdomin')
    escola.valid?
    expect(escola.errors[:subdominio]).not_to include('já está em uso')
  end
end