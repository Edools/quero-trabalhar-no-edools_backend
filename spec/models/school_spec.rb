require 'rails_helper'

RSpec.describe School, type: :model do
  describe 'attributes' do
    context '#name' do
      it { expect(create(:school).name).not_to be_nil }
      it { expect(create(:school).name).to be_a String }
    end
    context '#owner_email' do
      it { expect(create(:school).owner_email).not_to be_nil }
      it { expect(create(:school).owner_email).to be_a String }
    end
    context '#pitch' do
      it { expect(create(:school).pitch).not_to be_nil }
      it { expect(create(:school).pitch).to be_a String }
    end
    context '#subdomain' do
      it { expect(create(:school).subdomain).not_to be_nil }
      it { expect(create(:school).subdomain).to be_a String }
    end
    context '#created_at' do
      it { expect(create(:school).created_at).not_to be_nil }
    end
  end
end
