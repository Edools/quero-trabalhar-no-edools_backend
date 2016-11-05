require 'rails_helper'

RSpec.describe Course, type: :model do

  subject {
    described_class.new(titulo: "Programação com Rails", escola_id: 1,
    descricao:"Lorem ipsum dolor sit amet, quo eu soluta detracto",
    duracao:20, data_criacao:Time.now, alunos_ativos:0, preco: 200.00)
  }

  describe "Validações" do

    it "Curso válida" do
      expect(subject).to be_valid
    end

    it "quando o título do curso não foi informado" do
      subject.titulo = ""
      expect(subject).to_not be_valid
    end

    it "quando o id da escola não for informado" do
      subject.escola_id = ""
      expect(subject).to_not be_valid
    end

    it "quando a descrição do curso não for informado" do
      subject.descricao = ""
      expect(subject).to_not be_valid
    end

    it "quando a duração não foi informado" do
      subject.duracao = ""
      expect(subject).to_not be_valid
    end

    it "quando a data de criação não foi informado" do
      subject.data_criacao = ""
      expect(subject).to_not be_valid
    end

    it "quando os alunos ativos não forem informados" do
      subject.alunos_ativos = ""
      expect(subject).to_not be_valid
    end

    it "quando o preço não foi informado" do
      subject.preco = ""
      expect(subject).to_not be_valid
    end

  end

end
