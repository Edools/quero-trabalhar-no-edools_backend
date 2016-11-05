class AddStatusToStudents < ActiveRecord::Migration
  def change
    add_column :students, :status, :boolean
    change_column_default(:students, :status, true)
  end
end
