class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.integer :school_id, index: true
      t.text :description
      t.text :content
      t.string :duration
      t.date :creation_date
      t.integer :active_students
      t.float :price

      t.timestamps null: false
    end
  end
end
