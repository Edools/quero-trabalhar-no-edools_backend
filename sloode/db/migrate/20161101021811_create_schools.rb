class CreateSchools < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
    enable_extension 'unaccent'
    create_table :schools do |t|
      t.string :name, default: '', index: true
      t.string :email, default: ''
      t.string :pitch, null: false
      t.string :subdomain, null: false, unique: true
      t.date :creation_date

      t.timestamps null: false
    end
  end
end
