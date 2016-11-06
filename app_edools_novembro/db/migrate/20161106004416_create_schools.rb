class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :email
      t.text :pitch
      t.string :subdominio

      t.timestamps null: false
    end
  end
end
