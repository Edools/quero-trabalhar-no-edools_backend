class CreateAlunos < ActiveRecord::Migration
  def change
    create_table :alunos do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
