class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.text :content
      t.string :duration
      t.integer :active_students
      t.float :price

      t.belongs_to :school, index: true

      t.timestamps null: false
    end
  end
end
