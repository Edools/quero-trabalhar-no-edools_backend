class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :description
      t.string :content
      t.integer :duration
      t.integer :active_students
      t.float :price
      t.belongs_to :school

      t.timestamps
    end
  end
end
