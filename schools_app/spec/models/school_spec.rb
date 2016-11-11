describe School, type: :model do
  let(:school) { FactoryGirl.create(:school) }

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:owner_email) }

  it { should validate_length_of(:name).is_at_most(60) }

  it { should validate_length_of(:owner_email).is_at_most(255) }

  it 'be valid' do
    expect(school.valid?).to be true
  end

  it 'does not accept an outside edools subdomain' do
    school.subdomain = 'nonvalid.domain.com'
    expect(school.valid?).to be false
    expect(school.errors.messages[:subdomain].join).to match('não pode estar fora do domínio da Edools')
  end

  it 'does not accept invalid owner emails' do
    invalid_addresses = %w[user@example,com foo.org user@example.
                           foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      school.owner_email = invalid_address
      expect(school.valid?).to be false
    end
  end
end
