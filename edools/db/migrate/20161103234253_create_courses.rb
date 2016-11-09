class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.belongs_to :school, index: true
      t.string :description
      t.string :content
      t.decimal :duration
      t.decimal :price

      t.timestamps
    end
  end
end
