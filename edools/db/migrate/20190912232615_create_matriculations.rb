# frozen_string_literal: true

class CreateMatriculations < ActiveRecord::Migration[6.0]
  def change
    create_table :matriculations do |t|
      t.references :course, index: true, null: false
      t.references :user, index: true, null: false
      t.timestamps
    end
  end
end
