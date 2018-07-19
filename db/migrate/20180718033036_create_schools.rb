class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :owner_email
      t.text :pitch
      t.string :subdomain
      t.date :date_creation
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
