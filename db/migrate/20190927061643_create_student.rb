class CreateStudent < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.boolean :active
      t.integer :course_id
      t.timestamps
    end
  end
end
