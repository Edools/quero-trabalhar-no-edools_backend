class AddUserToSchool < ActiveRecord::Migration
  def change
    add_reference :schools, :user, index: true, foreign_key: true
  end
end
