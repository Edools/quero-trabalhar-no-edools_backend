class AddUserToStudent < ActiveRecord::Migration
  def change
    add_reference :students, :user, index: true, foreign_key: true
  end
end
