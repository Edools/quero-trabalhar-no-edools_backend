require 'rails_helper'

RSpec.describe Course, type: :model do
  let(:school) { create(:school) }

  it 'has a valid model' do
    expect(Course.new(attributes_for(:course, school_id: school.id))).to be_valid
  end

  context 'title' do
    describe 'is invalid' do
      it 'if it is null' do
        expect(build(:course, title: nil)).to_not be_valid
      end
    end
  end

  context 'school_id' do
    describe 'is invalid' do
      it 'if it is null' do
        expect(build(:course, school_id: nil)).to_not be_valid
      end
    end
  end

  context 'duration' do
    describe 'is invalid if' do
      it 'is a string' do
        expect(build(:course, duration: 'aaa')).to_not be_valid
      end
      it 'is a float' do
        expect(build(:course, duration: 10.1)).to_not be_valid
      end
    end
  end

  context 'price' do
    describe 'is invalid if' do
      it 'is a string' do
        expect(build(:course, price: 'aaa')).to_not be_valid
      end
    end
  end
end
