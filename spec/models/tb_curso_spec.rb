require 'rails_helper'

describe TbCurso do
  it "é válido quando contém atributos requeridos" do
    curso = TbCurso.new attributes_for(:tb_curso)
    expect(curso).to be_valid
  end

  describe "validations" do
    subject {
      described_class.new attributes_for(:tb_curso)
    }

    it "não é válido..." do
      subject.titulo = nil
      expect(subject).to_not be_valid
      subject.duracao = nil
      expect(subject).to_not be_valid
      subject.qtd_alunos_ativos = nil
      expect(subject).to_not be_valid
      subject.preco = nil
      expect(subject).to_not be_valid
    end
  end

end