class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.string :titulo
      t.string :descricao
      t.string :conteudo
      t.string :duracao
      t.integer :alunos_ativos
      t.decimal :preco
      t.references :escolas

      t.timestamps null: false
    end
  end
end
