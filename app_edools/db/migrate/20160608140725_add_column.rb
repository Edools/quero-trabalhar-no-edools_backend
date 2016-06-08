class AddColumn < ActiveRecord::Migration
  def change
    add_column :students, :status, :boolean, :default => true
  end
end
