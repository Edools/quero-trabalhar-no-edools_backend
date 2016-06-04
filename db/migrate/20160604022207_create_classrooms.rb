class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.references :student, :course
	    t.datetime :entry_at
    end
  end
end
