require 'rails_helper'

RSpec.describe CheckInvitesService do

  describe "call" do
    let(:current_user_admin) { create(:admin) }
    let(:school) { create(:school, user: current_user_admin) }
    let(:course) { create(:course, user: current_user_admin, school: school) }

    context 'there is invite' do
      let!(:invite) { create(:user_course_registration, 
                            user: current_user_admin, 
                            school: school,
                            course: course) }
      let(:call) { described_class.new(current_user_admin.id, course.id).call }
                            
        it 'test return' do
          expect(call).to be_falsey
        end
    end
    context 'there is not invite' do
      let(:call) { described_class.new(current_user_admin.id, course.id).call }
                            
      it 'test return' do
        expect(call).to be_truthy
      end
    end
  end
end