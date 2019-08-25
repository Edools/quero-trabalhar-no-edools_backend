class CriaTabelaEscolas < ActiveRecord::Migration[5.2]
  def change
    create_table 'edools.tb_escolas' do |t|
      t.string :nome
      t.string :email_dono
      t.text :pitch
      t.string :subdominio

      t.timestamps
    end
    add_index 'edools.tb_escolas', :email_dono, unique: true
    add_index 'edools.tb_escolas', :subdominio, unique: true

    add_attachment 'edools.tb_escolas', :logo
  end
end
