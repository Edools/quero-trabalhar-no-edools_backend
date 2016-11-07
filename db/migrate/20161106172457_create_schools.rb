class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :contact_email
      t.string :subdomain
      t.date :foundation
      t.text :pitch
      t.integer :user_id

      t.timestamps
    end
  end
end
