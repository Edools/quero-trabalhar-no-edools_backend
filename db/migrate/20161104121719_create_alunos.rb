class CreateAlunos < ActiveRecord::Migration[5.0]
  def change
    create_table :alunos do |t|
      t.string :nome
      t.string :matricula
      t.integer :status
      t.references :curso, foreign_key: true
      t.references :escola, foreign_key: true

      t.timestamps
    end
  end
end
