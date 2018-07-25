require 'rails_helper'

RSpec.describe InviteToSchoolsService do
  
  before do
    @current_user_admin = create(:admin)
    @school = create(:school, user: @current_user_admin)
    @course = create(:course, user: @current_user_admin, school: @school)

    10.times do |t|
      @user_course = create(:user_course_registration, 
                            user_id: @current_user_admin.id, 
                            course_id: @course.id,
                            school_id: @school.id)
    end
  end

  describe "testing call" do
    context 'user is admin' do
      subject (:call) { described_class.new.call }

      it 'return headers' do
        expect(call.include?('Escola')).to be_truthy
        expect(call.include?('Alunos')).to be_truthy
      end

      it 'return content' do
        expect(call.to_s).to include(@school.name)
        expect(call.to_s).to include('10')

      end
    end
  end
end