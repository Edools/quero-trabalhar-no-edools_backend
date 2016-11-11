describe Course, type: :model do
  let(:course) { FactoryGirl.create(:course) }

  it { should validate_presence_of(:title) }

  it { should validate_presence_of(:school) }

  it { should validate_presence_of(:description) }

  it { should validate_presence_of(:content) }

  it 'be valid' do
    expect(course.valid?).to be true
  end
end
