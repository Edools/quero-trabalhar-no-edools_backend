class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.text :content
      t.date :start_date
      t.date :end_date
      t.float :price
      t.references :school, foreign_key: true
      t.timestamps
    end
  end
end
