require 'rails_helper'

RSpec.describe Student, :type => :model do
    before do
      @student = build(:student)
    end


    describe "validations" do       
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:register_number) }
    end
end
