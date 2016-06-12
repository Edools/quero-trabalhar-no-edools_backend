class CreateAlunos < ActiveRecord::Migration
  def change
    create_table :alunos do |t|
      t.string :nome
      t.string :email
      t.belongs_to :curso, index: true, foreign_key: true, null: false
      t.belongs_to :escola, index: true, foreign_key: true, null: false
      t.boolean :ativo

      t.timestamps null: false
    end
  end
end
