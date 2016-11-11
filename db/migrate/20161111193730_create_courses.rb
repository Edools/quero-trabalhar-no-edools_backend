class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.integer :school_id
      t.string :description
      t.string :content
      t.string :length
      t.float :price

      t.timestamps null: false
    end
  end
end
