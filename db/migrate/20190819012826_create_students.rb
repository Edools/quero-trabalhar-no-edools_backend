class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.references :school, foreign_key: true

      t.timestamps
    end
    add_index :schools, :name, unique: true
  end
end
