class CreateJoinTableAlunoCurso < ActiveRecord::Migration[5.0]
  def change
    create_join_table :Alunos, :Cursos do |t|
      # t.index [:aluno_id, :curso_id]
      # t.index [:curso_id, :aluno_id]
    end
  end
end
