class CreateAlunos < ActiveRecord::Migration
  def change
    create_table :alunos do |t|
      t.string :nome
      t.references :escola, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
