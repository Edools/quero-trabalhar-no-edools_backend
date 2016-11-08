class DropColumnStatusStudent < ActiveRecord::Migration
  def change
    remove_column :students, :status_student
    add_column :students, :status_student, :integer
  end
end
