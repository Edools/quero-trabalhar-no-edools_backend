class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.text :content
      t.string :duration
      t.integer :active_student
      t.decimal :price
      t.references :school, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
