class CreateCursos < ActiveRecord::Migration[5.0]
  def change
    create_table :cursos do |t|
      t.string :titulo
      t.text :descricao
      t.text :conteudo
      t.integer :duracao
      t.date :data
      t.float :preco
      t.references :escola, foreign_key: true
      t.references :aluno, foreign_key: true

      t.timestamps
    end
  end
end
