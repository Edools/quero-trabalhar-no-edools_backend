require 'rails_helper'

RSpec.describe School, type: :model do

  subject {
    described_class.new(nome: "Escola Edools", email_dono: "email@edools.com",
    pitch:"Lorem ipsum dolor sit amet, quo eu soluta detracto",
    sub_dominio:"escola-edools", data_criacao:Time.now)
  }

  describe "Validações" do

    it "Escola válida" do
      expect(subject).to be_valid
    end

    it "quando o nome da escola não foi informado" do
      subject.nome = ""
      expect(subject).to_not be_valid
    end

    it "quando o nome da escola for muito pequeno" do
      subject.nome = "Esc"
      expect(subject).to_not be_valid
    end

    it "quando o nome da escola for muito grande" do
      subject.nome = "n" * 51
      expect(subject).to_not be_valid
    end

    it "quando o E-mail não foi informado" do
      subject.email_dono = ""
      expect(subject).to_not be_valid
    end

    it "quando o pitch não foi informado" do
      subject.pitch = ""
      expect(subject).to_not be_valid
    end

    it "quando o sub_dominio não foi informado" do
      subject.sub_dominio = ""
      expect(subject).to_not be_valid
    end

    it "quando a data de criação não foi informado" do
      subject.data_criacao = ""
      expect(subject).to_not be_valid
    end

    it "quando o subdomimio é válido" do
      subject.sub_dominio = "academia-bizstart"
      expect(subject).to be_valid
    end

    it "quando o subdomimio não é válido" do
      subject.sub_dominio = "academia_bizstart"
      expect(subject).to_not be_valid
    end

    it "quando o E-mail do dono é válido" do
      subject.email_dono = "emaildodono@email.com"
      expect(subject).to be_valid
    end

    it "quando o E-mail do dono não é válido" do
      subject.email_dono = "emaildodono%email.com"
      expect(subject).to_not be_valid
    end

    it "quando o E-mail do dono é válido" do
      subject.email_dono = "emaildodono@email.com"
      expect(subject).to be_valid
    end

  end

end
