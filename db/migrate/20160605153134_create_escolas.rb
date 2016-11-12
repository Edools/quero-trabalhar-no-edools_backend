class CreateEscolas < ActiveRecord::Migration
  def change
    create_table :escolas do |t|
      t.string :nome
      t.string :email_dono
      t.text :pitch
      t.string :sub_dominio
      t.date :data_criacao

      t.timestamps null: false
    end
  end
end
