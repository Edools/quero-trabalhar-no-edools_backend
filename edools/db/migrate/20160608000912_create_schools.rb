class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :email
      t.string :pitch
      t.string :subdomain
      t.datetime :date_of_creation

      t.timestamps null: false
    end
  end
end
