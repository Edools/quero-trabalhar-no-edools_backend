class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.integer :duration
      t.float :price
      t.integer :school_id

      t.timestamps
    end
  end
end
