# frozen_string_literal: true

class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :pitch
      t.string :subdomain

      t.timestamps
    end
  end
end
