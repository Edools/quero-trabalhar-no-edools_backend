describe School, type: :model do
  let(:school) { FactoryGirl.create(:school) }

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:owner_email) }

  it { should validate_length_of(:name).is_at_most(60) }

  it { should validate_length_of(:owner_email).is_at_most(255) }

  it 'be valid' do
    expect(school.valid?).to be true
  end

  it 'does not accept invalid subdomain' do
    invalid_subdomains = %w[novalid.domain.com foo.org user-example.
                           foobar+baz fooar..com]
    invalid_subdomains.each do |invalid_subdomain|
      school.subdomain = invalid_subdomain
      expect(school.valid?).to be false
    end
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
