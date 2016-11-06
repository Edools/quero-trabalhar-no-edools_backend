class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.text :content
      t.string :duration
      t.decimal :amount
      t.belongs_to :school, foreign_key: true

      t.timestamps
    end
  end
end
