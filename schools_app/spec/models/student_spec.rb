describe Student, type: :model do
  let(:student) { FactoryGirl.create(:student) }

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:email) }

  it { should validate_length_of(:name).is_at_most(60) }

  it { should validate_length_of(:email).is_at_most(255) }

  it 'be valid' do
    expect(student.valid?).to be true
  end

  it 'does not accept invalid emails' do
    invalid_addresses = %w[user@example,com foo.org user@example.
                           foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      student.email = invalid_address
      expect(student.valid?).to be false
    end
  end
end
