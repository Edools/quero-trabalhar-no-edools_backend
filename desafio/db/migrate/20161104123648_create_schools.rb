class CreateSchools < ActiveRecord::Migration[5.0]
  def change
    create_table :schools do |t|
      t.string :nome
      t.string :email_dono
      t.text :pitch
      t.string :sub_dominio
      t.date :data_criacao

      t.timestamps
    end
  end
end
