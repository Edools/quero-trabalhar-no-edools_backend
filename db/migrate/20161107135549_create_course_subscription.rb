class CreateCourseSubscription < ActiveRecord::Migration
  def change
    create_table :course_subscriptions do |t|
    	t.integer :course_id
    	t.integer :user_id

    	t.timestamps
    end
  end
end
