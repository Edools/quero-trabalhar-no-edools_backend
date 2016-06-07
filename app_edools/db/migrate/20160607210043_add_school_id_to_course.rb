class AddSchoolIdToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :school_id, :integer
    add_index :courses, :school_id
  end
end
