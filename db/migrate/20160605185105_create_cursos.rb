class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.string :titulo
      t.references :escola, index: true, foreign_key: true
      t.text :descricao
      t.text :conteudo
      t.string :duracao
      t.date :data_criacao
      t.references :alunos_ativos, index: true, foreign_key: true
      t.float :preco

      t.timestamps null: false
    end
  end
end
