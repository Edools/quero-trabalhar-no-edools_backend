class AddSchoolIdToStudent < ActiveRecord::Migration
  def change
    add_column :students, :school_id, :integer
    add_index :students, :school_id
  end
end
