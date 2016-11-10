describe Enrollment, type: :model do
  let(:enrollment) { FactoryGirl.create(:enrollment) }

  it { should validate_presence_of(:course) }

  it { should validate_presence_of(:student) }

  it 'be valid' do
    expect(enrollment.valid?).to be true
  end
end
