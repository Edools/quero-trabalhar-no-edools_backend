require 'rails_helper'

RSpec.describe School, type: :model do
  context 'validations' do
    context 'presence_of' do
      it { expect(subject).to validate_presence_of(:name) }
      it { expect(subject).to validate_presence_of(:owner_email) }
      it { expect(subject).to validate_presence_of(:pitch) }
    end

    context 'uniqueness_of' do
      it { expect(subject).to validate_uniqueness_of(:name) }
      it { expect(subject).to validate_uniqueness_of(:owner_email) }
      it { expect(subject).to validate_uniqueness_of(:subdomain) }
    end

    context 'format_of' do
      it { should allow_value("owner@school.com").for(:owner_email) }
      it { should_not allow_value("foo").for(:owner_email) }
    end
  end

  context 'relationships' do
    it { expect(subject).to have_many(:courses) }
  end

  context 'generates a subdomain' do
    it 'does generate a subdomain automatically' do
      school = create(:school, name: 'Awesome School')
      expect(school.subdomain).to eq('awesome-school')
    end
  end
end
