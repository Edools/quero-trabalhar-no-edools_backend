class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :titulo
      t.integer :escola_id
      t.text :descricao
      t.integer :duracao
      t.date :data_criacao
      t.integer :alunos_ativos
      t.decimal :preco, precision: 8, scale: 2

      t.timestamps
    end
  end
end
