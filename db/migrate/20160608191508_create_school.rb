class CreateSchool < ActiveRecord::Migration
  def change
    create_table :school do |t|
      t.string :name,          null: false
      t.string :owner_email,   null: false
      t.string :pitch
      t.string :subdomain,     null: false

      t.timestamps null: false
    end
  end
end
