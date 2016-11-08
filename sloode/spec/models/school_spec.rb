require 'rails_helper'

RSpec.describe School, type: :model do
  it 'has a valid model' do
    expect(School.new(attributes_for(:school))).to be_valid
  end

  context 'is invalid' do
    it 'without name' do
      expect(build(:school, name: nil)).to_not be_valid
    end
    it 'without email' do
      expect(build(:school, email: nil)).to_not be_valid
    end
    it "if subdomain already exists" do
      create(:school, subdomain: 'aaa')
      expect(build(:school, subdomain: 'aaa')).to_not be_valid
    end
  end
end
