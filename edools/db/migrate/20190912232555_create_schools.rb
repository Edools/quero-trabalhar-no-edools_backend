# frozen_string_literal: true

class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string :name, null: false
      t.bigint :owner_id, index: true, null: false
      t.string :pitch, null: false
      t.string :subdomain, null: false
      t.timestamps
    end
  end
end
