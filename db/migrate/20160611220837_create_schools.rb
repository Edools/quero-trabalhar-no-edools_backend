class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :owner_email
      t.text :pitch
      t.string :subdomain

      t.timestamps null: false
    end
  end
end
