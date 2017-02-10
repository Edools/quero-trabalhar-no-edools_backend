class CreateEscolas < ActiveRecord::Migration
  def change
    create_table :escolas do |t|
      t.string :nome
      t.string :email_do_dono
      t.string :pitch
      t.string :subdominio

      t.timestamps
    end
  end
end
