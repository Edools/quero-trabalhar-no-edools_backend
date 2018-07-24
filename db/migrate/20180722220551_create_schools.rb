class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :owner_email
      t.string :pitch
      t.string :subdomain

      t.timestamps
    end
  end
end
