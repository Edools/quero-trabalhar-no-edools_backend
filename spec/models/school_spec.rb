require "rails_helper"

RSpec.describe School, :type => :model do
  subject(:school) { create(:school) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:pitch) }
  it { is_expected.to validate_presence_of(:owner_email) }
  it { is_expected.to validate_presence_of(:subdomain) }
  it { is_expected.to validate_uniqueness_of(:subdomain).ignoring_case_sensitivity }

  it 'is valid with valid attributes' do
    expect(school).to be_valid
  end
  
  it 'is not valid with a invalid owner email' do
    expect(build(:school, owner_email: 'email.com')).not_to be_valid
  end

  it 'is not valid with a non youtube videos' do
    expect(build(:school, pitch: 'https://vimeo.com/101950333')).not_to be_valid
  end

  it 'is not valid with a ilegal youtube video link' do
    expect(build(:school, pitch: 'youtube.com/watch/')).not_to be_valid
  end

  it 'is not valid with a ilegal subdomain' do
    expect(build(:school, subdomain: '--2xManSchool')).not_to be_valid
  end

  describe '#sanatize_subdomain' do
    it 'triggers on save school' do
      school = build(:school)
      expect(school).to receive(:sanatize_subdomain)
      school.save
    end

    it 'returns a downcase subdomain string' do
      school = build(:school, subdomain: 'XMANREVOLUTION')
      expect(school.sanatize_subdomain).to eql('xmanrevolution')
    end
  end
end