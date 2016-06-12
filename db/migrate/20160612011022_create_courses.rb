class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.belongs_to :school
      t.text :description
      t.string :content
      t.string :duration
      t.decimal :price

      t.timestamps null: false
    end
  end
end
