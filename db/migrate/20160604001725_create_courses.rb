class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.references :school, index: true, foreign_key: true
      t.string :description
      t.text :content
      t.integer :duration
      t.integer :active_students
      t.float :price

      t.timestamps null: false
    end
  end
end
