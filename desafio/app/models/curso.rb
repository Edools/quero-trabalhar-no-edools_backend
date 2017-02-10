class Curso < ActiveRecord::Base
  belongs_to :escola

  validates_presence_of :escola, :titulo, :descricao, :conteudo, :duracao, :alunos_ativos, :preco

  def self.busca(busca)
    cursos = []
    if busca[:titulo]
    	cursos = Curso.find_all_by_titulo busca[:titulo]
    end
    cursos
  end

end
