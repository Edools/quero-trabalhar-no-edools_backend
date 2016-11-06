class CreateEscolas < ActiveRecord::Migration[5.0]
  def change
    create_table :escolas do |t|
      t.string :nome
      t.string :email
      t.string :pitch
      t.string :subdominio
      t.date :data

      t.timestamps
    end
  end
end
