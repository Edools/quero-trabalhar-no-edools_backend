class CreateEscolas < ActiveRecord::Migration
  def change
    create_table :escolas do |t|
      t.string :nome
      t.string :email
      t.string :pitch
      t.string :subdominio
      t.date :data_criacao

      t.timestamps null: false
    end
  end
end
