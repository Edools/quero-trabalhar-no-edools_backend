class CreateAlunosCursos < ActiveRecord::Migration
  def change
    create_table :alunos_cursos do |t|
	t.belongs_to :curso, index: true
      	t.belongs_to :aluno, index: true
    end
  end
end
