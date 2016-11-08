class RenameColumnStatusStudents < ActiveRecord::Migration
  def change
    rename_column :students, :status, :status_student
  end
end
