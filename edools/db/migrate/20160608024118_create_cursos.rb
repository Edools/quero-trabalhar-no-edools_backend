class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.string :titulo
      t.belongs_to :escola, index: true, foreign_key: true, null: false
      t.string :descricao
      t.string :conteudo
      t.integer :duracao
      t.datetime :data_criacao
      t.integer :alunos_ativos
      t.float :preco

      t.timestamps null: false
    end
  end
end
