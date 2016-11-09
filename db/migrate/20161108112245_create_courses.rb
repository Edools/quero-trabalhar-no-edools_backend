class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.belongs_to :school, index: true, foreign_key: true
      t.text :description
      t.text :content
      t.integer :duration
      t.integer :active_students
      t.decimal :price, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
