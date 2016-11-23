class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :students, :adress, :address
  end
end
