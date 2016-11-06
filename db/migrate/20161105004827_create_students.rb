class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.belongs_to :school, foreign_key: true
      t.boolean :ative

      t.timestamps
    end
  end
end
