class CreateCourses < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
    enable_extension 'unaccent'
    create_table :courses do |t|
      t.string :title, index: true
      t.references :school, index: true, foreign_key: true
      t.text :description
      t.text :content
      t.integer :duration
      t.date :creation_date
      t.integer :active_students
      t.decimal :price, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
