require 'rails_helper'

RSpec.describe CoursesFacade do
  
  before do
    @current_user_admin = create(:admin)
    @school = create(:school, user: @current_user_admin)
    @course = create(:course, user: @current_user_admin, school: @school)
    
    1..10.times do
      @user_course = create(:user_course_registration, 
                            user_id: @current_user_admin.id,
                            school_id: @school.id,
                            course_id: @course.id)
    end
  end

  describe "testing count invite student" do
    subject (:count_invite) { described_class.new(@course.id).count_students }
    it 'return all courses' do
      puts count_invite
      expect(count_invite).to eq(10)
    end
  end

end