class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :pitch
      t.string :owner_email
      t.string :subdomain
      t.date :creation_date
      t.timestamps
    end
  end
end
