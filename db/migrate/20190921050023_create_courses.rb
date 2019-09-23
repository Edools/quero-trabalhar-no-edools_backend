class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :school_id
      t.string :description
      t.integer :duration
      t.integer :duration_unit
      t.date :creation_date
      t.string :price
      t.timestamps
    end
  end
end
