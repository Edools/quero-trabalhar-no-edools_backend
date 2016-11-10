describe School, type: :model do
  let(:school) { FactoryGirl.create(:school) }

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:owner_email) }

  it { should validate_length_of(:name).is_at_most(60) }

  it 'be valid' do
    expect(school.valid?).to be true
  end

  it 'does not accept an outside edools subdomain' do
    school.subdomain = 'nonvalid.domain.com'
    expect(school.valid?).to be false
    expect(school.errors.messages[:subdomain].join).to match('não pode estar fora do domínio da Edools')
  end
end
