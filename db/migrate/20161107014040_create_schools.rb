class CreateSchools < ActiveRecord::Migration[5.0]
  def change
    create_table :schools do |t|
      t.string :name, :null => false
      t.string :owner_email, :null => false
      t.string :pitch
      t.string :subdomain

      t.timestamps
    end
  end
end
