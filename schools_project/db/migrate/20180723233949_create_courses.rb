# frozen_string_literal: true

class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.references :user, foreign_key: true
      t.references :school, foreign_key: true
      t.string :title
      t.text :description
      t.text :content
      t.decimal :duration
      t.monetize :price

      t.timestamps
    end
  end
end
