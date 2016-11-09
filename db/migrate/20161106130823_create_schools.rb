class CreateSchools < ActiveRecord::Migration[5.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :owner_email
      t.text :pitch
      t.string :subdomain
      
      t.timestamps
    end
    add_index :schools, :subdomain, unique: true
  end
end
