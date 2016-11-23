class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.string :description
      t.string :content
      t.float :duration
      t.datetime :date_of_creation
      t.integer :active_students
      t.float :price
      t.integer :school_id

      t.timestamps null: false
    end
    add_index :courses, :school_id
  end
end
