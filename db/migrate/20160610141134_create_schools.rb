class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name, null: false
      t.string :contact_email, null: false
      t.string :pitch
      t.string :subdomain, null: false

      t.timestamps null: false
    end

    add_index :schools, :name
    add_index :schools, :subdomain, unique:  true
  end
end
