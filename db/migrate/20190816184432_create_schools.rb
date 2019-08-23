class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :email
      t.string :pitch
      t.string :subdomain

      t.timestamps
    end
    add_index :schools, :email, unique: true
    add_index :schools, :subdomain, unique: true
  end
end
