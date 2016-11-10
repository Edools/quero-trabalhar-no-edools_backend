describe Student, type: :model do
  let(:student) { FactoryGirl.create(:student) }

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:email) }

  it { should validate_length_of(:name).is_at_most(60) }

  it 'be valid' do
    expect(student.valid?).to be true
  end
end
