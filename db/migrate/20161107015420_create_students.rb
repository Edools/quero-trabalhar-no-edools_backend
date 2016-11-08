class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name, :null => false
      t.string :email, :null => false
      t.string :phone
      t.string :birthdate, :null => false
      t.references :address, foreign_key: true

      t.timestamps
    end
  end
end
