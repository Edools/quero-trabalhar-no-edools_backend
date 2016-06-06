class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.string :name
      t.text :description
      t.text :content
      t.string :duration
      t.date :date_creation
      t.integer :student_active
      t.decimal :price, precision: 12, scale: 3
      t.references :school, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
