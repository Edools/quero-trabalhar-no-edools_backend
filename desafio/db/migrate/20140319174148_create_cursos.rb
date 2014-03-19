class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.string :titulo
      t.string :descricao
      t.string :conteudo
      t.string :duracao
      t.integer :alunos_ativos
      t.float :preco
      t.references :escola, index: true

      t.timestamps
    end
  end
end
